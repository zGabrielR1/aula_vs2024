-- BANCO DE DADOS
CREATE DATABASE consultorio
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE consultorio;

-- TABELAS
CREATE TABLE pacientes (
	id_paciente INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cpf CHAR(14) NOT NULL UNIQUE,
	rg VARCHAR(20) NOT NULL,
	data_nascimento DATETIME,
	telefone VARCHAR(20),
	sexo CHAR(1) NOT NULL,
	peso FLOAT NOT NULL,
	altura DOUBLE NOT NULL,
	tipo_sanguineo VARCHAR(30) NOT NULL
);

CREATE TABLE consultas (
	id_consulta INTEGER AUTO_INCREMENT PRIMARY KEY,
	data DATE NOT NULL,
	hora TIME NOT NULL,
	valor_normal DOUBLE DEFAULT 0,
	valor_final FLOAT DEFAULT 0,
	observacao VARCHAR(255),
	id_paciente INTEGER NOT NULL,
	id_medico INTEGER NOT NULL
);

CREATE TABLE exames (
	id_exame INTEGER AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(255),
	data DATE NOT NULL,
	hora TIME NOT NULL,
	resultado TEXT,
	id_paciente INTEGER NOT NULL,
	id_medico INTEGER NOT NULL
);

CREATE TABLE medicos (
	id_medico INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	crm INTEGER NOT NULL UNIQUE,
	especialidade VARCHAR(255)
);

CREATE TABLE conv_paciente (
	id_conv_paciente INTEGER AUTO_INCREMENT PRIMARY KEY,
	cobertura VARCHAR(255),
	tipo VARCHAR(255),
	id_paciente INTEGER NOT NULL,
	id_convenio INTEGER NOT NULL
);

CREATE TABLE convenios (
	id_convenio INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

-- CHAVES ESTRANGEIRAS
ALTER TABLE consultas ADD FOREIGN KEY(id_paciente) REFERENCES pacientes (id_paciente);
ALTER TABLE consultas ADD FOREIGN KEY(id_medico) REFERENCES medicos (id_medico);
ALTER TABLE exames ADD FOREIGN KEY(id_paciente) REFERENCES pacientes (id_paciente);
ALTER TABLE exames ADD FOREIGN KEY(id_medico) REFERENCES medicos (id_medico);
ALTER TABLE conv_paciente ADD FOREIGN KEY(id_paciente) REFERENCES pacientes (id_paciente);
ALTER TABLE conv_paciente ADD FOREIGN KEY(id_convenio) REFERENCES convenios (id_convenio);

-- ALTERAÇÕES
-- a.	Renomear tabela CONV_PACIENTE para DETALHES_CONVENIO
ALTER TABLE conv_paciente RENAME TO detalhes_convenio;

-- b.	Excluir campo HORA em EXAMES
ALTER TABLE exames DROP COLUMN hora;

-- c.	Criar índice para NOME em PACIENTES
CREATE INDEX idx_PACIENTES_NOME ON pacientes (nome);

-- d.	Alterar campo DATA_NASCIMENTO para NASCIMENTO DATE NOT NULL em PACIENTES
ALTER TABLE pacientes CHANGE COLUMN data_nascimento nascimento DATE NOT NULL;

-- e.	Alterar campo CRM para VARCHAR(20) NOT NULL em MEDICOS
ALTER TABLE medicos MODIFY COLUMN crm VARCHAR(20) NOT NULL;

-- f.	Excluir campo HORA em CONSULTAS
ALTER TABLE consultas DROP COLUMN hora;

-- g.	Alterar campo VALOR_FINAL para DOUBLE em CONSULTAS
ALTER TABLE consultas MODIFY COLUMN valor_final DOUBLE;

-- h.	Mover campo TIPO_SANGUINEO para depois de SEXO em PACIENTES
ALTER TABLE pacientes MODIFY COLUMN tipo_sanguineo VARCHAR(30) NOT NULL AFTER sexo;

-- i.	Alterar campo DATA para DATA_HORA DATETIME NOT NULL em EXAMES
ALTER TABLE exames CHANGE COLUMN data data_hora DATETIME NOT NULL;

-- j.	Alterar campo PESO para DOUBLE NOT NULL em PACIENTES
ALTER TABLE pacientes MODIFY COLUMN peso DOUBLE NOT NULL;

-- k.	Criar índice para NOME em CONVENIOS
CREATE INDEX idx_CONVENIOS_NOME ON convenios (nome);

-- l.	Alterar campo ID_CONV_PACIENTE para ID_DETALHE em DETALHES_CONVENIO
ALTER TABLE detalhes_convenio CHANGE COLUMN id_conv_paciente id_detalhe INTEGER;

-- m.	Criar índice para NOME em MEDICOS
CREATE INDEX idx_MEDICOS_NOME ON medicos (nome);

-- n.	Excluir campo RG em PACIENTES
ALTER TABLE pacientes DROP COLUMN rg;

-- o.	Excluir campo TELEFONE em PACIENTES
ALTER TABLE pacientes DROP COLUMN telefone;

-- p.	Alterar campo OBSERVACAO para OBS TEXT em CONSULTAS
ALTER TABLE consultas CHANGE COLUMN observacao obs TEXT;

-- q.	Alterar campo DATA para DATA_HORA DATETIME NOT NULL em CONSULTAS
ALTER TABLE consultas CHANGE COLUMN data data_hora DATETIME NOT NULL;

-- r.	Criar índice para DATA_HORA em CONSULTAS
CREATE INDEX idx_CONSULTAS_DATA_HORA ON consultas (data_hora);

-- s.	Mover campo TIPO para depois de DATA_HORA em EXAMES
ALTER TABLE exames MODIFY COLUMN tipo VARCHAR(255) AFTER data_hora;

-- t.	Criar índice para DATA_HORA em EXAMES
CREATE INDEX idx_EXAMES_DATA_HORA ON exames (data_hora);

-- u.	Criar campo VALOR_DESCONTO DOUBLE depois de VALOR_NORAL em CONSULTAS
ALTER TABLE consultas ADD COLUMN valor_desconto DOUBLE AFTER valor_normal;

-- v.	Excluir campo TIPO em DETALHES_CONVENIO
ALTER TABLE detalhes_convenio DROP COLUMN tipo;

-- PACIENTES
INSERT INTO pacientes (id_paciente, nome, cpf, nascimento, sexo, tipo_sanguineo, peso, altura) VALUES
(1, "Joaquin Phoenix", "484.195.670-00", "1961-07-16", "M", "A-", 95.9, 1.76),
(2, "Nicole Kidman", "670.234.510-05", "1983-11-09", "F", "A+", 55.0, 1.75),
(3, "Angelina Jolie", "601.058.450-78", "2003-03-03", "F", "O+", 56.7, 1.79),
(4, "Tom Cruise", "041.561.980-73", "1982-10-18", "M", "AB+", 82.9, 1.78),
(5, "Maryl Streep", "610.834.910-75", "1999-08-24", "F", "B-", 65.3, 1.69),
(6, "Jennifer Aniston", "071.482.130-61", "1998-09-13", "F", "A-", 53.9, 1.68),
(7, "Salma Hayek", "173.364.230-78", "1991-08-31", "F", "A-", 61.0, 1.72),
(8, "John Travolta", "231.048.070-35", "1989-11-23", "M", "O-", 95.8, 1.83),
(9, "Sandra Bullock", "861.932.580-94", "1996-09-02", "F", "AB-", 58.7, 1.78),
(10, "Charlize Theron", "477.588.620-71", "1968-02-09", "F", "O+", 59.6, 1.75),
(11, "Johnny Depp", "015.168.810-95", "1965-12-04", "M", "A+", 82.1, 1.78),
(12, "Adam Sandler", "717.664.680-55", "1956-10-27", "M", "AB-", 96.3, 1.81),
(13, "Will Smith", "490.014.910-14", "1982-06-11", "M", "A-", 88.5, 1.84),
(14, "Julia Roberts", "355.535.910-07", "1990-05-03", "F", "O-", 60.0, 1.77),
(15, "Jessica Alba", "739.807.290-28", "1961-01-13", "F", "B+", 56.3, 1.66),
(16, "Tom Hanks", "769.813.290-00", "1991-07-04", "M", "O+", 91.4, 1.79),
(17, "Nicolas Cage", "627.989.720-60", "1979-03-23", "M", "A+", 90.8, 1.82),
(18, "Sylvester Stallone", "922.408.820-18", "1957-12-09", "M", "B+", 95.9, 1.83),
(19, "Scarlett Johansson", "861.114.600-05", "1957-02-24", "F", "A+", 62.3, 1.78),
(20, "Emma Stone", "461.433.690-62", "1983-03-26", "F", "A+", 51.7, 1.74);

-- MÉDICOS
INSERT INTO medicos (id_medico, nome, crm, especialidade) VALUES
(1, "Alexandre Borges", "SC12345", "Cardiologista"),
(2, "Raul Cortez", "SC54321", "Gastroenterologista"),
(3, "Stênio Garcia", "SC67890", "Pneumologista"), 
(4, "Cauã Reymond", "SC09876", "Urologista"),
(5, "Adriana Esteves", "SC15243", "Neurologista"), 
(6, "Nívea Maria", "SC06978", "Ginecologista"),
(7, "Mariana Ximenes", "SC32415", "Gastroenterologista"),
(8, "Juliana Paes", "SC87960", "Cardiologista"),
(9, "Betty Faria", "SC10749", "Nefrologista"),
(10, "Suzana Vieira", "SC93693", "Gastroenterologista");

-- CONVÊNIOS
INSERT INTO convenios (id_convenio, nome) VALUES 
(1, "Super Health"),
(2, "Health On Demand"),
(3, "Top Saúde"),
(4, "UniHealth"),
(5, "João de Deus");

-- DETALHES CONVÊNIO
INSERT INTO detalhes_convenio (id_detalhe, cobertura, id_paciente, id_convenio) VALUES 
(1, "Total", 3, 5), 
(2, "Básico", 13, 4), 
(3, "Total", 19, 3), 
(4, "Básico", 18, 5), 
(5, "Básico", 10, 2), 
(6, "Total", 15, 4), 
(7, "Básico", 20, 2), 
(8, "Total", 6, 5), 
(9, "Básico", 14, 5), 
(10, "Básico", 19, 4), 
(11, "Total", 4, 4), 
(12, "Básico", 5, 5), 
(13, "Básico", 8, 2), 
(14, "Básico", 7, 5), 
(15, "Total", 4, 3), 
(16, "Total", 13, 4), 
(17, "Básico", 16, 3), 
(18, "Total", 6, 5), 
(19, "Total", 17, 1), 
(20, "Básico", 3, 3), 
(21, "Básico", 2, 2), 
(22, "Básico", 17, 4), 
(23, "Total", 1, 1), 
(24, "Básico", 12, 5), 
(25, "Total", 11, 1), 
(26, "Total", 9, 5), 
(27, "Básico", 10, 3), 
(28, "Básico", 14, 1), 
(29, "Total", 13, 5), 
(30, "Básico", 10, 1);

-- CONSULTAS
INSERT INTO consultas (id_consulta, data_hora, valor_normal, valor_desconto, valor_final, obs, id_paciente, id_medico) VALUES 
(1, "2020-10-01 09:00:00", 80, 40, 40, "Suspeita de cálculo renal, solicitado exame de imagem.", 2, 4),
(2, "2020-10-01 10:30:00", 80, 40, 40, "Insuficiência renal, terapia iniciada.", 12, 9),
(3, "2020-10-02 08:00:00", 150, 75, 75, "Taquicardia recorrente.", 16, 1),
(4, "2020-10-02 10:15:00", 100, 50, 50, "Alterações dos hábitos intestinais.", 16, 2),
(5, "2020-10-02 13:30:00", 150, 150, 0, "Enxaqueca recorrente.", 19, 5),
(6, "2020-10-02 15:00:00", 100, 50, 50, "Tosse com catarro, solicitado exame e imagem.", 12, 3),
(7, "2020-10-02 17:25:00", 80, 80, 0, NULL, 9, 9),
(8, "2020-10-03 08:30:00", 100, 50, 50, "Confirmado Gastroenterite, iniciada a terapia com remédios.", 18, 10),
(9, "2020-10-03 10:15:00", 100, 50, 50, NULL, 8, 2),
(10, "2020-10-03 11:00:00", 80, 40, 40, "Infecção urinária confirmada, iniciado a terapia com antibióticos.", 10, 4),
(11, "2020-10-03 14:30:00", 100, 100, 0, NULL, 11, 2),
(12, "2020-10-03 16:00:00", 150, 150, 0, NULL, 3, 5),
(13, "2020-10-03 16:45:00", 150, 75, 75, "Disritmia detectada, iniciada terapia com remédios.", 18, 8),
(14, "2020-10-03 17:10:00", 100, 50, 50, NULL, 2, 3),
(15, "2020-10-04 08:15:00", 100, 50, 50, "Infecção intestinal, terapia com antibióticos.", 2, 7),
(16, "2020-10-04 09:00:00", 150, 150, 0, "Infarto do miocárdio, terapia com anticoagulantes iniciada.", 3, 1),
(17, "2020-10-04 11:30:00", 80, 40, 40, NULL, 14, 4),
(18, "2020-10-04 13:45:00", 150, 150, 0, "Extra sístole detectado, terapia com bloqueadores alpha iniciado.", 19, 8),
(19, "2020-10-04 16:15:00", 100, 50, 50, "Infecção por Clostridium Difficile, iniciada terapia com Metronidazol.", 12, 2),
(20, "2020-10-05 10:30:00", 80, 40, 40, "Exame preventivo ok.", 2, 6),
(21, "2020-10-06 08:00:00", 100, 100, 0, NULL, 1, 10),
(22, "2020-10-06 11:00:00", 80, 40, 40, NULL, 20, 6),
(23, "2020-10-06 15:45:00", 100, 50, 50, "Tudo normal.", 14, 2),
(24, "2020-10-07 09:15:00", 100, 100, 0, "Refluxo recorrente.", 15, 7),
(25, "2020-10-07 10:20:00", 80, 40, 40, "Exame preventivo alterado, solicitado exame de imagem.", 2, 6),
(26, "2020-10-07 11:00:00", 100, 50, 50, NULL, 8, 3),
(27, "2020-10-07 13:45:00", 150, 75, 75, "Tudo normal.", 10, 8),
(28, "2020-10-07 15:30:00", 80, 40, 40, NULL, 12, 9),
(29, "2020-10-07 17:15:00", 80, 80, 0, "Detectado HPV, iniciado terapia com antiviral.", 6, 6),
(30, "2020-10-08 08:00:00", 100, 100, 0, "Diarreia recorrente, solicitado exames de sangue e fezes.", 4, 2),
(31, "2020-10-08 10:15:00", 100, 50, 50, "Confirmado infecção por COVID-19, iniciado terapia com remédios.", 16, 3),
(32, "2020-10-08 11:20:00", 100, 50, 50, NULL, 5, 7),
(33, "2020-10-08 15:00:00", 150, 150, 0, "Enxaqueca recorrente, terapia com analgésicos iniciada.", 6, 5),
(34, "2020-10-08 16:50:00", 150, 75, 75, NULL, 14, 1),
(35, "2020-10-09 09:10:00", 100, 100, 0, NULL, 3, 3),
(36, "2020-10-09 11:30:00", 80, 80, 0, "Insuficiência renal, iniciada terapia.", 17, 9),
(37, "2020-10-09 14:45:00", 150, 150, 0, "Tonturas recorrentes, solicitado exames de imagem.", 19, 5),
(38, "2020-10-10 08:15:00", 150, 150, 0, "Tudo normal.", 15, 8),
(39, "2020-10-10 14:30:00", 150, 150, 0, NULL, 3, 1),
(40, "2020-10-10 17:00:00", 80, 80, 0, "Tudo normal.", 9, 6);

-- EXAMES
INSERT INTO exames (id_exame, data_hora, tipo, resultado, id_paciente, id_medico) VALUES 
(1, "2020-10-01 10:00", "Ultrassom", "Detectado cálculos renais.", 2, 4),
(2, "2020-10-02 09:30", "Tomografia", "Tudo normal.", 14, 4),
(3, "2020-10-03 10:30", "Coleta de Sangue", "Tudo normal.", 8, 2),
(4, "2020-10-03 14:30", "Ultrassom", "Tudo normal.", 17, 9),
(5, "2020-10-04 09:15", "Coleta de Urina", "Detectado infecção urinária.", 9, 9),
(6, "2020-10-04 11:30", "Tomografia", "Tudo normal.", 11, 2),
(7, "2020-10-04 13:30", "Coleta de Sangue", "Detectado infecção intestinal.", 1, 10),
(8, "2020-10-05 13:45", "Tomografia", "Tudo normal.", 19, 5),
(9, "2020-10-05 16:00", "Coleta de Fezes", "Detectado infecção intestinal.", 2, 7),
(10, "2020-10-06 14:30", "Tomografia", "Tudo normal..", 3, 5), 
(11, "2020-10-07 08:30", "Tomografia", "Tudo normal.", 6, 5),
(12, "2020-10-08 10:30", "Holter", "Detectado arritmia cardíaca.", 16, 1), 
(13, "2020-10-08 15:10", "Coleta de Sangue e Fezes", "Detectado infecção intestinal.", 4, 2),
(14, "2020-10-09 11:00", "Coleta de Fezes", "Tudo normal.", 5, 7),
(15, "2020-10-10 16:45", "Coleta de Fezes", "Detectado infecção intestinal.", 1, 10);