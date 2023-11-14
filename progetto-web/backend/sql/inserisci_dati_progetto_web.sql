--Dump tabella film--
INSERT INTO `film` (`idfilm`, `titolo`, `regista`, `genere`, `durata`, `nazione`, `anno`, `descrizione`, `trailer`, `lingua`, `attori`, `attivo` ) VALUES
(1, 'Killers of the Flower Moon', 'pass2019', 'Gino Pino', 1),
(2, 'cippalippa@blogisw.com', 'pass2019', 'Cippa Lippa', 1);

ALTER TABLE `film`
  MODIFY `idfilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;