<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'Venda não localizada!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Atualizar no banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'UPDATE vendas SET cancelado = 1 WHERE id_venda = ?';
        $parametros = [ $id ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'   => 'sucesso',
            'mensagem' => 'Venda cancelada com sucesso!',
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }