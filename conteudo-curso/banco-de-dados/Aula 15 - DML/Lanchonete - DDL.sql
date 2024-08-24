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