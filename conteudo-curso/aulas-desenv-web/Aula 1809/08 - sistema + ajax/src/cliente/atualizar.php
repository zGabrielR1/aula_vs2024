           $sql = 'UPDATE clientes SET nome = ?, cpf = ?, nascimento = ?, sexo = ?, cidade = ?, uf = ? WHERE id_cliente = ?';
            $parametros = [
                $form['nome'],
                $form['cpf'],
                $form['nascimento'],
                $form['sexo'],
                $form['cidade'],
                $form['uf'],
                $form['id']
            ];
            $banco->executarComando($sql, $parametros);
            $msg = 'Cliente alterado com sucesso!';
        }