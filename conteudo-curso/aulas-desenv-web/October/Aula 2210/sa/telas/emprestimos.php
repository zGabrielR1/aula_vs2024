<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Controle de <strong>Empréstimos</strong></h1>
</div>

<form id="form-emprestimo" onsubmit="return false">
    <div class="row g-3">
        <div class="col-sm-3 mb-3">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-9 mb-3">
            <label for="select-colaborador" class="form-label">Colaborador</label>
            <select class="form-select" id="select-colaborador" required>
                <option value="">Selecione um colaborador</option>
                <!-- Opções serão carregadas via JS -->
            </select>
        </div>

        <div class="col-sm-6 mb-3">
            <label for="select-equipamento" class="form-label">Equipamento</label>
            <select class="form-select" id="select-equipamento" required>
                <option value="">Selecione um equipamento</option>
                <!-- Opções serão carregadas via JS -->
            </select>
        </div>

        <div class="col-sm-6 mb-3">
            <label for="txt-quantidade" class="form-label">Quantidade</label>
            <input type="number" class="form-control" id="txt-quantidade" placeholder="1" min="1" required>
        </div>

        <div class="col-sm-6">
            <button type="reset" class="btn btn-secondary btn-lg w-100">
                <i class="bi bi-x-lg"></i>&nbsp;
                Cancelar
            </button>
        </div>
        <div class="col-sm-6">
            <button onclick="registrarEmprestimo()" class="btn btn-primary btn-lg w-100">
                <i class="bi bi-arrow-up-circle-fill"></i>&nbsp;
                Registrar Empréstimo
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
                <th scope="col">Data Retirada</th>
                <th scope="col">Data Devolução</th>
                <th scope="col">Colaborador</th>
                <th scope="col">Equipamento</th>
                <th scope="col">Quantidade</th>
                <th scope="col">Status</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody id="tbody-emprestimos">
            <!-- Aqui vão ser impressos os empréstimos via JS -->
        </tbody>
    </table>
</div>