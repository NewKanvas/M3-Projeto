CREATE DATABASE RESILIADATA;
USE RESILIADATA;


CREATE TABLE senac (
    unidade VARCHAR(100) PRIMARY KEY NOT NULL,
    endereco VARCHAR(250) NOT NULL
);

CREATE TABLE aluno (
    nome VARCHAR(200) NOT NULL,
    cpf INT(20) PRIMARY KEY NOT NULL,
    idade INT(3) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    email VARCHAR(250) NOT NULL,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE matricula (
    matricula INT(50) PRIMARY KEY NOT NULL,
    unidade_fk VARCHAR(100) NOT NULL,
    curso_fk VARCHAR(200) NOT NULL,
    status VARCHAR(100) NOT NULL,
    cpf_aluno_fk INT(20) NOT NULL
);

CREATE TABLE curso (
    curso VARCHAR(200) PRIMARY KEY NOT NULL,
    duracao VARCHAR(100) NOT NULL,
    inicio DATE NOT NULL,
    fim DATE NOT NULL
);

CREATE TABLE turma (
    curso_fk VARCHAR(200) NOT NULL,
    turma_pk INT(3) PRIMARY KEY NOT NULL,
    sala INT(3) NOT NULL,
    computador INT(34) NOT NULL
);

CREATE TABLE monitor (
    cpf_monitor INT(11) PRIMARY KEY NOT NULL,
    nome VARCHAR(200) NOT NULL,
    idade INT(3) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    email VARCHAR(250) NOT NULL,
    senha VARCHAR(250) NOT NULL
);

CREATE TABLE facilitador (
    cpf_facilitador INT(11) PRIMARY KEY NOT NULL,
    nome VARCHAR NOT NULL DEFAULT '250',
    idade INT(3) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    especializacao VARCHAR(200) NOT NULL,
    email VARCHAR(250) NOT NULL,
    senha CHAR(250) NOT NULL
);

CREATE TABLE modulo (
    curso_fk VARCHAR(200) NOT NULL,
    nome_modulo VARCHAR(10) PRIMARY KEY NOT NULL,
    qt_aula. INT NOT NULL
);

CREATE TABLE presenca (
    id_presenca INT(100) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    matricula_fk INTEGER(100) NOT NULL,
    cpf_fk VARCHAR(200) NOT NULL,
    id_aula_facilitador_fk INTEGER(100) NOT NULL,
    presenca_facilitador INT(200) NOT NULL,
    id_aula_monitor_fk INTEGER(100) NOT NULL,
    presenca_modulo INT(200) NOT NULL
);

CREATE TABLE presenca_aluno_monitor  (
    id_aula_monitor_fk INTEGER(200) PRIMARY KEY NOT NULL,
    data DATE NOT NULL,
    modulo_fk INT(10) NOT NULL,
    turma_fk VARCHAR(200) NOT NULL,
    cpf_monitor INT(11) NOT NULL
);

CREATE TABLE presenca_aluno_facilitador (
    id_aula_facilitador INTEGER PRIMARY KEY NOT NULL,
    data DATE NOT NULL,
    cpf_facilitador INT(11) NOT NULL,
    modulo INT(10) NOT NULL,
    turma_fk VARCHAR(200) NOT NULL
);

CREATE TABLE avaliacao (
    cpf_fk INT(20) NOT NULL,
    modulo_fk INT(10) NOT NULL,
    nota INT NOT NULL,
    status VARCHAR(100) NOT NULL
);

ALTER TABLE matricula ADD CONSTRAINT matricula_unidade_fk_senac_unidade FOREIGN KEY (unidade_fk) REFERENCES senac(unidade);
ALTER TABLE matricula ADD CONSTRAINT matricula_curso_fk_curso_curso FOREIGN KEY (curso_fk) REFERENCES curso(curso);
ALTER TABLE matricula ADD CONSTRAINT matricula_cpf_aluno_fk_aluno_cpf FOREIGN KEY (cpf_aluno_fk) REFERENCES aluno(cpf);

ALTER TABLE turma ADD CONSTRAINT turma_curso_fk_curso_curso FOREIGN KEY (curso_fk) REFERENCES curso(curso);

ALTER TABLE modulo ADD CONSTRAINT modulo_curso_fk_curso_curso FOREIGN KEY (curso_fk) REFERENCES curso(curso);

ALTER TABLE presenca ADD CONSTRAINT presenca_cpf_fk_aluno_nome FOREIGN KEY (cpf_fk) REFERENCES aluno(nome);
ALTER TABLE presenca ADD CONSTRAINT presenca_id_aula_facilitador_fk_presenca_aluno_facilitador_id_aula_facilitador FOREIGN KEY (id_aula_facilitador_fk) REFERENCES presenca_aluno_facilitador(id_aula_facilitador);
ALTER TABLE presenca ADD CONSTRAINT presenca_id_aula_monitor_fk_presenca_aluno_monitor _id_aula_monitor_fk FOREIGN KEY (id_aula_monitor_fk) REFERENCES presenca_aluno_monitor (id_aula_monitor_fk);

ALTER TABLE presenca_aluno_monitor  ADD CONSTRAINT presenca_aluno_monitor _modulo_fk_modulo_nome_modulo FOREIGN KEY (modulo_fk) REFERENCES modulo(nome_modulo);
ALTER TABLE presenca_aluno_monitor  ADD CONSTRAINT presenca_aluno_monitor _turma_fk_turma_curso_fk FOREIGN KEY (turma_fk) REFERENCES turma(curso_fk);
ALTER TABLE presenca_aluno_monitor  ADD CONSTRAINT presenca_aluno_monitor _cpf_monitor_monitor_cpf_monitor FOREIGN KEY (cpf_monitor) REFERENCES monitor(cpf_monitor);

ALTER TABLE presenca_aluno_facilitador ADD CONSTRAINT presenca_aluno_facilitador_cpf_facilitador_facilitador_cpf_facilitador FOREIGN KEY (cpf_facilitador) REFERENCES facilitador(cpf_facilitador);
ALTER TABLE presenca_aluno_facilitador ADD CONSTRAINT presenca_aluno_facilitador_modulo_modulo_nome_modulo FOREIGN KEY (modulo) REFERENCES modulo(nome_modulo);
ALTER TABLE presenca_aluno_facilitador ADD CONSTRAINT presenca_aluno_facilitador_turma_fk_turma_curso_fk FOREIGN KEY (turma_fk) REFERENCES turma(curso_fk);

ALTER TABLE avaliacao ADD CONSTRAINT avaliacao_cpf_fk_aluno_cpf FOREIGN KEY (cpf_fk) REFERENCES aluno(cpf);
ALTER TABLE avaliacao ADD CONSTRAINT avaliacao_modulo_fk_modulo_nome_modulo FOREIGN KEY (modulo_fk) REFERENCES modulo(nome_modulo);