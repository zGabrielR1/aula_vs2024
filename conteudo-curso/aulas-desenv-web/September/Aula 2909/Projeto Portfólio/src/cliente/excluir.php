<?php
    // Validação
    $id = $_GET['id'] ?? null;
    
    if (!$id) {
        echo "<script>
            alert('ID do cliente inválido!');
            window.history.back();
        </script>";
        exit;
    }

    // Exclusão do banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;

        $sql = 'DELETE FROM clientes 
                WHERE id_cliente = ?';
        $parameros = [$id];
        $banco->executarComando($sql, $parameros);

        echo "<script>
            alert('Cliente removido com sucesso!');
            window.location.href = '../../sistema.php?tela=clientes';
        </script>";
    } catch(PDOException $erro) {
        echo "<script>
            alert(\"$erro\");
            window.history.back();
        </script>";
    }