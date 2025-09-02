<?php
    // Validação
    $id = $_GET['id'] ?? null;
    
    if (!$id) {
        echo "<script>
            alert('ID da venda inválida!');
            window.history.back();
        </script>";
        exit;
    }

    // Verificar se a venda existe e não está cancelada
    require_once '../class/BancoDeDados.php';
    $banco = new BancoDeDados;
    $venda = $banco->consultar('SELECT id_produto, quantidade, cancelado FROM vendas WHERE id_venda = ?', [$id]);

    if (!$venda) {
        echo "<script>
            alert('Venda não encontrada!');
            window.history.back();
        </script>";
        exit;
    }

    if ($venda['cancelado'] == 1) {
        echo "<script>
            alert('Esta venda já foi cancelada!');
            window.history.back();
        </script>";
        exit;
    }

    // Atualizar no banco
    try {
        // Restaurar estoque
        $sql_estoque = 'UPDATE produtos SET estoque = estoque + ? WHERE id_produto = ?';
        $parametros_estoque = [$venda['quantidade'], $venda['id_produto']];
        $banco->executarComando($sql_estoque, $parametros_estoque);

        // Cancelar venda
        $sql = 'UPDATE vendas SET cancelado = 1 WHERE id_venda = ?';
        $parametros = [ $id ];
        $banco->executarComando($sql, $parametros);

        echo "<script>
            alert('Venda cancelada com sucesso!');
            window.location.href = '../../sistema.php?tela=vendas';
        </script>";
    } catch(PDOException $erro) {
        echo "<script>
            alert(\"$erro\");
            window.history.back();
        </script>";
    }