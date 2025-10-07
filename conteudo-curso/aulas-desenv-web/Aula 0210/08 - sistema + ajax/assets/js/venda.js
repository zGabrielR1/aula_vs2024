function listarClientesnaVenda() {
    $.ajax({
        type: 'post',
        dataType: 'json', 
        urL: 'src/cliente/selecionarTodos.php',
        sucess: function(resposta) {
            console.log(resposta);
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }

    });
}