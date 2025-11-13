<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Cadastro de <strong>Produtos</strong></h1>
</div>

<form id="form-produto" onsubmit="return false" enctype="multipart/form-data">
    <div class="row g-3">
        <div class="col-sm-4">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" name="id" id="txt-id" value="NOVO" required readonly>
        </div>

        <div class="col-sm-8">
            <label for="txt-descricao" class="form-label">Descrição</label>
            <input type="text" class="form-control" name="descricao" id="txt-descricao" required>
        </div>

        <div class="col-sm-6">
            <label for="txt-preco" class="form-label">Preço</label>
            <input type="text" class="form-control" name="preco" id="txt-preco" required>
        </div>

        <div class="col-sm-6">
            <label for="txt-estoque" class="form-label">Estoque</label>
            <input type="text" class="form-control" name="estoque" id="txt-estoque" required>
        </div>

        <div class="col-sm-12">
            <label for="file-produto" class="form-label">Imagem do Produto</label>
            <input type="file" class="form-control" name="file-produto" id="file-produto" accept="image/*">
        </div>
    
        <div class="col-sm-6">
            <button type="reset" class="btn btn-secondary btn-lg w-100">
                <i class="bi bi-x-lg"></i>&nbsp;
                Cancelar
            </button>
        </div>
        <div class="col-sm-6">
            <button onclick="salvarProduto()" class="btn btn-primary btn-lg w-100">
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
                <th scope="col">ID</th>
                <th scope="col">Descrição</th>
                <th scope="col">Preço</th>
                <th scope="col">Estoque</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody id="tbody-produtos">
            <!-- Aqui vão ser impressos os produtos via JS -->
        </tbody>
    </table>
</div>