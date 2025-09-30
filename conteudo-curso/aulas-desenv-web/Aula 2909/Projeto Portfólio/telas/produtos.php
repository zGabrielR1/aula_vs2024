<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Sistema Portfólio de <strong>Produtos</strong></h1>
</div>

<form method="post" action="src/produto/inserir.php" enctype="multipart/form-data">
    <div class="row g-3">
        <div class="col-sm-4">
            <label for="txt-nome" class="form-label">Nome</label>
            <input type="text" class="form-control" id="txt-nome" name="txt-nome" value="NOVO" required readonly>
        </div>

        <div class="col-sm-8">
            <label for="txt-descricao," class="form-label">Descrição</label>
            <input type="text" class="form-control" id="txt-descricao" name="txt-descricao" required>
        </div>

        <div class="col-sm-6">
            <label for="txt-preco" class="form-label">Preço</label>
            <input type="text" class="form-control" id="txt-preco" name="txt-preco" required>
        </div>

        <div class="col-sm-12">
            <label for="file-produto" class="form-label">Imagem do Produto</label>
            <input type="file" class="form-control" id="file-produto" name="file-produto" accept="image/*">
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
                <th scope="col">Descrição</th>
                <th scope="col">Preço</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php
                require_once 'src/class/BancoDeDados.php';
                $banco = new BancoDeDados;
                $sql = 'SELECT * FROM produtos';
            ?>
        </tbody>
    </table>
</div>

<script>
    function excluir(id) {
        var confirmou = confirm('Deseja realmente excluir este produto?');
        if (confirmou) {
            window.location.href = 'src/produto/excluir.php?id=' + id;
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

        // Consulta o produto no Banco
        try {
            $banco = new BancoDeDados;
            $sql = 'SELECT * FROM produtos WHERE id_produto = ?';
            $parametros = [ $id ];
            $produto = $banco->consultar($sql, $parametros);

            if ($produto) {
                // Imprime um JS para passar os valores da cosulta no PHP para o formulário
                echo "<script>
                    document.getElementById('txt-nome').value          = '{$produto['id_produto']}';
                    document.getElementById('txt-descricao').value     = '{$produto['descricao']}';
                    document.getElementById('txt-preco').value         = '" . str_replace('.', ',', $produto['preco']) . "';
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