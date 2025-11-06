<?php
    // Include
    include 'BancoDeDados.php';

    // Pegar os dados
    $id_tarefa  = $_POST['txt_id'];
    $situacao   = $_POST['list_situacao'];

    // Atualizar
    $banco = new BancoDeDados;
    $sql = 'UPDATE tarefas SET situacao = ? WHERE id_tarefa = ?';
    $parametros = [
        $situacao,
        $id_tarefa 
    ];
    $banco->executarComando($sql, $parametros);
    
    // Alerta e retorno para a página inicial
    echo "<script>
            alert('Status alterado!'); 
            window.location.href = '../index.php'
        </script>";