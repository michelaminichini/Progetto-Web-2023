INSERT INTO `biglietti` (`idbiglietto`, `tipo_pagamento`, `idproiezione1`, `idutente`, `idposto1`, `rating`) VALUES
(NULL, 1, 1, 1, 1, 5),
(NULL, 4, 1, 2, 2, 3);
ALTER TABLE `biglietti`
  MODIFY `idbiglietto` int(11) NOT NULL AUTO_INCREMENT;