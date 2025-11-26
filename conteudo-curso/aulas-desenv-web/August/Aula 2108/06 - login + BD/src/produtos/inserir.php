<?php 
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['txt-id']          ?? null;
    $form['descricao']       = $_POST['txt-descricao']        ?? null;
    $form['preco-venda']      = $_POST['txt-preco']       ?? null;
    $form['quantidade'] = $_POST['txt-quantidade']  ?? null;

    if (in_array(null, $form)) {
        echo "<script>
            alert('Existem dados faltando. Verifique!');
            window.history.back();
        </script>";
        exit;
    }

    // Banco de dados
    try {
        $conexao = new PDO('mysql:host=localhost;port=3307;dbname=db_exemplo', 'root', 'masterkey');
        
        if ($form['id'] === 'NOVO') {
            $sql = 'INSERT INTO produtos (descricao, preco_venda, quantidade) VALUES (?,?,?)';
            $stmt = $conexao->prepare($sql);
            $parametros = [
                $form['descricao'],
                $form['preco-venda'],
                $form['quantidade']
            ];
            $stmt->execute($parametros);
            $msg = 'Produto cadastrado com sucesso!';
        } else {
            $sql = 'UPDATE produtos SET descricao = ?, preco_venda = ?, quantidade = ? WHERE id_produto = ?';
            $stmt = $conexao->prepare($sql);
            $parametros = [
                $form['descricao'],
                $form['preco-venda'],
                $form['quantidade'],
                $form['id']
            ];
            $stmt->execute($parametros);
            $msg = 'Produto alterado com sucesso!';
        }
        
        echo "<script>
                alert('{$msg}');
                window.location.href = '../../sistema.php?tela=produtos';
            </script>";
    } catch(PDOException $erro) {
        $msg = $erro->getMessage();
        echo "<script>
                alert(\"$msg\");
                window.history.back();
            </script>";
    }           