'''
Essas informações são colocadas em
planilhas diferentes, dificultando muitas das vezes a extração de dados
estratégicos para a empresa.
1. Gerar uma representação das entidades e seus respectivos atributos e relacionamentos;
2. Criar a modelagem do banco de dados;
3. Criar os scripts SQL para criação do banco de dados e das tabelas com seus respectivos
atributos;
4. Criar scripts SQL para inserção dos dados nas tabelas
5. Executar consultas para gerar informações estratégicas para a área de ensino da Resilia
Detalhes do projeto:

● Após a criação do banco de dados, você e sua equipe deverão inserir dados para teste do banco
de dados. Vocês deverão executar as consultas abaixo e apresentar seus resultados:
1. Selecionar a quantidade total de estudantes cadastrados no banco;
2. Selecionar quais pessoas facilitadoras atuam em mais de uma turma;
3. Crie uma view que selecione a porcentagem de estudantes com status de evasão
agrupados por turma;
4. Crie um trigger para ser disparado quando o atributo status de um estudante for atualizado
e inserir um novo dado em uma tabela de log.
● Além disso, vocês deverão pensar em mais uma pergunta que deverá ser respondida por scripts
SQL que combine pelo menos 3 tabelas.
'''

-- 1. Selecionar a quantidade total de estudantes cadastrados no banco;
SELECT COUNT(aluno.cpf) AS total_alunos
FROM aluno;
-- Funciona Corretamente


-- 2. Selecionar quais pessoas facilitadoras atuam em mais de uma turma;

SELECT cpf_facilitador, COUNT(DISTINCT turma_fk) AS total_turmas
FROM presenca_aluno_facilitador
GROUP BY cpf_facilitador
HAVING COUNT(DISTINCT turma_fk) > 1;

-- 3. Crie uma view que selecione a porcentagem de estudantes com status de evasão agrupados por turma;

CREATE VIEW status_alunos AS
SELECT 
    aluno.nome AS nome_aluno,
    aluno.cpf AS cpf_aluno, 
    turma.nome_da_turma, 
    curso.nome_curso, 
    disciplina.nome AS nome_disciplina, 
    avaliacao.nota, 
    avaliacao.status
FROM aluno
INNER JOIN avaliacao ON avaliacao.cpf_fk = aluno.cpf
INNER JOIN disciplina ON disciplina.id_disciplina = avaliacao.id_disciplina_fk
INNER JOIN modulo ON modulo.id_disciplina_fk = disciplina.id_disciplina
INNER JOIN curso ON curso.id_curso = modulo.curso_fk
INNER JOIN turma ON turma.curso_fk = curso.id_curso;
WHERE avaliacao.status = 'EVADIDO'
--Mostrar porcentagem

-- Aluno -> Avaliaçao -> Diciplina - Modulo -> Curso -> Turma

-- # Tabela de Status em Geral (Ideia para 5ª Pergunta)
CREATE VIEW status_alunos AS
SELECT 
    aluno.nome AS nome_aluno,
    aluno.cpf AS cpf_aluno, 
    turma.nome_da_turma, 
    curso.nome_curso, 
    disciplina.nome AS nome_disciplina, 
    avaliacao.nota, 
    avaliacao.status
FROM aluno
INNER JOIN avaliacao ON avaliacao.cpf_fk = aluno.cpf
INNER JOIN disciplina ON disciplina.id_disciplina = avaliacao.id_disciplina_fk
INNER JOIN modulo ON modulo.id_disciplina_fk = disciplina.id_disciplina
INNER JOIN curso ON curso.id_curso = modulo.curso_fk
INNER JOIN turma ON turma.curso_fk = curso.id_curso;
