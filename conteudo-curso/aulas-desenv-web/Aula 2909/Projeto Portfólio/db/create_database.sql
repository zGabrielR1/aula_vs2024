-- Script para criação do banco de dados do Projeto Portfólio

-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS db_pratica0309;
USE db_pratica0309;

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    nascimento DATE NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    uf CHAR(2) NOT NULL
);

-- Tabela de produtos
CREATE TABLE IF NOT EXISTS produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    imagem VARCHAR(255)
);

-- Inserindo usuário administrador padrão (opcional)
INSERT INTO usuarios (nome, email, senha) VALUES 
('Administrador', 'admin@email.com', '123456');

-- Inserindo alguns clientes de exemplo (opcional)
INSERT INTO clientes (nome, cpf, nascimento, sexo, cidade, uf) VALUES 
('João Silva', '123.456.789-00', '1990-01-15', 'M', 'São Paulo', 'SP'),
('Maria Oliveira', '987.654.321-00', '1985-05-20', 'F', 'Rio de Janeiro', 'RJ');

-- Inserindo alguns produtos de exemplo (opcional)
INSERT INTO produtos (nome, descricao, preco, estoque, imagem) VALUES 
('Notebook Gamer', 'Notebook de alto desempenho para jogos', 3500.00, 10, 'notebook.jpg'),
('Smartphone Android', 'Smartphone com sistema Android e câmera de alta resolução', 1200.00, 25, 'smartphone.jpg');