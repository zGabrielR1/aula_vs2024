<?php
    require_once '../class/Usuario.php';
    $usuario = new Usuario;

    // Consultar
    $dados = $usuario->selecionar();

    // Retorno para o Front
    $resposta = [
        'status'    => 'sucesso',
        'usuario'  => $dados,
    ];
    echo json_encode($resposta);

