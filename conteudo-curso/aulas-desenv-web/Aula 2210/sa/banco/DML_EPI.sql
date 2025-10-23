-- Inserir usuário administrador padrão
INSERT INTO usuarios (nome, usuario, senha) VALUES 
('Administrador', 'admin', 'admin123');

-- Inserir alguns colaboradores de exemplo
INSERT INTO colaboradores (nome, cpf, data_nascimento) VALUES 
('João Silva', '123.456.789-10', '1975-03-15'),
('Maria Oliveira', '987.654.321-00', '1980-07-22'),
('Carlos Souza', '456.789.123-34', '1990-11-30');

-- Inserir alguns equipamentos de exemplo
INSERT INTO equipamentos (descricao, quantidade_estoque, foto, codigo_barras) VALUES 
('Capacete de Segurança', 10, NULL, 'EPI00001'),
('Luvas de Proteção', 50, NULL, 'EPI00002'),
('Óculos de Proteção', 25, NULL, 'EPI00003'),
('Protetor Auricular', 15, NULL, 'EPI00004');