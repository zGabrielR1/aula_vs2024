<?php
    // Validação
    $id = $_GET['id'] ?? null;
    
    if (!$id) {
        $.ajax({
            url: '../../sistema.php?tela=produtos',
            type: 'GET',
            success: function() {
                window.location.href = '../../sistema.php?tela=produtos';
            }
        });
    exit;
    }

    // Exclusão do banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;

        $sql = 'DELETE FROM produtos WHERE id_produto = ?';
        $parametros = [$id];
        $banco->executarComando($sql, $parametros);

        $.ajax({
            url: '../../sistema.php?tela=produtos',
            type: 'GET',
            success: function() {
                alert('Produto removido com sucesso!');
                window.location.href = '../../sistema.php?tela=produtos';
            }
        });
} catch(PDOException $erro) {
        $.ajax({
            url: '../../sistema.php?tela=produtos',
            type: 'GET',
            success: function() {
                alert('Erro ao excluir produto: " . $erro->getMessage() . "');
                window.history.back();
            }
        });
    }