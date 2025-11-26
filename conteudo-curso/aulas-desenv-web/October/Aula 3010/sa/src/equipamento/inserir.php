<?php
    // Validação
    $descricao          = $_POST['descricao']          ?? null;
    $quantidade_estoque = $_POST['quantidade_estoque'] ?? 0;

    if ($descricao == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, informe a descrição do equipamento!'
        ];
        echo json_encode($resposta);
        exit;
    }

    // Enviar arquivo para o servidor (se fornecido)
    $nome_imagem = null;
    if (isset($_FILES['file-equipamento']) && $_FILES['file-equipamento']['size'] > 0) {
        $nome_imagem = uniqid() . '.jpg';
        $destino     = '../../upload/' . $nome_imagem;
        $origem      = $_FILES['file-equipamento']['tmp_name'];
        if (!move_uploaded_file($origem, $destino)) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Houve um problema para enviar a imagem do equipamento. Tente novamente.'
            ];
            echo json_encode($resposta);
            exit;
        }
    }

    try {
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Inserir novo equipamento
        $sql = 'INSERT INTO equipamentos (descricao, quantidade_estoque, foto) VALUES (?, ?, ?)';
        $parametros = [
            $descricao,
            $quantidade_estoque,
            $nome_imagem,
        ];
        $banco->executarComando($sql, $parametros);

        // Obter o ID do equipamento inserido
        $id_equipamento = $banco->obterUltimoIdInserido();

        // Gerar código de barras baseado no ID do equipamento usando API externa
        // Usando barcodeapi.org - Code128 (formato mais comum)
        $codigo_barras_url = 'https://barcodeapi.org/api/code128/' . $id_equipamento;

        // Atualizar o equipamento com o código de barras
        $sql = 'UPDATE equipamentos SET codigo_barras = ? WHERE id_equipamento = ?';
        $parametros = [
            $codigo_barras_url,
            $id_equipamento
        ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Equipamento cadastrado com sucesso! Código de barras gerado automaticamente.'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }