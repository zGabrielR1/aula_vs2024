<?php
    // Validação
    $email   = isset($_POST['txt-email'])      ? $_POST['txt-email']     : null;
    $senha      = isset($_POST['txt-senha'])        ? $_POST['txt-senha']       : null;
    if ($email == null || $senha == null) {
        echo "<script>
            alert('Por favor, preencha todos os campos!');
            window.history.back();
        </script>";
        exit; // Encerra o script
    }

    try {
        // Banco de dados
        require_once 'class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT id_usuario, nome
                FROM usuarios 
                WHERE email = ? AND senha = ?';
        $parametros = [
            $email,
            $senha,
        ];
        $dados_usuario = $banco->consultar($sql, $parametros);

        // Login
        if ($dados_usuario) {
            session_start();
            $_SESSION['logado']     = true;
            $_SESSION['id_usuario'] = $dados_usuario['id_usuario'];
            $_SESSION['nome']       = $dados_usuario['nome'];

            header('location: ../sistema.php');
        } else {
            echo "<script>
                alert('Usuário ou senha inválidos!');
                window.history.back();
            </script>";
        }
    } catch(PDOException $erro) {
        $msg = $erro->getMessage();
        echo "<script>
            alert(\"$msg\");
            window.history.back();
        </script>";
    }

