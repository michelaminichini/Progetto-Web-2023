INSERT INTO `proiezioni` (`idproiezione`, `idfilm`, `idsala`, `datap`, `orario` ) VALUES
(NULL, 1, 1, '2023-11-16', '21:00'),
(NULL, 1, 3, '2023-11-14', '21:00'),
(NULL, 1, 1, '2023-11-19', '17:00'),
(NULL, 2, 3, '2023-11-17', '21:00'),
(NULL, 2, 2, '2023-11-16', '21:00'),
(NULL, 2, 2, '2023-11-17', '21:00'),
(NULL, 3, 2, '2023-11-19', '17:00'),
(NULL, 3, 1, '2023-11-18', '21:00'),
(NULL, 3, 3, '2023-11-18', '21:00'),
(NULL, 1, 3, '2023-11-13', '21:00'),
(NULL, 5, 2, '2023-09-15', '17:00'),
(NULL, 6, 3, '2023-08-23', '21:00'),
(NULL, 7, 1, '2023-11-13', '21:00');
ALTER TABLE `proiezioni`
  MODIFY `idproiezione` int(15) NOT NULL AUTO_INCREMENT;