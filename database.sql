-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: project2_
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `Employee_Information_ID` int NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('Present','Absent','Leave') NOT NULL,
  PRIMARY KEY (`attendance_id`),
  UNIQUE KEY `Employee_Information_ID` (`Employee_Information_ID`,`attendance_date`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`Employee_Information_ID`) REFERENCES `employee_information` (`Employee_Information_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,'2025-07-25','Present'),(2,1,'2025-07-26','Absent'),(3,2,'2025-07-25','Present'),(4,2,'2025-07-26','Present'),(5,3,'2025-07-25','Present'),(6,3,'2025-07-26','Absent'),(7,4,'2025-07-25','Present'),(8,4,'2025-07-26','Present'),(9,5,'2025-07-25','Absent'),(10,5,'2025-07-26','Present'),(11,6,'2025-07-25','Absent'),(12,6,'2025-07-26','Present'),(13,7,'2025-07-25','Absent'),(14,7,'2025-07-26','Present'),(15,8,'2025-07-25','Absent'),(16,8,'2025-07-26','Present'),(17,9,'2025-07-25','Absent'),(18,9,'2025-07-26','Present'),(19,10,'2025-07-25','Absent'),(20,10,'2025-07-26','Present'),(21,11,'2025-07-25','Present'),(22,11,'2025-07-26','Present'),(23,12,'2025-07-25','Present'),(24,12,'2025-07-26','Absent'),(25,13,'2025-07-25','Leave'),(26,13,'2025-07-26','Present'),(27,14,'2025-07-25','Present'),(28,14,'2025-07-26','Present'),(29,15,'2025-07-25','Absent'),(30,15,'2025-07-26','Present'),(31,1,'2025-07-08','Present'),(32,11,'2025-07-31','Present'),(33,11,'2025-07-23','Present'),(34,15,'2025-07-31','Present'),(35,12,'2025-07-31','Present'),(36,4,'2025-07-30','Present');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Development','Beijing'),(2,' HR','Cape Town'),(3,'QA','Amsterdam'),(4,'Sales','Berlin'),(5,'Marketing','Johannesburg'),(6,'Design','Hong Kong'),(7,'IT','New Dheli'),(8,'Finance','Moscow'),(9,'Support','Bangkok');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_information`
--

DROP TABLE IF EXISTS `employee_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_information` (
  `Employee_Information_ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `department_id` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `hire_date` date NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Employee_Information_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_information`
--

LOCK TABLES `employee_information` WRITE;
/*!40000 ALTER TABLE `employee_information` DISABLE KEYS */;
INSERT INTO `employee_information` VALUES (1,'Sibongile Nkosi','Development','Software Engineer','sibongile.nkosi@moderntech.com','0712345678','2015-01-01',70000.00,'https://i.pinimg.com/1200x/30/b6/bc/30b6bc1610a0dd910c981b19d3c1e6d2.jpg'),(2,'Lungile Moyo','HR','HR Manager','lungile.moyo@moderntech.com','0723456789','2013-01-01',80000.00,'https://i.pinimg.com/736x/85/21/08/852108effbf96c9e18b5d94955222d45.jpg'),(3,'Thabo Molefe','QA','Quality Analyst','thabo.molefe@moderntech.com','0734567890','2018-01-01',55000.00,'https://i.pinimg.com/736x/a0/3b/c8/a03bc8ec088bd101d2976c032035eafa.jpg'),(4,'Keshav Naidoo','Sales','Sales Representative','keshav.naidoo@moderntech.com','0745678901','2020-01-01',60000.00,'https://i.pinimg.com/736x/56/e0/b9/56e0b9a9fe78a9daad07cd4c1257e7dc.jpg'),(5,'Zanele Khumalo','Marketing','Marketing Specialist','zanele.khumalo@moderntech.com','0756789012','2019-01-01',58000.00,'https://i.pinimg.com/736x/0b/2e/98/0b2e988dcec7af0209aa42d919c6967b.jpg'),(6,'Sipho Zulu','Design','UI/UX Designer','sipho.zulu@moderntech.com','0767890123','2016-01-01',65000.00,'https://i.pinimg.com/736x/1f/a8/e3/1fa8e37730714d0e5c65b50d2d658848.jpg'),(7,'Naledi Moeketsi','IT','DevOps Engineer','naledi.moeketsi@moderntech.com','0778901234','2017-01-01',72000.00,'https://i.pinimg.com/736x/10/b2/c8/10b2c87d4b52a7eaf40616e02459e7f3.jpg'),(8,'Farai Gumbo','Marketing','Content Strategist','farai.gumbo@moderntech.com','0789012345','2021-01-01',56000.00,'https://i.pinimg.com/736x/7b/ae/d3/7baed3ee85756fa875a97db1b1c38f46.jpg'),(9,'Karabo Dlamini','Finance','Accountant','karabo.dlamini@moderntech.com','0790123456','2018-01-01',62000.00,'https://i.pinimg.com/736x/4c/f1/50/4cf150b40713cc69eb88124dbb042d22.jpg'),(10,'Fatima Patel','Support','Customer Support Lead','fatima.patel@moderntech.com','0701234567','2016-01-01',58000.00,'https://i.pinimg.com/1200x/b6/06/5f/b6065f0caf0c9a36a6154093d6e9bc36.jpg'),(11,'Andile Sithole','HR','Backend Developer','andile.sithole@moderntech.com','0711111111','2016-01-01',67000.00,'https://i.pinimg.com/736x/7e/3f/a4/7e3fa4b6a9887c97de6c95755be739f4.jpg'),(12,'Buhle Ndlovu','HR','Recruiter','buhle.ndlovu@moderntech.com','0722222222','2018-01-01',52000.00,'https://i.pinimg.com/736x/12/c1/26/12c126a1655b7defb447efb679a649fc.jpg'),(13,'Dineo Mthembu','HR','HR Assistant','dineo.mthembu@moderntech.com','0733333333','2021-01-01',54000.00,'https://i.pinimg.com/736x/78/15/78/78157895af28970f3178970b739b7e42.jpg'),(14,'Jabu Dlamini','HR','Employee Relations Specialist','jabu.dlamini@moderntech.com','0744444444','2017-01-01',69000.00,'https://i.pinimg.com/736x/2a/89/e2/2a89e27fac78f796bb57a2bfb85ef20e.jpg'),(15,'Thuli Mokoena','HR','Payroll Officer','thuli.mokoena@moderntech.com','0755555555','2016-01-01',61000.00,'https://i.pinimg.com/1200x/0b/cc/2b/0bcc2b9eebd3ac861b70116e96d9d46e.jpg');
/*!40000 ALTER TABLE `employee_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaverequests`
--

DROP TABLE IF EXISTS `leaverequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaverequests` (
  `leave_id` int NOT NULL AUTO_INCREMENT,
  `Employee_Information_ID` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `reason` text,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  PRIMARY KEY (`leave_id`),
  KEY `Employee_Information_ID` (`Employee_Information_ID`),
  CONSTRAINT `leaverequests_ibfk_1` FOREIGN KEY (`Employee_Information_ID`) REFERENCES `employee_information` (`Employee_Information_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaverequests`
--

LOCK TABLES `leaverequests` WRITE;
/*!40000 ALTER TABLE `leaverequests` DISABLE KEYS */;
INSERT INTO `leaverequests` (`Employee_Information_ID`,`from_date`,`to_date`,`reason`,`status`) VALUES (1,'2025-07-22','2025-07-22','Sick Leave','Approved'),(2,'2025-07-15','2025-07-15','Family Responsibility','Rejected'),(3,'2025-07-10','2025-07-10','Medical Appointment','Approved'),(4,'2025-07-20','2025-07-20','Bereavement','Approved'),(5,'2024-12-01','2024-12-01','Childcare','Pending'),(6,'2025-07-18','2025-07-18','Sick Leave','Approved'),(9,'2025-07-19','2025-07-19','Childcare','Rejected'),(13,'2025-07-18','2025-07-19','Vacation','Approved'),(14,'2025-07-23','2025-07-23','Sick Leave','Pending'),(15,'2025-07-22','2025-07-22','Childcare','Rejected'),(8,'2025-07-30','2025-07-31','Medical Appointment','Approved'),(5,'2025-07-24','2025-07-16','Sick Leave','Pending'),(5,'2025-07-24','2025-07-31','Sick Leave','Pending'),(12,'2025-07-16','2025-07-17','Sick Leave','Pending');
/*!40000 ALTER TABLE `leaverequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_page`
--

DROP TABLE IF EXISTS `login_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('HR','Manager') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_page`
--

LOCK TABLES `login_page` WRITE;
/*!40000 ALTER TABLE `login_page` DISABLE KEYS */;
INSERT INTO `login_page` VALUES (1,'fatima.patel@moderntech.com','$2b$10$toi2mAow4MxCtOG0QWK1POPUiVh3BEqUMWuZPemgQXnDSAdpDJLNy','HR'),(2,'andile.sithole@moderntech.com','$2b$10$toi2mAow4MxCtOG0QWK1POPUiVh3BEqUMWuZPemgQXnDSAdpDJLNy','HR'),(3,'buhle.ndlovu@moderntech.com','$2b$10$toi2mAow4MxCtOG0QWK1POPUiVh3BEqUMWuZPemgQXnDSAdpDJLNy','HR'),(4,'dineo.mthembu@moderntech.com','$2b$10$toi2mAow4MxCtOG0QWK1POPUiVh3BEqUMWuZPemgQXnDSAdpDJLNy','HR'),(5,'jabu.dlamini@moderntech.com','$2b$10$toi2mAow4MxCtOG0QWK1POPUiVh3BEqUMWuZPemgQXnDSAdpDJLNy','HR'),(6,'thuli.mokoena@moderntech.com','$2b$10$toi2mAow4MxCtOG0QWK1POPUiVh3BEqUMWuZPemgQXnDSAdpDJLNy','HR');
/*!40000 ALTER TABLE `login_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `Employee_Information_ID` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `hours_worked` int DEFAULT NULL,
  `leave_deductions` int DEFAULT NULL,
  `final_salary` decimal(10,2) DEFAULT NULL,
  `estimated_annual_income` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Employee_Information_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (1,'Sibongile Nkosi',160,8,69500.00,834000.00),(2,'Lungile Moyo',150,10,79000.00,948000.00),(3,'Thabo Molefe',170,4,54800.00,657600.00),(4,'Keshav Naidoo',165,6,59700.00,716400.00),(5,'Zanele Khumalo',158,5,57850.00,694200.00),(6,'Sipho Zulu',168,2,64800.00,777600.00),(7,'Naledi Moeketsi',175,3,71800.00,861600.00),(8,'Farai Gumbo',160,0,56000.00,672000.00),(9,'Karabo Dlamini',155,5,61500.00,738000.00),(10,'Fatima Patel',162,4,57750.00,693000.00),(11,'Andile Sithole',160,4,66500.00,798000.00),(12,'Buhle Ndlovu',158,6,51000.00,612000.00),(13,'Dineo Mthembu',165,3,53000.00,636000.00),(14,'Jabu Dlamini',170,2,68000.00,816000.00),(15,'Thuli Mokoena',162,5,60500.00,726000.00);
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performancereviews`
--

DROP TABLE IF EXISTS `performancereviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performancereviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `attendance` decimal(3,1) DEFAULT NULL,
  `productivity` decimal(3,1) DEFAULT NULL,
  `total` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performancereviews`
--

LOCK TABLES `performancereviews` WRITE;
/*!40000 ALTER TABLE `performancereviews` DISABLE KEYS */;
INSERT INTO `performancereviews` VALUES (1,'Sibongile Nkosi','Software Engineer','Development',9.0,9.4,18.4),(2,'Lungile Moyo','HR Manager','HR',9.0,8.8,17.8),(3,'Thabo Molefe','Quality Analyst','QA',9.0,10.0,19.0),(4,'Keshav Naidoo','Sales Representative','Sales',9.0,9.7,18.7),(5,'Zanele Khumalo','Marketing Specialist','Marketing',9.0,9.3,18.3),(6,'Sipho Zulu','UI/UX Designer','Design',9.0,9.9,18.9),(7,'Naledi Moeketsi','DevOps Engineer','IT',9.0,10.0,19.0),(8,'Farai Gumbo','Content Strategist','Marketing',9.0,9.4,18.4),(9,'Karabo Dlamini','Accountant','Finance',9.0,9.1,18.1),(10,'Fatima Patel','Customer Support Lead','Support',9.0,9.5,18.5),(11,'Anele Dube','Project Coordinator','Operations',8.5,9.0,17.5),(12,'Tshepo Mokoena','IT Support Specialist','IT',9.0,9.2,18.2),(13,'Noluthando Zwane','Recruitment Officer','HR',8.8,8.5,17.3),(14,'Bongani Sithole','Business Analyst','Business Intelligence',9.1,9.3,18.4),(15,'Lelethu Mbatha','Graphic Designer','Design',9.0,9.7,18.7);
/*!40000 ALTER TABLE `performancereviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-31 15:41:59
