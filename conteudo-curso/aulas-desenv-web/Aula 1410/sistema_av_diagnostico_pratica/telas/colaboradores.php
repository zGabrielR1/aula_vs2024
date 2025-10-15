<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Sistema de Controle de <strong>Colaboradores</strong></h1>
    <h1><a href="index.php">Bem-vindo, Admin Sistema</a></h1>
</div>

<form id="form-colaborador" onsubmit="return false">
    <div class="row g-3">
        <div class="col-sm-4">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" name="id" id="txt-id" value="NOVO" required readonly>
        </div>

        <div class="col-sm-8">
            <label for="txt-nome" class="form-label">Nome</label>
            <input type="text" class="form-control" name="nome" id="txt-nome" required>
        </div>
        
        <div class="col-sm-6">
            <label for="txt-cpf" class="form-label">CPF</label>
            <input type="text" class="form-control" name="cpf" id="txt-cpf" required>
        </div>

        <div class="col-sm-6">
            <label for="date-nascimento" class="form-label">Data de Nascimento</label>
            <input type="date" class="form-control" name="nascimento" id="date-nascimento" required>
        </div>

        <div class="col-sm-12">
            <label class="form-label">Sexo</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="sexo" id="rbt-fem" value="f" checked>
                <label class="form-check-label" for="rbt-fem">Feminino</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="sexo" id="rbt-masc" value="m">
                <label class="form-check-label" for="rbt-masc">Masculino</label>
            </div>
        </div>

        <div class="col-sm-6">
            <label for="txt-email" class="form-label">E-mail</label>
            <input type="email" class="form-control" name="email" id="txt-email" required>
        </div>

        <div class="col-sm-6">
            <label for="txt-telefone" class="form-label">Telefone</label>
            <input type="text" class="form-control" name="telefone" id="txt-telefone" required>
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
                <th scope="col">Nascimento</th>
                <th scope="col">Sexo</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody id="tbody-colaboradores">
            <!-- Aqui vão ser impressos os colaboradores via JS -->
        </tbody>
    </table>
</div>

<script>
    // Ensure the colaboradores list is loaded when this page is loaded
    $(document).ready(function() {
        listarColaboradores();
    });
</script>