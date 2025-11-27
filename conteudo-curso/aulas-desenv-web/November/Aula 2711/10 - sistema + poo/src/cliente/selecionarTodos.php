<?php
    require_once '../class/Cliente.php';
    $cliente = new Cliente;

    // Consultar
    $dados = $cliente->selecionarTodos();

    // Retorno para o Front
    $resposta = [
        'status'    => 'sucesso',
        'clientes'  => $dados,
    ];
    echo json_encode($resposta);
