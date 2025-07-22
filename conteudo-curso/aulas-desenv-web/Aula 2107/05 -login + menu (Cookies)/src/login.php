<?php

    $usuario = isset($_POST['txt-usuario']) ? $_POST['txt-usuario'] : null; 
    $senha   = isset($_POST['txt-senha']) ? $_POST['txt-senha'] : null; 
    $lembrar = isset($_POST['chk-lembrar']) ? true                  : false;

    if ($usuario == null || $senha == null) {
        echo "<script>

            alert('Preencha todos os campos');
            window.history.back();
        </script>";
        exit;           // Encerra o script
    }

    // Login   
    if ($usuario == 'admin' && $senha == '123') {
        // Abrir sessão
        session_start();
        $_SESSION['logado'] = true;


        // Cookies
        if ($lembrar) {
            $configuracoes =
                'domain' => 'localhost:82',
                'path'   => '/',
                'expires' => time() + 60 * 60 * 24 * 30, // 30 dias
            ];
        }

        // Não vamos usar JS para redirecionar para o sistema, vamos usar uma função nativa do PHP
        header('location: sistema.php');
    } else {
        echo "<script>

            alert('Usuário ou senha incorretos!');
            window.history.back();
        </script>";
        exit;
    }