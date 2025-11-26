<?php
    // Validação
    $id = $_POST['id'] ?? null;
    
    if ($id == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'ID do usuário não informado!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT id_usuario, nome, usuario FROM usuarios WHERE id_usuario = ?';
        $parametros = [$id];
        $usuario = $banco->consultar($sql, $parametros);

        if ($usuario) {
            $resposta = [
                'status'    => 'sucesso',
                'usuario'   => $usuario,
            ];
        } else {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Usuário não encontrado!'
            ];
        }
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }