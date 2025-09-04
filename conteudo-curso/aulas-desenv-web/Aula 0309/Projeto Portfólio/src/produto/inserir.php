<?php
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['txt-id']              ?? "NOVO";
    $form['nome']  = $_POST['txt-nome']       ?? null;
    $form['preco']      = isset($_POST['txt-preco'])    ? str_replace(',', '.', $_POST['txt-preco']) : null;
    $form['descricao']    = $_POST['txt-descricao']         ?? null;


    if (in_array(null, $form)) {
        echo "<script>
            alert('Existem dados faltando. Verifique!');
            window.history.back();
        </script>";
        exit;
    }
    if($_FILES['file-produto']['size'] > 0){
        $nome_imagem = uniqid() . '.jpg';
        $destino = '../../upload/' . $nome_imagem;
        $origem = $_FILES['file-produto']['tmp_name'];
        move_uploaded_file($origem, $destino);
    }
   
    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        if ($form['id'] === 'NOVO') {
            $sql = 'INSERT INTO produtos (descricao, preco, nome, imagem) VALUES (?,?,?,?)';
            $parametros = [
                $form['descricao'],
                $form['preco'],
                $form['nome'],
                $nome_imagem
            ];
            $banco->executarComando($sql, $parametros);
            $msg = 'Produto cadastrado com sucesso!';
        else {
            $sql = 'UPDATE produtos SET descricao = ?, preco = ?, nome = ? WHERE id_produto = ?';
            $parametros = [
                $form['descricao'],
                $form['preco'],
                $form['nome'],
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