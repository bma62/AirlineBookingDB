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
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ticket` (
  `ticketNo` bigint NOT NULL AUTO_INCREMENT,
  `confirmationNo` bigint NOT NULL,
  `travelDocument` varchar(100) NOT NULL,
  `seatNo` varchar(10) NOT NULL,
  `flightNo` varchar(10) NOT NULL,
  `departureDate` date NOT NULL,
  PRIMARY KEY (`ticketNo`),
  KEY `confirmationNo` (`confirmationNo`),
  KEY `travelDocument` (`travelDocument`),
  KEY `seatNo` (`seatNo`,`flightNo`,`departureDate`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`confirmationNo`) REFERENCES `Booking` (`confirmationNo`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`travelDocument`) REFERENCES `Passenger` (`travelDocument`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`seatNo`, `flightNo`, `departureDate`) REFERENCES `Seat` (`seatNo`, `flightNo`, `departureDate`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
INSERT INTO `Ticket` VALUES (1,1,'M0001-1998','1A','AC001','2020-11-23'),(2,1,'16991015-1423','1B','AC001','2020-11-23'),(3,1,'16910606-5783','1C','AC001','2020-11-23'),(4,4,'16910606-5783','1A','AC001','2020-11-16'),(5,4,'16991015-1423','1B','AC001','2020-11-16');
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
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
