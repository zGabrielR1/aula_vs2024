<?php
    // Include
    include 'BancoDeDados.php';

    // Pegar os dados
    $nome   = $_POST['txt_nome'];
    $email  = $_POST['txt_email'];

    // Inserir no Banco
    $banco = new BancoDeDados;
    $sql = 'INSERT INTO usuarios (nome, email) VALUES (?,?)';
    $parametros = [
        $nome,
        $email
    ];
    $banco->executarComando($sql, $parametros);
    
    // Alerta e retorno para a página de cadastro
    echo "<script>
            alert('Usuário cadastrado!'); 
            window.location.href = '../cad-usuarios.php'
        </script>";