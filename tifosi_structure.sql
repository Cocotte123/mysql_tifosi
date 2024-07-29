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
-- Table structure for table `boisson`
--

DROP TABLE IF EXISTS `boisson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boisson` (
  `id_boisson` int NOT NULL AUTO_INCREMENT,
  `nom_boisson` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_boisson`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `age` int DEFAULT NULL,
  `cp_client` int DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `focaccia`
--

DROP TABLE IF EXISTS `focaccia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `focaccia` (
  `id_focaccia` int NOT NULL AUTO_INCREMENT,
  `nom_focaccia` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `prix_focaccia` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_focaccia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marque`
--

DROP TABLE IF EXISTS `marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marque` (
  `id_marque` int NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nom_menu` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `prix_menu` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-29 17:09:49
