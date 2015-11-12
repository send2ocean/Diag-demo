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
INSERT INTO `guids_index` VALUES (1,'睡眠困难','有时候你会觉得身体不适，但很难说出怎么不适，比如说 疼。。。'),(2,'感觉不适','some content');
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
INSERT INTO `guids_index_items` VALUES (2,1),(1,14);
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
  `content` varchar(2000) DEFAULT NULL,
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
INSERT INTO `guids_items` VALUES (1,'否','过去十周在没有减肥的情况下，你的体重减少了4千克或更多么？',NULL,NULL),(2,NULL,'你会无原因的紧张和担心么？',NULL,NULL),(3,'是','可能的原因 焦虑感觉的产生来自于某个特定问题或者压力和担心的积累，可以使你感到不适。请看第',NULL,2),(4,'是','可能的原因 无法解释的消瘦以及不适感，可能是某种未诊断疾病的征兆 请参考 体重减轻',NULL,2),(5,'否','你的体温大于38°吗？',NULL,NULL),(6,'是','可能的原因 感觉不适合发热的最常见原因是病毒感染 请参考 发热',NULL,2),(7,'否','大多数时间，你感到很累或体力不支吗？',NULL,NULL),(8,'是','可能的原因 缺乏是许多疾病的常见原因，这些疾病中的一些需要治疗。 请参考 疲劳',NULL,2),(9,'否','你会规律引用大于推荐量的酒精吗 ？',NULL,NULL),(10,'是','可能的原因 过量饮酒可以引起躯体和精神疾病 处理方法 减少你的酒精消耗量，使其在推荐的安全',NULL,NULL),(11,'否','你服用非处方药、处方药或者保健品吗？',NULL,NULL),(12,'是','可能的原因和处理方法 某些要的副作用可以引起患病的感觉，咨询你的医生，同时停止服用任何非处',NULL,NULL),(13,'否','如果你还不能做出诊断，建议就诊。',NULL,NULL),(14,NULL,'你担心白天的事件会影响你的入睡吗？',NULL,NULL),(15,'是','可能的原因 白天的压力和焦虑是你难以充分放松二导致入睡困难，请参考焦虑症',NULL,NULL),(16,'否','你会无明显诱因地在夜间或早上醒后，而难以再次入睡吗？',NULL,NULL),(17,'是','你有下列症状之一吗？注意力难以集中，频繁的消极想法，情绪低落，性欲丧失。',NULL,NULL),(18,'否','你是否由于呼吸急促而睡不着？',NULL,NULL),(19,'是','可能的原因 伴随这些症状之一的睡眠中断预示你可能抑郁了。 请参考 抑郁症',NULL,NULL),(20,'否','晚上当你睡眠困难时，你会过量饮酒么？',NULL,NULL),(21,'是','可能的原因 虽然过量饮酒在最初会有助于入睡，但是它会使你在夜间醒后重新入睡困难。 处理方法 减少酒精摄入。如果你在减少酒精摄入上有困难或者你睡眠障碍持续存在，请咨询医生。',NULL,NULL),(22,'是','可能的原因 夜间突发呼吸急促可能是哮喘或者一种心脏或肺疾病。 请参考 气短',NULL,NULL),(23,'否','你最近是否停用安眠药了？',NULL,NULL),(24,'是','可能的原因 安眠药可以扰乱你的睡眠模式。在你停用安眠药之后需要几周或者几个月的时间来重建你的睡眠模式。处理方法，当你的睡眠模式回归正常时要有耐心，不要让医生给你开过多的安眠药。同时，逐步改善你的睡眠（请看：拥有好的夜间睡眠）。如果一个月后你仍睡眠困难，请咨询医生。',NULL,NULL),(25,'否','在晚上，当你睡眠困难时，你是否比平常喝了过多的茶、咖啡或者可乐？',NULL,NULL),(26,'是','可能的原因，咖啡、茶、可乐和其他饮料含有咖啡因,可以刺激你的中枢神经系统，使你感到清醒。这可能使你睡眠困难。处理方法，下午或晚上避免喝此类饮料。如果你仍睡眠困难，请杜绝喝含咖啡因的饮料。',NULL,NULL),(27,'否','在晚上，当你睡眠困难时，你晚饭吃得是否较晚或者较多？',NULL,NULL),(28,'是','可能的原因,晚饭吃得过多或者过晚会造成入睡困难。处理方法晚饭吃得少一点或者早一点。',NULL,NULL),(29,'否','你怀孕了吗？',NULL,NULL),(30,'是','可能的原因和处理方法 你的睡眠问题可能和你的妊娠有关系。即使妊娠早期，你也应该晚上起来排空尿液。妊娠晚期，胎动会干扰你的睡眠，你的大肚子也会使你感到不舒服。对临产的焦虑也会引起睡眠问题。遵循妊娠期拥有好的睡眠中的资助措施。如果你任然不能睡觉，就起床阅读或工作。白天可以打一个小盹。关于孩子的出生有任何问题，可以与你的医生讨论',NULL,NULL),(31,'否','你使用处方药吗？',NULL,NULL),(32,'是','可能的原因和处理方法 一些药如β受体阻滞剂的副作用可以引起睡眠障碍。请咨询医生。同时，不要停用你的处方药。',NULL,NULL),(33,'否','你的工作是否需要久坐，白天你很少运动吗？',NULL,NULL),(34,'是','可能的原因 缺乏运动，尽管你精神上疲惫，但由于躯体不足够累，也难以入睡。处理方法 白天或晚上有规律地做一些运动。这可以使你的躯体干到劳累，有助于你放松。运动不仅使你拥有好的睡眠，而且能改善你的健康，提高你的幸福感。',NULL,NULL),(35,'否','你大于60岁吗？',NULL,NULL),(36,'是','可能的原因和处理方法 随着年龄增大，大多数人需要的睡眠时间减少；许多大于60岁的人一晚上只需要6小时的睡眠。由于这个原因你会发现早上你比以前醒得早，晚上以前你年轻时能睡着的时间段，现在入睡变得困难。利用你的业余时间，白天避免打盹。',NULL,NULL),(37,'否','如果你还不能做出诊断，建议就诊。',NULL,NULL);
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
INSERT INTO `guids_items_rel` VALUES (1,2),(3,2),(12,11),(13,11),(4,1),(5,1),(6,5),(7,5),(8,7),(9,7),(10,9),(11,9),(15,14),(16,14),(17,16),(18,16),(19,17),(20,17),(22,18),(23,18),(18,20),(21,20),(24,23),(25,23),(26,25),(27,25),(28,27),(29,27),(30,29),(31,29),(32,31),(33,31),(34,33),(35,33),(36,35),(37,35);
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

-- Dump completed on 2015-11-12 19:58:27
