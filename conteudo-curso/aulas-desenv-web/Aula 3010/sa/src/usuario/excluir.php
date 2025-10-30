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
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Verificar se o usuário existe
        $sql = 'SELECT id_usuario FROM usuarios WHERE id_usuario = ?';
        $parametros = [$id];
        $usuario_existente = $banco->consultar($sql, $parametros);
        
        if (!$usuario_existente) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Usuário não encontrado!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Excluir usuário
        $sql = 'DELETE FROM usuarios WHERE id_usuario = ?';
        $parametros = [$id];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Usuário excluído com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }