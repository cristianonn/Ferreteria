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
-- Table `ferreterias`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`departamento` (
  `idDepartamento` VARCHAR(45) NOT NULL,
  `nombreDepartamento` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`estante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`estante` (
  `idEstante` INT(11) NOT NULL AUTO_INCREMENT,
  `numeroEstante` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idEstante`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`pasillo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`pasillo` (
  `idPasillo` INT(11) NOT NULL AUTO_INCREMENT,
  `numeroPasillo` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idPasillo`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`estanteporpasillo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`estanteporpasillo` (
  `idestantePorpasillo` INT(11) NOT NULL,
  `estante_idEstante` INT(11) NOT NULL,
  `pasilloporferreteria_idpasilloporferreteria` INT(11) NOT NULL,
  `pasillo_idPasillo` INT(11) NOT NULL,
  PRIMARY KEY (`idestantePorpasillo`),
  INDEX `fk_estantePorpasillo_estante1_idx` (`estante_idEstante` ASC),
  INDEX `fk_estanteporpasillo_pasillo1_idx` (`pasillo_idPasillo` ASC),
  CONSTRAINT `fk_estantePorpasillo_estante1`
    FOREIGN KEY (`estante_idEstante`)
    REFERENCES `ferreterias`.`estante` (`idEstante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estanteporpasillo_pasillo1`
    FOREIGN KEY (`pasillo_idPasillo`)
    REFERENCES `ferreterias`.`pasillo` (`idPasillo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`ferreteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`ferreteria` (
  `idFerreteria` INT(11) NOT NULL,
  `nombreFerreteria` VARCHAR(45) NULL DEFAULT NULL,
  `telefonoFerreteria` VARCHAR(45) NULL DEFAULT NULL,
  `latitud` FLOAT NULL DEFAULT NULL,
  `longitud` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`idFerreteria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`Marca` (
  `idMarca` INT NOT NULL AUTO_INCREMENT,
  `nombreMarca` VARCHAR(25) NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ferreterias`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`producto` (
  `idProducto` VARCHAR(20) NOT NULL,
  `nombreProducto` VARCHAR(40) NULL DEFAULT NULL,
  `precioProducto` FLOAT NULL DEFAULT NULL,
  `descripcionProducto` VARCHAR(100) NULL DEFAULT NULL,
  `aspectosTecnicosProducto` VARCHAR(100) NULL DEFAULT NULL,
  `utilidadProducto` VARCHAR(100) NULL DEFAULT NULL,
  `garantia` INT(11) NULL DEFAULT NULL,
  `departamento_idDepartamento` VARCHAR(45) NOT NULL,
  `Marca_idMarca` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_producto_departamento1_idx` (`departamento_idDepartamento` ASC),
  INDEX `fk_producto_Marca1_idx` (`Marca_idMarca` ASC),
  CONSTRAINT `fk_producto_departamento1`
    FOREIGN KEY (`departamento_idDepartamento`)
    REFERENCES `ferreterias`.`departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_Marca1`
    FOREIGN KEY (`Marca_idMarca`)
    REFERENCES `ferreterias`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`inventarioporferreteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`inventarioporferreteria` (
  `idinventarioPorFerreteria` INT(11) NOT NULL AUTO_INCREMENT,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `producto_idProducto` VARCHAR(20) NOT NULL,
  `ferreteria_idFerreteria` INT(11) NOT NULL,
  `estanteporpasillo_idestantePorpasillo` INT(11) NOT NULL,
  PRIMARY KEY (`idinventarioPorFerreteria`),
  INDEX `fk_inventarioPorFerreteria_producto1_idx` (`producto_idProducto` ASC),
  INDEX `fk_inventarioPorFerreteria_ferreteria1_idx` (`ferreteria_idFerreteria` ASC),
  INDEX `fk_inventarioporferreteria_estanteporpasillo1_idx` (`estanteporpasillo_idestantePorpasillo` ASC),
  CONSTRAINT `fk_inventarioPorFerreteria_ferreteria1`
    FOREIGN KEY (`ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarioPorFerreteria_producto1`
    FOREIGN KEY (`producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarioporferreteria_estanteporpasillo1`
    FOREIGN KEY (`estanteporpasillo_idestantePorpasillo`)
    REFERENCES `ferreterias`.`estanteporpasillo` (`idestantePorpasillo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 34
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
  `ferreteria_idFerreteria` INT(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_pedidoonline_ferreteria1_idx` (`ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoonline_ferreteria1`
    FOREIGN KEY (`ferreteria_idFerreteria`)
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
  `Ferreteria_idFerreteria` INT(11) NOT NULL,
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
-- Table `ferreterias`.`productoporbackorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`productoporbackorder` (
  `idProductoPorBackOrder` INT(11) NOT NULL AUTO_INCREMENT,
  `ferreteria_idFerreteria` INT(11) NOT NULL,
  `producto_idProducto` VARCHAR(20) NOT NULL,
  `cliente_idCliente` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idProductoPorBackOrder`),
  INDEX `fk_productoporbackorder_ferreteria1_idx` (`ferreteria_idFerreteria` ASC),
  INDEX `fk_productoporbackorder_producto1_idx` (`producto_idProducto` ASC),
  INDEX `fk_productoporbackorder_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_productoporbackorder_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporbackorder_ferreteria1`
    FOREIGN KEY (`ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporbackorder_producto1`
    FOREIGN KEY (`producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`productoporcarrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`productoporcarrito` (
  `idProductoPorCarrito` INT(11) NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` VARCHAR(20) NOT NULL,
  `ferreteria_idFerreteria` INT(11) NOT NULL,
  `cliente_idCliente` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idProductoPorCarrito`),
  INDEX `fk_ProductoPorCarrito_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_productoporcarrito_ferreteria1_idx` (`ferreteria_idFerreteria` ASC),
  INDEX `fk_productoporcarrito_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_ProductoPorCarrito_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporcarrito_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporcarrito_ferreteria1`
    FOREIGN KEY (`ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`productoporpedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`productoporpedido` (
  `idProductoPorPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` VARCHAR(20) NOT NULL,
  `Pedido_idPedido` INT(11) NOT NULL,
  `vistoBueno` TINYINT(1) NULL DEFAULT NULL,
  `ferreteria_idFerreteria` INT(11) NOT NULL,
  PRIMARY KEY (`idProductoPorPedido`),
  INDEX `fk_ProductoPorPedido_Producto1_idx` (`Producto_idProducto` ASC),
  INDEX `fk_ProductoPorPedido_Pedido1_idx` (`Pedido_idPedido` ASC),
  INDEX `fk_productoporpedido_ferreteria1_idx` (`ferreteria_idFerreteria` ASC),
  CONSTRAINT `fk_ProductoPorPedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `ferreterias`.`pedidoonline` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorPedido_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporpedido_ferreteria1`
    FOREIGN KEY (`ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`ferreteria` (`idFerreteria`)
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
AUTO_INCREMENT = 5
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


-- -----------------------------------------------------
-- Table `ferreterias`.`imagenesProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ferreterias`.`imagenesProducto` (
  `idimagenesProducto` INT NOT NULL AUTO_INCREMENT,
  `imagenProducto` VARCHAR(100) NULL,
  `producto_idProducto` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idimagenesProducto`),
  INDEX `fk_imagenesProducto_producto1_idx` (`producto_idProducto` ASC),
  CONSTRAINT `fk_imagenesProducto_producto1`
    FOREIGN KEY (`producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ferreterias` ;

-- -----------------------------------------------------
-- procedure agregarABackOrder
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarABackOrder`(IN pId varchar(20), IN fId INT, IN cId VARCHAR(25))
BEGIN
	INSERT INTO `ferreterias`.`productoporbackorder`
		(`Producto_idProducto`,
		`ferreteria_idFerreteria`,
		`cliente_idCliente`)
		VALUES
		(pId,
		fId,
		cId);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarACarrito
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarACarrito`(IN pId varchar(20), IN fId INT, IN cId VARCHAR(25))
BEGIN
	INSERT INTO `ferreterias`.`productoporcarrito`
		(`Producto_idProducto`,
		`ferreteria_idFerreteria`,
		`cliente_idCliente`)
		VALUES
		(pId,
		fId,
		cId);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure estaEnBackOrder
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnBackOrder`(IN pId varchar(20), IN fId INT, IN cId VARCHAR(25))
BEGIN
	select COUNT(Producto_idProducto) as cantidad
	from ProductoPorBackOrder
    where Producto_idProducto = pId
    AND ferreteria_idFerreteria = fId
    AND cliente_idCliente = cId;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure estaEnCarrito
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnCarrito`(IN pId varchar(20), IN fId INT, IN cId VARCHAR(25))
BEGIN
	select COUNT(Producto_idProducto) as cantidad
	from ProductoPorCarrito
    where Producto_idProducto = pId
    AND ferreteria_idFerreteria = fId
    AND cliente_idCliente = cId;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCantidadBackOrder
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCantidadBackOrder`(in userid INT)
BEGIN
select  count(p.Producto_idProducto) as cantidad
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join productoporbackorder p
on p.Cliente_idCliente = c.idCliente
where u.idusuarioCliente = userid;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCantidadCarrito
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCantidadCarrito`(in userid INT)
BEGIN
select  count(p.Producto_idProducto) as cantidad
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join productoporcarrito p
on p.Cliente_idCliente = c.idCliente
where u.idusuarioCliente = userid;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCarrito
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCarrito`(in username varchar(50))
BEGIN
select  p.Producto_idProducto
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join productoporcarrito p
on p.Cliente_idCliente = c.idCliente
where u.usuarioCliente = username;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getFerreterias
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFerreterias`()
BEGIN
SELECT * FROM Ferreteria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getProductoEnFerreteria
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductoEnFerreteria`(IN pId varchar(20), IN fId INT)
BEGIN
	select idProducto, nombreProducto, precioProducto, fotoProducto,
		descripcionProducto, marcaProducto, aspectosTecnicosProducto,
		utilidadProducto, garantia, nombreDepartamento,
		inventarioPorFerreteria.cantidad AS cantidad,
		nombreFerreteria, numeroEstante, numeroPasillo
	from Producto, Departamento, inventarioPorFerreteria, Ferreteria, estante, productoporestante, estanteporpasillo, pasilloporferreteria, pasillo
    where pId = Producto.idProducto
    AND Producto_idProducto = idProducto
    AND ferreteria_idFerreteria = fId
    AND ferreteria_idFerreteria = idFerreteria
    AND producto_idProductoEnEstante = pId
    AND estantePorpasillo_idestantePorpasillo = idestantePorpasillo
    AND estante_idEstante = idEstante
    AND pasilloporferreteria_idpasilloporferreteria = idpasilloporferreteria
    AND idPasillo = pasillo_idPasillo
    AND departamento_idDepartamento = idDepartamento;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getUser
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(in username varchar(50))
BEGIN
select u.idUsuarioCliente AS userID , c.nombreCliente AS nombreCliente, 
c.apellidosCliente AS apellidosCliente, u.usuarioCliente AS usuariocliente, 
u.contrasenaCliente AS contrasenaCliente
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente 
where u.usuarioCliente = username;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure productosCarrito
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosCarrito`(in username varchar(50))
BEGIN
select s.nombreProducto, s.precioProducto, s.descripcionProducto, s.idProducto, s.fotoProducto
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join carrito K
on k.Cliente_idCliente = c.idCliente
join productoporcarrito p 
on p.carrito_idcarrito = k.idCarrito
join producto s 
on s.idProducto = p.producto_idproducto 
where u.usuarioCliente = username;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure productosbackorder
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosbackorder`(in username varchar(50))
BEGIN
select s.nombreProducto, s.precioProducto, s.descripcionProducto, s.idProducto, s.fotoProducto
from cliente c
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join backorder K
on k.Cliente_idCliente = c.idCliente
join productoporbackorder p 
on p.backorder_idbackorder = k.idbackorder
join producto s 
on s.idProducto = p.producto_idproducto 
where u.usuarioCliente = username;
END$$

DELIMITER ;

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
-- procedure seleccionarFerreteria
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarFerreteria`()
BEGIN
	select * from ferrteria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarProducto
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProducto`(
IN pId varchar(20),
IN pFerreteria VARCHAR(45)
)
BEGIN
	select p.idProducto, p.nombreProducto, p.precioProducto, p.descripcionProducto,i.cantidad from Producto p
    JOIN inventarioporferreteria i
    ON producto_idProducto = pId
    where pId = p.idProducto AND i.ferreteria_idFerreteria = pFerreteria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarProductosPorFerreteria
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProductosPorFerreteria`( IN pidFerreteria INT )
BEGIN
	SELECT idProducto, nombreProducto, precioProducto, fotoProducto,
		descripcionProducto, marcaProducto, nombreDepartamento,
		inventarioPorFerreteria.cantidad AS cantidad
	FROM Producto, Departamento, inventarioPorFerreteria
	WHERE ferreteria_idFerreteria = pidFerreteria
	AND Producto_idProducto = idProducto
	AND departamento_idDepartamento = idDepartamento;
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
