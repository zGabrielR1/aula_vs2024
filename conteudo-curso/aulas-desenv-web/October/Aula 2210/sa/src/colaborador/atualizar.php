<?php
    // Validação
    $id             = $_POST['id']              ?? null;
    $nome           = $_POST['nome']            ?? null;
    $cpf            = $_POST['cpf']             ?? null;
    $data_nascimento = $_POST['data_nascimento'] ?? null;

    if ($id == null || $nome == null || $cpf == null || $data_nascimento == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, preencha todos os campos!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Verificar se o CPF já existe (exceto para o próprio colaborador)
        $sql = 'SELECT id_colaborador FROM colaboradores WHERE cpf = ? AND id_colaborador != ?';
        $parametros = [$cpf, $id];
        $colaborador_existente = $banco->consultar($sql, $parametros);
        
        if ($colaborador_existente) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Este CPF já está cadastrado para outro colaborador!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Atualizar colaborador
        $sql = 'UPDATE colaboradores SET nome = ?, cpf = ?, data_nascimento = ? WHERE id_colaborador = ?';
        $parametros = [
            $nome,
            $cpf,
            $data_nascimento,
            $id
        ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Colaborador atualizado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }