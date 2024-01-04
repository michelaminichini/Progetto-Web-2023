-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 04, 2024 alle 13:04
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

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
-- Struttura della tabella `biglietti`
--

CREATE TABLE `biglietti` (
  `idbiglietto` int(11) NOT NULL,
  `idpagamento1` int(11) NOT NULL,
  `idproiezione1` int(11) NOT NULL,
  `idutente` int(11) NOT NULL,
  `idposto1` varchar(255) NOT NULL,
  `rating` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `biglietti`
--

INSERT INTO `biglietti` (`idbiglietto`, `idpagamento1`, `idproiezione1`, `idutente`, `idposto1`, `rating`) VALUES
(1, 57, 3, 9, 'G12', 0),
(7, 42, 1, 5, 'A1', 5),
(8, 43, 1, 6, 'F2', 3),
(9, 45, 1, 9, 'A1,A2', 0),
(11, 64, 9, 9, 'G13 G14 G15', 0),
(12, 76, 2, 9, 'E7, E8', 0),
(13, 77, 1, 9, 'K20', 0),
(14, 78, 1, 9, 'I5', 0),
(15, 78, 0, 0, 'D1', 0),
(16, 80, 0, 0, 'D1, D2', 0),
(17, 81, 0, 0, 'B4, B5', 0),
(18, 82, 4, 9, 'B3, B4', 0),
(19, 83, 3, 9, 'C4, D4', 0);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `biglietti`
--
ALTER TABLE `biglietti`
  ADD PRIMARY KEY (`idbiglietto`),
  ADD KEY `fk_cinema_idproizione1_idx` (`idproiezione1`),
  ADD KEY `fk_cinema_idutente_idx` (`idutente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `biglietti`
--
ALTER TABLE `biglietti`
  MODIFY `idbiglietto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
