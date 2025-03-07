/*
select concat(nome,' ',cognome) as nominativo from clienti
where cliente_id IN (
	select cliente_id from iscrizioni where data_fine < curdate()
);
*/
update clienti set data_iscrizione = "2024-11-05" 
where cliente_id NOT IN (
	select cliente_id from iscrizioni where data_fine > curdate()
) limit 50;

UPDATE clienti
SET telefono = "3383323321", email="lucab@gmail.com" 
where cliente_id = 1;

#aggiornare all'interno della tabella iscrizioni, la data_inizio e la data_fine
#aggiungendo 3 mesi

update iscrizioni set data_inizio = adddate(data_inizio, interval 3 month),
data_fine = adddate(data_fine, interval 3 month)
limit 50;