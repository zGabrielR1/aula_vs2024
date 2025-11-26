<?php
    // Validação
    $id = $_GET['id'] ?? null;
    
    if (!$id) {
        echo "<script>
            alert('ID do produto inválido!');
            window.history.back();
        </script>";
        exit;
    }

    // Exclusão do banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;

        $sql = 'DELETE FROM produtos 
                WHERE id_produto = ?';
        $parameros = [$id];
        $banco->executarComando($sql, $parameros);

        echo "<script>
            alert('Produto removido com sucesso!');
            window.location.href = '../../sistema.php?tela=produtos';
        </script>";
    } catch(PDOException $erro) {
        echo "<script>
            alert(\"$erro\");
            window.history.back();
        </script>";
    }