<?php
    // Validação
    $id = $_POST['id'] ?? null;
    
    if ($id == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'ID do colaborador não informado!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Verificar se o colaborador existe
        $sql = 'SELECT id_colaborador FROM colaboradores WHERE id_colaborador = ?';
        $parametros = [$id];
        $colaborador_existente = $banco->consultar($sql, $parametros);
        
        if (!$colaborador_existente) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Colaborador não encontrado!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Verificar se o colaborador tem empréstimos ativos
        $sql = 'SELECT COUNT(*) as total FROM emprestimos WHERE id_colaborador = ? AND status = "emprestado"';
        $emprestimos_ativos = $banco->consultar($sql, $parametros);
        
        if ($emprestimos_ativos['total'] > 0) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Não é possível excluir um colaborador com empréstimos ativos!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Excluir colaborador
        $sql = 'DELETE FROM colaboradores WHERE id_colaborador = ?';
        $parametros = [$id];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Colaborador excluído com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }