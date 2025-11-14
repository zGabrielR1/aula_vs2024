<?php
/**
 * Script para registrar movimentações de estoque (entradas e saídas).
 * Utiliza transações para garantir a consistência dos dados.
 */
require_once '../BD.php';

$db = new BD();
$conn = $db->getConnection();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_produto = $_POST['id_produto'];
    $tipo = $_POST['tipo'];
    $quantidade = (int)$_POST['quantidade'];

    // Validação básica da quantidade
    if ($quantidade <= 0) {
        http_response_code(400);
        echo json_encode(['message' => 'A quantidade deve ser um número positivo.']);
        exit;
    }

    try {
        // Inicia uma transação para garantir que ambas as operações (update e insert) sejam bem-sucedidas
        $conn->beginTransaction();

        // 1. Buscar produto e bloquear a linha para atualização (FOR UPDATE)
        // Isso previne condições de corrida, onde duas requisições tentam alterar o mesmo estoque ao mesmo tempo.
        $sql = "SELECT * FROM produtos WHERE id = :id FOR UPDATE";
        $stmt = $db->query($sql, [':id' => $id_produto]);
        $produto = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$produto) {
            throw new Exception("Produto não encontrado.");
        }

        $estoque_atual = $produto['quantidade_estoque'];
        $estoque_novo = $estoque_atual;
        $alerta = null;

        // Calcula o novo estoque com base no tipo de movimentação
        if ($tipo == 'entrada') {
            $estoque_novo = $estoque_atual + $quantidade;
        } elseif ($tipo == 'saida') {
            // Verifica se há estoque suficiente para a saída
            if ($estoque_atual < $quantidade) {
                throw new Exception("Estoque insuficiente para a saída.");
            }
            $estoque_novo = $estoque_atual - $quantidade;
        }

        // 2. Atualizar a quantidade de estoque na tabela de produtos
        $sqlUpdate = "UPDATE produtos SET quantidade_estoque = :estoque WHERE id = :id";
        $db->query($sqlUpdate, [':estoque' => $estoque_novo, ':id' => $id_produto]);

        // 3. Registrar a movimentação na tabela de histórico
        $sqlMov = "INSERT INTO movimentacoes_estoque (id_produto, tipo, quantidade, data_movimentacao) VALUES (:id_produto, :tipo, :quantidade, NOW())";
        $db->query($sqlMov, [
            ':id_produto' => $id_produto,
            ':tipo' => $tipo,
            ':quantidade' => $quantidade
        ]);

        // 4. Verificar se a quantidade mínima foi atingida após uma saída
        if ($tipo == 'saida' && $estoque_novo <= $produto['quantidade_minima']) {
            $alerta = "Atenção: O produto '{$produto['nome']}' atingiu a quantidade mínima no estoque!";
        }

        // Se tudo ocorreu bem, confirma as alterações no banco
        $conn->commit();

        // Prepara a resposta para o front-end
        $response = ['success' => true];
        if ($alerta) {
            $response['alert'] = $alerta;
        }
        echo json_encode($response);

    } catch (Exception $e) {
        // Se qualquer erro ocorrer, desfaz todas as alterações
        $conn->rollBack();
        http_response_code(400);
        echo json_encode(['message' => $e->getMessage()]);
    }
}
