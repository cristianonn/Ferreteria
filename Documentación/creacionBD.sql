-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ferreterias
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ferreterias
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ferreterias` DEFAULT CHARACTER SET utf8 ;
USE `ferreterias` ;

-- -----------------------------------------------------
-- Table `ferreterias`.`tipoempleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`tipoempleado` (
  `idTipoEmpleado` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoEmpleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`empleado` (
  `idEmpleado` VARCHAR(15) NOT NULL,
  `nombreEmpleado` VARCHAR(45) NULL DEFAULT NULL,
  `apellidosEmpleado` VARCHAR(45) NULL DEFAULT NULL,
  `telEmpleado` VARCHAR(15) NULL DEFAULT NULL,
  `fechaEntrada` DATE NULL DEFAULT NULL,
  `vacacionesEmpleado` INT(11) NULL DEFAULT NULL,
  `TipoEmpleado_idTipoEmpleado` INT(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `fk_empleado_TipoEmpleado1_idx` (`TipoEmpleado_idTipoEmpleado` ASC),
  CONSTRAINT `fk_empleado_TipoEmpleado1`
    FOREIGN KEY (`TipoEmpleado_idTipoEmpleado`)
    REFERENCES `ferreterias`.`tipoempleado` (`idTipoEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`amonestacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`amonestacion` (
  `idAmonestacion` INT(11) NOT NULL AUTO_INCREMENT,
  `motivoAmonestacion` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idAmonestacion`),
  INDEX `fk_Amonestacion_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  CONSTRAINT `fk_Amonestacion_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`cliente` (
  `idCliente` VARCHAR(25) NOT NULL,
  `nombreCliente` VARCHAR(25) NULL DEFAULT NULL,
  `apellidosCliente` VARCHAR(45) NULL DEFAULT NULL,
  `telCliente` VARCHAR(15) NULL DEFAULT NULL,
  `correoCliente` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`backorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`backorder` (
  `idBackOrder` INT(11) NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idBackOrder`),
  INDEX `fk_BackOrder_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_BackOrder_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`carrito` (
  `idcarrito` INT(11) NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idcarrito`),
  INDEX `fk_carrito_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_carrito_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`ferreteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`ferreteria` (
  `idFerreteria` VARCHAR(45) NOT NULL,
  `nombreFerreteria` VARCHAR(45) NULL DEFAULT NULL,
  `telefonoFerreteria` VARCHAR(45) NULL DEFAULT NULL,
  `latitud` FLOAT NULL DEFAULT NULL,
  `longitud` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idFerreteria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`departamento` (
  `idDepartamento` VARCHAR(45) NOT NULL,
  `nombreDepartamento` VARCHAR(45) NULL DEFAULT NULL,
  `Ferreteria_idFerreteria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_Departamento_Ferreteria_idx` (`Ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_Departamento_Ferreteria`
    FOREIGN KEY (`Ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`empleadoporferreteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`empleadoporferreteria` (
  `idEmpleadoPorFerreteria` INT(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  `Ferreteria_idFerreteria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleadoPorFerreteria`),
  INDEX `fk_EmpleadoPorFerreteria_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  INDEX `fk_EmpleadoPorFerreteria_Ferreteria1_idx` (`Ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_EmpleadoPorFerreteria_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EmpleadoPorFerreteria_Ferreteria1`
    FOREIGN KEY (`Ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`pasillo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`pasillo` (
  `idPasillo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombrePasillo` VARCHAR(45) NULL DEFAULT NULL,
  `Departamento_idDepartamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPasillo`),
  INDEX `fk_Pasillo_Departamento1_idx` (`Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_Pasillo_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `ferreterias`.`departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`estante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`estante` (
  `idEstante` INT(11) NOT NULL AUTO_INCREMENT,
  `numeroEstante` VARCHAR(45) NULL DEFAULT NULL,
  `Pasillo_idPasillo` INT(11) NOT NULL,
  PRIMARY KEY (`idEstante`),
  INDEX `fk_Estante_Pasillo1_idx` (`Pasillo_idPasillo` ASC),
  CONSTRAINT `fk_Estante_Pasillo1`
    FOREIGN KEY (`Pasillo_idPasillo`)
    REFERENCES `ferreterias`.`pasillo` (`idPasillo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 45
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`expertopordepartamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`expertopordepartamento` (
  `idExpertoPorDepartamento` INT(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  `Departamento_idDepartamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idExpertoPorDepartamento`),
  INDEX `fk_ExpertoPorDepartamento_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  INDEX `fk_ExpertoPorDepartamento_Departamento1_idx` (`Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_ExpertoPorDepartamento_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `ferreterias`.`departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExpertoPorDepartamento_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COMMENT = '	';


-- -----------------------------------------------------
-- Table `ferreterias`.`pedidofisico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`pedidofisico` (
  `idPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` DATE NULL DEFAULT NULL,
  `precioPedido` FLOAT NULL DEFAULT NULL,
  `estadoPedido` VARCHAR(15) NULL DEFAULT NULL,
  `Cliente_idCliente` VARCHAR(25) NOT NULL,
  `Ferreteria_idFerreteria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Pedido_Ferreteria1_idx` (`Ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_Pedido_Cliente10`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Ferreteria10`
    FOREIGN KEY (`Ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`pedidoonline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`pedidoonline` (
  `idPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` DATE NULL DEFAULT NULL,
  `precioPedido` FLOAT NULL DEFAULT NULL,
  `estadoPedido` VARCHAR(15) NULL DEFAULT NULL,
  `Cliente_idCliente` VARCHAR(25) NOT NULL,
  `Ferreteria_idFerreteria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Pedido_Ferreteria1_idx` (`Ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Ferreteria1`
    FOREIGN KEY (`Ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`premio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`premio` (
  `idPremio` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcionPremio` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPremio`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`premioporempleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`premioporempleado` (
  `idPremioPorEmpleado` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaPremioPorEmpleado` DATE NULL DEFAULT NULL,
  `Premio_idPremio` INT(11) NOT NULL,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idPremioPorEmpleado`),
  INDEX `fk_PremioPorEmpleado_Premio1_idx` (`Premio_idPremio` ASC),
  INDEX `fk_PremioPorEmpleado_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  CONSTRAINT `fk_PremioPorEmpleado_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PremioPorEmpleado_Premio1`
    FOREIGN KEY (`Premio_idPremio`)
    REFERENCES `ferreterias`.`premio` (`idPremio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`premioporferreteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`premioporferreteria` (
  `idPremioPorFerreteria` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaPremioPorFerreteria` DATE NULL DEFAULT NULL,
  `Premio_idPremio` INT(11) NOT NULL,
  `Ferreteria_idFerreteria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPremioPorFerreteria`),
  INDEX `fk_PremioPorFerreteria_Premio1_idx` (`Premio_idPremio` ASC),
  INDEX `fk_PremioPorFerreteria_Ferreteria1_idx` (`Ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_PremioPorFerreteria_Ferreteria1`
    FOREIGN KEY (`Ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PremioPorFerreteria_Premio1`
    FOREIGN KEY (`Premio_idPremio`)
    REFERENCES `ferreterias`.`premio` (`idPremio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`producto` (
  `idProducto` VARCHAR(20) NOT NULL,
  `nombreProducto` VARCHAR(40) NULL DEFAULT NULL,
  `precioProducto` FLOAT NULL DEFAULT NULL,
  `fotoProducto` VARCHAR(100) NULL DEFAULT NULL,
  `descripcionProducto` VARCHAR(100) NULL DEFAULT NULL,
  `marcaProducto` VARCHAR(25) NULL DEFAULT NULL,
  `aspectosTecnicosProducto` VARCHAR(100) NULL DEFAULT NULL,
  `utilidadProducto` VARCHAR(100) NULL DEFAULT NULL,
  `garantia` INT(11) NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`prodcutoporbackorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`prodcutoporbackorder` (
  `idProdcutoPorBackOrder` INT(11) NOT NULL AUTO_INCREMENT,
  `BackOrder_idBackOrder` INT(11) NOT NULL,
  `Producto_idProducto` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idProdcutoPorBackOrder`),
  INDEX `fk_ProdcutoPorBackOrder_BackOrder1_idx` (`BackOrder_idBackOrder` ASC),
  INDEX `fk_ProdcutoPorBackOrder_Producto1_idx` (`Producto_idProducto` ASC),
  CONSTRAINT `fk_ProdcutoPorBackOrder_BackOrder1`
    FOREIGN KEY (`BackOrder_idBackOrder`)
    REFERENCES `ferreterias`.`backorder` (`idBackOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProdcutoPorBackOrder_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`productoporcarrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`productoporcarrito` (
  `idProductoPorCarrito` INT(11) NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` VARCHAR(20) NOT NULL,
  `carrito_idcarrito` INT(11) NOT NULL,
  PRIMARY KEY (`idProductoPorCarrito`),
  INDEX `fk_ProductoPorCarrito_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_ProductoPorCarrito_carrito1_idx` (`carrito_idcarrito` ASC),
  CONSTRAINT `fk_ProductoPorCarrito_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorCarrito_carrito1`
    FOREIGN KEY (`carrito_idcarrito`)
    REFERENCES `ferreterias`.`carrito` (`idcarrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`productoporestante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`productoporestante` (
  `idProductoPorEstante` INT(11) NOT NULL AUTO_INCREMENT,
  `posicionProducto` INT(11) NULL DEFAULT NULL,
  `Estante_idEstante` INT(11) NOT NULL,
  `Producto_idProducto` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idProductoPorEstante`),
  INDEX `fk_ProductoPorEstante_Estante1_idx` (`Estante_idEstante` ASC),
  INDEX `fk_ProductoPorEstante_Producto1_idx` (`Producto_idProducto` ASC),
  CONSTRAINT `fk_ProductoPorEstante_Estante1`
    FOREIGN KEY (`Estante_idEstante`)
    REFERENCES `ferreterias`.`estante` (`idEstante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorEstante_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`productoporpedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`productoporpedido` (
  `idProductoPorPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` VARCHAR(20) NOT NULL,
  `Pedido_idPedido` INT(11) NOT NULL,
  `vistoBueno` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idProductoPorPedido`),
  INDEX `fk_ProductoPorPedido_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_ProductoPorPedido_Pedido1_idx` (`Pedido_idPedido` ASC),
  CONSTRAINT `fk_ProductoPorPedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `ferreterias`.`pedidoonline` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorPedido_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`ruta` (
  `idRuta` INT(11) NOT NULL AUTO_INCREMENT,
  `estadoRuta` VARCHAR(20) NULL DEFAULT NULL,
  `fechaRuta` DATE NULL DEFAULT NULL,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idRuta`),
  INDEX `fk_Ruta_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  CONSTRAINT `fk_Ruta_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`rutaporcliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`rutaporcliente` (
  `idRutaPorPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `Ruta_idRuta` INT(11) NOT NULL,
  `cliente_idCliente` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idRutaPorPedido`),
  INDEX `fk_RutaPorPedido_Ruta1_idx` (`Ruta_idRuta` ASC),
  INDEX `fk_rutaporCliente_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_RutaPorPedido_Ruta1`
    FOREIGN KEY (`Ruta_idRuta`)
    REFERENCES `ferreterias`.`ruta` (`idRuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rutaporCliente_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`usuariocliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`usuariocliente` (
  `idUsuarioCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `usuarioCliente` VARCHAR(50) NOT NULL,
  `contrasenaCliente` VARCHAR(50) NOT NULL,
  `cliente_idCliente` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idUsuarioCliente`),
  INDEX `fk_UsuarioCliente_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_UsuarioCliente_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`usuarioempleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`usuarioempleado` (
  `idUsuarioEmpleado` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(45) NULL DEFAULT NULL,
  `contrasennaUsuario` VARCHAR(45) NULL DEFAULT NULL,
  `empleado_idEmpleado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuarioEmpleado`),
  INDEX `idEmpleado_idx` (`empleado_idEmpleado` ASC),
  CONSTRAINT `idEmpleado`
    FOREIGN KEY (`empleado_idEmpleado`)
    REFERENCES `ferreterias`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`vehiculo` (
  `placaVehiculo` VARCHAR(10) NOT NULL,
  `modeloVehiculo` VARCHAR(25) NULL DEFAULT NULL,
  `annoVehiculo` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`placaVehiculo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`vehiculoporempleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`vehiculoporempleado` (
  `idVehiculoPorEmpleado` INT(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  `Vehiculo_placaVehiculo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idVehiculoPorEmpleado`),
  INDEX `fk_VehiculoPorEmpleado_Empleado1_idx` (`Empleado_idEmpleado` ASC),
  INDEX `fk_VehiculoPorEmpleado_Vehiculo1_idx` (`Vehiculo_placaVehiculo` ASC),
  CONSTRAINT `fk_VehiculoPorEmpleado_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `ferreterias`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VehiculoPorEmpleado_Vehiculo1`
    FOREIGN KEY (`Vehiculo_placaVehiculo`)
    REFERENCES `ferreterias`.`vehiculo` (`placaVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

USE `ferreterias` ;

-- -----------------------------------------------------
-- procedure seleccionar6Random
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionar6Random`()
BEGIN
 select idProducto,nombreProducto, descripcionProducto, precioProducto, fotoProducto FROM Producto
 ORDER BY RAND()
 LIMIT 6;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarProducto
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProducto`(
IN pId varchar(20)
)
BEGIN
	select * from Producto
    where pId = Producto.idProducto;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarTodosProductos
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarTodosProductos`()
BEGIN
 select * from Producto;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
