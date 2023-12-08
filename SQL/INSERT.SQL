--

INSERT INTO curso (id_curso, nome_curso, duracao) VALUES
(1, "Formação em Análise de Dados", "6 meses"),
(2, "Segurança da Informação", "6 meses"),
(3, "Sistemas Embarcados", "6 meses"),
(4, "Gestão de Redes de Computadores", "6 meses");

--

INSERT INTO matricula (matricula, unidade_fk, id_curso_fk, status, cpf_aluno_fk)
VALUES
(1, 1, 1, 'Ativa', 12345678901),
(2, 2, 3, 'Ativa', 23456789012),
(3, 3, 2, 'Ativa', 34567890123),
(4, 1, 2, 'Ativa', 45678901234),
(5, 2, 1, 'Ativa', 56789012345),
(6, 3, 1, 'Ativa', 67890123456),
(7, 1, 3, 'Ativa', 78901234567),
(8, 2, 2, 'Ativa', 89012345678),
(9, 3, 3, 'Ativa', 90123456789),
(10, 1, 1, 'Ativa', 12345678909),
(11, 2, 3, 'Ativa', 23456789098),
(12, 3, 2, 'Ativa', 34567890187),
(13, 1, 2, 'Ativa', 45678901276),
(14, 2, 1, 'Ativa', 56789012365),
(15, 3, 1, 'Ativa', 67890123454),
(16, 1, 3, 'Ativa', 78901234543),
(17, 2, 2, 'Ativa', 89012345632),
(18, 3, 3, 'Ativa', 90123456721),
(19, 1, 1, 'Ativa', 01234567890),
(20, 2, 3, 'Ativa', 98765432101);

--

INSERT INTO modulo (curso_fk, qt_aula, carga_horaria, id_disciplina_fk)
VALUES
(1, 30, 60, 1),
(1, 20, 40, 2),
(1, 25, 50, 3),
(2, 35, 70, 4),
(2, 22, 44, 5),
(2, 28, 56, 6),
(3, 28, 56, 7),
(3, 18, 36, 8),
(3, 24, 48, 9);

--

