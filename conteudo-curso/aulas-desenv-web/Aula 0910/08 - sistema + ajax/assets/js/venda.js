
// Listar Clientes no Select
function listarClientesNaVenda() {
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: 'src/cliente/selecionarTodos.php',
        success: function(resposta) {
            var listaClientes = document.getElementById('list-cliente');
            listaClientes.innerHTML = '';

            var clientes = resposta['clientes'];
            var opcao = "<option value=''>Selecione o cliente...</option>";
            clientes.forEach(function(cliente) {
                opcao += `<option value='${cliente['id_cliente']}'>${cliente['nome']}</option>`;
            });
            listaClientes.innerHTML = opcao;
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição ' + erro);
        }
    });    
}

// Listar Produtos no Select
function listarProdutosNaVenda() {
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: 'src/produto/selecionarTodos.php',
        success: function(resposta) {
            var listaProdutos = document.getElementById('list-produto');
            listaProdutos.innerHTML = '';

            var produtos = resposta['produtos'];
            var opcao = "<option value=''>Selecione o produto...</option>";
            produtos.forEach(function(produto) {
                var precoBRL = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(produto['preco']);
                opcao += `<option value='${produto['id_produto']}|${produto['preco']}'>
                                ${produto['descricao']} | 
                                ${precoBRL} | 
                                ${produto['estoque']}
                            </option>`;
            });
            listaProdutos.innerHTML = opcao;
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição ' + erro);
        }
    });    
}

// Adicionar Produto
var produtos = [];
function adicionarProduto() {
    // Capturar os dados do produto
    var [id, descricao, preco] = document.getElementById('list-produto').value.split('|');
    var qtd = document.getElementById('txt-qtd').value;
    //Validar    
    if (id == null || preco == null || qtd == null) {
        alert('Existem campos vazios. Verifique!');
        return
    }
    // Validar se o produto já foi adicionado na venda
    produtos.forEach(function(produto) {
        if (produto['id'] == id) {
            alert('Produto já foi adicionado na venda!');
            return;
        }
    });
    if (validou) {
        return
    }

    var valorTotal = qtd * preco; // Calcula o valor total do produto

    // Salvar os dados do produto
    var produto = {
        'id': id,
        'descricao': descricao,
        'qtd': qtd,
        'valor': valorTotal,
    };

    //Add os produtos no array produtos
    produtos.push(produto);

    }
    // Limpar formulário
//    document.getElementById('form-venda').reset();
    document.getElementById('list-produto').value = null;

    // Imprimir os dados na tabela de produtos
    var tabelaProdutosVenda = document.getElementById('tabela-produtos-venda');
    tabelaProdutosVenda.innerHTML = '';

    produtos.forEachfunction(produto) {
        var precoBRL = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(produto['preco']);
        var valorBRL = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(produto['valor']);
        var linha = document.createElement('tr');
        linha.innerHTML = `
            <td>${produto['id']}</td>
            <td>${produto['descricao']}</td>
            <td>${produto['qtd']}</td>
            <td>:${produto['valor']}</td>
            <td>
                <button class='btn' onclick='removerProduto(${produto['id']})'>Excluir</button>
                    <i class='bi bi-trash-fill'></i>
            </td>
        `;
        tabelaProdutosVenda.appendChild(linha);
    }
    // var valorTotal = qtd * 

    // produtos.push();

}