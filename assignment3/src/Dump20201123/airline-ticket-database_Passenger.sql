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
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passenger` (
  `travelDocument` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  PRIMARY KEY (`travelDocument`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES ('16000228-9684','Josiah','Holcomb'),('16010823-3214','Evangeline','Cabrera'),('16031229-8268','Reagan','Patel'),('16040530-9543','Amir','Bryant'),('16050402-0173','Micah','Mullen'),('16050604-5038','Keiko','Good'),('16060325-8625','Regina','Henson'),('16060510-0759','Raymond','Moon'),('16061230-7694','Martin','Huff'),('16070614-5166','Burton','Sharp'),('16090327-1120','Alexander','Edwards'),('16090703-4078','Levi','Macias'),('16090903-1809','Troy','Gonzales'),('16100528-7683','Martina','Hammond'),('16101007-7111','Noelle','Wright'),('16101008-5239','Desiree','Weaver'),('16110206-6022','Joseph','Sellers'),('16111009-2648','Yeo','Moses'),('16120511-2749','Buffy','Montoya'),('16131128-1933','Meredith','Holloway'),('16140805-3104','Gillian','Mcdonald'),('16150310-2319','Candice','Rush'),('16150423-5282','Aurelia','Reyes'),('16160304-0336','Paul','Barlow'),('16160922-8588','Porter','Brown'),('16161111-3711','Nora','Martin'),('16170930-1624','Barry','Leach'),('16190219-6698','Cruz','Fuller'),('16191226-6457','Keaton','Pickett'),('16260227-4298','Clementine','Spears'),('16261029-9600','Germaine','Mayo'),('16271225-4412','Josephine','Riggs'),('16340528-0565','Luke','Glass'),('16351006-8632','Serina','Washington'),('16360709-1679','Hiroko','Gay'),('16360928-2953','Ebony','Sandoval'),('16381206-7498','Gwendolyn','Maddox'),('16400921-6765','Amir','Franklin'),('16410417-1642','Lawrence','Suarez'),('16430425-9379','Roary','Armstrong'),('16440526-2314','Hanna','Case'),('16450226-1243','Chaney','Stanton'),('16450413-7565','Abel','England'),('16451017-8900','Len','Duke'),('16470315-5103','Lawrence','Whitfield'),('16480502-9560','Alea','Kaufman'),('16490305-3546','Fulton','Blair'),('16490621-7072','Aphrodite','Taylor'),('16490904-1982','Walter','Mullins'),('16491201-6724','Carolyn','Hall'),('16500402-9038','Robin','Orr'),('16510109-6732','Natalie','Charles'),('16520703-3324','Hedley','Lynch'),('16520915-2577','Lyle','Hines'),('16550624-6338','Brittany','Garza'),('16550923-8845','Bianca','Gibbs'),('16560308-7742','Kirk','Avila'),('16580430-8590','Wesley','Pennington'),('16580718-5201','Lester','Sherman'),('16581104-5979','Iola','Armstrong'),('16581130-0689','Melvin','Matthews'),('16590402-3420','Flynn','Gibson'),('16600221-0950','Kiayada','Hickman'),('16610515-2992','Colton','Horn'),('16641007-4782','Jillian','Cardenas'),('16650229-7226','Keane','Stein'),('16660906-5948','Kylie','Hopper'),('16670111-8249','Elizabeth','Carter'),('16670311-9898','Winter','Norris'),('16680307-1361','Casey','Wolfe'),('16711124-7495','Keith','Rivas'),('16740903-9638','Phelan','Conner'),('16761025-0172','Alexandra','Estrada'),('16780120-3824','Kitra','Levy'),('16780520-7797','Imani','Myers'),('16800517-6485','Abdul','Sexton'),('16810114-0682','David','Parsons'),('16840928-5155','Thane','Strong'),('16850904-0880','Ralph','Osborne'),('16860723-8055','Maxine','Woodard'),('16870127-4261','Michelle','Noble'),('16870429-5081','Mollie','Mathis'),('16870601-4985','Janna','Wall'),('16870912-4617','McKenzie','Clayton'),('16890717-8282','Idola','Levy'),('16890806-7732','Ingrid','Sweet'),('16891029-9851','Beverly','Glover'),('16891219-7517','Unity','Evans'),('16910501-5979','Vernon','Burnett'),('16910606-5783','Libby','Gallagher'),('16910613-5115','Tanner','Fry'),('16920216-8358','Chloe','Newman'),('16920609-4733','Carlos','Curry'),('16930417-0237','Indigo','Osborn'),('16931205-5859','Ila','Duke'),('16940122-5850','Taylor','Armstrong'),('16960109-5889','Ezra','Foreman'),('16980712-2024','Joan','Pittman'),('16990322-0029','Jamalia','Strickland'),('16991015-1423','Natalie','Moss'),('M0001-1998','Boyi','Ma');
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 17:29:53
