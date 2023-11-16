INSERT INTO `posti_proiezione` (`idposto`, `idproiezione`, `categoria`, `fila`, `numero`, `occupato`, `speciale`) VALUES
(NULL, 1, 'NULL', 10, 15, 1, 0),
(NULL, 1, 'NULL', 15, 20, 1, 0),
(NULL, 1, 'NULL', 15, 21, 1, 0),
(NULL, 1, 'NULL', 30, 18, 1, 0);
ALTER TABLE `posti_proiezione`
  MODIFY `idposto` int(11);