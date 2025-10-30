function listarCidades(inputUF){
    var uf = inputUF.value;
    $.ajax({
        type: 'get',
        url: 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/' + uf + '/municipios',
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
        error: function(erro) {
            alert('Houve um erro na requisição ' + erro);
        }
    });
}   

function buscarEnderecoPorCep(){
    var cep = document.getElementById('txt-cep').value; // Valor fixo para testes
    $.ajax({
        type: 'get',
        url: 'https://viacep.com.br/ws/' + cep + '/json/',
        dataType: 'json',
        success: function(resposta) {
            var cidade = resposta['localidade'];
            var uf     = resposta['uf'];
            var bairro  = resposta['bairro'];
            var rua     = resposta['logradouro'];

            document.getElementById('txt-rua').value = rua;
            document.getElementById('txt-bairro').value = bairro;
            document.getElementById('list-uf').value = uf;
            listarCidades(document.getElementById('list-uf'));

            // Aguarda o carregamento das cidades antes de definir o valor
            setTimeout(function() {
                document.getElementById('list-cidade').value = cidade;
            }, 50);
        },
        error: function(erro) {
            alert('Houve um erro na requisição ' + erro);
        }
    });
}