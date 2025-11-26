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
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT id_colaborador, nome, cpf, data_nascimento FROM colaboradores WHERE id_colaborador = ?';
        $parametros = [$id];
        $colaborador = $banco->consultar($sql, $parametros);

        if ($colaborador) {
            $resposta = [
                'status'        => 'sucesso',
                'colaborador'   => $colaborador,
            ];
        } else {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Colaborador não encontrado!'
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