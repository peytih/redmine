-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: redmine
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2024-11-10 01:03:56.022770','2024-11-10 01:03:56.022770');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `container_id` int DEFAULT NULL,
  `container_type` varchar(30) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `disk_filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` bigint NOT NULL DEFAULT '0',
  `content_type` varchar(255) DEFAULT '',
  `digest` varchar(64) NOT NULL DEFAULT '',
  `downloads` int NOT NULL DEFAULT '0',
  `author_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `disk_directory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`),
  KEY `index_attachments_on_disk_filename` (`disk_filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_sources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `host` varchar(60) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT '',
  `base_dn` varchar(255) DEFAULT NULL,
  `attr_login` varchar(30) DEFAULT NULL,
  `attr_firstname` varchar(30) DEFAULT NULL,
  `attr_lastname` varchar(30) DEFAULT NULL,
  `attr_mail` varchar(30) DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` text,
  `timeout` int DEFAULT NULL,
  `verify_peer` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int DEFAULT NULL,
  `topics_count` int NOT NULL DEFAULT '0',
  `messages_count` int NOT NULL DEFAULT '0',
  `last_message_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `changeset_id` int NOT NULL,
  `action` varchar(1) NOT NULL DEFAULT '',
  `path` text NOT NULL,
  `from_path` text,
  `from_revision` varchar(255) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeset_parents`
--

DROP TABLE IF EXISTS `changeset_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changeset_parents` (
  `changeset_id` int NOT NULL,
  `parent_id` int NOT NULL,
  KEY `changeset_parents_changeset_ids` (`changeset_id`),
  KEY `changeset_parents_parent_ids` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeset_parents`
--

LOCK TABLES `changeset_parents` WRITE;
/*!40000 ALTER TABLE `changeset_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeset_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets`
--

DROP TABLE IF EXISTS `changesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changesets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repository_id` int NOT NULL,
  `revision` varchar(255) NOT NULL,
  `committer` varchar(255) DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets`
--

LOCK TABLES `changesets` WRITE;
/*!40000 ALTER TABLE `changesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets_issues`
--

DROP TABLE IF EXISTS `changesets_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changesets_issues` (
  `changeset_id` int NOT NULL,
  `issue_id` int NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`),
  KEY `index_changesets_issues_on_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets_issues`
--

LOCK TABLES `changesets_issues` WRITE;
/*!40000 ALTER TABLE `changesets_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) NOT NULL DEFAULT '',
  `commented_id` int NOT NULL DEFAULT '0',
  `author_id` int NOT NULL DEFAULT '0',
  `content` text,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_enumerations`
--

DROP TABLE IF EXISTS `custom_field_enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field_enumerations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custom_field_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_enumerations`
--

LOCK TABLES `custom_field_enumerations` WRITE;
/*!40000 ALTER TABLE `custom_field_enumerations` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `field_format` varchar(30) NOT NULL DEFAULT '',
  `possible_values` text,
  `regexp` varchar(255) DEFAULT '',
  `min_length` int DEFAULT NULL,
  `max_length` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  `format_store` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,'IssueCustomField','Текущие задачи','string',NULL,'',NULL,NULL,0,1,0,1,0,'',1,1,0,'---\ntext_formatting: \'\'\nurl_pattern: \'\'\n','Поле для просмотра текущих задач'),(2,'ProjectCustomField','Проекты в работе','string',NULL,'',NULL,NULL,0,0,0,1,1,'',1,1,0,'---\ntext_formatting: \'\'\nurl_pattern: \'\'\n','Поле в котором хранятся проекты в стадии разработки'),(3,'ProjectCustomField','Законченные проекты(архив)','string',NULL,'',NULL,NULL,0,0,0,2,1,'',1,0,0,'---\ntext_formatting: \'\'\nurl_pattern: \'\'\n',''),(4,'UserCustomField','Информация о личном составе','string',NULL,'',NULL,NULL,1,0,0,1,0,'',1,0,0,'---\ntext_formatting: \'\'\nurl_pattern: \'\'\n',''),(5,'TimeEntryActivityCustomField','Распределение времени','string',NULL,'',NULL,NULL,0,0,0,1,0,'',1,1,0,'---\ntext_formatting: \'\'\nurl_pattern: \'\'\n','');
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_projects`
--

DROP TABLE IF EXISTS `custom_fields_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_projects`
--

LOCK TABLES `custom_fields_projects` WRITE;
/*!40000 ALTER TABLE `custom_fields_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_roles`
--

DROP TABLE IF EXISTS `custom_fields_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int NOT NULL,
  `role_id` int NOT NULL,
  UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_roles`
--

LOCK TABLES `custom_fields_roles` WRITE;
/*!40000 ALTER TABLE `custom_fields_roles` DISABLE KEYS */;
INSERT INTO `custom_fields_roles` VALUES (3,4),(3,6);
/*!40000 ALTER TABLE `custom_fields_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_trackers`
--

DROP TABLE IF EXISTS `custom_fields_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int NOT NULL DEFAULT '0',
  `tracker_id` int NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_trackers`
--

LOCK TABLES `custom_fields_trackers` WRITE;
/*!40000 ALTER TABLE `custom_fields_trackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_values`
--

DROP TABLE IF EXISTS `custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) NOT NULL DEFAULT '',
  `customized_id` int NOT NULL DEFAULT '0',
  `custom_field_id` int NOT NULL DEFAULT '0',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_values`
--

LOCK TABLES `custom_values` WRITE;
/*!40000 ALTER TABLE `custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `created_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_email_addresses_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES (1,1,'Vlad.Kormak@yandex.ru',1,1,'2024-11-10 01:03:55','2024-11-10 01:21:15');
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enabled_modules`
--

DROP TABLE IF EXISTS `enabled_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enabled_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_modules`
--

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (1,1,'issue_tracking'),(2,1,'time_tracking'),(3,1,'news'),(4,1,'documents'),(5,1,'files'),(6,1,'wiki'),(7,1,'repository'),(8,1,'boards'),(9,1,'calendar'),(10,1,'gantt');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enumerations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `position_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumerations`
--

LOCK TABLES `enumerations` WRITE;
/*!40000 ALTER TABLE `enumerations` DISABLE KEYS */;
INSERT INTO `enumerations` VALUES (1,'Low',1,0,'IssuePriority',1,NULL,NULL,'lowest'),(2,'Normal',2,1,'IssuePriority',1,NULL,NULL,'default'),(3,'High',3,0,'IssuePriority',1,NULL,NULL,'high3'),(4,'Urgent',4,0,'IssuePriority',1,NULL,NULL,'high2'),(5,'Immediate',5,0,'IssuePriority',1,NULL,NULL,'highest'),(6,'User documentation',1,0,'DocumentCategory',1,NULL,NULL,NULL),(7,'Technical documentation',2,0,'DocumentCategory',1,NULL,NULL,NULL),(8,'Design',1,0,'TimeEntryActivity',1,NULL,NULL,NULL),(9,'Development',2,0,'TimeEntryActivity',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups_users` (
  `group_id` int NOT NULL,
  `user_id` int NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_items`
--

DROP TABLE IF EXISTS `import_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `import_id` int NOT NULL,
  `position` int NOT NULL,
  `obj_id` int DEFAULT NULL,
  `message` text,
  `unique_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_import_items_on_import_id_and_unique_id` (`import_id`,`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_items`
--

LOCK TABLES `import_items` WRITE;
/*!40000 ALTER TABLE `import_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `settings` text,
  `total_items` int DEFAULT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_categories`
--

DROP TABLE IF EXISTS `issue_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `assigned_to_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_categories`
--

LOCK TABLES `issue_categories` WRITE;
/*!40000 ALTER TABLE `issue_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_relations`
--

DROP TABLE IF EXISTS `issue_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issue_from_id` int NOT NULL,
  `issue_to_id` int NOT NULL,
  `relation_type` varchar(255) NOT NULL DEFAULT '',
  `delay` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_relations`
--

LOCK TABLES `issue_relations` WRITE;
/*!40000 ALTER TABLE `issue_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_statuses`
--

DROP TABLE IF EXISTS `issue_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `position` int DEFAULT NULL,
  `default_done_ratio` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_statuses`
--

LOCK TABLES `issue_statuses` WRITE;
/*!40000 ALTER TABLE `issue_statuses` DISABLE KEYS */;
INSERT INTO `issue_statuses` VALUES (1,'New',0,1,NULL),(2,'In Progress',0,2,NULL),(3,'Resolved',0,3,NULL),(4,'Feedback',0,4,NULL),(5,'Closed',1,5,NULL),(6,'Rejected',1,6,NULL);
/*!40000 ALTER TABLE `issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tracker_id` int NOT NULL,
  `project_id` int NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `due_date` date DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `status_id` int NOT NULL,
  `assigned_to_id` int DEFAULT NULL,
  `priority_id` int NOT NULL,
  `fixed_version_id` int DEFAULT NULL,
  `author_id` int NOT NULL,
  `lock_version` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `root_id` int DEFAULT NULL,
  `lft` int DEFAULT NULL,
  `rgt` int DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `closed_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`),
  KEY `index_issues_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,2,1,'доделать','','2025-01-17',NULL,1,NULL,3,NULL,1,1,'2025-01-08 18:11:11','2025-01-08 18:11:11','2025-01-08',0,NULL,NULL,1,1,2,0,NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_details`
--

DROP TABLE IF EXISTS `journal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `journal_id` int NOT NULL DEFAULT '0',
  `property` varchar(30) NOT NULL DEFAULT '',
  `prop_key` varchar(30) NOT NULL DEFAULT '',
  `old_value` longtext,
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_details`
--

LOCK TABLES `journal_details` WRITE;
/*!40000 ALTER TABLE `journal_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `journalized_id` int NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `notes` longtext,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_roles`
--

DROP TABLE IF EXISTS `member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `role_id` int NOT NULL,
  `inherited_from` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`),
  KEY `index_member_roles_on_inherited_from` (`inherited_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_roles`
--

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `author_id` int DEFAULT NULL,
  `replies_count` int NOT NULL DEFAULT '0',
  `last_reply_id` int DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT '',
  `description` text,
  `author_id` int NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `comments_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `homepage` varchar(255) DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `lft` int DEFAULT NULL,
  `rgt` int DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT '0',
  `default_version_id` int DEFAULT NULL,
  `default_assigned_to_id` int DEFAULT NULL,
  `default_issue_query_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'test_1','','',1,NULL,'2024-11-09 22:21:37','2024-11-09 22:21:37','test_1',1,1,2,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_trackers`
--

DROP TABLE IF EXISTS `projects_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_trackers` (
  `project_id` int NOT NULL DEFAULT '0',
  `tracker_id` int NOT NULL DEFAULT '0',
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_trackers`
--

LOCK TABLES `projects_trackers` WRITE;
/*!40000 ALTER TABLE `projects_trackers` DISABLE KEYS */;
INSERT INTO `projects_trackers` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `projects_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filters` text,
  `user_id` int NOT NULL DEFAULT '0',
  `column_names` text,
  `sort_criteria` text,
  `group_by` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `visibility` int DEFAULT '0',
  `options` text,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,NULL,'Issues assigned to me','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nassigned_to_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - priority\n  - desc\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(2,NULL,'Reported issues','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nauthor_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(3,NULL,'Updated issues','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nupdated_by:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(4,NULL,'Watched issues','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nwatcher_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(5,NULL,'My projects','---\nstatus:\n  :operator: \"=\"\n  :values:\n  - \'1\'\nid:\n  :operator: \"=\"\n  :values:\n  - mine\n',0,NULL,NULL,NULL,'ProjectQuery',2,NULL),(6,NULL,'My bookmarks','---\nstatus:\n  :operator: \"=\"\n  :values:\n  - \'1\'\nid:\n  :operator: \"=\"\n  :values:\n  - bookmarks\n',0,NULL,NULL,NULL,'ProjectQuery',2,NULL),(7,NULL,'Spent time','---\nspent_on:\n  :operator: \"*\"\n  :values:\n  - \'\'\nuser_id:\n  :operator: \"=\"\n  :values:\n  - me\n',0,NULL,'---\n- - spent_on\n  - desc\n',NULL,'TimeEntryQuery',2,'---\n:totalable_names:\n- :hours\n');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries_roles`
--

DROP TABLE IF EXISTS `queries_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries_roles` (
  `query_id` int NOT NULL,
  `role_id` int NOT NULL,
  UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries_roles`
--

LOCK TABLES `queries_roles` WRITE;
/*!40000 ALTER TABLE `queries_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repositories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(60) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `root_url` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `path_encoding` varchar(64) DEFAULT NULL,
  `log_encoding` varchar(64) DEFAULT NULL,
  `extra_info` longtext,
  `identifier` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `position` int DEFAULT NULL,
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int NOT NULL DEFAULT '0',
  `permissions` text,
  `issues_visibility` varchar(30) NOT NULL DEFAULT 'default',
  `users_visibility` varchar(30) NOT NULL DEFAULT 'all',
  `time_entries_visibility` varchar(30) NOT NULL DEFAULT 'all',
  `all_roles_managed` tinyint(1) NOT NULL DEFAULT '1',
  `settings` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Non member',0,1,1,'---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL),(2,'Anonymous',0,1,2,'---\n- :view_issues\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL),(4,'Начальник кафедры',2,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_versions\n- :add_subprojects\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :delete_own_messages\n- :view_calendar\n- :view_documents\n- :add_documents\n- :view_files\n- :manage_files\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :manage_categories\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n','own','all','all',1,'---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'0\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),(5,'Reporter',3,1,0,'---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL),(6,'Начальник факультета',1,0,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :view_issue_watchers\n- :add_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :view_wiki_page_watchers\n- :add_wiki_page_watchers\n- :delete_wiki_page_watchers\n- :protect_wiki_pages\n- :manage_wiki\n','all','all','all',1,'---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'0\'\n  add_issue_notes: \'1\'\n  delete_issues: \'0\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),(7,'Преподаватель',4,1,0,'---\n- :save_queries\n- :view_messages\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n','own','all','own',1,'---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'0\'\n  add_issue_notes: \'1\'\n  delete_issues: \'0\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_managed_roles`
--

DROP TABLE IF EXISTS `roles_managed_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_managed_roles` (
  `role_id` int NOT NULL,
  `managed_role_id` int NOT NULL,
  UNIQUE KEY `index_roles_managed_roles_on_role_id_and_managed_role_id` (`role_id`,`managed_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_managed_roles`
--

LOCK TABLES `roles_managed_roles` WRITE;
/*!40000 ALTER TABLE `roles_managed_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_managed_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('10'),('100'),('101'),('102'),('103'),('104'),('105'),('106'),('107'),('108'),('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('20'),('20090214190337'),('20090312172426'),('20090312194159'),('20090318181151'),('20090323224724'),('20090401221305'),('20090401231134'),('20090403001910'),('20090406161854'),('20090425161243'),('20090503121501'),('20090503121505'),('20090503121510'),('20090614091200'),('20090704172350'),('20090704172355'),('20090704172358'),('20091010093521'),('20091017212227'),('20091017212457'),('20091017212644'),('20091017212938'),('20091017213027'),('20091017213113'),('20091017213151'),('20091017213228'),('20091017213257'),('20091017213332'),('20091017213444'),('20091017213536'),('20091017213642'),('20091017213716'),('20091017213757'),('20091017213835'),('20091017213910'),('20091017214015'),('20091017214107'),('20091017214136'),('20091017214236'),('20091017214308'),('20091017214336'),('20091017214406'),('20091017214440'),('20091017214519'),('20091017214611'),('20091017214644'),('20091017214720'),('20091017214750'),('20091025163651'),('20091108092559'),('20091114105931'),('20091123212029'),('20091205124427'),('20091220183509'),('20091220183727'),('20091220184736'),('20091225164732'),('20091227112908'),('20100129193402'),('20100129193813'),('20100221100219'),('20100313132032'),('20100313171051'),('20100705164950'),('20100819172912'),('20101104182107'),('20101107130441'),('20101114115114'),('20101114115359'),('20110220160626'),('20110223180944'),('20110223180953'),('20110224000000'),('20110226120112'),('20110226120132'),('20110227125750'),('20110228000000'),('20110228000100'),('20110401192910'),('20110408103312'),('20110412065600'),('20110511000000'),('20110902000000'),('20111201201315'),('20120115143024'),('20120115143100'),('20120115143126'),('20120127174243'),('20120205111326'),('20120223110929'),('20120301153455'),('20120422150750'),('20120705074331'),('20120707064544'),('20120714122000'),('20120714122100'),('20120714122200'),('20120731164049'),('20120930112914'),('20121026002032'),('20121026003537'),('20121209123234'),('20121209123358'),('20121213084931'),('20130110122628'),('20130201184705'),('20130202090625'),('20130207175206'),('20130207181455'),('20130215073721'),('20130215111127'),('20130215111141'),('20130217094251'),('20130602092539'),('20130710182539'),('20130713104233'),('20130713111657'),('20130729070143'),('20130911193200'),('20131004113137'),('20131005100610'),('20131124175346'),('20131210180802'),('20131214094309'),('20131215104612'),('20131218183023'),('20140228130325'),('20140903143914'),('20140920094058'),('20141029181752'),('20141029181824'),('20141109112308'),('20141122124142'),('20150113194759'),('20150113211532'),('20150113213922'),('20150113213955'),('20150208105930'),('20150510083747'),('20150525103953'),('20150526183158'),('20150528084820'),('20150528092912'),('20150528093249'),('20150725112753'),('20150730122707'),('20150730122735'),('20150921204850'),('20150921210243'),('20151020182334'),('20151020182731'),('20151021184614'),('20151021185456'),('20151021190616'),('20151024082034'),('20151025072118'),('20151031095005'),('20160404080304'),('20160416072926'),('20160529063352'),('20161001122012'),('20161002133421'),('20161010081301'),('20161010081528'),('20161010081600'),('20161126094932'),('20161220091118'),('20170207050700'),('20170302015225'),('20170309214320'),('20170320051650'),('20170418090031'),('20170419144536'),('20170723112801'),('20180501132547'),('20180913072918'),('20180923082945'),('20180923091603'),('20190315094151'),('20190315102101'),('20190510070108'),('20190620135549'),('20200826153401'),('20200826153402'),('20210704125704'),('20210705111300'),('20210728131544'),('20210801145548'),('20210801211024'),('20211213122100'),('20211213122101'),('20211213122102'),('20220224194639'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('49'),('5'),('50'),('51'),('52'),('53'),('54'),('55'),('56'),('57'),('58'),('59'),('6'),('60'),('61'),('62'),('63'),('64'),('65'),('66'),('67'),('68'),('69'),('7'),('70'),('71'),('72'),('73'),('74'),('75'),('76'),('77'),('78'),('79'),('8'),('80'),('81'),('82'),('83'),('84'),('85'),('86'),('87'),('88'),('89'),('9'),('90'),('91'),('92'),('93'),('94'),('95'),('96'),('97'),('98'),('99');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'default_projects_tracker_ids','---\n- \'1\'\n- \'2\'\n- \'3\'\n','2024-11-09 22:04:01'),(2,'ui_theme','hardpixel-minelab-4881bb6','2024-12-29 20:46:36'),(3,'default_language','ru','2024-12-28 22:36:15'),(4,'force_default_language_for_anonymous','0','2024-11-16 06:21:43'),(5,'force_default_language_for_loggedin','0','2024-11-16 06:21:43'),(6,'start_of_week','','2024-11-16 06:21:43'),(7,'date_format','','2024-11-16 06:21:43'),(8,'time_format','','2024-11-16 06:21:43'),(9,'timespan_format','minutes','2024-11-16 06:21:43'),(10,'user_format','firstname_lastname','2024-11-16 06:21:43'),(11,'gravatar_enabled','0','2024-11-16 06:21:43'),(12,'thumbnails_enabled','1','2024-11-16 06:21:43'),(13,'thumbnails_size','150','2024-12-28 22:36:15'),(14,'new_item_menu_tab','2','2024-11-16 06:21:43'),(15,'login_required','0','2024-12-28 22:28:05'),(16,'autologin','365','2024-12-28 22:28:05'),(17,'self_registration','1','2024-12-28 22:28:05'),(18,'show_custom_fields_on_registration','1','2024-12-28 22:28:05'),(19,'password_min_length','4','2024-12-28 22:28:05'),(20,'password_required_char_classes','--- []\n','2024-12-28 22:28:05'),(21,'password_max_age','0','2024-12-28 22:28:05'),(22,'lost_password','1','2024-12-28 22:28:05'),(23,'twofa','1','2024-12-28 22:28:05'),(24,'session_lifetime','0','2024-12-28 22:28:05'),(25,'session_timeout','0','2024-12-28 22:28:05'),(26,'app_title','61 кафедра','2024-12-29 20:45:08'),(27,'welcome_text','','2024-12-29 20:37:48'),(28,'per_page_options','25,50,100','2024-12-29 20:37:48'),(29,'search_results_per_page','10','2024-12-29 20:37:48'),(30,'activity_days_default','10','2024-12-29 20:37:48'),(31,'host_name','localhost:3000','2024-12-29 20:37:48'),(32,'protocol','http','2024-12-29 20:37:48'),(33,'text_formatting','textile','2024-12-29 20:37:48'),(34,'cache_formatted_text','0','2024-12-29 20:37:48'),(35,'wiki_compression','','2024-12-29 20:37:48'),(36,'feeds_limit','15','2024-12-29 20:37:48'),(37,'mail_from','Vlad.Kormak@yandex.ru','2024-12-29 21:10:48'),(38,'plain_text_mail','0','2024-12-29 21:10:48'),(39,'show_status_changes_in_mail_subject','1','2024-12-29 21:10:48'),(40,'notified_events','---\n- issue_added\n- issue_updated\n','2024-12-29 21:10:48'),(41,'emails_header','!!!!','2024-12-29 21:10:48'),(42,'emails_footer','You have received this notification because you have either subscribed to it, or are involved in it.\r\nTo change your notification preferences, please click here: http://hostname/my/account','2024-12-29 21:10:48'),(43,'default_projects_public','1','2025-01-08 18:05:51'),(44,'default_projects_modules','---\n- issue_tracking\n- time_tracking\n- news\n- documents\n- files\n- wiki\n- repository\n- boards\n- calendar\n','2025-01-08 18:05:51'),(45,'sequential_project_identifiers','0','2025-01-08 18:05:51'),(46,'project_list_display_type','board','2025-01-08 18:05:51'),(47,'project_list_defaults','---\n:column_names:\n- name\n- identifier\n- short_description\n','2025-01-08 18:05:51'),(48,'default_project_query','','2025-01-08 18:05:51'),(49,'rest_api_enabled','1','2025-01-08 18:07:34'),(50,'jsonp_enabled','1','2025-01-08 18:07:34');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_entries`
--

DROP TABLE IF EXISTS `time_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `issue_id` int DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `activity_id` int NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int NOT NULL,
  `tmonth` int NOT NULL,
  `tweek` int NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_entries`
--

LOCK TABLES `time_entries` WRITE;
/*!40000 ALTER TABLE `time_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_value` (`value`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (4,1,'feeds','76ef4cb017e69bfb3826c57524d62f4dd1209eea','2024-11-10 01:21:18','2024-11-09 22:21:18'),(5,1,'session','63a77a5daf208d68b0dacd9af6dd768becf0217f','2024-11-20 09:44:49','2024-11-20 07:26:54'),(6,1,'session','d4be9a56c82bd3bb2aaa73ea1f1a4578545b93f5','2024-12-29 22:55:48','2025-01-08 18:13:49'),(7,1,'autologin','2b04b0a25a4acda9282da19a93916e3c9b5f1666','2024-12-29 22:55:48','2024-12-29 19:55:48');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trackers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int DEFAULT '0',
  `default_status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (1,'Bug',NULL,1,0,0,1),(2,'Feature',NULL,2,1,0,1),(3,'Support',NULL,3,0,0,1);
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `others` text,
  `hide_mail` tinyint(1) DEFAULT '1',
  `time_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:recently_used_project_ids: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n',1,'St. Petersburg');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) DEFAULT '',
  `auth_source_id` int DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `mail_notification` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT '0',
  `passwd_changed_on` datetime DEFAULT NULL,
  `twofa_scheme` varchar(255) DEFAULT NULL,
  `twofa_totp_key` varchar(255) DEFAULT NULL,
  `twofa_totp_last_used_at` int DEFAULT NULL,
  `twofa_required` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','115082788702a219fb2e543a918665af94499000','Владислав','Кормаков',1,1,'2024-12-29 22:55:48','',NULL,'2024-11-09 22:03:45','2024-11-09 22:21:15','User','all','bde4f9ff07826ee8baa6881997256bcb',0,'2024-11-10 01:20:44',NULL,NULL,NULL,0),(2,'','','','Anonymous users',0,1,NULL,'',NULL,'2024-11-09 22:03:54','2024-11-09 22:03:54','GroupAnonymous','',NULL,0,NULL,NULL,NULL,NULL,0),(3,'','','','Non member users',0,1,NULL,'',NULL,'2024-11-09 22:03:54','2024-11-09 22:03:54','GroupNonMember','',NULL,0,NULL,NULL,NULL,NULL,0),(4,'','','','Anonymous',0,0,NULL,'',NULL,'2024-11-09 22:04:02','2024-11-09 22:04:02','AnonymousUser','only_my_events',NULL,0,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `wiki_page_title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'open',
  `sharing` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) NOT NULL DEFAULT '',
  `watchable_id` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchers`
--

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_content_versions`
--

DROP TABLE IF EXISTS `wiki_content_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_content_versions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int NOT NULL,
  `page_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) DEFAULT '',
  `comments` varchar(1024) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_content_versions`
--

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_contents`
--

DROP TABLE IF EXISTS `wiki_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_contents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `text` longtext,
  `comments` varchar(1024) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_contents`
--

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wiki_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_redirects`
--

DROP TABLE IF EXISTS `wiki_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wiki_redirects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wiki_id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `redirects_to` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `redirects_to_wiki_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_redirects`
--

LOCK TABLES `wiki_redirects` WRITE;
/*!40000 ALTER TABLE `wiki_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikis`
--

DROP TABLE IF EXISTS `wikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wikis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `start_page` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikis`
--

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tracker_id` int NOT NULL DEFAULT '0',
  `old_status_id` int NOT NULL DEFAULT '0',
  `new_status_id` int NOT NULL DEFAULT '0',
  `role_id` int NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) DEFAULT NULL,
  `field_name` varchar(30) DEFAULT NULL,
  `rule` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`),
  KEY `index_workflows_on_tracker_id` (`tracker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (91,1,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(92,1,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(93,1,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(94,1,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(95,1,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(96,1,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(97,1,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(98,1,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(99,1,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(100,1,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(101,1,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(102,1,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(103,1,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(104,2,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(105,2,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(106,2,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(107,2,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(108,2,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(109,2,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(110,2,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(111,2,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(112,2,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(113,2,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(114,2,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(115,2,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(116,2,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(117,3,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(118,3,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(119,3,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(120,3,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(121,3,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(122,3,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(123,3,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(124,3,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(125,3,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(126,3,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(127,3,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(128,3,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(129,3,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(130,1,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(131,1,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(132,1,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(133,1,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(134,1,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(135,2,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(136,2,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(137,2,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(138,2,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(139,2,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(140,3,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(141,3,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(142,3,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(143,3,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(144,3,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(145,1,1,2,6,0,0,'WorkflowTransition',NULL,NULL),(146,1,1,3,6,0,0,'WorkflowTransition',NULL,NULL),(147,1,1,4,6,0,0,'WorkflowTransition',NULL,NULL),(148,1,1,5,6,0,0,'WorkflowTransition',NULL,NULL),(149,1,1,6,6,0,0,'WorkflowTransition',NULL,NULL),(150,1,2,1,6,0,0,'WorkflowTransition',NULL,NULL),(151,1,2,3,6,0,0,'WorkflowTransition',NULL,NULL),(152,1,2,4,6,0,0,'WorkflowTransition',NULL,NULL),(153,1,2,5,6,0,0,'WorkflowTransition',NULL,NULL),(154,1,2,6,6,0,0,'WorkflowTransition',NULL,NULL),(155,1,3,1,6,0,0,'WorkflowTransition',NULL,NULL),(156,1,3,2,6,0,0,'WorkflowTransition',NULL,NULL),(157,1,3,4,6,0,0,'WorkflowTransition',NULL,NULL),(158,1,3,5,6,0,0,'WorkflowTransition',NULL,NULL),(159,1,3,6,6,0,0,'WorkflowTransition',NULL,NULL),(160,1,4,1,6,0,0,'WorkflowTransition',NULL,NULL),(161,1,4,2,6,0,0,'WorkflowTransition',NULL,NULL),(162,1,4,3,6,0,0,'WorkflowTransition',NULL,NULL),(163,1,4,5,6,0,0,'WorkflowTransition',NULL,NULL),(164,1,4,6,6,0,0,'WorkflowTransition',NULL,NULL),(165,1,5,1,6,0,0,'WorkflowTransition',NULL,NULL),(166,1,5,2,6,0,0,'WorkflowTransition',NULL,NULL),(167,1,5,3,6,0,0,'WorkflowTransition',NULL,NULL),(168,1,5,4,6,0,0,'WorkflowTransition',NULL,NULL),(169,1,5,6,6,0,0,'WorkflowTransition',NULL,NULL),(170,1,6,1,6,0,0,'WorkflowTransition',NULL,NULL),(171,1,6,2,6,0,0,'WorkflowTransition',NULL,NULL),(172,1,6,3,6,0,0,'WorkflowTransition',NULL,NULL),(173,1,6,4,6,0,0,'WorkflowTransition',NULL,NULL),(174,1,6,5,6,0,0,'WorkflowTransition',NULL,NULL),(176,2,1,2,6,0,0,'WorkflowTransition',NULL,NULL),(177,2,1,3,6,0,0,'WorkflowTransition',NULL,NULL),(178,2,1,4,6,0,0,'WorkflowTransition',NULL,NULL),(179,2,1,5,6,0,0,'WorkflowTransition',NULL,NULL),(180,2,1,6,6,0,0,'WorkflowTransition',NULL,NULL),(181,2,2,1,6,0,0,'WorkflowTransition',NULL,NULL),(182,2,2,3,6,0,0,'WorkflowTransition',NULL,NULL),(183,2,2,4,6,0,0,'WorkflowTransition',NULL,NULL),(184,2,2,5,6,0,0,'WorkflowTransition',NULL,NULL),(185,2,2,6,6,0,0,'WorkflowTransition',NULL,NULL),(186,2,3,1,6,0,0,'WorkflowTransition',NULL,NULL),(187,2,3,2,6,0,0,'WorkflowTransition',NULL,NULL),(188,2,3,4,6,0,0,'WorkflowTransition',NULL,NULL),(189,2,3,5,6,0,0,'WorkflowTransition',NULL,NULL),(190,2,3,6,6,0,0,'WorkflowTransition',NULL,NULL),(191,2,4,1,6,0,0,'WorkflowTransition',NULL,NULL),(192,2,4,2,6,0,0,'WorkflowTransition',NULL,NULL),(193,2,4,3,6,0,0,'WorkflowTransition',NULL,NULL),(194,2,4,5,6,0,0,'WorkflowTransition',NULL,NULL),(195,2,4,6,6,0,0,'WorkflowTransition',NULL,NULL),(196,2,5,1,6,0,0,'WorkflowTransition',NULL,NULL),(197,2,5,2,6,0,0,'WorkflowTransition',NULL,NULL),(198,2,5,3,6,0,0,'WorkflowTransition',NULL,NULL),(199,2,5,4,6,0,0,'WorkflowTransition',NULL,NULL),(200,2,5,6,6,0,0,'WorkflowTransition',NULL,NULL),(201,2,6,1,6,0,0,'WorkflowTransition',NULL,NULL),(202,2,6,2,6,0,0,'WorkflowTransition',NULL,NULL),(203,2,6,3,6,0,0,'WorkflowTransition',NULL,NULL),(204,2,6,4,6,0,0,'WorkflowTransition',NULL,NULL),(205,2,6,5,6,0,0,'WorkflowTransition',NULL,NULL),(207,3,1,2,6,0,0,'WorkflowTransition',NULL,NULL),(208,3,1,3,6,0,0,'WorkflowTransition',NULL,NULL),(209,3,1,4,6,0,0,'WorkflowTransition',NULL,NULL),(210,3,1,5,6,0,0,'WorkflowTransition',NULL,NULL),(211,3,1,6,6,0,0,'WorkflowTransition',NULL,NULL),(212,3,2,1,6,0,0,'WorkflowTransition',NULL,NULL),(213,3,2,3,6,0,0,'WorkflowTransition',NULL,NULL),(214,3,2,4,6,0,0,'WorkflowTransition',NULL,NULL),(215,3,2,5,6,0,0,'WorkflowTransition',NULL,NULL),(216,3,2,6,6,0,0,'WorkflowTransition',NULL,NULL),(217,3,3,1,6,0,0,'WorkflowTransition',NULL,NULL),(218,3,3,2,6,0,0,'WorkflowTransition',NULL,NULL),(219,3,3,4,6,0,0,'WorkflowTransition',NULL,NULL),(220,3,3,5,6,0,0,'WorkflowTransition',NULL,NULL),(221,3,3,6,6,0,0,'WorkflowTransition',NULL,NULL),(222,3,4,1,6,0,0,'WorkflowTransition',NULL,NULL),(223,3,4,2,6,0,0,'WorkflowTransition',NULL,NULL),(224,3,4,3,6,0,0,'WorkflowTransition',NULL,NULL),(225,3,4,5,6,0,0,'WorkflowTransition',NULL,NULL),(226,3,4,6,6,0,0,'WorkflowTransition',NULL,NULL),(227,3,5,1,6,0,0,'WorkflowTransition',NULL,NULL),(228,3,5,2,6,0,0,'WorkflowTransition',NULL,NULL),(229,3,5,3,6,0,0,'WorkflowTransition',NULL,NULL),(230,3,5,4,6,0,0,'WorkflowTransition',NULL,NULL),(231,3,5,6,6,0,0,'WorkflowTransition',NULL,NULL),(232,3,6,1,6,0,0,'WorkflowTransition',NULL,NULL),(233,3,6,2,6,0,0,'WorkflowTransition',NULL,NULL),(234,3,6,3,6,0,0,'WorkflowTransition',NULL,NULL),(235,3,6,4,6,0,0,'WorkflowTransition',NULL,NULL),(236,3,6,5,6,0,0,'WorkflowTransition',NULL,NULL);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-08 21:28:36
