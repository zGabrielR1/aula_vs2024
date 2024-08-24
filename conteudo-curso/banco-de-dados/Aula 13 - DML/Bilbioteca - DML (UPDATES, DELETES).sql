-- a. Altere o nome do aluno 3 para ‘Marlan Hermínio Beber’.
UPDATE alunos SET nome = 'Marlan Hermínio Beber' WHERE id_aluno = 3;

-- b. Altere respectivamente o cpf e a situação do aluno 8 para ‘818.818.818.81’ e ativo.
UPDATE alunos SET cpf = '818.818.818.81', situacao = 1 WHERE id_aluno = 8;

-- c. Altere a descrição das obras que contenham “O Senhor dos Anéis” para “Lord of the Rings”;
UPDATE obras SET titulo = 'Lord of the Rings' WHERE titulo LIKE 'O Senhor dos Anéis%';

-- d. Altere o nome de todos os alunos que nasceram na década de 90 para “Teste”;
UPDATE alunos SET nome = 'Teste' WHERE nascimento BETWEEN '01-01-1990' AND '31-12-1999';

-- e. Aumente em 15% o salário dos funcionários ativos.
UPDATE funcionarios SET salario = salario * 1.15 WHERE situacao = 1;

-- f. Altere a cidade de todos os alunos que forem do Rio Grande do Sul, para Porto Alegre.
UPDATE alunos SET cidade = 'Porto Alegre' WHERE id_estado = 21;

-- g. Altere a situação do funcionário Adriano para ativo.
UPDATE funcionarios SET situacao = 1 WHERE nome LIKE '%adriano%';

-- h. Remova do banco de dados todos os alunos inativos que não estão devendo.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM alunos WHERE situacao = 0 AND saldo = 0;