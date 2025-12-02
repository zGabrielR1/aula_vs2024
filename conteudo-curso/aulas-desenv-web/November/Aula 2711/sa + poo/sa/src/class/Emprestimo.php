<?php

require_once 'BancoDeDados.php';

class Emprestimo {
    // Atributos
    public string $id;
    public string $data_retirada;
    public ?string $data_devolucao = null;
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

            if ($this->quantidade <= 0) {
                throw new Exception('Quantidade deve ser maior que zero!');
            }

            // Verificar se o colaborador já possui um empréstimo ativo deste equipamento
            $sql = 'SELECT id_emprestimo FROM emprestimos 
                    WHERE id_colaborador = ? 
                    AND id_equipamento = ? 
                    AND status = "emprestado"';
            $parametros = [$this->id_colaborador, $this->id_equipamento];
            $emprestimo_ativo = $this->banco->consultar($sql, $parametros);
            
            if ($emprestimo_ativo) {
                throw new Exception('Este colaborador já possui um empréstimo ativo deste equipamento. É permitido apenas um tipo de equipamento por vez. Por favor, devolva o equipamento antes de realizar um novo empréstimo.');
            }

            // Inserir o empréstimo
            $sql = 'INSERT INTO emprestimos (
                data_retirada,
                data_devolucao,
                id_colaborador,
                id_equipamento,
                quantidade,
                status
            ) VALUES (NOW(), ?, ?, ?, ?, ?)';
            $parametros = [
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
            $this->banco->iniciarTransacao();

            // Verificar se o empréstimo existe e está em aberto
            $sql = 'SELECT * FROM emprestimos WHERE id_emprestimo = ? AND status = "emprestado"';
            $parametros = [$this->id];
            $emprestimo = $this->banco->consultar($sql, $parametros);
            
            if (!$emprestimo) {
                throw new Exception('Empréstimo não encontrado ou já devolvido!');
            }

            // Atualizar o status do empréstimo (usar 'devolvido' pois o equipamento retorna ao estoque)
            $sql = 'UPDATE emprestimos SET status = "devolvido" WHERE id_emprestimo = ?';
            $parametros = [$this->id];
            $this->banco->executarComando($sql, $parametros);

            // Devolver a quantidade ao estoque (como acontece na devolução)
            $sql = 'UPDATE equipamentos SET quantidade_estoque = quantidade_estoque + ? WHERE id_equipamento = ?';
            $parametros = [$emprestimo['quantidade'], $emprestimo['id_equipamento']];
            $this->banco->executarComando($sql, $parametros);

            $this->banco->salvarTransacao();
        } catch (PDOException $erro) {
            $this->banco->voltarTransacao();
            throw new PDOException($erro->getMessage(), (int)$erro->getCode(), $erro);
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
