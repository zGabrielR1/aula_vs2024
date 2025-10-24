// Salvar
function salvarEquipamento() {
        var destino    = document.getElementById('txt-id').value === 'NOVO' 
                            ? 'src/equipamento/inserir.php' 
                            : 'src/equipamento/atualizar.php';
        var formulario = new FormData(document.getElementById('form-equipamento'));

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
                    document.getElementById('form-equipamento').reset(); // Limpar formulário
                    listarEquipamentos();                                // Atualizar a listagem de equipamentos
                }
            },
            error: function(erro) {
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
        success: function(resposta) {
            // Javascript para imprimir os dados da resposta dentro da tabela
            var tabelaEquipamentos = document.getElementById('tbody-equipamentos');
            
            if (!tabelaEquipamentos) {
                alert('Erro: Não foi possível encontrar a tabela de equipamentos.');
                return;
            }
            
            tabelaEquipamentos.innerHTML = ''; // Limpar a tabela antes de imprimir os equipamentos

            var equipamentos = resposta['equipamentos'];
            equipamentos.forEach(function(equipamento) {
                var fotoHtml = equipamento['foto'] ? 
                    `<img src="upload/${equipamento['foto']}" alt="Foto" style="width: 50px; height: 50px; object-fit: cover;">` : 
                    'Sem foto';
                
                var linha = document.createElement('tr');
                linha.innerHTML = `
                    <td>${equipamento['id_equipamento']}</td>
                    <td>${equipamento['descricao']}</td>
                    <td>${equipamento['quantidade_estoque']}</td>
                    <td>${fotoHtml}</td>
                    <td>${equipamento['codigo_barras'] || 'Sem código'}</td>
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
        error: function(erro) {
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
            success: function(resposta) {
                alert(resposta['mensagem']);

                if (resposta['status'] === 'sucesso') {
                    listarEquipamentos(); // Atualizar a listagem de equipamentos
                }
            },
            error: function(erro) {
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
        success: function(resposta) {
            if (resposta['status'] === 'sucesso') {
                var equipamento = resposta['equipamento'];
                
                var idElement = document.getElementById('txt-id');
                var descricaoElement = document.getElementById('txt-descricao');
                var quantidadeElement = document.getElementById('txt-quantidade');
                var codigoBarrasElement = document.getElementById('txt-codigo-barras');
                var fileEquipamentoElement = document.getElementById('file-equipamento');
                
                if (idElement) idElement.value = equipamento['id_equipamento'];
                if (descricaoElement) descricaoElement.value = equipamento['descricao'];
                if (quantidadeElement) quantidadeElement.value = equipamento['quantidade_estoque'];
                if (codigoBarrasElement) codigoBarrasElement.value = equipamento['codigo_barras'] || '';
                // Limpar o campo de arquivo, pois não podemos preencher com o valor anterior
                if (fileEquipamentoElement) fileEquipamentoElement.value = '';
            } else {
                alert(resposta['mensagem']);
            }
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Gerar código de barras
function gerarCodigoBarras() {
    var idElement = document.getElementById('txt-id');
    var codigoBarrasElement = document.getElementById('txt-codigo-barras');
    
    if (!idElement || !codigoBarrasElement) {
        alert('Erro: Não foi possível encontrar os elementos necessários.');
        return;
    }
    
    var id = idElement.value;
    if (id === 'NOVO') {
        alert('Por favor, salve o equipamento primeiro para gerar o código de barras.');
        return;
    }
    
    // Simular geração de código de barras com base no ID
    var codigoBarras = 'EPI' + id.toString().padStart(5, '0');
    codigoBarrasElement.value = codigoBarras;
    
    // Atualizar o código de barras no banco de dados
    atualizarCodigoBarras(id, codigoBarras);
}

// Atualizar código de barras no banco de dados
function atualizarCodigoBarras(id, codigoBarras) {
    $.ajax({
        type: 'post',
        url: 'src/equipamento/atualizarCodigoBarras.php',
        dataType: 'json',
        data: {
            'id': id,
            'codigo_barras': codigoBarras
        },
        success: function(resposta) {
            if (resposta['status'] === 'sucesso') {
                console.log('Código de barras atualizado com sucesso');
                listarEquipamentos(); // Atualizar a listagem
            } else {
                alert('Erro ao atualizar código de barras: ' + resposta['mensagem']);
            }
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}