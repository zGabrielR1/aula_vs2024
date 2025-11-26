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
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Verifica se é uma solicitação para limpar os registros
    if (isset($_POST['limpar_produtos'])) {
        unset($_SESSION['produtos']);
        $_SESSION['produtos'] = [];
    } 
    // Processa o cadastro de um novo produto
    else if (isset($_POST['txt-descricao'])) {
        // Obtém e sanitiza os dados do formulário
        $descricao = filter_input(INPUT_POST, 'txt-descricao', FILTER_SANITIZE_STRING);
        $preco_compra = filter_input(INPUT_POST, 'txt-preco-compra', FILTER_VALIDATE_FLOAT);
        $preco_venda = filter_input(INPUT_POST, 'txt-preco-venda', FILTER_VALIDATE_FLOAT);
        $quantidade = filter_input(INPUT_POST, 'txt-quantidade', FILTER_VALIDATE_INT);
        
        // Verifica se todos os campos são válidos
        if ($descricao && strlen($descricao) >= 3 && 
            $preco_compra > 0 && 
            $preco_venda > 0 && 
            $quantidade > 0) {
            
            // Adiciona o produto ao array na sessão
            $_SESSION['produtos'][] = [
                'descricao' => $descricao,
                'preco_compra' => number_format($preco_compra, 2, ',', '.'),
                'preco_venda' => number_format($preco_venda, 2, ',', '.'),
                'quantidade' => $quantidade
            ];
        }
        
        // Redireciona para evitar reenvio do formulário ao atualizar a página
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit();
    }
}

// Função para exibir a lista de produtos
function listarProdutos() {
    if (empty($_SESSION['produtos'])) {
        echo "<p>Nenhum produto cadastrado ainda.</p>";
    } else {
        echo "<table border='1' style='width:100%; border-collapse: collapse; margin-top: 10px;'>";
        echo "<tr style='background-color: #f2f2f2;'><th style='padding: 8px; text-align: left;'>Descrição</th><th style='padding: 8px; text-align: right;'>Preço Compra</th><th style='padding: 8px; text-align: right;'>Preço Venda</th><th style='padding: 8px; text-align: center;'>Quantidade</th></tr>";
        
        $i = 0;
        foreach ($_SESSION['produtos'] as $produto) {
            $bgColor = $i % 2 === 0 ? '#ffffff' : '#f9f9f9';
            echo "<tr style='background-color: $bgColor;'>";
            echo "<td style='padding: 8px;'>" . htmlspecialchars($produto['descricao']) . "</td>";
            echo "<td style='padding: 8px; text-align: right;'>R$ " . $produto['preco_compra'] . "</td>";
            echo "<td style='padding: 8px; text-align: right;'>R$ " . $produto['preco_venda'] . "</td>";
            echo "<td style='padding: 8px; text-align: center;'>" . $produto['quantidade'] . "</td>";
            echo "</tr>";
            $i++;
        }
        
        echo "</table>";
        echo "<form method='post' style='margin-top: 15px;'>";
        echo "<button type='submit' name='limpar_produtos' style='background-color: #f44336; color: white; padding: 8px 16px; text-decoration: none; border: none; border-radius: 4px; cursor: pointer;' onclick=\"return confirm('Tem certeza que deseja limpar todos os produtos?')\">Limpar Produtos</button>";
        echo "</form>";
    }
}

// Inclui o template da página
include '../telas/produtos.php';
?>