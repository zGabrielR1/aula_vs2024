<?php
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT id_usuario, nome, usuario FROM usuarios';
        $usuarios = $banco->consultar($sql, null, true);

        $resposta = [
            'status'    => 'sucesso',
            'usuarios'  => $usuarios,
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }