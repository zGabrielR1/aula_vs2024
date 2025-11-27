<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do cliente inválido',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Definição do cliente a ser excluído
    require_once '../class/Cliente.php';
    $cliente = new Cliente;
    $cliente->id = $id;

    // Remover
    $cliente->deletar();

    // Retorno para o Front
    $resposta = [
        'status'   => 'sucesso',
        'mensagem' => 'Cliente removido com sucesso!',
    ];
    echo json_encode($resposta);
