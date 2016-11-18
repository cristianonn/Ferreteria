-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ferreterias
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ferreterias
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ferreterias` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema ferreterias
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ferreterias
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ferreterias` DEFAULT CHARACTER SET utf8 ;
USE `ferreterias` ;

-- -----------------------------------------------------
-- Table `ferreterias`.`Ferreteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Ferreteria` (
  `idFerreteria` VARCHAR(45) NOT NULL,
  `nombreFerreteria` VARCHAR(45) NULL,
  `telefonoFerreteria` VARCHAR(45) NULL,
  `Ferreteriacol` VARCHAR(45) NULL,
  `ubicacion` POLYGON NULL,
  PRIMARY KEY (`idFerreteria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Departamento` (
  `idDepartamento` VARCHAR(45) NOT NULL,
  `nombreDepartamento` VARCHAR(45) NULL,
  `Ferreteria_idFerreteria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_Departamento_Ferreteria_idx` (`Ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_Departamento_Ferreteria`
    FOREIGN KEY (`Ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`Ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`Pasillo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Pasillo` (
  `idPasillo` INT NOT NULL AUTO_INCREMENT,
  `nombrePasillo` VARCHAR(45) NULL,
  `Departamento_idDepartamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPasillo`),
  INDEX `fk_Pasillo_Departamento1_idx` (`Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_Pasillo_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `ferreterias`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`Estante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Estante` (
  `idEstante` INT NOT NULL AUTO_INCREMENT,
  `numeroEstante` VARCHAR(45) NULL,
  `Pasillo_idPasillo` INT NOT NULL,
  PRIMARY KEY (`idEstante`),
  INDEX `fk_Estante_Pasillo1_idx` (`Pasillo_idPasillo` ASC),
  CONSTRAINT `fk_Estante_Pasillo1`
    FOREIGN KEY (`Pasillo_idPasillo`)
    REFERENCES `ferreterias`.`Pasillo` (`idPasillo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Producto` (
  `idProducto` VARCHAR(20) NOT NULL,
  `nombreProducto` VARCHAR(40) NULL,
  `precioProducto` FLOAT NULL,
  `fotoProducto` MEDIUMBLOB NULL,
  `descripcionProducto` VARCHAR(100) NULL,
  `marcaProducto` VARCHAR(25) NULL,
  `aspectosTecnicosProducto` VARCHAR(100) NULL,
  `utilidadProducto` VARCHAR(100) NULL,
  `garantia` INT NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`ProductoPorEstante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`ProductoPorEstante` (
  `idProductoPorEstante` INT NOT NULL AUTO_INCREMENT,
  `posicionProducto` INT NULL,
  `Estante_idEstante` INT NOT NULL,
  `Producto_idProducto` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idProductoPorEstante`),
  INDEX `fk_ProductoPorEstante_Estante1_idx` (`Estante_idEstante` ASC),
  INDEX `fk_ProductoPorEstante_Producto1_idx` (`Producto_idProducto` ASC),
  CONSTRAINT `fk_ProductoPorEstante_Estante1`
    FOREIGN KEY (`Estante_idEstante`)
    REFERENCES `ferreterias`.`Estante` (`idEstante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorEstante_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `ferreterias`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Empleado` (
  `idEmpleado` VARCHAR(15) NOT NULL,
  `nombreEmpleado` VARCHAR(45) NULL,
  `apellidosEmpleado` VARCHAR(45) NULL,
  `telEmpleado` VARCHAR(15) NULL,
  `tipoEmpleado` VARCHAR(25) NULL,
  `fechaEntrada` DATE NULL,
  `Empleadocol` VARCHAR(45) NULL,
  `vacacionesEmpleado` INT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`EmpleadoPorFerreteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`EmpleadoPorFerreteria` (
  `idEmpleadoPorFerreteria` INT NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  `Ferreteria_idFerreteria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleadoPorFerreteria`),
  INDEX `fk_EmpleadoPorFerreteria_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  INDEX `fk_EmpleadoPorFerreteria_Ferreteria1_idx` (`Ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_EmpleadoPorFerreteria_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EmpleadoPorFerreteria_Ferreteria1`
    FOREIGN KEY (`Ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`Ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`ExpertoPorDepartamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`ExpertoPorDepartamento` (
  `idExpertoPorDepartamento` INT NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  `Departamento_idDepartamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idExpertoPorDepartamento`),
  INDEX `fk_ExpertoPorDepartamento_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  INDEX `fk_ExpertoPorDepartamento_Departamento1_idx` (`Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_ExpertoPorDepartamento_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExpertoPorDepartamento_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `ferreterias`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `ferreterias`.`Amonestacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Amonestacion` (
  `idAmonestacion` INT NOT NULL AUTO_INCREMENT,
  `motivoAmonestacion` VARCHAR(45) NULL,
  `fecha` DATE NULL,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idAmonestacion`),
  INDEX `fk_Amonestacion_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  CONSTRAINT `fk_Amonestacion_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Cliente` (
  `idCliente` VARCHAR(25) NOT NULL,
  `nombreCliente` VARCHAR(25) NULL,
  `apellidosCliente` VARCHAR(45) NULL,
  `telCliente` VARCHAR(15) NULL,
  `correoCliente` VARCHAR(45) NULL,
  `usuarioCliente` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`carrito` (
  `idcarrito` INT NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idcarrito`),
  INDEX `fk_carrito_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_carrito_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ferreterias`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`ProductoPorCarrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`ProductoPorCarrito` (
  `idProductoPorCarrito` INT NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` VARCHAR(20) NOT NULL,
  `carrito_idcarrito` INT NOT NULL,
  PRIMARY KEY (`idProductoPorCarrito`),
  INDEX `fk_ProductoPorCarrito_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_ProductoPorCarrito_carrito1_idx` (`carrito_idcarrito` ASC),
  CONSTRAINT `fk_ProductoPorCarrito_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `ferreterias`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorCarrito_carrito1`
    FOREIGN KEY (`carrito_idcarrito`)
    REFERENCES `ferreterias`.`carrito` (`idcarrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`Ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Ruta` (
  `idRuta` INT NOT NULL AUTO_INCREMENT,
  `estadoRuta` VARCHAR(20) NULL,
  `fechaRuta` DATE NULL,
  `Chofer_idChofer` VARCHAR(15) NOT NULL,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idRuta`),
  INDEX `fk_Ruta_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  CONSTRAINT `fk_Ruta_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`RutaPorPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`RutaPorPedido` (
  `idRutaPorPedido` INT NOT NULL AUTO_INCREMENT,
  `Ruta_idRuta` INT NOT NULL,
  PRIMARY KEY (`idRutaPorPedido`),
  INDEX `fk_RutaPorPedido_Ruta1_idx` (`Ruta_idRuta` ASC),
  CONSTRAINT `fk_RutaPorPedido_Ruta1`
    FOREIGN KEY (`Ruta_idRuta`)
    REFERENCES `ferreterias`.`Ruta` (`idRuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`PedidoOnline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`PedidoOnline` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `fechaPedido` DATE NULL,
  `precioPedido` FLOAT NULL,
  `estadoPedido` VARCHAR(15) NULL,
  `Cliente_idCliente` VARCHAR(25) NOT NULL,
  `RutaPorPedido_idRutaPorPedido` INT NOT NULL,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  `Ferreteria_idFerreteria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Pedido_RutaPorPedido1_idx` (`RutaPorPedido_idRutaPorPedido` ASC),
  INDEX `fk_Pedido_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  INDEX `fk_Pedido_Ferreteria1_idx` (`Ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ferreterias`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_RutaPorPedido1`
    FOREIGN KEY (`RutaPorPedido_idRutaPorPedido`)
    REFERENCES `ferreterias`.`RutaPorPedido` (`idRutaPorPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Ferreteria1`
    FOREIGN KEY (`Ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`Ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`ProductoPorPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`ProductoPorPedido` (
  `idProductoPorPedido` INT NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` VARCHAR(20) NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `vistoBueno` TINYINT(1) NULL,
  PRIMARY KEY (`idProductoPorPedido`),
  INDEX `fk_ProductoPorPedido_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_ProductoPorPedido_Pedido1_idx` (`Pedido_idPedido` ASC),
  CONSTRAINT `fk_ProductoPorPedido_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `ferreterias`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorPedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `ferreterias`.`PedidoOnline` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`BackOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`BackOrder` (
  `idBackOrder` INT NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idBackOrder`),
  INDEX `fk_BackOrder_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_BackOrder_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ferreterias`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`ProdcutoPorBackOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`ProdcutoPorBackOrder` (
  `idProdcutoPorBackOrder` INT NOT NULL AUTO_INCREMENT,
  `BackOrder_idBackOrder` INT NOT NULL,
  `Producto_idProducto` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idProdcutoPorBackOrder`),
  INDEX `fk_ProdcutoPorBackOrder_BackOrder1_idx` (`BackOrder_idBackOrder` ASC),
  INDEX `fk_ProdcutoPorBackOrder_Producto1_idx` (`Producto_idProducto` ASC),
  CONSTRAINT `fk_ProdcutoPorBackOrder_BackOrder1`
    FOREIGN KEY (`BackOrder_idBackOrder`)
    REFERENCES `ferreterias`.`BackOrder` (`idBackOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProdcutoPorBackOrder_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `ferreterias`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Vehiculo` (
  `placaVehiculo` VARCHAR(10) NOT NULL,
  `modeloVehiculo` VARCHAR(25) NULL,
  `annoVehiculo` INT NULL,
  PRIMARY KEY (`placaVehiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`PedidoFisico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`PedidoFisico` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `fechaPedido` DATE NULL,
  `precioPedido` FLOAT NULL,
  `estadoPedido` VARCHAR(15) NULL,
  `Cliente_idCliente` VARCHAR(25) NOT NULL,
  `RutaPorPedido_idRutaPorPedido` INT NOT NULL,
  `Ferreteria_idFerreteria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Pedido_RutaPorPedido1_idx` (`RutaPorPedido_idRutaPorPedido` ASC),
  INDEX `fk_Pedido_Ferreteria1_idx` (`Ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_Pedido_Cliente10`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ferreterias`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_RutaPorPedido10`
    FOREIGN KEY (`RutaPorPedido_idRutaPorPedido`)
    REFERENCES `ferreterias`.`RutaPorPedido` (`idRutaPorPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Ferreteria10`
    FOREIGN KEY (`Ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`Ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`Premio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Premio` (
  `idPremio` INT NOT NULL AUTO_INCREMENT,
  `descripcionPremio` VARCHAR(45) NULL,
  PRIMARY KEY (`idPremio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`PremioPorFerreteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`PremioPorFerreteria` (
  `idPremioPorFerreteria` INT NOT NULL AUTO_INCREMENT,
  `fechaPremioPorFerreteria` DATE NULL,
  `Premio_idPremio` INT NOT NULL,
  `Ferreteria_idFerreteria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPremioPorFerreteria`),
  INDEX `fk_PremioPorFerreteria_Premio1_idx` (`Premio_idPremio` ASC),
  INDEX `fk_PremioPorFerreteria_Ferreteria1_idx` (`Ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_PremioPorFerreteria_Premio1`
    FOREIGN KEY (`Premio_idPremio`)
    REFERENCES `ferreterias`.`Premio` (`idPremio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PremioPorFerreteria_Ferreteria1`
    FOREIGN KEY (`Ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`Ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`PremioPorEmpleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`PremioPorEmpleado` (
  `idPremioPorEmpleado` INT NOT NULL AUTO_INCREMENT,
  `fechaPremioPorEmpleado` DATE NULL,
  `Premio_idPremio` INT NOT NULL,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idPremioPorEmpleado`),
  INDEX `fk_PremioPorEmpleado_Premio1_idx` (`Premio_idPremio` ASC),
  INDEX `fk_PremioPorEmpleado_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  CONSTRAINT `fk_PremioPorEmpleado_Premio1`
    FOREIGN KEY (`Premio_idPremio`)
    REFERENCES `ferreterias`.`Premio` (`idPremio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PremioPorEmpleado_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`VehiculoPorEmpleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`VehiculoPorEmpleado` (
  `idVehiculoPorEmpleado` INT NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  `Vehiculo_placaVehiculo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idVehiculoPorEmpleado`),
  INDEX `fk_VehiculoPorEmpleado_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  INDEX `fk_VehiculoPorEmpleado_Vehiculo1_idx` (`Vehiculo_placaVehiculo` ASC),
  CONSTRAINT `fk_VehiculoPorEmpleado_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VehiculoPorEmpleado_Vehiculo1`
    FOREIGN KEY (`Vehiculo_placaVehiculo`)
    REFERENCES `ferreterias`.`Vehiculo` (`placaVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ferreterias` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
