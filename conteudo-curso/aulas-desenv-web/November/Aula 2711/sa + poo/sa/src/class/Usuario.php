<?php

require_once 'BancoDeDados.php';
// use BancoDeDados;

class Usuario {
    // Atributos
    public string $id;
    public string $nome;
    public string $usuario; // Deveria ser criptografado
    public string $senha;   // Deveria ser criptografado
    public string $tipo;
    private BancoDeDados $banco;

    // Construtor
    public function __construct()
    {
        $this->banco = new BancoDeDados;
    }

    // Método Login
    public function login(): bool
    {
        try {
            $sql = 'SELECT *
                    FROM usuarios 
                    WHERE usuario = ? AND senha = ?';
            $parametros = [
                $this->usuario,
                $this->senha,
            ];
            $dados = $this->banco->consultar($sql, $parametros);
            if ($dados) {
                $this->id      = $dados['id_usuario'];
                $this->nome    = $dados['nome'];
                $this->usuario = $dados['usuario'];
                $this->senha   = $dados['senha'];
                $this->tipo    = $dados['tipo'];
                return true;
            } else {
                return false;
            }
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Logout
    public function logout()
    {
        session_destroy();
        header('location: index.php');
    }

    // Método Inserir
    public function inserir()
    {
        try {
            // Verificar se o usuário já existe
            $sql = 'SELECT id_usuario FROM usuarios WHERE usuario = ?';
            $parametros = [$this->usuario];
            $usuario_existente = $this->banco->consultar($sql, $parametros);
            
            if ($usuario_existente) {
                throw new Exception('Este nome de usuário já está cadastrado!');
            }

            $sql = 'INSERT INTO usuarios (
                nome,
                usuario,
                senha,
                tipo
            ) VALUES (?,?,?,?)';
            $parametros = [
                $this->nome,
                $this->usuario,
                $this->senha,
                $this->tipo
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
            // Verificar se o usuário já existe para outro usuário
            $sql = 'SELECT id_usuario FROM usuarios WHERE usuario = ? AND id_usuario != ?';
            $parametros = [$this->usuario, $this->id];
            $usuario_existente = $this->banco->consultar($sql, $parametros);
            
            if ($usuario_existente) {
                throw new Exception('Este nome de usuário já está cadastrado para outro usuário!');
            }

            $sql = 'UPDATE usuarios SET 
                nome = ?,
                usuario = ?,
                senha = ?,
                tipo = ?
                WHERE id_usuario = ?';
            $parametros = [
                $this->nome,
                $this->usuario,
                $this->senha,
                $this->tipo,
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
            $sql = 'DELETE FROM usuarios WHERE id_usuario = ?';
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
            $sql = 'SELECT * FROM usuarios ORDER BY nome';
            return $this->banco->consultar($sql, [], true);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar por ID
    public function selecionarPorId()
    {
        try {
            $sql = 'SELECT * FROM usuarios WHERE id_usuario = ?';
            $parametros = [$this->id];
            return $this->banco->consultar($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }
}