<?php
    // Validação
    $id = $_GET['id'] ?? null;
    
    if (!$id || !is_numeric($id)) {
        echo "<script>
            alert('ID da pessoa inválido!');
            window.history.back();
        </script>";
        exit;
    }

    // Exclusão do banco
    try {
        // Conectar ao banco db_pessoas
        $pdo = new PDO('mysql:host=localhost;port=3307;dbname=db_pessoas', 'root', 'masterkey');
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Primeiro, buscar o nome do arquivo da foto para excluí-lo também
        $sql_buscar = 'SELECT nome_arquivo_foto FROM pessoas WHERE id = ?';
        $stmt_buscar = $pdo->prepare($sql_buscar);
        $stmt_buscar->execute([$id]);
        $pessoa = $stmt_buscar->fetch(PDO::FETCH_ASSOC);

        if (!$pessoa) {
            echo "<script>
                alert('Pessoa não encontrada!');
                window.history.back();
            </script>";
            exit;
        }

        // Excluir registro do banco
        $sql = 'DELETE FROM pessoas WHERE id = ?';
        $stmt = $pdo->prepare($sql);
        $resultado = $stmt->execute([$id]);

        if ($resultado && $stmt->rowCount() > 0) {
            // Se a exclusão foi bem-sucedida e havia uma foto, remover o arquivo
            if ($pessoa['nome_arquivo_foto']) {
                $caminho_foto = '../../upload/fotos/' . $pessoa['nome_arquivo_foto'];
                if (file_exists($caminho_foto)) {
                    unlink($caminho_foto);
                }
            }

            echo "<script>
                alert('Pessoa removida com sucesso!');
                window.location.href = '../../sistema.php?tela=pessoas';
            </script>";
        } else {
            echo "<script>
                alert('Não foi possível excluir a pessoa. Tente novamente.');
                window.history.back();
            </script>";
        }

    } catch(PDOException $erro) {
        $msg = $erro->getMessage();
        
        // Tratamento específico para erros comuns
        if (strpos($msg, 'Connection refused') !== false || strpos($msg, 'No connection') !== false) {
            $msg = 'Falha de conexão com o banco de dados. Verifique se o servidor MySQL está rodando.';
        } else if (strpos($msg, 'Access denied') !== false) {
            $msg = 'Acesso negado ao banco de dados. Verifique as credenciais.';
        } else if (strpos($msg, 'Unknown database') !== false) {
            $msg = 'Banco de dados "db_pessoas" não encontrado. Execute o script SQL para criá-lo.';
        } else if (strpos($msg, 'foreign key constraint') !== false || strpos($msg, 'Cannot delete') !== false) {
            $msg = 'Não é possível excluir esta pessoa pois existem vínculos com outros registros.';
        }
        
        echo "<script>
            alert(\"Erro ao excluir: $msg\");
            window.history.back();
        </script>";
    }
?>