<?php

/**
 * Classe de conexão com o banco de dados (PDO)
 * Garante uma única instância de conexão.
 */
class BD
{
    private $host = "localhost";
    private $user = "root";
    private $pass = "";
    private $db = "gestao_estoque_saep";
    private $conn;

    /**
     * Construtor da classe.
     * Estabelece a conexão com o banco de dados.
     */
    public function __construct()
    {
        try {
            $this->conn = new PDO("mysql:host={$this->host};dbname={$this->db}", $this->user, $this->pass);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

    /**
     * Retorna a instância da conexão PDO.
     * @return PDO
     */
    public function getConnection()
    {
        return $this->conn;
    }

    /**
     * Prepara e executa uma query SQL.
     * @param string $sql A instrução SQL.
     * @param array $params Os parâmetros para a query.
     * @return PDOStatement|false
     */
    public function query($sql, $params = [])
    {
        try {
            $stmt = $this->conn->prepare($sql);
            $stmt->execute($params);
            return $stmt;
        } catch (PDOException $e) {
            echo "Query failed: " . $e->getMessage();
            return false;
        }
    }
}
