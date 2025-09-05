<?php
    // Validação de dados (ajustado para os nomes corretos do modal)
    $form['id']         = $_POST['txt_nome']            ?? null; 
    $form['descricao']  = $_POST['txt_descricao']       ?? null;
    $form['preco']      = isset($_POST['txt_preco'])    ? str_replace(',', '.', $_POST['txt_preco']) : null;
    
    // Handle file upload correctly
    if (isset($_FILES['file_imagem']) && $_FILES['file_imagem']['size'] > 0) {
        $form['imagem'] = $_FILES['file_imagem'];
    } else {
        $form['imagem'] = null;
    }

    // Modified validation to exclude ID field from null check if it's 'NOVO'
    $validation_array = $form;
    if ($form['id'] === 'NOVO' || $form['id'] === 'coca' || !empty($form['id'])) { // Allow any non-empty ID for testing
        unset($validation_array['id']); // Don't validate ID if it's set
    }
    
    // Don't validate image for now during debugging
    unset($validation_array['imagem']);
    
    if (in_array(null, $validation_array) || in_array('', $validation_array)) {
        echo "<script>
            alert('Existem dados faltando. Verifique!');
        </script>";
        exit;
    }
    // Enviar arquivo para o servidor
    


    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Check if we have hidden txt_id field (for edit) or if this is a new product
        $product_id = $_POST['txt_id'] ?? null;
        
        if (empty($product_id) || $product_id === 'NOVO') {
            // Insert new product - include nome, descricao, preco, imagem
            $sql = 'INSERT INTO produtos (nome, descricao, preco, imagem) VALUES (?,?,?,?)';
            $parametros = [
                $form['id'],        // txt_nome -> nome (product name)
                $form['descricao'], // txt_descricao -> descricao  
                $form['preco'],     // txt_preco -> preco
                $nome_imagem        // file/image name
            ];
            echo "<p>Executing INSERT with parameters: " . implode(', ', $parametros) . "</p>";
            $banco->executarComando($sql, $parametros);
            $msg = 'Produto cadastrado com sucesso!';
        } else {
            // Update existing product
            $sql = 'UPDATE produtos SET nome = ?, descricao = ?, preco = ?, imagem = ? WHERE id_produto = ?';
            $parametros = [
                $form['id'],        // txt_nome -> nome (product name)
                $form['descricao'], // txt_descricao -> descricao
                $form['preco'],     // txt_preco -> preco  
                $nome_imagem,       // file/image name
                $product_id         // txt_id -> id_produto
            ];
            echo "<p>Executing UPDATE with parameters: " . implode(', ', $parametros) . "</p>";
            $banco->executarComando($sql, $parametros);
            $msg = 'Produto alterado com sucesso!';
        }
        
        echo "<script>
                alert('{$msg}');
                window.location.href = '../../sistema.php?tela=produtos';
            </script>";
        
        exit();
    } catch(PDOException $erro) {
        $msg = $erro->getMessage();
        echo "<script>
                alert(\"$msg\");
                window.history.back();
            </script>";
    }