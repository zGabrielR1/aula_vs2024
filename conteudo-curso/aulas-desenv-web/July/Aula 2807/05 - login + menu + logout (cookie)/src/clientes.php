<?php

include_once 'config.php';
// Inicia a sessão se ainda não estiver iniciada
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Inicializa o array de clientes na sessão se não existir
if (!isset($_SESSION['clientes'])) {
    $_SESSION['clientes'] = [];
}

// Processa o formulário quando enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Verifica se é uma solicitação para limpar os registros
    if (isset($_POST['limpar_clientes'])) {
        unset($_SESSION['clientes']);
        $_SESSION['clientes'] = [];
    } 
    // Processa o cadastro de um novo cliente
    else if (isset($_POST['txt-nome'])) {
        // Obtém e sanitiza os dados do formulário
        $nome = filter_input(INPUT_POST, 'txt-nome', FILTER_SANITIZE_STRING);
        $cpf = preg_replace('/[^0-9]/', '', $_POST['txt-cpf']);
        $email = filter_input(INPUT_POST, 'txt-email', FILTER_SANITIZE_EMAIL);
        $data_nascimento = $_POST['txt-data-nascimento'];
        $telefone = preg_replace('/[^0-9]/', '', $_POST['txt-telefone']);
        $sexo = ($_POST['radio-genero'] === 'M') ? 'Masculino' : 'Feminino';
        
        // Formata a data para o formato brasileiro
        $data_formatada = date('d/m/Y', strtotime($data_nascimento));
        
        // Formata o telefone (se tiver 11 dígitos, assume que é celular com DDD)
        if (strlen($telefone) === 11) {
            $telefone_formatado = '(' . substr($telefone, 0, 2) . ')' . 
                                substr($telefone, 2, 5) . '-' . 
                                substr($telefone, 7);
        } else {
            $telefone_formatado = $telefone;
        }
        
        // Cria o array com os dados do cliente
        $cliente = [
            'nome' => $nome,
            'cpf' => $cpf,
            'email' => $email,
            'data_nascimento' => $data_formatada,
            'telefone' => $telefone_formatado,
            'sexo' => $sexo
        ];
        
        // Adiciona o cliente ao array na sessão
        $_SESSION['clientes'][] = $cliente;
        
        // Define o cookie com o nome do último cliente (criptografado)
        $nome_criptografado = openssl_encrypt(
            $nome, 
            CIFRA_CRYPT, 
            KEY_CRYPT, 
            0, 
            VI_CRYPT
        );
        
        setcookie(
            'ultimo_cliente', 
            $nome_criptografado, 
            time() + 300, // Expira em 5 minutos (300 segundos)
            '/',
            '',
            false,  // Apenas HTTPS
            true    // Apenas HTTP (não acessível via JavaScript)
        );
        
        // Redireciona para evitar reenvio do formulário ao atualizar a página
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit();
    }
}

// Exibe a mensagem do último cliente registrado (se existir)
if (isset($_COOKIE['ultimo_cliente'])) {
    $ultimo_cliente = openssl_decrypt(
        $_COOKIE['ultimo_cliente'],
        CIFRA_CRYPT,
        KEY_CRYPT,
        0,
        VI_CRYPT
    );
    
    if ($ultimo_cliente !== false) {
        echo "<p>Último cliente registrado: " . htmlspecialchars($ultimo_cliente) . "</p>";
    }
}
?>

<!-- Formulário de cadastro de clientes -->
<div>
    <h1>Cadastro de Clientes</h1>
    
    <form method="post" action="">
        <div>
            <label>Nome: </label>
            <input type="text" name="txt-nome" id="txt-nome" required minlength="3">
        </div>
        
        <br>
        
        <div>
            <label>CPF: </label>
            <input type="text" name="txt-cpf" id="txt-cpf" required pattern="\d{11}" title="Apenas números, sem pontos ou traços">
        </div>
        
        <br>
        
        <div>
            <label>E-mail: </label>
            <input type="email" name="txt-email" id="txt-email" required>
        </div>
        
        <br>
        
        <div>
            <label>Data de Nascimento: </label>
            <input type="date" name="txt-data-nascimento" id="txt-data-nascimento" required>
        </div>
        
        <br>
        
        <div>
            <label>Telefone: </label>
            <input type="text" name="txt-telefone" id="txt-telefone" required>
        </div>
        
        <br>
        
        <div>
            <label>Gênero: </label>
            <input type="radio" name="radio-genero" id="radio-masculino" value="M" required>
            <label for="radio-masculino">Masculino</label>
            
            <input type="radio" name="radio-genero" id="radio-feminino" value="F">
            <label for="radio-feminino">Feminino</label>
        </div>
        
        <br>
        
        <button type="submit">Salvar</button>
    </form>
    
    <br>
    
    <!-- Tabela de clientes cadastrados -->
    <div>
        <h2>Clientes Cadastrados</h2>
        
        <?php if (empty($_SESSION['clientes'])): ?>
            <p>Nenhum cliente cadastrado ainda.</p>
        <?php else: ?>
            <table border="1">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>E-mail</th>
                        <th>Data de Nascimento</th>
                        <th>Telefone</th>
                        <th>Gênero</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($_SESSION['clientes'] as $cliente): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($cliente['nome']); ?></td>
                            <td><?php echo htmlspecialchars($cliente['cpf']); ?></td>
                            <td><?php echo htmlspecialchars($cliente['email']); ?></td>
                            <td><?php echo $cliente['data_nascimento']; ?></td>
                            <td><?php echo $cliente['telefone']; ?></td>
                            <td><?php echo $cliente['sexo']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            
            <br>
            
            <!-- Botão para limpar registros -->
            <form method="post" onsubmit="return confirm('Tem certeza que deseja limpar todos os registros?');">
                <button type="submit" name="limpar_clientes">Limpar Registros</button>
            </form>
        <?php endif; ?>
    </div>
    
    <script>
        // Formata o CPF (apenas números)
        document.getElementById('txt-cpf').addEventListener('input', function(e) {
            this.value = this.value.replace(/\D/g, '');
        });
        
        // Formata o telefone (apenas números)
        document.getElementById('txt-telefone').addEventListener('input', function(e) {
            this.value = this.value.replace(/\D/g, '');
        });
    </script>
</div>