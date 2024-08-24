-- a. Exiba o número da nota, quantidade de produtos e valor a pagar das vendas à vista, ordenadas pelo maior valor de venda;
SELECT numero_nota, qtd_produtos, valor_pagar FROM vendas WHERE forma_pgto= "Dinheiro" ORDER BY valor_pagar DESC;

-- b. Exiba quantas vendas tiveram desconto;
SELECT COUNT(id_venda) AS qtd_vendas_desconto FROM vendas WHERE valor_desconto>0;

-- c. Exiba a média de idade dos clientes do sexo masculino;
SELECT AVG(DATEDIFF(NOW(), nascimento) / 365.25) AS media_idade FROM clientes WHERE sexo="M";

-- d. Exiba o nome do cliente com o maior saldo devedor;
SELECT nome FROM clientes WHERE saldo = (SELECT MAX(saldo) FROM clientes);
SELECT nome FROM clientes ORDER BY saldo DESC LIMIT 1;

-- e. Exiba qual foi o valor da menor venda realizada;
SELECT MIN(valor_pagar) AS menor_valor_pago FROM vendas;

-- f. Exiba qual foi a quantidade de produtos vendidos por dia;
SELECT data, SUM(qtd_produtos) AS qtd_produtos_vendidos FROM vendas GROUP BY data;

-- g. Exiba o valor da terceira maior venda realizada que esteja finalizada;
SELECT valor_pagar FROM vendas WHERE situacao=0 ORDER BY valor_pagar DESC LIMIT 1 OFFSET 2;

-- h. Exiba o valor original (subtraindo o acréscimo) das vendas com acréscimo;
SELECT (valor_pagar-valor_acrescimo) AS valor_original FROM vendas WHERE valor_acrescimo>0;

-- i. Exiba a médias dos preços dos produtos por categoria;
SELECT categoria, AVG(preco_venda) AS media_preco FROM produtos GROUP BY categoria;

-- j. Exiba quantos funcionários recebem mais do que um salário mínimo e meio (R$998,00);
SELECT COUNT(id_funcionario) AS qtd_funcionarios FROM funcionarios WHERE salario>998;

-- k. Exiba as formas de pagamento existentes em vendas sem que haja repetição dos valores;
SELECT DISTINCT(forma_pgto) FROM vendas;

-- l. Exiba as categorias dos produtos sem repetição;
SELECT DISTINCT(categoria) FROM produtos;

-- m. Exiba o total recebido por forma de pagamento.
SELECT forma_pgto, SUM(valor_pagar) AS total FROM vendas GROUP BY forma_pgto;
