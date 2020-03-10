-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 35.233.100.111    Database: LuftGrid
-- ------------------------------------------------------
-- Server version	5.7.14-google-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='f28d8e8a-e766-11e8-b7d2-42010a840fd8:1-4308101';

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `Chat_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Chat_Message` varchar(225) NOT NULL,
  `Chat_Time` time NOT NULL,
  `Chat_Date` date NOT NULL,
  PRIMARY KEY (`Chat_ID`,`User_ID`),
  KEY `FK_UserInChat_idx` (`User_ID`),
  CONSTRAINT `FK_UserInChat` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (6,10027,'Hello!','17:49:51','2018-12-03'),(7,10029,'HI!!','21:51:42','2018-12-03'),(8,10027,'HELLO !!','07:20:33','2018-12-04');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commit`
--

DROP TABLE IF EXISTS `commit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commit` (
  `Comm_ID` int(11) NOT NULL AUTO_INCREMENT,
  `File_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `Version_ID` int(11) NOT NULL,
  `Comm_Time` datetime NOT NULL,
  PRIMARY KEY (`Comm_ID`,`File_ID`,`Member_ID`,`Version_ID`),
  KEY `FK_FileInCommit_idx` (`File_ID`),
  KEY `FK_MemberInCommit_idx` (`Member_ID`),
  KEY `FK_VersionInCommit_idx` (`Version_ID`),
  CONSTRAINT `FK_FileInCommit` FOREIGN KEY (`File_ID`) REFERENCES `file` (`File_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MemberInCommit` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_VersionInCommit` FOREIGN KEY (`Version_ID`) REFERENCES `version` (`Version_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commit`
--

LOCK TABLES `commit` WRITE;
/*!40000 ALTER TABLE `commit` DISABLE KEYS */;
INSERT INTO `commit` VALUES (31,51,33,31,'2018-12-03 17:49:03'),(32,52,33,32,'2018-12-03 21:30:24'),(33,53,33,33,'2018-12-03 21:30:59'),(34,54,33,34,'2018-12-03 21:31:16'),(35,53,33,35,'2018-12-03 21:32:25'),(36,55,52,36,'2018-12-04 07:42:41');
/*!40000 ALTER TABLE `commit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `File_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Repo_ID` int(11) NOT NULL,
  `File_Dir` varchar(225) NOT NULL,
  `First_Upload_dt` datetime NOT NULL,
  `Last_Modified_dt` datetime NOT NULL,
  `Current_Size` varchar(45) NOT NULL,
  PRIMARY KEY (`File_ID`,`Repo_ID`),
  KEY `FK_RepoInFile_idx` (`Repo_ID`),
  CONSTRAINT `FK_RepoInFile` FOREIGN KEY (`Repo_ID`) REFERENCES `reposetories` (`Repo_ID`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (51,25,'repositories/FirstRepo/ITRW324_schedule_2018.JPG','2018-12-03 17:49:03','2018-12-03 17:49:03','238585 KB'),(52,25,'repositories/FirstRepo/bitnami.css','2018-12-03 21:30:24','2018-12-03 21:30:24','177 KB'),(53,25,'repositories/FirstRepo/test.txt','2018-12-03 21:30:59','2018-12-03 21:32:25','9382 KB'),(54,25,'repositories/FirstRepo/design1.png','2018-12-03 21:31:16','2018-12-03 21:31:16','1440417 KB'),(55,39,'repositories/REPO/Autorun.inf','2018-12-04 07:42:41','2018-12-04 07:42:41','38 KB');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `Member_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Repo_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Invite_Status` varchar(45) NOT NULL,
  PRIMARY KEY (`Member_ID`,`Repo_ID`,`User_ID`),
  KEY `FK2` (`User_ID`),
  KEY `FK_RepoInMember_idx` (`Repo_ID`),
  CONSTRAINT `FK_RepoInMember` FOREIGN KEY (`Repo_ID`) REFERENCES `reposetories` (`Repo_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserInMember` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (33,25,10027,'ACCEPTED'),(34,26,10028,'ACCEPTED'),(35,27,10029,'ACCEPTED'),(36,28,10027,'ACCEPTED'),(37,25,10029,'ACCEPTED'),(38,28,10029,'PENDING'),(39,29,10027,'ACCEPTED'),(40,29,10029,'PENDING'),(41,30,10027,'ACCEPTED'),(42,31,10027,'ACCEPTED'),(43,32,10027,'ACCEPTED'),(44,33,10027,'ACCEPTED'),(45,34,10027,'ACCEPTED'),(46,35,10027,'ACCEPTED'),(47,36,10029,'ACCEPTED'),(48,37,10027,'ACCEPTED'),(49,38,10027,'ACCEPTED'),(50,38,10029,'PENDING'),(51,39,10027,'ACCEPTED'),(52,39,10029,'ACCEPTED');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reposetories`
--

DROP TABLE IF EXISTS `reposetories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reposetories` (
  `Repo_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Repo_name` varchar(45) NOT NULL,
  `isPrivate` tinyint(4) NOT NULL,
  PRIMARY KEY (`Repo_ID`,`User_ID`),
  KEY `FK1` (`User_ID`),
  CONSTRAINT `FK_UserInRepo` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reposetories`
--

LOCK TABLES `reposetories` WRITE;
/*!40000 ALTER TABLE `reposetories` DISABLE KEYS */;
INSERT INTO `reposetories` VALUES (25,10027,'FirstRepo',0),(26,10028,'First',0),(27,10029,'abc',0),(28,10027,'Second_Repo',1),(29,10027,'third',1),(30,10027,'4ft',1),(31,10027,'test',1),(32,10027,'teser',1),(33,10027,'er',0),(34,10027,'etet',0),(35,10027,'nwr',1),(36,10029,'nnn',1),(37,10027,'rrr',1),(38,10027,'gg',1),(39,10027,'REPO',1);
/*!40000 ALTER TABLE `reposetories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Usertag` varchar(45) NOT NULL,
  `User_Email` varchar(45) NOT NULL,
  `User_Password` varchar(45) NOT NULL,
  `User_Current_Date` datetime NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10031 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10027,'JACO#10027','jaco@gmail.com','b4af804009cb036a4ccdc33431ef9ac9','2018-12-03 17:48:04'),(10028,'JACO#10028','jaco@gmial.com','b4af804009cb036a4ccdc33431ef9ac9','2018-12-03 17:59:17'),(10029,'JOHN#10029','john@gmail.com','b4af804009cb036a4ccdc33431ef9ac9','2018-12-03 21:26:10'),(10030,'ABC#10030','abc@gmail.com','e99a18c428cb38d5f260853678922e03','2018-12-04 07:15:33');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `Version_ID` int(11) NOT NULL AUTO_INCREMENT,
  `File_ID` int(11) NOT NULL,
  `Version_Dir` varchar(225) NOT NULL,
  `Version_Date` datetime NOT NULL,
  `Version_Size` varchar(45) NOT NULL,
  PRIMARY KEY (`Version_ID`,`File_ID`),
  KEY `FK_FileInVersion_idx` (`File_ID`),
  CONSTRAINT `FK_FileInVersion` FOREIGN KEY (`File_ID`) REFERENCES `file` (`File_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (31,51,'versions/FirstRepo/ITRW324_schedule_2018.JPG.luft31','2018-12-03 17:49:03','238585 KB'),(32,52,'versions/FirstRepo/bitnami.css.luft32','2018-12-03 21:30:24','177 KB'),(33,53,'versions/FirstRepo/test.txt.luft33','2018-12-03 21:30:59','1 KB'),(34,54,'versions/FirstRepo/design1.png.luft34','2018-12-03 21:31:16','1440417 KB'),(35,53,'versions/FirstRepo/test.txt.luft35','2018-12-03 21:32:25','9382 KB'),(36,55,'versions/REPO/Autorun.inf.luft36','2018-12-04 07:42:41','38 KB');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'LuftGrid'
--

--
-- Dumping routines for database 'LuftGrid'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_chat_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `create_chat_message`(
	IN USER_ID INT,
    IN MESSAGE VARCHAR(225)
)
BEGIN

	INSERT INTO LuftGrid.chat(LuftGrid.chat.User_ID,LuftGrid.chat.Chat_Message,LuftGrid.chat.Chat_Time,LuftGrid.chat.Chat_Date)
    VALUES (USER_ID,MESSAGE,NOW(),CURDATE());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_commit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `create_commit`(
	IN FILE_ID INT,
    IN UPLOADED_BY INT,
    IN VERSION_ID INT,
    IN FILE_SIZE VARCHAR(45),
    IN C_TIME DATETIME
)
BEGIN
    
	INSERT INTO LuftGrid.commit(File_ID,Member_ID,Version_ID,Comm_Time)
    VALUES (FILE_ID, UPLOADED_BY, VERSION_ID, C_TIME);
    
    UPDATE LuftGrid.file SET LuftGrid.file.Last_Modified_dt = C_TIME WHERE LuftGrid.file.File_ID = FILE_ID;
    
    UPDATE LuftGrid.file SET LuftGrid.file.Current_Size = FILE_SIZE WHERE LuftGrid.file.File_ID = FILE_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_file` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `create_file`(
	IN REPO_ID INT,
    IN UPLOADED_BY INT,
    IN DIR VARCHAR(225),
    IN VERSION_DIR VARCHAR(225),
    IN SIZE VARCHAR(45)
)
BEGIN

	SET @file_id = (SELECT LuftGrid.file.File_ID FROM LuftGrid.file WHERE LuftGrid.file.Repo_ID = REPO_ID and LuftGrid.file.File_Dir = DIR);
    
    SET @Member_ID = (SELECT LuftGrid.member.Member_ID FROM LuftGrid.member WHERE LuftGrid.member.User_ID = UPLOADED_BY and LuftGrid.member.Repo_ID = REPO_ID);
        
	SET @cDate = CURRENT_TIMESTAMP();
	
		if (@file_id IS NULL)
		then
			
			INSERT INTO LuftGrid.file(Repo_ID,File_Dir,First_Upload_dt,Last_Modified_dt,Current_Size)
			VALUES (REPO_ID, DIR, @cDate, @cDate, SIZE);
			
			SET @file_id = last_insert_id();
		  
		end if;  
        
	CALL create_version(@file_id, VERSION_DIR, @cDate, SIZE);

	CALL create_commit(@file_id, @Member_ID, last_insert_id(), SIZE, @cDate);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_member_invite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `create_member_invite`(
	IN REPO_ID INT,
    IN USER_ID INT
)
BEGIN

	SET @isPri = "PENDING";
	SET @isPrivate = (SELECT LuftGrid.reposetories.isPrivate FROM LuftGrid.reposetories WHERE LuftGrid.reposetories.Repo_ID = REPO_ID);
		
	if (@isPrivate = 0)
    then
		SET @isPri = "ACCEPTED";
    end if;

	SET @CHECKMEMBER = (SELECT LuftGrid.member.Member_ID FROM LuftGrid.member WHERE LuftGrid.member.User_ID = USER_ID and LuftGrid.member.Repo_ID = REPO_ID);
    
    if (@CHECKMEMBER IS NULL)
    then
		INSERT INTO LuftGrid.member(Repo_ID,User_ID,Invite_Status)
		VALUES (REPO_ID,USER_ID,@isPri);
	
		SELECT last_insert_id() AS message;
	else
		SELECT "ERROR" AS message; 
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_repo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `create_repo`(
	IN USER_ID INT,
    IN REPO_NAME VARCHAR(45),
    IN ISPRIVATE INT
)
BEGIN

	SET @checkName = (SELECT LuftGrid.reposetories.Repo_ID FROM LuftGrid.reposetories WHERE LuftGrid.reposetories.Repo_name = REPO_NAME);
    
    if (@checkName IS NULL)
    then
		INSERT INTO LuftGrid.reposetories(User_ID,Repo_name,isPrivate)
		VALUES (USER_ID,REPO_NAME,ISPRIVATE);
		
		INSERT INTO LuftGrid.member(Repo_ID,User_ID,Invite_Status)
		VALUES (last_insert_id(),USER_ID,"ACCEPTED");
	else
		SELECT "ERROR" as message;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `create_user`(
	IN USERNAME VARCHAR(45),
    IN EMAIL VARCHAR(45),
    IN U_PASSWORD VARCHAR(45)
)
BEGIN
	
    SET @CHECKEMAIL = (SELECT LuftGrid.user.User_Email
						FROM LuftGrid.user
                        WHERE LuftGrid.user.User_Email = EMAIL);
    
    if (@CHECKEMAIL IS NULL)
    then
		SET @ID = (SELECT AUTO_INCREMENT
					FROM information_schema.TABLES
					WHERE TABLE_SCHEMA = "LuftGrid"
					AND TABLE_NAME = "user");
		
		SET @tag = CONCAT(UPPER(USERNAME), "#", @ID);
		
		INSERT INTO LuftGrid.user(Usertag,User_Email,User_Password,User_Current_Date)
		VALUES (@tag,EMAIL,U_PASSWORD,CURRENT_TIMESTAMP());
        SELECT @ID as message;
    else
		SELECT "ERROR" as message;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_version` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `create_version`(
	IN FILE_ID INT,
    IN VERSION_DIR VARCHAR(225),
    IN TIME_COMMITED DATETIME,
    IN SIZE VARCHAR(45)
)
BEGIN

	SET @ID = (SELECT AUTO_INCREMENT
					FROM information_schema.TABLES
					WHERE TABLE_SCHEMA = "LuftGrid"
					AND TABLE_NAME = "version");

	SET @verDIR = CONCAT(VERSION_DIR,".luft",@ID);

	INSERT INTO LuftGrid.version(File_ID,Version_Dir,Version_Date,Version_Size)
    VALUES (FILE_ID, @verDIR, TIME_COMMITED,SIZE);

	SELECT @verDIR as id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_reject_invite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `delete_reject_invite`(
	IN MEMBER_ID INT
)
BEGIN

	DELETE FROM LuftGrid.member WHERE LuftGrid.member.Member_ID = MEMBER_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `delete_user`(
	IN USER_ID INT
)
BEGIN

	DELETE FROM LuftGrid.member WHERE LuftGrid.member.User_ID = USER_ID;
	DELETE FROM LuftGrid.chat WHERE LuftGrid.chat.User_ID = USER_ID;
	DELETE FROM LuftGrid.user WHERE LuftGrid.user.User_ID = USER_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Login_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Login_user`(
	IN EMAIL VARCHAR(45),
    IN U_PASSWORD VARCHAR(45)
)
BEGIN

	SET @user = (SELECT LuftGrid.user.User_ID FROM LuftGrid.user WHERE LuftGrid.user.User_Email = EMAIL and LuftGrid.user.User_Password = U_PASSWORD);
    
    if (@user IS NULL)
    then
		SELECT "ERROR" as Result;
    else
		SELECT @user as Result;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_repo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `search_repo`(
	IN REPO_NAME VARCHAR(45)
)
BEGIN

	SELECT LuftGrid.reposetories.Repo_ID FROM LuftGrid.reposetories WHERE LuftGrid.reposetories.Repo_name = REPO_NAME;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_accept_invite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_accept_invite`(
	IN MEMBER_ID INT
)
BEGIN

	UPDATE LuftGrid.member SET LuftGrid.member.Invite_Status = "ACCEPTED" WHERE LuftGrid.member.Member_ID = MEMBER_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_user_email`(
	IN USER_ID INT,
    IN EMAIL VARCHAR(45)
)
BEGIN

	SET @CHECKEMAIL = (SELECT LuftGrid.user.User_Email FROM LuftGrid.user WHERE LuftGrid.user.User_Email = EMAIL);

	if(@CHECKEMAIL IS NULL)
    then
		UPDATE LuftGrid.user SET LuftGrid.user.User_Email = EMAIL WHERE LuftGrid.user.User_ID = USER_ID;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_user_password`(
	IN USER_ID INT,
    IN U_PASSWORD VARCHAR(45)
)
BEGIN

	UPDATE LuftGrid.user SET LuftGrid.user.User_Password = U_PASSWORD WHERE LuftGrid.user.User_ID = USER_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_account_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `view_account_info`(
	IN USER_ID INT
)
BEGIN

	
        
	SELECT DISTINCT LuftGrid.reposetories.Repo_ID,LuftGrid.user.Usertag,LuftGrid.user.User_Email,LuftGrid.user.User_Password,LuftGrid.reposetories.Repo_name
    FROM LuftGrid.user,LuftGrid.reposetories,LuftGrid.member
    WHERE LuftGrid.user.User_ID = USER_ID
		and
			LuftGrid.reposetories.Repo_ID = LuftGrid.member.Repo_ID
		and
			(LuftGrid.member.User_ID = USER_ID and LuftGrid.member.Invite_Status = "ACCEPTED");

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_commits_per_repo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `view_commits_per_repo`(
	IN REPO_ID INT
)
BEGIN

	SELECT
		LuftGrid.file.File_ID, LuftGrid.file.File_Dir, LuftGrid.file.First_Upload_dt, LuftGrid.user.Usertag, LuftGrid.file.Last_Modified_dt, LuftGrid.file.Current_Size, LuftGrid.version.Version_Size, LuftGrid.version.Version_Dir, LuftGrid.version.Version_Date
	FROM 
		LuftGrid.file,LuftGrid.user,LuftGrid.member,LuftGrid.commit,LuftGrid.version
	WHERE
		LuftGrid.file.Repo_ID = REPO_ID
			and
		 LuftGrid.version.Version_ID = LuftGrid.commit.Version_ID
            and
		(LuftGrid.commit.Member_ID = LuftGrid.member.Member_ID and LuftGrid.member.User_ID = LuftGrid.user.User_ID and LuftGrid.commit.File_ID = LuftGrid.file.File_ID)
	ORDER BY
		LuftGrid.version.Version_Date ASC;
		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_group_chat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `view_group_chat`(
	IN REPO_ID INT
)
BEGIN

	SELECT DISTINCT
		LuftGrid.chat.Chat_Date,LuftGrid.chat.Chat_Time,LuftGrid.user.Usertag,LuftGrid.chat.Chat_Message 
	FROM
		LuftGrid.chat,LuftGrid.member,LuftGrid.user
	WHERE
		LuftGrid.chat.User_ID = LuftGrid.user.User_ID
			and
		LuftGrid.member.Repo_ID = REPO_ID
			and
		LuftGrid.member.User_ID = LuftGrid.user.User_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_pending_invites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `view_pending_invites`(
	IN REPO_ID INT
)
BEGIN

	SELECT 
		LuftGrid.member.Member_ID, LuftGrid.user.Usertag 
	FROM 
		LuftGrid.user, LuftGrid.member 
	WHERE 
		LuftGrid.member.Repo_ID = REPO_ID
			and
		LuftGrid.member.Invite_Status = "PENDING"
			and
		LuftGrid.user.User_ID = LuftGrid.member.User_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-02 23:03:01
