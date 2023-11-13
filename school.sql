CREATE TABLE estudante 
( 
 `id_aluno` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 `nome` VARCHAR(n),  
 `telefone` VARCHAR(n) NOT NULL,  
 `nascimento` DATE NOT NULL,  
 `endereco` VARCHAR(n) NOT NULL,  
 `email` VARCHAR(n) NOT NULL,  
 `deficiencia` VARCHAR(n) NOT NULL,  
 `cpf` VARCHAR(14) NOT NULL 
); 

CREATE TABLE facilitador 
( 
 `id_facilitador` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 `nome` VARCHAR(n) NOT NULL,  
 `telefone` VARCHAR(n) NOT NULL,  
 `nascimento` DATE NOT NULL,  
 `endereco` VARCHAR(n) NOT NULL,  
 `especializacoes` VARCHAR(n) NOT NULL,  
 `deficiencia` VARCHAR(n) NOT NULL,  
 `email` VARCHAR(n),  
 `cpf` VARCHAR(14) NOT NULL
); 

CREATE TABLE curso 
( 
 `id_curso` INT PRIMARY KEY AUTO_INCREMENT,  
 `nome_curso` VARCHAR(n) NOT NULL  
); 

CREATE TABLE dados_aluno 
( 
 `id_dados` INT PRIMARY KEY AUTO_INCREMENT,  
 `id_aluno` INT NOT NULL,  
 `id_turma` INT NOT NULL,  
 `nota` INT NOT NULL,  
 `presenca` INT NOT NULL,  
 `status` INT,  
 `motivo` VARCHAR(n),  
 `update_data` DATE NOT NULL
); 

CREATE TABLE turma 
( 
 `id_turma` INT PRIMARY KEY AUTO_INCREMENT,  
 `id_facilitador` INT NOT NULL,  
 `id_curso` INT NOT NULL,  
 `id_aluno` INT NOT NULL,  
 `id_local` INT NOT NULL,  
 `hora_entrada` VARCHAR(n) NOT NULL,  
 `hora_saida` VARCHAR(n) NOT NULL,  
 `data_inicio` DATE NOT NULL,  
 `data_conclusao` DATE NOT NULL  
); 

CREATE TABLE local 
( 
 `id_local` INT PRIMARY KEY AUTO_INCREMENT,  
 `numero` INT NOT NULL,  
 `unidade` VARCHAR(n) NOT NULL
); 

ALTER TABLE dados_aluno ADD FOREIGN KEY(id_aluno) REFERENCES estudante (id_aluno)
ALTER TABLE dados_aluno ADD FOREIGN KEY(id_turma) REFERENCES turma (id_turma)
ALTER TABLE turma ADD FOREIGN KEY(id_facilitador) REFERENCES facilitador (id_facilitador)
ALTER TABLE turma ADD FOREIGN KEY(id_curso) REFERENCES curso (id_curso)
ALTER TABLE turma ADD FOREIGN KEY(id_aluno) REFERENCES estudante (id_aluno)
ALTER TABLE turma ADD FOREIGN KEY(id_local) REFERENCES (id_local)

https://twitter.com/Bebseo