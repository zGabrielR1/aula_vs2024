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

    // Enviar arquivo para o servidor
    if ($_FILES['file-produto']['size'] > 0) {
        $nome_imagem = uniqid() . '.jpg';
        $destino     = '../../upload/' . $nome_imagem;
        $origem      = $_FILES['file-produto']['tmp_name'];
        move_uploaded_file($origem, $destino);
    } else {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Houve um problema para enviar a imagem. Tente novamente.'
        ];
        echo json_encode($resposta);
        exit;
    }

    // Entrada dos dados
    require_once '../class/Produto.php';
    $produto = new Produto;
    $produto->descricao = $form['descricao'];
    $produto->preco     = $form['preco'];
    $produto->estoque   = $form['estoque'];
    $produto->imagem    = $nome_imagem;
    
    // Cadastrar
    $produto->inserir();

    // Retorno para o Front    
    $resposta = [
        'status'    => 'sucesso',
        'mensagem'  => 'Produto cadastrado com sucesso!'
    ];
    echo json_encode($resposta);
