<?php
    class BancoDeDados {
        // Atributos da Classe
        private $conexao;

        // Método Construtor (conectar)
        public function __construct() {
            $this->conexao = new PDO('mysql:host=localhost;dbname=db_tarefas;charset=utf8mb4', 'root', 'masterkey');
        }

        // Método Executar Comandos
        public function executarComando($sql, $parametros = []) {
            $stmt = $this->conexao->prepare($sql);
            $stmt->execute($parametros);
        }

        // Método Consultar
        public function consultar($sql, $parametros = [], $fetchAll = false) {
            $stmt = $this->conexao->prepare($sql);
            $stmt->execute($parametros);
            if ($fetchAll) {
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } else {
                return $stmt->fetch(PDO::FETCH_ASSOC);
            }
        }
        
    }