--Dump tabella film--
INSERT INTO `film` (`idfilm`, `titolo`, `regista`, `genere`, `durata`, `nazione`, `anno`, `descrizione`, `trailer`, `lingua`, `attori`, `attivo` ) VALUES
(1, 'Killers of the Flower Moon', 'Martin Scorsese', 'Drammatico', 205, 'USA', 2023, 'Oklahoma, primi anni Venti. Ernest Burkhart ha combattuto...', 'https://youtu.be/7cx9nCHsemc?si=FqLtGfXZT5f4-YYA''Ita''Leonardo Di Caprio, Robert De Niro, Jesse Plemons'),
(2, 'cippalippa@blogisw.com', 'pass2019', 'Cippa Lippa', 1);

ALTER TABLE `film`
  MODIFY `idfilm` int(11) NOT NULL AUTO_INCREMENT;