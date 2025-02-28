
#modifico delimiter di default con @
DELIMITER @

#impostiamo db su cui eseguire la query
USE fioraio@

#creazione della tabella di prova
CREATE TABLE IF NOT EXISTS prova (
prova_id INT NOT NULL,
nome VARCHAR(50) NULL
)@

#lettura dati tabella prova
SELECT * FROM prova@

#reimposto delimiter di default
DELIMITER ;