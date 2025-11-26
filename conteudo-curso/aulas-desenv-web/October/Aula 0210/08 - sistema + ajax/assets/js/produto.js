// Salvar
    function salvarProduto() {
        var destino    = document.getElementById('txt-id').value === 'NOVO' 
                            ? 'src/produto/inserir.php' 
                            : 'src/produto/atualizar.php';
        var formulario = new FormData(document.getElementById('form-produto'));

        $.ajax({
            type: 'post',
            url: destino,
            dataType: 'json',
            processData: false,
            contentType: false,
            data: formulario ,
            success: function(resposta) {
                alert(resposta['mensagem']);

                if (resposta['status'] === 'sucesso') {
                    document.getElementById('form-produto').reset(); // Limpar formulário
                    listarProdutos();                                // Atualizar a listagem de produtos
                }
            },
            error: function(erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }

    // Listar Produto
    function listarProdutos() {
        $.ajax({
            type: 'post',
            url: 'src/produto/selecionarTodos.php',
            dataType: 'json',
            success: function(resposta) {
                // Javascript para imprimir os dados da resposta dentro da tabela
                var tabelaProdutos = document.getElementById('tbody-produtos');
                tabelaProdutos.innerHTML = ''; // Limpar a tabela antes de imprimir os produtos

                var produtos = resposta['produtos'];
                produtos.forEach(function(produto) {
                    var linha = document.createElement('tr');
                    linha.innerHTML = `
                        <td>${produto['id_produto']}</td>
                        <td>${produto['descricao']}</td>
                        <td>${produto['preco']}</td>
                        <td>${produto['estoque']}</td>
                        <td>
                            <button class='btn' onclick='editarProduto(${produto['id_produto']})'>
                                <i class='bi bi-pencil-fill'></i>
                            </button>

                            <button class='btn' onclick='excluirProduto(${produto['id_produto']})'>
                                <i class='bi bi-trash-fill'></i>
                            </button>
                        </td>
                    `;
                    tabelaProdutos.appendChild(linha);
                });
            },
            error: function(erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }

    // Excluir
    function excluirProduto(idProduto) {
        var confirmou = confirm('Deseja realmente excluir este produto?');
        if (confirmou) {
            $.ajax({
                type: 'post',
                url: 'src/produto/excluir.php',
                dataType: 'json',
                data: {
                    'id': idProduto,
                },
                success: function(resposta) {
                    alert(resposta['mensagem']);

                    if (resposta['status'] === 'sucesso') {
                        listarProdutos(); // Atualizar a listagem de produtos
                    }
                },
                error: function(erro) {
                    alert('Ocorreu um erro na requisição: ' + erro);
                }
            });
        }
    }

    // Editar
    function editarProduto(idProduto) {
        $.ajax({
            type: 'post',
            url: 'src/produto/selecionarPorId.php',
            dataType: 'json',
            data: {
                'id': idProduto,
            },
            success: function(resposta) {
                if (resposta['status'] === 'sucesso') {
                    var produto = resposta['produto'];
                    document.getElementById('txt-id').value        = produto['id_produto'];
                    document.getElementById('txt-descricao').value = produto['descricao'];
                    document.getElementById('txt-preco').value     = produto['preco'];
                    document.getElementById('txt-estoque').value   = produto['estoque'];
                } else {
                    alert(resposta['mensagem']);
                }
            },
            error: function(erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }