-- MySQL dump 10.11
--
-- Host: localhost    Database: hy365db
-- ------------------------------------------------------
-- Server version	5.0.77-community-nt

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
-- Table structure for table `adinfo`
--

DROP TABLE IF EXISTS `adinfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `adinfo` (
  `ADNO` varchar(255) NOT NULL,
  `RESOURCENAME` varchar(255) default NULL,
  `AREANO` varchar(255) default NULL,
  `ADINFO` varchar(255) default NULL,
  `ADLINK` varchar(255) default NULL,
  `ADINFO1` varchar(255) default NULL,
  `ADLINK1` varchar(255) default NULL,
  `ADINFO2` varchar(255) default NULL,
  `ADLINK2` varchar(255) default NULL,
  `ADINFO3` varchar(255) default NULL,
  `ADLINK3` varchar(255) default NULL,
  `ADINFO4` varchar(255) default NULL,
  `ADLINK4` varchar(255) default NULL,
  `ADINFO5` varchar(255) default NULL,
  `ADLINK5` varchar(255) default NULL,
  `RESOURCEID` varchar(255) default NULL,
  `AREANAME` varchar(255) default NULL,
  PRIMARY KEY  (`ADNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `adinfo`
--

LOCK TABLES `adinfo` WRITE;
/*!40000 ALTER TABLE `adinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `adinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hyuser`
--

DROP TABLE IF EXISTS `hyuser`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `hyuser` (
  `usercode` varchar(255) NOT NULL,
  `password` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  PRIMARY KEY  (`usercode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `hyuser`
--

LOCK TABLES `hyuser` WRITE;
/*!40000 ALTER TABLE `hyuser` DISABLE KEYS */;
INSERT INTO `hyuser` VALUES ('0000000000','root','root','123');
/*!40000 ALTER TABLE `hyuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jioninfo`
--

DROP TABLE IF EXISTS `jioninfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `jioninfo` (
  `INFONO` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) default NULL,
  `MESSAGE` varchar(255) default NULL,
  `USERNAME` varchar(255) default NULL,
  `PHONENO` varchar(255) default NULL,
  `CREATEDATE` date default NULL,
  `POSTCODE` varchar(255) default NULL,
  `EMAIL` varchar(255) default NULL,
  PRIMARY KEY  (`INFONO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `jioninfo`
--

LOCK TABLES `jioninfo` WRITE;
/*!40000 ALTER TABLE `jioninfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `jioninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learningcard`
--

DROP TABLE IF EXISTS `learningcard`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `learningcard` (
  `CARDCODE` varchar(255) NOT NULL,
  `CARDTYPECODE` varchar(255) default NULL,
  `PASSWORD` varchar(255) default NULL,
  `PHONENO` varchar(255) default NULL,
  `CREATEDATE` date default NULL,
  `STARTDATE` date default NULL,
  `ENDDATE` date default NULL,
  PRIMARY KEY  (`CARDCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `learningcard`
--

LOCK TABLES `learningcard` WRITE;
/*!40000 ALTER TABLE `learningcard` DISABLE KEYS */;
INSERT INTO `learningcard` VALUES ('000000001','1','000000001',NULL,'2014-06-10',NULL,NULL);
/*!40000 ALTER TABLE `learningcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learningcardtype`
--

DROP TABLE IF EXISTS `learningcardtype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `learningcardtype` (
  `CARDTYPECODE` varchar(255) NOT NULL,
  `CARDTYPENAME` varchar(255) default NULL,
  `CARDDENO` decimal(19,2) default NULL,
  `CREATEDATE` date default NULL,
  `DEFALUTTIME` bigint(20) default NULL,
  PRIMARY KEY  (`CARDTYPECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `learningcardtype`
--

LOCK TABLES `learningcardtype` WRITE;
/*!40000 ALTER TABLE `learningcardtype` DISABLE KEYS */;
INSERT INTO `learningcardtype` VALUES ('1','vip','50.00',NULL,365);
/*!40000 ALTER TABLE `learningcardtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nocode`
--

DROP TABLE IF EXISTS `nocode`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `nocode` (
  `TABLENAME` varchar(255) NOT NULL,
  `MAXNO` bigint(20) default NULL,
  PRIMARY KEY  (`TABLENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `nocode`
--

LOCK TABLES `nocode` WRITE;
/*!40000 ALTER TABLE `nocode` DISABLE KEYS */;
INSERT INTO `nocode` VALUES ('typelevel1',2),('typelevel2',2);
/*!40000 ALTER TABLE `nocode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `resource` (
  `RESNO` int(11) NOT NULL,
  `RESOURCENAME` varchar(255) default NULL,
  `TYPEID` varchar(255) default NULL,
  `TYPECNAME` varchar(255) default NULL,
  `RESOURCEADDRESS` varchar(255) default NULL,
  `CREATEDATE` date default NULL,
  `CLICKTIMES` bigint(20) default NULL,
  `RESOURCEINFO` varchar(255) default NULL,
  `RESOURCEFILE` varchar(255) default NULL,
  PRIMARY KEY  (`RESNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (101,'1.swf','36911','语文小学','/1.swf.swf','2014-06-10',0,'1.swf','.swf');
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcetype`
--

DROP TABLE IF EXISTS `resourcetype`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `resourcetype` (
  `TYPEID` varchar(255) NOT NULL,
  `SYSTEMCODE` varchar(255) default NULL,
  `TYPELEVEL` int(11) default NULL,
  `UPPERTYPEID` varchar(255) default NULL,
  `TYPECNAME` varchar(255) default NULL,
  `TASKCODE` varchar(255) default NULL,
  `VALIDSTATUS` varchar(255) default NULL,
  `DISPLAYNO` int(11) default NULL,
  PRIMARY KEY  (`TYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `resourcetype`
--

LOCK TABLES `resourcetype` WRITE;
/*!40000 ALTER TABLE `resourcetype` DISABLE KEYS */;
INSERT INTO `resourcetype` VALUES ('3690','hy369',1,'1','数学',NULL,'1',0),('36900','hy369',2,'3690','数学1',NULL,'1',0),('3691','hy369',1,'1','语文',NULL,'1',0),('36911','hy369',2,'3691','语文小学',NULL,'1',0);
/*!40000 ALTER TABLE `resourcetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saa_businessline`
--

DROP TABLE IF EXISTS `saa_businessline`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `saa_businessline` (
  `BusinessLineCode` varchar(255) NOT NULL,
  `BusinessLineName` varchar(255) default NULL,
  `ValidStatus` varchar(255) default NULL,
  PRIMARY KEY  (`BusinessLineCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `saa_businessline`
--

LOCK TABLES `saa_businessline` WRITE;
/*!40000 ALTER TABLE `saa_businessline` DISABLE KEYS */;
/*!40000 ALTER TABLE `saa_businessline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saa_class`
--

DROP TABLE IF EXISTS `saa_class`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `saa_class` (
  `ClassCode` varchar(255) NOT NULL,
  `ClassName` varchar(255) default NULL,
  `BusinessLineCode` varchar(255) default NULL,
  `ValidStatus` varchar(255) default NULL,
  PRIMARY KEY  (`ClassCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `saa_class`
--

LOCK TABLES `saa_class` WRITE;
/*!40000 ALTER TABLE `saa_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `saa_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saa_company`
--

DROP TABLE IF EXISTS `saa_company`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `saa_company` (
  `comcode` varchar(255) NOT NULL,
  `validstatus` varchar(255) default NULL,
  `ComCName` varchar(255) default NULL,
  `uppercomcode` varchar(255) default NULL,
  `agentinsflag` varchar(255) default NULL,
  `agentinscom` varchar(255) default NULL,
  `BelongComCode` varchar(255) default NULL,
  `ComLevel` varchar(255) default NULL,
  `hrCompanyID` varchar(255) default NULL,
  PRIMARY KEY  (`comcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `saa_company`
--

LOCK TABLES `saa_company` WRITE;
/*!40000 ALTER TABLE `saa_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `saa_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saa_risk`
--

DROP TABLE IF EXISTS `saa_risk`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `saa_risk` (
  `riskcode` varchar(255) NOT NULL,
  `BusinessLineCode` varchar(255) default NULL,
  `CLASSCODE` varchar(255) default NULL,
  `RISKCNAME` varchar(255) default NULL,
  `VALIDSTATUS` varchar(255) default NULL,
  PRIMARY KEY  (`riskcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `saa_risk`
--

LOCK TABLES `saa_risk` WRITE;
/*!40000 ALTER TABLE `saa_risk` DISABLE KEYS */;
/*!40000 ALTER TABLE `saa_risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smc_menu`
--

DROP TABLE IF EXISTS `smc_menu`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `smc_menu` (
  `Id` int(11) NOT NULL auto_increment,
  `Target` varchar(255) default NULL,
  `SystemCode` varchar(255) default NULL,
  `MenuLevel` int(11) unsigned zerofill default NULL,
  `MenuCName` varchar(255) default NULL,
  `TaskCode` varchar(255) default NULL,
  `PermitRiskClass` varchar(255) default NULL,
  `ExceptRiskCode` varchar(255) default NULL,
  `ExceptRiskClass` varchar(255) default NULL,
  `PermitRiskCode` varchar(255) default NULL,
  `ActionURL` varchar(255) default NULL,
  `UpperId` int(11) default NULL,
  `Image` varchar(255) default NULL,
  `MenuEName` varchar(255) default NULL,
  `DisplayNo` float default NULL,
  `ValidInd` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `smc_menu`
--

LOCK TABLES `smc_menu` WRITE;
/*!40000 ALTER TABLE `smc_menu` DISABLE KEYS */;
INSERT INTO `smc_menu` VALUES (1,'page','content',00000000001,'系统管理','1','1','1','1','1',NULL,0,NULL,'1',1,'1'),(2,'page','content',00000000001,'资源管理','1','1','1','1','1',NULL,0,NULL,'1',2,'1'),(3,'page','content',00000000001,'学习卡管理','1','1','1','1','1',NULL,0,NULL,'1',3,'1'),(11,'page','content',00000000002,'留言管理','1','1','1','1','1','/content/jionInfo/prepareQueryJionInfo.do',1,NULL,'1',12,'1'),(12,'page','content',00000000002,'用户管理','1','1','1','1','1','/content/saaUser/prepareQueryUser.do',1,NULL,'1',11,'1'),(13,'page','content',00000000002,'数据库备份','1','1','1','1','1','/content/common/prepareBackUp.do',1,NULL,'1',13,'1'),(21,'page','content',00000000002,'广告管理','1','1','1','1','1','/content/adInfo/prepareQueryAdInfo.do',2,NULL,'1',21,'1'),(22,'page','content',00000000002,'资源类型管理','1','1','1','1','1','/content/resourceType/prepareQueryResourceType.do',2,NULL,'1',22,'1'),(23,'page','content',00000000002,'资源管理','1','1','1','1','1','/content/resource/prepareQueryResource.do',2,NULL,'1',23,'1'),(24,'page','content',00000000002,'资源查询','1','1','1','1','1','/content/resource/prepareQueryResourceReal.do',2,NULL,'1',24,'1'),(31,'page','content',00000000002,'学习卡管理','1','1','1','1','1','/content/card/prepareQueryCard.do',3,NULL,'1',31,'1'),(32,'page','content',00000000002,'学习卡类型管理','1','1','1','1','1','/content/cardType/prepareQueryCardType.do',3,NULL,'1',32,'1');
/*!40000 ALTER TABLE `smc_menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-10  6:59:40
