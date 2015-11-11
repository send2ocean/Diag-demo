CREATE DATABASE  IF NOT EXISTS `zdf` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `zdf`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zdf
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `guids_index`
--

DROP TABLE IF EXISTS `guids_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guids_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='导诊索引';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guids_index`
--

LOCK TABLES `guids_index` WRITE;
/*!40000 ALTER TABLE `guids_index` DISABLE KEYS */;
INSERT INTO `guids_index` VALUES (1,'疲劳','有时候你会觉得身体不适，但很难说出怎么不适，比如说 疼。。。'),(2,'感觉不适','some content');
/*!40000 ALTER TABLE `guids_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guids_index_items`
--

DROP TABLE IF EXISTS `guids_index_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guids_index_items` (
  `index_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guids_index_items`
--

LOCK TABLES `guids_index_items` WRITE;
/*!40000 ALTER TABLE `guids_index_items` DISABLE KEYS */;
INSERT INTO `guids_index_items` VALUES (2,1);
/*!40000 ALTER TABLE `guids_index_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guids_items`
--

DROP TABLE IF EXISTS `guids_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guids_items` (
  `id` int(11) NOT NULL,
  `pre_text` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `bk` varchar(45) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导诊数据条目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guids_items`
--

LOCK TABLES `guids_items` WRITE;
/*!40000 ALTER TABLE `guids_items` DISABLE KEYS */;
INSERT INTO `guids_items` VALUES (1,'否','过去十周在没有减肥的情况下，你的体重减少了4千克或更多么？',NULL,NULL),(2,NULL,'你会无原因的紧张和担心么？',NULL,NULL),(3,'是','可能的原因 焦虑感觉的产生来自于某个特定问题或者压力和担心的积累，可以使你感到不适。请看第',NULL,2),(4,'是','可能的原因 无法解释的消瘦以及不适感，可能是某种未诊断疾病的征兆 请参考 体重减轻',NULL,2),(5,'否','你的体温大于38°吗？',NULL,NULL),(6,'是','可能的原因 感觉不适合发热的最常见原因是病毒感染 请参考 发热',NULL,2),(7,'否','大多数时间，你感到很累或体力不支吗？',NULL,NULL),(8,'是','可能的原因 缺乏是许多疾病的常见原因，这些疾病中的一些需要治疗。 请参考 疲劳',NULL,2),(9,'否','你会规律引用大于推荐量的酒精吗 ？',NULL,NULL),(10,'是','可能的原因 过量饮酒可以引起躯体和精神疾病 处理方法 减少你的酒精消耗量，使其在推荐的安全',NULL,NULL),(11,'否','你服用非处方药、处方药或者保健品吗？',NULL,NULL),(12,'是','可能的原因和处理方法 某些要的副作用可以引起患病的感觉，咨询你的医生，同时停止服用任何非处',NULL,NULL),(13,'否','如果你还不能做出诊断，建议就诊。',NULL,NULL);
/*!40000 ALTER TABLE `guids_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guids_items_rel`
--

DROP TABLE IF EXISTS `guids_items_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guids_items_rel` (
  `id` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='导诊条目关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guids_items_rel`
--

LOCK TABLES `guids_items_rel` WRITE;
/*!40000 ALTER TABLE `guids_items_rel` DISABLE KEYS */;
INSERT INTO `guids_items_rel` VALUES (1,2),(3,2),(12,11),(13,11),(4,1),(5,1),(6,5),(7,5),(8,7),(9,7),(10,9),(11,9);
/*!40000 ALTER TABLE `guids_items_rel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-11 16:14:56
