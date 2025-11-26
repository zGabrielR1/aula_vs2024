<?php
require_once '../BD.php';

$db = new BD();
$busca = $_GET['busca'] ?? '';

if (!empty($busca)) {
    $sql = "SELECT * FROM produtos WHERE nome LIKE :busca";
    $stmt = $db->query($sql, [':busca' => "%$busca%"]);
} else {
    $sql = "SELECT * FROM produtos";
    $stmt = $db->query($sql);
}

$produtos = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($produtos);
