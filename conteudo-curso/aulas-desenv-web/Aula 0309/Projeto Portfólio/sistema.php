<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SISTEMA - PORTFÓLIO DE PRODUTOS</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/sistema.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Sistema <strong>Portfólio de Produtos</strong></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="" class="btn btn-danger"><i class="bi bi-box-arrow-right"></i> <span>Sair</span></a>
                        <a onclick="abrirModal()" class="btn btn-success" data-toggle="modal"><i class="bi bi-plus"></i> <span>Novo Produto</span></a>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Preço</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>                   
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal -->
    <div id="modal-produto" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="form_produto" method="post" action="">
                    <div class="modal-header">
                        <h4 class="modal-title">Novo Produto</h4>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="txt_id" id="txt_id">
                        <input type="hidden" name="txt_nome_imagem" id="txt_nome_imagem">

                        <div class="form-group">
                            <label>Nome</label>
                            <input type="text" class="form-control" name="txt_nome" id="txt_nome" required>
                        </div>
                        <div class="form-group">
                            <label>Descrição</label>
                            <textarea class="form-control" name="txt_descricao" id="txt_descricao" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Preço</label>
                            <input type="text" class="form-control" name="txt_preco" id="txt_preco" required>
                        </div>
                        <div class="form-group">
                            <label>Imagem</label>
                            <input type="file" class="form-control" name="file_imagem" id="file_imagem" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Salvar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- JS -->
    <script>
        function abrirModal() {
            var modal = new bootstrap.Modal(document.getElementById('modal-produto'));
            modal.show();
        }
    </script>
</body>
</html>