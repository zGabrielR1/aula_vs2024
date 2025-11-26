<?php
    // Validação
    $usuario    = isset($_POST['txt-usuario'])      ? $_POST['txt-usuario']     : null;
    $senha      = isset($_POST['txt-senha'])        ? $_POST['txt-senha']       : null;
    $lembrar    = isset($_POST['check-lembrar'])    ? true                      : false;
    if ($usuario == null || $senha == null) {
        echo "<script>
            alert('Por favor, preencha todos os campos!');
            window.history.back();
        </script>";
        exit; // Encerra o script
    }

    // aqui a gente usa um array associativo pros logins
    $logins = array(
        'teilor.g' => '123!@#',
        'monica.p' => 'hjnaotemaula',
        'cicero.n' => 'botafogo100titulo',
    );
    
    // aqui a gente pega os dados do formulario
    $usuario = isset($_POST['txt-usuario']) ? $_POST['txt-usuario'] : '';
    $senha = isset($_POST['txt-senha']) ? $_POST['txt-senha'] : '';

    // Login
    if ($logins[$usuario] == $senha) {
        // Abrir sessão
        session_start();
        $_SESSION['logado'] = true;

        // Cookies
        if ($lembrar) {
            // Encriptar os dados
            include 'config.php';
            $senha_crypt = openssl_encrypt($senha, CIFRA_CRYPT, KEY_CRYPT, 0, VI_CRYPT);
            $usuario_crypt = openssl_encrypt($usuario, CIFRA_CRYPT, KEY_CRYPT, 0, VI_CRYPT);

            // Cria os cookies
            date_default_timezone_set('America/Sao_Paulo'); // Definir fuso horário
            $configuracoes = [
                'expires' => time() + 60*60*24,
                'path'    => '/',
                'domain'  => 'localhost',
            ];
            setcookie('usuario', $usuario_crypt, $configuracoes);
            setcookie('senha', $senha_crypt, $configuracoes);
        } else {
            // Remover cookies
            $configuracoes = [
                'expires' => time() - 60*60*24,
                'path'    => '/',
                'domain'  => 'localhost',
            ];
            setcookie('usuario', null, $configuracoes);
            setcookie('senha', null, $configuracoes);
        }

        // Não vamos usar JS para redirecionar para o sistema
        // Vamos usar uma função nativa PHP
        header('location: ../sistema.php');
    } else {
        echo "<script>
            alert('Usuário ou senha incorretos!');
            window.history.back();
        </script>";
    }
