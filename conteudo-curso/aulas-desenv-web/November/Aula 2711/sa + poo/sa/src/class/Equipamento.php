<?php

require_once 'BancoDeDados.php';

class Equipamento {
    // Atributos
    public string $id;
    public string $descricao;
    public string $quantidade_estoque;
    public string $foto;
    public string $codigo_barras;
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
            $sql = 'INSERT INTO equipamentos (
                descricao,
                quantidade_estoque,
                foto,
                codigo_barras
            ) VALUES (?,?,?,?)';
            $parametros = [
                $this->descricao,
                $this->quantidade_estoque,
                $this->foto,
                $this->codigo_barras
            ];
            $this->banco->executarComando($sql, $parametros);
            
            return $this->banco->obterUltimoIdInserido();
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Alterar
    public function alterar()
    {
        try {
            $sql = 'UPDATE equipamentos SET 
                descricao = ?,
                quantidade_estoque = ?,
                foto = ?,
                codigo_barras = ?
                WHERE id_equipamento = ?';
            $parametros = [
                $this->descricao,
                $this->quantidade_estoque,
                $this->foto,
                $this->codigo_barras,
                $this->id
            ];
            $this->banco->executarComando($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Excluir
    public function excluir()
    {
        try {
            // Verificar se há empréstimos vinculados
            $sql = 'SELECT COUNT(*) as total FROM emprestimos WHERE id_equipamento = ? AND status = "emprestado"';
            $parametros = [$this->id];
            $emprestimos_vinculados = $this->banco->consultar($sql, $parametros);
            
            if ($emprestimos_vinculados['total'] > 0) {
                throw new Exception('Não é possível excluir equipamento com empréstimos em aberto!');
            }

            $sql = 'DELETE FROM equipamentos WHERE id_equipamento = ?';
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
            $sql = 'SELECT * FROM equipamentos ORDER BY descricao';
            return $this->banco->consultar($sql, [], true);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar por ID
    public function selecionarPorId()
    {
        try {
            $sql = 'SELECT * FROM equipamentos WHERE id_equipamento = ?';
            $parametros = [$this->id];
            return $this->banco->consultar($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Atualizar Estoque
    public function atualizarEstoque($quantidade)
    {
        try {
            $sql = 'UPDATE equipamentos SET quantidade_estoque = quantidade_estoque + ? WHERE id_equipamento = ?';
            $parametros = [$quantidade, $this->id];
            $this->banco->executarComando($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Verificar Disponibilidade
    public function verificarDisponibilidade($quantidade_necessaria)
    {
        try {
            $sql = 'SELECT quantidade_estoque FROM equipamentos WHERE id_equipamento = ?';
            $parametros = [$this->id];
            $resultado = $this->banco->consultar($sql, $parametros);
            
            return $resultado['quantidade_estoque'] >= $quantidade_necessaria;
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }
}
