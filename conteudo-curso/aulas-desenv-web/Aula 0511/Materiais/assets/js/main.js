// Modal
var modal = document.getElementById('modal');

function abrirModal() {
    modal.style.display = 'flex';
    carregarColaboradores();
};

function fecharModal() {
    modal.style.display = 'none';
    // Limpar formulário
    document.getElementById('form-tarefa').reset();
}

// Carregar colaboradores no select
function carregarColaboradores() {
    $.ajax({
        url: 'src/api/listar-colaboradores.php',
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                var select = $('#list_colaborador');
                select.empty();
                select.append('<option value="">Escolha...</option>');
                
                response.data.forEach(function(colaborador) {
                    select.append('<option value="' + colaborador.id_colaborador + '">' + colaborador.nome + '</option>');
                });
            } else {
                alert('Erro ao carregar colaboradores: ' + response.message);
            }
        },
        error: function() {
            alert('Erro ao comunicar com o servidor');
        }
    });
}

// Carregar tarefas
function carregarTarefas() {
    $.ajax({
        url: 'src/api/listar-tarefas.php',
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                exibirTarefas(response.data);
            } else {
                alert('Erro ao carregar tarefas: ' + response.message);
            }
        },
        error: function() {
            alert('Erro ao comunicar com o servidor');
        }
    });
}

// Exibir tarefas na tela
function exibirTarefas(tarefas) {
    var container = $('.tarefas-container');
    container.empty();
    
    if (tarefas.length === 0) {
        container.append('<p>Nenhuma tarefa cadastrada.</p>');
        return;
    }
    
    tarefas.forEach(function(tarefa) {
        var card = $('<div class="card"></div>');
        
        card.append('<p><strong>Descrição:</strong> ' + escapeHtml(tarefa.descricao) + '</p>');
        card.append('<p><strong>Prioridade:</strong> ' + escapeHtml(tarefa.prioridade) + '</p>');
        card.append('<p><strong>Status:</strong> ' + escapeHtml(tarefa.situacao) + '</p>');
        card.append('<p><strong>Responsável:</strong> ' + escapeHtml(tarefa.nome_colaborador) + '</p>');
        
        var cardActions = $('<div class="card-actions"></div>');
        
        if (tarefa.situacao === 'Pendente') {
            var btnConcluir = $('<a href="#" class="btn-link" data-id="' + tarefa.id_tarefa + '">Concluir</a>');
            btnConcluir.on('click', function(e) {
                e.preventDefault();
                concluirTarefa(tarefa.id_tarefa);
            });
            cardActions.append(btnConcluir);
        } else {
            cardActions.append('<a href="#" class="btn-link desativado">Concluir</a>');
        }
        
        card.append(cardActions);
        container.append(card);
    });
}

// Função auxiliar para escapar HTML
function escapeHtml(text) {
    var map = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#039;'
    };
    return text.replace(/[&<>"']/g, function(m) { return map[m]; });
}

// Cadastrar tarefa
function cadastrarTarefa() {
    var descricao = $('#txt_descricao').val().trim();
    var idColaborador = $('#list_colaborador').val();
    var prioridade = $('#list_prioridade').val();
    
    // Validação básica no cliente
    if (!descricao) {
        alert('Por favor, preencha a descrição');
        return;
    }
    
    if (!idColaborador) {
        alert('Por favor, selecione um responsável');
        return;
    }
    
    // Enviar via AJAX
    $.ajax({
        url: 'src/api/cadastrar-tarefa.php',
        method: 'POST',
        data: {
            txt_descricao: descricao,
            list_colaborador: idColaborador,
            list_prioridade: prioridade
        },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                alert(response.message);
                fecharModal();
                carregarTarefas(); // Recarregar lista
            } else {
                alert('Erro: ' + response.message);
            }
        },
        error: function() {
            alert('Erro ao comunicar com o servidor');
        }
    });
}

// Concluir tarefa
function concluirTarefa(idTarefa) {
    if (!confirm('Deseja realmente concluir esta tarefa?')) {
        return;
    }
    
    $.ajax({
        url: 'src/api/concluir-tarefa.php',
        method: 'POST',
        data: {
            id_tarefa: idTarefa
        },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                alert(response.message);
                carregarTarefas(); // Recarregar lista
            } else {
                alert('Erro: ' + response.message);
            }
        },
        error: function() {
            alert('Erro ao comunicar com o servidor');
        }
    });
}

// Event listeners
$(document).ready(function() {
    // Carregar tarefas ao carregar a página
    carregarTarefas();
    
    // Submeter formulário
    $('#form-tarefa').on('submit', function(e) {
        e.preventDefault();
        cadastrarTarefa();
    });
    
    // Fechar modal ao clicar fora
    $(window).on('click', function(e) {
        if ($(e.target).is(modal)) {
            fecharModal();
        }
    });
});
