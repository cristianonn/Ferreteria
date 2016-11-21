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
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` varchar(20) NOT NULL,
  `nombreProducto` varchar(40) DEFAULT NULL,
  `precioProducto` float DEFAULT NULL,
  `fotoProducto` varchar(100) DEFAULT NULL,
  `descripcionProducto` varchar(100) DEFAULT NULL,
  `marcaProducto` varchar(25) DEFAULT NULL,
  `aspectosTecnicosProducto` varchar(100) DEFAULT NULL,
  `utilidadProducto` varchar(100) DEFAULT NULL,
  `garantia` int(11) DEFAULT NULL,
  `departamento_idDepartamento` varchar(45) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_producto_departamento1_idx` (`departamento_idDepartamento`),
  CONSTRAINT `fk_producto_departamento1` FOREIGN KEY (`departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('1','calentador magnifico',75000,'calentador.png','calienta agua diay nada mas','sencor','no hace nada mas que calentar agua a 5000 grados centigrados en 5 seg','calienta agua',31,'3'),('10','madera ceramica',17000,'madera1.jpg','piso ceramico con color de madera','leroy','de montado facil y sin pegamento','ser piso',31,'2'),('11','madera ceramica rustica',17000,'madera2.jpg','piso ceramico colo madera simple','leroy','facil de montar y de apariencia simple','ser piso',31,'2'),('12','microondas',35000,'microondas.png','microondas con temporizador de ruedita','sencor','varias potencias y de 110v','calienta rapidamente',62,'3'),('13','adorno planta simple',20000,'planta1.png','adorno de decoracion con castillo adentro de platas','cactus y suculentas','adorna ','adorna',31,'5'),('14','adorno planta diminuto',7500,'planta2.png','adorno diminuto de plantas multicolor','cactus y suculentas','adorna cocinas','adorna',31,'5'),('2','ceramica tipo piedra',10000,'ceramica1.jpg','cuadro de ceramica con apariencia a piedra','sentosa','util para pisos y paredes','embellece la casa',31,'2'),('3','ceramica simple',8500,'ceramica2.png','cuadro de ceramica de colores gris y dorado','sentosa','especial para cocinas y entradas de la casa','emebellece',31,'5'),('4','grifo minimalista',45000,'grifo1.png','grifo con apariencia minimalista de una sola entrada','american ','muy bonito','tira agua y se ve lindo',180,'5'),('5','grifo doble',23000,'grifo2.jpg','con de dos canales en un tubo','american','sencillo y bello','bota agua muy sofisticadamente',180,'3'),('6','grifo cobre ',41000,'grifo3.jpg','grifo para banno especialmente disennado para verse bieny funcionar facilmente','american','bello y junta dos tubos en uno','agua ',365,'3'),('7','horno con discos',26000,'hornito.png','hornito con dos disco encima para una cocina pequenna y completa','oseter','tosta y cocina','cocica muy chivamente',180,'1'),('8','lavado simple metal',30000,'lavado.jpg','lavado sencillo de un hueco','american','superficie deslizante','lavar los platos',365,'1'),('9','lavado amplio plastico',35000,'lavado2.jpg','lavado con area para poner los trstes','american','facil de lavar','lavar platos',365,'1');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-21 15:43:07
