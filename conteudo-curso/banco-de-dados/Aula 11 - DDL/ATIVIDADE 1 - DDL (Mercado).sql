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