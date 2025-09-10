<?php
    // Validação
    $id = $_GET['id'] ?? null;
    if (!$id) {
        echo "<script>
            alert('ID da pessoa inválido!');
            window.location.href = '../../sistema.php?tela=pessoas';
        </script>";
        exit;
    }

    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Buscar dados da pessoa antes de excluir (para remover a foto)
        $sql_buscar = 'SELECT foto FROM pessoas WHERE id = ?';
        $pessoa = $banco->consultar($sql_buscar, [$id]);
        
        if (!$pessoa) {
            echo "<script>
                alert('Pessoa não encontrada!');
                window.location.href = '../../sistema.php?tela=pessoas';
            </script>";
            exit;
        }
        
        // Excluir registro do banco
        $sql = 'DELETE FROM pessoas WHERE id = ?';
        $parametros = [$id];
        $banco->executarComando($sql, $parametros);
        
        // Remover arquivo de foto se existir
        if ($pessoa['foto'] && file_exists('../../uploads/' . $pessoa['foto'])) {
            unlink('../../uploads/' . $pessoa['foto']);
        }
        
        echo "<script>
            alert('Pessoa excluída com sucesso!');
            window.location.href = '../../sistema.php?tela=pessoas';
        </script>";
        
    } catch(PDOException $erro) {
        $msg = $erro->getMessage();
        
        // Tratar erro de integridade referencial (se houver relacionamentos futuros)
        if (strpos($msg, 'foreign key constraint') !== false) {
            $msg = 'Não é possível excluir esta pessoa pois existem registros relacionados a ela.';
        }
        
        echo "<script>
            alert(\"Erro ao excluir pessoa: $msg\");
            window.location.href = '../../sistema.php?tela=pessoas';
        </script>";
    } catch(Exception $erro) {
        $msg = $erro->getMessage();
        echo "<script>
            alert(\"Erro inesperado: $msg\");
            window.location.href = '../../sistema.php?tela=pessoas';
        </script>";
    }
?>