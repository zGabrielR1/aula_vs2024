<?php
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT id_equipamento, descricao, quantidade_estoque, foto FROM equipamentos';
        $equipamentos = $banco->consultar($sql, null, true);

        $resposta = [
            'status'        => 'sucesso',
            'equipamentos'  => $equipamentos,
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }