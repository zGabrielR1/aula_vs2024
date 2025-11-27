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
        // ...
    }
}