<?php
    // Validação
    $id                 = $_POST['id']                 ?? null;
    $descricao          = $_POST['descricao']          ?? null;
    $quantidade_estoque = $_POST['quantidade_estoque'] ?? 0;
    $codigo_barras      = $_POST['codigo_barras']      ?? null;

    if ($id == null || $descricao == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, informe todos os campos obrigatórios!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        require_once '../class/Equipamento.php';
        $equipamento = new Equipamento;
        
        // Configurar propriedades do equipamento
        $equipamento->id = $id;
        $equipamento->descricao = $descricao;
        $equipamento->quantidade_estoque = $quantidade_estoque;
        $equipamento->codigo_barras = $codigo_barras;
        
        // Obter arquivo de imagem se fornecido
        $arquivo_imagem = isset($_FILES['file-equipamento']) ? $_FILES['file-equipamento'] : null;
        
        // Usar o método completo que gerencia upload de imagem e atualização
        $equipamento->alterarComImagem($arquivo_imagem, '../../upload/');

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Equipamento atualizado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }