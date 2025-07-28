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
    // Verifica se é uma solicitação para limpar os produtos
    if (isset($_POST['limpar_produtos'])) {
        unset($_SESSION['produtos']);
        $_SESSION['produtos'] = [];
    } 
    // Processa o cadastro de um novo produto
    else if (isset($_POST['txt-descricao'])) {
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
    }
    
    // Redireciona para evitar reenvio do formulário ao atualizar a página
    header('Location: ' . str_replace('src/', '', $_SERVER['PHP_SELF']));
    exit();
}

// Exibe a tabela de produtos cadastrados
function exibirTabelaProdutos() {
    if (empty($_SESSION['produtos'])) {
        echo "<p>Nenhum produto cadastrado ainda.</p>";
    } else {
        echo '<table border="1">';
        echo '<thead>';
        echo '<tr>';
        echo '<th>Descrição</th>';
        echo '<th>Preço de Compra (R$)</th>';
        echo '<th>Preço de Venda (R$)</th>';
        echo '<th>Quantidade em Estoque</th>';
        echo '</tr>';
        echo '</thead>';
        echo '<tbody>';
        
        foreach ($_SESSION['produtos'] as $produto) {
            echo '<tr>';
            echo '<td>' . htmlspecialchars($produto['descricao']) . '</td>';
            echo '<td style="text-align: right;">' . $produto['preco_compra'] . '</td>';
            echo '<td style="text-align: right;">' . $produto['preco_venda'] . '</td>';
            echo '<td style="text-align: center;">' . $produto['quantidade'] . '</td>';
            echo '</tr>';
        }
        
        echo '</tbody>';
        echo '</table>';
        
        // Botão para limpar produtos
        echo '<br>';
        echo '<form method="post" onsubmit="return confirm(\'Tem certeza que deseja limpar todos os produtos?\');">';
        echo '<button type="submit" name="limpar_produtos">Limpar Produtos</button>';
        echo '</form>';
    }
}
?>

<!-- Inclui o formulário de cadastro -->
<?php include '../telas/produtos.php'; ?>

<script>
// Atualiza a tabela de produtos dinamicamente
document.addEventListener('DOMContentLoaded', function() {
    // Encontra o container da tabela e atualiza com o conteúdo gerado pelo PHP
    var container = document.getElementById('tabela-produtos');
    if (container) {
        container.innerHTML = `<?php ob_start(); exibirTabelaProdutos(); $output = ob_get_clean(); echo addslashes(str_replace(["\r\n", "\r", "\n"], "", $output)); ?>`;
    }
});
</script>