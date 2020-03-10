-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: replacement_prac_q5
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `eval6_feestructure`
--

DROP TABLE IF EXISTS `eval6_feestructure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eval6_feestructure` (
  `lenght` decimal(4,0) NOT NULL,
  `fee` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`lenght`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eval6_feestructure`
--

LOCK TABLES `eval6_feestructure` WRITE;
/*!40000 ALTER TABLE `eval6_feestructure` DISABLE KEYS */;
/*!40000 ALTER TABLE `eval6_feestructure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eval6_marina`
--

DROP TABLE IF EXISTS `eval6_marina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eval6_marina` (
  `marinanum` char(4) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `address` char(15) DEFAULT NULL,
  `city` char(15) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  PRIMARY KEY (`marinanum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eval6_marina`
--

LOCK TABLES `eval6_marina` WRITE;
/*!40000 ALTER TABLE `eval6_marina` DISABLE KEYS */;
/*!40000 ALTER TABLE `eval6_marina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eval6_marinaslip`
--

DROP TABLE IF EXISTS `eval6_marinaslip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eval6_marinaslip` (
  `slipid` int(11) NOT NULL AUTO_INCREMENT,
  `marinanum` char(4) NOT NULL,
  `slipnum` char(4) DEFAULT NULL,
  `length` decimal(4,0) NOT NULL,
  `rentalfee` decimal(8,2) DEFAULT NULL,
  `boatname` char(50) DEFAULT NULL,
  `boattype` char(50) DEFAULT NULL,
  `ownernum` char(4) NOT NULL,
  PRIMARY KEY (`slipid`),
  KEY `FK1_Marinanr_IDx` (`marinanum`),
  KEY `FK2_lenght_IDx` (`length`),
  KEY `FK3_ownernum_IDx` (`ownernum`),
  CONSTRAINT `FK1` FOREIGN KEY (`marinanum`) REFERENCES `eval6_marina` (`marinanum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2` FOREIGN KEY (`length`) REFERENCES `eval6_feestructure` (`lenght`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK3` FOREIGN KEY (`ownernum`) REFERENCES `eval6_owner` (`ownernum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eval6_marinaslip`
--

LOCK TABLES `eval6_marinaslip` WRITE;
/*!40000 ALTER TABLE `eval6_marinaslip` DISABLE KEYS */;
/*!40000 ALTER TABLE `eval6_marinaslip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eval6_owner`
--

DROP TABLE IF EXISTS `eval6_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eval6_owner` (
  `ownernum` char(4) NOT NULL,
  `lastname` char(50) DEFAULT NULL,
  `firstname` char(20) DEFAULT NULL,
  `address` char(15) DEFAULT NULL,
  `city` char(15) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  PRIMARY KEY (`ownernum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eval6_owner`
--

LOCK TABLES `eval6_owner` WRITE;
/*!40000 ALTER TABLE `eval6_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `eval6_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eval6_servicecategory`
--

DROP TABLE IF EXISTS `eval6_servicecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eval6_servicecategory` (
  `categorynum` decimal(4,0) NOT NULL,
  `categorydescription` char(255) DEFAULT NULL,
  `categoryhours` int(11) DEFAULT NULL,
  PRIMARY KEY (`categorynum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eval6_servicecategory`
--

LOCK TABLES `eval6_servicecategory` WRITE;
/*!40000 ALTER TABLE `eval6_servicecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `eval6_servicecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eval6_servicerequest`
--

DROP TABLE IF EXISTS `eval6_servicerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eval6_servicerequest` (
  `serviceid` int(11) NOT NULL AUTO_INCREMENT,
  `slipid` int(11) NOT NULL,
  `categorynum` decimal(4,0) NOT NULL,
  `description` char(255) DEFAULT NULL,
  `status` char(255) DEFAULT NULL,
  `esthours` decimal(4,2) DEFAULT NULL,
  `spenthours` decimal(4,2) DEFAULT NULL,
  `nextservicedate` date DEFAULT NULL,
  PRIMARY KEY (`serviceid`),
  KEY `FK1_slipid_IDx` (`slipid`),
  KEY `FK2_categorynum_IDx` (`categorynum`),
  CONSTRAINT `FK1_slipid` FOREIGN KEY (`slipid`) REFERENCES `eval6_marinaslip` (`slipid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2_categorynum` FOREIGN KEY (`categorynum`) REFERENCES `eval6_servicecategory` (`categorynum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eval6_servicerequest`
--

LOCK TABLES `eval6_servicerequest` WRITE;
/*!40000 ALTER TABLE `eval6_servicerequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `eval6_servicerequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'replacement_prac_q5'
--

--
-- Dumping routines for database 'replacement_prac_q5'
--
/*!50003 DROP PROCEDURE IF EXISTS `eval6_new_marinaslip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eval6_new_marinaslip`(
	IN marnumber TEXT,
    IN slipnumber TEXT,
    IN boatlenght DECIMAL,
    IN boat_name TEXT,
    IN boat_type TEXT,
    IN ownernumber TEXT
)
BEGIN
	SET @rFee = (SELECT fee FROM eval6_feestructure WHERE eval6_feestructure.lenght = boatlenght);
    
    IF (boat_type = 'ferry')
    then
		SET @rFee = @rFee + 100;
    end if;
    
	INSERT INTO 
		eval6_marinaslip (marinanum, slipnum, length, rentalfee, boatname, boattype, ownernum)
	VALUES
		(marnumber, slipnumber, boatlenght, @rFee , boat_name, boat_type, ownernumber);
        
	SELECT last_insert_id() as message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eval6_new_servicerequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eval6_new_servicerequest`(
	IN slip_id INT,
    IN category_number DECIMAL,
    IN description TEXT
)
BEGIN
	SET @estHours = (SELECT categoryhours FROM eval6_servicecategory WHERE categorynum = category_number);

	INSERT INTO
		eval6_servicerequest (slipid, categorynum, description, esthours)
	VALUES
		(slip_id, category_number, description, @estHours);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eval6_update_servicerequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eval6_update_servicerequest`(
	IN service_id DECIMAL,
    IN status TEXT,
    IN spent_hours DECIMAL
)
BEGIN
	UPDATE 
		eval6_servicerequest
	SET 
		eval6_servicerequest.status = status,
        eval6_servicerequest.spenthours = spenthours
	WHERE
		serviceid = service_id;
	
    IF (SELECT status FROM eval6_servicerequest) = 'cancelled'
    then
		DELETE FROM eval6_servicerequest WHERE eval6_servicerequest.status = 'cancelled';
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `services_by_boat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `services_by_boat`(
	IN slip_number VARCHAR(45)
)
BEGIN
    SELECT 
		eval6_servicerequest.serviceid, eval6_marinaslip.slipid
    FROM
		eval6_servicerequest
	INNER JOIN
		eval6_marinaslip ON eval6_servicerequest.slipid = eval6_marinaslip.slipid
	WHERE
		slip_number = eval6_marinaslip.slipid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-27 14:48:49
