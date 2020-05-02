-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: TrackingSystem
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `KumoGT_annual_review_doc`
--

DROP TABLE IF EXISTS `KumoGT_annual_review_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_annual_review_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `notes` varchar(511) NOT NULL,
  `deg_type` varchar(63) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  `year` smallint(6) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_annual_review_doc`
--

LOCK TABLES `KumoGT_annual_review_doc` WRITE;
/*!40000 ALTER TABLE `KumoGT_annual_review_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_annual_review_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_deg_plan_doc`
--

DROP TABLE IF EXISTS `KumoGT_deg_plan_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_deg_plan_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `notes` varchar(511) NOT NULL,
  `deg_type` varchar(63) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_deg_plan_doc`
--

LOCK TABLES `KumoGT_deg_plan_doc` WRITE;
/*!40000 ALTER TABLE `KumoGT_deg_plan_doc` DISABLE KEYS */;
INSERT INTO `KumoGT_deg_plan_doc` VALUES (1,'documents/HW10_UGuQmm6.pdf','2020-05-01 18:29:04.795002','','m_thesis','deg_plan'),(2,'documents/CSCE689FINAL_PROJECT.docx','2020-05-01 18:33:44.841689','good','m_thesis','P_extension_of_time_limits'),(3,'documents/hw10_HE7K3hw.txt','2020-05-01 18:38:32.540144','','m_thesis','mdd'),(4,'documents/exam2_Kv6yQsP.pdf','2020-05-01 18:39:12.744777','.ksjezfh.dkjfbngDHKSGJKBkvhj.akrghav.zdijsgfhauri.hkg','m_thesis','P_course_change'),(5,'documents/HW10_rjWtLQ9.pdf','2020-05-01 19:48:41.050658','yfhkih','phd','deg_plan');
/*!40000 ALTER TABLE `KumoGT_deg_plan_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_degree`
--

DROP TABLE IF EXISTS `KumoGT_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_degree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deg_type` varchar(63) NOT NULL,
  `major` varchar(63) NOT NULL,
  `first_reg_year` smallint(6) NOT NULL,
  `first_reg_sem` varchar(31) NOT NULL,
  `last_reg_year` smallint(6) NOT NULL,
  `last_reg_sem` varchar(31) NOT NULL,
  `deg_recv_year` smallint(6) NOT NULL,
  `deg_recv_sem` varchar(31) NOT NULL,
  `note` longtext NOT NULL,
  `stu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `KumoGT_degree_stu_id_4a345a25_fk_KumoGT_student_id` (`stu_id`),
  CONSTRAINT `KumoGT_degree_stu_id_4a345a25_fk_KumoGT_student_id` FOREIGN KEY (`stu_id`) REFERENCES `KumoGT_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_degree`
--

LOCK TABLES `KumoGT_degree` WRITE;
/*!40000 ALTER TABLE `KumoGT_degree` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_fin_exam_doc`
--

DROP TABLE IF EXISTS `KumoGT_fin_exam_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_fin_exam_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `notes` varchar(511) NOT NULL,
  `deg_type` varchar(63) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_fin_exam_doc`
--

LOCK TABLES `KumoGT_fin_exam_doc` WRITE;
/*!40000 ALTER TABLE `KumoGT_fin_exam_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_fin_exam_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_fin_exam_info`
--

DROP TABLE IF EXISTS `KumoGT_fin_exam_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_fin_exam_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `result` varchar(15) NOT NULL,
  `title` varchar(255) NOT NULL,
  `room` varchar(255) NOT NULL,
  `abstract` varchar(1023) NOT NULL,
  `degree_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `degree_id` (`degree_id`),
  CONSTRAINT `KumoGT_fin_exam_info_degree_id_02bcfa26_fk_KumoGT_degree_id` FOREIGN KEY (`degree_id`) REFERENCES `KumoGT_degree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_fin_exam_info`
--

LOCK TABLES `KumoGT_fin_exam_info` WRITE;
/*!40000 ALTER TABLE `KumoGT_fin_exam_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_fin_exam_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_other_doc`
--

DROP TABLE IF EXISTS `KumoGT_other_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_other_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `notes` varchar(511) NOT NULL,
  `deg_type` varchar(63) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_other_doc`
--

LOCK TABLES `KumoGT_other_doc` WRITE;
/*!40000 ALTER TABLE `KumoGT_other_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_other_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_pre_exam_doc`
--

DROP TABLE IF EXISTS `KumoGT_pre_exam_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_pre_exam_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `notes` varchar(511) NOT NULL,
  `deg_type` varchar(63) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_pre_exam_doc`
--

LOCK TABLES `KumoGT_pre_exam_doc` WRITE;
/*!40000 ALTER TABLE `KumoGT_pre_exam_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_pre_exam_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_pre_exam_info`
--

DROP TABLE IF EXISTS `KumoGT_pre_exam_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_pre_exam_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `result` varchar(15) NOT NULL,
  `degree_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `degree_id` (`degree_id`),
  CONSTRAINT `KumoGT_pre_exam_info_degree_id_769156ea_fk_KumoGT_degree_id` FOREIGN KEY (`degree_id`) REFERENCES `KumoGT_degree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_pre_exam_info`
--

LOCK TABLES `KumoGT_pre_exam_info` WRITE;
/*!40000 ALTER TABLE `KumoGT_pre_exam_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_pre_exam_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_qual_exam_doc`
--

DROP TABLE IF EXISTS `KumoGT_qual_exam_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_qual_exam_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `notes` varchar(511) NOT NULL,
  `deg_type` varchar(63) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  `year` smallint(6) NOT NULL,
  `sem` varchar(31) NOT NULL,
  `result` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_qual_exam_doc`
--

LOCK TABLES `KumoGT_qual_exam_doc` WRITE;
/*!40000 ALTER TABLE `KumoGT_qual_exam_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_qual_exam_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_session_note`
--

DROP TABLE IF EXISTS `KumoGT_session_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_session_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `note` varchar(4096) NOT NULL,
  `stu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `KumoGT_session_note_stu_id_5f9ecf28_fk_KumoGT_student_id` (`stu_id`),
  CONSTRAINT `KumoGT_session_note_stu_id_5f9ecf28_fk_KumoGT_student_id` FOREIGN KEY (`stu_id`) REFERENCES `KumoGT_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_session_note`
--

LOCK TABLES `KumoGT_session_note` WRITE;
/*!40000 ALTER TABLE `KumoGT_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_session_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_student`
--

DROP TABLE IF EXISTS `KumoGT_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uin` varchar(63) NOT NULL,
  `first_name` varchar(127) NOT NULL,
  `middle_name` varchar(127) NOT NULL,
  `last_name` varchar(127) NOT NULL,
  `email` varchar(254) NOT NULL,
  `gender` varchar(63) NOT NULL,
  `ethnicity` varchar(63) NOT NULL,
  `us_residency` varchar(63) NOT NULL,
  `texas_residency` varchar(63) NOT NULL,
  `citizenship` varchar(127) NOT NULL,
  `status` varchar(63) NOT NULL,
  `start_year` smallint(6) NOT NULL,
  `start_sem` varchar(31) NOT NULL,
  `advisor` varchar(511) NOT NULL,
  `upe` varchar(15) NOT NULL,
  `ace` varchar(15) NOT NULL,
  `iga` varchar(15) NOT NULL,
  `propos_date` varchar(30) DEFAULT NULL,
  `cur_degree_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uin` (`uin`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cur_degree_id` (`cur_degree_id`),
  CONSTRAINT `KumoGT_student_cur_degree_id_cfd23fa4_fk_KumoGT_degree_id` FOREIGN KEY (`cur_degree_id`) REFERENCES `KumoGT_degree` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_student`
--

LOCK TABLES `KumoGT_student` WRITE;
/*!40000 ALTER TABLE `KumoGT_student` DISABLE KEYS */;
INSERT INTO `KumoGT_student` VALUES (1,'230004714','CHIH CHIN','','TSAI','o667621@gmail.com','male','white','usfr','k','AO','current',0,'fall','','no','no','no','20200623',NULL);
/*!40000 ALTER TABLE `KumoGT_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_t_d_doc`
--

DROP TABLE IF EXISTS `KumoGT_t_d_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_t_d_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `notes` varchar(511) NOT NULL,
  `deg_type` varchar(63) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_t_d_doc`
--

LOCK TABLES `KumoGT_t_d_doc` WRITE;
/*!40000 ALTER TABLE `KumoGT_t_d_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_t_d_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_t_d_info`
--

DROP TABLE IF EXISTS `KumoGT_t_d_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_t_d_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  `degree_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `degree_id` (`degree_id`),
  CONSTRAINT `KumoGT_t_d_info_degree_id_48f5e1bd_fk_KumoGT_degree_id` FOREIGN KEY (`degree_id`) REFERENCES `KumoGT_degree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_t_d_info`
--

LOCK TABLES `KumoGT_t_d_info` WRITE;
/*!40000 ALTER TABLE `KumoGT_t_d_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_t_d_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KumoGT_t_d_prop_doc`
--

DROP TABLE IF EXISTS `KumoGT_t_d_prop_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KumoGT_t_d_prop_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `notes` varchar(511) NOT NULL,
  `deg_type` varchar(63) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KumoGT_t_d_prop_doc`
--

LOCK TABLES `KumoGT_t_d_prop_doc` WRITE;
/*!40000 ALTER TABLE `KumoGT_t_d_prop_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `KumoGT_t_d_prop_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Session Note',7,'add_session_note'),(20,'Can change Session Note',7,'change_session_note'),(21,'Can delete Session Note',7,'delete_session_note'),(22,'Can add Annual Review',8,'add_annual_review_doc'),(23,'Can change Annual Review',8,'change_annual_review_doc'),(24,'Can delete Annual Review',8,'delete_annual_review_doc'),(25,'Can add Degree Plan',9,'add_deg_plan_doc'),(26,'Can change Degree Plan',9,'change_deg_plan_doc'),(27,'Can delete Degree Plan',9,'delete_deg_plan_doc'),(28,'Can add Thesis/Dissertation',10,'add_t_d_info'),(29,'Can change Thesis/Dissertation',10,'change_t_d_info'),(30,'Can delete Thesis/Dissertation',10,'delete_t_d_info'),(31,'Can add Thesis/Dissertation Document',11,'add_t_d_doc'),(32,'Can change Thesis/Dissertation Document',11,'change_t_d_doc'),(33,'Can delete Thesis/Dissertation Document',11,'delete_t_d_doc'),(34,'Can add Other Document',12,'add_other_doc'),(35,'Can change Other Document',12,'change_other_doc'),(36,'Can delete Other Document',12,'delete_other_doc'),(37,'Can add Student',13,'add_student'),(38,'Can change Student',13,'change_student'),(39,'Can delete Student',13,'delete_student'),(40,'Can add Final Exam Document',14,'add_fin_exam_doc'),(41,'Can change Final Exam Document',14,'change_fin_exam_doc'),(42,'Can delete Final Exam Document',14,'delete_fin_exam_doc'),(43,'Can add Thesis/Dissertation Proposal Document',15,'add_t_d_prop_doc'),(44,'Can change Thesis/Dissertation Proposal Document',15,'change_t_d_prop_doc'),(45,'Can delete Thesis/Dissertation Proposal Document',15,'delete_t_d_prop_doc'),(46,'Can add Preliminary Exam Document',16,'add_pre_exam_doc'),(47,'Can change Preliminary Exam Document',16,'change_pre_exam_doc'),(48,'Can delete Preliminary Exam Document',16,'delete_pre_exam_doc'),(49,'Can add Final Exam',17,'add_fin_exam_info'),(50,'Can change Final Exam',17,'change_fin_exam_info'),(51,'Can delete Final Exam',17,'delete_fin_exam_info'),(52,'Can add Preliminary Exam',18,'add_pre_exam_info'),(53,'Can change Preliminary Exam',18,'change_pre_exam_info'),(54,'Can delete Preliminary Exam',18,'delete_pre_exam_info'),(55,'Can add Qualifying Exam',19,'add_qual_exam_doc'),(56,'Can change Qualifying Exam',19,'change_qual_exam_doc'),(57,'Can delete Qualifying Exam',19,'delete_qual_exam_doc'),(58,'Can add Degree',20,'add_degree'),(59,'Can change Degree',20,'change_degree'),(60,'Can delete Degree',20,'delete_degree');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$aZT7P8ZnsGNV$oz6HJkC3H3hZeIEuHvVW8WtmaDNM2wlh+WTH8cSLOnY=','2020-05-01 18:08:24.393280',1,'o667621','','','o667621@gmail.com',1,1,'2020-05-01 18:06:52.177359');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'KumoGT','annual_review_doc'),(20,'KumoGT','degree'),(9,'KumoGT','deg_plan_doc'),(14,'KumoGT','fin_exam_doc'),(17,'KumoGT','fin_exam_info'),(12,'KumoGT','other_doc'),(16,'KumoGT','pre_exam_doc'),(18,'KumoGT','pre_exam_info'),(19,'KumoGT','qual_exam_doc'),(7,'KumoGT','session_note'),(13,'KumoGT','student'),(11,'KumoGT','t_d_doc'),(10,'KumoGT','t_d_info'),(15,'KumoGT','t_d_prop_doc'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'KumoGT','0001_initial','2020-05-01 18:06:00.014255'),(2,'KumoGT','0002_auto_20200501_1258','2020-05-01 18:06:00.653351'),(3,'KumoGT','0003_auto_20200501_1300','2020-05-01 18:06:01.247285'),(4,'KumoGT','0004_auto_20200501_1305','2020-05-01 18:06:01.321832'),(5,'contenttypes','0001_initial','2020-05-01 18:06:01.362834'),(6,'auth','0001_initial','2020-05-01 18:06:01.888929'),(7,'admin','0001_initial','2020-05-01 18:06:02.016107'),(8,'admin','0002_logentry_remove_auto_add','2020-05-01 18:06:02.041533'),(9,'contenttypes','0002_remove_content_type_name','2020-05-01 18:06:02.151932'),(10,'auth','0002_alter_permission_name_max_length','2020-05-01 18:06:02.207494'),(11,'auth','0003_alter_user_email_max_length','2020-05-01 18:06:02.268878'),(12,'auth','0004_alter_user_username_opts','2020-05-01 18:06:02.293598'),(13,'auth','0005_alter_user_last_login_null','2020-05-01 18:06:02.343428'),(14,'auth','0006_require_contenttypes_0002','2020-05-01 18:06:02.349193'),(15,'auth','0007_alter_validators_add_error_messages','2020-05-01 18:06:02.365599'),(16,'auth','0008_alter_user_username_max_length','2020-05-01 18:06:02.476653'),(17,'sessions','0001_initial','2020-05-01 18:06:02.516610'),(18,'KumoGT','0005_remove_deg_plan_doc_stu','2020-05-01 18:28:30.997192');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('tvalr7syolyiztooyzzvrnw1w4lldbd4','YWYwNDI4MzMzNGRlN2I2NWZmOTRlOTJkZjJiNWQwYzEzYmY2OWZkYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhYmFhOTg4MGJiZDllOTQzYjFkNTIxZTJlZTg1MzM3ZDc4NWExY2YiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2020-05-15 18:08:24.403862');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-01 15:39:34
