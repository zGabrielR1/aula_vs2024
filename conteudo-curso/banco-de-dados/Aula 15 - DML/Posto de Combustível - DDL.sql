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