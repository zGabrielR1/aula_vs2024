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
        require_once '../class/Emprestimo.php';
        $emprestimo = new Emprestimo;
        
        // Configurar propriedades do empréstimo
        $emprestimo->id = $id_emprestimo;
        
        $emprestimo->devolver();

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Devolução registrada com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }