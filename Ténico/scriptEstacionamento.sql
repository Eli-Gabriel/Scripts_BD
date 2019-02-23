-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema estacionamento
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema estacionamento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `estacionamento` DEFAULT CHARACTER SET utf8 ;
USE `estacionamento` ;

-- -----------------------------------------------------
-- Table `estacionamento`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estacionamento`.`carro` (
  `idCarro` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(10) NULL,
  `modelo` VARCHAR(20) NULL,
  PRIMARY KEY (`idCarro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estacionamento`.`vaga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estacionamento`.`vaga` (
  `idVaga` INT NOT NULL AUTO_INCREMENT,
  `numeroVaga` INT NULL,
  `status` TINYINT(1) NULL,
  PRIMARY KEY (`idVaga`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estacionamento`.`preco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estacionamento`.`preco` (
  `idpreco` INT NOT NULL AUTO_INCREMENT,
  `valor` DOUBLE NULL,
  `data` DATE NULL,
  `observacao` VARCHAR(100) NULL,
  PRIMARY KEY (`idpreco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estacionamento`.`carroEstacionado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estacionamento`.`carroEstacionado` (
  `idCarroEstacionado` INT NOT NULL AUTO_INCREMENT,
  `dataEntrada` DATETIME NULL,
  `dataSaida` DATETIME NULL,
  `idCarro` INT NOT NULL,
  `idVaga` INT NOT NULL,
  `idpreco` INT NOT NULL,
  PRIMARY KEY (`idCarroEstacionado`),
  INDEX `fk_carroEstacionado_carro_idx` (`idCarro` ASC),
  INDEX `fk_carroEstacionado_vaga1_idx` (`idVaga` ASC),
  INDEX `fk_carroEstacionado_preco1_idx` (`idpreco` ASC),
  CONSTRAINT `fk_carroEstacionado_carro`
    FOREIGN KEY (`idCarro`)
    REFERENCES `estacionamento`.`carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carroEstacionado_vaga1`
    FOREIGN KEY (`idVaga`)
    REFERENCES `estacionamento`.`vaga` (`idVaga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carroEstacionado_preco1`
    FOREIGN KEY (`idpreco`)
    REFERENCES `estacionamento`.`preco` (`idpreco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
