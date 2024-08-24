-- a. Exiba uma lista com o nome do aluno, sua cidade e o nome do seu estado;
SELECT alunos.nome, 
	   alunos.cidade, 
       estados.nome AS estado
FROM alunos
INNER JOIN estados ON alunos.id_estado = estados.id_estado;

-- Com apelido nas tabelas
SELECT a.nome, 
	   a.cidade, 
       e.nome AS estado
FROM alunos a
INNER JOIN estados e ON a.id_estado = e.id_estado;

-- b. Exiba uma lista com a id das empréstimos e o nome do funcionário ativo que as efetuou, ordenando pela data que foi efetuada o empréstimo;
SELECT emprestimos.id_emprestimo,
	   funcionarios.nome
FROM emprestimos 
INNER JOIN funcionarios ON emprestimos.id_funcionario = funcionarios.id_funcionario
WHERE funcionarios.situacao = 1
ORDER BY emprestimos.data_retirada;

-- c. Exiba uma lista com os títulos das obras e o nome do autor ao lado;
SELECT obras.titulo AS livro,
	   autores.nome AS autor
FROM obras 
INNER JOIN autores ON obras.id_autor = autores.id_autor;
-- INNER JOIN autores USING(id_autor);

-- d. Exiba o id, total de obras, data de retirada, data de devolução, nome do aluno e nome do funcionário de todas os empréstimos;
SELECT emprestimos.id_emprestimo,
	   emprestimos.total_obras,
	   emprestimos.data_retirada,
       emprestimos.data_devolucao,
       alunos.nome AS aluno,
       funcionarios.nome AS funcionario
FROM emprestimos 
INNER JOIN alunos ON emprestimos.id_aluno = alunos.id_aluno
INNER JOIN funcionarios ON emprestimos.id_funcionario = funcionarios.id_funcionario;

-- e. Exiba todas as informações dos empréstimos feitos apenas por alunos do sexo masculino;
SELECT emprestimos.*
FROM emprestimos
INNER JOIN alunos ON emprestimos.id_aluno = alunos.id_aluno
WHERE alunos.sexo = 'M';

-- f. Exiba o nome do livro e a quantidade de vezes que foi retirado, em ordem do mais retirado para o menos retirado;
SELECT obras.titulo, 
	   COUNT(detalhes_emp.id_obra) AS qtd_retirado
FROM detalhes_emp
INNER JOIN obras ON detalhes_emp.id_obra = obras.id_obra
GROUP BY detalhes_emp.id_obra
ORDER BY qtd_retirado DESC;

-- g. Exiba o nome e a quantidade de locações que cada funcionário realizou ordenado pelo nome do funcionário;
SELECT funcionarios.nome, 
	   COUNT(emprestimos.id_emprestimo) AS qtd_emprestimos
FROM funcionarios
INNER JOIN emprestimos ON funcionarios.id_funcionario = emprestimos.id_funcionario
GROUP BY emprestimos.id_funcionario
ORDER BY funcionarios.nome;

-- h. Exiba o nome de todos os livros que já foram emprestados, sem repetição e ordenados por ordem alfabética;
SELECT DISTINCT(obras.titulo) AS livro
FROM obras
INNER JOIN detalhes_emp ON obras.id_obra = detalhes_emp.id_obra
ORDER BY livro;

-- i. Exiba uma lista sem repetição com os títulos das obras retiradas no mês de setembro de 2016;
SELECT DISTINCT(obras.titulo) AS titulo
FROM obras
INNER JOIN detalhes_emp ON obras.id_obra = detalhes_emp.id_obra
INNER JOIN emprestimos ON detalhes_emp.id_emprestimo = emprestimos.id_emprestimo
WHERE emprestimos.data_retirada BETWEEN '2016-09-01' AND '2016-09-30';

SELECT obras.titulo
FROM obras
INNER JOIN detalhes_emp ON obras.id_obra = detalhes_emp.id_obra
INNER JOIN emprestimos ON detalhes_emp.id_emprestimo = emprestimos.id_emprestimo
WHERE emprestimos.data_retirada BETWEEN '2016-09-01' AND '2016-09-30'
GROUP BY obras.titulo;

-- j. Exiba uma lista com os nomes dos autores e quantidade de vezes que suas obras foram emprestadas.
SELECT autores.nome,
	   COUNT(detalhes_emp.id_obra) AS qtd_retirado
FROM detalhes_emp
INNER JOIN obras ON detalhes_emp.id_obra = obras.id_obra
INNER JOIN autores ON obras.id_autor = autores.id_autor
GROUP BY autores.id_autor;




