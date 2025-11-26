<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Cadastro de <strong>Colaboradores</strong></h1>
</div>

<form id="form-colaborador" onsubmit="return false">
    <div class="row g-3">
        <div class="col-sm-3 mb-3">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-9 mb-3">
            <label for="txt-nome" class="form-label">Nome Completo</label>
            <input type="text" class="form-control" id="txt-nome" placeholder="Ex: João Silva" required>
        </div>

        <div class="col-sm-6 mb-3">
            <label for="txt-cpf" class="form-label">CPF</label>
            <input type="text" class="form-control" id="txt-cpf" placeholder="123.456.789-10" required>
        </div>

        <div class="col-sm-6 mb-3">
            <label for="date-nascimento" class="form-label">Data de Nascimento</label>
            <input type="date" class="form-control" id="date-nascimento" required>
        </div>

        <div class="col-sm-6">
            <button type="reset" class="btn btn-secondary btn-lg w-100">
                <i class="bi bi-x-lg"></i>&nbsp;
                Cancelar
            </button>
        </div>
        <div class="col-sm-6">
            <button onclick="salvarColaborador()" class="btn btn-primary btn-lg w-100">
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
                <th scope="col">Nome</th>
                <th scope="col">CPF</th>
                <th scope="col">Data de Nascimento</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody id="tbody-colaboradores">
            <!-- Aqui vão ser impressos os colaboradores via JS -->
        </tbody>
    </table>
</div>