<?php

require_once 'BancoDeDados.php';
// use BancoDeDados;

class Venda {
    // Atributos
    public string $id;
    public string $qtd_total;
    public string $valor_total;
    public string $data_hora;
    public string $cancelado;
    public string $id_colaborador;
    public array $equipamentos = [];
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

            // Venda
            $sql = 'INSERT INTO vendas (
                qtd_total,
                valor_total,
                data_hora,
                cancelado,
                id_cliente
            ) VALUES (?,?,?,?,?)';
            $parametros = [
                $this->qtd_total,
                $this->valor_total,
                $this->data_hora,
                $this->cancelado,
                $this->id_cliente
            ];
            $this->banco->executarComando($sql, $parametros);

            // Pegar o id_venda recém gravada        
            $sql = 'SELECT MAX(id_venda) AS ultimo_id_venda FROM vendas';
            $consulta = $this->banco->consultar($sql);

            // Detalhes da venda
            foreach ($this->produtos as $produto) {
                $sql = 'INSERT INTO detalhes (
                    qtd,
                    valor,
                    id_produto,
                    id_venda
                ) VALUES (?,?,?,?)';
                $parametros = [
                    $produto['qtd'],
                    $produto['valor'],
                    $produto['id'],
                    $consulta['ultimo_id_venda']
                ];
                $this->banco->executarComando($sql, $parametros);
            }

            $this->banco->salvarTRansacao();
        } catch (PDOException $erro) {
            $this->banco->voltarTransacao();
            throw new PDOException;
        }
    }

    // Método Cancelar
    public function cancelar()
    {
        try {
            $sql = 'UPDATE vendas SET cancelado = 1 WHERE id_venda = ?';
            $parametros = [ $this->id ];
            $this->banco->executarComando($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar
    public function selecionar()
    {
        try {
            $sql = 'SELECT vendas.*, clientes.nome
                    FROM vendas
                    INNER JOIN clientes USING(id_cliente)
                    ORDER BY data_hora DESC';
            return $this->banco->consultar($sql, [], true); 
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Devolver
    public function devolver()
    {
        try {
            $sql = 'SELECT emprestimos.*, colaboradores.nome
                    FROM emprestimos
                    INNER JOIN colaboradores USING(id_colaborador)
                    WHERE id_emprestimo = ?';
            $parametros = [ $this->id ];
            return $this->banco->consultar($sql, $parametros, true);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }
}