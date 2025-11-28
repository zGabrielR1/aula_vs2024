<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do usuário inválido!',
        ];
        echo json_encode($resposta);
        exit;
    }
    // Definição do cliente a ser selecionado
    require_once '../class/Usuario.php';
    $usuario = new Usuario;
    $usuario->id = $id;

    // Consultar
    $dados = $usuario->selecionarPorId();

    // Retorno para o Front
    $resposta = [
        'status'  => 'sucesso',
        'usuario' => $dados,
    ];
    echo json_encode($resposta);
