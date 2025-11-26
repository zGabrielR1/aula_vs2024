<?php
    // Validação
    $usuario    = $_POST['usuario'] ?? null;
    $senha      = $_POST['senha']   ?? null;
    $lembrar    = isset($_POST['lembrar']) ? true : false;
    if ($usuario == null || $senha == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, preencha todos os campos!'
        ];
        echo json_encode($resposta);    // Imprimindo o Json para o cliente
        exit;                           // Encerra o script
    }

    try {
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT id_usuario, nome, tipo
                FROM usuarios 
                WHERE usuario = ? AND senha = ?';
        $parametros = [
            $usuario,
            $senha,
        ];
        $dados_usuario = $banco->consultar($sql, $parametros);

        // Login
        if ($dados_usuario) {
            session_start();
            $_SESSION['logado']     = true;
            $_SESSION['id_usuario'] = $dados_usuario['id_usuario'];
            $_SESSION['nome']       = $dados_usuario['nome'];
            $_SESSION['tipo']       = $dados_usuario['tipo'];

            $resposta = [
                'status' => 'sucesso',
            ];
        } else {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Usuário ou senha inválidos!',
            ];
        }

        echo json_encode($resposta);  // Imprimindo o Json para o cliente
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
         echo json_encode($resposta);  // Imprimindo o Json para o cliente
    }

