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