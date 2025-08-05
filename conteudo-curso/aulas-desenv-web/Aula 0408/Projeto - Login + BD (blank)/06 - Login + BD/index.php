<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - EXEMPLO</title>
    <link href="assets/css/index.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" >

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
    <main class="form-signin w-100 m-auto">
        <form>
            <img class="mb-4" src="">
            <h1 class="h3 mb-3 fw-normal">Faça o login</h1>
            <div class="form-floating">
                <input type="text" class="form-control" name="txt_usuario" id="txt_usuario">
                <label for="txt_usuario">Usuário</label>
            </div>

            <div class="form-floating input-group mb-3">
                <input type="password" class="form-control" name="txt-senha" id="txt-senha">
                <label for="txt-senha">Senha</label>
                <button class="btn btn-outline-secondary" type="button" id="btn-password"><i class="bi bi-eye-fill"></i></button>
            </div>
            <div class="form-check text-start my-3">
                <input class="form-check-input" type="checkbox" value="true" name="check_lembrar" id="check_lembrar">
                <label class="form-check-label" for="check_lembrar">Manter-me conectado</label>
            </div>
            <button class="btn btn-primary w-100 py-2" type="submit">Entrar</button>
            <p class="mt-5 mb-3 text-body-secondary">&copy; 2024</p>
        </form>
    </main>

    <!-- JQuery -->
     <script src="vendor/jquery-3.7.1/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>