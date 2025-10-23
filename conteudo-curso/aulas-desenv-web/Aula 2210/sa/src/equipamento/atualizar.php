<?php
    // Validação
    $id                 = $_POST['id']                 ?? null;
    $descricao          = $_POST['descricao']          ?? null;
    $quantidade_estoque = $_POST['quantidade_estoque'] ?? 0;
    $codigo_barras      = $_POST['codigo_barras']      ?? null;

    if ($id == null || $descricao == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, informe todos os campos obrigatórios!'
        ];
        echo json_encode($resposta);
        exit;
    }

    // Enviar arquivo para o servidor (se fornecido)
    $nome_imagem = null;
    if (isset($_FILES['file-equipamento']) && $_FILES['file-equipamento']['size'] > 0) {
        $nome_imagem = uniqid() . '.jpg';
        $destino     = '../../upload/' . $nome_imagem;
        $origem      = $_FILES['file-equipamento']['tmp_name'];
        if (!move_uploaded_file($origem, $destino)) {
            $resposta = [
                'status'    => 'erro',
                'mensagem'  => 'Houve um problema para enviar a imagem do equipamento. Tente novamente.'
            ];
            echo json_encode($resposta);
            exit;
        }
    }

    try {
        // Banco de dados
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        // Verificar se o equipamento existe
        $sql = 'SELECT id_equipamento, foto FROM equipamentos WHERE id_equipamento = ?';
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
        
        // Usar a imagem existente se nenhuma nova foi enviada
        if ($nome_imagem === null) {
            $nome_imagem = $equipamento_existente['foto'];
        }
        
        // Atualizar equipamento
        $sql = 'UPDATE equipamentos SET descricao = ?, quantidade_estoque = ?, foto = ?, codigo_barras = ? WHERE id_equipamento = ?';
        $parametros = [
            $descricao,
            $quantidade_estoque,
            $nome_imagem,
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