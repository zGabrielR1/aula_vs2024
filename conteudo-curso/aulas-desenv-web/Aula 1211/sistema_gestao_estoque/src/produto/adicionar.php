<?php
require_once '../BD.php';

$db = new BD();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = $_POST['nome'];
    $descricao = $_POST['descricao'];
    $preco = $_POST['preco'];
    $quantidade_estoque = $_POST['quantidade_estoque'];
    $quantidade_minima = $_POST['quantidade_minima'];

    $sql = "INSERT INTO produtos (nome, descricao, preco, quantidade_estoque, quantidade_minima) VALUES (:nome, :descricao, :preco, :quantidade_estoque, :quantidade_minima)";
    $params = [
        ':nome' => $nome,
        ':descricao' => $descricao,
        ':preco' => $preco,
        ':quantidade_estoque' => $quantidade_estoque,
        ':quantidade_minima' => $quantidade_minima
    ];

    $db->query($sql, $params);

    echo json_encode(['success' => true]);
}
