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
DROP SCHEMA IF EXISTS `ferreterias` ;

-- -----------------------------------------------------
-- Schema ferreterias
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ferreterias` DEFAULT CHARACTER SET utf8 ;
USE `ferreterias` ;

-- -----------------------------------------------------
-- Table `ferreterias`.`tipoempleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`tipoempleado` ;

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
DROP TABLE IF EXISTS `ferreterias`.`empleado` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`empleado` (
  `idEmpleado` VARCHAR(15) NOT NULL,
  `nombreEmpleado` VARCHAR(100) NULL DEFAULT NULL,
  `apellidosEmpleado` VARCHAR(100) NULL DEFAULT NULL,
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
DROP TABLE IF EXISTS `ferreterias`.`amonestacion` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`amonestacion` (
  `idAmonestacion` INT(11) NOT NULL AUTO_INCREMENT,
  `motivoAmonestacion` VARCHAR(200) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `Empleado_idEmpleadoAmonestacion` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idAmonestacion`),
  INDEX `fk_Amonestacion_Empleado1_idx` (`Empleado_idEmpleadoAmonestacion` ASC),
  CONSTRAINT `fk_Amonestacion_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleadoAmonestacion`)
    REFERENCES `ferreterias`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`cliente` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`cliente` (
  `idCliente` VARCHAR(25) NOT NULL,
  `nombreCliente` VARCHAR(25) NULL DEFAULT NULL,
  `apellidosCliente` VARCHAR(45) NULL DEFAULT NULL,
  `telCliente` VARCHAR(15) NULL DEFAULT NULL,
  `correoCliente` VARCHAR(45) NULL DEFAULT NULL,
  `latitud` FLOAT NULL,
  `longitud` FLOAT NULL,
  `direccion` VARCHAR(200) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`departamento` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`departamento` (
  `idDepartamento` VARCHAR(45) NOT NULL,
  `nombreDepartamento` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`estante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`estante` ;

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
DROP TABLE IF EXISTS `ferreterias`.`pasillo` ;

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
DROP TABLE IF EXISTS `ferreterias`.`estanteporpasillo` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`estanteporpasillo` (
  `idestantePorpasillo` INT(11) NOT NULL,
  `estante_idEstante` INT(11) NOT NULL,
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
DROP TABLE IF EXISTS `ferreterias`.`ferreteria` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`ferreteria` (
  `idFerreteria` INT(11) NOT NULL,
  `nombreFerreteria` VARCHAR(45) NULL DEFAULT NULL,
  `telefonoFerreteria` VARCHAR(45) NULL DEFAULT NULL,
  `latitud` FLOAT NULL DEFAULT NULL,
  `longitud` FLOAT NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL,
  PRIMARY KEY (`idFerreteria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`marca` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`marca` (
  `idMarca` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreMarca` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`producto` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`producto` (
  `idProducto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(100) NULL DEFAULT NULL,
  `precioProducto` FLOAT NULL DEFAULT NULL,
  `descripcionProducto` VARCHAR(200) NULL DEFAULT NULL,
  `aspectosTecnicosProducto` VARCHAR(100) NULL DEFAULT NULL,
  `utilidadProducto` VARCHAR(100) NULL DEFAULT NULL,
  `garantia` INT(11) NULL DEFAULT NULL,
  `departamento_idDepartamento` VARCHAR(45) NOT NULL,
  `Marca_idMarca` INT(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_producto_departamento1_idx` (`departamento_idDepartamento` ASC),
  INDEX `fk_producto_Marca1_idx` (`Marca_idMarca` ASC),
  CONSTRAINT `fk_producto_Marca1`
    FOREIGN KEY (`Marca_idMarca`)
    REFERENCES `ferreterias`.`marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_departamento1`
    FOREIGN KEY (`departamento_idDepartamento`)
    REFERENCES `ferreterias`.`departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`imagenesproducto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`imagenesproducto` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`imagenesproducto` (
  `idimagenesProducto` INT(11) NOT NULL AUTO_INCREMENT,
  `imagenProducto` VARCHAR(100) NULL DEFAULT NULL,
  `producto_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idimagenesProducto`),
  INDEX `fk_imagenesProducto_producto1_idx` (`producto_idProducto` ASC),
  CONSTRAINT `fk_imagenesProducto_producto1`
    FOREIGN KEY (`producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`inventarioporferreteria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`inventarioporferreteria` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`inventarioporferreteria` (
  `idinventarioPorFerreteria` INT(11) NOT NULL AUTO_INCREMENT,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `ferreteria_idFerreteria` INT(11) NOT NULL,
  `estanteporpasillo_idestantePorpasillo` INT(11) NOT NULL,
  `producto_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idinventarioPorFerreteria`),
  INDEX `fk_inventarioPorFerreteria_ferreteria1_idx` (`ferreteria_idFerreteria` ASC),
  INDEX `fk_inventarioporferreteria_estanteporpasillo1_idx` (`estanteporpasillo_idestantePorpasillo` ASC),
  INDEX `fk_inventarioporferreteria_producto1_idx` (`producto_idProducto` ASC),
  CONSTRAINT `fk_inventarioPorFerreteria_ferreteria1`
    FOREIGN KEY (`ferreteria_idFerreteria`)
    REFERENCES `ferreterias`.`ferreteria` (`idFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarioporferreteria_estanteporpasillo1`
    FOREIGN KEY (`estanteporpasillo_idestantePorpasillo`)
    REFERENCES `ferreterias`.`estanteporpasillo` (`idestantePorpasillo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarioporferreteria_producto1`
    FOREIGN KEY (`producto_idProducto`)
    REFERENCES `ferreterias`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 77
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`pedidoonline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`pedidoonline` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`pedidoonline` (
  `idPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` DATE NULL DEFAULT NULL,
  `precioPedido` FLOAT NULL DEFAULT NULL,
  `estadoPedido` VARCHAR(15) NULL DEFAULT NULL,
  `Cliente_idCliente` VARCHAR(25) NOT NULL,
  `empleado_idEmpleado` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_empelado_idEmpleado_idx` (`empleado_idEmpleado` ASC),
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empelado_idEmpleado`
    FOREIGN KEY (`empleado_idEmpleado`)
    REFERENCES `ferreterias`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`premio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`premio` ;

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
DROP TABLE IF EXISTS `ferreterias`.`premioporempleado` ;

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
DROP TABLE IF EXISTS `ferreterias`.`premioporferreteria` ;

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
DROP TABLE IF EXISTS `ferreterias`.`productoporbackorder` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`productoporbackorder` (
  `idProductoPorBackOrder` INT(11) NOT NULL AUTO_INCREMENT,
  `ferreteria_idFerreteria` INT(11) NOT NULL,
  `cliente_idCliente` VARCHAR(25) NOT NULL,
  `producto_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idProductoPorBackOrder`),
  INDEX `fk_productoporbackorder_ferreteria1_idx` (`ferreteria_idFerreteria` ASC),
  INDEX `fk_productoporbackorder_cliente1_idx` (`cliente_idCliente` ASC),
  INDEX `fk_productoporbackorder_producto1_idx` (`producto_idProducto` ASC),
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
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`productoporcarrito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`productoporcarrito` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`productoporcarrito` (
  `idProductoPorCarrito` INT(11) NOT NULL AUTO_INCREMENT,
  `cliente_idCliente` VARCHAR(25) NOT NULL,
  `inventarioporferreteria_idinventarioPorFerreteria` INT(11) NOT NULL,
  PRIMARY KEY (`idProductoPorCarrito`),
  INDEX `fk_productoporcarrito_cliente1_idx` (`cliente_idCliente` ASC),
  INDEX `fk_productoporcarrito_inventarioporferreteria1_idx` (`inventarioporferreteria_idinventarioPorFerreteria` ASC),
  CONSTRAINT `fk_productoporcarrito_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `ferreterias`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporcarrito_inventarioporferreteria1`
    FOREIGN KEY (`inventarioporferreteria_idinventarioPorFerreteria`)
    REFERENCES `ferreterias`.`inventarioporferreteria` (`idinventarioPorFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`productoporpedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`productoporpedido` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`productoporpedido` (
  `idProductoPorPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `Pedido_idPedido` INT(11) NOT NULL,
  `vistoBueno` TINYINT(1) NULL DEFAULT NULL,
  `inventarioporferreteria_idinventarioPorFerreteria` INT(11) NOT NULL,
  `cantidad` INT NULL DEFAULT 1,
  PRIMARY KEY (`idProductoPorPedido`),
  INDEX `fk_ProductoPorPedido_Pedido1_idx` (`Pedido_idPedido` ASC),
  INDEX `fk_productoporpedido_inventarioporferreteria1_idx` (`inventarioporferreteria_idinventarioPorFerreteria` ASC),
  CONSTRAINT `fk_ProductoPorPedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `ferreterias`.`pedidoonline` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporpedido_inventarioporferreteria1`
    FOREIGN KEY (`inventarioporferreteria_idinventarioPorFerreteria`)
    REFERENCES `ferreterias`.`inventarioporferreteria` (`idinventarioPorFerreteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ferreterias`.`ruta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ferreterias`.`ruta` ;

CREATE TABLE IF NOT EXISTS `ferreterias`.`ruta` (
  `idRuta` INT(11) NOT NULL AUTO_INCREMENT,
  `estadoRuta` VARCHAR(20) NULL DEFAULT NULL,
  `fechaRuta` DATE NULL DEFAULT NULL,
  `Empleado_idEmpleado` VARCHAR(15) NOT NULL,
  `zona` VARCHAR(100) NULL,
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
DROP TABLE IF EXISTS `ferreterias`.`rutaporcliente` ;

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
DROP TABLE IF EXISTS `ferreterias`.`usuariocliente` ;

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
DROP TABLE IF EXISTS `ferreterias`.`usuarioempleado` ;

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
DROP TABLE IF EXISTS `ferreterias`.`vehiculo` ;

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
DROP TABLE IF EXISTS `ferreterias`.`vehiculoporempleado` ;

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
-- procedure agregarABackOrder
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`agregarABackOrder`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarABackOrder`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
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

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`agregarACarrito`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarACarrito`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
BEGIN
	INSERT INTO `ferreterias`.`productoporcarrito`
		(`inventarioporferreteria_idinventarioPorFerreteria`,
		`cliente_idCliente`)
		SELECT idInventarioPorFerreteria, cId FROM InventarioPorFerreteria
			WHERE Producto_idProducto = pId
            AND Ferreteria_idFerreteria = fId 
           	LIMIT 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarCliente
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`agregarCliente`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarCliente`(
IN pId VARCHAR(25),
IN pNombre VARCHAR(25),
IN pApellidos VARCHAR(45),
IN pTel VARCHAR(15),
IN pCorreo VARCHAR(45)
)
BEGIN
SELECT * FROM ferreterias.usuarioempleado;INSERT INTO `ferreterias`.`cliente`
(`idCliente`,
`nombreCliente`,
`apellidosCliente`,
`telCliente`,
`correoCliente`)
VALUES
(pId,
pNombre,
pApellidos,
pTel,
pCorreo);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarEmpleado
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`agregarEmpleado`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarEmpleado`(
IN pId VARCHAR(15),
IN pNombre varchar(100),
IN pApellidos varchar(100),
IN pTel varchar(15),
IN pTipo INT(11)
)
BEGIN
	INSERT INTO `ferreterias`.`empleado`
(`idEmpleado`,
`nombreEmpleado`,
`apellidosEmpleado`,
`telEmpleado`,
`fechaEntrada`,
`vacacionesEmpleado`,
`TipoEmpleado_idTipoEmpleado`)
	VALUES
(pId,
pNombre,
pApellidos,
pTel,
UTC_DATE(),
0,
pTipo);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarImagenProducto
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`agregarImagenProducto`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarImagenProducto`(IN pId INT, IN pImagenProducto VARCHAR(100))
BEGIN
 INSERT INTO `ferreterias`.`imagenesproducto`
	(`imagenProducto`,
	`producto_idProducto`)
	VALUES
	(pImagenProducto,
	pId);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarProducto
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`agregarProducto`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarProducto`(IN pNombre VARCHAR(100), IN pPrecio FLOAT, IN pDescripcion VARCHAR(200),
	IN pAspectosTecnicos VARCHAR(100), IN pUtilidad VARCHAR(100),
	IN pGarantia INT, IN pIdDepartamento VARCHAR(45), IN pIdMarca INT)
BEGIN
 INSERT INTO `ferreterias`.`producto`
	(`nombreProducto`,
	`precioProducto`,
	`descripcionProducto`,
	`aspectosTecnicosProducto`,
	`utilidadProducto`,
	`garantia`,
	`departamento_idDepartamento`,
	`Marca_idMarca`)
	VALUES
	(pNombre,
	pPrecio,
	pDescripcion,
	pAspectosTecnicos,
	pUtilidad,
	pGarantia,
	pIdDepartamento,
	pIdMarca);
 SELECT LAST_INSERT_ID() AS idProducto;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarProductoAInventarios
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`agregarProductoAInventarios`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarProductoAInventarios`(IN pId INT)
BEGIN
INSERT INTO `ferreterias`.`inventarioporferreteria`
	(`cantidad`,
	`ferreteria_idFerreteria`,
	`estanteporpasillo_idestantePorpasillo`,
	`producto_idProducto`)
	SELECT 0 AS cantidad, idFerreteria, 1 AS estanteporpasillo_idestantePorpasillo, 
    pId AS producto_idProducto
		FROM Ferreteria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure eliminarCliente
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`eliminarCliente`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarCliente`(IN pId INT)
BEGIN
	DELETE FROM `ferreterias`.`cliente`
	WHERE idCliente = pId;
    DELETE FROM `ferreterias`.`usuariocliente`
	WHERE cliente_idCliente = pId;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure eliminarLineaInventario
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`eliminarLineaInventario`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarLineaInventario`(in pidProducto INT, IN pidFerreteria INT)
BEGIN
	DELETE FROM `ferreterias`.`inventarioporferreteria`
	WHERE Producto_idProducto = pidProducto
	AND ferreteria_idFerreteria = pidFerreteria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure eliminarProducto
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`eliminarProducto`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarProducto`(IN pId INT)
BEGIN
	DELETE FROM `ferreterias`.`ProductoPorCarrito`
	WHERE inventarioporferreteria_idinventarioPorFerreteria IN 
		(SELECT idinventarioPorFerreteria
			FROM InventarioPorFerreteria
			WHERE producto_idProducto = pId);
	DELETE FROM `ferreterias`.`inventarioporferreteria`
	WHERE producto_idProducto = pId;
    DELETE FROM `ferreterias`.`imagenesProducto`
	WHERE producto_idProducto = pId;
    DELETE FROM `ferreterias`.`producto`
	WHERE idProducto = pId;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure estaEnBackOrder
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`estaEnBackOrder`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnBackOrder`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
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

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`estaEnCarrito`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnCarrito`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
BEGIN
	select COUNT(Producto_idProducto) as cantidad
	from ProductoPorCarrito, InventarioPorFerreteria
    where idInventarioPorFerreteria = inventarioporferreteria_idinventarioPorFerreteria
    AND InventarioPorFerreteria.ferreteria_idFerreteria = fId
    AND InventarioPorFerreteria.Producto_idProducto = pId
    AND cliente_idCliente = cId;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCantidadBackOrder
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getCantidadBackOrder`;

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

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getCantidadCarrito`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCantidadCarrito`(in userid INT)
BEGIN
SELECT COUNT(idProductoPorCarrito) AS cantidad
FROM ProductoPorCarrito, cliente, usuariocliente
WHERE UsuarioCliente.cliente_idCliente = userid
AND UsuarioCliente.cliente_idCliente = idCliente
AND ProductoPorCarrito.Cliente_idCliente = idCliente;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCarrito
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getCarrito`;

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
-- procedure getClientes
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getClientes`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientes`()
BEGIN
	SELECT * from cliente;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getDepartamento
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getDepartamento`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDepartamento`()
BEGIN
	SELECT * from departamentos;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getDepartamentos
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getDepartamentos`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDepartamentos`()
BEGIN
 select idDepartamento, nombreDepartamento
 FROM Departamento;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getEmpleados
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getEmpleados`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmpleados`()
BEGIN
	Select * FROM empleado;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getEstantes
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getEstantes`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEstantes`()
BEGIN
	Select * from estante;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getFerreterias
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getFerreterias`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFerreterias`()
BEGIN
SELECT * FROM Ferreteria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getMarcas
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getMarcas`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMarcas`()
BEGIN
 select idMarca, nombreMarca
 FROM Marca;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getPasillos
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getPasillos`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPasillos`()
BEGIN
	SELECT * FROM pasillo;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getProductoEnFerreteria
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getProductoEnFerreteria`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductoEnFerreteria`(IN pId INT, IN fId INT)
BEGIN
	select idProducto, nombreProducto, precioProducto, imagenProducto AS fotoProducto,
		descripcionProducto, nombreMarca AS marcaProducto, aspectosTecnicosProducto,
		utilidadProducto, garantia, nombreDepartamento,
		inventarioPorFerreteria.cantidad AS cantidad,
		nombreFerreteria, numeroEstante, numeroPasillo
	from Producto, Departamento, inventarioPorFerreteria, Ferreteria, 
	estante, estanteporpasillo, pasillo, imagenesProducto, Marca
	WHERE pId = Producto.idProducto
	AND Producto.idProducto = inventarioporferreteria.Producto_idProducto
	AND fId = Ferreteria.idFerreteria
	AND Ferreteria.idFerreteria = inventarioporferreteria.ferreteria_idFerreteria
	AND Producto.idProducto = imagenesProducto.Producto_idProducto
	AND Marca.idMarca = Producto.Marca_idMarca
	AND Departamento.idDepartamento = Producto.departamento_idDepartamento
	AND inventarioporferreteria.estanteporpasillo_idestantePorpasillo = estanteporpasillo.idestantePorpasillo
	AND estanteporpasillo.estante_idEstante = Estante.idEstante
	AND estanteporpasillo.pasillo_idPasillo = Pasillo.idPasillo;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getProductos
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getProductos`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductos`()
BEGIN
	SELECT idProducto, nombreProducto, precioProducto, descripcionProducto,
	garantia, nombreDepartamento, nombreMarca
	FROM Producto, Departamento, Marca 
	WHERE departamento_idDepartamento = idDepartamento
	AND Marca_idMarca = idMarca;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getTipoEmpleados
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getTipoEmpleados`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTipoEmpleados`()
BEGIN
	Select * from tipoempleado;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getUser
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getUser`;

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
-- procedure getUsuarioEmpleado
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`getUsuarioEmpleado`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsuarioEmpleado`(in username varchar(50))
BEGIN
select u.idUsuarioEmpleado AS userID , e.nombreEmpleado AS nombreEmpleado, 
e.apellidosEmpleado AS apellidosEmpleado, u.nombreusuario AS usuarioEmpleado, 
u.contrasennaUsuario AS contrasenaEmpleado
from empleado e 
join usuarioEmpleado u
on u.empleado_idempleado = e.idEmpleado 
where u.nombreUsuario = username;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure productosCarrito
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`productosCarrito`;

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

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`productosbackorder`;

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

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`seleccionar6Random`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionar6Random`()
BEGIN
 select idProducto, nombreProducto, descripcionProducto, precioProducto, 
 imagenProducto AS fotoProducto 
 FROM Producto, imagenesProducto
 WHERE idProducto = producto_idproducto
 ORDER BY RAND()
 LIMIT 6;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarFerreteria
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`seleccionarFerreteria`;

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

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`seleccionarProducto`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProducto`(
IN pId INT,
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

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`seleccionarProductosPorFerreteria`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProductosPorFerreteria`( IN pidFerreteria INT )
BEGIN
	SELECT idProducto, nombreProducto, precioProducto,
		descripcionProducto, nombreMarca AS marcaProducto, 
		nombreDepartamento,
		inventarioPorFerreteria.cantidad AS cantidad
	FROM Producto, Departamento, inventarioPorFerreteria, Marca
	WHERE ferreteria_idFerreteria = pidFerreteria
	AND Producto_idProducto = idProducto
	AND departamento_idDepartamento = idDepartamento
	AND idMarca = Marca_idMarca;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarTodosProductos
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`seleccionarTodosProductos`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarTodosProductos`()
BEGIN
 select * from Producto;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure verMejorEmpleado
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`verMejorEmpleado`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `verMejorEmpleado`()
BEGIN
select venta.empleado_idEmpleado, venta.ventas, a.idAmonestacion
FROM
	(select empleado_idEmpleado,sum(precioPedido) as ventas
	from (
	select empleado_idEmpleado, precioPedido
	from pedidoonline
	WHERE fechaPedido BETWEEN (CURRENT_DATE() - INTERVAL 1 MONTH) AND CURRENT_DATE())
    as precio
    GROUP BY empleado_idEmpleado
    ORDER BY ventas DESC) venta
    LEFT JOIN amonestacion a
    ON a.Empleado_idEmpleadoAmonestacion = venta.empleado_idEmpleado and a.fecha BETWEEN (CURRENT_DATE() - INTERVAL 6 MONTH) AND CURRENT_DATE()
    WHERE a.idAmonestacion IS NULL
    limit 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure verMejorFerreteria
-- -----------------------------------------------------

USE `ferreterias`;
DROP procedure IF EXISTS `ferreterias`.`verMejorFerreteria`;

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `verMejorFerreteria`()
BEGIN
	select ferreteria_idFerreteria,sum(precioProducto) as ventas
	from (
	select i.ferreteria_idFerreteria, p.precioProducto
	from productoporpedido q
    JOIN inventarioporferreteria i
    ON q.inventarioporferreteria_idinventarioPorFerreteria = i.idinventarioPorFerreteria
    JOIN producto p
    ON i.producto_idProducto = p.idProducto
    JOIN pedidoonline r 
    ON q.Pedido_idPedido = r.idPedido
    WHERE r.fechaPedido BETWEEN (CURRENT_DATE() - INTERVAL 1 MONTH) AND CURRENT_DATE()) 
    as precio
    GROUP BY ferreteria_idferreteria
    ORDER BY precioProducto DESC
    limit 1;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
