<?php
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT 
                    e.id_emprestimo,
                    e.data_retirada,
                    e.data_devolucao,
                    e.quantidade,
                    e.status,
                    c.nome as nome_colaborador,
                    c.cpf,
                    eq.descricao as descricao_equipamento
                FROM emprestimos e
                INNER JOIN colaboradores c ON e.id_colaborador = c.id_colaborador
                INNER JOIN equipamentos eq ON e.id_equipamento = eq.id_equipamento
                ORDER BY e.data_retirada DESC';
        $emprestimos = $banco->consultar($sql, null, true);

        $resposta = [
            'status'        => 'sucesso',
            'emprestimos'   => $emprestimos,
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage()
        ];
        echo json_encode($resposta);
    }