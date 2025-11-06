<?php
    header('Content-Type: application/json');
    
    include 'BancoDeDados.php';
    
    try {
        $banco = new BancoDeDados;
        
        // Ordenar por prioridade
        $sql = "SELECT t.id_tarefa, t.descricao, t.prioridade, t.situacao, c.nome as responsavel 
                FROM tarefas t 
                JOIN colaboradores c ON t.id_colaborador = c.id_colaborador 
                ORDER BY 
                    CASE t.situacao 
                        WHEN 'Pendente' THEN 1 
                        ELSE 2 
                    END,
                    CASE WHEN t.situacao = 'Pendente' THEN
                        CASE t.prioridade
                            WHEN 'Alta' THEN 1
                            ELSE 2
                        END
                    ELSE 0 END";
                    
        $tarefas = $banco->consultar($sql, [], true);
        
        echo json_encode($tarefas);
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode(['error' => $e->getMessage()]);
    }
?>