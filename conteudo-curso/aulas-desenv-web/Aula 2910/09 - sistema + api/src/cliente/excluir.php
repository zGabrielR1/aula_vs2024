<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do cliente inválido',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Exclusão do banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;

        $sql = 'DELETE FROM clientes 
                WHERE id_cliente = ?';
        $parameros = [$id];
        $banco->executarComando($sql, $parameros);

        $resposta = [
            'status'   => 'sucesso',
            'mensagem' => 'Cliente removido com sucesso!',
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getCode() == 23000 ? 'Este cliente não pode ser excluido!' : $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }