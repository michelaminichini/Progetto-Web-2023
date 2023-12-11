
-- --------------------------------------------------------------------
-- Query per riempire la tabella cronologia nella pag utente
-- --------------------------------------------------------------------
SELECT idutente, film.idfilm, titolo, idbiglietto, idtipo_pagamento1, importo, idproiezione, idsala, datap, orario 
FROM biglietti 
JOIN pagamenti ON (biglietti.idbiglietto = pagamenti.idbiglietto1) 
JOIN proiezioni ON (biglietti.idproiezione1 = proiezioni.idproiezione)
JOIN film ON (proiezioni.idfilm = film.idfilm) 
WHERE idutente = 1

