function cadastrarTarefa(){
    // Lógica para cadastrar a tarefa
    const formData = {
        'txt-descricao': document.getElementById('txt-descricao').value,
        'list-colaborador': document.getElementById('list-colaborador').value,
        'list-prioridade': document.getElementById('list-prioridade').value
    };
    
    // Validar campos
    if (!formData['txt-descricao'] || !formData['list-colaborador'] || !formData['list-prioridade']) {
        alert('Por favor, preencha todos os campos!');
        return;
    }
    
    $.ajax({
        url: 'src/inserir.php',
        type: 'POST',
        data: formData,
        dataType: 'json',
        success: function(resposta) {
            if (resposta['status'] === 'sucesso') {
                alert(resposta['mensagem']);
                document.getElementById('form-tarefa').reset(); // Limpar formulário
                listarTarefas();
            } else {
                alert('Erro: ' + resposta['mensagem']);
            }
        },
        error: function(erro) {
            alert('Houve um erro na requisição: ' + erro.responseText);
        }
    });
}

function listarTarefas(){
    $.ajax({
        url: 'src/listarTarefas.php',
        type: 'GET',
        dataType: 'json',
        success: function(tarefas) {
            var container = document.querySelector('.tarefas-container');
            container.innerHTML = '';
            
            tarefas.forEach(function(tarefa) {
                var card = document.createElement('div');
                card.className = 'card';

                card.innerHTML = `
                    <p class="descricao"><strong>Descrição:</strong> ${tarefa.descricao}</p>
                    <p class="prioridade"><strong>Prioridade:</strong> ${tarefa.prioridade}</p>
                    <p class="status"><strong>Status:</strong> ${tarefa.situacao}</p>
                    <p class="responsavel"><strong>Responsável:</strong> ${tarefa.responsavel}</p>
                    <div class="card-actions"></div>
                `;

                var actions = card.querySelector('.card-actions');

                if (tarefa.situacao === 'Pendente') {
                    actions.innerHTML = "<button class='btn-link'>Concluir</button>";
                    actions.querySelector('button').addEventListener('click', function() {
                        atualizarStatusTarefa(tarefa.id_tarefa, 'Concluída');
                    });
                } else {
                    actions.innerHTML = "<button class='btn-link desativado' disabled>Concluída</button>";
                }

                container.appendChild(card);
            });
        },
        error: function(erro) {
            alert('Houve um erro ao carregar as tarefas: ' + erro);
        }
    });
}

function listarColaboradores(){
    $.ajax({
        type: 'GET',
        url: 'src/listarColaboradores.php',
        dataType: 'json',
        success: function(colaboradores) {
            var listaColaboradores = document.getElementById('list-colaborador');
            listaColaboradores.innerHTML = '';
            var opcao = "<option value=''>Selecione o colaborador...</option>";
            colaboradores.forEach(function(colaborador) {
                opcao += `<option value='${colaborador.id}'>${colaborador.nome}</option>`;
            });
            listaColaboradores.innerHTML = opcao;
        },
        error: function(erro) {
            alert('Houve um erro ao carregar os colaboradores: ' + erro);
        }
    });
}

function atualizarStatusTarefa(idTarefa, novaSituacao) {
    
    if (!confirm('Tem certeza que deseja marcar esta tarefa como concluída?')) {
        return;
    }
    
    $.ajax({
        url: 'src/atualizarStatus.php',
        type: 'POST',
        data: {
            id_tarefa: idTarefa,
            situacao: novaSituacao
        },
        dataType: 'json',
        success: function(resposta) {
            if (resposta.status === 'sucesso') {
                alert(resposta.mensagem);
                listarTarefas(); // Atualizar a listagem
            } else {
                alert('Erro: ' + resposta.mensagem);
            }
        },
        error: function(erro) {
            console.error('Erro ao atualizar status:', erro);
            alert('Houve um erro ao atualizar o status da tarefa.');
        }
    });
}
