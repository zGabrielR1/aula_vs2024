<?php
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['id']              ?? null;
    $form['descricao']  = $_POST['descricao']       ?? null;   
    $form['marca']      = $_POST['marca']       ?? null;
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

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        $sql = 'INSERT INTO itens (descricao, marca, preco, estoque, imagem) VALUES (?,?,?,?,?)';
        $parametros = [
            $form['descricao'],
            $form['marca'],
            $form['preco'],
            $form['estoque'],
            $nome_imagem
        ];
        $banco->executarComando($sql, $parametros);
        
        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Item cadastrado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }