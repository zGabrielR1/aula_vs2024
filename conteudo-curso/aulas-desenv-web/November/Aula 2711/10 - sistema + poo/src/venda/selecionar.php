<?php
    require_once '../class/Venda.php';
    $venda = new Venda;

    // Consultar
    $dados = $venda->selecionar();

    // Retorno para o Front
    $resposta = [
        'status'  => 'sucesso',
        'vendas'  => $dados,
    ];
    echo json_encode($resposta);


