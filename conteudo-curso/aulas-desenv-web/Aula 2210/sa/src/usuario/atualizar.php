<?php
    // Validação
    $id         = $_POST['id']          ?? null;
    $nome       = $_POST['nome']        ?? null;
    $usuario    = $_POST['usuario']     ?? null;
    $senha      = $_POST['senha']       ?? null;

    if ($id == null || $nome == null || $usuario == null || $senha == null) {
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
        
        // Verificar se o usuário já existe (exceto para o próprio usuário)
        $sql = 'SELECT id_usuario FROM usuarios WHERE usuario = ? AND id_usuario != ?';
        $parametros = [$usuario, $id];
        $usuario_existente = $banco->consultar($sql, $parametros);
        
        if ($usuario_existente) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Este nome de usuário já está em uso!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Atualizar usuário
        $sql = 'UPDATE usuarios SET nome = ?, usuario = ?, senha = ? WHERE id_usuario = ?';
        $parametros = [
            $nome,
            $usuario,
            $senha,
            $id
        ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Usuário atualizado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }