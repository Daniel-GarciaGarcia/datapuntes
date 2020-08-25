-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema miparking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema miparking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `miparking` DEFAULT CHARACTER SET utf8 ;
USE `miparking` ;

-- -----------------------------------------------------
-- Table `miparking`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miparking`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  `vehiculoAutorizado` INT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_vehiculo1_idx` (`vehiculoAutorizado` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_vehiculo1`
    FOREIGN KEY (`vehiculoAutorizado`)
    REFERENCES `miparking`.`vehiculo` (`idvehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miparking`.`vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miparking`.`vehiculo` (
  `idvehiculo` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `cv` INT NOT NULL,
  `matricula` VARCHAR(45) NOT NULL,
  `propietario` INT NOT NULL,
  PRIMARY KEY (`idvehiculo`),
  INDEX `fk_vehiculo_usuario1_idx` (`propietario` ASC) VISIBLE,
  CONSTRAINT `fk_vehiculo_usuario1`
    FOREIGN KEY (`propietario`)
    REFERENCES `miparking`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miparking`.`registro_puerta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miparking`.`registro_puerta` (
  `idregistro_puerta` INT NOT NULL,
  `tipo` TINYINT(1) NOT NULL COMMENT '0=Entrada\n1=Saida',
  `diahora` DATETIME NOT NULL,
  `vehiculo` INT NOT NULL,
  PRIMARY KEY (`idregistro_puerta`, `vehiculo`),
  INDEX `fk_registro_puerta_vehiculo_idx` (`vehiculo` ASC) VISIBLE,
  CONSTRAINT `fk_registro_puerta_vehiculo`
    FOREIGN KEY (`vehiculo`)
    REFERENCES `miparking`.`vehiculo` (`idvehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `sexo`, `dni`) VALUES ('2', 'Pepe', 'Garcia', 'M', '12341234F');
INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `sexo`, `dni`) VALUES ('3', 'Luis', 'Lopez', 'M', '12341234F');
INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `sexo`, `dni`) VALUES ('4', 'Felipo', 'Lorenzo', 'M', '12341234F');
INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `sexo`, `dni`) VALUES ('5', 'Ana', 'Lorenzo', 'F', '12341234F');
INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `sexo`, `dni`) VALUES ('6', 'Martta', 'Lopez', 'F', '12341234F');

INSERT INTO `vehiculo` (`marca`, `modelo`, `color`, `cv`, `matricula`, `propietario`) VALUES ('Audi', 'A4', 'negro', '150', '1234ABC', '2');
INSERT INTO `vehiculo` (`marca`, `modelo`, `color`, `cv`, `matricula`, `propietario`) VALUES ('Audi', 'A4', 'blanco', '150', '1234ABC', '2');
INSERT INTO `vehiculo` (`marca`, `modelo`, `color`, `cv`, `matricula`, `propietario`) VALUES ('Mercedes', 'CLA', 'gris', '150', '1234ABC', '3');
INSERT INTO `vehiculo` (`marca`, `modelo`, `color`, `cv`, `matricula`, `propietario`) VALUES ('Renaul', 'Twingo', 'naranja', '150', '1234ABC', '4');
