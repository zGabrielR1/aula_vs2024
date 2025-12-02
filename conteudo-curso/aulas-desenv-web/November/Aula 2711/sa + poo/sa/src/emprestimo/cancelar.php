
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
    require_once '../class/Emprestimo.php';

    $emprestimo = new Emprestimo;
    $emprestimo->id = $id_emprestimo;
    
    $emprestimo->cancelar();
        
    $resposta = [
        'status'    => 'sucesso',
        'mensagem'  => 'Empréstimo devolvido com sucesso!'
    ];
    echo json_encode($resposta);