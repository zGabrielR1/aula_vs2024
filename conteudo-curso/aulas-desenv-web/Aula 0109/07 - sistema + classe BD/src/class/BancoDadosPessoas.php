<?php
    class BancoDados {
        // Atributos
        private $conexao;
        private $dbName = 'db_pessoas';
        private $dbUser = 'root';
        private $dbPassword = 'masterkey';

        // Método Construtor
        public function __construct() {
            try {
                $this->conexao = new PDO('mysql:host=localhost;port=3307;dbname=' . $this->dbName, $this->dbUser, $this->dbPassword);
                $this->conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch(PDOException $erro) {
                throw new PDOException("Erro de conexão com db_pessoas: " . $erro->getMessage());
            }
        }

        // Método Executar Comando
        public function executarComando($sql, $parametros = []) {
            $stmt = $this->conexao->prepare($sql);
            return $stmt->execute($parametros);
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

        // Método para verificar se CPF já existe
        public function cpfJaExiste($cpf, $excluir_id = null) {
            if ($excluir_id) {
                $sql = 'SELECT COUNT(*) FROM pessoas WHERE cpf = ? AND id != ?';
                $stmt = $this->conexao->prepare($sql);
                $stmt->execute([$cpf, $excluir_id]);
            } else {
                $sql = 'SELECT COUNT(*) FROM pessoas WHERE cpf = ?';
                $stmt = $this->conexao->prepare($sql);
                $stmt->execute([$cpf]);
            }
            
            return $stmt->fetchColumn() > 0;
        }
    }
?>