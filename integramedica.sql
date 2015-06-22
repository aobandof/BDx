-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema beraudent
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema beraudent
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `beraudent` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `beraudent` ;

-- -----------------------------------------------------
-- Table `beraudent`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Cliente` (
  `id_clie` INT NOT NULL AUTO_INCREMENT,
  `nomb_clie` VARCHAR(25) NOT NULL,
  `razo_clie` VARCHAR(45) NULL,
  `rut_clie` VARCHAR(10) NULL,
  PRIMARY KEY (`id_clie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Arancel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Arancel` (
  `id_aran` INT NOT NULL AUTO_INCREMENT,
  `nomb_aran` VARCHAR(20) NULL,
  `deta_aran` VARCHAR(45) NULL COMMENT 'deta_aran informará como se construyó el arancel (si deriba de algun porcentaje sobre algun arancel base o es un arancel con precios especiales)',
  PRIMARY KEY (`id_aran`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Ubicacion` (
  `id_ubic` INT NOT NULL AUTO_INCREMENT,
  `dire_ubic` VARCHAR(30) NOT NULL,
  `tipo_dire` CHAR(2) NULL,
  `num_ubic` MEDIUMINT(3) NOT NULL,
  `depa_ubic` VARCHAR(5) NULL,
  `comu_ubic` VARCHAR(15) NULL,
  `regi_ubic` VARCHAR(45) NULL,
  `tel1_ubic` VARCHAR(45) NULL,
  `tel2_ubic` VARCHAR(45) NULL,
  PRIMARY KEY (`id_ubic`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Datos_Facturacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Datos_Facturacion` (
  `id_dato_fact` INT NOT NULL AUTO_INCREMENT,
  `razo_dato_fact` VARCHAR(45) NULL,
  `fant_dato_fact` VARCHAR(45) NULL,
  `dire_dato_fact` VARCHAR(45) NULL,
  `rut_dato_fact` VARCHAR(45) NULL,
  `deta_dato_fact` VARCHAR(45) NULL,
  PRIMARY KEY (`id_dato_fact`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Sucursal` (
  `id_sucu` INT NOT NULL,
  `codi_sucu` VARCHAR(10) NULL,
  `abre_sucu` VARCHAR(10) NULL,
  `nomb_sucu` VARCHAR(25) NOT NULL,
  `alia_sucu` VARCHAR(45) NULL,
  `Arancel_id_aran` INT NOT NULL,
  `Ubicacion_id_ubic` INT NOT NULL,
  `Cliente_id_clie` INT NOT NULL,
  `Datos_Facturacion_id_dato_fact` INT NOT NULL,
  PRIMARY KEY (`id_sucu`),
  INDEX `fk_Sucursal_Arancel1_idx` (`Arancel_id_aran` ASC),
  INDEX `fk_Sucursal_Ubicacion1_idx` (`Ubicacion_id_ubic` ASC),
  INDEX `fk_Sucursal_Cliente1_idx` (`Cliente_id_clie` ASC),
  INDEX `fk_Sucursal_Datos_Facturacion1_idx` (`Datos_Facturacion_id_dato_fact` ASC),
  CONSTRAINT `fk_Sucursal_Arancel1`
    FOREIGN KEY (`Arancel_id_aran`)
    REFERENCES `beraudent`.`Arancel` (`id_aran`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_Ubicacion1`
    FOREIGN KEY (`Ubicacion_id_ubic`)
    REFERENCES `beraudent`.`Ubicacion` (`id_ubic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_Cliente1`
    FOREIGN KEY (`Cliente_id_clie`)
    REFERENCES `beraudent`.`Cliente` (`id_clie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_Datos_Facturacion1`
    FOREIGN KEY (`Datos_Facturacion_id_dato_fact`)
    REFERENCES `beraudent`.`Datos_Facturacion` (`id_dato_fact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Odontologo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Odontologo` (
  `id_odon` INT NOT NULL AUTO_INCREMENT,
  `apel_odon` VARCHAR(45) NULL,
  `nomb_odon` VARCHAR(45) NULL,
  `mail_odon` VARCHAR(25) NULL,
  `celu_odon` VARCHAR(10) NULL,
  PRIMARY KEY (`id_odon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Administrativo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Administrativo` (
  `id_admi` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomb_admi` VARCHAR(35) NULL,
  `apel_admi` VARCHAR(35) NULL,
  `mail_admi` VARCHAR(35) NULL,
  `celu_admi` VARCHAR(10) NULL,
  `carg_admi` VARCHAR(15) NULL,
  `tele_admi` VARCHAR(10) NULL,
  `Cliente_id_clie` INT NOT NULL,
  PRIMARY KEY (`id_admi`),
  INDEX `fk_Cliente_id_clie_idx` (`Cliente_id_clie` ASC),
  CONSTRAINT `fk_Cliente_id_clie`
    FOREIGN KEY (`Cliente_id_clie`)
    REFERENCES `beraudent`.`Cliente` (`id_clie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Tipo_Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Tipo_Trabajo` (
  `idTipo_trabajo` INT NOT NULL,
  PRIMARY KEY (`idTipo_trabajo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Complemento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Complemento` (
  `id_comp` INT NOT NULL AUTO_INCREMENT,
  `nomb_comp` VARCHAR(45) NOT NULL COMMENT 'sera el grupo que contenga a los trabajos que son complementos de otros, por ejemplo para coronas de implante hay que hacer modelos, cubetas indvidual o de implante, preparacion o colado de pilar, coronas atornilladas y cementadas (con sus respectivos sus procesos); todas ellas pueden ir en un grupo llamado \"CORONAS IMPLANTE\"',
  `deta_comp` VARCHAR(45) NULL,
  PRIMARY KEY (`id_comp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Trabajo` (
  `id_trab` INT NOT NULL,
  `Tipo_Trabajo_idTipo_trabajo` INT NOT NULL,
  `Trabajo_id_trab` INT NOT NULL,
  `Complemento_id_comp` INT NULL,
  `etap_trab` ENUM('U','P','I','M','F') NOT NULL COMMENT 'Atributo que determinara si un trabajo es unico(U), en procesos(P), y si el trabajo es un subproceso mostrara si es el proceso incial(I), medio(M) o final (F)',
  PRIMARY KEY (`id_trab`),
  INDEX `fk_Trabajo_Tipo_trabajo1_idx` (`Tipo_Trabajo_idTipo_trabajo` ASC),
  INDEX `fk_Trabajo_Trabajo1_idx` (`Trabajo_id_trab` ASC),
  INDEX `fk_Trabajo_Complemento1_idx` (`Complemento_id_comp` ASC),
  CONSTRAINT `fk_Trabajo_Tipo_trabajo1`
    FOREIGN KEY (`Tipo_Trabajo_idTipo_trabajo`)
    REFERENCES `beraudent`.`Tipo_Trabajo` (`idTipo_trabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajo_Trabajo1`
    FOREIGN KEY (`Trabajo_id_trab`)
    REFERENCES `beraudent`.`Trabajo` (`id_trab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajo_Complemento1`
    FOREIGN KEY (`Complemento_id_comp`)
    REFERENCES `beraudent`.`Complemento` (`id_comp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Arancel_has_Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Arancel_has_Trabajo` (
  `Arancel_id_aran` INT NOT NULL,
  `Trabajo_id_trab` INT NOT NULL,
  `prec_aran` INT NULL,
  PRIMARY KEY (`Arancel_id_aran`, `Trabajo_id_trab`),
  INDEX `fk_Arancel_has_Trabajo_Trabajo1_idx` (`Trabajo_id_trab` ASC),
  CONSTRAINT `fk_Arancel_has_Trabajo_Trabajo1`
    FOREIGN KEY (`Trabajo_id_trab`)
    REFERENCES `beraudent`.`Trabajo` (`id_trab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Personal` (
  `id_pers` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomb_pers` VARCHAR(35) NULL,
  `apel_pers` VARCHAR(35) NULL,
  `mail_pers` VARCHAR(35) NULL,
  `celu_pers` VARCHAR(10) NULL,
  `carg_pers` VARCHAR(15) NULL,
  `tele_pers` VARCHAR(45) NULL,
  `Sucursal_id_sucu` INT NOT NULL,
  PRIMARY KEY (`id_pers`, `Sucursal_id_sucu`),
  INDEX `fk_Personal_Sucursal1_idx` (`Sucursal_id_sucu` ASC),
  CONSTRAINT `fk_Personal_Sucursal1`
    FOREIGN KEY (`Sucursal_id_sucu`)
    REFERENCES `beraudent`.`Sucursal` (`id_sucu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Orden_Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Orden_Trabajo` (
  `num_orde_trab` INT NOT NULL,
  `ot_orde_trab` VARCHAR(10) NULL,
  `tick_orde_trab` VARCHAR(10) NULL,
  `fech_ingr` DATETIME NULL,
  `fech_entr` DATETIME NULL,
  `nota_orde_trab` TEXT(100) NULL,
  PRIMARY KEY (`num_orde_trab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Paciente` (
  `id_paciente` INT UNSIGNED NOT NULL,
  `rut_paciente` VARCHAR(10) NULL,
  `nomb_paciente` VARCHAR(45) NULL,
  `apel_paciente` VARCHAR(45) NULL,
  PRIMARY KEY (`id_paciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Sucursal_Odontologo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Sucursal_Odontologo` (
  `Sucursal_id_sucu` INT NOT NULL,
  `Odontologo_id_odon` INT NOT NULL,
  PRIMARY KEY (`Sucursal_id_sucu`, `Odontologo_id_odon`),
  INDEX `fk_Sucursal_has_Odontologo_Odontologo1_idx` (`Odontologo_id_odon` ASC),
  INDEX `fk_Sucursal_has_Odontologo_Sucursal1_idx` (`Sucursal_id_sucu` ASC),
  CONSTRAINT `fk_Sucursal_has_Odontologo_Sucursal1`
    FOREIGN KEY (`Sucursal_id_sucu`)
    REFERENCES `beraudent`.`Sucursal` (`id_sucu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_has_Odontologo_Odontologo1`
    FOREIGN KEY (`Odontologo_id_odon`)
    REFERENCES `beraudent`.`Odontologo` (`id_odon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Solicitud_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Solicitud_Pedido` (
  `nume_soli_pedi` VARCHAR(10) NOT NULL,
  `fech_soli_pedi` VARCHAR(45) NOT NULL,
  `Paciente_id_paciente` INT UNSIGNED NOT NULL,
  `Sucursal_Odontologo_Sucursal_id_sucu` INT NOT NULL,
  `Sucursal_Odontologo_Odontologo_id_odon` INT NOT NULL,
  PRIMARY KEY (`nume_soli_pedi`),
  INDEX `fk_Pedido_Paciente1_idx` (`Paciente_id_paciente` ASC),
  INDEX `fk_Solicitud_Pedido_Sucursal_Odontologo1_idx` (`Sucursal_Odontologo_Sucursal_id_sucu` ASC, `Sucursal_Odontologo_Odontologo_id_odon` ASC),
  CONSTRAINT `fk_Pedido_Paciente1`
    FOREIGN KEY (`Paciente_id_paciente`)
    REFERENCES `beraudent`.`Paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud_Pedido_Sucursal_Odontologo1`
    FOREIGN KEY (`Sucursal_Odontologo_Sucursal_id_sucu` , `Sucursal_Odontologo_Odontologo_id_odon`)
    REFERENCES `beraudent`.`Sucursal_Odontologo` (`Sucursal_id_sucu` , `Odontologo_id_odon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Arancel_Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Arancel_Trabajo` (
  `Trabajo_id_trab` INT NOT NULL,
  `Arancel_id_aran` INT NOT NULL,
  `codi_aran_trab` VARCHAR(10) NULL,
  `nome_aran_trab` VARCHAR(55) NULL COMMENT 'Nomenclatura del cliente',
  `prec_aran_trab` FLOAT NOT NULL,
  PRIMARY KEY (`Trabajo_id_trab`, `Arancel_id_aran`),
  INDEX `fk_Arancel_Trabajo_Arancel1_idx` (`Arancel_id_aran` ASC),
  CONSTRAINT `fk_Arancel_Trabajo_Trabajo1`
    FOREIGN KEY (`Trabajo_id_trab`)
    REFERENCES `beraudent`.`Trabajo` (`id_trab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Arancel_Trabajo_Arancel1`
    FOREIGN KEY (`Arancel_id_aran`)
    REFERENCES `beraudent`.`Arancel` (`id_aran`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Excepcion_Arancel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Excepcion_Arancel` (
  `prec_exce_aran` FLOAT NOT NULL COMMENT 'Si la sucursal del cliente usa un arancel base pero difiere solo en algunas prestaciones, entonces este sera el precio personalizado')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Comprobante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Comprobante` (
  `nume_comp` VARCHAR(10) NOT NULL,
  `tipo_comp` ENUM('F', 'B', 'FE', 'BE', 'NC', 'ND') NOT NULL,
  `deta_comp` VARCHAR(45) NULL,
  `fech_comp` VARCHAR(45) NULL,
  PRIMARY KEY (`nume_comp`, `tipo_comp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Orden_Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Orden_Compra` (
  `nume_orde_comp` VARCHAR(10) NOT NULL,
  `fecha_orde_comp` DATETIME NULL,
  `mont_orde_comp` FLOAT NULL,
  `deta_orde_comp` VARCHAR(45) NULL,
  `Comprobante_nume_comp` VARCHAR(10) NOT NULL,
  INDEX `fk_Orden_Compra_Comprobante1_idx` (`Comprobante_nume_comp` ASC),
  PRIMARY KEY (`nume_orde_comp`),
  CONSTRAINT `fk_Orden_Compra_Comprobante1`
    FOREIGN KEY (`Comprobante_nume_comp`)
    REFERENCES `beraudent`.`Comprobante` (`nume_comp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Prestacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Prestacion` (
  `Solicitud_Pedido_nume_soli_pedi` VARCHAR(10) NOT NULL,
  `posi_pres` TINYINT(1) UNSIGNED NOT NULL,
  `epis_pres` VARCHAR(10) NULL,
  `codi_pres` VARCHAR(6) NOT NULL,
  `desc_pres` VARCHAR(45) NULL,
  `cant_pres` TINYINT(1) UNSIGNED NULL,
  `fech_entr_pres` DATE NULL,
  `null_pres` ENUM('V', 'N') NULL DEFAULT 'V' COMMENT 'las posiciones pueden anularse con basurero, bomba  o valor total=0\nsiempre es bueno tener respald de que posicion esta nula',
  `deta_pres` VARCHAR(45) NULL,
  `Arancel_Trabajo_Trabajo_id_trab` INT NOT NULL,
  `Arancel_Trabajo_Arancel_id_aran` INT NOT NULL,
  `Orden_Compra_nume_orde_comp` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Solicitud_Pedido_nume_soli_pedi`, `posi_pres`),
  INDEX `fk_Prestacion_Orden_Pedido1_idx` (`Solicitud_Pedido_nume_soli_pedi` ASC),
  INDEX `fk_Prestacion_Arancel_Trabajo1_idx` (`Arancel_Trabajo_Trabajo_id_trab` ASC, `Arancel_Trabajo_Arancel_id_aran` ASC),
  INDEX `fk_Prestacion_Orden_Compra1_idx` (`Orden_Compra_nume_orde_comp` ASC),
  CONSTRAINT `fk_Prestacion_Orden_Pedido1`
    FOREIGN KEY (`Solicitud_Pedido_nume_soli_pedi`)
    REFERENCES `beraudent`.`Solicitud_Pedido` (`nume_soli_pedi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestacion_Arancel_Trabajo1`
    FOREIGN KEY (`Arancel_Trabajo_Trabajo_id_trab` , `Arancel_Trabajo_Arancel_id_aran`)
    REFERENCES `beraudent`.`Arancel_Trabajo` (`Trabajo_id_trab` , `Arancel_id_aran`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestacion_Orden_Compra1`
    FOREIGN KEY (`Orden_Compra_nume_orde_comp`)
    REFERENCES `beraudent`.`Orden_Compra` (`nume_orde_comp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Trabajo_Realizado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Trabajo_Realizado` (
  `id_trab_real` INT UNSIGNED NOT NULL,
  `piez_trab_real` VARCHAR(5) NULL,
  `deta_trab_real` VARCHAR(45) NULL,
  `Orden_Trabajo_num_orde_trab` INT NOT NULL,
  `colo_trab_real` VARCHAR(45) NULL,
  `Trabajo_id_trab` INT NOT NULL,
  `Prestacion_Solicitud_Pedido_nume_soli_pedi` VARCHAR(10) NOT NULL,
  `Prestacion_posi_pres` TINYINT(1) UNSIGNED NOT NULL,
  INDEX `fk_Trabajo_Pedido_Orden_Trabajo1_idx` (`Orden_Trabajo_num_orde_trab` ASC),
  PRIMARY KEY (`id_trab_real`),
  INDEX `fk_Trabajo_Realizado_Trabajo1_idx` (`Trabajo_id_trab` ASC),
  INDEX `fk_Trabajo_Realizado_Prestacion1_idx` (`Prestacion_Solicitud_Pedido_nume_soli_pedi` ASC, `Prestacion_posi_pres` ASC),
  CONSTRAINT `fk_Trabajo_Pedido_Orden_Trabajo1`
    FOREIGN KEY (`Orden_Trabajo_num_orde_trab`)
    REFERENCES `beraudent`.`Orden_Trabajo` (`num_orde_trab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajo_Realizado_Trabajo1`
    FOREIGN KEY (`Trabajo_id_trab`)
    REFERENCES `beraudent`.`Trabajo` (`id_trab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajo_Realizado_Prestacion1`
    FOREIGN KEY (`Prestacion_Solicitud_Pedido_nume_soli_pedi` , `Prestacion_posi_pres`)
    REFERENCES `beraudent`.`Prestacion` (`Solicitud_Pedido_nume_soli_pedi` , `posi_pres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Abono_Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Abono_Cargo` (
  `id_abon_carg` INT NOT NULL,
  `deta_abon_carg` VARCHAR(45) NULL,
  `Trabajo_Pedido_Arancel_Trabajo_Trabajo_id_trab` INT NOT NULL,
  `Trabajo_Pedido_Arancel_Trabajo_Arancel_id_aran` INT NOT NULL,
  `Orden_Compra_id_orde_comp` INT UNSIGNED NOT NULL,
  `mont_abon_carg` INT NULL,
  PRIMARY KEY (`id_abon_carg`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Pago` (
  `id_pago` INT NOT NULL,
  `nume_reci_pago` VARCHAR(8) NULL,
  `fech_reci_pago` DATETIME NULL,
  `deta_pago` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Trabajo_Realizado_has_Abono_Cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Trabajo_Realizado_has_Abono_Cargo` (
  `Trabajo_Realizado_id_trab_real` INT UNSIGNED NOT NULL,
  `Abono_Cargo_id_abon_carg` INT NOT NULL,
  PRIMARY KEY (`Trabajo_Realizado_id_trab_real`, `Abono_Cargo_id_abon_carg`),
  INDEX `fk_Trabajo_Realizado_has_Abono_Cargo_Abono_Cargo1_idx` (`Abono_Cargo_id_abon_carg` ASC),
  INDEX `fk_Trabajo_Realizado_has_Abono_Cargo_Trabajo_Realizado1_idx` (`Trabajo_Realizado_id_trab_real` ASC),
  CONSTRAINT `fk_Trabajo_Realizado_has_Abono_Cargo_Trabajo_Realizado1`
    FOREIGN KEY (`Trabajo_Realizado_id_trab_real`)
    REFERENCES `beraudent`.`Trabajo_Realizado` (`id_trab_real`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabajo_Realizado_has_Abono_Cargo_Abono_Cargo1`
    FOREIGN KEY (`Abono_Cargo_id_abon_carg`)
    REFERENCES `beraudent`.`Abono_Cargo` (`id_abon_carg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Usuario` (
  `id_usua` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `apel_usua` VARCHAR(45) NULL,
  `nomb_usua` VARCHAR(45) NULL,
  `nick_usua` VARCHAR(45) NULL,
  `pass_usua` VARCHAR(45) NULL,
  `priv_usua` ENUM('A', 'L', 'E') NULL,
  PRIMARY KEY (`id_usua`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beraudent`.`Pago_Comprobante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beraudent`.`Pago_Comprobante` (
  `id_pago_comp` INT NOT NULL AUTO_INCREMENT,
  `tipo_pago_comp` ENUM('EF', 'CH', 'DE', 'TF', 'TB', 'WP', 'PP') NOT NULL DEFAULT 'CH',
  `nume_pago_comp` VARCHAR(15) NULL,
  `fecha_pago_comp` DATETIME NULL,
  `fecha_venci_pago_comp` VARCHAR(45) NULL,
  `banc_pago_comp` VARCHAR(45) NULL,
  `Comprobante_nume_comp` VARCHAR(10) NOT NULL,
  `Comprobante_tipo_comp` ENUM('F', 'B', 'FE', 'BE', 'NC', 'ND') NOT NULL,
  `Pago_id_pago` INT NOT NULL,
  PRIMARY KEY (`id_pago_comp`),
  INDEX `fk_Pago_Comprobante_Comprobante1_idx` (`Comprobante_nume_comp` ASC, `Comprobante_tipo_comp` ASC),
  INDEX `fk_Pago_Comprobante_Pago1_idx` (`Pago_id_pago` ASC),
  CONSTRAINT `fk_Pago_Comprobante_Comprobante1`
    FOREIGN KEY (`Comprobante_nume_comp` , `Comprobante_tipo_comp`)
    REFERENCES `beraudent`.`Comprobante` (`nume_comp` , `tipo_comp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pago_Comprobante_Pago1`
    FOREIGN KEY (`Pago_id_pago`)
    REFERENCES `beraudent`.`Pago` (`id_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `beraudent`.`Usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `beraudent`;
INSERT INTO `beraudent`.`Usuario` (`id_usua`, `apel_usua`, `nomb_usua`, `nick_usua`, `pass_usua`, `priv_usua`) VALUES (DEFAULT, 'OBANDO FLORIAN', 'ABEL RAFAEL', 'ofaber', '123456', 'A');
INSERT INTO `beraudent`.`Usuario` (`id_usua`, `apel_usua`, `nomb_usua`, `nick_usua`, `pass_usua`, `priv_usua`) VALUES (DEFAULT, 'QUIROZ ANDRADE', 'CARMEN DEL PILAR', 'cpilar', '123456', 'L');

COMMIT;

