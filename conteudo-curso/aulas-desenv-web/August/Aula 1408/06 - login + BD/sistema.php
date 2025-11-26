<?php
    // Controle de Sessão
    session_start();
    if (!isset($_SESSION['logado'])) {
        header('location: index.php');
    }
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema - EXEMPLO</title>
    <link href="assets/css/sistema.css" rel="stylesheet">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
<body>
    <header class="navbar sticky-top bg-dark flex-md-nowrap p-0 shadow" data-bs-theme="dark">
        <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6 text-white" href="#">TEItech</a>
        <ul class="navbar-nav flex-row d-md-none">
            <li class="nav-item text-nowrap">
                <button class="nav-link px-3 text-white" type="button" data-bs-toggle="offcanvas"
                    data-bs-target="#sidebarMenu">
                    <svg class="bi">
                        <use xlink:href="#list">
                    </svg>
                </button>
            </li>
        </ul>
    </header>
    <div class="container-fluid">
        <div class="row">
            <div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
                <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="">TEItech</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#sidebarMenu"></button>
                    </div>
                    <div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center gap-2" href="sistema.php">
                                    <i class="bi bi-house-fill"></i>
                                    Home
                                </a>
                            </li>
                            <?php
                                if ($_SESSION['tipo'] === 'a') {
                                    echo "<li class='nav-item'>
                                        <a class='nav-link d-flex align-items-center gap-2 active' href='sistema.php?tela=clientes'>
                                            <i class='bi bi-people-fill'></i>
                                            Clientes
                                        </a>
                                    </li>
                                    <li class='nav-item'>
                                        <a class='nav-link d-flex align-items-center gap-2' href='sistema.php?tela=produtos'>
                                            <i class='bi bi-box-fill'></i>
                                            Produtos
                                        </a>
                                    </li>";
                                }
                            ?>
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center gap-2" href="sistema.php?tela=vendas">
                                    <i class="bi bi-cash-coin"></i>
                                    Vendas
                                </a>
                            </li>
                        </ul>
                        <hr class="my-3">
                        <ul class="nav flex-column mb-auto">
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center gap-2" href="#" onclick="logout()">
                                    <i class="bi bi-door-open-fill"></i>
                                    Sair
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <?php
                    $tela = isset($_GET['tela']) ? $_GET['tela'] : null;
                    
                    switch ($tela) {
                        case 'clientes':
                            include 'telas/clientes.php';
                            break;
                        case 'produtos':
                            include 'telas/produtos.php';
                            break;
                        case 'vendas':
                            include 'telas/vendas.php';
                            break;
                        default:
                            echo "<h1 class='h2'>Bem-vindo {$_SESSION['nome']}!</h1>";
                            break;
                    }
                ?>
            </main>
        </div>
    </div>

    <!-- JQuery -->
    <script src="vendor/jquery-3.7.1/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function logout() {
            var confirmou = confirm('Tem certeza que deseja sair?');
            if (confirmou) {
                window.location.href = 'src/logout.php';
            }
        }
    </script>
</body>
</html>