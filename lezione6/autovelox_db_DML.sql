-- Inserimento dati utenti
insert into utenti (nome, cognome, email, telefono) values
('mario', 'rossi', 'mario.rossi@email.com', '3331234567'),
('luca', 'bianchi', 'luca.bianchi@email.com', '3339876543'),
('giulia', 'verdi', 'giulia.verdi@email.com', '3205678901'),
('andrea', 'neri', 'andrea.neri@email.com', '3291122334'),
('sara', 'gialli', 'sara.gialli@email.com', '3285566778');

-- Inserimento dati veicoli
insert into veicoli (targa, modello, marca, utente_id) values
('ab123cd', 'panda', 'fiat', 1),
('xy987zz', 'golf', 'volkswagen', 2),
('ef456gh', 'serie 3', 'bmw', 3),
('ij789kl', 'a3', 'audi', 4),
('mn012op', 'yaris', 'toyota', 5),
('qr345st', 'clio', 'renault', 1),
('uv678wx', 'corsa', 'opel', 2),
('yz901ab', 'civic', 'honda', 3);

-- Inserimento dati autovelox
insert into autovelox (posizione, limite_velocita) values
('ss16 km 100', 90),
('tangenziale nord km 45', 70),
('via roma km 2', 50),
('autostrada a14 km 250', 130);

-- Inserimento dati rilevamenti
insert into rilevamenti (veicolo_id, autovelox_id, velocita_rilevata, data_rilevamento) values
(1, 1, 95, '2025-03-01 10:30:00'),
(2, 2, 80, '2025-03-01 11:15:00'),
(3, 3, 55, '2025-03-01 12:00:00'),
(4, 4, 140, '2025-03-01 12:45:00'),
(5, 1, 85, '2025-03-01 13:20:00'),
(6, 2, 90, '2025-03-01 14:10:00'),
(7, 3, 45, '2025-03-01 15:00:00'),
(8, 4, 125, '2025-03-01 15:40:00'),
(1, 2, 100, '2025-03-02 09:30:00'),
(3, 1, 92, '2025-03-02 10:10:00'),
(4, 3, 60, '2025-03-02 11:00:00'),
(2, 4, 135, '2025-03-02 12:50:00'),
(5, 2, 72, '2025-03-02 14:00:00'),
(6, 1, 100, '2025-03-02 15:15:00'),
(8, 3, 58, '2025-03-02 16:30:00');

-- Inserimento dati infrazioni
INSERT INTO `infrazioni` VALUES 
(1,2,50.00,'2025-03-01'),
(2,4,50.00,'2025-03-01'),
(3,6,100.00,'2025-03-01'),
(4,9,150.00,'2025-03-02'),
(5,11,50.00,'2025-03-02'),
(6,14,50.00,'2025-03-02'),
(7,15,50.00,'2025-03-02');


-- Query di Selezione Richieste
-- 1. Elenco di tutti gli utenti e veicoli di ogni utente mostrando nome, cognome e targa
SELECT u.nome, u.cognome, v.targa
FROM utenti u
JOIN veicoli v ON u.utente_id = v.utente_id;

-- 2.	Elenco delle postazioni autovelox mostrando la posizione e del limite
SELECT a.posizione, a.limite_velocita
FROM autovelox a;

-- 3. Identificare le infrazioni per superamento del limite di velocità
SELECT i.infrazione_id, v.targa, u.nome, u.cognome, a.limite_velocita, r.velocita_rilevata, r.data_rilevamento
FROM infrazioni i
JOIN rilevamenti r ON i.rilevamento_id = r.rilevamento_id
JOIN veicoli v ON r.veicolo_id = v.veicolo_id
JOIN utenti u ON v.utente_id = u.utente_id
JOIN autovelox a ON r.autovelox_id = a.autovelox_id
WHERE r.velocita_rilevata > a.limite_velocita;

-- 4. Elenco delle multe per ogni proprietario di veicolo
SELECT u.nome, u.cognome, COUNT(i.infrazione_id) AS numero_multe
FROM utenti u
JOIN veicoli v ON u.utente_id = v.utente_id
JOIN rilevamenti r ON v.veicolo_id = r.veicolo_id
JOIN infrazioni i ON r.rilevamento_id = i.rilevamento_id
GROUP BY u.utente_id;


-- 5. Numero di infrazioni per autovelox, ordinate per il numero di multe
SELECT a.autovelox_id, a.posizione, COUNT(i.infrazione_id) AS numero_infrazioni
FROM autovelox a
JOIN rilevamenti r ON a.autovelox_id = r.autovelox_id
JOIN infrazioni i ON r.rilevamento_id = i.rilevamento_id
GROUP BY a.autovelox_id
ORDER BY numero_infrazioni DESC;


-- 6. Dettaglio delle multe ordinate per importo decrescente
SELECT i.infrazione_id, v.targa, u.nome, u.cognome, i.importo, r.data_rilevamento
FROM infrazioni i
JOIN rilevamenti r ON i.rilevamento_id = r.rilevamento_id
JOIN veicoli v ON r.veicolo_id = v.veicolo_id
JOIN utenti u ON v.utente_id = u.utente_id
ORDER BY i.importo DESC;



-- 7. Veicolo con il maggior numero di infrazioni
SELECT v.targa, COUNT(i.infrazione_id) AS numero_infrazioni
FROM veicoli v
JOIN rilevamenti r ON v.veicolo_id = r.veicolo_id
JOIN infrazioni i ON r.rilevamento_id = i.rilevamento_id
GROUP BY v.veicolo_id
ORDER BY numero_infrazioni DESC
LIMIT 1;


-- Mostrare i veicoli con piu di 3 infrazioni in un mese
SELECT v.targa, COUNT(i.infrazione_id) AS numero_infrazioni
FROM veicoli v
JOIN rilevamenti r ON v.veicolo_id = r.veicolo_id
JOIN infrazioni i ON r.rilevamento_id = i.rilevamento_id
WHERE r.data_rilevamento >= DATE_SUB(NOW(), INTERVAL 1 MONTH)
GROUP BY v.veicolo_id
HAVING numero_infrazioni > 3;

