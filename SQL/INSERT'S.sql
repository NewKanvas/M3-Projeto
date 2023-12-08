USE resiliadata


-- INSERINDO DADOS EM INSTITUIÇÃO
INSERT INTO instituicao (endereco, nome_unidade) VALUES
('Rua da Instituição, 123, Cidade A', 'Instituição A'),
('Avenida da Escola, 456, Cidade B', 'Escola B');

-- INSERINDO DADOS EM ALUNO
INSERT INTO aluno (nome, cpf, idade, genero, email) VALUES
('Ana Silva', 12345678901, 20, 'Feminino', 'ana.silva@example.com'),
('João Oliveira', 23456789012, 22, 'Masculino', 'joao.oliveira@example.com'),
('Mariana Santos', 34567890123, 21, 'Feminino', 'mariana.santos@example.com'),
('Carlos Pereira', 45678901234, 23, 'Masculino', 'carlos.pereira@example.com'),
('Julia Lima', 56789012345, 19, 'Feminino', 'julia.lima@example.com'),
('Pedro Almeida', 67890123456, 24, 'Masculino', 'pedro.almeida@example.com'),
('Fernanda Costa', 78901234567, 20, 'Feminino', 'fernanda.costa@example.com'),
('Rafael Souza', 89012345678, 22, 'Masculino', 'rafael.souza@example.com'),
('Amanda Rocha', 90123456789, 21, 'Feminino', 'amanda.rocha@example.com'),
('Lucas Santos', 12398765432, 23, 'Masculino', 'lucas.santos@example.com'),
('Camila Oliveira', 23498765431, 20, 'Feminino', 'camila.oliveira@example.com'),
('Gustavo Pereira', 34598765430, 22, 'Masculino', 'gustavo.pereira@example.com'),
('Isabela Lima', 45698765439, 21, 'Feminino', 'isabela.lima@example.com'),
('Ricardo Costa', 56798765438, 24, 'Masculino', 'ricardo.costa@example.com'),
('Aline Souza', 67898765437, 19, 'Feminino', 'aline.souza@example.com'),
('Henrique Rocha', 78998765436, 22, 'Masculino', 'henrique.rocha@example.com'),
('Larissa Santos', 89098765435, 20, 'Feminino', 'larissa.santos@example.com'),
('Diego Oliveira', 90198765434, 23, 'Masculino', 'diego.oliveira@example.com'),
('Vanessa Pereira', 12387654321, 21, 'Feminino', 'vanessa.pereira@example.com'),
('Marcelo Lima', 23487654320, 22, 'Masculino', 'marcelo.lima@example.com');

-- INSERINDO DADOS EM MATRICULA
INSERT INTO matricula (matricula, unidade_fk, id_curso_fk, status, cpf_aluno_fk) VALUES
(1, 1, 1, 'Ativa', 12345678901),
(2, 2, 2, 'Ativa', 23456789012),
(3, 1, 3, 'Ativa', 34567890123),
(4, 2, 1, 'Ativa', 45678901234),
(5, 1, 2, 'Ativa', 56789012345),
(6, 2, 3, 'Ativa', 67890123456),
(7, 1, 1, 'Ativa', 78901234567),
(8, 2, 2, 'Ativa', 89012345678),
(9, 1, 3, 'Ativa', 90123456789),
(10, 2, 1, 'Ativa', 12398765432),
(11, 1, 2, 'Ativa', 23498765431),
(12, 2, 3, 'Ativa', 34598765430),
(13, 1, 1, 'Ativa', 45698765439),
(14, 2, 2, 'Ativa', 56798765438),
(15, 1, 3, 'Ativa', 67898765437),
(16, 2, 1, 'Ativa', 78998765436),
(17, 1, 2, 'Ativa', 89098765435),
(18, 2, 3, 'Ativa', 90198765434),
(19, 1, 1, 'Ativa', 12387654321),
(20, 2, 2, 'Ativa', 23487654320);


-- INSERINDO DADOS EM CURSO
INSERT INTO curso (id_curso, nome_curso, duracao, inicio, fim) VALUES
(1, 'Ciência da Computação', '4 anos', '2023-01-15', '2026-11-30'),
(2, 'Engenharia de Software', '3 anos', '2023-02-10', '2025-11-30'),
(3, 'Design UX/UI', '2 anos', '2023-03-05', '2025-10-15'),
(4, 'Administração de Empresas', '4 anos', '2023-04-20', '2027-01-30'),
(5, 'Psicologia', '5 anos', '2023-05-15', '2028-06-25');

-- INSERINDO DADOS EM TURMA
INSERT INTO turma (curso_fk, sala) VALUES
(1, 101),
(2, 201);

-- INSERINDO DADOS EM MONITOR
INSERT INTO monitor (cpf_monitor, nome, idade, genero, email) VALUES
(98765432101, 'Luciana Oliveira', 25, 'Feminino', 'luciana.oliveira@example.com'),
(87654321098, 'Rodrigo Santos', 23, 'Masculino', 'rodrigo.santos@example.com');

-- INSERINDO DADOS EM FACILITADOR
INSERT INTO facilitador (cpf_facilitador, nome, idade, genero, especializacao, email) VALUES
(11223344556, 'Ana Silva', 30, 'Feminino', 'Desenvolvimento Web', 'ana.silva@example.com'),
(22334455667, 'Carlos Oliveira', 35, 'Masculino', 'Machine Learning', 'carlos.oliveira@example.com'),
(33445566778, 'Mariana Santos', 28, 'Feminino', 'Inteligência Artificial', 'mariana.santos@example.com'),
(44556677889, 'Rafael Souza', 32, 'Masculino', 'Banco de Dados', 'rafael.souza@example.com');

-- INSERINDO DADOS EM MODULO
INSERT INTO modulo (curso_fk, qt_aula, carga_horaria, id_disciplina_fk) VALUES
(1, 40, 120, 1),
(1, 30, 90, 2),
(2, 36, 108, 3),
(2, 44, 132, 4),
(3, 50, 150, 5);

-- INSERINDO DADOS EM DISCIPLINA
INSERT INTO disciplina (nome, carga_horaria) VALUES
('HardSkill', 250),
('SoftSkill', 250);

-- INSERINDO DADOS EM PRESENCA MONITOR
INSERT INTO presenca_aluno_monitor (id_aula_monitor_fk, data, modulo_fk, turma_fk, cpf_monitor) VALUES
(1, '2023-01-15', 1, 1, 98765432101),
(2, '2023-02-10', 2, 2, 87654321098),
(3, '2023-03-05', 3, 1, 98765432101),
(4, '2023-04-20', 4, 2, 87654321098),
(5, '2023-05-15', 5, 1, 98765432101),
(6, '2023-06-10', 1, 2, 87654321098),
(7, '2023-07-05', 2, 1, 98765432101),
(8, '2023-08-20', 3, 2, 87654321098),
(9, '2023-09-15', 4, 1, 98765432101),
(10, '2023-10-10', 5, 2, 87654321098);

-- INSERINDO DADOS EM PRESENCA FACILITADOR
INSERT INTO presenca_aluno_facilitador (id_aula_facilitador, data, cpf_facilitador, modulo, turma_fk) VALUES
(1, '2023-01-15', 11223344556, 1, 1),
(2, '2023-02-10', 22334455667, 2, 2),
(3, '2023-03-05', 33445566778, 3, 1),
(4, '2023-04-20', 44556677889, 4, 2),
(5, '2023-05-15', 11223344556, 5, 1),
(6, '2023-06-10', 22334455667, 1, 2),
(7, '2023-07-05', 33445566778, 2, 1),
(8, '2023-08-20', 44556677889, 3, 2),
(9, '2023-09-15', 11223344556, 4, 1),
(10, '2023-10-10', 22334455667, 5, 2);

-- INSERINDO DADOS EM PRESENCA
INSERT INTO presenca (matricula_fk, cpf_fk, id_aula_facilitador_fk, presenca_facilitador, id_aula_monitor_fk, presenca_monitor) VALUES
(1, 12345678901, 1, 1, 1, 1),
(2, 23456789012, 2, 1, 2, 1),
(3, 34567890123, 3, 1, 3, 1),
(4, 45678901234, 4, 1, 4, 1),
(5, 56789012345, 5, 1, 5, 1),
(6, 67890123456, 6, 1, 6, 1),
(7, 78901234567, 7, 1, 7, 1),
(8, 89012345678, 8, 1, 8, 1),
(9, 90123456789, 9, 1, 9, 1),
(10, 12398765432, 10, 1, 10, 1),
(11, 23498765431, 1, 0, 1, 2),
(12, 34598765430, 2, 2, 2, 2),
(13, 45698765439, 3, 2, 3, 2),
(14, 56798765438, 4, 2, 4, 2),
(15, 67898765437, 5, 2, 5, 2),
(16, 78998765436, 6, 2, 6, 2),
(17, 89098765435, 7, 2, 7, 2),
(18, 90198765434, 8, 2, 8, 2),
(19, 12387654321, 9, 2, 9, 2),
(20, 23487654320, 10, 2, 10, 2);

-- INSERINDO DADOS EM AVALIAÇÃO
INSERT INTO avaliacao (cpf_fk, modulo_fk, nota, status, id_disciplina_fk, nome_modulo_pk) VALUES
(12345678901, 1, 85, 'Aprovado', 1, 1),
(23456789012, 2, 75, 'Aprovado', 2, 2),
(34567890123, 3, 92, 'Aprovado', 3, 3),
(45678901234, 4, 60, 'Reprovado', 4, 4),
(56789012345, 5, 78, 'Aprovado', 5, 5),
(67890123456, 1, 88, 'Aprovado', 1, 1),
(78901234567, 2, 70, 'Aprovado', 2, 2),
(89012345678, 3, 95, 'Aprovado', 3, 3),
(90123456789, 4, 55, 'Reprovado', 4, 4),
(12398765432, 5, 80, 'Aprovado', 5, 5),
(23498765431, 1, 90, 'Aprovado', 1, 1),
(34598765430, 2, 68, 'Aprovado', 2, 2),
(45698765439, 3, 85, 'Aprovado', 3, 3),
(56798765438, 4, 48, 'Reprovado', 4, 4),
(67898765437, 5, 75, 'Aprovado', 5, 5),
(78998765436, 1, 82, 'Aprovado', 1, 1),
(89098765435, 2, 72, 'Aprovado', 2, 2),
(90198765434, 3, 90, 'Aprovado', 3, 3),
(12387654321, 4, 58, 'Reprovado', 4, 4),
(23487654320, 5, 77, 'Aprovado', 5, 5);


SELECT *
FROM curso;