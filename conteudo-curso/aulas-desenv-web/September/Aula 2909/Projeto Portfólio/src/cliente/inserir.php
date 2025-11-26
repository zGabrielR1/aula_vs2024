<?php
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['txt-id']          ?? null;
    $form['nome']       = $_POST['txt-nome']        ?? null;
    $form['cpf']        = $_POST['txt-cpf']         ?? null;
    $form['nascimento'] = $_POST['date-nascimento'] ?? null;
    $form['sexo']       = $_POST['rbt-sexo']        ?? null;
    $form['cidade']     = $_POST['txt-cidade']      ?? null;
    $form['uf']         = $_POST['list-uf']         ?? null;

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
        
        if ($form['id'] === 'NOVO') {
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
            $msg = 'Cliente cadastrado com sucesso!';
        } else {
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
            $msg = 'Cliente alterado com sucesso!';
        }
        
        echo "<script>
                alert('{$msg}');
                window.location.href = '../../sistema.php?tela=clientes';
            </script>";
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }