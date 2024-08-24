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

-- ALUNOS
INSERT INTO alunos (id_aluno, nome, cpf, nascimento, sexo, saldo, situacao, cidade, id_estado) VALUES
(1, "Ânderson Rodrigues", "111.111.111-11", "1985-09-23", "M", 0, 1, "Passo Fundo", 21),
(2, "Tanna Zilio", "222.222.222-22", "1983-02-10", "F", 2.50, 1, "Londrina", 16),
(3, "Marlan Beber", "333.333.333-33", "1977-11-08", "M", 2, 0, "Jaborá", 24),
(4, "Leonardo Sante", "444.444.444-44", "1986-01-16", "M", 0, 0, "Concórdia", 24),
(5, "Teilor Golunski", "555.555.555-55", "1988-07-13", "M", 0, 1, "Erechim", 21),
(6, "Jordana Segalla", "666.666.666-66", "1991-10-18", "F", 0, 1, "Concórdia", 24),
(7, "Cícero Nicodem", "777.777.777-77", "1994-03-26", "M", 3.85, 1, "Ipumirim", 24),
(8, "Monica Prior", "888.888.888-88", "1992-04-02", "F", 1.45, 0, "Irani", 24),
(9, "Douglas Weimer", "999.999.999-99", "1984-06-27", "M", 3.48, 1, "Ipumirim", 24),
(10, "Claudia Moro", "100.100.100-10", "1970-02-06", "F", 0, 1, "Concórdia", 24);

-- FUNCIONARIOS
INSERT INTO funcionarios (id_funcionario, nome, cpf, nascimento, sexo, salario, situacao, estado_civil, cidade, id_estado) VALUES
(1, "Fernando Pinho", "110.110.110-11", "1975-05-23", "M", 2630, 1, "Casado", "Joaçaba", 24),
(2, "Adriano Machado", "120.120.120-12", "1982-04-10", "M", 1750, 0, "Casado", "Concórdia", 24),
(3, "Edervan Kunz", "130.130.130-13", "1996-10-18", "M", 2245, 1, "Solteiro", "Concórdia", 24);

-- AUTORES
INSERT INTO autores (id_autor, nome) VALUES
(1, "Dan Brown"),
(2, "J. R. R. Tolkien"),
(3, "Andrzej Sapkowski");

-- OBRAS
INSERT INTO obras (id_obra, titulo, id_autor) VALUES
(1, "O Senhor dos Anéis: A Sociedade do Anél", 2),
(2, "Os Filhos de Húrin", 2),
(3, "A Espada do Destino", 3),
(4, "O Senhor dos Anéis: O Retorno do Rei", 2),
(5, "Batismo de Fogo", 3),
(6, "O Hobbit", 2),
(7, "Código da Vinci", 1),
(8, "O Silmarillion", 2),
(9, "Contos Inacabados", 2),
(10, "O Senhor dos Anéis: As Duas Torres", 2);

-- LOCACOES
INSERT INTO emprestimos (id_emprestimo, total_obras, data_retirada, data_devolucao, id_aluno, id_funcionario) VALUES
(1, 2, "2016-09-02", "2016-09-09", 2, 1),
(2, 1, "2016-09-03", "2016-09-10", 6, 1),
(3, 3, "2016-09-03", "2016-09-10", 1, 2),
(4, 1, "2016-09-04", "2016-09-11", 9, 1),
(5, 4, "2016-09-08", "2016-09-15", 5, 3),
(6, 2, "2016-09-08", "2016-09-15", 3, 2),
(7, 1, "2016-09-10", "2016-09-17", 8, 1),
(8, 1, "2016-09-12", "2016-09-19", 4, 1),
(9, 1, "2016-09-17", "2016-09-24", 7, 1),
(10, 1, "2016-09-18", "2016-09-25", 1, 1),
(11, 2, "2016-09-22", "2016-09-29", 6, 2),
(12, 1, "2016-09-25", "2016-10-02", 2, 2),
(13, 3, "2016-09-28", "2016-10-05", 5, 2),
(14, 1, "2016-09-30", "2016-10-07", 10,3),
(15, 1, "2016-10-02", "2016-10-09", 7, 3),
(16, 2, "2016-10-03", "2016-10-10", 8, 1),
(17, 1, "2016-10-03", "2016-10-10", 2, 2),
(18, 2, "2016-10-04", "2016-10-11", 4, 1),
(19, 1, "2016-10-08", "2016-10-15", 3, 3),
(20, 1, "2016-10-10", "2016-10-17", 2, 3);

-- DETALHES_EMP
INSERT INTO detalhes_emp (id_detalhe, id_obra, id_emprestimo) VALUES
(1, 3, 1),
(2, 7, 1),
(3, 1, 2),
(4, 8, 3),
(5, 9, 3),
(6, 10, 3),
(7, 2, 4),
(8, 1, 5),
(9, 10, 5),
(10, 4, 5),
(11, 6, 5),
(12, 5, 6),
(13, 8, 6),
(14, 2, 7),
(15, 10, 8),
(16, 7, 9),
(17, 3, 10),
(18, 4, 11),
(19, 3, 11),
(20, 5, 12),
(21, 8, 13),
(22, 2, 13),
(23, 10, 13),
(24, 7, 14),
(25, 6, 15),
(26, 1, 16),
(27, 2, 16),
(28, 1, 17),
(29, 3, 18),
(30, 4, 18),
(31, 2, 19),
(32, 1, 20);