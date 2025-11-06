<?php
    header('Content-Type: application/json');
    
    include 'BancoDeDados.php';

    // Pegar os dados
    $id_tarefa  = $_POST['id_tarefa'] ?? null;
    $situacao   = $_POST['situacao'] ?? null;

    // Validar dados
    if (!$id_tarefa || !$situacao) {
        echo json_encode([
            'status' => 'erro',
            'mensagem' => 'Dados incompletos para atualização.'
        ]);
        exit;
    }

    try {
        // Atualizar
        $banco = new BancoDeDados;
        $sql = 'UPDATE tarefas SET situacao = ? WHERE id_tarefa = ?';
        $parametros = [
            $situacao,
            $id_tarefa 
        ];
        $banco->executarComando($sql, $parametros);
        
        echo json_encode([
            'status' => 'sucesso',
            'mensagem' => 'Status atualizado com sucesso!'
        ]);
    } catch (PDOException $e) {
        echo json_encode([
            'status' => 'erro',
            'mensagem' => $e->getMessage()
        ]);
    }
?>