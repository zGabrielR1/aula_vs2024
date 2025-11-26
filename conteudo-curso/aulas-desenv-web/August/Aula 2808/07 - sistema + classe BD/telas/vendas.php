<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Controle de <strong>Vendas</strong></h1>
</div>

<form method="post" action="src/venda/inserir.php">
    <div class="row g-3">
        <div class="col-sm-3 mb-3">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" name="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-4 mb-3">
            <label class="form-label">Cliente</label>
            <select class="form-select" id="list-cliente" name="list-cliente">
                <option value="">Selecione o Cliente</option>
                    <?php 
                    require_once 'src/class/BancoDeDados.php';
                    $banco = new BancoDeDados();

                    $sql = "SELECT id_cliente, nome FROM clientes";
                    $clientes = $banco->consultar($sql, null, true);

                    foreach($clientes as $cliente) {
                        echo "<option value='{$cliente['id_cliente']}>{$cliente['nome']}</option>";
                    }
                    ?>
            </select>
        </div>

        <div class="col-sm-4 mb-3">
            <label class="form-label">Produto</label>
            <select class="form-select" id="list-produto" name="list-produto">
                <option value="">Selecione o Produto</option>
                    <?php 
                    require_once 'src/class/BancoDeDados.php';
                    $banco = new BancoDeDados();

                    $sql = "SELECT * FROM produtos";
                    $clientes = $banco->consultar($sql, null, true);

                    foreach($produtos as $produto) {
                        echo "<option value='{$produto['id_produto']}>
                        {$produto['descricao']} - 
                        Preço R$ " . str_replace('.', ',', $produto['preco']) .
                        " - Estoque: {$produto['estoque']}</option>";
                    }
                    ?>
            </select>
        </div>

        <div class="col-sm-9 mb-3">
            <label for="txt-qtd" class="form-label">Qtd.</label>
            <input type="text" class="form-control" id="txt-qtd" name="txt-qtd" min="1" required>
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
            <tr>N
                <th scope="col">Nª</th>
                <th scope="col">Data</th>
                <th scope="col">Hora</th>
                <th scope="col">Produto</th>
                <th scope="col">Qtd.</th>
                <th scope="col">Total</th>
                <th scope="col">Cliente</th>
                <th scope="col">Cancelado</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php
                require_once 'src/class/BancoDeDados.php';
                $banco = new BancoDeDados();
                $sql = 'SELECT
                    vendas.*,
                    produtos.descricao AS produto.
                    produtos.preco AS produto_preco,
                    clientes.nome AS cliente_nome
                FROM
                    vendas
                INNER JOIN
                    produtos USING (id_produto)
                INNER JOIN
                    clientes USING (id_cliente)
                ORDER BY
                    cancelado ASC,
                    vendas.data_hora DESC'; 
                $banco->consultar($sql, null, true);

                foreach ($vendas as $venda) { 
                    echo "<tr>
                        <th scope='row'>{$venda['id_venda']}</th>
                        <td>" . date('d/m/Y - H:i', (strtotime($venda['data_hora']))) . "</td>
                        <td>{$venda['produto']}</td>
                        <td>R$ " . str_replace('.', ',', $venda['produto_preco']) . "</td>
                        <td>{$venda['quantidadde']}</td>
                        <td>R$ " . str_replace('.', ',', $venda['valor_total']) . "</td>
                        <td>{$venda['cliente_nome']}</td>
                        <td>" . ($venda['cancelado'] == 0 ? 'Não' : 'Sim') . "</td>
                        <td>
                            <button class='btn' onclick='cancelarVenda({$venda['id_venda']})'>
                                <i class='bi bi-x-circle-fill'></i>
                            </button>
                        </td>
                        "

                }
            ?>
        </tbody>
    </table>
</div>

<script>
    function cancelarVenda(id) {
        var confirmou = confirm('Deseja realmente excluir este cliente?');
        if (confirmou) {
            window.location.href = 'src/venda/cancelar.php?id=' + id;
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