-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema vente
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vente
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vente` ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));

USE `vente` ;

-- -----------------------------------------------------
-- Table `vente`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vente`.`Client` (
  `ClientId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(50) NOT NULL,
  `Prenom` VARCHAR(50) NOT NULL,
  `Valide` TINYINT NOT NULL,
  PRIMARY KEY (`ClientId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vente`.`Commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vente`.`Commande` (
  `CommandeId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `DateCommande` DATE NOT NULL,
  `Statusl` CHAR(1) NULL,
  `ClientId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`CommandeId`),
  INDEX `ClientId_idx` (`ClientId` ASC) VISIBLE,
  CONSTRAINT `ClientId`
    FOREIGN KEY (`ClientId`)
    REFERENCES `vente`.`Client` (`ClientId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vente`.`Facture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vente`.`Facture` (
  `NoFacture` INT UNSIGNED NOT NULL,
  `DateFacture` DATE NOT NULL,
  `DateCommande` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`NoFacture`),
  INDEX `DateCommande_idx` (`DateCommande` ASC) VISIBLE,
  CONSTRAINT `DateCommande`
    FOREIGN KEY (`DateCommande`)
    REFERENCES `vente`.`Commande` (`CommandeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vente`.`Produit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vente`.`Produit` (
  `ProduitId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL,
  `PrixUnitaire` VARCHAR(45) NULL,
  PRIMARY KEY (`ProduitId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vente`.`Produit_has_Commande`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vente`.`Produit_has_Commande` (
  `Produit_ProduitId` INT UNSIGNED NOT NULL,
  `Commande_CommandeId` INT UNSIGNED NOT NULL,
  `DateCommande` INT NOT NULL,
  PRIMARY KEY (`Produit_ProduitId`, `Commande_CommandeId`),
  INDEX `fk_Produit_has_Commande_Commande1_idx` (`Commande_CommandeId` ASC) VISIBLE,
  INDEX `fk_Produit_has_Commande_Produit1_idx` (`Produit_ProduitId` ASC) VISIBLE,
  CONSTRAINT `fk_Produit_has_Commande_Produit1`
    FOREIGN KEY (`Produit_ProduitId`)
    REFERENCES `vente`.`Produit` (`ProduitId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produit_has_Commande_Commande1`
    FOREIGN KEY (`Commande_CommandeId`)
    REFERENCES `vente`.`Commande` (`CommandeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
