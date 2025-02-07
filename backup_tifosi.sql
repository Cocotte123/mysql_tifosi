CREATE DATABASE  IF NOT EXISTS `tifosi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tifosi`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: tifosi
-- ------------------------------------------------------
-- Server version	9.0.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE USER IF NOT EXISTS  'tifosi'@'localhost' IDENTIFIED BY 'tifosi';
GRANT ALL PRIVILEGES ON tifosi . * TO 'tifosi'@'localhost';

--
-- Table structure for table `achete`
--

DROP TABLE IF EXISTS `achete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achete` (
  `client_id_client` int NOT NULL,
  `focaccia_id_focaccia` int NOT NULL,
  `jour` date DEFAULT NULL,
  PRIMARY KEY (`client_id_client`,`focaccia_id_focaccia`),
  KEY `fk_client_has_focaccia_focaccia1_idx` (`focaccia_id_focaccia`),
  KEY `fk_client_has_focaccia_client1_idx` (`client_id_client`),
  CONSTRAINT `fk_client_has_focaccia_client1` FOREIGN KEY (`client_id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `fk_client_has_focaccia_focaccia1` FOREIGN KEY (`focaccia_id_focaccia`) REFERENCES `focaccia` (`id_focaccia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achete`
--

LOCK TABLES `achete` WRITE;
/*!40000 ALTER TABLE `achete` DISABLE KEYS */;
/*!40000 ALTER TABLE `achete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appartient`
--

DROP TABLE IF EXISTS `appartient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appartient` (
  `boisson_id_boisson` int NOT NULL,
  `marque_id_marque` int NOT NULL,
  PRIMARY KEY (`boisson_id_boisson`,`marque_id_marque`),
  KEY `fk_boisson_has_marque_marque1_idx` (`marque_id_marque`),
  KEY `fk_boisson_has_marque_boisson_idx` (`boisson_id_boisson`),
  CONSTRAINT `fk_boisson_has_marque_boisson` FOREIGN KEY (`boisson_id_boisson`) REFERENCES `boisson` (`id_boisson`),
  CONSTRAINT `fk_boisson_has_marque_marque1` FOREIGN KEY (`marque_id_marque`) REFERENCES `marque` (`id_marque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartient`
--

LOCK TABLES `appartient` WRITE;
/*!40000 ALTER TABLE `appartient` DISABLE KEYS */;
INSERT INTO `appartient` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(12,2),(10,3),(11,3),(6,4),(7,4),(8,4),(9,4);
/*!40000 ALTER TABLE `appartient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boisson`
--

DROP TABLE IF EXISTS `boisson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boisson` (
  `id_boisson` int NOT NULL AUTO_INCREMENT,
  `nom_boisson` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_boisson`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boisson`
--

LOCK TABLES `boisson` WRITE;
/*!40000 ALTER TABLE `boisson` DISABLE KEYS */;
INSERT INTO `boisson` VALUES (1,'Coca-cola zéro'),(2,'Coca-cola original'),(3,'Fanta citron'),(4,'Fanta orange'),(5,'Capri-sun'),(6,'Pepsi'),(7,'Pepsi Max Zéro'),(8,'Lipton zéro citron'),(9,'Lipton Peach'),(10,'Monster energy ultra gold'),(11,'Monster energy ultra blue'),(12,'Eau de source ');
/*!40000 ALTER TABLE `boisson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `age` int DEFAULT NULL,
  `cp_client` int DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprend`
--

DROP TABLE IF EXISTS `comprend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprend` (
  `focaccia_id_focaccia` int NOT NULL,
  `ingredient_id_ingredient` int NOT NULL,
  PRIMARY KEY (`focaccia_id_focaccia`,`ingredient_id_ingredient`),
  KEY `fk_focaccia_has_ingredient_ingredient1_idx` (`ingredient_id_ingredient`),
  KEY `fk_focaccia_has_ingredient_focaccia1_idx` (`focaccia_id_focaccia`),
  CONSTRAINT `fk_focaccia_has_ingredient_focaccia1` FOREIGN KEY (`focaccia_id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  CONSTRAINT `fk_focaccia_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_id_ingredient`) REFERENCES `ingredient` (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprend`
--

LOCK TABLES `comprend` WRITE;
/*!40000 ALTER TABLE `comprend` DISABLE KEYS */;
INSERT INTO `comprend` VALUES (1,1),(2,1),(3,1),(8,1),(6,2),(1,3),(8,3),(6,4),(7,4),(1,5),(2,5),(3,5),(5,5),(6,5),(7,5),(4,6),(8,6),(1,7),(2,7),(3,7),(4,7),(5,7),(8,7),(8,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(4,10),(2,11),(5,12),(1,13),(8,13),(8,14),(4,15),(1,16),(2,16),(5,16),(6,16),(7,16),(8,16),(5,17),(1,18),(2,18),(3,18),(4,18),(5,18),(6,18),(7,18),(8,18),(6,19),(1,20),(2,20),(3,20),(4,20),(5,20),(6,20),(7,20),(8,20),(7,21),(8,21),(3,22);
/*!40000 ALTER TABLE `comprend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contient`
--

DROP TABLE IF EXISTS `contient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contient` (
  `menu_id_menu` int NOT NULL,
  `boisson_id_boisson` int NOT NULL,
  PRIMARY KEY (`menu_id_menu`,`boisson_id_boisson`),
  KEY `fk_menu_has_boisson_boisson1_idx` (`boisson_id_boisson`),
  KEY `fk_menu_has_boisson_menu1_idx` (`menu_id_menu`),
  CONSTRAINT `fk_menu_has_boisson_boisson1` FOREIGN KEY (`boisson_id_boisson`) REFERENCES `boisson` (`id_boisson`),
  CONSTRAINT `fk_menu_has_boisson_menu1` FOREIGN KEY (`menu_id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contient`
--

LOCK TABLES `contient` WRITE;
/*!40000 ALTER TABLE `contient` DISABLE KEYS */;
/*!40000 ALTER TABLE `contient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `est_constitue`
--

DROP TABLE IF EXISTS `est_constitue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `est_constitue` (
  `focaccia_id_focaccia` int NOT NULL,
  `menu_id_menu` int NOT NULL,
  PRIMARY KEY (`focaccia_id_focaccia`,`menu_id_menu`),
  KEY `fk_focaccia_has_menu_menu1_idx` (`menu_id_menu`),
  KEY `fk_focaccia_has_menu_focaccia1_idx` (`focaccia_id_focaccia`),
  CONSTRAINT `fk_focaccia_has_menu_focaccia1` FOREIGN KEY (`focaccia_id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  CONSTRAINT `fk_focaccia_has_menu_menu1` FOREIGN KEY (`menu_id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `est_constitue`
--

LOCK TABLES `est_constitue` WRITE;
/*!40000 ALTER TABLE `est_constitue` DISABLE KEYS */;
/*!40000 ALTER TABLE `est_constitue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focaccia`
--

DROP TABLE IF EXISTS `focaccia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `focaccia` (
  `id_focaccia` int NOT NULL AUTO_INCREMENT,
  `nom_focaccia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `prix_focaccia` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focaccia`
--

LOCK TABLES `focaccia` WRITE;
/*!40000 ALTER TABLE `focaccia` DISABLE KEYS */;
INSERT INTO `focaccia` VALUES (1,'Mozaccia',9.8),(2,'Gorgonzollaccia',10.8),(3,'Raclaccia',8.9),(4,'Emmentalaccia',9.8),(5,'Tradizione',8.9),(6,'Hawaienne',11.2),(7,'AmÃ©ricaine',10.8),(8,'Paysanne',12.8);
/*!40000 ALTER TABLE `focaccia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Ail'),(2,'Ananas'),(3,'Artichaut'),(4,'Bacon'),(5,'Base Tomate'),(6,'Base crÃ¨me'),(7,'Champignon'),(8,'Chevre'),(9,'Cresson'),(10,'Emmental'),(11,'Gorgonzola'),(12,'Jambon cuit'),(13,'Jambon fumÃ©'),(14,'Oeuf'),(15,'Oignon'),(16,'Olive noire'),(17,'Olive verte'),(18,'Parmesan'),(19,'Piment'),(20,'Poivre'),(21,'Pomme de terre'),(22,'Raclette'),(23,'Salami'),(24,'Tomate cerise');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marque`
--

DROP TABLE IF EXISTS `marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marque` (
  `id_marque` int NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque`
--

LOCK TABLES `marque` WRITE;
/*!40000 ALTER TABLE `marque` DISABLE KEYS */;
INSERT INTO `marque` VALUES (1,'Coca-cola'),(2,'Cristalline'),(3,'Monster'),(4,'Pepsico');
/*!40000 ALTER TABLE `marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `prix_menu` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paye`
--

DROP TABLE IF EXISTS `paye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paye` (
  `client_id_client` int NOT NULL,
  `menu_id_menu` int NOT NULL,
  `jour` date DEFAULT NULL,
  PRIMARY KEY (`client_id_client`,`menu_id_menu`),
  KEY `fk_client_has_menu_menu1_idx` (`menu_id_menu`),
  KEY `fk_client_has_menu_client1_idx` (`client_id_client`),
  CONSTRAINT `fk_client_has_menu_client1` FOREIGN KEY (`client_id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `fk_client_has_menu_menu1` FOREIGN KEY (`menu_id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paye`
--

LOCK TABLES `paye` WRITE;
/*!40000 ALTER TABLE `paye` DISABLE KEYS */;
/*!40000 ALTER TABLE `paye` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-29 17:25:44
