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
        $conexao = new PDO('mysql:host=localhost;port=3307;dbname=db_exemplo', 'root', 'masterkey');
        $sql = 'DELETE FROM produtos 
                WHERE id_produto = ?'; 
        $stmt = $conexao->prepare($sql);
        $stmt->execute([$id]);

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