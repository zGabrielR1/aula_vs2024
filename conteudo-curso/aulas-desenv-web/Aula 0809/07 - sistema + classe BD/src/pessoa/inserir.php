<?php
    // Validação de dados (com operação de coalescência)
    $form['id']             = $_POST['txt-id']          ?? null;
    $form['nome']           = $_POST['txt-nome']        ?? null;
    $form['cpf']            = $_POST['txt-cpf']         ?? null;
    $form['data_nascimento'] = $_POST['date-nascimento'] ?? null;
    $form['foto']           = $_FILES['file-foto']      ?? null;

    // Verificar se todos os campos obrigatórios foram preenchidos
    if (!$form['nome'] || !$form['cpf'] || !$form['data_nascimento']) {
        echo "<script>
            alert('Existem dados obrigatórios faltando. Verifique!');
            window.history.back();
        </script>";
        exit;
    }

    // Validar CPF (remover formatação)
    $cpf_limpo = preg_replace('/\D/', '', $form['cpf']);
    if (strlen($cpf_limpo) !== 11) {
        echo "<script>
            alert('CPF deve conter 11 dígitos!');
            window.history.back();
        </script>";
        exit;
    }

    // Processar upload da foto
    $nome_arquivo = null;
    $editando = ($form['id'] !== 'NOVO');
    
    if ($form['foto'] && $form['foto']['error'] === UPLOAD_ERR_OK) {
        // Validar tipo de arquivo
        $tipos_permitidos = ['image/jpeg', 'image/png', 'image/gif'];
        if (!in_array($form['foto']['type'], $tipos_permitidos)) {
            echo "<script>
                alert('Tipo de arquivo não permitido. Use apenas JPEG, PNG ou GIF.');
                window.history.back();
            </script>";
            exit;
        }

        // Validar tamanho (máximo 2MB)
        if ($form['foto']['size'] > 2 * 1024 * 1024) {
            echo "<script>
                alert('Arquivo muito grande. Máximo 2MB.');
                window.history.back();
            </script>";
            exit;
        }

        // Gerar nome único para o arquivo
        $extensao = pathinfo($form['foto']['name'], PATHINFO_EXTENSION);
        $nome_arquivo = uniqid('pessoa_', true) . '.' . $extensao;
        $caminho_destino = '../../uploads/' . $nome_arquivo;

        // Mover arquivo para o destino
        if (!move_uploaded_file($form['foto']['tmp_name'], $caminho_destino)) {
            echo "<script>
                alert('Erro ao fazer upload da foto.');
                window.history.back();
            </script>";
            exit;
        }
    } elseif (!$editando) {
        // Para novo registro, foto é obrigatória
        echo "<script>
            alert('A foto é obrigatória!');
            window.history.back();
        </script>";
        exit;
    }

    // Banco de dados
    try {
        require_once '../class/BancoDeDados.php';
        $banco = new BancoDeDados;
        
        if ($form['id'] === 'NOVO') {
            // Verificar se CPF já existe
            $sql_verificar = 'SELECT id FROM pessoas WHERE cpf = ?';
            $pessoa_existente = $banco->consultar($sql_verificar, [$form['cpf']]);
            
            if ($pessoa_existente) {
                // Remover arquivo de foto se foi feito upload
                if ($nome_arquivo && file_exists('../../uploads/' . $nome_arquivo)) {
                    unlink('../../uploads/' . $nome_arquivo);
                }
                echo "<script>
                    alert('CPF já cadastrado no sistema!');
                    window.history.back();
                </script>";
                exit;
            }

            // Inserir nova pessoa
            $sql = 'INSERT INTO pessoas (nome, cpf, data_nascimento, foto) VALUES (?,?,?,?)';
            $parametros = [
                $form['nome'],
                $form['cpf'],
                $form['data_nascimento'],
                $nome_arquivo
            ];
            $banco->executarComando($sql, $parametros);
            $msg = 'Pessoa cadastrada com sucesso!';
        } else {
            // Verificar se CPF já existe em outro registro
            $sql_verificar = 'SELECT id FROM pessoas WHERE cpf = ? AND id != ?';
            $pessoa_existente = $banco->consultar($sql_verificar, [$form['cpf'], $form['id']]);
            
            if ($pessoa_existente) {
                // Remover arquivo de foto se foi feito upload
                if ($nome_arquivo && file_exists('../../uploads/' . $nome_arquivo)) {
                    unlink('../../uploads/' . $nome_arquivo);
                }
                echo "<script>
                    alert('CPF já cadastrado em outro registro!');
                    window.history.back();
                </script>";
                exit;
            }

            if ($nome_arquivo) {
                // Remover foto antiga se existir
                $sql_foto_antiga = 'SELECT foto FROM pessoas WHERE id = ?';
                $pessoa_antiga = $banco->consultar($sql_foto_antiga, [$form['id']]);
                if ($pessoa_antiga && $pessoa_antiga['foto'] && file_exists('../../uploads/' . $pessoa_antiga['foto'])) {
                    unlink('../../uploads/' . $pessoa_antiga['foto']);
                }

                // Atualizar com nova foto
                $sql = 'UPDATE pessoas SET nome = ?, cpf = ?, data_nascimento = ?, foto = ? WHERE id = ?';
                $parametros = [
                    $form['nome'],
                    $form['cpf'],
                    $form['data_nascimento'],
                    $nome_arquivo,
                    $form['id']
                ];
            } else {
                // Atualizar sem alterar foto
                $sql = 'UPDATE pessoas SET nome = ?, cpf = ?, data_nascimento = ? WHERE id = ?';
                $parametros = [
                    $form['nome'],
                    $form['cpf'],
                    $form['data_nascimento'],
                    $form['id']
                ];
            }
            
            $banco->executarComando($sql, $parametros);
            $msg = 'Pessoa atualizada com sucesso!';
        }
        
        echo "<script>
                alert('{$msg}');
                window.location.href = '../../sistema.php?tela=pessoas';
            </script>";
    } catch(PDOException $erro) {
        // Remover arquivo de foto se foi feito upload e houve erro
        if ($nome_arquivo && file_exists('../../uploads/' . $nome_arquivo)) {
            unlink('../../uploads/' . $nome_arquivo);
        }
        
        $msg = $erro->getMessage();
        
        // Tratar erro específico de CPF duplicado
        if (strpos($msg, 'Duplicate entry') !== false && strpos($msg, 'cpf') !== false) {
            $msg = 'CPF já cadastrado no sistema!';
        }
        
        echo "<script>
                alert(\"Erro ao salvar: $msg\");
                window.history.back();
            </script>";
    } catch(Exception $erro) {
        // Remover arquivo de foto se foi feito upload e houve erro
        if ($nome_arquivo && file_exists('../../uploads/' . $nome_arquivo)) {
            unlink('../../uploads/' . $nome_arquivo);
        }
        
        $msg = $erro->getMessage();
        echo "<script>
                alert(\"Erro inesperado: $msg\");
                window.history.back();
            </script>";
    }
?>