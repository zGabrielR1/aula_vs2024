<?php
    include '../BancoDeDados.php';

    try {
        // Banco de Dados
        $banco = new BancoDeDados();
        
        // Consultar colaboradores
        $sql = 'SELECT id_colaborador, nome FROM colaboradores ORDER BY nome';
        $colaboradores = $banco->consultar($sql, [], true);
        
        // Retornar JSON
        echo json_encode([
            'success' => true,
            'data' => $colaboradores
        ], JSON_UNESCAPED_UNICODE);
        
    } catch (PDOException $erro) {
        $resposta = [
            'status' => 'erro',
            'message' => 'Erro ao carregar colaboradores: ' . $erro->getMessage()
        ];
        echo json_encode($resposta);
    }