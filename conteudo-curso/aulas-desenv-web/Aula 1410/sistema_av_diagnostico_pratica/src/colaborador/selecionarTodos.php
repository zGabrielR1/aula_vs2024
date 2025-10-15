<?php
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT * FROM colaboradores';
        $colaboradores = $banco->consultar($sql, null, true);

        $resposta = [
            'status'    => 'sucesso',
            'colaboradores'  => $colaboradores,
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }
