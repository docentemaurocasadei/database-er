CREATE DATABASE corso_ecommerce;

USE corso_ecommerce;

-- Tabella Clienti
CREATE TABLE clienti (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cognome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    indirizzo VARCHAR(255)
);

-- Tabella Prodotti
CREATE TABLE categorie_prodotti (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100)
);

CREATE TABLE prodotti (
    prodotto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_prodotto VARCHAR(100),
    descrizione TEXT,
    prezzo DECIMAL(10, 2),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorie_prodotti(categoria_id)
);

-- Tabella Ordini
CREATE TABLE ordini (
    ordine_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_ordine DATETIME,
    stato VARCHAR(50),
    totale DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clienti(cliente_id)
);

-- Tabella Ordini_has_Prodotti
CREATE TABLE ordini_has_prodotti (
    ordine_id INT,
    prodotto_id INT,
    quantita INT,
    PRIMARY KEY (ordine_id, prodotto_id),
    FOREIGN KEY (ordine_id) REFERENCES ordini(ordine_id),
    FOREIGN KEY (prodotto_id) REFERENCES prodotti(prodotto_id)
);
INSERT INTO clienti (nome, cognome, email, telefono, indirizzo) VALUES
('Luca', 'Bianchi', 'luca.bianchi@example.com', '1234567890', 'Via Roma 10, Milano'),
('Giulia', 'Verdi', 'giulia.verdi@example.com', '1234567891', 'Via Milano 25, Torino'),
('Marco', 'Rossi', 'marco.rossi@example.com', '1234567892', 'Via Napoli 30, Roma'),
('Anna', 'Gialli', 'anna.gialli@example.com', '1234567893', 'Via Firenze 40, Napoli'),
('Paolo', 'Neri', 'paolo.neri@example.com', '1234567894', 'Via Bologna 50, Bologna'),
('Francesca', 'Blu', 'francesca.blu@example.com', '1234567895', 'Via Genova 60, Genova'),
('Matteo', 'Arancio', 'matteo.arancio@example.com', '1234567896', 'Via Palermo 70, Catania'),
('Sofia', 'Marroni', 'sofia.marroni@example.com', '1234567897', 'Via Bari 80, Bari'),
('Giorgio', 'Rossi', 'giorgio.rossi@example.com', '1234567898', 'Via Lecce 90, Lecce'),
('Elena', 'Savi', 'elena.savi@example.com', '1234567899', 'Via Messina 100, Messina');
INSERT INTO categorie_prodotti (nome_categoria) VALUES
('Elettronica'),
('Abbigliamento'),
('Giocattoli');
INSERT INTO prodotti (nome_prodotto, descrizione, prezzo, categoria_id) VALUES
('Smartphone', 'Smartphone Android 5G', 299.99, 1),
('Laptop', 'Laptop con Intel i7, 16GB RAM', 799.99, 1),
('TV LED', 'Televisore LED 4K 50" con supporto HDR', 499.99, 1),
('T-shirt', 'T-shirt in cotone, taglia M', 19.99, 2),
('Jeans', 'Jeans stretch, taglia 32', 39.99, 2),
('Giacca', 'Giacca invernale, taglia L', 59.99, 2),
('Puzzle', 'Puzzle 1000 pezzi', 14.99, 3),
('Dollhouse', 'Casa delle bambole in legno', 99.99, 3),
('Treno giocattolo', 'Treno elettrico in miniatura', 29.99, 3),
('Orologio smartwatch', 'Smartwatch con monitoraggio fitness', 99.99, 1),
('Cuffie Bluetooth', 'Cuffie wireless con cancellazione del rumore', 129.99, 1),
('Zaino scuola', 'Zaino con scomparti multipli', 49.99, 2),
('Pantaloni', 'Pantaloni sportivi, taglia XL', 29.99, 2),
('Cappotto', 'Cappotto impermeabile, taglia M', 89.99, 2),
('Drone', 'Drone con fotocamera 4K', 499.99, 1);
INSERT INTO ordini (cliente_id, data_ordine, stato, totale) VALUES
(1, '2025-03-01 12:00:00', 'In elaborazione', 299.99),
(2, '2025-03-02 15:30:00', 'Spedito', 799.99),
(3, '2025-03-03 09:00:00', 'Consegnato', 499.99),
(4, '2025-03-04 10:15:00', 'In elaborazione', 19.99),
(5, '2025-03-05 16:00:00', 'Spedito', 39.99),
(6, '2025-03-06 14:45:00', 'Consegnato', 59.99),
(7, '2025-03-07 17:30:00', 'In elaborazione', 14.99),
(8, '2025-03-08 11:00:00', 'Spedito', 99.99),
(9, '2025-03-09 18:00:00', 'Consegnato', 29.99),
(10, '2025-03-10 13:00:00', 'In elaborazione', 99.99),
(1, '2025-03-11 12:30:00', 'In elaborazione', 129.99),
(2, '2025-03-12 10:00:00', 'Spedito', 49.99),
(3, '2025-03-13 09:30:00', 'Consegnato', 29.99),
(4, '2025-03-14 14:00:00', 'In elaborazione', 89.99),
(5, '2025-03-15 16:45:00', 'Spedito', 499.99);


-- Ordine 1 (Cliente 1): contiene 2 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(1, 1, 1), -- Smartphone
(1, 4, 2); -- T-shirt

-- Ordine 2 (Cliente 2): contiene 3 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(2, 2, 1), -- Laptop
(2, 5, 1), -- Jeans
(2, 7, 2); -- Puzzle

-- Ordine 3 (Cliente 3): contiene 2 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(3, 3, 1), -- TV LED
(3, 6, 1); -- Giacca

-- Ordine 4 (Cliente 4): contiene 3 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(4, 4, 2), -- T-shirt
(4, 8, 1), -- Dollhouse
(4, 5, 1); -- Jeans

-- Ordine 5 (Cliente 5): contiene 2 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(5, 9, 1), -- Orologio smartwatch
(5, 10, 1); -- Cuffie Bluetooth

-- Ordine 6 (Cliente 6): contiene 2 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(6, 11, 1), -- Zaino scuola
(6, 14, 1); -- Drone

-- Ordine 7 (Cliente 7): contiene 3 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(7, 12, 1), -- Pantaloni
(7, 13, 1), -- Cappotto
(7, 7, 2); -- Puzzle

-- Ordine 8 (Cliente 8): contiene 2 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(8, 13, 1), -- Cappotto
(8, 6, 1); -- Giacca

-- Ordine 9 (Cliente 9): contiene 3 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(9, 4, 2), -- T-shirt
(9, 2, 1), -- Laptop
(9, 9, 1); -- Orologio smartwatch

-- Ordine 10 (Cliente 10): contiene 2 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(10, 3, 1), -- TV LED
(10, 14, 1); -- Drone

-- Ordine 11 (Cliente 1): contiene 3 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(11, 2, 1), -- Laptop
(11, 8, 1), -- Dollhouse
(11, 13, 1); -- Cappotto

-- Ordine 12 (Cliente 2): contiene 2 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(12, 6, 2), -- Giacca
(12, 5, 1); -- Jeans

-- Ordine 13 (Cliente 3): contiene 3 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(13, 12, 2), -- Pantaloni
(13, 10, 1), -- Cuffie Bluetooth
(13, 4, 1); -- T-shirt

-- Ordine 14 (Cliente 4): contiene 2 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(14, 3, 1), -- TV LED
(14, 1, 1); -- Smartphone

-- Ordine 15 (Cliente 5): contiene 3 prodotti
INSERT INTO ordini_has_prodotti (ordine_id, prodotto_id, quantita) VALUES
(15, 2, 1), -- Laptop
(15, 9, 2), -- Orologio smartwatch
(15, 12, 1); -- Pantaloni

#estrai il totale ordini
/*
select sum(prezzo * quantita) as totale, ordini.ordine_id from ordini inner join ordini_has_prodotti on ordini.ordine_id = ordini_has_prodotti.ordine_id inner join prodotti on ordini_has_prodotti.prodotto_id = prodotti.prodotto_id group by ordini.ordine_id

UPDATE ordini
SET totale = (
    SELECT SUM(prodotti.prezzo * ordini_has_prodotti.quantita)
    FROM ordini_has_prodotti
    INNER JOIN prodotti ON ordini_has_prodotti.prodotto_id = prodotti.prodotto_id
    WHERE ordini_has_prodotti.ordine_id = ordini.ordine_id
    GROUP BY ordini_has_prodotti.ordine_id
)
WHERE ordine_id IN (SELECT DISTINCT ordine_id FROM ordini_has_prodotti);
*/