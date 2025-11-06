<?php
    // Include
    include 'BancoDeDados.php';

    // Fuso
    date_default_timezone_set('America/Sao_Paulo');

    // Pegar os dados
    $id_tarefa  = $_POST['txt_id'];
    $descricao  = $_POST['txt_descricao'];
    $setor      = $_POST['txt_setor'];
    $prioridade = $_POST['list_prioridade'];
    $data_atual = date('Y-m-d H:i:s');
    $situacao   = 'A Fazer';
    $id_usuario = $_POST['list_usuario'];



    if (in_array(null, [$form['descricao'], $form['prioridade'], $form['id_colaborador']])) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Existem dados faltando. Verifique!',
        ];
        echo json_encode($resposta);
        exit;
    }

    
    // Alerta e retorno para a página de cadastro
    echo "<script>
            alert('{$mensagem}'); 
            window.location.href = '../cad-tarefas.php'
        </script>";

   try {

    // Banco de Dados
    $banco = new BancoDeDados;
        // Verificar se deve inserir ou atualizar
        if ($id_tarefa == 'Novo') {
            // Inserir
            $sql = 'INSERT INTO tarefas (descricao, setor, prioridade, data_cadastro, situacao, id_usuario) VALUES (?,?,?,?,?,?)';
            $parametros = [
                $descricao,
                $setor,
                $prioridade,
                $data_atual,
                $situacao,
                $id_usuario,
            ];
            $mensagem = 'Tarefa cadastrada!';
            // Executar
        $banco->executarComando($sql, $parametros);
        } else {
            // Atualizar
            $sql = 'UPDATE tarefas SET descricao = ?, setor = ?, prioridade = ?, id_usuario = ? WHERE id_tarefa = ?';
            $parametros = [
                $descricao,
                $setor,
                $prioridade,
                $id_usuario,
                $id_tarefa
            ];
            $mensagem = 'Tarefa alterada!';
            // Executar
        $banco->executarComando($sql, $parametros);
        }

   } catch (PDOException $erro) {
        $resposta = [
            'status'   => 'erro',
            'mensagem' => $erro->getMessage(),
        ];
        echo json_encode($resposta);
   }