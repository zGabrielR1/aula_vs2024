<?php
    require_once '../class/Produto.php';
    $produto = new Produto;

    // Consultar
    $dados = $produto->selecionarTodos();

    // Retorno para o Front
    $resposta = [
        'status'    => 'sucesso',
        'produtos'  => $dados,
    ];
    echo json_encode($resposta);
