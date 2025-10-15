// Salvar
    function salvarProduto() {
        var destino    = document.getElementById('txt-id').value === 'NOVO' 
                            ? 'src/item/inserir.php' 
                            : 'src/item/atualizar.php';
        var formulario = new FormData(document.getElementById('form-item'));

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
                    document.getElementById('form-item').reset(); // Limpar Formulário
                    listarItens();                                // Atualizar a listagem de produtos
                }
            },
            error: function(erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }

    // Listar Itens
    function listarItens() {
        $.ajax({
            type: 'post',
            url: 'src/itens/selecionarTodos.php',
            dataType: 'json',
            success: function(resposta) {
                // Javascript para imprimir os dados da resposta dentro da tabela
                var tabelaItens = document.getElementById('tbody-itens');
                tabelaItens.innerHTML = ''; // Limpar a tabela antes de imprimir os produtos

                var itens = resposta['itens'];
                itens.forEach(function(item) {
                    var linha = document.createElement('tr');
                    linha.innerHTML = `
                        <td>${item['id_item']}</td>
                        <td>${item['descricao']}</td>
                        <td>${item['marca']}</td>
                        <td>${item['preco']}</td>
                        <td>${item['estoque']}</td>
                        <td>
                            <button class='btn' onclick='editarProduto(${item['id_item']})'>
                                <i class='bi bi-pencil-fill'></i>
                            </button>

                            <button class='btn' onclick='excluirProduto(${item['id_item']})'>
                                <i class='bi bi-trash-fill'></i>
                            </button>
                        </td>
                    `;
                    tabelaItens.appendChild(linha);
                });
            },
            error: function(erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }

    // Excluir
    function excluirItem(idItem) {
        var confirmou = confirm('Deseja realmente excluir este Item?');
        if (confirmou) {
            $.ajax({
                type: 'post',
                url: 'src/item/excluir.php',
                dataType: 'json',
                data: {
                    'id': id_item
                },
                success: function(resposta) {
                    alert(resposta['mensagem']);

                    if (resposta['status'] === 'sucesso') {
                        listarItens(); // Atualizar a listagem de itens
                    }
                },
                error: function(erro) {
                    alert('Ocorreu um erro na requisição: ' + erro);
                }
            });
        }
    }

    // Editar
    function editarItem(idItem) {
        $.ajax({
            type: 'post',
            url: 'src/item/selecionarPorId.php',
            dataType: 'json',
            data: {
                'id': idItem,
            },
            success: function(resposta) {
                if (resposta['status'] === 'sucesso') {
                    var item = resposta['item'];
                    document.getElementById('txt-id').value        = item['id_item'];
                    document.getElementById('txt-descricao').value = item['descricao'];
                    document.getElementById('txt-marca').value     = item['marca'];
                    document.getElementById('txt-preco').value     = item['preco'];
                    document.getElementById('txt-estoque').value   = item['estoque'];
                } else {
                    alert(resposta['mensagem']);
                }
            },
            error: function(erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }