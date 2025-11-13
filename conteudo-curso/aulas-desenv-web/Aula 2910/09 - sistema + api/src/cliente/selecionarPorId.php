<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do cliente inválido!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT * FROM clientes WHERE id_cliente = ?';
        $parametros = [$id];
        $cliente = $banco->consultar($sql, $parametros);
        $resposta = [
            'status'  => 'sucesso',
            'cliente' => $cliente,
        ];
        echo json_encode($resposta);
    } catch (PDOException $erro) {
        $resposta = [
            'status'  => 'erro',
            'cliente' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }