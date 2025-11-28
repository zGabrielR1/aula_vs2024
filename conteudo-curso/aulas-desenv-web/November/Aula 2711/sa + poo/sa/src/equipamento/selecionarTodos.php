<?php
    try {
        require_once '../class/Equipamento.php';
        $equipamento = new Equipamento;
        $equipamentos = $equipamento->selecionar();

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