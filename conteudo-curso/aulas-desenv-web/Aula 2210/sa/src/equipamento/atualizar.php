<?php
    // Validação
    $id                 = $_POST['id']                 ?? null;
    $descricao          = $_POST['descricao']          ?? null;
    $quantidade_estoque = $_POST['quantidade_estoque'] ?? 0;
    $foto               = $_POST['foto']               ?? null;
    $codigo_barras      = $_POST['codigo_barras']      ?? null;

    if ($id == null || $descricao == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, informe todos os campos obrigatórios!'
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
        
        // Atualizar equipamento
        $sql = 'UPDATE equipamentos SET descricao = ?, quantidade_estoque = ?, foto = ?, codigo_barras = ? WHERE id_equipamento = ?';
        $parametros = [
            $descricao,
            $quantidade_estoque,
            $foto,
            $codigo_barras,
            $id
        ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Equipamento atualizado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }