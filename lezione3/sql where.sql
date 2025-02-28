/*
#query con =
select cliente_id, cognome, nome from clienti where nome = "Mattia";

#query con >
select nome from fiori where prezzo > 2;

#query con >=
select nome from fiori where prezzo >= 2;

#query con <=
select ordine_id, numero from ordini where numero <= 5;

#query con !=
select * from clienti where telefono != "+393331234567";

#query con IN
select localita, cliente_id, cognome, nome from clienti where localita IN ("Senigallia", "Ancona", "Pesaro");

#query con NOT IN
select numero from ordini where cliente_id NOT IN (1,2);

#query con BETWEEN
select cognome,nome,data_di_nascita from clienti where data_di_nascita between 1970-01-01 and 1999-12-31;

#query con IS NULL
select cognome,nome,data_di_nascita from clienti where data_di_nascita IS NULL;

#query con IS NOT NULL
select cognome,nome,localita,indirizzo from clienti where indirizzo IS NOT NULL;

#query con LIKE
select cognome,nome,cliente_id from clienti where cognome LIKE "ROS%"; 
select cognome,nome,cliente_id from clienti where cognome LIKE "%TIA%"; 

#query OPERATORI LOGICI 
#AND
#tutti i fiori che hanno un nome che inizia con T e un prezzo < a 4€
select nome from fiori where nome LIKE "T%" and prezzo < 4;

#OR
#costruire una query a piacere con clausola OR
select * from clienti where nome = "Francesco" or cognome = "Rossi";

#query con NOT
#costruire una query a piacere con clausola NOT
select * from fiori where NOT prezzo > 5;
*/
#prezzo è ivato, voglio scorporare l'iva
select nome, prezzo / 1.22 as prezzo_imponibile from fiori;