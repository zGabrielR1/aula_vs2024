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