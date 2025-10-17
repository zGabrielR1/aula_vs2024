<?php
    require_once '../class/BancoDeDados.php';

    try {
        $banco = new BancoDeDados;

        $sql ='SELECT 
                vendas.*,
                clientes.nome,
                 FROM vendas
                 INNER JOIN clientes USING(id_cliente)
                 ORDER BY data_hora DESC';
        $vendas = $banco->consultar($sql, [], true);
        $resposta = [
            'status' => 'sucesso',
            'vendas' => $vendas,
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status' => 'erro',
            'mensagem' => $erro->getMesasage(),
        ];
        echo json_encode($resposta);
    }