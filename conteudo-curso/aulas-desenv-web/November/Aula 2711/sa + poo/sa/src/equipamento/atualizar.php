<?php
    // Validação
    $id                 = $_POST['id']                 ?? null;
    $descricao          = $_POST['descricao']          ?? null;
    $quantidade_estoque = $_POST['quantidade_estoque'] ?? null;
    $codigo_barras      = $_POST['codigo_barras']      ?? null;

    if ($id == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'ID do equipamento não informado!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        require_once '../class/Equipamento.php';
        $equipamento = new Equipamento;
        
        $equipamento->id = $id;
        
        $equipamento_existente = $equipamento->selecionarPorId();
        
        if (!$equipamento_existente) {
            throw new Exception('Equipamento não encontrado!');
        }
        
        $equipamento->descricao = $descricao ?? $equipamento_existente['descricao'];
        $equipamento->quantidade_estoque = $quantidade_estoque ?? $equipamento_existente['quantidade_estoque'];
        
        // Obter arquivo de imagem se fornecido
        $arquivo_imagem = isset($_FILES['file-equipamento']) ? $_FILES['file-equipamento'] : null;
        
        // Usar o método completo que gerencia upload de imagem e atualização
        $equipamento->alterarComImagem($arquivo_imagem, '../../upload/');

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Equipamento atualizado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(Exception $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Erro de conexão com o banco de dados.',
        ];
        echo json_encode($resposta);
    }