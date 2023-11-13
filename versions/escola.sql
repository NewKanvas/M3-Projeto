CREATE DATABASE escola;

-- Criando Tabelas

USE escola;

-- Pessoas

CREATE TABLE `aluno` (
  `idaluno` INT(11) NOT NULL PRIMARY KEY auto_increment,
  `nome` VARCHAR(20) NOT NULL,

  `idturma` INT(11) NOT NULL -- Referente a Turma e Curso
  `status`

  `telefone` VARCHAR(14) NOT NULL,
  `nascimento` DATE NOT NULL,
  `endereco` VARCHAR(30) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `deficiencia` VARCHAR(40),
);

CREATE TABLE `facilitador` (
  `idfacilitador` INT(11) NOT NULL PRIMARY KEY auto_increment,
  `nome` VARCHAR(20) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `nascimento` DATE NOT NULL,
  `endereco` VARCHAR(30) NOT NULL,
  `especializacoes` VARCHAR(100) NOT NULL
  `deficiencia` VARCHAR(40)
);


-- Locais

CREATE TABLE `sala`(
  `idsala` INT(11) NOT NULL PRIMARY KEY auto_increment,
  `alocacao` INT(11) NOT NULL -- Numero da Sala
)

CREATE TABLE `unidade` (
  `idunidade` INT(11) NOT NULL PRIMARY KEY auto_increment,
  `local` VARCHAR(20) NOT NULL,
);

--Aulas

CREATE TABLE `curso` (
  `idcurso` INT(11) NOT NULL PRIMARY KEY auto_increment,
  `nome` VARCHAR(20) NOT NULL,
);

CREATE TABLE `turma` (
  `idturma` INT(11) NOT NULL PRIMARY KEY auto_increment,

  -- Informações do Facilitador da Turma
  `idfacilitador` INT(11) NOT NULL, -- ID do Facilitador
  `facilitador` INT(11) NOT NULL,  -- Nome do Facilitador

  -- Informações do Facilitador da Turma
  `idcurso` INT(11) NOT NULL, -- ID do Facilitador
  `curso` VARCHAR(20) NOT NULL, -- Nome do Curso

  -- Informações do Facilitador da Turma
  `idsala` INT(11) NOT NULL, -- ID do Facilitador
  `sala` INT(11) NOT NULL, -- Numero da Sala

  -- Horario de Entrada e Saida
  `hentrada` VARCHAR(20) NOT NULL,
  `hsaida` VARCHAR(20) NOT NULL,

  -- Data de inicio e conclusão do Curso
  `inicio` DATA NOT NULL,
  `conclusao` DATA NOT NULL,

  -- Local
  `idunidade` INT(11) NOT NULL
);

-- Planilhas de Dados Alunos

CREATE TABLE `pauta`(
  `idpauta` INT(11) NOT NULL PRIMARY KEY auto_increment,
  `idturma` INT(11) NOT NULL, -- Turma/Curso
  `idaluno` INT(11) NOT NULL, -- Aluno Referente
  `presenca` INT(11) NOT NULL, -- Total de Presença, se for menor que X reprova
  `nota` INT(11) NOT NULL
)

CREATE TABLE `evasao`(
  `idpauta` INT(11) NOT NULL PRIMARY KEY auto_increment,
  `idaluno` INT(11) NOT NULL,
  `dataupdate` DATA NOT NULL,
  `status` VARCHAR(20) NOT NULL
)

-- Codigo Estrangeiros

ALTER TABLE turma ADD CONSTRAINT fk_facilitador
FOREIGN KEY(idfacilitador) 
REFERENCES facilitador(idfacilitador);

ALTER TABLE turma ADD CONSTRAINT fk_curso
FOREIGN KEY(idcurso) 
REFERENCES curso(idcurso);