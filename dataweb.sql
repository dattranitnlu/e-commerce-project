CREATE DATABASE  IF NOT EXISTS `lapshop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lapshop`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: lapshop
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `cartid` bigint(20) NOT NULL,
  `productid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cartid`),
  UNIQUE KEY `productid_UNIQUE` (`productid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=1222351 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (12,'Gaming'),(13,'Dell'),(14,'Asus'),(15,'Lenovo'),(16,'Hp'),(17,'Apple');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Before_Insert_category` BEFORE INSERT ON `category` FOR EACH ROW BEGIN
  IF (EXISTS(SELECT 1 FROM category WHERE categoryname = NEW.categoryname)) THEN
    SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'INSERT failed due to duplicate mobile number';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `commentid` bigint(20) NOT NULL,
  `quantitystar` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantitylike` int(11) DEFAULT NULL,
  `repplyid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `customerid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`commentid`),
  UNIQUE KEY `repplyid_UNIQUE` (`repplyid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  UNIQUE KEY `customerid_UNIQUE` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier`
--

DROP TABLE IF EXISTS `courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courier` (
  `courierid` bigint(20) NOT NULL,
  `couriername` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courierphone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courieraddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`courierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier`
--

LOCK TABLES `courier` WRITE;
/*!40000 ALTER TABLE `courier` DISABLE KEYS */;
/*!40000 ALTER TABLE `courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giftcard`
--

DROP TABLE IF EXISTS `giftcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `giftcard` (
  `giftcardid` bigint(20) NOT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`giftcardid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giftcard`
--

LOCK TABLES `giftcard` WRITE;
/*!40000 ALTER TABLE `giftcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `giftcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notification` (
  `notificationid` bigint(20) NOT NULL,
  `title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notificationdescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notificategoryid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notificationid`),
  UNIQUE KEY `notificategoryid_UNIQUE` (`notificategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationcategory`
--

DROP TABLE IF EXISTS `notificationcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notificationcategory` (
  `noticategoryid` bigint(20) NOT NULL,
  `notificategoryname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`noticategoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationcategory`
--

LOCK TABLES `notificationcategory` WRITE;
/*!40000 ALTER TABLE `notificationcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificationcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlineshop`
--

DROP TABLE IF EXISTS `onlineshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `onlineshop` (
  `shopname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `shopphone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopaddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`shopname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlineshop`
--

LOCK TABLES `onlineshop` WRITE;
/*!40000 ALTER TABLE `onlineshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `onlineshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `orderid` bigint(20) NOT NULL,
  `orderdate` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `deliverystate` bit(1) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `productid` bigint(20) DEFAULT NULL,
  `courierid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  UNIQUE KEY `productid_UNIQUE` (`productid`),
  UNIQUE KEY `courierid_UNIQUE` (`courierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenttype`
--

DROP TABLE IF EXISTS `paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paymenttype` (
  `paymentid` bigint(20) NOT NULL,
  `paymentname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttype`
--

LOCK TABLES `paymenttype` WRITE;
/*!40000 ALTER TABLE `paymenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productimage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productprice` double DEFAULT NULL,
  `productdescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `favoritestate` bit(1) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=908985 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (134567,'Asus Vivobook S530UA-BQ072T','Asus Vivobook S530UA-BQ072T.jpg',550,'Core i3-8130U (Kabylake-Refresh )2.20Ghz (upto 3.4GHz, 2Cores, 4Threads, 6MB Cache, FSB 4GT/s)',14,NULL),(232345,'Lenovo Thinkpad P50','lenovo-thinkpad-p50-mobile-workstation.jpg',1113.6,'CPU: Intel® Core™ i7 - 6700HQ (6M Cache), 2.5 Ghz up to 3.6 Ghz',15,NULL),(232444,'Dell Lattitude 7480','dell-latitude-7480.jpeg',763.6,'CPU: Intel® Core™ i5 - 6300U (3M Cache), 2.4 Ghz up to 3.0 Ghz',13,NULL),(235545,'Lenovo Thinkpad P51','lenovo-laptop-thinkpad-p51.png',1400,'CPU: Intel® Core™ i7 - 7700HQ (6M Cache), 2.8 Ghz up to 3.8 Ghz',15,NULL),(323232,'Laptop Dell Alienware 17 R5','alienware-17-r5_1.jpg',1909.1,'CPU: Intel® Core™ i7 - 8750H (9M Cache), 2.2 Ghz up to 4.1 Ghz',12,NULL),(323455,'Dell Lattitude E7440','dell-e7440.jpg',336.4,'CPU: Intel® Core™ i5 - 4310U (3M Cache), 2.0 Ghz up to 3.0 Ghz',13,NULL),(436765,'Asus Zenbook UX410UF-GV116T','asus-zenbook-ux410uf-gv116-i5.jpg',815.9,'Core i5-8250U (Kabylake-Refresh )1.6Ghz (upto 3.4GHz, 4Cores, 8Threads, 6MB Cache, FSB 4GT/s)',14,NULL),(553367,'Asus Zenbook UX430UA-GV340T','asus-zenbook-ux430ua-gv340t.jpg',918.18,'Core i5-8250U (Kabylake-Refresh )1.6Ghz (upto 3.4GHz, 4Cores, 8Threads, 6MB Cache, FSB 4GT/s)',14,NULL),(611122,'Laptop HP ZBook 15 G3','hp-zbook-15-g3-workstation-khoavang.vn-1.jpg',945.9,'CPU: Intel® Core™ i7 - 6700HQ (6M Cache), 2.6 Ghz up to 3.5 Ghz',16,NULL),(653247,'Asus ROG Strix Scar II GL504','asus-rog-strix-scar-ii-gl504gs.jpg',1318.2,'CPU: Intel® Core™ i7 - 8750H (9M Cache), 2.2 Ghz up to 4.1 Ghz',12,NULL),(654546,'Laptop HP ENVY - 17-u275cl','Laptop HP ENVY - 17-u275cl.png',900,'CPU: Intel® Core™ i7 - 8550U (8M Cache), 1.8 Ghz up to 4.0 Ghz',16,NULL),(907788,'Laptop Asus Vivobook S15','AsusVivobook.jpg',465.5,'Chip: Intel Core i3-8130U (2.2GHz up to 3.4GHz 4MB)',14,NULL),(908980,'LAPTOP ASUS A412FA-EK156T XANH','10041691_MTXT_ASUS_A412FA-EK155T-XANH_01.jpg',531.4,'Màn hình: Full HD 14\"',14,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_product` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
  IF (EXISTS(SELECT 1 FROM product WHERE productname = NEW.productname)) THEN
    SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'INSERT failed due to duplicate mobile number';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `replycomment`
--

DROP TABLE IF EXISTS `replycomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `replycomment` (
  `replyid` bigint(20) NOT NULL,
  `descriptionreply` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commentid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`replyid`),
  UNIQUE KEY `commentid_UNIQUE` (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replycomment`
--

LOCK TABLES `replycomment` WRITE;
/*!40000 ALTER TABLE `replycomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `replycomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `report` (
  `reportid` bigint(20) NOT NULL,
  `reporttitle` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `reportdescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`reportid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporttype`
--

DROP TABLE IF EXISTS `reporttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reporttype` (
  `reporttypeid` bigint(20) NOT NULL,
  `reporttypename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`reporttypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporttype`
--

LOCK TABLES `reporttype` WRITE;
/*!40000 ALTER TABLE `reporttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier` (
  `supplierid` bigint(20) NOT NULL,
  `suppliername` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `userid` int(10) NOT NULL AUTO_INCREMENT,
  `useremail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userpass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userimage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userroleid` int(11) DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `sex` bit(1) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (123,'trandatitnlu@gmail.com','dong13121997','IMG_20171217_102835.jpg',1,'tran dat',NULL,NULL,NULL),(125,'andynguyen','andynguyen','andy.jpg',0,'Quynh Nguyen',NULL,NULL,NULL),(128,'alexrobert','alexrobert','avatar-01.jpg',1,'Alex Robert',NULL,NULL,NULL),(129,'liemnguyen','liemnguyen','avatar-03.jpg',1,'Liem Nguyen',NULL,NULL,NULL),(130,'danthanh','danthanh','Untitled-1.jpg',0,'dan thanh tran',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_user_insert` BEFORE INSERT ON `user` FOR EACH ROW begin
	if(exists(SELECT 1 FROM USER WHERE USEREMAIL = NEW.USEREMAIL)) THEN
    SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT ='INSERT failed due to duplicate mobile number';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userrole` (
  `userroleid` int(11) NOT NULL,
  `rolename` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userroleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (0,'Normal User'),(1,'Admin');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-04 22:24:43
