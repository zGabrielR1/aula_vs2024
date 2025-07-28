<div>
    <h1>Cadastro de Clientes</h1>
    
    <form method="post" action="src/clientes.php">
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