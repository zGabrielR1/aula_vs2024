<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do cliente inválido!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Definição do cliente a ser selecionado
    require_once '../class/Cliente.php';
    $cliente = new Cliente;
    $cliente->id = $id;

    // Consultar
    $dados = $cliente->selecionarPorId();

    // Retorno para o Front
    $resposta = [
        'status'  => 'sucesso',
        'cliente' => $dados,
    ];
    echo json_encode($resposta);
