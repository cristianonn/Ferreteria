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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estante`
--

LOCK TABLES `estante` WRITE;
/*!40000 ALTER TABLE `estante` DISABLE KEYS */;
INSERT INTO `estante` VALUES (1,'1',1),(2,'2',1),(3,'3',1),(4,'4',1),(5,'1',2),(6,'2',2),(7,'3',2),(8,'1',3),(9,'2',3),(10,'3',3),(12,'1',4),(13,'2',4),(14,'3',4),(15,'1',5),(16,'2',5),(17,'3',5),(18,'1',6),(19,'2',6),(20,'3',6),(21,'1',7),(22,'2',7),(23,'3',7),(24,'1',8),(25,'2',8),(26,'3',8),(27,'1',9),(28,'2',9),(29,'3',9),(30,'1',10),(31,'2',10),(32,'3',10),(33,'1',11),(34,'2',11),(35,'3',11),(36,'1',12),(37,'2',12),(38,'3',12),(39,'1',13),(40,'2',13),(41,'3',13),(42,'1',14),(43,'2',14),(44,'3',14);
/*!40000 ALTER TABLE `estante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-19 20:09:47
