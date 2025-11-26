<?php
require_once '../BD.php';

$db = new BD();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];

    $sql = "DELETE FROM produtos WHERE id = :id";
    $db->query($sql, [':id' => $id]);

    echo json_encode(['success' => true]);
}
