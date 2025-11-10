<?php
    // Include
    include 'BancoDeDados.php';
    
    try {
        $banco = new BancoDeDados;
        
        $sql = "SELECT id_colaborador as id, nome FROM colaboradores ORDER BY nome";
        $colaboradores = $banco->consultar($sql, [], true);
        
        echo json_encode($colaboradores);
    } catch (Exception $erro) {
        echo json_encode(['Ocorreu um erro: ' => $erro->getMessage()]);
    }
?>