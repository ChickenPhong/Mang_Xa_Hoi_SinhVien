-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mangdb
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add chat',6,'add_chat'),(22,'Can change chat',6,'change_chat'),(23,'Can delete chat',6,'delete_chat'),(24,'Can view chat',6,'view_chat'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add bai dang',8,'add_baidang'),(30,'Can change bai dang',8,'change_baidang'),(31,'Can delete bai dang',8,'delete_baidang'),(32,'Can view bai dang',8,'view_baidang'),(33,'Can add binh luan',9,'add_binhluan'),(34,'Can change binh luan',9,'change_binhluan'),(35,'Can delete binh luan',9,'delete_binhluan'),(36,'Can view binh luan',9,'view_binhluan'),(37,'Can add chat anh',10,'add_chatanh'),(38,'Can change chat anh',10,'change_chatanh'),(39,'Can delete chat anh',10,'delete_chatanh'),(40,'Can view chat anh',10,'view_chatanh'),(41,'Can add chat text',11,'add_chattext'),(42,'Can change chat text',11,'change_chattext'),(43,'Can delete chat text',11,'delete_chattext'),(44,'Can view chat text',11,'view_chattext'),(45,'Can add khao sat',12,'add_khaosat'),(46,'Can change khao sat',12,'change_khaosat'),(47,'Can delete khao sat',12,'delete_khaosat'),(48,'Can view khao sat',12,'view_khaosat'),(49,'Can add thong bao',13,'add_thongbao'),(50,'Can change thong bao',13,'change_thongbao'),(51,'Can delete thong bao',13,'delete_thongbao'),(52,'Can view thong bao',13,'view_thongbao');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_mangxahois_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_mangxahois_user_id` FOREIGN KEY (`user_id`) REFERENCES `mangxahois_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'mangxahois','baidang'),(9,'mangxahois','binhluan'),(6,'mangxahois','chat'),(10,'mangxahois','chatanh'),(11,'mangxahois','chattext'),(12,'mangxahois','khaosat'),(13,'mangxahois','thongbao'),(7,'mangxahois','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-01-12 09:53:05.456982'),(2,'contenttypes','0002_remove_content_type_name','2025-01-12 09:53:05.499862'),(3,'auth','0001_initial','2025-01-12 09:53:05.911234'),(4,'auth','0002_alter_permission_name_max_length','2025-01-12 09:53:06.007898'),(5,'auth','0003_alter_user_email_max_length','2025-01-12 09:53:06.028144'),(6,'auth','0004_alter_user_username_opts','2025-01-12 09:53:06.030160'),(7,'auth','0005_alter_user_last_login_null','2025-01-12 09:53:06.040958'),(8,'auth','0006_require_contenttypes_0002','2025-01-12 09:53:06.045009'),(9,'auth','0007_alter_validators_add_error_messages','2025-01-12 09:53:06.045009'),(10,'auth','0008_alter_user_username_max_length','2025-01-12 09:53:06.053780'),(11,'auth','0009_alter_user_last_name_max_length','2025-01-12 09:53:06.067391'),(12,'auth','0010_alter_group_name_max_length','2025-01-12 09:53:06.083526'),(13,'auth','0011_update_proxy_permissions','2025-01-12 09:53:06.089352'),(14,'auth','0012_alter_user_first_name_max_length','2025-01-12 09:53:06.097488'),(15,'mangxahois','0001_initial','2025-01-12 09:53:06.755770'),(16,'admin','0001_initial','2025-01-12 09:53:06.854558'),(17,'admin','0002_logentry_remove_auto_add','2025-01-12 09:53:06.856573'),(18,'admin','0003_logentry_add_action_flag_choices','2025-01-12 09:53:06.869962'),(19,'sessions','0001_initial','2025-01-12 09:53:06.885431');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a5g0tvhstfvb65mnjv2x8gvi1rsfvb6l','.eJxVjEEOgjAQRe_StWk6ZTqCS_ecoZlpp4IaSCisjHdXEha6_e-9_zKRt3WIW9UljtlcDJjT7yacHjrtIN95us02zdO6jGJ3xR602n7O-rwe7t_BwHX41gjCVIgCZuw6dEjiPYm6cPbAIthwcSpNgoZyIAXuFMEFaRMWab15fwDNLjeL:1tWuff:gtPHGAo89NFBX7pic2ua1njVYn3JZItqe2cA0FIx8Yw','2025-01-26 09:54:15.405606');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_baidang`
--

DROP TABLE IF EXISTS `mangxahois_baidang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_baidang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `tieuDe` varchar(255) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `thongTin` longtext NOT NULL,
  `nguoiDangBai_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mangxahois_baidang_nguoiDangBai_id_e1f1c952_fk_mangxahoi` (`nguoiDangBai_id`),
  CONSTRAINT `mangxahois_baidang_nguoiDangBai_id_e1f1c952_fk_mangxahoi` FOREIGN KEY (`nguoiDangBai_id`) REFERENCES `mangxahois_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_baidang`
--

LOCK TABLES `mangxahois_baidang` WRITE;
/*!40000 ALTER TABLE `mangxahois_baidang` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangxahois_baidang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_binhluan`
--

DROP TABLE IF EXISTS `mangxahois_binhluan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_binhluan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `thongTin` longtext NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `baiDang_id` bigint NOT NULL,
  `nguoiBinhLuan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mangxahois_binhluan_baiDang_id_4e1caedf_fk_mangxahois_baidang_id` (`baiDang_id`),
  KEY `mangxahois_binhluan_nguoiBinhLuan_id_34b5c839_fk_mangxahoi` (`nguoiBinhLuan_id`),
  CONSTRAINT `mangxahois_binhluan_baiDang_id_4e1caedf_fk_mangxahois_baidang_id` FOREIGN KEY (`baiDang_id`) REFERENCES `mangxahois_baidang` (`id`),
  CONSTRAINT `mangxahois_binhluan_nguoiBinhLuan_id_34b5c839_fk_mangxahoi` FOREIGN KEY (`nguoiBinhLuan_id`) REFERENCES `mangxahois_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_binhluan`
--

LOCK TABLES `mangxahois_binhluan` WRITE;
/*!40000 ALTER TABLE `mangxahois_binhluan` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangxahois_binhluan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_chat`
--

DROP TABLE IF EXISTS `mangxahois_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `thoiGianGui` datetime(6) NOT NULL,
  `daDoc` tinyint(1) NOT NULL,
  `nguoiGui_id` bigint NOT NULL,
  `nguoiNhan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mangxahois_chat_nguoiGui_id_a74819f2_fk_mangxahois_user_id` (`nguoiGui_id`),
  KEY `mangxahois_chat_nguoiNhan_id_79358d84_fk_mangxahois_user_id` (`nguoiNhan_id`),
  CONSTRAINT `mangxahois_chat_nguoiGui_id_a74819f2_fk_mangxahois_user_id` FOREIGN KEY (`nguoiGui_id`) REFERENCES `mangxahois_user` (`id`),
  CONSTRAINT `mangxahois_chat_nguoiNhan_id_79358d84_fk_mangxahois_user_id` FOREIGN KEY (`nguoiNhan_id`) REFERENCES `mangxahois_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_chat`
--

LOCK TABLES `mangxahois_chat` WRITE;
/*!40000 ALTER TABLE `mangxahois_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangxahois_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_chatanh`
--

DROP TABLE IF EXISTS `mangxahois_chatanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_chatanh` (
  `chat_ptr_id` bigint NOT NULL,
  `anh` varchar(100) NOT NULL,
  PRIMARY KEY (`chat_ptr_id`),
  CONSTRAINT `mangxahois_chatanh_chat_ptr_id_b4f7a220_fk_mangxahois_chat_id` FOREIGN KEY (`chat_ptr_id`) REFERENCES `mangxahois_chat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_chatanh`
--

LOCK TABLES `mangxahois_chatanh` WRITE;
/*!40000 ALTER TABLE `mangxahois_chatanh` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangxahois_chatanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_chattext`
--

DROP TABLE IF EXISTS `mangxahois_chattext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_chattext` (
  `chat_ptr_id` bigint NOT NULL,
  `noiDung` longtext NOT NULL,
  PRIMARY KEY (`chat_ptr_id`),
  CONSTRAINT `mangxahois_chattext_chat_ptr_id_dbf8750f_fk_mangxahois_chat_id` FOREIGN KEY (`chat_ptr_id`) REFERENCES `mangxahois_chat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_chattext`
--

LOCK TABLES `mangxahois_chattext` WRITE;
/*!40000 ALTER TABLE `mangxahois_chattext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangxahois_chattext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_khaosat`
--

DROP TABLE IF EXISTS `mangxahois_khaosat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_khaosat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `tieuDe` varchar(255) NOT NULL,
  `thongTin` longtext NOT NULL,
  `tong_ket_qua` longtext,
  `nguoiTao_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mangxahois_khaosat_nguoiTao_id_d1eb7d80_fk_mangxahois_user_id` (`nguoiTao_id`),
  CONSTRAINT `mangxahois_khaosat_nguoiTao_id_d1eb7d80_fk_mangxahois_user_id` FOREIGN KEY (`nguoiTao_id`) REFERENCES `mangxahois_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_khaosat`
--

LOCK TABLES `mangxahois_khaosat` WRITE;
/*!40000 ALTER TABLE `mangxahois_khaosat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangxahois_khaosat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_thongbao`
--

DROP TABLE IF EXISTS `mangxahois_thongbao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_thongbao` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `tieuDe` varchar(255) NOT NULL,
  `thongTin` longtext NOT NULL,
  `nguoiTao_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mangxahois_thongbao_nguoiTao_id_bc090876_fk_mangxahois_user_id` (`nguoiTao_id`),
  CONSTRAINT `mangxahois_thongbao_nguoiTao_id_bc090876_fk_mangxahois_user_id` FOREIGN KEY (`nguoiTao_id`) REFERENCES `mangxahois_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_thongbao`
--

LOCK TABLES `mangxahois_thongbao` WRITE;
/*!40000 ALTER TABLE `mangxahois_thongbao` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangxahois_thongbao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_user`
--

DROP TABLE IF EXISTS `mangxahois_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `SDT` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `vaiTro` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_user`
--

LOCK TABLES `mangxahois_user` WRITE;
/*!40000 ALTER TABLE `mangxahois_user` DISABLE KEYS */;
INSERT INTO `mangxahois_user` VALUES (1,'pbkdf2_sha256$870000$ypvUUPAsuKzkiNbOegP59o$JShWearjM6P4DFFd92hmByvQvUT2PZAwEnB2XtZdmd4=','2025-01-12 09:54:15.395686',1,'admin','','','123@gmail.com',1,1,'2025-01-12 09:53:24.700397','','',1);
/*!40000 ALTER TABLE `mangxahois_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_user_groups`
--

DROP TABLE IF EXISTS `mangxahois_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mangxahois_user_groups_user_id_group_id_eebf97f4_uniq` (`user_id`,`group_id`),
  KEY `mangxahois_user_groups_group_id_b9a71970_fk_auth_group_id` (`group_id`),
  CONSTRAINT `mangxahois_user_groups_group_id_b9a71970_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `mangxahois_user_groups_user_id_3b9c96ff_fk_mangxahois_user_id` FOREIGN KEY (`user_id`) REFERENCES `mangxahois_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_user_groups`
--

LOCK TABLES `mangxahois_user_groups` WRITE;
/*!40000 ALTER TABLE `mangxahois_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangxahois_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_user_tuongtac`
--

DROP TABLE IF EXISTS `mangxahois_user_tuongtac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_user_tuongtac` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint NOT NULL,
  `to_user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mangxahois_user_tuongTac_from_user_id_to_user_id_5ee96ab7_uniq` (`from_user_id`,`to_user_id`),
  KEY `mangxahois_user_tuon_to_user_id_ce218daf_fk_mangxahoi` (`to_user_id`),
  CONSTRAINT `mangxahois_user_tuon_from_user_id_1990bd19_fk_mangxahoi` FOREIGN KEY (`from_user_id`) REFERENCES `mangxahois_user` (`id`),
  CONSTRAINT `mangxahois_user_tuon_to_user_id_ce218daf_fk_mangxahoi` FOREIGN KEY (`to_user_id`) REFERENCES `mangxahois_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_user_tuongtac`
--

LOCK TABLES `mangxahois_user_tuongtac` WRITE;
/*!40000 ALTER TABLE `mangxahois_user_tuongtac` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangxahois_user_tuongtac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangxahois_user_user_permissions`
--

DROP TABLE IF EXISTS `mangxahois_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mangxahois_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mangxahois_user_user_per_user_id_permission_id_28ff61b3_uniq` (`user_id`,`permission_id`),
  KEY `mangxahois_user_user_permission_id_a1b14123_fk_auth_perm` (`permission_id`),
  CONSTRAINT `mangxahois_user_user_permission_id_a1b14123_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `mangxahois_user_user_user_id_c143b6e5_fk_mangxahoi` FOREIGN KEY (`user_id`) REFERENCES `mangxahois_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mangxahois_user_user_permissions`
--

LOCK TABLES `mangxahois_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `mangxahois_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mangxahois_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-12 16:55:07
