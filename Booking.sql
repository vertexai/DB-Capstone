DROP TABLE IF EXISTS `Booking`;
CREATE TABLE `Booking` (
  `BookingID` int NOT NULL,
  `Date` datetime NOT NULL,
  `TableNumber` int NOT NULL,
  `Customer_CustomerID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_Booking_Customer1_idx` (`Customer_CustomerID`),
  CONSTRAINT `fk_Booking_Customer1` FOREIGN KEY (`Customer_CustomerID`) REFERENCES `Customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (1,'2022-02-02 00:00:00',1,2),(2,'2022-02-03 00:00:00',2,1),(3,'2022-02-02 00:00:00',4,5),(4,'2022-02-05 00:00:00',3,3);
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `CustomerID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ContactNumber` varchar(45) NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Alixia','0922819283','alixia@gmail.com'),(2,'Bob','0988878323','bob@gmail.com'),(3,'David','0911808792','david@yahoo.com'),(4,'Frank','8807780878','frank@hoho.com'),(5,'Max','8908800876','max@company.org');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryStatus`
--

DROP TABLE IF EXISTS `DeliveryStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeliveryStatus` (
  `DeliveryStatusID` int NOT NULL,
  `Date` datetime NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`DeliveryStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryStatus`
--

LOCK TABLES `DeliveryStatus` WRITE;
/*!40000 ALTER TABLE `DeliveryStatus` DISABLE KEYS */;
INSERT INTO `DeliveryStatus` VALUES (1,'2002-02-02 00:00:00','DONE'),(2,'2002-02-03 00:00:00','DONE'),(3,'2002-02-02 00:00:00','DONE'),(4,'2002-02-05 00:00:00','DONE');
/*!40000 ALTER TABLE `DeliveryStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `MenuID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` mediumtext,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (1,'Cuisines',NULL),(2,'Starters',NULL),(3,'Courses',NULL),(4,'Drinks',NULL),(5,'Deserts',NULL);
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `OrderID` int NOT NULL,
  `Date` datetime NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,2) DEFAULT NULL,
  `DeliveryStatus_DeliveryStatusID` int NOT NULL,
  `Booking_BookingID` int NOT NULL,
  `Staff_StaffID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Order_DeliveryStatus_idx` (`DeliveryStatus_DeliveryStatusID`),
  KEY `fk_Order_Booking1_idx` (`Booking_BookingID`),
  KEY `fk_Order_Staff1_idx` (`Staff_StaffID`),
  CONSTRAINT `fk_Order_Booking1` FOREIGN KEY (`Booking_BookingID`) REFERENCES `Booking` (`BookingID`),
  CONSTRAINT `fk_Order_DeliveryStatus` FOREIGN KEY (`DeliveryStatus_DeliveryStatusID`) REFERENCES `DeliveryStatus` (`DeliveryStatusID`),
  CONSTRAINT `fk_Order_Staff1` FOREIGN KEY (`Staff_StaffID`) REFERENCES `Staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,'2002-02-02 00:00:00',3,150.00,1,1,3),(2,'2002-02-03 00:00:00',5,200.00,2,2,2),(3,'2002-02-02 00:00:00',2,240.00,3,3,2),(4,'2002-02-05 00:00:00',7,1200.00,4,4,1);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Menu`
--

DROP TABLE IF EXISTS `Order_Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_Menu` (
  `Order_OrderID` int NOT NULL,
  `Menu_MenuID` int NOT NULL,
  PRIMARY KEY (`Order_OrderID`,`Menu_MenuID`),
  KEY `fk_Order_has_Menu_Menu1_idx` (`Menu_MenuID`),
  KEY `fk_Order_has_Menu_Order1_idx` (`Order_OrderID`),
  CONSTRAINT `fk_Order_has_Menu_Menu1` FOREIGN KEY (`Menu_MenuID`) REFERENCES `Menu` (`MenuID`),
  CONSTRAINT `fk_Order_has_Menu_Order1` FOREIGN KEY (`Order_OrderID`) REFERENCES `Order` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Menu`
--

LOCK TABLES `Order_Menu` WRITE;
/*!40000 ALTER TABLE `Order_Menu` DISABLE KEYS */;
INSERT INTO `Order_Menu` VALUES (4,1),(1,2),(2,3),(3,3);
/*!40000 ALTER TABLE `Order_Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `StaffID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'Tom','Manager',6000.00),(2,'Ken','Staff',4000.00),(3,'Ana','recipient',3800.00);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;
