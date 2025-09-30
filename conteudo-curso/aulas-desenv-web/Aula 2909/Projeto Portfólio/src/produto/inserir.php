<?php
    // Validação de dados (com operação de coalescência)
    $form['id']         = $_POST['txt_id']              ?? null;
    $form['nome']       = $_POST['txt_nome']            ?? null;
    $form['descricao']  = $_POST['txt_descricao']       ?? null;
    $form['preco']      = isset($_POST['txt_preco'])    ? str_replace(',', '.', $_POST['txt_preco']) : null;
    $form['nome_imagem'] = $_POST['txt_nome_imagem']    ?? null;
    $form['estoque']    = 0; // Default value for stock

    // Check if required fields are missing
    if (!$form['nome'] || !$form['descricao'] || !$form['preco']) {
        echo "<script>
            alert('Existem dados faltando. Verifique!');
            window.history.back();
        </script>";
        exit;
    }

    $nome_imagem = '';

    // Enviar arquivo para o servidor
    if (isset($_FILES['file_imagem']) && $_FILES['file_imagem']['size'] > 0) {
        $nome_imagem = uniqid() . '.jpg';
        $destino     = '../../upload/' . $nome_imagem;
        $origem      = $_FILES['file_imagem']['tmp_name'];
        move_uploaded_file($origem, $destino);
    } else if (!$form['nome_imagem']) {
        // Only require new image if not editing existing product
        echo "<script>
            alert('A imagem do produto é obrigatória. Verifique!');
            window.history.back();
        </script>";
        exit;
    } else {
        // Keep existing image when editing
        $nome_imagem = $form['nome_imagem'];
    }

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        if (!$form['id']) {
            // INSERT new product
            $sql = 'INSERT INTO produtos (nome, descricao, preco, estoque, imagem) VALUES (?,?,?,?,?)';
            $parametros = [
                $form['nome'],
                $form['descricao'],
                $form['preco'],
                $form['estoque'],
                $nome_imagem
            ];
            $banco->executarComando($sql, $parametros);
            $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Produto cadastrado com sucesso!'
        ];
        echo json_encode($resposta);
        } else {
            // UPDATE existing product
            $sql = 'UPDATE produtos SET nome = ?, descricao = ?, preco = ?, estoque = ?, imagem = ? WHERE id_produto = ?';
            $parametros = [
                $form['nome'],
                $form['descricao'],
                $form['preco'],
                $form['estoque'],
                $nome_imagem,
                $form['id']
            ];
            $banco->executarComando($sql, $parametros);
            $resposta = [
                'status'    => 'sucesso',
                'mensagem'  => 'Produto alterado com sucesso!'
            ];
        }
        
        echo "<script>
                alert('{$resposta['mensagem']}');
                window.location.href = '../../sistema.php';
            </script>";
        
        exit();
    } catch(PDOException $erro) {
        $msg = $erro->getMessage();
        echo "<script>
                alert(\"$msg\");
                window.history.back();
            </script>";
    }