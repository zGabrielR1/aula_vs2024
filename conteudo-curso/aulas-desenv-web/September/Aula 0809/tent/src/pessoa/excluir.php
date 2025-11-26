<?php
    // Validação
    $id = $_GET['id'] ?? null;

    if (!$id) {
        echo "<script>
            alert('ID da pessoa inválido!');
            window.location.href = '../../sistema.php?tela=funcionarios';
        </script>";
        exit;
    }
    
    // Exclusão do banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        $sql = 'DELETE FROM pessoas 
                WHERE id = ?';
        $parametros = [$id];
        $banco->executarComando($sql, $parametros);
        
        echo "<script>
            alert('Funcionário excluído com sucesso!');
            window.location.href = '../../sistema.php?tela=funcionarios';
        </script>";
        
    } catch(Exception $erro) {
        $msg = $erro->getMessage();
        echo "<script>
            alert(\"$erro\");
            window.history.back();
        </script>";
    }
?>