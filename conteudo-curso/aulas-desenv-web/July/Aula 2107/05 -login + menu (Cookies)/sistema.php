<?php

   // Controle de sessão
   session_start();
   if (!isset($_SESSION['logado'])){
       header("location: index.php");
   }

?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Início - Sistema de Cadastro</title>
</head>
<body>

    <!-- Menu -->
    <h1>Bem  vindo ao sistema</h1>
    <nav>
        <ul>
            <li <a href="sistema.php">Início</li>
            <li><a href="sistema.php?tela=clientes">Clientes</a></li>
            <li><a href="sistema.php?tela=produtos">Produtos</a></li>
            <li><a href="sistema.php?tela=vendas">Vendas</a></li>
            <li><button onclick = "sair()">Sair</button></li>
        </ul>
    </nav>

    <!-- Conteúdo Principal -->
    <main>
        <?php
                $tela = isset($_GET['tela']) ? $_GET['tela'] : null; 
                switch($tela){
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
                        include "telas/inicio.php";
                        break;
                }
        ?>
    </main>
    <!-- JS -->
    <script>
        function sair() {
            var confirmou = confirm('Deseja realmente sair?');
            if (confirmou) {
                window.location.href = 'logout.php';
            }
        }
</body>
</html>