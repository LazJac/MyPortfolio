-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dev_project2_db
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `User_IN_Admin_idx` (`User_ID`),
  CONSTRAINT `User_IN_Admin` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `App_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Type_ID` int(11) NOT NULL,
  `App_CurrentDate` datetime NOT NULL,
  `App_StartDate` datetime NOT NULL,
  `App_EndDate` datetime NOT NULL,
  `App_Days_Leave` int(11) NOT NULL,
  `App_Approval` varchar(45) DEFAULT 'PENDING',
  `App_Approved_By` varchar(45) DEFAULT 'Null',
  PRIMARY KEY (`App_id`,`User_ID`,`Type_ID`),
  KEY `LType_IN_Application_idx` (`Type_ID`),
  KEY `User_IN_App` (`User_ID`),
  CONSTRAINT `LType_IN_Application` FOREIGN KEY (`Type_ID`) REFERENCES `leave_type` (`Type_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `User_IN_App` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,10000006,4,'2018-09-09 23:07:26','2018-10-10 00:00:00','2018-10-12 00:00:00',2,'REJECTED','ME'),(3,10000005,5,'2018-09-12 18:00:07','2017-01-01 00:00:00','2017-02-03 00:00:00',2006,'REJECTED','ME'),(5,10000006,5,'2018-09-12 20:16:26','2018-02-02 00:00:00','2018-07-09 00:00:00',1994,'APPROVED','ME');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `Department_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Department_Group` varchar(45) NOT NULL,
  `Department_Level` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Department_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'group1',23),(2,'group2',3),(3,'group3',10);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`User_ID`),
  CONSTRAINT `User_IN_Emp` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_type` (
  `Type_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type_Name` varchar(45) NOT NULL,
  `Type_Description` varchar(225) NOT NULL,
  `Type_Max_Days` int(11) NOT NULL,
  `Accumulation_Rate_Anum` float NOT NULL,
  PRIMARY KEY (`Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_type`
--

LOCK TABLES `leave_type` WRITE;
/*!40000 ALTER TABLE `leave_type` DISABLE KEYS */;
INSERT INTO `leave_type` VALUES (4,'type1','des1',24,1),(5,'type2','des2',13,0.236);
/*!40000 ALTER TABLE `leave_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `User_ID` int(11) NOT NULL,
  `Title_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `User_in_Manager` (`User_ID`),
  KEY `Title_IN_Man_idx` (`Title_Name`),
  CONSTRAINT `User_IN_Manager` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (10000007,'title1');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Department_ID` int(11) NOT NULL,
  `User_Name` varchar(45) NOT NULL,
  `User_Password` varchar(45) NOT NULL,
  `User_Email` varchar(45) NOT NULL,
  `User_Gender` tinyint(4) NOT NULL,
  `User_Age` int(11) NOT NULL,
  `User_Job` varchar(45) NOT NULL,
  `User_DateEmployed` datetime NOT NULL,
  `User_Years_Employed` int(11) NOT NULL DEFAULT '0',
  `Balance_Vacation` int(11) NOT NULL,
  `Balance_Sick` int(11) NOT NULL,
  `Balance_Floating` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`User_ID`,`Department_ID`),
  KEY `Department_IN_User_idx` (`Department_ID`),
  CONSTRAINT `Department_IN_User` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10000008 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10000005,2,'name1','pass1','email1',1,23,'job1','2016-09-10 00:00:00',0,15,13,0),(10000006,1,'name2','pass2','email2',1,24,'job2','2016-09-10 00:00:00',0,15,13,0),(10000007,3,'name3','pass3','email3',0,34,'job1','2016-09-10 00:00:00',0,15,13,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wait_list`
--

DROP TABLE IF EXISTS `wait_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wait_list` (
  `App_id` int(11) NOT NULL,
  `WL_Days_Passed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`App_id`),
  CONSTRAINT `Application_IN_Wait_list` FOREIGN KEY (`App_id`) REFERENCES `application` (`App_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wait_list`
--

LOCK TABLES `wait_list` WRITE;
/*!40000 ALTER TABLE `wait_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `wait_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dev_project2_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `Admin_create_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Admin_create_employee`(
	IN DEPARTMENT_ID INT,
	IN U_NAME VARCHAR(45),
    IN U_PASSWORD VARCHAR(45),
    IN U_EMAIL VARCHAR(45),
    IN U_GENDER TINYINT,
    IN U_AGE INT,
    IN U_JOB VARCHAR(45),
    IN U_DATEEMP DATETIME,
    IN U_YEARS INT,
    IN B_VACATION INT,
    IN B_SICK INT,
    IN B_FLOATING INT,
    IN TITLE VARCHAR(45),
    IN isManager TINYINT
)
BEGIN
		
	INSERT INTO dev_project2_db.user(Department_ID,User_Name,User_Password,User_Email,User_Gender,User_Age,User_Job,User_DateEmployed,User_Years_Employed,Balance_Vacation,Balance_Sick,Balance_Floating)
    VALUES (DEPARTMENT_ID,U_NAME,U_PASSWORD,U_EMAIL,U_GENDER,U_AGE,U_JOB,U_DATEEMP,U_YEARS,B_VACATION,B_SICK,B_FLOATING);
	
    if isManager = 1
    then
		INSERT INTO dev_project2_db.manager(User_ID,Title_Name)
        VALUES (LAST_INSERT_ID(),TITLE);
	end if;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Admin_create_Leave_Type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Admin_create_Leave_Type`(
	IN LT_NAME VARCHAR(45),
    IN LT_DESC VARCHAR(45),
    IN LT_MAX INT,
    IN LT_RATE FLOAT
)
BEGIN
		
	INSERT INTO dev_project2_db.leave_type(Type_Name, Type_Description, Type_Max_Days, Accumulation_Rate_Anum)
    VALUES (LT_NAME,LT_DESC,LT_MAX,LT_RATE);
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Admin_delete_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Admin_delete_employee`(
	IN USER_ID INT
)
BEGIN

	DELETE FROM dev_project2_db.manager
    WHERE dev_project2_db.manager.User_ID = USER_ID;
    
	DELETE FROM dev_project2_db.user 
    WHERE  dev_project2_db.user.User_ID = USER_ID;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Admin_delete_Leave_Type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Admin_delete_Leave_Type`(
	IN TYPE_ID INT
)
BEGIN
    
	DELETE FROM dev_project2_db.leave_type 
    WHERE  dev_project2_db.leave_type.Type_ID = TYPE_ID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Admin_read_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Admin_read_employee`()
BEGIN

	SELECT dev_project2_db.user.*,dev_project2_db.manager.Title_Name
    FROM dev_project2_db.user LEFT JOIN dev_project2_db.manager
    ON dev_project2_db.user.User_ID = dev_project2_db.manager.User_ID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Admin_read_Leave_Type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Admin_read_Leave_Type`()
BEGIN

	SELECT * FROM dev_project2_db.leave_type;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Admin_read_single_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Admin_read_single_employee`(
	IN EMP_ID INT
)
BEGIN

	SELECT dev_project2_db.user.*,dev_project2_db.manager.Title_Name
    FROM dev_project2_db.user LEFT JOIN dev_project2_db.manager
    ON dev_project2_db.user.User_ID = dev_project2_db.manager.User_ID
    WHERE dev_project2_db.user.User_ID = EMP_ID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Admin_update_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Admin_update_employee`(
	IN USER_ID INT,
	IN UPDATE_USER_ATTR INT,
    IN UPDATE_TO VARCHAR(45)
)
BEGIN

	if UPDATE_USER_ATTR = 0
    then
		UPDATE dev_project2_db.user SET dev_project2_db.user.Department_ID = UPDATE_TO WHERE dev_project2_db.user.User_ID = USER_ID;
	elseif UPDATE_USER_ATTR = 1 
    then
		UPDATE dev_project2_db.user SET dev_project2_db.user.User_Name = UPDATE_TO WHERE dev_project2_db.user.User_ID = USER_ID;
	elseif UPDATE_USER_ATTR = 2
    then
		UPDATE dev_project2_db.user SET dev_project2_db.user.User_Password = UPDATE_TO WHERE dev_project2_db.user.User_ID = USER_ID;
	elseif UPDATE_USER_ATTR = 3
    then
		UPDATE dev_project2_db.user SET dev_project2_db.user.User_Email = UPDATE_TO WHERE dev_project2_db.user.User_ID = USER_ID;	
	elseif UPDATE_USER_ATTR = 4
    then
		if UPDATE_TO = '0'
        then
			UPDATE dev_project2_db.user SET dev_project2_db.user.User_Gender = 0 WHERE dev_project2_db.user.User_ID = USER_ID;	
		elseif UPDATE_TO = '1'
        then
			UPDATE dev_project2_db.user SET dev_project2_db.user.User_Gender = 1 WHERE dev_project2_db.user.User_ID = USER_ID;
		end if;
	elseif UPDATE_USER_ATTR = 5
    then
		UPDATE dev_project2_db.user SET dev_project2_db.user.User_Age = convert(UPDATE_TO, UNSIGNED) WHERE dev_project2_db.user.User_ID = USER_ID;	
	elseif UPDATE_USER_ATTR = 6
    then
		UPDATE dev_project2_db.user SET dev_project2_db.user.User_Job = UPDATE_TO WHERE dev_project2_db.user.User_ID = USER_ID;	
	elseif UPDATE_USER_ATTR = 7
    then
		UPDATE dev_project2_db.user SET dev_project2_db.user.User_DateEmployed = convert(UPDATE_TO, DATETIME) WHERE dev_project2_db.user.User_ID = USER_ID;	
	elseif UPDATE_USER_ATTR = 8
    then 
		UPDATE dev_project2_db.user SET dev_project2_db.user.User_Years_Employed = convert(UPDATE_TO, UNSIGNED) WHERE dev_project2_db.user.User_ID = USER_ID;	
	elseif UPDATE_USER_ATTR = 9
    then
		UPDATE dev_project2_db.user SET dev_project2_db.user.Balance_Vacation = convert(UPDATE_TO, UNSIGNED) WHERE dev_project2_db.user.User_ID = USER_ID;	
	elseif UPDATE_USER_ATTR = 10
    then
		UPDATE dev_project2_db.user SET dev_project2_db.user.Balance_Sick = convert(UPDATE_TO, UNSIGNED) WHERE dev_project2_db.user.User_ID = USER_ID;	
	elseif UPDATE_USER_ATTR = 11
    then
		UPDATE dev_project2_db.user SET dev_project2_db.user.Balance_Floating = convert(UPDATE_TO, UNSIGNED) WHERE dev_project2_db.user.User_ID = USER_ID;
	elseif UPDATE_USER_ATTR = 12
    then
		UPDATE dev_project2_db.manager SET dev_project2_db.manager.Title_Name = UPDATE_TO WHERE dev_project2_db.manager.User_ID = USER_ID;
	end if;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Admin_update_Leave_Type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Admin_update_Leave_Type`(
	IN TYPE_ID INT,
	IN UPDATE_TYPE_ATTR INT,
    IN UPDATE_TO VARCHAR(45)
)
BEGIN

	if UPDATE_TYPE_ATTR = 0
    then
		UPDATE dev_project2_db.leave_type SET dev_project2_db.leave_type.Type_Name = UPDATE_TO WHERE dev_project2_db.leave_type.Type_ID = TYPE_ID;
	elseif UPDATE_TYPE_ATTR = 1
    then
		UPDATE dev_project2_db.leave_type SET dev_project2_db.leave_type.Type_Description = convert(UPDATE_TO , char) WHERE dev_project2_db.leave_type.Type_ID = TYPE_ID;
	elseif UPDATE_TYPE_ATTR = 2
    then
		UPDATE dev_project2_db.leave_type SET dev_project2_db.leave_type.Type_Max_Days = convert(UPDATE_TO , UNSIGNED) WHERE dev_project2_db.leave_type.Type_ID = TYPE_ID;
	elseif UPDATE_TYPE_ATTR = 3
    then
		UPDATE dev_project2_db.leave_type SET dev_project2_db.leave_type.Accumulation_Rate_Anum = convert(UPDATE_TO , DECIMAL(5,3)) WHERE dev_project2_db.leave_type.Type_ID = TYPE_ID;
	end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Apply_Application` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Apply_Application`(
	IN USER_ID INT,
    IN TYPE_NAME VARCHAR(45),
    IN START_DATE DATETIME,
    IN END_DATE DATETIME,
    IN DAYS_LEAVE INT
)
BEGIN

	SET @type_id = (SELECT dev_project2_db.leave_type.Type_ID FROM dev_project2_db.leave_type WHERE dev_project2_db.leave_type.Type_Name = TYPE_NAME);

	INSERT INTO dev_project2_db.application(User_ID, Type_ID,App_CurrentDate,App_StartDate,App_EndDate,App_Days_Leave)
    VALUES (USER_ID,@type_id,NOW(),START_DATE,END_DATE,DAYS_LEAVE);
    
    INSERT INTO dev_project2_db.wait_list(App_id,WL_Days_Passed)
    VALUES (LAST_INSERT_ID(),0);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Approve_Reject_App` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Approve_Reject_App`(
	IN OUR_DEPARTMENT VARCHAR(45),
    IN OUR_RANK INT,
    IN APP_ID INT,
    IN isAPPROVED TINYINT,
    IN APPROVED_BY VARCHAR(45)
)
BEGIN
    
    UPDATE dev_project2_db.application, dev_project2_db.leave_type, dev_project2_db.wait_list, dev_project2_db.department, dev_project2_db.user SET dev_project2_db.application.App_Approved_By = APPROVED_BY 
    WHERE 
		dev_project2_db.application.App_id = APP_ID
        and
        dev_project2_db.application.App_id = dev_project2_db.wait_list.App_id
        and
        dev_project2_db.application.User_ID = dev_project2_db.user.User_ID
        and
        dev_project2_db.user.Department_ID = dev_project2_db.department.Department_ID
        and
        dev_project2_db.department.Department_Level > OUR_RANK
        and
        dev_project2_db.department.Department_Group = OUR_DEPARTMENT;
    
    if (isAPPROVED = 0)
    then
		UPDATE dev_project2_db.application, dev_project2_db.leave_type, dev_project2_db.wait_list, dev_project2_db.department, dev_project2_db.user SET dev_project2_db.application.App_Approval = "REJECTED" 
        WHERE 
			dev_project2_db.application.App_id = APP_ID
			and
			dev_project2_db.application.App_id = dev_project2_db.wait_list.App_id
			and
			dev_project2_db.application.User_ID = dev_project2_db.user.User_ID
			and
			dev_project2_db.user.Department_ID = dev_project2_db.department.Department_ID
			and
			dev_project2_db.department.Department_Level > OUR_RANK
			and
			dev_project2_db.department.Department_Group = OUR_DEPARTMENT;
	elseif (isAPPROVED = 1)
	then
		UPDATE dev_project2_db.application, dev_project2_db.leave_type, dev_project2_db.wait_list, dev_project2_db.department, dev_project2_db.user SET dev_project2_db.application.App_Approval = "APPROVED" 
        WHERE 
			dev_project2_db.application.App_id = APP_ID
            and
            dev_project2_db.application.App_id = dev_project2_db.wait_list.App_id
			and
			dev_project2_db.application.User_ID = dev_project2_db.user.User_ID
			and
			dev_project2_db.user.Department_ID = dev_project2_db.department.Department_ID
			and
			dev_project2_db.department.Department_Level > OUR_RANK
			and
			dev_project2_db.department.Department_Group = OUR_DEPARTMENT;
    end if;
    
    DELETE FROM dev_project2_db.wait_list WHERE dev_project2_db.wait_list.App_id = APP_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cancel_Application` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cancel_Application`(
	IN EMP_ID INT,
    IN APP_ID INT
)
BEGIN

	DELETE dev_project2_db.wait_list.*, dev_project2_db.application.* FROM dev_project2_db.wait_list, dev_project2_db.application
    WHERE dev_project2_db.application.App_id = dev_project2_db.wait_list.App_id
    and
    dev_project2_db.application.App_id = APP_ID
    and
    dev_project2_db.application.User_ID = EMP_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `View_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `View_balance`(
	IN USER_ID INT
)
BEGIN
	SELECT dev_project2_db.user.Balance_Floating, dev_project2_db.user.Balance_Sick, dev_project2_db.user.Balance_Vacation
    FROM dev_project2_db.user
    WHERE dev_project2_db.user.User_ID = USER_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `View_History` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `View_History`(
	IN EMP_ID INT
)
BEGIN

	SELECT 
		dev_project2_db.application.User_ID, 
		dev_project2_db.application.App_CurrentDate,
        dev_project2_db.application.App_StartDate,
        dev_project2_db.application.App_EndDate,
        dev_project2_db.application.App_Days_Leave,
        dev_project2_db.leave_type.Type_Name,
        dev_project2_db.application.App_Approval,
        dev_project2_db.application.App_Approved_By
	FROM 
		dev_project2_db.application ,dev_project2_db.leave_type
	WHERE
		dev_project2_db.application.User_ID = EMP_ID
        and
        dev_project2_db.leave_type.Type_ID = dev_project2_db.application.Type_ID
        and
        dev_project2_db.application.App_Approval != 'PENDING'
	GROUP BY
		dev_project2_db.application.App_Approval;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `View_pending_leaves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `View_pending_leaves`(
	IN OUR_DEPARTMENT VARCHAR(45),
    IN OUR_RANK INT
)
BEGIN

	SELECT 
		dev_project2_db.application.User_ID, 
		dev_project2_db.application.App_CurrentDate,
        dev_project2_db.application.App_StartDate,
        dev_project2_db.application.App_EndDate,
        dev_project2_db.application.App_Days_Leave,
        dev_project2_db.leave_type.Type_Name
	FROM
		dev_project2_db.application, dev_project2_db.leave_type, dev_project2_db.wait_list, dev_project2_db.department, dev_project2_db.user
	WHERE
		dev_project2_db.application.App_id = dev_project2_db.wait_list.App_id
        and
        dev_project2_db.application.User_ID = dev_project2_db.user.User_ID
        and
        dev_project2_db.user.Department_ID = dev_project2_db.department.Department_ID
        and
        dev_project2_db.department.Department_Level > OUR_RANK
        and
        dev_project2_db.department.Department_Group = OUR_DEPARTMENT
        and
        dev_project2_db.leave_type.Type_ID = dev_project2_db.application.Type_ID;
		
	
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

-- Dump completed on 2018-09-13 11:34:43
