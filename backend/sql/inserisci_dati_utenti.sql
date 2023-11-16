INSERT INTO `utente` (`idutente`, `email`, `password`, `nome`, `cognome`, `telefono`, `data_nascita`, `tipo`) VALUES
(NULL, 'mariorossi@gmail.com', 'password1', 'Mario', 'Rossi', 11111111, '1979-12-25', 'acquirente'),
(NULL, 'saramarconi@libero.it', 'password2', 'Sara', 'Marconi', 22222222, '2003-05-16', 'acquirente'),
(NULL, 'admingiulia@gmail.com', '123', 'Giulia', 'Vanni', 33333333, '2000-06-16', 'amministratore1'),
(NULL, 'adminmichela@gmail.com', '123', 'Michela', 'Minichini', 44444444, '2002-08-03', 'amministratore2');
ALTER TABLE `utente`
  MODIFY `idutente` int(11) NOT NULL AUTO_INCREMENT;