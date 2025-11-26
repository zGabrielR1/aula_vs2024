<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Controle de <strong>Vendas</strong></h1>
</div>

<form method="post" action="src/venda/inserir.php">
    <div class="row g-3">
        <div class="col-sm-3 mb-3">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" name="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-9 mb-3">
            <label class="form-label">Cliente</label>
            <select class="form-select" id="list-cliente" name="list-cliente">
                <option selected>Selecione o Cliente</option>
               <!-- Aqui serão impressos os lcientes pelo ajax  -->
            </select>
        </div>
        <div class="col-sm-9 mb-3">
            <label class="form-label">Produto</label>
            <select class="form-select" id="list-produto">
                <option selected>Selecione o Produto</option>
                <!-- Aqui serão impressos os produtos pelo ajax  -->
            </select>
        </div>

        <div class="col-sm-2 mb-3">
            <label for="txt-qtd" class="form-label">Qtd.</label>
        <button class="btn btn-primary btn-lg w-100" onclick="adicionarProduto()">
            <i class="bi bi-plus-circle-fill"></i>
        </button>
        </div>

        <div class="col-sm-6">
            <button class="btn btn-secondary btn-lg w-100">
                <i class="bi bi-x-lg"></i>&nbsp;
                Cancelar
            </button>
        </div>
        <div class="col-sm-1">
            <button class="btn btn-primary btn-lg w-100">
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
                <th scope="col">Nº Venda</th>
                <th scope="col">Data - Hora</th>
                <th scope="col">Produto</th>
                <th scope="col">Preço</th>
                <th scope="col">Qtd.</th>
                <th scope="col">Remover</th>
            </tr>
        </thead>
        <tbody id="tbody-produtos-venda">
            <!-- Aqui vao ser inseridos os produtos na da venda -->
        </tbody>
    </table>
</div>

<div class="mt-5">
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">Nº Venda</th>
                <th scope="col">Data - Hora</th>
                <th scope="col">Produto</th>
                <th scope="col">Preço</th>
                <th scope="col">Qtd.</th>
                <th scope="col">Remover</th>
            </tr>
        </thead>
        <tbody id="tbody-vendas">
            <!-- Aqui vao ser impressas as vendas -->
        </tbody>
    </table>
</div>