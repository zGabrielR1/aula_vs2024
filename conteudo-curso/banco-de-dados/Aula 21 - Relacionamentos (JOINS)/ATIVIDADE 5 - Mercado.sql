-- a. Exiba o nome dos clientes e as datas em que fizeram compras;
SELECT clientes.nome,
	   vendas.data
FROM clientes INNER JOIN vendas ON clientes.id_cliente = vendas.id_cliente;

-- b. Exiba o id, número da nota, data, quantidade de produtos, valor a pagar, forma de pagamento, nome do cliente, nome do funcionário e razão social da empresa de todas as vendas ordenadas da mais recente para a mais antiga;
SELECT vendas.id_venda,
	   vendas.numero_nota,
       vendas.data,
       vendas.qtd_produtos,
       vendas.valor_pagar,
       vendas.forma_pgto,
       clientes.nome,
       funcionarios.nome,
       empresas.razao_social
FROM vendas 
INNER JOIN clientes ON vendas.id_cliente = clientes.id_cliente
INNER JOIN funcionarios ON vendas.id_funcionario = funcionarios.id_funcionario
INNER JOIN empresas ON vendas.id_empresa = empresas.id_empresa
ORDER BY vendas.data DESC;

-- c. Exiba o número da nota, data, valor a pagar, nome do funcionário e nome do cliente de todas as vendas finalizadas;
SELECT vendas.numero_nota,
	   vendas.data,
       vendas.valor_pagar,
       funcionarios.nome,
       clientes.nome
FROM vendas
INNER JOIN funcionarios ON vendas.id_funcionario = funcionarios.id_funcionario
INNER JOIN clientes ON vendas.id_cliente = clientes.id_cliente
WHERE vendas.situacao = 0;
       
-- d. Exiba o nome, cidade e nome do estado de todos os clientes e funcionários;
SELECT clientes.nome,
	   clientes.cidade,
       estados.nome
FROM estados
INNER JOIN clientes ON estados.id_estado = clientes.id_estado
UNION
SELECT funcionarios.nome,
       funcionarios.cidade,
       estados.nome
FROM estados
INNER JOIN funcionarios ON estados.id_estado = funcionarios.id_estado;

-- e. Exiba o nome, cpf e telefone dos clientes que estão com vendas em aberto;
SELECT clientes.nome,
	   clientes.cpf,
       clientes.telefone
FROM clientes
INNER JOIN vendas ON clientes.id_estado = vendas.id_cliente
WHERE vendas.situacao = 1;

-- f. Exiba a média de valor vendido de cada categoria de produto;
SELECT produtos.categoria,
	   TRUNCATE(AVG(venda_detalhes.valor), 2) AS media
FROM venda_detalhes
INNER JOIN produtos ON venda_detalhes.id_produto = produtos.id_produto
GROUP BY produtos.categoria;

-- g. Exiba o nome, cidade e estado de todos os clientes que tenham realizado compras;
SELECT clientes.nome,
	   clientes.cidade,
       estados.uf
FROM clientes
INNER JOIN estados ON clientes.id_estado = estados.id_estado
INNER JOIN vendas ON clientes.id_cliente = vendas.id_cliente
GROUP BY clientes.nome;
-- ou DISTINCT()

-- h. Exiba o valor total vendido por cada funcionário;
SELECT funcionarios.nome,
	   TRUNCATE(SUM(vendas.valor_pagar), 2) AS total_vendido
FROM funcionarios
INNER JOIN vendas ON funcionarios.id_funcionario = vendas.id_funcionario
GROUP BY funcionarios.nome;

-- i. Exiba o nome e quantidade vendida de cada produto ordenado do mais vendido para o menos vendido;
SELECT produtos.descricao,
	   ROUND(SUM(venda_detalhes.quantidade), 2) AS qtd_vendido
FROM produtos
INNER JOIN venda_detalhes ON produtos.id_produto = venda_detalhes.id_produto
GROUP BY produtos.descricao
ORDER BY qtd_vendido DESC;

-- j. Exiba a quantidade total de produtos comprados por cada cliente.
SELECT clientes.nome,
	   ROUND(SUM(vendas.qtd_produtos), 2) AS qtd_comprado
FROM clientes
INNER JOIN vendas ON clientes.id_cliente = vendas.id_cliente
GROUP BY clientes.nome;


