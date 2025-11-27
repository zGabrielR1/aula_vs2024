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

// Buscar CEP
function buscarCep() {
    var cep = document.getElementById('txt-cep').value;

    $.ajax({
        type: 'get',
        url: `https://cors-anywhere.herokuapp.com/https://viacep.com.br/ws/${cep}/json`,
        dataType: 'json',
        success: function(resposta) {
            document.getElementById('txt-rua').value     = resposta['logradouro'];
            document.getElementById('txt-bairro').value  = resposta['bairro'];
            document.getElementById('list-uf').value     = resposta['uf'];
            document.getElementById('list-uf').dispatchEvent(new Event('change'));
            setTimeout(() => {
                document.getElementById('list-cidade').value = resposta['localidade'];
            }, 500);  
        },
        erro: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}