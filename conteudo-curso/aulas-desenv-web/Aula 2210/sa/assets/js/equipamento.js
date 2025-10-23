// Salvar
function salvarEquipamento() {
    var id                  = document.getElementById('txt-id').value;
    var descricao           = document.getElementById('txt-descricao').value;
    var quantidade          = document.getElementById('txt-quantidade').value;
    var foto                = document.getElementById('txt-foto').value;
    var codigo_barras       = document.getElementById('txt-codigo-barras').value;
    var destino             = id === 'NOVO' ? 'src/equipamento/inserir.php' : 'src/equipamento/atualizar.php';

    if (descricao === '') {
        alert('Por favor, informe a descrição do equipamento!');
        return;
    }

    $.ajax({
        type: 'post',
        url: destino,
        dataType: 'json',
        data: {
            'id'                : id,
            'descricao'         : descricao,
            'quantidade_estoque': quantidade,
            'foto'              : foto,
            'codigo_barras'     : codigo_barras
        },
        success: function(resposta) {
            alert(resposta['mensagem']);

            if (resposta['status'] === 'sucesso') {
                document.getElementById('form-equipamento').reset(); // Limpar formulário
                document.getElementById('txt-id').value = 'NOVO'; // Resetar ID
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
            tabelaEquipamentos.innerHTML = ''; // Limpar a tabela antes de imprimir os equipamentos

            var equipamentos = resposta['equipamentos'];
            equipamentos.forEach(function(equipamento) {
                var fotoHtml = equipamento['foto'] ? 
                    `<img src="${equipamento['foto']}" alt="Foto" style="width: 50px; height: 50px; object-fit: cover;">` : 
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
                document.getElementById('txt-id').value                     = equipamento['id_equipamento'];
                document.getElementById('txt-descricao').value              = equipamento['descricao'];
                document.getElementById('txt-quantidade').value             = equipamento['quantidade_estoque'];
                document.getElementById('txt-foto').value                   = equipamento['foto'] || '';
                document.getElementById('txt-codigo-barras').value          = equipamento['codigo_barras'] || '';
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
    var id = document.getElementById('txt-id').value;
    if (id === 'NOVO') {
        alert('Por favor, salve o equipamento primeiro para gerar o código de barras.');
        return;
    }
    
    // Simular geração de código de barras com base no ID
    var codigoBarras = 'EPI' + id.toString().padStart(5, '0');
    document.getElementById('txt-codigo-barras').value = codigoBarras;
}