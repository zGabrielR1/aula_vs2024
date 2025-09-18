<?php
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['txt-id']              ?? null;
    $form['descricao']  = $_POST['txt-descricao']       ?? null;
    $form['preco']      = isset($_POST['txt-preco'])    ? str_replace(',', '.', $_POST['txt-preco']) : null;
    $form['estoque']    = $_POST['txt-estoque']         ?? null;

    if (in_array(null, $form)) {
        echo "<script>
            alert('Existem dados faltando. Verifique!');
            window.history.back();
        </script>";
        exit;
    }

    // Enviar arquivo para o servidor
    if ($_FILES['file-produto']['size'] > 0) {
        $nome_imagem = uniqid() . '.jpg';
        $destino     = '../../upload/' . $nome_imagem;
        $origem      = $_FILES['file-produto']['tmp_name'];
        move_uploaded_file($origem, $destino);
    } else {
        echo "<script>
            alert('A imagem do produto é obrigatória. Verifique!');
            window.history.back();
        </script>";
        exit;
    }

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        if ($form['id'] === 'NOVO') {
            $sql = 'INSERT INTO produtos (descricao, preco, estoque, imagem) VALUES (?,?,?,?)';
            $parametros = [
                $form['descricao'],
                $form['preco'],
                $form['estoque'],
                $nome_imagem
            ];
            $banco->executarComando($sql, $parametros);
            $msg = 'Produto cadastrado com sucesso!';
        } else {
            $sql = 'UPDATE produtos SET descricao = ?, preco = ?, estoque = ? WHERE id_produto = ?';
            $parametros = [
                $form['descricao'],
                $form['preco'],
                $form['estoque'],
                $form['id']
            ];
            $banco->executarComando($sql, $parametros);
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