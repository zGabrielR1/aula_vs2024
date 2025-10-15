
// Listar Clientes no Select
function listarClientesNaVenda() {
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: 'src/colaborador/selecionarTodos.php',
        success: function(resposta) {
            var listarColaboradores = document.getElementById('list-cliente');
            listarColaboradores.innerHTML = '';

            var clientes = resposta['clientes'];
            var opcao = "<option value=''>Selecione o cliente...</option>";
            clientes.forEach(function(cliente) {
                opcao += `<option value='${cliente['id_cliente']}'>${cliente['nome']}</option>`;
            });
            listarColaboradores.innerHTML = opcao;
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição ' + erro);
        }
    });    
}

// Listar Produtos no Select
function listarItensNoEmprestimo() {
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: 'src/itens/selecionarTodos.php',
        success: function(resposta) {
            var listaItens = document.getElementById('list-produto');
            listaItens.innerHTML = '';

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
            listaItens.innerHTML = opcao;
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição ' + erro);
        }
    });    
}

// Adicionar Produto
var produtos = [];
var totalVenda = 0;
function adicionarItens() {
    // Pegar os dados do formulário
    var [id, descricao, marca, preco] = document.getElementById('list-item').value.split('|');
    var qtd = document.getElementById('txt-qtd').value;
    
    // Validar campos vazios
    if (id == null || descricao == null || marca == null || preco == null || qtd == '') {
        alert('Existem campos vazios. Verifique!');
        return;
    }

    // Validar se o produto já foi inserido na venda
    var validou = true;
    item.forEach(function(item) {
        if (item['id'] == id) {
            alert('Este item ja foi inserido na venda!');
            validou = false;
        }
    });

    if (!validou) {
        return
    }

    // Gerar o valor total
    var valorTotal = qtd * preco;

    // Salvar os dados do produto
    var item = {
        'id':        id,
        'descricao': descricao,
        'marca':     marca,
        'qtd':       qtd,
        'preco':     preco,
        'valor':     valorTotal,
    };

    // Incrementar valor total da venda
    totalVenda += valorTotal;

    // Adicionar os dados do produto no array produtos
    items.push(item);

    // Limpar formulario
    //document.getElementById('form-venda').reset(); não vai da pra usar, pq reseta o campo do cliente também
    document.getElementById('list-produto').value = '';
    document.getElementById('txt-qtd').value = null;

    // Imprimir os dados na tabela de produtos da venda
    imprimirItemNaTabela();
}

function removerItem(id) {
    // Decrementar o valor total
    var itemRemovido = itens.find(item => item.id === id);
    if (itemRemovido) {
        totalVenda -= itemRemovido.valor;
    }

    // Remover o produto do array
    itens = itens.filter(item => item.id != id);
    imprimirItemNaTabela();
}

function imprimirItemNaTabela() {
    console.log(totalVenda);
    // document.getElementById('txt-valor-total').value = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(isNaN(totalVenda) || totalVenda == null ? 0 : totalVenda);
    var tabelaItensVenda = document.getElementById('tbody-produtos-venda');
    tabelaProdutosVenda.innerHTML = ''; // Limpar a tabela antes de imprimir os produtos

    if (itens.length > 0) {
        itens.forEach(function(item) {
            var linha    = document.createElement('tr');
            var precoBRL = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(item['preco']);
            var valorBRL = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(item['valor']);
            linha.innerHTML = `
                <td>${item['id']}</td>
                <td>${item['descricao']}</td>
                <td>${item['marca']}</td>
                <td>${precoBRL}</td>
                <td>${item['qtd']}</td>
                <td>${valorBRL}</td>
                <td>
                    <button class='btn' onclick='removerItem(${item['id']})'>
                        <i class='bi bi-trash-fill'></i>
                    </button>
                </td>
            `;
            tabelaItensVenda.appendChild(linha);
        });
    } else {
        tabelaItensVenda.innerHTML = "<tr><td colspan='6' class='text-center'>Nenhum produto inserido.</td><tr>";
    }
}

// function salvarVenda() {
//     console.log(produtos);
// }