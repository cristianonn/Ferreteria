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
-- Table structure for table `imagenesproducto`
--

DROP TABLE IF EXISTS `imagenesproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenesproducto` (
  `idimagenesProducto` int(11) NOT NULL AUTO_INCREMENT,
  `imagenProducto` varchar(100) DEFAULT NULL,
  `producto_idProductoImagen` varchar(20) NOT NULL,
  PRIMARY KEY (`idimagenesProducto`),
  KEY `fk_imagenesProducto_producto1_idx` (`producto_idProductoImagen`),
  CONSTRAINT `fk_imagenesProducto_producto1` FOREIGN KEY (`producto_idProductoImagen`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenesproducto`
--

LOCK TABLES `imagenesproducto` WRITE;
/*!40000 ALTER TABLE `imagenesproducto` DISABLE KEYS */;
INSERT INTO `imagenesproducto` VALUES (1,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\calentador.png','1'),(14,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\ceramica1.jpg','2'),(15,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\ceramica2.png','3'),(16,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\grifo1.png','4'),(17,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\grifo2.jpg','5'),(18,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\grifo3.jpg','6'),(19,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\hotnito.png','7'),(20,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\lavado2.jpg','8'),(21,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\lavado2.jpg','9'),(22,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\madera1.jpg','10'),(23,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\madera2.jpg','11'),(24,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\microondas.png','12'),(25,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\planta2.png','14'),(26,'C:\\wamp64\\www\\Ferreteria\\BD\\Images\\\\planta1','13');
/*!40000 ALTER TABLE `imagenesproducto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25  3:48:33
