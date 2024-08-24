-- a. Exiba o nome do paciente e do médico e a data da consulta, apenas das consultas feitas após 05/10/2020;
SELECT pacientes.nome AS paciente,
	   medicos.nome AS medico,
       DATE(consultas.data_hora)
FROM consultas 
INNER JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente
INNER JOIN medicos ON consultas.id_medico = medicos.id_medico
WHERE DATE(consultas.data_hora) > '05/10/2020';

-- b. Exiba o nome, cpf e o nome do convênio de todos os pacientes com cobertura total;
SELECT pacientes.nome,
	   pacientes.cpf,
       convenios.nome AS convenio
FROM pacientes
INNER JOIN detalhes_convenio ON pacientes.id_paciente = detalhes_convenio.id_paciente
INNER JOIN convenios ON detalhes_convenio.id_convenio = convenios.id_convenio
WHERE detalhes_convenio.cobertura = 'Total';

-- c. Exiba a média de peso dos pacientes que se consultaram com médicos especialistas em Gastroenterologia;
SELECT AVG(pacientes.peso) AS media_peso
FROM pacientes
INNER JOIN consultas ON pacientes.id_paciente = consultas.id_paciente
INNER JOIN medicos ON consultas.id_medico = medicos.id_medico
WHERE medicos.especialidade = 'Gastroenterologista';

-- d. Exiba o nome do paciente, o nome do médico e a observação da consulta, apenas das consultas que possuam observação;
SELECT pacientes.nome AS paciente,
	   medicos.nome AS medico,
       consultas.obs
FROM consultas
INNER JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente
INNER JOIN medicos ON consultas.id_medico = medicos.id_medico
WHERE consultas.obs IS NOT NULL;

-- e. Exiba o nome do paciente, o nome do convênio e o total da consulta, apenas dos pacientes que possuam convênio com cobertura básica;
SELECT pacientes.nome,
	   convenios.nome AS convenio,
       consultas.valor_final
FROM consultas
INNER JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente
INNER JOIN detalhes_convenio ON detalhes_convenio.id_paciente = pacientes.id_paciente
INNER JOIN convenios ON convenios.id_convenio = detalhes_convenio.id_convenio
WHERE detalhes_convenio.cobertura = 'Básico';

-- f. Exiba o nome do paciente, o nome do médico e o resultado de do exame;
SELECT pacientes.nome AS paciente,
	   medicos.nome AS medico,
	   exames.resultado
FROM exames
INNER JOIN pacientes ON pacientes.id_paciente = exames.id_paciente
INNER JOIN medicos ON medicos.id_medico = exames.id_medico;

-- g. Exiba o nome do paciente e quantidade de convênios que ele possuiu;
SELECT pacientes.nome,
	   COUNT(detalhes_convenio.id_detalhe) AS total_convenio
FROM pacientes
INNER JOIN detalhes_convenio ON pacientes.id_paciente = detalhes_convenio.id_paciente
GROUP BY pacientes.nome;

-- h. Exiba a idade média dos pacientes do convênio "Top Saúde";
SELECT AVG(DATEDIFF(NOW(), pacientes.nascimento) / 365.25) AS media_idade
FROM pacientes
INNER JOIN detalhes_convenio ON pacientes.id_paciente = detalhes_convenio.id_paciente
INNER JOIN convenios ON detalhes_convenio.id_convenio = convenios.id_convenio
WHERE convenios.nome = 'Top Saúde';

-- i. Exiba o nome do médico e o total de consultas faturadas por ele;
SELECT medicos.nome,
	   SUM(consultas.valor_final) AS total_faturado
FROM medicos
INNER JOIN consultas ON medicos.id_medico = consultas.id_medico
GROUP BY medicos.nome;

-- j. Exiba o nome do paciente, o seu peso, a sua altura, o seu tipo sanguíneo e a observação da consulta, apenas dos pacientes que consultaram com a médica Juliana Paes.
SELECT pacientes.nome AS paciente,
	   pacientes.peso,
       pacientes.altura,
       pacientes.tipo_sanguineo,
       consultas.obs,
       medicos.nome AS medico
FROM consultas
INNER JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente
INNER JOIN medicos ON consultas.id_medico = medicos.id_medico
WHERE medicos.nome = 'Juliana Paes';