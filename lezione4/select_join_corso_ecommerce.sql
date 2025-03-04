#1 estrarre tutti gli ordini
-- SELECT * FROM ordini;
#2 estrarre tutti i prodotti dell'ordine con id 2
SELECT * FROM ordini_has_prodotti where ordine_id = 2;

#3 visualizzare nella query precedente anche il nome del prodotto
SELECT * FROM ordini_has_prodotti join prodotti 
on prodotti.prodotto_id = ordini_has_prodotti.prodotto_id
where ordine_id = 2;

#4 visualizzare il campo nome e prezzo della tabella prodotti
SELECT nome_prodotto, prezzo FROM prodotti;

#5 aggiungere alla query 4 il nome della categoria (visualizzare) di cui il prodotto fa parte
SELECT nome_prodotto, prezzo, nome_categoria
FROM prodotti inner join categorie_prodotti
ON prodotti.categoria_id = categorie_prodotti.categoria_id;

#estrarre tutti gli ordini visualizzando i campi ordine_id, data_ordine 
#solamente se la data_ordine è compresa tra il 02 marzo e il 05 marzo
SELECT ordine_id, data_ordine FROM ordini WHERE data_ordine BETWEEN "2025-03-02 00:00:00" AND "2025-03-05 23:59:00"