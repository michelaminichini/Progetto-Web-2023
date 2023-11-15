-- Dump tabella film--
INSERT INTO `film` (`idfilm`, `titolo`, `regista`, `genere`, `durata`, `nazione`, `anno`, `descrizione`, `trailer`, `lingua`, `attori`, `attivo` ) VALUES
(1, 'Killers of the Flower Moon', 'Martin Scorsese', 'Drammatico', 205, 'USA', 2023, 'Oklahoma, primi anni Venti. Ernest Burkhart ha combattuto in guerra e torna nella nativa Fairfax in cerca di fortuna.', 'https://youtu.be/7cx9nCHsemc?si=FqLtGfXZT5f4-YYA','Ita','Leonardo Di Caprio, Robert De Niro, Jesse Plemons', 1),
(2, 'Hunger Games', 'Francis Lawrence', 'Azione, Avventura', 165, 'USA', 2023, 'Anni prima di diventare il tirannico presidente di Panem, il diciottenne Coriolanus Snow è l ultima speranza per il buon nome della sua casata in declino: un orgogliosa famiglia caduta in disgrazia nel dopoguerra di Capitol City.','https://www.youtube.com/embed/kqAyrCadrQU?fs=1&autoplay=1','Ita','Rachel Zegler, Tom Blyth, Hunter Schafer', 1),
(3, 'Gremlins', 'Joe Dante', 'Fantastico', 111, 'USA', 2023, 'Rand Peltzer, inventore, ha trovato un regalo natalizio perfetto per suo figlio Bill: un piccolo mogwai tenero e buffo. ','https://www.youtube.com/embed/rKpl61np8aE?fs=1&autoplay=1','Ita','Phoebe Cates, Keye Luke, Zach Galligan', 1),
(4, 'The Marvels', 'Nia DaCosta', 'Azione', 101, 'USA', 2023, 'Carol Danvers alias Captain Marvel ha recuperato la propria identità dai tirannici Kree e si è vendicata della Suprema Intelligenza. Ma a causa di conseguenze impreviste, Carol deve farsi carico del peso di un universo destabilizzato.','https://www.youtube.com/embed/nrMX5IcQZpE?fs=1&autoplay=1','Ita','Brie Larson, Teyonah Parris, Zawe Ashton', 1),
(5, 'The Nun II', 'Michael Chaves', 'Horror', 109, 'USA', 2023, '1956 - Francia. Un prete viene assassinato. Un male si sta diffondendo. Il sequel segue le vicende di Suor Irene, quando viene a trovarsi nuovamente faccia a faccia con Valak, la suora demoniaca.','https://youtu.be/QF-oyCwaArU','Ita','Bonnie Aarons, Taissa Farmiga, Anna Popplewell', 1),
(6, 'Oppenheimer', 'Christopher Nolan', 'Biografico, Drammatico, Storico', 180, 'USA', 2023, 'Basato sulla biografia Robert Oppenheimer, il padre della bomba atomica di Kai Bird e Martin J. Sherwin, il film racconta la vita del fisico teorico statunitense J. Robert Oppenheimer.','https://youtu.be/bK6ldnjE3Y0','Ita','Cillian Murphy, Emily Blunt, Robert Downey Jr., Matt Damon, Rami Malek', 0),
(7, 'Povere Creature!', 'Yorgos Lanthimos', 'Fantascienza', 101, 'USA', 2023, 'Oltre alle cicatrici che lo sfigurano e alle terribili menomazioni del suo fisico, Godwin Baxter deve a suo padre anche una sincera passione per il metodo scientifico e le pratiche chirurgiche.','https://youtu.be/RlbR5N6veqw','Ita','Emma Stone, Margaret Qualley, Willem Dafoe, Mark Ruffalo', 0);
ALTER TABLE `film`
  MODIFY `idfilm` int(11) NOT NULL AUTO_INCREMENT;

-- Dump tabella sale--
INSERT INTO `sale` (`idsala`, `descrizione`, `posti`, `posti_speciali`, `tecnologia`) VALUES
(1,'Sala digitale', 260, 4, 'Dolby Digital 3D, SDDS, DTS'),
(2, 'Sala digitale', 140, 4, 'Dolby Digital EX, SDDS, DTS'),
(3, 'Sala digitale', 255, 4, 'Dolby Digital EX, SDDS, DTS');
ALTER TABLE `sale`
  MODIFY `idsala` int(11) NOT NULL AUTO_INCREMENT;

-- Dump tabella proiezioni--
INSERT INTO `proiezioni` (`idproiezione`, `idfilm`, `idsala`, `nome_categoria`, `datap`, 'orario') VALUES
(1, 1, 1, 'NULL', '2023-11-16', '21:00'),
(2, 1, 3, 'NULL', '2023-11-14', '21:00'),
(3, 1, 1, 'NULL', '2023-11-19', '17:00'),
(4, 2, 3, 'NULL', '2023-11-17', '21:00'),
(5, 2, 2, 'NULL', '2023-11-16', '21:00'),
(6, 2, 3, 'NULL', '2023-11-15', '21:00'),
(7, 3, 2, 'NULL', '2023-11-19', '17:00'),
(8, 3, 1, 'NULL', '2023-11-18', '21:00'),
(9, 3, 3, 'NULL', '2023-11-18', '21:00'),
(10, 1, 3, 'NULL', '2023-11-13', '21:00'),
(11, 5, 2, 'NULL', '2023-09-15', '17:00'),
(12, 6, 3, 'NULL', '2023-08-23', '21:00'),
(13, 7, 1, 'NULL', '2023-11-13', '21:00');
ALTER TABLE `proiezioni`
  MODIFY `idproiezione` int(11) NOT NULL AUTO_INCREMENT;

-- Dump tabella tariffe--
INSERT INTO `tariffe` (`idtariffa`, `tipo_tariffa`, `descrizione`, `validità`, `prezzo`) VALUES
(1, 'Biglietto Intero', 'NULL', 'Tutto il giorno', 8,50),
(2, 'Biglietto Ridotto', 'Bambini fino ai 12 anni, Over 60, Militari, Invalidi, Giornalisti', 'Tutti i giorni', 6,50),
(3, 'Intero 3D', 'Proiezioni 3D', 'Tutto il giorno', 10,50),
(4, 'Ridotto 3D', 'Proiezioni 3D', 'Tutto il giorno', 6,50),
(6, 'Universitari', 'NULL', 'Ogni lunedì, esclusi festivi e prefestivi', 5,50),
(7, 'Ridotto Mercoledì', 'NULL', 'Esclusi festivi e prefestivi', 6,50);
ALTER TABLE `tariffe`
  MODIFY `idtariffa` int(11) NOT NULL AUTO_INCREMENT;
