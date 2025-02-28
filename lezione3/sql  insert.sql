USE fioraio;
#INSERT INTO clienti (nome,cognome,telefono, localita, note) VALUES ("giacomo", "cavallini", "+393311234567", "Senigallia", "la mia nota è questa \"impariamo mysql\" ");
#INSERT INTO fiori (famiglia, nome, prezzo) VALUES ("tuli", "tulipano nero", 5.50), ("iri", "iris giallo", 2.25);	

/*INSERT INTO clienti (nome, cognome, telefono, localita, note) VALUES
("Mario", "Rossi", "+393321112233", "Ancona", "Cliente fedele dal 2020"),
("Luisa", "Bianchi", "+393347778899", "Pesaro", "Richiede preventivo per nuovo ordine"),
("Andrea", "Verdi", "+393365554433", "Macerata", "Interessa solo pagamento con bonifico"),
("Chiara", "Neri", "+393398887766", "Fano", "Vuole ricevere aggiornamenti via email");

INSERT INTO fiori (famiglia, nome, prezzo) VALUES
("ros", "rosa rossa", 3.75),
("mar", "margherita bianca", 1.80),
("gig", "giglio arancione", 4.20),
("ort", "ortensia blu", 6.00);
*/

#alias per campo e alias per tabella
SELECT cognome as cgn, nome from clienti c WHERE c.localita = "Ancona";

#estrarre tutti i fiori di una famiglia (a scelta)
select nome from fiori where famiglia = "Graminacee";

#estrarre tutti i fiori che costano più di 4€
select nome from fiori where prezzo > 4.0;

#estrarre tutti i clienti che abitano ad Ancona (localita) oppure che hanno la localita NULL
select cognome, nome, cliente_id from clienti where localita = "ancona" OR localita IS NULL;

#estrarre tutti i clienti con indirizzo a NULL
select cognome, nome, cliente_id from clienti where indirizzo IS NULL;
