<?php
    // Validação
    $id = $_POST['id'] ?? null;
    
    if ($id == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'ID do equipamento não informado!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT id_equipamento, descricao, quantidade_estoque, foto, codigo_barras FROM equipamentos WHERE id_equipamento = ?';
        $parametros = [$id];
        $equipamento = $banco->consultar($sql, $parametros);

        if ($equipamento) {
            $resposta = [
                'status'        => 'sucesso',
                'equipamento'   => $equipamento,
            ];
        } else {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Equipamento não encontrado!'
            ];
        }
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }