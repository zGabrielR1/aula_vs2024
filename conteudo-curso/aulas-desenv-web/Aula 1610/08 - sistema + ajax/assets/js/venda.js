
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
                opcao += `<option value='${produto['id_produto']}|${produto['descricao']}|${produto['preco']}'>
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
var totalVenda = 0;
var qtdTotal= 0;
function adicionarProduto() {
    // Pegar os dados do formulário
    var [id, descricao, preco] = document.getElementById('list-produto').value.split('|');
    var qtd = document.getElementById('txt-qtd').value;
    
    // Validar campos vazios
    if (id == null || preco == null || qtd == '') {
        alert('Existem campos vazios. Verifique!');
        return;
    }

    // Validar se o produto já foi inserido na venda
    var validou = true;
    produtos.forEach(function(produto) {
        if (produto['id'] == id) {
            alert('Este produto ja foi inserido na venda!');
            validou = false;
        }
    });

    if (!validou) {
        return
    }

    // Gerar o valor total
    var valorTotal = qtd * preco;

    // Salvar os dados do produto
    var produto = {
        'id':        id,
        'descricao': descricao,
        'qtd':       qtd,
        'preco':     preco,
        'valor':     valorTotal,
    };

    // Incrementar valor total da venda
    totalVenda += valorTotal;
    // totalVenda = totalVenda + valorTotal    
    // Incrementar a quantidade total da venda
    qtdTotal += Number(qtd);

    // console.log(qtdTotal)

    // Adicionar os dados do produto no array produtos
    produtos.push(produto);

    // Limpar formulario
    //document.getElementById('form-venda').reset(); não vai da pra usar, pq reseta o campo do cliente também
    document.getElementById('list-produto').value = '';
    document.getElementById('txt-qtd').value = null;

    // Imprimir os dados na tabela de produtos da venda
    imprimirProdutoNaTabela();
}

function removerProduto(id) {
    // Decrementar o valor total
    var produtoRemovido = produtos.find(produto => produto.id === id);
    if (produtoRemovido) {
        totalVenda -= produtoRemovido.valor;
        qtdTotal += produtoRemovido.qtd;
    }
    // Remover o produto do array
    produtos = produtos.filter(produto => produto.id != id);
    imprimirProdutoNaTabela();
}

function imprimirProdutoNaTabela() {
    document.getElementById('txt-valor-total').value = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(totalVenda); 
    var tabelaProdutosVenda = document.getElementById('tbody-produtos-venda');
    tabelaProdutosVenda.innerHTML = ''; // Limpar a tabela antes de imprimir os produtos

    if (produtos.length > 0) {
        produtos.forEach(function(produto) {
            var linha    = document.createElement('tr');
            var precoBRL = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(produto['preco']);
            var valorBRL = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(produto['valor']);
            linha.innerHTML = `
                <td>${produto['id']}</td>
                <td>${produto['descricao']}</td>
                <td>${precoBRL}</td>
                <td>${produto['qtd']}</td>
                <td>${valorBRL}</td>
                <td>
                    <button class='btn' onclick='removerProduto(${produto['id']})'>
                        <i class='bi bi-trash-fill'></i>
                    </button>
                </td>
            `;
            tabelaProdutosVenda.appendChild(linha);
        });
    } else {
        tabelaProdutosVenda.innerHTML = "<tr><td colspan='6' class='text-center'>Nenhum produto inserido.</td><tr>";
    }
}

function limparVenda() {
    // Limpar o formulário
    document.getElementById('form-venda').reset();

    // Limpar as variáveis
    totalVenda = 0;
    produtos = [];

    // Atualizar (limpar) os itens da venda na tabela
    imprimirProdutoNaTabela();
}

function cancelarVendda(id) {

    var confirmou = confirm('Tem certeza que deseja cancelar esta venda?');
    if (!confirmou) {
        return;
    }
    $.ajax({
        type: 'post',
        url: 'src/venda/cancelar.php',
        dataType: 'json',
        data: {
            'id': id
        },
        success: function(resposta) {
            console.log(resposta)
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição ' + erro);


    });
}

function salvarVenda() {
    // Pegar dados
    var idCliente = document.getElementById('list-cliente').value

    $.ajax({
        type: 'post',
        url: 'src/venda/inserir.php',
        dataType: 'json',
        data: {
            'id_cliente': idCliente,
            'total_venda': totalVenda,
            'qtd_total': qtdTotal,
            'produtos': produtos,
        },
        success: function(resposta) {
            alert(resposta['mensagem']);

            if (resposta['status'] === 'sucesso') {
                listarVendas();
                limparVenda();
            }
                    },
        error: function(erro) {
            alert('Ocorreu um erro na requisição ' + erro);
        }
    })

}

function listarVendas() {
    $.ajax ({
        type: 'post',
        url: 'src/venda/selecionar.php',
        dataType: 'json',
        sucess: function(resposta) {
                var tabelaVendas = document.getElementById('tbody-vendas');
                tabelaVendas.innerHTML = ''; // Limpar a tabela antes de imprimir os produtos

                var vendas = resposta['vendas'];
                vendas.forEach(function(venda) {
                var linha = document.createElement('tr');
                var dataHora = new Date(venda['data_hora'].replace(' ', 'T')).toLocaleString('pt-BR');
                var valorTotalBRL = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(produto['valor']);
                var cancelado = venda['cancelado'] == 0 ? 'Não' : 'Sim';
                linha.innerHTML = `
                    <td>${venda['id_venda']}</td>
                    <td>${data_hora}</td>
                    <td>${valortotalBRL}</td>
                    <td>${venda['nome']}</td>
                    <td>${cancelado}</td>
                    <td>
                        <button class='btn' onclick='editarProduto(${venda['id_venda']})'>
                            <i class='bi bi-x-circle-fill'></i>
                        </button>
                    </td>
                `;
                tabelaVendas.appendChild(linha);
            });
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição ' + erro);
        }
    }); 
}