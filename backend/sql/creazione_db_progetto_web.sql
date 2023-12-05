-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cinema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cinema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cinema` DEFAULT CHARACTER SET utf8 ;
USE `cinema` ;

-- -----------------------------------------------------
-- Table `cinema `.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`film` (
  `idfilm` INT (11) NOT NULL AUTO_INCREMENT,
  `titolo` VARCHAR(100) NOT NULL,
  `regista` VARCHAR(100) NOT NULL,
  `genere` VARCHAR(100) ,
  `durata` INT NOT NULL,
  `nazione` VARCHAR(100) ,
  `anno` VARCHAR(10) ,
  `descrizione` VARCHAR(300) ,
  `trailer` VARCHAR(100) ,
  `locandina` VARCHAR(100) ,
  `lingua` VARCHAR(100) ,
  `attori` VARCHAR(100) ,
  `stato` VARCHAR(30),
  PRIMARY KEY (`idfilm`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`sale` (
  `idsala` INT NOT NULL AUTO_INCREMENT,
  `descrizione` MEDIUMTEXT,
  `posti` INT NOT NULL,
  `posti_speciali` INT NOT NULL,
  `fila` INT NOT NULL,
  `posti_fila` INT NOT NULL,
  `tecnologia` VARCHAR(100),
  PRIMARY KEY (`idsala`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`proiezioni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`proiezioni` (
  `idproiezione` INT NOT NULL AUTO_INCREMENT,
  `idfilm`INT NOT NULL,
  `idsala` INT NOT NULL,
  `datap` DATE NOT NULL,
  `orario` TIME NOT NULL,
  PRIMARY KEY (`idproiezione`),
  INDEX `fk_cinema_idfilm_idx` (`idfilm` ASC),
  CONSTRAINT `fk_cinema_idfilm`
    FOREIGN KEY (`idfilm`)
    REFERENCES `cinema`.`film` (`idfilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_cinema_idsala_idx` (`idsala` ASC),
  CONSTRAINT `fk_cinema_idsala`
    FOREIGN KEY (`idsala`)
    REFERENCES `cinema`.`sale` (`idsala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;
  


-- -----------------------------------------------------
-- Table `cinema`.`posti_proiezione`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`posti_proiezione` (
  `idposto` INT NOT NULL AUTO_INCREMENT,
  `idproiezione`INT NOT NULL,
  `categoria` VARCHAR(50) NOT NULL,
  `fila` CHAR(1)  NOT NULL,
  `numero` INT NOT NULL,
  `occupato` BOOLEAN NOT NULL,
  `speciale` BOOLEAN NOT NULL,
  PRIMARY KEY (`idposto`, `categoria`),
  INDEX `fk_cinema_idproiezione_idx` (`idproiezione` ASC),
  CONSTRAINT `fk_cinema_idproiezione`
    FOREIGN KEY (`idproiezione`)
    REFERENCES `cinema`.`proiezioni` (`idproiezione`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
 ENGINE = InnoDB; 
  

-- -----------------------------------------------------
-- Table `cinema`.`utente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`utente` (
  `idutente` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100)  NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `cognome` VARCHAR(100) NOT NULL,
  `telefono` INT(100) NOT NULL,
  `data_nascita` DATE NOT NULL,
  `tipo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idutente`))
 ENGINE = InnoDB; 

-- -----------------------------------------------------
-- Table `cinema`.`biglietti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`biglietti` (
  `idbiglietto` INT NOT NULL AUTO_INCREMENT,
  `tipo_pagamento` VARCHAR(100)  NOT NULL,
  `idproiezione1` INT NOT NULL,
  `idutente` INT NOT NULL,
  `idposto1` INT NOT NULL,
  `rating` INT(5)  NOT NULL,
  PRIMARY KEY (`idbiglietto`),
  INDEX `fk_cinema_idproizione1_idx` (`idproiezione1` ASC),
  CONSTRAINT `fk_cinema_idproiezione1`
    FOREIGN KEY (`idproiezione1`)
    REFERENCES `cinema`.`proiezioni` (`idproiezione`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_cinema_idutente_idx` (`idutente` ASC),
  CONSTRAINT `fk_cinema_idutente`
    FOREIGN KEY (`idutente`)
    REFERENCES `cinema`.`utente` (`idutente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_cinema_idposto1_idx` (`idposto1` ASC),
  CONSTRAINT `fk_cinema_idposto1`
    FOREIGN KEY (`idposto1`)
    REFERENCES `cinema`.`posti_proiezione` (`idposto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;
-- ----------------------------------------------------- 
 -- Table `cinema`.`tariffe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`tariffe` (
  `idtariffa` INT NOT NULL AUTO_INCREMENT,
  `tipo_tariffa` VARCHAR(100)  NOT NULL,
  `descrizione` VARCHAR (100),
  `validità` VARCHAR(100) NOT NULL,
  `prezzo` FLOAT(6) NOT NULL, 
  PRIMARY KEY (`idtariffa`))
  ENGINE = InnoDB; 

-- ------------------------------------------------------------------------
  -- Table `cinema`.`tipo_pagamenti`
-- ------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`tipo_pagamenti` (
  `idtipo_pagamento` INT NOT NULL AUTO_INCREMENT,
  `Descrizione` VARCHAR(100)  NOT NULL,
  `Circuito`VARCHAR(100), 
  PRIMARY KEY (`idtipo_pagamento`))
ENGINE = InnoDB; 

-- ------------------------------------------------------------
-- Table `cinema`.`pagamenti`
-- -----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`pagamenti` (
  `idpagamento` INT NOT NULL AUTO_INCREMENT,
  `idtipo_pagamento1` INT  NOT NULL,
  `idbiglietto1` INT NOT NULL,
  `importo` FLOAT NOT NULL, 
  PRIMARY KEY (`idpagamento`),
  INDEX `fk_cinema_idbiglietto1_idx` (`idbiglietto1` ASC),
  CONSTRAINT `fk_cinema_idbiglietto1`
    FOREIGN KEY (`idbiglietto1`)
    REFERENCES `cinema`.`biglietti` (`idbiglietto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    INDEX `fk_cinema_idtipo_pagamento1_idx` (`idtipo_pagamento1` ASC),
  CONSTRAINT `fk_cinema_idtipo_pagamento1`
    FOREIGN KEY (`idtipo_pagamento1`)
    REFERENCES `cinema`.`tipo_pagamenti` (`idtipo_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB; 

-- ------------------------------------------------------------
-- Table `cinema`.`prossimamente`
-- -----------------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinema`.`prossimamente` (
  `id_film` INT (6) NOT NULL AUTO_INCREMENT,
  `titolo_film` VARCHAR(100) NOT NULL,
  `regista_film` VARCHAR(100) NOT NULL,
  `genere_film` VARCHAR(100) ,
  `anno_uscita` VARCHAR(10) ,
  `descrizione` VARCHAR(300) ,
  `trailer` VARCHAR(100) ,
  `locandina` VARCHAR(100) ,
  PRIMARY KEY (`id_film`))
 ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
