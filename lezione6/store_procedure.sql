drop procedure conta_infrazioni;

DELIMITER ||

CREATE PROCEDURE conta_infrazioni(
IN p_utente_id INT, 
OUT numero_infrazioni INT
)
BEGIN
	select count(*) into numero_infrazioni 
    from infrazioni 
    join rilevamenti on infrazioni.rilevamento_id = rilevamenti.rilevamento_id
    join veicoli on rilevamenti.veicolo_id = veicoli.veicolo_id
    where veicoli.utente_id = p_utente_id;
END ||

DELIMITER ;

set @numero_infrazioni = 0;
call conta_infrazioni(1,@numero_infrazioni);
select @numero_infrazioni;