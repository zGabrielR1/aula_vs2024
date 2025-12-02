<?php
    // Validação
    $id = $_POST['id'] ?? null;
    
    if ($id == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'ID do equipamento não informado!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        require_once '../class/Equipamento.php';
        $equipamento = new Equipamento;
        $equipamento->id = $id;
        
        // Usar o método completo que exclui do banco e deleta a imagem
        $equipamento->excluirComImagem('../../upload/');

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Equipamento excluído com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getCode() == 23000 ? 'Este equipamento não pode ser excluído, pois faz parte de um empréstimo.' : $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }