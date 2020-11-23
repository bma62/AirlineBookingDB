-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: airline-ticket-database
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking` (
  `confirmationNo` bigint NOT NULL AUTO_INCREMENT,
  `bookingStatus` varchar(20) NOT NULL,
  `numSeatsBooked` smallint NOT NULL,
  `numPointsEarned` int NOT NULL,
  `transactionDate` date NOT NULL,
  `transactionAmount` decimal(10,2) NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`confirmationNo`),
  KEY `username` (`username`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`username`) REFERENCES `Client` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (1,'Booked',5,500,'2020-11-20',2500.00,'bma62'),(2,'Cancelled',1,100,'2020-11-22',500.00,'ana83'),(3,'Completed',2,200,'2020-11-10',1000.00,'cary89'),(4,'Booked',4,400,'2020-11-22',2000.00,'spencer34'),(5,'Booked',1,100,'2020-11-23',500.00,'riley01');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 17:29:57
