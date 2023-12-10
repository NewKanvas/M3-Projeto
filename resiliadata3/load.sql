-- C:\xampp\mysql\data\resiliadata
use resiliadata;

-- A1- aluno
LOAD DATA INFILE '\CSV_aluno.csv'
REPLACE INTO TABLE aluno
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from aluno;
-- select count(cpf) from aluno;
-- delete from aluno;

-- A2- facilitador
LOAD DATA INFILE '\CSV_facilitador.csv'
REPLACE INTO TABLE facilitador
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from facilitador;

-- A3- monitor
LOAD DATA INFILE '\CSV_monitor.csv'
REPLACE INTO TABLE monitor
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from monitor;

-- A3- curso
LOAD DATA INFILE '\CSV_curso.csv'
REPLACE INTO TABLE curso
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from curso;
-- delete from curso;

-- A4- modulo
LOAD DATA INFILE '\CSV_modulo.csv'
REPLACE INTO TABLE modulo
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from modulo;

-- A5- disciplina
LOAD DATA INFILE '\CSV_disciplina.csv'
REPLACE INTO TABLE disciplina
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from disciplina;
-- delete from disciplina;

-- A6- instituicao
LOAD DATA INFILE '\CSV_instituicao.csv'
REPLACE INTO TABLE instituicao
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from INSTITUICAO;

-- B1- matricula
LOAD DATA INFILE '\CSV_matricula.csv'
REPLACE INTO TABLE matricula
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from matricula;


-- B2- turma

LOAD DATA INFILE '\CSV_turma.csv'
REPLACE INTO TABLE turma
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from turma;
-- delete from turma;

-- presenca_aluno_monitor

LOAD DATA INFILE '\CSV_aula.csv'
REPLACE INTO TABLE aula
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from aula;
-- delete from aula;



-- presenca
LOAD DATA INFILE '\CSV_presenca.csv'
REPLACE INTO TABLE presenca
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



select * from presenca;
-- delete from presenca;
-- Tem que fazer os intos para simular o funcionamento das coisas que faltam