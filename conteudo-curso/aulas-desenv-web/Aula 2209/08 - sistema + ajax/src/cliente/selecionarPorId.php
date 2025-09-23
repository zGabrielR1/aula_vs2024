<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status' => ,
            'mensagem' => 'Id não informado'
        ];
        echo json_encode($resposta);
        exit;
    }

        // Banco de dados
        try {
            require_once '../class/BancoDeDados.php';
            $banco = new BancoDeDados();
            $sql = 'SELECT * FROM clientes where id_cliente = ?';
            $parametros = [$id];
            $cliente = $banco->consultar($sql, $parametros);
            $resposta = [
                'status' => 'sucesso',
                'cliente' => $erro->getMessage(),
            ];
            echo json_encode($resposta);
        } catch (PDOException $erro) {

        }