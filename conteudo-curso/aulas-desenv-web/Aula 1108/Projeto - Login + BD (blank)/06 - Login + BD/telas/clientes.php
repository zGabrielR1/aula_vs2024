<form>
    <div class="mb-3">
    <label for="txt-nome" class="form-label">Nome completo</label>
    <input type="text" class="form-control" id="txt-nome" placeholder="Ex: João Silva" required>
    </div>
    <div class="mb-3">
    <label for="txt-cpf" class="form-label">CPF</label>
    <input type="text" class="form-control" id="txt-cpf" placeholder="Ex: 123.456.789-00" required>
    </div>
    <div class="mb-3">
    <label for="txt-nascimento" class="form-label">Nascimento</label>
    <input type="date" class="form-control" id="txt-nascimento" placeholder="Ex: 2000-01-01" required>
    </div>

    <div class="mb-3">
        <div class="form-check">
            <input class="form-check-input" type="radio" name="rbt-sexo" id="rbt-fem" value="f" checked>
            <label class="form-check-label" for="rbt-fem">
            Feminino
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="rbt-sexo" id="rbt-masc" value="m" checked>
            <label class="form-check-label" for="rbt-masc">
            Masculino
            </label>
        </div>
    </div>
    <div class="mb-3">
    <label for="txt-cidade" class="form-label">Cidade</label>
    <input type="text" class="form-control" id="txt-cidade" placeholder="Ex: Concórdia" required>
    </div>
    <div class="mb-3">
        <label  class="form-label">UF</label>
        <select class="form-select" id="list-uf" name="list-uf">>
            <option selected>Selecione o estado</option>
            <option value="AC">AC</option>
            <option value="AL">AL</option>
            <option value="AP">AP</option>
            <option value="AM">AM</option>
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
    <button type="submit" class="btn btn-primary">Salvar</button>
</form>