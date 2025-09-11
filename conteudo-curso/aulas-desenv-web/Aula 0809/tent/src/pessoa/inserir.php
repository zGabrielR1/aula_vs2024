<?php
    // Validação de dados (com operação de coalescência)
    $form['id']             = $_POST['txt-id']          ?? null;
    $form['nome']           = $_POST['txt-nome']        ?? null;
    $form['cpf']            = $_POST['txt-cpf']         ?? null;
    $form['nascimento']     = $_POST['date-nascimento'] ?? null;
    $form['foto']           = $_FILES['file-foto']      ?? null;

    if (in_array(null, $form)) {
        echo "<script>
            alert('Existem dados faltando. Verifique!');
            window.history.back();
        </script>";
        exit;
    }
    // Enviar arquivo para o servidor
    if ($_FILES['file-foto']['size'] > 0) {
        $nome_imagem = uniqid() . '.jpg';
        $destino     = '../../upload/' . $nome_imagem;
        $origem      = $_FILES['file-foto']['tmp_name'];
        move_uploaded_file($origem, $destino);
    } else {
        echo "<script>
            alert('A foto é obrigatória. Verifique!');
            window.history.back();
        </script>";
        exit;
    }

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        if ($form['id'] === 'NOVO') {
            $sql_verificar = 'SELECT id FROM pessoas WHERE cpf = ?';
            $pessoa_existente = $banco->consultar($sql_verificar, [$form['cpf']]);

            if ($pessoa_existente) {
                echo "<script>
                    alert('CPF já cadastrado no sistema!');
                    window.history.back();
                </script>";
                exit;
            }
            $sql = 'INSERT INTO pessoas (nome, cpf, data_nascimento, foto) VALUES (?,?,?,?)';
            $parametros = [
                $form['nome'],
                $form['cpf'],
                $form['nascimento'],
                $nome_imagem
            ];
            $banco->executarComando($sql, $parametros);
            $msg = 'Funcionário cadastrado com sucesso!';
        } else {
            $sql_verificar = 'SELECT id FROM pessoas WHERE cpf = ? AND id != ?';
            $pessoa_existente = $banco->consultar($sql_verificar, [$form['cpf'], $form['id']]);
            
            if ($pessoa_existente) {
                echo "<script>
                    alert('CPF já foi cadastrado em outro registro!');
                    window.history.back();
                </script>";
                exit;
            }
            $sql = 'UPDATE pessoas SET nome = ?, cpf = ?, data_nascimento = ?, foto = ? WHERE id = ?';
            $parametros = [
                $form['nome'],
                $form['cpf'],
                $form['nascimento'],
                $nome_imagem ?: null,
                $form['id']
            ];
            $banco->executarComando($sql, $parametros);
            $msg = 'Funcionário atualizado com sucesso!';
        }

        echo "<script>
                alert('{$msg}');
                window.location.href = '../../sistema.php?tela=funcionarios';
            </script>";
    } catch(Exception $erro) {
        $msg = $erro->getMessage();
        echo "<script>
            alert(\"$msg\");
            window.history.back();
        </script>";
    }
?>
