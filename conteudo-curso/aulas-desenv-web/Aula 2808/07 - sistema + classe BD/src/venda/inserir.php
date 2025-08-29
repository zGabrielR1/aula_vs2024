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
        </script>"
        exit;
    }

    // Processamento
    $form['data_hora'] = date('d-M-Y H:i:s');
    // Teste var_dump($form['data_hora'])

    // Calcular Valor total da Venda
    $banco = new BamancoDeDados;
    $produto = $banco->consultar('SELECT preco FROM produto WHERE id_produto = ?', [$form['id_produto']]);
    $form['valor_total'] = $form['quantidade'] * $produto['preco'];
    // Teste var_dump($foprm['valor_total']);

    // Gravar a venda no banco de dados

    try {
        $sql = 'INSERT INTO vendas (
            quantidade,
            valor_total,
            data_hora,
            id_cliente,
            id_produto,
            cancelado        
        ) VALUES (?, ?, ?, ?, ?, ?)'
        $parametros = [
            $form['quantidade'],
            $form['valor_total'],
            $form['data_hora'],
            $form['id_cliente'],
            $form['id_produto'],
            0
        ];
        $banco->executarComando($sql, $parametros);

        echo "<script>
            alert('Venda realizada com sucesso!');
            window.location.href = '../../sistema.php?tela=vendas';
        </script>"
        exit;
        ]
    } catch(PDOException $erro){
        $msg = $erro->getMessage();
        echo "<script>
            alert('Existem dados faltando. Verifique!');
            window.history.back();
        </script>"
    }