<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do item inválido',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Exclusão do banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;

        $sql = 'DELETE FROM itens 
                WHERE id_produto = ?';
        $parameros = [$id];
        $banco->executarComando($sql, $parameros);

        $resposta = [
            'status'   => 'sucesso',
            'mensagem' => 'Item removido com sucesso!',
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getCode() == 23000 ? 'Este item não pode ser excluido!' : $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }