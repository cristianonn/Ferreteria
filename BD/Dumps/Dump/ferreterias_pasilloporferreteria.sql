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
-- Table structure for table `pasilloporferreteria`
--

DROP TABLE IF EXISTS `pasilloporferreteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasilloporferreteria` (
  `idpasilloporferreteria` int(11) NOT NULL AUTO_INCREMENT,
  `ferreteria_idFerreteria` int(11) NOT NULL,
  `pasillo_idPasillo` int(11) NOT NULL,
  `departamento_idDepartamento` varchar(45) NOT NULL,
  PRIMARY KEY (`idpasilloporferreteria`),
  KEY `fk_pasilloporferreteria_ferreteria1_idx` (`ferreteria_idFerreteria`),
  KEY `fk_pasilloporferreteria_pasillo1_idx` (`pasillo_idPasillo`),
  KEY `fk_pasilloporferreteria_departamento1_idx` (`departamento_idDepartamento`),
  CONSTRAINT `fk_pasilloporferreteria_departamento1` FOREIGN KEY (`departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pasilloporferreteria_ferreteria1` FOREIGN KEY (`ferreteria_idFerreteria`) REFERENCES `ferreteria` (`idFerreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pasilloporferreteria_pasillo1` FOREIGN KEY (`pasillo_idPasillo`) REFERENCES `pasillo` (`idPasillo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasilloporferreteria`
--

LOCK TABLES `pasilloporferreteria` WRITE;
/*!40000 ALTER TABLE `pasilloporferreteria` DISABLE KEYS */;
INSERT INTO `pasilloporferreteria` VALUES (1,1,1,'1'),(2,1,2,'1'),(3,1,3,'2'),(4,1,4,'2'),(5,1,5,'3'),(6,1,6,'3'),(7,1,7,'4'),(8,1,8,'4'),(9,1,9,'5'),(10,2,1,'1'),(11,2,2,'1'),(12,2,3,'2'),(13,2,4,'2'),(14,2,5,'3'),(15,2,6,'3'),(16,2,7,'4'),(17,2,8,'4'),(18,2,9,'5'),(19,3,1,'1'),(20,3,2,'1'),(21,3,3,'2'),(22,3,4,'2'),(23,3,5,'3'),(24,3,6,'3'),(25,3,7,'4'),(26,3,8,'4'),(27,3,9,'5'),(28,4,1,'1'),(29,4,2,'1'),(30,4,3,'2'),(31,4,4,'2'),(32,4,5,'3'),(33,4,6,'3'),(34,4,7,'4'),(35,4,8,'4'),(36,4,9,'5');
/*!40000 ALTER TABLE `pasilloporferreteria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-24  0:35:42
