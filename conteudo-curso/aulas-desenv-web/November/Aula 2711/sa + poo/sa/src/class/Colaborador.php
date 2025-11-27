<?php

require_once 'BancoDeDados.php';

class Colaborador {
    // Atributos
    public string $id;
    public string $nome;
    public string $cpf;
    public string $data_nascimento;
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
            // Verificar se o CPF já existe
            $sql = 'SELECT id_colaborador FROM colaboradores WHERE cpf = ?';
            $parametros = [$this->cpf];
            $colaborador_existente = $this->banco->consultar($sql, $parametros);
            
            if ($colaborador_existente) {
                throw new Exception('Este CPF já está cadastrado!');
            }

            $sql = 'INSERT INTO colaboradores (
                nome,
                cpf,
                data_nascimento
            ) VALUES (?,?,?)';
            $parametros = [
                $this->nome,
                $this->cpf,
                $this->data_nascimento
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
            // Verificar se o CPF já existe para outro colaborador
            $sql = 'SELECT id_colaborador FROM colaboradores WHERE cpf = ? AND id_colaborador != ?';
            $parametros = [$this->cpf, $this->id];
            $colaborador_existente = $this->banco->consultar($sql, $parametros);
            
            if ($colaborador_existente) {
                throw new Exception('Este CPF já está cadastrado para outro colaborador!');
            }

            $sql = 'UPDATE colaboradores SET 
                nome = ?,
                cpf = ?,
                data_nascimento = ?
                WHERE id_colaborador = ?';
            $parametros = [
                $this->nome,
                $this->cpf,
                $this->data_nascimento,
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
            $sql = 'SELECT COUNT(*) as total FROM emprestimos WHERE id_colaborador = ? AND status = "emprestado"';
            $parametros = [$this->id];
            $emprestimos_vinculados = $this->banco->consultar($sql, $parametros);
            
            if ($emprestimos_vinculados['total'] > 0) {
                throw new Exception('Não é possível excluir colaborador com empréstimos em aberto!');
            }

            $sql = 'DELETE FROM colaboradores WHERE id_colaborador = ?';
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
            $sql = 'SELECT * FROM colaboradores ORDER BY nome';
            return $this->banco->consultar($sql, [], true);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar por ID
    public function selecionarPorId()
    {
        try {
            $sql = 'SELECT * FROM colaboradores WHERE id_colaborador = ?';
            $parametros = [$this->id];
            return $this->banco->consultar($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }
}
