<?php
    // Validação
    $descricao          = $_POST['descricao']          ?? null;
    $quantidade_estoque = $_POST['quantidade_estoque'] ?? 0;
    $foto               = $_POST['foto']               ?? null;
    $codigo_barras      = $_POST['codigo_barras']      ?? null;

    if ($descricao == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, informe a descrição do equipamento!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Inserir novo equipamento
        $sql = 'INSERT INTO equipamentos (descricao, quantidade_estoque, foto, codigo_barras) VALUES (?, ?, ?, ?)';
        $parametros = [
            $descricao,
            $quantidade_estoque,
            $foto,
            $codigo_barras
        ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Equipamento cadastrado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }