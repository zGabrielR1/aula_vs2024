<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Cadastro de <strong>Clientes</strong></h1>
</div>

<form id="form-cliente" onsubmit="return false">
    <div class="row g-3">
        <div class="col-sm-3 mb-3">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-9 mb-3">
            <label for="txt-nome" class="form-label">Nome Completo</label>
            <input type="text" class="form-control" id="txt-nome" placeholder="Ex: João Silva" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label for="txt-cpf" class="form-label">CPF</label>
            <input type="text" class="form-control" id="txt-cpf" placeholder="123.456.789-10" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label for="date-nascimento" class="form-label">Nascimento</label>
            <input type="date" class="form-control" id="date-nascimento" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label class="form-label">Gênero</label>
            <div class="form-control border border-0">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="rbt-sexo" id="rbt-fem" value="f" checked>
                    <label class="form-check-label" for="rbt-fem">Feminino</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="rbt-sexo" id="rbt-masc" value="m">
                    <label class="form-check-label" for="rbt-masc">Masculino</label>
                </div>
            </div>
        </div>

        <!-- Campo CEP agora vem antes de UF, Cidade, Bairro e Rua -->
        <div class="col-sm-4 mb-3">
            <label for="txt-cep" class="form-label">CEP</label>
            <div class="input-group">   
                <input type="text" class="form-control" id="txt-cep" placeholder="12345-678" required>
                <button class="btn btn-outline-secondary" type="button" id="btn-buscar-cep" onclick="buscarEnderecoPorCep()">
                    <i class="bi bi-search"></i>
                </button>
            </div>
        </div>

        <div class="col-sm-4 mb-3">
            <label class="form-label">UF</label>
            <select class="form-select" id="list-uf" onchange='listarCidades(this)' required>
                <option selected>Selecione a UF</option>
                <option value="AC">AC</option>
                <option value="AL">AL</option>
                <option value="AP">AP</option>
                <option value="AM">AM</option>
                <option value="BA">BA</option>
                <option value="CE">CE</option>
                <option value="DF">DF</option>
                <option value="ES">ES</option>
                <option value="GO">GO</option>
                <option value="MA">MA</option>
                <option value="MT">MT</option>
                <option value="MS">MS</option>
                <option value="MG">MG</option>
                <option value="PA">PA</option>
                <option value="PB">PB</option>
                <option value="PR">PR</option>
                <option value="PE">PE</option>
                <option value="PI">PI</option>
                <option value="RJ">RJ</option>
                <option value="RN">RN</option>
                <option value="RS">RS</option>
                <option value="RO">RO</option>
                <option value="RR">RR</option>
                <option value="SC">SC</option>
                <option value="SP">SP</option>
                <option value="SE">SE</option>
                <option value="TO">TO</option>
            </select>
        </div>

        <div class="col-sm-8 mb-3">
            <label class="form-label">Cidade</label>
            <select class="form-select" id="list-cidade" required>
                <option selected>Selecione a Cidade</option>
            </select>
        </div>

        <div class="col-sm-8 mb-3">
            <label for="txt-rua" class="form-label">Rua</label>
            <input type="text" class="form-control" id="txt-rua" placeholder="Ex: Rua das Flores, 123" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label for="txt-bairro" class="form-label">Bairro</label>
            <input type="text" class="form-control" id="txt-bairro" placeholder="Ex: Centro" required>
        </div>

        <div class="col-sm-6">
            <button type="reset" class="btn btn-secondary btn-lg w-100">
                <i class="bi bi-x-lg"></i>&nbsp;
                Cancelar
            </button>
        </div>
        <div class="col-sm-6">
            <button onclick="salvarCliente()" class="btn btn-primary btn-lg w-100">
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
                <th scope="col">Cidade</th>
                <th scope="col">UF</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody id="tbody-clientes">
            <!-- Aqui vão ser impressos os clientes via JS -->
        </tbody>
    </table>
</div>
