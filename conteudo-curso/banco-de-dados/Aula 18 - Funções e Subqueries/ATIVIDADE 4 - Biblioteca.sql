-- a. Exiba o nome do aluno mais velho cadastrado;
SELECT nome FROM alunos ORDER BY nascimento ASC LIMIT 1;
SELECT nome FROM alunos WHERE nascimento = (SELECT MIN(nascimento) FROM alunos);

-- b. Exiba o nome do aluno mais novo cadastrado;
SELECT nome FROM alunos ORDER BY nascimento DESC LIMIT 1;
SELECT nome FROM alunos WHERE nascimento = (SELECT MAX(nascimento) FROM alunos);

-- c. Exiba o nome do quarto aluno mais velho cadastrado;
SELECT nome AS nome_aluno FROM alunos ORDER BY nascimento ASC LIMIT 1 OFFSET 3;

-- d. Exiba a quantidade total de emprestimos feitas;
SELECT COUNT(id_emprestimo) AS total_emprestimos FROM emprestimos;

-- e. Exiba o nome dos alunos organizados por sexo;
SELECT nome, sexo FROM alunos ORDER BY sexo, nome ASC;

-- f. Exiba o valor total que a biblioteca tem para receber dos alunos ativos que estão devendo;
SELECT TRUNCATE(SUM(saldo), 2) AS total_receber FROM alunos WHERE situacao = 1;

-- g. Exiba todas as informações somente das três primeiras locações;
SELECT * FROM emprestimos LIMIT 3;

-- h. Exiba o nome e o saldo, somente dos alunos que estão devendo, e ordene do maior para o menor valor;
SELECT nome, saldo FROM alunos WHERE saldo > 0 ORDER BY saldo DESC;

-- i. Exiba a quantidade total de livros emprestados em setembro de 2016;
SELECT SUM(total_obras) AS total_livros_emprestados 
FROM emprestimos 
WHERE data_retirada BETWEEN '2016-09-01' AND '2016-09-30';

SELECT SUM(total_obras) AS total_livros_emprestados 
FROM emprestimos 
WHERE data_retirada LIKE '2016-09-%';

SELECT SUM(total_obras) AS total_livros_emprestados 
FROM emprestimos 
WHERE YEAR(data_retirada) = 2016 AND MONTH(data_retirada) = 9;

-- j. Exiba o nome das cidades dos alunos, sem repetição;
SELECT DISTINCT(cidade) FROM alunos ORDER BY cidade ASC;

-- k. Exiba a data de retirada e o total de livros cuja quantidade de livros emprestados na mesma data seja maior que 3.;
SELECT data_retirada, SUM(total_obras) AS total_livros FROM emprestimos GROUP BY data_retirada HAVING total_livros > 3; 

-- l. Utilizando subquery e o parâmetro IN, exiba os nomes dos alunos cujo estado seja "Santa Catarina".
SELECT nome FROM alunos WHERE id_estado IN (SELECT id_estado FROM estados WHERE nome = "Santa Catarina");

-- m. Utilizando subquery, exiba uma lista com os nomes dos alunos informando para cada aluno qual foi a quantidade total de livros emprestados.
SELECT nome, (SELECT SUM(total_obras) FROM emprestimos WHERE emprestimos.id_aluno = alunos.id_aluno) AS qtd_total FROM alunos;

-- n. Acrescente na subquery acima uma classificação para mostrar os resultados na ordem do aluno que mais emprestou para o aluno que menos emprestou livros.
SELECT nome, (SELECT SUM(total_obras) FROM emprestimos WHERE emprestimos.id_aluno = alunos.id_aluno) AS qtd_total FROM alunos ORDER BY qtd_total DESC;
