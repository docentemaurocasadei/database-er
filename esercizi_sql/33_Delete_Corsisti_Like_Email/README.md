### Esercizio 33: Utilizzo di DELETE per eliminare dati specifici nelle tabelle del database

# Obiettivo
L'obiettivo di questa esercitazione è utilizzare la clausola `DELETE` per eliminare dati specifici nelle tabelle del database `gestione_corsi`.

# Requisiti
1. Assicurati di avere un database MySQL in esecuzione e accessibile.
2. Assicurati di aver creato il database `gestione_corsi` come specificato nell'esercizio 1.
3. Assicurati di aver inserito i dati nella tabella `corsisti` come specificato negli esercizi precedenti.

# Istruzioni
Scrivere un file SQL che:
1. Elimina i corsisti la cui email contiene il dominio 'temp.com'

# Accorgimenti
Se all'esecuzione del comando viene ritornato un errore 1175:

- (Raccomandato) Limitare le righe eliminabili utilizzando LIMIT seguito dal numero massimo di righe dopo la query

- Usare il comando "SET SQL_SAFE_UPDATES = 0;" prima della query per consentire la rimozione, riabilitare in seguito l'opzione con "SET SQL_SAFE_UPDATES = 1;" alla fine del file

