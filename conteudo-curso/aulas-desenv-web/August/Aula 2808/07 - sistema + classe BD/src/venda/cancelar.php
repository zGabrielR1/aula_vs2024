<?php
    // Validação
    $id = $_GET['id'] ?? null;
    
    if (!$id) {
        echo "<script>
            alert('ID da venda inválido!');
            window.history.back();
        </script>";
        exit;
    }

    // Atualizar o banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'UPDATE vendas SET cancelado = 1 WHERE id_venda = ?';
        $parametros = [$id];
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