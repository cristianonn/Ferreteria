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
-- Table structure for table `productoporbackorder`
--

DROP TABLE IF EXISTS `productoporbackorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productoporbackorder` (
  `idProductoPorBackOrder` int(11) NOT NULL AUTO_INCREMENT,
  `ferreteria_idFerreteria` int(11) NOT NULL,
  `producto_idProducto` varchar(20) NOT NULL,
  `cliente_idCliente` varchar(25) NOT NULL,
  PRIMARY KEY (`idProductoPorBackOrder`),
  KEY `fk_productoporbackorder_ferreteria1_idx` (`ferreteria_idFerreteria`),
  KEY `fk_productoporbackorder_producto1_idx` (`producto_idProducto`),
  KEY `fk_productoporbackorder_cliente1_idx` (`cliente_idCliente`),
  CONSTRAINT `fk_productoporbackorder_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporbackorder_ferreteria1` FOREIGN KEY (`ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productoporbackorder_producto1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoporbackorder`
--

LOCK TABLES `productoporbackorder` WRITE;
/*!40000 ALTER TABLE `productoporbackorder` DISABLE KEYS */;
INSERT INTO `productoporbackorder` VALUES (1,2,'8','1');
/*!40000 ALTER TABLE `productoporbackorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25  3:48:32
