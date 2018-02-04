-- FINAL PROJECT
-- TEAM MAKESMART, MACO DOUSSIAS, JAKE MCGHEE, PAVLOS PAPADONIKOLAKIS
-- DESCRIPTION:  SQL STATEMETS TO CREATE THE SCHEMA TO KEEP TRACK OF ANIMALS FOR A ZOO
-- CST363 
--
--
--
-- MySQL Script generated by MySQL Workbench
-- Thu Feb  1 12:58:53 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema 
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema om
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema zoo
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `zoo` ;

-- -----------------------------------------------------
-- Schema zoo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zoo` DEFAULT CHARACTER SET latin1 ;
USE `zoo` ;

-- -----------------------------------------------------
-- Table `zoo`.`animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `zoo`.`animal` ;

CREATE TABLE IF NOT EXISTS `zoo`.`animal` (
  `animal_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `animal_name` VARCHAR(45) NOT NULL,
  `animal_class` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `sex` VARCHAR(6) NULL DEFAULT NULL,
  `endangered` TINYINT(4) NULL DEFAULT '0',
  PRIMARY KEY (`animal_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1002
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zoo`.`animal_diet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `zoo`.`animal_diet` ;

CREATE TABLE IF NOT EXISTS `zoo`.`animal_diet` (
  `diet_id` INT(11) NOT NULL AUTO_INCREMENT,
  `diet_type` VARCHAR(45) NULL DEFAULT NULL,
  `animal_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`diet_id`, `animal_id`),
  INDEX `fk_animal_diet_animal1_idx` (`animal_id` ASC),
  CONSTRAINT `fk_animal_diet_animal1`
    FOREIGN KEY (`animal_id`)
    REFERENCES `zoo`.`animal` (`animal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4002
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zoo`.`exhibit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `zoo`.`exhibit` ;

CREATE TABLE IF NOT EXISTS `zoo`.`exhibit` (
  `exhibit_id` INT(11) NOT NULL AUTO_INCREMENT,
  `exhibit_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`exhibit_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6002
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `zoo`.`habitat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `zoo`.`habitat` ;

CREATE TABLE IF NOT EXISTS `zoo`.`habitat` (
  `habitat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `habitat_name` VARCHAR(45) NULL DEFAULT NULL,
  `habitat_climate` VARCHAR(45) NOT NULL,
  `avg_temp` INT(3) NOT NULL,
  `animal_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`habitat_id`, `animal_id`),
  INDEX `fk_habitat_animal1_idx` (`animal_id` ASC),
  CONSTRAINT `fk_habitat_animal1`
    FOREIGN KEY (`animal_id`)
    REFERENCES `zoo`.`animal` (`animal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3002
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zoo`.`species`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `zoo`.`species` ;

CREATE TABLE IF NOT EXISTS `zoo`.`species` (
  `species_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sience_name` VARCHAR(45) NOT NULL,
  `animal_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`species_id`, `animal_id`),
  INDEX `fk_species_animal1_idx` (`animal_id` ASC),
  CONSTRAINT `fk_species_animal1`
    FOREIGN KEY (`animal_id`)
    REFERENCES `zoo`.`animal` (`animal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2002
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zoo`.`species_live`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `zoo`.`species_live` ;

CREATE TABLE IF NOT EXISTS `zoo`.`species_live` (
  `species_id` INT(11) NOT NULL,
  `exhibit_id` INT(11) NOT NULL,
  PRIMARY KEY (`species_id`, `exhibit_id`),
  INDEX `fk_species_has_exhibit_exhibit1_idx` (`exhibit_id` ASC),
  INDEX `fk_species_has_exhibit_species1_idx` (`species_id` ASC),
  CONSTRAINT `fk_species_has_exhibit_exhibit1`
    FOREIGN KEY (`exhibit_id`)
    REFERENCES `zoo`.`exhibit` (`exhibit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_species_has_exhibit_species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `zoo`.`species` (`species_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
