-- MySQL Workbench Synchronization
-- Generated: 2014-12-09 14:59
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: NOLFA

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `beraudent`.`Orden_Pago` 
DROP COLUMN `Trabajo_Pedido_Pedido_num_pedido`,
DROP COLUMN `Trabajo_Pedido_id_pedi_trab`,
DROP INDEX `fk_Orden_Pago_Trabajo_Pedido2_idx` ,
DROP INDEX `fk_Orden_Pago_Trabajo_Pedido1_idx` ;

ALTER TABLE `beraudent`.`Abono_Cargo` 
DROP COLUMN `Orden_Facturacion_id_orde_fact`,
ADD COLUMN `Trabajo_Pedido_id_pedi_trab` VARCHAR(45) NOT NULL AFTER `Trabajo_Pedido_Arancel_Trabajo_Arancel_id_aran`,
ADD COLUMN `Orden_Pago_id_orde_pago` INT(11) NOT NULL AFTER `Trabajo_Pedido_Pedido_num_pedido`,
ADD INDEX `fk_Abono_Cargo_Trabajo_Pedido1_idx` (`Trabajo_Pedido_id_pedi_trab` ASC, `Trabajo_Pedido_Pedido_num_pedido` ASC),
ADD INDEX `fk_Abono_Cargo_Orden_Pago1_idx` (`Orden_Pago_id_orde_pago` ASC),
DROP INDEX `fk_Abono_Cargo_Orden_Facturacion1_idx` ,
DROP INDEX `fk_Abono_Cargo_Trabajo_Pedido1_idx` ;

ALTER TABLE `beraudent`.`Trabajo_Pedido_has_Orden_Trabajo` 
DROP COLUMN `Trabajo_Pedido_Arancel_Trabajo_Arancel_id_aran`,
DROP COLUMN `Trabajo_Pedido_Arancel_Trabajo_Trabajo_id_trab`,
ADD COLUMN `Trabajo_Pedido_id_pedi_trab` VARCHAR(45) NOT NULL FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`Trabajo_Pedido_id_pedi_trab`, `Trabajo_Pedido_Pedido_num_pedido`, `Orden_Trabajo_num_orde_trab`),
ADD INDEX `fk_Trabajo_Pedido_has_Orden_Trabajo_Orden_Trabajo1_idx` (`Orden_Trabajo_num_orde_trab` ASC),
ADD INDEX `fk_Trabajo_Pedido_has_Orden_Trabajo_Trabajo_Pedido1_idx` (`Trabajo_Pedido_id_pedi_trab` ASC, `Trabajo_Pedido_Pedido_num_pedido` ASC),
DROP INDEX `fk_Trabajo_Pedido_has_Orden_Trabajo_Trabajo_Pedido1_idx` ,
DROP INDEX `fk_Trabajo_Pedido_has_Orden_Trabajo_Orden_Trabajo1_idx` ;

ALTER TABLE `beraudent`.`Abono_Cargo` 
ADD CONSTRAINT `fk_Abono_Cargo_Trabajo_Pedido1`
  FOREIGN KEY (`Trabajo_Pedido_id_pedi_trab` , `Trabajo_Pedido_Pedido_num_pedido`)
  REFERENCES `beraudent`.`Trabajo_Pedido` (`id_pedi_trab` , `Pedido_num_pedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Abono_Cargo_Orden_Pago1`
  FOREIGN KEY (`Orden_Pago_id_orde_pago`)
  REFERENCES `beraudent`.`Orden_Pago` (`id_orde_pago`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `beraudent`.`Trabajo_Pedido_has_Orden_Trabajo` 
ADD CONSTRAINT `fk_Trabajo_Pedido_has_Orden_Trabajo_Trabajo_Pedido1`
  FOREIGN KEY (`Trabajo_Pedido_id_pedi_trab` , `Trabajo_Pedido_Pedido_num_pedido`)
  REFERENCES `beraudent`.`Trabajo_Pedido` (`id_pedi_trab` , `Pedido_num_pedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
