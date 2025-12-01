// Registrar Empréstimo
function registrarEmprestimo() {
    var id = document.getElementById('txt-id').value;
    var id_colaborador = document.getElementById('select-colaborador').value;
    var id_equipamento = document.getElementById('select-equipamento').value;
    var quantidade = document.getElementById('txt-quantidade').value;

    if (id_colaborador === '' || id_equipamento === '' || quantidade === '') {
        alert('Por favor, preencha todos os campos!');
        return;
    }

    if (id !== 'NOVO') {
        alert('Não é possível editar um empréstimo. Para correções, cancele e registre um novo.');
        return;
    }

    $.ajax({
        type: 'post',
        url: 'src/emprestimo/inserir.php',
        dataType: 'json',
        data: {
            'id_colaborador': id_colaborador,
            'id_equipamento': id_equipamento,
            'quantidade': quantidade
        },
        success: function (resposta) {
            alert(resposta['mensagem']);

            if (resposta['status'] === 'sucesso') {
                document.getElementById('form-emprestimo').reset(); // Limpar formulário
                document.getElementById('txt-id').value = 'NOVO'; // Resetar ID
                listarEmprestimos();                                // Atualizar a listagem de empréstimos
                listarColaboradoresNaEmprestimo();                  // Atualizar seleção de colaboradores
                listarEquipamentosNaEmprestimo();                   // Atualizar seleção de equipamentos
            }
        },
        error: function (erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Listar Empréstimos
function listarEmprestimos() {
    $.ajax({
        type: 'post',
        url: 'src/emprestimo/selecionar.php',
        dataType: 'json',
        success: function (resposta) {
            // Javascript para imprimir os dados da resposta dentro da tabela
            var tabelaEmprestimos = document.getElementById('tbody-emprestimos');
            tabelaEmprestimos.innerHTML = ''; // Limpar a tabela antes de imprimir os empréstimos

            var emprestimos = resposta['emprestimos'];
            emprestimos.forEach(function (emprestimo) {
                var statusHtml = emprestimo['status'] === 'emprestado' ?
                    '<span class="badge bg-warning">Emprestado</span>' :
                    '<span class="badge bg-success">Devolvido</span>';

                var dataDevolucaoHtml = emprestimo['data_devolucao'] ?
                    emprestimo['data_devolucao'] :
                    '-';

                var acoesHtml = emprestimo['status'] === 'emprestado' ?
                    `<button class='btn btn-sm btn-success' onclick='devolverEmprestimo(${emprestimo['id_emprestimo']})'>
                        <i class='bi bi-arrow-down-circle-fill'></i> Devolver
                    </button>
                    <button class='btn btn-sm btn-danger' onclick='cancelarEmprestimo(${emprestimo['id_emprestimo']})'>
                        <i class='bi bi-x-circle-fill'></i> Cancelar
                    </button>` :
                    '-';

                var linha = document.createElement('tr');
                linha.innerHTML = `
                    <td>${emprestimo['id_emprestimo']}</td>
                    <td>${emprestimo['data_retirada']}</td>
                    <td>${dataDevolucaoHtml}</td>
                    <td>${emprestimo['nome_colaborador']} (${emprestimo['cpf']})</td>
                    <td>${emprestimo['descricao_equipamento']}</td>
                    <td>${emprestimo['quantidade']}</td>
                    <td>${statusHtml}</td>
                    <td>${acoesHtml}</td>
                `;
                tabelaEmprestimos.appendChild(linha);
            });
        },
        error: function (erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Devolver
function devolverEmprestimo(idEmprestimo) {
    var confirmou = confirm('Deseja realmente registrar a devolução deste empréstimo?');
    if (confirmou) {
        $.ajax({
            type: 'post',
            url: 'src/emprestimo/devolver.php',
            dataType: 'json',
            data: {
                'id_emprestimo': idEmprestimo,
            },
            success: function (resposta) {
                alert(resposta['mensagem']);

                if (resposta['status'] === 'sucesso') {
                    listarEmprestimos(); // Atualizar a listagem de empréstimos
                    listarColaboradoresNaEmprestimo(); // Atualizar seleção de colaboradores
                    listarEquipamentosNaEmprestimo();  // Atualizar seleção de equipamentos
                }
            },
            error: function (erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }
}

// Cancelar
function cancelarEmprestimo(idEmprestimo) {
    var confirmou = confirm('Deseja realmente cancelar este empréstimo?');
    if (confirmou) {
        $.ajax({
            type: 'post',
            url: 'src/emprestimo/cancelar.php',
            dataType: 'json',
            data: {
                'id_emprestimo': idEmprestimo,
            },
            success: function (resposta) {
                alert(resposta['mensagem']);

                if (resposta['status'] === 'sucesso') {
                    listarEmprestimos(); // Atualizar a listagem de empréstimos
                    listarColaboradoresNaEmprestimo(); // Atualizar seleção de colaboradores
                    listarEquipamentosNaEmprestimo();  // Atualizar seleção de equipamentos
                }
            },
            error: function (erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }
}

// Listar Colaboradores no Select
function listarColaboradoresNaEmprestimo() {
    $.ajax({
        type: 'post',
        url: 'src/colaborador/selecionarTodos.php',
        dataType: 'json',
        success: function (resposta) {
            var selectColaborador = document.getElementById('select-colaborador');
            selectColaborador.innerHTML = '<option value="">Selecione um colaborador</option>';

            var colaboradores = resposta['colaboradores'];
            colaboradores.forEach(function (colaborador) {
                var option = document.createElement('option');
                option.value = colaborador['id_colaborador'];
                option.textContent = `${colaborador['nome']} (${colaborador['cpf']})`;
                selectColaborador.appendChild(option);
            });
        },
        error: function (erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Listar Equipamentos no Select
function listarEquipamentosNaEmprestimo() {
    $.ajax({
        type: 'post',
        url: 'src/equipamento/selecionarTodos.php',
        dataType: 'json',
        success: function (resposta) {
            var selectEquipamento = document.getElementById('select-equipamento');
            selectEquipamento.innerHTML = '<option value="">Selecione um equipamento</option>';

            var equipamentos = resposta['equipamentos'];
            equipamentos.forEach(function (equipamento) {
                // Filtrar equipamentos sem estoque (melhora UX, mas backend também valida)
                if (equipamento['quantidade_estoque'] > 0) {
                    var option = document.createElement('option');
                    option.value = equipamento['id_equipamento'];
                    option.textContent = `${equipamento['descricao']} (Estoque: ${equipamento['quantidade_estoque']})`;
                    selectEquipamento.appendChild(option);
                }
            });
        },
        error: function (erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}