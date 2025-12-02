// Salvar
function salvarEquipamento() {
    // Verificar se o elemento txt-id existe antes de acessar seu valor
    var idElement = document.getElementById('txt-id');
    if (!idElement) {
        alert('Erro: Não foi possível encontrar o formulário de equipamento.');
        return;
    }

    var destino = idElement.value === 'NOVO'
        ? 'src/equipamento/inserir.php'
        : 'src/equipamento/atualizar.php';
    var formulario = new FormData(document.getElementById('form-equipamento'));

    $.ajax({
        type: 'post',
        url: destino,
        dataType: 'json',
        processData: false,
        contentType: false,
        data: formulario,
        success: function (resposta) {
            alert(resposta['mensagem']);

            if (resposta['status'] === 'sucesso') {
                document.getElementById('form-equipamento').reset(); // Limpar formulário
                listarEquipamentos();                                // Atualizar a listagem de equipamentos
            }
        },
        error: function (erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Listar Equipamentos
function listarEquipamentos() {
    $.ajax({
        type: 'post',
        url: 'src/equipamento/selecionarTodos.php',
        dataType: 'json',
        success: function (resposta) {
            // Javascript para imprimir os dados da resposta dentro da tabela
            var tabelaEquipamentos = document.getElementById('tbody-equipamentos');

            if (!tabelaEquipamentos) {
                alert('Erro: Não foi possível encontrar a tabela de equipamentos.');
                return;
            }

            tabelaEquipamentos.innerHTML = ''; // Limpar a tabela antes de imprimir os equipamentos

            var equipamentos = resposta['equipamentos'];
            equipamentos.forEach(function (equipamento) {
                var fotoHtml = equipamento['foto'] ?
                    `<img src="upload/${equipamento['foto']}" alt="Foto" style="width: 50px; height: 50px; object-fit: cover; cursor: pointer;" onclick="mostrarImagemModal('upload/${equipamento['foto']}', 'Foto do Equipamento')" title="Clique para ampliar">` :
                    'Sem foto';

                // Exibir código de barras como imagem se existir, senão mostrar mensagem
                var codigoBarrasHtml = equipamento['codigo_barras'] ?
                    `<img src="${equipamento['codigo_barras']}" alt="Código de Barras" style="max-width: 200px; height: 50px; object-fit: contain; cursor: pointer;" onclick="mostrarImagemModal('${equipamento['codigo_barras']}', 'Código de Barras')" title="Clique para ampliar">` :
                    '<span class="text-muted">Sem código</span>';

                var linha = document.createElement('tr');
                linha.innerHTML = `
                    <td>${equipamento['id_equipamento']}</td>
                    <td>${equipamento['descricao']}</td>
                    <td>${equipamento['quantidade_estoque']}</td>
                    <td>${fotoHtml}</td>
                    <td>${codigoBarrasHtml}</td>
                    <td>
                        <button class='btn' onclick='editarEquipamento(${equipamento['id_equipamento']})'>
                            <i class='bi bi-pencil-fill'></i>
                        </button>

                        <button class='btn' onclick='excluirEquipamento(${equipamento['id_equipamento']})'>
                            <i class='bi bi-trash-fill'></i>
                        </button>
                    </td>
                `;
                tabelaEquipamentos.appendChild(linha);
            });
        },
        error: function (erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Excluir
function excluirEquipamento(idEquipamento) {
    var confirmou = confirm('Deseja realmente excluir este equipamento?');
    if (confirmou) {
        $.ajax({
            type: 'post',
            url: 'src/equipamento/excluir.php',
            dataType: 'json',
            data: {
                'id': idEquipamento,
            },
            success: function (resposta) {
                alert(resposta['mensagem']);

                if (resposta['status'] === 'sucesso') {
                    listarEquipamentos(); // Atualizar a listagem de equipamentos
                }
            },
            error: function (erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }
}

// Editar
function editarEquipamento(idEquipamento) {
    $.ajax({
        type: 'post',
        url: 'src/equipamento/selecionarPorId.php',
        dataType: 'json',
        data: {
            'id': idEquipamento,
        },
        success: function (resposta) {
            if (resposta['status'] === 'sucesso') {
                var equipamento = resposta['equipamento'];

                var idElement = document.getElementById('txt-id');
                var descricaoElement = document.getElementById('txt-descricao');
                var quantidadeElement = document.getElementById('txt-quantidade');
                var fileEquipamentoElement = document.getElementById('file-equipamento');

                if (idElement) idElement.value = equipamento['id_equipamento'];
                if (descricaoElement) descricaoElement.value = equipamento['descricao'];
                if (quantidadeElement) quantidadeElement.value = equipamento['quantidade_estoque'];
                // Limpar o campo de arquivo, pois não podemos preencher com o valor anterior
                if (fileEquipamentoElement) fileEquipamentoElement.value = '';
            } else {
                alert(resposta['mensagem']);
            }
        },
        error: function (erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Mostrar Imagem no Modal
function mostrarImagemModal(src, titulo) {
    var modalImagem = new bootstrap.Modal(document.getElementById('modalImagem'));
    document.getElementById('imgModal').src = src;
    document.getElementById('modalImagemLabel').innerText = titulo;
    modalImagem.show();
}