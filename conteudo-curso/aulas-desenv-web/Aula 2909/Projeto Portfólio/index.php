<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INÍCIO - PORTFÓLIO DE PRODUTOS</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/index.css">
</head>
<body>
    <div class="container py-5">
        <div class="w-100 text-end">
            <a class="btn btn-primary" href="login.php" target="_blank">Login</a>
        </div>    
        <div class="row text-center text-white mb-5">
            <div class="col-lg-7 mx-auto">
                <h1 class="display-4">Listagem de Produtos</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <ul class="list-group shadow">
                    <?php
                    require_once 'src/class/BancoDeDados.php';
                    $banco = new BancoDeDados;
                    $sql = 'SELECT * FROM produtos';
                    
                    try {
                        $produtos = $banco->consultar($sql, null, true);
                        
                        if ($produtos && is_array($produtos) && count($produtos) > 0) {
                            foreach ($produtos as $produto) {
                                // Use nome if available, otherwise use descricao as fallback
                                $nome = $produto['nome'] ?? $produto['descricao'] ?? 'Produto sem nome';
                                $descricao = $produto['descricao'] ?? 'Sem descrição';
                                $preco = isset($produto['preco']) ? 'R$ ' . number_format($produto['preco'], 2, ',', '.') : 'R$ 0,00';
                                
                                // Handle image path correctly
                                $imagePath = 'assets/imagens/default.jpg'; // default image
                                
                                if (!empty($produto['imagem'])) {
                                    // Check if the image exists in the upload directory
                                    $uploadImagePath = 'upload/' . $produto['imagem'];
                                    if (file_exists($uploadImagePath)) {
                                        $imagePath = $uploadImagePath;
                                    } else {
                                        // Check if it's a full path or URL
                                        if (filter_var($produto['imagem'], FILTER_VALIDATE_URL)) {
                                            $imagePath = $produto['imagem'];
                                        } else {
                                            // Check in assets directory
                                            $assetsImagePath = 'assets/imagens/' . $produto['imagem'];
                                            if (file_exists($assetsImagePath)) {
                                                $imagePath = $assetsImagePath;
                                            }
                                        }
                                    }
                                }
                                
                                echo '<li class="list-group-item">
                                    <div class="media align-items-lg-center flex-column flex-lg-row p-3">
                                        <div class="media-body order-2 order-lg-1">
                                            <h5 class="mt-0 font-weight-bold mb-2">' . htmlspecialchars($nome) . '</h5>
                                            <p class="font-italic text-muted mb-0 small">' . htmlspecialchars($descricao) . '</p>
                                            <div class="d-flex align-items-center justify-content-between mt-1">
                                                <h6 class="font-weight-bold my-2">' . $preco . '</h6>
                                            </div>
                                        </div>
                                        <img src="' . $imagePath . '" width="200" class="ml-lg-5 order-1 order-lg-2" alt="' . htmlspecialchars($nome) . '" onerror="this.src=\'assets/imagens/default.jpg\'">
                                    </div>
                                </li>';
                            }
                        } else {
                            echo '<li class="list-group-item text-center">
                                <p class="mb-0">Nenhum produto cadastrado ainda.</p>
                            </li>';
                        }
                    } catch(PDOException $erro) {
                        echo '<li class="list-group-item text-center">
                            <p class="mb-0 text-danger">Erro ao carregar produtos: ' . $erro->getMessage() . '</p>
                        </li>';
                    }
                    ?>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>