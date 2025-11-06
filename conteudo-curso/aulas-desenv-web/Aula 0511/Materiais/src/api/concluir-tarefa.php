<?php
    // Include
    include '../BancoDeDados.php';

    try {
        // Verificar se é POST
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            throw new Exception('Método não permitido');
        }

        $id_tarefa = isset($_POST['id_tarefa']) ? $_POST['id_tarefa'] : 0;
        
        // Banco de Dados
        $banco = new BancoDeDados();
        
        // Atualizar situação para Concluída
        $sql = 'UPDATE tarefas SET situacao = ? WHERE id_tarefa = ?';
        $parametros = [
            'Concluída',
            $id_tarefa
        ];
        
        $banco->executarComando($sql, $parametros);
        $resposta = [
            'status'   => 'sucesso',
            'mensagem' => 'Tarefa concluída com sucesso!'
        ];
        echo json_encode($resposta);
    } catch (PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }

