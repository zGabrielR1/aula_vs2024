-- BANCO DE DADOS
CREATE DATABASE biblioteca
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE biblioteca;

-- TABELAS
CREATE TABLE alunos (
	id_aluno INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cpf CHAR(15) NOT NULL UNIQUE,
	nascimento DATETIME,
	situacao TINYINT DEFAULT 1,
	sexo CHAR(1),
	saldo DOUBLE DEFAULT 0
);

CREATE TABLE locacoes (
	id_locacao INTEGER AUTO_INCREMENT PRIMARY KEY,
	total_obras INTEGER,
	data_retirada DATE NOT NULL,
	data_devolucao DATE NOT NULL,
	id_aluno INTEGER NOT NULL,
	id_funcionario INTEGER NOT NULL
);

CREATE TABLE funcionarios (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	cpf VARCHAR(14) NOT NULL UNIQUE,
	salario FLOAT NOT NULL,
	data_nascimento DATE,
	sexo TINYINT,
	situacao CHAR(1) DEFAULT 1
);

CREATE TABLE loc_obra (
	id_loc_obra INTEGER AUTO_INCREMENT PRIMARY KEY,
	id_obra INTEGER NOT NULL,
	id_locacao INTEGER NOT NULL
);

CREATE TABLE autores (
	id_autor INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	nacionalidade VARCHAR(255)
);

CREATE TABLE obras (
	id_obra INTEGER AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255) NOT NULL,
	qtd_paginas INTEGER,
	id_autor INTEGER NOT NULL
);

-- CHAVES ESTRANGEIRAS
ALTER TABLE locacoes ADD FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno);
ALTER TABLE locacoes ADD FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id);
ALTER TABLE loc_obra ADD FOREIGN KEY (id_obra) REFERENCES obras (id_obra);
ALTER TABLE loc_obra ADD FOREIGN KEY (id_locacao) REFERENCES locacoes (id_locacao);
ALTER TABLE obras ADD FOREIGN KEY (id_autor) REFERENCES autores (id_autor);

-- ALTERAÇÕES
-- a.	Renomear tabela LOCACOES para EMPRESTIMOS
ALTER TABLE locacoes RENAME TO emprestimos;

-- b.	Renomear tabela LOC_OBRA para DETALHES_EMP
ALTER TABLE loc_obra RENAME TO detalhes_emp;

-- c.	Alterar campo SALDO para FLOAT em ALUNOS
ALTER TABLE alunos MODIFY COLUMN saldo FLOAT DEFAULT 0;

-- d.	Mover o campo SITUACAO para depois de SALDO em ALUNOS
ALTER TABLE alunos MODIFY COLUMN situacao TINYINT DEFAULT 1 AFTER saldo;

-- e.	Alterar campo DESCRICAO para TITULO em OBRAS
ALTER TABLE obras CHANGE COLUMN descricao titulo VARCHAR(255) NOT NULL;

-- f.	Alterar campo ID_LOCACAO para ID_EMPRESTIMO em EMPRESTIMOS
ALTER TABLE emprestimos CHANGE COLUMN id_locacao id_emprestimo INTEGER AUTO_INCREMENT;

-- g.	Criar índice para NOME em ALUNOS
CREATE INDEX idx_ALUNOS_NOME ON alunos (nome);

-- h.	Alterar campo CPF para VARCHAR(14) em ALUNOS
ALTER TABLE alunos MODIFY COLUMN cpf VARCHAR(14) NOT NULL;

-- i.	Alterar campo DATA_RETIRADA para DATETIME em EMPRESTIMOS
ALTER TABLE emprestimos MODIFY COLUMN data_retirada DATETIME NOT NULL;

-- j.	Criar índice para DATA_DEVOLUCAO em EMPRESTIMOS
CREATE INDEX idx_EMPRESTIMOS_DEVOLUCAO ON emprestimos (data_devolucao);

-- k.	Criar índice para NOME em AUTORES
CREATE INDEX idx_AUTORES_NOME ON autores (nome);

-- l.	Alterar campo ID_LOCACAO para ID_EMPRESTIMO em DETALHES_EMP
ALTER TABLE detalhes_emp CHANGE COLUMN id_locacao id_emprestimo INTEGER NOT NULL;

-- m.	Excluir campo QTD_PAGINAS em OBRAS
ALTER TABLE obras DROP COLUMN qtd_paginas;

-- n.	Alterar campo ID_LOC_OBRA para ID_DETALHE em DETALHES_EMP
ALTER TABLE detalhes_emp CHANGE COLUMN id_loc_obra id_detalhe INTEGER AUTO_INCREMENT;

-- o.	Alterar campo NASCIMENTO para DATE em ALUNOS
ALTER TABLE alunos MODIFY COLUMN nascimento DATE;

-- p.	Excluir campo NACIONALIDADE em AUTORES
ALTER TABLE autores DROP COLUMN nacionalidade;

-- q.	Criar índice para DATA_RETIRADA em EMPRESTIMOS
CREATE INDEX idx_EMPRESTIMOS_RETIRADA ON emprestimos (data_retirada);

-- r.	Alterar campo DATA_DEVOLUCAO para DATETIME em EMPRESTIMOS
ALTER TABLE emprestimos MODIFY COLUMN data_devolucao DATETIME NOT NULL;

-- s.	Criar índice para NOME em FUNCIONARIOS
CREATE INDEX idx_FUNCIONARIOS_NOME ON funcionarios (nome);

-- t.	Mover o campo SALARIO para depois de SEXO em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN salario FLOAT AFTER sexo;

-- u.	Criar índice para TITULO em OBRAS
CREATE INDEX idx_OBRAS_TITULO ON obras (titulo);

-- v.	Alterar campo DATA_NASCIMENTO para NASCIMENTO DATE em FUNCIONARIOS
ALTER TABLE funcionarios CHANGE COLUMN data_nascimento nascimento DATE;

-- w.	Criar campo CIDADE VARCHAR(255) depois de SITUACAO em ALUNOS 
ALTER TABLE alunos ADD COLUMN cidade VARCHAR(255) AFTER situacao;

-- x.	Criar campo ESTADO_CIVIL VARCHAR(20) depois de SITUACAO em FUNCIONARIOS
ALTER TABLE funcionarios ADD COLUMN estado_civil VARCHAR(20) AFTER situacao;

-- y.	Criar campo CIDADE VARCHAR(255) depois de ESTADO_CIVIL em FUNCIONARIOS
ALTER TABLE funcionarios ADD COLUMN cidade VARCHAR(255) AFTER estado_civil;

-- z.	Criar tabela ESTADOS com os campos: ID_ESTADO, NOME, UF
CREATE TABLE estados (
	id_estado INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255),
	uf CHAR(2) NOT NULL
);

-- aa.	Adicionar campo ID_ESTADO em ALUNOS
ALTER TABLE alunos ADD COLUMN id_estado INTEGER NOT NULL;

-- bb.	Adicionar campo ID_ESTADO em FUNCIONARIOS
ALTER TABLE funcionarios ADD COLUMN id_estado INTEGER NOT NULL;

-- cc.	Adicionar chave estrangeira ID_ESTADO em ALUNOS
ALTER TABLE alunos ADD FOREIGN KEY (id_estado) REFERENCES estados (id_estado);

-- dd.	Adicionar chave estrangeira ID_ESTADO em FUNCIONARIOS
ALTER TABLE funcionarios ADD FOREIGN KEY (id_estado) REFERENCES estados (id_estado);

-- ee.	Alterar campo ID para ID_FUNCIONARIO em FUNCIONARIOS
ALTER TABLE funcionarios CHANGE COLUMN id id_funcionario INTEGER AUTO_INCREMENT;

-- ff.	Alterar o campo SEXO para CHAR(1) em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN sexo CHAR(1);

-- ESTADOS
INSERT INTO estados (id_estado, nome, uf) VALUES
(1, "Acre", "AC"),
(2, "Alagoas", "AL"),
(3, "Amapá", "AP"),
(4, "Amazonas", "AM"),
(5, "Bahia", "BA"),
(6, "Ceará", "CE"),
(7, "Distrito Federal", "DF"),
(8, "Espírito Santo", "ES"),
(9, "Goiás", "GO"),
(10, "Maranhão", "MA"),
(11, "Mato Grosso", "MT"),
(12, "Mato Grosso do Sul", "MS"),
(13, "Minas Gerais", "MG"),
(14, "Pará", "PA"),
(15, "Paraíba", "PB"),
(16, "Paraná", "PR"),
(17, "Pernambuco", "PE"),
(18, "Piauí", "PI"),
(19, "Rio de Janeiro", "RJ"),
(20, "Rio Grande do Norte", "RN"),
(21, "Rio Grande do Sul", "RS"),
(22, "Rondônia", "RO"),
(23, "Roraima", "RR"),
(24, "Santa Catarina", "SC"),
(25, "São Paulo", "SP"),
(26, "Sergipe", "SE"),
(27, "Tocantins", "TO");

-- ALUNOS
INSERT INTO alunos (id_aluno, nome, cpf, nascimento, sexo, saldo, situacao, cidade, id_estado) VALUES
(1, "Ânderson Rodrigues", "111.111.111-11", "1985-09-23", "M", 0, 1, "Passo Fundo", 21),
(2, "Tanna Zilio", "222.222.222-22", "1983-02-10", "F", 2.50, 1, "Londrina", 16),
(3, "Marlan Beber", "333.333.333-33", "1977-11-08", "M", 2, 0, "Jaborá", 24),
(4, "Leonardo Sante", "444.444.444-44", "1986-01-16", "M", 0, 0, "Concórdia", 24),
(5, "Teilor Golunski", "555.555.555-55", "1988-07-13", "M", 0, 1, "Erechim", 21),
(6, "Jordana Segalla", "666.666.666-66", "1991-10-18", "F", 0, 1, "Concórdia", 24),
(7, "Cícero Nicodem", "777.777.777-77", "1994-03-26", "M", 3.85, 1, "Ipumirim", 24),
(8, "Monica Prior", "888.888.888-88", "1992-04-02", "F", 1.45, 0, "Irani", 24),
(9, "Douglas Weimer", "999.999.999-99", "1984-06-27", "M", 3.48, 1, "Ipumirim", 24),
(10, "Claudia Moro", "100.100.100-10", "1970-02-06", "F", 0, 1, "Concórdia", 24);

-- FUNCIONARIOS
INSERT INTO funcionarios (id_funcionario, nome, cpf, nascimento, sexo, salario, situacao, estado_civil, cidade, id_estado) VALUES
(1, "Fernando Pinho", "110.110.110-11", "1975-05-23", "M", 2630, 1, "Casado", "Joaçaba", 24),
(2, "Adriano Machado", "120.120.120-12", "1982-04-10", "M", 1750, 0, "Casado", "Concórdia", 24),
(3, "Edervan Kunz", "130.130.130-13", "1996-10-18", "M", 2245, 1, "Solteiro", "Concórdia", 24);

-- AUTORES
INSERT INTO autores (id_autor, nome) VALUES
(1, "Dan Brown"),
(2, "J. R. R. Tolkien"),
(3, "Andrzej Sapkowski");

-- OBRAS
INSERT INTO obras (id_obra, titulo, id_autor) VALUES
(1, "O Senhor dos Anéis: A Sociedade do Anél", 2),
(2, "Os Filhos de Húrin", 2),
(3, "A Espada do Destino", 3),
(4, "O Senhor dos Anéis: O Retorno do Rei", 2),
(5, "Batismo de Fogo", 3),
(6, "O Hobbit", 2),
(7, "Código da Vinci", 1),
(8, "O Silmarillion", 2),
(9, "Contos Inacabados", 2),
(10, "O Senhor dos Anéis: As Duas Torres", 2);

-- LOCACOES
INSERT INTO emprestimos (id_emprestimo, total_obras, data_retirada, data_devolucao, id_aluno, id_funcionario) VALUES
(1, 2, "2016-09-02", "2016-09-09", 2, 1),
(2, 1, "2016-09-03", "2016-09-10", 6, 1),
(3, 3, "2016-09-03", "2016-09-10", 1, 2),
(4, 1, "2016-09-04", "2016-09-11", 9, 1),
(5, 4, "2016-09-08", "2016-09-15", 5, 3),
(6, 2, "2016-09-08", "2016-09-15", 3, 2),
(7, 1, "2016-09-10", "2016-09-17", 8, 1),
(8, 1, "2016-09-12", "2016-09-19", 4, 1),
(9, 1, "2016-09-17", "2016-09-24", 7, 1),
(10, 1, "2016-09-18", "2016-09-25", 1, 1),
(11, 2, "2016-09-22", "2016-09-29", 6, 2),
(12, 1, "2016-09-25", "2016-10-02", 2, 2),
(13, 3, "2016-09-28", "2016-10-05", 5, 2),
(14, 1, "2016-09-30", "2016-10-07", 10,3),
(15, 1, "2016-10-02", "2016-10-09", 7, 3),
(16, 2, "2016-10-03", "2016-10-10", 8, 1),
(17, 1, "2016-10-03", "2016-10-10", 2, 2),
(18, 2, "2016-10-04", "2016-10-11", 4, 1),
(19, 1, "2016-10-08", "2016-10-15", 3, 3),
(20, 1, "2016-10-10", "2016-10-17", 2, 3);

-- DETALHES_EMP
INSERT INTO detalhes_emp (id_detalhe, id_obra, id_emprestimo) VALUES
(1, 3, 1),
(2, 7, 1),
(3, 1, 2),
(4, 8, 3),
(5, 9, 3),
(6, 10, 3),
(7, 2, 4),
(8, 1, 5),
(9, 10, 5),
(10, 4, 5),
(11, 6, 5),
(12, 5, 6),
(13, 8, 6),
(14, 2, 7),
(15, 10, 8),
(16, 7, 9),
(17, 3, 10),
(18, 4, 11),
(19, 3, 11),
(20, 5, 12),
(21, 8, 13),
(22, 2, 13),
(23, 10, 13),
(24, 7, 14),
(25, 6, 15),
(26, 1, 16),
(27, 2, 16),
(28, 1, 17),
(29, 3, 18),
(30, 4, 18),
(31, 2, 19),
(32, 1, 20);