/*
-- Richieste SQL
-- Estrarre dati
#1 Estrarre tutti gli ordini
#2 Estrarre tutti i prodotti dell'ordine con ID 2
#3 Visualizzare nella query precedente anche il nome del prodotto
#4 Visualizzare il campo nome e prezzo della tabella prodotti
#5 Aggiungere alla query #4 il nome della categoria di cui il prodotto fa parte
#6 Estrarre tutti gli ordini visualizzando i campi ordine_id e data_ordine, solo se la data_ordine è compresa tra il 02 marzo e il 05 marzo
#7 Aggiungere alla query #6 il cognome e il nome del cliente
#8 Ordinare i clienti della query #7 in ordine alfabetico

-- Ordinamento
#9 Estrarre tutti i prodotti ordinandoli per nome (Z-A) visualizzando prodotto_id e nome_prodotto
#10 Aggiungere alla query #9 il nome della categoria e ordinare per nome_categoria (A-Z)

-- Conteggio record
#11 Contare il numero totale di prodotti
#12 Contare il numero totale di categorie
#13 Contare quanti ordini sono stati effettuati dal 4 marzo all\'8 marzo
#14 Contare quanti ordini ha effettuato il cliente con ID 3
#15 Elencare tutti i clienti indicando quanti ordini ha effettuato ciascuno
#16 Contare quanti prodotti differenti sono inseriti in ogni ordine

-- Operazioni matematiche
#17 Calcolare il totale di un ordine specifico (ID = 2) basandosi su prezzo * quantita
#18 Estrarre una lista di ordini con ordine_id e il totale calcolato (prezzo * quantita), raggruppando per ordine_id
#19 Calcolare la media del valore (prezzo * quantita) degli ordini effettuati dal 01/03 al 05/03

*/

-- #1
SELECT * FROM ordini;

-- #2
SELECT * FROM ordini_has_prodotti WHERE ordine_id = 2;

-- #3
SELECT * FROM ordini_has_prodotti 
JOIN prodotti ON prodotti.prodotto_id = ordini_has_prodotti.prodotto_id
WHERE ordine_id = 2;

-- #4
SELECT nome_prodotto, prezzo FROM prodotti;

-- #5
SELECT nome_prodotto, prezzo, nome_categoria
FROM prodotti 
INNER JOIN categorie_prodotti ON prodotti.categoria_id = categorie_prodotti.categoria_id;

-- #6
SELECT ordine_id, data_ordine 
FROM ordini 
WHERE data_ordine BETWEEN "2025-03-02 00:00:00" AND "2025-03-05 23:59:00";

-- #7
SELECT cognome, nome, ordine_id, data_ordine
FROM ordini
JOIN clienti ON ordini.cliente_id = clienti.cliente_id
WHERE data_ordine BETWEEN "2025-03-02 00:00:00" AND "2025-03-05 23:59:00";

-- #8
SELECT cognome, nome, ordine_id, data_ordine
FROM ordini
JOIN clienti ON ordini.cliente_id = clienti.cliente_id
WHERE data_ordine BETWEEN "2025-03-02 00:00:00" AND "2025-03-05 23:59:00"
ORDER BY cognome DESC, nome DESC;

-- #9
SELECT prodotto_id, nome_prodotto 
FROM prodotti 
ORDER BY nome_prodotto DESC;

-- #10
SELECT prodotto_id, nome_prodotto, nome_categoria  
FROM prodotti 
JOIN categorie_prodotti ON prodotti.categoria_id = categorie_prodotti.categoria_id
ORDER BY nome_categoria ASC;

-- #11
SELECT COUNT(*) FROM prodotti;

-- #12
SELECT COUNT(categoria_id) FROM categorie_prodotti;

-- #13
SELECT COUNT(*) 
FROM ordini 
WHERE data_ordine BETWEEN "2025-03-04 00:00:00" AND "2025-03-08 23:59:00";

-- #14
SELECT COUNT(*) 
FROM ordini 
WHERE cliente_id = 3;

-- #15
SELECT cognome, nome, COUNT(ordini.cliente_id) AS numero
FROM ordini 
JOIN clienti ON ordini.cliente_id = clienti.cliente_id
GROUP BY ordini.cliente_id 
ORDER BY ordini.cliente_id;

-- #16
SELECT ordine_id, COUNT(prodotto_id) 
FROM ordini_has_prodotti 
GROUP BY ordine_id;

-- #17
SELECT ordine_id, SUM(prezzo * quantita) AS totale 
FROM ordini_has_prodotti
JOIN prodotti ON ordini_has_prodotti.prodotto_id = prodotti.prodotto_id
WHERE ordine_id = 2;

-- #18
SELECT ordine_id, SUM(prezzo * quantita) AS totale 
FROM ordini_has_prodotti
JOIN prodotti ON ordini_has_prodotti.prodotto_id = prodotti.prodotto_id
GROUP BY ordine_id;

-- #19
SELECT AVG(prezzo * quantita) 
FROM ordini_has_prodotti
JOIN ordini ON ordini.ordine_id = ordini_has_prodotti.ordine_id
JOIN prodotti ON ordini_has_prodotti.prodotto_id = prodotti.prodotto_id 
WHERE data_ordine BETWEEN "2025-03-01 00:00:00" AND "2025-03-05 23:59:00";
