<?php
    require_once '../class/BancoDeDados.php';
    date_default_timezone_set('America/Sao_Paulo');

    // Validação
    $id_cliente  = $_POST['id_cliente']   ?? null;
    $total_venda = $_POST['total_venda']  ?? null;
    $qtd_total   = $_POST['qtd_total']    ?? null;
    $produtos    = $_POST['produtos']     ?? [];
    if (empty($id_cliente) || empty($total_venda) || empty($qtd_total) || count($produtos) == 0) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'Existem dados faltando. Veifique!',
        ];
        echo json_encode($resposta);
        exit;
    }
    
    // Pegar Data Hora
    $data_hora = date('Y-m-d H:i:s');

    try {
        $banco = new BancoDeDados;

        $banco->iniciarTransacao();

        // Validar estoque para cada produto
        foreach ($produtos as $produto) {
            $sql = "SELECT estoque FROM produtos WHERE id_produto = ?";
            $parametros = [$produto['id']];
            $consulta = $banco->consultar($sql, $parametros);
            
            if ($consulta && $consulta['estoque'] < $produto['qtd']) {
                $resposta = [
                    'status' => 'erro',
                    'mensagem' => 'Estoque insuficiente para o produto ID: ' . $produto['id']
                ];
                echo json_encode($resposta);
                exit;
            } else {
                // Gravar a venda no Banco
                $sql = 'INSERT INTO vendas (
                    qtd_total,
                    valor_total,
                    data_hora,
                    cancelado,
                    id_cliente
                ) VALUES (?,?,?,?,?)';
                $parametros = [
                    $qtd_total,
                    $total_venda,
                    $data_hora,
                    0,
                    $id_cliente
                ];
                $banco->executarComando($sql, $parametros);

                // Pegar o id_venda recém gravada        
                $sql = 'SELECT MAX(id_venda) AS ultimo_id_venda FROM vendas';
                $consulta = $banco->consultar($sql);

                foreach ($produtos as $produto) {
                    $sql = 'INSERT INTO detalhes (
                        qtd,
                        valor,
                        id_produto,
                        id_venda
                    ) VALUES (?,?,?,?)';
                    $parametros = [
                        $produto['qtd'],
                        $produto['valor'],
                        $produto['id'],
                        $consulta['ultimo_id_venda']
                    ];
                    $banco->executarComando($sql, $parametros);
                    
                    // Reduzir o estoque do produto
                    $sql = 'UPDATE produtos SET estoque = estoque - ? WHERE id_produto = ?';
                    $parametros = [
                        $produto['qtd'],
                        $produto['id']
                    ];
                    $banco->executarComando($sql, $parametros);
                }

                $banco->salvarTRansacao();

                $resposta = [
                    'status'   => 'sucesso',
                    'mensagem' => 'Venda cadastrada com sucesso!',
                ];
                echo json_encode($resposta);
                    }
        }
        
    } catch(PDOException $erro) {
        $banco->voltarTransacao();

        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }
