-- --------------------------------------------------------------------
-- Query 1: quando si apre il sito mostra i film in programmazione (attivo = 1) 
-- --------------------------------------------------------------------
SELECT titolo, regista, genere, durata, attori, locandina,
FROM film
WHERE film.attivo = 1

-- Query mostra data e orari di programmazione per il film con id=1
SELECT datap, orario
FROM proiezioni JOIN film ON (proiezioni.idfilm = film.idfilm)
WHERE film.attivo = 1 AND film.idfilm = 1


-- --------------------------------------------------------------------
-- Query 2: quando si clicca su scheda film mostra la scheda del film selezionato con i dettagli 
-- --------------------------------------------------------------------
SELECT titolo, titolo originale, regista, cast, durata, genere, nazione, anno, trama, trailer, datap, orario
FROM film JOIN proiezioni ON (film.idfilm = proiezioni.idfilm)

-- --------------------------------------------------------------------
-- Query 3: quando si clicca su scegli posto 
-- --------------------------------------------------------------------
SELECT idposto, occupato, speciale
FROM posti_proiezione
WHERE 

