// Listar cidades
function listarCidadaes(input) {
    var uf = inputUF.value
    $.ajax({
        type: '',
        url: 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf}/municipios',
        dataType: 'json',
        sucess: function() {
            
            var listaCidades = document.getElementById('list-cidade');
            listaClientes.innerHTML = '';

            var opcao = "<option value=''>Selecione o cliente...</option>";
            resposta.forEach(function(cidade) {
                opcao += `<option value='${cidadee['nome']}'>${cidade['nome']}</option>`;
            });
            listaClientes.innerHTML = opcao;
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição '+ erro);

        },
    });
};

// Buscar endereço por CEP
function buscarEnderecoPorCep() {
    var cep = document.getElementById('txt-cep').value.replace(/\D/g, '');

    if (cep.length != 8) {
        alert('CEP inválido! Digite um CEP com 8 dígitos.');
        return;
    }

    $.ajax({
        type: 'GET',
        url: 'https://viacep.com.br/ws/' + cep + '/json/',
        dataType: 'json',
        success: function(resposta) {
            if (resposta.erro) {
                alert('CEP não encontrado.');
                return;
            }

            // Preenche os campos com os dados retornados
            $('#txt-rua').val(resposta.logradouro);
            $('#txt-bairro').val(resposta.bairro);
            $('#list-uf').val(resposta.uf);

            // Atualiza a lista de cidades e seleciona a cidade automaticamente
            listarCidades({ value: resposta.uf });

            setTimeout(function() {
                $('#list-cidade option').each(function() {
                    if ($(this).text() == resposta.localidade) {
                        $(this).prop('selected', true);
                    }
                });
            }, 500);
        },
        error: function() {
            alert('Erro ao buscar o CEP.');
        }
    });
}

// Liga o botão de busca do CEP
$(document).ready(function() {
    $('#txt-cep').closest('.input-group').find('button').click(buscarEnderecoPorCep);
});
