INSERT INTO `tariffe` (`idtariffa`, `tipo_tariffa`, `descrizione`, `validità`, `prezzo`) VALUES
(NULL, 'Biglietto Intero', 'NULL', 'Tutto il giorno', 8.50),
(NULL, 'Biglietto Ridotto', 'Bambini fino ai 12 anni, Over 60, Militari, Invalidi, Giornalisti', 'Tutti i giorni', 6.50),
(NULL, 'Intero 3D', 'Proiezioni 3D', 'Tutto il giorno', 10.50),
(NULL, 'Ridotto 3D', 'Proiezioni 3D', 'Tutto il giorno', 6.50),
(NULL, 'Universitari', 'NULL', 'Ogni lunedì, esclusi festivi e prefestivi', 5.50),
(NULL, 'Ridotto Mercoledì', 'NULL', 'Esclusi festivi e prefestivi', 6.50);
ALTER TABLE `tariffe`
  MODIFY `idtariffa` int(11) NOT NULL AUTO_INCREMENT;