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
  `Ferreteria_idFerreteria` varchar(45) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Cliente1_idx` (`Cliente_idCliente`),
  KEY `fk_Pedido_Ferreteria1_idx` (`Ferreteria_idFerreteria`),
  CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Ferreteria1` FOREIGN KEY (`Ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoonline`
--

LOCK TABLES `pedidoonline` WRITE;
/*!40000 ALTER TABLE `pedidoonline` DISABLE KEYS */;
INSERT INTO `pedidoonline` VALUES (5,'2016-11-19',5000,'entregado','1','1'),(6,'2016-11-19',3600,'pendiente','2','1');
/*!40000 ALTER TABLE `pedidoonline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-20 19:50:02
