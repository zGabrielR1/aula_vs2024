<?php
    header('Content-Type: application/json');
    
    // Include
    include 'BancoDeDados.php';
    
    // Validação de dados (com operação de coalescência)
    $form['descricao']   = $_POST['txt-descricao']       ?? null;
    $form['prioridade']  = $_POST['list-prioridade']    ?? null;
    $form['id_colaborador'] = $_POST['list-colaborador'] ?? null;
    
    if (in_array(null, [$form['descricao'], $form['prioridade'], $form['id_colaborador']])) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Existem dados faltando. Verifique!',
        ];
        echo json_encode($resposta);
        exit;
    }
    
    // Banco de Dados
    try {
        $banco = new BancoDeDados;
        
        // Inserir
        $sql = 'INSERT INTO tarefas (descricao, prioridade, situacao, id_colaborador) VALUES (?,?,?,?)';
        $parametros = [
            $form['descricao'],
            $form['prioridade'],
            'Pendente',
            $form['id_colaborador'],
        ];
        
        $banco->executarComando($sql, $parametros);
        
        $resposta = [
            'status'   => 'sucesso',
            'mensagem' => 'Tarefa cadastrada!',
        ];
        echo json_encode($resposta);
    } catch (PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }
    
?>