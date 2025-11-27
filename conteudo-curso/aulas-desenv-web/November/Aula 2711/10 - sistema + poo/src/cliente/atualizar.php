<?php
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['id']          ?? null;
    $form['nome']       = $_POST['nome']        ?? null;
    $form['cpf']        = $_POST['cpf']         ?? null;
    $form['nascimento'] = $_POST['nascimento']  ?? null;
    $form['sexo']       = $_POST['sexo']        ?? null;
    $form['cidade']     = $_POST['cidade']      ?? null;
    $form['uf']         = $_POST['uf']          ?? null;
    if (in_array(null, $form)) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Existem dados faltando. Verifique!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Entrada dos dados
    require_once '../class/Cliente.php';
    $cliente = new Cliente;
    $cliente->id         = $form['id'];
    $cliente->nome       = $form['nome'];
    $cliente->cpf        = $form['cpf'];
    $cliente->nascimento = $form['nascimento'];
    $cliente->sexo       = $form['sexo'];
    $cliente->cidade     = $form['cidade'];
    $cliente->uf         = $form['uf'];
    
    // Atualizar
    $cliente->atualizar();

    // Retorno para o Front
    $resposta = [
        'status'   => 'sucesso',
        'mensagem' => 'Cliente alterado com sucesso!',
    ];
    echo json_encode($resposta);