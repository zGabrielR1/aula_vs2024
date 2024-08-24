-- a. Exiba a quantidade de abastecimentos feitos;
SELECT COUNT(id_abastecimento) AS qtd_abastecimentos FROM abastecimentos;

-- b. Exiba o nome e o salário dos funcionários, ordenados do maior salário para o menor;
SELECT nome, salario FROM funcionarios ORDER BY salario DESC;

-- c. Exiba a quantidade de litros abastecidos de Gasolina Comum e Gasolina Aditivada;
SELECT SUM(qtd_litros) AS qtd_total FROM abastecimentos GROUP BY id_bico HAVING id_bico IN (SELECT id_bico FROM bicos WHERE id_combustivel=2 OR id_combustivel=3);

-- d. Exiba o nome, cpf e a idade dos clientes do sexo masculino ordenados do mais velho para o mais novo;
SELECT nome, cpf FROM clientes WHERE sexo="M" ORDER BY nascimento ASC;
SELECT nome, cpf, ROUND(DATEDIFF(CURDATE(), nascimento) / 365.25, 0) AS idade FROM clientes WHERE sexo="M" ORDER BY idade DESC;

-- e. Exiba o id, quantidade de litros e o valor a pagar do maior abastecimento;
SELECT id_abastecimento, qtd_litros, total_pagar FROM abastecimentos WHERE qtd_litros = (SELECT MAX(qtd_litros)FROM abastecimentos);
SELECT id_abastecimento, qtd_litros, total_pagar FROM abastecimentos ORDER BY qtd_litros DESC LIMIT 1;

-- f. Exiba a quantidade de telefones que pertençam ao DDD (49);
SELECT COUNT(telefone) AS qtd_telefones FROM clientes WHERE telefone LIKE "(49)%";

-- g. Exiba a média do valor de pagamento dos abastecimentos;
SELECT AVG(total_pagar) AS media_faturamento FROM abastecimentos;
SELECT SUM(total_pagar) / COUNT(total_pagar) AS media_faturamento FROM abastecimentos;

-- h. Exiba todos os dados dos 3 últimos abastecimentos;
SELECT * FROM abastecimentos ORDER BY id_abastecimento DESC LIMIT 3;
SELECT * FROM abastecimentos ORDER BY data DESC LIMIT 3;

-- i. Exiba o nome e a quantidade em estoque do combustível mais barato;
SELECT descricao, qtd_estoque FROM combustiveis WHERE valor_litro = (SELECT MIN(valor_litro) FROM combustiveis); 
SELECT descricao, qtd_estoque FROM combustiveis ORDER BY valor_litro ASC LIMIT 1;

-- j. Exiba o valor total recebido e a quantidade total de litros dos abastecimentos de Diesel;
SELECT SUM(total_pagar) AS total_recebido, SUM(qtd_litros) AS total_litros FROM abastecimentos GROUP BY id_bico HAVING id_bico=5 OR id_bico=6;

-- k. Exiba a quantidade de abastecimentos feitos por data;
SELECT data, COUNT(id_abastecimento) AS qtd_abastecimentos FROM abastecimentos GROUP BY data;

-- l. Exiba o total recebido nos abastecimentos feitos da meia noite até meio dia;
SELECT SUM(total_pagar) AS total_recebido FROM abastecimentos WHERE hora BETWEEN "00:00:00" AND "12:00:00";

-- m. Exiba a média de salário dos funcionários que ganham acima de R$1500,00;
SELECT AVG(salario) AS media_salario FROM funcionarios WHERE salario>1500;

-- n. Exiba a quantidade de clientes por cidade.
SELECT cidade, COUNT(id_cliente) AS qtd_clientes FROM clientes GROUP BY cidade;
