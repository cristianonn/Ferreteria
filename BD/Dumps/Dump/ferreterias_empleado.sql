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
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` varchar(15) NOT NULL,
  `nombreEmpleado` varchar(45) DEFAULT NULL,
  `apellidosEmpleado` varchar(45) DEFAULT NULL,
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
INSERT INTO `empleado` VALUES ('15','Adolf','Hitlan','22225658','2016-05-02',1,2),('16','Bladimir','Platin','22336581','2015-05-02',4,2),('17','Oscar ','Areas','22554785','2015-02-10',3,1),('18','Nicholas','Madera','22336698','2014-01-10',4,3),('19','Donald','Wall','22336547','2014-05-06',7,4),('20','Hilary ','Clean','22331058','2015-02-08',6,5),('21','Kanye','East','22154876','2014-10-10',0,3),('22','Miley','Sirope','22635965','2014-10-21',1,3),('23','Homero','Sintian','22015256','2013-11-16',5,5),('24','Petter','Anguila','22635879','2014-09-15',8,5);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-24  0:35:41
