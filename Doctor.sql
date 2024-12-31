/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.6.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: DoctorDirectoryDB
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appointment` (
  `AppointmentID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorName` varchar(100) DEFAULT NULL,
  `AppointmentDate` datetime DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'Scheduled',
  PRIMARY KEY (`AppointmentID`),
  KEY `PatientID` (`PatientID`),
  CONSTRAINT `Appointment_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
INSERT INTO `Appointment` VALUES
(1,1,'Dr. Smith','2024-09-01 10:00:00','Cancelled'),
(2,2,'Dr. Jones','2024-09-02 11:00:00','Scheduled'),
(3,1,'Dr. Brown','2024-09-03 15:00:00','Scheduled'),
(4,1,'Dr. Brown','2024-09-03 15:00:00','Scheduled');
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Appointments`
--

DROP TABLE IF EXISTS `Appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appointments` (
  `appointment_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `Appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctors` (`doctor_id`),
  CONSTRAINT `Appointments_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointments`
--

LOCK TABLES `Appointments` WRITE;
/*!40000 ALTER TABLE `Appointments` DISABLE KEYS */;
INSERT INTO `Appointments` VALUES
(1,1,1,'2024-01-15','09:00:00','Completed'),
(2,2,3,'2024-01-15','10:00:00','Completed'),
(3,3,2,'2024-01-16','11:00:00','Completed'),
(4,4,4,'2024-01-16','14:00:00','Completed'),
(5,5,5,'2024-01-17','15:00:00','Completed'),
(6,6,6,'2024-01-17','16:00:00','Completed'),
(7,7,7,'2024-02-01','09:30:00','Scheduled'),
(8,8,8,'2024-02-01','10:30:00','Scheduled'),
(9,9,9,'2024-02-02','11:30:00','Scheduled'),
(10,10,10,'2024-02-02','14:30:00','Scheduled'),
(11,11,11,'2024-02-03','15:30:00','Scheduled'),
(12,12,12,'2024-02-03','16:30:00','Scheduled'),
(13,13,13,'2024-02-04','09:00:00','Scheduled'),
(14,14,14,'2024-02-04','10:00:00','Scheduled'),
(15,15,15,'2024-02-05','11:00:00','Scheduled');
/*!40000 ALTER TABLE `Appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Appointments_2NF`
--

DROP TABLE IF EXISTS `Appointments_2NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appointments_2NF` (
  `AppointmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorID` int(11) DEFAULT NULL,
  `ClinicID` int(11) DEFAULT NULL,
  `PatientName` varchar(100) DEFAULT NULL,
  `AppointmentDateTime` datetime DEFAULT NULL,
  `ConsultationFee` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `ClinicID` (`ClinicID`),
  CONSTRAINT `Appointments_2NF_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors_2NF` (`DoctorID`),
  CONSTRAINT `Appointments_2NF_ibfk_2` FOREIGN KEY (`ClinicID`) REFERENCES `Clinics_2NF` (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointments_2NF`
--

LOCK TABLES `Appointments_2NF` WRITE;
/*!40000 ALTER TABLE `Appointments_2NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `Appointments_2NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clinics_2NF`
--

DROP TABLE IF EXISTS `Clinics_2NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clinics_2NF` (
  `ClinicID` int(11) NOT NULL AUTO_INCREMENT,
  `ClinicAddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clinics_2NF`
--

LOCK TABLES `Clinics_2NF` WRITE;
/*!40000 ALTER TABLE `Clinics_2NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clinics_2NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clinics_3NF`
--

DROP TABLE IF EXISTS `Clinics_3NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clinics_3NF` (
  `ClinicID` int(11) NOT NULL AUTO_INCREMENT,
  `ClinicAddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clinics_3NF`
--

LOCK TABLES `Clinics_3NF` WRITE;
/*!40000 ALTER TABLE `Clinics_3NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clinics_3NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorAppointments_1NF`
--

DROP TABLE IF EXISTS `DoctorAppointments_1NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorAppointments_1NF` (
  `AppointmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorID` int(11) DEFAULT NULL,
  `PatientName` varchar(100) DEFAULT NULL,
  `AppointmentDateTime` datetime DEFAULT NULL,
  `ConsultationFee` decimal(10,2) DEFAULT NULL,
  `ClinicAddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `DoctorAppointments_1NF_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors_1NF` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorAppointments_1NF`
--

LOCK TABLES `DoctorAppointments_1NF` WRITE;
/*!40000 ALTER TABLE `DoctorAppointments_1NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `DoctorAppointments_1NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorPhones_1NF`
--

DROP TABLE IF EXISTS `DoctorPhones_1NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorPhones_1NF` (
  `PhoneID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorID` int(11) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PhoneID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `DoctorPhones_1NF_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors_1NF` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorPhones_1NF`
--

LOCK TABLES `DoctorPhones_1NF` WRITE;
/*!40000 ALTER TABLE `DoctorPhones_1NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `DoctorPhones_1NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorPhones_2NF`
--

DROP TABLE IF EXISTS `DoctorPhones_2NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorPhones_2NF` (
  `PhoneID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorID` int(11) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PhoneID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `DoctorPhones_2NF_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors_2NF` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorPhones_2NF`
--

LOCK TABLES `DoctorPhones_2NF` WRITE;
/*!40000 ALTER TABLE `DoctorPhones_2NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `DoctorPhones_2NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorPhones_3NF`
--

DROP TABLE IF EXISTS `DoctorPhones_3NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorPhones_3NF` (
  `PhoneID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorID` int(11) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PhoneID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `DoctorPhones_3NF_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors_3NF` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorPhones_3NF`
--

LOCK TABLES `DoctorPhones_3NF` WRITE;
/*!40000 ALTER TABLE `DoctorPhones_3NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `DoctorPhones_3NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorSpecializations_1NF`
--

DROP TABLE IF EXISTS `DoctorSpecializations_1NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorSpecializations_1NF` (
  `DoctorSpecID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorID` int(11) DEFAULT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DoctorSpecID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `DoctorSpecializations_1NF_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors_1NF` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorSpecializations_1NF`
--

LOCK TABLES `DoctorSpecializations_1NF` WRITE;
/*!40000 ALTER TABLE `DoctorSpecializations_1NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `DoctorSpecializations_1NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorSpecializations_2NF`
--

DROP TABLE IF EXISTS `DoctorSpecializations_2NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorSpecializations_2NF` (
  `DoctorSpecID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorID` int(11) DEFAULT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DoctorSpecID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `DoctorSpecializations_2NF_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors_2NF` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorSpecializations_2NF`
--

LOCK TABLES `DoctorSpecializations_2NF` WRITE;
/*!40000 ALTER TABLE `DoctorSpecializations_2NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `DoctorSpecializations_2NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorSpecializations_3NF`
--

DROP TABLE IF EXISTS `DoctorSpecializations_3NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorSpecializations_3NF` (
  `DoctorSpecID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorID` int(11) DEFAULT NULL,
  `SpecializationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DoctorSpecID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `SpecializationID` (`SpecializationID`),
  CONSTRAINT `DoctorSpecializations_3NF_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors_3NF` (`DoctorID`),
  CONSTRAINT `DoctorSpecializations_3NF_ibfk_2` FOREIGN KEY (`SpecializationID`) REFERENCES `Specializations_3NF` (`SpecializationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorSpecializations_3NF`
--

LOCK TABLES `DoctorSpecializations_3NF` WRITE;
/*!40000 ALTER TABLE `DoctorSpecializations_3NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `DoctorSpecializations_3NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctors`
--

DROP TABLE IF EXISTS `Doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctors` (
  `doctor_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialization_id` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `years_of_experience` int(11) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`),
  UNIQUE KEY `email` (`email`),
  KEY `specialization_id` (`specialization_id`),
  CONSTRAINT `Doctors_ibfk_1` FOREIGN KEY (`specialization_id`) REFERENCES `Specialization` (`specialization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctors`
--

LOCK TABLES `Doctors` WRITE;
/*!40000 ALTER TABLE `Doctors` DISABLE KEYS */;
INSERT INTO `Doctors` VALUES
(1,'John','Smith',1,'john.smith@email.com','123-456-7890',10),
(2,'Sarah','Johnson',2,'sarah.j@email.com','123-456-7891',8),
(3,'Michael','Brown',3,'michael.b@email.com','123-456-7892',15),
(4,'Emily','Davis',4,'emily.d@email.com','123-456-7893',12),
(5,'David','Wilson',5,'david.w@email.com','123-456-7894',5),
(6,'Lisa','Anderson',6,'lisa.a@email.com','123-456-7895',20),
(7,'James','Taylor',7,'james.t@email.com','123-456-7896',7),
(8,'Maria','Garcia',8,'maria.g@email.com','123-456-7897',9),
(9,'Robert','Martinez',9,'robert.m@email.com','123-456-7898',14),
(10,'Jennifer','Robinson',10,'jennifer.r@email.com','123-456-7899',6),
(11,'William','Lee',11,'william.l@email.com','123-456-7900',11),
(12,'Patricia','White',12,'patricia.w@email.com','123-456-7901',18),
(13,'Thomas','Harris',13,'thomas.h@email.com','123-456-7902',13),
(14,'Elizabeth','Clark',14,'elizabeth.c@email.com','123-456-7903',16),
(15,'Richard','Lewis',15,'richard.l@email.com','123-456-7904',4);
/*!40000 ALTER TABLE `Doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorsUnnormalized`
--

DROP TABLE IF EXISTS `DoctorsUnnormalized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorsUnnormalized` (
  `DoctorName` varchar(100) DEFAULT NULL,
  `Specializations` varchar(200) DEFAULT NULL,
  `PhoneNumbers` varchar(200) DEFAULT NULL,
  `ClinicAddress` varchar(200) DEFAULT NULL,
  `ConsultationFees` decimal(10,2) DEFAULT NULL,
  `PatientNames` varchar(500) DEFAULT NULL,
  `Appointments` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorsUnnormalized`
--

LOCK TABLES `DoctorsUnnormalized` WRITE;
/*!40000 ALTER TABLE `DoctorsUnnormalized` DISABLE KEYS */;
INSERT INTO `DoctorsUnnormalized` VALUES
('Dr. John Smith','Cardiology, Internal Medicine','555-0101, 555-0102','123 Medical Center, New York',150.00,'Alice Johnson, Bob Wilson, Carol Brown','2024-01-01 09:00, 2024-01-01 10:00, 2024-01-01 11:00');
/*!40000 ALTER TABLE `DoctorsUnnormalized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctors_1NF`
--

DROP TABLE IF EXISTS `Doctors_1NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctors_1NF` (
  `DoctorID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctors_1NF`
--

LOCK TABLES `Doctors_1NF` WRITE;
/*!40000 ALTER TABLE `Doctors_1NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctors_1NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctors_2NF`
--

DROP TABLE IF EXISTS `Doctors_2NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctors_2NF` (
  `DoctorID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctors_2NF`
--

LOCK TABLES `Doctors_2NF` WRITE;
/*!40000 ALTER TABLE `Doctors_2NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctors_2NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctors_3NF`
--

DROP TABLE IF EXISTS `Doctors_3NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctors_3NF` (
  `DoctorID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctors_3NF`
--

LOCK TABLES `Doctors_3NF` WRITE;
/*!40000 ALTER TABLE `Doctors_3NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doctors_3NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `PatientID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES
(1,'John Doe',35,'1234567890','123 Main St'),
(2,'Jane Smith',28,'0987654321','456 Elm St');
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patients`
--

DROP TABLE IF EXISTS `Patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patients` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patients`
--

LOCK TABLES `Patients` WRITE;
/*!40000 ALTER TABLE `Patients` DISABLE KEYS */;
INSERT INTO `Patients` VALUES
(1,'Alice','Williams','1990-05-15','alice.w@email.com','123-555-0001','123 Main St'),
(2,'Bob','Miller','1985-08-22','bob.m@email.com','123-555-0002','456 Oak Ave'),
(3,'Carol','Davis','1978-03-10','carol.d@email.com','123-555-0003','789 Pine Rd'),
(4,'Daniel','Moore','1995-12-03','daniel.m@email.com','123-555-0004','321 Elm St'),
(5,'Emma','Taylor','1982-07-28','emma.t@email.com','123-555-0005','654 Maple Dr'),
(6,'Frank','Anderson','1973-09-14','frank.a@email.com','123-555-0006','987 Cedar Ln'),
(7,'Grace','Thomas','1988-11-30','grace.t@email.com','123-555-0007','147 Birch Rd'),
(8,'Henry','Jackson','1992-04-25','henry.j@email.com','123-555-0008','258 Walnut Ave'),
(9,'Isabel','White','1975-06-18','isabel.w@email.com','123-555-0009','369 Cherry St'),
(10,'Jack','Harris','1998-01-07','jack.h@email.com','123-555-0010','741 Spruce Dr'),
(11,'Kelly','Martin','1987-02-12','kelly.m@email.com','123-555-0011','852 Ash Ln'),
(12,'Liam','Thompson','1969-10-20','liam.t@email.com','123-555-0012','963 Oak St'),
(13,'Mia','Garcia','1993-08-05','mia.g@email.com','123-555-0013','159 Pine Ave'),
(14,'Noah','Martinez','1980-12-15','noah.m@email.com','123-555-0014','357 Maple St'),
(15,'Olivia','Robinson','1997-04-30','olivia.r@email.com','123-555-0015','246 Cedar Ave');
/*!40000 ALTER TABLE `Patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patients_3NF`
--

DROP TABLE IF EXISTS `Patients_3NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patients_3NF` (
  `PatientID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patients_3NF`
--

LOCK TABLES `Patients_3NF` WRITE;
/*!40000 ALTER TABLE `Patients_3NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `Patients_3NF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reviews` (
  `review_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `review_text` text DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctors` (`doctor_id`),
  CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES
(1,1,1,5,'Excellent cardiologist, very thorough explanation','2024-01-16'),
(2,2,3,4,'Great with kids, made my child feel comfortable','2024-01-16'),
(3,3,2,5,'Very knowledgeable about joint problems','2024-01-17'),
(4,4,4,4,'Helpful neurologist, clear communication','2024-01-17'),
(5,5,5,3,'Good treatment but long waiting time','2024-01-18'),
(6,6,6,5,'Outstanding eye examination experience','2024-01-18'),
(7,7,7,4,'Professional and friendly ENT specialist','2024-01-19'),
(8,8,8,5,'Very understanding and helpful psychiatrist','2024-01-19'),
(9,9,9,4,'Knowledgeable and professional','2024-01-20'),
(10,10,10,5,'Excellent care and follow-up','2024-01-20'),
(11,11,11,4,'Very detailed explanation of treatment','2024-01-21'),
(12,12,12,5,'Compassionate and skilled doctor','2024-01-21'),
(13,13,13,4,'Great pulmonary care specialist','2024-01-22'),
(14,14,14,5,'Thorough examination and clear advice','2024-01-22'),
(15,15,15,4,'Professional and efficient service','2024-01-23');
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specialization`
--

DROP TABLE IF EXISTS `Specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Specialization` (
  `specialization_id` int(11) NOT NULL,
  `specialization_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`specialization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specialization`
--

LOCK TABLES `Specialization` WRITE;
/*!40000 ALTER TABLE `Specialization` DISABLE KEYS */;
INSERT INTO `Specialization` VALUES
(1,'Cardiology','Heart and cardiovascular system specialists'),
(2,'Pediatrics','Child healthcare specialists'),
(3,'Orthopedics','Bone and joint care specialists'),
(4,'Neurology','Brain and nervous system specialists'),
(5,'Dermatology','Skin care specialists'),
(6,'Ophthalmology','Eye care specialists'),
(7,'ENT','Ear, Nose, and Throat specialists'),
(8,'Psychiatry','Mental health specialists'),
(9,'Gynecology','Women\'s health specialists'),
(10,'Urology','Urinary system specialists'),
(11,'Endocrinology','Hormone specialists'),
(12,'Oncology','Cancer specialists'),
(13,'Pulmonology','Lung specialists'),
(14,'Gastroenterology','Digestive system specialists'),
(15,'Rheumatology','Autoimmune disease specialists');
/*!40000 ALTER TABLE `Specialization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specializations_3NF`
--

DROP TABLE IF EXISTS `Specializations_3NF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Specializations_3NF` (
  `SpecializationID` int(11) NOT NULL AUTO_INCREMENT,
  `SpecializationName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SpecializationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specializations_3NF`
--

LOCK TABLES `Specializations_3NF` WRITE;
/*!40000 ALTER TABLE `Specializations_3NF` DISABLE KEYS */;
/*!40000 ALTER TABLE `Specializations_3NF` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-12-31 21:34:35
