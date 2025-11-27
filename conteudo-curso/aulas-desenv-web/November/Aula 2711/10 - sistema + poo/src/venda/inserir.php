<?php
    require_once '../class/BancoDeDados.php';
    date_default_timezone_set('America/Sao_Paulo');

    // Validação
    $qtd_total   = $_POST['qtd_total']    ?? null;
    $total_venda = $_POST['total_venda']  ?? null;
    $id_cliente  = $_POST['id_cliente']   ?? null;
    $produtos    = $_POST['produtos']     ?? [];
    if (empty($id_cliente) || empty($total_venda) || empty($qtd_total) || count($produtos) == 0) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'Existem dados faltando. Veifique!',
        ];
        echo json_encode($resposta);
        exit;
    }
    
    // Entrada dos dados
    require_once '../class/Venda.php';
    $venda = new Venda;
    $venda->qtd_total   = $qtd_total;
    $venda->valor_total = $total_venda;
    $venda->data_hora   = date('Y-m-d H:i:s'); // Pegar Data Hora
    $venda->cancelado   = 0;
    $venda->id_cliente  = $id_cliente;
    $venda->produtos    = $produtos;
    
    // Cadastrar
    $venda->inserir();
    
    // Retorno para o Front   
    $resposta = [
        'status'   => 'sucesso',
        'mensagem' => 'Venda cadastrada com sucesso!',
    ];
    echo json_encode($resposta);

