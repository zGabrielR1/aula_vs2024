<?php
    // Validação de dados (com operação de coalescência)
    $form['id']             = $_POST['txt-id']          ?? null;
    $form['nome']           = trim($_POST['txt-nome']        ?? '');
    $form['cpf']            = trim($_POST['txt-cpf']         ?? '');
    $form['data_nascimento'] = $_POST['date-nascimento'] ?? null;

    // Validação básica dos campos obrigatórios
    if (empty($form['nome']) || empty($form['cpf']) || empty($form['data_nascimento'])) {
        echo "<script>
            alert('Todos os campos são obrigatórios. Verifique!');
            window.history.back();
        </script>";
        exit;
    }

    // Validação específica do ID para distinguir entre inserção e atualização
    $is_novo = ($form['id'] === 'NOVO' || empty($form['id']));

    // Validação da foto (obrigatória apenas para novos registros)
    $arquivo_foto = $_FILES['file-foto'] ?? null;
    $nome_arquivo_foto = null;

    if ($is_novo && (!$arquivo_foto || $arquivo_foto['error'] === UPLOAD_ERR_NO_FILE)) {
        echo "<script>
            alert('A foto é obrigatória para novos cadastros!');
            window.history.back();
        </script>";
        exit;
    }

    // Processamento do upload da foto (se fornecida)
    if ($arquivo_foto && $arquivo_foto['error'] === UPLOAD_ERR_OK) {
        // Validação do tipo de arquivo
        $tipos_permitidos = ['image/jpeg', 'image/png', 'image/gif'];
        if (!in_array($arquivo_foto['type'], $tipos_permitidos)) {
            echo "<script>
                alert('Tipo de arquivo não permitido. Use JPG, PNG ou GIF.');
                window.history.back();
            </script>";
            exit;
        }

        // Validação do tamanho (5MB máximo)
        if ($arquivo_foto['size'] > 5 * 1024 * 1024) {
            echo "<script>
                alert('Arquivo muito grande. Máximo 5MB.');
                window.history.back();
            </script>";
            exit;
        }

        // Gerar nome único para o arquivo
        $extensao = pathinfo($arquivo_foto['name'], PATHINFO_EXTENSION);
        $nome_arquivo_foto = uniqid('foto_') . '_' . time() . '.' . $extensao;
        $caminho_destino = '../../upload/fotos/' . $nome_arquivo_foto;

        // Mover arquivo para o diretório de destino
        if (!move_uploaded_file($arquivo_foto['tmp_name'], $caminho_destino)) {
            echo "<script>
                alert('Erro ao fazer upload da foto. Tente novamente.');
                window.history.back();
            </script>";
            exit;
        }
    }

    // Banco de dados
    try {
        // Conectar ao banco db_pessoas
        $pdo = new PDO('mysql:host=localhost;port=3307;dbname=db_pessoas', 'root', 'masterkey');
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        if ($is_novo) {
            // Verificar se CPF já existe
            $sql_verificar = 'SELECT COUNT(*) FROM pessoas WHERE cpf = ?';
            $stmt_verificar = $pdo->prepare($sql_verificar);
            $stmt_verificar->execute([$form['cpf']]);
            
            if ($stmt_verificar->fetchColumn() > 0) {
                // Se arquivo foi criado, remove ele
                if ($nome_arquivo_foto && file_exists($caminho_destino)) {
                    unlink($caminho_destino);
                }
                
                echo "<script>
                    alert('CPF já cadastrado! Não é possível duplicar registros.');
                    window.history.back();
                </script>";
                exit;
            }

            // Inserir nova pessoa
            $sql = 'INSERT INTO pessoas (nome, cpf, data_nascimento, nome_arquivo_foto) VALUES (?,?,?,?)';
            $parametros = [
                $form['nome'],
                $form['cpf'],
                $form['data_nascimento'],
                $nome_arquivo_foto
            ];
            $stmt = $pdo->prepare($sql);
            $stmt->execute($parametros);
            $msg = 'Pessoa cadastrada com sucesso!';
            
        } else {
            // Buscar dados da pessoa existente para gerenciar foto
            $sql_atual = 'SELECT nome_arquivo_foto FROM pessoas WHERE id = ?';
            $stmt_atual = $pdo->prepare($sql_atual);
            $stmt_atual->execute([$form['id']]);
            $pessoa_atual = $stmt_atual->fetch(PDO::FETCH_ASSOC);
            
            // Verificar se CPF já existe em outro registro
            $sql_verificar = 'SELECT COUNT(*) FROM pessoas WHERE cpf = ? AND id != ?';
            $stmt_verificar = $pdo->prepare($sql_verificar);
            $stmt_verificar->execute([$form['cpf'], $form['id']]);
            
            if ($stmt_verificar->fetchColumn() > 0) {
                // Se arquivo foi criado, remove ele
                if ($nome_arquivo_foto && file_exists($caminho_destino)) {
                    unlink($caminho_destino);
                }
                
                echo "<script>
                    alert('CPF já cadastrado em outro registro! Não é possível duplicar.');
                    window.history.back();
                </script>";
                exit;
            }

            // Se nova foto foi enviada, atualizar; senão, manter a existente
            if ($nome_arquivo_foto) {
                // Remover foto antiga se existir
                if ($pessoa_atual['nome_arquivo_foto']) {
                    $arquivo_antigo = '../../upload/fotos/' . $pessoa_atual['nome_arquivo_foto'];
                    if (file_exists($arquivo_antigo)) {
                        unlink($arquivo_antigo);
                    }
                }
                
                $sql = 'UPDATE pessoas SET nome = ?, cpf = ?, data_nascimento = ?, nome_arquivo_foto = ? WHERE id = ?';
                $parametros = [
                    $form['nome'],
                    $form['cpf'],
                    $form['data_nascimento'],
                    $nome_arquivo_foto,
                    $form['id']
                ];
            } else {
                $sql = 'UPDATE pessoas SET nome = ?, cpf = ?, data_nascimento = ? WHERE id = ?';
                $parametros = [
                    $form['nome'],
                    $form['cpf'],
                    $form['data_nascimento'],
                    $form['id']
                ];
            }
            
            $stmt = $pdo->prepare($sql);
            $stmt->execute($parametros);
            $msg = 'Pessoa alterada com sucesso!';
        }
        
        echo "<script>
                alert('{$msg}');
                window.location.href = '../../sistema.php?tela=pessoas';
            </script>";
            
    } catch(PDOException $erro) {
        // Em caso de erro, remover arquivo de foto se foi criado
        if ($nome_arquivo_foto && file_exists($caminho_destino)) {
            unlink($caminho_destino);
        }
        
        $msg = $erro->getMessage();
        
        // Tratamento específico para erro de CPF duplicado
        if (strpos($msg, 'Duplicate entry') !== false && strpos($msg, 'cpf_UNIQUE') !== false) {
            $msg = 'CPF já cadastrado! Não é possível duplicar registros.';
        } else if (strpos($msg, 'Connection refused') !== false || strpos($msg, 'No connection') !== false) {
            $msg = 'Falha de conexão com o banco de dados. Verifique se o servidor MySQL está rodando.';
        } else if (strpos($msg, 'Access denied') !== false) {
            $msg = 'Acesso negado ao banco de dados. Verifique as credenciais.';
        } else if (strpos($msg, 'Unknown database') !== false) {
            $msg = 'Banco de dados "db_pessoas" não encontrado. Execute o script SQL para criá-lo.';
        }
        
        echo "<script>
                alert(\"Erro: $msg\");
                window.history.back();
            </script>";
    }
?>