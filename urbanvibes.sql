-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: urbanvibes
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `dni` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Aquarius','juanaqua20@hotmail.es','123456','Madrid'),(2,'Marcos','Gonzalez','marcutigon@gmial.com','$2y$10$3mifWnxPUrFIHuLRLRW7suLVomxDYf2rnDhcWxEypogNdA5CuhT.K','Jaen'),(3,'Manolo','Rio','manolo@gmail.com','$2y$10$wBr6Ms7HCA44iIGIvc3eYOWRbfqNBdU8O9Jbh2g1/q9sjxC/3iCSa','Madrid'),(4,'Miguel','Gonzalez','miguel@gmail.com','$2y$10$KfuUXSJ4vIfgKyAVlHryzO31iHs4pRJJ8yglzsEvqPpX1/.642ize','Fuenlabrada'),(5,'Ana','ana','ana.ana@gmail.com','$2y$10$EDGUYwR0cs3TF9OxPbuoMO9dtkOQsY1ZmHCMrL/dwtjgObmoNaEKu','Madrid'),(6,'Marcos','Gonzalez','marcos@gmail.com','$2y$12$LFhlsT13XkiF5tmh0Abn1OOHuLAeibLWAkbK9hAz37D0KHT2SyWne','Madrid'),(9,'Maria','berrocal','mariaberro@hotmail.com','$2y$10$.h0V5CUHsjZn4O/R4mFr4.Z1KV2d7vxMWKh7HyGyxPsaxmYOZM.yu','Barcelona'),(10,'Pablo','Jose','pablo@outlook.es','$2y$10$wJaxEf8wmUNPj7DWdvKUNOu4xBhBags9oT13pZBKc.Ucg.JZefznq','MADRID');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `dni` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `seccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Ismael','Garcia Martinez','123654789','ismael.garcia@gmail.com','123456','editor'),(2,'Marcos','Gonzalez Sanchez','951258357','marcos.gonzalez@gmail.com','123456','editor');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `dni_cliente` int NOT NULL,
  `codigo` int NOT NULL,
  `numero_productos` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `dni_cliente` (`dni_cliente`),
  KEY `codigo` (`codigo`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`dni_cliente`) REFERENCES `clientes` (`dni`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`codigo`) REFERENCES `productos` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (2,6,1,1),(3,3,1,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `talla` varchar(20) DEFAULT NULL,
  `precio` int NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'camiseta','S',40,'Adidas','Camiseta Negra con Rayas de Colores'),(2,'camiseta','S',40,'Adidas','Camiseta Azul Original'),(3,'camiseta','S',20,'Adidas','Camiseta simple Negra'),(4,'camiseta','S',20,'Adidas','Camiseta de entrenamiento Blanca'),(5,'camiseta','M',35,'Adidas','Camiseta de vestir Gris'),(6,'camiseta','M',40,'Adidas','Camiseta de entrenamiento negra'),(7,'camiseta','M',35,'Adidas','Camiseta de entrenamiento verde'),(8,'camiseta','M',50,'Adidas','Camiseta de entrenamiento edicion especial'),(9,'camiseta','L',30,'Adidas','Camiseta de entrenamiento gris'),(10,'camiseta','L',50,'Adidas','Camiseta de entrenamiento'),(11,'camiseta','L',35,'Adidas','Camiseta original Adidas Verde'),(12,'camiseta','L',60,'Adidas','Camiseta Delafuente x MDLR'),(13,'camiseta','S',50,'Jordan','Camiseta Negra, logo grande'),(14,'camiseta','S',55,'Jordan','Camiseta Jordan Logo blanco'),(15,'camiseta','S',35,'Jordan','Camiseta Jordan Gris'),(16,'camiseta','S',40,'Jordan','Camiseta Negra Flight'),(17,'camiseta','M',50,'Jordan','Camiseta Negra AIR'),(18,'camiseta','M',50,'Jordan','Camiseta Roja logo grande'),(19,'camiseta','M',45,'Jordan','Camiseta Tirantes Blanca'),(20,'camiseta','M',60,'Jordan','Camiseta Negra logo Beisbol'),(21,'camiseta','L',50,'Jordan','Camiseta azul marino simple'),(22,'camiseta','L',50,'Jordan','Camiseta Nike x Jordan Blanco'),(23,'camiseta','L',45,'Jordan','Camiseta Negra Mujer'),(24,'camiseta','L',40,'Jordan','Camiseta Marrón Oversize'),(25,'camiseta','M',50,'Lacoste','Camiseta blanca logo grande'),(26,'camiseta','M',50,'Lacoste','Camiseta azul marino mujer'),(27,'camiseta','M',55,'Lacoste','Camiseta negra logo azul'),(28,'camiseta','M',40,'Lacoste','Polo verde original'),(29,'camiseta','M',65,'Lacoste','Camiseta blanca logo letras'),(30,'camiseta','M',50,'Lacoste','Camiseta blanca simple'),(31,'camiseta','M',55,'Lacoste','Camiseta rayas azules'),(32,'camiseta','M',60,'Lacoste','Camiseta gris raya blanca'),(33,'camiseta','M',60,'Lacoste','Camiseta mujer oversize beige'),(34,'camiseta','M',50,'Lacoste','Camiseta mujer rosa'),(35,'camiseta','M',55,'Lacoste','Camiseta gris logo'),(36,'camiseta','M',60,'Lacoste','Camiseta azul logo'),(37,'camiseta','M',30,'Nike','Camiseta Just Do IT blanca'),(38,'camiseta','M',40,'Nike','Camiseta negra original'),(39,'camiseta','M',35,'Nike','Camiseta beige edicion playa'),(40,'camiseta','M',50,'Nike','Camiseta oversize gris'),(41,'camiseta','M',30,'Nike','Camiseta logo grande blanca'),(42,'camiseta','M',40,'Nike','Camiseta negra original'),(43,'camiseta','M',45,'Nike','Camiseta rosa mujer'),(44,'camiseta','M',40,'Nike','Camiseta blanca mujer'),(45,'camiseta','M',40,'Nike','Camiseta Just do IT hombre'),(46,'camiseta','M',50,'Nike','Camiseta edición china begie'),(47,'camiseta','M',35,'Nike','Camiseta gris mini logo'),(48,'camiseta','M',50,'Nike','Camiseta Nike x Air'),(49,'camiseta','M',40,'Puma','Camiseta mujer blanca original'),(50,'camiseta','M',45,'Puma','Camiseta beige logo grande'),(51,'camiseta','M',30,'Puma','Camiseta blanco logo mini'),(52,'camiseta','M',30,'Puma','Camiseta dos colores'),(53,'camiseta','M',40,'Puma','Camiseta blanca zapatillas'),(54,'camiseta','M',45,'Puma','Camiseta rosa mujer'),(55,'camiseta','M',30,'Puma','Camiseta rosa corta'),(56,'camiseta','M',30,'Puma','Camiseta mujer blanca'),(57,'camiseta','M',40,'Puma','Camiseta unisex edicion especial'),(58,'camiseta','M',45,'Puma','Camiseta Puma x Nitro negra'),(59,'camiseta','M',30,'Puma','Camiseta tirantes blanca'),(60,'camiseta','M',30,'Puma','Camiseta logo grande azul marino'),(61,'camiseta','M',20,'Vans','Camiseta azul oscuro original'),(62,'camiseta','M',35,'Vans','Camiseta blanca pizzero'),(63,'camiseta','M',25,'Vans','Camiseta paz azul'),(64,'camiseta','M',30,'Vans','Camiseta logo espalda'),(65,'camiseta','M',50,'Vans','Camiseta bola de 8'),(66,'camiseta','M',45,'Vans','Camiseta negra original'),(67,'camiseta','M',30,'Vans','Camiseta logo cuadrado negro'),(68,'camiseta','M',20,'Vans','Camiseta logo multicolor'),(69,'camiseta','M',40,'Vans','Camiseta sencilla gris'),(70,'camiseta','M',25,'Vans','Camiseta logo espalda negra'),(71,'camiseta','M',20,'Vans','Camiseta logo espalda blanca'),(72,'camiseta','M',30,'Vans','Camiseta amarilla logo centro'),(73,'pantalon','S',35,'Adidas','Pantalon negro original'),(74,'pantalon','S',40,'Adidas','Pantalon negro deporte'),(75,'pantalon','S',45,'Adidas','Pantalon rojo original'),(76,'pantalon','S',40,'Adidas','Pantalon gris de entrenamiento'),(77,'pantalon','M',40,'Adidas','Pantalon rosa y rayas verdes'),(78,'pantalon','M',45,'Adidas','Pantalon blanco deporte'),(79,'pantalon','M',35,'Adidas','Pantalon marron rayas rosas'),(80,'pantalon','M',50,'Adidas','Pantalon negro linea de logos'),(81,'pantalon','L',35,'Adidas','Pantalon verde oversize'),(82,'pantalon','L',40,'Adidas','Pantalon OG azul y amarillo'),(83,'pantalon','L',55,'Adidas','Pantalon de entrenamiento Real Madrid'),(84,'pantalon','L',50,'Adidas','Pantalon rojo entrenamiento Ajax'),(85,'pantalon','M',25,'Jordan','Pantalon rojo logo grande'),(86,'pantalon','M',20,'Jordan','Pantalon logo 23 azul'),(87,'pantalon','M',25,'Jordan','Pantalon negro original'),(88,'pantalon','M',40,'Jordan','Pantalon negro Edicion especial'),(89,'pantalon','M',35,'Jordan','Pantalon negro y rayas rojas'),(90,'pantalon','M',20,'Jordan','Pantalon corto negro de entrenamiento'),(91,'pantalon','M',35,'Jordan','Pantalon negro de chandal'),(92,'pantalon','M',30,'Jordan','Pantalon negro logo rojo'),(93,'pantalon','M',30,'Jordan','Pantalon mujer negro'),(94,'pantalon','M',35,'Jordan','Pantalon oversize mujer'),(95,'pantalon','M',55,'Jordan','Pantalon Jordan x PSG'),(96,'pantalon','M',30,'Jordan','Pantalon chandal rosa mujer'),(97,'pantalon','M',25,'Lacoste','Pantalon azul chandal'),(98,'pantalon','M',20,'Lacoste','Pantalon azul oscuro chandal'),(99,'pantalon','M',35,'Lacoste','Pantalon verde y raya blanca'),(100,'pantalon','M',20,'Lacoste','Pantalon Negro chandal'),(101,'pantalon','M',25,'Lacoste','Pantalon verde chandal'),(102,'pantalon','M',40,'Lacoste','Pantalon con estampado gris y negro'),(103,'pantalon','M',30,'Lacoste','Pantalon azul linea logos'),(104,'pantalon','M',40,'Lacoste','Pantalon chandal azul mujer'),(105,'pantalon','M',25,'Lacoste','Pantalon rosa chandal'),(106,'pantalon','M',20,'Lacoste','Pantalon varios colores'),(107,'pantalon','M',45,'Lacoste','Pantalon beige chandal'),(108,'pantalon','M',30,'Lacoste','Pantalon azul marino mujer'),(109,'pantalon','M',45,'Nike','Pantalon chandal gris'),(110,'pantalon','M',40,'Nike','Pantalon chandal azul claro'),(111,'pantalon','M',35,'Nike','Pantalon rojo linea logos'),(112,'pantalon','M',20,'Nike','Pantalon negro entrenamiento'),(113,'pantalon','M',20,'Nike','Pantalon corto Nike Air'),(114,'pantalon','M',20,'Nike','Pantalon negro chandal con bolsillos'),(115,'pantalon','M',25,'Nike','Pantalon oversize mujer negro'),(116,'pantalon','M',30,'Nike','Pantalon negro logo doble'),(117,'pantalon','M',35,'Nike','Pantalon azul chandal Chelsea'),(118,'pantalon','M',40,'Nike','Pantalon mujer oversize'),(119,'pantalon','M',45,'Nike','Pantalon edicion especial'),(120,'pantalon','M',40,'Nike','Pantalon Nike x Francia entrenamiento'),(121,'pantalon','M',30,'Puma','Pantalon negro logo tobillo'),(122,'pantalon','M',30,'Puma','Pantalon negro original'),(123,'pantalon','M',40,'Puma','Pantalon negro cargo'),(124,'pantalon','M',40,'Puma','Pantalon de entrenamiento negro'),(125,'pantalon','M',50,'Puma','Pantalon negro con lineas azul y rojas'),(126,'pantalon','M',20,'Puma','Pantalon negro chandal international'),(127,'pantalon','M',25,'Puma','Pantalon negro linea logo'),(128,'pantalon','M',30,'Puma','Pantalon negro de entrenamiento 2'),(129,'pantalon','M',25,'Puma','Pantalon negro multiples logos'),(130,'pantalon','M',20,'Puma','Pantalon mujer blanco OG'),(131,'pantalon','M',45,'Puma','Pantalon negro edicion especial'),(132,'pantalon','M',40,'Puma','Pantalon de vestir mujer beige'),(133,'pantalon','M',35,'Vans','Pantalon marron simple'),(134,'pantalon','M',40,'Vans','Pantalon beige simple'),(135,'pantalon','M',25,'Vans','Pantalon de mujer negro simple'),(136,'pantalon','M',20,'Vans','Pantalon cargo negro'),(137,'pantalon','M',20,'Vans','Pantalon chandal gris'),(138,'pantalon','M',40,'Vans','Pantalon fino negro'),(139,'pantalon','M',35,'Vans','Pantalon cargo gris'),(140,'pantalon','M',30,'Vans','Pantalon fino naranja'),(141,'pantalon','M',25,'Vans','Pantalon amarillo cargo'),(142,'pantalon','M',30,'Vans','Pantalon negro edicion especial'),(143,'pantalon','M',25,'Vans','Pantalon corto fino beige'),(144,'pantalon','M',20,'Vans','Pantalon negro logo grande'),(145,'chaqueta','M',20,'Adidas','Chaqueta azul marino Original'),(146,'chaqueta','M',20,'Adidas','Chaqueta verde Original'),(147,'chaqueta','M',25,'Adidas','Chaqueta cortavientos blanco'),(148,'chaqueta','M',20,'Adidas','Chaqueta negra Original'),(149,'chaqueta','M',25,'Adidas','Chaqueta OG azul y rayas naranja'),(150,'chaqueta','M',40,'Adidas','Chaqueta verde OG'),(151,'chaqueta','M',25,'Adidas','Chaqueta rosa claro Original'),(152,'chaqueta','M',40,'Adidas','Chaqueta Original edicion especial'),(153,'chaqueta','M',55,'Adidas','Chaqueta de entrenamiento Real Madrid'),(154,'chaqueta','M',40,'Adidas','Chaqueta de entrenamiento Juventus'),(155,'chaqueta','M',45,'Adidas','Chaqueta entrenamiento Arsenal'),(156,'chaqueta','M',20,'Adidas','Chaqueta color zebra'),(157,'chaqueta','M',20,'Jordan','Chaqueta negra entrenamiento'),(158,'chaqueta','M',30,'Jordan','Chaqueta negra mujer'),(159,'chaqueta','M',25,'Jordan','Chaqueta roja entrenamiento'),(160,'chaqueta','M',40,'Jordan','Chaqueta negra rayas azules'),(161,'chaqueta','M',25,'Jordan','Chaqueta roja logo redondo'),(162,'chaqueta','M',40,'Jordan','Chaqueta negra mujer mangas rojas'),(163,'chaqueta','M',35,'Jordan','Chaqueta negra Jordan AIR'),(164,'chaqueta','M',50,'Jordan','Chaqueta de entrenamiento gris Lakers'),(165,'chaqueta','M',45,'Jordan','Chaqueta de entrenamiento negra Lakers'),(166,'chaqueta','M',40,'Jordan','Chaqueta OG negra y verde'),(167,'chaqueta','M',35,'Jordan','Chaqueta OG marron y beige'),(168,'chaqueta','M',20,'Jordan','Chaqueta Verde cortavientos'),(169,'chaqueta','M',30,'Lacoste','Chaqueta negra original'),(170,'chaqueta','M',50,'Lacoste','Chaqueta verde original'),(171,'chaqueta','M',45,'Lacoste','Chaqueta negra chandal'),(172,'chaqueta','M',60,'Lacoste','Chaqueta azul de rayas magenta'),(173,'chaqueta','M',30,'Lacoste','Chaqueta azul y blanca'),(174,'chaqueta','M',20,'Lacoste','Chaqueta negras con rayas blancas'),(175,'chaqueta','M',45,'Lacoste','Chaqueta marron edicion especial'),(176,'chaqueta','M',40,'Lacoste','Chaqueta blanca y rayas rojas'),(177,'chaqueta','M',30,'Lacoste','Chaqueta azul y rayas naranjas'),(178,'chaqueta','M',35,'Lacoste','Chaqueta mujer corta roja'),(179,'chaqueta','M',45,'Lacoste','Chaqueta blanca polar'),(180,'chaqueta','M',60,'Lacoste','Chaqueta blanca mujer logo grande'),(181,'chaqueta','M',20,'Nike','Chaqueta negra cortavientos'),(182,'chaqueta','M',40,'Nike','Chaqueta azul cortavientos'),(183,'chaqueta','M',35,'Nike','Chaqueta chandal marron'),(184,'chaqueta','M',20,'Nike','Chaqueta Nike-Tech gris'),(185,'chaqueta','M',30,'Nike','Chaqueta de entrenamiento rosa ATM'),(186,'chaqueta','M',20,'Nike','Chaqueta azul claro oversize'),(187,'chaqueta','M',55,'Nike','Chaqueta entrenamiento Lakers'),(188,'chaqueta','M',40,'Nike','Chaqueta OG Barcelona'),(189,'chaqueta','M',20,'Nike','Chaqueta oversize negra mujer'),(190,'chaqueta','M',40,'Nike','Chaqueta logo grande negra'),(191,'chaqueta','M',45,'Nike','Chaqueta edicion especial Just Do IT'),(192,'chaqueta','M',50,'Nike','Chaqueta entrenamiento Nike x Francia'),(193,'chaqueta','M',30,'Puma','Chaqueta negra brazos de colores'),(194,'chaqueta','M',50,'Puma','Chaqueta OG Milan'),(195,'chaqueta','M',55,'Puma','Chaqueta negra Tech Mercedes'),(196,'chaqueta','M',40,'Puma','Chaqueta gris de mujer chandal'),(197,'chaqueta','M',25,'Puma','Chaqueta marrón chandal'),(198,'chaqueta','M',20,'Puma','Chaqueta negra original'),(199,'chaqueta','M',35,'Puma','Chaqueta negra bomber'),(200,'chaqueta','M',50,'Puma','Chaqueta de entrenamiento de Manchester City'),(201,'chaqueta','M',25,'Puma','Chaqueta edicion especial multicolor'),(202,'chaqueta','M',40,'Puma','Chaqueta roja Puma x Ferrari'),(203,'chaqueta','M',20,'Puma','Chaqueta cortavientos negro y naranja'),(204,'chaqueta','M',40,'Puma','Chaqueta Puma x Dortmund'),(205,'chaqueta','M',25,'Vans','Chaqueta negra bomber'),(206,'chaqueta','M',30,'Vans','Chaqueta negra botones'),(207,'chaqueta','M',25,'Vans','Chaqueta negra edicion limitada'),(208,'chaqueta','M',40,'Vans','Chaqueta verde bomber'),(209,'chaqueta','M',25,'Vans','Chaqueta negra relax mujer'),(210,'chaqueta','M',40,'Vans','Chaqueta negra cuadros blancos'),(211,'chaqueta','M',35,'Vans','Chaqueta verde y amarilla bomber'),(212,'chaqueta','M',50,'Vans','Chaqueta fina azul marino'),(213,'chaqueta','M',35,'Vans','Chaqueta edicion especial azul'),(214,'chaqueta','M',40,'Vans','Chaqueta negra cuadros mujer'),(215,'chaqueta','M',25,'Vans','Chaqueta cortavientos blanco'),(216,'chaqueta','M',20,'Vans','Chaqueta negra logo grande'),(217,'sudadera','S',35,'Adidas','Sudadera negra logo grande'),(218,'sudadera','S',30,'Adidas','Sudadera negra original'),(219,'sudadera','S',35,'Adidas','Sudadera de entrenamiento azul'),(220,'sudadera','S',40,'Adidas','Sudadera negra letras'),(221,'sudadera','M',55,'Adidas','Sudadera beige logo grande mujer'),(222,'sudadera','M',30,'Adidas','Sudadera con rayas mujer'),(223,'sudadera','M',45,'Adidas','Sudadera verde edicion especial'),(224,'sudadera','M',40,'Adidas','Sudadera beige y rayas negras'),(225,'sudadera','L',35,'Adidas','Sudadera azul claro original'),(226,'sudadera','L',40,'Adidas','Sudadera azul oscuro original'),(227,'sudadera','L',30,'Adidas','Sudadera roja original'),(228,'sudadera','L',50,'Adidas','Sudadera negra edicion especial'),(229,'sudadera','S',55,'Jordan','Sudadera negra logo grande azul'),(230,'sudadera','S',50,'Jordan','Sudadera negra Jordan x Nike Air'),(231,'sudadera','S',65,'Jordan','Sudadera negra simple logo rojo'),(232,'sudadera','S',50,'Jordan','Sudadera roja chandal mujer'),(233,'sudadera','M',65,'Jordan','Sudadera negra chandal mujer'),(234,'sudadera','M',45,'Jordan','Sudadera rosa chandal mujer'),(235,'sudadera','M',35,'Jordan','Sudadera roja 23'),(236,'sudadera','M',40,'Jordan','Sudadera blanca edicion especial'),(237,'sudadera','L',55,'Jordan','Sudadera azul logo letras'),(238,'sudadera','L',60,'Jordan','Sudadera salmon chandal mujer'),(239,'sudadera','L',45,'Jordan','Sudadera con estampado gris'),(240,'sudadera','L',45,'Jordan','Sudadera simple logo centrado'),(241,'sudadera','S',45,'Lacoste','Sudadera azul logo grande'),(242,'sudadera','S',40,'Lacoste','Sudadera rosa original'),(243,'sudadera','S',50,'Lacoste','Sudadera negra original mujer'),(244,'sudadera','S',50,'Lacoste','Sudadera blanca original mujer'),(245,'sudadera','M',45,'Lacoste','Sudadera negra original'),(246,'sudadera','M',40,'Lacoste','Sudadera azul y raya marron'),(247,'sudadera','M',60,'Lacoste','Sudadera blanca logo centrado'),(248,'sudadera','M',40,'Lacoste','Sudadera gris mujer'),(249,'sudadera','L',55,'Lacoste','Sudadera gris y tres líneas'),(250,'sudadera','L',50,'Lacoste','Sudadera azul logo centrado'),(251,'sudadera','L',45,'Lacoste','Sudadera gris, negro y blanco'),(252,'sudadera','L',50,'Lacoste','Sudadera negra logo grande'),(253,'sudadera','S',45,'Nike','Sudadera blanca logo azul'),(254,'sudadera','S',40,'Nike','Sudadera magenta logo amarillo'),(255,'sudadera','S',20,'Nike','Sudadera negra original'),(256,'sudadera','S',20,'Nike','Sudadera gris linea logo'),(257,'sudadera','M',35,'Nike','Sudadera azul claro mujer'),(258,'sudadera','M',30,'Nike','Sudadera chandal negra'),(259,'sudadera','M',25,'Nike','Sudadera chandal gris'),(260,'sudadera','M',50,'Nike','Sudadera logo tricolor'),(261,'sudadera','L',25,'Nike','Sudadera oversize rosa claro'),(262,'sudadera','L',40,'Nike','Sudadera azul edicion especial'),(263,'sudadera','L',30,'Nike','Sudadera rosa original'),(264,'sudadera','L',50,'Nike','Sudadera negra original mujer'),(265,'sudadera','S',40,'Puma','Sudadera beige original'),(266,'sudadera','S',40,'Puma','Sudadera puma azul mujer'),(267,'sudadera','S',50,'Puma','Sudadera negra original'),(268,'sudadera','S',35,'Puma','Sudadera azul y verde'),(269,'sudadera','M',45,'Puma','Sudadera negra logo centrado mujer'),(270,'sudadera','M',40,'Puma','Sudadera logo multicolor'),(271,'sudadera','M',30,'Puma','Sudadera verde original'),(272,'sudadera','M',40,'Puma','Sudadera negra Puma x BMW'),(273,'sudadera','L',45,'Puma','Sudadera gris Puma x Garfield'),(274,'sudadera','L',40,'Puma','Sudadera negra edicion especial'),(275,'sudadera','L',45,'Puma','Sudadera negra chandal mujer'),(276,'sudadera','L',40,'Puma','Sudadera negra mujer'),(277,'sudadera','S',20,'Vans','Sudadera negra logo centrado'),(278,'sudadera','S',20,'Vans','Sudadera negra original'),(279,'sudadera','S',30,'Vans','Sudadera negra original mujer'),(280,'sudadera','S',40,'Vans','Sudadera naranja logo dentrado'),(281,'sudadera','M',45,'Vans','Sudadera negra OG'),(282,'sudadera','M',40,'Vans','Sudadera negra edicion especial mujer'),(283,'sudadera','M',20,'Vans','Sudadera blanca original mujer'),(284,'sudadera','M',50,'Vans','Sudadera verde original'),(285,'sudadera','L',25,'Vans','Sudadera negra logo espalda'),(286,'sudadera','L',40,'Vans','Sudadera azul claro original'),(287,'sudadera','L',50,'Vans','Sudadera negro oversize'),(288,'sudadera','L',30,'Vans','Sudadera azul logo centrado');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-22 20:12:02
