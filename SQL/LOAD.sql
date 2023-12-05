-- C:\xampp\mysql\data\nomedobanco

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

-- Função para adcionar alunos de acordo com a tabela csv:
-- Load para o arquivo aluno.csv
LOAD DATA INFILE 'aluno.csv'
REPLACE INTO TABLE aluno
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load para o arquivo curso.csv
LOAD DATA INFILE 'curso.csv'
REPLACE INTO TABLE curso
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load para o arquivo facilitador.csv
LOAD DATA INFILE 'facilitador.csv'
REPLACE INTO TABLE facilitador
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load para o arquivo instituicao.csv
LOAD DATA INFILE 'instituicao.csv'
REPLACE INTO TABLE instituicao
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load para o arquivo matricula.csv
LOAD DATA INFILE 'matricula.csv'
REPLACE INTO TABLE matricula
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load para o arquivo modulo.csv
LOAD DATA INFILE 'modulo.csv'
REPLACE INTO TABLE modulo
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load para o arquivo monitor.csv
LOAD DATA INFILE 'monitor.csv'
REPLACE INTO TABLE monitor
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load para o arquivo turma.csv
LOAD DATA INFILE 'turma.csv'
REPLACE INTO TABLE turma
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Ver a tabela
SELECT * FROM alunos;

-- Deletar Tabela
DELETE FROM curso;
-- Desativa o Safe Mode nas preferencias.
-- (To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.)

-- Ver filtrado

SELECT * FROM alunos WHERE matricula LIKE '%4';

'''
CORRIGIR O UTF-8 NOS CSV
1,"CiÃªncia da ComputaÃ§Ã£o","4 anos","2023-01-15","2026-12-20"
'''