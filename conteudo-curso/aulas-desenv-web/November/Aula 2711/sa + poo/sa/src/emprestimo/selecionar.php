<?php
    try {
        require_once '../class/Emprestimo.php';
        $emprestimo = new Emprestimo;
        $emprestimos = $emprestimo->selecionar();

        $resposta = [
            'status'        => 'sucesso',
            'emprestimos'   => $emprestimos,
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }