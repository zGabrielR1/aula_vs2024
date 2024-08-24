-- a. Exiba a média do valor normal das consultas;
SELECT AVG(valor_normal) AS media_valor_normal FROM consultas;

-- b. Exiba a quantidade de exames por tipo;
SELECT COUNT(id_exame) AS qtd_exames FROM exames GROUP BY tipo;

-- c. Exiba o total do valor normal das consultas;
SELECT SUM(valor_normal) AS media_valor_normal FROM consultas;

-- d. Exiba a quantidade de pacientes do sexo masculino;
SELECT COUNT(id_paciente) AS qtd_pacientes_masc FROM pacientes WHERE sexo = 'M';

-- e. Exiba a quantidade de pacientes por tipo sanguíneo;
SELECT COUNT(id_paciente) AS qtd_pacientes_tipo_sang FROM pacientes GROUP BY tipo_sanguineo;

-- f. Exiba o nome e o peso do terceiro paciente mais pesado;
SELECT nome, peso FROM pacientes ORDER BY peso DESC LIMIT 1 OFFSET 2;
SELECT nome, peso FROM pacientes WHERE peso = (SELECT peso FROM pacientes ORDER BY peso DESC LIMIT 1 OFFSET 2);

-- g. Exiba a quantidade de consultas por médico;
SELECT COUNT(id_consulta) AS qtd_consultas_medico FROM consultas GROUP BY id_medico;

-- h. Exiba o valor total faturado das consultas;
SELECT SUM(valor_final) AS total_faturado FROM consultas;

-- i. Exiba o total faturado das consultas feitas entre o dia 03 e 08 de outubro de 2020;
SELECT SUM(valor_final) AS total_faturado FROM consultas;

-- j. Exiba o nome do paciente mais velho;
SELECT nome FROM pacientes ORDER BY nascimento ASC LIMIT 1;
SELECT nome FROM pacientes WHERE nascimento = (SELECT MIN(nascimento) FROM pacientes);

-- k. Exiba a quantidade de consultas que possuem algo descrito nas observações;
SELECT COUNT(id_consulta) AS qtd_consultas_obs FROM consultas WHERE obs IS NOT NULL;
SELECT COUNT(id_consulta) AS qtd_consultas_obs FROM consultas WHERE obs != '';

-- l. Exiba a média de altura dos pacientes;
SELECT AVG(altura) AS media_altura FROM pacientes;

-- m. Exiba o nome do paciente mais magro;
SELECT nome FROM pacientes ORDER BY peso ASC LIMIT 1;
SELECT nome FROM pacientes WHERE peso = (SELECT MIN(peso) FROM pacientes);

-- n. Exiba a quantidade de consultas realizadas no período da tarde;
SELECT COUNT(id_consulta) AS qtd_consultas_tarde FROM consultas WHERE TIME(data_hora) BETWEEN '13:00' AND '18:00';

-- o. Exiba o total de desconto que foi aplicado nas consultas;
SELECT SUM(valor_desconto) AS total_desconto FROM consultas;

-- p. Exiba as especialidades dos médicos sem repetição;
SELECT DISTINCT(especialidade) FROM medicos;

-- q. Exiba a quantidade de pacientes por cobertura de convenio;
SELECT COUNT(id_paciente) AS qtd_pacientes_convenio FROM detalhes_convenio GROUP BY cobertura;

-- r. Exiba o nome do paciente mais alto.
SELECT nome FROM pacientes ORDER BY altura DESC LIMIT 1;
SELECT nome FROM pacientes WHERE altura = (SELECT MAX(altura) FROM pacientes);
