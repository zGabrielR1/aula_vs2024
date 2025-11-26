// Salvar
function salvarUsuario() {
    var id      = document.getElementById('txt-id').value;
    var nome    = document.getElementById('txt-nome').value;
    var usuario = document.getElementById('txt-usuario').value;
    var senha   = document.getElementById('txt-senha').value;
    var destino = id === 'NOVO' ? 'src/usuario/inserir.php' : 'src/usuario/atualizar.php';

    if (nome === '' || usuario === '' || senha === '') {
        alert('Por favor, preencha todos os campos!');
        return;
    }

    $.ajax({
        type: 'post',
        url: destino,
        dataType: 'json',
        data: {
            'id'        : id,
            'nome'      : nome,
            'usuario'   : usuario,
            'senha'     : senha
        },
        success: function(resposta) {
            alert(resposta['mensagem']);

            if (resposta['status'] === 'sucesso') {
                document.getElementById('form-usuario').reset(); // Limpar formulário
                document.getElementById('txt-id').value = 'NOVO'; // Resetar ID
                listarUsuarios();                                // Atualizar a listagem de usuários
            }
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Listar Usuários
function listarUsuarios() {
    $.ajax({
        type: 'post',
        url: 'src/usuario/selecionarTodos.php',
        dataType: 'json',
        success: function(resposta) {
            // Javascript para imprimir os dados da resposta dentro da tabela
            var tabelaUsuarios = document.getElementById('tbody-usuarios');
            tabelaUsuarios.innerHTML = ''; // Limpar a tabela antes de imprimir os usuários

            var usuarios = resposta['usuarios'];
            usuarios.forEach(function(usuario) {
                var linha = document.createElement('tr');
                linha.innerHTML = `
                    <td>${usuario['id_usuario']}</td>
                    <td>${usuario['nome']}</td>
                    <td>${usuario['usuario']}</td>
                    <td>
                        <button class='btn' onclick='editarUsuario(${usuario['id_usuario']})'>
                            <i class='bi bi-pencil-fill'></i>
                        </button>

                        <button class='btn' onclick='excluirUsuario(${usuario['id_usuario']})'>
                            <i class='bi bi-trash-fill'></i>
                        </button>
                    </td>
                `;
                tabelaUsuarios.appendChild(linha);
            });
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}

// Excluir
function excluirUsuario(idUsuario) {
    var confirmou = confirm('Deseja realmente excluir este usuário?');
    if (confirmou) {
        $.ajax({
            type: 'post',
            url: 'src/usuario/excluir.php',
            dataType: 'json',
            data: {
                'id': idUsuario,
            },
            success: function(resposta) {
                alert(resposta['mensagem']);

                if (resposta['status'] === 'sucesso') {
                    listarUsuarios(); // Atualizar a listagem de usuários
                }
            },
            error: function(erro) {
                alert('Ocorreu um erro na requisição: ' + erro);
            }
        });
    }
}

// Editar
function editarUsuario(idUsuario) {
    $.ajax({
        type: 'post',
        url: 'src/usuario/selecionarPorId.php',
        dataType: 'json',
        data: {
            'id': idUsuario,
        },
        success: function(resposta) {
            if (resposta['status'] === 'sucesso') {
                var usuario = resposta['usuario'];
                document.getElementById('txt-id').value     = usuario['id_usuario'];
                document.getElementById('txt-nome').value   = usuario['nome'];
                document.getElementById('txt-usuario').value = usuario['usuario'];
                document.getElementById('txt-senha').value  = ''; // Não preencher a senha por segurança
            } else {
                alert(resposta['mensagem']);
            }
        },
        error: function(erro) {
            alert('Ocorreu um erro na requisição: ' + erro);
        }
    });
}