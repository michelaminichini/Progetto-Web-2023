INSERT INTO `sale` (`idsala`, `descrizione`, `posti`, `posti_speciali`,`fila`, `posti_fila`, `tecnologia`) VALUES
(NULL,'Sala digitale', 260, 4, 13, 20, 'Dolby Digital 3D, SDDS, DTS'),
(NULL, 'Sala digitale', 140, 4, 7, 20, 'Dolby Digital EX, SDDS, DTS'),
(NULL, 'Sala digitale', 225, 4, 15,15, 'Dolby Digital EX, SDDS, DTS');
ALTER TABLE `sale`
  MODIFY `idsala` int(11) NOT NULL AUTO_INCREMENT;
