-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ferreterias
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `productoporestante`
--

DROP TABLE IF EXISTS `productoporestante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productoporestante` (
  `idproductoPorEstante` int(11) NOT NULL AUTO_INCREMENT,
  `producto_idProductoEnEstante` varchar(20) NOT NULL,
  `estantePorpasillo_idestantePorpasillo` int(11) NOT NULL,
  `posicion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproductoPorEstante`),
  KEY `fk_productoPorEstante_producto1_idx` (`producto_idProductoEnEstante`),
  KEY `fk_productoPorEstante_estantePorpasillo1_idx` (`estantePorpasillo_idestantePorpasillo`),
  CONSTRAINT `fk_productoPorEstante_estantePorpasillo1` FOREIGN KEY (`estantePorpasillo_idestantePorpasillo`) REFERENCES `estanteporpasillo` (`idestantePorpasillo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoPorEstante_producto1` FOREIGN KEY (`producto_idProductoEnEstante`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoporestante`
--

LOCK TABLES `productoporestante` WRITE;
/*!40000 ALTER TABLE `productoporestante` DISABLE KEYS */;
INSERT INTO `productoporestante` VALUES (11,'1',1,1);
/*!40000 ALTER TABLE `productoporestante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-24 17:12:33
