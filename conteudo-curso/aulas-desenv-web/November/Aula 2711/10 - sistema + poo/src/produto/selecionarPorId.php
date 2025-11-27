<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do produto inválido!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Definição do produto a ser selecionado
    require_once '../class/Produto.php';
    $produto = new Produto;
    $produto->id = $id;

    // Consultar
    $dados = $produto->selecionarPorId();

    // Retorno para o Front
    $resposta = [
        'status'  => 'sucesso',
        'produto' => $dados,
    ];
    echo json_encode($resposta);
