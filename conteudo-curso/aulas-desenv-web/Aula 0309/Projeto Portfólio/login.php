<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN - PORTFÓLIO DE PRODUTOS</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
<main class="form-signin w-100 m-auto">
    <form method="post" action="">
        <h1 class="h3 mb-3 fw-normal">Login:</h1>
        <div class="form-floating">
            <input type="email" class="form-control" id="txt_email" name="txt_email" required>
            <label for="txt_email">Email</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="txt_senha" name="txt_senha" required>
            <label for="txt_senha">Senha</label>
        </div>
        <button class="btn btn-primary w-100 py-2" type="submit">Entrar</button>
    </form>
</main>
</body>
</html>