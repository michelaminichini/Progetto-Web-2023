-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 13, 2023 alle 14:14
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

DELIMITER $$
--
-- Procedure
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREA_PPS` (IN `param1` INT(6))  MODIFIES  DATA BEGIN
DECLARE filecnt, colcnt, fc INT;
DECLARE numpro, numsala, dummysala, maxfile, maxposti INT;
DECLARE cc CHAR(1);

SELECT idproiezione, idsala INTO numpro, numsala FROM proiezioni WHERE idproiezione = param1 LIMIT 1;

SELECT idsala, fila, posti_fila
INTO dummysala,maxfile,maxposti
FROM sale
WHERE idsala = numsala LIMIT 1;

#set maxposti = 5;
#set maxfile=8;

SET filecnt = 1; 
fc: WHILE filecnt <= maxfile DO
      SET colcnt = 1;
      SET fc = filecnt + 64;
      SET cc = CHAR(fc);
rc:   WHILE colcnt <= maxposti DO       
      INSERT INTO posti_proiezione (idposto,idproiezione,fila,numero) VALUES (NULL,param1, cc, colcnt);
      #INSERT INTO posti_proiezione (idposto,idproiezione,fila,numero) VALUES (0,1,2,3);

      SET colcnt = colcnt + 1;
   END WHILE rc;
   SET filecnt=filecnt+1;
END WHILE fc;
END$$

DELIMITER ;

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
(1, 57, 3, 9, 'A5', 0),
(7, 42, 1, 5, 'A1', 5),
(8, 43, 1, 6, 'B2', 3),
(9, 45, 1, 9, 'C1, C2', 4),
(11, 64, 9, 9, 'D2, D3', 3),
(12, 76, 2, 9, 'B4, B5', 4),
(13, 77, 1, 9, 'C5', 5),
(14, 78, 1, 9, 'B5', 3),
(15, 78, 4, 0, 'D1', 4),
(16, 80, 5, 0, 'D1, D2', 5),
(17, 81, 6, 0, 'B4, B5', 4),
(18, 82, 4, 9, 'B3, B4', 5),
(19, 83, 3, 9, 'C4, C5', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `idfilm` int(11) NOT NULL,
  `titolo` varchar(100) NOT NULL,
  `regista` varchar(100) NOT NULL,
  `genere` varchar(100) DEFAULT NULL,
  `durata` int(11) NOT NULL,
  `nazione` varchar(100) DEFAULT NULL,
  `anno` varchar(10) DEFAULT NULL,
  `descrizione` varchar(300) DEFAULT NULL,
  `trailer` varchar(100) DEFAULT NULL,
  `locandina` varchar(100) DEFAULT NULL,
  `lingua` varchar(100) DEFAULT NULL,
  `attori` varchar(100) DEFAULT NULL,
  `stato` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`idfilm`, `titolo`, `regista`, `genere`, `durata`, `nazione`, `anno`, `descrizione`, `trailer`, `locandina`, `lingua`, `attori`, `stato`) VALUES
(1, 'Killers of the Flower Moon', 'Martin Scorsese', 'Drammatico', 205, 'USA', '2023', 'Oklahoma, primi anni Venti. Ernest Burkhart ha combattuto in guerra e torna nella nativa Fairfax in cerca di fortuna.', 'https://youtu.be/7cx9nCHsemc?si=FqLtGfXZT5f4-YYA', 'killers-of-the-flower-moon.png', 'Ita', 'Leonardo Di Caprio, Robert De Niro, Jesse Plemons', 1),
(2, 'Hunger Games: la ballata dell\'usignolo e del serpente', 'Francis Lawrence', 'Azione, Avventura', 165, 'USA', '2023', 'Anni prima di diventare il tirannico presidente di Panem, il diciottenne Coriolanus Snow è l ultima speranza per il buon nome della sua casata in declino: un orgogliosa famiglia caduta in disgrazia nel dopoguerra di Capitol City.', 'https://www.youtube.com/embed/kqAyrCadrQU?fs=1&autoplay=1', 'The-Hunger-Games-the-Ballad-of-Songbirds-and-Snakes.png', 'Ita', 'Rachel Zegler, Tom Blyth, Hunter Schafer', 1),
(3, 'Gremlins', 'Joe Dante', 'Fantastico', 111, 'USA', '1984', 'Rand Peltzer, inventore, ha trovato un regalo natalizio perfetto per suo figlio Bill: un piccolo mogwai tenero e buffo. ', 'https://www.youtube.com/embed/rKpl61np8aE?fs=1&autoplay=1', 'gremlins.png', 'Ita', 'Phoebe Cates, Keye Luke, Zach Galligan', 1),
(4, 'The Marvels', 'Nia DaCosta', 'Azione', 101, 'USA', '2023', 'Carol Danvers alias Captain Marvel ha recuperato la propria identità dai tirannici Kree e si è vendicata della Suprema Intelligenza. Ma a causa di conseguenze impreviste, Carol deve farsi carico del peso di un universo destabilizzato.', 'https://www.youtube.com/embed/nrMX5IcQZpE?fs=1&autoplay=1', 'the-marvels.png', 'Ita', 'Brie Larson, Teyonah Parris, Zawe Ashton', 1),
(5, 'The Nun II', 'Michael Chaves', 'Horror', 109, 'USA', '2023', '1956 - Francia. Un prete viene assassinato. Un male si sta diffondendo. Il sequel del film campione d\'incassi segue le vicende di Suor Irene, quando viene a trovarsi nuovamente faccia a faccia con Valak, la suora demoniaca.', 'https://youtu.be/QF-oyCwaArU', 'the-nun-2.png', 'Ita', 'Bonnie Aarons, Taissa Farmiga, Anna Popplewell', 1),
(6, 'Oppenheimer', 'Christopher Nolan', 'Biografico, Drammatico, Storico', 180, 'USA', '2023', 'Basato sulla biografia Robert Oppenheimer, il padre della bomba atomica di Kai Bird e Martin J. Sherwin, il film racconta la vita del fisico teorico statunitense J. Robert Oppenheimer.', 'https://youtu.be/bK6ldnjE3Y0', 'oppenheimer.png', 'Ita', 'Cillian Murphy, Emily Blunt, Robert Downey Jr., Matt Damon, Rami Malek', 0),
(7, 'Povere Creature!', 'Yorgos Lanthimos', 'Fantascienza', 101, 'USA', '2023', 'Oltre alle cicatrici che lo sfigurano e alle terribili menomazioni del suo fisico, Godwin Baxter deve a suo padre anche una sincera passione per il metodo scientifico e le pratiche chirurgiche.', 'https://youtu.be/RlbR5N6veqw', 'poor-things.png', 'Ita', 'Emma Stone, Margaret Qualley, Willem Dafoe, Mark Ruffalo', 0),
(8, 'Garfield: Una Missione Gustosa', 'Mark Dindal', 'animazione', 0, NULL, '2024', 'In questa nuova avventura, dopo un inaspettato incontro con il padre perduto da tempo, il trasandato gatto di strada Vic, Garfield e il suo amico canino Odie sono costretti a lasciare la loro vita piena di comodità per unirsi a Vic in una rapina ad alto rischio.', 'https://youtu.be/FiTUp0SU1f0?si=ZBhh0CJk_p9_V0WZ', 'Garfield.png', NULL, NULL, 2),
(9, 'Mean Girls', 'Arturo Perez Jr. and Samantha Jayne', 'commedia, musicale', 0, NULL, '2024', 'Cady Heron riesce a integrarsi nel suo nuovo liceo ed entra a far parte della cricca di ragazze di prima qualità, le Plastics. Poi, però, commette il tragico errore di innamorarsi di Aaron Samuels, ex fidanzato di Regina George.', 'https://youtu.be/fFtdbEgnUOk?si=L6MItsJwSYWo6ZxJ', 'mean-girls.png', NULL, NULL, 2),
(10, 'Argylle', 'Matthew Vaughn', 'spionaggio, azione', 0, NULL, '2024', 'Elly Conway, una solitaria scrittrice di best-seller di spionaggio, gradisce passare le serate davanti al computer in compagnia del suo gatto Alfie. Si ritroverà catapultata nel vero mondo dello spionaggio quando le trame dei suoi libri, incentrati su Argylle, un agente segreto, inizieranno a divent', 'https://youtu.be/7mgu9mNZ8Hk?si=qBKDZ0Jbrle9wYeL', 'Argylle.png', NULL, NULL, 2),
(11, 'Arthur the King', 'Simon Cellan Jones', 'drama, azione', 0, NULL, '2024', 'Un campione di raid - le cui gare prevedono un viaggio avventuroso con destinazione prefissata che comporta la percorrenza di una lunga distanza - adotta un cane randagio di nome Arthur, che si unisce a lui in una gara di resistenza.', 'https://youtu.be/wjDJNEPghNY?si=rNm9ubF8iudZ1W4B', 'arthur-the-king.png', NULL, NULL, 2),
(12, 'Joker: Folie à Deux', 'Todd Phillips', 'thriller psicologico musicale', 0, NULL, '2024', 'Sequel di Joker; un musical ambientato principalmente all’Arkham Asylum e si concentrerà sul tempo trascorso da Joker nell’iconico manicomio criminale.', 'https://youtu.be/03ymBj144ng?si=64Qni2C8o1RFj_zF', 'joker-2.png', NULL, NULL, 2),
(13, 'Beetlejuice 2', 'Tim Burton', 'thriller, fantasy', 0, NULL, '2024', NULL, 'https://youtu.be/llnuyh1wo8A?si=4c_ibI70GMIMhlRK', 'beetlejuice-2.png', NULL, NULL, 2);

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
-- --------------------------------------------------------

--
-- Struttura della tabella `posti_proiezione`
--

--
-- Struttura della tabella `posti_proiezione`
--

CREATE TABLE `posti_proiezione` (
  `idposto` int(11) NOT NULL,
  `idproiezione` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `fila` char(1) NOT NULL,
  `label` varchar(4) NOT NULL,
  `numero` int(11) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  `occupato` tinyint(1) NOT NULL,
  `speciale` tinyint(1) NOT NULL,
  `costo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dump dei dati per la tabella `posti_proiezione`
--

INSERT INTO `posti_proiezione` (`idposto`, `idproiezione`, `categoria`, `fila`, `label`, `numero`, `selected`, `occupato`, `speciale`, `costo`) VALUES
(1, 4, '', 'A', 'A1', 1, 0, 0, 0, 5),
(2, 4, '', 'A', 'A2', 1, 0, 0, 0, 5),
(3, 4, '', 'A', 'A3', 1, 0, 0, 0, 5),
(4, 4, '', 'A', 'A4', 1, 0, 0, 0, 5),
(5, 4, '', 'A', 'A5', 1, 0, 0, 0, 5),
(6, 4, '', 'B', 'B1', 1, 0, 0, 0, 5),
(7, 4, '', 'B', 'B2', 1, 0, 0, 0, 5),
(8, 4, '', 'B', 'B3', 1, 0, 1, 0, 5),
(9, 4, '', 'B', 'B4', 1, 0, 1, 0, 5),
(10, 4, '', 'B', 'B5', 1, 0, 0, 0, 5),
(11, 4, '', 'C', 'C1', 1, 0, 0, 0, 5),
(12, 4, '', 'C', 'C2', 1, 0, 0, 0, 5),
(13, 4, '', 'C', 'C3', 1, 0, 0, 0, 5),
(14, 4, '', 'C', 'C4', 1, 0, 0, 0, 5),
(15, 4, '', 'C', 'C5', 1, 0, 0, 0, 5),
(16, 4, '', 'D', 'D1', 1, 0, 1, 0, 5),
(17, 4, '', 'D', 'D2', 1, 0, 0, 0, 5),
(18, 4, '', 'D', 'D3', 1, 0, 0, 0, 5),
(19, 4, '', 'D', 'D4', 1, 0, 0, 0, 5),
(20, 4, '', 'D', 'D5', 1, 0, 0, 0, 5),
(21, 6, '', 'A', 'A1', 1, 0, 0, 0, 5),
(22, 6, '', 'A', 'A2', 1, 0, 0, 0, 5),
(23, 6, '', 'A', 'A3', 1, 0, 0, 0, 5),
(24, 6, '', 'A', 'A4', 1, 0, 0, 0, 5),
(25, 6, '', 'A', 'A5', 1, 0, 0, 0, 5),
(26, 6, '', 'B', 'B1', 1, 0, 0, 0, 5),
(27, 6, '', 'B', 'B2', 1, 0, 0, 0, 5),
(28, 6, '', 'B', 'B3', 1, 0, 0, 0, 5),
(29, 6, '', 'B', 'B4', 1, 0, 1, 0, 5),
(30, 6, '', 'B', 'B5', 1, 0, 1, 0, 5),
(31, 6, '', 'C', 'C1', 1, 0, 0, 0, 5),
(32, 6, '', 'C', 'C2', 1, 0, 0, 0, 5),
(33, 6, '', 'C', 'C3', 1, 0, 0, 0, 5),
(34, 6, '', 'C', 'C4', 1, 0, 0, 0, 5),
(35, 6, '', 'C', 'C5', 1, 0, 0, 0, 5),
(36, 6, '', 'D', 'D1', 1, 0, 0, 0, 5),
(37, 6, '', 'D', 'D2', 1, 0, 0, 0, 5),
(38, 6, '', 'D', 'D3', 1, 0, 0, 0, 5),
(39, 6, '', 'D', 'D4', 1, 0, 0, 0, 5),
(40, 6, '', 'D', 'D5', 1, 0, 0, 0, 5),
(41, 7, '', 'A', 'A1', 1, 0, 0, 0, 5),
(42, 7, '', 'A', 'A2', 1, 0, 0, 0, 5),
(43, 7, '', 'A', 'A3', 1, 0, 0, 0, 5),
(44, 7, '', 'A', 'A4', 1, 0, 0, 0, 5),
(45, 7, '', 'A', 'A5', 1, 0, 0, 0, 5),
(46, 7, '', 'B', 'B1', 1, 0, 0, 0, 5),
(47, 7, '', 'B', 'B2', 1, 0, 0, 0, 5),
(48, 7, '', 'B', 'B3', 1, 0, 0, 0, 5),
(49, 7, '', 'B', 'B4', 1, 0, 0, 0, 5),
(50, 7, '', 'B', 'B5', 1, 0, 0, 0, 5),
(51, 7, '', 'C', 'C1', 1, 0, 0, 0, 5),
(52, 7, '', 'C', 'C2', 1, 0, 0, 0, 5),
(53, 7, '', 'C', 'C3', 1, 0, 0, 0, 5),
(54, 7, '', 'C', 'C4', 1, 0, 0, 0, 5),
(55, 7, '', 'C', 'C5', 1, 0, 0, 0, 5),
(56, 7, '', 'D', 'D1', 1, 0, 0, 0, 5),
(57, 7, '', 'D', 'D2', 1, 0, 0, 0, 5),
(58, 7, '', 'D', 'D3', 1, 0, 0, 0, 5),
(59, 7, '', 'D', 'D4', 1, 0, 0, 0, 5),
(60, 7, '', 'D', 'D5', 1, 0, 0, 0, 5),
(61, 8, '', 'A', 'A1', 1, 0, 0, 0, 5),
(62, 8, '', 'A', 'A2', 1, 0, 0, 0, 5),
(63, 8, '', 'A', 'A3', 1, 0, 0, 0, 5),
(64, 8, '', 'A', 'A4', 1, 0, 0, 0, 5),
(65, 8, '', 'A', 'A5', 1, 0, 0, 0, 5),
(66, 8, '', 'B', 'B1', 1, 0, 0, 0, 5),
(67, 8, '', 'B', 'B2', 1, 0, 0, 0, 5),
(68, 8, '', 'B', 'B3', 1, 0, 0, 0, 5),
(69, 8, '', 'B', 'B4', 1, 0, 0, 0, 5),
(70, 8, '', 'B', 'B5', 1, 0, 0, 0, 5),
(71, 8, '', 'C', 'C1', 1, 0, 0, 0, 5),
(72, 8, '', 'C', 'C2', 1, 0, 0, 0, 5),
(73, 8, '', 'C', 'C3', 1, 0, 0, 0, 5),
(74, 8, '', 'C', 'C4', 1, 0, 0, 0, 5),
(75, 8, '', 'C', 'C5', 1, 0, 0, 0, 5),
(76, 8, '', 'D', 'D1', 1, 0, 0, 0, 5),
(77, 8, '', 'D', 'D2', 1, 0, 0, 0, 5),
(78, 8, '', 'D', 'D3', 1, 0, 0, 0, 5),
(79, 8, '', 'D', 'D4', 1, 0, 0, 0, 5),
(80, 8, '', 'D', 'D5', 1, 0, 0, 0, 5),
(81, 11, '', 'A', 'A1', 1, 0, 0, 0, 5),
(82, 11, '', 'A', 'A2', 1, 0, 0, 0, 5),
(83, 11, '', 'A', 'A3', 1, 0, 0, 0, 5),
(84, 11, '', 'A', 'A4', 1, 0, 0, 0, 5),
(85, 11, '', 'A', 'A5', 1, 0, 0, 0, 5),
(86, 11, '', 'B', 'B1', 1, 0, 0, 0, 5),
(87, 11, '', 'B', 'B2', 1, 0, 0, 0, 5),
(88, 11, '', 'B', 'B3', 1, 0, 0, 0, 5),
(89, 11, '', 'B', 'B4', 1, 0, 0, 0, 5),
(90, 11, '', 'B', 'B5', 1, 0, 0, 0, 5),
(91, 11, '', 'C', 'C1', 1, 0, 0, 0, 5),
(92, 11, '', 'C', 'C2', 1, 0, 0, 0, 5),
(93, 11, '', 'C', 'C3', 1, 0, 0, 0, 5),
(94, 11, '', 'C', 'C4', 1, 0, 0, 0, 5),
(95, 11, '', 'C', 'C5', 1, 0, 0, 0, 5),
(96, 11, '', 'D', 'D1', 1, 0, 0, 0, 5),
(97, 11, '', 'D', 'D2', 1, 0, 0, 0, 5),
(98, 11, '', 'D', 'D3', 1, 0, 0, 0, 5),
(99, 11, '', 'D', 'D4', 1, 0, 0, 0, 5),
(100, 11, '', 'D', 'D5', 1, 0, 0, 0, 5),
(101, 12, '', 'A', 'A1', 1, 0, 0, 0, 5),
(102, 12, '', 'A', 'A2', 1, 0, 0, 0, 5),
(103, 12, '', 'A', 'A3', 1, 0, 0, 0, 5),
(104, 12, '', 'A', 'A4', 1, 0, 0, 0, 5),
(105, 12, '', 'A', 'A5', 1, 0, 0, 0, 5),
(106, 12, '', 'B', 'B1', 1, 0, 0, 0, 5),
(107, 12, '', 'B', 'B2', 1, 0, 0, 0, 5),
(108, 12, '', 'B', 'B3', 1, 0, 0, 0, 5),
(109, 12, '', 'B', 'B4', 1, 0, 0, 0, 5),
(110, 12, '', 'B', 'B5', 1, 0, 0, 0, 5),
(111, 12, '', 'C', 'C1', 1, 0, 0, 0, 5),
(112, 12, '', 'C', 'C2', 1, 0, 0, 0, 5),
(113, 12, '', 'C', 'C3', 1, 0, 0, 0, 5),
(114, 12, '', 'C', 'C4', 1, 0, 0, 0, 5),
(115, 12, '', 'C', 'C5', 1, 0, 0, 0, 5),
(116, 12, '', 'D', 'D1', 1, 0, 0, 0, 5),
(117, 12, '', 'D', 'D2', 1, 0, 0, 0, 5),
(118, 12, '', 'D', 'D3', 1, 0, 0, 0, 5),
(119, 12, '', 'D', 'D4', 1, 0, 0, 0, 5),
(120, 12, '', 'D', 'D5', 1, 0, 0, 0, 5),
(121, 13, '', 'A', 'A1', 1, 0, 0, 0, 5),
(122, 13, '', 'A', 'A2', 1, 0, 0, 0, 5),
(123, 13, '', 'A', 'A3', 1, 0, 0, 0, 5),
(124, 13, '', 'A', 'A4', 1, 0, 0, 0, 5),
(125, 13, '', 'A', 'A5', 1, 0, 0, 0, 5),
(126, 13, '', 'B', 'B1', 1, 0, 0, 0, 5),
(127, 13, '', 'B', 'B2', 1, 0, 0, 0, 5),
(128, 13, '', 'B', 'B3', 1, 0, 0, 0, 5),
(129, 13, '', 'B', 'B4', 1, 0, 0, 0, 5),
(130, 13, '', 'B', 'B5', 1, 0, 0, 0, 5),
(131, 13, '', 'C', 'C1', 1, 0, 0, 0, 5),
(132, 13, '', 'C', 'C2', 1, 0, 0, 0, 5),
(133, 13, '', 'C', 'C3', 1, 0, 0, 0, 5),
(134, 13, '', 'C', 'C4', 1, 0, 0, 0, 5),
(135, 13, '', 'C', 'C5', 1, 0, 0, 0, 5),
(136, 13, '', 'D', 'D1', 1, 0, 0, 0, 5),
(137, 13, '', 'D', 'D2', 1, 0, 0, 0, 5),
(138, 13, '', 'D', 'D3', 1, 0, 0, 0, 5),
(139, 13, '', 'D', 'D4', 1, 0, 0, 0, 5),
(140, 13, '', 'D', 'D5', 1, 0, 0, 0, 5),
(141, 10, '', 'A', 'A1', 1, 0, 0, 0, 5),
(142, 10, '', 'A', 'A2', 1, 0, 0, 0, 5),
(143, 10, '', 'A', 'A3', 1, 0, 0, 0, 5),
(144, 10, '', 'A', 'A4', 1, 0, 0, 0, 5),
(145, 10, '', 'A', 'A5', 1, 0, 0, 0, 5),
(146, 10, '', 'B', 'B1', 1, 0, 0, 0, 5),
(147, 10, '', 'B', 'B2', 1, 0, 0, 0, 5),
(148, 10, '', 'B', 'B3', 1, 0, 0, 0, 5),
(149, 10, '', 'B', 'B4', 1, 0, 0, 0, 5),
(150, 10, '', 'B', 'B5', 1, 0, 0, 0, 5),
(151, 10, '', 'C', 'C1', 1, 0, 0, 0, 5),
(152, 10, '', 'C', 'C2', 1, 0, 0, 0, 5),
(153, 10, '', 'C', 'C3', 1, 0, 0, 0, 5),
(154, 10, '', 'C', 'C4', 1, 0, 0, 0, 5),
(155, 10, '', 'C', 'C5', 1, 0, 0, 0, 5),
(156, 10, '', 'D', 'D1', 1, 0, 0, 0, 5),
(157, 10, '', 'D', 'D2', 1, 0, 0, 0, 5),
(158, 10, '', 'D', 'D3', 1, 0, 0, 0, 5),
(159, 10, '', 'D', 'D4', 1, 0, 0, 0, 5),
(160, 10, '', 'D', 'D5', 1, 0, 0, 0, 5),
(456, 9, '', 'A', 'A1', 1, 0, 1, 0, 5),
(457, 9, '', 'A', 'A2', 2, 0, 1, 0, 5),
(458, 9, '', 'A', 'A3', 3, 0, 1, 0, 5),
(459, 9, '', 'A', 'A4', 4, 0, 1, 0, 5),
(460, 9, '', 'A', 'A5', 5, 0, 0, 0, 5),
(471, 9, '', 'B', 'B1', 1, 0, 0, 0, 5),
(472, 9, '', 'B', 'B2', 2, 0, 0, 0, 5),
(473, 9, '', 'B', 'B3', 3, 0, 1, 0, 5),
(474, 9, '', 'B', 'B4', 4, 0, 0, 0, 5),
(475, 9, '', 'B', 'B5', 5, 0, 0, 0, 5),
(486, 9, '', 'C', 'C1', 1, 0, 0, 0, 5),
(487, 9, '', 'C', 'C2', 2, 0, 0, 0, 5),
(488, 9, '', 'C', 'C3', 3, 0, 0, 0, 5),
(489, 9, '', 'C', 'C4', 4, 0, 0, 0, 5),
(490, 9, '', 'C', 'C5', 5, 0, 0, 0, 5),
(501, 9, '', 'D', 'D1', 1, 0, 0, 0, 5),
(502, 9, '', 'D', 'D2', 2, 0, 1, 0, 5),
(503, 9, '', 'D', 'D3', 3, 0, 1, 0, 5),
(504, 9, '', 'D', 'D4', 4, 0, 0, 0, 5),
(506, 9, '', 'D', 'D5', 5, 0, 0, 0, 5),
(681, 2, '', 'A', 'A1', 1, 0, 0, 0, 5),
(682, 2, '', 'A', 'A2', 2, 0, 0, 0, 5),
(683, 2, '', 'A', 'A3', 3, 0, 1, 0, 5),
(684, 2, '', 'A', 'A4', 4, 0, 1, 0, 5),
(685, 2, '', 'A', 'A5', 5, 0, 1, 0, 5),
(696, 2, '', 'B', 'B1', 1, 0, 1, 0, 5),
(697, 2, '', 'B', 'B2', 2, 0, 1, 0, 5),
(698, 2, '', 'B', 'B3', 3, 0, 0, 0, 5),
(699, 2, '', 'B', 'B4', 4, 0, 1, 0, 5),
(700, 2, '', 'B', 'B5', 5, 0, 1, 0, 5),
(711, 2, '', 'C', 'C1', 1, 0, 0, 0, 5),
(712, 2, '', 'C', 'C2', 2, 0, 0, 0, 5),
(713, 2, '', 'C', 'C3', 3, 0, 0, 0, 5),
(714, 2, '', 'C', 'C4', 4, 0, 0, 0, 5),
(715, 2, '', 'C', 'C5', 5, 0, 0, 0, 5),
(726, 2, '', 'D', 'D1', 1, 0, 0, 0, 5),
(727, 2, '', 'D', 'D2', 2, 0, 0, 0, 5),
(728, 2, '', 'D', 'D3', 3, 0, 0, 0, 5),
(729, 2, '', 'D', 'D4', 4, 0, 0, 0, 5),
(730, 2, '', 'D', 'D5', 5, 0, 0, 0, 5),
(906, 1, '', 'A', 'A1', 1, 0, 1, 0, 5),
(907, 1, '', 'A', 'A2', 2, 0, 1, 0, 5),
(908, 1, '', 'A', 'A3', 3, 0, 1, 0, 5),
(909, 1, '', 'A', 'A4', 4, 0, 1, 0, 5),
(910, 1, '', 'A', 'A5', 5, 0, 1, 0, 5),
(926, 1, '', 'B', 'B1', 1, 0, 1, 0, 5),
(927, 1, '', 'B', 'B2', 2, 0, 1, 0, 5),
(928, 1, '', 'B', 'B3', 3, 0, 1, 0, 5),
(929, 1, '', 'B', 'B4', 4, 0, 1, 0, 5),
(930, 1, '', 'B', 'B5', 5, 0, 1, 0, 5),
(946, 1, '', 'C', 'C1', 1, 0, 1, 0, 5),
(947, 1, '', 'C', 'C2', 2, 0, 1, 0, 5),
(948, 1, '', 'C', 'C3', 3, 0, 1, 0, 5),
(949, 1, '', 'C', 'C4', 4, 0, 1, 0, 5),
(950, 1, '', 'C', 'C5', 5, 0, 1, 0, 5),
(966, 1, '', 'D', 'D1', 1, 0, 1, 0, 5),
(967, 1, '', 'D', 'D2', 2, 0, 1, 0, 5),
(968, 1, '', 'D', 'D3', 3, 0, 1, 0, 5),
(969, 1, '', 'D', 'D4', 4, 0, 1, 0, 5),
(970, 1, '', 'D', 'D5', 5, 0, 1, 0, 5),
(1391, 5, '', 'A', 'A1', 1, 0, 0, 0, 5),
(1392, 5, '', 'A', 'A2', 2, 0, 1, 0, 5),
(1393, 5, '', 'A', 'A3', 3, 0, 0, 0, 5),
(1394, 5, '', 'A', 'A4', 4, 0, 0, 0, 5),
(1395, 5, '', 'A', 'A5', 5, 0, 0, 0, 5),
(1411, 5, '', 'B', 'B1', 1, 0, 0, 0, 5),
(1412, 5, '', 'B', 'B2', 2, 0, 0, 0, 5),
(1413, 5, '', 'B', 'B3', 3, 0, 0, 0, 5),
(1414, 5, '', 'B', 'B4', 4, 0, 0, 0, 5),
(1415, 5, '', 'B', 'B5', 5, 0, 0, 0, 5),
(1431, 5, '', 'C', 'C1', 1, 0, 1, 0, 5),
(1432, 5, '', 'C', 'C2', 2, 0, 1, 0, 5),
(1433, 5, '', 'C', 'C3', 3, 0, 0, 0, 5),
(1434, 5, '', 'C', 'C4', 4, 0, 0, 0, 5),
(1435, 5, '', 'C', 'C5', 5, 0, 0, 0, 5),
(1451, 5, '', 'D', 'D1', 1, 0, 1, 0, 5),
(1452, 5, '', 'D', 'D2', 2, 0, 1, 0, 5),
(1453, 5, '', 'D', 'D3', 3, 0, 0, 0, 5),
(1454, 5, '', 'D', 'D4', 4, 0, 0, 0, 5),
(1455, 5, '', 'D', 'D5', 5, 0, 0, 0, 5),
(1531, 3, '', 'A', 'A1', 1, 0, 0, 0, 5),
(1532, 3, '', 'A', 'A2', 2, 0, 0, 0, 5),
(1533, 3, '', 'A', 'A3', 3, 0, 1, 0, 5),
(1534, 3, '', 'A', 'A4', 4, 0, 1, 0, 5),
(1535, 3, '', 'A', 'A5', 5, 0, 1, 0, 5),
(1551, 3, '', 'B', 'B1', 1, 0, 0, 0, 5),
(1552, 3, '', 'B', 'B2', 2, 0, 0, 0, 5),
(1553, 3, '', 'B', 'B3', 3, 0, 0, 0, 5),
(1554, 3, '', 'B', 'B4', 4, 0, 0, 0, 5),
(1555, 3, '', 'B', 'B5', 5, 0, 0, 0, 5),
(1571, 3, '', 'C', 'C1', 1, 0, 0, 0, 5),
(1572, 3, '', 'C', 'C2', 2, 0, 1, 0, 5),
(1573, 3, '', 'C', 'C3', 3, 0, 1, 0, 5),
(1574, 3, '', 'C', 'C4', 4, 0, 1, 0, 5),
(1575, 3, '', 'C', 'C5', 5, 0, 1, 0, 5),
(1591, 3, '', 'D', 'D1', 1, 0, 0, 0, 5),
(1592, 3, '', 'D', 'D2', 2, 0, 0, 0, 5),
(1593, 3, '', 'D', 'D3', 3, 0, 0, 0, 5),
(1594, 3, '', 'D', 'D4', 4, 0, 0, 0, 5),
(1595, 3, '', 'D', 'D5', 5, 0, 0, 0, 5);

--
-- Struttura della tabella `proiezioni`
--

CREATE TABLE `proiezioni` (
  `idproiezione` int(15) NOT NULL,
  `idfilm` int(11) NOT NULL,
  `idsala` int(11) NOT NULL,
  `datap` date NOT NULL,
  `orario` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `proiezioni`
--

INSERT INTO `proiezioni` (`idproiezione`, `idfilm`, `idsala`, `datap`, `orario`) VALUES
(1, 1, 1, '2023-11-16', '21:00:00'),
(2, 1, 3, '2023-11-14', '21:00:00'),
(3, 1, 1, '2023-11-19', '17:00:00'),
(4, 2, 3, '2023-11-17', '21:00:00'),
(5, 2, 2, '2023-11-16', '21:00:00'),
(6, 2, 2, '2023-11-17', '21:00:00'),
(7, 3, 2, '2023-11-19', '17:00:00'),
(8, 4, 1, '2023-11-18', '21:00:00'),
(9, 3, 3, '2023-11-18', '21:00:00'),
(10, 1, 3, '2023-11-13', '21:00:00'),
(11, 5, 2, '2023-09-15', '17:00:00'),
(12, 6, 3, '2023-08-23', '21:00:00'),
(13, 7, 1, '2023-11-13', '21:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `prossimamente`
--

CREATE TABLE `prossimamente` (
  `id_film` int(6) NOT NULL,
  `titolo_film` varchar(100) NOT NULL,
  `regista_film` varchar(100) NOT NULL,
  `genere_film` varchar(100) DEFAULT NULL,
  `anno_uscita` varchar(10) DEFAULT NULL,
  `descrizione` varchar(300) DEFAULT NULL,
  `trailer` varchar(100) DEFAULT NULL,
  `locandina` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prossimamente`
--

INSERT INTO `prossimamente` (`id_film`, `titolo_film`, `regista_film`, `genere_film`, `anno_uscita`, `descrizione`, `trailer`, `locandina`) VALUES
(1, 'Garfield: Una Missione Gustosa', 'Mark Dindal', 'animazione', '2024', 'In questa nuova avventura, dopo un inaspettato incontro con il padre perduto da tempo, il trasandato gatto di strada Vic, Garfield e il suo amico canino Odie sono costretti a lasciare la loro vita piena di comodità per unirsi a Vic in una rapina ad alto rischio.', 'https://youtu.be/FiTUp0SU1f0?si=ZBhh0CJk_p9_V0WZ', 'Garfield.png'),
(2, 'Mean Girls', 'Arturo Perez Jr. and Samantha Jayne', 'commedia, musicale', '2024', 'Cady Heron riesce a integrarsi nel suo nuovo liceo ed entra a far parte della cricca di ragazze di prima qualità, le Plastics. Poi, però, commette il tragico errore di innamorarsi di Aaron Samuels, ex fidanzato di Regina George.', 'https://youtu.be/fFtdbEgnUOk?si=L6MItsJwSYWo6ZxJ', 'mean-girls.png'),
(3, 'Argylle', 'Matthew Vaughn', 'spionaggio, azione', '2024', 'Elly Conway, una solitaria scrittrice di best-seller di spionaggio, gradisce passare le serate davanti al computer in compagnia del suo gatto Alfie. Si ritroverà catapultata nel vero mondo dello spionaggio quando le trame dei suoi libri, incentrati su Argylle, un agente segreto, inizieranno a divent', 'https://youtu.be/7mgu9mNZ8Hk?si=qBKDZ0Jbrle9wYeL', 'Argylle.png'),
(4, 'Arthur the King', 'Simon Cellan Jones', 'drama, azione', '2024', 'Un campione di raid - le cui gare prevedono un viaggio avventuroso con destinazione prefissata che comporta la percorrenza di una lunga distanza - adotta un cane randagio di nome Arthur, che si unisce a lui in una gara di resistenza.', 'https://youtu.be/wjDJNEPghNY?si=rNm9ubF8iudZ1W4B', 'arthur-the-king.png'),
(5, 'Joker: Folie à Deux', 'Todd Phillips', 'thriller psicologico musicale', '2024', 'Sequel di Joker; un musical ambientato principalmente all’Arkham Asylum e si concentrerà sul tempo trascorso da Joker nell’iconico manicomio criminale.', 'https://youtu.be/03ymBj144ng?si=64Qni2C8o1RFj_zF', 'joker-2.png'),
(6, 'Beetlejuice 2', 'Tim Burton', 'thriller, fantasy', '2024', NULL, 'https://youtu.be/llnuyh1wo8A?si=4c_ibI70GMIMhlRK', 'beetlejuice-2.png');

-- --------------------------------------------------------

--
-- Struttura della tabella `sale`
--

CREATE TABLE `sale` (
  `idsala` int(11) NOT NULL,
  `descrizione` mediumtext DEFAULT NULL,
  `posti` int(11) NOT NULL,
  `posti_speciali` int(11) NOT NULL,
  `fila` int(11) NOT NULL,
  `posti_fila` int(11) NOT NULL,
  `tecnologia` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `sale`
--
-- Ogni sala ha 20 posti: 4 file, per ognuna 5 posti
INSERT INTO `sale` (`idsala`, `descrizione`, `posti`, `posti_speciali`, `fila`, `posti_fila`, `tecnologia`) VALUES
(1, 'Sala digitale A', 260, 4, 13, 20, 'Dolby Digital 3D, SDDS, DTS'), 
(2, 'Sala digitale B', 140, 4, 7, 20, 'Dolby Digital EX, SDDS, DTS'),
(3, 'Sala digitale C', 225, 4, 15, 15, 'Dolby Digital EX, SDDS, DTS');

-- --------------------------------------------------------
--
-- Struttura della tabella `Sale_Layout`
--

CREATE TABLE `Sale_Layout` (
  `idsala` int(11) NOT NULL,
  `categoria` varchar(50),
  `fila` char(1) NOT NULL,
  `label` varchar(4) NOT NULL,
  `numero` int(11) NOT NULL,
  `speciale` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dump dei dati per la tabella `Sale_Layout`
--
INSERT INTO `Sale_Layout` (`idsala`, `categoria`, `label`, `fila`, `numero`, `speciale`) VALUES
(1, '', 'A1', 'A', 1, 0),
(1, '', 'A2', 'A', 2, 0),
(1, '', 'A3', 'A', 3, 0),
(1, '', 'A4', 'A', 4, 0),
(1, '', 'A5', 'A', 5, 0),
(1, '', 'B1', 'B', 1, 0),
(1, '', 'B2', 'B', 2, 0),
(1, '', 'B3', 'B', 3, 0),
(1, '', 'B4', 'B', 4, 0),
(1, '', 'B5', 'B', 5, 0),
(1, '', 'C1', 'C', 1, 0),
(1, '', 'C2', 'C', 2, 0),
(1, '', 'C3', 'C', 3, 0),
(1, '', 'C4', 'C', 4, 0),
(1, '', 'C5', 'C', 5, 0),
(1, '', 'D1', 'D', 1, 0),
(1, '', 'D2', 'D', 2, 0),
(1, '', 'D3', 'D', 3, 0),
(1, '', 'D4', 'D', 4, 0),
(1, '', 'D5', 'D', 5, 0),
(2, '', 'A1', 'A', 1, 0),
(2, '', 'A2', 'A', 2, 0),
(2, '', 'A3', 'A', 3, 0),
(2, '', 'A4', 'A', 4, 0),
(2, '', 'A5', 'A', 5, 0),
(2, '', 'B1', 'B', 1, 0),
(2, '', 'B2', 'B', 2, 0),
(2, '', 'B3', 'B', 3, 0),
(2, '', 'B4', 'B', 4, 0),
(2, '', 'B5', 'B', 5, 0),
(2, '', 'C1', 'C', 1, 0),
(2, '', 'C2', 'C', 2, 0),
(2, '', 'C3', 'C', 3, 0),
(2, '', 'C4', 'C', 4, 0),
(2, '', 'C5', 'C', 5, 0),
(2, '', 'D1', 'D', 1, 0),
(2, '', 'D2', 'D', 2, 0),
(2, '', 'D3', 'D', 3, 0),
(2, '', 'D4', 'D', 4, 0),
(2, '', 'D5', 'D', 5, 0),
(3, '', 'A1', 'A', 1, 0),
(3, '', 'A2', 'A', 2, 0),
(3, '', 'A3', 'A', 3, 0),
(3, '', 'A4', 'A', 4, 0),
(3, '', 'A5', 'A', 5, 0),
(3, '', 'B1', 'B', 1, 0),
(3, '', 'B2', 'B', 2, 0),
(3, '', 'B3', 'B', 3, 0),
(3, '', 'B4', 'B', 4, 0),
(3, '', 'B5', 'B', 5, 0),
(3, '', 'C1', 'C', 1, 0),
(3, '', 'C2', 'C', 2, 0),
(3, '', 'C3', 'C', 3, 0),
(3, '', 'C4', 'C', 4, 0),
(3, '', 'C5', 'C', 5, 0),
(3, '', 'D1', 'D', 1, 0),
(3, '', 'D2', 'D', 2, 0),
(3, '', 'D3', 'D', 3, 0),
(3, '', 'D4', 'D', 4, 0),
(3, '', 'D5', 'D', 5, 0),
(3, '', 'E1', 'E', 1, 0),
(3, '', 'E2', 'E', 2, 0),
(3, '', 'E3', 'E', 3, 0),
(3, '', 'E4', 'E', 4, 0),
(3, '', 'E5', 'E', 5, 0);

--
-- Struttura della tabella `tariffe`
--

CREATE TABLE `tariffe` (
  `idtariffa` int(11) NOT NULL,
  `tipo_tariffa` varchar(100) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `validità` varchar(100) NOT NULL,
  `prezzo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tariffe`
--

INSERT INTO `tariffe` (`idtariffa`, `tipo_tariffa`, `descrizione`, `validità`, `prezzo`) VALUES
(1, 'Biglietto Intero', 'NULL', 'Tutto il giorno', 8.5),
(2, 'Biglietto Ridotto', 'Bambini fino ai 12 anni, Over 60, Militari, Invalidi, Giornalisti', 'Tutti i giorni', 6.5),
(3, 'Intero 3D', 'Proiezioni 3D', 'Tutto il giorno', 10.5),
(4, 'Ridotto 3D', 'Proiezioni 3D', 'Tutto il giorno', 6.5),
(5, 'Universitari', 'NULL', 'Ogni lunedì, esclusi festivi e prefestivi', 5.5),
(6, 'Ridotto Mercoledì', 'NULL', 'Esclusi festivi e prefestivi', 6.5);

-- --------------------------------------------------------

--
-- Struttura della tabella `tipo_pagamenti`
--

CREATE TABLE `tipo_pagamenti` (
  `idtipo_pagamento` int(11) NOT NULL,
  `Descrizione` varchar(100) NOT NULL,
  `Circuito` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tipo_pagamenti`
--

INSERT INTO `tipo_pagamenti` (`idtipo_pagamento`, `Descrizione`, `Circuito`) VALUES
(1, 'Carta di Credito', 'VISA'),
(2, 'Carta di Credito', 'MasterCard'),
(3, 'Carta di Credito', 'American Express'),
(4, 'Carta di Credito', 'Diners Club'),
(5, 'Carta di Debito', 'Bancomat'),
(6, 'Paypal', 'NULL'),
(7, 'Altro', 'NULL');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `idutente` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `telefono` int(100) NOT NULL,
  `data_nascita` date NOT NULL,
  `ruolo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`idutente`, `email`, `password`, `nome`, `cognome`, `telefono`, `data_nascita`, `ruolo`) VALUES
(1, 'admin1@gmail.com', '$2b$10$eARXxnqhDsukCSmi..Yyt.eC9Vr0DqHv0i68/7kyiNLO45Ghb71i2', 'Giulia', 'Vanni', 345345345, '2000-06-16', 'amministratore'),
(2, 'admin2@gmail.com', '$2b$10$3WfZ38CjDL7PTAekdYfuVODGj7uzMRnN8ZXEWr7Xp3D3lKmhDYj4i', 'Mario', 'Rossi', 44433322, '2000-05-03', 'amministratore'),
(3, 'sarabianchi@gmail.com', '$2b$10$y6mATNtd6S1hgZYUv/LemuaxtSSoa8hPW5hWnYGYDoNuTxjxeOLxC', 'Sara', 'Bianchi', 55555555, '1999-08-18', 'acquirente'),
(4, 'michelaminichini@gmail.com', '$2b$10$KlfX4oRq505jruEbX2X0Q.Bcjt6gb27Z3UD2NsHA4YEwy1iMfbXRq', 'Michela', 'Minichini', 1111111111, '2002-08-06', 'acquirente'),
(5, 'utente1@gmail.com', '$2b$10$28V0xU5TYlGvxuAIGQZ3dOk.kY2qJ8VMTl9ce4YlRUGPVibD0LFue', 'Martina', 'Pina', 2232222, '1999-01-22', 'acquirente'),
(6, 'utente2@gmail.com', '$2b$10$inHMWBTYtgYiRCkTbyo63u1V/WFHTNWeOA60qHxc.7oKG7Z3kRUOi', 'Matteo', 'Neri', 345678, '2000-11-05', 'acquirente'),
(7, 'utente3@gmail.com', '$2b$10$iq.Vu8luHvnAgSzz7iaMEe43tXhvS38NI.DX/VLq1I1084i6o0RBi', 'Sabrina', 'Fiera', 8888888, '1998-04-23', 'acquirente'),
(8, 'utente6@gmail.com', '$2b$10$CxZQrAXOVibcPWgvf5Fq.OFXNJytzzTC.Rk9lRhG7JimstMSfKvZi', 'Marino', 'Marte', 99999999, '1999-05-22', 'acquirente');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `biglietti`
--
ALTER TABLE `biglietti`
  ADD PRIMARY KEY (`idbiglietto`),
  ADD KEY `fk_cinema_idproizione1_idx` (`idproiezione1`),
  ADD KEY `fk_cinema_idutente_idx` (`idutente`),

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`idfilm`);

--
-- Indici per le tabelle `pagamenti`
--
ALTER TABLE `pagamenti`
  ADD PRIMARY KEY (`idpagamento`),
  ADD KEY `fk_cinema_idbiglietto1_idx` (`idbiglietto1`),
  ADD KEY `fk_cinema_idtipo_pagamento1_idx` (`idtipo_pagamento1`);

--
-- Indici per le tabelle `posti_proiezione`
--
ALTER TABLE `posti_proiezione`
  ADD PRIMARY KEY (`idposto`,`categoria`),
  ADD KEY `fk_cinema_idproiezione_idx` (`idproiezione`);

--
-- Indici per le tabelle `posti_proiezione_old`
--
ALTER TABLE `posti_proiezione_old`
  ADD PRIMARY KEY (`idposto`,`categoria`),
  ADD KEY `fk_cinema_idproiezione_idx` (`idproiezione`);

--
-- Indici per le tabelle `proiezioni`
--
ALTER TABLE `proiezioni`
  ADD PRIMARY KEY (`idproiezione`),
  ADD KEY `fk_cinema_idfilm_idx` (`idfilm`) USING BTREE,
  ADD KEY `fk_cinema_idsala_idx` (`idsala`) USING BTREE;

--
-- Indici per le tabelle `prossimamente`
--
ALTER TABLE `prossimamente`
  ADD PRIMARY KEY (`id_film`);

--
-- Indici per le tabelle `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`idsala`);

--
-- Indici per le tabelle `tariffe`
--
ALTER TABLE `tariffe`
  ADD PRIMARY KEY (`idtariffa`);

--
-- Indici per le tabelle `tipo_pagamenti`
--
ALTER TABLE `tipo_pagamenti`
  ADD PRIMARY KEY (`idtipo_pagamento`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`idutente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `biglietti`
--
ALTER TABLE `biglietti`
  MODIFY `idbiglietto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `idfilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT per la tabella `pagamenti`
--
ALTER TABLE `pagamenti`
  MODIFY `idpagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `posti_proiezione`
--
ALTER TABLE `posti_proiezione`
  MODIFY `idposto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1596;
--
-- AUTO_INCREMENT per la tabella `proiezioni`
--
ALTER TABLE `proiezioni`
  MODIFY `idproiezione` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `prossimamente`
--
ALTER TABLE `prossimamente`
  MODIFY `id_film` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `sale`
--
ALTER TABLE `sale`
  MODIFY `idsala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `tariffe`
--
ALTER TABLE `tariffe`
  MODIFY `idtariffa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `tipo_pagamenti`
--
ALTER TABLE `tipo_pagamenti`
  MODIFY `idtipo_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `idutente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `biglietti`
--
ALTER TABLE `biglietti`
  ADD CONSTRAINT `fk_cinema_idposto1` FOREIGN KEY (`idposto1`) REFERENCES `posti_proiezione_old` (`idposto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cinema_idproiezione1` FOREIGN KEY (`idproiezione1`) REFERENCES `proiezioni` (`idproiezione`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cinema_idutente` FOREIGN KEY (`idutente`) REFERENCES `utente` (`idutente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `pagamenti`
--
ALTER TABLE `pagamenti`
  ADD CONSTRAINT `fk_cinema_idbiglietto1` FOREIGN KEY (`idbiglietto1`) REFERENCES `biglietti` (`idbiglietto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cinema_idtipo_pagamento1` FOREIGN KEY (`idtipo_pagamento1`) REFERENCES `tipo_pagamenti` (`idtipo_pagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Limiti per la tabella `posti_proiezione`
--
ALTER TABLE `posti_proiezione`
  ADD CONSTRAINT `fk_cinema_idproiezione` FOREIGN KEY (`idproiezione`) REFERENCES `proiezioni` (`idproiezione`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
--
-- Limiti per la tabella `proiezioni`
--
ALTER TABLE `proiezioni`
  ADD CONSTRAINT `fk_cinema_idfilm` FOREIGN KEY (`idfilm`) REFERENCES `film` (`idfilm`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cinema_idsala` FOREIGN KEY (`idsala`) REFERENCES `sale` (`idsala`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
