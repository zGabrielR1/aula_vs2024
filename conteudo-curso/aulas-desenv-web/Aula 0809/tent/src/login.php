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

    try {
        // Banco de dados
        require_once 'class/BancoDeDados.php';
        $banco = new BancoDeDados;
        $sql = 'SELECT id_usuario, nome, tipo
                FROM usuarios 
                WHERE usuario = ? AND senha = ?';
        $parametros = [
            $usuario,
            $senha,
        ];
        $dados_usuario = $banco->consultar($sql, $parametros);

        // Login
        if ($dados_usuario) {
            session_start();
            $_SESSION['logado']     = true;
            $_SESSION['id_usuario'] = $dados_usuario['id_usuario'];
            $_SESSION['nome']       = $dados_usuario['nome'];
            $_SESSION['tipo']       = $dados_usuario['tipo'];

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

