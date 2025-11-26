<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Controle de <strong>Vendas</strong></h1>
</div>

<form id="form-venda" onsubmit="return false">
    <div class="row g-3">
        <div class="col-sm-2 mb-3">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-8 mb-3">
            <label class="form-label">Cliente</label>
            <select class="form-select" id="list-cliente">
                <!-- Aqui serão impressos os clientes pelo ajax -->
            </select>
        </div>

        <div class="col-sm-2 mb-3">
            <label for="txt-valor-total" class="form-label">Valor Total</label>
            <input type="text" class="form-control" id="txt-valor-total" value="R$ 0,00" readonly required>
        </div>

        <fieldset class="border rounded-3 p-3">
            <legend class="float-none w-auto px-3 fs-5">Itens da Venda:</legend>

            <div class="row">
                <div class="col-sm-9 mb-3">
                    <label class="form-label">Produto</label>
                    <select class="form-select" id="list-produto">
                        <!-- Aqui serão impressos os produtos pelo ajax -->
                    </select>
                </div>

                <div class="col-sm-2 mb-3">
                    <label for="txt-qtd" class="form-label">Qtd.</label>
                    <input type="number" class="form-control" id="txt-qtd" min="1" value="1">
                </div>

                <div class="col-sm-1 mb-3">
                    <label></label>
                    <button class="btn btn-primary btn-lg w-100" onclick="adicionarProduto()">
                        <i class="bi bi-plus-circle-fill"></i>
                    </button>
                </div>
            </div>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Produto</th>
                        <th scope="col">Preço</th>
                        <th scope="col">Qtd.</th>
                        <th scope="col">Total</th>
                        <th scope="col">Remover</th>
                    </tr>
                </thead>
                <tbody id="tbody-produtos-venda">
                    <!-- Aqui vão ser inseridos os produtos da venda -->
                    <tr>
                        <td colspan='6' class="text-center">Nenhum propduto inserido.</td>
                    </tr>
                </tbody>
            </table>
        </fieldset>

        <div class="col-sm-6">
            <button class="btn btn-secondary btn-lg w-100" onclick="limparVenda()">
                <i class="bi bi-x-lg"></i>&nbsp;
                Limpar
            </button>
        </div>
        <div class="col-sm-6">
            <button class="btn btn-primary btn-lg w-100" onclick="salvarVenda()">
                <i class="bi bi-floppy-fill"></i>&nbsp;
                Salvar
            </button>
        </div>
    </div>
</form>

<hr class="my-4">

<div class="mt-5">
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">Nº</th>
                <th scope="col">Data - Hora</th>
                <th scope="col">Total</th>
                <th scope="col">Cliente</th>
                <th scope="col">Cancelado</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody id="tbody-vendas">
            <!-- Aqui vão ser impressas as vendas -->
        </tbody>
    </table>
</div>
