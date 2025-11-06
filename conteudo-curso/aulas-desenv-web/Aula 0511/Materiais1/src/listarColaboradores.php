<?php
    header('Content-Type: application/json');
    
    include 'BancoDeDados.php';
    
    try {
        $banco = new BancoDeDados;
        $sql = 'SELECT id_colaborador as id, nome FROM colaboradores ORDER BY nome';
        $colaboradores = $banco->consultar($sql, [], true);
        
        echo json_encode($colaboradores);
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode(['error' => $e->getMessage()]);
    }
?>