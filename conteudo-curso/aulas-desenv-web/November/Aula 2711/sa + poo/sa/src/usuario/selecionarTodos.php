<?php
    require_once '../class/Usuario.php';
    $usuario = new Usuario;

    // Consultar
    $dados = $usuario->selecionar();

    // Retorno para o Front
    $resposta = [
        'status'    => 'sucesso',
        'usuarios'  => $dados,
    ];
    echo json_encode($resposta);

