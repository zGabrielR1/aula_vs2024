<div class="container-fluid">
    <h2>Gestão de Estoque</h2>
    <p>Listagem de produtos em ordem alfabética.</p>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Estoque Atual</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody id="tabelaEstoque">
            <!-- Os produtos serão listados aqui -->
        </tbody>
    </table>
</div>

<!-- Modal Movimentação -->
<div class="modal fade" id="modalMovimentacao" tabindex="-1" aria-labelledby="modalMovimentacaoLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalMovimentacaoLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="formMovimentacao">
          <input type="hidden" id="movProdutoId" name="id_produto">
          <input type="hidden" id="movTipo" name="tipo">
          <div class="mb-3">
            <label for="movQuantidade" class="form-label">Quantidade</label>
            <input type="number" class="form-control" id="movQuantidade" name="quantidade" required min="1">
          </div>
          <button type="submit" class="btn btn-primary">Confirmar</button>
        </form>
      </div>
    </div>
  </div>
</div>


<script>
$(document).ready(function() {
    // Função para carregar produtos para o estoque
    function carregarEstoque() {
        $.ajax({
            url: 'src/estoque/listarProdutos.php', // Um novo script para listar produtos em ordem alfabética
            type: 'GET',
            dataType: 'json',
            success: function(produtos) {
                var html = '';
                if (produtos.length > 0) {
                    produtos.forEach(function(produto) {
                        html += `<tr>
                                    <td>${produto.id}</td>
                                    <td>${produto.nome}</td>
                                    <td>${produto.quantidade_estoque}</td>
                                    <td>
                                        <button class="btn btn-sm btn-success btn-movimentacao" data-id="${produto.id}" data-tipo="entrada" data-bs-toggle="modal" data-bs-target="#modalMovimentacao">
                                            <i class="bi bi-plus-circle"></i> Entrada
                                        </button>
                                        <button class="btn btn-sm btn-danger btn-movimentacao" data-id="${produto.id}" data-tipo="saida" data-bs-toggle="modal" data-bs-target="#modalMovimentacao">
                                            <i class="bi bi-dash-circle"></i> Saída
                                        </button>
                                    </td>
                                </tr>`;
                    });
                } else {
                    html = '<tr><td colspan="4" class="text-center">Nenhum produto encontrado.</td></tr>';
                }
                $('#tabelaEstoque').html(html);
            }
        });
    }

    // Carregar estoque inicialmente
    carregarEstoque();

    // Prepara o modal de movimentação
    $(document).on('click', '.btn-movimentacao', function() {
        var id = $(this).data('id');
        var tipo = $(this).data('tipo');
        
        $('#movProdutoId').val(id);
        $('#movTipo').val(tipo);

        var modalTitle = tipo === 'entrada' ? 'Registrar Entrada' : 'Registrar Saída';
        $('#modalMovimentacaoLabel').text(modalTitle);
    });

    // Lógica para movimentar estoque
    $('#formMovimentacao').on('submit', function(e) {
        e.preventDefault();
        var dados = $(this).serialize();
        $.ajax({
            url: 'src/estoque/movimentar.php',
            type: 'POST',
            data: dados,
            dataType: 'json',
            success: function(response) {
                $('#modalMovimentacao').modal('hide');
                $('#formMovimentacao')[0].reset();
                carregarEstoque();
                if (response.alert) {
                    alert(response.alert);
                }
            },
            error: function(xhr) {
                alert(xhr.responseJSON.message || "Ocorreu um erro.");
            }
        });
    });
});
</script>
