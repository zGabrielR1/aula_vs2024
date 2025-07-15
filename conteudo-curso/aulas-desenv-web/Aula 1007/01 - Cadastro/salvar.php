<?php

    // Validação dos dados

    /*    echo "Bem-vindo " . $nome;
          echo 'Bem-vindo $nome'; -
          echo "<h1>Bem-vindo <strong>$nome</strong></h1>"; */

    /*     if (isset($_POST['txt-nome'])) {
        $nome = $_POST['txt-nome'];
    } else {
        $nome = '';
    } */

    /*     if ($nome == null || $email == null | $sexo == null || $nascimento == null ) {
        echo 'Por favor preencha o nome!';
    } else {
        echo 'O nome foi preenchido!';
    } */

    $form['nome']           = isset($_POST['txt-nome'])              ? $_POST['txt-nome']        : null;
    $form['email']          = isset($_POST['txt-email'] )             ? $_POST['txt-email']       : null;
    $form['sexo']           = isset($_POST['rbt-sexo'])               ? $_POST['rbt-sexo']        : null;
    $form['nascimento']     = isset($_POST['date-nascimento'])        ? $_POST['date-nascimento'] : null;
    $form['civil']          = isset($_POST['slt-estado-civil'] )      ? $_POST['slt-estado-civil']: null;
    $cursos[]               = isset($_POST['check-cursos'])           ? $_POST ['check-cursos']   : null;

    if (in_array(null, $form) || in_array(null, $cursos)) {
        echo "<script>
            alert('Existe algum campo obrigatório vazio! por favor verifique.');
            history.back();
        </script>";
    } else {
        echo "<script>
            alert('Dados enviados com sucesso!');
            window.location.href = 'index.html'
        </script>";
    }


    // $sexo = $_POST['rbt-sexo'];
    // $nascimento = $_POST['date-nascimento'];
    // $civil = $_POST['slt-estado-civil'];
    // $cursos[] = $_POST['check-cursos'];
?>