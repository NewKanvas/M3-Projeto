DROP DATABASE IF EXISTS RESILIADATA;
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
  `id_turma_fk` INT(11) NOT NULL,
  `status` VARCHAR(100) NOT NULL,
  `cpf_aluno_fk`  BIGINT(11) NOT NULL);

CREATE TABLE curso (
  `id_curso` INT(11) PRIMARY KEY NOT NULL,
  `nome_curso` VARCHAR(200) NOT NULL,
  `duracao` VARCHAR(100) NOT NULL,
  `total_dias` INT(11) NOT NULL);

CREATE TABLE turma (
  `curso_fk` INT(11) NOT NULL,
  `turma_pk` INT(3) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `sala` INT(3) NOT NULL);

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
  `numero_modulo` INT(11) NOT NULL,
  `qt_aula` INT(11) NOT NULL,
  `carga_horaria` INT(11) NOT NULL,
  `id_disciplina_fk` INT(11) NOT NULL);

CREATE TABLE disciplina (
  `id_disciplina` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `carga_horaria` INT(11) NOT NULL);

CREATE TABLE presenca_aluno_monitor  (
  `id_aula_monitor_fk` INTEGER(200) PRIMARY KEY NOT NULL,
  `data` DATE NOT NULL,
  `presenca_monitor` BOOLEAN NOT NULL DEFAULT 0,
  `modulo_fk` INT(11) NOT NULL,
  `turma_fk` INT(11) NOT NULL,
  `cpf_monitor`  BIGINT(11) NOT NULL);

CREATE TABLE presenca_aluno_facilitador (
  `id_aula_facilitador` INTEGER PRIMARY KEY NOT NULL,
  `data` DATE NOT NULL,
  `cpf_facilitador`  BIGINT(11) NOT NULL,
  `presenca_facilitador` BOOLEAN NOT NULL DEFAULT 0,
  `modulo` INT(10) NOT NULL,
  `turma_fk` INT(11) NOT NULL);

CREATE TABLE presenca (
  `id_presenca` INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `matricula_fk` INT(11) NOT NULL,
  `cpf_fk` BIGINT(11) NOT NULL,
  `data_fk` DATE NOT NULL,
  `id_turma_fk`INT(3) NOT NULL,
  `id_aula_facilitador_fk` INT(11) NOT NULL,
  `presenca_facilitador_fk` BOOLEAN NOT NULL DEFAULT 0,
  `id_aula_monitor_fk` INT(11) NOT NULL,
  `presenca_monitor_fk` BOOLEAN NOT NULL DEFAULT 0,
  `presenca_modulo` INT(11) NOT NULL);

-- Trigger do Presença

DELIMITER / / 
CREATE TRIGGER tr_presenca_update 
AFTER INSERT ON presenca_aluno_facilitador 
FOR EACH ROW 
BEGIN DECLARE monitor_presence BOOLEAN;

    -- Verifica se existe uma entrada correspondente na tabela presenca_aluno_monitor
    SELECT
        presenca_monitor INTO monitor_presence
    FROM
        presenca_aluno_monitor
    WHERE
        id_aula_monitor_fk = NEW.id_aula_facilitador;

    -- Atualiza a tabela presenca
    UPDATE presenca
    SET
        presenca_facilitador_fk = NEW.presenca_facilitador,
        id_aula_facilitador_fk = NEW.id_aula_facilitador,
        presenca_monitor_fk = monitor_presence,
        presenca_modulo = CASE
            WHEN NEW.presenca_facilitador = 1
            AND monitor_presence = TRUE THEN 1
            ELSE 0
        END
    WHERE
        id_aula_facilitador_fk = NEW.id_aula_facilitador;

END / / DELIMITER;

DELIMITER //

CREATE TRIGGER tr_presenca_monitor_update
AFTER INSERT ON presenca_aluno_monitor
FOR EACH ROW
BEGIN DECLARE facilitador_presence BOOLEAN;

    -- Verifica se existe uma entrada correspondente na tabela presenca_aluno_facilitador
    SELECT presenca_facilitador INTO facilitador_presence
    FROM presenca_aluno_facilitador
    WHERE id_aula_facilitador = NEW.id_aula_monitor_fk;

    -- Atualiza a tabela presenca
    UPDATE presenca
    SET presenca_monitor_fk = NEW.presenca_monitor,
        id_aula_monitor_fk = NEW.id_aula_monitor_fk,
        presenca_facilitador_fk = facilitador_presence,
        presenca_modulo = CASE WHEN facilitador_presence = TRUE AND NEW.presenca_monitor = 1 THEN 1 ELSE 0 END
    WHERE id_aula_monitor_fk = NEW.id_aula_monitor_fk;
END //

DELIMITER ;



CREATE TABLE avaliacao (
  `cpf_fk` BIGINT(11) NOT NULL,
  `modulo_fk` INT(10) NOT NULL,
  `nota` INT(11) NOT NULL,
  `status` VARCHAR(100) NOT NULL,
  `id_disciplina_fk` INT(11) NOT NULL,
  `nome_modulo_pk` INT NOT NULL);


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

ALTER TABLE matricula
ADD CONSTRAINT fk_matricula_turma
FOREIGN KEY (id_turma_fk) REFERENCES turma(turma_pk);


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

ALTER TABLE presenca  
  ADD CONSTRAINT fk_presenca_turma
  FOREIGN KEY (id_turma_fk) REFERENCES turma(turma_pk);

-- Presença Aluno Monitor
ALTER TABLE presenca_aluno_monitor  
  ADD CONSTRAINT fk_presenca_aluno_monitor_modulo 
  FOREIGN KEY (modulo_fk) REFERENCES modulo(id_modulo);

ALTER TABLE presenca_aluno_monitor  
  ADD CONSTRAINT fk_presenca_aluno_monitor_turma 
  FOREIGN KEY (turma_fk) REFERENCES turma(turma_pk);

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
  FOREIGN KEY (turma_fk) REFERENCES turma(turma_pk);

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
