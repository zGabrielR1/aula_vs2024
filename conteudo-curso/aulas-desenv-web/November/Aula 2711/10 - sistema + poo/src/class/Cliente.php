<?php

require_once 'BancoDeDados.php';
// use BancoDeDados;

class Cliente {
    // Atributos
    public string $id;
    public string $nome;
    public string $cpf;
    public string $nascimento;
    public string $sexo;
    public string $cidade;
    public string $uf;
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
            $sql = 'INSERT INTO clientes (
                        nome,
                        cpf,
                        nascimento,
                        sexo,
                        cidade,
                        uf
                    ) VALUES (?,?,?,?,?,?)';
            $parametros = [
                $this->nome,
                $this->cpf,
                $this->nascimento,
                $this->sexo,
                $this->cidade,
                $this->uf,
            ];
            $this->banco->executarComando($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Atualizar
    public function atualizar()
    {
        try {
            $sql = 'UPDATE clientes SET
                    nome = ?,
                    cpf = ?,
                    nascimento = ?,
                    sexo = ?,
                    cidade = ?,
                    uf = ?
                    WHERE id_cliente = ?';
            $parametros = [
                $this->nome,
                $this->cpf,
                $this->nascimento,
                $this->sexo,
                $this->cidade,
                $this->uf,
                $this->id,
            ];
            $this->banco->executarComando($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Deletar
    public function deletar()
    {
        try {
            $sql = 'DELETE FROM clientes
                    WHERE id_cliente = ?';
            $parametros = [
                $this->id,
            ];
            $this->banco->executarComando($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar Por ID
    public function selecionarPorId()
    {
        try {
            $sql = 'SELECT * FROM clientes
                    WHERE id_cliente = ?';
            $parametros = [
                $this->id,
            ];
            return $this->banco->consultar($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar Por ID
    public function selecionarTodos()
    {
        try {
            $sql = 'SELECT * FROM clientes';
            return $this->banco->consultar($sql, [], true);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }
}