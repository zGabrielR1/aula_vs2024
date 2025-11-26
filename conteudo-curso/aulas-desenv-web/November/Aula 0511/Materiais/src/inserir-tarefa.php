<?php
    // Include
    include 'BancoDeDados.php';

    // Pegar os dados
    $descricao  = $_POST['txt-descricao'] ?? '';
    $prioridade = $_POST['list-prioridade'] ?? '';
    $id_colaborador = $_POST['list-colaborador'] ?? '';
    $situacao   = 'Pendente';

    // Validar campos
    if (empty($descricao) || empty($prioridade) || empty($id_colaborador)) {
        $resposta = [
            'success' => false,
            'message' => 'Existem dados faltando. Verifique!',
        ];
        echo json_encode($resposta);
        exit;
    }
    
    try {
        // Banco de Dados
        $banco = new BancoDeDados;
        
        // Inserir
        $sql = 'INSERT INTO tarefas (descricao, prioridade, situacao, id_colaborador) VALUES (?,?,?,?)';
        $parametros = [
            $descricao,
            $prioridade,
            $situacao,
            $id_colaborador,
        ];
        
        $banco->executarComando($sql, $parametros);
        
        $resposta = [
            'success' => true,
            'message' => 'Tarefa cadastrada!',
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