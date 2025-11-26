<?php
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['id']          ?? null;
    $form['nome']       = $_POST['nome']        ?? null;
    $form['cpf']        = $_POST['cpf']         ?? null;
    $form['nascimento'] = $_POST['nascimento'] ?? null;
    $form['sexo']       = $_POST['sexo']        ?? null;
    $form['cidade']     = $_POST['cidade']      ?? null;
    $form['uf']         = $_POST['uf']         ?? null;

    if (in_array(null, $form)) {
        $resposta = [
            'status' => 'erro',
            'mensagem' => 'Existem dados faltando. Verifique!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
            $sql = 'INSERT INTO clientes (nome, cpf, nascimento, sexo, cidade, uf) VALUES (?,?,?,?,?,?)';
            $parametros = [
                $form['nome'],
                $form['cpf'],
                $form['nascimento'],
                $form['sexo'],
                $form['cidade'],
                $form['uf']
            ];
            $banco->executarComando($sql, $parametros);

            $resposta = [
                'status' => 'sucesso',
                'mensagem' => 'Cliente cadastrado com sucesso!'
            ];
            echo json_encode($resposta)
    } catch(PDOException $erro) {
            $resposta = [
                'status' => 'erro',
                'mensagem' => $erro->getMessage()
            ];
            echo json_encode($resposta)
    }