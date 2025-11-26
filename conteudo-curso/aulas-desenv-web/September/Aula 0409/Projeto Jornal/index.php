<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal de Notícias - SENAI Concórdia</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .hero {
            padding: 100px 0;
            text-align: center;
        }
        .news-section {
            padding: 50px 0;
        }
        footer {
            background-color: #212529;
            color: #adb5bd;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Portal de Notícias</a>
            <form class="d-flex">
                <a href="login.php" class="btn btn-outline-light">Login</a>
            </form>
        </div>
    </nav>

    <!-- Hero -->
    <section class="hero bg-body">
        <div class="container">
            <h1 class="display-5 fw-bold">Bem-vindo ao Portal de notícias<br>do SENAI Concórdia.</h1>
            <p class="lead my-4">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                Donec purus augue, tristique in leo eget, gravida congue metus. 
                Mauris mattis suscipit tellus eu luctus. Duis id ante dictum, cursus justo sit amet, dapibus justo.
            </p>
            <div>
                <a href="#" class="btn btn-primary me-2">Botão 1</a>
                <a href="#" class="btn btn-secondary">Botão 2</a>
            </div>
        </div>
    </section>

    <!-- News Cards -->
    <section class="news-section">
        <div class="container">
            <div class="row g-4">
                <!-- Card 1 -->
                <div class="col-md-6">
                    <div class="card shadow-sm h-100">
                        <img src="assets/img/news1.jpg" class="card-img-top" alt="Notícia 1">
                        <div class="card-body">
                            <p class="card-text">
                                O Produto Interno Bruto (PIB) de Santa Catarina manteve a liderança de crescimento no Brasil, conforme os dados atualizados do segundo trimestre de 20[...]
                            </p>
                            <a href="#" class="btn btn-outline-primary btn-sm">Continuar lendo...</a>
                        </div>
                        <div class="card-footer text-muted small">
                            Publicado em: 04/09/2025 - 18:45
                        </div>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="col-md-6">
                    <div class="card shadow-sm h-100">
                        <img src="assets/img/news2.jpg" class="card-img-top" alt="Notícia 2">
                        <div class="card-body">
                            <p class="card-text">
                                A segurança escolar tem se tornado um dos temas mais urgentes no Brasil, diante de episódios recentes que expõem a vulnerabilidade de alunos, professor[...]
                            </p>
                            <a href="#" class="btn btn-outline-primary btn-sm">Continuar lendo...</a>
                        </div>
                        <div class="card-footer text-muted small">
                            Publicado em: 04/09/2025 - 18:45
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; Desenvolvimento de Sistemas.<br>Senai - 2023</p>
        </div>
    </footer>

    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
