<?php
    //validação de dados(com operação de coalescência : ??)
    $form['nome'] = $_POST['txt-nome'] ?? null; 
    $form['cpf'] = $_POST['txt-cpf'] ?? null; 
    $form['nascimento'] = $_POST['date_nascimento'] ?? null; 
    $form['sexo'] = $_POST['rbt-sexo'] ?? null; 
    $form['cidade'] = $_POST['txt-cidade'] ?? null; 
    $form['uf'] = $_POST['list-uf'] ?? null; 

    if(in_array(null, $form)) {
        // Se algum campo obrigatório não foi preenchido
        echo "<script>
                alert('Por favor, preencha todos os campos obrigatórios.');
                window.history.back();
            </script>";
        exit;
    }

    // Se todos os campos obrigatórios foram preenchidos, prosseguir com a inserção no banco de dados
    try {
        $conexao = new PDO('mysql:host=localhost;port=3307;dbname=db_exemplo', 'root', 'masterkey');
    $sql = "INSERT INTO clientes (nome, cpf, nascimento, sexo, cidade, uf) VALUES (?,?,?,?,?,?)";
    $stmt = $conexao->prepare($sql);
    $parametros = [
        $form['nome'],
        $form['cpf'],
        $form['nascimento'],
        $form['sexo'],
        $form['cidade'],
        $form['uf']
    ];
    $stmt->execute($parametros);
    echo "<script>
            alert('Cliente inserido com sucesso!');
            window.document.location.href = '../../sistema.php?tela=clientes';
        </script>";
}catch (PDOException $e) {
    $msg = "Erro ao inserir cliente: " . $e->getMessage();
    echo "<script>
            alert(\"$msg\");
            window.history.back();
        </script>";
}	