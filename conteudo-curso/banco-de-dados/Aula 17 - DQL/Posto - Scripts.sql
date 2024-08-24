-- BANCO DE DADOS
CREATE DATABASE posto 
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE posto;

-- TABELAS
CREATE TABLE clientes (
	id_cliente INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cpf CHAR(14) NOT NULL UNIQUE,
	rg CHAR(20) NOT NULL,
	cnh VARCHAR(255),
	data_nascimento TIMESTAMP,
	telefone VARCHAR(30),
	sexo CHAR(1)
);

CREATE TABLE combustiveis (
	id_combustivel INTEGER AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255) NOT NULL,
	quantidade_estoque DOUBLE DEFAULT 0,
	valor_litro FLOAT DEFAULT 0,
	tipo VARCHAR(255)
);

CREATE TABLE funcionarios (
	id_funcionario INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(14) NOT NULL UNIQUE,
	rg CHAR(20) NOT NULL,
	pis CHAR(20),
	salario FLOAT DEFAULT 0,
	sexo CHAR(1)
);

CREATE TABLE abastecimentos (
	id_abastecimento INTEGER AUTO_INCREMENT PRIMARY KEY,
	quantidade_litros DOUBLE NOT NULL,
	total_pagar DOUBLE NOT NULL,
	hora TIME,
	data DATE,
	id_cliente INTEGER NOT NULL,
	id_funcionario INTEGER NOT NULL,
	id_bico INTEGER NOT NULL
);

CREATE TABLE bicos (
	id_bico INTEGER AUTO_INCREMENT PRIMARY KEY,
	numero INTEGER NOT NULL,
	bomba INTEGER NOT NULL,
	id_combustivel INTEGER NOT NULL
);

-- CHAVES ESTRANGEIRAS
ALTER TABLE abastecimentos ADD FOREIGN KEY(id_cliente) REFERENCES clientes (id_cliente);
ALTER TABLE abastecimentos ADD FOREIGN KEY(id_funcionario) REFERENCES funcionarios (id_funcionario);
ALTER TABLE abastecimentos ADD FOREIGN KEY(id_bico) REFERENCES bicos (id_bico);
ALTER TABLE bicos ADD FOREIGN KEY(id_combustivel) REFERENCES combustiveis (id_combustivel);

-- ALTERAÇÕES
-- a.	Alterar campo QUANTIDADE_LITROS para QTD_LITROS em ABASTECIMENTOS
ALTER TABLE abastecimentos CHANGE COLUMN quantidade_litros qtd_litros DOUBLE;

-- b.	Adicionar campo NASCIMENTO DATE em FUNCIONARIOS
ALTER TABLE funcionarios ADD COLUMN nascimento DATE;

-- c.	Alterar campo VALOR_LITRO para DOUBLE em COMBUSTIVEIS
ALTER TABLE combustiveis MODIFY COLUMN valor_litro DOUBLE; 

-- d.	Excluir campo CNH em CLIENTES
ALTER TABLE clientes DROP COLUMN cnh;

-- e.	Adicionar campo CIDADE VARCHAR(255) em FUNCIONARIOS
ALTER TABLE funcionarios ADD COLUMN cidade VARCHAR(255);

-- f.	Alterar campo DATA_NASCIMENTO para NASCIMENTO DATE em CLIENTES
ALTER TABLE clientes CHANGE COLUMN data_nascimento nascimento DATE;

-- g.	Adicionar campo CIDADE VARCHAR(255) em CLIENTES
ALTER TABLE clientes ADD COLUMN cidade VARCHAR(255);

-- h.	Alterar campo RG para VARCHAR(20) em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN rg VARCHAR(20);

-- i.	Alterar campo PIS para VARCHAR(20) em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN pis VARCHAR(20);

-- j.	Alterar campo QUANTIDADE_ESTOQUE para QTD_ESTOQUE em COMBUSTIVEIS
ALTER TABLE combustiveis CHANGE COLUMN quantidade_estoque qtd_estoque DOUBLE;

-- k.	Alterar campo RG para VARCHAR(20) em CLIENTES
ALTER TABLE clientes MODIFY COLUMN rg VARCHAR(20);

-- l.	Alterar campo SALARIO para DOUBLE em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN salario DOUBLE;

-- m.	Excluir campo TIPO em COMBUSTIVEIS
ALTER TABLE combustiveis DROP COLUMN tipo;

-- n.	Alterar campo CPF para VARCHAR(14) em CLIENTES
ALTER TABLE clientes MODIFY COLUMN cpf VARCHAR(14);

-- renomear tabela BOMBA_COMB para DETALHES_BOMBA
-- ALTER TABLE bomba_comb RENAME TO detalhes_bomba;
-- alterar cammpo ID_BOMBA_COMB para ID_DETALHE_BOMBA em DETALHES_BOMBA
-- ALTER TABLE detalhes_bomba CHANGE COLUMN id_bomba_comb id_detalhe_bomba INT; 

-- o.	Criar tabela ESTADOS com os campos: ID_ESTADO, NOME, UF
CREATE TABLE estados (
	id_estado INTEGER AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(255) NOT NULL, 
	uf CHAR(2) NOT NULL
);

-- p.	Adicionar campo ID_ESTADO INTEGER em FUNCIONARIOS
ALTER TABLE funcionarios ADD COLUMN id_estado INTEGER NOT NULL;

-- q.	Adicionar campo ID_ESTADO INTEGER em CLIENTES
ALTER TABLE clientes ADD COLUMN id_estado INTEGER NOT NULL;

-- r.	Criar tabela EMPRESAS com os campos: ID_EMPRESA, RAZAO_SOCIAL, FANTASIA, CNPJ
CREATE TABLE empresas (
	id_empresa INTEGER AUTO_INCREMENT PRIMARY KEY, 
	razao_social VARCHAR(255) NOT NULL, 
	fantasia VARCHAR(255),
	cnpj VARCHAR(20) NOT NULL
);

-- s.	Adicionar campo ID_EMPRESA INTEGER em ABASTECIMENTOS
ALTER TABLE abastecimentos ADD COLUMN id_empresa INTEGER NOT NULL;

-- t.	Adicionar chave estrangeira ID_EMPRESA em ABASTECIMENTOS
ALTER TABLE abastecimentos ADD FOREIGN KEY (id_empresa) REFERENCES empresas (id_empresa);

-- u.	Adicionar chave estrangeira ID_ESTADO em FUNCIONARIOS
ALTER TABLE funcionarios ADD FOREIGN KEY (id_estado) REFERENCES estados (id_estado);

-- v.	Adicionar chave estrangeira ID_ESTADO em CLIENTES
ALTER TABLE clientes ADD FOREIGN KEY (id_estado) REFERENCES estados (id_estado);

-- w.	Criar índice para NOME em CLIENTES
CREATE INDEX idx_CLIENTES_NOME ON clientes (nome);

-- x.	Criar índice para NOME em FUNCIONARIOS
CREATE INDEX idx_FUNCIONARIOS_NOME ON funcionarios (nome);

-- y.	Criar índice para RG em CLIENTES
CREATE INDEX idx_CLIENTES_RG ON clientes (rg);

-- z.	Criar índice para DESCRICAO em COMBUSTIVEIS
CREATE INDEX idx_COMBUSTIVEIS_DESCRICAO ON combustiveis (descricao);

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

-- FUNCIONÁRIOS
INSERT INTO funcionarios (id_funcionario, nome, cpf, rg, pis, salario, sexo, nascimento, cidade, id_estado) VALUES 
(1, "Juliana Paes", "111.111.111-11", "11.111.111-1", "111.11111.11-1", 2395, "F", "1975-01-04", "Concórdia", 24),
(2, "Raul Cortez", "222.222.222-22", "22.222.222-2", "222.22222.22-2", 2450, "M", "1950-10-09", "Concórdia", 24),
(3, "Cauã Reymond", "333.333.333-33", "33.333.333-3","333.33333.33-3", 1940, "M", "1985-10-27", "Arabutã", 24),
(4, "Stênio Garcia", "444.444.444-44", "44.444.444-4", "444.44444.44-4", 2300, "M", "1955-11-12", "Concórdia", 24),
(5, "Betty Faria", "555.555.555-55", "55.555.555-5", "555.55555.55-5", 1045, "F", "1964-06-27", "Chapecó", 24),
(6, "Suzana Vieira", "666.666.666-66", "66.666.666-6", "666.66666.66-6", 1778, "F", "1959-10-11", "Concórdia", 24),
(7, "Adriana Esteves", "777.777.777-77", "77.777.777-7", "777.77777.77-7", 1300, "F", "1970-01-14", "Concórdia", 24),
(8, "Alexandre Borges", "888.888.888-88", "88.888.888-8", "888.88888.88-8", 2250, "M", "1967-11-28", "Irani", 24),
(9, "Mariana Ximenes", "999.999.999-99", "99.999.999-9", "999.99999.99-9", 1880, "F", "1980-03-05", "Concórdia", 24),
(10, "Nívea Maria", "101.010.101.01", "10.101.010-1", "101.01010.10-1", 1600, "F", "1963-03-05", "Caxias do Sul", 21);

-- CLIENTES
INSERT INTO clientes (id_cliente, nome, cpf, rg, nascimento, telefone, sexo, cidade, id_estado) VALUES 
(1, "Nicolas Cage", "627.989.720-60", "38.229.673-4", "1979-03-23", "(49) 45759-9659", "M", "Concórdia", 24),
(2, "Julia Roberts", "355.535.910-07", "29.653.827-9", "1990-05-03", "(49) 14942-3142", "F", "Chapecó", 24),
(3, "Angelina Jolie", "601.058.450-78", "24.562.828-9", "2003-03-03", "(49) 35328-5051", "F", "Concórdia", 24),
(4, "Tom Hanks", "769.813.290-00", "21.035.182-2", "1991-07-04", "(49) 41562-1326", "M", "Concórdia", 24),
(5, "Charlize Theron", "477.588.620-71", "30.449.834-8", "1968-02-09", "(54) 48543-5987", "F", "Erechim", 21),
(6, "Sandra Bullock", "861.932.580-94", "38.472.800-5", "1996-09-02", "(71) 36827-9702", "F", "Salvador", 5),
(7, "Salma Hayek", "173.364.230-78", "13.263.239-1", "1991-08-31", "(49) 50017-2214", "F", "Concórdia", 24),
(8, "Will Smith", "490.014.910-14", "33.194.586-1", "1982-06-11", "(49) 16016-3226", "M", "Concórdia", 24),
(9, "Adam Sandler", "717.664.680-55", "25.358.881-9", "1956-10-27", "(49) 42117-8884", "M", "Chapecó", 24),
(10, "Jessica Alba", "739.807.290-28", "45.956.874-7", "1961-01-13", "(49) 50581-5670", "F", "Concórdia", 24),
(11, "Jennifer Aniston", "071.482.130-61", "33.295.875-9", "1998-09-13", "(48) 22514-0151", "F", "Florianópolis", 24),
(12, "Maryl Streep", "610.834.910-75", "12.210.211-3", "1999-08-24", "(49) 27200-1756", "F", "Concórdia", 24),
(13, "Johnny Depp", "015.168.810-95", "48.966.663-2", "1965-12-04", "(49) 87425-5149", "M", "Concórdia", 24),
(14, "Scarlett Johansson", "861.114.600-05", "38.878.884-7", "1991-02-24", "(11) 42246-0165", "F", "Santo André", 25),
(15, "John Travolta", "231.048.070-35", "19.609.865-8", "1989-11-23", "(54) 75344-9869", "M", "Erechim", 21),
(16, "Emma Stone", "461.433.690-62", "34.440.226-5", "1983-03-26", "(49) 13199-3469", "F", "Concórdia", 24),
(17, "Tom Cruise", "041.561.980-73", "25.950.814-7", "1982-10-18", "(11) 44443-0641", "M", "São Paulo", 25),
(18, "Joaquin Phoenix", "484.195.670-00", "44.114.807-4", "1961-07-16", "(49) 51248-3084", "M", "Concórdia", 24),
(19, "Sylvester Stallone", "922.408.820-18", "36.791.613-7", "1957-12-09", "(47) 42814-9663", "M", "Joinville", 24),
(20, "Nicole Kidman", "670.234.510-05", "29.662.342-8", "1983-11-09", "(49) 17698-5204", "F", "Concórdia", 24);

-- COMBUSTÍVEIS
INSERT INTO combustiveis (id_combustivel, descricao, qtd_estoque, valor_litro) VALUES 
(1, "Ácool", 900, 3.923),
(2, "Gasolina Comun", 1500, 4.357),
(3, "Gasolina Aditivada", 1200, 4.458),
(4, "Diesel", 2000, 3.873);

-- EMPRESAS
INSERT INTO empresas (id_empresa, razao_social, fantasia, cnpj) VALUES 
(1, "TeiTei Distribuidora de Combustíveis ME", "Auto-Posto Teilão", "96.310.149/0001-46"),
(2, "Teloir Combustíveis ME", "Auto Posto Sorrisão", "24.745.408/0001-50");

-- BICOS
INSERT INTO bicos (id_bico, numero, bomba, id_combustivel) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 2, 2),
(4, 4, 2, 3),
(5, 5, 3, 4),
(6, 6, 3, 4);

-- ABASTECIMENTOS
INSERT INTO abastecimentos (id_abastecimento, qtd_litros, total_pagar, hora, data, id_cliente, id_funcionario, id_bico, id_empresa) VALUES
(1, 20, 87.14, "13:43:00", "2020-10-01", 4, 2, 2, 1),
(2, 36, 156.852, "13:45:00", "2020-10-01", 7, 5, 2, 1),
(3, 14, 54.922, "14:00:06", "2020-10-01", 9, 1, 1, 1),
(4, 67, 259.491, "16:32:12", "2020-10-01", 13, 9, 5, 1),
(5, 30, 133.74, "22:12:19", "2020-10-01", 1, 3, 3, 1),
(6, 19, 74.537, "13:09:23", "2020-10-02", 8, 1, 1, 1),
(7, 55, 213.015, "16:43:28", "2020-10-02", 11, 4, 5, 1),
(8, 29, 126.353, "23:33:05", "2020-10-02", 2, 7, 3, 1),
(9, 5, 21.785, "06:09:33", "2020-10-03", 10, 2, 2, 1),
(10, 45, 200.61, "10:19:34", "2020-10-03", 5, 9, 3, 1),
(11, 33, 147.114, "15:29:40", "2020-10-03", 11, 8, 4, 1),
(12, 45, 196.065, "20:11:33", "2020-10-03", 19, 1, 2, 1),
(13, 80, 309.84, "14:00:06", "2020-10-03", 7, 5, 6, 1),
(14, 12, 47.076, "04:39:42", "2020-10-04", 9, 3, 1, 1),
(15, 19, 82.783, "18:07:55", "2020-10-04", 10, 9, 2, 1),
(16, 25, 108.925, "12:26:01", "2020-10-05", 5, 2, 3, 1),
(17, 9, 35.307, "15:33:00", "2020-10-06", 8, 2, 1, 1),
(18, 30, 133.74, "21:01:57", "2020-10-06", 16, 6, 4, 1),
(19, 22, 95.854, "08:44:09", "2020-10-08", 19, 6, 2, 1),
(20, 50, 193.65, "12:42:28", "2020-10-08", 1, 10, 5, 1),
(21, 12, 53.496, "04:03:12", "2020-10-09", 15, 4, 4, 1),
(22, 38, 149.074, "15:09:45", "2020-10-10", 4, 8, 1, 1),
(23, 120, 464.76, "18:32:14", "2020-10-10", 18, 10, 6, 1),
(24, 56, 216.888, "08:38:20", "2020-10-11", 6, 1, 5, 1),
(25, 11, 47.927, "12:20:55", "2020-10-11", 1, 5, 2, 1),
(26, 48, 213.984, "16:39:06", "2020-10-11", 19, 3, 4, 1),
(27, 27, 117.639, "07:29:47", "2020-10-12", 2, 7, 3, 1),
(28, 63, 243.999, "11:49:23", "2020-10-13", 17, 1, 5, 1),
(29, 16, 62.768, "13:38:03", "2020-10-13", 3, 2, 1, 1),
(30, 51, 197.523, "05:40:22", "2020-10-14", 12, 9, 5, 1);