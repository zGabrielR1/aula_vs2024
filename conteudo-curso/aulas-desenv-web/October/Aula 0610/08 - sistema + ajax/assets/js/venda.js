function listarClientesnaVenda() {
    $.ajax({
        type: 'post',
        dataType: 'json', 
        urL: 'src/cliente/selecionarTodos.php',
        sucess: function(resposta) {
            var listaClientes = document.getElementById('list-clientes');
            listaClientes.innerHTML = '';

            var clientes = resposta['clientes'];
            var opcao = "<option value=''>Selecione um cliente...</option>";
            clientes.forEach(function(cliente) {
                opcao += `<option value='${cliente['id']}'>${cliente['nome']}</option>`;
                listaClientes.innerHTML = opcao;
            });
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }

    });
}

function listarProdutosnaVenda() {
    $.ajax({
        type: 'post',
        dataType: 'json', 
        url: 'src/produto/selecionarTodos.php',
        sucess: function(resposta) {
            var listaProdutos = document.getElementById('list-clientes');
            listaProdutos.innerHTML = '';

            var produtos = resposta['produtos'];
            var opcao = "<option value=''>Selecione um produto  ...</option>";

            produtos.forEach(function(produto) {
                var precoBRL = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL'}).format(produto['preco']);
                opcao += `<option value='${produto['id_produto']}|${produto['preco']}'>
                    ${produto['descricao']}
                    ${precoBRL} |
                    ${produto['estoque']}
                </option>`;
                listaProdutos.innerHTML = opcao;
            });
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }

    });
}

// Adicionar Produto
var produtos = [];
function adicionarProduto() {
    var produto = document.getElementById('list-produto').value;
    var qtd = document.getElementById('txt-qtd').value;

    if (produto == null || qtd == null) {
        alert('Existem campos vazios. Verifique!');
        return;
    }

    var valorTotal = 

    produtos.push();

}