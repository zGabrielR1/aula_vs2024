<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do produto inválido',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Exclusão do banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;

        $sql = 'DELETE FROM produtos 
                WHERE id_produto = ?';
        $parameros = [$id];
        $banco->executarComando($sql, $parameros);

        $resposta = [
            'status'   => 'sucesso',
            'mensagem' => 'Produto removido com sucesso!',
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getCode() == 23000 ? 'Este produto não pode ser excluido!' : $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }