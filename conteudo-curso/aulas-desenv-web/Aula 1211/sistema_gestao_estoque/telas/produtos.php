<div class="container-fluid">
    <h2>CRUD de Produtos</h2>
    <div class="d-flex justify-content-between mb-3">
        <form class="d-flex" id="formBusca">
            <input class="form-control me-2" type="search" placeholder="Buscar por nome..." aria-label="Search" id="campoBusca" name="busca">
            <button class="btn btn-outline-success" type="submit">Buscar</button>
        </form>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAdicionar">Adicionar Produto</button>
    </div>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Preço</th>
                <th>Estoque</th>
                <th>Qtd. Mínima</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody id="tabelaProdutos">
            <!-- Os produtos serão listados aqui via Ajax -->
        </tbody>
    </table>
</div>

<!-- Modal Adicionar -->
<div class="modal fade" id="modalAdicionar" tabindex="-1" aria-labelledby="modalAdicionarLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalAdicionarLabel">Adicionar Produto</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="formAdicionar">
          <div class="mb-3">
            <label for="addNome" class="form-label">Nome</label>
            <input type="text" class="form-control" id="addNome" name="nome" required>
          </div>
          <div class="mb-3">
            <label for="addDescricao" class="form-label">Descrição</label>
            <textarea class="form-control" id="addDescricao" name="descricao"></textarea>
          </div>
          <div class="mb-3">
            <label for="addPreco" class="form-label">Preço</label>
            <input type="number" step="0.01" class="form-control" id="addPreco" name="preco" required>
          </div>
          <div class="mb-3">
            <label for="addEstoque" class="form-label">Quantidade em Estoque</label>
            <input type="number" class="form-control" id="addEstoque" name="quantidade_estoque" required>
          </div>
          <div class="mb-3">
            <label for="addQtdMin" class="form-label">Quantidade Mínima</label>
            <input type="number" class="form-control" id="addQtdMin" name="quantidade_minima" required>
          </div>
          <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal Editar -->
<div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="modalEditarLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalEditarLabel">Editar Produto</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="formEditar">
          <input type="hidden" id="editId" name="id">
          <div class="mb-3">
            <label for="editNome" class="form-label">Nome</label>
            <input type="text" class="form-control" id="editNome" name="nome" required>
          </div>
          <div class="mb-3">
            <label for="editDescricao" class="form-label">Descrição</label>
            <textarea class="form-control" id="editDescricao" name="descricao"></textarea>
          </div>
          <div class="mb-3">
            <label for="editPreco" class="form-label">Preço</label>
            <input type="number" step="0.01" class="form-control" id="editPreco" name="preco" required>
          </div>
          <div class="mb-3">
            <label for="editEstoque" class="form-label">Quantidade em Estoque</label>
            <input type="number" class="form-control" id="editEstoque" name="quantidade_estoque" required>
          </div>
          <div class="mb-3">
            <label for="editQtdMin" class="form-label">Quantidade Mínima</label>
            <input type="number" class="form-control" id="editQtdMin" name="quantidade_minima" required>
          </div>
          <button type="submit" class="btn btn-primary">Salvar Alterações</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
    // Função para carregar produtos
    function carregarProdutos(busca = '') {
        $.ajax({
            url: 'src/produto/selecionarTodos.php',
            type: 'GET',
            data: { busca: busca },
            dataType: 'json',
            success: function(produtos) {
                var html = '';
                if (produtos.length > 0) {
                    produtos.forEach(function(produto) {
                        html += `<tr>
                                    <td>${produto.id}</td>
                                    <td>${produto.nome}</td>
                                    <td>${produto.descricao}</td>
                                    <td>R$ ${produto.preco}</td>
                                    <td>${produto.quantidade_estoque}</td>
                                    <td>${produto.quantidade_minima}</td>
                                    <td>
                                        <button class="btn btn-sm btn-warning btn-editar" data-id="${produto.id}" data-bs-toggle="modal" data-bs-target="#modalEditar">
                                            <i class="bi bi-pencil"></i>
                                        </button>
                                        <button class="btn btn-sm btn-danger btn-deletar" data-id="${produto.id}">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </td>
                                </tr>`;
                    });
                } else {
                    html = '<tr><td colspan="7" class="text-center">Nenhum produto encontrado.</td></tr>';
                }
                $('#tabelaProdutos').html(html);
            }
        });
    }

    // Carregar todos os produtos inicialmente
    carregarProdutos();

    // Lógica da busca
    $('#formBusca').on('submit', function(e) {
        e.preventDefault();
        var busca = $('#campoBusca').val();
        carregarProdutos(busca);
    });

    // Lógica para adicionar produto
    $('#formAdicionar').on('submit', function(e) {
        e.preventDefault();
        var dados = $(this).serialize();
        $.ajax({
            url: 'src/produto/adicionar.php',
            type: 'POST',
            data: dados,
            success: function() {
                $('#modalAdicionar').modal('hide');
                $('#formAdicionar')[0].reset();
                carregarProdutos();
            }
        });
    });

    // Lógica para carregar dados para edição
    $(document).on('click', '.btn-editar', function() {
        var id = $(this).data('id');
        $.ajax({
            url: 'src/produto/selecionarUm.php',
            type: 'GET',
            data: { id: id },
            dataType: 'json',
            success: function(produto) {
                $('#editId').val(produto.id);
                $('#editNome').val(produto.nome);
                $('#editDescricao').val(produto.descricao);
                $('#editPreco').val(produto.preco);
                $('#editEstoque').val(produto.quantidade_estoque);
                $('#editQtdMin').val(produto.quantidade_minima);
            }
        });
    });

    // Lógica para editar produto
    $('#formEditar').on('submit', function(e) {
        e.preventDefault();
        var dados = $(this).serialize();
        $.ajax({
            url: 'src/produto/atualizar.php',
            type: 'POST',
            data: dados,
            success: function() {
                $('#modalEditar').modal('hide');
                carregarProdutos();
            }
        });
    });

    // Lógica para deletar produto
    $(document).on('click', '.btn-deletar', function() {
        if (confirm('Tem certeza que deseja deletar este produto?')) {
            var id = $(this).data('id');
            $.ajax({
                url: 'src/produto/deletar.php',
                type: 'POST',
                data: { id: id },
                success: function() {
                    carregarProdutos();
                }
            });
        }
    });
});
</script>
