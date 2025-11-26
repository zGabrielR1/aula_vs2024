<?php
session_start();
if (!isset($_SESSION['usuario'])) {
    header('Location: index.php');
    exit();
}
$usuario = $_SESSION['usuario'];
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Gestão de Estoque</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Gestão de Estoque</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="carregarConteudo('telas/produtos.php')">Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="carregarConteudo('telas/estoque.php')">Gestão de Estoque</a>
                    </li>
                </ul>
                <span class="navbar-text me-3">
                    Olá, <?php echo htmlspecialchars($usuario['nome']); ?>
                </span>
                <a href="src/logout.php" class="btn btn-outline-light">Sair</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div id="conteudo">
            <!-- O conteúdo será carregado aqui -->
            <h1>Bem-vindo ao Sistema de Gestão de Estoque</h1>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        function carregarConteudo(pagina) {
            $.ajax({
                url: pagina,
                type: 'GET',
                success: function(data) {
                    $('#conteudo').html(data);
                },
                error: function() {
                    $('#conteudo').html('<h1>Erro ao carregar o conteúdo.</h1>');
                }
            });
        }
        // Carregar a página de produtos por padrão ao entrar no sistema
        $(document).ready(function(){
            carregarConteudo('telas/produtos.php');
        });
    </script>
</body>
</html>
