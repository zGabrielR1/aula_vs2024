<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Cadastro de <strong>Clientes</strong></h1>
</div>

<form>
    <div class="row g-3">
        <div class="col-sm-3 mb-3">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" name="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-9 mb-3">
            <label for="txt-nome" class="form-label">Nome Completo</label>
            <input type="text" class="form-control" id="txt-nome" name="txt-nome" placeholder="Ex: João Silva" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label for="txt-cpf" class="form-label">CPF</label>
            <input type="text" class="form-control" id="txt-cpf" name="txt-cpf" placeholder="123.456.789-10" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label for="date-nascimento" class="form-label">Nascimento</label>
            <input type="date" class="form-control" id="date-nascimento" name="date-nascimento" required>
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

        <div class="col-sm-8 mb-3">
            <label for="txt-cidade" class="form-label">Cidade</label>
            <input type="text" class="form-control" id="txt-cidade" name="txt-cidade" placeholder="Ex: Concórdia" required>
        </div>

        <div class="col-sm-4 mb-3">
            <label class="form-label">UF</label>
            <select class="form-select" id="list-uf" name="list-uf">
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

        <div class="col-sm-6">
            <button type="reset" class="btn btn-secondary btn-lg w-100">
                <i class="bi bi-x-lg"></i>&nbsp;
                Cancelar
            </button>
        </div>
        <div class="col-sm-6">
            <button type="submit" class="btn btn-primary btn-lg w-100">
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
        <tbody>
            <?php
                require_once 'src/class/BancoDeDados.php';
                $banco = new BancoDeDados;
                $sql = 'SELECT * FROM clientes';
                $clientes = $banco->consultar($sql, null, true);

                if ($clientes) {
                    foreach ($clientes as $cliente) {
                        echo "<tr>
                            <td>{$cliente['id_cliente']}</td>
                            <td>{$cliente['nome']}</td>
                            <td>{$cliente['cpf']}</td>
                            <td>" . date('d/m/Y', strtotime($cliente['nascimento'])) . "</td>
                            <td>" . ($cliente['sexo'] == 'f' ? 'Feminino' : 'Masculino') . "</td>
                            <td>{$cliente['cidade']}</td>
                            <td>{$cliente['uf']}</td>
                            <td>
                                <a class='btn' href='sistema.php?tela=clientes&editar={$cliente['id_cliente']}'><i class='bi bi-pencil-fill'></i></a>
                                <button class='btn' onclick='excluir({$cliente['id_cliente']})'><i class='bi bi-trash3-fill'></i></button>
                            </td>
                        </tr>";
                    }
                } else {
                    echo "<tr>
                        <td colspan='7' class='text-center'>Nenhum cliente cadastrado.</td>
                    </tr>";
                }
            ?>
        </tbody>
    </table>
</div>

<script>
    function excluir(id) {
        var confirmou = confirm('Deseja realmente excluir este cliente?');
        if (confirmou) {
            window.location.href = 'src/cliente/excluir.php?id=' + id;
        }
    }
</script>

<?php
   // Se existir `editar` na URL entra no if
   if (isset($_GET['editar'])) {
        // Validação
        $id = $_GET['editar'] ?? null;
        if (!$id) {
            echo "<script>
                alert('ID do cliente inválido!');
            </script>";
            exit;
        }

        // Consulta o Cliente no Banco
        try {
            $banco = new BancoDeDados;
            $sql = 'SELECT * FROM clientes WHERE id_cliente = ?';
            $parametros = [ id ];
            $clientes = $banco->consultar[$sql, $parametros];

            if ($cliente) {
                // Imprime um JS para passar os valores da cosulta no PHP para o formulário
                echo "<script>
                    document.getElementById('txt-id').value             = '{$cliente['id_cliente']}';
                    document.getElementById('txt-nome').value           = '{$cliente['nome']}';
                    document.getElementById('txt-cpf').value            = '{$cliente['cpf']}';
                    document.getElementById('date-nascimento').value    = '{$cliente['nascimento']}';
                    document.getElementById('txt-cidade').value         = '{$cliente['cidade']}';
                    document.getElementById('list-uf').value            = '{$cliente['uf']}';
                    if ('{$cliente['sexo']}' === 'f') {
                        document.getElementById('rbt-fem').checked = true;
                    } else {
                        document.getElementById('rbt-masc').checked = true;
                    }
                </script>";
            }
        } catch(PDOException $erro) {
            $msg = $erro->getMessage();
            echo "<script>
                alert(\"$msg\");
            </script>";
        }
   }
?>