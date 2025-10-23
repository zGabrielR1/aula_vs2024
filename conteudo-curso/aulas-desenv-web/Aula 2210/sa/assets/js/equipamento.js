// Salvar
function salvarEquipamento() {
    // Add defensive checks to prevent errors
    var idElement = document.getElementById('txt-id');
    var descricaoElement = document.getElementById('txt-descricao');
    var quantidadeElement = document.getElementById('txt-quantidade');
    var codigoBarrasElement = document.getElementById('txt-codigo-barras');
    var fileEquipamentoElement = document.getElementById('file-equipamento');
    
    // Check if all elements exist
    if (!idElement || !descricaoElement || !quantidadeElement || !codigoBarrasElement || !fileEquipamentoElement) {
        alert('Erro: Não foi possível encontrar todos os elementos do formulário.');
        return;
    }
    
    var id = idElement.value;
    var descricao = descricaoElement.value;
    var quantidade = quantidadeElement.value;
    var codigo_barras = codigoBarrasElement.value;
    var fileEquipamento = fileEquipamentoElement.files[0];
    var destino = id === 'NOVO' ? 'src/equipamento/inserir.php' : 'src/equipamento/atualizar.php';

    if (descricao === '') {
        alert('Por favor, informe a descrição do equipamento!');
        return;
    }

    var formData = new FormData();
    formData.append('id', id);
    formData.append('descricao', descricao);
    formData.append('quantidade_estoque', quantidade);
    formData.append('codigo_barras', codigo_barras);
    if (fileEquipamento) {
        formData.append('file-equipamento', fileEquipamento);
    }

    $.ajax({
        type: 'post',
        url: destino,
        dataType: 'json',
        data: formData,
        processData: false,
        contentType: false,
        success: function(resposta) {
            alert(resposta['mensagem']);

            if (resposta['status'] === 'sucesso') {
                document.getElementById('form-equipamento').reset(); // Limpar formulário
                if (idElement) idElement.value = 'NOVO'; // Resetar ID
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
            
            // Add defensive check
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
                
                // Add defensive checks
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
}