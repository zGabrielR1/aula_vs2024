<?php
    // Validação
    $nome           = $_POST['nome']            ?? null;
    $cpf            = $_POST['cpf']             ?? null;
    $data_nascimento = $_POST['data_nascimento'] ?? null;

    if ($nome == null || $cpf == null || $data_nascimento == null) {
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
        
        // Verificar se o CPF já existe
        $sql = 'SELECT id_colaborador FROM colaboradores WHERE cpf = ?';
        $parametros = [$cpf];
        $colaborador_existente = $banco->consultar($sql, $parametros);
        
        if ($colaborador_existente) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Este CPF já está cadastrado!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Inserir novo colaborador
        $sql = 'INSERT INTO colaboradores (nome, cpf, data_nascimento) VALUES (?, ?, ?)';
        $parametros = [
            $nome,
            $cpf,
            $data_nascimento
        ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Colaborador cadastrado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }