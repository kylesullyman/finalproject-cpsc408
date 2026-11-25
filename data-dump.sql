-- MySQL dump 10.13  Distrib 8.4.13, for macos15 (arm64)
--
-- Host: localhost    Database: CampusStage
-- ------------------------------------------------------
-- Server version	8.4.13

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
-- Table structure for table `Attendees`
--

DROP TABLE IF EXISTS `Attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendees` (
  `attendeeID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`attendeeID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendees`
--

LOCK TABLES `Attendees` WRITE;
/*!40000 ALTER TABLE `Attendees` DISABLE KEYS */;
INSERT INTO `Attendees` VALUES (1,'calef_a','pass123','Calef Alesse','calef.alesse@chapman.edu'),(2,'kayla_k','pass123','Kayla Kim','kayla.kim@chapman.edu'),(3,'raj_c','pass123','Raj Chaliparambil','raj.chaliparambil@chapman.edu'),(4,'kyle_s','pass123','Kyle Sullivan','kyle.sullivan@chapman.edu');
/*!40000 ALTER TABLE `Attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventOrganizers`
--

DROP TABLE IF EXISTS `EventOrganizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventOrganizers` (
  `eventID` int NOT NULL,
  `organizerID` int NOT NULL,
  PRIMARY KEY (`eventID`,`organizerID`),
  KEY `organizerID` (`organizerID`),
  CONSTRAINT `eventorganizers_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `Events` (`eventID`),
  CONSTRAINT `eventorganizers_ibfk_2` FOREIGN KEY (`organizerID`) REFERENCES `Organizers` (`organizerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventOrganizers`
--

LOCK TABLES `EventOrganizers` WRITE;
/*!40000 ALTER TABLE `EventOrganizers` DISABLE KEYS */;
INSERT INTO `EventOrganizers` VALUES (2,1),(3,1),(5,1),(1,2),(5,2),(4,3);
/*!40000 ALTER TABLE `EventOrganizers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventPerformers`
--

DROP TABLE IF EXISTS `EventPerformers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventPerformers` (
  `eventID` int NOT NULL,
  `performerID` int NOT NULL,
  PRIMARY KEY (`eventID`,`performerID`),
  KEY `performerID` (`performerID`),
  CONSTRAINT `eventperformers_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `Events` (`eventID`),
  CONSTRAINT `eventperformers_ibfk_2` FOREIGN KEY (`performerID`) REFERENCES `Performers` (`performerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventPerformers`
--

LOCK TABLES `EventPerformers` WRITE;
/*!40000 ALTER TABLE `EventPerformers` DISABLE KEYS */;
INSERT INTO `EventPerformers` VALUES (4,1),(1,2),(3,2),(5,3),(1,4),(2,4),(5,5);
/*!40000 ALTER TABLE `EventPerformers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Events` (
  `eventID` int NOT NULL AUTO_INCREMENT,
  `venueID` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `eventDate` date NOT NULL,
  `eventTime` time NOT NULL,
  `ticketPrice` decimal(6,2) NOT NULL DEFAULT '0.00',
  `reservationLimit` int NOT NULL,
  `status` enum('Scheduled','Cancelled') NOT NULL DEFAULT 'Scheduled',
  PRIMARY KEY (`eventID`),
  KEY `venueID` (`venueID`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`venueID`) REFERENCES `Venues` (`venueID`),
  CONSTRAINT `events_chk_1` CHECK ((`reservationLimit` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
INSERT INTO `Events` VALUES (1,1,'Winterfest','2026-12-04','19:00:00',15.00,900,'Scheduled'),(2,2,'Valentines Day Concert','2027-02-13','19:30:00',12.00,400,'Scheduled'),(3,3,'Spring Acoustic Night','2027-03-19','18:30:00',0.00,120,'Cancelled'),(4,4,'Disco Dunes','2027-05-10','16:00:00',20.00,1500,'Scheduled'),(5,4,'Homecoming','2027-10-16','18:00:00',10.00,1800,'Scheduled');
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organizers`
--

DROP TABLE IF EXISTS `Organizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Organizers` (
  `organizerID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`organizerID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organizers`
--

LOCK TABLES `Organizers` WRITE;
/*!40000 ALTER TABLE `Organizers` DISABLE KEYS */;
INSERT INTO `Organizers` VALUES (1,'org_goldenvoice','orgpass1','Goldenvoice','goldenvoice@example.com'),(2,'org_livenation','orgpass1','Live Nation','livenation@example.com'),(3,'org_insomniac','orgpass1','Insomniac','insomniac@example.com');
/*!40000 ALTER TABLE `Organizers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Performers`
--

DROP TABLE IF EXISTS `Performers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Performers` (
  `performerID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`performerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Performers`
--

LOCK TABLES `Performers` WRITE;
/*!40000 ALTER TABLE `Performers` DISABLE KEYS */;
INSERT INTO `Performers` VALUES (1,'BUNT.','House'),(2,'Noah Kahan','Folk'),(3,'Oasis','Rock'),(4,'Gracie Abrams','Pop'),(5,'Drake','Rap');
/*!40000 ALTER TABLE `Performers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `ticketID` int NOT NULL AUTO_INCREMENT,
  `eventID` int NOT NULL,
  `attendeeID` int NOT NULL,
  `reservationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Reserved','Cancelled') NOT NULL DEFAULT 'Reserved',
  PRIMARY KEY (`ticketID`),
  KEY `eventID` (`eventID`),
  KEY `attendeeID` (`attendeeID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `Events` (`eventID`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`attendeeID`) REFERENCES `Attendees` (`attendeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
INSERT INTO `Tickets` VALUES (1,1,1,'2026-11-20 10:15:00','Reserved'),(2,1,2,'2026-11-20 11:42:00','Reserved'),(3,2,3,'2026-11-21 09:05:00','Reserved'),(4,2,3,'2026-11-22 14:30:00','Reserved'),(5,3,4,'2026-11-22 16:10:00','Cancelled'),(6,4,1,'2026-11-23 12:00:00','Reserved'),(7,4,4,'2026-11-23 13:20:00','Reserved');
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venues`
--

DROP TABLE IF EXISTS `Venues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Venues` (
  `venueID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(150) DEFAULT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`venueID`),
  CONSTRAINT `venues_chk_1` CHECK ((`capacity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venues`
--

LOCK TABLES `Venues` WRITE;
/*!40000 ALTER TABLE `Venues` DISABLE KEYS */;
INSERT INTO `Venues` VALUES (1,'Musco Center for the Arts','Chapman University Campus',1044),(2,'Chapman Auditorium','Memorial Hall',450),(3,'Salmon Recital Hall','Bertea Hall',150),(4,'Attallah Piazza','Central Campus (outdoor)',2000);
/*!40000 ALTER TABLE `Venues` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-24 19:04:44
