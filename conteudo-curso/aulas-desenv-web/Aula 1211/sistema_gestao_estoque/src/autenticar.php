<?php
/**
 * Script de autenticação de usuário.
 * Verifica as credenciais enviadas via POST, busca no banco de dados
 * e inicia uma sessão de usuário em caso de sucesso.
 */
session_start();
require_once 'BD.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'] ?? '';
    $senha = $_POST['senha'] ?? '';

    $db = new BD();
    
    // Busca o usuário no banco com o email e senha fornecidos
    $sql = "SELECT * FROM usuarios WHERE email = :email AND senha = :senha";
    $stmt = $db->query($sql, [':email' => $email, ':senha' => $senha]);

    if ($stmt->rowCount() > 0) {
        // Se o usuário for encontrado, armazena seus dados na sessão
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);
        $_SESSION['usuario'] = [
            'id' => $usuario['id'],
            'nome' => $usuario['nome'],
            'email' => $usuario['email']
        ];
        // Retorna sucesso em JSON para o front-end
        echo json_encode(['success' => true]);
    } else {
        // Retorna erro em JSON se as credenciais forem inválidas
        echo json_encode(['success' => false, 'message' => 'Email ou senha inválidos.']);
    }
}
