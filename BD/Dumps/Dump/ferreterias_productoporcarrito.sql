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
-- Table structure for table `productoporcarrito`
--

DROP TABLE IF EXISTS `productoporcarrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productoporcarrito` (
  `idProductoPorCarrito` int(11) NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` varchar(20) NOT NULL,
  `carrito_idcarrito` int(11) NOT NULL,
  `ferreteria_idFerreteria` varchar(45) NOT NULL,
  PRIMARY KEY (`idProductoPorCarrito`),
  KEY `fk_ProductoPorCarrito_Producto1_idx` (`Producto_idProducto`),
  KEY `fk_ProductoPorCarrito_carrito1_idx` (`carrito_idcarrito`),
  KEY `fk_productoporcarrito_ferreteria1_idx` (`ferreteria_idFerreteria`),
  CONSTRAINT `fk_ProductoPorCarrito_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductoPorCarrito_carrito1` FOREIGN KEY (`carrito_idcarrito`) REFERENCES `carrito` (`idcarrito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporcarrito_ferreteria1` FOREIGN KEY (`ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoporcarrito`
--

LOCK TABLES `productoporcarrito` WRITE;
/*!40000 ALTER TABLE `productoporcarrito` DISABLE KEYS */;
INSERT INTO `productoporcarrito` VALUES (1,'2',1,''),(2,'5',1,''),(3,'8',1,''),(4,'12',2,''),(5,'4',2,'');
/*!40000 ALTER TABLE `productoporcarrito` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-21  0:50:07
