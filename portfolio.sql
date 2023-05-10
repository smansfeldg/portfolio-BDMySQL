-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8 ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `ciudad` VARCHAR(45) NULL,
  `profesion` VARCHAR(45) NULL,
  `about` VARCHAR(200) NULL,
  `url_foto` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`tipo_skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`tipo_skill` (
  `idtipo_skill` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipo_skill`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`skills` (
  `idskills` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `icon` VARCHAR(30) NULL,
  `procentaje` INT NULL,
  `persona_id` INT NOT NULL,
  `tipo_skill_idtipo_skill` INT NOT NULL,
  PRIMARY KEY (`idskills`),
  INDEX `fk_skills_persona1_idx` (`persona_id` ASC) VISIBLE,
  INDEX `fk_skills_tipo_skill1_idx` (`tipo_skill_idtipo_skill` ASC) VISIBLE,
  CONSTRAINT `fk_skills_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_skills_tipo_skill1`
    FOREIGN KEY (`tipo_skill_idtipo_skill`)
    REFERENCES `portfolio`.`tipo_skill` (`idtipo_skill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(20) NULL,
  `password` VARCHAR(20) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_persona_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`tipo_empleo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`tipo_empleo` (
  `idtipo_empleo` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipo_empleo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`experiencia` (
  `idesperiencia` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(45) NULL,
  `puesto` VARCHAR(45) NULL,
  `fechaInicio` DATE NULL,
  `fechaFin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `url_img_refe` VARCHAR(100) NULL,
  `enlace_refe` VARCHAR(100) NULL,
  `esActual` TINYINT NULL,
  `persona_id` INT NOT NULL,
  `tipo_empleo_idtipo_empleo` INT NOT NULL,
  PRIMARY KEY (`idesperiencia`),
  INDEX `fk_experiencia_persona1_idx` (`persona_id` ASC) VISIBLE,
  INDEX `fk_experiencia_tipo_empleo1_idx` (`tipo_empleo_idtipo_empleo` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_tipo_empleo1`
    FOREIGN KEY (`tipo_empleo_idtipo_empleo`)
    REFERENCES `portfolio`.`tipo_empleo` (`idtipo_empleo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`proyectos` (
  `idproyectos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(200) NULL,
  `url_refe` VARCHAR(100) NULL,
  `url_img` VARCHAR(100) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`idproyectos`),
  INDEX `fk_proyectos_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`educacion` (
  `ideducacion` INT NOT NULL AUTO_INCREMENT,
  `institucion` VARCHAR(50) NULL,
  `titulo` VARCHAR(50) NULL,
  `inicio` DATE NULL,
  `fin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`ideducacion`),
  INDEX `fk_educacion_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
