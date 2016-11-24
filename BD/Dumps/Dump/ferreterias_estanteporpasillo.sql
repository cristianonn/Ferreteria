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
-- Table structure for table `estanteporpasillo`
--

DROP TABLE IF EXISTS `estanteporpasillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estanteporpasillo` (
  `idestantePorpasillo` int(11) NOT NULL,
  `estante_idEstante` int(11) NOT NULL,
  `pasilloporferreteria_idpasilloporferreteria` int(11) NOT NULL,
  PRIMARY KEY (`idestantePorpasillo`),
  KEY `fk_estantePorpasillo_estante1_idx` (`estante_idEstante`),
  KEY `fk_estantePorpasillo_pasilloporferreteria1_idx` (`pasilloporferreteria_idpasilloporferreteria`),
  CONSTRAINT `fk_estantePorpasillo_estante1` FOREIGN KEY (`estante_idEstante`) REFERENCES `estante` (`idEstante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estantePorpasillo_pasilloporferreteria1` FOREIGN KEY (`pasilloporferreteria_idpasilloporferreteria`) REFERENCES `pasilloporferreteria` (`idpasilloporferreteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estanteporpasillo`
--

LOCK TABLES `estanteporpasillo` WRITE;
/*!40000 ALTER TABLE `estanteporpasillo` DISABLE KEYS */;
INSERT INTO `estanteporpasillo` VALUES (1,3,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,1,2),(11,2,2),(12,3,2),(13,4,2),(14,5,2),(15,6,2),(16,7,2),(17,8,2),(18,9,2);
/*!40000 ALTER TABLE `estanteporpasillo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-24 17:12:35
