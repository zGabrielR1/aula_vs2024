<?php
    // Validação
    $descricao          = $_POST['descricao']          ?? null;
    $quantidade_estoque = $_POST['quantidade_estoque'] ?? 0;
    $codigo_barras      = $_POST['codigo_barras']      ?? null;

    if ($descricao == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, informe a descrição do equipamento!'
        ];
        echo json_encode($resposta);
        exit;
    }

    // Enviar arquivo para o servidor
    if ($_FILES['file-equipamento']['size'] > 0) {
        $nome_imagem = uniqid() . '.jpg';
        $destino     = '../../upload/' . $nome_imagem;
        $origem      = $_FILES['file-equipamento']['tmp_name'];
        move_uploaded_file($origem, $destino)
    } else {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Houve um problema para enviar a imagem. Tente novamente.'
        ];
        echo json_encode($resposta);
        exit;
    }

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Inserir novo equipamento
        $sql = 'INSERT INTO equipamentos (descricao, quantidade_estoque, foto, codigo_barras) VALUES (?, ?, ?, ?)';
        $parametros = [
            $descricao,
            $quantidade_estoque,
            $nome_imagem,
            $codigo_barras
        ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Equipamento cadastrado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }