CREATE DATABASE  IF NOT EXISTS `blog_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blog_schema`;
-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 172.24.0.3    Database: blog_schema
-- ------------------------------------------------------
-- Server version	8.0.27

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

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(40) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'nayan1@gmail.com','017-1234561','Dhaka 1','Dhaka-1','1111','2021-12-11 06:31:20'),(2,'nayan2@gmail.com','017-1234562','Dhaka 2','Dhaka-2','2222','2021-12-11 06:31:20'),(3,'nayan3@gmail.com','017-1234563','Dhaka 3','Dhaka-3','3333','2021-12-11 06:31:20'),(4,'nayan4@gmail.com','017-1234564','Dhaka 4','Dhaka-4','4444','2021-12-11 06:31:20'),(5,'nayan5@gmail.com','017-1234565','Dhaka 5','Dhaka-5','5555','2021-12-11 06:31:20'),(6,'nayan6@gmail.com','017-1234566','Dhaka 6','Dhaka-6','6666','2021-12-11 06:31:20'),(7,'nayan7@gmail.com','017-1234567','Dhaka 7','Dhaka-7','7777','2021-12-11 06:31:20'),(8,'nayan8@gmail.com','017-1234568','Dhaka 8','Dhaka-8','8888','2021-12-11 06:31:20'),(9,'nayan9@gmail.com','017-1234569','Dhaka 9','Dhaka-9','9999','2021-12-11 06:31:20'),(10,'nayan10@gmail.com','017-12345610','Dhaka 10','Dhaka-10','1010','2021-12-11 06:31:20');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,1,NULL,'Comment 1','2021-12-11 06:33:20','2021-12-11 06:33:20'),(2,1,2,NULL,'Comment 2','2021-12-11 06:33:20','2021-12-11 06:33:20'),(3,2,3,NULL,'Comment 3','2021-12-11 06:33:20','2021-12-11 06:33:20'),(4,2,4,NULL,'Comment 4','2021-12-11 06:33:20','2021-12-11 06:33:20'),(5,2,5,NULL,'Comment 5','2021-12-11 06:33:20','2021-12-11 06:33:20'),(6,3,6,NULL,'Comment 6','2021-12-11 06:33:20','2021-12-11 06:33:20'),(7,3,7,NULL,'Comment 7','2021-12-11 06:33:20','2021-12-11 06:33:20'),(8,3,8,NULL,'Comment 8','2021-12-11 06:33:20','2021-12-11 06:33:20'),(9,4,9,NULL,'Comment 9','2021-12-11 06:33:20','2021-12-11 06:33:20'),(10,4,10,NULL,'Comment 10','2021-12-11 06:33:20','2021-12-11 06:33:20'),(11,5,1,NULL,'Comment 11','2021-12-11 06:33:20','2021-12-11 06:33:20'),(12,5,2,NULL,'Comment 12','2021-12-11 06:33:20','2021-12-11 06:33:20'),(13,6,3,NULL,'Comment 13','2021-12-11 06:33:20','2021-12-11 06:33:20'),(14,6,4,NULL,'Comment 14','2021-12-11 06:33:20','2021-12-11 06:33:20'),(15,6,5,NULL,'Comment 15','2021-12-11 06:33:20','2021-12-11 06:33:20'),(16,7,6,NULL,'Comment 16','2021-12-11 06:33:20','2021-12-11 06:33:20'),(17,7,7,NULL,'Comment 17','2021-12-11 06:33:20','2021-12-11 06:33:20'),(18,7,8,NULL,'Comment 18','2021-12-11 06:33:20','2021-12-11 06:33:20'),(19,8,9,NULL,'Comment 19','2021-12-11 06:33:20','2021-12-11 06:33:20'),(20,8,10,NULL,'Comment 20','2021-12-11 06:33:20','2021-12-11 06:33:20'),(21,9,1,NULL,'Comment 21','2021-12-11 06:33:20','2021-12-11 06:33:20'),(22,9,2,NULL,'Comment 22','2021-12-11 06:33:20','2021-12-11 06:33:20'),(23,10,3,NULL,'Comment 23','2021-12-11 06:33:20','2021-12-11 06:33:20'),(24,10,4,NULL,'Comment 24','2021-12-11 06:33:20','2021-12-11 06:33:20'),(25,10,5,NULL,'Comment 25','2021-12-11 06:33:20','2021-12-11 06:33:20'),(26,11,6,NULL,'Comment 26','2021-12-11 06:33:20','2021-12-11 06:33:20'),(27,11,7,NULL,'Comment 27','2021-12-11 06:33:20','2021-12-11 06:33:20'),(28,11,8,NULL,'Comment 28','2021-12-11 06:33:20','2021-12-11 06:33:20'),(29,12,9,NULL,'Comment 29','2021-12-11 06:33:20','2021-12-11 06:33:20'),(30,12,10,NULL,'Comment 30','2021-12-11 06:33:20','2021-12-11 06:33:20'),(31,13,1,NULL,'Comment 31','2021-12-11 06:33:20','2021-12-11 06:33:20'),(32,13,2,NULL,'Comment 32','2021-12-11 06:33:20','2021-12-11 06:33:20'),(33,14,3,NULL,'Comment 33','2021-12-11 06:33:20','2021-12-11 06:33:20'),(34,14,4,NULL,'Comment 34','2021-12-11 06:33:20','2021-12-11 06:33:20'),(35,14,5,NULL,'Comment 35','2021-12-11 06:33:20','2021-12-11 06:33:20'),(36,15,6,NULL,'Comment 36','2021-12-11 06:33:20','2021-12-11 06:33:20'),(37,15,7,NULL,'Comment 37','2021-12-11 06:33:20','2021-12-11 06:33:20'),(38,15,8,NULL,'Comment 38','2021-12-11 06:33:20','2021-12-11 06:33:20'),(39,16,9,NULL,'Comment 39','2021-12-11 06:33:20','2021-12-11 06:33:20'),(40,16,10,NULL,'Comment 40','2021-12-11 06:33:20','2021-12-11 06:33:20'),(41,17,1,NULL,'Comment 41','2021-12-11 06:33:20','2021-12-11 06:33:20'),(42,17,2,NULL,'Comment 42','2021-12-11 06:33:20','2021-12-11 06:33:20'),(43,18,3,NULL,'Comment 43','2021-12-11 06:33:20','2021-12-11 06:33:20'),(44,18,4,NULL,'Comment 44','2021-12-11 06:33:20','2021-12-11 06:33:20'),(45,18,5,NULL,'Comment 45','2021-12-11 06:33:20','2021-12-11 06:33:20'),(46,19,6,NULL,'Comment 46','2021-12-11 06:33:20','2021-12-11 06:33:20'),(47,19,7,NULL,'Comment 47','2021-12-11 06:33:20','2021-12-11 06:33:20'),(48,19,8,NULL,'Comment 48','2021-12-11 06:33:20','2021-12-11 06:33:20'),(49,20,9,NULL,'Comment 49','2021-12-11 06:33:20','2021-12-11 06:33:20'),(50,20,10,NULL,'Comment 50','2021-12-11 06:33:20','2021-12-11 06:33:20'),(51,1,1,1,'Child Comment 1','2021-12-11 06:33:20','2021-12-11 06:33:20'),(52,1,2,51,'Child Comment 2','2021-12-11 06:33:20','2021-12-11 06:33:20'),(53,2,3,51,'Child Comment 3','2021-12-11 06:33:20','2021-12-11 06:33:20'),(54,2,4,51,'Child Comment 4','2021-12-11 06:33:20','2021-12-11 06:33:20'),(55,2,5,7,'Child Comment 5','2021-12-11 06:33:20','2021-12-11 06:33:20'),(56,3,7,7,'Child Comment 7','2021-12-11 06:33:20','2021-12-11 06:33:20'),(57,3,8,7,'Child Comment 8','2021-12-11 06:33:20','2021-12-11 06:33:20'),(58,3,6,7,'Child Comment 6','2021-12-11 06:33:20','2021-12-11 06:33:20'),(59,4,9,7,'Child Comment 9','2021-12-11 06:33:20','2021-12-11 06:33:20'),(60,4,10,10,'Child Comment 10','2021-12-11 06:33:20','2021-12-11 06:33:20'),(61,5,1,11,'Child Comment 11','2021-12-11 06:33:20','2021-12-11 06:33:20'),(62,5,2,11,'Child Comment 12','2021-12-11 06:33:20','2021-12-11 06:33:20'),(63,6,3,11,'Child Comment 13','2021-12-11 06:33:20','2021-12-11 06:33:20'),(64,6,4,11,'Child Comment 14','2021-12-11 06:33:20','2021-12-11 06:33:20'),(65,6,5,11,'Child Comment 15','2021-12-11 06:33:20','2021-12-11 06:33:20'),(66,7,6,11,'Child Comment 16','2021-12-11 06:33:20','2021-12-11 06:33:20'),(67,7,7,17,'Child Comment 17','2021-12-11 06:33:20','2021-12-11 06:33:20'),(68,7,8,18,'Child Comment 18','2021-12-11 06:33:20','2021-12-11 06:33:20'),(69,8,9,19,'Child Comment 19','2021-12-11 06:33:20','2021-12-11 06:33:20'),(70,8,10,20,'Child Comment 20','2021-12-11 06:33:20','2021-12-11 06:33:20'),(71,9,1,21,'Child Comment 21','2021-12-11 06:33:20','2021-12-11 06:33:20'),(72,9,2,22,'Child Comment 22','2021-12-11 06:33:20','2021-12-11 06:33:20'),(73,10,3,19,'Child Comment 23','2021-12-11 06:33:20','2021-12-11 06:33:20'),(74,10,4,19,'Child Comment 24','2021-12-11 06:33:20','2021-12-11 06:33:20'),(75,10,5,19,'Child Comment 25','2021-12-11 06:33:20','2021-12-11 06:33:20'),(76,11,6,19,'Child Comment 26','2021-12-11 06:33:20','2021-12-11 06:33:20'),(77,11,7,19,'Child Comment 27','2021-12-11 06:33:20','2021-12-11 06:33:20'),(78,11,8,19,'Child Comment 28','2021-12-11 06:33:20','2021-12-11 06:33:20'),(79,12,9,29,'Child Comment 29','2021-12-11 06:33:20','2021-12-11 06:33:20'),(80,12,10,30,'Child Comment 30','2021-12-11 06:33:20','2021-12-11 06:33:20'),(81,13,1,31,'Child Comment 31','2021-12-11 06:33:20','2021-12-11 06:33:20'),(82,13,2,32,'Child Comment 32','2021-12-11 06:33:20','2021-12-11 06:33:20'),(83,14,3,33,'Child Comment 33','2021-12-11 06:33:20','2021-12-11 06:33:20');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_vote`
--

DROP TABLE IF EXISTS `comment_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_vote` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `vote` enum('U','D') NOT NULL DEFAULT 'U',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_commont` (`comment_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_vote_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_vote_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_vote`
--

LOCK TABLES `comment_vote` WRITE;
/*!40000 ALTER TABLE `comment_vote` DISABLE KEYS */;
INSERT INTO `comment_vote` VALUES (1,3,2,'U','2021-12-11 06:33:28'),(2,3,3,'U','2021-12-11 06:33:28'),(3,5,5,'U','2021-12-11 06:33:28'),(4,5,6,'D','2021-12-11 06:33:28'),(5,5,7,'D','2021-12-11 06:33:28'),(6,5,8,'D','2021-12-11 06:33:28'),(7,7,9,'D','2021-12-11 06:33:28'),(8,7,10,'U','2021-12-11 06:33:28'),(9,7,2,'U','2021-12-11 06:33:28'),(10,11,2,'U','2021-12-11 06:33:28'),(11,11,3,'U','2021-12-11 06:33:28'),(12,11,4,'U','2021-12-11 06:33:28'),(13,11,5,'U','2021-12-11 06:33:28'),(14,11,7,'U','2021-12-11 06:33:28'),(15,11,8,'U','2021-12-11 06:33:28'),(16,13,9,'U','2021-12-11 06:33:28'),(17,13,10,'U','2021-12-11 06:33:28'),(18,13,2,'U','2021-12-11 06:33:28'),(19,17,2,'U','2021-12-11 06:33:28'),(20,17,3,'U','2021-12-11 06:33:28'),(21,17,4,'D','2021-12-11 06:33:28'),(22,17,5,'D','2021-12-11 06:33:28'),(23,19,3,'D','2021-12-11 06:33:28'),(24,19,4,'D','2021-12-11 06:33:28'),(25,19,5,'U','2021-12-11 06:33:28'),(26,19,7,'U','2021-12-11 06:33:28'),(27,29,7,'U','2021-12-11 06:33:28'),(28,31,2,'D','2021-12-11 06:33:28'),(29,31,3,'D','2021-12-11 06:33:28'),(30,31,4,'D','2021-12-11 06:33:28'),(31,31,5,'D','2021-12-11 06:33:28'),(32,31,7,'D','2021-12-11 06:33:28'),(33,31,8,'D','2021-12-11 06:33:28'),(34,31,9,'D','2021-12-11 06:33:28'),(35,33,10,'U','2021-12-11 06:33:28'),(36,35,2,'D','2021-12-11 06:33:28'),(37,49,3,'D','2021-12-11 06:33:28'),(38,49,4,'D','2021-12-11 06:33:28'),(39,49,5,'D','2021-12-11 06:33:28'),(40,49,7,'D','2021-12-11 06:33:28'),(41,49,8,'U','2021-12-11 06:33:28'),(42,49,9,'U','2021-12-11 06:33:28');
/*!40000 ALTER TABLE `comment_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(512) NOT NULL,
  `name` varchar(128) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `height` int unsigned NOT NULL,
  `width` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'media/path/image1.jpg','image1.jpg','jpg',100,100,'2021-12-11 06:32:03'),(2,'media/path/image2.jpg','image2.jpg','jpg',100,200,'2021-12-11 06:32:03'),(3,'media/path/image3.jpg','image3.jpg','jpg',100,300,'2021-12-11 06:32:03'),(4,'media/path/image4.jpg','image4.jpg','jpg',100,400,'2021-12-11 06:32:03'),(5,'media/path/image5.jpg','image5.jpg','jpg',100,500,'2021-12-11 06:32:03'),(6,'media/path/image6.jpg','image6.jpg','jpg',100,600,'2021-12-11 06:32:03'),(7,'media/path/image7.jpg','image7.jpg','jpg',100,700,'2021-12-11 06:32:03'),(8,'media/path/image8.jpg','image8.jpg','jpg',100,800,'2021-12-11 06:32:03'),(9,'media/path/image9.jpg','image9.jpg','jpg',100,900,'2021-12-11 06:32:03'),(10,'media/path/image10.jpg','image10.jpg','jpg',100,1000,'2021-12-11 06:32:03');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `cover_image` varchar(512) DEFAULT NULL,
  `draft` tinyint DEFAULT '1',
  `is_published` tinyint NOT NULL DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,'Title 1','title-1','Big content 1','media/path/image1.jpg',0,0,'2021-12-01 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(2,2,'Title 2','title-2','Big content 2','media/path/image2.jpg',0,0,'2021-12-02 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(3,3,'Title 3','title-3','Big content 3','media/path/image3.jpg',0,0,'2021-12-03 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(4,4,'Title 4','title-4','Big content 4','media/path/image4.jpg',0,0,'2021-12-04 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(5,5,'Title 5','title-5','Big content 5','media/path/image5.jpg',0,0,'2021-12-05 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(6,6,'Title 6','title-6','Big content 6','media/path/image6.jpg',0,0,'2021-12-06 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(7,7,'Title 7','title-7','Big content 7','media/path/image7.jpg',0,0,'2021-12-07 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(8,8,'Title 8','title-8','Big content 8','media/path/image8.jpg',0,0,'2021-12-08 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(9,9,'Title 9','title-9','Big content 9','media/path/image9.jpg',0,0,'2021-12-09 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(10,10,'Title 10','title-10','Big content 10','media/path/image10.jpg',0,0,'2021-12-10 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(11,1,'Title 11','title-11','Big content 11','media/path/image11.jpg',0,0,'2021-12-11 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(12,2,'Title 12','title-12','Big content 12','media/path/image12.jpg',0,0,'2021-12-12 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(13,3,'Title 13','title-13','Big content 13','media/path/image13.jpg',0,0,'2021-12-13 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(14,4,'Title 14','title-14','Big content 14','media/path/image14.jpg',0,0,'2021-12-14 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(15,5,'Title 15','title-15','Big content 15','media/path/image15.jpg',0,0,'2021-12-15 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(16,6,'Title 16','title-16','Big content 16','media/path/image16.jpg',0,0,'2021-12-16 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(17,7,'Title 17','title-17','Big content 17','media/path/image17.jpg',0,0,'2021-12-17 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(18,8,'Title 18','title-18','Big content 18','media/path/image18.jpg',0,0,'2021-12-18 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(19,9,'Title 19','title-19','Big content 19','media/path/image19.jpg',0,0,'2021-12-19 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43'),(20,10,'Title 20','title-20','Big content 20','media/path/image20.jpg',0,0,'2021-12-20 00:00:00','2021-12-11 06:32:43','2021-12-11 06:32:43');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_image`
--

DROP TABLE IF EXISTS `post_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_image` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `image_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_post_image` (`post_id`,`image_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `post_image_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_image`
--

LOCK TABLES `post_image` WRITE;
/*!40000 ALTER TABLE `post_image` DISABLE KEYS */;
INSERT INTO `post_image` VALUES (1,2,1,'2021-12-11 06:33:01'),(2,2,2,'2021-12-11 06:33:01'),(3,2,3,'2021-12-11 06:33:01'),(4,4,4,'2021-12-11 06:33:01'),(5,4,5,'2021-12-11 06:33:01'),(6,4,6,'2021-12-11 06:33:01'),(7,6,7,'2021-12-11 06:33:01'),(8,6,8,'2021-12-11 06:33:01'),(9,6,9,'2021-12-11 06:33:01'),(10,8,10,'2021-12-11 06:33:01'),(11,8,1,'2021-12-11 06:33:01'),(12,8,2,'2021-12-11 06:33:01'),(13,10,3,'2021-12-11 06:33:01'),(14,10,4,'2021-12-11 06:33:01'),(15,10,5,'2021-12-11 06:33:01'),(16,12,6,'2021-12-11 06:33:01'),(17,12,7,'2021-12-11 06:33:01'),(18,12,8,'2021-12-11 06:33:01'),(19,14,9,'2021-12-11 06:33:01'),(20,14,10,'2021-12-11 06:33:01'),(21,16,1,'2021-12-11 06:33:01'),(22,16,2,'2021-12-11 06:33:01'),(23,16,3,'2021-12-11 06:33:01'),(24,18,4,'2021-12-11 06:33:01'),(25,18,5,'2021-12-11 06:33:01'),(26,18,6,'2021-12-11 06:33:01'),(27,20,7,'2021-12-11 06:33:01'),(28,20,8,'2021-12-11 06:33:01'),(29,20,9,'2021-12-11 06:33:01'),(30,20,10,'2021-12-11 06:33:01');
/*!40000 ALTER TABLE `post_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `post_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,1),(7,1),(15,1),(1,2),(7,2),(15,2),(1,3),(9,3),(17,3),(3,4),(9,4),(17,4),(3,5),(9,5),(17,5),(3,6),(11,6),(19,6),(5,7),(11,7),(19,7),(5,8),(11,8),(19,8),(5,9),(13,9),(7,10),(13,10);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_vote`
--

DROP TABLE IF EXISTS `post_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_vote` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `vote` enum('U','D') NOT NULL DEFAULT 'U',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_post` (`post_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_vote_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_vote_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_vote`
--

LOCK TABLES `post_vote` WRITE;
/*!40000 ALTER TABLE `post_vote` DISABLE KEYS */;
INSERT INTO `post_vote` VALUES (1,1,3,'U','2021-12-11 06:33:11'),(2,1,4,'D','2021-12-11 06:33:11'),(3,1,7,'U','2021-12-11 06:33:11'),(4,5,1,'D','2021-12-11 06:33:11'),(5,5,2,'U','2021-12-11 06:33:11'),(6,5,3,'D','2021-12-11 06:33:11'),(7,5,4,'U','2021-12-11 06:33:11'),(8,5,5,'D','2021-12-11 06:33:11'),(9,5,6,'U','2021-12-11 06:33:11'),(10,8,1,'U','2021-12-11 06:33:11'),(11,8,2,'D','2021-12-11 06:33:11'),(12,8,3,'U','2021-12-11 06:33:11'),(13,8,4,'D','2021-12-11 06:33:11'),(14,8,9,'U','2021-12-11 06:33:11'),(15,11,10,'U','2021-12-11 06:33:11'),(16,17,2,'U','2021-12-11 06:33:11'),(17,17,3,'U','2021-12-11 06:33:11'),(18,17,4,'U','2021-12-11 06:33:11'),(19,17,5,'U','2021-12-11 06:33:11'),(20,19,1,'U','2021-12-11 06:33:11'),(21,19,2,'U','2021-12-11 06:33:11'),(22,19,3,'U','2021-12-11 06:33:11'),(23,19,4,'U','2021-12-11 06:33:11'),(24,19,5,'U','2021-12-11 06:33:11'),(25,19,6,'U','2021-12-11 06:33:11');
/*!40000 ALTER TABLE `post_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Name 1'),(10,'Name 10'),(2,'Name 2'),(3,'Name 3'),(4,'Name 4'),(5,'Name 5'),(6,'Name 6'),(7,'Name 7'),(8,'Name 8'),(9,'Name 9');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_id` int unsigned DEFAULT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `full_name` varchar(128) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `sex` enum('U','M','F','Q') NOT NULL DEFAULT 'U',
  `is_active` tinyint DEFAULT '1',
  `is_staff` tinyint DEFAULT '0',
  `is_superuser` tinyint DEFAULT '0',
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'nayan32biswas-1','nayan-1@gmail.com','hash-password-1','Nayan 1','0200-12-01','U',1,1,1,'2021-12-11 06:31:45','2021-12-11 06:31:45','2021-12-11 06:31:45'),(2,2,'nayan32biswas-2','nayan-2@gmail.com','hash-password-2','Nayan 2','0200-12-01','U',1,0,0,'2021-12-11 06:31:45','2021-12-11 06:31:45','2021-12-11 06:31:45'),(3,3,'nayan32biswas-3','nayan-3@gmail.com','hash-password-3','Nayan 3','0200-12-01','U',1,0,0,'2021-12-11 06:31:45','2021-12-11 06:31:45','2021-12-11 06:31:45'),(4,4,'nayan32biswas-4','nayan-4@gmail.com','hash-password-4','Nayan 4','0200-12-01','U',1,0,0,'2021-12-11 06:31:45','2021-12-11 06:31:45','2021-12-11 06:31:45'),(5,5,'nayan32biswas-5','nayan-5@gmail.com','hash-password-5','Nayan 5','0200-12-01','U',1,0,0,'2021-12-11 06:31:45','2021-12-11 06:31:45','2021-12-11 06:31:45'),(6,6,'nayan32biswas-6','nayan-6@gmail.com','hash-password-6','Nayan 6','0200-12-01','U',1,0,0,'2021-12-11 06:31:45','2021-12-11 06:31:45','2021-12-11 06:31:45'),(7,7,'nayan32biswas-7','nayan-7@gmail.com','hash-password-7','Nayan 7','0200-12-01','U',1,0,0,'2021-12-11 06:31:45','2021-12-11 06:31:45','2021-12-11 06:31:45'),(8,8,'nayan32biswas-8','nayan-8@gmail.com','hash-password-8','Nayan 8','0200-12-01','U',1,0,0,'2021-12-11 06:31:45','2021-12-11 06:31:45','2021-12-11 06:31:45'),(9,9,'nayan32biswas-9','nayan-9@gmail.com','hash-password-9','Nayan 9','0200-12-01','U',1,0,0,'2021-12-11 06:31:45','2021-12-11 06:31:45','2021-12-11 06:31:45'),(10,10,'nayan32biswas-10','nayan-10@gmail.com','hash-password-10','Nayan 10','0200-12-01','U',1,0,0,'2021-12-11 06:31:45','2021-12-11 06:31:45','2021-12-11 06:31:45');
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

-- Dump completed on 2021-12-11 12:37:08
