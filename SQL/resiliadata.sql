CREATE DATABASE RESILIADATA;
USE RESILIADATA;


CREATE TABLE instituicao (
unidade INT(100) PRIMARY KEY NOT NULL,
endereco VARCHAR(250) NOT NULL,
nome_unidade VARCHAR(200) NOT NULL);

CREATE TABLE aluno (
nome VARCHAR(200) NOT NULL,
cpf INT(20) PRIMARY KEY NOT NULL,
idade INT(3) NOT NULL,
genero VARCHAR(100) NOT NULL,
email VARCHAR(250) NOT NULL,
senha VARCHAR(100) NOT NULL);

CREATE TABLE matricula (
matricula INT(50) PRIMARY KEY NOT NULL,
unidade_fk INT(100) NOT NULL,
id_curso_fk INT(200) NOT NULL,
status VARCHAR(100) NOT NULL,
cpf_aluno_fk INT(20) NOT NULL);

CREATE TABLE curso (
id_curso INT(200) PRIMARY KEY NOT NULL,
nome_curso VARCHAR NOT NULL,
duracao VARCHAR(100) NOT NULL,
inicio DATE NOT NULL,
fim DATE NOT NULL);

CREATE TABLE turma (
curso_fk INT(200) NOT NULL,
turma_pk INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL,
sala INT(3) NOT NULL,
computador INT(34) NOT NULL);

CREATE TABLE monitor (
cpf_monitor INT(11) PRIMARY KEY NOT NULL,
nome VARCHAR(200) NOT NULL,
idade INT(3) NOT NULL,
genero VARCHAR(100) NOT NULL,
email VARCHAR(250) NOT NULL,
senha VARCHAR(250) NOT NULL);

CREATE TABLE facilitador (
cpf_facilitador INT(11) PRIMARY KEY NOT NULL,
nome VARCHAR NOT NULL DEFAULT '250',
idade INT(3) NOT NULL,
genero VARCHAR(100) NOT NULL,
especializacao VARCHAR(200) NOT NULL,
email VARCHAR(250) NOT NULL,
senha CHAR(250) NOT NULL);

CREATE TABLE modulo (
curso_fk INT(200) NOT NULL,
id_modulo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
qt_aula INT(100) NOT NULL,
carga_horaria INT(1000) NOT NULL,
id_disciplina_fk INT(100) NOT NULL);

CREATE TABLE presenca (
id_presenca INT(100) PRIMARY KEY AUTO_INCREMENT NOT NULL,
matricula_fk INTEGER(100) NOT NULL,
cpf_fk INT(20) NOT NULL,
id_aula_facilitador_fk INTEGER(100) NOT NULL,
presenca_facilitador INT(200) NOT NULL,
id_aula_monitor_fk INTEGER(100) NOT NULL,
presenca_modulo INT(200) NOT NULL);

CREATE TABLE presenca_aluno_monitor  (
id_aula_monitor_fk INTEGER(200) PRIMARY KEY NOT NULL,
data DATE NOT NULL,
modulo_fk INT(10) NOT NULL,
turma_fk INT(200) NOT NULL,
cpf_monitor INT(11) NOT NULL);

CREATE TABLE presenca_aluno_facilitador (
id_aula_facilitador INTEGER PRIMARY KEY NOT NULL,
data DATE NOT NULL,
cpf_facilitador INT(11) NOT NULL,
modulo INT(10) NOT NULL,
turma_fk INT(200) NOT NULL);

CREATE TABLE avaliacao (
cpf_fk INT(20) NOT NULL,
modulo_fk INT(10) NOT NULL,
nota INT(100) NOT NULL,
status VARCHAR(100) NOT NULL,
id_disciplina_fk INT(100) NOT NULL,
nome_modulo_pk INT NOT NULL);

CREATE TABLE disciplina (
id_disciplina INT(100) PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(200) NOT NULL,
carga_horaria INT(100) NOT NULL);

ALTER TABLE matricula ADD CONSTRAINT matricula_unidade_fk_instituicao_unidade FOREIGN KEY (unidade_fk) REFERENCES instituicao(unidade);
ALTER TABLE matricula ADD CONSTRAINT matricula_id_curso_fk_curso_id_curso FOREIGN KEY (id_curso_fk) REFERENCES curso(id_curso);
ALTER TABLE matricula ADD CONSTRAINT matricula_cpf_aluno_fk_aluno_cpf FOREIGN KEY (cpf_aluno_fk) REFERENCES aluno(cpf);
ALTER TABLE turma ADD CONSTRAINT turma_curso_fk_curso_id_curso FOREIGN KEY (curso_fk) REFERENCES curso(id_curso);
ALTER TABLE modulo ADD CONSTRAINT modulo_curso_fk_curso_id_curso FOREIGN KEY (curso_fk) REFERENCES curso(id_curso);
ALTER TABLE modulo ADD CONSTRAINT modulo_id_disciplina_fk_disciplina_id_disciplina FOREIGN KEY (id_disciplina_fk) REFERENCES disciplina(id_disciplina);
ALTER TABLE presenca ADD CONSTRAINT presenca_cpf_fk_aluno_cpf FOREIGN KEY (cpf_fk) REFERENCES aluno(cpf);
ALTER TABLE presenca ADD CONSTRAINT presenca_id_aula_facilitador_fk_presenca_aluno_facilitador_id_aula_facilitador FOREIGN KEY (id_aula_facilitador_fk) REFERENCES presenca_aluno_facilitador(id_aula_facilitador);
ALTER TABLE presenca ADD CONSTRAINT presenca_id_aula_monitor_fk_presenca_aluno_monitor _id_aula_monitor_fk FOREIGN KEY (id_aula_monitor_fk) REFERENCES presenca_aluno_monitor (id_aula_monitor_fk);
ALTER TABLE presenca_aluno_monitor  ADD CONSTRAINT presenca_aluno_monitor _modulo_fk_modulo_id_modulo FOREIGN KEY (modulo_fk) REFERENCES modulo(id_modulo);
ALTER TABLE presenca_aluno_monitor  ADD CONSTRAINT presenca_aluno_monitor _turma_fk_turma_curso_fk FOREIGN KEY (turma_fk) REFERENCES turma(curso_fk);
ALTER TABLE presenca_aluno_monitor  ADD CONSTRAINT presenca_aluno_monitor _cpf_monitor_monitor_cpf_monitor FOREIGN KEY (cpf_monitor) REFERENCES monitor(cpf_monitor);
ALTER TABLE presenca_aluno_facilitador ADD CONSTRAINT presenca_aluno_facilitador_cpf_facilitador_facilitador_cpf_facilitador FOREIGN KEY (cpf_facilitador) REFERENCES facilitador(cpf_facilitador);
ALTER TABLE presenca_aluno_facilitador ADD CONSTRAINT presenca_aluno_facilitador_modulo_modulo_id_modulo FOREIGN KEY (modulo) REFERENCES modulo(id_modulo);
ALTER TABLE presenca_aluno_facilitador ADD CONSTRAINT presenca_aluno_facilitador_turma_fk_turma_curso_fk FOREIGN KEY (turma_fk) REFERENCES turma(curso_fk);
ALTER TABLE avaliacao ADD CONSTRAINT avaliacao_cpf_fk_aluno_cpf FOREIGN KEY (cpf_fk) REFERENCES aluno(cpf);
ALTER TABLE avaliacao ADD CONSTRAINT avaliacao_modulo_fk_modulo_id_modulo FOREIGN KEY (modulo_fk) REFERENCES modulo(id_modulo);
ALTER TABLE avaliacao ADD CONSTRAINT avaliacao_id_disciplina_fk_disciplina_id_disciplina FOREIGN KEY (id_disciplina_fk) REFERENCES disciplina(id_disciplina);
ALTER TABLE avaliacao ADD CONSTRAINT avaliacao_nome_modulo_pk_modulo_id_modulo FOREIGN KEY (nome_modulo_pk) REFERENCES modulo(id_modulo);

