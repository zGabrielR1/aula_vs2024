<?php
    // Validação
    $id_colaborador  = $_POST['id_colaborador']  ?? null;
    $id_equipamento  = $_POST['id_equipamento']  ?? null;
    $quantidade      = $_POST['quantidade']       ?? null;

    if ($id_colaborador == null || $id_equipamento == null || $quantidade == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, preencha todos os campos!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        require_once '../class/Emprestimo.php';
        $emprestimo = new Emprestimo;
        
        // Configurar propriedades do empréstimo
        $emprestimo->id_colaborador = $id_colaborador;
        $emprestimo->id_equipamento = $id_equipamento;
        $emprestimo->quantidade = $quantidade;
        $emprestimo->data_devolucao = null; // Será preenchida na devolução
        
        // Usar o método completo que gerencia validações e transações
        $emprestimo->inserir();

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Empréstimo registrado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }