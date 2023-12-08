DROP DATABASE RESILIADATA;

CREATE DATABASE RESILIADATA;

USE RESILIADATA;

CREATE TABLE instituicao (
`unidade` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`endereco` VARCHAR(250) NOT NULL,
`nome_unidade` VARCHAR(200) NOT NULL);

CREATE TABLE aluno (
`nome` VARCHAR(200) NOT NULL,
`cpf` BIGINT(11) PRIMARY KEY NOT NULL,
`idade` INT(3) NOT NULL,
`genero` VARCHAR(100) NOT NULL,
`email` VARCHAR(250) NOT NULL);

CREATE TABLE matricula (
`matricula` INT(11) PRIMARY KEY NOT NULL,
`unidade_fk` INT(11) NOT NULL,
`id_curso_fk` INT(11) NOT NULL,
`status` VARCHAR(100) NOT NULL,
`cpf_aluno_fk`  BIGINT(11) NOT NULL);

CREATE TABLE curso (
`id_curso` INT(11) PRIMARY AUTO_INCREMENT KEY NOT NULL,
`nome_curso` VARCHAR(200) NOT NULL,
`duracao` VARCHAR(100) NOT NULL,
`inicio` DATE NOT NULL,
`fim` DATE NOT NULL);

CREATE TABLE turma (
`curso_fk` INT(11) NOT NULL,
`turma_pk` INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`sala` INT(3) NOT NULL,
`computador` INT(34) NOT NULL);

CREATE TABLE monitor (
`cpf_monitor`  BIGINT(11) PRIMARY KEY NOT NULL,
`nome` VARCHAR(200) NOT NULL,
`idade` INT(3) NOT NULL,
`genero` VARCHAR(100) NOT NULL,
`email` VARCHAR(250) NOT NULL);

CREATE TABLE facilitador (
`cpf_facilitador`  BIGINT(11) PRIMARY KEY NOT NULL,
`nome` VARCHAR(200),
`idade` INT(3) NOT NULL,
`genero` VARCHAR(100) NOT NULL,
`especializacao` VARCHAR(200) NOT NULL,
`email` VARCHAR(250) NOT NULL);

CREATE TABLE modulo (
`curso_fk` INT(11) NOT NULL,
`id_modulo` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`qt_aula` INT(11) NOT NULL,
`carga_horaria` INT(11) NOT NULL,
`id_disciplina_fk` INT(11) NOT NULL);

CREATE TABLE presenca (
`id_presenca` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`matricula_fk` INT(11) NOT NULL,
`cpf_fk`  BIGINT(11) NOT NULL,
`id_aula_facilitador_fk` INT(11) NOT NULL,
`presenca_facilitador` INT(11) NOT NULL,
`id_aula_monitor_fk` INT(11) NOT NULL,
`presenca_modulo` INT(11) NOT NULL);

CREATE TABLE presenca_aluno_monitor  (
`id_aula_monitor_fk` INTEGER(200) PRIMARY KEY NOT NULL,
`data` DATE NOT NULL,
`modulo_fk` INT(11) NOT NULL,
`turma_fk` INT(11) NOT NULL,
`cpf_monitor`  BIGINT(11) NOT NULL);

CREATE TABLE presenca_aluno_facilitador (
`id_aula_facilitador` INTEGER PRIMARY KEY NOT NULL,
`data` DATE NOT NULL,
`cpf_facilitador`  BIGINT(11) NOT NULL,
`modulo` INT(10) NOT NULL,
`turma_fk` INT(11) NOT NULL);

CREATE TABLE avaliacao (
`cpf_fk` BIGINT(11) NOT NULL,
`modulo_fk` INT(10) NOT NULL,
`nota` INT(11) NOT NULL,
`status` VARCHAR(100) NOT NULL,
`id_disciplina_fk` INT(11) NOT NULL,
`nome_modulo_pk` INT NOT NULL);

CREATE TABLE disciplina (
`id_disciplina` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
`nome` VARCHAR(200) NOT NULL,
`carga_horaria` INT(11) NOT NULL);

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

-- Módulo
ALTER TABLE modulo 
  ADD CONSTRAINT fk_modulo_curso 
  FOREIGN KEY (curso_fk) REFERENCES curso(id_curso);

ALTER TABLE modulo 
  ADD CONSTRAINT fk_modulo_disciplina 
  FOREIGN KEY (id_disciplina_fk) REFERENCES disciplina(id_disciplina);

-- Presença
ALTER TABLE presenca 
  ADD CONSTRAINT fk_presenca_aluno 
  FOREIGN KEY (cpf_fk) REFERENCES aluno(cpf);

ALTER TABLE presenca 
  ADD CONSTRAINT fk_presenca_facilitador 
  FOREIGN KEY (id_aula_facilitador_fk) REFERENCES presenca_aluno_facilitador(id_aula_facilitador);

ALTER TABLE presenca 
  ADD CONSTRAINT fk_presenca_monitor 
  FOREIGN KEY (id_aula_monitor_fk) REFERENCES presenca_aluno_monitor(id_aula_monitor_fk);

-- Presença Aluno Monitor
ALTER TABLE presenca_aluno_monitor  
  ADD CONSTRAINT fk_presenca_aluno_monitor_modulo 
  FOREIGN KEY (modulo_fk) REFERENCES modulo(id_modulo);

ALTER TABLE presenca_aluno_monitor  
  ADD CONSTRAINT fk_presenca_aluno_monitor_turma 
  FOREIGN KEY (turma_fk) REFERENCES turma(curso_fk);

ALTER TABLE presenca_aluno_monitor  
  ADD CONSTRAINT fk_presenca_aluno_monitor_monitor 
  FOREIGN KEY (cpf_monitor) REFERENCES monitor(cpf_monitor);

-- Presença Aluno Facilitador
ALTER TABLE presenca_aluno_facilitador 
  ADD CONSTRAINT fk_presenca_aluno_facilitador_facilitador 
  FOREIGN KEY (cpf_facilitador) REFERENCES facilitador(cpf_facilitador);

ALTER TABLE presenca_aluno_facilitador 
  ADD CONSTRAINT fk_presenca_aluno_facilitador_modulo 
  FOREIGN KEY (modulo) REFERENCES modulo(id_modulo);

ALTER TABLE presenca_aluno_facilitador 
  ADD CONSTRAINT fk_presenca_aluno_facilitador_turma 
  FOREIGN KEY (turma_fk) REFERENCES turma(curso_fk);

-- Avaliação
ALTER TABLE avaliacao 
  ADD CONSTRAINT fk_avaliacao_aluno 
  FOREIGN KEY (cpf_fk) REFERENCES aluno(cpf);

ALTER TABLE avaliacao 
  ADD CONSTRAINT fk_avaliacao_modulo 
  FOREIGN KEY (modulo_fk) REFERENCES modulo(id_modulo);

ALTER TABLE avaliacao 
  ADD CONSTRAINT fk_avaliacao_disciplina 
  FOREIGN KEY (id_disciplina_fk) REFERENCES disciplina(id_disciplina);

ALTER TABLE avaliacao 
  ADD CONSTRAINT fk_avaliacao_modulo_nome 
  FOREIGN KEY (nome_modulo_pk) REFERENCES modulo(id_modulo);
