<?php
require_once '../BD.php';

$db = new BD();

$sql = "SELECT id, nome, quantidade_estoque FROM produtos ORDER BY nome ASC";
$stmt = $db->query($sql);

$produtos = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($produtos);
