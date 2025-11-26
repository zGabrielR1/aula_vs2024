<?php
    // Validação
    $id = $_GET['id'] ?? null;
    
    if (!$id) {
        echo "<script>
            alert('ID da venda inválida!');
            window.history.back();
        </script>";
        exit;
    }

    // Atualizar no banco
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'UPDATE vendas SET cancelado = 1 WHERE id_venda = ?';
        $parametros = [ $id ];
        $banco->executarComando($sql, $parametros);

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Venda cancelada com sucesso!'
        ];

        echo json_encode($resposta);    // Imprimindo o Json para o cliente
        exit;                           // Encerra o script
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
         echo json_encode($resposta);  // Imprimindo o Json para o cliente
    }