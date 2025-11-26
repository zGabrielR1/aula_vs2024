<?php
    // Validação
    $id = $_POST['id'] ?? null;
    
    if ($id == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'ID do equipamento não informado!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Verificar se o equipamento existe
        $sql = 'SELECT id_equipamento FROM equipamentos WHERE id_equipamento = ?';
        $parametros = [$id];
        $equipamento_existente = $banco->consultar($sql, $parametros);
        
        if (!$equipamento_existente) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Equipamento não encontrado!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Verificar se o equipamento tem empréstimos ativos
        $sql = 'SELECT COUNT(*) as total FROM emprestimos WHERE id_equipamento = ? AND status = "emprestado"';
        $emprestimos_ativos = $banco->consultar($sql, $parametros);
        
        if ($emprestimos_ativos['total'] > 0) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Não é possível excluir um equipamento com empréstimos ativos!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Obter informações do equipamento antes de excluí-lo
        $sql = 'SELECT foto FROM equipamentos WHERE id_equipamento = ?';
        $parametros = [$id];
        $equipamento = $banco->consultar($sql, $parametros);
        
        // Excluir equipamento
        $sql = 'DELETE FROM equipamentos WHERE id_equipamento = ?';
        $banco->executarComando($sql, $parametros);
        
        // Excluir arquivo de imagem, se existir
        if ($equipamento && $equipamento['foto']) {
            $caminho_imagem = '../../upload/' . $equipamento['foto'];
            if (file_exists($caminho_imagem)) {
                unlink($caminho_imagem);
            }
        }

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Equipamento excluído com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }