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
                <button class="nav-link px-3 text-white" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebarMenu">
                    <a class="text-white" href="#list">
                        <i class="bi bi-list"></i>
                    </a>
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
                                <a class="nav-link d-flex align-items-center gap-2">
                                    <i class="bi bi-house-fill"></i>
                                    Home
                                </a>
                            </li>
                            <li class="nav-item">
                                <button class="nav-link d-flex align-items-center gap-2 active" onclick="carregarTela('clientes')">
                                    <i class="bi bi-people-fill"></i>
                                    Clientes
                                </button>
                            </li>
                            <li class="nav-item">
                                <button class="nav-link d-flex align-items-center gap-2" onclick="carregarTela('produtos')">
                                    <i class="bi bi-box-fill"></i>
                                    Produtos
                                </button>
                            </li>
                            <li class="nav-item">
                                <button class="nav-link d-flex align-items-center gap-2" onclick="carregarTela('vendas')">
                                    <i class="bi bi-cash-coin"></i>
                                    Vendas
                                </button>
                            </li>
                        </ul>
                        <hr class="my-3">
                        <ul class="nav flex-column mb-auto">
                            <li class="nav-item">
                                <a class="nav-link d-flex align-items-center gap-2" href="" onclick="logout()">
                                    <i class="bi bi-door-open-fill"></i>
                                    Sair
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <main id="main" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <!-- Conteúdo que será injetado -->
            </main>
        </div>
    </div>

    <!-- JQuery -->
    <script src="vendor/jquery-3.7.1/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Importar JS de cada tela -->
    <script src="assets/js/cliente.js"></script>
    <script src="assets/js/produto.js"></script>
    <script src="assets/js/venda.js"></script>
    <script src="assets/js/comum.js"></script>

    <script>
        // Carregar Telas
        function carregarTela(tela) {
            $.ajax({
                type: 'post',
                url: 'telas/' + tela + '.php',
                dataType: 'html',
                success: function(resposta) {
                    var elemento = document.getElementById('main');
                    elemento.innerHTML = resposta;

                    switch (tela) {
                        case 'clientes':
                            listarClientes();
                            break;
                        case 'produtos':
                            listarProdutos();
                            break;
                        case 'vendas':
                            listarClientesNaVenda();
                            listarProdutosNaVenda();
                            listarVendas();
                            break;
                    }
                },
                error: function(erro) {
                    alert('Houve um erro na requisição ' + erro);
                }
            });
        }

        // Sair
        function logout() {
            var confirmou = confirm('Tem certeza que deseja sair?');
            if (confirmou) {
                $.ajax({
                    type: 'get',
                    url: 'src/usuario/logout.php',
                    success: function() {
                        window.location.href = 'index.php';
                    },
                    error: function(erro) {
                        alert('Houve um erro na requisição ' + erro);
                    }
                });
            }
        }
    </script>
</body>
</html>