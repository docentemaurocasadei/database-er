SET FOREIGN_KEY_CHECKS=0;
delete from clienti where cliente_id = 1;

SELECT c.cliente_id as codice, nome, cognome, numero, 
`data`, stato_pagamento 
FROM ordini o
join clienti c on o.cliente_id = c.cliente_id;

SELECT c.cliente_id as codice, nome, cognome, numero, 
`data`, stato_pagamento 
FROM ordini o
right join clienti c on o.cliente_id = c.cliente_id;

