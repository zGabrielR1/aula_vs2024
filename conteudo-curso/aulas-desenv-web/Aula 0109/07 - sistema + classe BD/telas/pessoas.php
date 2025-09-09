<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Cadastro de <strong>Pessoas</strong></h1>
</div>

<form method="post" action="src/pessoa/inserir.php" enctype="multipart/form-data">
    <div class="row g-3">
        <div class="col-sm-3 mb-3">
            <label for="txt-id" class="form-label">ID</label>
            <input type="text" class="form-control" id="txt-id" name="txt-id" value="NOVO" readonly required>
        </div>

        <div class="col-sm-9 mb-3">
            <label for="txt-nome" class="form-label">Nome Completo</label>
            <input type="text" class="form-control" id="txt-nome" name="txt-nome" placeholder="Ex: João Silva" required>
        </div>

        <div class="col-sm-6 mb-3">
            <label for="txt-cpf" class="form-label">CPF</label>
            <input type="text" class="form-control" id="txt-cpf" name="txt-cpf" placeholder="123.456.789-10" required>
        </div>

        <div class="col-sm-6 mb-3">
            <label for="date-nascimento" class="form-label">Data de Nascimento</label>
            <input type="date" class="form-control" id="date-nascimento" name="date-nascimento" required>
        </div>

        <div class="col-sm-12 mb-3">
            <label for="file-foto" class="form-label">Foto</label>
            <input type="file" class="form-control" id="file-foto" name="file-foto" accept="image/*" required>
            <div class="form-text">Selecione uma imagem (JPG, PNG, GIF). Máximo 5MB.</div>
        </div>

        <div class="col-sm-6">
            <button type="reset" class="btn btn-secondary btn-lg w-100" onclick="limparFormulario()">
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
                <th scope="col">Data de Nascimento</th>
                <th scope="col">Foto</th>
                <th scope="col">Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php
                require_once 'src/class/BancoDadosPessoas.php';
                
                try {
                    $banco = new BancoDados;
                    $sql = 'SELECT * FROM pessoas ORDER BY nome';
                    $pessoas = $banco->consultar($sql, [], true);

                    if ($pessoas) {
                        foreach ($pessoas as $pessoa) {
                            echo "<tr>
                                <td>{$pessoa['id']}</td>
                                <td>{$pessoa['nome']}</td>
                                <td>{$pessoa['cpf']}</td>
                                <td>" . date('d/m/Y', strtotime($pessoa['data_nascimento'])) . "</td>
                                <td>";
                            
                            if ($pessoa['nome_arquivo_foto']) {
                                echo "<button class='btn btn-sm btn-outline-primary' onclick='visualizarFoto(\"{$pessoa['nome_arquivo_foto']}\")'>
                                        <i class='bi bi-image'></i> Ver Foto
                                      </button>";
                            } else {
                                echo "<span class='text-muted'>Sem foto</span>";
                            }
                            
                            echo "</td>
                                <td>
                                    <a class='btn' href='sistema.php?tela=pessoas&editar={$pessoa['id']}'><i class='bi bi-pencil-fill'></i></a>
                                    <button class='btn' onclick='excluir({$pessoa['id']})'><i class='bi bi-trash3-fill'></i></button>
                                </td>
                            </tr>";
                        }
                    } else {
                        echo "<tr>
                            <td colspan='6' class='text-center'>Nenhuma pessoa cadastrada.</td>
                        </tr>";
                    }
                } catch(PDOException $erro) {
                    echo "<tr>
                        <td colspan='6' class='text-center text-danger'>Erro ao carregar dados: {$erro->getMessage()}</td>
                    </tr>";
                }
            ?>
        </tbody>
    </table>
</div>

<!-- Modal para visualizar foto -->
<div class="modal fade" id="modalFoto" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Visualizar Foto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body text-center">
                <img id="imgFoto" src="" alt="Foto da pessoa" class="img-fluid">
            </div>
        </div>
    </div>
</div>

<script>
    function excluir(id) {
        var confirmou = confirm('Deseja realmente excluir esta pessoa?');
        if (confirmou) {
            window.location.href = 'src/pessoa/excluir.php?id=' + id;
        }
    }

    function visualizarFoto(nomeArquivo) {
        document.getElementById('imgFoto').src = 'src/pessoa/visualizar_foto.php?foto=' + nomeArquivo;
        var modal = new bootstrap.Modal(document.getElementById('modalFoto'));
        modal.show();
    }

    function limparFormulario() {
        document.getElementById('txt-id').value = 'NOVO';
        document.getElementById('txt-nome').value = '';
        document.getElementById('txt-cpf').value = '';
        document.getElementById('date-nascimento').value = '';
        document.getElementById('file-foto').value = '';
        document.getElementById('file-foto').required = true;
    }
</script>

<?php
   // Se existir `editar` na URL entra no if
   if (isset($_GET['editar'])) {
        // Validação
        $id = $_GET['editar'] ?? null;
        if (!$id) {
            echo "<script>
                alert('ID da pessoa inválido!');
            </script>";
            exit;
        }

        // Consulta a Pessoa no Banco
        try {
            $banco = new BancoDados;
            $sql = 'SELECT * FROM pessoas WHERE id = ?';
            $pessoa = $banco->consultar($sql, [$id]);

            if ($pessoa) {
                // Imprime um JS para passar os valores da consulta no PHP para o formulário
                echo "<script>
                    document.getElementById('txt-id').value = '{$pessoa['id']}';
                    document.getElementById('txt-nome').value = '{$pessoa['nome']}';
                    document.getElementById('txt-cpf').value = '{$pessoa['cpf']}';
                    document.getElementById('date-nascimento').value = '{$pessoa['data_nascimento']}';
                    document.getElementById('file-foto').required = false;
                </script>";
            } else {
                echo "<script>
                    alert('Pessoa não encontrada!');
                    window.location.href = 'sistema.php?tela=pessoas';
                </script>";
            }
        } catch(PDOException $erro) {
            $msg = $erro->getMessage();
            echo "<script>
                alert(\"Erro ao carregar dados: $msg\");
            </script>";
        }
   }
?>