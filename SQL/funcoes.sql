-- C:\xampp\mysql\data\nomedobanco

-- Função para adcionar alunos de acordo com a tabela csv:
LOAD DATA INFILE '\alunos.csv'
REPLACE INTO TABLE alunos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Ver a tabela
SELECT * FROM alunos;

-- Ver filtrado

SELECT * FROM alunos WHERE matricula LIKE '%4';