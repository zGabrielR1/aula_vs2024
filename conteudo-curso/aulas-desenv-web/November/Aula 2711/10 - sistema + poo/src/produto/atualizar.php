<?php
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['id']              ?? null;
    $form['descricao']  = $_POST['descricao']       ?? null;
    $form['preco']      = isset($_POST['preco'])    ? str_replace(',', '.', $_POST['preco']) : null;
    $form['estoque']    = $_POST['estoque']         ?? null;
    if (in_array(null, $form)) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Existem dados faltando. Verifique!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Entrada dos dados
    require_once '../class/Produto.php';
    $produto = new Produto;
    $produto->id        = $form['id'];
    $produto->descricao = $form['descricao'];
    $produto->preco     = $form['preco'];
    $produto->estoque   = $form['estoque'];
    
    // Cadastrar
    $produto->atualizar();

    // Retorno para o Front    
    $resposta = [
        'status'   => 'sucesso',
        'mensagem' => 'Produto alterado com sucesso!',
    ];
    echo json_encode($resposta);

