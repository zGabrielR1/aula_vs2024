<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do produto inválido',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Definição do produto a ser excluído
    require_once '../class/Produto.php';
    $produto = new Produto;
    $produto->id = $id;

    // Remover
    $produto->deletar();

    // Retorno para o Front
    $resposta = [
        'status'   => 'sucesso',
        'mensagem' => 'Produto removido com sucesso!',
    ];
    echo json_encode($resposta);
