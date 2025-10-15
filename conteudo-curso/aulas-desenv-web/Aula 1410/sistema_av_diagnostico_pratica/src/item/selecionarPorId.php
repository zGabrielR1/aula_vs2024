<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do produto inválido!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT * FROM itens WHERE id_item = ?';
        $parametros = [$id];
        $produto = $banco->consultar($sql, $parametros);
        $resposta = [
            'status'  => 'sucesso',
            'item' => $item,
        ];
        echo json_encode($resposta);
    } catch (PDOException $erro) {
        $resposta = [
            'status'  => 'erro',
            'item' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }