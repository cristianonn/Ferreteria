-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: localhost    Database: ferreterias
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ferreterias`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ferreterias` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ferreterias`;

--
-- Table structure for table `amonestacion`
--

DROP TABLE IF EXISTS `amonestacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amonestacion` (
  `idAmonestacion` int(11) NOT NULL AUTO_INCREMENT,
  `motivoAmonestacion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `Empleado_idEmpleado` varchar(15) NOT NULL,
  PRIMARY KEY (`idAmonestacion`),
  KEY `fk_Amonestacion_Empleado1_idx` (`Empleado_idEmpleado`),
  CONSTRAINT `fk_Amonestacion_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amonestacion`
--

LOCK TABLES `amonestacion` WRITE;
/*!40000 ALTER TABLE `amonestacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `amonestacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backorder`
--

DROP TABLE IF EXISTS `backorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backorder` (
  `idBackOrder` int(11) NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` varchar(25) NOT NULL,
  PRIMARY KEY (`idBackOrder`),
  KEY `fk_BackOrder_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_BackOrder_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backorder`
--

LOCK TABLES `backorder` WRITE;
/*!40000 ALTER TABLE `backorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `backorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito` (
  `idcarrito` int(11) NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` varchar(25) NOT NULL,
  PRIMARY KEY (`idcarrito`),
  KEY `fk_carrito_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_carrito_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` varchar(25) NOT NULL,
  `nombreCliente` varchar(25) DEFAULT NULL,
  `apellidosCliente` varchar(45) DEFAULT NULL,
  `telCliente` varchar(15) DEFAULT NULL,
  `correoCliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('1','Louis','CK','88888888','lck@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `idDepartamento` varchar(45) NOT NULL,
  `nombreDepartamento` varchar(45) DEFAULT NULL,
  `Ferreteria_idFerreteria` varchar(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `fk_Departamento_Ferreteria_idx` (`Ferreteria_idFerreteria`),
  CONSTRAINT `fk_Departamento_Ferreteria` FOREIGN KEY (`Ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` varchar(15) NOT NULL,
  `nombreEmpleado` varchar(45) DEFAULT NULL,
  `apellidosEmpleado` varchar(45) DEFAULT NULL,
  `telEmpleado` varchar(15) DEFAULT NULL,
  `fechaEntrada` date DEFAULT NULL,
  `vacacionesEmpleado` int(11) DEFAULT NULL,
  `TipoEmpleado_idTipoEmpleado` int(11) NOT NULL,
  `usuarioEmpleado_idUsuarioEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `fk_empleado_TipoEmpleado1_idx` (`TipoEmpleado_idTipoEmpleado`),
  KEY `fk_empleado_usuarioEmpleado1_idx` (`usuarioEmpleado_idUsuarioEmpleado`),
  CONSTRAINT `fk_empleado_TipoEmpleado1` FOREIGN KEY (`TipoEmpleado_idTipoEmpleado`) REFERENCES `tipoempleado` (`idTipoEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_usuarioEmpleado1` FOREIGN KEY (`usuarioEmpleado_idUsuarioEmpleado`) REFERENCES `usuarioempleado` (`idUsuarioEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleadoporferreteria`
--

DROP TABLE IF EXISTS `empleadoporferreteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleadoporferreteria` (
  `idEmpleadoPorFerreteria` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` varchar(15) NOT NULL,
  `Ferreteria_idFerreteria` varchar(45) NOT NULL,
  PRIMARY KEY (`idEmpleadoPorFerreteria`),
  KEY `fk_EmpleadoPorFerreteria_Empleado1_idx` (`Empleado_idEmpleado`),
  KEY `fk_EmpleadoPorFerreteria_Ferreteria1_idx` (`Ferreteria_idFerreteria`),
  CONSTRAINT `fk_EmpleadoPorFerreteria_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EmpleadoPorFerreteria_Ferreteria1` FOREIGN KEY (`Ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleadoporferreteria`
--

LOCK TABLES `empleadoporferreteria` WRITE;
/*!40000 ALTER TABLE `empleadoporferreteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleadoporferreteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estante`
--

DROP TABLE IF EXISTS `estante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estante` (
  `idEstante` int(11) NOT NULL AUTO_INCREMENT,
  `numeroEstante` varchar(45) DEFAULT NULL,
  `Pasillo_idPasillo` int(11) NOT NULL,
  PRIMARY KEY (`idEstante`),
  KEY `fk_Estante_Pasillo1_idx` (`Pasillo_idPasillo`),
  CONSTRAINT `fk_Estante_Pasillo1` FOREIGN KEY (`Pasillo_idPasillo`) REFERENCES `pasillo` (`idPasillo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estante`
--

LOCK TABLES `estante` WRITE;
/*!40000 ALTER TABLE `estante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expertopordepartamento`
--

DROP TABLE IF EXISTS `expertopordepartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expertopordepartamento` (
  `idExpertoPorDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` varchar(15) NOT NULL,
  `Departamento_idDepartamento` varchar(45) NOT NULL,
  PRIMARY KEY (`idExpertoPorDepartamento`),
  KEY `fk_ExpertoPorDepartamento_Empleado1_idx` (`Empleado_idEmpleado`),
  KEY `fk_ExpertoPorDepartamento_Departamento1_idx` (`Departamento_idDepartamento`),
  CONSTRAINT `fk_ExpertoPorDepartamento_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExpertoPorDepartamento_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expertopordepartamento`
--

LOCK TABLES `expertopordepartamento` WRITE;
/*!40000 ALTER TABLE `expertopordepartamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `expertopordepartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ferreteria`
--

DROP TABLE IF EXISTS `ferreteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ferreteria` (
  `idFerreteria` varchar(45) NOT NULL,
  `nombreFerreteria` varchar(45) DEFAULT NULL,
  `telefonoFerreteria` varchar(45) DEFAULT NULL,
  `ubicacion` polygon DEFAULT NULL,
  PRIMARY KEY (`idFerreteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ferreteria`
--

LOCK TABLES `ferreteria` WRITE;
/*!40000 ALTER TABLE `ferreteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `ferreteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasillo`
--

DROP TABLE IF EXISTS `pasillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasillo` (
  `idPasillo` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePasillo` varchar(45) DEFAULT NULL,
  `Departamento_idDepartamento` varchar(45) NOT NULL,
  PRIMARY KEY (`idPasillo`),
  KEY `fk_Pasillo_Departamento1_idx` (`Departamento_idDepartamento`),
  CONSTRAINT `fk_Pasillo_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasillo`
--

LOCK TABLES `pasillo` WRITE;
/*!40000 ALTER TABLE `pasillo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidofisico`
--

DROP TABLE IF EXISTS `pedidofisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidofisico` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` date DEFAULT NULL,
  `precioPedido` float DEFAULT NULL,
  `estadoPedido` varchar(15) DEFAULT NULL,
  `Cliente_idCliente` varchar(25) NOT NULL,
  `Ferreteria_idFerreteria` varchar(45) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Cliente1_idx` (`Cliente_idCliente`),
  KEY `fk_Pedido_Ferreteria1_idx` (`Ferreteria_idFerreteria`),
  CONSTRAINT `fk_Pedido_Cliente10` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Ferreteria10` FOREIGN KEY (`Ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidofisico`
--

LOCK TABLES `pedidofisico` WRITE;
/*!40000 ALTER TABLE `pedidofisico` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidofisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoonline`
--

DROP TABLE IF EXISTS `pedidoonline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidoonline` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` date DEFAULT NULL,
  `precioPedido` float DEFAULT NULL,
  `estadoPedido` varchar(15) DEFAULT NULL,
  `Cliente_idCliente` varchar(25) NOT NULL,
  `Empleado_idEmpleado` varchar(15) NOT NULL,
  `Ferreteria_idFerreteria` varchar(45) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Cliente1_idx` (`Cliente_idCliente`),
  KEY `fk_Pedido_Empleado1_idx` (`Empleado_idEmpleado`),
  KEY `fk_Pedido_Ferreteria1_idx` (`Ferreteria_idFerreteria`),
  CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Ferreteria1` FOREIGN KEY (`Ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoonline`
--

LOCK TABLES `pedidoonline` WRITE;
/*!40000 ALTER TABLE `pedidoonline` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidoonline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premio`
--

DROP TABLE IF EXISTS `premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premio` (
  `idPremio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionPremio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPremio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premio`
--

LOCK TABLES `premio` WRITE;
/*!40000 ALTER TABLE `premio` DISABLE KEYS */;
/*!40000 ALTER TABLE `premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premioporempleado`
--

DROP TABLE IF EXISTS `premioporempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premioporempleado` (
  `idPremioPorEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPremioPorEmpleado` date DEFAULT NULL,
  `Premio_idPremio` int(11) NOT NULL,
  `Empleado_idEmpleado` varchar(15) NOT NULL,
  PRIMARY KEY (`idPremioPorEmpleado`),
  KEY `fk_PremioPorEmpleado_Premio1_idx` (`Premio_idPremio`),
  KEY `fk_PremioPorEmpleado_Empleado1_idx` (`Empleado_idEmpleado`),
  CONSTRAINT `fk_PremioPorEmpleado_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PremioPorEmpleado_Premio1` FOREIGN KEY (`Premio_idPremio`) REFERENCES `premio` (`idPremio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premioporempleado`
--

LOCK TABLES `premioporempleado` WRITE;
/*!40000 ALTER TABLE `premioporempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `premioporempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premioporferreteria`
--

DROP TABLE IF EXISTS `premioporferreteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premioporferreteria` (
  `idPremioPorFerreteria` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPremioPorFerreteria` date DEFAULT NULL,
  `Premio_idPremio` int(11) NOT NULL,
  `Ferreteria_idFerreteria` varchar(45) NOT NULL,
  PRIMARY KEY (`idPremioPorFerreteria`),
  KEY `fk_PremioPorFerreteria_Premio1_idx` (`Premio_idPremio`),
  KEY `fk_PremioPorFerreteria_Ferreteria1_idx` (`Ferreteria_idFerreteria`),
  CONSTRAINT `fk_PremioPorFerreteria_Ferreteria1` FOREIGN KEY (`Ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PremioPorFerreteria_Premio1` FOREIGN KEY (`Premio_idPremio`) REFERENCES `premio` (`idPremio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premioporferreteria`
--

LOCK TABLES `premioporferreteria` WRITE;
/*!40000 ALTER TABLE `premioporferreteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `premioporferreteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodcutoporbackorder`
--

DROP TABLE IF EXISTS `prodcutoporbackorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodcutoporbackorder` (
  `idProdcutoPorBackOrder` int(11) NOT NULL AUTO_INCREMENT,
  `BackOrder_idBackOrder` int(11) NOT NULL,
  `Producto_idProducto` varchar(20) NOT NULL,
  PRIMARY KEY (`idProdcutoPorBackOrder`),
  KEY `fk_ProdcutoPorBackOrder_BackOrder1_idx` (`BackOrder_idBackOrder`),
  KEY `fk_ProdcutoPorBackOrder_Producto1_idx` (`Producto_idProducto`),
  CONSTRAINT `fk_ProdcutoPorBackOrder_BackOrder1` FOREIGN KEY (`BackOrder_idBackOrder`) REFERENCES `backorder` (`idBackOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProdcutoPorBackOrder_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodcutoporbackorder`
--

LOCK TABLES `prodcutoporbackorder` WRITE;
/*!40000 ALTER TABLE `prodcutoporbackorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `prodcutoporbackorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` varchar(20) NOT NULL,
  `nombreProducto` varchar(40) DEFAULT NULL,
  `precioProducto` float DEFAULT NULL,
  `fotoProducto` mediumblob,
  `descripcionProducto` varchar(100) DEFAULT NULL,
  `marcaProducto` varchar(25) DEFAULT NULL,
  `aspectosTecnicosProducto` varchar(100) DEFAULT NULL,
  `utilidadProducto` varchar(100) DEFAULT NULL,
  `garantia` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productoporcarrito`
--

DROP TABLE IF EXISTS `productoporcarrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productoporcarrito` (
  `idProductoPorCarrito` int(11) NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` varchar(20) NOT NULL,
  `carrito_idcarrito` int(11) NOT NULL,
  PRIMARY KEY (`idProductoPorCarrito`),
  KEY `fk_ProductoPorCarrito_Producto1_idx` (`Producto_idProducto`),
  KEY `fk_ProductoPorCarrito_carrito1_idx` (`carrito_idcarrito`),
  CONSTRAINT `fk_ProductoPorCarrito_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorCarrito_carrito1` FOREIGN KEY (`carrito_idcarrito`) REFERENCES `carrito` (`idcarrito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoporcarrito`
--

LOCK TABLES `productoporcarrito` WRITE;
/*!40000 ALTER TABLE `productoporcarrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoporcarrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productoporestante`
--

DROP TABLE IF EXISTS `productoporestante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productoporestante` (
  `idProductoPorEstante` int(11) NOT NULL AUTO_INCREMENT,
  `posicionProducto` int(11) DEFAULT NULL,
  `Estante_idEstante` int(11) NOT NULL,
  `Producto_idProducto` varchar(20) NOT NULL,
  PRIMARY KEY (`idProductoPorEstante`),
  KEY `fk_ProductoPorEstante_Estante1_idx` (`Estante_idEstante`),
  KEY `fk_ProductoPorEstante_Producto1_idx` (`Producto_idProducto`),
  CONSTRAINT `fk_ProductoPorEstante_Estante1` FOREIGN KEY (`Estante_idEstante`) REFERENCES `estante` (`idEstante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorEstante_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoporestante`
--

LOCK TABLES `productoporestante` WRITE;
/*!40000 ALTER TABLE `productoporestante` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoporestante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productoporpedido`
--

DROP TABLE IF EXISTS `productoporpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productoporpedido` (
  `idProductoPorPedido` int(11) NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` varchar(20) NOT NULL,
  `Pedido_idPedido` int(11) NOT NULL,
  `vistoBueno` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idProductoPorPedido`),
  KEY `fk_ProductoPorPedido_Producto1_idx` (`Producto_idProducto`),
  KEY `fk_ProductoPorPedido_Pedido1_idx` (`Pedido_idPedido`),
  CONSTRAINT `fk_ProductoPorPedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedidoonline` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorPedido_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoporpedido`
--

LOCK TABLES `productoporpedido` WRITE;
/*!40000 ALTER TABLE `productoporpedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoporpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruta` (
  `idRuta` int(11) NOT NULL AUTO_INCREMENT,
  `estadoRuta` varchar(20) DEFAULT NULL,
  `fechaRuta` date DEFAULT NULL,
  `Chofer_idChofer` varchar(15) NOT NULL,
  `Empleado_idEmpleado` varchar(15) NOT NULL,
  PRIMARY KEY (`idRuta`),
  KEY `fk_Ruta_Empleado1_idx` (`Empleado_idEmpleado`),
  CONSTRAINT `fk_Ruta_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutaporcliente`
--

DROP TABLE IF EXISTS `rutaporcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rutaporcliente` (
  `idRutaPorPedido` int(11) NOT NULL AUTO_INCREMENT,
  `Ruta_idRuta` int(11) NOT NULL,
  `cliente_idCliente` varchar(25) NOT NULL,
  PRIMARY KEY (`idRutaPorPedido`),
  KEY `fk_RutaPorPedido_Ruta1_idx` (`Ruta_idRuta`),
  KEY `fk_rutaporCliente_cliente1_idx` (`cliente_idCliente`),
  CONSTRAINT `fk_RutaPorPedido_Ruta1` FOREIGN KEY (`Ruta_idRuta`) REFERENCES `ruta` (`idRuta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rutaporCliente_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutaporcliente`
--

LOCK TABLES `rutaporcliente` WRITE;
/*!40000 ALTER TABLE `rutaporcliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `rutaporcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoempleado`
--

DROP TABLE IF EXISTS `tipoempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoempleado` (
  `idTipoEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoempleado`
--

LOCK TABLES `tipoempleado` WRITE;
/*!40000 ALTER TABLE `tipoempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariocliente`
--

DROP TABLE IF EXISTS `usuariocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuariocliente` (
  `idUsuarioCliente` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioCliente` varchar(50) NOT NULL,
  `contrasenaCliente` varchar(50) NOT NULL,
  `cliente_idCliente` varchar(25) NOT NULL,
  PRIMARY KEY (`idUsuarioCliente`),
  KEY `fk_UsuarioCliente_cliente1_idx` (`cliente_idCliente`),
  CONSTRAINT `fk_UsuarioCliente_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariocliente`
--

LOCK TABLES `usuariocliente` WRITE;
/*!40000 ALTER TABLE `usuariocliente` DISABLE KEYS */;
INSERT INTO `usuariocliente` VALUES (1,'lck@gmail.com','fatbaby','1');
/*!40000 ALTER TABLE `usuariocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioempleado`
--

DROP TABLE IF EXISTS `usuarioempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioempleado` (
  `idUsuarioEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(45) DEFAULT NULL,
  `contrasennaUsuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUsuarioEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioempleado`
--

LOCK TABLES `usuarioempleado` WRITE;
/*!40000 ALTER TABLE `usuarioempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarioempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `placaVehiculo` varchar(10) NOT NULL,
  `modeloVehiculo` varchar(25) DEFAULT NULL,
  `annoVehiculo` int(11) DEFAULT NULL,
  PRIMARY KEY (`placaVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculoporempleado`
--

DROP TABLE IF EXISTS `vehiculoporempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculoporempleado` (
  `idVehiculoPorEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` varchar(15) NOT NULL,
  `Vehiculo_placaVehiculo` varchar(10) NOT NULL,
  PRIMARY KEY (`idVehiculoPorEmpleado`),
  KEY `fk_VehiculoPorEmpleado_Empleado1_idx` (`Empleado_idEmpleado`),
  KEY `fk_VehiculoPorEmpleado_Vehiculo1_idx` (`Vehiculo_placaVehiculo`),
  CONSTRAINT `fk_VehiculoPorEmpleado_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VehiculoPorEmpleado_Vehiculo1` FOREIGN KEY (`Vehiculo_placaVehiculo`) REFERENCES `vehiculo` (`placaVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculoporempleado`
--

LOCK TABLES `vehiculoporempleado` WRITE;
/*!40000 ALTER TABLE `vehiculoporempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculoporempleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-18 12:53:49
