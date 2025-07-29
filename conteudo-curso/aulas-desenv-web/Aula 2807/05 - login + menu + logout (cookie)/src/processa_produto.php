<?php
// Inicia a sessão se ainda não estiver iniciada
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Inicializa o array de produtos na sessão se não existir
if (!isset($_SESSION['produtos'])) {
    $_SESSION['produtos'] = [];
}

// Processa o formulário quando enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['salvar_produto'])) {
    // Obtém e sanitiza os dados do formulário
    $descricao = filter_input(INPUT_POST, 'txt-descricao', FILTER_SANITIZE_STRING);
    $preco_compra = filter_input(INPUT_POST, 'txt-preco-compra', FILTER_VALIDATE_FLOAT, [
        'options' => ['min_range' => 0.01]
    ]);
    $preco_venda = filter_input(INPUT_POST, 'txt-preco-venda', FILTER_VALIDATE_FLOAT, [
        'options' => ['min_range' => 0.01]
    ]);
    $quantidade = filter_input(INPUT_POST, 'txt-quantidade', FILTER_VALIDATE_INT, [
        'options' => ['min_range' => 1]
    ]);
    
    // Verifica se todos os campos são válidos
    if ($descricao !== false && $preco_compra !== false && $preco_venda !== false && $quantidade !== false) {
        // Formata os valores monetários
        $preco_compra_formatado = number_format($preco_compra, 2, ',', '.');
        $preco_venda_formatado = number_format($preco_venda, 2, ',', '.');
        
        // Cria o array com os dados do produto
        $produto = [
            'descricao' => $descricao,
            'preco_compra' => $preco_compra_formatado,
            'preco_venda' => $preco_venda_formatado,
            'quantidade' => $quantidade
        ];
        
        // Adiciona o produto ao array na sessão
        $_SESSION['produtos'][] = $produto;
    }
    
    // Redireciona para evitar reenvio do formulário
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit();
}

// Se tentar acessar diretamente, redireciona para a página inicial
header('Location: ../sistema.php');
exit();
