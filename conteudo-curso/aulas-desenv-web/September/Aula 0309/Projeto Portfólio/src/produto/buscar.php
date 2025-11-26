<?php
header('Content-Type: application/json');

try {
    // Validate ID parameter
    $id = $_GET['id'] ?? null;
    if (!$id || !is_numeric($id)) {
        echo json_encode(['erro' => 'ID do produto inválido']);
        exit;
    }

    // Database connection
    require_once '../class/BancoDeDados.php';
    $banco = new BancoDeDados;
    
    // Query product
    $sql = 'SELECT * FROM produtos WHERE id_produto = ?';
    $parametros = [$id];
    $produto = $banco->consultar($sql, $parametros);
    
    if ($produto) {
        // Return product data as JSON
        echo json_encode($produto);
    } else {
        echo json_encode(['erro' => 'Produto não encontrado']);
    }
    
} catch(PDOException $erro) {
    echo json_encode(['erro' => $erro->getMessage()]);
} catch(Exception $erro) {
    echo json_encode(['erro' => 'Erro interno do servidor']);
}
?>