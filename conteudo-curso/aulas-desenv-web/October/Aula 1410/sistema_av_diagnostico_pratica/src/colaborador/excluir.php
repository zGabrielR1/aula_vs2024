<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'ID do colaborador inválido',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Exclusão do banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;

        $sql = 'DELETE FROM colaborador 
                WHERE id_colaborador = ?';
        $parameros = [$id];
        $banco->executarComando($sql, $parameros);

        $resposta = [
            'status'   => 'sucesso',
            'mensagem' => 'Colaborador removido com sucesso!',
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getCode() == 23000 ? 'Este colaborador não pode ser excluido!' : $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }