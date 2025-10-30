<?php
    // Validação
    $id            = $_POST['id']            ?? null;
    $codigo_barras = $_POST['codigo_barras'] ?? null;

    if ($id == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, informe o ID do equipamento!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Verificar se o equipamento existe
        $sql = 'SELECT id_equipamento FROM equipamentos WHERE id_equipamento = ?';
        $parametros = [$id];
        $equipamento_existente = $banco->consultar($sql, $parametros);
        
        if (!$equipamento_existente) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Equipamento não encontrado!'
            ];
            echo json_encode($resposta);
            exit;
        }
        
        // Atualizar apenas o código de barras do equipamento
        $sql = 'UPDATE equipamentos SET codigo_barras = ? WHERE id_equipamento = ?';
        $parametros = [
            $codigo_barras,
            $id
        ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Código de barras atualizado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }