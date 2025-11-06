<?php
    // Include
    include 'BancoDeDados.php';

    // Pegar os dados
    $id_tarefa = $_GET['id'];

    // Excluir
    $banco = new BancoDeDados;
    $sql = 'DELETE FROM tarefas WHERE id_tarefa = ?';
    $parametros = [ $id_tarefa ];
    $banco->executarComando($sql, $parametros);
    
    // Alerta e retorno para a página inicial
    echo "<script>
            alert('Tarefa removida!'); 
            window.location.href = '../index.php'
        </script>";