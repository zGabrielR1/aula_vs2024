<?php 
// Validação de dados
// Método antigo
//  $form['nome'] = isset($_POST['txt-nome']) ? $_POST['txt-nome'] : null;
// Com operador de coalescência
$form['nome'] = isset($_POST['txt-nome'] ?? null;
$form['cpf'] = isset($_POST['txt-cpf'] ?? null; 
$form['nascimento'] = isset($_POST['date-nascimento'] ?? null;
$form['sexo'] = isset($_POST['rbt-sexo'] ?? null; 
$form['cidade'] = isset($_POST['txt-cidade'] ?? null; 
$form['uf'] = isset($_POST['list-uf'] ?? null;  …

 if (in_array(null, $form)) {
    echo "<script>
        alert('Existem dados faltando. Verifique!);
        window.history.back();
    </script>";
    exit;
}

// $form = [
//     'nome' => isset($_POST['txt-nome']) ? $_POST['txt-nome'] : null,
//     'cpf
// ];