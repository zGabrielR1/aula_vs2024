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
        require_once '../class/Usuario.php';
        $usuario_obj = new Usuario;
        
        // Configurar propriedades do usuário
        $usuario_obj->id = $id;
        
        // Usar o método que já gerencia validações
        $usuario_obj->excluir();

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