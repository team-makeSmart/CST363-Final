-- FINAL PROJECT
-- TEAM MAKESMART, MACO DOUSSIAS, JAKE MCGHEE, PAVLOS PAPADONIKOLAKIS
-- DESCRIPTION:  SQL SCHEMA & TABLE CREATION FOR A ZOO TO KEEP TRACK OF ANIMALS
-- CST363 
--
--
--

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema zoo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zoo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zoo` DEFAULT CHARACTER SET latin1 ;
USE `zoo` ;

-- -----------------------------------------------------
-- Table `zoo`.`exhibit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`exhibit` (
  `exhibit_id` INT NOT NULL AUTO_INCREMENT,
  `exhibit_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`exhibit_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `zoo`.`species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`species` (
  `species_id` INT NOT NULL AUTO_INCREMENT,
  `common_name` VARCHAR(64) NOT NULL,
  `science_name` VARCHAR(64) NOT NULL,
  `endangered` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`species_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zoo`.`animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`animal` (
  `animal_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `animal_name` VARCHAR(45) NULL DEFAULT NULL,
  `dob` DATE NULL,
  `sex` VARCHAR(1) NULL DEFAULT NULL,
  `exhibit_id` INT(11) NOT NULL,
  `species_id` INT(11) NOT NULL,
  PRIMARY KEY (`animal_id`),
  INDEX `fk_animal_exhibit1_idx` (`exhibit_id` ASC),
  INDEX `fk_animal_species1_idx` (`species_id` ASC),
  CONSTRAINT `fk_animal_exhibit1`
    FOREIGN KEY (`exhibit_id`)
    REFERENCES `zoo`.`exhibit` (`exhibit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_animal_species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `zoo`.`species` (`species_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1002
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zoo`.`natural_habitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`natural_habitat` (
  `natural_habitat_id` INT NOT NULL AUTO_INCREMENT,
  `habitat_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`natural_habitat_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo`.`species_has_natural_habitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`species_has_natural_habitat` (
  `species_id` INT NOT NULL,
  `natural_habitat_id` INT NOT NULL,
  PRIMARY KEY (`species_id`, `natural_habitat_id`),
  INDEX `fk_species_has_natural_habitat_natural_habitat1_idx` (`natural_habitat_id` ASC),
  INDEX `fk_species_has_natural_habitat_species1_idx` (`species_id` ASC),
  CONSTRAINT `fk_species_has_natural_habitat_species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `zoo`.`species` (`species_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_species_has_natural_habitat_natural_habitat1`
    FOREIGN KEY (`natural_habitat_id`)
    REFERENCES `zoo`.`natural_habitat` (`natural_habitat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
