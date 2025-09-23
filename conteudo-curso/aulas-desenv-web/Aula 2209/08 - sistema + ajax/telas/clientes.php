<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Cadastro de <strong>Clientes</strong></h1>
</div>

<form id=form152 onsubmit="return false">
    <div class="row g-3">
        <div class="col-sm-3 mb-3">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-9 mb-3">
            <label for="txt-nome" class="form-label">Nome Completo</label>
            <input type="text" class="form-control" id="txt-nome" placeholder="Ex: João Silva" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label for="txt-cpf" class="form-label">CPF</label>
            <input type="text" class="form-control" id="txt-cpf" placeholder="123.456.789-10" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label for="date-nascimento" class="form-label">Nascimento</label>
            <input type="date" class="form-control" id="date-nascimento" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label class="form-label">Gênero</label>
            <div class="form-control border border-0">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="rbt-sexo" id="rbt-fem" value="f" checked>
                    <label class="form-check-label" for="rbt-fem">Feminino</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="rbt-sexo" id="rbt-masc" value="m">
                    <label class="form-check-label" for="rbt-masc">Masculino</label>
                </div>
            </div>
        </div>

        <div class="col-sm-8 mb-3">
            <label for="txt-cidade" class="form-label">Cidade</label>
            <input type="text" class="form-control" id="txt-cidade" placeholder="Ex: Concórdia" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label class="form-label">UF</label>
            <select class="form-select" id="list-uf">
                <option selected>Selecione a UF</option>
                <option value="AC">AC</option>
                <option value="AL">AL</option>
                <option value="AP">AP</option>
                <option value="AM">AM</option>
                <option value="BA">BA</option>
                <option value="CE">CE</option>
                <option value="DF">DF</option>
                <option value="ES">ES</option>
                <option value="GO">GO</option>
                <option value="MA">MA</option>
                <option value="MT">MT</option>
                <option value="MS">MS</option>
                <option value="MG">MG</option>
                <option value="PA">PA</option>
                <option value="PB">PB</option>
                <option value="PR">PR</option>
                <option value="PE">PE</option>
                <option value="PI">PI</option>
                <option value="RJ">RJ</option>
                <option value="RN">RN</option>
                <option value="RS">RS</option>
                <option value="RO">RO</option>
                <option value="RR">RR</option>
                <option value="SC">SC</option>
                <option value="SP">SP</option>
                <option value="SE">SE</option>
                <option value="TO">TO</option>
            </select>
        </div>

        <div class="col-sm-6">
            <button type="reset" class="btn btn-secondary btn-lg w-100">
                <i class="bi bi-x-lg"></i>&nbsp;
                Cancelar
            </button>
        </div>
        <div class="col-sm-6">
            <button onclick="salvarCliente()" class="btn btn-primary btn-lg w-100">
                <i class="bi bi-floppy-fill"></i>&nbsp;
                Salvar
            </button>
        </div>
    </div>
</form>

<hr class="my-4">

<div class="mt-5">
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">CPF</th>
                <th scope="col">Nascimento</th>
                <th scope="col">Sexo</th>
                <th scope="col">Cidade</th>
                <th scope="col">UF</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody id="tbody-clientes">
            <!-- Aqui vão ser impressos clientes via JS -->
        </tbody>
    </table>
</div>

<script>
    // Carregar a Página
    window.onload = function() {
        listarClientes();
    }

    // Salvar
    function salvarCliente() {
        var id          = document.getElementById('txt-id').value;
        var nome        = document.getElementById('txt-nome').value;
        var cpf         = document.getElementById('txt-cpf').value;
        var nascimento  = document.getElementById('date-nascimento').value;
        var sexo        = document.getElementById('rbt-fem').checked ? 'f' : 'm';
        var cidade      = document.getElementById('txt-cidade').value;
        var uf          = document.getElementById('list-uf').value;
        var destino = id === 'NOVO' ? 'src/cliente/inserir.php' : 'src/cliente/atualizar.php';

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
                    document.getElementById('form-cliente').reset();
                    listarClientes(); // Atualizar a listagem de clientes
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
                var tabelaClientes = document.getElementById('tbody-clientes');

                tabelaClientes.innerHTML = ''; // Limpar a tabela antes de imprimir os clientes
                var clientes = resposta['clientes'];
                clientes.forEach(function (cliente) {
                    // Cria as linhas da tabela
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
                            <button class='btn' onclick='editar(${cliente['id_cliente']})'>
                                <i class='bi bi-pencil-fill'></i>
                            </button>
                            <button class='btn' onclick='excluir(${cliente['id_cliente']})'>
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



    function excluir(id) {
        var confirmou = confirm('Deseja realmente excluir este cliente?');
        if (confirmou) {
            $.ajax({
                type: 'post',
                url: 'src/cliente/excluir.php'
                data: {
                    'id': idCliente,
                },  
                success: function(resposta) {
                    alert(resposta['mensagem']);

                    if (resposa['status'] === 'sucesso') {
                        listarClientes(); // Atualizar listagem de clientes
                    }
                },
                error: function(erro) {
                    alert('Ocorreu um erro na requisição: ' + erro);
                }
            });
        }
        }
    }

    function editarCliente(idCliente) {
        $.ajax({
            type: 'post',
            url: 'src/cliente/selecionarPorId.php'
            dataType: 'json',
            data: {
                id: idCliente
            },
            sucess: function(resposta) {
                var cliente = resposta['cliente'];
                document.getElementById('txt-id').value = cliente['id_cliente'];
                document.getElementById('txt-nome').value = cliente['nome'];
                document.getElementById('txt-cpf').value = cliente['cpf'];
                document.getElementById('date-nascimento').value = cliente['nascimento'];
                document.getElementById('txt-cidade').value = cliente['cidade'];
                document.getElementById('list-uf').value = cliente['uf'];
                if (cliente['sexo'] == 'f') {
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
</script>