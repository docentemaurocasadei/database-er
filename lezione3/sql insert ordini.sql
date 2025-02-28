#INSERT almeno 5 ordini 2 per il cliente Davide e 3 per il cliente Mattia
#ovviamente inserire i record nella tabella ordini e dettaglio_ordini (almeno 2 fiori ogni ordine)
/*
insert into ordini (numero,`data`,cliente_id) values 
(3, "2025-02-15", 1),
(4, "2025-02-15", 2),
(5, "2025-02-16", 1),
(6, "2025-02-16", 2),
(7, "2025-02-20", 1);

insert into dettaglio_ordini (ordine_id, fiore_id, quantita) values
(3,1,5),(3,4,10),
(4,2,8),(4,5,8),
(5,3,8),(5,7,8),
(6,2,10),(6,6,8),
(7,7,4),(7,8,4);
*/
#Mattia ordina viole e iris in data 22/02
/*
cliente_id=2
fiore_id=1 (iris) 
fiore_id=2 (viola)
*/

insert into ordini(cliente_id, data, numero) values(2, "2025-02-22", 8);
insert into dettaglio_ordini(ordine_id, fiore_id, quantita) values (8,1,5),(8,2,8);