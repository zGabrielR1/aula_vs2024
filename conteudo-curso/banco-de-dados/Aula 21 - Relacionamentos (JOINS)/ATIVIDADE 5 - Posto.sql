-- a. Exiba a descrição e número da bomba de todos os combustíveis;
SELECT DISTINCT(combustiveis.descricao),
bicos.bomba
FROM combustiveis
INNER JOIN bicos ON combustiveis.id_combustivel = bicos.id_combustivel;

-- b. Exiba a quantidade de abastecimentos dos combustíveis "Gasolina";
SELECT COUNT(abastecimentos.id_abastecimento) AS qtd_abast_gasolina
FROM abastecimentos 
INNER JOIN bicos ON abastecimentos.id_bico = bicos.id_bico
INNER JOIN combustiveis ON combustiveis.id_combustivel = bicos.id_combustivel
WHERE combustiveis.descricao LIKE "Gasolina%";

-- c. Exiba a média de litros abastecidos por cada cliente;
SELECT clientes.nome,
AVG(abastecimentos.qtd_litros) AS media_litros
FROM clientes
INNER JOIN abastecimentos ON clientes.id_cliente = abastecimentos.id_cliente
GROUP BY clientes.nome;

-- d. Exiba o id, quantidade de litros, total a pagar, data, hora, nome do cliente, nome do funcionário, descrição do combustível e nome fantasia da empresa de todos os abastecimentos;
SELECT abastecimentos.id_abastecimento,
abastecimentos.qtd_litros,
abastecimentos.total_pagar,
abastecimentos.data,
abastecimentos.hora,
clientes.nome AS cliente,
funcionarios.nome AS funcionario,
combustiveis.descricao AS combustivel,
empresas.fantasia AS posto
FROM abastecimentos
INNER JOIN clientes ON abastecimentos.id_cliente = clientes.id_cliente
INNER JOIN funcionarios ON abastecimentos.id_funcionario = funcionarios.id_funcionario
INNER JOIN empresas ON abastecimentos.id_empresa = empresas.id_empresa
INNER JOIN bicos ON abastecimentos.id_bico = bicos.id_bico
INNER JOIN combustiveis ON combustiveis.id_combustivel = bicos.id_combustivel;

-- e. Exiba a quantidade de abastecimentos realizados por cada funcionário;
SELECT funcionarios.nome AS funcionario,
COUNT(abastecimentos.id_abastecimento) AS qtd_total
FROM funcionarios 
INNER JOIN abastecimentos ON funcionarios.id_funcionario = abastecimentos.id_funcionario
GROUP BY funcionario;

-- f. Exiba a quantidade de litros total abastecidos e o nome do combustível ordenados da maior quantidade para a menor;
SELECT combustiveis.descricao AS combustivel,
SUM(abastecimentos.qtd_litros) AS total_litros
FROM combustiveis
INNER JOIN bicos ON combustiveis.id_combustivel = bicos.id_combustivel
INNER JOIN abastecimentos ON abastecimentos.id_bico = bicos.id_bico
GROUP BY combustivel
ORDER BY total_litros DESC;

-- g. Exiba o id, quantidade de litros, total a pagar, nome do cliente e descrição do combustível de cada abastecimento;
SELECT abastecimentos.id_abastecimento,
abastecimentos.qtd_litros,
abastecimentos.total_pagar,
clientes.nome AS cliente,
combustiveis.descricao AS combustivel
FROM abastecimentos
INNER JOIN clientes ON abastecimentos.id_cliente = clientes.id_cliente
INNER JOIN bicos ON abastecimentos.id_bico = bicos.id_bico
INNER JOIN combustiveis ON bicos.id_combustivel = combustiveis.id_combustivel;

-- Script com ALIAS para Tabelas
SELECT a.id_abastecimento,
a.qtd_litros,
a.total_pagar,
c.nome AS cliente,
comb.descricao AS combustivel
FROM abastecimentos a
INNER JOIN clientes c ON a.id_cliente = c.id_cliente
INNER JOIN bicos b ON a.id_bico = b.id_bico
INNER JOIN combustiveis comb ON b.id_combustivel = comb.id_combustivel;

-- h. Exiba o nome dos clientes, cidade e o nome do seu estado;
SELECT clientes.nome AS cliente,
clientes.cidade,
estados.nome AS estado
FROM clientes INNER JOIN estados ON clientes.id_estado = estados.id_estado;

-- i. Exiba a quantidade de litros total abastecida de cada combustível;
SELECT combustiveis.descricao AS combustivel,
SUM(abastecimentos.qtd_litros) AS total_litros
FROM combustiveis
INNER JOIN bicos ON combustiveis.id_combustivel = bicos.id_combustivel
INNER JOIN abastecimentos ON bicos.id_bico = abastecimentos.id_bico
GROUP BY combustivel;

-- j. Exiba todas as informações dos abastecimentos feitos apenas pelos clientes de Concórdia.
SELECT abastecimentos.*
FROM abastecimentos INNER JOIN clientes ON abastecimentos.id_cliente = clientes.id_cliente
WHERE clientes.cidade = "Concórdia";