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
INSERT INTO `clientes` VALUES (1,'Juan','Aquarius','juanaqua20@hotmail.es','123456','Madrid'),(2,'Marcos','Gonzalez','marcutigon@gmial.com','$2y$10$3mifWnxPUrFIHuLRLRW7suLVomxDYf2rnDhcWxEypogNdA5CuhT.K','Jaen'),(3,'Manolo','Juan','manolo@gmail.com','$2y$12$GT7BUktnSc/GmK46fOqCRenBmW5EBPQSISHp5OWqUvPdQECePa1z6','Jaen'),(4,'Miguel','Gonzalez','miguel@gmail.com','$2y$10$KfuUXSJ4vIfgKyAVlHryzO31iHs4pRJJ8yglzsEvqPpX1/.642ize','Fuenlabrada'),(5,'Ana','ana','ana.ana@gmail.com','$2y$10$EDGUYwR0cs3TF9OxPbuoMO9dtkOQsY1ZmHCMrL/dwtjgObmoNaEKu','Madrid'),(6,'Marcos','Gonzalez','marcos@gmail.com','$2y$12$LFhlsT13XkiF5tmh0Abn1OOHuLAeibLWAkbK9hAz37D0KHT2SyWne','Madrid'),(9,'Maria','berrocal','mariaberro@hotmail.com','$2y$10$.h0V5CUHsjZn4O/R4mFr4.Z1KV2d7vxMWKh7HyGyxPsaxmYOZM.yu','Barcelona'),(10,'Pablo','Ruiz','pablo@outlook.es','$2y$12$F4b9A.D3MYZe0pvPOpBPZeLo7tjr5wl/BVeKyHAN8vEOu.9.nA8EW','Madrid');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (2,6,1,1);
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
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'camiseta','S',40,'Adidas','Camiseta Negra con Rayas de Colores','./img/1.avif'),(2,'camiseta','S',40,'Adidas','Camiseta Azul Original','./img/2.webp'),(3,'camiseta','S',20,'Adidas','Camiseta simple Negra','./img/3.jpg'),(4,'camiseta','S',20,'Adidas','Camiseta de entrenamiento Blanca','./img/4.jpg'),(5,'camiseta','M',35,'Adidas','Camiseta de vestir Gris','./img/5.webp'),(6,'camiseta','M',40,'Adidas','Camiseta de entrenamiento negra','./img/6.avif'),(7,'camiseta','M',35,'Adidas','Camiseta de entrenamiento verde','./img/7.jpg'),(8,'camiseta','M',50,'Adidas','Camiseta de entrenamiento edicion especial','./img/8.jpg'),(9,'camiseta','L',30,'Adidas','Camiseta de entrenamiento gris','./img/9.webp'),(10,'camiseta','L',50,'Adidas','Camiseta de entrenamiento','./img/10.avif'),(11,'camiseta','L',35,'Adidas','Camiseta original Adidas Verde','./img/11.avif'),(12,'camiseta','L',60,'Adidas','Camiseta Delafuente x MDLR','./img/12.jpg'),(13,'camiseta','S',50,'Jordan','Camiseta Negra, logo grande','./img/13.jpg'),(14,'camiseta','S',55,'Jordan','Camiseta Jordan Logo blanco','./img/14.png'),(15,'camiseta','S',35,'Jordan','Camiseta Jordan Gris','./img/15.jpg'),(16,'camiseta','S',40,'Jordan','Camiseta Negra Flight','./img/16.jpg'),(17,'camiseta','M',50,'Jordan','Camiseta Negra AIR','./img/17.webp'),(18,'camiseta','M',50,'Jordan','Camiseta Roja logo grande','./img/18.jpg'),(19,'camiseta','M',45,'Jordan','Camiseta Tirantes Blanca','./img/19.png'),(20,'camiseta','M',60,'Jordan','Camiseta Negra logo Beisbol','./img/20.png'),(21,'camiseta','L',50,'Jordan','Camiseta azul marino simple','./img/21.jpg'),(22,'camiseta','L',50,'Jordan','Camiseta Nike x Jordan Blanco','./img/22.jpg'),(23,'camiseta','L',45,'Jordan','Camiseta Negra Mujer','./img/23.avif'),(24,'camiseta','L',40,'Jordan','Camiseta Marrón Oversize','./img/24.webp'),(25,'camiseta','M',50,'Lacoste','Camiseta blanca logo grande','./img/25.webp'),(26,'camiseta','M',50,'Lacoste','Camiseta azul marino mujer','./img/26.jpg'),(27,'camiseta','M',55,'Lacoste','Camiseta negra logo azul','./img/27.webp'),(28,'camiseta','M',40,'Lacoste','Polo verde original','./img/28.webp'),(29,'camiseta','M',65,'Lacoste','Camiseta blanca logo letras','./img/29.webp'),(30,'camiseta','M',50,'Lacoste','Camiseta blanca simple','./img/30.webp'),(31,'camiseta','M',55,'Lacoste','Camiseta rayas azules','./img/31.webp'),(32,'camiseta','M',60,'Lacoste','Camiseta gris raya blanca','./img/32.webp'),(33,'camiseta','M',60,'Lacoste','Camiseta mujer oversize beige','./img/33.jpg'),(34,'camiseta','M',50,'Lacoste','Camiseta mujer rosa','./img/34.jpg'),(35,'camiseta','M',55,'Lacoste','Camiseta gris logo','./img/35.avif'),(36,'camiseta','M',60,'Lacoste','Camiseta azul logo','./img/36.jpg'),(37,'camiseta','M',30,'Nike','Camiseta Just Do IT blanca','./img/37.jpg'),(38,'camiseta','M',40,'Nike','Camiseta negra original','./img/38.jpg'),(39,'camiseta','M',35,'Nike','Camiseta beige edicion playa','./img/39.png'),(40,'camiseta','M',50,'Nike','Camiseta oversize gris','./img/40.png'),(41,'camiseta','M',30,'Nike','Camiseta logo grande blanca','./img/41.png'),(42,'camiseta','M',40,'Nike','Camiseta negra original','./img/42.jpg'),(43,'camiseta','M',45,'Nike','Camiseta rosa mujer','./img/43.png'),(44,'camiseta','M',40,'Nike','Camiseta blanca mujer','./img/44.png'),(45,'camiseta','M',40,'Nike','Camiseta Just do IT hombre','./img/45.png'),(46,'camiseta','M',50,'Nike','Camiseta edición china begie','./img/46.png'),(47,'camiseta','M',35,'Nike','Camiseta gris mini logo','./img/47.jpg'),(48,'camiseta','M',50,'Nike','Camiseta Nike x Air','./img/48.png'),(49,'camiseta','M',40,'Puma','Camiseta mujer blanca original','./img/49.jpg'),(50,'camiseta','M',45,'Puma','Camiseta beige logo grande','./img/50.webp'),(51,'camiseta','M',30,'Puma','Camiseta blanco logo mini','./img/51.avif'),(52,'camiseta','M',30,'Puma','Camiseta dos colores','./img/52.avif'),(53,'camiseta','M',40,'Puma','Camiseta blanca zapatillas','./img/53.jpg'),(54,'camiseta','M',45,'Puma','Camiseta rosa mujer','./img/54.avif'),(55,'camiseta','M',30,'Puma','Camiseta rosa corta','./img/55.jpg'),(56,'camiseta','M',30,'Puma','Camiseta mujer blanca','./img/56.jpg'),(57,'camiseta','M',40,'Puma','Camiseta unisex edicion especial','./img/57.jpg'),(58,'camiseta','M',45,'Puma','Camiseta Puma x Nitro negra','./img/58.jpg'),(59,'camiseta','M',30,'Puma','Camiseta tirantes blanca','./img/59.jpg'),(60,'camiseta','M',30,'Puma','Camiseta logo grande azul marino','./img/60.webp'),(61,'camiseta','M',20,'Vans','Camiseta azul oscuro original','./img/61.avif'),(62,'camiseta','M',35,'Vans','Camiseta blanca pizzero','./img/62.webp'),(63,'camiseta','M',25,'Vans','Camiseta paz azul','./img/63.jpg'),(64,'camiseta','M',30,'Vans','Camiseta logo espalda','./img/64.jpg'),(65,'camiseta','M',50,'Vans','Camiseta bola de 8','./img/65.webp'),(66,'camiseta','M',45,'Vans','Camiseta negra original','./img/66.webp'),(67,'camiseta','M',30,'Vans','Camiseta logo cuadrado negro','./img/67.webp'),(68,'camiseta','M',20,'Vans','Camiseta logo multicolor','./img/68.jpg'),(69,'camiseta','M',40,'Vans','Camiseta sencilla gris','./img/69.webp'),(70,'camiseta','M',25,'Vans','Camiseta logo espalda negra','./img/70.jpg'),(71,'camiseta','M',20,'Vans','Camiseta logo espalda blanca','./img/71.jpg'),(72,'camiseta','M',30,'Vans','Camiseta amarilla logo centro','./img/72.webp'),(73,'pantalon','S',35,'Adidas','Pantalon negro original','./img/73.avif'),(74,'pantalon','S',40,'Adidas','Pantalon negro deporte','./img/74.avif'),(75,'pantalon','S',45,'Adidas','Pantalon rojo original','./img/75.avif'),(76,'pantalon','S',40,'Adidas','Pantalon gris de entrenamiento','./img/76.jpg'),(77,'pantalon','M',40,'Adidas','Pantalon rosa y rayas verdes','./img/77.webp'),(78,'pantalon','M',45,'Adidas','Pantalon blanco deporte','./img/78.webp'),(79,'pantalon','M',35,'Adidas','Pantalon marron rayas rosas','./img/79.avif'),(80,'pantalon','M',50,'Adidas','Pantalon negro linea de logos','./img/80.jpg'),(81,'pantalon','L',35,'Adidas','Pantalon verde oversize','./img/81.avif'),(82,'pantalon','L',40,'Adidas','Pantalon OG azul y amarillo','./img/82.jpg'),(83,'pantalon','L',55,'Adidas','Pantalon de entrenamiento Real Madrid','./img/83.jpg'),(84,'pantalon','L',50,'Adidas','Pantalon rojo entrenamiento Ajax','./img/84.jpg'),(85,'pantalon','M',25,'Jordan','Pantalon rojo logo grande','./img/85.jpg'),(86,'pantalon','M',20,'Jordan','Pantalon logo 23 azul','./img/86.jpg'),(87,'pantalon','M',25,'Jordan','Pantalon negro original','./img/87.webp'),(88,'pantalon','M',40,'Jordan','Pantalon negro Edicion especial','./img/88.webp'),(89,'pantalon','M',35,'Jordan','Pantalon negro y rayas rojas','./img/89.jpg'),(90,'pantalon','M',20,'Jordan','Pantalon corto negro de entrenamiento','./img/90.jpg'),(91,'pantalon','M',35,'Jordan','Pantalon negro de chandal','./img/91.jpg'),(92,'pantalon','M',30,'Jordan','Pantalon negro logo rojo','./img/92.webp'),(93,'pantalon','M',30,'Jordan','Pantalon mujer negro','./img/93.png'),(94,'pantalon','M',35,'Jordan','Pantalon oversize mujer','./img/94.webp'),(95,'pantalon','M',55,'Jordan','Pantalon Jordan x PSG','./img/95.webp'),(96,'pantalon','M',30,'Jordan','Pantalon chandal rosa mujer','./img/96.webp'),(97,'pantalon','M',25,'Lacoste','Pantalon azul chandal','./img/97.webp'),(98,'pantalon','M',20,'Lacoste','Pantalon azul oscuro chandal','./img/98.webp'),(99,'pantalon','M',35,'Lacoste','Pantalon verde y raya blanca','./img/99.webp'),(100,'pantalon','M',20,'Lacoste','Pantalon Negro chandal','./img/100.webp'),(101,'pantalon','M',25,'Lacoste','Pantalon verde chandal','./img/101.jpg'),(102,'pantalon','M',40,'Lacoste','Pantalon con estampado gris y negro','./img/102.jpg'),(103,'pantalon','M',30,'Lacoste','Pantalon azul linea logos','./img/103.webp'),(104,'pantalon','M',40,'Lacoste','Pantalon chandal azul mujer','./img/104.webp'),(105,'pantalon','M',25,'Lacoste','Pantalon rosa chandal','./img/105.jpg'),(106,'pantalon','M',20,'Lacoste','Pantalon varios colores','./img/106.jpg'),(107,'pantalon','M',45,'Lacoste','Pantalon beige chandal','./img/107.avif'),(108,'pantalon','M',30,'Lacoste','Pantalon azul marino mujer','./img/108.jpg'),(109,'pantalon','M',45,'Nike','Pantalon chandal gris','./img/109.jpg'),(110,'pantalon','M',40,'Nike','Pantalon chandal azul claro','./img/110.jpg'),(111,'pantalon','M',35,'Nike','Pantalon rojo linea logos','./img/111.webp'),(112,'pantalon','M',20,'Nike','Pantalon negro entrenamiento','./img/112.jpg'),(113,'pantalon','M',20,'Nike','Pantalon corto Nike Air','./img/113.jpg'),(114,'pantalon','M',20,'Nike','Pantalon negro chandal con bolsillos','./img/114.png'),(115,'pantalon','M',25,'Nike','Pantalon oversize mujer negro','./img/115.avif'),(116,'pantalon','M',30,'Nike','Pantalon negro logo doble','./img/116.webp'),(117,'pantalon','M',35,'Nike','Pantalon azul chandal Chelsea','./img/117.png'),(118,'pantalon','M',40,'Nike','Pantalon mujer oversize','./img/118.png'),(119,'pantalon','M',45,'Nike','Pantalon edicion especial','./img/119.avif'),(120,'pantalon','M',40,'Nike','Pantalon Nike x Francia entrenamiento','./img/120.png'),(121,'pantalon','M',30,'Puma','Pantalon negro logo tobillo','./img/121.jpg'),(122,'pantalon','M',30,'Puma','Pantalon negro original','./img/122.webp'),(123,'pantalon','M',40,'Puma','Pantalon negro cargo','./img/123.avif'),(124,'pantalon','M',40,'Puma','Pantalon de entrenamiento negro','./img/124.webp'),(125,'pantalon','M',50,'Puma','Pantalon negro con lineas azul y rojas','./img/125.jpg'),(126,'pantalon','M',20,'Puma','Pantalon negro chandal international','./img/126.jpg'),(127,'pantalon','M',25,'Puma','Pantalon negro linea logo','./img/127.jpg'),(128,'pantalon','M',30,'Puma','Pantalon negro de entrenamiento 2','./img/128.jpg'),(129,'pantalon','M',25,'Puma','Pantalon negro multiples logos','./img/129.jpg'),(130,'pantalon','M',20,'Puma','Pantalon mujer blanco OG','./img/130.jpg'),(131,'pantalon','M',45,'Puma','Pantalon negro edicion especial','./img/131.webp'),(132,'pantalon','M',40,'Puma','Pantalon de vestir mujer beige','./img/132.avif'),(133,'pantalon','M',35,'Vans','Pantalon marron simple','./img/133.webp'),(134,'pantalon','M',40,'Vans','Pantalon beige simple','./img/134.webp'),(135,'pantalon','M',25,'Vans','Pantalon de mujer negro simple','./img/135.webp'),(136,'pantalon','M',20,'Vans','Pantalon cargo negro','./img/136.jpg'),(137,'pantalon','M',20,'Vans','Pantalon chandal gris','./img/137.avif'),(138,'pantalon','M',40,'Vans','Pantalon fino negro','./img/138.webp'),(139,'pantalon','M',35,'Vans','Pantalon cargo gris','./img/139.avif'),(140,'pantalon','M',30,'Vans','Pantalon fino naranja','./img/140.jpg'),(141,'pantalon','M',25,'Vans','Pantalon amarillo cargo','./img/141.jpg'),(142,'pantalon','M',30,'Vans','Pantalon negro edicion especial','./img/142.avif'),(143,'pantalon','M',25,'Vans','Pantalon corto fino beige','./img/143.jpg'),(144,'pantalon','M',20,'Vans','Pantalon negro logo grande','./img/144.jpg'),(145,'chaqueta','M',20,'Adidas','Chaqueta azul marino Original','./img/145.avif'),(146,'chaqueta','M',20,'Adidas','Chaqueta verde Original','./img/146.jpg'),(147,'chaqueta','M',25,'Adidas','Chaqueta cortavientos blanco','./img/147.avif'),(148,'chaqueta','M',20,'Adidas','Chaqueta negra Original','./img/148.avif'),(149,'chaqueta','M',25,'Adidas','Chaqueta OG azul y rayas naranja','./img/149.avif'),(150,'chaqueta','M',40,'Adidas','Chaqueta verde OG','./img/150.webp'),(151,'chaqueta','M',25,'Adidas','Chaqueta rosa claro Original','./img/151.jpg'),(152,'chaqueta','M',40,'Adidas','Chaqueta Original edicion especial','./img/152.jpg'),(153,'chaqueta','M',55,'Adidas','Chaqueta de entrenamiento Real Madrid','./img/153.webp'),(154,'chaqueta','M',40,'Adidas','Chaqueta de entrenamiento Juventus','./img/154.webp'),(155,'chaqueta','M',45,'Adidas','Chaqueta entrenamiento Arsenal','./img/155.avif'),(156,'chaqueta','M',20,'Adidas','Chaqueta color zebra','./img/156.avif'),(157,'chaqueta','M',20,'Jordan','Chaqueta negra entrenamiento','./img/157.webp'),(158,'chaqueta','M',30,'Jordan','Chaqueta negra mujer','./img/158.jpg'),(159,'chaqueta','M',25,'Jordan','Chaqueta roja entrenamiento','./img/159.jpg'),(160,'chaqueta','M',40,'Jordan','Chaqueta negra rayas azules','./img/160.webp'),(161,'chaqueta','M',25,'Jordan','Chaqueta roja logo redondo','./img/161.jpg'),(162,'chaqueta','M',40,'Jordan','Chaqueta negra mujer mangas rojas','./img/162.jpg'),(163,'chaqueta','M',35,'Jordan','Chaqueta negra Jordan AIR','./img/163.gif'),(164,'chaqueta','M',50,'Jordan','Chaqueta de entrenamiento gris Lakers','./img/164.jpg'),(165,'chaqueta','M',45,'Jordan','Chaqueta de entrenamiento negra Lakers','./img/165.avif'),(166,'chaqueta','M',40,'Jordan','Chaqueta OG negra y verde','./img/166.webp'),(167,'chaqueta','M',35,'Jordan','Chaqueta OG marron y beige','./img/167.webp'),(168,'chaqueta','M',20,'Jordan','Chaqueta Verde cortavientos','./img/168.jpg'),(169,'chaqueta','M',30,'Lacoste','Chaqueta negra original','./img/169.jpg'),(170,'chaqueta','M',50,'Lacoste','Chaqueta verde original','./img/170.webp'),(171,'chaqueta','M',45,'Lacoste','Chaqueta negra chandal','./img/171.jpg'),(172,'chaqueta','M',60,'Lacoste','Chaqueta azul de rayas magenta','./img/172.webp'),(173,'chaqueta','M',30,'Lacoste','Chaqueta azul y blanca','./img/173.jpg'),(174,'chaqueta','M',20,'Lacoste','Chaqueta negras con rayas blancas','./img/174.webp'),(175,'chaqueta','M',45,'Lacoste','Chaqueta marron edicion especial','./img/175.jpg'),(176,'chaqueta','M',40,'Lacoste','Chaqueta blanca y rayas rojas','./img/176.jpg'),(177,'chaqueta','M',30,'Lacoste','Chaqueta azul y rayas naranjas','./img/177.jpg'),(178,'chaqueta','M',35,'Lacoste','Chaqueta mujer corta roja','./img/178.jpg'),(179,'chaqueta','M',45,'Lacoste','Chaqueta blanca polar','./img/179.jpg'),(180,'chaqueta','M',60,'Lacoste','Chaqueta blanca mujer logo grande','./img/180.webp'),(181,'chaqueta','M',20,'Nike','Chaqueta negra cortavientos','./img/181.png'),(182,'chaqueta','M',40,'Nike','Chaqueta azul cortavientos','./img/182.png'),(183,'chaqueta','M',35,'Nike','Chaqueta chandal marron','./img/183.png'),(184,'chaqueta','M',20,'Nike','Chaqueta Nike-Tech gris','./img/184.jpg'),(185,'chaqueta','M',30,'Nike','Chaqueta de entrenamiento rosa ATM','./img/185.jpg'),(186,'chaqueta','M',20,'Nike','Chaqueta azul claro oversize','./img/186.webp'),(187,'chaqueta','M',55,'Nike','Chaqueta entrenamiento Lakers','./img/187.webp'),(188,'chaqueta','M',40,'Nike','Chaqueta OG Barcelona','./img/188.webp'),(189,'chaqueta','M',20,'Nike','Chaqueta oversize negra mujer','./img/189.png'),(190,'chaqueta','M',40,'Nike','Chaqueta logo grande negra','./img/190.webp'),(191,'chaqueta','M',45,'Nike','Chaqueta edicion especial Just Do IT','./img/191.png'),(192,'chaqueta','M',50,'Nike','Chaqueta entrenamiento Nike x Francia','./img/192.png'),(193,'chaqueta','M',30,'Puma','Chaqueta negra brazos de colores','./img/193.jpg'),(194,'chaqueta','M',50,'Puma','Chaqueta OG Milan','./img/194.jpg'),(195,'chaqueta','M',55,'Puma','Chaqueta negra Tech Mercedes','./img/195.avif'),(196,'chaqueta','M',40,'Puma','Chaqueta gris de mujer chandal','./img/196.avif'),(197,'chaqueta','M',25,'Puma','Chaqueta marrón chandal','./img/197.avif'),(198,'chaqueta','M',20,'Puma','Chaqueta negra original','./img/198.avif'),(199,'chaqueta','M',35,'Puma','Chaqueta negra bomber','./img/199.jpg'),(200,'chaqueta','M',50,'Puma','Chaqueta de entrenamiento de Manchester City','./img/200.png'),(201,'chaqueta','M',25,'Puma','Chaqueta edicion especial multicolor','./img/201.jpg'),(202,'chaqueta','M',40,'Puma','Chaqueta roja Puma x Ferrari','./img/202.jpg'),(203,'chaqueta','M',20,'Puma','Chaqueta cortavientos negro y naranja','./img/203.webp'),(204,'chaqueta','M',40,'Puma','Chaqueta Puma x Dortmund','./img/204.avif'),(205,'chaqueta','M',25,'Vans','Chaqueta negra bomber','./img/205.webp'),(206,'chaqueta','M',30,'Vans','Chaqueta negra botones','./img/206.webp'),(207,'chaqueta','M',25,'Vans','Chaqueta negra edicion limitada','./img/207.jpg'),(208,'chaqueta','M',40,'Vans','Chaqueta verde bomber','./img/208.webp'),(209,'chaqueta','M',25,'Vans','Chaqueta negra relax mujer','./img/209.webp'),(210,'chaqueta','M',40,'Vans','Chaqueta negra cuadros blancos','./img/210.jpg'),(211,'chaqueta','M',35,'Vans','Chaqueta verde y amarilla bomber','./img/211.jpeg'),(212,'chaqueta','M',50,'Vans','Chaqueta fina azul marino','./img/212.jpg'),(213,'chaqueta','M',35,'Vans','Chaqueta edicion especial azul','./img/213.avif'),(214,'chaqueta','M',40,'Vans','Chaqueta negra cuadros mujer','./img/214.webp'),(215,'chaqueta','M',25,'Vans','Chaqueta cortavientos blanco','./img/215.jpg'),(216,'chaqueta','M',20,'Vans','Chaqueta negra logo grande','./img/216.avif'),(217,'sudadera','S',35,'Adidas','Sudadera negra logo grande','./img/217.jpg'),(218,'sudadera','S',30,'Adidas','Sudadera negra original','./img/218.webp'),(219,'sudadera','S',35,'Adidas','Sudadera de entrenamiento azul','./img/219.jpg'),(220,'sudadera','S',40,'Adidas','Sudadera negra letras','./img/220.avif'),(221,'sudadera','M',55,'Adidas','Sudadera beige logo grande mujer','./img/221.webp'),(222,'sudadera','M',30,'Adidas','Sudadera con rayas mujer','./img/222.webp'),(223,'sudadera','M',45,'Adidas','Sudadera verde edicion especial','./img/223.webp'),(224,'sudadera','M',40,'Adidas','Sudadera beige y rayas negras','./img/224.jpg'),(225,'sudadera','L',35,'Adidas','Sudadera azul claro original','./img/225.webp'),(226,'sudadera','L',40,'Adidas','Sudadera azul oscuro original','./img/226.avif'),(227,'sudadera','L',30,'Adidas','Sudadera roja original','./img/227.webp'),(228,'sudadera','L',50,'Adidas','Sudadera negra edicion especial','./img/228.webp'),(229,'sudadera','S',55,'Jordan','Sudadera negra logo grande azul','./img/229.webp'),(230,'sudadera','S',50,'Jordan','Sudadera negra Jordan x Nike Air','./img/230.jpg'),(231,'sudadera','S',65,'Jordan','Sudadera negra simple logo rojo','./img/231.avif'),(232,'sudadera','S',50,'Jordan','Sudadera roja chandal mujer','./img/232.png'),(233,'sudadera','M',65,'Jordan','Sudadera negra chandal mujer','./img/233.webp'),(234,'sudadera','M',45,'Jordan','Sudadera rosa chandal mujer','./img/234.avif'),(235,'sudadera','M',35,'Jordan','Sudadera roja 23','./img/235.jpg'),(236,'sudadera','M',40,'Jordan','Sudadera blanca edicion especial','./img/236.webp'),(237,'sudadera','L',55,'Jordan','Sudadera azul logo letras','./img/237.jpg'),(238,'sudadera','L',60,'Jordan','Sudadera salmon chandal mujer','./img/238.jpg'),(239,'sudadera','L',45,'Jordan','Sudadera con estampado gris','./img/239.jpg'),(240,'sudadera','L',45,'Jordan','Sudadera simple logo centrado','./img/240.png'),(241,'sudadera','S',45,'Lacoste','Sudadera azul logo grande','./img/241.jpg'),(242,'sudadera','S',40,'Lacoste','Sudadera rosa original','./img/242.jpg'),(243,'sudadera','S',50,'Lacoste','Sudadera negra original mujer','./img/243.jpg'),(244,'sudadera','S',50,'Lacoste','Sudadera blanca original mujer','./img/244.webp'),(245,'sudadera','M',45,'Lacoste','Sudadera negra original','./img/245.webp'),(246,'sudadera','M',40,'Lacoste','Sudadera azul y raya marron','./img/246.webp'),(247,'sudadera','M',60,'Lacoste','Sudadera blanca logo centrado','./img/247.webp'),(248,'sudadera','M',40,'Lacoste','Sudadera gris mujer','./img/248.jpg'),(249,'sudadera','L',55,'Lacoste','Sudadera gris y tres líneas','./img/249.jpg'),(250,'sudadera','L',50,'Lacoste','Sudadera azul logo centrado','./img/250.webp'),(251,'sudadera','L',45,'Lacoste','Sudadera gris, negro y blanco','./img/251.jpg'),(252,'sudadera','L',50,'Lacoste','Sudadera negra logo grande','./img/252.avif'),(253,'sudadera','S',45,'Nike','Sudadera blanca logo azul','./img/253.jpg'),(254,'sudadera','S',40,'Nike','Sudadera magenta logo amarillo','./img/254.jpg'),(255,'sudadera','S',20,'Nike','Sudadera negra original','./img/256.webp'),(256,'sudadera','S',20,'Nike','Sudadera gris linea logo','./img/257.webp'),(257,'sudadera','M',35,'Nike','Sudadera azul claro mujer','./img/258.webp'),(258,'sudadera','M',30,'Nike','Sudadera chandal negra','./img/259.avif'),(259,'sudadera','M',25,'Nike','Sudadera chandal gris','./img/260.jpg'),(260,'sudadera','M',50,'Nike','Sudadera logo tricolor','./img/261.jpg'),(261,'sudadera','L',25,'Nike','Sudadera oversize rosa claro','./img/262.webp'),(262,'sudadera','L',40,'Nike','Sudadera azul edicion especial','./img/263.jpg'),(263,'sudadera','L',30,'Nike','Sudadera rosa original','./img/264.jpg'),(264,'sudadera','L',50,'Nike','Sudadera negra original mujer','./img/265.webp'),(265,'sudadera','S',40,'Puma','Sudadera beige original','./img/266.jpg'),(266,'sudadera','S',40,'Puma','Sudadera puma azul mujer','./img/267.webp'),(267,'sudadera','S',50,'Puma','Sudadera negra original','./img/268.jpg'),(268,'sudadera','S',35,'Puma','Sudadera azul y verde','./img/269.avif'),(269,'sudadera','M',45,'Puma','Sudadera negra logo centrado mujer','./img/270.avif'),(270,'sudadera','M',40,'Puma','Sudadera logo multicolor','./img/271.webp'),(271,'sudadera','M',30,'Puma','Sudadera verde original','./img/272.webp'),(272,'sudadera','M',40,'Puma','Sudadera negra Puma x BMW','./img/273.jpg'),(273,'sudadera','L',45,'Puma','Sudadera gris Puma x Garfield','./img/274.jpg'),(274,'sudadera','L',40,'Puma','Sudadera negra edicion especial','./img/275.jpg'),(275,'sudadera','L',45,'Puma','Sudadera negra chandal mujer','./img/276.avif'),(276,'sudadera','L',40,'Puma','Sudadera negra mujer','./img/277.jpg'),(277,'sudadera','S',20,'Vans','Sudadera negra logo centrado','./img/278.jpg'),(278,'sudadera','S',20,'Vans','Sudadera negra original','./img/279.jpg'),(279,'sudadera','S',30,'Vans','Sudadera negra original mujer','./img/280.png'),(280,'sudadera','S',40,'Vans','Sudadera naranja logo dentrado','./img/281.webp'),(281,'sudadera','M',45,'Vans','Sudadera negra OG','./img/282.webp'),(282,'sudadera','M',40,'Vans','Sudadera negra edicion especial mujer','./img/283.jpg'),(283,'sudadera','M',20,'Vans','Sudadera blanca original mujer','./img/284.jpg'),(284,'sudadera','M',50,'Vans','Sudadera verde original','./img/285.jpg'),(285,'sudadera','L',25,'Vans','Sudadera negra logo espalda','./img/286.webp'),(286,'sudadera','L',40,'Vans','Sudadera azul claro original','./img/287.jpg'),(287,'sudadera','L',50,'Vans','Sudadera negro oversize','./img/288.jpg'),(288,'sudadera','L',30,'Vans','Sudadera azul logo centrado','./img/289.jpg');
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

-- Dump completed on 2025-05-27  0:06:07
