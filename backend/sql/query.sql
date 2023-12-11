
-- --------------------------------------------------------------------
-- Query per riempire la tabella cronologia nella pag utente- versione 1
-- --------------------------------------------------------------------
SELECT idutente, film.idfilm, titolo, idbiglietto, idtipo_pagamento1, importo, idproiezione, idsala, datap, orario 
FROM biglietti 
JOIN pagamenti ON (biglietti.idbiglietto = pagamenti.idbiglietto1) 
JOIN proiezioni ON (biglietti.idproiezione1 = proiezioni.idproiezione)
JOIN film ON (proiezioni.idfilm = film.idfilm) 
WHERE idutente = 1
-- --------------------------------------------------------------------
-- Query per riempire la tabella cronologia nella pag utente- versione 2 migliorata
-- --------------------------------------------------------------------
SELECT idutente, film.idfilm, titolo, idbiglietto, idtipo_pagamento1, importo, proiezioni.idproiezione, proiezioni.idsala, datap, orario, sale.descrizione, tipo_pagamenti.Descrizione, tipo_pagamenti.circuito FROM biglietti JOIN pagamenti ON (biglietti.idbiglietto = pagamenti.idbiglietto1) JOIN tipo_pagamenti ON ( pagamenti.idtipo_pagamento1 = tipo_pagamenti.idtipo_pagamento) JOIN proiezioni ON (biglietti.idproiezione1 = proiezioni.idproiezione) JOIN sale ON (sale.idsala = proiezioni.idsala) JOIN film ON (proiezioni.idfilm = film.idfilm) WHERE idutente = 1;