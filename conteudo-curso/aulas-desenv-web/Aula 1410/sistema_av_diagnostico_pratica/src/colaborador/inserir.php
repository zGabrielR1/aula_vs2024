<?php
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['id']          ?? null;
    $form['nome']       = $_POST['nome']        ?? null;
    $form['cpf']        = $_POST['cpf']         ?? null;
    $form['email']      = $_POST['email']       ?? null;
    $form['nascimento'] = $_POST['nascimento']  ?? null;
    $form['sexo']       = $_POST['sexo']        ?? null;

    if (in_array(null, $form)) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Existem dados faltando. Verifique!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        $sql = 'INSERT INTO colaboradores (nome, cpf, email, nascimento, sexo) VALUES (?,?,?,?,?,?)';
        $parametros = [
            $form['nome'],
            $form['cpf'],
            $form['email'],
            $form['nascimento'],
            $form['sexo'],
        ];
        $banco->executarComando($sql, $parametros);
        
        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Colaborador cadastrado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }