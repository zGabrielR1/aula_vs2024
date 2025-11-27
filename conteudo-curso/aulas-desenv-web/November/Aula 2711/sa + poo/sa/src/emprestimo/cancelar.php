
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

    // Banco de dados
    require_once '../class/Venda.php';

    $emprestimo = new Venda;
    $emprestimo->id = $id_emprestimo;
    
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
                'mensagem'  => 'Não é possível cancelar um empréstimo já devolvido!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Iniciar transação
        $banco->iniciarTransacao();
        
        // Atualizar o status do empréstimo para cancelado
        $sql = 'UPDATE emprestimos SET status = "devolvido", data_devolucao = NOW() WHERE id_emprestimo = ?';
        $parametros = [$id_emprestimo];
        $banco->executarComando($sql, $parametros);
        
        // Atualizar o estoque do equipamento (devolver a quantidade emprestada)
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
            'mensagem'  => 'Empréstimo cancelado com sucesso!'
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