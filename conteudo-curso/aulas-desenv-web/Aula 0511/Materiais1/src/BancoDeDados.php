<?php
    class BancoDeDados {
        // Atributos
        private $conexao;
        private $dbName = 'db_tarefas';
        private $dbUser = 'root';
        private $dbPassword = 'masterkey';

        // Método Construtor
        public function __construct() {
            try {
                $this->conexao = new PDO('mysql:host=localhost;port=3307;dbname=' . $this->dbName, $this->dbUser, $this->dbPassword);
                $this->conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e) {
                die("Connection failed: " . $e->getMessage());
            }
        }

        // Método Executar Comando
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