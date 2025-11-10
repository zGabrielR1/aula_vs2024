<?php
    // Include
    include 'BancoDeDados.php';

    // Pegar os dados
    $id_tarefa = $_POST['id_tarefa'] ?? '';
    $situacao = $_POST['situacao'] ?? '';

    // Validar campos
    if (empty($id_tarefa) || empty($situacao)) {
        $resposta = [
            'success' => false,
            'message' => 'Dados incompletos para atualizar o status!',
        ];
        echo json_encode($resposta);
        exit;
    }
    
    try {
        // Banco de Dados
        $banco = new BancoDeDados;
        
        // Atualizar status
        $sql = 'UPDATE tarefas SET situacao = ? WHERE id_tarefa = ?';
        $parametros = [
            $situacao,
            $id_tarefa
        ];
        
        $banco->executarComando($sql, $parametros);
        
        $resposta = [
            'success' => true,
            'message' => 'Status da tarefa atualizado!',
        ];
        echo json_encode($resposta);
    } catch (Exception $erro) {
        $resposta = [
            'success' => false,
            'message' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }
?>