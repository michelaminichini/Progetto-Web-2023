INSERT INTO `tipo_pagamenti` (`idtipo_pagamento`, `Descrizione`, `Circuito`) VALUES
(NULL, 'Carta di Credito', 'VISA'),
(NULL, 'Carta di Credito', 'MasterCard'),
(NULL, 'Carta di Credito', 'American Express'),
(NULL, 'Carta di Credito', 'Diners Club'),
(NULL, 'Carta di Debito', 'Bancomat'),
(NULL, 'Paypal', 'NULL'), 
(NULL, 'Altro', 'NULL');
ALTER TABLE `tipo_pagamenti`
  MODIFY `idtipo_pagamento` int(11) NOT NULL AUTO_INCREMENT;