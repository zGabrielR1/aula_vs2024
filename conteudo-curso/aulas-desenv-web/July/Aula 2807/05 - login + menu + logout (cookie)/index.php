// https://drive.google.com/file/d/1fl5HZjm3Qk1jGAcz6RXFlPEZSurRblc6/view
// https://drive.google.com/file/d/1fvbNY8MwVxv7jR6Bd8xhcJyVZBUaP3Yy/view
<?php
    // Controle de sessão
    session_start();
    if (isset($_SESSION['logado'])) {
        header('location: sistema.php');
    }
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sistema de Cadastro</title>
</head>
<body>
    <form method="post" action="src/login.php">
        <label>Usuário: </label>
        <input type="text" name="txt-usuario" id="txt-usuario" required>

        <br>

        <label>Senha: </label>
        <input type="password" name="txt-senha" id="txt-senha" required>
        <button type="button" onclick="mostrarSenha()">Mostar</button>


        <br>

        <label for="check-lembrar">Lembrar-me</label>
        <input type="checkbox" name="check-lembrar" id="check-lembrar">

        <br>

        <button type="submit">Entrar</button>
    </form>
    <script>
        function mostrarSenha() {
            var input = document.getElementById('txt-senha');
            if (input.type === "password") {
                input.type = "text";
            } else {
                input.type = "password";
            }
        }
    </script>

    <?php
        // Cookies
        if (isset($_COOKIE['usuario']) && isset($_COOKIE['senha'])) {
            include 'src/config.php';
            $usuario = openssl_decrypt($_COOKIE['usuario'], CIFRA_CRYPT, KEY_CRYPT, 0, VI_CRYPT);
            $senha = openssl_decrypt($_COOKIE['senha'], CIFRA_CRYPT, KEY_CRYPT, 0, VI_CRYPT);
            echo "<script>
                document.getElementById('txt-usuario').value        = '$usuario';
                document.getElementById('txt-senha').value          = '$senha';
                document.getElementById('check-lembrar').checked    = true;
            </script>";
        }
    ?>
</body>
</html>