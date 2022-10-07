-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: new
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `subjectId` char(4) NOT NULL,
  `period` smallint NOT NULL,
  `teacherId` char(4) DEFAULT NULL,
  `participants` smallint DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`subjectId`,`period`),
  KEY `teacherId` (`teacherId`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`subjectId`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`teacherId`) REFERENCES `teachers` (`teacherId`),
  CONSTRAINT `course_chk_1` CHECK ((`endDate` >= `startDate`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('a290',1,'h430',4,'2011-08-01','2011-09-15'),('a290',2,NULL,5,'2011-11-01',NULL),('a450',1,'h303',2,'2011-01-03','2011-02-25'),('a450',2,'h560',2,'2011-12-01','2012-03-10'),('a480',1,'h180',3,'2012-02-10','2012-04-22'),('a480',2,'h784',2,'2012-03-15','2012-05-30'),('a730',1,'h290',6,'2012-03-15','2012-05-30'),('a760',1,'h786',4,'2012-06-15','2012-08-15');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `studentId` char(4) NOT NULL,
  `subjectId` char(4) NOT NULL,
  `period` smallint NOT NULL,
  `date` date DEFAULT NULL,
  `grade` smallint DEFAULT NULL,
  `assessor` char(4) DEFAULT NULL,
  PRIMARY KEY (`studentId`,`subjectId`,`period`),
  KEY `subjectId` (`subjectId`,`period`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`),
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`subjectId`, `period`) REFERENCES `course` (`subjectId`, `period`),
  CONSTRAINT `grade_chk_1` CHECK (((`grade` between 0 and 5) or (`grade` is null)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES ('o148','a730',1,'2012-06-01',3,'h290'),('o210','a450',2,'2012-03-12',3,'h303'),('o210','a730',1,'2012-06-05',1,'h290'),('o298','a290',1,'2011-09-16',3,'h430'),('o298','a480',2,'2012-04-05',3,'h784'),('o348','a730',1,'2012-06-07',4,'h290'),('o349','a290',1,'2011-09-11',4,'h430'),('o354','a480',1,'2012-03-22',4,'h784'),('o410','a290',1,'2011-09-15',2,'h180'),('o410','a730',1,'2012-06-01',3,'h290'),('o473','a450',1,'2012-03-14',2,'h303'),('o473','a480',2,'2012-06-04',0,'h784'),('o473','a730',1,'2012-06-10',3,'h290'),('o548','a290',1,'2012-09-20',2,'h430'),('o548','a450',2,NULL,NULL,NULL),('o649','a480',1,'2012-05-03',4,'h180'),('o649','a730',1,'2012-06-02',4,'h290'),('o649','a760',1,'2012-08-18',2,'h180'),('o654','a450',1,'2012-03-18',4,'h303'),('o707','a760',1,'2012-08-18',3,'h180');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `studentId` char(4) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `street` varchar(40) DEFAULT NULL,
  `postalCode` char(5) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `gender` char(1) NOT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('o148','Sanna','Rentukka','1990-10-22','Puronvarsi 662 F','630','Helsinki','N'),('o210','Kaarlo','Kuikka','1985-08-31','Huilupolku 58 C 2','420','Helsinki','M'),('o298','Raimo','Veto','1992-12-01','Ketjukuja 196 A 81','680','Helsinki','M'),('o348','Kaarina','Käki','1990-04-03','Äimäkuja 79','1260','Vantaa','N'),('o349','Johan','Bompas','1991-05-17','Övre-Gumminkuja 115','1590','Maisala','M'),('o354','Usko','Housu','1986-10-20','Toivola 100','1800','Klaukkala','M'),('o410','Leena','Liima','1984-03-03','Nysätie 44 G','2880','Veikkola','N'),('o473','Fredrik','Leipä','1991-11-22','Haukas 20 A 20','2400','Kyrkslätt','M'),('o548','Valma','Vispilä','1989-10-10','Jäspilänkatu 22','4200','Kerava','N'),('o558','Greta','Hullerus','1982-03-28','Havs-hanikka 800 A','2360','Esbo','N'),('o649','Martti','Katti','1992-03-28','Siamintie 66 B 1','560','Helsinki','M'),('o654','Rosina','Laine','1983-05-07','Liplatus 55 D','2320','Espoo','N'),('o699','Väinö','Veto','1981-03-21','Ketjukuja 16 C 16','680','Helsinki','M'),('o707','Laina','Laihia','1966-05-22','Penninpyörittäjänkuja 33','750','Helsinki','N');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subjectId` char(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  `responsibleteacherId` char(4) DEFAULT NULL,
  `credits` smallint DEFAULT NULL,
  PRIMARY KEY (`subjectId`),
  KEY `responsibleteacherId` (`responsibleteacherId`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`responsibleteacherId`) REFERENCES `teachers` (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('a290','Basics of Networking','h430',4),('a450','Databases','h430',3),('a480','Operating Systems','h784',5),('a730','Finnish 2','h290',2),('a760','Object Oriented Programming','h786',5),('a820','Basics of Programming','h180',5);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacherId` char(4) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `salary` decimal(6,2) NOT NULL,
  `phone` char(10) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES ('h180','Seppo','Kokki',3780.00,'040-808800','1960-02-03'),('h290','Sisko','Sarvi',3725.00,'040-776655','1965-11-01'),('h303','Veli','Torvi',3720.00,'050-123456','1979-07-25'),('h430','Emma','Enkeli',4100.00,'050-333455','1969-04-18'),('h560','Olka','Tanko',4599.00,'040-666977','1965-05-30'),('h784','Vieno','Valssi',4049.00,'050-223749','1979-09-12'),('h786','Hertta','Humina',4049.00,'040-203549','1974-09-12'),('h888','Heimo','Humppa',4343.00,'040-567890','1981-09-26');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07 13:03:55
