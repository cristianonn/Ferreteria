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
-- Table structure for table `inventarioporferreteria`
--

DROP TABLE IF EXISTS `inventarioporferreteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventarioporferreteria` (
  `idinventarioPorFerreteria` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `producto_idProducto` varchar(20) NOT NULL,
  `ferreteria_idFerreteria` int(11) NOT NULL,
  `estanteporpasillo_idestantePorpasillo` int(11) NOT NULL,
  PRIMARY KEY (`idinventarioPorFerreteria`),
  KEY `fk_inventarioPorFerreteria_producto1_idx` (`producto_idProducto`),
  KEY `fk_inventarioPorFerreteria_ferreteria1_idx` (`ferreteria_idFerreteria`),
  KEY `fk_inventarioporferreteria_estanteporpasillo1_idx` (`estanteporpasillo_idestantePorpasillo`),
  CONSTRAINT `fk_inventarioPorFerreteria_ferreteria1` FOREIGN KEY (`ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarioPorFerreteria_producto1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarioporferreteria_estanteporpasillo1` FOREIGN KEY (`estanteporpasillo_idestantePorpasillo`) REFERENCES `estanteporpasillo` (`idestantePorpasillo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarioporferreteria`
--

LOCK TABLES `inventarioporferreteria` WRITE;
/*!40000 ALTER TABLE `inventarioporferreteria` DISABLE KEYS */;
INSERT INTO `inventarioporferreteria` VALUES (2,17,'1',2,2),(4,20,'2',1,4),(5,21,'2',2,5),(6,20,'2',3,6),(7,7,'3',1,7),(8,8,'3',2,8),(9,6,'3',3,9),(10,9,'4',1,1),(11,8,'4',2,2),(12,7,'4',3,3),(13,4,'5',1,4),(14,5,'5',2,5),(15,6,'5',3,6),(16,9,'6',1,7),(17,8,'6',2,8),(18,7,'6',3,9),(19,4,'7',1,1),(20,5,'7',2,2),(22,9,'8',1,4),(23,8,'8',2,5),(24,5,'8',3,6),(25,4,'9',1,7),(26,7,'9',2,8),(27,8,'9',3,9),(28,5,'10',1,1),(29,4,'10',2,2),(30,5,'10',3,3),(31,8,'11',1,4),(32,7,'11',2,5),(33,4,'11',3,6);
/*!40000 ALTER TABLE `inventarioporferreteria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25  6:31:06
