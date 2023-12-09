-- 4. Crie um trigger para ser disparado quando o atributo status de um estudante for atualizado
-- e inserir um novo dado em uma tabela de log.
--Criar 
CREATE TABLE
        log_status_aluno (
        id_log INT AUTO_INCREMENT PRIMARY KEY,
        cpf_aluno BIGINT (11),
        novo_status VARCHAR(100),
        data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

-- Criar Trigger
DELIMITER / / 
CREATE TRIGGER status_atualizar BEFORE
UPDATE ON aluno FOR EACH ROW BEGIN IF NEW.status <> OLD.status THEN
INSERT INTO
    log_status_aluno (cpf_aluno, novo_status)
VALUES
    (NEW.cpf, NEW.status);

END IF;

END;

/ / DELIMITER;


