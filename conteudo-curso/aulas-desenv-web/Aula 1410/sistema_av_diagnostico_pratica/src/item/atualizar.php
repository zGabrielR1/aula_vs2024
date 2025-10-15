<?php
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['txt-id']              ?? null;
    $form['descricao']  = $_POST['txt-descricao']       ?? null;
    $form['marca']  = $_POST['txt-marca']       ?? null;
    $form['preco']      = isset($_POST['txt-preco'])    ? str_replace(',', '.', $_POST['txt-preco']) : null;
    $form['estoque']    = $_POST['txt-estoque']         ?? null;

    if (in_array(null, $form)) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Existem dados faltando. Verifique!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Banco de Dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'UPDATE itens SET descricao = ?, marca = ?, preco = ?,  estoque = ? WHERE id_item = ?';
        $parametros = [
            $form['descricao'],
            $form['marca']
            $form['preco'],
            $form['estoque'],
            $form['id']
        ];
        $banco->executarComando($sql, $parametros);
        $resposta = [
            'status'   => 'sucesso',
            'mensagem' => 'Item alterado com sucesso!',
        ];
        echo json_encode($resposta);
    } catch (PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }
