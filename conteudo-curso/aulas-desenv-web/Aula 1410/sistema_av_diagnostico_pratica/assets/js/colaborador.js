// Salvar
function salvarColaborador() {
    var id          = document.getElementById('txt-id').value;
    var nome        = document.getElementById('txt-nome').value;
    var cpf         = document.getElementById('txt-cpf').value;
    var nascimento  = document.getElementById('date-nascimento').value;
    var sexo        = document.getElementById('rbt-fem').checked ? 'f' : 'm';
    var email       = document.getElementById('txt-email').value;
    var telefone    = document.getElementById('txt-telefone').value;
    var destino     = id === 'NOVO' ? 'src/colaborador/inserir.php' : 'src/colaborador/atualizar.php';

    $.ajax({
        type: 'post',
        url: destino,
        dataType: 'json',
        data: {
            'id'        : id,
            'nome'      : nome,
            'cpf'       : cpf,
            'email'     : email,
            'telefone'  : telefone,
            'nascimento': nascimento,
            'sexo'      : sexo,
        },
        success: function(resposta) {
            alert(resposta['mensagem']);

            if (resposta['status'] === 'sucesso') {
                document.getElementById('form-colaborador').reset(); // Limpar formulário
                listarColaboradores();                                // Atualizar a listagem de colaboradores
            }
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Listar Cliente
function listarColaboradores() {
    $.ajax({
        type: 'post',
        url: 'src/colaborador/selecionarTodos.php',
        dataType: 'json',
        success: function(resposta) {
            // Javascript para imprimir os dados da resposta dentro da tabela
            var tabelaColaboradores = document.getElementById('tbody-colaboradores');
            tabelaColaboradores.innerHTML = ''; // Limpar a tabela antes de imprimir os clientes

            var colaborador = resposta['colaboradores'];
            colaborador.forEach(function(colaborador) {
                var linha = document.createElement('tr');
                linha.innerHTML = `
                    <td>${colaborador['id_colaborador']}</td>
                    <td>${colaborador['nome']}</td>
                    <td>${colaborador['cpf']}</td>
                    <td>${colaborador['nascimento']}</td>
                    <td>${colaborador['sexo']}</td>
                    <td>${colaborador['cidade']}</td>
                    <td>${colaborador['uf']}</td>
                    <td>
                        <button class='btn' onclick='editarColaborador(${colaborador['id_colaborador']})'>
                            <i class='bi bi-pencil-fill'></i>
                        </button>

                        <button class='btn' onclick='excluirColaborador(${colaborador['id_colaborador']})'>
                            <i class='bi bi-trash-fill'></i>
                        </button>
                    </td>
                `;
                tabelaColaboradores.appendChild(linha);
            });
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Excluir
function excluirColaborador(idColaborador) {
    var confirmou = confirm('Deseja realmente excluir este colaborador?');
    if (confirmou) {
        $.ajax({
            type: 'post',
            url: 'src/colaborador/excluir.php',
            dataType: 'json',
            data: {
                'id': idColaborador,
            },
            success: function(resposta) {
                alert(resposta['mensagem']);

                if (resposta['status'] === 'sucesso') {
                    listarColaboradores(); // Atualizar a listagem de colaboradores
                }
            },
            error: function(erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }
}

// Editar
function editarColaborador(idColaborador) {
    $.ajax({
        type: 'post',
        url: 'src/colaborador/selecionarPorId.php',
        dataType: 'json',
        data: {
            'id': idColaborador,
        },
        success: function(resposta) {
            if (resposta['status'] === 'sucesso') {
                var colaborador = resposta['colaborador'];
                document.getElementById('txt-id').value             = colaborador['id_colaborador'];
                document.getElementById('txt-nome').value           = colaborador['nome'];
                document.getElementById('txt-email').value          = colaborador['email'];
                document.getElementById('txt-telefone').value       = colaborador['telefone'];
                document.getElementById('txt-cpf').value            = colaborador['cpf'];
                document.getElementById('date-nascimento').value    = colaborador['nascimento'];
                if (colaborador['sexo'] === 'f') {
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