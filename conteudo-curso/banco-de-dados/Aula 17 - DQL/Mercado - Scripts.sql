-- BANCO DE DADOS
CREATE DATABASE mercado 
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE mercado;

-- TABELAS
CREATE TABLE clientes (
	id_cliente INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(20) NOT NULL UNIQUE,
	rg VARCHAR(20) NOT NULL,
	data_nascimento TIMESTAMP,
	sexo CHAR(1),
	telefone CHAR(255)
);

CREATE TABLE vendas (
	id_venda INTEGER AUTO_INCREMENT PRIMARY KEY,
	data DATE NOT NULL,
	hora TIME NOT NULL,
	quantidade_produtos INTEGER,
	acrescimo FLOAT,
	desconto FLOAT,
	valor_pagar FLOAT NOT NULL,
	forma_pagameto VARCHAR(255) DEFAULT "Dinheiro",
	id_cliente INTEGER NOT NULL,
	id_funcionario INTEGER NOT NULL
);

CREATE TABLE funcionarios (
	id_funcionario INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	cpf CHAR(14) NOT NULL UNIQUE,
	rg VARCHAR(20) NOT NULL,
	pis VARCHAR(20),
	salario FLOAT DEFAULT 0,
	sexo VARCHAR(1),
	situacao INTEGER DEFAULT 1
);

CREATE TABLE prod_venda (
	id_prod_venda INTEGER AUTO_INCREMENT PRIMARY KEY,
	quantidade FLOAT,
	valor FLOAT,
	id_produto INTEGER NOT NULL,
	id_venda INTEGER NOT NULL
);

CREATE TABLE produtos (
	id_produto INTEGER AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255) NOT NULL,
	preco_venda FLOAT NOT NULL,
	qtd_estoque FLOAT DEFAULT 0,
	fabricacao DATE,
	validade DATE,
	unidade_medida CHAR(2) DEFAULT "un",
	categoria VARCHAR(255)
);

CREATE TABLE compras (
	id_compra INTEGER AUTO_INCREMENT PRIMARY KEY,
	numero_nota INTEGER NOT NULL,
	data DATE,
	id_produto INTEGER NOT NULL,
	id_fornecedor INTEGER NOT NULL
);

CREATE TABLE fornecedores (
	id_fornecedor INTEGER AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cnpj CHAR(20) NOT NULL UNIQUE,
	telefone VARCHAR(20)
);


-- CHAVES ESTRANGEIRAS
ALTER TABLE vendas ADD FOREIGN KEY(id_cliente) REFERENCES clientes (id_cliente);
ALTER TABLE vendas ADD FOREIGN KEY(id_funcionario) REFERENCES funcionarios (id_funcionario);
ALTER TABLE prod_venda ADD FOREIGN KEY(id_venda) REFERENCES vendas (id_venda);
ALTER TABLE prod_venda ADD FOREIGN KEY(id_produto) REFERENCES produtos (id_produto);
ALTER TABLE compras ADD FOREIGN KEY(id_produto) REFERENCES produtos (id_produto);
ALTER TABLE compras ADD FOREIGN KEY(id_fornecedor) REFERENCES fornecedores (id_fornecedor);

-- ALTERAÇÕES
-- a.	Alterar campo QUANTIDADE_PRODUTOS para QTD_PRODUTOS FLOAT em VENDAS
ALTER TABLE vendas CHANGE COLUMN quantidade_produtos qtd_produtos FLOAT;

-- b.	Adicionar campo SALDO FLOAT em CLIENTES
ALTER TABLE clientes ADD COLUMN saldo FLOAT DEFAULT 0;

-- c.	Alterar campo FORMA_PAGAMENTO para FORMA_PGTO VARCHAR(50) em VENDAS
ALTER TABLE vendas CHANGE COLUMN forma_pagameto forma_pgto VARCHAR(50) DEFAULT "À Vista";

-- d.	Alterar campo SEXO para CHAR(1) em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN sexo CHAR(1) NOT NULL;

-- e.	Alterar campo TELEFONE para VARCHAR(30) em CLIENTES
ALTER TABLE clientes MODIFY COLUMN	telefone VARCHAR(30);

-- f.	Excluir campo VALIDADE em PRODUTOS
ALTER TABLE produtos DROP COLUMN validade;

-- g.	Alterar campo ACRESCIMO para VALOR_ACRESCIMO FLOAT em VENDAS
ALTER TABLE vendas CHANGE COLUMN acrescimo valor_acrescimo FLOAT;

-- h.	Alterar campo DATA_NASCIMENTO para NASCIMENTO DATE em CLIENTES
ALTER TABLE clientes CHANGE COLUMN data_nascimento nascimento DATE;

-- i.	Alterar campo CPF para VARCHAR(14) em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN cpf VARCHAR(14);

-- j.	Adicionar campo SITUACAO INTEGER em VENDAS
ALTER TABLE vendas ADD COLUMN situacao INTEGER;

-- k.	Alterar campo CPF para VARCHAR(14) em CLIENTES
ALTER TABLE clientes MODIFY COLUMN cpf VARCHAR(14);

-- l.	Alterar campo CNPJ para VARCHAR(20) em FORNECEDORES
ALTER TABLE fornecedores MODIFY COLUMN cnpj VARCHAR(20) NOT NULL;

-- m.	Adicionar campo PER_ACRESCIMO FLOAT em VENDAS
ALTER TABLE vendas ADD COLUMN per_acrescimo FLOAT;

-- n.	Alterar campo TELEFONE para VARCHAR(30) em FORNECEDORES
ALTER TABLE fornecedores MODIFY COLUMN telefone VARCHAR(30);

-- o.	Adicionar campo CIDADE VARCHAR(255) em FUNCIONARIOS
ALTER TABLE funcionarios ADD COLUMN cidade VARCHAR(255);

-- p.	Excluir campo FABRICACAO em PRODUTOS
ALTER TABLE produtos DROP COLUMN fabricacao;

-- q.	Adicionar campo PER_DESCONTO FLOAT em VENDAS
ALTER TABLE vendas ADD COLUMN per_desconto FLOAT;

-- r.	Alterar campo DESCONTO para VALOR_DESCONTO FLOAT em VENDAS
ALTER TABLE vendas CHANGE COLUMN desconto valor_desconto FLOAT;

-- s.	Adicionar campo CIDADE VARCHAR(255) em CLIENTES
ALTER TABLE clientes ADD COLUMN cidade VARCHAR(255);

-- t.	Alterar campo NOME para VARCHAR(255) em FUNCIONARIOS
ALTER TABLE funcionarios MODIFY COLUMN nome VARCHAR(255) NOT NULL;

-- u.	Adicionar campo NUMERO_NOTA INTEGER ZEROFILL em VENDAS
ALTER TABLE vendas ADD COLUMN numero_nota INTEGER ZEROFILL;

-- v.	Renomear tabela PROD_VENDA para VENDA_DETALHES
ALTER TABLE prod_venda RENAME TO venda_detalhes;

-- w.	Alterar campo ID_PROD_VENDA para ID_VENDA_DETALHE em VENDA_DETALHES
ALTER TABLE venda_detalhes CHANGE COLUMN id_prod_venda id_venda_detalhe INTEGER AUTO_INCREMENT;

-- x.	Excluir tabela COMPRAS
DROP TABLE compras;

-- y.	Excluir tabela FORNECEDORES
DROP TABLE fornecedores;

-- z.	Criar tabela ESTADOS com os campos: ID_ESTADO, NOME, UF
CREATE TABLE estados (
	id_estado INTEGER AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(255) NOT NULL, 
	uf CHAR(2) NOT NULL
);

-- aa.	Adicionar campo ID_ESTADO INTEGER em CLIENTES
ALTER TABLE clientes ADD COLUMN id_estado INTEGER NOT NULL;

-- bb.	Adicionar campo ID_ESTADO INTEGER em FUNCIONARIOS
ALTER TABLE funcionarios ADD COLUMN id_estado INTEGER NOT NULL;

-- cc.	Criar tabela EMPRESAS com os campos: ID_EMPRESA, RAZAO_SOCIAL, FANTASIA, CNPJ, IE
CREATE TABLE empresas (
	id_empresa INTEGER AUTO_INCREMENT PRIMARY KEY, 
	razao_social VARCHAR(255) NOT NULL, 
	fantasia VARCHAR(255), 
	cnpj VARCHAR(20) NOT NULL, 
	ie VARCHAR(20) NOT NULL
);

-- dd.	Adicionar campo ID_EMPRESA INTEGER em VENDAS
ALTER TABLE vendas ADD COLUMN id_empresa INTEGER NOT NULL;

-- ee.	Adicionar chave estrangeira ID_EMPRESA em VENDAS
ALTER TABLE vendas ADD FOREIGN KEY (id_empresa) REFERENCES empresas (id_empresa);

-- ff.	Adicionar chave estrangeira ID_ESTADO em CLIENTES
ALTER TABLE clientes ADD FOREIGN KEY (id_estado) REFERENCES estados (id_estado);

-- gg.	Adicionar chave estrangeira ID_ESTADO em FUNCIONARIOS
ALTER TABLE funcionarios ADD FOREIGN KEY (id_estado) REFERENCES estados (id_estado);

-- hh.	Mover o campo NUMERO_NOTA para depois de ID_VENDA em VENDAS
ALTER TABLE vendas MODIFY COLUMN numero_nota INTEGER NOT NULL AFTER id_venda;

-- ii.	Mover o campo PER_ACRESCIMO para depois de QTD_PRODUTOS em VENDAS
ALTER TABLE vendas MODIFY COLUMN per_acrescimo FLOAT AFTER qtd_produtos;

-- jj.	Mover o campo PER_DESCONTO para depois de PER_ACRESCIMO em VENDAS
ALTER TABLE vendas MODIFY COLUMN per_desconto FLOAT AFTER per_acrescimo;

-- kk.	Mover o campo SITUACAO para depois de FORMA_PGTO em VENDAS
ALTER TABLE vendas MODIFY COLUMN situacao INTEGER AFTER forma_pgto;

-- ll.	Criar índice para NOME em CLIENTES
CREATE INDEX idx_CLIENTES_NOME ON clientes (nome);

-- mm.	Criar índice para DATA em VENDAS
CREATE INDEX idx_VENDAS_DATA ON vendas (data);

-- nn.	Criar índice para NOME em FUNCIONARIOS
CREATE INDEX idx_FUNCIONARIOS_NOME ON funcionarios (nome);

-- oo.	Criar índice para DESCRICAO em PRODUTOS
CREATE INDEX idx_PRODUTOS_DESCRICAO ON produtos (descricao);

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
INSERT INTO funcionarios (id_funcionario, nome, cpf, rg, pis, salario, sexo, situacao, cidade, id_estado) VALUES 
(1, "Juliana Paes", "111.111.111-11", "11.111.111-1", "111.11111.11-1", 2395, "F", 1, "Concórdia", 24),
(2, "Raul Cortez", "222.222.222-22", "22.222.222-2", "222.22222.22-2", 2450, "M", 1, "Concórdia", 24),
(3, "Cauã Reymond", "333.333.333-33", "33.333.333-3","333.33333.33-3", 1940, "M", 1, "Arabutã", 24),
(4, "Stênio Garcia", "444.444.444-44", "44.444.444-4", "444.44444.44-4", 2300, "M", 0, "Concórdia", 24),
(5, "Betty Faria", "555.555.555-55", "55.555.555-5", "555.55555.55-5", 1045, "F", 1, "Chapecó", 24),
(6, "Suzana Vieira", "666.666.666-66", "66.666.666-6", "666.66666.66-6", 1778, "F", 0, "Concórdia", 24),
(7, "Adriana Esteves", "777.777.777-77", "77.777.777-7", "777.77777.77-7", 1300, "F", 1, "Concórdia", 24),
(8, "Alexandre Borges", "888.888.888-88", "88.888.888-8", "888.88888.88-8", 2250, "M", 0, "Irani", 24),
(9, "Mariana Ximenes", "999.999.999-99", "99.999.999-9", "999.99999.99-9", 1880, "F", 1, "Concórdia", 24),
(10, "Nívea Maria", "101.010.101.01", "10.101.010-1", "101.01010.10-1", 1600, "F", 1, "Caxias do Sul", 21);

-- CLIENTES
INSERT INTO clientes (id_cliente, nome, cpf, rg, nascimento, telefone, sexo, saldo, cidade, id_estado) VALUES 
(1, "Nicolas Cage", "627.989.720-60", "38.229.673-4", "1979-03-23", "(49) 45759-9659", "M", 73.7414, "Concórdia", 24),
(2, "Julia Roberts", "355.535.910-07", "29.653.827-9", "1990-05-03", "(49) 14942-3142", "F", 207.719, "Chapecó", 24),
(3, "Angelina Jolie", "601.058.450-78", "24.562.828-9", "2003-03-03", "(49) 35328-5051", "F", 74.897, "Concórdia", 24),
(4, "Tom Hanks", "769.813.290-00", "21.035.182-2", "1991-07-04", "(49) 41562-1326", "M", 0, "Concórdia", 24),
(5, "Charlize Theron", "477.588.620-71", "30.449.834-8", "1968-02-09", "(54) 48543-5987", "F", 0, "Erechim", 21),
(6, "Sandra Bullock", "861.932.580-94", "38.472.800-5", "1996-09-02", "(71) 36827-9702", "F", 182.04, "Salvador", 5),
(7, "Salma Hayek", "173.364.230-78", "13.263.239-1", "1991-08-31", "(49) 50017-2214", "F", 0, "Concórdia", 24),
(8, "Will Smith", "490.014.910-14", "33.194.586-1", "1982-06-11", "(49) 16016-3226", "M", 0, "Concórdia", 24),
(9, "Adam Sandler", "717.664.680-55", "25.358.881-9", "1956-10-27", "(49) 42117-8884", "M", 0, "Chapecó", 24),
(10, "Jessica Alba", "739.807.290-28", "45.956.874-7", "1961-01-13", "(49) 50581-5670", "F", 52.1451, "Concórdia", 24),
(11, "Jennifer Aniston", "071.482.130-61", "33.295.875-9", "1998-09-13", "(48) 22514-0151", "F", 0, "Florianópolis", 24),
(12, "Maryl Streep", "610.834.910-75", "12.210.211-3", "1999-08-24", "(49) 27200-1756", "F", 0, "Concórdia", 24),
(13, "Johnny Depp", "015.168.810-95", "48.966.663-2", "1965-12-04", "(49) 87425-5149", "M", 0, "Concórdia", 24),
(14, "Scarlett Johansson", "861.114.600-05", "38.878.884-7", "1991-02-24", "(11) 42246-0165", "F", 0, "Santo André", 25),
(15, "John Travolta", "231.048.070-35", "19.609.865-8", "1989-11-23", "(54) 75344-9869", "M", 0, "Erechim", 21),
(16, "Emma Stone", "461.433.690-62", "34.440.226-5", "1983-03-26", "(49) 13199-3469", "F", 0, "Concórdia", 24),
(17, "Tom Cruise", "041.561.980-73", "25.950.814-7", "1982-10-18", "(11) 44443-0641", "M", 63.8037, "São Paulo", 25),
(18, "Joaquin Phoenix", "484.195.670-00", "44.114.807-4", "1961-07-16", "(49) 51248-3084", "M", 0, "Concórdia", 24),
(19, "Sylvester Stallone", "922.408.820-18", "36.791.613-7", "1957-12-09", "(47) 42814-9663", "M", 0, "Joinville", 24),
(20, "Nicole Kidman", "670.234.510-05", "29.662.342-8", "1983-11-09", "(49) 17698-5204", "F", 0, "Concórdia", 24);

-- PRODUTOS
INSERT INTO produtos (id_produto, descricao, preco_venda, qtd_estoque, unidade_medida, categoria) VALUES
(1, "Refrigerante Coca-cola 3l", 8.99, 30, "un", "Bebidas"),
(2, "Ervilha", 3.08, 15, "un", "Alimentação"),
(3, "Arroz 1kg", 4.89, 50, "un", "Alimentação"),
(4, "Refrigerante Pepsi 3l", 7.99, 30, "un", "Bebidas"),
(5, "Beterraba", 2.99, 18, "kg", "Hortifruti"),
(6, "Água sanitária", 4.99, 25, "un", "Limpeza"),
(7, "Leite em pó", 9.12, 30, "un", "Alimentação"),
(8, "Refrigerante Coca-cola 2l", 6.99, 50, "un", "Bebidas"),
(9, "Cenoura", 3.45, 25, "kg", "Hortifruti"),
(10, "Esponja de aço", 3.24, 150, "un", "Limpeza"),
(11, "Abacate", 3.89, 38, "kg", "Hortifruti"),
(12, "Saco de lixo 50l", 10.15, 30, "un", "Limpeza"),
(13, "Feijão 2kg", 3.85, 50, "un", "Alimentação"),
(14, "Mamão", 4.91, 19, "kg", "Hortifruti"),
(15, "Banana", 4.99, 300, "kg", "Hortifruti"),
(16, "Quiabo", 0.45, 0, "kg", "Hortifruti"),
(17, "Condicionador", 11.95, 0, "un", "Limpeza"),
(18, "Extrato de tomate", 3.35, 100, "un", "Alimentação"),
(19, "Fubá", 2.10, 0, "un", "Alimentação"),
(20, "Goiabada", 3.45, 0, "un", "Alimentação"),
(21, "Suco sachê", 0.99, 300, "un", "Bebidas"),
(22, "Café", 5.87, 45, "un", "Alimentação"),
(23, "Sardinha", 3.45, 50, "un", "Alimentação"),
(24, "Desinfetante", 4.90, 25, "un", "Limpeza"),
(25, "Tira manchas", 9.73, 0, "un", "Limpeza"),
(26, "Limpa vidros", 8.45, 0, "un", "Limpeza"),
(27, "Peixe", 25.89, 125, "kg", "Carnes"),
(28, "Leite condensado", 5.80, 0, "un", "Alimentação"),
(29, "Açucar", 3.78, 59, "un", "Alimentação"),
(30, "Bolacha", 2.45, 100, "un", "Alimentação"),
(31, "Presunto", 4.12, 180, "kg", "Carnes"),
(32, "Doce de leite", 5.85, 35, "un", "Alimentação"),
(33, "Atum", 5.90, 40, "un", "Alimentação"),
(34, "Queijo outros", 9.24, 0, "kg", "Frios"),
(35, "Carne Suína", 29.99, 400, "kg", "Carnes"),
(36, "Sabonete", 1.25, 80, "un", "Limpeza"),
(37, "Suco caixinha 500ml", 3.99, 0, "un", "Bebidas"),
(38, "Farinha de milho", 1.89, 50, "un", "Alimentação"),
(39, "Chuchu", 2.86, 0, "kg", "Hortifruti"),
(40, "Sabão em pedra", 2.65, 0, "un", "Limpeza"),
(41, "Carne Vermelha", 38.38, 800, "kg", "Carnes"),
(42, "Arroz 5kg", 9.95, 30, "un", "Alimentação"),
(43, "Farinha de trigo", 1.99, 0, "un", "Alimentação"),
(44, "Farinha de mandioca", 1.59, 35, "un", "Alimentação"),
(45, "Queijo Minas", 29.89, 100, "kg", "Frios"),
(46, "Achocolatado", 7.99, 30, "un", "Alimentação"),
(47, "Detergente", 1.30, 100, "un", "Limpeza"),
(48, "Creme de leite", 3.57, 30, "un", "Alimentação"),
(49, "Milho de pipoca", 2.99, 30, "un", "Alimentação"),
(50, "Refrigerante Pepsi 2l", 5.99, 40, "un", "Bebidas"),
(51, "Sabão em pó", 13.99, 50, "un", "Limpeza"),
(52, "Batata", 2.76, 80, "kg", "Hortifruti"),
(53, "Farofa pronta", 3.80, 0, "un", "Alimentação"),
(54, "Alface", 2.89, 55, "kg", "Hortifruti"),
(55, "Cebola", 0.89, 200, "kg", "Hortifruti"),
(56, "Margarina", 2.49, 40, "un", "Frios"),
(57, "Lustra móveis", 5.12, 0, "un", "Limpeza"),
(58, "Iogurte", 5.63, 100, "un", "Frios"),
(59, "Pão de forma", 5.80, 0, "un", "Alimentação"),
(60, "Leite integral 1l", 3.80, 100, "un", "Bebidas"),
(61, "Chicória", 1.25, 15, "kg", "Hortifruti"),
(62, "Salsa", 0.35, 30, "kg", "Hortifruti"),
(63, "Shampo", 9.80, 15, "un", "Limpeza"),
(64, "Melão", 0.98, 200, "kg", "Hortifruti"),
(65, "Manteiga", 3.99, 0, "un", "Frios"),
(66, "Uva", 4.81, 25, "kg", "Hortifruti"),
(67, "Ovos", 5.45, 100, "un", "Hortifruti"),
(68, "Queijo Mussarela", 18.50, 100, "kg", "Frios"),
(69, "Frango", 18.57, 300, "kg", "Carnes"),
(70, "Amaciante", 8.85, 45, "un", "Limpeza"),
(71, "Refrigerante Coca-cola 2,5l", 7.89, 0, "un", "Bebidas"),
(72, "Mandioca", 3.78, 0, "kg", "Hortifruti"),
(73, "Molho de tomate", 3.15, 80, "un", "Alimentação"),
(74, "Salsicha", 5.60, 0, "un", "Frios"),
(75, "Couve", 3.10, 35, "kg", "Hortifruti"),
(76, "Óleo de cozinha", 5.89, 40, "un", "Alimentação"),
(77, "Arroz 10kg", 15.99, 0, "un", "Alimentação"),
(78, "Molho de pimenta", 3.52, 0, "un", "Alimentação"),
(79, "Sal", 2.95, 100, "un", "Alimentação"),
(80, "Suco garrafa 1l", 5.99, 38, "un", "Bebidas"),
(81, "Milho verde", 2.99, 20, "un", "Alimentação"),
(82, "Feijão 5Kg", 7.89, 30, "un", "Alimentação"),
(83, "Tomate", 5.30, 100, "kg", "Hortifruti"),
(84, "Saco de lixo 30l", 6.68, 0, "un", "Limpeza"),
(85, "Macarrão", 3.87, 80, "un", "Alimentação"),
(86, "Maionese", 5.99, 25, "un", "Alimentação"),
(87, "Alcool", 3.50, 30, "un", "Limpeza"),
(88, "Espinafre",2.96, 0, "kg", "Hortifruti"),
(89, "Leite desnatado 1l", 4.12, 20, "un", "Bebidas"),
(90, "Melancia", 1.10, 300, "kg", "Hortifruti"),
(91, "Leite integral 500ml", 2.59, 0, "un", "Bebidas"),
(92, "Bucha de pia", 0.80, 0, "un", "Limpeza");

-- EMPRESAS
INSERT INTO empresas (id_empresa, razao_social, fantasia, cnpj, ie) VALUES 
(1, "Teilor Gustavo ME", "Mercado Toca do Hobbit", "86.874.267/0001-23", "279.802.293");

-- VENDAS
INSERT INTO vendas (id_venda, numero_nota, data, hora, qtd_produtos, per_acrescimo, per_desconto, valor_acrescimo, valor_desconto, valor_pagar, forma_pgto, situacao, id_cliente, id_funcionario, id_empresa) VALUES 
(1, 2, "2020-10-01", "11:34:55", 7, NULL, NULL, NULL, NULL, 31.38, "Dinheiro", 1, 12, 7, 1),
(2, 3, "2020-10-01", "14:19:11", 9, 12, NULL, 7.52587, NULL, 70.2414, "Prazo", 0, 1, 10, 1),
(3, 4, "2020-10-02", "08:33:12", 2, NULL, 6, NULL, 0.86492, 13.5504, "Dinheiro", 1, 7, 2, 1),
(4, 5, "2020-10-02", "11:20:55", 8, NULL, 8, NULL, 4.28663, 49.2963, "Dinheiro", 1, 2, 9, 1),
(5, 6, "2020-10-02", "15:12:00", 1, NULL, NULL, NULL, NULL, 3.8, "Dinheiro", 1, 15, 3, 1),
(6, 7, "2020-10-03", "10:44:59", 5, 8, NULL, 2.65682, NULL, 35.867, "Prazo", 0, 3, 8, 1),
(7, 8, "2020-10-03", "12:34:12", 7, NULL, NULL, NULL, NULL, 75.7878, "Dinheiro", 1, 2, 5, 1),
(8, 9, "2020-10-03", "16:06:44", 3, 9, NULL, 0.6984, NULL, 8.4584, "Prazo", 0, 6, 9, 1),
(9, 10, "2020-10-03", "18:12:33", 1, NULL, 8, NULL, 0.3912, 4.4988, "Dinheiro", 1, 19, 1, 1),
(10, 11, "2020-10-04", "09:31:11", 1, NULL, NULL, NULL, NULL, 6.99, "Dinheiro", 1, 13, 4, 1),
(11, 12, "2020-10-04", "13:01:56", 4, NULL, 6, NULL, 9.96789, 156.164, "Dinheiro", 1, 6, 5, 1),
(12, 13, "2020-10-05", "07:19:35", 6, 12, NULL, 5.5365, NULL, 51.674, "Prazo", 0, 2, 10, 1),
(13, 14, "2020-10-05", "12:38:59", 2, NULL, NULL, NULL, NULL, 3.44, "Dinheiro", 1, 16, 4, 1),
(14, 15, "2020-10-06", "16:00:31", 1, NULL, NULL, NULL, NULL, 3.5, "Dinheiro", 1, 1, 3, 1),
(15, 16, "2020-10-07", "11:01:59", 9, NULL, NULL, NULL, NULL, 63.8037, "Prazo", 0, 17, 9, 1),
(16, 17, "2020-10-08", "09:23:44", 2, 9, NULL, 1.4382, NULL, 17.4182, "Prazo", 0, 6, 2, 1),
(17, 18, "2020-10-08", "13:08:11", 7, 12, NULL, 3.31719, NULL, 30.9605, "Prazo", 0, 2, 1, 1),
(18, 19, "2020-10-08", "17:19:00", 2, NULL, NULL, NULL, NULL, 8.44, "Dinheiro", 1, 5, 8, 1),
(19, 20, "2020-10-09", "10:05:28", 7, 8, NULL, 3.8626, NULL, 52.1451, "Prazo", 0, 10, 10, 1),
(20, 1, "2020-10-01", "09:45:23", 8, 9, NULL, 3.22266, NULL, 39.03, "Prazo", 0, 3, 8, 1);

-- VENDA_DETALHES
INSERT INTO venda_detalhes (id_venda_detalhe, quantidade, valor, id_produto, id_venda) VALUES 
(1, 1, 4.99, 6, 1),
(2, 1, 5.45, 67, 1),
(3, 1, 3.85, 13, 1),
(4, 1, 8.99, 1, 1),
(5, 1, 3.52, 78, 1),
(6, 1, 0.8, 92, 1),
(7, 1, 3.78, 29, 1),
(8, 1, 5.45, 67, 2),
(9, 1, 8.99, 1, 2),
(10, 1, 7.99, 4, 2),
(11, 1, 2.1, 19, 2),
(12, 6.945, 20.7656, 5, 2),
(13, 1, 1.59, 44, 2),
(14, 1, 9.12, 7, 2),
(15, 1, 4.12, 89, 2),
(16, 1, 2.59, 91, 2),
(17, 1.567, 4.68533, 5, 3),
(18, 1, 9.73, 25, 3),
(19, 3.864, 4.2504, 90, 4),
(20, 1, 10.15, 12, 4),
(21, 1, 9.12, 7, 4),
(22, 1, 2.1, 19, 4),
(23, 1, 5.63, 58, 4),
(24, 2.975, 9.2225, 75, 4),
(25, 1, 4.12, 89, 4),
(26, 1, 8.99, 1, 4),
(27, 1, 3.8, 60, 5),
(28, 1, 3.08, 2, 6),
(29, 1, 7.99, 46, 6),
(30, 1, 9.73, 25, 6),
(31, 1.234, 6.5402, 83, 6),
(32, 1, 5.87, 22, 6),
(33, 1, 2.1, 19, 7),
(34, 1, 7.99, 4, 7),
(35, 1, 15.99, 77, 7),
(36, 1, 3.24, 10, 7),
(37, 1, 8.99, 1, 7),
(38, 9.153, 31.5779, 9, 7),
(39, 1, 5.9, 33, 7),
(40, 1, 2.99, 81, 8),
(41, 1, 3.78, 29, 8),
(42, 1, 0.99, 21, 8),
(43, 1, 4.89, 3, 9),
(44, 1, 6.99, 8, 10),
(45, 1, 3.85, 13, 11),
(46, 1, 2.99, 49, 11),
(47, 1, 13.99, 51, 11),
(48, 4.845, 145.302, 35, 11),
(49, 1, 3.15, 73, 12),
(50, 1, 8.99, 1, 12),
(51, 1, 3.08, 2, 12),
(52, 1, 3.08, 2, 12),
(53, 5.028, 24.6875, 14, 12),
(54, 1, 3.15, 73, 12),
(55, 1, 2.45, 30, 13),
(56, 1, 0.99, 21, 13),
(57, 1, 3.5, 87, 14),
(58, 2.347, 6.71242, 39, 15),
(59, 1, 3.45, 20, 15),
(60, 1, 4.99, 6, 15),
(61, 3.046, 14.6513, 66, 15),
(62, 1, 3.35, 18, 15),
(63, 1, 3.78, 29, 15),
(64, 1, 5.99, 50, 15),
(65, 1, 4.89, 3, 15),
(66, 1, 15.99, 77, 15),
(67, 1, 8.99, 1, 16),
(68, 1, 6.99, 8, 16),
(69, 1, 0.8, 92, 17),
(70, 1, 2.59, 91, 17),
(71, 1, 4.89, 3, 17),
(72, 1, 3.78, 29, 17),
(73, 1.672, 8.34328, 15, 17),
(74, 1, 5.99, 80, 17),
(75, 1, 1.25, 36, 17),
(76, 1, 2.59, 91, 18),
(77, 1, 5.85, 32, 18),
(78, 1.023, 3.97947, 11, 19),
(79, 1, 8.85, 70, 19),
(80, 2.306, 6.59516, 39, 19),
(81, 1, 3.08, 2, 19),
(82, 3.953, 13.6379, 9, 19),
(83, 1, 3.15, 73, 19),
(84, 1, 8.99, 1, 19),
(85, 1, 9.12, 7, 20),
(86, 1, 5.87, 22, 20),
(87, 1, 2.65, 40, 20),
(88, 1, 8.99, 1, 20),
(89, 1, 3.78, 29, 20),
(90, 1, 1.89, 38, 20),
(91, 1.743, 1.9173, 90, 20),
(92, 1, 1.59, 44, 20);