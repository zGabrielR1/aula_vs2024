<?php

require_once 'BancoDeDados.php';

class Emprestimo {
    // Atributos
    public string $id;
    public string $data_retirada;
    public string $data_devolucao;
    public string $id_colaborador;
    public string $id_equipamento;
    public string $quantidade;
    public string $status;
    private BancoDeDados $banco;

    // Construtor
    public function __construct()
    {
        $this->banco = new BancoDeDados;
    }

    // Método Inserir
    public function inserir()
    {
        try {
            $this->banco->iniciarTransacao();

            // Verificar se o colaborador existe
            $sql = 'SELECT id_colaborador FROM colaboradores WHERE id_colaborador = ?';
            $parametros = [$this->id_colaborador];
            $colaborador_existente = $this->banco->consultar($sql, $parametros);
            
            if (!$colaborador_existente) {
                throw new Exception('Colaborador não encontrado!');
            }

            // Verificar se o equipamento existe e tem estoque suficiente
            $sql = 'SELECT quantidade_estoque FROM equipamentos WHERE id_equipamento = ?';
            $parametros = [$this->id_equipamento];
            $equipamento = $this->banco->consultar($sql, $parametros);
            
            if (!$equipamento) {
                throw new Exception('Equipamento não encontrado!');
            }

            if ($equipamento['quantidade_estoque'] < $this->quantidade) {
                throw new Exception('Estoque insuficiente para este empréstimo!');
            }

            // Inserir o empréstimo
            $sql = 'INSERT INTO emprestimos (
                data_retirada,
                data_devolucao,
                id_colaborador,
                id_equipamento,
                quantidade,
                status
            ) VALUES (?,?,?,?,?,?)';
            $parametros = [
                $this->data_retirada,
                $this->data_devolucao,
                $this->id_colaborador,
                $this->id_equipamento,
                $this->quantidade,
                'emprestado'
            ];
            $this->banco->executarComando($sql, $parametros);

            // Atualizar o estoque do equipamento
            $sql = 'UPDATE equipamentos SET quantidade_estoque = quantidade_estoque - ? WHERE id_equipamento = ?';
            $parametros = [$this->quantidade, $this->id_equipamento];
            $this->banco->executarComando($sql, $parametros);

            $this->banco->salvarTransacao();
            
            return $this->banco->obterUltimoIdInserido();
        } catch (PDOException $erro) {
            $this->banco->voltarTransacao();
            throw new PDOException;
        }
    }

    // Método Devolver
    public function devolver()
    {
        try {
            $this->banco->iniciarTransacao();

            // Verificar se o empréstimo existe e está em aberto
            $sql = 'SELECT * FROM emprestimos WHERE id_emprestimo = ? AND status = "emprestado"';
            $parametros = [$this->id];
            $emprestimo = $this->banco->consultar($sql, $parametros);
            
            if (!$emprestimo) {
                throw new Exception('Empréstimo não encontrado ou já devolvido!');
            }

            // Atualizar o status do empréstimo
            $sql = 'UPDATE emprestimos SET 
                data_devolucao = NOW(),
                status = "devolvido"
                WHERE id_emprestimo = ?';
            $parametros = [$this->id];
            $this->banco->executarComando($sql, $parametros);

            // Devolver a quantidade ao estoque
            $sql = 'UPDATE equipamentos SET quantidade_estoque = quantidade_estoque + ? WHERE id_equipamento = ?';
            $parametros = [$emprestimo['quantidade'], $emprestimo['id_equipamento']];
            $this->banco->executarComando($sql, $parametros);

            $this->banco->salvarTransacao();
        } catch (PDOException $erro) {
            $this->banco->voltarTransacao();
            throw new PDOException;
        }
    }

    // Método Cancelar
    public function cancelar()
    {
        try {
            $sql = 'UPDATE emprestimos SET status = "cancelado" WHERE id_emprestimo = ? AND status = "emprestado"';
            $parametros = [$this->id];
            $this->banco->executarComando($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar
    public function selecionar()
    {
        try {
            $sql = 'SELECT emprestimos.*, colaboradores.nome as nome_colaborador, equipamentos.descricao as descricao_equipamento
                    FROM emprestimos
                    INNER JOIN colaboradores USING(id_colaborador)
                    INNER JOIN equipamentos USING(id_equipamento)
                    ORDER BY data_retirada DESC';
            return $this->banco->consultar($sql, [], true);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar por ID
    public function selecionarPorId()
    {
        try {
            $sql = 'SELECT emprestimos.*, colaboradores.nome as nome_colaborador, equipamentos.descricao as descricao_equipamento
                    FROM emprestimos
                    INNER JOIN colaboradores USING(id_colaborador)
                    INNER JOIN equipamentos USING(id_equipamento)
                    WHERE id_emprestimo = ?';
            $parametros = [$this->id];
            return $this->banco->consultar($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar Em Aberto
    public function selecionarEmAberto()
    {
        try {
            $sql = 'SELECT emprestimos.*, colaboradores.nome as nome_colaborador, equipamentos.descricao as descricao_equipamento
                    FROM emprestimos
                    INNER JOIN colaboradores USING(id_colaborador)
                    INNER JOIN equipamentos USING(id_equipamento)
                    WHERE status = "emprestado"
                    ORDER BY data_retirada DESC';
            return $this->banco->consultar($sql, [], true);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar por Colaborador
    public function selecionarPorColaborador()
    {
        try {
            $sql = 'SELECT emprestimos.*, equipamentos.descricao as descricao_equipamento
                    FROM emprestimos
                    INNER JOIN equipamentos USING(id_equipamento)
                    WHERE id_colaborador = ?
                    ORDER BY data_retirada DESC';
            $parametros = [$this->id_colaborador];
            return $this->banco->consultar($sql, $parametros, true);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }
}
