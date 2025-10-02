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
                <?php
                    require_once 'src/class/BancoDeDados.php';
                    $banco = new BancoDeDados;
                    $sql = 'SELECT id_cliente, nome FROM clientes';
                    $clientes = $banco->consultar($sql, null, true);

                    foreach ($clientes as $cliente) {
                        echo "<option value='{$cliente['id_cliente']}'>{$cliente['nome']}</option>";
                    }
                ?>
            </select>
        </div>

        <div class="col-sm-10 mb-3">
            <label class="form-label">Produto</label>
            <select class="form-select" id="list-produto" name="list-produto">
                <option selected>Selecione o Produto</option>
                <?php
                    $banco = new BancoDeDados;
                    $sql = 'SELECT * FROM produtos';
                    $produtos = $banco->consultar($sql, null, true);

                    foreach ($produtos as $produto) {
                        echo "<option value='{$produto['id_produto']}'>
                            {$produto['descricao']} - 
                            Preço: R$ " . str_replace('.', ',', $produto['preco']) . 
                            " - Estoque: {$produto['estoque']}
                        </option>";
                    }
                ?>
            </select>
        </div>

        <div class="col-sm-2 mb-3">
            <label for="txt-qtd" class="form-label">Qtd.</label>
            <input type="number" class="form-control" id="txt-qtd" name="txt-qtd" min="1" required>
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
                <th scope="col">Nº</th>
                <th scope="col">Data - Hora</th>
                <th scope="col">Produto</th>
                <th scope="col">Preço</th>
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
                $banco = new BancoDeDados;
                $sql = 'SELECT 
                    vendas.*,
                    produtos.descricao AS produto,
                    produtos.preco AS produto_preco,
                    clientes.nome AS cliente_nome
                FROM 
                    vendas 
                INNER JOIN
                    produtos USING (id_produto)
                INNER JOIN 
                    clientes USING (id_cliente)
                ORDER BY
                    vendas.cancelado ASC,
                    vendas.data_hora DESC';
                
                $vendas = $banco->consultar($sql, null, true);

                foreach ($vendas as $venda) {
                    echo "<tr>
                        <td>{$venda['id_venda']}</td>
                        <td>" . date('d/m/Y - H:i', strtotime($venda['data_hora'])) . "</td>
                        <td>{$venda['produto']}</td>
                        <td>R$ " . str_replace('.', ',', $venda['produto_preco']) . "</td>
                        <td>{$venda['quantidade']}</td>
                        <td>R$ " . str_replace('.', ',', $venda['valor_total']) . "</td>
                        <td>{$venda['cliente_nome']}</td>
                        <td>" . ($venda['cancelado'] == 0 ? 'Não' : 'Sim') . "</td>
                        <td>
                            <button class='btn' onclick='cancelarVenda({$venda['id_venda']})'>
                                <i class='bi bi-x-circle-fill'></i>
                            </button>
                        </td>
                    </tr>";
                }
            ?>
        </tbody>
    </table>
</div>

<script>
    function cancelarVenda(id) {
        var confirmou = confirm('Deseja realmente canclar esta venda?');
        if (confirmou) {
            window.location.href = 'src/venda/cancelar.php?id=' + id;
        }
    }
</script>
