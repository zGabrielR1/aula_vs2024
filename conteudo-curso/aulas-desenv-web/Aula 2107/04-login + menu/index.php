<?php
   // Controle de sessão
   session_start();
   if (!isset($_SESSION['logado'])){
       header("location: sistema.php");
   }
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sistema de cadastros</title>
</head>
<body>
    <form method="post" action="src/login.php">
        <label>Usuário: </label>
        <input type="text" name="txt-usuario" required>

        <br>

        <label>Senha: </label>
        <input type="password" name="txt-senha" required>

        <br>

        <label for="check-lembrar">Lembrar-me</Label>
        <input type="checkbox" name="chech-lembrar" id="check-lembrar">

        <br> 

        <button type="submit">Entrar</button>
    </form>
</body>
</html>