-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE mercado DEFAULT CHARACTER SET utf8;

USE mercado;

CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(20) NOT NULL UNIQUE,
	rg VARCHAR(20) NOT NULL,
	data_nascimento TIMESTAMP,
	sexo CHAR(1),
	telefone CHAR(255)
);

CREATE TABLE vendas (
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
	data DATE NOT NULL,
	hora TIME NOT NULL,
	quantidade_produtos INT,
	acrescimo FLOAT,
	desconto FLOAT,
	valor_pagar FLOAT NOT NULL,
	forma_pagameto VARCHAR(255) DEFAULT "Dinheiro",
	id_cliente INT NOT NULL,
	id_funcionario INT NOT NULL,
	FOREIGN KEY(id_cliente) REFERENCES clientes (id_cliente)
);

CREATE TABLE funcionarios (
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	cpf CHAR(14) NOT NULL UNIQUE,
	rg VARCHAR(20) NOT NULL,
	pis VARCHAR(20),
	salario FLOAT DEFAULT 0,
	sexo VARCHAR(1),
	situacao INT DEFAULT 1
);

CREATE TABLE prod_venda (
	id_prod_venda INT AUTO_INCREMENT PRIMARY KEY,
	quantidade FLOAT,
	valor FLOAT,
	id_produto INT NOT NULL,
	id_venda INT NOT NULL,
	FOREIGN KEY(id_venda) REFERENCES vendas (id_venda)
);

CREATE TABLE produtos (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255) NOT NULL,
	preco_venda FLOAT NOT NULL,
	qtd_estoque FLOAT DEFAULT 0,
	fabricacao DATE,
	validade DATE,
	unidade_medida CHAR(2) DEFAULT "un",
	categoria VARCHAR(255)
);

CREATE TABLE compras (
	id_compra INT AUTO_INCREMENT PRIMARY KEY,
	numero_nota INT NOT NULL,
	data DATE,
	id_produto INT NOT NULL,
	id_fornecedor INT NOT NULL,
	FOREIGN KEY(id_produto) REFERENCES produtos (id_produto)
);

CREATE TABLE fornecedores (
	id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cnpj CHAR(20) NOT NULL UNIQUE,
	telefone VARCHAR(20)
);

ALTER TABLE vendas ADD FOREIGN KEY(id_funcionario) REFERENCES funcionarios (id_funcionario);
ALTER TABLE prod_venda ADD FOREIGN KEY(id_produto) REFERENCES produtos (id_produto);
ALTER TABLE compras ADD FOREIGN KEY(id_fornecedor) REFERENCES fornecedores (id_fornecedor);
