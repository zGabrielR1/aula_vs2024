<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do colaborador inválido!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT * FROM colaboradores WHERE id_colaborador = ?';
        $parametros = [$id];
        $cliente = $banco->consultar($sql, $parametros);
        $resposta = [
            'status'  => 'sucesso',
            'colaborador' => $colaborador,
        ];
        echo json_encode($resposta);
    } catch (PDOException $erro) {
        $resposta = [
            'status'  => 'erro',
            'colaborador' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }