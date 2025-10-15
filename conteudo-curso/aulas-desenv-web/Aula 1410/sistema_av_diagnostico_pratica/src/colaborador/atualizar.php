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

    // Banco de Dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'UPDATE clientes SET nome = ?, cpf = ?, nascimento = ?, sexo = ?, cidade = ?, uf = ? WHERE id_cliente = ?';
        $parametros = [
            $form['nome'],
            $form['cpf'],
            $form['nascimento'],
            $form['sexo'],
            $form['email'],
            $form['id'],
        ];
        $banco->executarComando($sql, $parametros);
        $resposta = [
            'status'   => 'sucesso',
            'mensagem' => 'Colaborador alterado com sucesso!',
        ];
        echo json_encode($resposta);
    } catch (PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }
