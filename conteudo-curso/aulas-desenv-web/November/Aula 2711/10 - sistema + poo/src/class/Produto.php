<?php

require_once 'BancoDeDados.php';
// use BancoDeDados;

class Produto {
    // Atributos
    public string $id;
    public string $descricao;
    public string $preco;
    public string $estoque;
    public string $imagem;
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
            $sql = 'INSERT INTO produtos (
                        descricao,
                        preco,
                        estoque,
                        imagem
                    ) VALUES (?,?,?,?)';
            $parametros = [
                $this->descricao,
                $this->preco,
                $this->estoque,
                $this->imagem,
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
            $sql = 'UPDATE produtos SET
                    descricao = ?,
                    preco = ?,
                    estoque = ?
                    WHERE id_produto = ?';
            $parametros = [
                $this->descricao,
                $this->preco,
                $this->estoque,
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
            $sql = 'DELETE FROM produtos
                    WHERE id_produto = ?';
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
            $sql = 'SELECT * FROM produtos
                    WHERE id_produto = ?';
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
            $sql = 'SELECT * FROM produtos';
            return $this->banco->consultar($sql, [], true);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }
}