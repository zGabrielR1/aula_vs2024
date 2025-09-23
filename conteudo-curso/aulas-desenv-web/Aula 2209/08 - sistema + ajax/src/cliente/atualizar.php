<?php


    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'UPDATE clientes SET nome = ?, cpf = ?, nascimento = ?, sexo = ?, cidade = ?, uf = ? WHERE id_cliente = ?';
        $parametros = [
            $form['nome'],
            $form['cpf'],
            $form['nascimento'],
            $form['sexo'],
            $form['cidade'],
            $form['uf'],
            $form['id']
        ];
        $banco->executarComando($sql, $parametros);
        $resposta [
            'status' => 'sucesso',
            'mensagem' => 'Cliente alterado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch (PDOException $erro) {
            $resposta = [
            'status' => 'erro',
            'mensagem' => 'Erro ao alterar cliente: ' . $erro->getMessage()
        ];
        echo json_encode($resposta);
    }
