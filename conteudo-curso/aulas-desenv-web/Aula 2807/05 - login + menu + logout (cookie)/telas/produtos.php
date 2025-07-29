<div>
    <h1>Cadastro de Produtos</h1>
    
    <form method="post" action="src/produtos.php">
        <div>
            <label>Descrição: </label>
            <input type="text" name="txt-descricao" id="txt-descricao" required minlength="3">
        </div>
        
        <br>
        
        <div>
            <label>Preço de Compra: R$ </label>
            <input type="number" name="txt-preco-compra" id="txt-preco-compra" required min="0.01" step="0.01">
        </div>
        
        <br>
        
        <div>
            <label>Preço de Venda: R$ </label>
            <input type="number" name="txt-preco-venda" id="txt-preco-venda" required min="0.01" step="0.01">
        </div>
        
        <br>
        
        <div>
            <label>Quantidade em Estoque: </label>
            <input type="number" name="txt-quantidade" id="txt-quantidade" required min="1" step="1">
        </div>
        
        <br>
        
        <button type="submit">Salvar</button>
    </form>
    
    <div style="margin-top: 20px;">
        <h2>Produtos Cadastrados</h2>
        <?php 
        if (function_exists('listarProdutos')) { 
            listarProdutos(); 
        } 
        ?>
    </div>
</div>

<script>
// Formata os valores monetários para aceitar apenas números e ponto decimal
document.getElementById('txt-preco-compra').addEventListener('input', function(e) {
    this.value = this.value.replace(/[^0-9.]/g, '');
    
    // Garante que não há múltiplos pontos decimais
    if ((this.value.match(/\./g) || []).length > 1) {
        this.value = this.value.slice(0, -1);
    }
});

document.getElementById('txt-preco-venda').addEventListener('input', function(e) {
    this.value = this.value.replace(/[^0-9.]/g, '');
    
    // Garante que não há múltiplos pontos decimais
    if ((this.value.match(/\./g) || []).length > 1) {
        this.value = this.value.slice(0, -1);
    }
});

// Formata a quantidade para aceitar apenas números
document.getElementById('txt-quantidade').addEventListener('input', function(e) {
    this.value = this.value.replace(/\D/g, '');
});
</script>
