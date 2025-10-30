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
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Verificar se o colaborador existe
        $sql = 'SELECT id_colaborador FROM colaboradores WHERE id_colaborador = ?';
        $parametros = [$id_colaborador];
        $colaborador_existente = $banco->consultar($sql, $parametros);
        
        if (!$colaborador_existente) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Colaborador não encontrado!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Verificar se o equipamento existe e tem estoque suficiente
        $sql = 'SELECT id_equipamento, quantidade_estoque FROM equipamentos WHERE id_equipamento = ?';
        $parametros = [$id_equipamento];
        $equipamento = $banco->consultar($sql, $parametros);
        
        if (!$equipamento) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Equipamento não encontrado!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        if ($equipamento['quantidade_estoque'] < $quantidade) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Quantidade solicitada maior que o estoque disponível!'
            ];
            echo json_encode($resposta);
            exit;
        }
        if ($quantidade <= 0) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Quantidade deve ser maior que zero!'
            ];
            echo json_encode($resposta);
            exit;

        }
        
        // Iniciar transação
        $banco->iniciarTransacao();
        
        // Registrar o empréstimo
        $sql = 'INSERT INTO emprestimos (data_retirada, id_colaborador, id_equipamento, quantidade) VALUES (NOW(), ?, ?, ?)';
        $parametros = [
            $id_colaborador,
            $id_equipamento,
            $quantidade
        ];
        $banco->executarComando($sql, $parametros);
        
        // Atualizar o estoque do equipamento
        $sql = 'UPDATE equipamentos SET quantidade_estoque = quantidade_estoque - ? WHERE id_equipamento = ?';
        $parametros = [
            $quantidade,
            $id_equipamento
        ];
        $banco->executarComando($sql, $parametros);
        
        // Salvar transação
        $banco->salvarTransacao();

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Empréstimo registrado com sucesso!'
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