-- C:\xampp\mysql\data\resiliadata

-- Função para adcionar alunos de acordo com a tabela csv:
LOAD DATA INFILE '\CSV_aluno.csv'
REPLACE INTO TABLE aluno
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from aluno;

-- avaliacao


-- curso
LOAD DATA INFILE '\CSV_curso.csv'
REPLACE INTO TABLE curso
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from curso;

-- disciplina

-- facilitador
LOAD DATA INFILE '\CSV_facilitador.csv'
REPLACE INTO TABLE facilitador
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from facilitador;

-- instituicao
LOAD DATA INFILE '\CSV_instituicao.csv'
REPLACE INTO TABLE instituicao
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from INSTITUICAO;


-- matricula
LOAD DATA INFILE '\CSV_matricula.csv'
REPLACE INTO TABLE matricula
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from matricula;

-- modulo
LOAD DATA INFILE '\CSV_modulo.csv'
REPLACE INTO TABLE modulo
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from modulo;

-- presenca

-- presenca_aluno_facilitador

-- presenca_aluno_monitor

-- turma

LOAD DATA INFILE '\CSV_Turma.csv'
REPLACE INTO TABLE turma
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from turma;


-- Tem que fazer os intos para simular o funcionamento das coisas que faltam