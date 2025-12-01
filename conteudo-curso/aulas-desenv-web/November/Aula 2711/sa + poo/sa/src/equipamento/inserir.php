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

    try {
        require_once '../class/Equipamento.php';
        $equipamento = new Equipamento;
        
        // Configurar propriedades do equipamento
        $equipamento->descricao = $descricao;
        $equipamento->quantidade_estoque = $quantidade_estoque;
        
        // Obter arquivo de imagem se fornecido
        $arquivo_imagem = isset($_FILES['file-equipamento']) ? $_FILES['file-equipamento'] : null;
        
        // Usar o método completo que gerencia upload de imagem, inserção e geração de código de barras
        $equipamento->inserirComImagemECodigo($arquivo_imagem, '../../upload/');

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Equipamento cadastrado com sucesso! Código de barras gerado automaticamente.'
        ];
        echo json_encode($resposta);
    } catch(Throwable $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }