<?php
    // Validação
    $id_emprestimo = $_POST['id_emprestimo'] ?? null;
    
    if ($id_emprestimo == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'ID do empréstimo não informado!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Verificar se o empréstimo existe e está ativo
        $sql = 'SELECT id_emprestimo, id_equipamento, quantidade, status FROM emprestimos WHERE id_emprestimo = ?';
        $parametros = [$id_emprestimo];
        $emprestimo = $banco->consultar($sql, $parametros);
        
        if (!$emprestimo) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Empréstimo não encontrado!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        if ($emprestimo['status'] == 'devolvido') {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Este empréstimo já foi devolvido!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Iniciar transação
        $banco->iniciarTransacao();
        
        // Atualizar o status do empréstimo
        $sql = 'UPDATE emprestimos SET data_devolucao = NOW(), status = "devolvido" WHERE id_emprestimo = ?';
        $parametros = [$id_emprestimo];
        $banco->executarComando($sql, $parametros);
        
        // Atualizar o estoque do equipamento
        $sql = 'UPDATE equipamentos SET quantidade_estoque = quantidade_estoque + ? WHERE id_equipamento = ?';
        $parametros = [
            $emprestimo['quantidade'],
            $emprestimo['id_equipamento']
        ];
        $banco->executarComando($sql, $parametros);
        
        // Salvar transação
        $banco->salvarTransacao();

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Devolução registrada com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        // Reverter transação em caso de erro
        $banco->voltarTransacao();
        
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }