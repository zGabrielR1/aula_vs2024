// Salvar
function salvarCliente() {
    var id          = document.getElementById('txt-id').value;
    var nome        = document.getElementById('txt-nome').value;
    var cpf         = document.getElementById('txt-cpf').value;
    var nascimento  = document.getElementById('date-nascimento').value;
    var sexo        = document.getElementById('rbt-fem').checked ? 'f' : 'm';
    var cidade      = document.getElementById('txt-cidade').value;
    var uf          = document.getElementById('list-uf').value;
    var destino     = id === 'NOVO' ? 'src/cliente/inserir.php' : 'src/cliente/atualizar.php';

    $.ajax({
        type: 'post',
        url: destino,
        dataType: 'json',
        data: {
            'id'        : id,
            'nome'      : nome,
            'cpf'       : cpf,
            'nascimento': nascimento,
            'sexo'      : sexo,
            'cidade'    : cidade,
            'uf'        : uf
        },
        success: function(resposta) {
            alert(resposta['mensagem']);

            if (resposta['status'] === 'sucesso') {
                document.getElementById('form-cliente').reset(); // Limpar formulário
                listarClientes();                                // Atualizar a listagem de clientes
            }
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Listar Cliente
function listarClientes() {
    $.ajax({
        type: 'post',
        url: 'src/cliente/selecionarTodos.php',
        dataType: 'json',
        success: function(resposta) {
            // Javascript para imprimir os dados da resposta dentro da tabela
            var tabelaClientes = document.getElementById('tbody-clientes');
            tabelaClientes.innerHTML = ''; // Limpar a tabela antes de imprimir os clientes

            var clientes = resposta['clientes'];
            clientes.forEach(function(cliente) {
                var linha = document.createElement('tr');
                linha.innerHTML = `
                    <td>${cliente['id_cliente']}</td>
                    <td>${cliente['nome']}</td>
                    <td>${cliente['cpf']}</td>
                    <td>${cliente['nascimento']}</td>
                    <td>${cliente['sexo']}</td>
                    <td>${cliente['cidade']}</td>
                    <td>${cliente['uf']}</td>
                    <td>
                        <button class='btn' onclick='editarCliente(${cliente['id_cliente']})'>
                            <i class='bi bi-pencil-fill'></i>
                        </button>

                        <button class='btn' onclick='excluirCliente(${cliente['id_cliente']})'>
                            <i class='bi bi-trash-fill'></i>
                        </button>
                    </td>
                `;
                tabelaClientes.appendChild(linha);
            });
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Excluir
function excluirCliente(idCliente) {
    var confirmou = confirm('Deseja realmente excluir este cliente?');
    if (confirmou) {
        $.ajax({
            type: 'post',
            url: 'src/cliente/excluir.php',
            dataType: 'json',
            data: {
                'id': idCliente,
            },
            success: function(resposta) {
                alert(resposta['mensagem']);

                if (resposta['status'] === 'sucesso') {
                    listarClientes(); // Atualizar a listagem de clientes
                }
            },
            error: function(erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }
}

// Editar
function editarCliente(idCliente) {
    $.ajax({
        type: 'post',
        url: 'src/cliente/selecionarPorId.php',
        dataType: 'json',
        data: {
            'id': idCliente,
        },
        success: function(resposta) {
            if (resposta['status'] === 'sucesso') {
                var cliente = resposta['cliente'];
                document.getElementById('txt-id').value             = cliente['id_cliente'];
                document.getElementById('txt-nome').value           = cliente['nome'];
                document.getElementById('txt-cpf').value            = cliente['cpf'];
                document.getElementById('date-nascimento').value    = cliente['nascimento'];
                document.getElementById('txt-cidade').value         = cliente['cidade'];
                document.getElementById('list-uf').value            = cliente['uf'];
                if (cliente['sexo'] === 'f') {
                    document.getElementById('rbt-fem').checked = true;
                } else {
                    document.getElementById('rbt-masc').checked = true;
                }
            } else {
                alert(resposta['mensagem']);
            }
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}