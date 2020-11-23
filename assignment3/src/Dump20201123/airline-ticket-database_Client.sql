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
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES ('ana83','7895944dd1',71701),('avery.zbon','935e3bb5b2',6991),('bartell.th','53fe4f3227',83958),('bma62','M0001-1998-password',0),('bosco.theo','df6f823581',8647),('brekke.nik','61e5797930',7222),('bruen.alex','762c84ae32',70101),('btrantow','a6100a13ee',20358),('carmela.wo','fc93a90e37',79718),('carson.hes','a6df94bccb',16934),('cartwright','e15e12af05',94821),('cary89','077f7463f5',98294),('charlene.f','d4d8d6ead8',47435),('clemmie77','1b5141bd23',45011),('cruickshan','fb749a897d',84465),('davon23','3b57543756',18620),('dillon.ger','5d188537eb',10303),('durgan.kia','fddfbc6948',8042),('ebert.beth','0c43444ebc',67737),('eleazar36','fd10b5578b',75763),('emmanuel.w','2faf76a4d0',63588),('gbuckridge','df0ec21edf',97227),('ggutmann','912cf8ee3d',86267),('gloria.win','e31838f4d2',58582),('goyette.we','a2a9e63fc7',38288),('graciela96','ed9db7a680',21968),('hackett.ka','c2ea2d6059',52761),('hahn.lukas','988927371e',72712),('howell.cle','ca47bae070',74509),('hprohaska','018f1f62c0',36375),('jammie.fla','905fcae859',46959),('janie.koel','5ca06b13c1',26841),('jannie.bog','f0b69abfb4',55100),('jerod.mant','3acf6bb916',11184),('jerrod.how','7e25518635',7825),('josiah.ber','944239d74b',43380),('kaylie79','b722551717',75126),('keaton.kie','b9e8ea01f7',91775),('khalid95','18017384d7',76143),('kory.heide','6afaa283db',12971),('krath','ca7a1ca87d',96687),('kschumm','bcc239cc7e',91856),('laney.wats','63d3e129fe',6296),('langworth.','40d01ac73b',8318),('lelah33','5a728fb62b',66424),('lhamill','b40506d1d3',30021),('lorenza20','a2d1515506',29885),('mable.hick','4074911382',82301),('madie.boye','2d2ccce9ae',28362),('mandy.wieg','2e57c503ed',7121),('marilie90','5fbf4310c2',61158),('maybelle34','67a65b81df',71968),('mertz.mont','a5b76316bc',53009),('michelle.h','6fa85fe1e9',49570),('mohammad70','bbb99b7e5a',9528),('mohr.liset','89bc4eafc8',45565),('nadia.heat','608db27dc8',32272),('nwilderman','55467e3fc9',11405),('nya.lesch','55c4446abf',97677),('o\'hara.car','278ecf0a2d',87010),('pacocha.ru','c0ff20ab51',27993),('paris.roma','8efe201f48',38339),('parker.wol','d3bf3a5e20',61574),('paxton.bau','3d2c9a6a29',52007),('pearlie.di','ea9662353f',44900),('pierre.veu','bbdc5d15f1',78972),('preston43','8a4e448474',39327),('pwalter','e5a7a69000',77389),('quigley.lu','07675e72dd',36394),('rafael83','f05aefa04d',84908),('reagan.wil','56c595ab3f',44718),('riley01','602c9ba662',72589),('rmckenzie','ac456de9ba',44760),('roberts.za','bbffcdbdc1',17198),('robyn32','1736b5e88d',19801),('romaguera.','9a19354960',1878),('rosenbaum.','2226f41749',80095),('salma.feen','a9430b2623',4675),('sauer.rowl','294530e717',9854),('sbosco','e63601105b',65104),('sbreitenbe','40241bbfea',51608),('selena81','890975c4f6',88819),('spencer34','b441740641',22355),('stephanie8','bb2d5ab282',82691),('szemlak','8fd5dba4da',67430),('tbarton','d82dc333f7',29141),('tgrant','2171162eec',63217),('towne.pame','7edb3efd85',93086),('trycia.bra','affa29f1d6',65918),('uondricka','4abcb52eb5',72430),('vo\'connell','d017c19a29',53560),('westley33','9228d23604',31557),('willms.hud','980ee4f154',75370),('wilmer.bra','aa352d65ba',43264),('wisozk.roo','ce3f8cb025',73297),('wzemlak','0a90ea7197',69075),('xhickle','2705ed5a5e',84611),('ycorwin','0452789d88',4992),('ysmitham','f32727e98b',62475),('zbednar','a8352da6bd',84587),('zweimann','593817a871',71931);
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23 17:29:56
