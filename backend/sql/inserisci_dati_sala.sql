INSERT INTO `sale` (`idsala`, `descrizione`, `posti`, `posti_speciali`, `tecnologia`) VALUES
(NULL,'Sala digitale', 260, 4, 'Dolby Digital 3D, SDDS, DTS'),
(NULL, 'Sala digitale', 140, 4, 'Dolby Digital EX, SDDS, DTS'),
(NULL, 'Sala digitale', 255, 4, 'Dolby Digital EX, SDDS, DTS');
ALTER TABLE `sale`
  MODIFY `idsala` int(11) NOT NULL AUTO_INCREMENT;
