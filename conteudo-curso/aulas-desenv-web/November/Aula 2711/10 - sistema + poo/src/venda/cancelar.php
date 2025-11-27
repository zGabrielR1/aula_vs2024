<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'Venda não localizada!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Definição da venda a ser cancelada
    require_once '../class/Venda.php';
    $venda = new Venda;
    $venda->id = $id;
    
    // Cancelar
    $venda->cancelar();

    // Retorno para o Front
    $resposta = [
        'status'   => 'sucesso',
        'mensagem' => 'Venda cancelada com sucesso!',
    ];
    echo json_encode($resposta);
