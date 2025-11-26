// Listar Cidades
function listarCidades(inputUF) {
    var uf = inputUF.value
    $.ajax({
        type: 'get',
        url: `https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf}/municipios`,
        dataType: 'json',
        success: function(resposta) {
            var listaCidades = document.getElementById('list-cidade');
            listaCidades.innerHTML = '';

            var opcao = "<option value=''>Selecione a cidade...</option>";
            resposta.forEach(function(cidade) {
                opcao += `<option value='${cidade['nome']}'>${cidade['nome']}</option>`;
            });
            listaCidades.innerHTML = opcao;
        },
        erro: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}