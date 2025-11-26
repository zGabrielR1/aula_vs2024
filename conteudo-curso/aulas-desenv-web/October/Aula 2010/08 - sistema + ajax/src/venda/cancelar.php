<?php
    // Validação
    $id = $_POST['id'] ?? null;
    if (empty($id)) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => 'Venda não localizada!',
        ];
        echo json_encode($resposta);
        exit;
    }

    // Atualizar no banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;

        $banco->iniciarTransacao();

        // Verificar se a venda já foi cancelada
        $sql = 'SELECT cancelado FROM vendas WHERE id_venda = ?';
        $consulta = $banco->consultar($sql, [$id]);
        if ($consulta['cancelado'] == 1) {
            $resposta = [
                'status'   => 'erro',
                'mensagem' => 'Venda já foi cancelada!',
            ];
            echo json_encode($resposta);
            exit;
        }

        // Obter os detalhes da venda
        $sql = 'SELECT id_produto, qtd FROM detalhes WHERE id_venda = ?';
        $detalhes = $banco->consultar($sql, [$id], true);

        // Incrementar estoque dos produtos
        foreach ($detalhes as $detalhe) {
            $sql = 'UPDATE produtos SET estoque = estoque + ? WHERE id_produto = ?';
            $parametros = [
                $detalhe['qtd'],
                $detalhe['id_produto']
            ];
            $banco->executarComando($sql, $parametros);
        }

        // Cancelar a venda
        $sql = 'UPDATE vendas SET cancelado = 1 WHERE id_venda = ?';
        $parametros = [ $id ];
        $banco->executarComando($sql, $parametros);

        $banco->salvarTransacao();

        $resposta = [
            'status'   => 'sucesso',
            'mensagem' => 'Venda cancelada com sucesso!',
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $banco->voltarTransacao();
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }