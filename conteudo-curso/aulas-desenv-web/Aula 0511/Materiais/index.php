<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Tarefas</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <!-- Menu -->
    <header>
        <nav class="navbar">
            <h1>Gerenciamento de Tarefas</h1>
            <a href="#" class="btn-link" onclick="abrirModal()">Cadastrar Tarefa</a>
        </nav>
    </header>

    <main class="content">
        <!-- Tarefas -->
        <div class="tarefas-container-wrapper">
            <h2 class="page-title">Tarefas</h2>
            <div class="tarefas-container">
                <!-- Tarefas serão carregadas dinamicamente via AJAX -->
            </div>
        </div>
    </main>

    <!-- Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <h2 class="page-title">Cadastrar Tarefa</h2>
            <form id="form-tarefa" onsubmit="return false">
                <!-- <div class="form-group">
                    <label>ID</label>
                    <input type="text" id="txt_id" readonly value="Novo">
                </div> -->
                <div class="form-group">
                    <label>Descrição</label>
                    <input type="text" id="txt_descricao">
                </div>
                <div class="form-group">
                    <label>Responsável</label>
                    <select id="list_colaborador">
                        <option value="">Escolha...</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Prioridade</label>
                    <select id="list_prioridade">
                        <option value="Alta">Alta</option>
                        <option value="Baixa">Baixa</option>
                    </select>
                </div>
                <div class="form-group buttons">
                    <button type="submit" class="btn-link">Cadastrar</button>
                    <button type="button" class="btn-link" onclick="fecharModal()">Fechar</button>
                </div>
            </form>
        </div>
    </div>

    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- Importar JS -->
    <script src="assets/js/main.js"></script>
</body>
</html>
