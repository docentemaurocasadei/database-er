/*
#1 estrarre tutti gli ordini/*
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

#6 estrarre tutti gli ordini visualizzando i campi ordine_id, data_ordine 
#solamente se la data_ordine è compresa tra il 02 marzo e il 05 marzo
SELECT ordine_id, data_ordine FROM ordini WHERE 
data_ordine BETWEEN "2025-03-02 00:00:00" AND "2025-03-05 23:59:00"

ordine_id | data_ordine


#7 visualizzare il cognome e nome del cliente aggiungendolo alla query al p. 6
# cognome | nome | ordine_id | data_ordine
SELECT cognome, nome, ordine_id, data_ordine
FROM ordini
JOIN clienti on ordini.cliente_id = clienti.cliente_id
WHERE data_ordine BETWEEN "2025-03-02 00:00:00" AND "2025-03-05 23:59:00";

#8 stessa query ma clienti in ORDINE ALFABETICO
# ORDER BY
# ASC = ASCENDENTE  -   DESC = DISCENDENTE
SELECT cognome, nome, ordine_id, data_ordine
FROM ordini
JOIN clienti on ordini.cliente_id = clienti.cliente_id
WHERE data_ordine BETWEEN "2025-03-02 00:00:00" AND "2025-03-05 23:59:00"
ORDER BY cognome DESC, nome DESC;

#9 estrarre tutti i prodotti ordinandoli per nome Z-A 
# visualizzando prodotto_id e nome_prodotto
SELECT prodotto_id, nome_prodotto FROM prodotti 
ORDER BY nome_prodotto DESC

#10 utilizzare la query al punto 9 visualizzando anche il nome_categoria
# e ordinando i risultati per nome_categoria ASC [A-Z]

SELECT prodotto_id, nome_prodotto, nome_categoria  FROM prodotti 
JOIN categorie_prodotti on prodotti.categoria_id = categorie_prodotti.categoria_id
ORDER BY nome_categoria ASC;


#contare il numero di record
# COUNT(*) COUNT(prodotto_id)
#11 estrai quanti prodotti sono presenti nella tabella prodotti
SELECT count(*) FROM prodotti;


#12 contare quante categorie sono in archivio
SELECT count(categoria_id) From	categorie_prodotti;

#13 contare quanti ordini sono stati effettuati dal 4 marzo al 8 marzo
SELECT count(*)
FROM ordini
WHERE data_ordine BETWEEN "2025-03-04 00:00:00" AND "2025-03-08 23:59:00"


#14 quanti ordini ha fatto il cliente 3
SELECT count(*) FROM ordini WHERE cliente_id=3;


#15 elencami tutti i clienti indicando quanti ordini ha fatto ogni cliente
# Luca   	Bianchi 	2
# Giulia 	Verdi 		3
# ....
# GROUP BY
SELECT cognome, nome, count(ordini.cliente_id) as numero
FROM ordini 
JOIN clienti on ordini.cliente_id = clienti.cliente_id
GROUP BY ordini.cliente_id 
ORDER BY ordini.cliente_id


#16 contare quanti prodotti differenti sono inseriti in ogni ordine con la clausola GROUP BY
# ordine_id | numero
# 1			| 2
# 2			| 3
# .....
#select ordine_id, count(prodotto_id) from ordini_has_prodotti group by ordine_id;

#17 SUM
select ordine_id, sum(prezzo * quantita) as totale from ordini_has_prodotti
join prodotti on ordini_has_prodotti.prodotto_id = prodotti.prodotto_id
where ordine_id = 2;


#18 estrai una lista di ordini con ordine_id e totale ordine calcolato da
# prezzo * quantita
select ordine_id, sum(prezzo * quantita) as totale from ordini_has_prodotti
join prodotti on ordini_has_prodotti.prodotto_id = prodotti.prodotto_id
GROUP BY ordine_id;

#19 calcolare la media del valore(prezzo*quantita) degli ordini effettuati dal 01/03 al 05/03
select avg(prezzo * quantita) from ordini_has_prodotti
join ordini on ordini.ordine_id = ordini_has_prodotti.ordine_id
join prodotti on ordini_has_prodotti.prodotto_id = prodotti.prodotto_id 
WHERE data_ordine BETWEEN "2025-03-01 00:00:00" AND "2025-03-05 23:59:00"
*/

# CONCAT
# UNISCE LE STRINGHE
# Visualizzare l'elenco dei clienti con il campo "nominativo" composto da Cognome + Nome
select concat(cognome, ' ', nome) as nominativo from clienti order by nominativo;
select concat_ws(' ', cognome, nome) as nominativo from clienti order by nominativo;

#estrarre dal nome la prima lettera (SUBSTRING)
select substring(nome,1,1) from clienti;

#contare di quanti caratteri è composto il nome (LENGTH)
select length(nome) from clienti where cliente_id=10;

#contare di quanti caratteri è composto il nome (CHAR_LENGTH)
select char_length(nome) from clienti where cliente_id=10;

#individuare la posizione del carattere a dentro il nome (LOCATE)
select locate("a", nome) from clienti;

#estrarre tutti i clienti ma sostituire nel telefono al posto di 234567 la stringa ****** (REPLACE)
select replace(telefono, "234567", "******") from clienti;

# funzioni sui numeri
# calcolare il numero assoluto di -30
select abs(-30) as numero_assoluto;

# estrarre il totale ordine dell'ordine con ordine_id=5 e arrotondarlo al 1 decimale
select round(sum(prezzo*quantita),1) from ordini_has_prodotti 
join prodotti on ordini_has_prodotti.prodotto_id = prodotti.prodotto_id
where ordine_id = 5;

# estrarre il totale ordine dell'ordine con ordine_id=5 e arrotondarlo all'unità per eccesso
select ceil(sum(prezzo*quantita)) from ordini_has_prodotti 
join prodotti on ordini_has_prodotti.prodotto_id = prodotti.prodotto_id
where ordine_id = 5;

# estrarre il totale ordine dell'ordine con ordine_id=5 e arrotondarlo all'unità per difetto
select floor(sum(prezzo*quantita)) from ordini_has_prodotti 
join prodotti on ordini_has_prodotti.prodotto_id = prodotti.prodotto_id
where ordine_id = 5;

#calcolare il modulo di 50/3
select mod(50,3);

#calcolare un numero random da 0 a 1
select rand();

#elevare 10 a potenza 2
select power(10,2);

#calcolare la radice quadrata di 100
select sqrt(100);
