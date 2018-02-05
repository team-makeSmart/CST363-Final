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
-- -----------------------------------------------------
-- Schema zoo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zoo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zoo` DEFAULT CHARACTER SET latin1 ;
USE `zoo` ;

-- -----------------------------------------------------
-- Table `zoo`.`habitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`habitat` (
  `habitat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `habitat_name` VARCHAR(45) NULL DEFAULT NULL,
  `habitat_climate` VARCHAR(45) NOT NULL,
  `avg_temp` INT(3) NOT NULL,
  PRIMARY KEY (`habitat_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3002
DEFAULT CHARACTER SET = utf8;

USE `zoo` ;

-- -----------------------------------------------------
-- Table `zoo`.`exhibit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`exhibit` (
  `exhibit_id` INT(11) NOT NULL AUTO_INCREMENT,
  `exhibit_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`exhibit_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6002
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `zoo`.`consumption_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`consumption_class` (
  `consumption_class_id` INT(11) NOT NULL AUTO_INCREMENT,
  `consumption_class_name` VARCHAR(45) NOT NULL,
  `short_description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`consumption_class_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4002
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zoo`.`species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`species` (
  `species_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sience_name` VARCHAR(64) NOT NULL,
  `consumption_class_id` INT(11) NOT NULL,
  `endangered` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`species_id`),
  INDEX `fk_species_consumption_classificaiton1_idx` (`consumption_class_id` ASC),
  CONSTRAINT `fk_species_consumption_classificaiton1`
    FOREIGN KEY (`consumption_class_id`)
    REFERENCES `zoo`.`consumption_class` (`consumption_class_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2002
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zoo`.`animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`animal` (
  `animal_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `animal_name` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `sex` VARCHAR(1) NULL DEFAULT NULL,
  `exhibit_id` INT(11) NULL,
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
-- Table `zoo`.`habitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`habitat` (
  `habitat_id` INT(11) NOT NULL AUTO_INCREMENT,
  `habitat_name` VARCHAR(45) NULL DEFAULT NULL,
  `habitat_climate` VARCHAR(45) NOT NULL,
  `avg_temp` INT(3) NOT NULL,
  PRIMARY KEY (`habitat_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3002
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zoo`.`species_live`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`species_live` (
  `species_id` INT(11) NOT NULL,
  PRIMARY KEY (`species_id`),
  INDEX `fk_species_has_exhibit_species1_idx` (`species_id` ASC),
  CONSTRAINT `fk_species_has_exhibit_species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `zoo`.`species` (`species_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `zoo`.`species_has_habitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo`.`species_has_habitat` (
  `species_id` INT(11) NOT NULL,
  `habitat_id` INT NOT NULL,
  PRIMARY KEY (`species_id`, `habitat_id`),
  INDEX `fk_species_has_habitat_habitat1_idx` (`habitat_id` ASC),
  INDEX `fk_species_has_habitat_species1_idx` (`species_id` ASC),
  CONSTRAINT `fk_species_has_habitat_species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `zoo`.`species` (`species_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_species_has_habitat_habitat1`
    FOREIGN KEY (`habitat_id`)
    REFERENCES `zoo`.`habitat` (`habitat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
