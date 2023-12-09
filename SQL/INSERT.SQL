-- C:\xampp\mysql\data\resiliadata

-- Função para adcionar alunos de acordo com a tabela csv:
LOAD DATA INFILE 'C:/xampp/csv/CSV_aluno.csv'
REPLACE INTO TABLE aluno
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/xampp/csv/CSV_facilitador.csv'
REPLACE INTO TABLE facilitador
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/xampp/csv/CSV_monitor.csv'
REPLACE INTO TABLE monitor
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- INSERINDO DADOS EM INSTITUIÇÃO
INSERT INTO instituicao (endereco, nome_unidade) VALUES
('Rua da Instituição, 123, Botafogo', 'Senac Botafogo'),
('Rua da Instituição, 661, Centro', 'Senac Centro'),
('Avenida da Escola, 456, Cinelandia', 'Senac Cinelandia');

--

INSERT INTO curso (id_curso, nome_curso, duracao, total_dias) VALUES
(1, 'Formação em Análise de Dados', '6 meses', 180),
(2, 'Segurança da Informação', '6 meses', 180),
(3, 'Sistemas Embarcados', '6 meses', 180),
(4, 'Gestão de Redes de Computadores', '6 meses', 180);


-- INSERINDO DADOS EM DISCIPLINA
INSERT INTO disciplina (nome, carga_horaria) VALUES
('HardSkill', 250),
('SoftSkill', 250);

--


INSERT INTO modulo (curso_fk, numero_modulo, qt_aula, carga_horaria, id_disciplina_fk)
VALUES
(1, 1, 30, 60, 1),
(1, 2, 20, 40, 2),
(1, 3, 25, 50, 1),
(1, 4, 22, 44, 2),
(1, 5, 28, 56, 1),
(2, 1, 35, 70, 1),
(2, 2, 22, 44, 2),
(2, 3, 28, 56, 1),
(2, 4, 18, 36, 2),
(2, 5, 24, 48, 1),
(3, 1, 28, 56, 2),
(3, 2, 18, 36, 1),
(3, 3, 24, 48, 2),
(3, 4, 30, 60, 1),
(3, 5, 22, 44, 2);


-- INSERINDO DADOS EM TURMA
INSERT INTO turma (curso_fk, sala) VALUES
(1, 101),
(2, 201);

-- 

INSERT INTO matricula (matricula, unidade_fk, id_curso_fk, id_turma_fk, status, cpf_aluno_fk)
VALUES
(1, 1, 1, 1, 'Ativa', 12345678901),
(2, 2, 3, 2, 'Ativa', 23456789012),
(3, 3, 2, 1, 'Ativa', 34567890123),
(4, 1, 2, 2, 'Ativa', 45678901234),
(5, 2, 1, 1, 'Ativa', 56789012345),
(6, 3, 1, 2, 'Ativa', 67890123456),
(7, 1, 3, 1, 'Ativa', 78901234567),
(8, 2, 2, 2, 'Ativa', 89012345678),
(9, 3, 3, 1, 'Ativa', 90123456789),
(10, 1, 1, 2, 'Ativa', 12345678909),
(11, 2, 3, 1, 'Ativa', 23456789098),
(12, 3, 2, 2, 'Ativa', 34567890187),
(13, 1, 2, 1, 'Ativa', 45678901276),
(14, 2, 1, 2, 'Ativa', 56789012365),
(15, 3, 1, 1, 'Ativa', 67890123454),
(16, 1, 3, 2, 'Ativa', 78901234543),
(17, 2, 2, 1, 'Ativa', 89012345632),
(18, 3, 3, 2, 'Ativa', 90123456721),
(19, 1, 1, 1, 'Ativa', 01234567890),
(20, 2, 3, 2, 'Ativa', 98765432101);

-- Inserção na tabela presenca_aluno_facilitador
INSERT INTO presenca_aluno_facilitador (id_aula_facilitador, data, cpf_facilitador, matricula_aluno_fk, presenca_facilitador, modulo)
VALUES
(1, '2023-01-01', 45678901234, 1, 1, 1),
(2, '2023-01-02', 56789012345, 2, 0, 1),
(3, '2023-01-03', 67890123456, 3, 1, 2);

-- Inserção na tabela presenca_aluno_monitor
INSERT INTO presenca_aluno_monitor (id_aula_monitor_fk, data, cpf_monitor, matricula_aluno_fk, presenca_monitor, modulo_fk)
VALUES
(1, '2023-01-01', 12345678901, 1, 1, 1),
(2, '2023-01-02', 23456789012, 2, 0, 1),
(3, '2023-01-03', 34567890123, 3, 1, 2);

SELECT * FROM presenca_aluno_monitor;
SELECT * FROM presenca_aluno_facilitador;
SELECT * FROM presenca;