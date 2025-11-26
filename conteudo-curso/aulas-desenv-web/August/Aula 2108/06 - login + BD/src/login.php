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

    // Conectar ao banco
    $conexao = new PDO('mysql:host=localhost;port=3307;dbname=db_exemplo', 'root', 'masterkey');

    // Definir o comando
    $sql = 'SELECT id_usuario, nome, tipo
            FROM usuarios 
            WHERE usuario = ? AND senha = ?';
    $stmt = $conexao->prepare($sql);

    // Executar o comando
    $stmt->execute([$usuario, $senha]);
    $dados_usuario = $stmt->fetch(PDO::FETCH_ASSOC);

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
