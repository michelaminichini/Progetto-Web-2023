INSERT INTO `biglietti` (`idbiglietto`, `tipo_pagamento`, `idproiezione1`, `idutente`, `idposto1`, `rating`) VALUES
(NULL, 1, 5, 1, 15, 5),
(NULL, 4, 7, 2, 105, 3);
ALTER TABLE `biglietti`
  MODIFY `idbiglietto` int(11) NOT NULL AUTO_INCREMENT;