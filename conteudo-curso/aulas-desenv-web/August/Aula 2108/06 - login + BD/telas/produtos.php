<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Cadastro de <strong>Produtos</strong></h1>
</div>

<form method="post" action="src/produtos/inserir.php">
    <div class="row g-3 align-items-center">
        <div class="col-sm-2">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" name="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-4">
            <label for="txt-nome" class="form-label">Descrição</label>
            <input type="text" class="form-control" id="txt-descricao" name="txt-descricao" placeholder="Ex: Coca-Cola" required>
        </div>

        <div class="col-sm-3">
            <label for="txt-cpf" class="form-label">Preço de Venda</label>
            <input type="text" class="form-control" id="txt-preco" name="txt-preco" placeholder="Ex: 10.00" required>
        </div>

        <div class="col-sm-3">
            <label for="date-nascimento" class="form-label">Quantidade</label>
            <input type="text" class="form-control" id="txt-quantidade" name="txt-quantidade" placeholder="Ex: 100" required>
        </div>
    </div>
    <div class="row g-3 align-items-center mt-3">
        <div class="col-sm-6">
            <button type="reset" class="btn btn-secondary btn-lg w-100">
                <i class="bi bi-x-lg    "></i>&nbsp;
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
<?php if (isset($_GET['sucesso']) && $_GET['sucesso'] == 1): ?>
    <div class='alert alert-success alert-dismissible fade show mt-3' role='alert'>
        Estoque atualizado com sucesso!
        <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
    </div>
<?php endif; ?>

<div class='mt-3'>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Descrição</th>
            <th scope="col">Preço</th>
            <th scope="col">Qtd. Estoque</th>
            <th scope="col">Ações</th>
        </tr>
        </thead>
        <tbody>
            <?php
                $conexao = new PDO('mysql:host=localhost;port=3307;dbname=db_exemplo', 'root', 'masterkey');
                $sql = "SELECT * FROM produtos";
                $stmt = $conexao->prepare($sql);
                $stmt->execute();
                $produtos = $stmt->fetchAll(PDO::FETCH_ASSOC);

                if (!$produtos) {
                    echo "<tr><td colspan='5' class='text-center'>Nenhum produto cadastrado.</td></tr>";
                } else {
                    foreach ($produtos as $produto) {
                        echo "<tr>";
                        echo "<td scope='row'>{$produto['id_produto']}</td>";
                        echo "<td>{$produto['descricao']}</td>";
                        echo "<td>R$ " . number_format($produto['preco_venda'], 2, ',', '.') . "</td>";
                        echo "<td>{$produto['quantidade']}</td>";
                        echo "<td>
                                <a class='btn' href='sistema.php?tela=produtos&editar={$produto['id_produto']}' title='Editar'><i class='bi bi-pencil-fill'></i></a>
                                <a class='btn' href='sistema.php?tela=estoque&id={$produto['id_produto']}' title='Entrada de Estoque'><i class='bi bi-box-arrow-in-down'></i></a>
                                <button class='btn' onclick='excluir({$produto['id_produto']})' title='Excluir'><i class='bi bi-trash-fill'></i></button>
                              </td>";
                        echo "</tr>";
                    }
                }
            ?>
        </tbody>
    </table>
</div>
<script>
    function excluir(id) {
        var confirmou = confirm('Deseja realmente excluir este produto?');
        if (confirmou) {
            window.location.href = 'src/produtos/excluir.php?id=' + id;
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
                alert('ID do produto inválido!');
            </script>";
            exit;
        }

        // Consulta o Cliente no Banco
        try {
            $conexao = new PDO('mysql:host=localhost;port=3307;dbname=db_exemplo', 'root', 'masterkey');
            $sql = 'SELECT * FROM produtos WHERE id_produto = ?';
            $stmt = $conexao->prepare($sql);
            $stmt->execute([$id]);
            $produtos = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($produtos   ) {
                // Imprime um JS para passar os valores da cosulta no PHP para o formulário
                echo "<script>
                    document.getElementById('txt-id').value             = '{$produtos['id_produto']}';
                    document.getElementById('txt-descricao').value      = '{$produtos['descricao']}';
                    document.getElementById('txt-preco-venda').value    = '{$produtos['preco_venda']}';
                    document.getElementById('txt-quantidade').value    = '{$produtos['quantidade']}';   
                </script>";
            }
        } catch(PDOException $erro) {
            echo "<script>
                alert(\"$erro\");
            </script>";
        }
   }
?>