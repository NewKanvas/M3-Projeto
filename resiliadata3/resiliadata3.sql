-- DROP DATABASE RESILIADATA;

-- CREATE DATABASE RESILIADATA;

USE RESILIADATA;

CREATE TABLE instituicao (
`unidade` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`endereco` VARCHAR(250) NOT NULL,
`nome_unidade` VARCHAR(200) NOT NULL);

CREATE TABLE aluno (
`nome` VARCHAR(200) NOT NULL,
`cpf` VARCHAR(11) PRIMARY KEY NOT NULL,
`idade` INT(3) NOT NULL,
`genero` VARCHAR(100) NOT NULL,
`email` VARCHAR(250) NOT NULL);

CREATE TABLE matricula (
`matricula` INT(11) PRIMARY KEY NOT NULL,
`unidade_fk` INT(11) NOT NULL,
`id_curso_fk` INT(11) NOT NULL,
`status` VARCHAR(100) NOT NULL,
`cpf_aluno_fk`  VARCHAR(11) NOT NULL)
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE curso (
`id_curso` INT(11) PRIMARY KEY NOT NULL,
`nome_curso` VARCHAR(200) NOT NULL,
`duracao` VARCHAR(100) NOT NULL);

CREATE TABLE turma (
`curso_fk` INT(11) NOT NULL,
`turma_pk` INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`sala` INT(3) NOT NULL,
`inicio` DATE NOT NULL,
`fim` DATE NOT NULL);

CREATE TABLE monitor (
`cpf_monitor`  VARCHAR(11) PRIMARY KEY NOT NULL,
`nome` VARCHAR(200) NOT NULL,
`idade` INT(3) NOT NULL,
`genero` VARCHAR(100) NOT NULL,
`email` VARCHAR(250) NOT NULL);

CREATE TABLE facilitador (
`cpf_facilitador`  VARCHAR(11) PRIMARY KEY NOT NULL,
`nome` VARCHAR(200),
`idade` INT(3) NOT NULL,
`genero` VARCHAR(100) NOT NULL,
`especializacao` VARCHAR(200) NOT NULL,
`email` VARCHAR(250) NOT NULL);

CREATE TABLE modulo (
`id_modulo` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`nome` VARCHAR(200),
`qt_aula` INT(11) NOT NULL,
`carga_horaria` INT(11) NOT NULL);

CREATE TABLE presenca (
`id_aula_fk` bigint(200) NOT NULL,
`cpf_fk`  VARCHAR(11) NOT NULL,
`presenca` INT(11) NOT NULL);


CREATE TABLE aula (
`id_aula` bigint(200) PRIMARY KEY NOT NULL,
`data` DATE NOT NULL,
`modulo_fk` INT(11) NOT NULL,
`turma_fk` INT(11) NOT NULL,
`cpf_facilitador`  BIGINT(11) NOT NULL,
`cpf_monitor` BIGINT(11) NOT NULL);

CREATE TABLE disciplina (
`id_disciplina` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`nome` VARCHAR(200) NOT NULL,
`qt_aula_semanal` INT(1) NOT NULL);


-- Adicionando chaves estrangeiras
-- Matrícula
ALTER TABLE matricula 
  ADD CONSTRAINT fk_matricula_unidade 
  FOREIGN KEY (unidade_fk) REFERENCES instituicao(unidade);

ALTER TABLE matricula 
  ADD CONSTRAINT fk_matricula_curso 
  FOREIGN KEY (id_curso_fk) REFERENCES curso(id_curso);

ALTER TABLE matricula 
  ADD CONSTRAINT fk_matricula_aluno 
  FOREIGN KEY (cpf_aluno_fk) REFERENCES aluno(cpf);

-- Turma
ALTER TABLE turma 
  ADD CONSTRAINT fk_turma_curso 
  FOREIGN KEY (curso_fk) REFERENCES curso(id_curso);




-- Aula
ALTER TABLE aula
  ADD CONSTRAINT fk_presenca_aluno_facilitador_facilitador 
  FOREIGN KEY (cpf_facilitador) REFERENCES facilitador(cpf_facilitador);

ALTER TABLE aula
  ADD CONSTRAINT fk_presenca_aluno_facilitador_modulo 
  FOREIGN KEY (modulo_FK) REFERENCES modulo(id_modulo);

ALTER TABLE aula
  ADD CONSTRAINT fk_presenca_aluno_facilitador_turma 
  FOREIGN KEY (turma_fk) REFERENCES turma(turma_pk);
  
ALTER TABLE aula
  ADD CONSTRAINT fk_presenca_aluno_monitor_monitor 
  FOREIGN KEY (cpf_monitor) REFERENCES monitor(cpf_monitor);


-- Presença


ALTER TABLE presenca
  ADD CONSTRAINT fk_presenca_aluno2
  FOREIGN KEY (cpf_fk) REFERENCES aluno(cpf);