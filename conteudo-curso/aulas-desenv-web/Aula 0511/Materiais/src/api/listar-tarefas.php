<?php
    include '../BancoDeDados.php';

    try {
        // Banco de Dados
        $banco = new BancoDeDados();
        
        $sql = 'SELECT 
                    t.id_tarefa,
                    t.descricao,
                    t.prioridade,
                    t.situacao,
                    t.id_colaborador,
                    c.nome as nome_colaborador
                FROM tarefas t
                INNER JOIN colaboradores c ON t.id_colaborador = c.id_colaborador
                ORDER BY 
                    CASE 
                        WHEN t.situacao = "Pendente" AND t.prioridade = "Alta" THEN 1
                        WHEN t.situacao = "Pendente" AND t.prioridade = "Baixa" THEN 2
                        WHEN t.situacao = "Concluída" THEN 3
                        ELSE 4
                    END,
                    t.id_tarefa DESC';
        
        $tarefas = $banco->consultar($sql, [], true);
        $resposta = [
            'status'   => 'sucesso',
            'data' => $tarefas
        ];
        echo json_encode($resposta);
    } catch (PDOException $erro) {
        $resposta = [
            'status' => 'erro',
            'message' => 'Erro ao carregar tarefas: ' . $erro->getMessage()
        ];
        echo json_encode($resposta);
    }

