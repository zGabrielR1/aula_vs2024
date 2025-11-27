<?php
    // Validação
    $usuario = $_POST['usuario'] ?? null;
    $senha   = $_POST['senha']   ?? null;
    $lembrar = isset($_POST['lembrar']) ? true : false;
    if ($usuario == null || $senha == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, preencha todos os campos!'
        ];
        echo json_encode($resposta);    // Imprimindo o Json para o usuario
        exit;                           // Encerra o script
    }

    // Login
    require_once '../class/Usuario.php';
    $user = new Usuario;
    $user->usuario = $usuario;
    $user->senha   = $senha;
    if ($user->login()) {
        session_start();
        $_SESSION['logado']     = true;
        $_SESSION['id_usuario'] = $user->id;
        $_SESSION['nome']       = $user->nome;
        $_SESSION['tipo']       = $user->tipo;
        $resposta = [
            'status' => 'sucesso',
        ];
    } else {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Usuário ou senha inválidos!',
        ];
    }

    // Imprimindo o Json para o usuario
    echo json_encode($resposta);


