<?php
    include '../BancoDeDados.php';

    try {
        // Pegar os dados
        $descricao      =   isset($_POST['txt_descricao'])      ? $_POST['txt_descricao']    : '';
        $id_colaborador =   isset($_POST['list_colaborador'])   ? $_POST['list_colaborador'] : 0;
        $prioridade     =   isset($_POST['list_prioridade'])    ? $_POST['list_prioridade']  : '';
        
        // Banco de Dados
        $banco = new BancoDeDados();
        
        // Inserir tarefa como Pendente
        $sql = 'INSERT INTO tarefas (descricao, prioridade, situacao, id_colaborador) VALUES (?, ?, ?, ?)';
        $parametros = [
            $descricao,
            $prioridade,
            'Pendente',
            $id_colaborador
        ];
        $banco->executarComando($sql, $parametros);
        $resposta = [
            'success' => true,
            'message' => 'Tarefa cadastrada com sucesso!'
        ];
        echo json_encode($resposta);
    }  catch (PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }

