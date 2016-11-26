CREATE DATABASE  IF NOT EXISTS `ferreterias` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ferreterias`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amonestacion`
--

LOCK TABLES `amonestacion` WRITE;
/*!40000 ALTER TABLE `amonestacion` DISABLE KEYS */;
INSERT INTO `amonestacion` VALUES (4,'llegadas tardias','2015-05-02','15'),(5,'ofenza a un cliente','2016-02-06','16');
/*!40000 ALTER TABLE `amonestacion` ENABLE KEYS */;
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
INSERT INTO `cliente` VALUES ('1','Louis','CK','88888888','lck@gmail.com'),('2','Carlos','VH','89652145','CVH@gmail.com'),('3','bo burnham','BU','88695425','BBU@hotmail.com'),('4','Andres','LL','88663321','ALL@gmail.com');
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
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES ('1','Cocina'),('2','Pisos'),('3','Grifos'),('4','Maderas'),('5','Hogar');
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
  `nombreEmpleado` varchar(100) DEFAULT NULL,
  `apellidosEmpleado` varchar(100) DEFAULT NULL,
  `telEmpleado` varchar(15) DEFAULT NULL,
  `fechaEntrada` date DEFAULT NULL,
  `vacacionesEmpleado` int(11) DEFAULT NULL,
  `TipoEmpleado_idTipoEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `fk_empleado_TipoEmpleado1_idx` (`TipoEmpleado_idTipoEmpleado`),
  CONSTRAINT `fk_empleado_TipoEmpleado1` FOREIGN KEY (`TipoEmpleado_idTipoEmpleado`) REFERENCES `tipoempleado` (`idTipoEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('15','Adolf','Hitlan','22225658','2016-05-02',1,2),('16','Bladimir','Platin','22336581','2015-05-02',4,2),('17','Oscar ','Areas','22554785','2015-02-10',3,1),('18','Nicholas','Madera','22336698','2014-01-10',4,3),('19','Donald','Wall','22336547','2014-05-06',7,4),('20','Hilary ','Clean','22331058','2015-02-08',6,5),('21','Kanye','East','22154876','2014-10-10',0,3),('22','Miley','Sirope','22635965','2014-10-21',1,3),('23','Homero','Sintian','22015256','2013-11-16',5,5),('24','Petter','Anguila','22635879','2014-09-15',8,5),('702450895','Marito','Mortadela','60881086','2016-11-25',0,2),('702470727','Evo','Morales','85645512','2016-11-25',0,5);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estante`
--

DROP TABLE IF EXISTS `estante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estante` (
  `idEstante` int(11) NOT NULL AUTO_INCREMENT,
  `numeroEstante` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEstante`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estante`
--

LOCK TABLES `estante` WRITE;
/*!40000 ALTER TABLE `estante` DISABLE KEYS */;
INSERT INTO `estante` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9);
/*!40000 ALTER TABLE `estante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estanteporpasillo`
--

DROP TABLE IF EXISTS `estanteporpasillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estanteporpasillo` (
  `idestantePorpasillo` int(11) NOT NULL,
  `estante_idEstante` int(11) NOT NULL,
  `pasillo_idPasillo` int(11) NOT NULL,
  PRIMARY KEY (`idestantePorpasillo`),
  KEY `fk_estantePorpasillo_estante1_idx` (`estante_idEstante`),
  KEY `fk_estanteporpasillo_pasillo1_idx` (`pasillo_idPasillo`),
  CONSTRAINT `fk_estantePorpasillo_estante1` FOREIGN KEY (`estante_idEstante`) REFERENCES `estante` (`idEstante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estanteporpasillo_pasillo1` FOREIGN KEY (`pasillo_idPasillo`) REFERENCES `pasillo` (`idPasillo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estanteporpasillo`
--

LOCK TABLES `estanteporpasillo` WRITE;
/*!40000 ALTER TABLE `estanteporpasillo` DISABLE KEYS */;
INSERT INTO `estanteporpasillo` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,1,9),(11,2,8),(12,3,7),(13,4,6),(14,5,4),(15,6,5),(16,7,3),(17,8,2),(18,9,1);
/*!40000 ALTER TABLE `estanteporpasillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ferreteria`
--

DROP TABLE IF EXISTS `ferreteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ferreteria` (
  `idFerreteria` int(11) NOT NULL,
  `nombreFerreteria` varchar(45) DEFAULT NULL,
  `telefonoFerreteria` varchar(45) DEFAULT NULL,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  PRIMARY KEY (`idFerreteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ferreteria`
--

LOCK TABLES `ferreteria` WRITE;
/*!40000 ALTER TABLE `ferreteria` DISABLE KEYS */;
INSERT INTO `ferreteria` VALUES (1,'Hermanos clavo','22225236',NULL,NULL),(2,'Tornillos mil','22229658',NULL,NULL),(3,'Constru bien','22221536',NULL,NULL),(4,'Cementico','22220125',NULL,NULL);
/*!40000 ALTER TABLE `ferreteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenesproducto`
--

DROP TABLE IF EXISTS `imagenesproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenesproducto` (
  `idimagenesProducto` int(11) NOT NULL AUTO_INCREMENT,
  `imagenProducto` varchar(100) DEFAULT NULL,
  `producto_idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idimagenesProducto`),
  KEY `fk_imagenesProducto_producto1_idx` (`producto_idProducto`),
  CONSTRAINT `fk_imagenesProducto_producto1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenesproducto`
--

LOCK TABLES `imagenesproducto` WRITE;
/*!40000 ALTER TABLE `imagenesproducto` DISABLE KEYS */;
INSERT INTO `imagenesproducto` VALUES (1,'calentador.png',1),(14,'ceramica1.jpg',2),(15,'ceramica2.png',3),(16,'grifo1.png',4),(17,'grifo2.jpg',5),(18,'grifo3.jpg',6),(19,'hornito.png',7),(20,'lavado2.jpg',8),(21,'lavado2.jpg',9),(22,'madera1.jpg',10),(23,'madera2.jpg',11),(24,'microondas.png',12),(25,'planta2.png',13),(26,'planta1.png',14);
/*!40000 ALTER TABLE `imagenesproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarioporferreteria`
--

DROP TABLE IF EXISTS `inventarioporferreteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventarioporferreteria` (
  `idinventarioPorFerreteria` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `producto_idProducto` int(11) NOT NULL,
  `ferreteria_idFerreteria` int(11) NOT NULL,
  `estanteporpasillo_idestantePorpasillo` int(11) NOT NULL,
  PRIMARY KEY (`idinventarioPorFerreteria`),
  KEY `fk_inventarioPorFerreteria_producto1_idx` (`producto_idProducto`),
  KEY `fk_inventarioPorFerreteria_ferreteria1_idx` (`ferreteria_idFerreteria`),
  KEY `fk_inventarioporferreteria_estanteporpasillo1_idx` (`estanteporpasillo_idestantePorpasillo`),
  CONSTRAINT `fk_inventarioPorFerreteria_ferreteria1` FOREIGN KEY (`ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarioPorFerreteria_producto1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarioporferreteria_estanteporpasillo1` FOREIGN KEY (`estanteporpasillo_idestantePorpasillo`) REFERENCES `estanteporpasillo` (`idestantePorpasillo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarioporferreteria`
--

LOCK TABLES `inventarioporferreteria` WRITE;
/*!40000 ALTER TABLE `inventarioporferreteria` DISABLE KEYS */;
INSERT INTO `inventarioporferreteria` VALUES (2,17,1,2,2),(4,20,2,1,4),(5,21,2,2,5),(6,20,2,3,6),(7,7,3,1,7),(8,8,3,2,8),(9,6,3,3,9),(10,9,4,1,1),(11,8,4,2,2),(12,7,4,3,3),(13,4,5,1,4),(14,5,5,2,5),(15,6,5,3,6),(16,9,6,1,7),(17,8,6,2,8),(18,7,6,3,9),(19,4,7,1,1),(20,5,7,2,2),(22,9,8,1,4),(23,8,8,2,5),(24,5,8,3,6),(25,4,9,1,7),(26,7,9,2,8),(27,8,9,3,9),(28,5,10,1,1),(29,4,10,2,2),(30,5,10,3,3),(31,8,11,1,4),(32,7,11,2,5),(33,4,11,3,6),(34,27,1,1,5);
/*!40000 ALTER TABLE `inventarioporferreteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMarca` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (0,'mamco'),(2,'sony'),(3,'senaza'),(4,'pinta'),(5,'pana'),(6,'pani');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasillo`
--

DROP TABLE IF EXISTS `pasillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasillo` (
  `idPasillo` int(11) NOT NULL AUTO_INCREMENT,
  `numeroPasillo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPasillo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasillo`
--

LOCK TABLES `pasillo` WRITE;
/*!40000 ALTER TABLE `pasillo` DISABLE KEYS */;
INSERT INTO `pasillo` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9);
/*!40000 ALTER TABLE `pasillo` ENABLE KEYS */;
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
  `ferreteria_idFerreteria` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Cliente1_idx` (`Cliente_idCliente`),
  KEY `fk_pedidoonline_ferreteria1_idx` (`ferreteria_idFerreteria`),
  CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoonline_ferreteria1` FOREIGN KEY (`ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoonline`
--

LOCK TABLES `pedidoonline` WRITE;
/*!40000 ALTER TABLE `pedidoonline` DISABLE KEYS */;
INSERT INTO `pedidoonline` VALUES (5,'2016-11-19',5000,'entregado','1',1),(6,'2016-11-19',3600,'pendiente','2',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premio`
--

LOCK TABLES `premio` WRITE;
/*!40000 ALTER TABLE `premio` DISABLE KEYS */;
INSERT INTO `premio` VALUES (1,'100 mil efectivo'),(2,'tostadora'),(3,'carro del anno'),(4,'3 dias vacaciones');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premioporempleado`
--

LOCK TABLES `premioporempleado` WRITE;
/*!40000 ALTER TABLE `premioporempleado` DISABLE KEYS */;
INSERT INTO `premioporempleado` VALUES (1,'2015-05-14',1,'15'),(2,'2016-07-12',1,'16');
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
  `Ferreteria_idFerreteria` int(11) NOT NULL,
  PRIMARY KEY (`idPremioPorFerreteria`),
  KEY `fk_PremioPorFerreteria_Premio1_idx` (`Premio_idPremio`),
  KEY `fk_PremioPorFerreteria_Ferreteria1_idx` (`Ferreteria_idFerreteria`),
  CONSTRAINT `fk_PremioPorFerreteria_Ferreteria1` FOREIGN KEY (`Ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PremioPorFerreteria_Premio1` FOREIGN KEY (`Premio_idPremio`) REFERENCES `premio` (`idPremio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premioporferreteria`
--

LOCK TABLES `premioporferreteria` WRITE;
/*!40000 ALTER TABLE `premioporferreteria` DISABLE KEYS */;
INSERT INTO `premioporferreteria` VALUES (1,'2015-05-08',4,1),(2,'2016-05-08',4,2);
/*!40000 ALTER TABLE `premioporferreteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(40) DEFAULT NULL,
  `precioProducto` float DEFAULT NULL,
  `descripcionProducto` varchar(100) DEFAULT NULL,
  `aspectosTecnicosProducto` varchar(100) DEFAULT NULL,
  `utilidadProducto` varchar(100) DEFAULT NULL,
  `garantia` int(11) DEFAULT NULL,
  `departamento_idDepartamento` varchar(45) NOT NULL,
  `Marca_idMarca` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_producto_departamento1_idx` (`departamento_idDepartamento`),
  KEY `fk_producto_Marca1_idx` (`Marca_idMarca`),
  CONSTRAINT `fk_producto_Marca1` FOREIGN KEY (`Marca_idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_departamento1` FOREIGN KEY (`departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'calentador magnifico',75000,'calienta agua diay nada mas','no hace nada mas que calentar agua a 5000 grados centigrados en 5 seg','calienta agua',31,'3',0),(2,'ceramica tipo piedra',10000,'cuadro de ceramica con apariencia a piedra','util para pisos y paredes','embellece la casa',31,'2',0),(3,'ceramica simple',8500,'cuadro de ceramica de colores gris y dorado','especial para cocinas y entradas de la casa','emebellece',31,'5',0),(4,'grifo minimalista',45000,'grifo con apariencia minimalista de una sola entrada','muy bonito','tira agua y se ve lindo',180,'5',0),(5,'grifo doble',23000,'con de dos canales en un tubo','sencillo y bello','bota agua muy sofisticadamente',180,'3',0),(6,'grifo cobre ',41000,'grifo para banno especialmente disennado para verse bieny funcionar facilmente','bello y junta dos tubos en uno','agua ',365,'3',0),(7,'horno con discos',26000,'hornito con dos disco encima para una cocina pequenna y completa','tosta y cocina','cocica muy chivamente',180,'1',0),(8,'lavado simple metal',30000,'lavado sencillo de un hueco','superficie deslizante','lavar los platos',365,'1',0),(9,'lavado amplio plastico',35000,'lavado con area para poner los trstes','facil de lavar','lavar platos',365,'1',0),(10,'madera ceramica',17000,'piso ceramico con color de madera','de montado facil y sin pegamento','ser piso',31,'2',0),(11,'madera ceramica rustica',17000,'piso ceramico colo madera simple','facil de montar y de apariencia simple','ser piso',31,'2',0),(12,'microondas',35000,'microondas con temporizador de ruedita','varias potencias y de 110v','calienta rapidamente',62,'3',0),(13,'adorno planta simple',20000,'adorno de decoracion con castillo adentro de platas','adorna ','adorna',31,'5',0),(14,'adorno planta diminuto',7500,'adorno diminuto de plantas multicolor','adorna cocinas','adorna',31,'5',0);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productoporbackorder`
--

DROP TABLE IF EXISTS `productoporbackorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productoporbackorder` (
  `idProductoPorBackOrder` int(11) NOT NULL AUTO_INCREMENT,
  `ferreteria_idFerreteria` int(11) NOT NULL,
  `producto_idProducto` int(11) NOT NULL,
  `cliente_idCliente` varchar(25) NOT NULL,
  PRIMARY KEY (`idProductoPorBackOrder`),
  KEY `fk_productoporbackorder_ferreteria1_idx` (`ferreteria_idFerreteria`),
  KEY `fk_productoporbackorder_producto1_idx` (`producto_idProducto`),
  KEY `fk_productoporbackorder_cliente1_idx` (`cliente_idCliente`),
  CONSTRAINT `fk_productoporbackorder_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporbackorder_ferreteria1` FOREIGN KEY (`ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporbackorder_producto1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoporbackorder`
--

LOCK TABLES `productoporbackorder` WRITE;
/*!40000 ALTER TABLE `productoporbackorder` DISABLE KEYS */;
INSERT INTO `productoporbackorder` VALUES (1,2,8,'1'),(2,3,9,'1');
/*!40000 ALTER TABLE `productoporbackorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productoporcarrito`
--

DROP TABLE IF EXISTS `productoporcarrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productoporcarrito` (
  `idProductoPorCarrito` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_idCliente` varchar(25) NOT NULL,
  `inventarioporferreteria_idinventarioPorFerreteria` int(11) NOT NULL,
  PRIMARY KEY (`idProductoPorCarrito`),
  KEY `fk_productoporcarrito_cliente1_idx` (`cliente_idCliente`),
  KEY `fk_productoporcarrito_inventarioporferreteria1_idx` (`inventarioporferreteria_idinventarioPorFerreteria`),
  CONSTRAINT `fk_productoporcarrito_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporcarrito_inventarioporferreteria1` FOREIGN KEY (`inventarioporferreteria_idinventarioPorFerreteria`) REFERENCES `inventarioporferreteria` (`idinventarioPorFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoporcarrito`
--

LOCK TABLES `productoporcarrito` WRITE;
/*!40000 ALTER TABLE `productoporcarrito` DISABLE KEYS */;
INSERT INTO `productoporcarrito` VALUES (1,'1',7),(2,'1',13),(3,'1',22),(5,'2',10),(7,'1',34),(8,'1',8),(9,'1',6),(10,'1',11),(13,'1',27),(14,'2',27),(15,'1',12);
/*!40000 ALTER TABLE `productoporcarrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productoporpedido`
--

DROP TABLE IF EXISTS `productoporpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productoporpedido` (
  `idProductoPorPedido` int(11) NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` int(11) NOT NULL,
  `Pedido_idPedido` int(11) NOT NULL,
  `vistoBueno` tinyint(1) DEFAULT NULL,
  `ferreteria_idFerreteria` int(11) NOT NULL,
  PRIMARY KEY (`idProductoPorPedido`),
  KEY `fk_ProductoPorPedido_Producto1_idx` (`Producto_idProducto`),
  KEY `fk_ProductoPorPedido_Pedido1_idx` (`Pedido_idPedido`),
  KEY `fk_productoporpedido_ferreteria1_idx` (`ferreteria_idFerreteria`),
  CONSTRAINT `fk_ProductoPorPedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedidoonline` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorPedido_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporpedido_ferreteria1` FOREIGN KEY (`ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoporpedido`
--

LOCK TABLES `productoporpedido` WRITE;
/*!40000 ALTER TABLE `productoporpedido` DISABLE KEYS */;
INSERT INTO `productoporpedido` VALUES (18,1,5,0,1),(19,2,5,0,1),(20,3,5,0,1);
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
  `Empleado_idEmpleado` varchar(15) NOT NULL,
  PRIMARY KEY (`idRuta`),
  KEY `fk_Ruta_Empleado1_idx` (`Empleado_idEmpleado`),
  CONSTRAINT `fk_Ruta_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (1,'en espera','2016-11-20','23'),(2,'en espera','2016-11-25','24');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutaporcliente`
--

LOCK TABLES `rutaporcliente` WRITE;
/*!40000 ALTER TABLE `rutaporcliente` DISABLE KEYS */;
INSERT INTO `rutaporcliente` VALUES (1,1,'1'),(2,1,'2'),(3,1,'3');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoempleado`
--

LOCK TABLES `tipoempleado` WRITE;
/*!40000 ALTER TABLE `tipoempleado` DISABLE KEYS */;
INSERT INTO `tipoempleado` VALUES (1,'Admin'),(2,'Cajero'),(3,'Experto'),(4,'Chat'),(5,'Chofer');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariocliente`
--

LOCK TABLES `usuariocliente` WRITE;
/*!40000 ALTER TABLE `usuariocliente` DISABLE KEYS */;
INSERT INTO `usuariocliente` VALUES (1,'lck@gmail.com','fatbaby','1'),(2,'CVH@gmail.com','12345','2'),(3,'BBU@hotmail.com','12345','3'),(4,'ALL@gmail.com','12345','4');
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
  `empleado_idEmpleado` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuarioEmpleado`),
  KEY `idEmpleado_idx` (`empleado_idEmpleado`),
  CONSTRAINT `idEmpleado` FOREIGN KEY (`empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioempleado`
--

LOCK TABLES `usuarioempleado` WRITE;
/*!40000 ALTER TABLE `usuarioempleado` DISABLE KEYS */;
INSERT INTO `usuarioempleado` VALUES (1,'AHH@gmail.com','nein','15'),(2,'OAS@gmail.com','peace','17'),(3,'NMM@gmail.com','lol','18'),(4,'DTW@gmail.com','blonde','19'),(5,'HCC@gmail.com','woow','20');
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
INSERT INTO `vehiculo` VALUES ('2325','nisan',2011),('5498','suzuki',2017),('6548','mazda ',2015),('8765','toyota',2014),('98465','mitsubishi',2010);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculoporempleado`
--

LOCK TABLES `vehiculoporempleado` WRITE;
/*!40000 ALTER TABLE `vehiculoporempleado` DISABLE KEYS */;
INSERT INTO `vehiculoporempleado` VALUES (1,'20','2325'),(2,'23','5498'),(3,'24','6548');
/*!40000 ALTER TABLE `vehiculoporempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ferreterias'
--

--
-- Dumping routines for database 'ferreterias'
--
/*!50003 DROP PROCEDURE IF EXISTS `agregarABackOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarACarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarACarrito`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
BEGIN
	INSERT INTO `ferreterias`.`productoporcarrito`
		(`inventarioporferreteria_idinventarioPorFerreteria`,
		`cliente_idCliente`)
		SELECT idInventarioPorFerreteria, cId FROM InventarioPorFerreteria
			WHERE Producto_idProducto = pId
            AND Ferreteria_idFerreteria = fId 
           	LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarLineaInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarLineaInventario`(in pidProducto INT, IN pidFerreteria INT)
BEGIN
	DELETE FROM `ferreterias`.`inventarioporferreteria`
	WHERE Producto_idProducto = pidProducto
	AND ferreteria_idFerreteria = pidFerreteria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estaEnBackOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnBackOrder`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
BEGIN
	select COUNT(Producto_idProducto) as cantidad
	from ProductoPorBackOrder
    where Producto_idProducto = pId
    AND ferreteria_idFerreteria = fId
    AND cliente_idCliente = cId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estaEnCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnCarrito`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
BEGIN
	select COUNT(Producto_idProducto) as cantidad
	from ProductoPorCarrito, InventarioPorFerreteria
    where idInventarioPorFerreteria = inventarioporferreteria_idinventarioPorFerreteria
    AND InventarioPorFerreteria.ferreteria_idFerreteria = fId
    AND InventarioPorFerreteria.Producto_idProducto = pId
    AND cliente_idCliente = cId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCantidadBackOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCantidadBackOrder`(in userid INT)
BEGIN
select  count(p.Producto_idProducto) as cantidad
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join productoporbackorder p
on p.Cliente_idCliente = c.idCliente
where u.idusuarioCliente = userid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCantidadCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCantidadCarrito`(in userid INT)
BEGIN
SELECT COUNT(idProductoPorCarrito) AS cantidad
FROM ProductoPorCarrito, cliente, usuariocliente
WHERE UsuarioCliente.cliente_idCliente = userid
AND UsuarioCliente.cliente_idCliente = idCliente
AND ProductoPorCarrito.Cliente_idCliente = idCliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCarrito`(in username varchar(50))
BEGIN
select  p.Producto_idProducto
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join productoporcarrito p
on p.Cliente_idCliente = c.idCliente
where u.usuarioCliente = username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEmpleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmpleados`()
BEGIN
	Select * FROM empleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFerreterias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFerreterias`()
BEGIN
SELECT * FROM Ferreteria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProductoEnFerreteria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductos`()
BEGIN
	SELECT idProducto, nombreProducto, precioProducto, descripcionProducto,
	garantia, nombreDepartamento, nombreMarca
	FROM Producto, Departamento, Marca 
	WHERE departamento_idDepartamento = idDepartamento
	AND Marca_idMarca = idMarca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTipoEmpleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTipoEmpleados`()
BEGIN
	Select * from tipoempleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(in username varchar(50))
BEGIN
select u.idUsuarioCliente AS userID , c.nombreCliente AS nombreCliente, 
c.apellidosCliente AS apellidosCliente, u.usuarioCliente AS usuariocliente, 
u.contrasenaCliente AS contrasenaCliente
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente 
where u.usuarioCliente = username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsuarioEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsuarioEmpleado`(in username varchar(50))
BEGIN
select u.idUsuarioEmpleado AS userID , e.nombreEmpleado AS nombreEmpleado, 
e.apellidosEmpleado AS apellidosEmpleado, u.nombreusuario AS usuarioEmpleado, 
u.contrasennaUsuario AS contrasenaEmpleado
from empleado e 
join usuarioEmpleado u
on u.empleado_idempleado = e.idEmpleado 
where u.nombreUsuario = username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productosbackorder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productosCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `seleccionar6Random` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionar6Random`()
BEGIN
 select idProducto, nombreProducto, descripcionProducto, precioProducto, 
 imagenProducto AS fotoProducto 
 FROM Producto, imagenesProducto
 WHERE idProducto = producto_idproducto
 ORDER BY RAND()
 LIMIT 6;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `seleccionarFerreteria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarFerreteria`()
BEGIN
	select * from ferrteria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `seleccionarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProducto`(
IN pId INT,
IN pFerreteria VARCHAR(45)
)
BEGIN
	select p.idProducto, p.nombreProducto, p.precioProducto, p.descripcionProducto,i.cantidad from Producto p
    JOIN inventarioporferreteria i
    ON producto_idProducto = pId
    where pId = p.idProducto AND i.ferreteria_idFerreteria = pFerreteria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `seleccionarProductosPorFerreteria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `seleccionarTodosProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarTodosProductos`()
BEGIN
 select * from Producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-26  6:51:15
