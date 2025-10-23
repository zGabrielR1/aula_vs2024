<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Cadastro de <strong>Equipamentos</strong></h1>
</div>

<form id="form-equipamento" onsubmit="return false">
    <div class="row g-3">
        <div class="col-sm-3 mb-3">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-9 mb-3">
            <label for="txt-descricao" class="form-label">Descrição</label>
            <input type="text" class="form-control" id="txt-descricao" placeholder="Ex: Capacete de segurança" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label for="txt-quantidade" class="form-label">Quantidade em Estoque</label>
            <input type="number" class="form-control" id="txt-quantidade" placeholder="0" min="0" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label for="txt-foto" class="form-label">Foto</label>
            <input type="text" class="form-control" id="txt-foto" placeholder="URL da foto">
        </div>

        <div class="col-sm-4 mb-3">
            <label for="txt-codigo-barras" class="form-label">Código de Barras</label>
            <div class="input-group">
                <input type="text" class="form-control" id="txt-codigo-barras" placeholder="Código de barras" readonly>
                <button class="btn btn-outline-secondary" type="button" onclick="gerarCodigoBarras()">
                    <i class="bi bi-upc-scan"></i> Gerar
                </button>
            </div>
        </div>

        <div class="col-sm-6">
            <button type="reset" class="btn btn-secondary btn-lg w-100">
                <i class="bi bi-x-lg"></i>&nbsp;
                Cancelar
            </button>
        </div>
        <div class="col-sm-6">
            <button onclick="salvarEquipamento()" class="btn btn-primary btn-lg w-100">
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
                <th scope="col">Estoque</th>
                <th scope="col">Foto</th>
                <th scope="col">Código de Barras</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody id="tbody-equipamentos">
            <!-- Aqui vão ser impressos os equipamentos via JS -->
        </tbody>
    </table>
</div>