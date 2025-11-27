
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
        
        
        $emprestimo->cancelar();
        
        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Empréstimo cancelado com sucesso!'
        ];
        echo json_encode($resposta);
    }