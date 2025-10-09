<?php
    require_once '../class/BancoDeDados.php';
    date_default_timezone_set('America/Sao_Paulo');

    // Validação
    $form['id_cliente'] = $_POST['list-cliente'] ?? null;
    $form['id_produto'] = $_POST['list-produto'] ?? null;
    $form['quantidade'] = $_POST['txt-qtd'] ?? null;

    if (in_array(null, $form)) {
        echo "<script>
            alert('Existem dados faltando. Verifique!');
            window.history.back();
        </script>";
        exit;
    }
    
    // Pegar Data Hora
    $form['data_hora'] = date('Y-m-d H:i:s');

    // Calcular Valor Total da Venda
    $banco = new BancoDeDados;
    $produto = $banco->consultar('SELECT preco FROM produtos WHERE id_produto = ?', [$form['id_produto']]);
    $form['valor_total'] = $form['quantidade'] * $produto['preco'];

    // Gravar a venda no Banco
    try {
        $sql = 'INSERT INTO vendas (
            quantidade,
            valor_total,
            data_hora,
            id_produto,
            id_cliente,
            cancelado
        ) VALUES (?,?,?,?,?,?)';
        $parametros = [
            $form['quantidade'],
            $form['valor_total'],
            $form['data_hora'],
            $form['id_produto'],
            $form['id_cliente'],
            0
        ];
        $banco->executarComando($sql, $parametros);

        echo "<script>
            alert('Venda feita com sucesso!');
            window.location.href = '../../sistema.php?tela=vendas';
        </script>";
    } catch(PDOException $erro) {
        $msg = $erro->getMessage();
        echo "<script>
            alert(\"$msg\");
            window.history.back();
        </script>";
    }
