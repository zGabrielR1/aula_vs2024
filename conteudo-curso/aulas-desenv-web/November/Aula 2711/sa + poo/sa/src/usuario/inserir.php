<?php
    // Validação
    $nome       = $_POST['nome']        ?? null;
    $usuario    = $_POST['usuario']     ?? null;
    $senha      = $_POST['senha']       ?? null;
    $tipo       = $_POST['tipo']        ?? 'comum'; // Valor padrão

    if ($nome == null || $usuario == null || $senha == null) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => 'Por favor, preencha todos os campos!'
        ];
        echo json_encode($resposta);
        exit;
    }

    try {
        require_once '../class/Usuario.php';
        $usuario_obj = new Usuario;
        
        // Configurar propriedades do usuário
        $usuario_obj->nome = $nome;
        $usuario_obj->usuario = $usuario;
        $usuario_obj->senha = $senha;
        $usuario_obj->tipo = $tipo;
        
        // Usar o método que já gerencia validações
        $usuario_obj->inserir();

        $resposta = [
            'status'    => 'sucesso',
            'mensagem'  => 'Usuário cadastrado com sucesso!'
        ];
        echo json_encode($resposta);
    } catch(PDOException $erro) {
        $resposta = [
            'status'    => 'erro',
            'mensagem'  => $erro->getMessage(),
        ];
        echo json_encode($resposta);
    }