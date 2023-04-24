CREATE DATABASE  IF NOT EXISTS `dbtest_v4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbtest_v4`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: dbtest_v4
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `account_customers`
--

DROP TABLE IF EXISTS `account_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_customers` (
  `account_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`customer_id`,`account_id`),
  KEY `fk_accounts_has_customer_customer1_idx` (`customer_id`),
  KEY `fk_accounts_has_customer_accounts1_idx` (`account_id`),
  CONSTRAINT `fk_accounts_has_customer_accounts1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `fk_accounts_has_customer_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_customers`
--

LOCK TABLES `account_customers` WRITE;
/*!40000 ALTER TABLE `account_customers` DISABLE KEYS */;
INSERT INTO `account_customers` VALUES (10299200,1),(10299200,2),(10299202,3),(10299203,4),(10299204,5),(10299205,6),(10299206,7),(10299207,8),(10299208,9),(10299209,10),(10299210,11),(10299210,12),(10299211,12),(10299210,13),(10299212,13),(10299213,14),(10299214,15),(10299215,16),(10299216,17),(10299217,18),(10299218,18),(10299219,20),(10299220,20),(10299221,22),(10299222,23),(10299223,24),(10299223,25),(10299224,25),(10299226,26),(10299227,26),(10299228,27),(10299229,27),(10299230,28),(10299231,29),(10299232,29),(10299233,30),(10299234,30),(10299235,31),(10299236,31),(10299237,32);
/*!40000 ALTER TABLE `account_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_type` (
  `account_Type` varchar(20) NOT NULL,
  `minimum_balance_Restriction` decimal(10,2) NOT NULL,
  PRIMARY KEY (`account_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES ('checking',1500.00),('loan',0.00),('saving',1000.00);
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_balance` decimal(10,2) NOT NULL,
  `branch_id` int unsigned NOT NULL,
  `date_opened` date NOT NULL,
  `account_Type` varchar(20) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `fk_accounts_bank_details1_idx` (`branch_id`),
  KEY `fk_accounts_account_type1_idx` (`account_Type`),
  CONSTRAINT `fk_accounts_account_type1` FOREIGN KEY (`account_Type`) REFERENCES `account_type` (`account_Type`),
  CONSTRAINT `fk_accounts_bank_details1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10299238 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (10299200,14000.00,121,'2012-08-08','saving'),(10299201,1320.00,121,'1990-08-08','saving'),(10299202,10000.00,123,'2000-10-10','checking'),(10299203,2999.00,124,'2001-09-28','loan'),(10299204,1000.00,125,'2005-09-09','loan'),(10299205,1234.00,126,'2009-10-28','checking'),(10299206,1000.00,127,'2010-10-10','loan'),(10299207,1000.00,128,'1994-12-29','checking'),(10299208,1000.00,122,'2000-03-09','checking'),(10299209,1320.00,123,'1990-08-08','saving'),(10299210,1500.00,124,'1990-08-08','saving'),(10299211,1903.00,124,'1990-08-08','saving'),(10299212,1001.00,126,'1990-08-08','saving'),(10299213,3000.00,129,'1998-09-09','checking'),(10299214,4000.00,130,'2001-09-09','checking'),(10299215,5000.00,131,'2000-11-09','checking'),(10299216,6000.00,132,'2005-12-09','checking'),(10299217,8000.00,133,'2000-03-03','saving'),(10299218,8020.00,133,'2000-03-01','saving'),(10299219,200.00,134,'2000-03-22','checking'),(10299220,5022.00,134,'1990-12-12','saving'),(10299221,1222.00,121,'1990-12-12','checking'),(10299222,1320.00,126,'1990-05-20','saving'),(10299223,420.00,127,'1995-06-21','checking'),(10299224,1500.00,128,'2001-08-08','saving'),(10299225,10233.00,128,'2001-08-08','saving'),(10299226,2000.00,124,'2000-08-08','saving'),(10299227,1000.00,123,'2000-10-10','checking'),(10299228,34500.00,124,'2001-09-28','loan'),(10299229,11000.00,125,'2005-09-09','loan'),(10299230,1234.00,126,'2009-10-28','checking'),(10299231,10000.00,127,'2010-10-10','loan'),(10299232,23400.00,128,'1994-12-29','checking'),(10299233,100.00,122,'2000-03-09','checking'),(10299234,120.00,123,'1990-08-08','saving'),(10299235,100.00,124,'1990-08-08','saving'),(10299236,19.00,124,'1990-08-08','saving'),(10299237,101.00,126,'1990-08-08','saving');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banking_transactions`
--

DROP TABLE IF EXISTS `banking_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banking_transactions` (
  `transaction_id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `fk_netbanking_transactions_customer1_idx` (`customer_id`),
  CONSTRAINT `fk_netbanking_transactions_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101159 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banking_transactions`
--

LOCK TABLES `banking_transactions` WRITE;
/*!40000 ALTER TABLE `banking_transactions` DISABLE KEYS */;
INSERT INTO `banking_transactions` VALUES (101124,'debit','rent transfer',1250.00,'2014-12-12',1),(101125,'credit','global bank salary',4000.00,'2014-12-09',3),(101126,'debit','salary bonus',123.23,'2000-08-12',21),(101127,'debit','household',1000.00,'2001-02-21',20),(101128,'credit','deposit money for school',12000.00,'2005-03-03',19),(101129,'debit','my share for trip',250.00,'2001-08-22',19),(101130,'debit','lent money',30.00,'2010-05-12',6),(101131,'credit','application fee',44.00,'2000-08-12',21),(101132,'debit','business school salary',123.23,'2000-08-12',4),(101133,'credit','salary bonus',123.23,'2010-08-12',6),(101134,'debit','lease money transfer',1000.00,'2005-08-12',22),(101135,'credit','paypal transaction',190.00,'2000-08-12',19),(101136,'credit','amazon',45.00,'2014-04-11',2),(101137,'credit','funds transfer',120.00,'2012-09-09',5),(101138,'debit','online purchase',240.00,'2012-08-12',7),(101139,'debit','salary bonus',13.45,'2014-08-12',13),(101140,'credit','salary bonus',900.00,'2014-08-12',17),(101141,'debit','grocery transfer',1900.00,'2014-10-19',15),(101142,'debit','scandinavian airlines',1000.00,'2014-11-11',18),(101143,'debit','transfer',1900.00,'2014-10-28',8),(101144,'debit','business transfer',12323.00,'2010-08-12',6),(101145,'credit','nordea salary',4000.00,'2014-12-09',1),(101146,'debit','salary bonus',123.00,'2014-08-12',1),(101147,'debit','household',1000.00,'2014-02-21',1),(101148,'credit','deposit money for school',12000.00,'2014-03-03',1),(101149,'debit','my share for trip',250.00,'2014-08-22',1),(101150,'credit','global bank salary',4000.00,'2014-12-09',2),(101151,'debit','salary bonus',123.00,'2014-08-12',2),(101152,'debit','household',1000.00,'2014-02-21',2),(101153,'credit','deposit money for school',12000.00,'2014-03-03',2),(101154,'debit','my share for trip',250.00,'2014-08-22',2),(101155,'credit','Global Bank Salary',1200.00,'2013-12-09',11),(101156,'debit','commision',100.00,'2014-08-12',11),(101157,'credit','Global Bank Salary',300.00,'2013-12-09',12),(101158,'debit','commision',100.00,'2014-08-12',12);
/*!40000 ALTER TABLE `banking_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_employees`
--

DROP TABLE IF EXISTS `branch_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_employees` (
  `branch_id` int unsigned NOT NULL,
  `employee_id` int unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`employee_id`,`branch_id`),
  KEY `fk_bank_details_has_bank_employee_details_bank_employee_det_idx` (`employee_id`),
  KEY `fk_bank_details_has_bank_employee_details_bank_details_idx` (`branch_id`),
  CONSTRAINT `fk_bank_details_has_bank_employee_details_bank_details` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`),
  CONSTRAINT `fk_bank_details_has_bank_employee_details_bank_employee_detai1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_employees`
--

LOCK TABLES `branch_employees` WRITE;
/*!40000 ALTER TABLE `branch_employees` DISABLE KEYS */;
INSERT INTO `branch_employees` VALUES (121,107181,'2009-10-07',NULL),(126,107181,'2009-05-01','2009-10-06'),(124,107182,'2010-10-07',NULL),(129,107182,'2010-01-01','2010-10-06'),(131,107183,'2011-01-01','2011-09-18'),(133,107183,'2011-09-18',NULL),(126,107184,'2012-08-10',NULL),(127,107185,'2013-07-05',NULL),(128,107186,'2014-06-04',NULL),(129,107187,'2015-01-01',NULL),(121,107188,'2010-10-06',NULL),(124,107189,'2011-09-12',NULL),(133,107190,'2012-08-13',NULL),(133,107191,'2013-07-14',NULL),(133,107192,'2011-06-25',NULL),(126,107193,'2010-04-26',NULL),(126,107194,'2009-08-26',NULL),(127,107195,'2008-09-26',NULL),(126,107196,'2008-08-12','2010-10-25'),(127,107196,'2010-10-26',NULL),(122,107197,'2009-06-10','2011-11-22'),(128,107197,'2011-11-26',NULL),(123,107198,'2010-01-01','2010-07-10'),(124,107198,'2010-07-11','2012-12-23'),(128,107198,'2012-12-26',NULL),(121,107199,'2008-07-01','2008-08-11'),(123,107199,'2008-08-12','2013-04-21'),(129,107199,'2013-04-26',NULL),(121,107200,'2007-09-01','2014-03-25'),(129,107200,'2014-03-26',NULL);
/*!40000 ALTER TABLE `branch_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `branch_id` int unsigned NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(45) NOT NULL,
  `street_address` varchar(50) NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` char(2) NOT NULL,
  `zipcode` int NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (121,'Global Bank Glendale','9082B Chapel St. \n','Glendale','AZ',85302,'331-284-2850'),(122,'Global Bank Lacey','9422 Middle River Drive\n','Lacey','WA',98503,'321-399-3800'),(123,'Global Bank Wallingford','7576 Longbranch Ave. \n','Wallingford','CT',6492,'227-733-3113'),(124,'Global Bank Pleasanton','617 Mayfield Ave. \n','Pleasanton','CA',94566,'222-143-1100'),(125,'Global Bank Holly Springs','359 Boston Road \n','Holly Springs','NC',27540,'322-115-7760'),(126,'Global Bank Tupelo','53 Fordham Court ','Tupelo','MS',38801,'415-622-0283'),(127,'Global Bank Miami Beach','68 Woodside Ave. \n','Miami Beach','FL',33139,'201-151-0511'),(128,'Global Bank Ames','63 Mechanic Rd. \n','Ames','IA',50010,'631-723-8522'),(129,'Global Bank Lawrence Township','772 Orchard Street \n','Lawrence Township','NJ',8648,'334-711-1113'),(130,'Global Bank Wellington','92 Ivy St. \n','Wellington','FL',33414,'313-833-4121'),(131,'Global Bank Grand Forks','9153 Brickell Avenue \n','Grand Forks','ND',58201,'602-523-2371'),(132,'Global Bank Elyria','9508 Goldfield Ave. \n','Elyria','OH',44035,'918-665-4324'),(133,'Global Bank Fresno','677 Bridge Dr. \n','Fresno','CA',93706,'233-211-8341'),(134,'Global Bank Norwalk','60 S. Brickell Lane \n','Norwalk','CT',6851,'123-231-4355'),(135,'Global Bank Quakertown','6 N. Front Street \n','Quakertown','PA',18951,'119-234-8540');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cc_transactions`
--

DROP TABLE IF EXISTS `cc_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_transactions` (
  `transaction_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cc_number` varchar(20) NOT NULL,
  `transaction_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `merchant_details` varchar(45) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `fk_cc_transaction_details_credit_card_details1_idx` (`cc_number`),
  CONSTRAINT `fk_cc_transaction_details_credit_card_details1` FOREIGN KEY (`cc_number`) REFERENCES `credit_cards` (`cc_number`)
) ENGINE=InnoDB AUTO_INCREMENT=109241 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cc_transactions`
--

LOCK TABLES `cc_transactions` WRITE;
/*!40000 ALTER TABLE `cc_transactions` DISABLE KEYS */;
INSERT INTO `cc_transactions` VALUES (109220,'5177949222736068','2013-10-28',23.00,'Bookstore'),(109221,'344660171599125','2011-09-17',8.30,'McDonalds'),(109222,'4334517567232257','2012-09-22',16.34,'Costco'),(109223,'4645207099011161','2013-10-10',100.00,'Mens Warehouse'),(109224,'5381459681047122','2012-08-17',22.40,'Nike Online Store'),(109225,'5139240276589982','2012-06-06',69.00,'Steven’s Barbershop'),(109226,'4520741985877972','2012-01-07',23.00,'Little Cafe'),(109227,'374494451771957','2013-09-07',340.00,'Yankee Stadium, NY'),(109228,'4937540713790809','2013-07-17',50.00,'Ebay'),(109229,'371536125440616','2013-08-20',19.23,'Broadway Diner'),(109230,'4698069325275719','2015-08-12',33.33,'Beauty Shop Online'),(109231,'5129065032168296','2015-12-23',250.00,'Gill & Jenny’s'),(109232,'374136060573161','2013-06-24',120.00,'Walmart'),(109233,'374136060573161','2013-06-24',100.00,'Madison Square Garden'),(109234,'374136060573161','2013-06-24',25.00,'Starbucks'),(109235,'379171565065628','2015-01-01',650.00,'Broadside'),(109236,'5421954424069264','2015-02-18',50.00,'Subway Sandwiches'),(109237,'348740507690709','2014-08-24',340.00,'Apple Online Store'),(109238,'5174242996526888','2014-01-15',2000.00,'Samsug online'),(109239,'348283329774155','2014-07-25',650.00,'Amazon online'),(109240,'348283329774155','2014-07-25',30.00,'Amazon online');
/*!40000 ALTER TABLE `cc_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_cards` (
  `cc_number` varchar(20) NOT NULL,
  `maximum_limit` decimal(10,2) NOT NULL,
  `expiry_date` date NOT NULL,
  `credit_score` int NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`cc_number`),
  KEY `fk_credit_card_details_customer1_idx` (`customer_id`),
  CONSTRAINT `fk_credit_card_details_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_cards`
--

LOCK TABLES `credit_cards` WRITE;
/*!40000 ALTER TABLE `credit_cards` DISABLE KEYS */;
INSERT INTO `credit_cards` VALUES ('344660171599125',1000.00,'2024-12-17',700,5),('348283329774155',1800.00,'2025-07-25',650,21),('348476787661668',11300.00,'2026-02-23',800,1),('348740507690709',1000.00,'2024-08-24',650,11),('371536125440616',1600.00,'2025-10-30',630,8),('374136060573161',3700.00,'2025-06-24',750,4),('374494451771957',1900.00,'2024-09-07',740,25),('379171565065628',13000.00,'2024-11-08',780,3),('4334517567232257',1900.00,'2024-09-12',750,16),('4520741985877972',4200.00,'2026-01-07',700,7),('4645207099011161',1800.00,'2025-10-08',720,6),('4698069325275719',1700.00,'2025-08-12',640,24),('4701197894942012',12000.00,'2025-11-07',790,22),('4937540713790809',1400.00,'2024-07-17',730,9),('5125420384574684',2300.00,'2025-01-23',700,17),('5129065032168296',1000.00,'2025-12-23',500,10),('5139240276589982',11300.00,'2024-06-06',690,14),('5174242996526888',19000.00,'2026-01-15',700,15),('5177949222736068',6000.00,'2024-10-02',700,2),('5381459681047122',6300.00,'2025-08-17',730,18),('5421954424069264',9200.00,'2025-05-18',750,19);
/*!40000 ALTER TABLE `credit_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `street_address` varchar(50) NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` char(2) NOT NULL,
  `zipcode` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `gender` char(1) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Violet','Schneider','1991-11-15','727 Theatre St.','Ontario','CA',91762,'violet.schneider20@gmail.com','F'),(2,'Louisa','Becks','2000-11-19','Mulholland Dr.','Los Angeles','CA',91700,'louisa26@yahoo.com','F'),(3,'William','Smith','1973-08-07','7257 Brown Ave. ','Grand Rapids','MI',49503,'william73@yahoo.com','M'),(4,'Kristoffer','Peterson','1945-05-10','9518 Fordham Rd.\nApt 526','Manassas','VA',20109,'kristoffer45@gmail.com','M'),(5,'Sally','Matthews','2000-11-14','8093 Newport Lane ','Dayton','OH',45420,'sally36@hotmail.com','F'),(6,'Freddy','Fredericks','1990-10-24','8474 Tarkiln Hill St. ','Fresh Meadows','NY',11365,'freddy23@hotmail.com','M'),(7,'Rozella','Tremblay','1981-07-27','235 Jackson Avenue ','Camas','WA',98607,'rozella.tremblay28@gmail.com','F'),(8,'Toney','Brown','1980-02-18','946 Cherry St. \n','Apple Valley','CA',92307,'toney_brown@gmail.com','M'),(9,'Matteo','Koch','1943-05-05','315 Arch Circle ','Hoffman Estates','IL',60169,'matteo_koch43@hotmail.com','M'),(10,'Vicente','Stanton','2011-01-03','11 Applegate St. ','Amarillo','TX',79106,'vicente_stanton11@hotmail.com','M'),(11,'Clair','Price','1990-04-01','9615 Mill Pond Street \n','Hamburg','NY',14075,'clair.price@yahoo.com','F'),(12,'Rebecca','Wunsch','1992-04-01','57 Green Rd. \n','East Orange','NJ',7017,'rebecca_wunsch92@gmail.com\r\n','F'),(13,'Joel','Hahn','1972-08-11','9603 West Rockledge Dr. \n','Lake Jackson','TX',77566,'joel.hahn@hotmail.com\r\n','M'),(14,'Ramiro','Reinger','1969-11-11','605 Smoky Hollow Street \n','Dalton','GA',30721,'ramiro.reinger@gmail.com\r\n','M'),(15,'Freddie','Schroeder','2007-06-25','58 North Pheasant Street \n','Chicopee','MA',1020,'freddie_schroeder@yahoo.com\r\n','M'),(16,'Cristina','Leannon','1942-02-22','9590 Main Dr. \n','Rockville','MD',20850,'cristina.leannon@gmail.com\r\n','F'),(17,'Alf','Koepp','1965-11-11','54 Bradford Dr. \n','Deltona','FL',32725,'alf_koepp@hotmail.com\r\n','M'),(18,'Cecilia','Thompson','1992-03-01','85 Pine Ave. \n','Commack','NY',11725,'cecilia32@yahoo.com\r\n','F'),(19,'Russell','Bennett','1997-05-12','8 S. Canal Ave. \n','Perth Amboy','NJ',8861,'russell45@hotmail.com\r\n','M'),(20,'Collin','Andrews','1996-06-10','8226 Glen Ridge Drive \n','Brick','NJ',8723,'collin96@yahoo.com\r\n','M'),(21,'Shaina','Boehm','1982-03-29','60 Bald Hill Street \n','Huntersville','NC',28078,'shaina.boehm@hotmail.com\r\n','F'),(22,'Ryan','Adams','1989-03-30','9446 Lantern Street \n','Clifton Park','NY',12065,'ryan.adams_89@live.com','M'),(23,'Kariane','Murphy','1982-05-22','702 Arch Street \n','Sioux City','IA',51106,'kariane_murphy@yahoo.com\r\n','F'),(24,'Kris','Murl','1987-10-06','41 High Noon Lane \n','Goose Creek','SC',29445,'murl.kris@gmail.com\r\n','M'),(25,'Allan','Oreilly','1970-08-06','457 West Aspen Dr. \n','Spartanburg','SC',29301,'allan.oreilly@hotmail.com\r\n','M'),(26,'Benny','Anderson','1994-11-15','680 Thorne Street \n','Albany','NY',12203,'anderson94@hotmail.com\r\n','M'),(27,'Alessandra','Jacobson','1947-07-17','10 Williams Lane \n','Chardon','OH',44024,'alessandra.jacobson47@hotmail.com\r\n','F'),(28,'Andy','Sporer','1980-02-11','9401 Coffee St. \n','Stamford','CT',6902,'andy.sporer@yahoo.com\r\n','M'),(29,'Dean','Johnson','1950-01-01','8776 Lyme St. \n','Washington','PA',15301,'dean50@yahoo.com\r\n','M'),(30,'Ryan','Howell','1960-01-13','784 Sleepy Hollow Street \n','Oak Ridge','TN',37830,'ryan.howell@yahoo.com\r\n','M'),(31,'Rosella','Rohan','1954-02-21','9602 Trenton Street \n','Lutherville Timonium','MD',21093,'rosella.rohan54@hotmail.com\r\n','F'),(32,'Marisa','Corkery','2006-02-11','919 Jones Road \n','Mableton','GA',30126,'marisa.corkery6@hotmail.com\r\n','F'),(33,'John','Paul','1971-01-21','62 Miller St. \n','Norwood','MA',2062,'johnpaul27@gmail.com\r\n','M');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `supervisor_id` int unsigned DEFAULT NULL,
  `level_of_access` varchar(15) NOT NULL,
  `date_of_birth` date NOT NULL,
  `street_address` varchar(50) NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` char(2) NOT NULL,
  `zipcode` int NOT NULL,
  `gender` char(1) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employees_employees1_idx` (`supervisor_id`),
  CONSTRAINT `fk_employees_employees1` FOREIGN KEY (`supervisor_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107201 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (107181,'Raphael','Wehner',NULL,'admin','1982-12-15','63 N. Mayfield Court \n','Westbury','NY',11590,'M'),(107182,'Virgil','Reynolds',NULL,'admin','1976-11-11','83 Big Rock Cove St. \n','Macomb','MI',48042,'M'),(107183,'Isabell','Schaden',NULL,'admin','1965-11-11','547 Peg Shop Street \n','Oxford','MS',38655,'F'),(107184,'Maria','Champlin',NULL,'admin','1985-03-31','90 Lees Creek Street \n','Downingtown','PA',19335,'F'),(107185,'Marco','Harrie',NULL,'admin','1988-07-05','7782 Parker Street \n','Saint Joseph','MI',49085,'M'),(107186,'Edward','Carroll',NULL,'admin','1991-08-20','9033 Euclid St. \n','Valdosta','GA',31601,'M'),(107187,'Hailie','Barton',NULL,'admin','1999-09-10','226 Lake Avenue \n','Butler','PA',16001,'F'),(107188,'Maud','Schroeder',107181,'regular','1989-02-21','8574 Plumb Branch Ave. \n','Marshalltown','IA',50158,'F'),(107189,'Joseph','Turcotte',107182,'regular','1991-06-15','9017 Redwood St. \n','Cockeysville','MD',21030,'M'),(107190,'Walker','Gibson',107183,'regular','1992-03-25','1 Maiden Lane \n','Hanover Park','IL',60133,'M'),(107191,'Josiah','Senger',107183,'regular','1987-08-21','733 Lafayette Court \n','Vista','CA',92083,'M'),(107192,'Joyce','Leannon',107183,'regular','1985-09-16','668 Kent Court \n','Hoffman Estates','IL',60169,'F'),(107193,'Ben','Gibbs',107184,'regular','1984-02-04','33 Vine Drive \n','Little Rock','AR',72209,'M'),(107194,'Will','Gardener',107184,'regular','1981-11-01','9971 La Sierra Ave. \n','Kingsport','TN',37660,'M'),(107195,'Carrie','Tiller',107185,'regular','1976-03-09','97 Thompson Lane \n','Hempstead','NY',11550,'F'),(107196,'John','Barry',107185,'regular','1975-03-11','211 Hanover Avenue \n','Hope Mills','NC',28348,'M'),(107197,'Oliver','Mosciski',107186,'regular','1994-04-05','608 Alton Dr. \n','Fond Du Lac','WI',54935,'F'),(107198,'Timothy','Benton',107186,'regular','1991-03-10','9767 Meadow Road \n','Austin','MN',55912,'M'),(107199,'Bob','Andrews',107187,'regular','1970-05-25','7126 Oxford St. \n','Jacksonville Beach','FL',32250,'M'),(107200,'Melanie','Anderson',107187,'regular','1992-07-06','263 Golden Star Drive \n','Lorton','VA',22079,'F');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (9);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `duration_in_years` decimal(4,2) NOT NULL,
  `loan_start_date` date NOT NULL,
  `interest_rate` decimal(4,2) NOT NULL,
  `loan_amount_taken` decimal(10,2) NOT NULL,
  `loan_amount_repaid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `loan_type` varchar(45) NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `fk_loan_customer1_idx` (`customer_id`),
  CONSTRAINT `fk_loan_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4009 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (3988,7.00,'2017-02-02',10.25,20000.00,2500.00,'Vehicle',1),(3989,8.00,'2017-12-12',11.25,38000.00,5000.00,'Vehicle',2),(3990,6.00,'2019-05-11',10.75,20000.00,2000.00,'Home',3),(3991,5.00,'2020-02-03',8.25,25000.00,3000.00,'Education',4),(3992,6.00,'2021-12-21',12.25,30000.00,5000.00,'Home',5),(3993,7.00,'2019-04-04',13.25,15000.00,4000.00,'Personal',6),(3994,8.00,'2017-06-12',11.25,17000.00,2000.00,'Personal',7),(3995,4.00,'2021-05-05',9.45,18000.00,8000.00,'Wedding',8),(3996,10.00,'2014-08-07',8.75,110000.00,40000.00,'Real Estate',8),(3997,10.00,'2022-03-03',13.10,28000.00,5000.00,'Home',10),(3998,3.00,'2022-10-10',9.75,20000.00,6000.00,'Education',11),(3999,2.00,'2020-10-03',11.13,11000.00,9000.00,'Home',12),(4000,10.00,'2013-02-12',7.78,22000.00,18000.00,'Education',13),(4001,5.00,'2021-03-12',7.84,14000.00,8000.00,'Travel',13),(4002,15.00,'2012-03-12',14.75,29000.00,7000.00,'Real Estate',15),(4003,5.00,'2022-04-11',11.75,25000.00,12000.00,'Home',16),(4004,4.00,'2021-05-12',9.65,18000.00,2000.00,'Vehicle',17),(4005,8.00,'2017-06-12',10.15,30000.00,2000.00,'Education',17),(4006,13.00,'2011-06-11',8.55,28000.00,2000.00,'Vehicle',17),(4007,20.00,'2020-05-10',10.50,50000.00,2000.00,'Real Estate',20);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'USER'),(2,'ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com','100205','2023-04-15 22:39:36',''),(2,'john_paul@something.com','nicetryhacker!','2023-04-15 22:39:36',''),(3,'bent@hotmail.com','bentbent','2023-04-15 22:39:36',''),(4,'Bob@yahoo.dk','bobtest','2023-04-15 22:39:36',''),(5,'test','password','2023-04-15 22:39:36',''),(6,'admin','admin','2023-04-15 22:39:36',''),(7,'john@doe.com','$2a$10$7NSw.ccSobwftju/qvkMEuSxvNHBQb1qpFtt3BTVN3uvFFL0VFcua','2023-04-16 16:18:32','John'),(8,'ben@doe.com','$2a$10$dSkwxDR14A6vs/usCNxP8.4xRWYsTmR91emZXVahad2k4d7KydPuS','2023-04-16 16:19:30','Ben');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  KEY `user_fk_idx` (`user_id`),
  KEY `role_fk_idx` (`role_id`),
  CONSTRAINT `role_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(6,2),(7,1),(8,1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24  3:47:00
