<?php
    class BancoDeDados {
        // Atributos
        private $conexao;
        private $dbName = 'db_exemplo';
        private $dbUser = 'root';
        private $dbPassword = 'masterkey';

        // Método Construtor
        public function __construct() {
            $this->conexao = new PDO('mysql:host=localhost;port=3307;dbname=' . $this->dbName, $this->dbUser, $this->dbPassword);
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

        // Método Iniciar Transação
        public function iniciarTransacao() {
            $this->conexao->beginTransaction();
        }

        // Método Salvar Transação
        public function salvarTransacao() {
            $this->conexao->commit();
        }

        // Método Voltar Transação
        public function voltarTransacao() {
            $this->conexao->rollBack();
        }
    }