-- a. Exibir todos os dados dos alunos que são de Santa Catarina;
SELECT * FROM alunos WHERE id_estado = 24;
SELECT * FROM alunos WHERE id_estado != 24;

-- b. Exibir o título de cada obra de J. R. R. Tolkien;
SELECT titulo FROM obras WHERE id_autor = 2;

-- c. Exibir o nome e o valor de saldo de cada aluno ativo;
SELECT nome, saldo FROM alunos WHERE situacao = 1;

-- d. Exibir o nome de cada aluno inativo que esteja devendo;
SELECT nome FROM alunos WHERE situacao = 0 AND saldo > 0;

-- e. Exibir o id de todos os livros que contenham “Senhor dos Anéis” no título;
SELECT id_obra FROM obras WHERE titulo LIKE '%Senhor dos Anéis%';

-- f. Exibir todos os dados dos empréstimos feitos no mês de setembro de 2016;
SELECT * FROM emprestimos WHERE data_retirada BETWEEN '2016-09-01' AND '2016-09-30';
SELECT * FROM emprestimos WHERE data_retirada LIKE '2016-09%';
SELECT * FROM emprestimos WHERE YEAR(data_retirada) = '2016' AND MONTH(data_retirada) = '09';

-- g. Exibir todos os dados das devoluções feitas em outubro de 2016;
SELECT * FROM emprestimos WHERE data_devolucao BETWEEN '2016-10-01' AND '2016-10-31';
SELECT * FROM emprestimos WHERE data_retirada LIKE '2016-10%';
SELECT * FROM emprestimos WHERE YEAR(data_retirada) = '2016' AND MONTH(data_retirada) = '10';

-- h. Exibir o nome de todos os alunos do sexo masculino que estejam ativos;
SELECT nome FROM alunos WHERE sexo = 'M' AND situacao = 1;

-- i. Exibir o nome, cpf e o sexo dos alunos ativos de Concórdia;
SELECT nome, 
	   cpf, 
       sexo 
FROM alunos 
WHERE situacao = 1 AND cidade = 'Concórdia';

-- j. Exibir todos os dados dos alunos cujo o nome comece com a leta “T” ou termine com a letra “R”;
SELECT * FROM alunos WHERE nome LIKE 'T%' OR nome LIKE '%R';

-- k. Exibir o nome, cpf e data de nascimento dos alunos que nasceram antes da década de 90.
SELECT nome, cpf, nascimento FROM alunos WHERE nascimento < '1990-01-01';

