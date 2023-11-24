
-- Função para adcionar alunos de acordo com a tabela csv:
-- C:\xampp\mysql\data\nomedobanco
use resilia;
LOAD DATA INFILE '\alunos.csv'
REPLACE INTO TABLE alunos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

