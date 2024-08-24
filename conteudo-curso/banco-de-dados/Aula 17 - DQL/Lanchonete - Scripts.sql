-- BANCO DE DADOS
CREATE DATABASE lanchonete
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE lanchonete;

-- TABELAS
CREATE TABLE funcionarios (
	id_funcionario INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	cpf VARCHAR(14) NOT NULL UNIQUE,
	rg INTEGER,
	pis VARCHAR(30),
	sexo TINYINT,
	salario FLOAT,
	cidade TEXT
);

CREATE TABLE clientes (
	id_cliente INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome TEXT NOT NULL,
	cpf CHAR(14) NOT NULL UNIQUE,
	rg VARCHAR(20),
	data_nascimento DATETIME,
	sexo CHAR(1),
	telefone VARCHAR(22),
	cidade VARCHAR(255)
);

CREATE TABLE produtos (
	id_produto INTEGER AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255) NOT NULL,
	preco_venda DOUBLE NOT NULL,
	quantidade_estoque INTEGER NOT NULL
);

CREATE TABLE mesas (
	id_mesa INTEGER AUTO_INCREMENT PRIMARY KEY,
	numero VARCHAR(6) NOT NULL UNIQUE,
	situacao CHAR(1) DEFAULT 0,
	id_funcionario INTEGER
);

CREATE TABLE comandas (
	id_comanda INTEGER AUTO_INCREMENT PRIMARY KEY,
	valor_total DOUBLE DEFAULT 0,
	situacao TINYINT DEFAULT 0,
	id_mesa INTEGER,
	id_cliente INTEGER,
	id_funcionario INTEGER
);

CREATE TABLE detalhes (
	id_detalhe INTEGER AUTO_INCREMENT PRIMARY KEY,
	quantidade INTEGER,
	total_produto DOUBLE,
	id_produto INTEGER,
	id_comanda INTEGER
);

-- CHAVES ESTRANGEIRAS
ALTER TABLE mesas ADD FOREIGN KEY(id_funcionario) REFERENCES funcionarios (id_funcionario);
ALTER TABLE comandas ADD FOREIGN KEY(id_mesa) REFERENCES mesas (id_mesa);
ALTER TABLE comandas ADD FOREIGN KEY(id_cliente) REFERENCES clientes (id_cliente);
ALTER TABLE comandas ADD FOREIGN KEY(id_funcionario) REFERENCES funcionarios (id_funcionario);
ALTER TABLE detalhes ADD FOREIGN KEY(id_produto) REFERENCES produtos (id_produto);
ALTER TABLE detalhes ADD FOREIGN KEY(id_comanda) REFERENCES comandas (id_comanda);

-- ALTERAÇÕES
-- a.	Renomear tabela DETALHES para DETALHES_COMANDA
ALTER TABLE detalhes RENAME TO detalhes_comanda;

-- b.	Alterar campo NOME para VARCHAR(255) em CLIENTES
ALTER TABLE clientes MODIFY COLUMN nome VARCHAR(255) NOT NULL;

-- c.	Criar índice para NOME em FUNCIONARIOS
CREATE INDEX idx_FUNCIONARIOS_NOME ON funcionarios (nome);

-- d.	Excluir campo RG em CLIENTES
ALTER TABLE clientes DROP COLUMN rg;

-- e.	Alterar campo SITUACAO para TINYINT DEFAULT 0 em MESAS
ALTER TABLE mesas MODIFY COLUMN situacao TINYINT DEFAULT 0;

-- f.	Criar campo DATA_FINALIZADO DATE NOT NULL em COMANDAS
ALTER TABLE comandas ADD COLUMN data_finalizado DATE NOT NULL;

-- g.	Excluir campo TELEFONE em CLIENTES
ALTER TABLE clientes DROP COLUMN telefone;

-- h.	Criar campo PRECO_CUSTO DOUBLE NOT NULL depois de PRECO_VENDA em PRODUTOS
ALTER TABLE produtos ADD COLUMN preco_custo DOUBLE NOT NULL AFTER preco_venda;

-- i.	Alterar campo SALARIO para DOUBLE DEFAULT 0 em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN salario DOUBLE DEFAULT 0;

-- j.	Criar índice para NOME em CLIENTES
CREATE INDEX idx_CLIENTES_NOME ON clientes (nome);

-- k.	Alterar campo SEXO para CHAR(1) em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN sexo CHAR(1);

-- l.	Excluir campo PIS em FUNCIONARIOS
ALTER TABLE funcionarios DROP COLUMN pis;

-- m.	Criar índice para NUMERO em MESAS
CREATE INDEX idx_MESAS_NUMERO ON mesas (numero);

-- n.	Criar campo PER_COMISSAO DOUBLE depois de SALARIO em FUNCIONARIOS
ALTER TABLE funcionarios ADD COLUMN per_comissao DOUBLE AFTER salario;

-- o.	Alterar campo RG para VARCHAR(20) em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN rg VARCHAR(20);

-- p.	Excluir campo RG em FUNCIONARIOS
ALTER TABLE funcionarios DROP COLUMN rg;

-- q.	Criar índice para DESCRICAO em PRODUTOS
CREATE INDEX id_PRODUTOS_DESCRICAO ON produtos (descricao);

-- r.	Criar campo PER_LUCRO DOUBLE NOT NULL em PRODUTOS
ALTER TABLE  produtos ADD COLUMN per_lucro DOUBLE NOT NULL;

-- s.	Alterar campo CPF para VARCHAR(14) em CLIENTES
ALTER TABLE clientes MODIFY COLUMN cpf VARCHAR(14);

-- t.	Alterar campo QUANTIDADE_ESTOQUE para QTD_ESTOQUE DOUBLE NOT NULL em PRODUTOS
ALTER TABLE produtos CHANGE COLUMN quantidade_estoque qtd_estoque DOUBLE NOT NULL;

-- u.	Alterar campo QUANTIDADE para DOUBLE em DETALHES_COMANDA
ALTER TABLE detalhes_comanda MODIFY COLUMN quantidade DOUBLE;

-- v.	Alterar campo NOME para VARCHAR(255) NOT NULL em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN nome VARCHAR(255) NOT NULL;

-- w.	Alterar campo DATA_NASCIMENTO para NASCIMENTO DATE em CLIENTES
ALTER TABLE clientes CHANGE COLUMN data_nascimento nascimento DATE;

-- x.	Alterar campo CIDADE para VARCHAR(255) em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN cidade VARCHAR(255);

-- y.	Mover campo PER_LUCRO para depois de PRECO_CUSTO em PRODUTOS
ALTER TABLE produtos MODIFY COLUMN per_lucro DOUBLE AFTER preco_custo;

-- z.	Mover campo DATA_FINALIZADO depois de VALOR_TOTAL em COMANDAS
ALTER TABLE comandas MODIFY COLUMN data_finalizado DATE AFTER valor_total;

-- aa.	Criar índice para DATA_FINALIZADO em COMANDAS
CREATE INDEX idx_COMANDAS_DATAFINALIZADO ON comandas (data_finalizado);

-- CLIENTES
INSERT INTO clientes (id_cliente, nome, cpf, nascimento, sexo, cidade) VALUES 
(1, "Joaquin Phoenix", "484.195.670-00", "1961-07-16", "M", "Concórdia"), 
(2, "Nicole Kidman", "670.234.510-05", "1983-11-09", "F", "Concórdia"), 
(3, "Angelina Jolie", "601.058.450-78", "2003-03-03", "F", "Concórdia"), 
(4, "Tom Cruise", "041.561.980-73", "1982-10-18", "M", "São Paulo"), 
(5, "Maryl Streep", "610.834.910-75", "1999-08-24", "F", "Concórdia"), 
(6, "Jennifer Aniston", "071.482.130-61", "1998-09-13", "F", "Florianópolis"), 
(7, "Salma Hayek", "173.364.230-78", "1991-08-31", "F", "Concórdia"), 
(8, "John Travolta", "231.048.070-35", "1989-11-23", "M", "Erechim"), 
(9, "Sandra Bullock", "861.932.580-94", "1996-09-02", "F", "Salvador"), 
(10, "Charlize Theron", "477.588.620-71", "1968-02-09", "F", "Erechim"), 
(11, "Johnny Depp", "015.168.810-95", "1965-12-04", "M", "Concórdia"), 
(12, "Adam Sandler", "717.664.680-55", "1956-10-27", "M", "Chapecó"), 
(13, "Will Smith", "490.014.910-14", "1982-06-11", "M", "Concórdia"), 
(14, "Julia Roberts", "355.535.910-07", "1990-05-03", "F", "Chapecó"), 
(15, "Jessica Alba", "739.807.290-28", "1961-01-13", "F", "Concórdia"), 
(16, "Tom Hanks", "769.813.290-00", "1991-07-04", "M", "Concórdia"), 
(17, "Nicolas Cage", "627.989.720-60", "1979-03-23", "M", "Concórdia"), 
(18, "Sylvester Stallone", "922.408.820-18", "1957-12-09", "M", "Joinville"), 
(19, "Scarlett Johansson", "861.114.600-05", "1991-02-24", "F", "Santo André"), 
(20, "Emma Stone", "461.433.690-62", "1983-03-26", "F", "Concórdia");

-- FUNCIONARIOS
INSERT INTO funcionarios (id_funcionario, nome, cpf, sexo, salario, per_comissao, cidade) VALUES 
(1, "Alexandre Borges", "888.888.888-88", "M", 2250, 6.9, "Irani"), 
(2, "Raul Cortez", "222.222.222-22", "M", 2450, 6, "Concórdia"), 
(3, "Stênio Garcia", "444.444.444-44", "M", 2300, 9, "Concórdia"), 
(4, "Cauã Reymond", "333.333.333-33", "M", 1940, 5.5, "Arabutã"), 
(5, "Adriana Esteves", "777.777.777-77", "F", 1300, 2, "Concórdia"), 
(6, "Nívea Maria", "101.010.101.01", "F", 1600, 11, "Caxias do Sul"), 
(7, "Mariana Ximenes", "999.999.999-99", "F", 1880, 0, "Concórdia"), 
(8, "Juliana Paes", "111.111.111-11", "F", 2395, 5, "Concórdia"), 
(9, "Betty Faria", "555.555.555-55", "F", 1045, 8, "Chapecó"), 
(10, "Suzana Vieira", "666.666.666-66", "F", 1778, 3, "Concórdia");

-- MESAS
INSERT INTO mesas (id_mesa, numero, situacao, id_funcionario) VALUES 
(1, "1", 0, 3), 
(2, "2", 1, 6), 
(3, "3", 1, 7), 
(4, "4", 0, 1), 
(5, "5", 0, 2), 
(6, "6", 1, 9), 
(7, "7", 1, 4), 
(8, "8", 1, 9), 
(9, "9", 0, 6);

-- PRODUTOS
INSERT INTO produtos (id_produto, descricao, preco_venda, preco_custo, per_lucro, qtd_estoque) VALUES 
(1, "Cheese Salada", 10.87, 7.5, 45, 100), 
(2, "Cheese Burguer", 13.5, 9, 50, 100), 
(3, "Cheese Bacon", 16.5, 11, 50, 100), 
(4, "Coca-Cola Lata", 2.27, 1.75, 30, 50), 
(5, "Coca-Cola 600ml", 4.22, 3.25, 30, 50), 
(6, "Coca-Cola 1L", 5.8, 4, 45, 30), 
(7, "Batata Frita Porção Pequena", 13.98, 9.99, 40, 100), 
(8, "Batata Frita Porção Grande", 18.9, 13.5, 40, 100), 
(9, "Alcatra com Fritas e Queijo", 29.66, 19.9, 49, 100), 
(10, "Alcatra com Fritas", 23.8, 15.99, 49, 100), 
(11, "Suco Natural Laranja", 3.04, 2.25, 35, 100), 
(12, "Suco Natural Uva", 4.03, 2.99, 35, 100), 
(13, "Suco Natural Manga", 3.78, 2.8, 35, 100), 
(14, "Pizza Média", 24.95, 16.75, 49, 100), 
(15, "Pizza Grande", 29.79, 19.99, 49, 100);

-- COMANDAS
INSERT INTO comandas (id_comanda, valor_total, data_finalizado, situacao, id_mesa, id_cliente, id_funcionario) VALUES 
(1, 25.1, "2021-09-24", 1, 4, 3, 7), 
(2, 16.5, "2021-09-24", 1, 4, 8, 7), 
(3, 10.87, "2021-09-24", 1, 4, 11, 7), 
(4, 20.53, "2021-09-25", 1, 9, 2, 2), 
(5, 17.02, "2021-09-25", 1, 9, 13, 2), 
(6, 29.49, "2021-09-25", 1, 1, 9, 8), 
(7, 32.8, "2021-09-26", 1, 5, 1, 3), 
(8, 17.76, "2021-09-26", 1, 5, 17, 3), 
(9, 4.03, "2021-09-26", 1, 5, 4, 3), 
(10, 29.66, NULL, 0, 7, 5, 1), 
(11, 29.79, NULL, 0, 3, 15, 4), 
(12, 11.6, NULL, 0, 3, 6, 4), 
(13, 13.98, NULL, 0, 3, 19, 4), 
(14, 27.34, NULL, 0, 6, 14, 8), 
(15, 26.28, NULL, 0, 2, 17, 6), 
(16, 24.78, NULL, 0, 2, 16, 6), 
(17, 17.02, NULL, 0, 8, 10, 9), 
(18, 23.2, NULL, 0, 8, 20, 9), 
(19, 30.87, NULL, 0, 8, 2, 9), 
(20, 88.98, NULL, 0, 8, 7, 9);

-- DETALHES COMANDA
INSERT INTO detalhes_comanda (id_detalhe, quantidade, total_produto, id_produto, id_comanda) VALUES 
(1, 2, 11.6, 6, 1), 
(2, 1, 13.5, 2, 1), 
(3, 1, 16.5, 3, 2), 
(4, 1, 10.87, 1, 3), 
(5, 1, 4.03, 12, 4), 
(6, 1, 16.5, 3, 4), 
(7, 1, 13.98, 7, 5), 
(8, 1, 3.04, 11, 5), 
(9, 1, 24.95, 14, 6), 
(10, 2, 4.54, 4, 6), 
(11, 1, 5.8, 6, 7), 
(12, 2, 27, 2, 7), 
(13, 1, 3.78, 13, 8), 
(14, 1, 13.98, 7, 8), 
(15, 1, 4.03, 12, 9), 
(16, 1, 29.66, 9, 10), 
(17, 1, 29.79, 15, 11), 
(18, 2, 11.6, 6, 12), 
(19, 1, 13.98, 7, 13), 
(20, 1, 18.9, 8, 14), 
(21, 2, 8.44, 5, 14), 
(22, 2, 4.54, 4, 15), 
(23, 2, 21.74, 1, 15), 
(24, 2, 21.74, 1, 16), 
(25, 1, 3.04, 11, 16), 
(26, 1, 3.04, 11, 17), 
(27, 1, 13.98, 7, 17), 
(28, 4, 23.2, 6, 18), 
(29, 1, 23.8, 10, 19), 
(30, 1, 4.03, 12, 19), 
(31, 1, 3.04, 11, 19), 
(32, 3, 88.98, 9, 20);