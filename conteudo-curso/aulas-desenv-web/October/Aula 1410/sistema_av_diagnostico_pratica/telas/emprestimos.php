<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Cadastro de <strong>Empréstimos</strong></h1>
</div>

<form id="form-emprestimo" onsubmit="return false">
    <div class="row g-3">
        <div class="col-sm-6">
            <label for="list-cliente" class="form-label">Cliente</label>
            <select class="form-select" id="list-cliente" required>
                <option value="">Carregando clientes...</option>
            </select>
        </div>
        
        <div class="col-sm-6">
            <label for="list-produto" class="form-label">Produto</label>
            <select class="form-select" id="list-produto" required>
                <option value="">Carregando produtos...</option>
            </select>
        </div>
        
        <div class="col-sm-6">
            <label for="txt-qtd" class="form-label">Quantidade</label>
            <input type="number" class="form-control" id="txt-qtd" min="1" required>
        </div>
        
        <div class="col-sm-6">
            <label for="txt-valor-total" class="form-label">Valor Total</label>
            <input type="text" class="form-control" id="txt-valor-total" readonly>
        </div>
        
        <div class="col-sm-6">
            <button type="button" class="btn btn-success btn-lg w-100" onclick="adicionarItens()">
                <i class="bi bi-plus-circle"></i>&nbsp;
                Adicionar Item
            </button>
        </div>
        
        <div class="col-sm-6">
            <button type="button" class="btn btn-primary btn-lg w-100" onclick="salvarVenda()">
                <i class="bi bi-cash-coin"></i>&nbsp;
                Finalizar Empréstimo
            </button>
        </div>
    </div>
</form>

<hr class="my-4">

<h3>Itens do Empréstimo</h3>
<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Descrição</th>
            <th scope="col">Preço</th>
            <th scope="col">Quantidade</th>
            <th scope="col">Valor</th>
            <th scope="col">Ações</th>
        </tr>
    </thead>
    <tbody id="tbody-produtos-venda">
        <tr>
            <td colspan="6" class="text-center">Nenhum item adicionado</td>
        </tr>
    </tbody>
</table>