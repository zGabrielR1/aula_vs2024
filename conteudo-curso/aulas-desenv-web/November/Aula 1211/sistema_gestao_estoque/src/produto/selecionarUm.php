<?php
require_once '../BD.php';

$db = new BD();

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM produtos WHERE id = :id";
    $stmt = $db->query($sql, [':id' => $id]);
    $produto = $stmt->fetch(PDO::FETCH_ASSOC);
    echo json_encode($produto);
}
