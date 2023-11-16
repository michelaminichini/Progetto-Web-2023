INSERT INTO `pagamenti` (`idpagamento`, `idtipo_pagamento`, `idbiglietto1`, `importo`) VALUES
(NULL, 1, 1, 8.50), 
(NULL, 4, 2, 6.50);
ALTER TABLE `pagamenti`
  MODIFY `idpagamento` int(11) NOT NULL AUTO_INCREMENT;