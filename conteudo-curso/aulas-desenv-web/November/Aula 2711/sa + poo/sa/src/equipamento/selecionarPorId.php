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
        require_once '../class/Equipamento.php';
        $equipamento = new Equipamento;
        $equipamento->id = $id;
        $dados = $equipamento->selecionarPorId();

        if ($dados) {
            $resposta = [
                'status'        => 'sucesso',
                'equipamento'   => $dados,
            ];
        } else {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Equipamento não encontrado!'
            ];
        }
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }