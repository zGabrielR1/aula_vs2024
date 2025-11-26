<?php
    // Validação
    $nome       = $_POST['nome']        ?? null;
    $usuario    = $_POST['usuario']     ?? null;
    $senha      = $_POST['senha']       ?? null;

    if ($nome == null || $usuario == null || $senha == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, preencha todos os campos!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Verificar se o usuário já existe
        $sql = 'SELECT id_usuario FROM usuarios WHERE usuario = ?';
        $parametros = [$usuario];
        $usuario_existente = $banco->consultar($sql, $parametros);
        
        if ($usuario_existente) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Este nome de usuário já está em uso!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Inserir novo usuário
        $sql = 'INSERT INTO usuarios (nome, usuario, senha) VALUES (?, ?, ?)';
        $parametros = [
            $nome,
            $usuario,
            $senha
        ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Usuário cadastrado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }