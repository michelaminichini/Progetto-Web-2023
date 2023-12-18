-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 18, 2023 alle 11:05
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `pagamenti`
--

CREATE TABLE `pagamenti` (
  `idpagamento` int(11) NOT NULL,
  `idtipo_pagamento1` int(11) NOT NULL,
  `importo` float NOT NULL,
  `Titolare_nome` varchar(100) NOT NULL,
  `Titolare_cognome` varchar(100) NOT NULL,
  `Numero_carta` varchar(20) NOT NULL,
  `Data_scadenza` date DEFAULT NULL,
  `CVV` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `pagamenti`
--

INSERT INTO `pagamenti` (`idpagamento`, `idtipo_pagamento1`, `importo`, `Titolare_nome`, `Titolare_cognome`, `Numero_carta`, `Data_scadenza`, `CVV`) VALUES
(12, 1, 8.5, '', '', '0', NULL, 0),
(13, 4, 6.5, '', '', '0', NULL, 0),
(18, 1, 10.5, '', '', '1234', '2024-01-01', 388),
(23, 1, 10.5, 'aaa', 'bbb', '1234', '2024-01-01', 388),
(25, 1, 10, 'paolino', 'paperino', '1234-5678-9012-1234', '2023-12-31', 332),
(26, 2, 9, 'uncle', 'scrooge', '2147483647', '2023-12-31', 999),
(27, 1, 8, 'uncle', 'scrooge', '2147483647', '2023-12-31', 253),
(28, 3, 12, 'pippo', 'pluto', '4321-8765-0912-1234', '2023-12-31', 647),
(29, 2, 11, 'paolino', 'paperino', '4.545676789891212e15', '2023-12-31', 789),
(30, 4, 15, 'paolino', 'paperino', '1234432112344321', '2023-12-31', 123);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `pagamenti`
--
ALTER TABLE `pagamenti`
  ADD PRIMARY KEY (`idpagamento`),
  ADD KEY `fk_cinema_idtipo_pagamento1_idx` (`idtipo_pagamento1`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `pagamenti`
--
ALTER TABLE `pagamenti`
  MODIFY `idpagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `pagamenti`
--
ALTER TABLE `pagamenti`
  ADD CONSTRAINT `fk_cinema_idtipo_pagamento1` FOREIGN KEY (`idtipo_pagamento1`) REFERENCES `tipo_pagamenti` (`idtipo_pagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
