-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: travelagency
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total_spots` int NOT NULL,
  `available_spots` int NOT NULL,
  `included_services` text,
  `conditions` text,
  `category` varchar(50) DEFAULT NULL,
  `status` enum('AVAILABLE','SOLD_OUT','NOT_VALID','CANCELLED') NOT NULL DEFAULT 'AVAILABLE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,'Tour Patagonia Actualizado','Punta Arenas, Chile','Tour actualizado','2026-07-15','2026-07-22',900000.00,20,12,'Hotel, desayuno','Edad mínima 18','Aventura','NOT_VALID'),(2,'Tour Calera','Calera','esto es una prueba.','2026-04-21','2026-04-28',500000.00,30,27,'almuerzo gratis','mayores de 18 años','tour','AVAILABLE'),(5,'W','W','W','2026-04-29','2026-04-30',12.00,12,12,'W','W','W','CANCELLED'),(7,'Israel','Israel','israel','2026-04-26','2026-04-28',10000.00,34,34,'almuerzo gratis','mayores de 18 años','tour','CANCELLED'),(8,'Tour Test Docker Editado','Santiago, Chile','Tour de prueba actualizado','2026-08-01','2026-08-07',550000.00,10,5,'Hotel y desayuno','Mayores de 18','Ciudad','AVAILABLE'),(10,'X','X','X','2026-05-10','2026-05-12',20000.00,12,0,'X','X','X','SOLD_OUT');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reservation_id` bigint NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method` enum('CREDIT_CARD') NOT NULL DEFAULT 'CREDIT_CARD',
  `card_number` varchar(16) DEFAULT NULL,
  `expiration_date` varchar(7) DEFAULT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1700000.00,'2026-04-13 21:01:20','CREDIT_CARD','1234567890123456','12/28','123'),(2,5,850000.00,'2026-04-21 00:14:35','CREDIT_CARD','123456789545','03/05','123'),(3,6,5950000.00,'2026-04-21 11:23:55','CREDIT_CARD','123456789','12/89','123'),(4,7,850000.00,'2026-04-21 16:06:00','CREDIT_CARD','12','1','1'),(5,8,500000.00,'2026-04-21 16:39:38','CREDIT_CARD','123456789','1','2'),(6,10,120.00,'2026-04-22 17:13:01','CREDIT_CARD','1','1','1'),(7,15,10.20,'2026-04-23 02:03:18','CREDIT_CARD','1','1','1'),(8,16,10.20,'2026-04-23 02:03:33','CREDIT_CARD','1','2','3'),(9,21,450000.00,'2026-04-24 01:53:09','CREDIT_CARD','12','12','12'),(10,22,450000.00,'2026-04-24 02:36:12','CREDIT_CARD','1','1','1'),(11,23,500000.00,'2026-04-24 22:14:48','CREDIT_CARD','1','1','1'),(12,27,950000.00,'2026-05-08 00:29:30','CREDIT_CARD','4111111111111111','12/28','123'),(13,30,2337500.00,'2026-05-08 21:55:39','CREDIT_CARD','123','123','123'),(14,31,204000.00,'2026-05-08 22:46:52','CREDIT_CARD','1','1','1'),(15,32,1485000.00,'2026-05-08 22:47:02','CREDIT_CARD','1','1','1');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `discount_percentage` decimal(5,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (3,'Promo Invierno',10.00,'2026-06-01','2026-08-31',1);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `package_id` bigint NOT NULL,
  `passenger_count` int NOT NULL,
  `reservation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `special_requests` text,
  `base_amount` decimal(10,2) NOT NULL,
  `discount_applied` decimal(10,2) NOT NULL DEFAULT '0.00',
  `final_amount` decimal(10,2) NOT NULL,
  `status` enum('PENDING','CONFIRMED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `discount_detail` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,1,2,'2026-04-13 10:55:37','dieta vegetariana',1700000.00,0.00,1700000.00,'CANCELLED',NULL),(2,1,1,2,'2026-04-13 11:07:49','dieta vegetariana',1700000.00,0.00,1700000.00,'CANCELLED',NULL),(3,1,1,2,'2026-04-13 18:21:40','dieta vegetariana',1700000.00,0.00,1700000.00,'CANCELLED',NULL),(4,1,1,5,'2026-04-20 23:50:07','dieta vegetarianas.',4250000.00,0.00,4250000.00,'CANCELLED',NULL),(5,1,1,1,'2026-04-21 00:14:19','silla de ruedas\n',850000.00,0.00,850000.00,'CANCELLED',NULL),(6,1,1,7,'2026-04-21 11:23:42','cr7',5950000.00,0.00,5950000.00,'CONFIRMED',NULL),(7,1,1,1,'2026-04-21 16:05:53','hola',850000.00,0.00,850000.00,'CONFIRMED',NULL),(8,1,2,1,'2026-04-21 16:39:17','2',500000.00,0.00,500000.00,'CANCELLED',NULL),(9,1,1,4,'2026-04-22 10:23:16','1',3400000.00,0.00,3400000.00,'CANCELLED',NULL),(10,1,5,10,'2026-04-22 17:12:55','',120.00,0.00,120.00,'CANCELLED',NULL),(11,1,1,4,'2026-04-23 01:34:50','',3400000.00,510000.00,2890000.00,'CANCELLED',NULL),(12,3,1,1,'2026-04-23 01:46:00','',850000.00,42500.00,807500.00,'CANCELLED',NULL),(13,3,1,1,'2026-04-23 01:47:45','',850000.00,85000.00,765000.00,'CANCELLED',NULL),(14,3,1,4,'2026-04-23 01:57:20','',3400000.00,680000.00,2720000.00,'CANCELLED','Descuento por grupo (10%) | Descuento por múltiples paquetes (5%) | Promo verano (5.00%)'),(15,1,5,1,'2026-04-23 02:03:05','hola',12.00,1.80,10.20,'CANCELLED','Descuento por cliente frecuente (5%) | Descuento por múltiples paquetes (5%) | Promo verano (5.00%)'),(16,1,5,1,'2026-04-23 02:03:27','a',12.00,1.80,10.20,'CANCELLED','Descuento por cliente frecuente (5%) | Descuento por múltiples paquetes (5%) | Promo verano (5.00%)'),(17,1,1,1,'2026-04-23 11:16:33','EXPIRACION',850000.00,85000.00,765000.00,'CANCELLED','Descuento por cliente frecuente (5%) | Descuento por múltiples paquetes (5%)'),(18,1,2,7,'2026-04-23 11:25:13','67',3500000.00,700000.00,2800000.00,'CANCELLED','Descuento por grupo (10%) | Descuento por cliente frecuente (5%) | Descuento por múltiples paquetes (5%)'),(19,1,2,1,'2026-04-23 11:33:22','67',500000.00,50000.00,450000.00,'CANCELLED','Descuento por cliente frecuente (5%) | Descuento por múltiples paquetes (5%)'),(20,1,2,1,'2026-04-23 13:30:33','asfas',500000.00,50000.00,450000.00,'CANCELLED','Descuento por cliente frecuente (5%) | Descuento por múltiples paquetes (5%)'),(21,1,2,1,'2026-04-24 01:53:04','yo',500000.00,50000.00,450000.00,'CONFIRMED','Descuento por cliente frecuente (5%) | Descuento por múltiples paquetes (5%)'),(22,1,2,1,'2026-04-24 02:36:08','AAAAAA',500000.00,50000.00,450000.00,'CONFIRMED','Descuento por cliente frecuente (5%) | Descuento por múltiples paquetes (5%)'),(23,3,2,1,'2026-04-24 22:14:41','',500000.00,0.00,500000.00,'CONFIRMED','Sin descuentos aplicados'),(24,3,1,2,'2026-04-24 22:15:27','PRUEBA',1700000.00,85000.00,1615000.00,'CANCELLED','Descuento por múltiples paquetes (5%)'),(25,3,7,1,'2026-04-25 13:21:23','',10000.00,500.00,9500.00,'CANCELLED','Descuento por múltiples paquetes (5%)'),(26,3,8,2,'2026-05-08 00:22:10','ventana preferida',1000000.00,50000.00,950000.00,'CANCELLED','Descuento por múltiples paquetes (5%)'),(27,3,8,2,'2026-05-08 00:29:03','ventana preferida',1000000.00,50000.00,950000.00,'CONFIRMED','Descuento por múltiples paquetes (5%)'),(28,3,8,1,'2026-05-08 21:48:35','X',550000.00,27500.00,522500.00,'CANCELLED','Descuento por múltiples paquetes (5%)'),(29,3,8,1,'2026-05-08 21:49:32','X',550000.00,27500.00,522500.00,'CANCELLED','Descuento por múltiples paquetes (5%)'),(30,3,8,5,'2026-05-08 21:55:33','',2750000.00,412500.00,2337500.00,'CANCELLED','Descuento por grupo (10%) | Descuento por múltiples paquetes (5%)'),(31,3,10,12,'2026-05-08 22:46:48','',240000.00,36000.00,204000.00,'CONFIRMED','Descuento por grupo (10%) | Descuento por múltiples paquetes (5%)'),(32,3,8,3,'2026-05-08 22:46:59','1',1650000.00,165000.00,1485000.00,'CONFIRMED','Descuento por cliente frecuente (5%) | Descuento por múltiples paquetes (5%)');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `identity_doc` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `role` enum('CLIENT','ADMIN') NOT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `failed_attempts` int NOT NULL DEFAULT '0',
  `locked_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin Principal','admin@travelagency.cl','1234','912345678','123','Brasil','ADMIN','ACTIVE',0,NULL),(2,'vicente tapia','vicente.tapia.s@usach.cl','sepulvedas','988200134',NULL,NULL,'CLIENT','ACTIVE',0,NULL),(3,'Cliente Prueba Editado','cliente@travelagency.cl','1234','999888777','123','Chilena','CLIENT','ACTIVE',0,NULL),(16,'prueba prueba','prueba@usach.cl','keycloak-managed','12345','12345','chila','CLIENT','ACTIVE',0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-09 14:42:27
