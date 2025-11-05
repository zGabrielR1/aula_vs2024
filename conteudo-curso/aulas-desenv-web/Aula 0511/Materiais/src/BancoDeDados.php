<?php
    class BancoDeDados {
        // Atributos da Classe
        private $conexao;

        // Método Construtor (conectar)
        public function __construct() {
            try {
                $this->conexao = new PDO('mysql:host=localhost;dbname=db_tarefas;charset=utf8mb4', 'root', '');
                $this->conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e) {
                throw new Exception('Erro ao conectar com o banco de dados: ' . $e->getMessage());
            }
        }

        // Método Executar Comandos
        public function executarComando($sql, $parametros = []) {
            try {
                $stmt = $this->conexao->prepare($sql);
                $stmt->execute($parametros);
            } catch (PDOException $e) {
                throw new Exception('Erro ao executar comando: ' . $e->getMessage());
            }
        }

        // Método Consultar
        public function consultar($sql, $parametros = [], $fetchAll = false) {
            try {
                $stmt = $this->conexao->prepare($sql);
                $stmt->execute($parametros);
                if ($fetchAll) {
                    return $stmt->fetchAll(PDO::FETCH_ASSOC);
                } else {
                    return $stmt->fetch(PDO::FETCH_ASSOC);
                }
            } catch (PDOException $e) {
                throw new Exception('Erro ao consultar: ' . $e->getMessage());
            }
        }
        
    }