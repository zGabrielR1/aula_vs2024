<?php
    require_once '../class/BancoDeDados.php';
    date_default_timezone_set('America/Sao_Paulo');

    // Validação
    $id_cliente = $_POST['list-cliente'] ?? null;
    $produtos = $_POST['produtos'] ?? null;


    if (empty($id_cliente) || count($produtos) == 0) {
        $resposta = [
            'status' => 'erro',
            'mensagem' => 'Existem dados faltando. Verifique!'
        ];
        echo json_encode($resposta);
        exit;
    }
    
    // Pegar Data Hora
    $dat_hora = date('Y-m-d H:i:s');
    //
    // Gravar a venda no Banco
    try {
        $banco = new BancoDeDados;
        $sql = 'INSERT INTO vendas (
            quantidade,
            valor_total,
            data_hora,
            cancelado,
            id_cliente
        ) VALUES (?,?,?,?,?,?)';
        $parametros = [
            $qtd_total,
            $valor_total,
            $data_hora,
            0,
            $id_cliente
        ];
        $banco->executarComando($sql, $parametros);

        // Pegar o ID recém gerado da venda
        $sql = 'SELECT MAX(id_venda) FROM vendas';
        $id_venda = $banco->consultar($sql);
        foreach($produtos as $produto) {
            $sql = 'INSERT INTO detalhes (
                qtd,
                valor,
                id_produto,
                id_venda,
            '
            ) VALUES (?,?,?,?);
            $parametros = [
                $produto['qtd'],
                $produto['valor'],
                $produto['id'],
                $id_venda
            ];
            $banco->executarComando($sql, $parametros);
        }

    } catch(PDOException $erro) {
        $msg = $erro->getMessage();
        echo "<script>
            alert(\"$msg\");
            window.history.back();
        </script>";
    }
