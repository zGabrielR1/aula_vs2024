<?php
    // Validação de dados (com operação de coalescência)
    $form['nome']       = $_POST['txt-nome']        ?? null;
    $form['cpf']        = $_POST['txt-cpf']         ?? null;
    $form['nascimento'] = $_POST['date-nascimento'] ?? null;
    $form['sexo']       = $_POST['rbt-sexo']        ?? null;
    $form['cidade']     = $_POST['txt-cidade']      ?? null;
    $form['uf']         = $_POST['list-uf']         ?? null;

    if (in_array(null, $form)) {
        echo "<script>
            alert('Existem dados faltando. Verifique!');
            window.history.back();
        </script>";
        exit;
    }

    // Banco de dados
    try {
        $conexao = new PDO('mysql:host=localhost;port=3307;dbname=db_exemplo', 'root', 'masterkey');
        $sql = 'INSERT INTO clientes (nome, cpf, nascimento, sexo, cidade, uf) VALUES (?,?,?,?,?,?)';
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
                alert('Cliente cadastrado com sucesso!');
                window.location.href = '../../sistema.php?tela=clientes';
            </script>";
    } catch(PDOException $erro) {
        $msg = $erro->getMessage();
        echo "<script>
                alert(\"$msg\");
                window.history.back();
            </script>";
    }