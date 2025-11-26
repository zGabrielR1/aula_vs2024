<?php
require_once('../src/Estoque.php');

// Conexão com o banco de dados usando a classe BancoDeDados
$bd = new BancoDeDados();

// Se o formulário for enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_produto = $_POST['id_produto'] ?? null;
    $quantidade = $_POST['quantidade'] ?? 0;
    
    if ($id_produto && $quantidade > 0) {
        try {
            // Atualiza a quantidade no estoque
            $sql = "UPDATE produtos SET quantidade = quantidade + :quantidade WHERE id_produto = :id_produto";
            $stmt = $bd->getConexao()->prepare($sql);
            
            $stmt->bindParam(':quantidade', $quantidade, PDO::PARAM_INT);
            $stmt->bindParam(':id_produto', $id_produto, PDO::PARAM_INT);
            $stmt->execute();
            
            // Redireciona de volta para a página de produtos com mensagem de sucesso
            header('Location: sistema.php?tela=produtos&sucesso=1');
            exit;
        } catch (PDOException $e) {
            $erro = "Erro ao atualizar o estoque: " . $e->getMessage();
        }
    } else {
        $erro = "Dados inválidos para atualização de estoque.";
    }
}

// Obtém os dados do produto
$id = $_GET['id'] ?? null;
$produto = null;

if ($id) {
    $sql = "SELECT * FROM produtos WHERE id_produto = :id";
    $stmt = $bd->getConexao()->prepare($sql);
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();
    $produto = $stmt->fetch(PDO::FETCH_ASSOC);
}

if (!$produto) {
    echo "<div class='alert alert-danger'>Produto não encontrado.</div>";
    exit;
}
?>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Entrada de <strong>Estoque</strong></h1>
</div>

<?php if (isset($erro)): ?>
    <div class="alert alert-danger"><?php echo $erro; ?></div>
<?php endif; ?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) . '?tela=estoque&id=' . $produto['id_produto']; ?>">
    <input type="hidden" name="id_produto" value="<?php echo $produto['id_produto']; ?>">
    
    <div class="row g-3 align-items-center mb-4">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">Dados do Produto</h5>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label">ID do Produto</label>
                        <input type="text" class="form-control" value="<?php echo $produto['id_produto']; ?>" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Descrição</label>
                        <input type="text" class="form-control" value="<?php echo htmlspecialchars($produto['descricao']); ?>" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Estoque Atual</label>
                        <input type="text" class="form-control" value="<?php echo $produto['quantidade']; ?>" readonly>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">Nova Entrada</h5>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label for="quantidade" class="form-label">Quantidade a Adicionar</label>
                        <input type="number" class="form-control" id="quantidade" name="quantidade" min="1" required>
                        <div class="form-text">Informe a quantidade que está entrando no estoque.</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-12 text-end">
            <a href="sistema.php?tela=produtos" class="btn btn-secondary me-2">
                <i class="bi bi-arrow-left"></i> Voltar
            </a>
            <button type="submit" class="btn btn-primary">
                <i class="bi bi-plus-circle"></i> Adicionar ao Estoque
            </button>
        </div>
    </div>
</form>
