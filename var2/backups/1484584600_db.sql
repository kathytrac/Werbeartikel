-- Magento DB backup
--
-- Host: localhost    Database: werbear4_mage384
-- ------------------------------------------------------
-- Server version: 5.6.28-76.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mgk3_admin_passwords`
--

DROP TABLE IF EXISTS `mgk3_admin_passwords`;
CREATE TABLE `mgk3_admin_passwords` (
  `password_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Password Id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User Id',
  `password_hash` varchar(100) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Expires',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `MGK3_ADMIN_PASSWORDS_USER_ID` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Passwords';

--
-- Dumping data for table `mgk3_admin_passwords`
--

LOCK TABLES `mgk3_admin_passwords` WRITE;
/*!40000 ALTER TABLE `mgk3_admin_passwords` DISABLE KEYS */;
INSERT INTO `mgk3_admin_passwords` VALUES ('1','2','189af4759d9bca20f51fdeffdd6a59c3d7c3f518dac4d47b20e876323902096d:bZMyKGHnrmFpviC0szULpItb1s41rgMr:1','1492224941','1484448941');
/*!40000 ALTER TABLE `mgk3_admin_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_admin_system_messages`
--

DROP TABLE IF EXISTS `mgk3_admin_system_messages`;
CREATE TABLE `mgk3_admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin System Messages';

--
-- Dumping data for table `mgk3_admin_system_messages`
--

LOCK TABLES `mgk3_admin_system_messages` WRITE;
/*!40000 ALTER TABLE `mgk3_admin_system_messages` DISABLE KEYS */;
INSERT INTO `mgk3_admin_system_messages` VALUES ('da332d712f3215b9b94bfa268c398323',2,'2017-01-15 02:39:03');
/*!40000 ALTER TABLE `mgk3_admin_system_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_admin_user`
--

DROP TABLE IF EXISTS `mgk3_admin_user`;
CREATE TABLE `mgk3_admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `MGK3_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Admin User Table';

--
-- Dumping data for table `mgk3_admin_user`
--

LOCK TABLES `mgk3_admin_user` WRITE;
/*!40000 ALTER TABLE `mgk3_admin_user` DISABLE KEYS */;
INSERT INTO `mgk3_admin_user` VALUES ('1','System','Administrator','admin@werbeartikel-werbegeschenke-online.de','admin','a1f26e1d2d03bfcb0c286a5c32efa5c3','2017-01-14 22:44:05','2017-01-15 02:40:29',NULL,0,0,1,'N;',NULL,NULL,'en_US',2,'2017-01-15 02:31:18',NULL),('2','admin','admin','admin234@werbeartikel-werbegeschenke-online.de','admin123','189af4759d9bca20f51fdeffdd6a59c3d7c3f518dac4d47b20e876323902096d:bZMyKGHnrmFpviC0szULpItb1s41rgMr:1','2017-01-15 02:38:46','2017-01-16 16:18:59','2017-01-16 16:18:59',8,0,1,'N;',NULL,NULL,'de_DE',0,NULL,NULL);
/*!40000 ALTER TABLE `mgk3_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_admin_user_session`
--

DROP TABLE IF EXISTS `mgk3_admin_user_session`;
CREATE TABLE `mgk3_admin_user_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `session_id` varchar(128) NOT NULL COMMENT 'Session id value',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `MGK3_ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `MGK3_ADMIN_USER_SESSION_USER_ID` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Admin User sessions table';

--
-- Dumping data for table `mgk3_admin_user_session`
--

LOCK TABLES `mgk3_admin_user_session` WRITE;
/*!40000 ALTER TABLE `mgk3_admin_user_session` DISABLE KEYS */;
INSERT INTO `mgk3_admin_user_session` VALUES ('1','jav2pgbal49se3fso9bel8vmb7','2',2,'2017-01-15 02:39:02','2017-01-15 02:52:02','82.118.224.42'),('2','ptq4k166flethcjlk8ifqj2ki5','2',1,'2017-01-15 02:52:02','2017-01-15 03:02:57','178.4.216.83'),('3','78egmi03lcj134pq52mhnmp712','2',1,'2017-01-15 23:25:39','2017-01-15 23:38:11','88.69.129.229'),('4','9g1434i30qu20egvie8bir7ot2','2',1,'2017-01-16 08:33:11','2017-01-16 08:33:12','178.4.28.76'),('5','kij2pcneki1tika0d9683gedj2','2',1,'2017-01-16 14:20:59','2017-01-16 14:26:27','178.4.28.76'),('6','hrki7t5v0qrj1joo00c2ssrfi2','2',1,'2017-01-16 14:42:37','2017-01-16 14:43:07','178.4.28.76'),('7','m25nloj47i6slrt6ujsi827d91','2',1,'2017-01-16 15:10:06','2017-01-16 15:10:19','178.4.28.76'),('8','fnsturvcq87on9p5pb5kpu0sd7','2',1,'2017-01-16 16:18:59','2017-01-16 16:19:47','178.4.28.76');
/*!40000 ALTER TABLE `mgk3_admin_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_adminnotification_inbox`
--

DROP TABLE IF EXISTS `mgk3_adminnotification_inbox`;
CREATE TABLE `mgk3_adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `MGK3_ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `MGK3_ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `MGK3_ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';

--
-- Table structure for table `mgk3_authorization_role`
--

DROP TABLE IF EXISTS `mgk3_authorization_role`;
CREATE TABLE `mgk3_authorization_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `MGK3_AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `MGK3_AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';

--
-- Dumping data for table `mgk3_authorization_role`
--

LOCK TABLES `mgk3_authorization_role` WRITE;
/*!40000 ALTER TABLE `mgk3_authorization_role` DISABLE KEYS */;
INSERT INTO `mgk3_authorization_role` VALUES ('1','0',1,1,'G','0','2','Administrators'),('2','1',2,0,'U','1','2','System'),('3','1',2,0,'U','2','2','admin123');
/*!40000 ALTER TABLE `mgk3_authorization_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_authorization_rule`
--

DROP TABLE IF EXISTS `mgk3_authorization_rule`;
CREATE TABLE `mgk3_authorization_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `MGK3_AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `MGK3_AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';

--
-- Dumping data for table `mgk3_authorization_rule`
--

LOCK TABLES `mgk3_authorization_rule` WRITE;
/*!40000 ALTER TABLE `mgk3_authorization_rule` DISABLE KEYS */;
INSERT INTO `mgk3_authorization_rule` VALUES ('1','1','Magento_Backend::all',NULL,'allow');
/*!40000 ALTER TABLE `mgk3_authorization_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_aw_rbslider_banner`
--

DROP TABLE IF EXISTS `mgk3_aw_rbslider_banner`;
CREATE TABLE `mgk3_aw_rbslider_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` text NOT NULL COMMENT 'Name',
  `status` smallint(6) NOT NULL COMMENT 'Status',
  `page_type` smallint(6) NOT NULL COMMENT 'Type',
  `position` int(11) NOT NULL COMMENT 'Position',
  `product_condition` text NOT NULL COMMENT 'Product Condition',
  `category_ids` text NOT NULL COMMENT 'Category IDs',
  `animation_effect` smallint(6) NOT NULL COMMENT 'Animation Effect',
  `pause_time_between_transitions` int(11) NOT NULL COMMENT 'Pause Time Between Transitions',
  `slide_transition_speed` int(11) NOT NULL COMMENT 'Slide Transition Speed',
  `is_stop_animation_mouse_on_banner` int(11) NOT NULL COMMENT 'Stop Animation While Mouse is on the Banner',
  `display_arrows` int(11) NOT NULL COMMENT 'Display Arrows',
  `display_bullets` int(11) NOT NULL COMMENT 'Display Navigation Bullets',
  `is_random_order_image` int(11) NOT NULL COMMENT 'Display Images in Random Order',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='mgk3_aw_rbslider_banner';

--
-- Dumping data for table `mgk3_aw_rbslider_banner`
--

LOCK TABLES `mgk3_aw_rbslider_banner` WRITE;
/*!40000 ALTER TABLE `mgk3_aw_rbslider_banner` DISABLE KEYS */;
INSERT INTO `mgk3_aw_rbslider_banner` VALUES ('1','Sample Banner',1,1,'3','','',1,'3000','500','1','1','1','0');
/*!40000 ALTER TABLE `mgk3_aw_rbslider_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_aw_rbslider_slide`
--

DROP TABLE IF EXISTS `mgk3_aw_rbslider_slide`;
CREATE TABLE `mgk3_aw_rbslider_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` text NOT NULL COMMENT 'Name',
  `status` smallint(6) NOT NULL COMMENT 'Status',
  `display_from` datetime DEFAULT NULL COMMENT 'Display From',
  `display_to` datetime DEFAULT NULL COMMENT 'Display To',
  `img_type` smallint(6) NOT NULL COMMENT 'Image Type',
  `img_file` text NOT NULL COMMENT 'Image File',
  `img_url` text NOT NULL COMMENT 'Image to URL',
  `img_title` text NOT NULL COMMENT 'Image Title',
  `img_alt` text NOT NULL COMMENT 'Image Alt',
  `url` text NOT NULL COMMENT 'URL',
  `is_open_url_in_new_window` smallint(6) NOT NULL COMMENT 'Open URL in New Window',
  `is_add_nofollow_to_url` smallint(6) NOT NULL COMMENT 'Add No follow to URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mgk3_aw_rbslider_slide';

--
-- Table structure for table `mgk3_aw_rbslider_slide_banner`
--

DROP TABLE IF EXISTS `mgk3_aw_rbslider_slide_banner`;
CREATE TABLE `mgk3_aw_rbslider_slide_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `slide_id` int(10) unsigned NOT NULL COMMENT 'Slide ID',
  `banner_id` int(10) unsigned NOT NULL COMMENT 'Banner ID',
  `position` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Slide Position',
  PRIMARY KEY (`id`),
  KEY `MGK3_AW_RBSLIDER_SLIDE_BANNER_SLIDE_ID_AW_RBSLIDER_SLIDE_ID` (`slide_id`),
  KEY `MGK3_AW_RBSLIDER_SLIDE_BANNER_BANNER_ID_AW_RBSLIDER_BANNER_ID` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Slide To Banner Linkage Table';

--
-- Table structure for table `mgk3_aw_rbslider_slide_customer_group`
--

DROP TABLE IF EXISTS `mgk3_aw_rbslider_slide_customer_group`;
CREATE TABLE `mgk3_aw_rbslider_slide_customer_group` (
  `slide_id` int(10) unsigned NOT NULL COMMENT 'Rule ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  KEY `MGK3_AW_RBSLIDER_SLIDE_CUSTOMER_GROUP_SLIDE_ID` (`slide_id`),
  KEY `MGK3_AW_RBSLIDER_SLIDE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='AW Rbslider Slide To Customer Group Relation Table';

--
-- Table structure for table `mgk3_aw_rbslider_slide_store`
--

DROP TABLE IF EXISTS `mgk3_aw_rbslider_slide_store`;
CREATE TABLE `mgk3_aw_rbslider_slide_store` (
  `slide_id` int(10) unsigned NOT NULL COMMENT 'Slide ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  KEY `MGK3_AW_RBSLIDER_SLIDE_STORE_SLIDE_ID` (`store_id`),
  KEY `MGK3_AW_RBSLIDER_SLIDE_STORE_SLIDE_ID_AW_RBSLIDER_SLIDE_ID` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='AW Rbslider Slide To Store Relation Table';

--
-- Table structure for table `mgk3_aw_rbslider_statistic`
--

DROP TABLE IF EXISTS `mgk3_aw_rbslider_statistic`;
CREATE TABLE `mgk3_aw_rbslider_statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `slide_banner_id` int(10) unsigned NOT NULL COMMENT 'Slide Banner ID',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'View Count',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Click Count',
  PRIMARY KEY (`id`),
  KEY `FK_4FE2488DD1C9DD98297B72FFA103FBAE` (`slide_banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mgk3_aw_rbslider_statistic';

--
-- Table structure for table `mgk3_cache`
--

DROP TABLE IF EXISTS `mgk3_cache`;
CREATE TABLE `mgk3_cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `MGK3_CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';

--
-- Table structure for table `mgk3_cache_tag`
--

DROP TABLE IF EXISTS `mgk3_cache_tag`;
CREATE TABLE `mgk3_cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `MGK3_CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';

--
-- Table structure for table `mgk3_captcha_log`
--

DROP TABLE IF EXISTS `mgk3_captcha_log`;
CREATE TABLE `mgk3_captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';

--
-- Table structure for table `mgk3_catalog_category_entity`
--

DROP TABLE IF EXISTS `mgk3_catalog_category_entity`;
CREATE TABLE `mgk3_catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attriute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_LEVEL` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';

--
-- Dumping data for table `mgk3_catalog_category_entity`
--

LOCK TABLES `mgk3_catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `mgk3_catalog_category_entity` DISABLE KEYS */;
INSERT INTO `mgk3_catalog_category_entity` VALUES ('1',3,'0','2017-01-14 22:44:05','2017-01-14 22:44:05','1','0','0','1'),('2',3,'1','2017-01-14 22:44:05','2017-01-14 22:44:05','1/2','1','1','0');
/*!40000 ALTER TABLE `mgk3_catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `mgk3_catalog_category_entity_datetime`;
CREATE TABLE `mgk3_catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_CTGR_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `mgk3_catalog_category_entity_decimal`;
CREATE TABLE `mgk3_catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_CTGR_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_category_entity_int`
--

DROP TABLE IF EXISTS `mgk3_catalog_category_entity_int`;
CREATE TABLE `mgk3_catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';

--
-- Dumping data for table `mgk3_catalog_category_entity_int`
--

LOCK TABLES `mgk3_catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `mgk3_catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `mgk3_catalog_category_entity_int` VALUES ('1',69,0,'1','1'),('2',46,0,'2','1'),('3',69,0,'2','1');
/*!40000 ALTER TABLE `mgk3_catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_catalog_category_entity_text`
--

DROP TABLE IF EXISTS `mgk3_catalog_category_entity_text`;
CREATE TABLE `mgk3_catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_CTGR_ENTT_TEXT_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `mgk3_catalog_category_entity_varchar`;
CREATE TABLE `mgk3_catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_CTGR_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';

--
-- Dumping data for table `mgk3_catalog_category_entity_varchar`
--

LOCK TABLES `mgk3_catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `mgk3_catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `mgk3_catalog_category_entity_varchar` VALUES ('1',45,0,'1','Root Catalog'),('2',45,0,'2','Default Category'),('3',52,0,'2','PRODUCTS');
/*!40000 ALTER TABLE `mgk3_catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_catalog_category_product`
--

DROP TABLE IF EXISTS `mgk3_catalog_category_product`;
CREATE TABLE `mgk3_catalog_category_product` (
  `entity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `MGK3_CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `MGK3_CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';

--
-- Table structure for table `mgk3_catalog_category_product_index`
--

DROP TABLE IF EXISTS `mgk3_catalog_category_product_index`;
CREATE TABLE `mgk3_catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `MGK3_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_BB4A590114301ED9D94C8239D3EF6DA8` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';

--
-- Table structure for table `mgk3_catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_category_product_index_tmp`;
CREATE TABLE `mgk3_catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  KEY `MGK3_CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Temp Table';

--
-- Table structure for table `mgk3_catalog_compare_item`
--

DROP TABLE IF EXISTS `mgk3_catalog_compare_item`;
CREATE TABLE `mgk3_catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `MGK3_CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `MGK3_CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `MGK3_CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `MGK3_CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';

--
-- Table structure for table `mgk3_catalog_eav_attribute`
--

DROP TABLE IF EXISTS `mgk3_catalog_eav_attribute`;
CREATE TABLE `mgk3_catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT '1' COMMENT 'Search Weight',
  `additional_data` text COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `MGK3_CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `MGK3_CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';

--
-- Dumping data for table `mgk3_catalog_eav_attribute`
--

LOCK TABLES `mgk3_catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `mgk3_catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `mgk3_catalog_eav_attribute` VALUES (45,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(46,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(47,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,'0',1,0,0,0,0,0,'1',NULL),(48,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(49,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(50,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(51,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(52,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(53,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(54,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(55,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(56,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(57,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(58,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(59,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(60,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(61,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(62,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(63,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(64,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(65,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(66,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(67,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available',0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(68,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby',0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(69,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(70,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(71,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(72,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep',0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(73,NULL,0,1,1,0,0,0,0,0,0,1,1,NULL,1,'0',0,0,0,0,0,0,'5',NULL),(74,NULL,1,1,1,0,1,0,0,0,0,0,0,NULL,1,'0',0,0,0,0,0,0,'6',NULL),(75,NULL,0,1,1,0,1,0,1,0,0,0,0,NULL,1,'0',1,0,0,0,0,0,'1',NULL),(76,NULL,0,1,1,0,1,0,1,0,0,1,0,NULL,1,'0',1,0,0,1,0,0,'1',NULL),(77,NULL,1,1,1,1,0,0,0,0,0,1,1,'simple,virtual,bundle,downloadable,configurable',1,'0',0,0,0,0,0,0,'1',NULL),(78,NULL,1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,'0',0,0,0,1,0,1,'1',NULL),(79,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,'0',0,0,0,1,0,0,'1',NULL),(80,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,'0',0,0,0,1,0,0,'1',NULL),(81,NULL,1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable',0,'0',0,0,0,1,0,1,'1',NULL),(82,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight',1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,'0',0,0,0,1,0,1,'1',NULL),(83,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple',1,'0',0,0,0,1,0,1,'1',NULL),(84,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,1,0,1,'1',NULL),(85,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,1,0,1,'1',NULL),(86,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,1,0,1,'1',NULL),(87,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(88,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(89,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(90,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(91,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(92,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,'0',0,0,0,0,0,0,'1',NULL),(93,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,virtual,configurable',1,'0',0,0,0,1,0,1,'1',NULL),(94,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,1,0,0,'1',NULL),(95,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,1,0,0,'1',NULL),(96,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(97,'Magento\\Framework\\Data\\Form\\Element\\Hidden',2,1,1,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,1,0,0,0,'1',NULL),(98,NULL,0,0,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,'0',0,0,0,0,0,0,'1',NULL),(99,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,1,0,0,0,'1',NULL),(100,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,1,0,1,'1',NULL),(101,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,1,0,0,'1',NULL),(102,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,1,0,0,'1',NULL),(103,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(104,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,1,0,0,'1',NULL),(105,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category',1,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(106,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(107,NULL,1,0,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(108,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(109,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(110,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(111,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(112,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(113,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(114,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,bundle,grouped,configurable',0,'0',0,0,0,1,0,1,'1',NULL),(115,'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock',1,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(116,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,1,0,0,'1',NULL),(117,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(118,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(119,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,1,0,1,'1',NULL),(120,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(121,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type',1,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,'0',0,0,0,1,0,1,'1',NULL),(122,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price',2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,'0',0,0,0,0,0,0,'1',NULL),(123,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,'0',0,0,0,0,0,0,'1',NULL),(124,NULL,1,1,0,0,0,0,0,0,0,0,0,'bundle',0,'0',0,0,0,0,0,0,'1',NULL),(125,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,'0',0,0,0,0,0,0,'1',NULL),(126,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,'0',0,0,0,0,0,0,'1',NULL),(127,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,'0',0,0,0,0,0,0,'1',NULL),(128,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,'0',0,0,0,0,0,0,'1',NULL),(129,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,'0',0,0,0,0,0,0,'1',NULL),(130,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,'0',0,0,0,0,0,0,'1',NULL),(131,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,'0',0,0,0,0,0,0,'1',NULL),(132,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,'0',0,0,0,0,0,0,'1',NULL),(133,NULL,2,1,1,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,'0',0,0,0,1,0,1,'1',NULL),(134,'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config',1,1,0,0,0,0,0,0,0,0,0,NULL,0,'0',0,0,0,1,0,0,'1',NULL);
/*!40000 ALTER TABLE `mgk3_catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_bundle_option`;
CREATE TABLE `mgk3_catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `MGK3_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';

--
-- Table structure for table `mgk3_catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_bundle_option_value`;
CREATE TABLE `mgk3_catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION_ID_STORE_ID` (`option_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';

--
-- Table structure for table `mgk3_catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_bundle_price_index`;
CREATE TABLE `mgk3_catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `MGK3_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';

--
-- Table structure for table `mgk3_catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_bundle_selection`;
CREATE TABLE `mgk3_catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `MGK3_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `MGK3_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';

--
-- Table structure for table `mgk3_catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_bundle_selection_price`;
CREATE TABLE `mgk3_catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  PRIMARY KEY (`selection_id`,`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';

--
-- Table structure for table `mgk3_catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_bundle_stock_index`;
CREATE TABLE `mgk3_catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';

--
-- Table structure for table `mgk3_catalog_product_entity`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity`;
CREATE TABLE `mgk3_catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_SKU` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';

--
-- Table structure for table `mgk3_catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_datetime`;
CREATE TABLE `mgk3_catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_PRD_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_decimal`;
CREATE TABLE `mgk3_catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_PRD_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_gallery`;
CREATE TABLE `mgk3_catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_PRD_ENTT_GLR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_product_entity_int`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_int`;
CREATE TABLE `mgk3_catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_media_gallery`;
CREATE TABLE `mgk3_catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_media_gallery_value`;
CREATE TABLE `mgk3_catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Record Id',
  PRIMARY KEY (`record_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';

--
-- Table structure for table `mgk3_catalog_product_entity_media_gallery_value_to_entity`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_media_gallery_value_to_entity`;
CREATE TABLE `mgk3_catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Product entity ID',
  UNIQUE KEY `MGK3_CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID` (`value_id`,`entity_id`),
  KEY `FK_068726AEB52B9FA2F28A3CD95CE3BC3F` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Media value to Product entity table';

--
-- Table structure for table `mgk3_catalog_product_entity_media_gallery_value_video`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_media_gallery_value_video`;
CREATE TABLE `mgk3_catalog_product_entity_media_gallery_value_video` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Page Meta Description',
  `metadata` text COMMENT 'Video meta data',
  UNIQUE KEY `MGK3_CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_VAL_ID_STORE_ID` (`value_id`,`store_id`),
  KEY `MGK3_CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_MGK3_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Video Table';

--
-- Table structure for table `mgk3_catalog_product_entity_text`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_text`;
CREATE TABLE `mgk3_catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_tier_price`;
CREATE TABLE `mgk3_catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_6D3040166530765494A77D7288801D79` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_entity_varchar`;
CREATE TABLE `mgk3_catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_PRD_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';

--
-- Table structure for table `mgk3_catalog_product_index_eav`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_eav`;
CREATE TABLE `mgk3_catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_eav_decimal`;
CREATE TABLE `mgk3_catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_eav_decimal_idx`;
CREATE TABLE `mgk3_catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_eav_decimal_tmp`;
CREATE TABLE `mgk3_catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';

--
-- Table structure for table `mgk3_catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_eav_idx`;
CREATE TABLE `mgk3_catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_eav_tmp`;
CREATE TABLE `mgk3_catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';

--
-- Table structure for table `mgk3_catalog_product_index_price`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price`;
CREATE TABLE `mgk3_catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `MGK3_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_bundle_idx`;
CREATE TABLE `mgk3_catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';

--
-- Table structure for table `mgk3_catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_bundle_opt_idx`;
CREATE TABLE `mgk3_catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';

--
-- Table structure for table `mgk3_catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_bundle_opt_tmp`;
CREATE TABLE `mgk3_catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';

--
-- Table structure for table `mgk3_catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_bundle_sel_idx`;
CREATE TABLE `mgk3_catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';

--
-- Table structure for table `mgk3_catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_bundle_sel_tmp`;
CREATE TABLE `mgk3_catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';

--
-- Table structure for table `mgk3_catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_bundle_tmp`;
CREATE TABLE `mgk3_catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';

--
-- Table structure for table `mgk3_catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_cfg_opt_agr_idx`;
CREATE TABLE `mgk3_catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_cfg_opt_agr_tmp`;
CREATE TABLE `mgk3_catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_cfg_opt_idx`;
CREATE TABLE `mgk3_catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_cfg_opt_tmp`;
CREATE TABLE `mgk3_catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_downlod_idx`;
CREATE TABLE `mgk3_catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';

--
-- Table structure for table `mgk3_catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_downlod_tmp`;
CREATE TABLE `mgk3_catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';

--
-- Table structure for table `mgk3_catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_final_idx`;
CREATE TABLE `mgk3_catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_final_tmp`;
CREATE TABLE `mgk3_catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_idx`;
CREATE TABLE `mgk3_catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_opt_agr_idx`;
CREATE TABLE `mgk3_catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_opt_agr_tmp`;
CREATE TABLE `mgk3_catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_opt_idx`;
CREATE TABLE `mgk3_catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_opt_tmp`;
CREATE TABLE `mgk3_catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';

--
-- Table structure for table `mgk3_catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_price_tmp`;
CREATE TABLE `mgk3_catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';

--
-- Table structure for table `mgk3_catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_tier_price`;
CREATE TABLE `mgk3_catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';

--
-- Table structure for table `mgk3_catalog_product_index_website`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_index_website`;
CREATE TABLE `mgk3_catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';

--
-- Table structure for table `mgk3_catalog_product_link`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_link`;
CREATE TABLE `mgk3_catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `MGK3_CAT_PRD_LNK_LNK_TYPE_ID_PRD_ID_LNKED_PRD_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `MGK3_CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `MGK3_CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';

--
-- Table structure for table `mgk3_catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_link_attribute`;
CREATE TABLE `mgk3_catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `MGK3_CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';

--
-- Dumping data for table `mgk3_catalog_product_link_attribute`
--

LOCK TABLES `mgk3_catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `mgk3_catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `mgk3_catalog_product_link_attribute` VALUES (1,1,'position','int'),(2,4,'position','int'),(3,5,'position','int'),(4,3,'position','int'),(5,3,'qty','decimal');
/*!40000 ALTER TABLE `mgk3_catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_link_attribute_decimal`;
CREATE TABLE `mgk3_catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `MGK3_CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';

--
-- Table structure for table `mgk3_catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_link_attribute_int`;
CREATE TABLE `mgk3_catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `MGK3_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';

--
-- Table structure for table `mgk3_catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_link_attribute_varchar`;
CREATE TABLE `mgk3_catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `MGK3_CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';

--
-- Table structure for table `mgk3_catalog_product_link_type`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_link_type`;
CREATE TABLE `mgk3_catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';

--
-- Dumping data for table `mgk3_catalog_product_link_type`
--

LOCK TABLES `mgk3_catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `mgk3_catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `mgk3_catalog_product_link_type` VALUES (1,'relation'),(3,'super'),(4,'up_sell'),(5,'cross_sell');
/*!40000 ALTER TABLE `mgk3_catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_catalog_product_option`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_option`;
CREATE TABLE `mgk3_catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `MGK3_CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';

--
-- Table structure for table `mgk3_catalog_product_option_price`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_option_price`;
CREATE TABLE `mgk3_catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `MGK3_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';

--
-- Table structure for table `mgk3_catalog_product_option_title`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_option_title`;
CREATE TABLE `mgk3_catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `MGK3_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';

--
-- Table structure for table `mgk3_catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_option_type_price`;
CREATE TABLE `mgk3_catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `MGK3_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';

--
-- Table structure for table `mgk3_catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_option_type_title`;
CREATE TABLE `mgk3_catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `MGK3_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';

--
-- Table structure for table `mgk3_catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_option_type_value`;
CREATE TABLE `mgk3_catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `MGK3_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';

--
-- Table structure for table `mgk3_catalog_product_relation`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_relation`;
CREATE TABLE `mgk3_catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `MGK3_CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';

--
-- Table structure for table `mgk3_catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_super_attribute`;
CREATE TABLE `mgk3_catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `MGK3_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';

--
-- Table structure for table `mgk3_catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_super_attribute_label`;
CREATE TABLE `mgk3_catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `MGK3_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';

--
-- Table structure for table `mgk3_catalog_product_super_link`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_super_link`;
CREATE TABLE `mgk3_catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `MGK3_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `MGK3_CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';

--
-- Table structure for table `mgk3_catalog_product_website`
--

DROP TABLE IF EXISTS `mgk3_catalog_product_website`;
CREATE TABLE `mgk3_catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `MGK3_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';

--
-- Table structure for table `mgk3_catalog_url_rewrite_product_category`
--

DROP TABLE IF EXISTS `mgk3_catalog_url_rewrite_product_category`;
CREATE TABLE `mgk3_catalog_url_rewrite_product_category` (
  `url_rewrite_id` int(10) unsigned NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int(10) unsigned NOT NULL COMMENT 'category_id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'product_id',
  KEY `MGK3_CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `MGK3_CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  KEY `FK_7B9CE1EAB660AB093EC13F021BA68955` (`url_rewrite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url_rewrite_relation';

--
-- Table structure for table `mgk3_cataloginventory_stock`
--

DROP TABLE IF EXISTS `mgk3_cataloginventory_stock`;
CREATE TABLE `mgk3_cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `MGK3_CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';

--
-- Dumping data for table `mgk3_cataloginventory_stock`
--

LOCK TABLES `mgk3_cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `mgk3_cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `mgk3_cataloginventory_stock` VALUES (1,0,'Default');
/*!40000 ALTER TABLE `mgk3_cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `mgk3_cataloginventory_stock_item`;
CREATE TABLE `mgk3_cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `MGK3_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_WEBSITE_ID` (`product_id`,`website_id`),
  KEY `MGK3_CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `MGK3_CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';

--
-- Table structure for table `mgk3_cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `mgk3_cataloginventory_stock_status`;
CREATE TABLE `mgk3_cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `MGK3_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `MGK3_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';

--
-- Table structure for table `mgk3_cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `mgk3_cataloginventory_stock_status_idx`;
CREATE TABLE `mgk3_cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `MGK3_CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `MGK3_CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';

--
-- Table structure for table `mgk3_cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `mgk3_cataloginventory_stock_status_tmp`;
CREATE TABLE `mgk3_cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `MGK3_CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `MGK3_CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';

--
-- Table structure for table `mgk3_catalogrule`
--

DROP TABLE IF EXISTS `mgk3_catalogrule`;
CREATE TABLE `mgk3_catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  PRIMARY KEY (`rule_id`),
  KEY `MGK3_CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';

--
-- Table structure for table `mgk3_catalogrule_customer_group`
--

DROP TABLE IF EXISTS `mgk3_catalogrule_customer_group`;
CREATE TABLE `mgk3_catalogrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `MGK3_CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';

--
-- Table structure for table `mgk3_catalogrule_group_website`
--

DROP TABLE IF EXISTS `mgk3_catalogrule_group_website`;
CREATE TABLE `mgk3_catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `MGK3_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MGK3_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';

--
-- Table structure for table `mgk3_catalogrule_product`
--

DROP TABLE IF EXISTS `mgk3_catalogrule_product`;
CREATE TABLE `mgk3_catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `IDX_657F2C47A3462448AF8A19A447783F01` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `MGK3_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MGK3_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `MGK3_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `MGK3_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `MGK3_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';

--
-- Table structure for table `mgk3_catalogrule_product_price`
--

DROP TABLE IF EXISTS `mgk3_catalogrule_product_price`;
CREATE TABLE `mgk3_catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `MGK3_CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `MGK3_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MGK3_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `MGK3_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';

--
-- Table structure for table `mgk3_catalogrule_website`
--

DROP TABLE IF EXISTS `mgk3_catalogrule_website`;
CREATE TABLE `mgk3_catalogrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `MGK3_CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';

--
-- Table structure for table `mgk3_catalogsearch_fulltext_scope1`
--

DROP TABLE IF EXISTS `mgk3_catalogsearch_fulltext_scope1`;
CREATE TABLE `mgk3_catalogsearch_fulltext_scope1` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` int(10) unsigned NOT NULL COMMENT 'Attribute_id',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`entity_id`,`attribute_id`),
  FULLTEXT KEY `FTI_FULLTEXT_DATA_INDEX` (`data_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mgk3_catalogsearch_fulltext_scope1';

--
-- Table structure for table `mgk3_checkout_agreement`
--

DROP TABLE IF EXISTS `mgk3_checkout_agreement`;
CREATE TABLE `mgk3_checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  `mode` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Applied mode',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';

--
-- Table structure for table `mgk3_checkout_agreement_store`
--

DROP TABLE IF EXISTS `mgk3_checkout_agreement_store`;
CREATE TABLE `mgk3_checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `MGK3_CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';

--
-- Table structure for table `mgk3_cms_block`
--

DROP TABLE IF EXISTS `mgk3_cms_block`;
CREATE TABLE `mgk3_cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Block Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`),
  FULLTEXT KEY `MGK3_CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';

--
-- Table structure for table `mgk3_cms_block_store`
--

DROP TABLE IF EXISTS `mgk3_cms_block_store`;
CREATE TABLE `mgk3_cms_block_store` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `MGK3_CMS_BLOCK_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';

--
-- Table structure for table `mgk3_cms_page`
--

DROP TABLE IF EXISTS `mgk3_cms_page`;
CREATE TABLE `mgk3_cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Page Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Meta Title',
  PRIMARY KEY (`page_id`),
  KEY `MGK3_CMS_PAGE_IDENTIFIER` (`identifier`),
  FULLTEXT KEY `FTI_2B3F6DC425D914597AB7E76AC87078A1` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';

--
-- Dumping data for table `mgk3_cms_page`
--

LOCK TABLES `mgk3_cms_page` WRITE;
/*!40000 ALTER TABLE `mgk3_cms_page` DISABLE KEYS */;
INSERT INTO `mgk3_cms_page` VALUES (1,'404 Not Found','2columns-right','Page keywords','Page description','no-route','Whoops, our bad...','<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n','2017-01-14 22:44:05','2017-01-14 22:44:05',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Home page','1column',NULL,NULL,'home','Home Page','<p>CMS homepage content goes here.</p>\r\n','2017-01-14 22:44:05','2017-01-14 22:44:05',1,0,'<!--\n    <referenceContainer name=\"right\">\n        <action method=\"unsetChild\"><argument name=\"alias\" xsi:type=\"string\">right.reports.product.viewed</argument></action>\n        <action method=\"unsetChild\"><argument name=\"alias\" xsi:type=\"string\">right.reports.product.compared</argument></action>\n    </referenceContainer>-->',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Enable Cookies','1column',NULL,NULL,'enable-cookies','What are Cookies?','<div class=\"enable-cookies cms-content\">\r\n<p>\"Cookies\" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style=\"margin-bottom: 20px;\">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href=\"https://support.google.com/accounts/answer/61416?hl=en\" target=\"_blank\">Google Chrome</a></li>\r\n<li><a href=\"http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies\" target=\"_blank\">Internet Explorer</a></li>\r\n<li><a href=\"http://support.apple.com/kb/PH19214\" target=\"_blank\">Safari</a></li>\r\n<li><a href=\"https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences\" target=\"_blank\">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>','2017-01-14 22:44:05','2017-01-14 22:44:05',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Privacy and Cookie Policy','1column',NULL,NULL,'privacy-policy-cookie-restriction-mode','Privacy and Cookie Policy','<div class=\"privacy-policy cms-content\">\n    <div class=\"message info\">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter \"the Store\") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name=\"list\"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class=\"data-table data-table-definition-list\">\n        <thead>\n        <tr>\n            <th>Cookie Name</th>\n            <th>Cookie Description</th>\n        </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores randomly generated key used to prevent forged requests.</td>\n            </tr>\n            <tr>\n                <th>PHPSESSID</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to view and edit their orders.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history, if you have asked for this.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-SESSID</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE-SECTION-INVALIDATION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-TIMEOUT</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>SECTION-DATA-IDS</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>PRIVATE_CONTENT_VERSION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>X-MAGENTO-VARY</th>\n                <td>Facilitates caching of content on the server to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-FILE-VERSION</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-STORAGE</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>','2017-01-14 22:44:05','2017-01-14 22:44:05',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mgk3_cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_cms_page_store`
--

DROP TABLE IF EXISTS `mgk3_cms_page_store`;
CREATE TABLE `mgk3_cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `MGK3_CMS_PAGE_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';

--
-- Dumping data for table `mgk3_cms_page_store`
--

LOCK TABLES `mgk3_cms_page_store` WRITE;
/*!40000 ALTER TABLE `mgk3_cms_page_store` DISABLE KEYS */;
INSERT INTO `mgk3_cms_page_store` VALUES (1,0),(2,0),(3,0),(4,0);
/*!40000 ALTER TABLE `mgk3_cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_core_config_data`
--

DROP TABLE IF EXISTS `mgk3_core_config_data`;
CREATE TABLE `mgk3_core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `MGK3_CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Config Data';

--
-- Dumping data for table `mgk3_core_config_data`
--

LOCK TABLES `mgk3_core_config_data` WRITE;
/*!40000 ALTER TABLE `mgk3_core_config_data` DISABLE KEYS */;
INSERT INTO `mgk3_core_config_data` VALUES ('1','default','0','web/seo/use_rewrites','1'),('2','default','0','web/unsecure/base_url','http://werbeartikel-werbegeschenke-online.de/'),('3','default','0','web/secure/base_url','https://werbeartikel-werbegeschenke-online.de/'),('4','default','0','general/locale/code','en_US'),('5','default','0','web/secure/use_in_frontend',NULL),('6','default','0','web/secure/use_in_adminhtml',NULL),('7','default','0','general/locale/timezone','America/New_York'),('8','default','0','currency/options/base','USD'),('9','default','0','currency/options/default','USD'),('10','default','0','currency/options/allow','USD'),('11','default','0','general/region/display_all','1'),('12','default','0','general/region/state_required','AT,BR,CA,CH,EE,ES,FI,LT,LV,RO,US'),('13','default','0','catalog/category/root_id','2');
/*!40000 ALTER TABLE `mgk3_core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_cron_schedule`
--

DROP TABLE IF EXISTS `mgk3_cron_schedule`;
CREATE TABLE `mgk3_cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `MGK3_CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `MGK3_CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1524 DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';

--
-- Dumping data for table `mgk3_cron_schedule`
--

LOCK TABLES `mgk3_cron_schedule` WRITE;
/*!40000 ALTER TABLE `mgk3_cron_schedule` DISABLE KEYS */;
INSERT INTO `mgk3_cron_schedule` VALUES ('1171','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 01:36:02','2017-01-16 01:36:00',NULL,NULL),('1172','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 01:36:02','2017-01-16 01:36:00',NULL,NULL),('1173','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 01:50:02','2017-01-16 01:50:00',NULL,NULL),('1174','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 01:50:02','2017-01-16 01:50:00',NULL,NULL),('1190','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 02:13:01','2017-01-16 02:13:00',NULL,NULL),('1191','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 02:13:01','2017-01-16 02:13:00',NULL,NULL),('1192','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 02:26:01','2017-01-16 02:26:00',NULL,NULL),('1193','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 02:26:01','2017-01-16 02:26:00',NULL,NULL),('1207','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 02:36:02','2017-01-16 02:36:00',NULL,NULL),('1208','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 02:36:02','2017-01-16 02:36:00',NULL,NULL),('1209','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 02:50:01','2017-01-16 02:50:00',NULL,NULL),('1210','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 02:50:01','2017-01-16 02:50:00',NULL,NULL),('1225','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 03:13:02','2017-01-16 03:13:00',NULL,NULL),('1226','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 03:13:02','2017-01-16 03:13:00',NULL,NULL),('1227','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 03:26:02','2017-01-16 03:26:00',NULL,NULL),('1228','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 03:26:02','2017-01-16 03:26:00',NULL,NULL),('1242','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 03:36:01','2017-01-16 03:36:00',NULL,NULL),('1243','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 03:36:01','2017-01-16 03:36:00',NULL,NULL),('1244','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 03:50:02','2017-01-16 03:50:00',NULL,NULL),('1245','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 03:50:02','2017-01-16 03:50:00',NULL,NULL),('1260','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 04:13:02','2017-01-16 04:13:00',NULL,NULL),('1261','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 04:13:02','2017-01-16 04:13:00',NULL,NULL),('1262','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 04:26:02','2017-01-16 04:26:00',NULL,NULL),('1263','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 04:26:02','2017-01-16 04:26:00',NULL,NULL),('1277','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 04:36:02','2017-01-16 04:36:00',NULL,NULL),('1278','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 04:36:02','2017-01-16 04:36:00',NULL,NULL),('1279','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 04:50:02','2017-01-16 04:50:00',NULL,NULL),('1280','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 04:50:02','2017-01-16 04:50:00',NULL,NULL),('1295','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 05:13:01','2017-01-16 05:13:00',NULL,NULL),('1296','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 05:13:01','2017-01-16 05:13:00',NULL,NULL),('1297','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 05:26:02','2017-01-16 05:26:00',NULL,NULL),('1298','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 05:26:02','2017-01-16 05:26:00',NULL,NULL),('1312','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 05:36:01','2017-01-16 05:36:00',NULL,NULL),('1313','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 05:36:01','2017-01-16 05:36:00',NULL,NULL),('1314','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 05:50:01','2017-01-16 05:50:00',NULL,NULL),('1315','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 05:50:01','2017-01-16 05:50:00',NULL,NULL),('1330','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 06:13:01','2017-01-16 06:13:00',NULL,NULL),('1331','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 06:13:01','2017-01-16 06:13:00',NULL,NULL),('1332','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 06:26:02','2017-01-16 06:26:00',NULL,NULL),('1333','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 06:26:02','2017-01-16 06:26:00',NULL,NULL),('1347','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 06:36:02','2017-01-16 06:36:00',NULL,NULL),('1348','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 06:36:02','2017-01-16 06:36:00',NULL,NULL),('1349','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 06:50:02','2017-01-16 06:50:00',NULL,NULL),('1350','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 06:50:02','2017-01-16 06:50:00',NULL,NULL),('1365','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 07:13:01','2017-01-16 07:13:00',NULL,NULL),('1366','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 07:13:01','2017-01-16 07:13:00',NULL,NULL),('1367','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 07:26:02','2017-01-16 07:26:00',NULL,NULL),('1368','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 07:26:02','2017-01-16 07:26:00',NULL,NULL),('1382','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 07:36:02','2017-01-16 07:36:00',NULL,NULL),('1383','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 07:36:02','2017-01-16 07:36:00',NULL,NULL),('1384','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 07:50:02','2017-01-16 07:50:00',NULL,NULL),('1385','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 07:50:02','2017-01-16 07:50:00',NULL,NULL),('1400','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 08:13:02','2017-01-16 08:13:00',NULL,NULL),('1401','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 08:13:02','2017-01-16 08:13:00',NULL,NULL),('1402','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 08:26:02','2017-01-16 08:26:00',NULL,NULL),('1403','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 08:26:02','2017-01-16 08:26:00',NULL,NULL),('1417','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 08:36:02','2017-01-16 08:36:00',NULL,NULL),('1418','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 08:36:02','2017-01-16 08:36:00',NULL,NULL),('1419','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 08:50:02','2017-01-16 08:50:00',NULL,NULL),('1420','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 08:50:02','2017-01-16 08:50:00',NULL,NULL),('1435','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 09:13:01','2017-01-16 09:13:00',NULL,NULL),('1436','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 09:13:01','2017-01-16 09:13:00',NULL,NULL),('1437','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 09:26:03','2017-01-16 09:26:00',NULL,NULL),('1438','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 09:26:03','2017-01-16 09:26:00',NULL,NULL),('1452','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 09:36:01','2017-01-16 09:36:00',NULL,NULL),('1453','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 09:36:01','2017-01-16 09:36:00',NULL,NULL),('1454','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 09:50:01','2017-01-16 09:50:00',NULL,NULL),('1455','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 09:50:01','2017-01-16 09:50:00',NULL,NULL),('1466','captcha_delete_old_attempts','success',NULL,'2017-01-16 10:13:01','2017-01-16 10:30:00','2017-01-16 10:36:02','2017-01-16 10:36:02'),('1470','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 10:13:02','2017-01-16 10:13:00',NULL,NULL),('1471','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 10:13:02','2017-01-16 10:13:00',NULL,NULL),('1472','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 10:26:02','2017-01-16 10:26:00',NULL,NULL),('1473','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 10:26:02','2017-01-16 10:26:00',NULL,NULL),('1474','catalog_product_outdated_price_values_cleanup','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1475','sales_grid_order_async_insert','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1476','sales_grid_order_invoice_async_insert','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1477','sales_grid_order_shipment_async_insert','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1478','sales_grid_order_creditmemo_async_insert','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1479','sales_send_order_emails','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1480','sales_send_order_invoice_emails','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1481','sales_send_order_shipment_emails','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1482','sales_send_order_creditmemo_emails','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1483','newsletter_send_all','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:40:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1484','captcha_delete_expired_images','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:40:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1485','outdated_authentication_failures_cleanup','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1486','magento_newrelicreporting_cron','success',NULL,'2017-01-16 10:36:02','2017-01-16 10:36:00','2017-01-16 10:50:01','2017-01-16 10:50:01'),('1487','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 10:36:02','2017-01-16 10:36:00',NULL,NULL),('1488','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 10:36:02','2017-01-16 10:36:00',NULL,NULL),('1489','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 10:50:01','2017-01-16 10:50:00',NULL,NULL),('1490','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 10:50:01','2017-01-16 10:50:00',NULL,NULL),('1491','catalog_product_outdated_price_values_cleanup','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:13:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1492','sales_grid_order_async_insert','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:13:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1493','sales_grid_order_invoice_async_insert','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:13:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1494','sales_grid_order_shipment_async_insert','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:13:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1495','sales_grid_order_creditmemo_async_insert','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:13:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1496','sales_send_order_emails','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:13:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1497','sales_send_order_invoice_emails','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:13:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1498','sales_send_order_shipment_emails','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:13:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1499','sales_send_order_creditmemo_emails','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:13:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1500','newsletter_send_all','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:15:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1501','captcha_delete_old_attempts','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:30:00','2017-01-16 11:36:02','2017-01-16 11:36:02'),('1502','captcha_delete_expired_images','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:20:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1503','outdated_authentication_failures_cleanup','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:13:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1504','magento_newrelicreporting_cron','success',NULL,'2017-01-16 11:13:03','2017-01-16 11:14:00','2017-01-16 11:26:01','2017-01-16 11:26:01'),('1505','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 11:13:03','2017-01-16 11:13:00',NULL,NULL),('1506','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 11:13:03','2017-01-16 11:13:00',NULL,NULL),('1507','indexer_reindex_all_invalid','missed','Too late for the schedule','2017-01-16 11:26:02','2017-01-16 11:26:00',NULL,NULL),('1508','indexer_update_all_views','missed','Too late for the schedule','2017-01-16 11:26:02','2017-01-16 11:26:00',NULL,NULL),('1509','catalog_product_outdated_price_values_cleanup','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1510','sales_grid_order_async_insert','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1511','sales_grid_order_invoice_async_insert','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1512','sales_grid_order_shipment_async_insert','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1513','sales_grid_order_creditmemo_async_insert','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1514','sales_send_order_emails','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1515','sales_send_order_invoice_emails','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1516','sales_send_order_shipment_emails','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1517','sales_send_order_creditmemo_emails','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1518','newsletter_send_all','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:40:00',NULL,NULL),('1519','captcha_delete_expired_images','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:40:00',NULL,NULL),('1520','outdated_authentication_failures_cleanup','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1521','magento_newrelicreporting_cron','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1522','indexer_reindex_all_invalid','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL),('1523','indexer_update_all_views','pending',NULL,'2017-01-16 11:36:02','2017-01-16 11:36:00',NULL,NULL);
/*!40000 ALTER TABLE `mgk3_cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_customer_address_entity`
--

DROP TABLE IF EXISTS `mgk3_customer_address_entity`;
CREATE TABLE `mgk3_customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validation request success',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';

--
-- Table structure for table `mgk3_customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `mgk3_customer_address_entity_datetime`;
CREATE TABLE `mgk3_customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CSTR_ADDR_ENTT_DTIME_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';

--
-- Table structure for table `mgk3_customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `mgk3_customer_address_entity_decimal`;
CREATE TABLE `mgk3_customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CSTR_ADDR_ENTT_DEC_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';

--
-- Table structure for table `mgk3_customer_address_entity_int`
--

DROP TABLE IF EXISTS `mgk3_customer_address_entity_int`;
CREATE TABLE `mgk3_customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';

--
-- Table structure for table `mgk3_customer_address_entity_text`
--

DROP TABLE IF EXISTS `mgk3_customer_address_entity_text`;
CREATE TABLE `mgk3_customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';

--
-- Table structure for table `mgk3_customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `mgk3_customer_address_entity_varchar`;
CREATE TABLE `mgk3_customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MGK3_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CSTR_ADDR_ENTT_VCHR_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';

--
-- Table structure for table `mgk3_customer_eav_attribute`
--

DROP TABLE IF EXISTS `mgk3_customer_eav_attribute`;
CREATE TABLE `mgk3_customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable in Grid',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';

--
-- Dumping data for table `mgk3_customer_eav_attribute`
--

LOCK TABLES `mgk3_customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `mgk3_customer_eav_attribute` DISABLE KEYS */;
INSERT INTO `mgk3_customer_eav_attribute` VALUES (1,1,NULL,0,NULL,1,'10',NULL,1,1,1,0),(2,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(3,1,NULL,0,NULL,1,'20',NULL,1,1,0,1),(4,0,NULL,0,NULL,0,'30',NULL,0,0,0,0),(5,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,'40',NULL,0,0,0,0),(6,0,NULL,0,NULL,0,'50',NULL,0,0,0,0),(7,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,'60',NULL,0,0,0,0),(8,0,NULL,0,NULL,0,'70',NULL,0,0,0,0),(9,1,NULL,0,'a:1:{s:16:\"input_validation\";s:5:\"email\";}',1,'80',NULL,1,1,1,1),(10,1,NULL,0,NULL,1,'25',NULL,1,1,1,0),(11,0,'date',0,'a:1:{s:16:\"input_validation\";s:4:\"date\";}',0,'90',NULL,1,1,1,0),(12,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(13,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(14,0,NULL,0,'a:1:{s:16:\"input_validation\";s:4:\"date\";}',1,'0',NULL,0,0,0,0),(15,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(16,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(17,0,NULL,0,'a:1:{s:15:\"max_text_length\";i:255;}',0,'100',NULL,1,1,0,1),(18,0,NULL,0,NULL,1,'0',NULL,1,1,1,0),(19,0,NULL,0,NULL,0,'0',NULL,1,1,1,0),(20,0,NULL,0,'a:0:{}',0,'110',NULL,1,1,1,0),(21,1,NULL,0,NULL,1,'28',NULL,0,0,0,0),(22,0,NULL,0,NULL,0,'10',NULL,0,0,0,0),(23,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,'20',NULL,1,0,0,1),(24,0,NULL,0,NULL,0,'30',NULL,0,0,0,0),(25,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,'40',NULL,1,0,0,1),(26,0,NULL,0,NULL,0,'50',NULL,0,0,0,0),(27,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,'60',NULL,1,0,0,1),(28,1,NULL,2,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,'70',NULL,1,0,0,1),(29,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,'80',NULL,1,0,0,1),(30,1,NULL,0,NULL,1,'90',NULL,1,1,1,0),(31,1,NULL,0,NULL,1,'100',NULL,1,1,0,1),(32,1,NULL,0,NULL,1,'100',NULL,0,0,0,0),(33,1,NULL,0,'a:0:{}',1,'110','Magento\\Customer\\Model\\Attribute\\Data\\Postcode',1,1,1,1),(34,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,'120',NULL,1,1,1,1),(35,0,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',0,'130',NULL,1,0,0,1),(36,1,NULL,0,NULL,1,'140',NULL,0,0,0,0),(37,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(38,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(39,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(40,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(41,0,NULL,0,NULL,0,'0',NULL,0,0,0,0),(42,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(43,0,NULL,0,NULL,1,'0',NULL,0,0,0,0),(44,0,NULL,0,NULL,1,'0',NULL,0,0,0,0);
/*!40000 ALTER TABLE `mgk3_customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `mgk3_customer_eav_attribute_website`;
CREATE TABLE `mgk3_customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `MGK3_CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';

--
-- Dumping data for table `mgk3_customer_eav_attribute_website`
--

LOCK TABLES `mgk3_customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `mgk3_customer_eav_attribute_website` DISABLE KEYS */;
INSERT INTO `mgk3_customer_eav_attribute_website` VALUES (1,1,NULL,NULL,NULL,NULL),(3,1,NULL,NULL,NULL,NULL),(9,1,NULL,NULL,NULL,NULL),(10,1,NULL,NULL,NULL,NULL),(11,1,NULL,NULL,NULL,NULL),(17,1,NULL,NULL,NULL,NULL),(18,1,NULL,NULL,NULL,NULL),(19,1,NULL,NULL,NULL,NULL),(20,1,NULL,NULL,NULL,NULL),(21,1,NULL,NULL,NULL,NULL),(23,1,NULL,NULL,NULL,NULL),(25,1,NULL,NULL,NULL,NULL),(27,1,NULL,NULL,NULL,NULL),(28,1,NULL,NULL,NULL,NULL),(29,1,NULL,NULL,NULL,NULL),(30,1,NULL,NULL,NULL,NULL),(31,1,NULL,NULL,NULL,NULL),(32,1,NULL,NULL,NULL,NULL),(33,1,NULL,NULL,NULL,NULL),(34,1,NULL,NULL,NULL,NULL),(35,1,NULL,NULL,NULL,NULL),(36,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mgk3_customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_customer_entity`
--

DROP TABLE IF EXISTS `mgk3_customer_entity`;
CREATE TABLE `mgk3_customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int(10) unsigned DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint(5) unsigned DEFAULT NULL COMMENT 'Gender',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock Expiration Date',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `MGK3_CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `MGK3_CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `MGK3_CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `MGK3_CUSTOMER_ENTITY_LASTNAME` (`lastname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity';

--
-- Table structure for table `mgk3_customer_entity_datetime`
--

DROP TABLE IF EXISTS `mgk3_customer_entity_datetime`;
CREATE TABLE `mgk3_customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MGK3_CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';

--
-- Table structure for table `mgk3_customer_entity_decimal`
--

DROP TABLE IF EXISTS `mgk3_customer_entity_decimal`;
CREATE TABLE `mgk3_customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MGK3_CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';

--
-- Table structure for table `mgk3_customer_entity_int`
--

DROP TABLE IF EXISTS `mgk3_customer_entity_int`;
CREATE TABLE `mgk3_customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MGK3_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';

--
-- Table structure for table `mgk3_customer_entity_text`
--

DROP TABLE IF EXISTS `mgk3_customer_entity_text`;
CREATE TABLE `mgk3_customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MGK3_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';

--
-- Table structure for table `mgk3_customer_entity_varchar`
--

DROP TABLE IF EXISTS `mgk3_customer_entity_varchar`;
CREATE TABLE `mgk3_customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `MGK3_CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';

--
-- Table structure for table `mgk3_customer_form_attribute`
--

DROP TABLE IF EXISTS `mgk3_customer_form_attribute`;
CREATE TABLE `mgk3_customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `MGK3_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';

--
-- Dumping data for table `mgk3_customer_form_attribute`
--

LOCK TABLES `mgk3_customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `mgk3_customer_form_attribute` DISABLE KEYS */;
INSERT INTO `mgk3_customer_form_attribute` VALUES ('adminhtml_customer',1),('adminhtml_customer',3),('adminhtml_customer',4),('customer_account_create',4),('customer_account_edit',4),('adminhtml_customer',5),('customer_account_create',5),('customer_account_edit',5),('adminhtml_customer',6),('customer_account_create',6),('customer_account_edit',6),('adminhtml_customer',7),('customer_account_create',7),('customer_account_edit',7),('adminhtml_customer',8),('customer_account_create',8),('customer_account_edit',8),('adminhtml_checkout',9),('adminhtml_customer',9),('customer_account_create',9),('customer_account_edit',9),('adminhtml_checkout',10),('adminhtml_customer',10),('adminhtml_checkout',11),('adminhtml_customer',11),('customer_account_create',11),('customer_account_edit',11),('adminhtml_checkout',17),('adminhtml_customer',17),('customer_account_create',17),('customer_account_edit',17),('adminhtml_customer',19),('customer_account_create',19),('customer_account_edit',19),('adminhtml_checkout',20),('adminhtml_customer',20),('customer_account_create',20),('customer_account_edit',20),('adminhtml_customer',21),('adminhtml_customer_address',22),('customer_address_edit',22),('customer_register_address',22),('adminhtml_customer_address',23),('customer_address_edit',23),('customer_register_address',23),('adminhtml_customer_address',24),('customer_address_edit',24),('customer_register_address',24),('adminhtml_customer_address',25),('customer_address_edit',25),('customer_register_address',25),('adminhtml_customer_address',26),('customer_address_edit',26),('customer_register_address',26),('adminhtml_customer_address',27),('customer_address_edit',27),('customer_register_address',27),('adminhtml_customer_address',28),('customer_address_edit',28),('customer_register_address',28),('adminhtml_customer_address',29),('customer_address_edit',29),('customer_register_address',29),('adminhtml_customer_address',30),('customer_address_edit',30),('customer_register_address',30),('adminhtml_customer_address',31),('customer_address_edit',31),('customer_register_address',31),('adminhtml_customer_address',32),('customer_address_edit',32),('customer_register_address',32),('adminhtml_customer_address',33),('customer_address_edit',33),('customer_register_address',33),('adminhtml_customer_address',34),('customer_address_edit',34),('customer_register_address',34),('adminhtml_customer_address',35),('customer_address_edit',35),('customer_register_address',35),('adminhtml_customer_address',36),('customer_address_edit',36),('customer_register_address',36);
/*!40000 ALTER TABLE `mgk3_customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_customer_grid_flat`
--

DROP TABLE IF EXISTS `mgk3_customer_grid_flat`;
CREATE TABLE `mgk3_customer_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `name` text COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int(11) DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int(11) DEFAULT NULL COMMENT 'Website_id',
  `confirmation` varchar(255) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int(11) DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock_expires',
  `billing_full` text COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company',
  `shipping_full` text COMMENT 'Shipping_full',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `MGK3_CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `MGK3_CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `MGK3_CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `MGK3_CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `MGK3_CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `MGK3_CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`),
  FULLTEXT KEY `FTI_EFA9069FF280A76433BBC4802238D5DE` (`name`,`email`,`created_in`,`taxvat`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`,`shipping_full`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mgk3_customer_grid_flat';

--
-- Table structure for table `mgk3_customer_group`
--

DROP TABLE IF EXISTS `mgk3_customer_group`;
CREATE TABLE `mgk3_customer_group` (
  `customer_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Customer Group Id',
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer Group';

--
-- Dumping data for table `mgk3_customer_group`
--

LOCK TABLES `mgk3_customer_group` WRITE;
/*!40000 ALTER TABLE `mgk3_customer_group` DISABLE KEYS */;
INSERT INTO `mgk3_customer_group` VALUES (0,'NOT LOGGED IN','3'),(1,'General','3'),(2,'Wholesale','3'),(3,'Retailer','3');
/*!40000 ALTER TABLE `mgk3_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_customer_log`
--

DROP TABLE IF EXISTS `mgk3_customer_log`;
CREATE TABLE `mgk3_customer_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `customer_id` int(11) NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `MGK3_CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Log Table';

--
-- Table structure for table `mgk3_customer_visitor`
--

DROP TABLE IF EXISTS `mgk3_customer_visitor`;
CREATE TABLE `mgk3_customer_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`),
  KEY `MGK3_CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `MGK3_CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Visitor Table';

--
-- Dumping data for table `mgk3_customer_visitor`
--

LOCK TABLES `mgk3_customer_visitor` WRITE;
/*!40000 ALTER TABLE `mgk3_customer_visitor` DISABLE KEYS */;
INSERT INTO `mgk3_customer_visitor` VALUES (1,NULL,'r811knabvaghh80d87f0gftr86','2017-01-14 23:31:43'),(2,NULL,'8us14hg7qtcdadcenb95236574','2017-01-14 23:31:55'),(3,NULL,'g0lu85oaeetbn15k6up8ngkgj5','2017-01-14 23:32:25'),(4,NULL,'m4cetg3c735va1njtpn9bo9se5','2017-01-14 23:32:30'),(5,NULL,'kfot2brrdg2oahduqr3ji31af3','2017-01-14 23:32:52'),(6,NULL,'r78fkobg5pf2e1j489ro2c2uj5','2017-01-15 00:38:01'),(7,NULL,'rvlqoah11gi3nmmmfroi9fkcl2','2017-01-15 14:03:28'),(8,NULL,'e31o1vo0tbg9gpu74pol0gu861','2017-01-15 20:18:40'),(9,NULL,'kgb4g32ufauahj8c5qqubdms20','2017-01-15 20:18:41'),(10,NULL,'3eto9n1e3jllgb7hrfmi0fjin5','2017-01-15 20:19:00'),(11,NULL,'l9nuh01s078jtq27vns1053pa1','2017-01-16 00:46:03'),(12,NULL,'aktjs47cljn12p5cku6vc73i07','2017-01-16 00:46:04'),(13,NULL,'c7fb4ebme5h068b4g4l8luo2a4','2017-01-16 08:31:53'),(14,NULL,'ibc4fc4hl44bdfk22ib7o9lh57','2017-01-16 09:00:48'),(15,NULL,'j1dobdhe16voogi3fg6g01u630','2017-01-16 14:20:48'),(16,NULL,'ofv3i5dc1sn9c7rh4jvsgds251','2017-01-16 14:21:05'),(17,NULL,'uf3i6i3e767jjd4olc9rq30sn3','2017-01-16 15:22:40'),(18,NULL,'1gfjolsiju6b8tijcqf7l26sc6','2017-01-16 16:17:55'),(19,NULL,'il9ap5bh4e0f7gh09c2n9p7ua6','2017-01-16 16:18:09'),(20,NULL,'6ubs11ul1mqc68m3v4t0kqapd6','2017-01-16 16:34:53'),(21,NULL,'flmpgarcnk83fog2v94gv8aq36','2017-01-16 16:34:56');
/*!40000 ALTER TABLE `mgk3_customer_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_design_change`
--

DROP TABLE IF EXISTS `mgk3_design_change`;
CREATE TABLE `mgk3_design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `MGK3_DESIGN_CHANGE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';

--
-- Table structure for table `mgk3_design_config_grid_flat`
--

DROP TABLE IF EXISTS `mgk3_design_config_grid_flat`;
CREATE TABLE `mgk3_design_config_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `store_website_id` int(11) DEFAULT NULL COMMENT 'Store_website_id',
  `store_group_id` int(11) DEFAULT NULL COMMENT 'Store_group_id',
  `store_id` int(11) DEFAULT NULL COMMENT 'Store_id',
  `theme_theme_id` varchar(255) DEFAULT NULL COMMENT 'Theme_theme_id',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  KEY `MGK3_DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  KEY `MGK3_DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`),
  FULLTEXT KEY `MGK3_DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mgk3_design_config_grid_flat';

--
-- Dumping data for table `mgk3_design_config_grid_flat`
--

LOCK TABLES `mgk3_design_config_grid_flat` WRITE;
/*!40000 ALTER TABLE `mgk3_design_config_grid_flat` DISABLE KEYS */;
INSERT INTO `mgk3_design_config_grid_flat` VALUES ('0',NULL,NULL,NULL,''),('1','1',NULL,NULL,''),('2','1','1','1','');
/*!40000 ALTER TABLE `mgk3_design_config_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_directory_country`
--

DROP TABLE IF EXISTS `mgk3_directory_country`;
CREATE TABLE `mgk3_directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';

--
-- Dumping data for table `mgk3_directory_country`
--

LOCK TABLES `mgk3_directory_country` WRITE;
/*!40000 ALTER TABLE `mgk3_directory_country` DISABLE KEYS */;
INSERT INTO `mgk3_directory_country` VALUES ('AD','AD','AND'),('AE','AE','ARE'),('AF','AF','AFG'),('AG','AG','ATG'),('AI','AI','AIA'),('AL','AL','ALB'),('AM','AM','ARM'),('AN','AN','ANT'),('AO','AO','AGO'),('AQ','AQ','ATA'),('AR','AR','ARG'),('AS','AS','ASM'),('AT','AT','AUT'),('AU','AU','AUS'),('AW','AW','ABW'),('AX','AX','ALA'),('AZ','AZ','AZE'),('BA','BA','BIH'),('BB','BB','BRB'),('BD','BD','BGD'),('BE','BE','BEL'),('BF','BF','BFA'),('BG','BG','BGR'),('BH','BH','BHR'),('BI','BI','BDI'),('BJ','BJ','BEN'),('BL','BL','BLM'),('BM','BM','BMU'),('BN','BN','BRN'),('BO','BO','BOL'),('BR','BR','BRA'),('BS','BS','BHS'),('BT','BT','BTN'),('BV','BV','BVT'),('BW','BW','BWA'),('BY','BY','BLR'),('BZ','BZ','BLZ'),('CA','CA','CAN'),('CC','CC','CCK'),('CD','CD','COD'),('CF','CF','CAF'),('CG','CG','COG'),('CH','CH','CHE'),('CI','CI','CIV'),('CK','CK','COK'),('CL','CL','CHL'),('CM','CM','CMR'),('CN','CN','CHN'),('CO','CO','COL'),('CR','CR','CRI'),('CU','CU','CUB'),('CV','CV','CPV'),('CX','CX','CXR'),('CY','CY','CYP'),('CZ','CZ','CZE'),('DE','DE','DEU'),('DJ','DJ','DJI'),('DK','DK','DNK'),('DM','DM','DMA'),('DO','DO','DOM'),('DZ','DZ','DZA'),('EC','EC','ECU'),('EE','EE','EST'),('EG','EG','EGY'),('EH','EH','ESH'),('ER','ER','ERI'),('ES','ES','ESP'),('ET','ET','ETH'),('FI','FI','FIN'),('FJ','FJ','FJI'),('FK','FK','FLK'),('FM','FM','FSM'),('FO','FO','FRO'),('FR','FR','FRA'),('GA','GA','GAB'),('GB','GB','GBR'),('GD','GD','GRD'),('GE','GE','GEO'),('GF','GF','GUF'),('GG','GG','GGY'),('GH','GH','GHA'),('GI','GI','GIB'),('GL','GL','GRL'),('GM','GM','GMB'),('GN','GN','GIN'),('GP','GP','GLP'),('GQ','GQ','GNQ'),('GR','GR','GRC'),('GS','GS','SGS'),('GT','GT','GTM'),('GU','GU','GUM'),('GW','GW','GNB'),('GY','GY','GUY'),('HK','HK','HKG'),('HM','HM','HMD'),('HN','HN','HND'),('HR','HR','HRV'),('HT','HT','HTI'),('HU','HU','HUN'),('ID','ID','IDN'),('IE','IE','IRL'),('IL','IL','ISR'),('IM','IM','IMN'),('IN','IN','IND'),('IO','IO','IOT'),('IQ','IQ','IRQ'),('IR','IR','IRN'),('IS','IS','ISL'),('IT','IT','ITA'),('JE','JE','JEY'),('JM','JM','JAM'),('JO','JO','JOR'),('JP','JP','JPN'),('KE','KE','KEN'),('KG','KG','KGZ'),('KH','KH','KHM'),('KI','KI','KIR'),('KM','KM','COM'),('KN','KN','KNA'),('KP','KP','PRK'),('KR','KR','KOR'),('KW','KW','KWT'),('KY','KY','CYM'),('KZ','KZ','KAZ'),('LA','LA','LAO'),('LB','LB','LBN'),('LC','LC','LCA'),('LI','LI','LIE'),('LK','LK','LKA'),('LR','LR','LBR'),('LS','LS','LSO'),('LT','LT','LTU'),('LU','LU','LUX'),('LV','LV','LVA'),('LY','LY','LBY'),('MA','MA','MAR'),('MC','MC','MCO'),('MD','MD','MDA'),('ME','ME','MNE'),('MF','MF','MAF'),('MG','MG','MDG'),('MH','MH','MHL'),('MK','MK','MKD'),('ML','ML','MLI'),('MM','MM','MMR'),('MN','MN','MNG'),('MO','MO','MAC'),('MP','MP','MNP'),('MQ','MQ','MTQ'),('MR','MR','MRT'),('MS','MS','MSR'),('MT','MT','MLT'),('MU','MU','MUS'),('MV','MV','MDV'),('MW','MW','MWI'),('MX','MX','MEX'),('MY','MY','MYS'),('MZ','MZ','MOZ'),('NA','NA','NAM'),('NC','NC','NCL'),('NE','NE','NER'),('NF','NF','NFK'),('NG','NG','NGA'),('NI','NI','NIC'),('NL','NL','NLD'),('NO','NO','NOR'),('NP','NP','NPL'),('NR','NR','NRU'),('NU','NU','NIU'),('NZ','NZ','NZL'),('OM','OM','OMN'),('PA','PA','PAN'),('PE','PE','PER'),('PF','PF','PYF'),('PG','PG','PNG'),('PH','PH','PHL'),('PK','PK','PAK'),('PL','PL','POL'),('PM','PM','SPM'),('PN','PN','PCN'),('PS','PS','PSE'),('PT','PT','PRT'),('PW','PW','PLW'),('PY','PY','PRY'),('QA','QA','QAT'),('RE','RE','REU'),('RO','RO','ROU'),('RS','RS','SRB'),('RU','RU','RUS'),('RW','RW','RWA'),('SA','SA','SAU'),('SB','SB','SLB'),('SC','SC','SYC'),('SD','SD','SDN'),('SE','SE','SWE'),('SG','SG','SGP'),('SH','SH','SHN'),('SI','SI','SVN'),('SJ','SJ','SJM'),('SK','SK','SVK'),('SL','SL','SLE'),('SM','SM','SMR'),('SN','SN','SEN'),('SO','SO','SOM'),('SR','SR','SUR'),('ST','ST','STP'),('SV','SV','SLV'),('SY','SY','SYR'),('SZ','SZ','SWZ'),('TC','TC','TCA'),('TD','TD','TCD'),('TF','TF','ATF'),('TG','TG','TGO'),('TH','TH','THA'),('TJ','TJ','TJK'),('TK','TK','TKL'),('TL','TL','TLS'),('TM','TM','TKM'),('TN','TN','TUN'),('TO','TO','TON'),('TR','TR','TUR'),('TT','TT','TTO'),('TV','TV','TUV'),('TW','TW','TWN'),('TZ','TZ','TZA'),('UA','UA','UKR'),('UG','UG','UGA'),('UM','UM','UMI'),('US','US','USA'),('UY','UY','URY'),('UZ','UZ','UZB'),('VA','VA','VAT'),('VC','VC','VCT'),('VE','VE','VEN'),('VG','VG','VGB'),('VI','VI','VIR'),('VN','VN','VNM'),('VU','VU','VUT'),('WF','WF','WLF'),('WS','WS','WSM'),('YE','YE','YEM'),('YT','YT','MYT'),('ZA','ZA','ZAF'),('ZM','ZM','ZMB'),('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `mgk3_directory_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_directory_country_format`
--

DROP TABLE IF EXISTS `mgk3_directory_country_format`;
CREATE TABLE `mgk3_directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `MGK3_DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';

--
-- Table structure for table `mgk3_directory_country_region`
--

DROP TABLE IF EXISTS `mgk3_directory_country_region`;
CREATE TABLE `mgk3_directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `MGK3_DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';

--
-- Dumping data for table `mgk3_directory_country_region`
--

LOCK TABLES `mgk3_directory_country_region` WRITE;
/*!40000 ALTER TABLE `mgk3_directory_country_region` DISABLE KEYS */;
INSERT INTO `mgk3_directory_country_region` VALUES ('1','US','AL','Alabama'),('2','US','AK','Alaska'),('3','US','AS','American Samoa'),('4','US','AZ','Arizona'),('5','US','AR','Arkansas'),('6','US','AE','Armed Forces Africa'),('7','US','AA','Armed Forces Americas'),('8','US','AE','Armed Forces Canada'),('9','US','AE','Armed Forces Europe'),('10','US','AE','Armed Forces Middle East'),('11','US','AP','Armed Forces Pacific'),('12','US','CA','California'),('13','US','CO','Colorado'),('14','US','CT','Connecticut'),('15','US','DE','Delaware'),('16','US','DC','District of Columbia'),('17','US','FM','Federated States Of Micronesia'),('18','US','FL','Florida'),('19','US','GA','Georgia'),('20','US','GU','Guam'),('21','US','HI','Hawaii'),('22','US','ID','Idaho'),('23','US','IL','Illinois'),('24','US','IN','Indiana'),('25','US','IA','Iowa'),('26','US','KS','Kansas'),('27','US','KY','Kentucky'),('28','US','LA','Louisiana'),('29','US','ME','Maine'),('30','US','MH','Marshall Islands'),('31','US','MD','Maryland'),('32','US','MA','Massachusetts'),('33','US','MI','Michigan'),('34','US','MN','Minnesota'),('35','US','MS','Mississippi'),('36','US','MO','Missouri'),('37','US','MT','Montana'),('38','US','NE','Nebraska'),('39','US','NV','Nevada'),('40','US','NH','New Hampshire'),('41','US','NJ','New Jersey'),('42','US','NM','New Mexico'),('43','US','NY','New York'),('44','US','NC','North Carolina'),('45','US','ND','North Dakota'),('46','US','MP','Northern Mariana Islands'),('47','US','OH','Ohio'),('48','US','OK','Oklahoma'),('49','US','OR','Oregon'),('50','US','PW','Palau'),('51','US','PA','Pennsylvania'),('52','US','PR','Puerto Rico'),('53','US','RI','Rhode Island'),('54','US','SC','South Carolina'),('55','US','SD','South Dakota'),('56','US','TN','Tennessee'),('57','US','TX','Texas'),('58','US','UT','Utah'),('59','US','VT','Vermont'),('60','US','VI','Virgin Islands'),('61','US','VA','Virginia'),('62','US','WA','Washington'),('63','US','WV','West Virginia'),('64','US','WI','Wisconsin'),('65','US','WY','Wyoming'),('66','CA','AB','Alberta'),('67','CA','BC','British Columbia'),('68','CA','MB','Manitoba'),('69','CA','NL','Newfoundland and Labrador'),('70','CA','NB','New Brunswick'),('71','CA','NS','Nova Scotia'),('72','CA','NT','Northwest Territories'),('73','CA','NU','Nunavut'),('74','CA','ON','Ontario'),('75','CA','PE','Prince Edward Island'),('76','CA','QC','Quebec'),('77','CA','SK','Saskatchewan'),('78','CA','YT','Yukon Territory'),('79','DE','NDS','Niedersachsen'),('80','DE','BAW','Baden-Württemberg'),('81','DE','BAY','Bayern'),('82','DE','BER','Berlin'),('83','DE','BRG','Brandenburg'),('84','DE','BRE','Bremen'),('85','DE','HAM','Hamburg'),('86','DE','HES','Hessen'),('87','DE','MEC','Mecklenburg-Vorpommern'),('88','DE','NRW','Nordrhein-Westfalen'),('89','DE','RHE','Rheinland-Pfalz'),('90','DE','SAR','Saarland'),('91','DE','SAS','Sachsen'),('92','DE','SAC','Sachsen-Anhalt'),('93','DE','SCN','Schleswig-Holstein'),('94','DE','THE','Thüringen'),('95','AT','WI','Wien'),('96','AT','NO','Niederösterreich'),('97','AT','OO','Oberösterreich'),('98','AT','SB','Salzburg'),('99','AT','KN','Kärnten'),('100','AT','ST','Steiermark'),('101','AT','TI','Tirol'),('102','AT','BL','Burgenland'),('103','AT','VB','Vorarlberg'),('104','CH','AG','Aargau'),('105','CH','AI','Appenzell Innerrhoden'),('106','CH','AR','Appenzell Ausserrhoden'),('107','CH','BE','Bern'),('108','CH','BL','Basel-Landschaft'),('109','CH','BS','Basel-Stadt'),('110','CH','FR','Freiburg'),('111','CH','GE','Genf'),('112','CH','GL','Glarus'),('113','CH','GR','Graubünden'),('114','CH','JU','Jura'),('115','CH','LU','Luzern'),('116','CH','NE','Neuenburg'),('117','CH','NW','Nidwalden'),('118','CH','OW','Obwalden'),('119','CH','SG','St. Gallen'),('120','CH','SH','Schaffhausen'),('121','CH','SO','Solothurn'),('122','CH','SZ','Schwyz'),('123','CH','TG','Thurgau'),('124','CH','TI','Tessin'),('125','CH','UR','Uri'),('126','CH','VD','Waadt'),('127','CH','VS','Wallis'),('128','CH','ZG','Zug'),('129','CH','ZH','Zürich'),('130','ES','A Coruсa','A Coruña'),('131','ES','Alava','Alava'),('132','ES','Albacete','Albacete'),('133','ES','Alicante','Alicante'),('134','ES','Almeria','Almeria'),('135','ES','Asturias','Asturias'),('136','ES','Avila','Avila'),('137','ES','Badajoz','Badajoz'),('138','ES','Baleares','Baleares'),('139','ES','Barcelona','Barcelona'),('140','ES','Burgos','Burgos'),('141','ES','Caceres','Caceres'),('142','ES','Cadiz','Cadiz'),('143','ES','Cantabria','Cantabria'),('144','ES','Castellon','Castellon'),('145','ES','Ceuta','Ceuta'),('146','ES','Ciudad Real','Ciudad Real'),('147','ES','Cordoba','Cordoba'),('148','ES','Cuenca','Cuenca'),('149','ES','Girona','Girona'),('150','ES','Granada','Granada'),('151','ES','Guadalajara','Guadalajara'),('152','ES','Guipuzcoa','Guipuzcoa'),('153','ES','Huelva','Huelva'),('154','ES','Huesca','Huesca'),('155','ES','Jaen','Jaen'),('156','ES','La Rioja','La Rioja'),('157','ES','Las Palmas','Las Palmas'),('158','ES','Leon','Leon'),('159','ES','Lleida','Lleida'),('160','ES','Lugo','Lugo'),('161','ES','Madrid','Madrid'),('162','ES','Malaga','Malaga'),('163','ES','Melilla','Melilla'),('164','ES','Murcia','Murcia'),('165','ES','Navarra','Navarra'),('166','ES','Ourense','Ourense'),('167','ES','Palencia','Palencia'),('168','ES','Pontevedra','Pontevedra'),('169','ES','Salamanca','Salamanca'),('170','ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),('171','ES','Segovia','Segovia'),('172','ES','Sevilla','Sevilla'),('173','ES','Soria','Soria'),('174','ES','Tarragona','Tarragona'),('175','ES','Teruel','Teruel'),('176','ES','Toledo','Toledo'),('177','ES','Valencia','Valencia'),('178','ES','Valladolid','Valladolid'),('179','ES','Vizcaya','Vizcaya'),('180','ES','Zamora','Zamora'),('181','ES','Zaragoza','Zaragoza'),('182','FR','1','Ain'),('183','FR','2','Aisne'),('184','FR','3','Allier'),('185','FR','4','Alpes-de-Haute-Provence'),('186','FR','5','Hautes-Alpes'),('187','FR','6','Alpes-Maritimes'),('188','FR','7','Ardèche'),('189','FR','8','Ardennes'),('190','FR','9','Ariège'),('191','FR','10','Aube'),('192','FR','11','Aude'),('193','FR','12','Aveyron'),('194','FR','13','Bouches-du-Rhône'),('195','FR','14','Calvados'),('196','FR','15','Cantal'),('197','FR','16','Charente'),('198','FR','17','Charente-Maritime'),('199','FR','18','Cher'),('200','FR','19','Corrèze'),('201','FR','2A','Corse-du-Sud'),('202','FR','2B','Haute-Corse'),('203','FR','21','Côte-d\'Or'),('204','FR','22','Côtes-d\'Armor'),('205','FR','23','Creuse'),('206','FR','24','Dordogne'),('207','FR','25','Doubs'),('208','FR','26','Drôme'),('209','FR','27','Eure'),('210','FR','28','Eure-et-Loir'),('211','FR','29','Finistère'),('212','FR','30','Gard'),('213','FR','31','Haute-Garonne'),('214','FR','32','Gers'),('215','FR','33','Gironde'),('216','FR','34','Hérault'),('217','FR','35','Ille-et-Vilaine'),('218','FR','36','Indre'),('219','FR','37','Indre-et-Loire'),('220','FR','38','Isère'),('221','FR','39','Jura'),('222','FR','40','Landes'),('223','FR','41','Loir-et-Cher'),('224','FR','42','Loire'),('225','FR','43','Haute-Loire'),('226','FR','44','Loire-Atlantique'),('227','FR','45','Loiret'),('228','FR','46','Lot'),('229','FR','47','Lot-et-Garonne'),('230','FR','48','Lozère'),('231','FR','49','Maine-et-Loire'),('232','FR','50','Manche'),('233','FR','51','Marne'),('234','FR','52','Haute-Marne'),('235','FR','53','Mayenne'),('236','FR','54','Meurthe-et-Moselle'),('237','FR','55','Meuse'),('238','FR','56','Morbihan'),('239','FR','57','Moselle'),('240','FR','58','Nièvre'),('241','FR','59','Nord'),('242','FR','60','Oise'),('243','FR','61','Orne'),('244','FR','62','Pas-de-Calais'),('245','FR','63','Puy-de-Dôme'),('246','FR','64','Pyrénées-Atlantiques'),('247','FR','65','Hautes-Pyrénées'),('248','FR','66','Pyrénées-Orientales'),('249','FR','67','Bas-Rhin'),('250','FR','68','Haut-Rhin'),('251','FR','69','Rhône'),('252','FR','70','Haute-Saône'),('253','FR','71','Saône-et-Loire'),('254','FR','72','Sarthe'),('255','FR','73','Savoie'),('256','FR','74','Haute-Savoie'),('257','FR','75','Paris'),('258','FR','76','Seine-Maritime'),('259','FR','77','Seine-et-Marne'),('260','FR','78','Yvelines'),('261','FR','79','Deux-Sèvres'),('262','FR','80','Somme'),('263','FR','81','Tarn'),('264','FR','82','Tarn-et-Garonne'),('265','FR','83','Var'),('266','FR','84','Vaucluse'),('267','FR','85','Vendée'),('268','FR','86','Vienne'),('269','FR','87','Haute-Vienne'),('270','FR','88','Vosges'),('271','FR','89','Yonne'),('272','FR','90','Territoire-de-Belfort'),('273','FR','91','Essonne'),('274','FR','92','Hauts-de-Seine'),('275','FR','93','Seine-Saint-Denis'),('276','FR','94','Val-de-Marne'),('277','FR','95','Val-d\'Oise'),('278','RO','AB','Alba'),('279','RO','AR','Arad'),('280','RO','AG','Argeş'),('281','RO','BC','Bacău'),('282','RO','BH','Bihor'),('283','RO','BN','Bistriţa-Năsăud'),('284','RO','BT','Botoşani'),('285','RO','BV','Braşov'),('286','RO','BR','Brăila'),('287','RO','B','Bucureşti'),('288','RO','BZ','Buzău'),('289','RO','CS','Caraş-Severin'),('290','RO','CL','Călăraşi'),('291','RO','CJ','Cluj'),('292','RO','CT','Constanţa'),('293','RO','CV','Covasna'),('294','RO','DB','Dâmboviţa'),('295','RO','DJ','Dolj'),('296','RO','GL','Galaţi'),('297','RO','GR','Giurgiu'),('298','RO','GJ','Gorj'),('299','RO','HR','Harghita'),('300','RO','HD','Hunedoara'),('301','RO','IL','Ialomiţa'),('302','RO','IS','Iaşi'),('303','RO','IF','Ilfov'),('304','RO','MM','Maramureş'),('305','RO','MH','Mehedinţi'),('306','RO','MS','Mureş'),('307','RO','NT','Neamţ'),('308','RO','OT','Olt'),('309','RO','PH','Prahova'),('310','RO','SM','Satu-Mare'),('311','RO','SJ','Sălaj'),('312','RO','SB','Sibiu'),('313','RO','SV','Suceava'),('314','RO','TR','Teleorman'),('315','RO','TM','Timiş'),('316','RO','TL','Tulcea'),('317','RO','VS','Vaslui'),('318','RO','VL','Vâlcea'),('319','RO','VN','Vrancea'),('320','FI','Lappi','Lappi'),('321','FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),('322','FI','Kainuu','Kainuu'),('323','FI','Pohjois-Karjala','Pohjois-Karjala'),('324','FI','Pohjois-Savo','Pohjois-Savo'),('325','FI','Etelä-Savo','Etelä-Savo'),('326','FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),('327','FI','Pohjanmaa','Pohjanmaa'),('328','FI','Pirkanmaa','Pirkanmaa'),('329','FI','Satakunta','Satakunta'),('330','FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),('331','FI','Keski-Suomi','Keski-Suomi'),('332','FI','Varsinais-Suomi','Varsinais-Suomi'),('333','FI','Etelä-Karjala','Etelä-Karjala'),('334','FI','Päijät-Häme','Päijät-Häme'),('335','FI','Kanta-Häme','Kanta-Häme'),('336','FI','Uusimaa','Uusimaa'),('337','FI','Itä-Uusimaa','Itä-Uusimaa'),('338','FI','Kymenlaakso','Kymenlaakso'),('339','FI','Ahvenanmaa','Ahvenanmaa'),('340','EE','EE-37','Harjumaa'),('341','EE','EE-39','Hiiumaa'),('342','EE','EE-44','Ida-Virumaa'),('343','EE','EE-49','Jõgevamaa'),('344','EE','EE-51','Järvamaa'),('345','EE','EE-57','Läänemaa'),('346','EE','EE-59','Lääne-Virumaa'),('347','EE','EE-65','Põlvamaa'),('348','EE','EE-67','Pärnumaa'),('349','EE','EE-70','Raplamaa'),('350','EE','EE-74','Saaremaa'),('351','EE','EE-78','Tartumaa'),('352','EE','EE-82','Valgamaa'),('353','EE','EE-84','Viljandimaa'),('354','EE','EE-86','Võrumaa'),('355','LV','LV-DGV','Daugavpils'),('356','LV','LV-JEL','Jelgava'),('357','LV','Jēkabpils','Jēkabpils'),('358','LV','LV-JUR','Jūrmala'),('359','LV','LV-LPX','Liepāja'),('360','LV','LV-LE','Liepājas novads'),('361','LV','LV-REZ','Rēzekne'),('362','LV','LV-RIX','Rīga'),('363','LV','LV-RI','Rīgas novads'),('364','LV','Valmiera','Valmiera'),('365','LV','LV-VEN','Ventspils'),('366','LV','Aglonas novads','Aglonas novads'),('367','LV','LV-AI','Aizkraukles novads'),('368','LV','Aizputes novads','Aizputes novads'),('369','LV','Aknīstes novads','Aknīstes novads'),('370','LV','Alojas novads','Alojas novads'),('371','LV','Alsungas novads','Alsungas novads'),('372','LV','LV-AL','Alūksnes novads'),('373','LV','Amatas novads','Amatas novads'),('374','LV','Apes novads','Apes novads'),('375','LV','Auces novads','Auces novads'),('376','LV','Babītes novads','Babītes novads'),('377','LV','Baldones novads','Baldones novads'),('378','LV','Baltinavas novads','Baltinavas novads'),('379','LV','LV-BL','Balvu novads'),('380','LV','LV-BU','Bauskas novads'),('381','LV','Beverīnas novads','Beverīnas novads'),('382','LV','Brocēnu novads','Brocēnu novads'),('383','LV','Burtnieku novads','Burtnieku novads'),('384','LV','Carnikavas novads','Carnikavas novads'),('385','LV','Cesvaines novads','Cesvaines novads'),('386','LV','Ciblas novads','Ciblas novads'),('387','LV','LV-CE','Cēsu novads'),('388','LV','Dagdas novads','Dagdas novads'),('389','LV','LV-DA','Daugavpils novads'),('390','LV','LV-DO','Dobeles novads'),('391','LV','Dundagas novads','Dundagas novads'),('392','LV','Durbes novads','Durbes novads'),('393','LV','Engures novads','Engures novads'),('394','LV','Garkalnes novads','Garkalnes novads'),('395','LV','Grobiņas novads','Grobiņas novads'),('396','LV','LV-GU','Gulbenes novads'),('397','LV','Iecavas novads','Iecavas novads'),('398','LV','Ikšķiles novads','Ikšķiles novads'),('399','LV','Ilūkstes novads','Ilūkstes novads'),('400','LV','Inčukalna novads','Inčukalna novads'),('401','LV','Jaunjelgavas novads','Jaunjelgavas novads'),('402','LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),('403','LV','Jaunpils novads','Jaunpils novads'),('404','LV','LV-JL','Jelgavas novads'),('405','LV','LV-JK','Jēkabpils novads'),('406','LV','Kandavas novads','Kandavas novads'),('407','LV','Kokneses novads','Kokneses novads'),('408','LV','Krimuldas novads','Krimuldas novads'),('409','LV','Krustpils novads','Krustpils novads'),('410','LV','LV-KR','Krāslavas novads'),('411','LV','LV-KU','Kuldīgas novads'),('412','LV','Kārsavas novads','Kārsavas novads'),('413','LV','Lielvārdes novads','Lielvārdes novads'),('414','LV','LV-LM','Limbažu novads'),('415','LV','Lubānas novads','Lubānas novads'),('416','LV','LV-LU','Ludzas novads'),('417','LV','Līgatnes novads','Līgatnes novads'),('418','LV','Līvānu novads','Līvānu novads'),('419','LV','LV-MA','Madonas novads'),('420','LV','Mazsalacas novads','Mazsalacas novads'),('421','LV','Mālpils novads','Mālpils novads'),('422','LV','Mārupes novads','Mārupes novads'),('423','LV','Naukšēnu novads','Naukšēnu novads'),('424','LV','Neretas novads','Neretas novads'),('425','LV','Nīcas novads','Nīcas novads'),('426','LV','LV-OG','Ogres novads'),('427','LV','Olaines novads','Olaines novads'),('428','LV','Ozolnieku novads','Ozolnieku novads'),('429','LV','LV-PR','Preiļu novads'),('430','LV','Priekules novads','Priekules novads'),('431','LV','Priekuļu novads','Priekuļu novads'),('432','LV','Pārgaujas novads','Pārgaujas novads'),('433','LV','Pāvilostas novads','Pāvilostas novads'),('434','LV','Pļaviņu novads','Pļaviņu novads'),('435','LV','Raunas novads','Raunas novads'),('436','LV','Riebiņu novads','Riebiņu novads'),('437','LV','Rojas novads','Rojas novads'),('438','LV','Ropažu novads','Ropažu novads'),('439','LV','Rucavas novads','Rucavas novads'),('440','LV','Rugāju novads','Rugāju novads'),('441','LV','Rundāles novads','Rundāles novads'),('442','LV','LV-RE','Rēzeknes novads'),('443','LV','Rūjienas novads','Rūjienas novads'),('444','LV','Salacgrīvas novads','Salacgrīvas novads'),('445','LV','Salas novads','Salas novads'),('446','LV','Salaspils novads','Salaspils novads'),('447','LV','LV-SA','Saldus novads'),('448','LV','Saulkrastu novads','Saulkrastu novads'),('449','LV','Siguldas novads','Siguldas novads'),('450','LV','Skrundas novads','Skrundas novads'),('451','LV','Skrīveru novads','Skrīveru novads'),('452','LV','Smiltenes novads','Smiltenes novads'),('453','LV','Stopiņu novads','Stopiņu novads'),('454','LV','Strenču novads','Strenču novads'),('455','LV','Sējas novads','Sējas novads'),('456','LV','LV-TA','Talsu novads'),('457','LV','LV-TU','Tukuma novads'),('458','LV','Tērvetes novads','Tērvetes novads'),('459','LV','Vaiņodes novads','Vaiņodes novads'),('460','LV','LV-VK','Valkas novads'),('461','LV','LV-VM','Valmieras novads'),('462','LV','Varakļānu novads','Varakļānu novads'),('463','LV','Vecpiebalgas novads','Vecpiebalgas novads'),('464','LV','Vecumnieku novads','Vecumnieku novads'),('465','LV','LV-VE','Ventspils novads'),('466','LV','Viesītes novads','Viesītes novads'),('467','LV','Viļakas novads','Viļakas novads'),('468','LV','Viļānu novads','Viļānu novads'),('469','LV','Vārkavas novads','Vārkavas novads'),('470','LV','Zilupes novads','Zilupes novads'),('471','LV','Ādažu novads','Ādažu novads'),('472','LV','Ērgļu novads','Ērgļu novads'),('473','LV','Ķeguma novads','Ķeguma novads'),('474','LV','Ķekavas novads','Ķekavas novads'),('475','LT','LT-AL','Alytaus Apskritis'),('476','LT','LT-KU','Kauno Apskritis'),('477','LT','LT-KL','Klaipėdos Apskritis'),('478','LT','LT-MR','Marijampolės Apskritis'),('479','LT','LT-PN','Panevėžio Apskritis'),('480','LT','LT-SA','Šiaulių Apskritis'),('481','LT','LT-TA','Tauragės Apskritis'),('482','LT','LT-TE','Telšių Apskritis'),('483','LT','LT-UT','Utenos Apskritis'),('484','LT','LT-VL','Vilniaus Apskritis'),('485','BR','AC','Acre'),('486','BR','AL','Alagoas'),('487','BR','AP','Amapá'),('488','BR','AM','Amazonas'),('489','BR','BA','Bahia'),('490','BR','CE','Ceará'),('491','BR','ES','Espírito Santo'),('492','BR','GO','Goiás'),('493','BR','MA','Maranhão'),('494','BR','MT','Mato Grosso'),('495','BR','MS','Mato Grosso do Sul'),('496','BR','MG','Minas Gerais'),('497','BR','PA','Pará'),('498','BR','PB','Paraíba'),('499','BR','PR','Paraná'),('500','BR','PE','Pernambuco'),('501','BR','PI','Piauí'),('502','BR','RJ','Rio de Janeiro'),('503','BR','RN','Rio Grande do Norte'),('504','BR','RS','Rio Grande do Sul'),('505','BR','RO','Rondônia'),('506','BR','RR','Roraima'),('507','BR','SC','Santa Catarina'),('508','BR','SP','São Paulo'),('509','BR','SE','Sergipe'),('510','BR','TO','Tocantins'),('511','BR','DF','Distrito Federal');
/*!40000 ALTER TABLE `mgk3_directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_directory_country_region_name`
--

DROP TABLE IF EXISTS `mgk3_directory_country_region_name`;
CREATE TABLE `mgk3_directory_country_region_name` (
  `locale` varchar(8) NOT NULL COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `MGK3_DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';

--
-- Dumping data for table `mgk3_directory_country_region_name`
--

LOCK TABLES `mgk3_directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `mgk3_directory_country_region_name` DISABLE KEYS */;
INSERT INTO `mgk3_directory_country_region_name` VALUES ('en_US','1','Alabama'),('en_US','2','Alaska'),('en_US','3','American Samoa'),('en_US','4','Arizona'),('en_US','5','Arkansas'),('en_US','6','Armed Forces Africa'),('en_US','7','Armed Forces Americas'),('en_US','8','Armed Forces Canada'),('en_US','9','Armed Forces Europe'),('en_US','10','Armed Forces Middle East'),('en_US','11','Armed Forces Pacific'),('en_US','12','California'),('en_US','13','Colorado'),('en_US','14','Connecticut'),('en_US','15','Delaware'),('en_US','16','District of Columbia'),('en_US','17','Federated States Of Micronesia'),('en_US','18','Florida'),('en_US','19','Georgia'),('en_US','20','Guam'),('en_US','21','Hawaii'),('en_US','22','Idaho'),('en_US','23','Illinois'),('en_US','24','Indiana'),('en_US','25','Iowa'),('en_US','26','Kansas'),('en_US','27','Kentucky'),('en_US','28','Louisiana'),('en_US','29','Maine'),('en_US','30','Marshall Islands'),('en_US','31','Maryland'),('en_US','32','Massachusetts'),('en_US','33','Michigan'),('en_US','34','Minnesota'),('en_US','35','Mississippi'),('en_US','36','Missouri'),('en_US','37','Montana'),('en_US','38','Nebraska'),('en_US','39','Nevada'),('en_US','40','New Hampshire'),('en_US','41','New Jersey'),('en_US','42','New Mexico'),('en_US','43','New York'),('en_US','44','North Carolina'),('en_US','45','North Dakota'),('en_US','46','Northern Mariana Islands'),('en_US','47','Ohio'),('en_US','48','Oklahoma'),('en_US','49','Oregon'),('en_US','50','Palau'),('en_US','51','Pennsylvania'),('en_US','52','Puerto Rico'),('en_US','53','Rhode Island'),('en_US','54','South Carolina'),('en_US','55','South Dakota'),('en_US','56','Tennessee'),('en_US','57','Texas'),('en_US','58','Utah'),('en_US','59','Vermont'),('en_US','60','Virgin Islands'),('en_US','61','Virginia'),('en_US','62','Washington'),('en_US','63','West Virginia'),('en_US','64','Wisconsin'),('en_US','65','Wyoming'),('en_US','66','Alberta'),('en_US','67','British Columbia'),('en_US','68','Manitoba'),('en_US','69','Newfoundland and Labrador'),('en_US','70','New Brunswick'),('en_US','71','Nova Scotia'),('en_US','72','Northwest Territories'),('en_US','73','Nunavut'),('en_US','74','Ontario'),('en_US','75','Prince Edward Island'),('en_US','76','Quebec'),('en_US','77','Saskatchewan'),('en_US','78','Yukon Territory'),('en_US','79','Niedersachsen'),('en_US','80','Baden-Württemberg'),('en_US','81','Bayern'),('en_US','82','Berlin'),('en_US','83','Brandenburg'),('en_US','84','Bremen'),('en_US','85','Hamburg'),('en_US','86','Hessen'),('en_US','87','Mecklenburg-Vorpommern'),('en_US','88','Nordrhein-Westfalen'),('en_US','89','Rheinland-Pfalz'),('en_US','90','Saarland'),('en_US','91','Sachsen'),('en_US','92','Sachsen-Anhalt'),('en_US','93','Schleswig-Holstein'),('en_US','94','Thüringen'),('en_US','95','Wien'),('en_US','96','Niederösterreich'),('en_US','97','Oberösterreich'),('en_US','98','Salzburg'),('en_US','99','Kärnten'),('en_US','100','Steiermark'),('en_US','101','Tirol'),('en_US','102','Burgenland'),('en_US','103','Vorarlberg'),('en_US','104','Aargau'),('en_US','105','Appenzell Innerrhoden'),('en_US','106','Appenzell Ausserrhoden'),('en_US','107','Bern'),('en_US','108','Basel-Landschaft'),('en_US','109','Basel-Stadt'),('en_US','110','Freiburg'),('en_US','111','Genf'),('en_US','112','Glarus'),('en_US','113','Graubünden'),('en_US','114','Jura'),('en_US','115','Luzern'),('en_US','116','Neuenburg'),('en_US','117','Nidwalden'),('en_US','118','Obwalden'),('en_US','119','St. Gallen'),('en_US','120','Schaffhausen'),('en_US','121','Solothurn'),('en_US','122','Schwyz'),('en_US','123','Thurgau'),('en_US','124','Tessin'),('en_US','125','Uri'),('en_US','126','Waadt'),('en_US','127','Wallis'),('en_US','128','Zug'),('en_US','129','Zürich'),('en_US','130','A Coruña'),('en_US','131','Alava'),('en_US','132','Albacete'),('en_US','133','Alicante'),('en_US','134','Almeria'),('en_US','135','Asturias'),('en_US','136','Avila'),('en_US','137','Badajoz'),('en_US','138','Baleares'),('en_US','139','Barcelona'),('en_US','140','Burgos'),('en_US','141','Caceres'),('en_US','142','Cadiz'),('en_US','143','Cantabria'),('en_US','144','Castellon'),('en_US','145','Ceuta'),('en_US','146','Ciudad Real'),('en_US','147','Cordoba'),('en_US','148','Cuenca'),('en_US','149','Girona'),('en_US','150','Granada'),('en_US','151','Guadalajara'),('en_US','152','Guipuzcoa'),('en_US','153','Huelva'),('en_US','154','Huesca'),('en_US','155','Jaen'),('en_US','156','La Rioja'),('en_US','157','Las Palmas'),('en_US','158','Leon'),('en_US','159','Lleida'),('en_US','160','Lugo'),('en_US','161','Madrid'),('en_US','162','Malaga'),('en_US','163','Melilla'),('en_US','164','Murcia'),('en_US','165','Navarra'),('en_US','166','Ourense'),('en_US','167','Palencia'),('en_US','168','Pontevedra'),('en_US','169','Salamanca'),('en_US','170','Santa Cruz de Tenerife'),('en_US','171','Segovia'),('en_US','172','Sevilla'),('en_US','173','Soria'),('en_US','174','Tarragona'),('en_US','175','Teruel'),('en_US','176','Toledo'),('en_US','177','Valencia'),('en_US','178','Valladolid'),('en_US','179','Vizcaya'),('en_US','180','Zamora'),('en_US','181','Zaragoza'),('en_US','182','Ain'),('en_US','183','Aisne'),('en_US','184','Allier'),('en_US','185','Alpes-de-Haute-Provence'),('en_US','186','Hautes-Alpes'),('en_US','187','Alpes-Maritimes'),('en_US','188','Ardèche'),('en_US','189','Ardennes'),('en_US','190','Ariège'),('en_US','191','Aube'),('en_US','192','Aude'),('en_US','193','Aveyron'),('en_US','194','Bouches-du-Rhône'),('en_US','195','Calvados'),('en_US','196','Cantal'),('en_US','197','Charente'),('en_US','198','Charente-Maritime'),('en_US','199','Cher'),('en_US','200','Corrèze'),('en_US','201','Corse-du-Sud'),('en_US','202','Haute-Corse'),('en_US','203','Côte-d\'Or'),('en_US','204','Côtes-d\'Armor'),('en_US','205','Creuse'),('en_US','206','Dordogne'),('en_US','207','Doubs'),('en_US','208','Drôme'),('en_US','209','Eure'),('en_US','210','Eure-et-Loir'),('en_US','211','Finistère'),('en_US','212','Gard'),('en_US','213','Haute-Garonne'),('en_US','214','Gers'),('en_US','215','Gironde'),('en_US','216','Hérault'),('en_US','217','Ille-et-Vilaine'),('en_US','218','Indre'),('en_US','219','Indre-et-Loire'),('en_US','220','Isère'),('en_US','221','Jura'),('en_US','222','Landes'),('en_US','223','Loir-et-Cher'),('en_US','224','Loire'),('en_US','225','Haute-Loire'),('en_US','226','Loire-Atlantique'),('en_US','227','Loiret'),('en_US','228','Lot'),('en_US','229','Lot-et-Garonne'),('en_US','230','Lozère'),('en_US','231','Maine-et-Loire'),('en_US','232','Manche'),('en_US','233','Marne'),('en_US','234','Haute-Marne'),('en_US','235','Mayenne'),('en_US','236','Meurthe-et-Moselle'),('en_US','237','Meuse'),('en_US','238','Morbihan'),('en_US','239','Moselle'),('en_US','240','Nièvre'),('en_US','241','Nord'),('en_US','242','Oise'),('en_US','243','Orne'),('en_US','244','Pas-de-Calais'),('en_US','245','Puy-de-Dôme'),('en_US','246','Pyrénées-Atlantiques'),('en_US','247','Hautes-Pyrénées'),('en_US','248','Pyrénées-Orientales'),('en_US','249','Bas-Rhin'),('en_US','250','Haut-Rhin'),('en_US','251','Rhône'),('en_US','252','Haute-Saône'),('en_US','253','Saône-et-Loire'),('en_US','254','Sarthe'),('en_US','255','Savoie'),('en_US','256','Haute-Savoie'),('en_US','257','Paris'),('en_US','258','Seine-Maritime'),('en_US','259','Seine-et-Marne'),('en_US','260','Yvelines'),('en_US','261','Deux-Sèvres'),('en_US','262','Somme'),('en_US','263','Tarn'),('en_US','264','Tarn-et-Garonne'),('en_US','265','Var'),('en_US','266','Vaucluse'),('en_US','267','Vendée'),('en_US','268','Vienne'),('en_US','269','Haute-Vienne'),('en_US','270','Vosges'),('en_US','271','Yonne'),('en_US','272','Territoire-de-Belfort'),('en_US','273','Essonne'),('en_US','274','Hauts-de-Seine'),('en_US','275','Seine-Saint-Denis'),('en_US','276','Val-de-Marne'),('en_US','277','Val-d\'Oise'),('en_US','278','Alba'),('en_US','279','Arad'),('en_US','280','Argeş'),('en_US','281','Bacău'),('en_US','282','Bihor'),('en_US','283','Bistriţa-Năsăud'),('en_US','284','Botoşani'),('en_US','285','Braşov'),('en_US','286','Brăila'),('en_US','287','Bucureşti'),('en_US','288','Buzău'),('en_US','289','Caraş-Severin'),('en_US','290','Călăraşi'),('en_US','291','Cluj'),('en_US','292','Constanţa'),('en_US','293','Covasna'),('en_US','294','Dâmboviţa'),('en_US','295','Dolj'),('en_US','296','Galaţi'),('en_US','297','Giurgiu'),('en_US','298','Gorj'),('en_US','299','Harghita'),('en_US','300','Hunedoara'),('en_US','301','Ialomiţa'),('en_US','302','Iaşi'),('en_US','303','Ilfov'),('en_US','304','Maramureş'),('en_US','305','Mehedinţi'),('en_US','306','Mureş'),('en_US','307','Neamţ'),('en_US','308','Olt'),('en_US','309','Prahova'),('en_US','310','Satu-Mare'),('en_US','311','Sălaj'),('en_US','312','Sibiu'),('en_US','313','Suceava'),('en_US','314','Teleorman'),('en_US','315','Timiş'),('en_US','316','Tulcea'),('en_US','317','Vaslui'),('en_US','318','Vâlcea'),('en_US','319','Vrancea'),('en_US','320','Lappi'),('en_US','321','Pohjois-Pohjanmaa'),('en_US','322','Kainuu'),('en_US','323','Pohjois-Karjala'),('en_US','324','Pohjois-Savo'),('en_US','325','Etelä-Savo'),('en_US','326','Etelä-Pohjanmaa'),('en_US','327','Pohjanmaa'),('en_US','328','Pirkanmaa'),('en_US','329','Satakunta'),('en_US','330','Keski-Pohjanmaa'),('en_US','331','Keski-Suomi'),('en_US','332','Varsinais-Suomi'),('en_US','333','Etelä-Karjala'),('en_US','334','Päijät-Häme'),('en_US','335','Kanta-Häme'),('en_US','336','Uusimaa'),('en_US','337','Itä-Uusimaa'),('en_US','338','Kymenlaakso'),('en_US','339','Ahvenanmaa'),('en_US','340','Harjumaa'),('en_US','341','Hiiumaa'),('en_US','342','Ida-Virumaa'),('en_US','343','Jõgevamaa'),('en_US','344','Järvamaa'),('en_US','345','Läänemaa'),('en_US','346','Lääne-Virumaa'),('en_US','347','Põlvamaa'),('en_US','348','Pärnumaa'),('en_US','349','Raplamaa'),('en_US','350','Saaremaa'),('en_US','351','Tartumaa'),('en_US','352','Valgamaa'),('en_US','353','Viljandimaa'),('en_US','354','Võrumaa'),('en_US','355','Daugavpils'),('en_US','356','Jelgava'),('en_US','357','Jēkabpils'),('en_US','358','Jūrmala'),('en_US','359','Liepāja'),('en_US','360','Liepājas novads'),('en_US','361','Rēzekne'),('en_US','362','Rīga'),('en_US','363','Rīgas novads'),('en_US','364','Valmiera'),('en_US','365','Ventspils'),('en_US','366','Aglonas novads'),('en_US','367','Aizkraukles novads'),('en_US','368','Aizputes novads'),('en_US','369','Aknīstes novads'),('en_US','370','Alojas novads'),('en_US','371','Alsungas novads'),('en_US','372','Alūksnes novads'),('en_US','373','Amatas novads'),('en_US','374','Apes novads'),('en_US','375','Auces novads'),('en_US','376','Babītes novads'),('en_US','377','Baldones novads'),('en_US','378','Baltinavas novads'),('en_US','379','Balvu novads'),('en_US','380','Bauskas novads'),('en_US','381','Beverīnas novads'),('en_US','382','Brocēnu novads'),('en_US','383','Burtnieku novads'),('en_US','384','Carnikavas novads'),('en_US','385','Cesvaines novads'),('en_US','386','Ciblas novads'),('en_US','387','Cēsu novads'),('en_US','388','Dagdas novads'),('en_US','389','Daugavpils novads'),('en_US','390','Dobeles novads'),('en_US','391','Dundagas novads'),('en_US','392','Durbes novads'),('en_US','393','Engures novads'),('en_US','394','Garkalnes novads'),('en_US','395','Grobiņas novads'),('en_US','396','Gulbenes novads'),('en_US','397','Iecavas novads'),('en_US','398','Ikšķiles novads'),('en_US','399','Ilūkstes novads'),('en_US','400','Inčukalna novads'),('en_US','401','Jaunjelgavas novads'),('en_US','402','Jaunpiebalgas novads'),('en_US','403','Jaunpils novads'),('en_US','404','Jelgavas novads'),('en_US','405','Jēkabpils novads'),('en_US','406','Kandavas novads'),('en_US','407','Kokneses novads'),('en_US','408','Krimuldas novads'),('en_US','409','Krustpils novads'),('en_US','410','Krāslavas novads'),('en_US','411','Kuldīgas novads'),('en_US','412','Kārsavas novads'),('en_US','413','Lielvārdes novads'),('en_US','414','Limbažu novads'),('en_US','415','Lubānas novads'),('en_US','416','Ludzas novads'),('en_US','417','Līgatnes novads'),('en_US','418','Līvānu novads'),('en_US','419','Madonas novads'),('en_US','420','Mazsalacas novads'),('en_US','421','Mālpils novads'),('en_US','422','Mārupes novads'),('en_US','423','Naukšēnu novads'),('en_US','424','Neretas novads'),('en_US','425','Nīcas novads'),('en_US','426','Ogres novads'),('en_US','427','Olaines novads'),('en_US','428','Ozolnieku novads'),('en_US','429','Preiļu novads'),('en_US','430','Priekules novads'),('en_US','431','Priekuļu novads'),('en_US','432','Pārgaujas novads'),('en_US','433','Pāvilostas novads'),('en_US','434','Pļaviņu novads'),('en_US','435','Raunas novads'),('en_US','436','Riebiņu novads'),('en_US','437','Rojas novads'),('en_US','438','Ropažu novads'),('en_US','439','Rucavas novads'),('en_US','440','Rugāju novads'),('en_US','441','Rundāles novads'),('en_US','442','Rēzeknes novads'),('en_US','443','Rūjienas novads'),('en_US','444','Salacgrīvas novads'),('en_US','445','Salas novads'),('en_US','446','Salaspils novads'),('en_US','447','Saldus novads'),('en_US','448','Saulkrastu novads'),('en_US','449','Siguldas novads'),('en_US','450','Skrundas novads'),('en_US','451','Skrīveru novads'),('en_US','452','Smiltenes novads'),('en_US','453','Stopiņu novads'),('en_US','454','Strenču novads'),('en_US','455','Sējas novads'),('en_US','456','Talsu novads'),('en_US','457','Tukuma novads'),('en_US','458','Tērvetes novads'),('en_US','459','Vaiņodes novads'),('en_US','460','Valkas novads'),('en_US','461','Valmieras novads'),('en_US','462','Varakļānu novads'),('en_US','463','Vecpiebalgas novads'),('en_US','464','Vecumnieku novads'),('en_US','465','Ventspils novads'),('en_US','466','Viesītes novads'),('en_US','467','Viļakas novads'),('en_US','468','Viļānu novads'),('en_US','469','Vārkavas novads'),('en_US','470','Zilupes novads'),('en_US','471','Ādažu novads'),('en_US','472','Ērgļu novads'),('en_US','473','Ķeguma novads'),('en_US','474','Ķekavas novads'),('en_US','475','Alytaus Apskritis'),('en_US','476','Kauno Apskritis'),('en_US','477','Klaipėdos Apskritis'),('en_US','478','Marijampolės Apskritis'),('en_US','479','Panevėžio Apskritis'),('en_US','480','Šiaulių Apskritis'),('en_US','481','Tauragės Apskritis'),('en_US','482','Telšių Apskritis'),('en_US','483','Utenos Apskritis'),('en_US','484','Vilniaus Apskritis'),('en_US','485','Acre'),('en_US','486','Alagoas'),('en_US','487','Amapá'),('en_US','488','Amazonas'),('en_US','489','Bahia'),('en_US','490','Ceará'),('en_US','491','Espírito Santo'),('en_US','492','Goiás'),('en_US','493','Maranhão'),('en_US','494','Mato Grosso'),('en_US','495','Mato Grosso do Sul'),('en_US','496','Minas Gerais'),('en_US','497','Pará'),('en_US','498','Paraíba'),('en_US','499','Paraná'),('en_US','500','Pernambuco'),('en_US','501','Piauí'),('en_US','502','Rio de Janeiro'),('en_US','503','Rio Grande do Norte'),('en_US','504','Rio Grande do Sul'),('en_US','505','Rondônia'),('en_US','506','Roraima'),('en_US','507','Santa Catarina'),('en_US','508','São Paulo'),('en_US','509','Sergipe'),('en_US','510','Tocantins'),('en_US','511','Distrito Federal');
/*!40000 ALTER TABLE `mgk3_directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_directory_currency_rate`
--

DROP TABLE IF EXISTS `mgk3_directory_currency_rate`;
CREATE TABLE `mgk3_directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `MGK3_DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';

--
-- Dumping data for table `mgk3_directory_currency_rate`
--

LOCK TABLES `mgk3_directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `mgk3_directory_currency_rate` DISABLE KEYS */;
INSERT INTO `mgk3_directory_currency_rate` VALUES ('EUR','EUR','1.000000000000'),('EUR','USD','1.415000000000'),('USD','EUR','0.706700000000'),('USD','USD','1.000000000000');
/*!40000 ALTER TABLE `mgk3_directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_downloadable_link`
--

DROP TABLE IF EXISTS `mgk3_downloadable_link`;
CREATE TABLE `mgk3_downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `MGK3_DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';

--
-- Table structure for table `mgk3_downloadable_link_price`
--

DROP TABLE IF EXISTS `mgk3_downloadable_link_price`;
CREATE TABLE `mgk3_downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `MGK3_DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `MGK3_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';

--
-- Table structure for table `mgk3_downloadable_link_purchased`
--

DROP TABLE IF EXISTS `mgk3_downloadable_link_purchased`;
CREATE TABLE `mgk3_downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `MGK3_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `MGK3_DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `MGK3_DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';

--
-- Table structure for table `mgk3_downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `mgk3_downloadable_link_purchased_item`;
CREATE TABLE `mgk3_downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `MGK3_DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `MGK3_DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `MGK3_DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';

--
-- Table structure for table `mgk3_downloadable_link_title`
--

DROP TABLE IF EXISTS `mgk3_downloadable_link_title`;
CREATE TABLE `mgk3_downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `MGK3_DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `MGK3_DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';

--
-- Table structure for table `mgk3_downloadable_sample`
--

DROP TABLE IF EXISTS `mgk3_downloadable_sample`;
CREATE TABLE `mgk3_downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `MGK3_DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';

--
-- Table structure for table `mgk3_downloadable_sample_title`
--

DROP TABLE IF EXISTS `mgk3_downloadable_sample_title`;
CREATE TABLE `mgk3_downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `MGK3_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `MGK3_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';

--
-- Table structure for table `mgk3_eav_attribute`
--

DROP TABLE IF EXISTS `mgk3_eav_attribute`;
CREATE TABLE `mgk3_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) DEFAULT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `MGK3_EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';

--
-- Dumping data for table `mgk3_eav_attribute`
--

LOCK TABLES `mgk3_eav_attribute` WRITE;
/*!40000 ALTER TABLE `mgk3_eav_attribute` DISABLE KEYS */;
INSERT INTO `mgk3_eav_attribute` VALUES (1,1,'website_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website','static',NULL,NULL,'select','Associate to Website',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website',1,0,NULL,0,NULL),(2,1,'store_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store','static',NULL,NULL,'select','Create In',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store',1,0,NULL,0,NULL),(3,1,'created_in',NULL,NULL,'static',NULL,NULL,'text','Created From',NULL,NULL,0,0,NULL,0,NULL),(4,1,'prefix',NULL,NULL,'static',NULL,NULL,'text','Prefix',NULL,NULL,0,0,NULL,0,NULL),(5,1,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(6,1,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(7,1,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(8,1,'suffix',NULL,NULL,'static',NULL,NULL,'text','Suffix',NULL,NULL,0,0,NULL,0,NULL),(9,1,'email',NULL,NULL,'static',NULL,NULL,'text','Email',NULL,NULL,1,0,NULL,0,NULL),(10,1,'group_id',NULL,NULL,'static',NULL,NULL,'select','Group',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group',1,0,NULL,0,NULL),(11,1,'dob',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','static',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Date of Birth',NULL,NULL,0,0,NULL,0,NULL),(12,1,'password_hash',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password','static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(13,1,'rp_token',NULL,NULL,'static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(14,1,'rp_token_created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,0,0,NULL,0,NULL),(15,1,'default_billing',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing','static',NULL,NULL,'text','Default Billing Address',NULL,NULL,0,0,NULL,0,NULL),(16,1,'default_shipping',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping','static',NULL,NULL,'text','Default Shipping Address',NULL,NULL,0,0,NULL,0,NULL),(17,1,'taxvat',NULL,NULL,'static',NULL,NULL,'text','Tax/VAT Number',NULL,NULL,0,0,NULL,0,NULL),(18,1,'confirmation',NULL,NULL,'static',NULL,NULL,'text','Is Confirmed',NULL,NULL,0,0,NULL,0,NULL),(19,1,'created_at',NULL,NULL,'static',NULL,NULL,'date','Created At',NULL,NULL,0,0,NULL,0,NULL),(20,1,'gender',NULL,NULL,'static',NULL,NULL,'select','Gender',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',0,0,NULL,0,NULL),(21,1,'disable_auto_group_change',NULL,'Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean','static',NULL,NULL,'boolean','Disable Automatic Group Change Based on VAT ID',NULL,NULL,0,0,NULL,0,NULL),(22,2,'prefix',NULL,NULL,'static',NULL,NULL,'text','Prefix',NULL,NULL,0,0,NULL,0,NULL),(23,2,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(24,2,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(25,2,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(26,2,'suffix',NULL,NULL,'static',NULL,NULL,'text','Suffix',NULL,NULL,0,0,NULL,0,NULL),(27,2,'company',NULL,NULL,'static',NULL,NULL,'text','Company',NULL,NULL,0,0,NULL,0,NULL),(28,2,'street',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend','static',NULL,NULL,'multiline','Street Address',NULL,NULL,1,0,NULL,0,NULL),(29,2,'city',NULL,NULL,'static',NULL,NULL,'text','City',NULL,NULL,1,0,NULL,0,NULL),(30,2,'country_id',NULL,NULL,'static',NULL,NULL,'select','Country',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country',1,0,NULL,0,NULL),(31,2,'region',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region','static',NULL,NULL,'text','State/Province',NULL,NULL,0,0,NULL,0,NULL),(32,2,'region_id',NULL,NULL,'static',NULL,NULL,'hidden','State/Province',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region',0,0,NULL,0,NULL),(33,2,'postcode',NULL,NULL,'static',NULL,NULL,'text','Zip/Postal Code',NULL,NULL,0,0,NULL,0,NULL),(34,2,'telephone',NULL,NULL,'static',NULL,NULL,'text','Phone Number',NULL,NULL,1,0,NULL,0,NULL),(35,2,'fax',NULL,NULL,'static',NULL,NULL,'text','Fax',NULL,NULL,0,0,NULL,0,NULL),(36,2,'vat_id',NULL,NULL,'static',NULL,NULL,'text','VAT number',NULL,NULL,0,0,NULL,0,NULL),(37,2,'vat_is_valid',NULL,NULL,'static',NULL,NULL,'text','VAT number validity',NULL,NULL,0,0,NULL,0,NULL),(38,2,'vat_request_id',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request ID',NULL,NULL,0,0,NULL,0,NULL),(39,2,'vat_request_date',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request date',NULL,NULL,0,0,NULL,0,NULL),(40,2,'vat_request_success',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request success',NULL,NULL,0,0,NULL,0,NULL),(41,1,'updated_at',NULL,NULL,'static',NULL,NULL,'date','Updated At',NULL,NULL,0,0,NULL,0,NULL),(42,1,'failures_num',NULL,NULL,'static',NULL,NULL,'hidden','Failures Number',NULL,NULL,0,0,NULL,0,NULL),(43,1,'first_failure',NULL,NULL,'static',NULL,NULL,'date','First Failure Date',NULL,NULL,0,0,NULL,0,NULL),(44,1,'lock_expires',NULL,NULL,'static',NULL,NULL,'date','Failures Number',NULL,NULL,0,0,NULL,0,NULL),(45,3,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(46,3,'is_active',NULL,NULL,'int',NULL,NULL,'select','Is Active',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,NULL,0,NULL),(47,3,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(48,3,'image',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image','varchar',NULL,NULL,'image','Image',NULL,NULL,0,0,NULL,0,NULL),(49,3,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Page Title',NULL,NULL,0,0,NULL,0,NULL),(50,3,'meta_keywords',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(51,3,'meta_description',NULL,NULL,'text',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,NULL),(52,3,'display_mode',NULL,NULL,'varchar',NULL,NULL,'select','Display Mode',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode',0,0,NULL,0,NULL),(53,3,'landing_page',NULL,NULL,'int',NULL,NULL,'select','CMS Block',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page',0,0,NULL,0,NULL),(54,3,'is_anchor',NULL,NULL,'int',NULL,NULL,'select','Is Anchor',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,'1',0,NULL),(55,3,'path',NULL,NULL,'static',NULL,NULL,'text','Path',NULL,NULL,0,0,NULL,0,NULL),(56,3,'position',NULL,NULL,'static',NULL,NULL,'text','Position',NULL,NULL,0,0,NULL,0,NULL),(57,3,'all_children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(58,3,'path_in_store',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(59,3,'children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(60,3,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(61,3,'custom_design_from','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Active From',NULL,NULL,0,0,NULL,0,NULL),(62,3,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(63,3,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(64,3,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(65,3,'level',NULL,NULL,'static',NULL,NULL,'text','Level',NULL,NULL,0,0,NULL,0,NULL),(66,3,'children_count',NULL,NULL,'static',NULL,NULL,'text','Children Count',NULL,NULL,0,0,NULL,0,NULL),(67,3,'available_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','text',NULL,NULL,'multiselect','Available Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(68,3,'default_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','varchar',NULL,NULL,'select','Default Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(69,3,'include_in_menu',NULL,NULL,'int',NULL,NULL,'select','Include in Navigation Menu',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,'1',0,NULL),(70,3,'custom_use_parent_settings',NULL,NULL,'int',NULL,NULL,'select','Use Parent Category Settings',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(71,3,'custom_apply_to_products',NULL,NULL,'int',NULL,NULL,'select','Apply To Products',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(72,3,'filter_price_range',NULL,NULL,'decimal',NULL,NULL,'text','Layered Navigation Price Step',NULL,NULL,0,0,NULL,0,NULL),(73,4,'name',NULL,NULL,'varchar',NULL,NULL,'text','Product Name','validate-length maximum-length-255',NULL,1,0,NULL,0,NULL),(74,4,'sku',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku','static',NULL,NULL,'text','SKU','validate-length maximum-length-64',NULL,1,0,NULL,1,NULL),(75,4,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(76,4,'short_description',NULL,NULL,'text',NULL,NULL,'textarea','Short Description',NULL,NULL,0,0,NULL,0,NULL),(77,4,'price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Price',NULL,NULL,1,0,NULL,0,NULL),(78,4,'special_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Special Price',NULL,NULL,0,0,NULL,0,NULL),(79,4,'special_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Special Price From Date',NULL,NULL,0,0,NULL,0,NULL),(80,4,'special_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Special Price To Date',NULL,NULL,0,0,NULL,0,NULL),(81,4,'cost',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Cost',NULL,NULL,0,1,NULL,0,NULL),(82,4,'weight',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight','decimal',NULL,NULL,'weight','Weight',NULL,NULL,0,0,NULL,0,NULL),(83,4,'manufacturer',NULL,NULL,'int',NULL,NULL,'select','Manufacturer',NULL,NULL,0,1,NULL,0,NULL),(84,4,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Meta Title',NULL,NULL,0,0,NULL,0,NULL),(85,4,'meta_keyword',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(86,4,'meta_description',NULL,NULL,'varchar',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,'Maximum 255 chars. Meta Description should optimally be between 150-160 characters'),(87,4,'image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Base',NULL,NULL,0,0,NULL,0,NULL),(88,4,'small_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Small',NULL,NULL,0,0,NULL,0,NULL),(89,4,'thumbnail',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Thumbnail',NULL,NULL,0,0,NULL,0,NULL),(90,4,'media_gallery',NULL,NULL,'static',NULL,NULL,'gallery','Media Gallery',NULL,NULL,0,0,NULL,0,NULL),(91,4,'old_id',NULL,NULL,'int',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(92,4,'tier_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice','decimal',NULL,NULL,'text','Tier Price',NULL,NULL,0,0,NULL,0,NULL),(93,4,'color',NULL,NULL,'int',NULL,NULL,'select','Color',NULL,NULL,0,1,NULL,0,NULL),(94,4,'news_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Set Product as New from Date',NULL,NULL,0,0,NULL,0,NULL),(95,4,'news_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Set Product as New to Date',NULL,NULL,0,0,NULL,0,NULL),(96,4,'gallery',NULL,NULL,'varchar',NULL,NULL,'gallery','Image Gallery',NULL,NULL,0,0,NULL,0,NULL),(97,4,'status',NULL,NULL,'int',NULL,NULL,'select','Enable Product',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status',0,0,'1',0,NULL),(98,4,'minimal_price',NULL,NULL,'decimal',NULL,NULL,'price','Minimal Price',NULL,NULL,0,0,NULL,0,NULL),(99,4,'visibility',NULL,NULL,'int',NULL,NULL,'select','Visibility',NULL,'Magento\\Catalog\\Model\\Product\\Visibility',0,0,'4',0,NULL),(100,4,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','New Theme',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(101,4,'custom_design_from',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),(102,4,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(103,4,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Layout Update XML',NULL,NULL,0,0,NULL,0,NULL),(104,4,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(105,4,'category_ids',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category','static',NULL,NULL,'text','Categories',NULL,NULL,0,0,NULL,0,NULL),(106,4,'options_container',NULL,NULL,'varchar',NULL,NULL,'select','Display Product Options In',NULL,'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container',0,0,'container2',0,NULL),(107,4,'required_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(108,4,'has_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(109,4,'image_label',NULL,NULL,'varchar',NULL,NULL,'text','Image Label',NULL,NULL,0,0,NULL,0,NULL),(110,4,'small_image_label',NULL,NULL,'varchar',NULL,NULL,'text','Small Image Label',NULL,NULL,0,0,NULL,0,NULL),(111,4,'thumbnail_label',NULL,NULL,'varchar',NULL,NULL,'text','Thumbnail Label',NULL,NULL,0,0,NULL,0,NULL),(112,4,'created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),(113,4,'updated_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,1,0,NULL,0,NULL),(114,4,'country_of_manufacture',NULL,NULL,'varchar',NULL,NULL,'select','Country of Manufacture',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture',0,0,NULL,0,NULL),(115,4,'quantity_and_stock_status',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock','int',NULL,NULL,'select','Quantity',NULL,'Magento\\CatalogInventory\\Model\\Source\\Stock',0,0,'1',0,NULL),(116,4,'custom_layout',NULL,NULL,'varchar',NULL,NULL,'select','New Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(117,3,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(118,3,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(119,4,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(120,4,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(121,4,'msrp',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Manufacturer\'s Suggested Retail Price',NULL,NULL,0,0,NULL,0,NULL),(122,4,'msrp_display_actual_price_type',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Display Actual Price',NULL,'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price',0,0,'0',0,NULL),(123,4,'price_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Price',NULL,NULL,1,0,'0',0,NULL),(124,4,'sku_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic SKU',NULL,NULL,1,0,'0',0,NULL),(125,4,'weight_type',NULL,NULL,'int',NULL,NULL,'boolean','Dynamic Weight',NULL,NULL,1,0,'0',0,NULL),(126,4,'price_view',NULL,NULL,'int',NULL,NULL,'select','Price View',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View',1,0,NULL,0,NULL),(127,4,'shipment_type',NULL,NULL,'int',NULL,NULL,'select','Ship Bundle Items',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Shipment\\Type',1,0,'0',0,NULL),(128,4,'links_purchased_separately',NULL,NULL,'int',NULL,NULL,NULL,'Links can be purchased separately',NULL,NULL,1,0,NULL,0,NULL),(129,4,'samples_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Samples title',NULL,NULL,1,0,NULL,0,NULL),(130,4,'links_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Links title',NULL,NULL,1,0,NULL,0,NULL),(131,4,'links_exist',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'0',0,NULL),(132,4,'swatch_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Swatch',NULL,NULL,0,0,NULL,0,NULL),(133,4,'tax_class_id',NULL,NULL,'int',NULL,NULL,'select','Tax Class',NULL,'Magento\\Tax\\Model\\TaxClass\\Source\\Product',0,0,'2',0,NULL),(134,4,'gift_message_available',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Allow Gift Message',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL);
/*!40000 ALTER TABLE `mgk3_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_eav_attribute_group`
--

DROP TABLE IF EXISTS `mgk3_eav_attribute_group`;
CREATE TABLE `mgk3_eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Default Id',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `MGK3_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `MGK3_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';

--
-- Dumping data for table `mgk3_eav_attribute_group`
--

LOCK TABLES `mgk3_eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `mgk3_eav_attribute_group` DISABLE KEYS */;
INSERT INTO `mgk3_eav_attribute_group` VALUES (1,1,'General',1,1,'general',NULL),(2,2,'General',1,1,'general',NULL),(3,3,'General',10,1,'general',NULL),(4,3,'General Information',2,0,'general-information',NULL),(5,3,'Display Settings',20,0,'display-settings',NULL),(6,3,'Custom Design',30,0,'custom-design',NULL),(7,4,'Product Details',10,1,'product-details','basic'),(8,4,'Advanced Pricing',40,0,'advanced-pricing','advanced'),(9,4,'Search Engine Optimization',30,0,'search-engine-optimization','basic'),(10,4,'Images',20,0,'image-management','basic'),(11,4,'Design',50,0,'design','advanced'),(12,4,'Autosettings',60,0,'autosettings','advanced'),(13,4,'Content',15,0,'content','basic'),(14,4,'Schedule Design Update',55,0,'schedule-design-update','advanced'),(15,4,'Bundle Items',16,0,'bundle-items',NULL),(16,5,'General',1,1,'general',NULL),(17,6,'General',1,1,'general',NULL),(18,7,'General',1,1,'general',NULL),(19,8,'General',1,1,'general',NULL),(20,4,'Gift Options',61,0,'gift-options',NULL);
/*!40000 ALTER TABLE `mgk3_eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_eav_attribute_label`
--

DROP TABLE IF EXISTS `mgk3_eav_attribute_label`;
CREATE TABLE `mgk3_eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `MGK3_EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `MGK3_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';

--
-- Table structure for table `mgk3_eav_attribute_option`
--

DROP TABLE IF EXISTS `mgk3_eav_attribute_option`;
CREATE TABLE `mgk3_eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `MGK3_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';

--
-- Dumping data for table `mgk3_eav_attribute_option`
--

LOCK TABLES `mgk3_eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `mgk3_eav_attribute_option` DISABLE KEYS */;
INSERT INTO `mgk3_eav_attribute_option` VALUES ('1',20,0),('2',20,1),('3',20,3);
/*!40000 ALTER TABLE `mgk3_eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_eav_attribute_option_swatch`
--

DROP TABLE IF EXISTS `mgk3_eav_attribute_option_swatch`;
CREATE TABLE `mgk3_eav_attribute_option_swatch` (
  `swatch_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type` smallint(5) unsigned NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value',
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `MGK3_EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `MGK3_EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`),
  KEY `MGK3_EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Swatches table';

--
-- Table structure for table `mgk3_eav_attribute_option_value`
--

DROP TABLE IF EXISTS `mgk3_eav_attribute_option_value`;
CREATE TABLE `mgk3_eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `MGK3_EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `MGK3_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';

--
-- Dumping data for table `mgk3_eav_attribute_option_value`
--

LOCK TABLES `mgk3_eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `mgk3_eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `mgk3_eav_attribute_option_value` VALUES ('1','1',0,'Male'),('2','2',0,'Female'),('3','3',0,'Not Specified');
/*!40000 ALTER TABLE `mgk3_eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_eav_attribute_set`
--

DROP TABLE IF EXISTS `mgk3_eav_attribute_set`;
CREATE TABLE `mgk3_eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `MGK3_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `MGK3_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';

--
-- Dumping data for table `mgk3_eav_attribute_set`
--

LOCK TABLES `mgk3_eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `mgk3_eav_attribute_set` DISABLE KEYS */;
INSERT INTO `mgk3_eav_attribute_set` VALUES (1,1,'Default',2),(2,2,'Default',2),(3,3,'Default',1),(4,4,'Default',1),(5,5,'Default',1),(6,6,'Default',1),(7,7,'Default',1),(8,8,'Default',1);
/*!40000 ALTER TABLE `mgk3_eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_eav_entity`
--

DROP TABLE IF EXISTS `mgk3_eav_entity`;
CREATE TABLE `mgk3_eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `MGK3_EAV_ENTITY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';

--
-- Table structure for table `mgk3_eav_entity_attribute`
--

DROP TABLE IF EXISTS `mgk3_eav_entity_attribute`;
CREATE TABLE `mgk3_eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `MGK3_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `MGK3_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `MGK3_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `MGK3_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';

--
-- Dumping data for table `mgk3_eav_entity_attribute`
--

LOCK TABLES `mgk3_eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `mgk3_eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `mgk3_eav_entity_attribute` VALUES ('1',1,1,1,1,10),('2',1,1,1,2,20),('3',1,1,1,3,20),('4',1,1,1,4,30),('5',1,1,1,5,40),('6',1,1,1,6,50),('7',1,1,1,7,60),('8',1,1,1,8,70),('9',1,1,1,9,80),('10',1,1,1,10,25),('11',1,1,1,11,90),('12',1,1,1,12,81),('13',1,1,1,13,115),('14',1,1,1,14,120),('15',1,1,1,15,82),('16',1,1,1,16,83),('17',1,1,1,17,100),('18',1,1,1,18,85),('19',1,1,1,19,86),('20',1,1,1,20,110),('21',1,1,1,21,121),('22',2,2,2,22,10),('23',2,2,2,23,20),('24',2,2,2,24,30),('25',2,2,2,25,40),('26',2,2,2,26,50),('27',2,2,2,27,60),('28',2,2,2,28,70),('29',2,2,2,29,80),('30',2,2,2,30,90),('31',2,2,2,31,100),('32',2,2,2,32,100),('33',2,2,2,33,110),('34',2,2,2,34,120),('35',2,2,2,35,130),('36',2,2,2,36,131),('37',2,2,2,37,132),('38',2,2,2,38,133),('39',2,2,2,39,134),('40',2,2,2,40,135),('41',1,1,1,41,87),('42',1,1,1,42,100),('43',1,1,1,43,110),('44',1,1,1,44,120),('45',3,3,4,45,1),('46',3,3,4,46,2),('47',3,3,4,47,4),('48',3,3,4,48,5),('49',3,3,4,49,6),('50',3,3,4,50,7),('51',3,3,4,51,8),('52',3,3,5,52,10),('53',3,3,5,53,20),('54',3,3,5,54,30),('55',3,3,4,55,12),('56',3,3,4,56,13),('57',3,3,4,57,14),('58',3,3,4,58,15),('59',3,3,4,59,16),('60',3,3,6,60,10),('61',3,3,6,61,30),('62',3,3,6,62,40),('63',3,3,6,63,50),('64',3,3,6,64,60),('65',3,3,4,65,24),('66',3,3,4,66,25),('67',3,3,5,67,40),('68',3,3,5,68,50),('69',3,3,4,69,10),('70',3,3,6,70,5),('71',3,3,6,71,6),('72',3,3,5,72,51),('73',4,4,7,73,10),('74',4,4,7,74,20),('75',4,4,13,75,90),('76',4,4,13,76,100),('77',4,4,7,77,30),('78',4,4,8,78,3),('79',4,4,8,79,4),('80',4,4,8,80,5),('81',4,4,8,81,6),('82',4,4,7,82,70),('83',4,4,9,84,20),('84',4,4,9,85,30),('85',4,4,9,86,40),('86',4,4,10,87,1),('87',4,4,10,88,2),('88',4,4,10,89,3),('89',4,4,10,90,4),('90',4,4,7,91,6),('91',4,4,8,92,7),('92',4,4,7,94,90),('93',4,4,7,95,100),('94',4,4,10,96,5),('95',4,4,7,97,5),('96',4,4,8,98,8),('97',4,4,7,99,80),('98',4,4,14,100,40),('99',4,4,14,101,20),('100',4,4,14,102,30),('101',4,4,11,103,10),('102',4,4,11,104,5),('103',4,4,7,105,80),('104',4,4,11,106,6),('105',4,4,7,107,14),('106',4,4,7,108,15),('107',4,4,7,109,16),('108',4,4,7,110,17),('109',4,4,7,111,18),('110',4,4,7,112,19),('111',4,4,7,113,20),('112',4,4,7,114,110),('113',4,4,7,115,60),('114',4,4,14,116,50),('115',3,3,4,117,3),('116',3,3,4,118,17),('117',4,4,9,119,10),('118',4,4,7,120,11),('119',4,4,8,121,9),('120',4,4,8,122,10),('121',4,4,7,123,31),('122',4,4,7,124,21),('123',4,4,7,125,71),('124',4,4,8,126,11),('125',4,4,15,127,1),('126',4,4,7,128,111),('127',4,4,7,129,112),('128',4,4,7,130,113),('129',4,4,7,131,114),('130',4,4,10,132,3),('131',4,4,7,133,40),('132',4,4,20,134,10);
/*!40000 ALTER TABLE `mgk3_eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_eav_entity_datetime`
--

DROP TABLE IF EXISTS `mgk3_eav_entity_datetime`;
CREATE TABLE `mgk3_eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `MGK3_EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `MGK3_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

--
-- Table structure for table `mgk3_eav_entity_decimal`
--

DROP TABLE IF EXISTS `mgk3_eav_entity_decimal`;
CREATE TABLE `mgk3_eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `MGK3_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `MGK3_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

--
-- Table structure for table `mgk3_eav_entity_int`
--

DROP TABLE IF EXISTS `mgk3_eav_entity_int`;
CREATE TABLE `mgk3_eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `MGK3_EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `MGK3_EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

--
-- Table structure for table `mgk3_eav_entity_store`
--

DROP TABLE IF EXISTS `mgk3_eav_entity_store`;
CREATE TABLE `mgk3_eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `MGK3_EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `MGK3_EAV_ENTITY_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';

--
-- Table structure for table `mgk3_eav_entity_text`
--

DROP TABLE IF EXISTS `mgk3_eav_entity_text`;
CREATE TABLE `mgk3_eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `MGK3_EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `MGK3_EAV_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

--
-- Table structure for table `mgk3_eav_entity_type`
--

DROP TABLE IF EXISTS `mgk3_eav_entity_type`;
CREATE TABLE `mgk3_eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `MGK3_EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';

--
-- Dumping data for table `mgk3_eav_entity_type`
--

LOCK TABLES `mgk3_eav_entity_type` WRITE;
/*!40000 ALTER TABLE `mgk3_eav_entity_type` DISABLE KEYS */;
INSERT INTO `mgk3_eav_entity_type` VALUES (1,'customer','Magento\\Customer\\Model\\ResourceModel\\Customer','Magento\\Customer\\Model\\Attribute','customer_entity',NULL,NULL,1,'default',1,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),(2,'customer_address','Magento\\Customer\\Model\\ResourceModel\\Address','Magento\\Customer\\Model\\Attribute','customer_address_entity',NULL,NULL,1,'default',2,NULL,0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),(3,'catalog_category','Magento\\Catalog\\Model\\ResourceModel\\Category','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_category_entity',NULL,NULL,1,'default',3,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),(4,'catalog_product','Magento\\Catalog\\Model\\ResourceModel\\Product','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_product_entity',NULL,NULL,1,'default',4,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),(5,'order','Magento\\Sales\\Model\\ResourceModel\\Order',NULL,'sales_order',NULL,NULL,1,'default',5,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(6,'invoice','Magento\\Sales\\Model\\ResourceModel\\Order',NULL,'sales_invoice',NULL,NULL,1,'default',6,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(7,'creditmemo','Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo',NULL,'sales_creditmemo',NULL,NULL,1,'default',7,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(8,'shipment','Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment',NULL,'sales_shipment',NULL,NULL,1,'default',8,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL);
/*!40000 ALTER TABLE `mgk3_eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_eav_entity_varchar`
--

DROP TABLE IF EXISTS `mgk3_eav_entity_varchar`;
CREATE TABLE `mgk3_eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `MGK3_EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `MGK3_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `MGK3_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

--
-- Table structure for table `mgk3_eav_form_element`
--

DROP TABLE IF EXISTS `mgk3_eav_form_element`;
CREATE TABLE `mgk3_eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `MGK3_EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `MGK3_EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `MGK3_EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';

--
-- Dumping data for table `mgk3_eav_form_element`
--

LOCK TABLES `mgk3_eav_form_element` WRITE;
/*!40000 ALTER TABLE `mgk3_eav_form_element` DISABLE KEYS */;
INSERT INTO `mgk3_eav_form_element` VALUES ('1',1,NULL,23,'0'),('2',1,NULL,25,'1'),('3',1,NULL,27,'2'),('4',1,NULL,9,'3'),('5',1,NULL,28,'4'),('6',1,NULL,29,'5'),('7',1,NULL,31,'6'),('8',1,NULL,33,'7'),('9',1,NULL,30,'8'),('10',1,NULL,34,'9'),('11',1,NULL,35,'10'),('12',2,NULL,23,'0'),('13',2,NULL,25,'1'),('14',2,NULL,27,'2'),('15',2,NULL,9,'3'),('16',2,NULL,28,'4'),('17',2,NULL,29,'5'),('18',2,NULL,31,'6'),('19',2,NULL,33,'7'),('20',2,NULL,30,'8'),('21',2,NULL,34,'9'),('22',2,NULL,35,'10'),('23',3,NULL,23,'0'),('24',3,NULL,25,'1'),('25',3,NULL,27,'2'),('26',3,NULL,28,'3'),('27',3,NULL,29,'4'),('28',3,NULL,31,'5'),('29',3,NULL,33,'6'),('30',3,NULL,30,'7'),('31',3,NULL,34,'8'),('32',3,NULL,35,'9'),('33',4,NULL,23,'0'),('34',4,NULL,25,'1'),('35',4,NULL,27,'2'),('36',4,NULL,28,'3'),('37',4,NULL,29,'4'),('38',4,NULL,31,'5'),('39',4,NULL,33,'6'),('40',4,NULL,30,'7'),('41',4,NULL,34,'8'),('42',4,NULL,35,'9');
/*!40000 ALTER TABLE `mgk3_eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_eav_form_fieldset`
--

DROP TABLE IF EXISTS `mgk3_eav_form_fieldset`;
CREATE TABLE `mgk3_eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `MGK3_EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';

--
-- Table structure for table `mgk3_eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `mgk3_eav_form_fieldset_label`;
CREATE TABLE `mgk3_eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `MGK3_EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';

--
-- Table structure for table `mgk3_eav_form_type`
--

DROP TABLE IF EXISTS `mgk3_eav_form_type`;
CREATE TABLE `mgk3_eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `MGK3_EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `MGK3_EAV_FORM_TYPE_STORE_ID` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';

--
-- Dumping data for table `mgk3_eav_form_type`
--

LOCK TABLES `mgk3_eav_form_type` WRITE;
/*!40000 ALTER TABLE `mgk3_eav_form_type` DISABLE KEYS */;
INSERT INTO `mgk3_eav_form_type` VALUES (1,'checkout_onepage_register','checkout_onepage_register',1,'',0),(2,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0),(3,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0),(4,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0);
/*!40000 ALTER TABLE `mgk3_eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_eav_form_type_entity`
--

DROP TABLE IF EXISTS `mgk3_eav_form_type_entity`;
CREATE TABLE `mgk3_eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `MGK3_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';

--
-- Dumping data for table `mgk3_eav_form_type_entity`
--

LOCK TABLES `mgk3_eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `mgk3_eav_form_type_entity` DISABLE KEYS */;
INSERT INTO `mgk3_eav_form_type_entity` VALUES (1,1),(2,1),(1,2),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `mgk3_eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_email_template`
--

DROP TABLE IF EXISTS `mgk3_email_template`;
CREATE TABLE `mgk3_email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of Template Creation',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `MGK3_EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `MGK3_EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `MGK3_EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates';

--
-- Table structure for table `mgk3_flag`
--

DROP TABLE IF EXISTS `mgk3_flag`;
CREATE TABLE `mgk3_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `MGK3_FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Flag';

--
-- Table structure for table `mgk3_gift_message`
--

DROP TABLE IF EXISTS `mgk3_gift_message`;
CREATE TABLE `mgk3_gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';

--
-- Table structure for table `mgk3_googleoptimizer_code`
--

DROP TABLE IF EXISTS `mgk3_googleoptimizer_code`;
CREATE TABLE `mgk3_googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code id',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Optimized entity id product id or catalog id',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store id',
  `experiment_script` text COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `MGK3_GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Experiment code';

--
-- Table structure for table `mgk3_import_history`
--

DROP TABLE IF EXISTS `mgk3_import_history`;
CREATE TABLE `mgk3_import_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History record Id',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Started at',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import history table';

--
-- Table structure for table `mgk3_importexport_importdata`
--

DROP TABLE IF EXISTS `mgk3_importexport_importdata`;
CREATE TABLE `mgk3_importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';

--
-- Table structure for table `mgk3_indexer_state`
--

DROP TABLE IF EXISTS `mgk3_indexer_state`;
CREATE TABLE `mgk3_indexer_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Indexer State Id',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer Id',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config',
  PRIMARY KEY (`state_id`),
  KEY `MGK3_INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Indexer State';

--
-- Dumping data for table `mgk3_indexer_state`
--

LOCK TABLES `mgk3_indexer_state` WRITE;
/*!40000 ALTER TABLE `mgk3_indexer_state` DISABLE KEYS */;
INSERT INTO `mgk3_indexer_state` VALUES ('1','design_config_grid','valid','2017-01-14 22:44:05','27baa8fe6a5369f52c8b7cbd54a3c3c4'),('2','customer_grid','invalid','2017-01-16 16:04:07','d572ea00944c9e3f517b3f46bad058a4'),('3','catalog_category_product','invalid','2017-01-14 22:44:05','57b48d3cf1fcd64abe6b01dea3173d02'),('4','catalog_product_category','invalid','2017-01-14 22:44:05','9957f66909342cc58ff2703dcd268bf4'),('5','catalog_product_price','invalid','2017-01-14 22:44:05','15a819a577a149220cd0722c291de721'),('6','catalog_product_attribute','invalid','2017-01-14 22:44:05','77eed0bf72b16099d299d0ab47b74910'),('7','cataloginventory_stock','invalid','2017-01-14 22:44:05','78a405fd852458c326c85096099d7d5e'),('8','catalogrule_rule','invalid','2017-01-14 22:44:05','5afe3cacdcb52ec3a7e68dc245679021'),('9','catalogrule_product','invalid','2017-01-14 22:44:05','0ebee9e52ed424273132e8227fe646f3'),('10','catalogsearch_fulltext','valid','2017-01-14 22:44:05','4486b57e2021aa78b526c68c9af2dcab');
/*!40000 ALTER TABLE `mgk3_indexer_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_integration`
--

DROP TABLE IF EXISTS `mgk3_integration`;
CREATE TABLE `mgk3_integration` (
  `integration_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Integration status',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `setup_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `MGK3_INTEGRATION_NAME` (`name`),
  UNIQUE KEY `MGK3_INTEGRATION_CONSUMER_ID` (`consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mgk3_integration';

--
-- Table structure for table `mgk3_layout_link`
--

DROP TABLE IF EXISTS `mgk3_layout_link`;
CREATE TABLE `mgk3_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `MGK3_LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `MGK3_LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`),
  KEY `MGK3_LAYOUT_LINK_THEME_ID_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';

--
-- Table structure for table `mgk3_layout_update`
--

DROP TABLE IF EXISTS `mgk3_layout_update`;
CREATE TABLE `mgk3_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `MGK3_LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';

--
-- Table structure for table `mgk3_mview_state`
--

DROP TABLE IF EXISTS `mgk3_mview_state`;
CREATE TABLE `mgk3_mview_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'View State Id',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View Id',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int(10) unsigned DEFAULT NULL COMMENT 'View Version Id',
  PRIMARY KEY (`state_id`),
  KEY `MGK3_MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `MGK3_MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='View State';

--
-- Table structure for table `mgk3_newsletter_problem`
--

DROP TABLE IF EXISTS `mgk3_newsletter_problem`;
CREATE TABLE `mgk3_newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `MGK3_NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `MGK3_NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';

--
-- Table structure for table `mgk3_newsletter_queue`
--

DROP TABLE IF EXISTS `mgk3_newsletter_queue`;
CREATE TABLE `mgk3_newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Template ID',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `MGK3_NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';

--
-- Table structure for table `mgk3_newsletter_queue_link`
--

DROP TABLE IF EXISTS `mgk3_newsletter_queue_link`;
CREATE TABLE `mgk3_newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `MGK3_NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `MGK3_NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';

--
-- Table structure for table `mgk3_newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `mgk3_newsletter_queue_store_link`;
CREATE TABLE `mgk3_newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `MGK3_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';

--
-- Table structure for table `mgk3_newsletter_subscriber`
--

DROP TABLE IF EXISTS `mgk3_newsletter_subscriber`;
CREATE TABLE `mgk3_newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `MGK3_NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `MGK3_NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';

--
-- Table structure for table `mgk3_newsletter_template`
--

DROP TABLE IF EXISTS `mgk3_newsletter_template`;
CREATE TABLE `mgk3_newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `MGK3_NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `MGK3_NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `MGK3_NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';

--
-- Table structure for table `mgk3_oauth_consumer`
--

DROP TABLE IF EXISTS `mgk3_oauth_consumer`;
CREATE TABLE `mgk3_oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` text COMMENT 'Callback URL',
  `rejected_callback_url` text NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `MGK3_OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `MGK3_OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `MGK3_OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';

--
-- Table structure for table `mgk3_oauth_nonce`
--

DROP TABLE IF EXISTS `mgk3_oauth_nonce`;
CREATE TABLE `mgk3_oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  UNIQUE KEY `MGK3_OAUTH_NONCE_NONCE_CONSUMER_ID` (`nonce`,`consumer_id`),
  KEY `MGK3_OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Nonce';

--
-- Table structure for table `mgk3_oauth_token`
--

DROP TABLE IF EXISTS `mgk3_oauth_token`;
CREATE TABLE `mgk3_oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` text NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int(11) DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_OAUTH_TOKEN_TOKEN` (`token`),
  KEY `MGK3_OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  KEY `MGK3_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `MGK3_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';

--
-- Table structure for table `mgk3_oauth_token_request_log`
--

DROP TABLE IF EXISTS `mgk3_oauth_token_request_log`;
CREATE TABLE `mgk3_oauth_token_request_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `user_name` varchar(255) NOT NULL COMMENT 'Customer email or admin login',
  `user_type` smallint(5) unsigned NOT NULL COMMENT 'User type (admin or customer)',
  `failures_count` smallint(5) unsigned DEFAULT '0' COMMENT 'Number of failed authentication attempts in a row',
  `lock_expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Lock expiration time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `MGK3_OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE` (`user_name`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of token request authentication failures.';

--
-- Table structure for table `mgk3_password_reset_request_event`
--

DROP TABLE IF EXISTS `mgk3_password_reset_request_event`;
CREATE TABLE `mgk3_password_reset_request_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `request_type` smallint(5) unsigned NOT NULL COMMENT 'Type of the event under a security control',
  `account_reference` varchar(255) DEFAULT NULL COMMENT 'An identifier for existing account or another target',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp when the event occurs',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `MGK3_PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE` (`account_reference`),
  KEY `MGK3_PASSWORD_RESET_REQUEST_EVENT_CREATED_AT` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Password Reset Request Event under a security control';

--
-- Dumping data for table `mgk3_password_reset_request_event`
--

LOCK TABLES `mgk3_password_reset_request_event` WRITE;
/*!40000 ALTER TABLE `mgk3_password_reset_request_event` DISABLE KEYS */;
INSERT INTO `mgk3_password_reset_request_event` VALUES ('1',1,'hongphuoct@yahoo.com','2017-01-14 23:42:40','178.4.216.83'),('2',1,'hongphuoct@yahoo.com','2017-01-15 01:59:41','178.4.216.83');
/*!40000 ALTER TABLE `mgk3_password_reset_request_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_paypal_billing_agreement`
--

DROP TABLE IF EXISTS `mgk3_paypal_billing_agreement`;
CREATE TABLE `mgk3_paypal_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `MGK3_PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `MGK3_PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';

--
-- Table structure for table `mgk3_paypal_billing_agreement_order`
--

DROP TABLE IF EXISTS `mgk3_paypal_billing_agreement_order`;
CREATE TABLE `mgk3_paypal_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `MGK3_PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';

--
-- Table structure for table `mgk3_paypal_cert`
--

DROP TABLE IF EXISTS `mgk3_paypal_cert`;
CREATE TABLE `mgk3_paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `MGK3_PAYPAL_CERT_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';

--
-- Table structure for table `mgk3_paypal_payment_transaction`
--

DROP TABLE IF EXISTS `mgk3_paypal_payment_transaction`;
CREATE TABLE `mgk3_paypal_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `MGK3_PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';

--
-- Table structure for table `mgk3_paypal_settlement_report`
--

DROP TABLE IF EXISTS `mgk3_paypal_settlement_report`;
CREATE TABLE `mgk3_paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report Id',
  `report_date` timestamp NULL DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `MGK3_PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';

--
-- Table structure for table `mgk3_paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `mgk3_paypal_settlement_report_row`;
CREATE TABLE `mgk3_paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row Id',
  `report_id` int(10) unsigned NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `MGK3_PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';

--
-- Table structure for table `mgk3_persistent_session`
--

DROP TABLE IF EXISTS `mgk3_persistent_session`;
CREATE TABLE `mgk3_persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `MGK3_PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `MGK3_PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `MGK3_PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  KEY `MGK3_PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';

--
-- Table structure for table `mgk3_product_alert_price`
--

DROP TABLE IF EXISTS `mgk3_product_alert_price`;
CREATE TABLE `mgk3_product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `MGK3_PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `MGK3_PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `MGK3_PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';

--
-- Table structure for table `mgk3_product_alert_stock`
--

DROP TABLE IF EXISTS `mgk3_product_alert_stock`;
CREATE TABLE `mgk3_product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `MGK3_PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `MGK3_PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `MGK3_PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';

--
-- Table structure for table `mgk3_quote`
--

DROP TABLE IF EXISTS `mgk3_quote`;
CREATE TABLE `mgk3_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `is_persistent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `MGK3_QUOTE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';

--
-- Table structure for table `mgk3_quote_address`
--

DROP TABLE IF EXISTS `mgk3_quote_address`;
CREATE TABLE `mgk3_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(20) DEFAULT NULL COMMENT 'Firstname',
  `middlename` varchar(20) DEFAULT NULL COMMENT 'Middlename',
  `lastname` varchar(20) DEFAULT NULL COMMENT 'Lastname',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(40) DEFAULT NULL COMMENT 'City',
  `region` varchar(40) DEFAULT NULL COMMENT 'Region',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(20) DEFAULT NULL COMMENT 'Phone Number',
  `fax` varchar(20) DEFAULT NULL COMMENT 'Fax',
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(40) DEFAULT NULL COMMENT 'Shipping Method',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `free_shipping` smallint(6) DEFAULT NULL,
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_id`),
  KEY `MGK3_QUOTE_ADDRESS_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';

--
-- Table structure for table `mgk3_quote_address_item`
--

DROP TABLE IF EXISTS `mgk3_quote_address_item`;
CREATE TABLE `mgk3_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `free_shipping` int(11) DEFAULT NULL,
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_item_id`),
  KEY `MGK3_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `MGK3_QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `MGK3_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';

--
-- Table structure for table `mgk3_quote_id_mask`
--

DROP TABLE IF EXISTS `mgk3_quote_id_mask`;
CREATE TABLE `mgk3_quote_id_mask` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  PRIMARY KEY (`entity_id`,`quote_id`),
  KEY `MGK3_QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  KEY `MGK3_QUOTE_ID_MASK_MASKED_ID` (`masked_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote ID and masked ID mapping';

--
-- Table structure for table `mgk3_quote_item`
--

DROP TABLE IF EXISTS `mgk3_quote_item`;
CREATE TABLE `mgk3_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `free_shipping` smallint(6) DEFAULT NULL,
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `MGK3_QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `MGK3_QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `MGK3_QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `MGK3_QUOTE_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';

--
-- Table structure for table `mgk3_quote_item_option`
--

DROP TABLE IF EXISTS `mgk3_quote_item_option`;
CREATE TABLE `mgk3_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `MGK3_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';

--
-- Table structure for table `mgk3_quote_payment`
--

DROP TABLE IF EXISTS `mgk3_quote_payment`;
CREATE TABLE `mgk3_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id',
  PRIMARY KEY (`payment_id`),
  KEY `MGK3_QUOTE_PAYMENT_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';

--
-- Table structure for table `mgk3_quote_shipping_rate`
--

DROP TABLE IF EXISTS `mgk3_quote_shipping_rate`;
CREATE TABLE `mgk3_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `MGK3_QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';

--
-- Table structure for table `mgk3_rating`
--

DROP TABLE IF EXISTS `mgk3_rating`;
CREATE TABLE `mgk3_rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Id',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Storefront',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `MGK3_RATING_RATING_CODE` (`rating_code`),
  KEY `MGK3_RATING_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Ratings';

--
-- Dumping data for table `mgk3_rating`
--

LOCK TABLES `mgk3_rating` WRITE;
/*!40000 ALTER TABLE `mgk3_rating` DISABLE KEYS */;
INSERT INTO `mgk3_rating` VALUES (1,1,'Quality',0,1),(2,1,'Value',0,1),(3,1,'Price',0,1);
/*!40000 ALTER TABLE `mgk3_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_rating_entity`
--

DROP TABLE IF EXISTS `mgk3_rating_entity`;
CREATE TABLE `mgk3_rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';

--
-- Dumping data for table `mgk3_rating_entity`
--

LOCK TABLES `mgk3_rating_entity` WRITE;
/*!40000 ALTER TABLE `mgk3_rating_entity` DISABLE KEYS */;
INSERT INTO `mgk3_rating_entity` VALUES (1,'product'),(2,'product_review'),(3,'review');
/*!40000 ALTER TABLE `mgk3_rating_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_rating_option`
--

DROP TABLE IF EXISTS `mgk3_rating_option`;
CREATE TABLE `mgk3_rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on Storefront',
  PRIMARY KEY (`option_id`),
  KEY `MGK3_RATING_OPTION_RATING_ID` (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';

--
-- Dumping data for table `mgk3_rating_option`
--

LOCK TABLES `mgk3_rating_option` WRITE;
/*!40000 ALTER TABLE `mgk3_rating_option` DISABLE KEYS */;
INSERT INTO `mgk3_rating_option` VALUES ('1',1,'1',1,1),('2',1,'2',2,2),('3',1,'3',3,3),('4',1,'4',4,4),('5',1,'5',5,5),('6',2,'1',1,1),('7',2,'2',2,2),('8',2,'3',3,3),('9',2,'4',4,4),('10',2,'5',5,5),('11',3,'1',1,1),('12',3,'2',2,2),('13',3,'3',3,3),('14',3,'4',4,4),('15',3,'5',5,5);
/*!40000 ALTER TABLE `mgk3_rating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_rating_option_vote`
--

DROP TABLE IF EXISTS `mgk3_rating_option_vote`;
CREATE TABLE `mgk3_rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `MGK3_RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  KEY `MGK3_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';

--
-- Table structure for table `mgk3_rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `mgk3_rating_option_vote_aggregated`;
CREATE TABLE `mgk3_rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `MGK3_RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `MGK3_RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';

--
-- Table structure for table `mgk3_rating_store`
--

DROP TABLE IF EXISTS `mgk3_rating_store`;
CREATE TABLE `mgk3_rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `MGK3_RATING_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';

--
-- Table structure for table `mgk3_rating_title`
--

DROP TABLE IF EXISTS `mgk3_rating_title`;
CREATE TABLE `mgk3_rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `MGK3_RATING_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';

--
-- Table structure for table `mgk3_report_compared_product_index`
--

DROP TABLE IF EXISTS `mgk3_report_compared_product_index`;
CREATE TABLE `mgk3_report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `MGK3_REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `MGK3_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `MGK3_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `MGK3_REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `MGK3_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';

--
-- Table structure for table `mgk3_report_event`
--

DROP TABLE IF EXISTS `mgk3_report_event`;
CREATE TABLE `mgk3_report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `MGK3_REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `MGK3_REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `MGK3_REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `MGK3_REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `MGK3_REPORT_EVENT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';

--
-- Table structure for table `mgk3_report_event_types`
--

DROP TABLE IF EXISTS `mgk3_report_event_types`;
CREATE TABLE `mgk3_report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';

--
-- Dumping data for table `mgk3_report_event_types`
--

LOCK TABLES `mgk3_report_event_types` WRITE;
/*!40000 ALTER TABLE `mgk3_report_event_types` DISABLE KEYS */;
INSERT INTO `mgk3_report_event_types` VALUES (1,'catalog_product_view',0),(2,'sendfriend_product',0),(3,'catalog_product_compare_add_product',0),(4,'checkout_cart_add_product',0),(5,'wishlist_add_product',0),(6,'wishlist_share',0);
/*!40000 ALTER TABLE `mgk3_report_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_report_viewed_product_aggregated_daily`
--

DROP TABLE IF EXISTS `mgk3_report_viewed_product_aggregated_daily`;
CREATE TABLE `mgk3_report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MGK3_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `MGK3_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';

--
-- Table structure for table `mgk3_report_viewed_product_aggregated_monthly`
--

DROP TABLE IF EXISTS `mgk3_report_viewed_product_aggregated_monthly`;
CREATE TABLE `mgk3_report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MGK3_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `MGK3_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';

--
-- Table structure for table `mgk3_report_viewed_product_aggregated_yearly`
--

DROP TABLE IF EXISTS `mgk3_report_viewed_product_aggregated_yearly`;
CREATE TABLE `mgk3_report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MGK3_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `MGK3_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';

--
-- Table structure for table `mgk3_report_viewed_product_index`
--

DROP TABLE IF EXISTS `mgk3_report_viewed_product_index`;
CREATE TABLE `mgk3_report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `MGK3_REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `MGK3_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `MGK3_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `MGK3_REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `MGK3_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';

--
-- Table structure for table `mgk3_reporting_counts`
--

DROP TABLE IF EXISTS `mgk3_reporting_counts`;
CREATE TABLE `mgk3_reporting_counts` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int(10) unsigned DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all count related events generated via the cron job';

--
-- Table structure for table `mgk3_reporting_module_status`
--

DROP TABLE IF EXISTS `mgk3_reporting_module_status`;
CREATE TABLE `mgk3_reporting_module_status` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Module Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module Status Table';

--
-- Table structure for table `mgk3_reporting_orders`
--

DROP TABLE IF EXISTS `mgk3_reporting_orders`;
CREATE TABLE `mgk3_reporting_orders` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `total` decimal(20,2) DEFAULT NULL COMMENT 'Total From Store',
  `total_base` decimal(20,2) DEFAULT NULL COMMENT 'Total From Base Currency',
  `item_count` int(10) unsigned NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all orders';

--
-- Table structure for table `mgk3_reporting_system_updates`
--

DROP TABLE IF EXISTS `mgk3_reporting_system_updates`;
CREATE TABLE `mgk3_reporting_system_updates` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for system updates';

--
-- Table structure for table `mgk3_reporting_users`
--

DROP TABLE IF EXISTS `mgk3_reporting_users`;
CREATE TABLE `mgk3_reporting_users` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for user actions';

--
-- Table structure for table `mgk3_review`
--

DROP TABLE IF EXISTS `mgk3_review`;
CREATE TABLE `mgk3_review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `MGK3_REVIEW_ENTITY_ID` (`entity_id`),
  KEY `MGK3_REVIEW_STATUS_ID` (`status_id`),
  KEY `MGK3_REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';

--
-- Table structure for table `mgk3_review_detail`
--

DROP TABLE IF EXISTS `mgk3_review_detail`;
CREATE TABLE `mgk3_review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `MGK3_REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `MGK3_REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `MGK3_REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';

--
-- Table structure for table `mgk3_review_entity`
--

DROP TABLE IF EXISTS `mgk3_review_entity`;
CREATE TABLE `mgk3_review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';

--
-- Dumping data for table `mgk3_review_entity`
--

LOCK TABLES `mgk3_review_entity` WRITE;
/*!40000 ALTER TABLE `mgk3_review_entity` DISABLE KEYS */;
INSERT INTO `mgk3_review_entity` VALUES (1,'product'),(2,'customer'),(3,'category');
/*!40000 ALTER TABLE `mgk3_review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_review_entity_summary`
--

DROP TABLE IF EXISTS `mgk3_review_entity_summary`;
CREATE TABLE `mgk3_review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`primary_id`),
  KEY `MGK3_REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';

--
-- Table structure for table `mgk3_review_status`
--

DROP TABLE IF EXISTS `mgk3_review_status`;
CREATE TABLE `mgk3_review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';

--
-- Dumping data for table `mgk3_review_status`
--

LOCK TABLES `mgk3_review_status` WRITE;
/*!40000 ALTER TABLE `mgk3_review_status` DISABLE KEYS */;
INSERT INTO `mgk3_review_status` VALUES (1,'Approved'),(2,'Pending'),(3,'Not Approved');
/*!40000 ALTER TABLE `mgk3_review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_review_store`
--

DROP TABLE IF EXISTS `mgk3_review_store`;
CREATE TABLE `mgk3_review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `MGK3_REVIEW_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';

--
-- Table structure for table `mgk3_sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `mgk3_sales_bestsellers_aggregated_daily`;
CREATE TABLE `mgk3_sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_SALES_BESTSELLERS_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MGK3_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';

--
-- Table structure for table `mgk3_sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `mgk3_sales_bestsellers_aggregated_monthly`;
CREATE TABLE `mgk3_sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_SALES_BESTSELLERS_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MGK3_SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';

--
-- Table structure for table `mgk3_sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `mgk3_sales_bestsellers_aggregated_yearly`;
CREATE TABLE `mgk3_sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_SALES_BESTSELLERS_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `MGK3_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';

--
-- Table structure for table `mgk3_sales_creditmemo`
--

DROP TABLE IF EXISTS `mgk3_sales_creditmemo`;
CREATE TABLE `mgk3_sales_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MGK3_SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `MGK3_SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `MGK3_SALES_CREDITMEMO_STATE` (`state`),
  KEY `MGK3_SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  KEY `MGK3_SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  KEY `MGK3_SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';

--
-- Table structure for table `mgk3_sales_creditmemo_comment`
--

DROP TABLE IF EXISTS `mgk3_sales_creditmemo_comment`;
CREATE TABLE `mgk3_sales_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';

--
-- Table structure for table `mgk3_sales_creditmemo_grid`
--

DROP TABLE IF EXISTS `mgk3_sales_creditmemo_grid`;
CREATE TABLE `mgk3_sales_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int(11) DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Order Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `MGK3_SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_9C333DEACC23DC368A7AFA455B8ED6D1` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';

--
-- Table structure for table `mgk3_sales_creditmemo_item`
--

DROP TABLE IF EXISTS `mgk3_sales_creditmemo_item`;
CREATE TABLE `mgk3_sales_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';

--
-- Table structure for table `mgk3_sales_invoice`
--

DROP TABLE IF EXISTS `mgk3_sales_invoice`;
CREATE TABLE `mgk3_sales_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MGK3_SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `MGK3_SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `MGK3_SALES_INVOICE_STATE` (`state`),
  KEY `MGK3_SALES_INVOICE_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_INVOICE_UPDATED_AT` (`updated_at`),
  KEY `MGK3_SALES_INVOICE_SEND_EMAIL` (`send_email`),
  KEY `MGK3_SALES_INVOICE_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';

--
-- Table structure for table `mgk3_sales_invoice_comment`
--

DROP TABLE IF EXISTS `mgk3_sales_invoice_comment`;
CREATE TABLE `mgk3_sales_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';

--
-- Table structure for table `mgk3_sales_invoice_grid`
--

DROP TABLE IF EXISTS `mgk3_sales_invoice_grid`;
CREATE TABLE `mgk3_sales_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MGK3_SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `MGK3_SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `MGK3_SALES_INVOICE_GRID_STATE` (`state`),
  KEY `MGK3_SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MGK3_SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  KEY `MGK3_SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `MGK3_SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  KEY `MGK3_SALES_INVOICE_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  FULLTEXT KEY `FTI_A0EE7B3CDB178999DE2AC511FD6ACE5D` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';

--
-- Table structure for table `mgk3_sales_invoice_item`
--

DROP TABLE IF EXISTS `mgk3_sales_invoice_item`;
CREATE TABLE `mgk3_sales_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';

--
-- Table structure for table `mgk3_sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `mgk3_sales_invoiced_aggregated`;
CREATE TABLE `mgk3_sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `MGK3_SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';

--
-- Table structure for table `mgk3_sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `mgk3_sales_invoiced_aggregated_order`;
CREATE TABLE `mgk3_sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_SALES_INVOICED_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `MGK3_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';

--
-- Table structure for table `mgk3_sales_order`
--

DROP TABLE IF EXISTS `mgk3_sales_order`;
CREATE TABLE `mgk3_sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(32) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(32) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(32) DEFAULT NULL COMMENT 'Shipping Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(32) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(32) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MGK3_SALES_ORDER_STATUS` (`status`),
  KEY `MGK3_SALES_ORDER_STATE` (`state`),
  KEY `MGK3_SALES_ORDER_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `MGK3_SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `MGK3_SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `MGK3_SALES_ORDER_UPDATED_AT` (`updated_at`),
  KEY `MGK3_SALES_ORDER_SEND_EMAIL` (`send_email`),
  KEY `MGK3_SALES_ORDER_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';

--
-- Table structure for table `mgk3_sales_order_address`
--

DROP TABLE IF EXISTS `mgk3_sales_order_address`;
CREATE TABLE `mgk3_sales_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';

--
-- Table structure for table `mgk3_sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `mgk3_sales_order_aggregated_created`;
CREATE TABLE `mgk3_sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `MGK3_SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';

--
-- Table structure for table `mgk3_sales_order_aggregated_updated`
--

DROP TABLE IF EXISTS `mgk3_sales_order_aggregated_updated`;
CREATE TABLE `mgk3_sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `MGK3_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Prmg Sales Order Aggregated Updated';

--
-- Table structure for table `mgk3_sales_order_grid`
--

DROP TABLE IF EXISTS `mgk3_sales_order_grid`;
CREATE TABLE `mgk3_sales_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MGK3_SALES_ORDER_GRID_STATUS` (`status`),
  KEY `MGK3_SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `MGK3_SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `MGK3_SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `MGK3_SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `MGK3_SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `MGK3_SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `MGK3_SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `MGK3_SALES_ORDER_GRID_UPDATED_AT` (`updated_at`),
  FULLTEXT KEY `FTI_B1EE20E09A9B65FBC10BE8CC9A273F85` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';

--
-- Table structure for table `mgk3_sales_order_item`
--

DROP TABLE IF EXISTS `mgk3_sales_order_item`;
CREATE TABLE `mgk3_sales_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `free_shipping` smallint(6) DEFAULT NULL,
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `MGK3_SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `MGK3_SALES_ORDER_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';

--
-- Table structure for table `mgk3_sales_order_payment`
--

DROP TABLE IF EXISTS `mgk3_sales_order_payment`;
CREATE TABLE `mgk3_sales_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(32) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(32) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans Id',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';

--
-- Table structure for table `mgk3_sales_order_status`
--

DROP TABLE IF EXISTS `mgk3_sales_order_status`;
CREATE TABLE `mgk3_sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `mgk3_sales_order_status`
--

LOCK TABLES `mgk3_sales_order_status` WRITE;
/*!40000 ALTER TABLE `mgk3_sales_order_status` DISABLE KEYS */;
INSERT INTO `mgk3_sales_order_status` VALUES ('canceled','Canceled'),('closed','Closed'),('complete','Complete'),('fraud','Suspected Fraud'),('holded','On Hold'),('payment_review','Payment Review'),('paypal_canceled_reversal','PayPal Canceled Reversal'),('paypal_reversed','PayPal Reversed'),('pending','Pending'),('pending_payment','Pending Payment'),('pending_paypal','Pending PayPal'),('processing','Processing');
/*!40000 ALTER TABLE `mgk3_sales_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_sales_order_status_history`
--

DROP TABLE IF EXISTS `mgk3_sales_order_status_history`;
CREATE TABLE `mgk3_sales_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `MGK3_SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';

--
-- Table structure for table `mgk3_sales_order_status_label`
--

DROP TABLE IF EXISTS `mgk3_sales_order_status_label`;
CREATE TABLE `mgk3_sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `MGK3_SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';

--
-- Table structure for table `mgk3_sales_order_status_state`
--

DROP TABLE IF EXISTS `mgk3_sales_order_status_state`;
CREATE TABLE `mgk3_sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `mgk3_sales_order_status_state`
--

LOCK TABLES `mgk3_sales_order_status_state` WRITE;
/*!40000 ALTER TABLE `mgk3_sales_order_status_state` DISABLE KEYS */;
INSERT INTO `mgk3_sales_order_status_state` VALUES ('canceled','canceled',1,1),('closed','closed',1,1),('complete','complete',1,1),('fraud','payment_review',0,1),('fraud','processing',0,1),('holded','holded',1,1),('payment_review','payment_review',1,1),('pending','new',1,1),('pending_payment','pending_payment',1,0),('processing','processing',1,1);
/*!40000 ALTER TABLE `mgk3_sales_order_status_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_sales_order_tax`
--

DROP TABLE IF EXISTS `mgk3_sales_order_tax`;
CREATE TABLE `mgk3_sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  PRIMARY KEY (`tax_id`),
  KEY `MGK3_SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';

--
-- Table structure for table `mgk3_sales_order_tax_item`
--

DROP TABLE IF EXISTS `mgk3_sales_order_tax_item`;
CREATE TABLE `mgk3_sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(12,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(12,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(12,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(12,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `MGK3_SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `MGK3_SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  KEY `FK_83A5931E6D31A53A9D41DE69A8415D84` (`associated_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';

--
-- Table structure for table `mgk3_sales_payment_transaction`
--

DROP TABLE IF EXISTS `mgk3_sales_payment_transaction`;
CREATE TABLE `mgk3_sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `MGK3_SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `MGK3_SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `MGK3_SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';

--
-- Table structure for table `mgk3_sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `mgk3_sales_refunded_aggregated`;
CREATE TABLE `mgk3_sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `MGK3_SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';

--
-- Table structure for table `mgk3_sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `mgk3_sales_refunded_aggregated_order`;
CREATE TABLE `mgk3_sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MGK3_SALES_REFUNDED_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `MGK3_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';

--
-- Table structure for table `mgk3_sales_sequence_meta`
--

DROP TABLE IF EXISTS `mgk3_sales_sequence_meta`;
CREATE TABLE `mgk3_sales_sequence_meta` (
  `meta_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `sequence_table` varchar(32) NOT NULL COMMENT 'table for sequence',
  PRIMARY KEY (`meta_id`),
  UNIQUE KEY `MGK3_SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='mgk3_sales_sequence_meta';

--
-- Dumping data for table `mgk3_sales_sequence_meta`
--

LOCK TABLES `mgk3_sales_sequence_meta` WRITE;
/*!40000 ALTER TABLE `mgk3_sales_sequence_meta` DISABLE KEYS */;
INSERT INTO `mgk3_sales_sequence_meta` VALUES ('1','order',0,'mgk3_sequence_order_0'),('2','invoice',0,'mgk3_sequence_invoice_0'),('3','creditmemo',0,'mgk3_sequence_creditmemo_0'),('4','shipment',0,'mgk3_sequence_shipment_0'),('5','order',1,'mgk3_sequence_order_1'),('6','invoice',1,'mgk3_sequence_invoice_1'),('7','creditmemo',1,'mgk3_sequence_creditmemo_1'),('8','shipment',1,'mgk3_sequence_shipment_1');
/*!40000 ALTER TABLE `mgk3_sales_sequence_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_sales_sequence_profile`
--

DROP TABLE IF EXISTS `mgk3_sales_sequence_profile`;
CREATE TABLE `mgk3_sales_sequence_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `meta_id` int(10) unsigned NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Start value for sequence',
  `step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Step for sequence',
  `max_value` int(10) unsigned NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int(10) unsigned NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'isActive flag',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `MGK3_SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='mgk3_sales_sequence_profile';

--
-- Dumping data for table `mgk3_sales_sequence_profile`
--

LOCK TABLES `mgk3_sales_sequence_profile` WRITE;
/*!40000 ALTER TABLE `mgk3_sales_sequence_profile` DISABLE KEYS */;
INSERT INTO `mgk3_sales_sequence_profile` VALUES ('1','1',NULL,NULL,'1','1','4294967295','4294966295',1),('2','2',NULL,NULL,'1','1','4294967295','4294966295',1),('3','3',NULL,NULL,'1','1','4294967295','4294966295',1),('4','4',NULL,NULL,'1','1','4294967295','4294966295',1),('5','5',NULL,NULL,'1','1','4294967295','4294966295',1),('6','6',NULL,NULL,'1','1','4294967295','4294966295',1),('7','7',NULL,NULL,'1','1','4294967295','4294966295',1),('8','8',NULL,NULL,'1','1','4294967295','4294966295',1);
/*!40000 ALTER TABLE `mgk3_sales_sequence_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_sales_shipment`
--

DROP TABLE IF EXISTS `mgk3_sales_shipment`;
CREATE TABLE `mgk3_sales_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MGK3_SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `MGK3_SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `MGK3_SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  KEY `MGK3_SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  KEY `MGK3_SALES_SHIPMENT_EMAIL_SENT` (`email_sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';

--
-- Table structure for table `mgk3_sales_shipment_comment`
--

DROP TABLE IF EXISTS `mgk3_sales_shipment_comment`;
CREATE TABLE `mgk3_sales_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';

--
-- Table structure for table `mgk3_sales_shipment_grid`
--

DROP TABLE IF EXISTS `mgk3_sales_shipment_grid`;
CREATE TABLE `mgk3_sales_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Order Increment Id',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `MGK3_SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `MGK3_SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `MGK3_SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `MGK3_SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `MGK3_SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  KEY `MGK3_SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `MGK3_SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  KEY `MGK3_SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `MGK3_SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `MGK3_SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`),
  FULLTEXT KEY `FTI_0660C059FCD64B594430BAD2A34B0BA9` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';

--
-- Table structure for table `mgk3_sales_shipment_item`
--

DROP TABLE IF EXISTS `mgk3_sales_shipment_item`;
CREATE TABLE `mgk3_sales_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';

--
-- Table structure for table `mgk3_sales_shipment_track`
--

DROP TABLE IF EXISTS `mgk3_sales_shipment_track`;
CREATE TABLE `mgk3_sales_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `MGK3_SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `MGK3_SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `MGK3_SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';

--
-- Table structure for table `mgk3_sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `mgk3_sales_shipping_aggregated`;
CREATE TABLE `mgk3_sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_9BA127FB00B9D4A14A37F6574D5E1628` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `MGK3_SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';

--
-- Table structure for table `mgk3_sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `mgk3_sales_shipping_aggregated_order`;
CREATE TABLE `mgk3_sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_FFC00FD9A23ABEF57E740B0115D76980` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `MGK3_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';

--
-- Table structure for table `mgk3_salesrule`
--

DROP TABLE IF EXISTS `mgk3_salesrule`;
CREATE TABLE `mgk3_salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Discount Step',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  KEY `MGK3_SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';

--
-- Table structure for table `mgk3_salesrule_coupon`
--

DROP TABLE IF EXISTS `mgk3_salesrule_coupon`;
CREATE TABLE `mgk3_salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `MGK3_SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `MGK3_SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `MGK3_SALESRULE_COUPON_RULE_ID` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';

--
-- Table structure for table `mgk3_salesrule_coupon_aggregated`
--

DROP TABLE IF EXISTS `mgk3_salesrule_coupon_aggregated`;
CREATE TABLE `mgk3_salesrule_coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_CBEFEADB1C2A9B55DFAD3BE4F646432A` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `MGK3_SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `MGK3_SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';

--
-- Table structure for table `mgk3_salesrule_coupon_aggregated_order`
--

DROP TABLE IF EXISTS `mgk3_salesrule_coupon_aggregated_order`;
CREATE TABLE `mgk3_salesrule_coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_D1503F028B39D307208B5D4A55397962` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `MGK3_SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `MGK3_SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';

--
-- Table structure for table `mgk3_salesrule_coupon_aggregated_updated`
--

DROP TABLE IF EXISTS `mgk3_salesrule_coupon_aggregated_updated`;
CREATE TABLE `mgk3_salesrule_coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_9EAC53B231F77BB66B08377A38D018A0` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `MGK3_SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `MGK3_SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Prmg Salesrule Coupon Aggregated Updated';

--
-- Table structure for table `mgk3_salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `mgk3_salesrule_coupon_usage`;
CREATE TABLE `mgk3_salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `MGK3_SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';

--
-- Table structure for table `mgk3_salesrule_customer`
--

DROP TABLE IF EXISTS `mgk3_salesrule_customer`;
CREATE TABLE `mgk3_salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `MGK3_SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `MGK3_SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';

--
-- Table structure for table `mgk3_salesrule_customer_group`
--

DROP TABLE IF EXISTS `mgk3_salesrule_customer_group`;
CREATE TABLE `mgk3_salesrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `MGK3_SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';

--
-- Table structure for table `mgk3_salesrule_label`
--

DROP TABLE IF EXISTS `mgk3_salesrule_label`;
CREATE TABLE `mgk3_salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `MGK3_SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `MGK3_SALESRULE_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';

--
-- Table structure for table `mgk3_salesrule_product_attribute`
--

DROP TABLE IF EXISTS `mgk3_salesrule_product_attribute`;
CREATE TABLE `mgk3_salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `MGK3_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `MGK3_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `MGK3_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';

--
-- Table structure for table `mgk3_salesrule_website`
--

DROP TABLE IF EXISTS `mgk3_salesrule_website`;
CREATE TABLE `mgk3_salesrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `MGK3_SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';

--
-- Table structure for table `mgk3_search_query`
--

DROP TABLE IF EXISTS `mgk3_search_query`;
CREATE TABLE `mgk3_search_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `MGK3_SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  KEY `MGK3_SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `MGK3_SEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `MGK3_SEARCH_QUERY_IS_PROCESSED` (`is_processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Search query table';

--
-- Table structure for table `mgk3_search_synonyms`
--

DROP TABLE IF EXISTS `mgk3_search_synonyms`;
CREATE TABLE `mgk3_search_synonyms` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Synonyms Group Id',
  `synonyms` text NOT NULL COMMENT 'list of synonyms making up this group',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id - identifies the store view these synonyms belong to',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id - identifies the website id these synonyms belong to',
  PRIMARY KEY (`group_id`),
  KEY `MGK3_SEARCH_SYNONYMS_STORE_ID` (`store_id`),
  KEY `MGK3_SEARCH_SYNONYMS_WEBSITE_ID` (`website_id`),
  FULLTEXT KEY `MGK3_SEARCH_SYNONYMS_SYNONYMS` (`synonyms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table storing various synonyms groups';

--
-- Table structure for table `mgk3_sendfriend_log`
--

DROP TABLE IF EXISTS `mgk3_sendfriend_log`;
CREATE TABLE `mgk3_sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `MGK3_SENDFRIEND_LOG_IP` (`ip`),
  KEY `MGK3_SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';

--
-- Table structure for table `mgk3_sequence_creditmemo_0`
--

DROP TABLE IF EXISTS `mgk3_sequence_creditmemo_0`;
CREATE TABLE `mgk3_sequence_creditmemo_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `mgk3_sequence_creditmemo_1`
--

DROP TABLE IF EXISTS `mgk3_sequence_creditmemo_1`;
CREATE TABLE `mgk3_sequence_creditmemo_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `mgk3_sequence_invoice_0`
--

DROP TABLE IF EXISTS `mgk3_sequence_invoice_0`;
CREATE TABLE `mgk3_sequence_invoice_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `mgk3_sequence_invoice_1`
--

DROP TABLE IF EXISTS `mgk3_sequence_invoice_1`;
CREATE TABLE `mgk3_sequence_invoice_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `mgk3_sequence_order_0`
--

DROP TABLE IF EXISTS `mgk3_sequence_order_0`;
CREATE TABLE `mgk3_sequence_order_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `mgk3_sequence_order_1`
--

DROP TABLE IF EXISTS `mgk3_sequence_order_1`;
CREATE TABLE `mgk3_sequence_order_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `mgk3_sequence_shipment_0`
--

DROP TABLE IF EXISTS `mgk3_sequence_shipment_0`;
CREATE TABLE `mgk3_sequence_shipment_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `mgk3_sequence_shipment_1`
--

DROP TABLE IF EXISTS `mgk3_sequence_shipment_1`;
CREATE TABLE `mgk3_sequence_shipment_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `mgk3_session`
--

DROP TABLE IF EXISTS `mgk3_session`;
CREATE TABLE `mgk3_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';

--
-- Dumping data for table `mgk3_session`
--

LOCK TABLES `mgk3_session` WRITE;
/*!40000 ALTER TABLE `mgk3_session` DISABLE KEYS */;
INSERT INTO `mgk3_session` VALUES ('01u75u63fi911mouc11pao78k7','1484551561','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('028s1olqb0qvi623t65rgbt064','1484531401','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('1c510rq2vs0pr5g0j8bphmfa00','1484519162','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('1gfjolsiju6b8tijcqf7l26sc6','1484583475','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9ZGVmYXVsdHxhOjI6e3M6OToiX2Zvcm1fa2V5IjtzOjE2OiJzYkNWQXdmbHdCc3NrcVFLIjtzOjEyOiJ2aXNpdG9yX2RhdGEiO2E6Mzp7czoxMzoibGFzdF92aXNpdF9hdCI7czoxOToiMjAxNy0wMS0xNiAxNjoxNzo1NSI7czoxMDoic2Vzc2lvbl9pZCI7czoyNjoiMWdmam9sc2lqdTZiOHRpamNxZjdsMjZzYzYiO3M6MTA6InZpc2l0b3JfaWQiO3M6MjoiMTgiO319Y3VzdG9tZXJfYmFzZXxhOjA6e31jaGVja291dHxhOjA6e31tZXNzYWdlfGE6MDp7fWNhdGFsb2d8YTowOnt9'),('3eto9n1e3jllgb7hrfmi0fjin5','1484511548','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMzoiODguNjkuMTI5LjIyOSI7czo4OiJodHRwX3ZpYSI7czowOiIiO3M6MjA6Imh0dHBfeF9mb3J3YXJkZWRfZm9yIjtzOjA6IiI7czoxNToiaHR0cF91c2VyX2FnZW50IjtzOjEwOToiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS81NS4wLjI4ODMuODcgU2FmYXJpLzUzNy4zNiI7fV9zZXNzaW9uX2hvc3RzfGE6MTp7czozNzoid2VyYmVhcnRpa2VsLXdlcmJlZ2VzY2hlbmtlLW9ubGluZS5kZSI7YjoxO31kZWZhdWx0fGE6Mjp7czo5OiJfZm9ybV9rZXkiO3M6MTY6IlZRZnk5ZGR0VUMzdHRxaHMiO3M6MTI6InZpc2l0b3JfZGF0YSI7YTozOntzOjEzOiJsYXN0X3Zpc2l0X2F0IjtzOjE5OiIyMDE3LTAxLTE1IDIwOjE5OjAwIjtzOjEwOiJzZXNzaW9uX2lkIjtzOjI2OiIzZXRvOW4xZTNqbGxnYjdocmZtaTBmamluNSI7czoxMDoidmlzaXRvcl9pZCI7czoyOiIxMCI7fX1jdXN0b21lcl9iYXNlfGE6MDp7fWNoZWNrb3V0fGE6MDp7fW1lc3NhZ2V8YToxOntzOjc6ImRlZmF1bHQiO086MzY6Ik1hZ2VudG9cRnJhbWV3b3JrXE1lc3NhZ2VcQ29sbGVjdGlvbiI6Mjp7czoxMToiACoAbWVzc2FnZXMiO2E6MDp7fXM6MTk6IgAqAGxhc3RBZGRlZE1lc3NhZ2UiO047fX1jYXRhbG9nfGE6MDp7fWFkbWluaHRtbHxhOjA6e30='),('3gch18hivi7qpebs7g8dhii0s0','1484556602','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('3u65fqecv96giug7hcrethnqb0','1484549401','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('43tah4gd3v6883ssojosiucd22','1484506201','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('4uuksp8dirlq7lnqv21teh6995','1484499001','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('5kk3org85son4i83irb8qev6g6','1484547961','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('62lrsvdt48u2brsjtv7ui6oet4','1484577757','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9bWVzc2FnZXxhOjE6e3M6NzoiYmFja2VuZCI7TzozNjoiTWFnZW50b1xGcmFtZXdvcmtcTWVzc2FnZVxDb2xsZWN0aW9uIjoyOntzOjExOiIAKgBtZXNzYWdlcyI7YTowOnt9czoxOToiACoAbGFzdEFkZGVkTWVzc2FnZSI7Tjt9fWFkbWluaHRtbHxhOjM6e3M6NjoibG9jYWxlIjtzOjU6ImVuX1VTIjtzOjk6Il9mb3JtX2tleSI7czoxNjoiWTlCcHpVdGkyWXAyWXJwcCI7czoxMzoiaXNfdXJsX25vdGljZSI7YjowO31hZG1pbnxhOjE6e3M6NDoidXNlciI7TzoyMzoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXIiOjE2OntzOjE1OiIAKgBfZXZlbnRQcmVmaXgiO3M6MTA6ImFkbWluX3VzZXIiO3M6ODoiACoAX3JvbGUiO047czoxNjoiACoAX2hhc1Jlc291cmNlcyI7YjoxO3M6MTg6IgAqAHZhbGlkYXRpb25SdWxlcyI7TzozODoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXJWYWxpZGF0aW9uUnVsZXMiOjA6e31zOjE1OiIAKgBfZXZlbnRPYmplY3QiO3M6Njoib2JqZWN0IjtzOjE1OiIAKgBfaWRGaWVsZE5hbWUiO3M6NzoidXNlcl9pZCI7czoxODoiACoAX2hhc0RhdGFDaGFuZ2VzIjtiOjE7czoxMjoiACoAX29yaWdEYXRhIjthOjE5OntzOjc6InVzZXJfaWQiO3M6MToiMiI7czo5OiJmaXJzdG5hbWUiO3M6NToiYWRtaW4iO3M6ODoibGFzdG5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6NDY6ImFkbWluMjM0QHdlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO3M6ODoidXNlcm5hbWUiO3M6ODoiYWRtaW4xMjMiO3M6ODoicGFzc3dvcmQiO3M6OTk6IjE4OWFmNDc1OWQ5YmNhMjBmNTFmZGVmZmRkNmE1OWMzZDdjM2Y1MThkYWM0ZDQ3YjIwZTg3NjMyMzkwMjA5NmQ6YlpNeUtHSG5ybUZwdmlDMHN6VUxwSXRiMXM0MXJnTXI6MSI7czo3OiJjcmVhdGVkIjtzOjE5OiIyMDE3LTAxLTE1IDAyOjM4OjQ2IjtzOjg6Im1vZGlmaWVkIjtzOjE5OiIyMDE3LTAxLTE2IDE0OjIwOjU5IjtzOjc6ImxvZ2RhdGUiO3M6MTk6IjIwMTctMDEtMTYgMTQ6MjA6NTkiO3M6NjoibG9nbnVtIjtzOjE6IjUiO3M6MTU6InJlbG9hZF9hY2xfZmxhZyI7czoxOiIwIjtzOjk6ImlzX2FjdGl2ZSI7czoxOiIxIjtzOjU6ImV4dHJhIjtzOjI6Ik47IjtzOjg6InJwX3Rva2VuIjtOO3M6MTk6InJwX3Rva2VuX2NyZWF0ZWRfYXQiO047czoxNjoiaW50ZXJmYWNlX2xvY2FsZSI7czo1OiJkZV9ERSI7czoxMjoiZmFpbHVyZXNfbnVtIjtzOjE6IjAiO3M6MTM6ImZpcnN0X2ZhaWx1cmUiO047czoxMjoibG9ja19leHBpcmVzIjtOO31zOjEzOiIAKgBfaXNEZWxldGVkIjtiOjA7czoxNjoiACoAX3Jlc291cmNlTmFtZSI7czozNzoiTWFnZW50b1xVc2VyXE1vZGVsXFJlc291cmNlTW9kZWxcVXNlciI7czoxODoiACoAX2NvbGxlY3Rpb25OYW1lIjtzOjQ4OiJNYWdlbnRvXFVzZXJcTW9kZWxcUmVzb3VyY2VNb2RlbFxVc2VyXENvbGxlY3Rpb24iO3M6MTI6IgAqAF9jYWNoZVRhZyI7YjowO3M6MTk6IgAqAF9kYXRhU2F2ZUFsbG93ZWQiO2I6MTtzOjE1OiIAKgBfaXNPYmplY3ROZXciO047czoxMzoiACoAc3RvcmVkRGF0YSI7YTowOnt9czo4OiIAKgBfZGF0YSI7YToxOTp7czo3OiJ1c2VyX2lkIjtzOjE6IjIiO3M6OToiZmlyc3RuYW1lIjtzOjU6ImFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjU6ImFkbWluIjtzOjU6ImVtYWlsIjtzOjQ2OiJhZG1pbjIzNEB3ZXJiZWFydGlrZWwtd2VyYmVnZXNjaGVua2Utb25saW5lLmRlIjtzOjg6InVzZXJuYW1lIjtzOjg6ImFkbWluMTIzIjtzOjg6InBhc3N3b3JkIjtzOjk5OiIxODlhZjQ3NTlkOWJjYTIwZjUxZmRlZmZkZDZhNTljM2Q3YzNmNTE4ZGFjNGQ0N2IyMGU4NzYzMjM5MDIwOTZkOmJaTXlLR0hucm1GcHZpQzBzelVMcEl0YjFzNDFyZ01yOjEiO3M6NzoiY3JlYXRlZCI7czoxOToiMjAxNy0wMS0xNSAwMjozODo0NiI7czo4OiJtb2RpZmllZCI7czoxOToiMjAxNy0wMS0xNiAxNDoyMDo1OSI7czo3OiJsb2dkYXRlIjtzOjE5OiIyMDE3LTAxLTE2IDE0OjIwOjU5IjtzOjY6ImxvZ251bSI7czoxOiI1IjtzOjE1OiJyZWxvYWRfYWNsX2ZsYWciO3M6MToiMCI7czo5OiJpc19hY3RpdmUiO3M6MToiMSI7czo1OiJleHRyYSI7czoyOiJOOyI7czo4OiJycF90b2tlbiI7TjtzOjE5OiJycF90b2tlbl9jcmVhdGVkX2F0IjtOO3M6MTY6ImludGVyZmFjZV9sb2NhbGUiO3M6NToiZGVfREUiO3M6MTI6ImZhaWx1cmVzX251bSI7czoxOiIwIjtzOjEzOiJmaXJzdF9mYWlsdXJlIjtOO3M6MTI6ImxvY2tfZXhwaXJlcyI7Tjt9fX1kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2Jhc2V8YTowOnt9'),('6ubs11ul1mqc68m3v4t0kqapd6','1484584493','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9ZGVmYXVsdHxhOjE6e3M6MTI6InZpc2l0b3JfZGF0YSI7YTozOntzOjEzOiJsYXN0X3Zpc2l0X2F0IjtzOjE5OiIyMDE3LTAxLTE2IDE2OjM0OjUzIjtzOjEwOiJzZXNzaW9uX2lkIjtzOjI2OiI2dWJzMTF1bDFtcWM2OG0zdjR0MGtxYXBkNiI7czoxMDoidmlzaXRvcl9pZCI7czoyOiIyMCI7fX1jdXN0b21lcl9iYXNlfGE6MDp7fWNoZWNrb3V0fGE6MDp7fW1lc3NhZ2V8YTowOnt9Y2F0YWxvZ3xhOjA6e30='),('73rdi7f0341tjgk14lh40i3kh6','1484576459','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9bWVzc2FnZXxhOjE6e3M6NzoiYmFja2VuZCI7TzozNjoiTWFnZW50b1xGcmFtZXdvcmtcTWVzc2FnZVxDb2xsZWN0aW9uIjoyOntzOjExOiIAKgBtZXNzYWdlcyI7YTowOnt9czoxOToiACoAbGFzdEFkZGVkTWVzc2FnZSI7Tjt9fWFkbWluaHRtbHxhOjM6e3M6NjoibG9jYWxlIjtzOjU6ImVuX1VTIjtzOjk6Il9mb3JtX2tleSI7czoxNjoiVktiZW83UTgwc2wzYkhTaiI7czoxMzoiaXNfdXJsX25vdGljZSI7YjowO31hZG1pbnxhOjE6e3M6NDoidXNlciI7TzoyMzoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXIiOjE2OntzOjE1OiIAKgBfZXZlbnRQcmVmaXgiO3M6MTA6ImFkbWluX3VzZXIiO3M6ODoiACoAX3JvbGUiO047czoxNjoiACoAX2hhc1Jlc291cmNlcyI7YjoxO3M6MTg6IgAqAHZhbGlkYXRpb25SdWxlcyI7TzozODoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXJWYWxpZGF0aW9uUnVsZXMiOjA6e31zOjE1OiIAKgBfZXZlbnRPYmplY3QiO3M6Njoib2JqZWN0IjtzOjE1OiIAKgBfaWRGaWVsZE5hbWUiO3M6NzoidXNlcl9pZCI7czoxODoiACoAX2hhc0RhdGFDaGFuZ2VzIjtiOjE7czoxMjoiACoAX29yaWdEYXRhIjthOjE5OntzOjc6InVzZXJfaWQiO3M6MToiMiI7czo5OiJmaXJzdG5hbWUiO3M6NToiYWRtaW4iO3M6ODoibGFzdG5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6NDY6ImFkbWluMjM0QHdlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO3M6ODoidXNlcm5hbWUiO3M6ODoiYWRtaW4xMjMiO3M6ODoicGFzc3dvcmQiO3M6OTk6IjE4OWFmNDc1OWQ5YmNhMjBmNTFmZGVmZmRkNmE1OWMzZDdjM2Y1MThkYWM0ZDQ3YjIwZTg3NjMyMzkwMjA5NmQ6YlpNeUtHSG5ybUZwdmlDMHN6VUxwSXRiMXM0MXJnTXI6MSI7czo3OiJjcmVhdGVkIjtzOjE5OiIyMDE3LTAxLTE1IDAyOjM4OjQ2IjtzOjg6Im1vZGlmaWVkIjtzOjE5OiIyMDE3LTAxLTE2IDA4OjMzOjExIjtzOjc6ImxvZ2RhdGUiO3M6MTk6IjIwMTctMDEtMTYgMDg6MzM6MTEiO3M6NjoibG9nbnVtIjtzOjE6IjQiO3M6MTU6InJlbG9hZF9hY2xfZmxhZyI7czoxOiIwIjtzOjk6ImlzX2FjdGl2ZSI7czoxOiIxIjtzOjU6ImV4dHJhIjtzOjI6Ik47IjtzOjg6InJwX3Rva2VuIjtOO3M6MTk6InJwX3Rva2VuX2NyZWF0ZWRfYXQiO047czoxNjoiaW50ZXJmYWNlX2xvY2FsZSI7czo1OiJkZV9ERSI7czoxMjoiZmFpbHVyZXNfbnVtIjtzOjE6IjAiO3M6MTM6ImZpcnN0X2ZhaWx1cmUiO047czoxMjoibG9ja19leHBpcmVzIjtOO31zOjEzOiIAKgBfaXNEZWxldGVkIjtiOjA7czoxNjoiACoAX3Jlc291cmNlTmFtZSI7czozNzoiTWFnZW50b1xVc2VyXE1vZGVsXFJlc291cmNlTW9kZWxcVXNlciI7czoxODoiACoAX2NvbGxlY3Rpb25OYW1lIjtzOjQ4OiJNYWdlbnRvXFVzZXJcTW9kZWxcUmVzb3VyY2VNb2RlbFxVc2VyXENvbGxlY3Rpb24iO3M6MTI6IgAqAF9jYWNoZVRhZyI7YjowO3M6MTk6IgAqAF9kYXRhU2F2ZUFsbG93ZWQiO2I6MTtzOjE1OiIAKgBfaXNPYmplY3ROZXciO047czoxMzoiACoAc3RvcmVkRGF0YSI7YTowOnt9czo4OiIAKgBfZGF0YSI7YToxOTp7czo3OiJ1c2VyX2lkIjtzOjE6IjIiO3M6OToiZmlyc3RuYW1lIjtzOjU6ImFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjU6ImFkbWluIjtzOjU6ImVtYWlsIjtzOjQ2OiJhZG1pbjIzNEB3ZXJiZWFydGlrZWwtd2VyYmVnZXNjaGVua2Utb25saW5lLmRlIjtzOjg6InVzZXJuYW1lIjtzOjg6ImFkbWluMTIzIjtzOjg6InBhc3N3b3JkIjtzOjk5OiIxODlhZjQ3NTlkOWJjYTIwZjUxZmRlZmZkZDZhNTljM2Q3YzNmNTE4ZGFjNGQ0N2IyMGU4NzYzMjM5MDIwOTZkOmJaTXlLR0hucm1GcHZpQzBzelVMcEl0YjFzNDFyZ01yOjEiO3M6NzoiY3JlYXRlZCI7czoxOToiMjAxNy0wMS0xNSAwMjozODo0NiI7czo4OiJtb2RpZmllZCI7czoxOToiMjAxNy0wMS0xNiAwODozMzoxMSI7czo3OiJsb2dkYXRlIjtzOjE5OiIyMDE3LTAxLTE2IDA4OjMzOjExIjtzOjY6ImxvZ251bSI7czoxOiI0IjtzOjE1OiJyZWxvYWRfYWNsX2ZsYWciO3M6MToiMCI7czo5OiJpc19hY3RpdmUiO3M6MToiMSI7czo1OiJleHRyYSI7czoyOiJOOyI7czo4OiJycF90b2tlbiI7TjtzOjE5OiJycF90b2tlbl9jcmVhdGVkX2F0IjtOO3M6MTY6ImludGVyZmFjZV9sb2NhbGUiO3M6NToiZGVfREUiO3M6MTI6ImZhaWx1cmVzX251bSI7czoxOiIwIjtzOjEzOiJmaXJzdF9mYWlsdXJlIjtOO3M6MTI6ImxvY2tfZXhwaXJlcyI7Tjt9fX1kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2Jhc2V8YTowOnt9'),('7fe1lo3fbibtadnb7ea2bssj43','1484537162','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('9qr0jhbmjk1jn18umjb19c1fk2','1484542202','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('a1fpl4a3nu6b3m3s4nj28c2ah0','1484493962','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('a98hrremsmo4ipm4osqkha4lv2','1484533561','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('ae01q5ttp91k9v6hsbc764b723','1484555162','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('ago9ui7c3c1rf6n8msurvqhsg0','1484576762','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('aktjs47cljn12p5cku6vc73i07','1484527565','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMzoiODguNjkuMTI5LjIyOSI7czo4OiJodHRwX3ZpYSI7czowOiIiO3M6MjA6Imh0dHBfeF9mb3J3YXJkZWRfZm9yIjtzOjA6IiI7czoxNToiaHR0cF91c2VyX2FnZW50IjtzOjEwOToiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS81NS4wLjI4ODMuODcgU2FmYXJpLzUzNy4zNiI7fV9zZXNzaW9uX2hvc3RzfGE6MTp7czozNzoid2VyYmVhcnRpa2VsLXdlcmJlZ2VzY2hlbmtlLW9ubGluZS5kZSI7YjoxO31kZWZhdWx0fGE6Mjp7czo5OiJfZm9ybV9rZXkiO3M6MTY6InZGREZmYW5xQUkya0M2VksiO3M6MTI6InZpc2l0b3JfZGF0YSI7YTozOntzOjEzOiJsYXN0X3Zpc2l0X2F0IjtzOjE5OiIyMDE3LTAxLTE2IDAwOjQ2OjA0IjtzOjEwOiJzZXNzaW9uX2lkIjtzOjI2OiJha3RqczQ3Y2xqbjEycDVja3U2dmM3M2kwNyI7czoxMDoidmlzaXRvcl9pZCI7czoyOiIxMiI7fX1jdXN0b21lcl9iYXNlfGE6MDp7fWNoZWNrb3V0fGE6MDp7fW1lc3NhZ2V8YTowOnt9Y2F0YWxvZ3xhOjA6e30='),('at4u6naqtri6aqmar2lmpm19n0','1484573161','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('boa970biu5qoipu6h6bh0trmt3','1484515562','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('bse70enrvof1g9i49rkuipd731','1484562361','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('c3aom0tgblkfn8v5174421pg57','1484527802','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('c7fb4ebme5h068b4g4l8luo2a4','1484555514','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9ZGVmYXVsdHxhOjI6e3M6OToiX2Zvcm1fa2V5IjtzOjE2OiJzZGE3ZDYza1M3YVVlbjdlIjtzOjEyOiJ2aXNpdG9yX2RhdGEiO2E6Mzp7czoxMzoibGFzdF92aXNpdF9hdCI7czoxOToiMjAxNy0wMS0xNiAwODozMTo1MyI7czoxMDoic2Vzc2lvbl9pZCI7czoyNjoiYzdmYjRlYm1lNWgwNjhiNGc0bDhsdW8yYTQiO3M6MTA6InZpc2l0b3JfaWQiO3M6MjoiMTMiO319Y3VzdG9tZXJfYmFzZXxhOjA6e31jaGVja291dHxhOjA6e31tZXNzYWdlfGE6MDp7fWNhdGFsb2d8YTowOnt9'),('dg6hh0fuviuudpl6tgrs52adb1','1484555591','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9bWVzc2FnZXxhOjE6e3M6NzoiYmFja2VuZCI7TzozNjoiTWFnZW50b1xGcmFtZXdvcmtcTWVzc2FnZVxDb2xsZWN0aW9uIjoyOntzOjExOiIAKgBtZXNzYWdlcyI7YTowOnt9czoxOToiACoAbGFzdEFkZGVkTWVzc2FnZSI7Tjt9fWFkbWluaHRtbHxhOjM6e3M6NjoibG9jYWxlIjtzOjU6ImVuX1VTIjtzOjk6Il9mb3JtX2tleSI7czoxNjoieXNzQjh0TjIyR296UWJ5MSI7czoxMzoiaXNfdXJsX25vdGljZSI7YjowO31hZG1pbnxhOjE6e3M6NDoidXNlciI7TzoyMzoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXIiOjE2OntzOjE1OiIAKgBfZXZlbnRQcmVmaXgiO3M6MTA6ImFkbWluX3VzZXIiO3M6ODoiACoAX3JvbGUiO047czoxNjoiACoAX2hhc1Jlc291cmNlcyI7YjoxO3M6MTg6IgAqAHZhbGlkYXRpb25SdWxlcyI7TzozODoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXJWYWxpZGF0aW9uUnVsZXMiOjA6e31zOjE1OiIAKgBfZXZlbnRPYmplY3QiO3M6Njoib2JqZWN0IjtzOjE1OiIAKgBfaWRGaWVsZE5hbWUiO3M6NzoidXNlcl9pZCI7czoxODoiACoAX2hhc0RhdGFDaGFuZ2VzIjtiOjE7czoxMjoiACoAX29yaWdEYXRhIjthOjE5OntzOjc6InVzZXJfaWQiO3M6MToiMiI7czo5OiJmaXJzdG5hbWUiO3M6NToiYWRtaW4iO3M6ODoibGFzdG5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6NDY6ImFkbWluMjM0QHdlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO3M6ODoidXNlcm5hbWUiO3M6ODoiYWRtaW4xMjMiO3M6ODoicGFzc3dvcmQiO3M6OTk6IjE4OWFmNDc1OWQ5YmNhMjBmNTFmZGVmZmRkNmE1OWMzZDdjM2Y1MThkYWM0ZDQ3YjIwZTg3NjMyMzkwMjA5NmQ6YlpNeUtHSG5ybUZwdmlDMHN6VUxwSXRiMXM0MXJnTXI6MSI7czo3OiJjcmVhdGVkIjtzOjE5OiIyMDE3LTAxLTE1IDAyOjM4OjQ2IjtzOjg6Im1vZGlmaWVkIjtzOjE5OiIyMDE3LTAxLTE1IDIzOjI1OjM5IjtzOjc6ImxvZ2RhdGUiO3M6MTk6IjIwMTctMDEtMTUgMjM6MjU6MzkiO3M6NjoibG9nbnVtIjtzOjE6IjMiO3M6MTU6InJlbG9hZF9hY2xfZmxhZyI7czoxOiIwIjtzOjk6ImlzX2FjdGl2ZSI7czoxOiIxIjtzOjU6ImV4dHJhIjtzOjI6Ik47IjtzOjg6InJwX3Rva2VuIjtOO3M6MTk6InJwX3Rva2VuX2NyZWF0ZWRfYXQiO047czoxNjoiaW50ZXJmYWNlX2xvY2FsZSI7czo1OiJkZV9ERSI7czoxMjoiZmFpbHVyZXNfbnVtIjtzOjE6IjAiO3M6MTM6ImZpcnN0X2ZhaWx1cmUiO047czoxMjoibG9ja19leHBpcmVzIjtOO31zOjEzOiIAKgBfaXNEZWxldGVkIjtiOjA7czoxNjoiACoAX3Jlc291cmNlTmFtZSI7czozNzoiTWFnZW50b1xVc2VyXE1vZGVsXFJlc291cmNlTW9kZWxcVXNlciI7czoxODoiACoAX2NvbGxlY3Rpb25OYW1lIjtzOjQ4OiJNYWdlbnRvXFVzZXJcTW9kZWxcUmVzb3VyY2VNb2RlbFxVc2VyXENvbGxlY3Rpb24iO3M6MTI6IgAqAF9jYWNoZVRhZyI7YjowO3M6MTk6IgAqAF9kYXRhU2F2ZUFsbG93ZWQiO2I6MTtzOjE1OiIAKgBfaXNPYmplY3ROZXciO047czoxMzoiACoAc3RvcmVkRGF0YSI7YTowOnt9czo4OiIAKgBfZGF0YSI7YToxOTp7czo3OiJ1c2VyX2lkIjtzOjE6IjIiO3M6OToiZmlyc3RuYW1lIjtzOjU6ImFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjU6ImFkbWluIjtzOjU6ImVtYWlsIjtzOjQ2OiJhZG1pbjIzNEB3ZXJiZWFydGlrZWwtd2VyYmVnZXNjaGVua2Utb25saW5lLmRlIjtzOjg6InVzZXJuYW1lIjtzOjg6ImFkbWluMTIzIjtzOjg6InBhc3N3b3JkIjtzOjk5OiIxODlhZjQ3NTlkOWJjYTIwZjUxZmRlZmZkZDZhNTljM2Q3YzNmNTE4ZGFjNGQ0N2IyMGU4NzYzMjM5MDIwOTZkOmJaTXlLR0hucm1GcHZpQzBzelVMcEl0YjFzNDFyZ01yOjEiO3M6NzoiY3JlYXRlZCI7czoxOToiMjAxNy0wMS0xNSAwMjozODo0NiI7czo4OiJtb2RpZmllZCI7czoxOToiMjAxNy0wMS0xNSAyMzoyNTozOSI7czo3OiJsb2dkYXRlIjtzOjE5OiIyMDE3LTAxLTE1IDIzOjI1OjM5IjtzOjY6ImxvZ251bSI7czoxOiIzIjtzOjE1OiJyZWxvYWRfYWNsX2ZsYWciO3M6MToiMCI7czo5OiJpc19hY3RpdmUiO3M6MToiMSI7czo1OiJleHRyYSI7czoyOiJOOyI7czo4OiJycF90b2tlbiI7TjtzOjE5OiJycF90b2tlbl9jcmVhdGVkX2F0IjtOO3M6MTY6ImludGVyZmFjZV9sb2NhbGUiO3M6NToiZGVfREUiO3M6MTI6ImZhaWx1cmVzX251bSI7czoxOiIwIjtzOjEzOiJmaXJzdF9mYWlsdXJlIjtOO3M6MTI6ImxvY2tfZXhwaXJlcyI7Tjt9fX1kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2Jhc2V8YTowOnt9'),('e0rnbe6ug3dh4umonqbj3koeb0','1484524202','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('e31o1vo0tbg9gpu74pol0gu861','1484511520','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMzoiODguNjkuMTI5LjIyOSI7czo4OiJodHRwX3ZpYSI7czowOiIiO3M6MjA6Imh0dHBfeF9mb3J3YXJkZWRfZm9yIjtzOjA6IiI7czoxNToiaHR0cF91c2VyX2FnZW50IjtzOjEwOToiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS81NS4wLjI4ODMuODcgU2FmYXJpLzUzNy4zNiI7fV9zZXNzaW9uX2hvc3RzfGE6MTp7czozNzoid2VyYmVhcnRpa2VsLXdlcmJlZ2VzY2hlbmtlLW9ubGluZS5kZSI7YjoxO31kZWZhdWx0fGE6Mjp7czo5OiJfZm9ybV9rZXkiO3M6MTY6IlZRZnk5ZGR0VUMzdHRxaHMiO3M6MTI6InZpc2l0b3JfZGF0YSI7YTozOntzOjEzOiJsYXN0X3Zpc2l0X2F0IjtzOjE5OiIyMDE3LTAxLTE1IDIwOjE4OjQwIjtzOjEwOiJzZXNzaW9uX2lkIjtzOjI2OiJlMzFvMXZvMHRiZzlncHU3NHBvbDBndTg2MSI7czoxMDoidmlzaXRvcl9pZCI7czoxOiI4Ijt9fWN1c3RvbWVyX2Jhc2V8YTowOnt9Y2hlY2tvdXR8YTowOnt9bWVzc2FnZXxhOjA6e31jYXRhbG9nfGE6MDp7fQ=='),('e8iesuj5pmlj64njq8vna4shk0','1484497561','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('ehs3ukgh01m4uh79aputjt11b2','1484565962','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('enqg1gncd4u2f5c0itas7it5v7','1484535002','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('esbkptnrjdidkcqlqg00k3s5i6','1484509801','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('f9tdfkf9bpnmat5a5ebogksou0','1484508361','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('fbvbcps0dbkhbvijq4kf6d0093','1484583961','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('flmpgarcnk83fog2v94gv8aq36','1484584496','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9ZGVmYXVsdHxhOjI6e3M6OToiX2Zvcm1fa2V5IjtzOjE2OiJQbVZybm1yV2dyNEZvZGU3IjtzOjEyOiJ2aXNpdG9yX2RhdGEiO2E6Mzp7czoxMzoibGFzdF92aXNpdF9hdCI7czoxOToiMjAxNy0wMS0xNiAxNjozNDo1NiI7czoxMDoic2Vzc2lvbl9pZCI7czoyNjoiZmxtcGdhcmNuazgzZm9nMnY5NGd2OGFxMzYiO3M6MTA6InZpc2l0b3JfaWQiO3M6MjoiMjEiO319Y3VzdG9tZXJfYmFzZXxhOjA6e31jaGVja291dHxhOjA6e31tZXNzYWdlfGE6MDp7fWNhdGFsb2d8YTowOnt9'),('fnsturvcq87on9p5pb5kpu0sd7','1484584640','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9bWVzc2FnZXxhOjE6e3M6NzoiYmFja2VuZCI7TzozNjoiTWFnZW50b1xGcmFtZXdvcmtcTWVzc2FnZVxDb2xsZWN0aW9uIjoyOntzOjExOiIAKgBtZXNzYWdlcyI7YTowOnt9czoxOToiACoAbGFzdEFkZGVkTWVzc2FnZSI7Tjt9fWFkbWluaHRtbHxhOjM6e3M6NjoibG9jYWxlIjtzOjU6ImVuX1VTIjtzOjk6Il9mb3JtX2tleSI7czoxNjoic2JDVkF3Zmx3QnNza3FRSyI7czoxMzoiaXNfdXJsX25vdGljZSI7YjoxO31hZG1pbnxhOjM6e3M6NDoidXNlciI7TzoyMzoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXIiOjE2OntzOjE1OiIAKgBfZXZlbnRQcmVmaXgiO3M6MTA6ImFkbWluX3VzZXIiO3M6ODoiACoAX3JvbGUiO086NDQ6Ik1hZ2VudG9cQXV0aG9yaXphdGlvblxNb2RlbFxSb2xlXEludGVyY2VwdG9yIjoxNDp7czoxNToiACoAX2V2ZW50UHJlZml4IjtzOjE5OiJhdXRob3JpemF0aW9uX3JvbGVzIjtzOjE1OiIAKgBfZXZlbnRPYmplY3QiO3M6Njoib2JqZWN0IjtzOjE1OiIAKgBfaWRGaWVsZE5hbWUiO3M6Nzoicm9sZV9pZCI7czoxODoiACoAX2hhc0RhdGFDaGFuZ2VzIjtiOjA7czoxMjoiACoAX29yaWdEYXRhIjthOjg6e3M6Nzoicm9sZV9pZCI7czoxOiIxIjtzOjk6InBhcmVudF9pZCI7czoxOiIwIjtzOjEwOiJ0cmVlX2xldmVsIjtzOjE6IjEiO3M6MTA6InNvcnRfb3JkZXIiO3M6MToiMSI7czo5OiJyb2xlX3R5cGUiO3M6MToiRyI7czo3OiJ1c2VyX2lkIjtzOjE6IjAiO3M6OToidXNlcl90eXBlIjtzOjE6IjIiO3M6OToicm9sZV9uYW1lIjtzOjE0OiJBZG1pbmlzdHJhdG9ycyI7fXM6MTM6IgAqAF9pc0RlbGV0ZWQiO2I6MDtzOjE2OiIAKgBfcmVzb3VyY2VOYW1lIjtzOjQ2OiJNYWdlbnRvXEF1dGhvcml6YXRpb25cTW9kZWxcUmVzb3VyY2VNb2RlbFxSb2xlIjtzOjE4OiIAKgBfY29sbGVjdGlvbk5hbWUiO3M6NTc6Ik1hZ2VudG9cQXV0aG9yaXphdGlvblxNb2RlbFxSZXNvdXJjZU1vZGVsXFJvbGVcQ29sbGVjdGlvbiI7czoxMjoiACoAX2NhY2hlVGFnIjtiOjA7czoxOToiACoAX2RhdGFTYXZlQWxsb3dlZCI7YjoxO3M6MTU6IgAqAF9pc09iamVjdE5ldyI7TjtzOjIzOiIAKgBfdmFsaWRhdG9yQmVmb3JlU2F2ZSI7TjtzOjEzOiIAKgBzdG9yZWREYXRhIjthOjg6e3M6Nzoicm9sZV9pZCI7czoxOiIxIjtzOjk6InBhcmVudF9pZCI7czoxOiIwIjtzOjEwOiJ0cmVlX2xldmVsIjtzOjE6IjEiO3M6MTA6InNvcnRfb3JkZXIiO3M6MToiMSI7czo5OiJyb2xlX3R5cGUiO3M6MToiRyI7czo3OiJ1c2VyX2lkIjtzOjE6IjAiO3M6OToidXNlcl90eXBlIjtzOjE6IjIiO3M6OToicm9sZV9uYW1lIjtzOjE0OiJBZG1pbmlzdHJhdG9ycyI7fXM6ODoiACoAX2RhdGEiO2E6ODp7czo3OiJyb2xlX2lkIjtzOjE6IjEiO3M6OToicGFyZW50X2lkIjtzOjE6IjAiO3M6MTA6InRyZWVfbGV2ZWwiO3M6MToiMSI7czoxMDoic29ydF9vcmRlciI7czoxOiIxIjtzOjk6InJvbGVfdHlwZSI7czoxOiJHIjtzOjc6InVzZXJfaWQiO3M6MToiMCI7czo5OiJ1c2VyX3R5cGUiO3M6MToiMiI7czo5OiJyb2xlX25hbWUiO3M6MTQ6IkFkbWluaXN0cmF0b3JzIjt9fXM6MTY6IgAqAF9oYXNSZXNvdXJjZXMiO2I6MTtzOjE4OiIAKgB2YWxpZGF0aW9uUnVsZXMiO086Mzg6Ik1hZ2VudG9cVXNlclxNb2RlbFxVc2VyVmFsaWRhdGlvblJ1bGVzIjowOnt9czoxNToiACoAX2V2ZW50T2JqZWN0IjtzOjY6Im9iamVjdCI7czoxNToiACoAX2lkRmllbGROYW1lIjtzOjc6InVzZXJfaWQiO3M6MTg6IgAqAF9oYXNEYXRhQ2hhbmdlcyI7YjowO3M6MTI6IgAqAF9vcmlnRGF0YSI7YToxOTp7czo3OiJ1c2VyX2lkIjtzOjE6IjIiO3M6OToiZmlyc3RuYW1lIjtzOjU6ImFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjU6ImFkbWluIjtzOjU6ImVtYWlsIjtzOjQ2OiJhZG1pbjIzNEB3ZXJiZWFydGlrZWwtd2VyYmVnZXNjaGVua2Utb25saW5lLmRlIjtzOjg6InVzZXJuYW1lIjtzOjg6ImFkbWluMTIzIjtzOjg6InBhc3N3b3JkIjtzOjk5OiIxODlhZjQ3NTlkOWJjYTIwZjUxZmRlZmZkZDZhNTljM2Q3YzNmNTE4ZGFjNGQ0N2IyMGU4NzYzMjM5MDIwOTZkOmJaTXlLR0hucm1GcHZpQzBzelVMcEl0YjFzNDFyZ01yOjEiO3M6NzoiY3JlYXRlZCI7czoxOToiMjAxNy0wMS0xNSAwMjozODo0NiI7czo4OiJtb2RpZmllZCI7czoxOToiMjAxNy0wMS0xNiAxNjoxODo1OSI7czo3OiJsb2dkYXRlIjtzOjE5OiIyMDE3LTAxLTE2IDE2OjE4OjU5IjtzOjY6ImxvZ251bSI7czoxOiI4IjtzOjE1OiJyZWxvYWRfYWNsX2ZsYWciO3M6MToiMCI7czo5OiJpc19hY3RpdmUiO3M6MToiMSI7czo1OiJleHRyYSI7TjtzOjg6InJwX3Rva2VuIjtOO3M6MTk6InJwX3Rva2VuX2NyZWF0ZWRfYXQiO047czoxNjoiaW50ZXJmYWNlX2xvY2FsZSI7czo1OiJkZV9ERSI7czoxMjoiZmFpbHVyZXNfbnVtIjtzOjE6IjAiO3M6MTM6ImZpcnN0X2ZhaWx1cmUiO047czoxMjoibG9ja19leHBpcmVzIjtOO31zOjEzOiIAKgBfaXNEZWxldGVkIjtiOjA7czoxNjoiACoAX3Jlc291cmNlTmFtZSI7czozNzoiTWFnZW50b1xVc2VyXE1vZGVsXFJlc291cmNlTW9kZWxcVXNlciI7czoxODoiACoAX2NvbGxlY3Rpb25OYW1lIjtzOjQ4OiJNYWdlbnRvXFVzZXJcTW9kZWxcUmVzb3VyY2VNb2RlbFxVc2VyXENvbGxlY3Rpb24iO3M6MTI6IgAqAF9jYWNoZVRhZyI7YjowO3M6MTk6IgAqAF9kYXRhU2F2ZUFsbG93ZWQiO2I6MTtzOjE1OiIAKgBfaXNPYmplY3ROZXciO047czoxMzoiACoAc3RvcmVkRGF0YSI7YToxOTp7czo3OiJ1c2VyX2lkIjtzOjE6IjIiO3M6OToiZmlyc3RuYW1lIjtzOjU6ImFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjU6ImFkbWluIjtzOjU6ImVtYWlsIjtzOjQ2OiJhZG1pbjIzNEB3ZXJiZWFydGlrZWwtd2VyYmVnZXNjaGVua2Utb25saW5lLmRlIjtzOjg6InVzZXJuYW1lIjtzOjg6ImFkbWluMTIzIjtzOjg6InBhc3N3b3JkIjtzOjk5OiIxODlhZjQ3NTlkOWJjYTIwZjUxZmRlZmZkZDZhNTljM2Q3YzNmNTE4ZGFjNGQ0N2IyMGU4NzYzMjM5MDIwOTZkOmJaTXlLR0hucm1GcHZpQzBzelVMcEl0YjFzNDFyZ01yOjEiO3M6NzoiY3JlYXRlZCI7czoxOToiMjAxNy0wMS0xNSAwMjozODo0NiI7czo4OiJtb2RpZmllZCI7czoxOToiMjAxNy0wMS0xNiAxNjoxODo1OSI7czo3OiJsb2dkYXRlIjtzOjE5OiIyMDE3LTAxLTE2IDE2OjE4OjU5IjtzOjY6ImxvZ251bSI7czoxOiI4IjtzOjE1OiJyZWxvYWRfYWNsX2ZsYWciO3M6MToiMCI7czo5OiJpc19hY3RpdmUiO3M6MToiMSI7czo1OiJleHRyYSI7TjtzOjg6InJwX3Rva2VuIjtOO3M6MTk6InJwX3Rva2VuX2NyZWF0ZWRfYXQiO047czoxNjoiaW50ZXJmYWNlX2xvY2FsZSI7czo1OiJkZV9ERSI7czoxMjoiZmFpbHVyZXNfbnVtIjtzOjE6IjAiO3M6MTM6ImZpcnN0X2ZhaWx1cmUiO047czoxMjoibG9ja19leHBpcmVzIjtOO31zOjg6IgAqAF9kYXRhIjthOjE5OntzOjc6InVzZXJfaWQiO3M6MToiMiI7czo5OiJmaXJzdG5hbWUiO3M6NToiYWRtaW4iO3M6ODoibGFzdG5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6NDY6ImFkbWluMjM0QHdlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO3M6ODoidXNlcm5hbWUiO3M6ODoiYWRtaW4xMjMiO3M6ODoicGFzc3dvcmQiO3M6OTk6IjE4OWFmNDc1OWQ5YmNhMjBmNTFmZGVmZmRkNmE1OWMzZDdjM2Y1MThkYWM0ZDQ3YjIwZTg3NjMyMzkwMjA5NmQ6YlpNeUtHSG5ybUZwdmlDMHN6VUxwSXRiMXM0MXJnTXI6MSI7czo3OiJjcmVhdGVkIjtzOjE5OiIyMDE3LTAxLTE1IDAyOjM4OjQ2IjtzOjg6Im1vZGlmaWVkIjtzOjE5OiIyMDE3LTAxLTE2IDE2OjE4OjU5IjtzOjc6ImxvZ2RhdGUiO3M6MTk6IjIwMTctMDEtMTYgMTY6MTg6NTkiO3M6NjoibG9nbnVtIjtzOjE6IjgiO3M6MTU6InJlbG9hZF9hY2xfZmxhZyI7czoxOiIwIjtzOjk6ImlzX2FjdGl2ZSI7czoxOiIxIjtzOjU6ImV4dHJhIjtOO3M6ODoicnBfdG9rZW4iO047czoxOToicnBfdG9rZW5fY3JlYXRlZF9hdCI7TjtzOjE2OiJpbnRlcmZhY2VfbG9jYWxlIjtzOjU6ImRlX0RFIjtzOjEyOiJmYWlsdXJlc19udW0iO3M6MToiMCI7czoxMzoiZmlyc3RfZmFpbHVyZSI7TjtzOjEyOiJsb2NrX2V4cGlyZXMiO047fX1zOjM6ImFjbCI7TzoyMToiTWFnZW50b1xGcmFtZXdvcmtcQWNsIjo2OntzOjE2OiIAKgBfcm9sZVJlZ2lzdHJ5IjtPOjM1OiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcUm9sZVxSZWdpc3RyeSI6MTp7czo5OiIAKgBfcm9sZXMiO2E6Mzp7aToxO2E6Mzp7czo4OiJpbnN0YW5jZSI7Tzo0MjoiTWFnZW50b1xBdXRob3JpemF0aW9uXE1vZGVsXEFjbFxSb2xlXEdyb3VwIjoxOntzOjEwOiIAKgBfcm9sZUlkIjtzOjE6IjEiO31zOjc6InBhcmVudHMiO2E6MDp7fXM6ODoiY2hpbGRyZW4iO2E6Mjp7aToyO086NDE6Ik1hZ2VudG9cQXV0aG9yaXphdGlvblxNb2RlbFxBY2xcUm9sZVxVc2VyIjoxOntzOjEwOiIAKgBfcm9sZUlkIjtzOjE6IjIiO31pOjM7Tzo0MToiTWFnZW50b1xBdXRob3JpemF0aW9uXE1vZGVsXEFjbFxSb2xlXFVzZXIiOjE6e3M6MTA6IgAqAF9yb2xlSWQiO3M6MToiMyI7fX19aToyO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMzc7czo3OiJwYXJlbnRzIjthOjE6e2k6MTtyOjEzMzt9czo4OiJjaGlsZHJlbiI7YTowOnt9fWk6MzthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTM5O3M6NzoicGFyZW50cyI7YToxOntpOjE7cjoxMzM7fXM6ODoiY2hpbGRyZW4iO2E6MDp7fX19fXM6MTM6IgAqAF9yZXNvdXJjZXMiO2E6MTg4OntzOjIwOiJNYWdlbnRvX0JhY2tlbmQ6OmFsbCI7YTozOntzOjg6Imluc3RhbmNlIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIwOiJNYWdlbnRvX0JhY2tlbmQ6OmFsbCI7fXM6NjoicGFyZW50IjtOO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIyOiJNYWdlbnRvX0JhY2tlbmQ6OmFkbWluIjthOjM6e3M6ODoiaW5zdGFuY2UiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjI6Ik1hZ2VudG9fQmFja2VuZDo6YWRtaW4iO31zOjY6InBhcmVudCI7TjtzOjg6ImNoaWxkcmVuIjthOjEyOntzOjI2OiJNYWdlbnRvX0JhY2tlbmQ6OmRhc2hib2FyZCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNjoiTWFnZW50b19CYWNrZW5kOjpkYXNoYm9hcmQiO31zOjIwOiJNYWdlbnRvX1NhbGVzOjpzYWxlcyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMDoiTWFnZW50b19TYWxlczo6c2FsZXMiO31zOjI0OiJNYWdlbnRvX0NhdGFsb2c6OmNhdGFsb2ciO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjQ6Ik1hZ2VudG9fQ2F0YWxvZzo6Y2F0YWxvZyI7fXM6MjY6Ik1hZ2VudG9fQ3VzdG9tZXI6OmN1c3RvbWVyIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI2OiJNYWdlbnRvX0N1c3RvbWVyOjpjdXN0b21lciI7fXM6MTg6Ik1hZ2VudG9fQ2FydDo6Y2FydCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoxODoiTWFnZW50b19DYXJ0OjpjYXJ0Ijt9czoyNjoiTWFnZW50b19CYWNrZW5kOjpteWFjY291bnQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjY6Ik1hZ2VudG9fQmFja2VuZDo6bXlhY2NvdW50Ijt9czoyNjoiTWFnZW50b19CYWNrZW5kOjptYXJrZXRpbmciO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjY6Ik1hZ2VudG9fQmFja2VuZDo6bWFya2V0aW5nIjt9czoyNDoiTWFnZW50b19CYWNrZW5kOjpjb250ZW50IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI0OiJNYWdlbnRvX0JhY2tlbmQ6OmNvbnRlbnQiO31zOjIzOiJNYWdlbnRvX1JlcG9ydHM6OnJlcG9ydCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMzoiTWFnZW50b19SZXBvcnRzOjpyZXBvcnQiO31zOjIzOiJNYWdlbnRvX0JhY2tlbmQ6OnN0b3JlcyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMzoiTWFnZW50b19CYWNrZW5kOjpzdG9yZXMiO31zOjIzOiJNYWdlbnRvX0JhY2tlbmQ6OnN5c3RlbSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMzoiTWFnZW50b19CYWNrZW5kOjpzeXN0ZW0iO31zOjMwOiJNYWdlbnRvX0JhY2tlbmQ6Omdsb2JhbF9zZWFyY2giO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzA6Ik1hZ2VudG9fQmFja2VuZDo6Z2xvYmFsX3NlYXJjaCI7fX19czoyNjoiTWFnZW50b19CYWNrZW5kOjpkYXNoYm9hcmQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxNjI7czo2OiJwYXJlbnQiO3I6MTU4O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIwOiJNYWdlbnRvX1NhbGVzOjpzYWxlcyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjE2NDtzOjY6InBhcmVudCI7cjoxNTg7czo4OiJjaGlsZHJlbiI7YToxOntzOjMwOiJNYWdlbnRvX1NhbGVzOjpzYWxlc19vcGVyYXRpb24iO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzA6Ik1hZ2VudG9fU2FsZXM6OnNhbGVzX29wZXJhdGlvbiI7fX19czozMDoiTWFnZW50b19TYWxlczo6c2FsZXNfb3BlcmF0aW9uIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTk0O3M6NjoicGFyZW50IjtyOjE2NDtzOjg6ImNoaWxkcmVuIjthOjY6e3M6MjY6Ik1hZ2VudG9fU2FsZXM6OnNhbGVzX29yZGVyIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI2OiJNYWdlbnRvX1NhbGVzOjpzYWxlc19vcmRlciI7fXM6Mjg6Ik1hZ2VudG9fU2FsZXM6OnNhbGVzX2ludm9pY2UiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6Mjg6Ik1hZ2VudG9fU2FsZXM6OnNhbGVzX2ludm9pY2UiO31zOjIzOiJNYWdlbnRvX1NhbGVzOjpzaGlwbWVudCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMzoiTWFnZW50b19TYWxlczo6c2hpcG1lbnQiO31zOjMxOiJNYWdlbnRvX1NhbGVzOjpzYWxlc19jcmVkaXRtZW1vIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjMxOiJNYWdlbnRvX1NhbGVzOjpzYWxlc19jcmVkaXRtZW1vIjt9czozMzoiTWFnZW50b19QYXlwYWw6OmJpbGxpbmdfYWdyZWVtZW50IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjMzOiJNYWdlbnRvX1BheXBhbDo6YmlsbGluZ19hZ3JlZW1lbnQiO31zOjI3OiJNYWdlbnRvX1NhbGVzOjp0cmFuc2FjdGlvbnMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6Mjc6Ik1hZ2VudG9fU2FsZXM6OnRyYW5zYWN0aW9ucyI7fX19czoyNjoiTWFnZW50b19TYWxlczo6c2FsZXNfb3JkZXIiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoyMDA7czo2OiJwYXJlbnQiO3I6MTk0O3M6ODoiY2hpbGRyZW4iO2E6MTp7czoyMjoiTWFnZW50b19TYWxlczo6YWN0aW9ucyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMjoiTWFnZW50b19TYWxlczo6YWN0aW9ucyI7fX19czoyMjoiTWFnZW50b19TYWxlczo6YWN0aW9ucyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjIxNjtzOjY6InBhcmVudCI7cjoyMDA7czo4OiJjaGlsZHJlbiI7YToxNTp7czoyMToiTWFnZW50b19TYWxlczo6Y3JlYXRlIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIxOiJNYWdlbnRvX1NhbGVzOjpjcmVhdGUiO31zOjI3OiJNYWdlbnRvX1NhbGVzOjphY3Rpb25zX3ZpZXciO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6Mjc6Ik1hZ2VudG9fU2FsZXM6OmFjdGlvbnNfdmlldyI7fXM6MjA6Ik1hZ2VudG9fU2FsZXM6OmVtYWlsIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIwOiJNYWdlbnRvX1NhbGVzOjplbWFpbCI7fXM6MjI6Ik1hZ2VudG9fU2FsZXM6OnJlb3JkZXIiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjI6Ik1hZ2VudG9fU2FsZXM6OnJlb3JkZXIiO31zOjI3OiJNYWdlbnRvX1NhbGVzOjphY3Rpb25zX2VkaXQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6Mjc6Ik1hZ2VudG9fU2FsZXM6OmFjdGlvbnNfZWRpdCI7fXM6MjE6Ik1hZ2VudG9fU2FsZXM6OmNhbmNlbCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMToiTWFnZW50b19TYWxlczo6Y2FuY2VsIjt9czoyOToiTWFnZW50b19TYWxlczo6cmV2aWV3X3BheW1lbnQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6Mjk6Ik1hZ2VudG9fU2FsZXM6OnJldmlld19wYXltZW50Ijt9czoyMjoiTWFnZW50b19TYWxlczo6Y2FwdHVyZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMjoiTWFnZW50b19TYWxlczo6Y2FwdHVyZSI7fXM6MjI6Ik1hZ2VudG9fU2FsZXM6Omludm9pY2UiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjI6Ik1hZ2VudG9fU2FsZXM6Omludm9pY2UiO31zOjI1OiJNYWdlbnRvX1NhbGVzOjpjcmVkaXRtZW1vIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI1OiJNYWdlbnRvX1NhbGVzOjpjcmVkaXRtZW1vIjt9czoxOToiTWFnZW50b19TYWxlczo6aG9sZCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoxOToiTWFnZW50b19TYWxlczo6aG9sZCI7fXM6MjE6Ik1hZ2VudG9fU2FsZXM6OnVuaG9sZCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMToiTWFnZW50b19TYWxlczo6dW5ob2xkIjt9czoxOToiTWFnZW50b19TYWxlczo6c2hpcCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoxOToiTWFnZW50b19TYWxlczo6c2hpcCI7fXM6MjI6Ik1hZ2VudG9fU2FsZXM6OmNvbW1lbnQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjI6Ik1hZ2VudG9fU2FsZXM6OmNvbW1lbnQiO31zOjIxOiJNYWdlbnRvX1NhbGVzOjplbWFpbHMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjE6Ik1hZ2VudG9fU2FsZXM6OmVtYWlscyI7fX19czoyMToiTWFnZW50b19TYWxlczo6Y3JlYXRlIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjIyO3M6NjoicGFyZW50IjtyOjIxNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyNzoiTWFnZW50b19TYWxlczo6YWN0aW9uc192aWV3IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjI0O3M6NjoicGFyZW50IjtyOjIxNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyMDoiTWFnZW50b19TYWxlczo6ZW1haWwiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoyMjY7czo2OiJwYXJlbnQiO3I6MjE2O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIyOiJNYWdlbnRvX1NhbGVzOjpyZW9yZGVyIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjI4O3M6NjoicGFyZW50IjtyOjIxNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyNzoiTWFnZW50b19TYWxlczo6YWN0aW9uc19lZGl0IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjMwO3M6NjoicGFyZW50IjtyOjIxNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyMToiTWFnZW50b19TYWxlczo6Y2FuY2VsIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjMyO3M6NjoicGFyZW50IjtyOjIxNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyOToiTWFnZW50b19TYWxlczo6cmV2aWV3X3BheW1lbnQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoyMzQ7czo2OiJwYXJlbnQiO3I6MjE2O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIyOiJNYWdlbnRvX1NhbGVzOjpjYXB0dXJlIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjM2O3M6NjoicGFyZW50IjtyOjIxNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyMjoiTWFnZW50b19TYWxlczo6aW52b2ljZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjIzODtzOjY6InBhcmVudCI7cjoyMTY7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjU6Ik1hZ2VudG9fU2FsZXM6OmNyZWRpdG1lbW8iO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoyNDA7czo2OiJwYXJlbnQiO3I6MjE2O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjE5OiJNYWdlbnRvX1NhbGVzOjpob2xkIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjQyO3M6NjoicGFyZW50IjtyOjIxNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyMToiTWFnZW50b19TYWxlczo6dW5ob2xkIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjQ0O3M6NjoicGFyZW50IjtyOjIxNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoxOToiTWFnZW50b19TYWxlczo6c2hpcCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjI0NjtzOjY6InBhcmVudCI7cjoyMTY7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjI6Ik1hZ2VudG9fU2FsZXM6OmNvbW1lbnQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoyNDg7czo2OiJwYXJlbnQiO3I6MjE2O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIxOiJNYWdlbnRvX1NhbGVzOjplbWFpbHMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoyNTA7czo2OiJwYXJlbnQiO3I6MjE2O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI4OiJNYWdlbnRvX1NhbGVzOjpzYWxlc19pbnZvaWNlIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjAyO3M6NjoicGFyZW50IjtyOjE5NDtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyMzoiTWFnZW50b19TYWxlczo6c2hpcG1lbnQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoyMDQ7czo2OiJwYXJlbnQiO3I6MTk0O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjMxOiJNYWdlbnRvX1NhbGVzOjpzYWxlc19jcmVkaXRtZW1vIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjA2O3M6NjoicGFyZW50IjtyOjE5NDtzOjg6ImNoaWxkcmVuIjthOjA6e319czozMzoiTWFnZW50b19QYXlwYWw6OmJpbGxpbmdfYWdyZWVtZW50IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MjA4O3M6NjoicGFyZW50IjtyOjE5NDtzOjg6ImNoaWxkcmVuIjthOjE6e3M6NDE6Ik1hZ2VudG9fUGF5cGFsOjpiaWxsaW5nX2FncmVlbWVudF9hY3Rpb25zIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjQxOiJNYWdlbnRvX1BheXBhbDo6YmlsbGluZ19hZ3JlZW1lbnRfYWN0aW9ucyI7fX19czo0MToiTWFnZW50b19QYXlwYWw6OmJpbGxpbmdfYWdyZWVtZW50X2FjdGlvbnMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjozMjg7czo2OiJwYXJlbnQiO3I6MjA4O3M6ODoiY2hpbGRyZW4iO2E6Mzp7czo0NjoiTWFnZW50b19QYXlwYWw6OmJpbGxpbmdfYWdyZWVtZW50X2FjdGlvbnNfdmlldyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czo0NjoiTWFnZW50b19QYXlwYWw6OmJpbGxpbmdfYWdyZWVtZW50X2FjdGlvbnNfdmlldyI7fXM6MzA6Ik1hZ2VudG9fUGF5cGFsOjphY3Rpb25zX21hbmFnZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozMDoiTWFnZW50b19QYXlwYWw6OmFjdGlvbnNfbWFuYWdlIjt9czoxOToiTWFnZW50b19QYXlwYWw6OnVzZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoxOToiTWFnZW50b19QYXlwYWw6OnVzZSI7fX19czo0NjoiTWFnZW50b19QYXlwYWw6OmJpbGxpbmdfYWdyZWVtZW50X2FjdGlvbnNfdmlldyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjMzNDtzOjY6InBhcmVudCI7cjozMjg7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzA6Ik1hZ2VudG9fUGF5cGFsOjphY3Rpb25zX21hbmFnZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjMzNjtzOjY6InBhcmVudCI7cjozMjg7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MTk6Ik1hZ2VudG9fUGF5cGFsOjp1c2UiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjozMzg7czo2OiJwYXJlbnQiO3I6MzI4O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI3OiJNYWdlbnRvX1NhbGVzOjp0cmFuc2FjdGlvbnMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoyMTA7czo2OiJwYXJlbnQiO3I6MTk0O3M6ODoiY2hpbGRyZW4iO2E6MTp7czozMzoiTWFnZW50b19TYWxlczo6dHJhbnNhY3Rpb25zX2ZldGNoIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjMzOiJNYWdlbnRvX1NhbGVzOjp0cmFuc2FjdGlvbnNfZmV0Y2giO319fXM6MzM6Ik1hZ2VudG9fU2FsZXM6OnRyYW5zYWN0aW9uc19mZXRjaCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjM1NjtzOjY6InBhcmVudCI7cjoyMTA7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjQ6Ik1hZ2VudG9fQ2F0YWxvZzo6Y2F0YWxvZyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjE2NjtzOjY6InBhcmVudCI7cjoxNTg7czo4OiJjaGlsZHJlbiI7YToxOntzOjM0OiJNYWdlbnRvX0NhdGFsb2c6OmNhdGFsb2dfaW52ZW50b3J5IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjM0OiJNYWdlbnRvX0NhdGFsb2c6OmNhdGFsb2dfaW52ZW50b3J5Ijt9fX1zOjM0OiJNYWdlbnRvX0NhdGFsb2c6OmNhdGFsb2dfaW52ZW50b3J5IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MzY2O3M6NjoicGFyZW50IjtyOjE2NjtzOjg6ImNoaWxkcmVuIjthOjI6e3M6MjU6Ik1hZ2VudG9fQ2F0YWxvZzo6cHJvZHVjdHMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjU6Ik1hZ2VudG9fQ2F0YWxvZzo6cHJvZHVjdHMiO31zOjI3OiJNYWdlbnRvX0NhdGFsb2c6OmNhdGVnb3JpZXMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6Mjc6Ik1hZ2VudG9fQ2F0YWxvZzo6Y2F0ZWdvcmllcyI7fX19czoyNToiTWFnZW50b19DYXRhbG9nOjpwcm9kdWN0cyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjM3MjtzOjY6InBhcmVudCI7cjozNjY7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6Mjc6Ik1hZ2VudG9fQ2F0YWxvZzo6Y2F0ZWdvcmllcyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjM3NDtzOjY6InBhcmVudCI7cjozNjY7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjY6Ik1hZ2VudG9fQ3VzdG9tZXI6OmN1c3RvbWVyIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTY4O3M6NjoicGFyZW50IjtyOjE1ODtzOjg6ImNoaWxkcmVuIjthOjI6e3M6MjQ6Ik1hZ2VudG9fQ3VzdG9tZXI6Om1hbmFnZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNDoiTWFnZW50b19DdXN0b21lcjo6bWFuYWdlIjt9czoyNDoiTWFnZW50b19DdXN0b21lcjo6b25saW5lIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI0OiJNYWdlbnRvX0N1c3RvbWVyOjpvbmxpbmUiO319fXM6MjQ6Ik1hZ2VudG9fQ3VzdG9tZXI6Om1hbmFnZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjM4ODtzOjY6InBhcmVudCI7cjoxNjg7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjQ6Ik1hZ2VudG9fQ3VzdG9tZXI6Om9ubGluZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjM5MDtzOjY6InBhcmVudCI7cjoxNjg7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MTg6Ik1hZ2VudG9fQ2FydDo6Y2FydCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjE3MDtzOjY6InBhcmVudCI7cjoxNTg7czo4OiJjaGlsZHJlbiI7YToxOntzOjIwOiJNYWdlbnRvX0NhcnQ6Om1hbmFnZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMDoiTWFnZW50b19DYXJ0OjptYW5hZ2UiO319fXM6MjA6Ik1hZ2VudG9fQ2FydDo6bWFuYWdlIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NDA0O3M6NjoicGFyZW50IjtyOjE3MDtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyNjoiTWFnZW50b19CYWNrZW5kOjpteWFjY291bnQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxNzI7czo2OiJwYXJlbnQiO3I6MTU4O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI2OiJNYWdlbnRvX0JhY2tlbmQ6Om1hcmtldGluZyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjE3NDtzOjY6InBhcmVudCI7cjoxNTg7czo4OiJjaGlsZHJlbiI7YTo0OntzOjI2OiJNYWdlbnRvX0NhdGFsb2dSdWxlOjpwcm9tbyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNjoiTWFnZW50b19DYXRhbG9nUnVsZTo6cHJvbW8iO31zOjQxOiJNYWdlbnRvX0JhY2tlbmQ6Om1hcmtldGluZ19jb21tdW5pY2F0aW9ucyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czo0MToiTWFnZW50b19CYWNrZW5kOjptYXJrZXRpbmdfY29tbXVuaWNhdGlvbnMiO31zOjMwOiJNYWdlbnRvX0JhY2tlbmQ6Om1hcmtldGluZ19zZW8iO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzA6Ik1hZ2VudG9fQmFja2VuZDo6bWFya2V0aW5nX3NlbyI7fXM6Mzk6Ik1hZ2VudG9fQmFja2VuZDo6bWFya2V0aW5nX3VzZXJfY29udGVudCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozOToiTWFnZW50b19CYWNrZW5kOjptYXJrZXRpbmdfdXNlcl9jb250ZW50Ijt9fX1zOjI2OiJNYWdlbnRvX0NhdGFsb2dSdWxlOjpwcm9tbyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjQxODtzOjY6InBhcmVudCI7cjoxNzQ7czo4OiJjaGlsZHJlbiI7YToyOntzOjM0OiJNYWdlbnRvX0NhdGFsb2dSdWxlOjpwcm9tb19jYXRhbG9nIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjM0OiJNYWdlbnRvX0NhdGFsb2dSdWxlOjpwcm9tb19jYXRhbG9nIjt9czoyNDoiTWFnZW50b19TYWxlc1J1bGU6OnF1b3RlIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI0OiJNYWdlbnRvX1NhbGVzUnVsZTo6cXVvdGUiO319fXM6MzQ6Ik1hZ2VudG9fQ2F0YWxvZ1J1bGU6OnByb21vX2NhdGFsb2ciO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo0MzA7czo2OiJwYXJlbnQiO3I6NDE4O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI0OiJNYWdlbnRvX1NhbGVzUnVsZTo6cXVvdGUiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo0MzI7czo2OiJwYXJlbnQiO3I6NDE4O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjQxOiJNYWdlbnRvX0JhY2tlbmQ6Om1hcmtldGluZ19jb21tdW5pY2F0aW9ucyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjQyMDtzOjY6InBhcmVudCI7cjoxNzQ7czo4OiJjaGlsZHJlbiI7YTo0OntzOjIzOiJNYWdlbnRvX0VtYWlsOjp0ZW1wbGF0ZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMzoiTWFnZW50b19FbWFpbDo6dGVtcGxhdGUiO31zOjI4OiJNYWdlbnRvX05ld3NsZXR0ZXI6OnRlbXBsYXRlIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI4OiJNYWdlbnRvX05ld3NsZXR0ZXI6OnRlbXBsYXRlIjt9czoyNToiTWFnZW50b19OZXdzbGV0dGVyOjpxdWV1ZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNToiTWFnZW50b19OZXdzbGV0dGVyOjpxdWV1ZSI7fXM6MzA6Ik1hZ2VudG9fTmV3c2xldHRlcjo6c3Vic2NyaWJlciI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozMDoiTWFnZW50b19OZXdzbGV0dGVyOjpzdWJzY3JpYmVyIjt9fX1zOjIzOiJNYWdlbnRvX0VtYWlsOjp0ZW1wbGF0ZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjQ0NjtzOjY6InBhcmVudCI7cjo0MjA7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6Mjg6Ik1hZ2VudG9fTmV3c2xldHRlcjo6dGVtcGxhdGUiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo0NDg7czo2OiJwYXJlbnQiO3I6NDIwO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI1OiJNYWdlbnRvX05ld3NsZXR0ZXI6OnF1ZXVlIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NDUwO3M6NjoicGFyZW50IjtyOjQyMDtzOjg6ImNoaWxkcmVuIjthOjA6e319czozMDoiTWFnZW50b19OZXdzbGV0dGVyOjpzdWJzY3JpYmVyIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NDUyO3M6NjoicGFyZW50IjtyOjQyMDtzOjg6ImNoaWxkcmVuIjthOjA6e319czozMDoiTWFnZW50b19CYWNrZW5kOjptYXJrZXRpbmdfc2VvIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NDIyO3M6NjoicGFyZW50IjtyOjE3NDtzOjg6ImNoaWxkcmVuIjthOjQ6e3M6MjI6Ik1hZ2VudG9fU2VhcmNoOjpzZWFyY2giO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjI6Ik1hZ2VudG9fU2VhcmNoOjpzZWFyY2giO31zOjI0OiJNYWdlbnRvX1NlYXJjaDo6c3lub255bXMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjQ6Ik1hZ2VudG9fU2VhcmNoOjpzeW5vbnltcyI7fXM6MzA6Ik1hZ2VudG9fVXJsUmV3cml0ZTo6dXJscmV3cml0ZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozMDoiTWFnZW50b19VcmxSZXdyaXRlOjp1cmxyZXdyaXRlIjt9czoyNDoiTWFnZW50b19TaXRlbWFwOjpzaXRlbWFwIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI0OiJNYWdlbnRvX1NpdGVtYXA6OnNpdGVtYXAiO319fXM6MjI6Ik1hZ2VudG9fU2VhcmNoOjpzZWFyY2giO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo0NzQ7czo2OiJwYXJlbnQiO3I6NDIyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI0OiJNYWdlbnRvX1NlYXJjaDo6c3lub255bXMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo0NzY7czo2OiJwYXJlbnQiO3I6NDIyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjMwOiJNYWdlbnRvX1VybFJld3JpdGU6OnVybHJld3JpdGUiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo0Nzg7czo2OiJwYXJlbnQiO3I6NDIyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI0OiJNYWdlbnRvX1NpdGVtYXA6OnNpdGVtYXAiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo0ODA7czo2OiJwYXJlbnQiO3I6NDIyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjM5OiJNYWdlbnRvX0JhY2tlbmQ6Om1hcmtldGluZ191c2VyX2NvbnRlbnQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo0MjQ7czo2OiJwYXJlbnQiO3I6MTc0O3M6ODoiY2hpbGRyZW4iO2E6MTp7czoyNzoiTWFnZW50b19SZXZpZXc6OnJldmlld3NfYWxsIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI3OiJNYWdlbnRvX1Jldmlldzo6cmV2aWV3c19hbGwiO319fXM6Mjc6Ik1hZ2VudG9fUmV2aWV3OjpyZXZpZXdzX2FsbCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjUwMjtzOjY6InBhcmVudCI7cjo0MjQ7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjQ6Ik1hZ2VudG9fQmFja2VuZDo6Y29udGVudCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjE3NjtzOjY6InBhcmVudCI7cjoxNTg7czo4OiJjaGlsZHJlbiI7YTozOntzOjMzOiJNYWdlbnRvX0JhY2tlbmQ6OmNvbnRlbnRfZWxlbWVudHMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzM6Ik1hZ2VudG9fQmFja2VuZDo6Y29udGVudF9lbGVtZW50cyI7fXM6MjM6Ik1hZ2VudG9fQmFja2VuZDo6ZGVzaWduIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIzOiJNYWdlbnRvX0JhY2tlbmQ6OmRlc2lnbiI7fXM6MjU6IkFoZWFkd29ya3NfUmJzbGlkZXI6Om1haW4iO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjU6IkFoZWFkd29ya3NfUmJzbGlkZXI6Om1haW4iO319fXM6MzM6Ik1hZ2VudG9fQmFja2VuZDo6Y29udGVudF9lbGVtZW50cyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjUxMjtzOjY6InBhcmVudCI7cjoxNzY7czo4OiJjaGlsZHJlbiI7YTo0OntzOjE3OiJNYWdlbnRvX0Ntczo6cGFnZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoxNzoiTWFnZW50b19DbXM6OnBhZ2UiO31zOjE4OiJNYWdlbnRvX0Ntczo6YmxvY2siO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MTg6Ik1hZ2VudG9fQ21zOjpibG9jayI7fXM6MzE6Ik1hZ2VudG9fV2lkZ2V0Ojp3aWRnZXRfaW5zdGFuY2UiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzE6Ik1hZ2VudG9fV2lkZ2V0Ojp3aWRnZXRfaW5zdGFuY2UiO31zOjI2OiJNYWdlbnRvX0Ntczo6bWVkaWFfZ2FsbGVyeSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNjoiTWFnZW50b19DbXM6Om1lZGlhX2dhbGxlcnkiO319fXM6MTc6Ik1hZ2VudG9fQ21zOjpwYWdlIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NTIyO3M6NjoicGFyZW50IjtyOjUxMjtzOjg6ImNoaWxkcmVuIjthOjI6e3M6MTc6Ik1hZ2VudG9fQ21zOjpzYXZlIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjE3OiJNYWdlbnRvX0Ntczo6c2F2ZSI7fXM6MjQ6Ik1hZ2VudG9fQ21zOjpwYWdlX2RlbGV0ZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNDoiTWFnZW50b19DbXM6OnBhZ2VfZGVsZXRlIjt9fX1zOjE3OiJNYWdlbnRvX0Ntczo6c2F2ZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjUzNDtzOjY6InBhcmVudCI7cjo1MjI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjQ6Ik1hZ2VudG9fQ21zOjpwYWdlX2RlbGV0ZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjUzNjtzOjY6InBhcmVudCI7cjo1MjI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MTg6Ik1hZ2VudG9fQ21zOjpibG9jayI7YTozOntzOjg6Imluc3RhbmNlIjtyOjUyNDtzOjY6InBhcmVudCI7cjo1MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzE6Ik1hZ2VudG9fV2lkZ2V0Ojp3aWRnZXRfaW5zdGFuY2UiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo1MjY7czo2OiJwYXJlbnQiO3I6NTEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI2OiJNYWdlbnRvX0Ntczo6bWVkaWFfZ2FsbGVyeSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjUyODtzOjY6InBhcmVudCI7cjo1MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjM6Ik1hZ2VudG9fQmFja2VuZDo6ZGVzaWduIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NTE0O3M6NjoicGFyZW50IjtyOjE3NjtzOjg6ImNoaWxkcmVuIjthOjI6e3M6MjA6Ik1hZ2VudG9fVGhlbWU6OnRoZW1lIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIwOiJNYWdlbnRvX1RoZW1lOjp0aGVtZSI7fXM6MjU6Ik1hZ2VudG9fQmFja2VuZDo6c2NoZWR1bGUiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjU6Ik1hZ2VudG9fQmFja2VuZDo6c2NoZWR1bGUiO319fXM6MjA6Ik1hZ2VudG9fVGhlbWU6OnRoZW1lIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NTYyO3M6NjoicGFyZW50IjtyOjUxNDtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyNToiTWFnZW50b19CYWNrZW5kOjpzY2hlZHVsZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjU2NDtzOjY6InBhcmVudCI7cjo1MTQ7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjU6IkFoZWFkd29ya3NfUmJzbGlkZXI6Om1haW4iO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo1MTY7czo2OiJwYXJlbnQiO3I6MTc2O3M6ODoiY2hpbGRyZW4iO2E6Mzp7czoyNzoiQWhlYWR3b3Jrc19SYnNsaWRlcjo6c2xpZGVzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI3OiJBaGVhZHdvcmtzX1Jic2xpZGVyOjpzbGlkZXMiO31zOjI4OiJBaGVhZHdvcmtzX1Jic2xpZGVyOjpiYW5uZXJzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI4OiJBaGVhZHdvcmtzX1Jic2xpZGVyOjpiYW5uZXJzIjt9czozMToiQWhlYWR3b3Jrc19SYnNsaWRlcjo6c3RhdGlzdGljcyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozMToiQWhlYWR3b3Jrc19SYnNsaWRlcjo6c3RhdGlzdGljcyI7fX19czoyNzoiQWhlYWR3b3Jrc19SYnNsaWRlcjo6c2xpZGVzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NTc4O3M6NjoicGFyZW50IjtyOjUxNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyODoiQWhlYWR3b3Jrc19SYnNsaWRlcjo6YmFubmVycyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjU4MDtzOjY6InBhcmVudCI7cjo1MTY7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzE6IkFoZWFkd29ya3NfUmJzbGlkZXI6OnN0YXRpc3RpY3MiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo1ODI7czo2OiJwYXJlbnQiO3I6NTE2O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIzOiJNYWdlbnRvX1JlcG9ydHM6OnJlcG9ydCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjE3ODtzOjY6InBhcmVudCI7cjoxNTg7czo4OiJjaGlsZHJlbiI7YTo2OntzOjMzOiJNYWdlbnRvX1JlcG9ydHM6OnJlcG9ydF9tYXJrZXRpbmciO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzM6Ik1hZ2VudG9fUmVwb3J0czo6cmVwb3J0X21hcmtldGluZyI7fXM6MjM6Ik1hZ2VudG9fUmVwb3J0czo6cmV2aWV3IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIzOiJNYWdlbnRvX1JlcG9ydHM6OnJldmlldyI7fXM6MjY6Ik1hZ2VudG9fUmVwb3J0czo6c2FsZXNyb290IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI2OiJNYWdlbnRvX1JlcG9ydHM6OnNhbGVzcm9vdCI7fXM6MjY6Ik1hZ2VudG9fUmVwb3J0czo6Y3VzdG9tZXJzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI2OiJNYWdlbnRvX1JlcG9ydHM6OmN1c3RvbWVycyI7fXM6MzI6Ik1hZ2VudG9fUmVwb3J0czo6cmVwb3J0X3Byb2R1Y3RzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjMyOiJNYWdlbnRvX1JlcG9ydHM6OnJlcG9ydF9wcm9kdWN0cyI7fXM6Mjc6Ik1hZ2VudG9fUmVwb3J0czo6c3RhdGlzdGljcyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNzoiTWFnZW50b19SZXBvcnRzOjpzdGF0aXN0aWNzIjt9fX1zOjMzOiJNYWdlbnRvX1JlcG9ydHM6OnJlcG9ydF9tYXJrZXRpbmciO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo2MDA7czo2OiJwYXJlbnQiO3I6MTc4O3M6ODoiY2hpbGRyZW4iO2E6Mzp7czoyNToiTWFnZW50b19SZXBvcnRzOjpzaG9wY2FydCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNToiTWFnZW50b19SZXBvcnRzOjpzaG9wY2FydCI7fXM6MzA6Ik1hZ2VudG9fUmVwb3J0czo6cmVwb3J0X3NlYXJjaCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozMDoiTWFnZW50b19SZXBvcnRzOjpyZXBvcnRfc2VhcmNoIjt9czoyNzoiTWFnZW50b19OZXdzbGV0dGVyOjpwcm9ibGVtIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI3OiJNYWdlbnRvX05ld3NsZXR0ZXI6OnByb2JsZW0iO319fXM6MjU6Ik1hZ2VudG9fUmVwb3J0czo6c2hvcGNhcnQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo2MTY7czo2OiJwYXJlbnQiO3I6NjAwO3M6ODoiY2hpbGRyZW4iO2E6Mjp7czoyNDoiTWFnZW50b19SZXBvcnRzOjpwcm9kdWN0IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI0OiJNYWdlbnRvX1JlcG9ydHM6OnByb2R1Y3QiO31zOjI2OiJNYWdlbnRvX1JlcG9ydHM6OmFiYW5kb25lZCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNjoiTWFnZW50b19SZXBvcnRzOjphYmFuZG9uZWQiO319fXM6MjQ6Ik1hZ2VudG9fUmVwb3J0czo6cHJvZHVjdCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjYyNjtzOjY6InBhcmVudCI7cjo2MTY7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjY6Ik1hZ2VudG9fUmVwb3J0czo6YWJhbmRvbmVkIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NjI4O3M6NjoicGFyZW50IjtyOjYxNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czozMDoiTWFnZW50b19SZXBvcnRzOjpyZXBvcnRfc2VhcmNoIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NjE4O3M6NjoicGFyZW50IjtyOjYwMDtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyNzoiTWFnZW50b19OZXdzbGV0dGVyOjpwcm9ibGVtIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NjIwO3M6NjoicGFyZW50IjtyOjYwMDtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyMzoiTWFnZW50b19SZXBvcnRzOjpyZXZpZXciO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo2MDI7czo2OiJwYXJlbnQiO3I6MTc4O3M6ODoiY2hpbGRyZW4iO2E6Mjp7czozMjoiTWFnZW50b19SZXBvcnRzOjpyZXZpZXdfY3VzdG9tZXIiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzI6Ik1hZ2VudG9fUmVwb3J0czo6cmV2aWV3X2N1c3RvbWVyIjt9czozMToiTWFnZW50b19SZXBvcnRzOjpyZXZpZXdfcHJvZHVjdCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozMToiTWFnZW50b19SZXBvcnRzOjpyZXZpZXdfcHJvZHVjdCI7fX19czozMjoiTWFnZW50b19SZXBvcnRzOjpyZXZpZXdfY3VzdG9tZXIiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo2NTA7czo2OiJwYXJlbnQiO3I6NjAyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjMxOiJNYWdlbnRvX1JlcG9ydHM6OnJldmlld19wcm9kdWN0IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NjUyO3M6NjoicGFyZW50IjtyOjYwMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyNjoiTWFnZW50b19SZXBvcnRzOjpzYWxlc3Jvb3QiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo2MDQ7czo2OiJwYXJlbnQiO3I6MTc4O3M6ODoiY2hpbGRyZW4iO2E6ODp7czozMjoiTWFnZW50b19SZXBvcnRzOjpzYWxlc3Jvb3Rfc2FsZXMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzI6Ik1hZ2VudG9fUmVwb3J0czo6c2FsZXNyb290X3NhbGVzIjt9czoyMDoiTWFnZW50b19SZXBvcnRzOjp0YXgiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjA6Ik1hZ2VudG9fUmVwb3J0czo6dGF4Ijt9czoyNToiTWFnZW50b19SZXBvcnRzOjppbnZvaWNlZCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNToiTWFnZW50b19SZXBvcnRzOjppbnZvaWNlZCI7fXM6MjU6Ik1hZ2VudG9fUmVwb3J0czo6c2hpcHBpbmciO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjU6Ik1hZ2VudG9fUmVwb3J0czo6c2hpcHBpbmciO31zOjI1OiJNYWdlbnRvX1JlcG9ydHM6OnJlZnVuZGVkIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI1OiJNYWdlbnRvX1JlcG9ydHM6OnJlZnVuZGVkIjt9czoyNDoiTWFnZW50b19SZXBvcnRzOjpjb3Vwb25zIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI0OiJNYWdlbnRvX1JlcG9ydHM6OmNvdXBvbnMiO31zOjQxOiJNYWdlbnRvX1BheXBhbDo6cGF5cGFsX3NldHRsZW1lbnRfcmVwb3J0cyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czo0MToiTWFnZW50b19QYXlwYWw6OnBheXBhbF9zZXR0bGVtZW50X3JlcG9ydHMiO31zOjM2OiJNYWdlbnRvX0JyYWludHJlZTo6c2V0dGxlbWVudF9yZXBvcnQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzY6Ik1hZ2VudG9fQnJhaW50cmVlOjpzZXR0bGVtZW50X3JlcG9ydCI7fX19czozMjoiTWFnZW50b19SZXBvcnRzOjpzYWxlc3Jvb3Rfc2FsZXMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo2NjY7czo2OiJwYXJlbnQiO3I6NjA0O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIwOiJNYWdlbnRvX1JlcG9ydHM6OnRheCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjY2ODtzOjY6InBhcmVudCI7cjo2MDQ7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjU6Ik1hZ2VudG9fUmVwb3J0czo6aW52b2ljZWQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo2NzA7czo2OiJwYXJlbnQiO3I6NjA0O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI1OiJNYWdlbnRvX1JlcG9ydHM6OnNoaXBwaW5nIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NjcyO3M6NjoicGFyZW50IjtyOjYwNDtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyNToiTWFnZW50b19SZXBvcnRzOjpyZWZ1bmRlZCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjY3NDtzOjY6InBhcmVudCI7cjo2MDQ7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjQ6Ik1hZ2VudG9fUmVwb3J0czo6Y291cG9ucyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjY3NjtzOjY6InBhcmVudCI7cjo2MDQ7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6NDE6Ik1hZ2VudG9fUGF5cGFsOjpwYXlwYWxfc2V0dGxlbWVudF9yZXBvcnRzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6Njc4O3M6NjoicGFyZW50IjtyOjYwNDtzOjg6ImNoaWxkcmVuIjthOjI6e3M6NDY6Ik1hZ2VudG9fUGF5cGFsOjpwYXlwYWxfc2V0dGxlbWVudF9yZXBvcnRzX3ZpZXciO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6NDY6Ik1hZ2VudG9fUGF5cGFsOjpwYXlwYWxfc2V0dGxlbWVudF9yZXBvcnRzX3ZpZXciO31zOjIxOiJNYWdlbnRvX1BheXBhbDo6ZmV0Y2giO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjE6Ik1hZ2VudG9fUGF5cGFsOjpmZXRjaCI7fX19czo0NjoiTWFnZW50b19QYXlwYWw6OnBheXBhbF9zZXR0bGVtZW50X3JlcG9ydHNfdmlldyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjcxMDtzOjY6InBhcmVudCI7cjo2Nzg7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjE6Ik1hZ2VudG9fUGF5cGFsOjpmZXRjaCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjcxMjtzOjY6InBhcmVudCI7cjo2Nzg7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzY6Ik1hZ2VudG9fQnJhaW50cmVlOjpzZXR0bGVtZW50X3JlcG9ydCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjY4MDtzOjY6InBhcmVudCI7cjo2MDQ7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjY6Ik1hZ2VudG9fUmVwb3J0czo6Y3VzdG9tZXJzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NjA2O3M6NjoicGFyZW50IjtyOjE3ODtzOjg6ImNoaWxkcmVuIjthOjM6e3M6MjM6Ik1hZ2VudG9fUmVwb3J0czo6dG90YWxzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIzOiJNYWdlbnRvX1JlcG9ydHM6OnRvdGFscyI7fXM6MzM6Ik1hZ2VudG9fUmVwb3J0czo6Y3VzdG9tZXJzX29yZGVycyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozMzoiTWFnZW50b19SZXBvcnRzOjpjdXN0b21lcnNfb3JkZXJzIjt9czoyNToiTWFnZW50b19SZXBvcnRzOjphY2NvdW50cyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNToiTWFnZW50b19SZXBvcnRzOjphY2NvdW50cyI7fX19czoyMzoiTWFnZW50b19SZXBvcnRzOjp0b3RhbHMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo3MzA7czo2OiJwYXJlbnQiO3I6NjA2O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjMzOiJNYWdlbnRvX1JlcG9ydHM6OmN1c3RvbWVyc19vcmRlcnMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo3MzI7czo2OiJwYXJlbnQiO3I6NjA2O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI1OiJNYWdlbnRvX1JlcG9ydHM6OmFjY291bnRzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NzM0O3M6NjoicGFyZW50IjtyOjYwNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czozMjoiTWFnZW50b19SZXBvcnRzOjpyZXBvcnRfcHJvZHVjdHMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo2MDg7czo2OiJwYXJlbnQiO3I6MTc4O3M6ODoiY2hpbGRyZW4iO2E6NTp7czoyMzoiTWFnZW50b19SZXBvcnRzOjp2aWV3ZWQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjM6Ik1hZ2VudG9fUmVwb3J0czo6dmlld2VkIjt9czoyODoiTWFnZW50b19SZXBvcnRzOjpiZXN0c2VsbGVycyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyODoiTWFnZW50b19SZXBvcnRzOjpiZXN0c2VsbGVycyI7fXM6MjU6Ik1hZ2VudG9fUmVwb3J0czo6bG93c3RvY2siO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjU6Ik1hZ2VudG9fUmVwb3J0czo6bG93c3RvY2siO31zOjIxOiJNYWdlbnRvX1JlcG9ydHM6OnNvbGQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjE6Ik1hZ2VudG9fUmVwb3J0czo6c29sZCI7fXM6MjY6Ik1hZ2VudG9fUmVwb3J0czo6ZG93bmxvYWRzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI2OiJNYWdlbnRvX1JlcG9ydHM6OmRvd25sb2FkcyI7fX19czoyMzoiTWFnZW50b19SZXBvcnRzOjp2aWV3ZWQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo3NTI7czo2OiJwYXJlbnQiO3I6NjA4O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI4OiJNYWdlbnRvX1JlcG9ydHM6OmJlc3RzZWxsZXJzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NzU0O3M6NjoicGFyZW50IjtyOjYwODtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyNToiTWFnZW50b19SZXBvcnRzOjpsb3dzdG9jayI7YTozOntzOjg6Imluc3RhbmNlIjtyOjc1NjtzOjY6InBhcmVudCI7cjo2MDg7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjE6Ik1hZ2VudG9fUmVwb3J0czo6c29sZCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjc1ODtzOjY6InBhcmVudCI7cjo2MDg7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjY6Ik1hZ2VudG9fUmVwb3J0czo6ZG93bmxvYWRzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NzYwO3M6NjoicGFyZW50IjtyOjYwODtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyNzoiTWFnZW50b19SZXBvcnRzOjpzdGF0aXN0aWNzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6NjEwO3M6NjoicGFyZW50IjtyOjE3ODtzOjg6ImNoaWxkcmVuIjthOjE6e3M6MzU6Ik1hZ2VudG9fUmVwb3J0czo6c3RhdGlzdGljc19yZWZyZXNoIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjM1OiJNYWdlbnRvX1JlcG9ydHM6OnN0YXRpc3RpY3NfcmVmcmVzaCI7fX19czozNToiTWFnZW50b19SZXBvcnRzOjpzdGF0aXN0aWNzX3JlZnJlc2giO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo3ODY7czo2OiJwYXJlbnQiO3I6NjEwO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIzOiJNYWdlbnRvX0JhY2tlbmQ6OnN0b3JlcyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjE4MDtzOjY6InBhcmVudCI7cjoxNTg7czo4OiJjaGlsZHJlbiI7YTo1OntzOjMyOiJNYWdlbnRvX0JhY2tlbmQ6OnN0b3Jlc19zZXR0aW5ncyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozMjoiTWFnZW50b19CYWNrZW5kOjpzdG9yZXNfc2V0dGluZ3MiO31zOjIzOiJNYWdlbnRvX1RheDo6bWFuYWdlX3RheCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMzoiTWFnZW50b19UYXg6Om1hbmFnZV90YXgiO31zOjM5OiJNYWdlbnRvX0N1cnJlbmN5U3ltYm9sOjpzeXN0ZW1fY3VycmVuY3kiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6Mzk6Ik1hZ2VudG9fQ3VycmVuY3lTeW1ib2w6OnN5c3RlbV9jdXJyZW5jeSI7fXM6MzQ6Ik1hZ2VudG9fQmFja2VuZDo6c3RvcmVzX2F0dHJpYnV0ZXMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzQ6Ik1hZ2VudG9fQmFja2VuZDo6c3RvcmVzX2F0dHJpYnV0ZXMiO31zOjM4OiJNYWdlbnRvX0JhY2tlbmQ6OnN0b3Jlc19vdGhlcl9zZXR0aW5ncyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozODoiTWFnZW50b19CYWNrZW5kOjpzdG9yZXNfb3RoZXJfc2V0dGluZ3MiO319fXM6MzI6Ik1hZ2VudG9fQmFja2VuZDo6c3RvcmVzX3NldHRpbmdzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6Nzk2O3M6NjoicGFyZW50IjtyOjE4MDtzOjg6ImNoaWxkcmVuIjthOjQ6e3M6MjI6Ik1hZ2VudG9fQmFja2VuZDo6c3RvcmUiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjI6Ik1hZ2VudG9fQmFja2VuZDo6c3RvcmUiO31zOjIyOiJNYWdlbnRvX0NvbmZpZzo6Y29uZmlnIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIyOiJNYWdlbnRvX0NvbmZpZzo6Y29uZmlnIjt9czo0NToiTWFnZW50b19DaGVja291dEFncmVlbWVudHM6OmNoZWNrb3V0YWdyZWVtZW50IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjQ1OiJNYWdlbnRvX0NoZWNrb3V0QWdyZWVtZW50czo6Y2hlY2tvdXRhZ3JlZW1lbnQiO31zOjI5OiJNYWdlbnRvX1NhbGVzOjpvcmRlcl9zdGF0dXNlcyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyOToiTWFnZW50b19TYWxlczo6b3JkZXJfc3RhdHVzZXMiO319fXM6MjI6Ik1hZ2VudG9fQmFja2VuZDo6c3RvcmUiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4MTA7czo2OiJwYXJlbnQiO3I6Nzk2O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIyOiJNYWdlbnRvX0NvbmZpZzo6Y29uZmlnIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6ODEyO3M6NjoicGFyZW50IjtyOjc5NjtzOjg6ImNoaWxkcmVuIjthOjM2OntzOjQyOiJNYWdlbnRvX0NhdGFsb2dJbnZlbnRvcnk6OmNhdGFsb2dpbnZlbnRvcnkiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6NDI6Ik1hZ2VudG9fQ2F0YWxvZ0ludmVudG9yeTo6Y2F0YWxvZ2ludmVudG9yeSI7fXM6MzQ6Ik1hZ2VudG9fRG93bmxvYWRhYmxlOjpkb3dubG9hZGFibGUiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzQ6Ik1hZ2VudG9fRG93bmxvYWRhYmxlOjpkb3dubG9hZGFibGUiO31zOjMxOiJNYWdlbnRvX0NhdGFsb2c6OmNvbmZpZ19jYXRhbG9nIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjMxOiJNYWdlbnRvX0NhdGFsb2c6OmNvbmZpZ19jYXRhbG9nIjt9czoyMzoiTWFnZW50b19DbXM6OmNvbmZpZ19jbXMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjM6Ik1hZ2VudG9fQ21zOjpjb25maWdfY21zIjt9czozMzoiTWFnZW50b19QYXltZW50OjpwYXltZW50X3NlcnZpY2VzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjMzOiJNYWdlbnRvX1BheW1lbnQ6OnBheW1lbnRfc2VydmljZXMiO31zOjMxOiJNYWdlbnRvX0dvb2dsZUFuYWx5dGljczo6Z29vZ2xlIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjMxOiJNYWdlbnRvX0dvb2dsZUFuYWx5dGljczo6Z29vZ2xlIjt9czoyNDoiTWFnZW50b19QYXltZW50OjpwYXltZW50IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI0OiJNYWdlbnRvX1BheW1lbnQ6OnBheW1lbnQiO31zOjMwOiJNYWdlbnRvX05ld3NsZXR0ZXI6Om5ld3NsZXR0ZXIiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzA6Ik1hZ2VudG9fTmV3c2xldHRlcjo6bmV3c2xldHRlciI7fXM6MjQ6Ik1hZ2VudG9fQ29udGFjdDo6Y29udGFjdCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNDoiTWFnZW50b19Db250YWN0Ojpjb250YWN0Ijt9czoyNjoiTWFnZW50b19TaGlwcGluZzo6Y2FycmllcnMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjY6Ik1hZ2VudG9fU2hpcHBpbmc6OmNhcnJpZXJzIjt9czozMzoiTWFnZW50b19TaGlwcGluZzo6c2hpcHBpbmdfcG9saWN5IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjMzOiJNYWdlbnRvX1NoaXBwaW5nOjpzaGlwcGluZ19wb2xpY3kiO31zOjMzOiJNYWdlbnRvX1NoaXBwaW5nOjpjb25maWdfc2hpcHBpbmciO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzM6Ik1hZ2VudG9fU2hpcHBpbmc6OmNvbmZpZ19zaGlwcGluZyI7fXM6NDM6Ik1hZ2VudG9fTXVsdGlzaGlwcGluZzo6Y29uZmlnX211bHRpc2hpcHBpbmciO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6NDM6Ik1hZ2VudG9fTXVsdGlzaGlwcGluZzo6Y29uZmlnX211bHRpc2hpcHBpbmciO31zOjMwOiJNYWdlbnRvX0NvbmZpZzo6Y29uZmlnX2dlbmVyYWwiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzA6Ik1hZ2VudG9fQ29uZmlnOjpjb25maWdfZ2VuZXJhbCI7fXM6MTk6Ik1hZ2VudG9fQ29uZmlnOjp3ZWIiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MTk6Ik1hZ2VudG9fQ29uZmlnOjp3ZWIiO31zOjI5OiJNYWdlbnRvX0NvbmZpZzo6Y29uZmlnX2Rlc2lnbiI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyOToiTWFnZW50b19Db25maWc6OmNvbmZpZ19kZXNpZ24iO31zOjIyOiJNYWdlbnRvX1BheXBhbDo6cGF5cGFsIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIyOiJNYWdlbnRvX1BheXBhbDo6cGF5cGFsIjt9czozMzoiTWFnZW50b19DdXN0b21lcjo6Y29uZmlnX2N1c3RvbWVyIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjMzOiJNYWdlbnRvX0N1c3RvbWVyOjpjb25maWdfY3VzdG9tZXIiO31zOjIzOiJNYWdlbnRvX1RheDo6Y29uZmlnX3RheCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMzoiTWFnZW50b19UYXg6OmNvbmZpZ190YXgiO31zOjMwOiJNYWdlbnRvX1BlcnNpc3RlbnQ6OnBlcnNpc3RlbnQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzA6Ik1hZ2VudG9fUGVyc2lzdGVudDo6cGVyc2lzdGVudCI7fXM6Mjc6Ik1hZ2VudG9fU2FsZXM6OmNvbmZpZ19zYWxlcyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNzoiTWFnZW50b19TYWxlczo6Y29uZmlnX3NhbGVzIjt9czoyNjoiTWFnZW50b19TYWxlczo6c2FsZXNfZW1haWwiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjY6Ik1hZ2VudG9fU2FsZXM6OnNhbGVzX2VtYWlsIjt9czoyNDoiTWFnZW50b19TYWxlczo6c2FsZXNfcGRmIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI0OiJNYWdlbnRvX1NhbGVzOjpzYWxlc19wZGYiO31zOjI0OiJNYWdlbnRvX1JlcG9ydHM6OnJlcG9ydHMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjQ6Ik1hZ2VudG9fUmVwb3J0czo6cmVwb3J0cyI7fXM6MzE6Ik1hZ2VudG9fU2l0ZW1hcDo6Y29uZmlnX3NpdGVtYXAiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzE6Ik1hZ2VudG9fU2l0ZW1hcDo6Y29uZmlnX3NpdGVtYXAiO31zOjI5OiJNYWdlbnRvX0NvbmZpZzo6Y29uZmlnX3N5c3RlbSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyOToiTWFnZW50b19Db25maWc6OmNvbmZpZ19zeXN0ZW0iO31zOjMzOiJNYWdlbnRvX1dpc2hsaXN0Ojpjb25maWdfd2lzaGxpc3QiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzM6Ik1hZ2VudG9fV2lzaGxpc3Q6OmNvbmZpZ193aXNobGlzdCI7fXM6MzE6Ik1hZ2VudG9fU2FsZXNSdWxlOjpjb25maWdfcHJvbW8iO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzE6Ik1hZ2VudG9fU2FsZXNSdWxlOjpjb25maWdfcHJvbW8iO31zOjI0OiJNYWdlbnRvX0NvbmZpZzo6YWR2YW5jZWQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjQ6Ik1hZ2VudG9fQ29uZmlnOjphZHZhbmNlZCI7fXM6Mjc6Ik1hZ2VudG9fQ29uZmlnOjp0cmFuc19lbWFpbCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNzoiTWFnZW50b19Db25maWc6OnRyYW5zX2VtYWlsIjt9czoyODoiTWFnZW50b19Db25maWc6OmNvbmZpZ19hZG1pbiI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyODoiTWFnZW50b19Db25maWc6OmNvbmZpZ19hZG1pbiI7fXM6MTk6Ik1hZ2VudG9fQ29uZmlnOjpkZXYiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MTk6Ik1hZ2VudG9fQ29uZmlnOjpkZXYiO31zOjI0OiJNYWdlbnRvX0NvbmZpZzo6Y3VycmVuY3kiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjQ6Ik1hZ2VudG9fQ29uZmlnOjpjdXJyZW5jeSI7fXM6MTY6Ik1hZ2VudG9fUnNzOjpyc3MiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MTY6Ik1hZ2VudG9fUnNzOjpyc3MiO31zOjI2OiJNYWdlbnRvX0NvbmZpZzo6c2VuZGZyaWVuZCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNjoiTWFnZW50b19Db25maWc6OnNlbmRmcmllbmQiO31zOjUxOiJNYWdlbnRvX05ld1JlbGljUmVwb3J0aW5nOjpjb25maWdfbmV3cmVsaWNyZXBvcnRpbmciO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6NTE6Ik1hZ2VudG9fTmV3UmVsaWNSZXBvcnRpbmc6OmNvbmZpZ19uZXdyZWxpY3JlcG9ydGluZyI7fX19czo0MjoiTWFnZW50b19DYXRhbG9nSW52ZW50b3J5OjpjYXRhbG9naW52ZW50b3J5IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6ODI2O3M6NjoicGFyZW50IjtyOjgxMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czozNDoiTWFnZW50b19Eb3dubG9hZGFibGU6OmRvd25sb2FkYWJsZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjgyODtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzE6Ik1hZ2VudG9fQ2F0YWxvZzo6Y29uZmlnX2NhdGFsb2ciO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4MzA7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIzOiJNYWdlbnRvX0Ntczo6Y29uZmlnX2NtcyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjgzMjtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzM6Ik1hZ2VudG9fUGF5bWVudDo6cGF5bWVudF9zZXJ2aWNlcyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjgzNDtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzE6Ik1hZ2VudG9fR29vZ2xlQW5hbHl0aWNzOjpnb29nbGUiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4MzY7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI0OiJNYWdlbnRvX1BheW1lbnQ6OnBheW1lbnQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4Mzg7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjMwOiJNYWdlbnRvX05ld3NsZXR0ZXI6Om5ld3NsZXR0ZXIiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4NDA7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI0OiJNYWdlbnRvX0NvbnRhY3Q6OmNvbnRhY3QiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4NDI7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI2OiJNYWdlbnRvX1NoaXBwaW5nOjpjYXJyaWVycyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg0NDtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzM6Ik1hZ2VudG9fU2hpcHBpbmc6OnNoaXBwaW5nX3BvbGljeSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg0NjtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzM6Ik1hZ2VudG9fU2hpcHBpbmc6OmNvbmZpZ19zaGlwcGluZyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg0ODtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6NDM6Ik1hZ2VudG9fTXVsdGlzaGlwcGluZzo6Y29uZmlnX211bHRpc2hpcHBpbmciO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4NTA7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjMwOiJNYWdlbnRvX0NvbmZpZzo6Y29uZmlnX2dlbmVyYWwiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4NTI7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjE5OiJNYWdlbnRvX0NvbmZpZzo6d2ViIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6ODU0O3M6NjoicGFyZW50IjtyOjgxMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyOToiTWFnZW50b19Db25maWc6OmNvbmZpZ19kZXNpZ24iO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4NTY7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIyOiJNYWdlbnRvX1BheXBhbDo6cGF5cGFsIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6ODU4O3M6NjoicGFyZW50IjtyOjgxMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czozMzoiTWFnZW50b19DdXN0b21lcjo6Y29uZmlnX2N1c3RvbWVyIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6ODYwO3M6NjoicGFyZW50IjtyOjgxMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyMzoiTWFnZW50b19UYXg6OmNvbmZpZ190YXgiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4NjI7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjMwOiJNYWdlbnRvX1BlcnNpc3RlbnQ6OnBlcnNpc3RlbnQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4NjQ7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI3OiJNYWdlbnRvX1NhbGVzOjpjb25maWdfc2FsZXMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4NjY7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI2OiJNYWdlbnRvX1NhbGVzOjpzYWxlc19lbWFpbCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg2ODtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjQ6Ik1hZ2VudG9fU2FsZXM6OnNhbGVzX3BkZiI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg3MDtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjQ6Ik1hZ2VudG9fUmVwb3J0czo6cmVwb3J0cyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg3MjtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzE6Ik1hZ2VudG9fU2l0ZW1hcDo6Y29uZmlnX3NpdGVtYXAiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4NzQ7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI5OiJNYWdlbnRvX0NvbmZpZzo6Y29uZmlnX3N5c3RlbSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg3NjtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzM6Ik1hZ2VudG9fV2lzaGxpc3Q6OmNvbmZpZ193aXNobGlzdCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg3ODtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzE6Ik1hZ2VudG9fU2FsZXNSdWxlOjpjb25maWdfcHJvbW8iO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4ODA7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI0OiJNYWdlbnRvX0NvbmZpZzo6YWR2YW5jZWQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4ODI7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI3OiJNYWdlbnRvX0NvbmZpZzo6dHJhbnNfZW1haWwiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4ODQ7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI4OiJNYWdlbnRvX0NvbmZpZzo6Y29uZmlnX2FkbWluIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6ODg2O3M6NjoicGFyZW50IjtyOjgxMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoxOToiTWFnZW50b19Db25maWc6OmRldiI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg4ODtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjQ6Ik1hZ2VudG9fQ29uZmlnOjpjdXJyZW5jeSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg5MDtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MTY6Ik1hZ2VudG9fUnNzOjpyc3MiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4OTI7czo2OiJwYXJlbnQiO3I6ODEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI2OiJNYWdlbnRvX0NvbmZpZzo6c2VuZGZyaWVuZCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg5NDtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6NTE6Ik1hZ2VudG9fTmV3UmVsaWNSZXBvcnRpbmc6OmNvbmZpZ19uZXdyZWxpY3JlcG9ydGluZyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjg5NjtzOjY6InBhcmVudCI7cjo4MTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6NDU6Ik1hZ2VudG9fQ2hlY2tvdXRBZ3JlZW1lbnRzOjpjaGVja291dGFncmVlbWVudCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjgxNDtzOjY6InBhcmVudCI7cjo3OTY7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6Mjk6Ik1hZ2VudG9fU2FsZXM6Om9yZGVyX3N0YXR1c2VzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6ODE2O3M6NjoicGFyZW50IjtyOjc5NjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyMzoiTWFnZW50b19UYXg6Om1hbmFnZV90YXgiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo3OTg7czo2OiJwYXJlbnQiO3I6MTgwO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjM5OiJNYWdlbnRvX0N1cnJlbmN5U3ltYm9sOjpzeXN0ZW1fY3VycmVuY3kiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4MDA7czo2OiJwYXJlbnQiO3I6MTgwO3M6ODoiY2hpbGRyZW4iO2E6Mjp7czozODoiTWFnZW50b19DdXJyZW5jeVN5bWJvbDo6Y3VycmVuY3lfcmF0ZXMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6Mzg6Ik1hZ2VudG9fQ3VycmVuY3lTeW1ib2w6OmN1cnJlbmN5X3JhdGVzIjt9czozMToiTWFnZW50b19DdXJyZW5jeVN5bWJvbDo6c3ltYm9scyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozMToiTWFnZW50b19DdXJyZW5jeVN5bWJvbDo6c3ltYm9scyI7fX19czozODoiTWFnZW50b19DdXJyZW5jeVN5bWJvbDo6Y3VycmVuY3lfcmF0ZXMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMDU4O3M6NjoicGFyZW50IjtyOjgwMDtzOjg6ImNoaWxkcmVuIjthOjA6e319czozMToiTWFnZW50b19DdXJyZW5jeVN5bWJvbDo6c3ltYm9scyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjEwNjA7czo2OiJwYXJlbnQiO3I6ODAwO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjM0OiJNYWdlbnRvX0JhY2tlbmQ6OnN0b3Jlc19hdHRyaWJ1dGVzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6ODAyO3M6NjoicGFyZW50IjtyOjE4MDtzOjg6ImNoaWxkcmVuIjthOjQ6e3M6Mzg6Ik1hZ2VudG9fQ2F0YWxvZzo6YXR0cmlidXRlc19hdHRyaWJ1dGVzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjM4OiJNYWdlbnRvX0NhdGFsb2c6OmF0dHJpYnV0ZXNfYXR0cmlidXRlcyI7fXM6MzQ6Ik1hZ2VudG9fQ2F0YWxvZzo6dXBkYXRlX2F0dHJpYnV0ZXMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzQ6Ik1hZ2VudG9fQ2F0YWxvZzo6dXBkYXRlX2F0dHJpYnV0ZXMiO31zOjIxOiJNYWdlbnRvX0NhdGFsb2c6OnNldHMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjE6Ik1hZ2VudG9fQ2F0YWxvZzo6c2V0cyI7fXM6MjM6Ik1hZ2VudG9fUmV2aWV3OjpyYXRpbmdzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIzOiJNYWdlbnRvX1Jldmlldzo6cmF0aW5ncyI7fX19czozODoiTWFnZW50b19DYXRhbG9nOjphdHRyaWJ1dGVzX2F0dHJpYnV0ZXMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMDc0O3M6NjoicGFyZW50IjtyOjgwMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czozNDoiTWFnZW50b19DYXRhbG9nOjp1cGRhdGVfYXR0cmlidXRlcyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjEwNzY7czo2OiJwYXJlbnQiO3I6ODAyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIxOiJNYWdlbnRvX0NhdGFsb2c6OnNldHMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMDc4O3M6NjoicGFyZW50IjtyOjgwMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyMzoiTWFnZW50b19SZXZpZXc6OnJhdGluZ3MiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMDgwO3M6NjoicGFyZW50IjtyOjgwMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czozODoiTWFnZW50b19CYWNrZW5kOjpzdG9yZXNfb3RoZXJfc2V0dGluZ3MiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjo4MDQ7czo2OiJwYXJlbnQiO3I6MTgwO3M6ODoiY2hpbGRyZW4iO2E6MTp7czoyMzoiTWFnZW50b19DdXN0b21lcjo6Z3JvdXAiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjM6Ik1hZ2VudG9fQ3VzdG9tZXI6Omdyb3VwIjt9fX1zOjIzOiJNYWdlbnRvX0N1c3RvbWVyOjpncm91cCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjExMDI7czo2OiJwYXJlbnQiO3I6ODA0O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIzOiJNYWdlbnRvX0JhY2tlbmQ6OnN5c3RlbSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjE4MjtzOjY6InBhcmVudCI7cjoxNTg7czo4OiJjaGlsZHJlbiI7YTo1OntzOjI0OiJNYWdlbnRvX0JhY2tlbmQ6OmNvbnZlcnQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjQ6Ik1hZ2VudG9fQmFja2VuZDo6Y29udmVydCI7fXM6Mjc6Ik1hZ2VudG9fQmFja2VuZDo6ZXh0ZW5zaW9ucyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNzoiTWFnZW50b19CYWNrZW5kOjpleHRlbnNpb25zIjt9czoyMjoiTWFnZW50b19CYWNrZW5kOjp0b29scyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMjoiTWFnZW50b19CYWNrZW5kOjp0b29scyI7fXM6MTc6Ik1hZ2VudG9fVXNlcjo6YWNsIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjE3OiJNYWdlbnRvX1VzZXI6OmFjbCI7fXM6Mzg6Ik1hZ2VudG9fQmFja2VuZDo6c3lzdGVtX290aGVyX3NldHRpbmdzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjM4OiJNYWdlbnRvX0JhY2tlbmQ6OnN5c3RlbV9vdGhlcl9zZXR0aW5ncyI7fX19czoyNDoiTWFnZW50b19CYWNrZW5kOjpjb252ZXJ0IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTExMjtzOjY6InBhcmVudCI7cjoxODI7czo4OiJjaGlsZHJlbiI7YTo0OntzOjI4OiJNYWdlbnRvX0ltcG9ydEV4cG9ydDo6aW1wb3J0IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI4OiJNYWdlbnRvX0ltcG9ydEV4cG9ydDo6aW1wb3J0Ijt9czoyODoiTWFnZW50b19JbXBvcnRFeHBvcnQ6OmV4cG9ydCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyODoiTWFnZW50b19JbXBvcnRFeHBvcnQ6OmV4cG9ydCI7fXM6Mzg6Ik1hZ2VudG9fVGF4SW1wb3J0RXhwb3J0OjppbXBvcnRfZXhwb3J0IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjM4OiJNYWdlbnRvX1RheEltcG9ydEV4cG9ydDo6aW1wb3J0X2V4cG9ydCI7fXM6Mjk6Ik1hZ2VudG9fSW1wb3J0RXhwb3J0OjpoaXN0b3J5IjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjI5OiJNYWdlbnRvX0ltcG9ydEV4cG9ydDo6aGlzdG9yeSI7fX19czoyODoiTWFnZW50b19JbXBvcnRFeHBvcnQ6OmltcG9ydCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjExMjY7czo2OiJwYXJlbnQiO3I6MTExMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyODoiTWFnZW50b19JbXBvcnRFeHBvcnQ6OmV4cG9ydCI7YTozOntzOjg6Imluc3RhbmNlIjtyOjExMjg7czo2OiJwYXJlbnQiO3I6MTExMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czozODoiTWFnZW50b19UYXhJbXBvcnRFeHBvcnQ6OmltcG9ydF9leHBvcnQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMTMwO3M6NjoicGFyZW50IjtyOjExMTI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6Mjk6Ik1hZ2VudG9fSW1wb3J0RXhwb3J0OjpoaXN0b3J5IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTEzMjtzOjY6InBhcmVudCI7cjoxMTEyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI3OiJNYWdlbnRvX0JhY2tlbmQ6OmV4dGVuc2lvbnMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMTE0O3M6NjoicGFyZW50IjtyOjE4MjtzOjg6ImNoaWxkcmVuIjthOjI6e3M6MjI6Ik1hZ2VudG9fQmFja2VuZDo6bG9jYWwiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjI6Ik1hZ2VudG9fQmFja2VuZDo6bG9jYWwiO31zOjIzOiJNYWdlbnRvX0JhY2tlbmQ6OmN1c3RvbSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMzoiTWFnZW50b19CYWNrZW5kOjpjdXN0b20iO319fXM6MjI6Ik1hZ2VudG9fQmFja2VuZDo6bG9jYWwiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMTU0O3M6NjoicGFyZW50IjtyOjExMTQ7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjM6Ik1hZ2VudG9fQmFja2VuZDo6Y3VzdG9tIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTE1NjtzOjY6InBhcmVudCI7cjoxMTE0O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIyOiJNYWdlbnRvX0JhY2tlbmQ6OnRvb2xzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTExNjtzOjY6InBhcmVudCI7cjoxODI7czo4OiJjaGlsZHJlbiI7YTo1OntzOjIyOiJNYWdlbnRvX0JhY2tlbmQ6OmNhY2hlIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjIyOiJNYWdlbnRvX0JhY2tlbmQ6OmNhY2hlIjt9czoyOToiTWFnZW50b19CYWNrZW5kOjpzZXR1cF93aXphcmQiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6Mjk6Ik1hZ2VudG9fQmFja2VuZDo6c2V0dXBfd2l6YXJkIjt9czoyMjoiTWFnZW50b19CYWNrdXA6OmJhY2t1cCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMjoiTWFnZW50b19CYWNrdXA6OmJhY2t1cCI7fXM6MjI6Ik1hZ2VudG9fSW5kZXhlcjo6aW5kZXgiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjI6Ik1hZ2VudG9fSW5kZXhlcjo6aW5kZXgiO31zOjI3OiJNYWdlbnRvX0luZGV4ZXI6OmNoYW5nZU1vZGUiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6Mjc6Ik1hZ2VudG9fSW5kZXhlcjo6Y2hhbmdlTW9kZSI7fX19czoyMjoiTWFnZW50b19CYWNrZW5kOjpjYWNoZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjExNzA7czo2OiJwYXJlbnQiO3I6MTExNjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyOToiTWFnZW50b19CYWNrZW5kOjpzZXR1cF93aXphcmQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMTcyO3M6NjoicGFyZW50IjtyOjExMTY7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MjI6Ik1hZ2VudG9fQmFja3VwOjpiYWNrdXAiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMTc0O3M6NjoicGFyZW50IjtyOjExMTY7czo4OiJjaGlsZHJlbiI7YToxOntzOjI0OiJNYWdlbnRvX0JhY2t1cDo6cm9sbGJhY2siO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjQ6Ik1hZ2VudG9fQmFja3VwOjpyb2xsYmFjayI7fX19czoyNDoiTWFnZW50b19CYWNrdXA6OnJvbGxiYWNrIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTE5MjtzOjY6InBhcmVudCI7cjoxMTc0O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjIyOiJNYWdlbnRvX0luZGV4ZXI6OmluZGV4IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTE3NjtzOjY6InBhcmVudCI7cjoxMTE2O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjI3OiJNYWdlbnRvX0luZGV4ZXI6OmNoYW5nZU1vZGUiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMTc4O3M6NjoicGFyZW50IjtyOjExMTY7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MTc6Ik1hZ2VudG9fVXNlcjo6YWNsIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTExODtzOjY6InBhcmVudCI7cjoxODI7czo4OiJjaGlsZHJlbiI7YTozOntzOjIzOiJNYWdlbnRvX1VzZXI6OmFjbF91c2VycyI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyMzoiTWFnZW50b19Vc2VyOjphY2xfdXNlcnMiO31zOjE5OiJNYWdlbnRvX1VzZXI6OmxvY2tzIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjE5OiJNYWdlbnRvX1VzZXI6OmxvY2tzIjt9czoyMzoiTWFnZW50b19Vc2VyOjphY2xfcm9sZXMiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MjM6Ik1hZ2VudG9fVXNlcjo6YWNsX3JvbGVzIjt9fX1zOjIzOiJNYWdlbnRvX1VzZXI6OmFjbF91c2VycyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjEyMTA7czo2OiJwYXJlbnQiO3I6MTExODtzOjg6ImNoaWxkcmVuIjthOjA6e319czoxOToiTWFnZW50b19Vc2VyOjpsb2NrcyI7YTozOntzOjg6Imluc3RhbmNlIjtyOjEyMTI7czo2OiJwYXJlbnQiO3I6MTExODtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyMzoiTWFnZW50b19Vc2VyOjphY2xfcm9sZXMiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMjE0O3M6NjoicGFyZW50IjtyOjExMTg7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6Mzg6Ik1hZ2VudG9fQmFja2VuZDo6c3lzdGVtX290aGVyX3NldHRpbmdzIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTEyMDtzOjY6InBhcmVudCI7cjoxODI7czo4OiJjaGlsZHJlbiI7YTozOntzOjQ0OiJNYWdlbnRvX0FkbWluTm90aWZpY2F0aW9uOjphZG1pbm5vdGlmaWNhdGlvbiI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czo0NDoiTWFnZW50b19BZG1pbk5vdGlmaWNhdGlvbjo6YWRtaW5ub3RpZmljYXRpb24iO31zOjI2OiJNYWdlbnRvX1ZhcmlhYmxlOjp2YXJpYWJsZSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czoyNjoiTWFnZW50b19WYXJpYWJsZTo6dmFyaWFibGUiO31zOjMyOiJNYWdlbnRvX0VuY3J5cHRpb25LZXk6OmNyeXB0X2tleSI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozMjoiTWFnZW50b19FbmNyeXB0aW9uS2V5OjpjcnlwdF9rZXkiO319fXM6NDQ6Ik1hZ2VudG9fQWRtaW5Ob3RpZmljYXRpb246OmFkbWlubm90aWZpY2F0aW9uIjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTIzMjtzOjY6InBhcmVudCI7cjoxMTIwO3M6ODoiY2hpbGRyZW4iO2E6NDp7czozOToiTWFnZW50b19BZG1pbk5vdGlmaWNhdGlvbjo6c2hvd190b29sYmFyIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjM5OiJNYWdlbnRvX0FkbWluTm90aWZpY2F0aW9uOjpzaG93X3Rvb2xiYXIiO31zOjM2OiJNYWdlbnRvX0FkbWluTm90aWZpY2F0aW9uOjpzaG93X2xpc3QiO086MzM6Ik1hZ2VudG9cRnJhbWV3b3JrXEFjbFxBY2xSZXNvdXJjZSI6MTp7czoxNDoiACoAX3Jlc291cmNlSWQiO3M6MzY6Ik1hZ2VudG9fQWRtaW5Ob3RpZmljYXRpb246OnNob3dfbGlzdCI7fXM6Mzk6Ik1hZ2VudG9fQWRtaW5Ob3RpZmljYXRpb246Om1hcmtfYXNfcmVhZCI7TzozMzoiTWFnZW50b1xGcmFtZXdvcmtcQWNsXEFjbFJlc291cmNlIjoxOntzOjE0OiIAKgBfcmVzb3VyY2VJZCI7czozOToiTWFnZW50b19BZG1pbk5vdGlmaWNhdGlvbjo6bWFya19hc19yZWFkIjt9czo1MToiTWFnZW50b19BZG1pbk5vdGlmaWNhdGlvbjo6YWRtaW5ub3RpZmljYXRpb25fcmVtb3ZlIjtPOjMzOiJNYWdlbnRvXEZyYW1ld29ya1xBY2xcQWNsUmVzb3VyY2UiOjE6e3M6MTQ6IgAqAF9yZXNvdXJjZUlkIjtzOjUxOiJNYWdlbnRvX0FkbWluTm90aWZpY2F0aW9uOjphZG1pbm5vdGlmaWNhdGlvbl9yZW1vdmUiO319fXM6Mzk6Ik1hZ2VudG9fQWRtaW5Ob3RpZmljYXRpb246OnNob3dfdG9vbGJhciI7YTozOntzOjg6Imluc3RhbmNlIjtyOjEyNDI7czo2OiJwYXJlbnQiO3I6MTIzMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czozNjoiTWFnZW50b19BZG1pbk5vdGlmaWNhdGlvbjo6c2hvd19saXN0IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTI0NDtzOjY6InBhcmVudCI7cjoxMjMyO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjM5OiJNYWdlbnRvX0FkbWluTm90aWZpY2F0aW9uOjptYXJrX2FzX3JlYWQiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMjQ2O3M6NjoicGFyZW50IjtyOjEyMzI7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6NTE6Ik1hZ2VudG9fQWRtaW5Ob3RpZmljYXRpb246OmFkbWlubm90aWZpY2F0aW9uX3JlbW92ZSI7YTozOntzOjg6Imluc3RhbmNlIjtyOjEyNDg7czo2OiJwYXJlbnQiO3I6MTIzMjtzOjg6ImNoaWxkcmVuIjthOjA6e319czoyNjoiTWFnZW50b19WYXJpYWJsZTo6dmFyaWFibGUiO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxMjM0O3M6NjoicGFyZW50IjtyOjExMjA7czo4OiJjaGlsZHJlbiI7YTowOnt9fXM6MzI6Ik1hZ2VudG9fRW5jcnlwdGlvbktleTo6Y3J5cHRfa2V5IjthOjM6e3M6ODoiaW5zdGFuY2UiO3I6MTIzNjtzOjY6InBhcmVudCI7cjoxMTIwO3M6ODoiY2hpbGRyZW4iO2E6MDp7fX1zOjMwOiJNYWdlbnRvX0JhY2tlbmQ6Omdsb2JhbF9zZWFyY2giO2E6Mzp7czo4OiJpbnN0YW5jZSI7cjoxODQ7czo2OiJwYXJlbnQiO3I6MTU4O3M6ODoiY2hpbGRyZW4iO2E6MDp7fX19czoxNzoiACoAX2lzQWxsb3dlZFJvbGUiO3I6MTMzO3M6MjE6IgAqAF9pc0FsbG93ZWRSZXNvdXJjZSI7cjoxMTcyO3M6MjI6IgAqAF9pc0FsbG93ZWRQcml2aWxlZ2UiO047czo5OiIAKgBfcnVsZXMiO2E6Mjp7czoxMjoiYWxsUmVzb3VyY2VzIjthOjI6e3M6ODoiYWxsUm9sZXMiO2E6Mjp7czoxMzoiYWxsUHJpdmlsZWdlcyI7YToyOntzOjQ6InR5cGUiO3M6OToiVFlQRV9ERU5ZIjtzOjY6ImFzc2VydCI7Tjt9czoxMzoiYnlQcml2aWxlZ2VJZCI7YTowOnt9fXM6ODoiYnlSb2xlSWQiO2E6MTp7aToxO2E6Mjp7czoxMzoiYnlQcml2aWxlZ2VJZCI7YTowOnt9czoxMzoiYWxsUHJpdmlsZWdlcyI7YToyOntzOjQ6InR5cGUiO3M6MTA6IlRZUEVfQUxMT1ciO3M6NjoiYXNzZXJ0IjtOO319fX1zOjEyOiJieVJlc291cmNlSWQiO2E6MTp7czoyMDoiTWFnZW50b19CYWNrZW5kOjphbGwiO2E6MTp7czo4OiJieVJvbGVJZCI7YToxOntpOjE7YToyOntzOjEzOiJieVByaXZpbGVnZUlkIjthOjA6e31zOjEzOiJhbGxQcml2aWxlZ2VzIjthOjI6e3M6NDoidHlwZSI7czoxMDoiVFlQRV9BTExPVyI7czo2OiJhc3NlcnQiO047fX19fX19fXM6MTA6InVwZGF0ZWRfYXQiO2k6MTQ4NDU4NDY0MDt9ZGVmYXVsdHxhOjA6e31jdXN0b21lcl9iYXNlfGE6MDp7fQ=='),('hf2d3k1iek6nl00p2kg3t7ck53','1484545801','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('hhmrrpqllmq6msdg4bkpdqi7s5','1484571002','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('ibc4fc4hl44bdfk22ib7o9lh57','1484557248','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMzQ6Ik1vemlsbGEvNS4wIChpUGhvbmU7IENQVSBpUGhvbmUgT1MgMTBfMiBsaWtlIE1hYyBPUyBYKSBBcHBsZVdlYktpdC82MDIuMy4xMiAoS0hUTUwsIGxpa2UgR2Vja28pIFZlcnNpb24vMTAuMCBNb2JpbGUvMTRDOTIgU2FmYXJpLzYwMi4xIjt9X3Nlc3Npb25faG9zdHN8YToxOntzOjM3OiJ3ZXJiZWFydGlrZWwtd2VyYmVnZXNjaGVua2Utb25saW5lLmRlIjtiOjE7fWRlZmF1bHR8YToyOntzOjk6Il9mb3JtX2tleSI7czoxNjoiVmNOZGZpclhZeVZLRkNUUCI7czoxMjoidmlzaXRvcl9kYXRhIjthOjM6e3M6MTM6Imxhc3RfdmlzaXRfYXQiO3M6MTk6IjIwMTctMDEtMTYgMDk6MDA6NDgiO3M6MTA6InNlc3Npb25faWQiO3M6MjY6ImliYzRmYzRobDQ0YmRmazIyaWI3bzlsaDU3IjtzOjEwOiJ2aXNpdG9yX2lkIjtzOjI6IjE0Ijt9fWN1c3RvbWVyX2Jhc2V8YTowOnt9Y2hlY2tvdXR8YTowOnt9bWVzc2FnZXxhOjA6e31jYXRhbG9nfGE6MDp7fQ=='),('il9ap5bh4e0f7gh09c2n9p7ua6','1484583489','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9ZGVmYXVsdHxhOjI6e3M6OToiX2Zvcm1fa2V5IjtzOjE2OiJzYkNWQXdmbHdCc3NrcVFLIjtzOjEyOiJ2aXNpdG9yX2RhdGEiO2E6Mzp7czoxMzoibGFzdF92aXNpdF9hdCI7czoxOToiMjAxNy0wMS0xNiAxNjoxODowOSI7czoxMDoic2Vzc2lvbl9pZCI7czoyNjoiaWw5YXA1Ymg0ZTBmN2doMDljMm45cDd1YTYiO3M6MTA6InZpc2l0b3JfaWQiO3M6MjoiMTkiO319Y3VzdG9tZXJfYmFzZXxhOjA6e31jaGVja291dHxhOjA6e31tZXNzYWdlfGE6MDp7fWNhdGFsb2d8YTowOnt9'),('iqu8qrd9r57lu905hl1c7ane26','1484495401','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('j1dobdhe16voogi3fg6g01u630','1484576448','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9ZGVmYXVsdHxhOjE6e3M6MTI6InZpc2l0b3JfZGF0YSI7YTozOntzOjEzOiJsYXN0X3Zpc2l0X2F0IjtzOjE5OiIyMDE3LTAxLTE2IDE0OjIwOjQ4IjtzOjEwOiJzZXNzaW9uX2lkIjtzOjI2OiJqMWRvYmRoZTE2dm9vZ2kzZmc2ZzAxdTYzMCI7czoxMDoidmlzaXRvcl9pZCI7czoyOiIxNSI7fX1jdXN0b21lcl9iYXNlfGE6MDp7fWNoZWNrb3V0fGE6MDp7fW1lc3NhZ2V8YTowOnt9Y2F0YWxvZ3xhOjA6e30='),('k8a52vuh69j78djla5m9if8e53','1484522762','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('kgb4g32ufauahj8c5qqubdms20','1484511521','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMzoiODguNjkuMTI5LjIyOSI7czo4OiJodHRwX3ZpYSI7czowOiIiO3M6MjA6Imh0dHBfeF9mb3J3YXJkZWRfZm9yIjtzOjA6IiI7czoxNToiaHR0cF91c2VyX2FnZW50IjtzOjEwOToiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS81NS4wLjI4ODMuODcgU2FmYXJpLzUzNy4zNiI7fV9zZXNzaW9uX2hvc3RzfGE6MTp7czozNzoid2VyYmVhcnRpa2VsLXdlcmJlZ2VzY2hlbmtlLW9ubGluZS5kZSI7YjoxO31kZWZhdWx0fGE6Mjp7czo5OiJfZm9ybV9rZXkiO3M6MTY6IlZRZnk5ZGR0VUMzdHRxaHMiO3M6MTI6InZpc2l0b3JfZGF0YSI7YTozOntzOjEzOiJsYXN0X3Zpc2l0X2F0IjtzOjE5OiIyMDE3LTAxLTE1IDIwOjE4OjQxIjtzOjEwOiJzZXNzaW9uX2lkIjtzOjI2OiJrZ2I0ZzMydWZhdWFoajhjNXFxdWJkbXMyMCI7czoxMDoidmlzaXRvcl9pZCI7czoxOiI5Ijt9fWN1c3RvbWVyX2Jhc2V8YTowOnt9Y2hlY2tvdXR8YTowOnt9bWVzc2FnZXxhOjA6e31jYXRhbG9nfGE6MDp7fQ=='),('l1ki1ui6j3it70tnkiaessgqp3','1484522739','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMzoiODguNjkuMTI5LjIyOSI7czo4OiJodHRwX3ZpYSI7czowOiIiO3M6MjA6Imh0dHBfeF9mb3J3YXJkZWRfZm9yIjtzOjA6IiI7czoxNToiaHR0cF91c2VyX2FnZW50IjtzOjEwOToiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS81NS4wLjI4ODMuODcgU2FmYXJpLzUzNy4zNiI7fV9zZXNzaW9uX2hvc3RzfGE6MTp7czozNzoid2VyYmVhcnRpa2VsLXdlcmJlZ2VzY2hlbmtlLW9ubGluZS5kZSI7YjoxO31hZG1pbmh0bWx8YTozOntzOjY6ImxvY2FsZSI7czo1OiJlbl9VUyI7czo5OiJfZm9ybV9rZXkiO3M6MTY6IjF0UExYTjRUV1dYeGlJRUgiO3M6MTM6ImlzX3VybF9ub3RpY2UiO2I6MDt9YWRtaW58YToxOntzOjQ6InVzZXIiO086MjM6Ik1hZ2VudG9cVXNlclxNb2RlbFxVc2VyIjoxNjp7czoxNToiACoAX2V2ZW50UHJlZml4IjtzOjEwOiJhZG1pbl91c2VyIjtzOjg6IgAqAF9yb2xlIjtOO3M6MTY6IgAqAF9oYXNSZXNvdXJjZXMiO2I6MTtzOjE4OiIAKgB2YWxpZGF0aW9uUnVsZXMiO086Mzg6Ik1hZ2VudG9cVXNlclxNb2RlbFxVc2VyVmFsaWRhdGlvblJ1bGVzIjowOnt9czoxNToiACoAX2V2ZW50T2JqZWN0IjtzOjY6Im9iamVjdCI7czoxNToiACoAX2lkRmllbGROYW1lIjtzOjc6InVzZXJfaWQiO3M6MTg6IgAqAF9oYXNEYXRhQ2hhbmdlcyI7YjoxO3M6MTI6IgAqAF9vcmlnRGF0YSI7YToxOTp7czo3OiJ1c2VyX2lkIjtzOjE6IjIiO3M6OToiZmlyc3RuYW1lIjtzOjU6ImFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjU6ImFkbWluIjtzOjU6ImVtYWlsIjtzOjQ2OiJhZG1pbjIzNEB3ZXJiZWFydGlrZWwtd2VyYmVnZXNjaGVua2Utb25saW5lLmRlIjtzOjg6InVzZXJuYW1lIjtzOjg6ImFkbWluMTIzIjtzOjg6InBhc3N3b3JkIjtzOjk5OiIxODlhZjQ3NTlkOWJjYTIwZjUxZmRlZmZkZDZhNTljM2Q3YzNmNTE4ZGFjNGQ0N2IyMGU4NzYzMjM5MDIwOTZkOmJaTXlLR0hucm1GcHZpQzBzelVMcEl0YjFzNDFyZ01yOjEiO3M6NzoiY3JlYXRlZCI7czoxOToiMjAxNy0wMS0xNSAwMjozODo0NiI7czo4OiJtb2RpZmllZCI7czoxOToiMjAxNy0wMS0xNSAwMjo1NTo0MSI7czo3OiJsb2dkYXRlIjtzOjE5OiIyMDE3LTAxLTE1IDAyOjUyOjAyIjtzOjY6ImxvZ251bSI7czoxOiIyIjtzOjE1OiJyZWxvYWRfYWNsX2ZsYWciO3M6MToiMCI7czo5OiJpc19hY3RpdmUiO3M6MToiMSI7czo1OiJleHRyYSI7czoyOiJOOyI7czo4OiJycF90b2tlbiI7TjtzOjE5OiJycF90b2tlbl9jcmVhdGVkX2F0IjtOO3M6MTY6ImludGVyZmFjZV9sb2NhbGUiO3M6NToiZGVfREUiO3M6MTI6ImZhaWx1cmVzX251bSI7czoxOiIwIjtzOjEzOiJmaXJzdF9mYWlsdXJlIjtOO3M6MTI6ImxvY2tfZXhwaXJlcyI7Tjt9czoxMzoiACoAX2lzRGVsZXRlZCI7YjowO3M6MTY6IgAqAF9yZXNvdXJjZU5hbWUiO3M6Mzc6Ik1hZ2VudG9cVXNlclxNb2RlbFxSZXNvdXJjZU1vZGVsXFVzZXIiO3M6MTg6IgAqAF9jb2xsZWN0aW9uTmFtZSI7czo0ODoiTWFnZW50b1xVc2VyXE1vZGVsXFJlc291cmNlTW9kZWxcVXNlclxDb2xsZWN0aW9uIjtzOjEyOiIAKgBfY2FjaGVUYWciO2I6MDtzOjE5OiIAKgBfZGF0YVNhdmVBbGxvd2VkIjtiOjE7czoxNToiACoAX2lzT2JqZWN0TmV3IjtOO3M6MTM6IgAqAHN0b3JlZERhdGEiO2E6MDp7fXM6ODoiACoAX2RhdGEiO2E6MTk6e3M6NzoidXNlcl9pZCI7czoxOiIyIjtzOjk6ImZpcnN0bmFtZSI7czo1OiJhZG1pbiI7czo4OiJsYXN0bmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czo0NjoiYWRtaW4yMzRAd2VyYmVhcnRpa2VsLXdlcmJlZ2VzY2hlbmtlLW9ubGluZS5kZSI7czo4OiJ1c2VybmFtZSI7czo4OiJhZG1pbjEyMyI7czo4OiJwYXNzd29yZCI7czo5OToiMTg5YWY0NzU5ZDliY2EyMGY1MWZkZWZmZGQ2YTU5YzNkN2MzZjUxOGRhYzRkNDdiMjBlODc2MzIzOTAyMDk2ZDpiWk15S0dIbnJtRnB2aUMwc3pVTHBJdGIxczQxcmdNcjoxIjtzOjc6ImNyZWF0ZWQiO3M6MTk6IjIwMTctMDEtMTUgMDI6Mzg6NDYiO3M6ODoibW9kaWZpZWQiO3M6MTk6IjIwMTctMDEtMTUgMDI6NTU6NDEiO3M6NzoibG9nZGF0ZSI7czoxOToiMjAxNy0wMS0xNSAwMjo1MjowMiI7czo2OiJsb2dudW0iO3M6MToiMiI7czoxNToicmVsb2FkX2FjbF9mbGFnIjtzOjE6IjAiO3M6OToiaXNfYWN0aXZlIjtzOjE6IjEiO3M6NToiZXh0cmEiO3M6MjoiTjsiO3M6ODoicnBfdG9rZW4iO047czoxOToicnBfdG9rZW5fY3JlYXRlZF9hdCI7TjtzOjE2OiJpbnRlcmZhY2VfbG9jYWxlIjtzOjU6ImRlX0RFIjtzOjEyOiJmYWlsdXJlc19udW0iO3M6MToiMCI7czoxMzoiZmlyc3RfZmFpbHVyZSI7TjtzOjEyOiJsb2NrX2V4cGlyZXMiO047fX19ZGVmYXVsdHxhOjA6e31jdXN0b21lcl9iYXNlfGE6MDp7fW1lc3NhZ2V8YToxOntzOjc6ImJhY2tlbmQiO086MzY6Ik1hZ2VudG9cRnJhbWV3b3JrXE1lc3NhZ2VcQ29sbGVjdGlvbiI6Mjp7czoxMToiACoAbWVzc2FnZXMiO2E6MDp7fXM6MTk6IgAqAGxhc3RBZGRlZE1lc3NhZ2UiO047fX0=');
INSERT INTO `mgk3_session` VALUES ('l9nuh01s078jtq27vns1053pa1','1484527563','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMzoiODguNjkuMTI5LjIyOSI7czo4OiJodHRwX3ZpYSI7czowOiIiO3M6MjA6Imh0dHBfeF9mb3J3YXJkZWRfZm9yIjtzOjA6IiI7czoxNToiaHR0cF91c2VyX2FnZW50IjtzOjEwOToiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV09XNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS81NS4wLjI4ODMuODcgU2FmYXJpLzUzNy4zNiI7fV9zZXNzaW9uX2hvc3RzfGE6MTp7czozNzoid2VyYmVhcnRpa2VsLXdlcmJlZ2VzY2hlbmtlLW9ubGluZS5kZSI7YjoxO31kZWZhdWx0fGE6MTp7czoxMjoidmlzaXRvcl9kYXRhIjthOjM6e3M6MTM6Imxhc3RfdmlzaXRfYXQiO3M6MTk6IjIwMTctMDEtMTYgMDA6NDY6MDMiO3M6MTA6InNlc3Npb25faWQiO3M6MjY6Imw5bnVoMDFzMDc4anRxMjd2bnMxMDUzcGExIjtzOjEwOiJ2aXNpdG9yX2lkIjtzOjI6IjExIjt9fWN1c3RvbWVyX2Jhc2V8YTowOnt9Y2hlY2tvdXR8YTowOnt9bWVzc2FnZXxhOjA6e31jYXRhbG9nfGE6MDp7fQ=='),('m01l88m4po0leajjpjglbkhad4','1484560201','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('m7goe8vt2bcfobf08cpukhd2m3','1484553001','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('msgfr18fgs3bat283lh76ff944','1484538602','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('mtd49io9469hoc7og3am97hog5','1484583539','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9bWVzc2FnZXxhOjE6e3M6NzoiYmFja2VuZCI7TzozNjoiTWFnZW50b1xGcmFtZXdvcmtcTWVzc2FnZVxDb2xsZWN0aW9uIjoyOntzOjExOiIAKgBtZXNzYWdlcyI7YTowOnt9czoxOToiACoAbGFzdEFkZGVkTWVzc2FnZSI7Tjt9fWFkbWluaHRtbHxhOjM6e3M6NjoibG9jYWxlIjtzOjU6ImVuX1VTIjtzOjk6Il9mb3JtX2tleSI7czoxNjoic2JDVkF3Zmx3QnNza3FRSyI7czoxMzoiaXNfdXJsX25vdGljZSI7YjowO31hZG1pbnxhOjE6e3M6NDoidXNlciI7TzoyMzoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXIiOjE2OntzOjE1OiIAKgBfZXZlbnRQcmVmaXgiO3M6MTA6ImFkbWluX3VzZXIiO3M6ODoiACoAX3JvbGUiO047czoxNjoiACoAX2hhc1Jlc291cmNlcyI7YjoxO3M6MTg6IgAqAHZhbGlkYXRpb25SdWxlcyI7TzozODoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXJWYWxpZGF0aW9uUnVsZXMiOjA6e31zOjE1OiIAKgBfZXZlbnRPYmplY3QiO3M6Njoib2JqZWN0IjtzOjE1OiIAKgBfaWRGaWVsZE5hbWUiO3M6NzoidXNlcl9pZCI7czoxODoiACoAX2hhc0RhdGFDaGFuZ2VzIjtiOjE7czoxMjoiACoAX29yaWdEYXRhIjthOjE5OntzOjc6InVzZXJfaWQiO3M6MToiMiI7czo5OiJmaXJzdG5hbWUiO3M6NToiYWRtaW4iO3M6ODoibGFzdG5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6NDY6ImFkbWluMjM0QHdlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO3M6ODoidXNlcm5hbWUiO3M6ODoiYWRtaW4xMjMiO3M6ODoicGFzc3dvcmQiO3M6OTk6IjE4OWFmNDc1OWQ5YmNhMjBmNTFmZGVmZmRkNmE1OWMzZDdjM2Y1MThkYWM0ZDQ3YjIwZTg3NjMyMzkwMjA5NmQ6YlpNeUtHSG5ybUZwdmlDMHN6VUxwSXRiMXM0MXJnTXI6MSI7czo3OiJjcmVhdGVkIjtzOjE5OiIyMDE3LTAxLTE1IDAyOjM4OjQ2IjtzOjg6Im1vZGlmaWVkIjtzOjE5OiIyMDE3LTAxLTE2IDE1OjEwOjA1IjtzOjc6ImxvZ2RhdGUiO3M6MTk6IjIwMTctMDEtMTYgMTU6MTA6MDUiO3M6NjoibG9nbnVtIjtzOjE6IjciO3M6MTU6InJlbG9hZF9hY2xfZmxhZyI7czoxOiIwIjtzOjk6ImlzX2FjdGl2ZSI7czoxOiIxIjtzOjU6ImV4dHJhIjtzOjI6Ik47IjtzOjg6InJwX3Rva2VuIjtOO3M6MTk6InJwX3Rva2VuX2NyZWF0ZWRfYXQiO047czoxNjoiaW50ZXJmYWNlX2xvY2FsZSI7czo1OiJkZV9ERSI7czoxMjoiZmFpbHVyZXNfbnVtIjtzOjE6IjAiO3M6MTM6ImZpcnN0X2ZhaWx1cmUiO047czoxMjoibG9ja19leHBpcmVzIjtOO31zOjEzOiIAKgBfaXNEZWxldGVkIjtiOjA7czoxNjoiACoAX3Jlc291cmNlTmFtZSI7czozNzoiTWFnZW50b1xVc2VyXE1vZGVsXFJlc291cmNlTW9kZWxcVXNlciI7czoxODoiACoAX2NvbGxlY3Rpb25OYW1lIjtzOjQ4OiJNYWdlbnRvXFVzZXJcTW9kZWxcUmVzb3VyY2VNb2RlbFxVc2VyXENvbGxlY3Rpb24iO3M6MTI6IgAqAF9jYWNoZVRhZyI7YjowO3M6MTk6IgAqAF9kYXRhU2F2ZUFsbG93ZWQiO2I6MTtzOjE1OiIAKgBfaXNPYmplY3ROZXciO047czoxMzoiACoAc3RvcmVkRGF0YSI7YTowOnt9czo4OiIAKgBfZGF0YSI7YToxOTp7czo3OiJ1c2VyX2lkIjtzOjE6IjIiO3M6OToiZmlyc3RuYW1lIjtzOjU6ImFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjU6ImFkbWluIjtzOjU6ImVtYWlsIjtzOjQ2OiJhZG1pbjIzNEB3ZXJiZWFydGlrZWwtd2VyYmVnZXNjaGVua2Utb25saW5lLmRlIjtzOjg6InVzZXJuYW1lIjtzOjg6ImFkbWluMTIzIjtzOjg6InBhc3N3b3JkIjtzOjk5OiIxODlhZjQ3NTlkOWJjYTIwZjUxZmRlZmZkZDZhNTljM2Q3YzNmNTE4ZGFjNGQ0N2IyMGU4NzYzMjM5MDIwOTZkOmJaTXlLR0hucm1GcHZpQzBzelVMcEl0YjFzNDFyZ01yOjEiO3M6NzoiY3JlYXRlZCI7czoxOToiMjAxNy0wMS0xNSAwMjozODo0NiI7czo4OiJtb2RpZmllZCI7czoxOToiMjAxNy0wMS0xNiAxNToxMDowNSI7czo3OiJsb2dkYXRlIjtzOjE5OiIyMDE3LTAxLTE2IDE1OjEwOjA1IjtzOjY6ImxvZ251bSI7czoxOiI3IjtzOjE1OiJyZWxvYWRfYWNsX2ZsYWciO3M6MToiMCI7czo5OiJpc19hY3RpdmUiO3M6MToiMSI7czo1OiJleHRyYSI7czoyOiJOOyI7czo4OiJycF90b2tlbiI7TjtzOjE5OiJycF90b2tlbl9jcmVhdGVkX2F0IjtOO3M6MTY6ImludGVyZmFjZV9sb2NhbGUiO3M6NToiZGVfREUiO3M6MTI6ImZhaWx1cmVzX251bSI7czoxOiIwIjtzOjEzOiJmaXJzdF9mYWlsdXJlIjtOO3M6MTI6ImxvY2tfZXhwaXJlcyI7Tjt9fX1kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2Jhc2V8YTowOnt9'),('n0c35g5busvt1k5fdkof75l5g5','1484517002','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('n66us2o9b2auo2bipr1o14b405','1484501162','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('o6jlhgq0213bu5e0k73tpilo90','1484526361','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('oc4grnbhmo8tkggdp4de63l945','1484569562','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('ofv3i5dc1sn9c7rh4jvsgds251','1484576466','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9ZGVmYXVsdHxhOjI6e3M6OToiX2Zvcm1fa2V5IjtzOjE2OiJZOUJwelV0aTJZcDJZcnBwIjtzOjEyOiJ2aXNpdG9yX2RhdGEiO2E6Mzp7czoxMzoibGFzdF92aXNpdF9hdCI7czoxOToiMjAxNy0wMS0xNiAxNDoyMTowNSI7czoxMDoic2Vzc2lvbl9pZCI7czoyNjoib2Z2M2k1ZGMxc245YzdyaDRqdnNnZHMyNTEiO3M6MTA6InZpc2l0b3JfaWQiO3M6MjoiMTYiO319Y3VzdG9tZXJfYmFzZXxhOjA6e31jaGVja291dHxhOjA6e31tZXNzYWdlfGE6MDp7fWNhdGFsb2d8YTowOnt9'),('oh3q5t8o6u79b7473td5hrj9r0','1484578201','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('pb748b6ktji7gg2e5h3h8ugdp3','1484579405','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9bWVzc2FnZXxhOjE6e3M6NzoiYmFja2VuZCI7TzozNjoiTWFnZW50b1xGcmFtZXdvcmtcTWVzc2FnZVxDb2xsZWN0aW9uIjoyOntzOjExOiIAKgBtZXNzYWdlcyI7YTowOnt9czoxOToiACoAbGFzdEFkZGVkTWVzc2FnZSI7Tjt9fWFkbWluaHRtbHxhOjM6e3M6NjoibG9jYWxlIjtzOjU6ImVuX1VTIjtzOjk6Il9mb3JtX2tleSI7czoxNjoiWTlCcHpVdGkyWXAyWXJwcCI7czoxMzoiaXNfdXJsX25vdGljZSI7YjowO31hZG1pbnxhOjE6e3M6NDoidXNlciI7TzoyMzoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXIiOjE2OntzOjE1OiIAKgBfZXZlbnRQcmVmaXgiO3M6MTA6ImFkbWluX3VzZXIiO3M6ODoiACoAX3JvbGUiO047czoxNjoiACoAX2hhc1Jlc291cmNlcyI7YjoxO3M6MTg6IgAqAHZhbGlkYXRpb25SdWxlcyI7TzozODoiTWFnZW50b1xVc2VyXE1vZGVsXFVzZXJWYWxpZGF0aW9uUnVsZXMiOjA6e31zOjE1OiIAKgBfZXZlbnRPYmplY3QiO3M6Njoib2JqZWN0IjtzOjE1OiIAKgBfaWRGaWVsZE5hbWUiO3M6NzoidXNlcl9pZCI7czoxODoiACoAX2hhc0RhdGFDaGFuZ2VzIjtiOjE7czoxMjoiACoAX29yaWdEYXRhIjthOjE5OntzOjc6InVzZXJfaWQiO3M6MToiMiI7czo5OiJmaXJzdG5hbWUiO3M6NToiYWRtaW4iO3M6ODoibGFzdG5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6NDY6ImFkbWluMjM0QHdlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO3M6ODoidXNlcm5hbWUiO3M6ODoiYWRtaW4xMjMiO3M6ODoicGFzc3dvcmQiO3M6OTk6IjE4OWFmNDc1OWQ5YmNhMjBmNTFmZGVmZmRkNmE1OWMzZDdjM2Y1MThkYWM0ZDQ3YjIwZTg3NjMyMzkwMjA5NmQ6YlpNeUtHSG5ybUZwdmlDMHN6VUxwSXRiMXM0MXJnTXI6MSI7czo3OiJjcmVhdGVkIjtzOjE5OiIyMDE3LTAxLTE1IDAyOjM4OjQ2IjtzOjg6Im1vZGlmaWVkIjtzOjE5OiIyMDE3LTAxLTE2IDE0OjQyOjM3IjtzOjc6ImxvZ2RhdGUiO3M6MTk6IjIwMTctMDEtMTYgMTQ6NDI6MzciO3M6NjoibG9nbnVtIjtzOjE6IjYiO3M6MTU6InJlbG9hZF9hY2xfZmxhZyI7czoxOiIwIjtzOjk6ImlzX2FjdGl2ZSI7czoxOiIxIjtzOjU6ImV4dHJhIjtzOjI6Ik47IjtzOjg6InJwX3Rva2VuIjtOO3M6MTk6InJwX3Rva2VuX2NyZWF0ZWRfYXQiO047czoxNjoiaW50ZXJmYWNlX2xvY2FsZSI7czo1OiJkZV9ERSI7czoxMjoiZmFpbHVyZXNfbnVtIjtzOjE6IjAiO3M6MTM6ImZpcnN0X2ZhaWx1cmUiO047czoxMjoibG9ja19leHBpcmVzIjtOO31zOjEzOiIAKgBfaXNEZWxldGVkIjtiOjA7czoxNjoiACoAX3Jlc291cmNlTmFtZSI7czozNzoiTWFnZW50b1xVc2VyXE1vZGVsXFJlc291cmNlTW9kZWxcVXNlciI7czoxODoiACoAX2NvbGxlY3Rpb25OYW1lIjtzOjQ4OiJNYWdlbnRvXFVzZXJcTW9kZWxcUmVzb3VyY2VNb2RlbFxVc2VyXENvbGxlY3Rpb24iO3M6MTI6IgAqAF9jYWNoZVRhZyI7YjowO3M6MTk6IgAqAF9kYXRhU2F2ZUFsbG93ZWQiO2I6MTtzOjE1OiIAKgBfaXNPYmplY3ROZXciO047czoxMzoiACoAc3RvcmVkRGF0YSI7YTowOnt9czo4OiIAKgBfZGF0YSI7YToxOTp7czo3OiJ1c2VyX2lkIjtzOjE6IjIiO3M6OToiZmlyc3RuYW1lIjtzOjU6ImFkbWluIjtzOjg6Imxhc3RuYW1lIjtzOjU6ImFkbWluIjtzOjU6ImVtYWlsIjtzOjQ2OiJhZG1pbjIzNEB3ZXJiZWFydGlrZWwtd2VyYmVnZXNjaGVua2Utb25saW5lLmRlIjtzOjg6InVzZXJuYW1lIjtzOjg6ImFkbWluMTIzIjtzOjg6InBhc3N3b3JkIjtzOjk5OiIxODlhZjQ3NTlkOWJjYTIwZjUxZmRlZmZkZDZhNTljM2Q3YzNmNTE4ZGFjNGQ0N2IyMGU4NzYzMjM5MDIwOTZkOmJaTXlLR0hucm1GcHZpQzBzelVMcEl0YjFzNDFyZ01yOjEiO3M6NzoiY3JlYXRlZCI7czoxOToiMjAxNy0wMS0xNSAwMjozODo0NiI7czo4OiJtb2RpZmllZCI7czoxOToiMjAxNy0wMS0xNiAxNDo0MjozNyI7czo3OiJsb2dkYXRlIjtzOjE5OiIyMDE3LTAxLTE2IDE0OjQyOjM3IjtzOjY6ImxvZ251bSI7czoxOiI2IjtzOjE1OiJyZWxvYWRfYWNsX2ZsYWciO3M6MToiMCI7czo5OiJpc19hY3RpdmUiO3M6MToiMSI7czo1OiJleHRyYSI7czoyOiJOOyI7czo4OiJycF90b2tlbiI7TjtzOjE5OiJycF90b2tlbl9jcmVhdGVkX2F0IjtOO3M6MTY6ImludGVyZmFjZV9sb2NhbGUiO3M6NToiZGVfREUiO3M6MTI6ImZhaWx1cmVzX251bSI7czoxOiIwIjtzOjEzOiJmaXJzdF9mYWlsdXJlIjtOO3M6MTI6ImxvY2tfZXhwaXJlcyI7Tjt9fX1kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2Jhc2V8YTowOnt9'),('q6kkq6is3tkp2puhi9pvaiekk2','1484581801','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('qd6kv2u4lus4mnplbnpmihtp95','1484504761','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('r1uqufjcrtnp61e1pb24dqumh0','1484544361','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('r21nn0ueuoru69ajtfd8odrig0','1484574601','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('rc60kpa67reo701pkfu7o8f6k7','1484502602','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('sle63q107aliav3h34dsu2kul3','1484511962','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('slrjp9g9qbdbd3rmnj7hn9s5q0','1484567401','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('sr26sguo3p83prqifsc983o653','1484558762','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('t27k451ubmf6mr5sooau3rp3s0','1484520601','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('tbo44d7j71s90uo9crredosl73','1484513401','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('tkt11m2vh3igpbo2l55a056vr1','1484563801','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('ttflfuus2rkvip7p4eblj1r4v6','1484580362','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('uf3i6i3e767jjd4olc9rq30sn3','1484580161','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czoxMToiMTc4LjQuMjguNzYiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czoxMDk6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdPVzY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvNTUuMC4yODgzLjg3IFNhZmFyaS81MzcuMzYiO31fc2Vzc2lvbl9ob3N0c3xhOjE6e3M6Mzc6IndlcmJlYXJ0aWtlbC13ZXJiZWdlc2NoZW5rZS1vbmxpbmUuZGUiO2I6MTt9ZGVmYXVsdHxhOjI6e3M6OToiX2Zvcm1fa2V5IjtzOjE2OiJzYkNWQXdmbHdCc3NrcVFLIjtzOjEyOiJ2aXNpdG9yX2RhdGEiO2E6Mzp7czoxMzoibGFzdF92aXNpdF9hdCI7czoxOToiMjAxNy0wMS0xNiAxNToyMjo0MCI7czoxMDoic2Vzc2lvbl9pZCI7czoyNjoidWYzaTZpM2U3NjdqamQ0b2xjOXJxMzBzbjMiO3M6MTA6InZpc2l0b3JfaWQiO3M6MjoiMTciO319Y3VzdG9tZXJfYmFzZXxhOjA6e31jaGVja291dHxhOjA6e31tZXNzYWdlfGE6MDp7fWNhdGFsb2d8YTowOnt9'),('uhg07evfp96an7rltf5lds42f2','1484529961','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ=='),('uosklj2a1n9u77ej555ehvrbo1','1484540761','X3Nlc3Npb25fdmFsaWRhdG9yX2RhdGF8YTo0OntzOjExOiJyZW1vdGVfYWRkciI7czowOiIiO3M6ODoiaHR0cF92aWEiO3M6MDoiIjtzOjIwOiJodHRwX3hfZm9yd2FyZGVkX2ZvciI7czowOiIiO3M6MTU6Imh0dHBfdXNlcl9hZ2VudCI7czowOiIiO31kZWZhdWx0fGE6MDp7fWN1c3RvbWVyX2FkbWlufGE6MDp7fQ==');
/*!40000 ALTER TABLE `mgk3_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_setup_module`
--

DROP TABLE IF EXISTS `mgk3_setup_module`;
CREATE TABLE `mgk3_setup_module` (
  `module` varchar(50) NOT NULL COMMENT 'Module',
  `schema_version` varchar(50) DEFAULT NULL COMMENT 'Schema Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module versions registry';

--
-- Dumping data for table `mgk3_setup_module`
--

LOCK TABLES `mgk3_setup_module` WRITE;
/*!40000 ALTER TABLE `mgk3_setup_module` DISABLE KEYS */;
INSERT INTO `mgk3_setup_module` VALUES ('Aheadworks_Rbslider','1.1.1','1.1.1'),('Magento_AdminNotification','2.0.0','2.0.0'),('Magento_AdvancedPricingImportExport','2.0.0','2.0.0'),('Magento_Authorization','2.0.0','2.0.0'),('Magento_Authorizenet','2.0.0','2.0.0'),('Magento_Backend','2.0.0','2.0.0'),('Magento_Backup','2.0.0','2.0.0'),('Magento_Braintree','2.0.0','2.0.0'),('Magento_Bundle','2.0.2','2.0.2'),('Magento_BundleImportExport','2.0.0','2.0.0'),('Magento_CacheInvalidate','2.0.0','2.0.0'),('Magento_Captcha','2.0.0','2.0.0'),('Magento_Catalog','2.1.3','2.1.3'),('Magento_CatalogImportExport','2.0.0','2.0.0'),('Magento_CatalogInventory','2.0.1','2.0.1'),('Magento_CatalogRule','2.0.1','2.0.1'),('Magento_CatalogRuleConfigurable','2.0.0','2.0.0'),('Magento_CatalogSearch','2.0.0','2.0.0'),('Magento_CatalogUrlRewrite','2.0.0','2.0.0'),('Magento_CatalogWidget','2.0.0','2.0.0'),('Magento_Checkout','2.0.0','2.0.0'),('Magento_CheckoutAgreements','2.0.1','2.0.1'),('Magento_Cms','2.0.1','2.0.1'),('Magento_CmsUrlRewrite','2.0.0','2.0.0'),('Magento_Config','2.0.0','2.0.0'),('Magento_ConfigurableImportExport','2.0.0','2.0.0'),('Magento_ConfigurableProduct','2.0.0','2.0.0'),('Magento_Contact','2.0.0','2.0.0'),('Magento_Cookie','2.0.0','2.0.0'),('Magento_Cron','2.0.0','2.0.0'),('Magento_CurrencySymbol','2.0.0','2.0.0'),('Magento_Customer','2.0.9','2.0.9'),('Magento_CustomerImportExport','2.0.0','2.0.0'),('Magento_Deploy','2.0.0','2.0.0'),('Magento_Developer','2.0.0','2.0.0'),('Magento_Dhl','2.0.0','2.0.0'),('Magento_Directory','2.0.0','2.0.0'),('Magento_Downloadable','2.0.1','2.0.1'),('Magento_DownloadableImportExport','2.0.0','2.0.0'),('Magento_Eav','2.0.0','2.0.0'),('Magento_Email','2.0.0','2.0.0'),('Magento_EncryptionKey','2.0.0','2.0.0'),('Magento_Fedex','2.0.0','2.0.0'),('Magento_GiftMessage','2.0.1','2.0.1'),('Magento_GoogleAdwords','2.0.0','2.0.0'),('Magento_GoogleAnalytics','2.0.0','2.0.0'),('Magento_GoogleOptimizer','2.0.0','2.0.0'),('Magento_GroupedImportExport','2.0.0','2.0.0'),('Magento_GroupedProduct','2.0.1','2.0.1'),('Magento_ImportExport','2.0.1','2.0.1'),('Magento_Indexer','2.0.0','2.0.0'),('Magento_Integration','2.0.1','2.0.1'),('Magento_LayeredNavigation','2.0.0','2.0.0'),('Magento_Marketplace','1.0.0','1.0.0'),('Magento_MediaStorage','2.0.0','2.0.0'),('Magento_Msrp','2.1.3','2.1.3'),('Magento_Multishipping','2.0.0','2.0.0'),('Magento_NewRelicReporting','2.0.0','2.0.0'),('Magento_Newsletter','2.0.0','2.0.0'),('Magento_OfflinePayments','2.0.0','2.0.0'),('Magento_OfflineShipping','2.0.0','2.0.0'),('Magento_PageCache','2.0.0','2.0.0'),('Magento_Payment','2.0.0','2.0.0'),('Magento_Paypal','2.0.0','2.0.0'),('Magento_Persistent','2.0.0','2.0.0'),('Magento_ProductAlert','2.0.0','2.0.0'),('Magento_ProductVideo','2.0.0.2','2.0.0.2'),('Magento_Quote','2.0.3','2.0.3'),('Magento_Reports','2.0.0','2.0.0'),('Magento_RequireJs','2.0.0','2.0.0'),('Magento_Review','2.0.0','2.0.0'),('Magento_Rss','2.0.0','2.0.0'),('Magento_Rule','2.0.0','2.0.0'),('Magento_Sales','2.0.3','2.0.3'),('Magento_SalesInventory','1.0.0','1.0.0'),('Magento_SalesRule','2.0.1','2.0.1'),('Magento_SalesSequence','2.0.0','2.0.0'),('Magento_SampleData','2.0.0','2.0.0'),('Magento_Search','2.0.4','2.0.4'),('Magento_Security','2.0.1','2.0.1'),('Magento_SendFriend','2.0.0','2.0.0'),('Magento_Shipping','2.0.0','2.0.0'),('Magento_Sitemap','2.0.0','2.0.0'),('Magento_Store','2.0.0','2.0.0'),('Magento_Swagger','2.0.0','2.0.0'),('Magento_Swatches','2.0.1','2.0.1'),('Magento_SwatchesLayeredNavigation','2.0.0','2.0.0'),('Magento_Tax','2.0.1','2.0.1'),('Magento_TaxImportExport','2.0.0','2.0.0'),('Magento_Theme','2.0.1','2.0.1'),('Magento_Translation','2.0.0','2.0.0'),('Magento_Ui','2.0.0','2.0.0'),('Magento_Ups','2.0.0','2.0.0'),('Magento_UrlRewrite','2.0.0','2.0.0'),('Magento_User','2.0.1','2.0.1'),('Magento_Usps','2.0.0','2.0.0'),('Magento_Variable','2.0.0','2.0.0'),('Magento_Vault','2.0.2','2.0.2'),('Magento_Version','2.0.0','2.0.0'),('Magento_Webapi','2.0.0','2.0.0'),('Magento_WebapiSecurity','2.0.0','2.0.0'),('Magento_Weee','2.0.0','2.0.0'),('Magento_Widget','2.0.0','2.0.0'),('Magento_Wishlist','2.0.0','2.0.0');
/*!40000 ALTER TABLE `mgk3_setup_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_shipping_tablerate`
--

DROP TABLE IF EXISTS `mgk3_shipping_tablerate`;
CREATE TABLE `mgk3_shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `UNQ_50E5FB6F6AB78252AFB1BF28E771F980` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';

--
-- Table structure for table `mgk3_sitemap`
--

DROP TABLE IF EXISTS `mgk3_sitemap`;
CREATE TABLE `mgk3_sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `MGK3_SITEMAP_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='XML Sitemap';

--
-- Table structure for table `mgk3_store`
--

DROP TABLE IF EXISTS `mgk3_store`;
CREATE TABLE `mgk3_store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `MGK3_STORE_CODE` (`code`),
  KEY `MGK3_STORE_WEBSITE_ID` (`website_id`),
  KEY `MGK3_STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `MGK3_STORE_GROUP_ID` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores';

--
-- Dumping data for table `mgk3_store`
--

LOCK TABLES `mgk3_store` WRITE;
/*!40000 ALTER TABLE `mgk3_store` DISABLE KEYS */;
INSERT INTO `mgk3_store` VALUES (0,'admin',0,0,'Admin',0,1),(1,'default',1,1,'Default Store View',0,1);
/*!40000 ALTER TABLE `mgk3_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_store_group`
--

DROP TABLE IF EXISTS `mgk3_store_group`;
CREATE TABLE `mgk3_store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  PRIMARY KEY (`group_id`),
  KEY `MGK3_STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `MGK3_STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Store Groups';

--
-- Dumping data for table `mgk3_store_group`
--

LOCK TABLES `mgk3_store_group` WRITE;
/*!40000 ALTER TABLE `mgk3_store_group` DISABLE KEYS */;
INSERT INTO `mgk3_store_group` VALUES (0,0,'Default','0',0),(1,1,'Main Website Store','2',1);
/*!40000 ALTER TABLE `mgk3_store_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_store_website`
--

DROP TABLE IF EXISTS `mgk3_store_website`;
CREATE TABLE `mgk3_store_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `MGK3_STORE_WEBSITE_CODE` (`code`),
  KEY `MGK3_STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `MGK3_STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';

--
-- Dumping data for table `mgk3_store_website`
--

LOCK TABLES `mgk3_store_website` WRITE;
/*!40000 ALTER TABLE `mgk3_store_website` DISABLE KEYS */;
INSERT INTO `mgk3_store_website` VALUES (0,'admin','Admin',0,0,0),(1,'base','Main Website',0,1,1);
/*!40000 ALTER TABLE `mgk3_store_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_tax_calculation`
--

DROP TABLE IF EXISTS `mgk3_tax_calculation`;
CREATE TABLE `mgk3_tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `MGK3_TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `MGK3_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `MGK3_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `IDX_DC62AA3A0515973AF9E40AD22777C73A` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';

--
-- Table structure for table `mgk3_tax_calculation_rate`
--

DROP TABLE IF EXISTS `mgk3_tax_calculation_rate`;
CREATE TABLE `mgk3_tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `MGK3_TAX_CALC_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `MGK3_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_A3AD8DCACB38995910B5FDF5D42127A2` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';

--
-- Dumping data for table `mgk3_tax_calculation_rate`
--

LOCK TABLES `mgk3_tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `mgk3_tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `mgk3_tax_calculation_rate` VALUES ('1','US','12','*','US-CA-*-Rate 1','8.2500',NULL,NULL,NULL),('2','US','43','*','US-NY-*-Rate 1','8.3750',NULL,NULL,NULL);
/*!40000 ALTER TABLE `mgk3_tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `mgk3_tax_calculation_rate_title`;
CREATE TABLE `mgk3_tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `MGK3_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `MGK3_TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';

--
-- Table structure for table `mgk3_tax_calculation_rule`
--

DROP TABLE IF EXISTS `mgk3_tax_calculation_rule`;
CREATE TABLE `mgk3_tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `MGK3_TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `MGK3_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';

--
-- Table structure for table `mgk3_tax_class`
--

DROP TABLE IF EXISTS `mgk3_tax_class`;
CREATE TABLE `mgk3_tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tax Class';

--
-- Dumping data for table `mgk3_tax_class`
--

LOCK TABLES `mgk3_tax_class` WRITE;
/*!40000 ALTER TABLE `mgk3_tax_class` DISABLE KEYS */;
INSERT INTO `mgk3_tax_class` VALUES (2,'Taxable Goods','PRODUCT'),(3,'Retail Customer','CUSTOMER');
/*!40000 ALTER TABLE `mgk3_tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `mgk3_tax_order_aggregated_created`;
CREATE TABLE `mgk3_tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_A719D9444F7B979B92D2369CE724F9D0` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `MGK3_TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';

--
-- Table structure for table `mgk3_tax_order_aggregated_updated`
--

DROP TABLE IF EXISTS `mgk3_tax_order_aggregated_updated`;
CREATE TABLE `mgk3_tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_6C22B67A5EB5D08555BC3FA3F54DD8F3` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `MGK3_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Prmg Tax Order Aggregated Updated';

--
-- Table structure for table `mgk3_theme`
--

DROP TABLE IF EXISTS `mgk3_theme`;
CREATE TABLE `mgk3_theme` (
  `theme_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent Id',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint(6) NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Core theme';

--
-- Dumping data for table `mgk3_theme`
--

LOCK TABLES `mgk3_theme` WRITE;
/*!40000 ALTER TABLE `mgk3_theme` DISABLE KEYS */;
INSERT INTO `mgk3_theme` VALUES ('1',NULL,'Magento/blank','Magento Blank','preview_image_585235b9685be.jpeg',0,'frontend',0,'Magento/blank'),('2','1','Magento/luma','Magento Luma','preview_image_585235b9afd98.jpeg',0,'frontend',0,'Magento/luma'),('3',NULL,'Magento/backend','Magento 2 backend',NULL,0,'adminhtml',0,'Magento/backend');
/*!40000 ALTER TABLE `mgk3_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_theme_file`
--

DROP TABLE IF EXISTS `mgk3_theme_file`;
CREATE TABLE `mgk3_theme_file` (
  `theme_files_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme Id',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `MGK3_THEME_FILE_THEME_ID_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Core theme files';

--
-- Table structure for table `mgk3_translation`
--

DROP TABLE IF EXISTS `mgk3_translation`;
CREATE TABLE `mgk3_translation` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `MGK3_TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';

--
-- Table structure for table `mgk3_ui_bookmark`
--

DROP TABLE IF EXISTS `mgk3_ui_bookmark`;
CREATE TABLE `mgk3_ui_bookmark` (
  `bookmark_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User Id',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint(6) NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL COMMENT 'Bookmark updated at',
  PRIMARY KEY (`bookmark_id`),
  KEY `MGK3_UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Bookmark';

--
-- Dumping data for table `mgk3_ui_bookmark`
--

LOCK TABLES `mgk3_ui_bookmark` WRITE;
/*!40000 ALTER TABLE `mgk3_ui_bookmark` DISABLE KEYS */;
INSERT INTO `mgk3_ui_bookmark` VALUES ('1','2','product_listing','default',1,'Default View','{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"entity_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"sku\":{\"visible\":true,\"sorting\":false},\"price\":{\"visible\":true,\"sorting\":false},\"websites\":{\"visible\":true,\"sorting\":false},\"qty\":{\"visible\":true,\"sorting\":false},\"short_description\":{\"visible\":false,\"sorting\":false},\"special_price\":{\"visible\":false,\"sorting\":false},\"cost\":{\"visible\":false,\"sorting\":false},\"weight\":{\"visible\":false,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keyword\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"url_key\":{\"visible\":false,\"sorting\":false},\"msrp\":{\"visible\":false,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"type_id\":{\"visible\":true,\"sorting\":false},\"attribute_set_id\":{\"visible\":true,\"sorting\":false},\"visibility\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"manufacturer\":{\"visible\":false,\"sorting\":false},\"color\":{\"visible\":false,\"sorting\":false},\"custom_design\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":false,\"sorting\":false},\"country_of_manufacture\":{\"visible\":false,\"sorting\":false},\"custom_layout\":{\"visible\":false,\"sorting\":false},\"tax_class_id\":{\"visible\":false,\"sorting\":false},\"gift_message_available\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"thumbnail\":{\"visible\":true,\"sorting\":false},\"special_from_date\":{\"visible\":false,\"sorting\":false},\"special_to_date\":{\"visible\":false,\"sorting\":false},\"news_from_date\":{\"visible\":false,\"sorting\":false},\"news_to_date\":{\"visible\":false,\"sorting\":false},\"custom_design_from\":{\"visible\":false,\"sorting\":false},\"custom_design_to\":{\"visible\":false,\"sorting\":false}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"ids\":0,\"entity_id\":1,\"thumbnail\":2,\"name\":3,\"type_id\":4,\"attribute_set_id\":5,\"sku\":6,\"price\":7,\"qty\":8,\"visibility\":9,\"status\":10,\"websites\":11,\"short_description\":12,\"special_price\":13,\"special_from_date\":14,\"special_to_date\":15,\"cost\":16,\"weight\":17,\"manufacturer\":18,\"meta_title\":19,\"meta_keyword\":20,\"meta_description\":21,\"color\":22,\"news_from_date\":23,\"news_to_date\":24,\"custom_design\":25,\"custom_design_from\":26,\"custom_design_to\":27,\"page_layout\":28,\"country_of_manufacture\":29,\"custom_layout\":30,\"url_key\":31,\"msrp\":32,\"tax_class_id\":33,\"gift_message_available\":34,\"actions\":35}},\"value\":\"Default View\"}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),('2','2','product_listing','current',0,NULL,'{\"current\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"entity_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"sku\":{\"visible\":true,\"sorting\":false},\"price\":{\"visible\":true,\"sorting\":false},\"websites\":{\"visible\":true,\"sorting\":false},\"qty\":{\"visible\":true,\"sorting\":false},\"short_description\":{\"visible\":false,\"sorting\":false},\"special_price\":{\"visible\":false,\"sorting\":false},\"cost\":{\"visible\":false,\"sorting\":false},\"weight\":{\"visible\":false,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keyword\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"url_key\":{\"visible\":false,\"sorting\":false},\"msrp\":{\"visible\":false,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"type_id\":{\"visible\":true,\"sorting\":false},\"attribute_set_id\":{\"visible\":true,\"sorting\":false},\"visibility\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"manufacturer\":{\"visible\":false,\"sorting\":false},\"color\":{\"visible\":false,\"sorting\":false},\"custom_design\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":false,\"sorting\":false},\"country_of_manufacture\":{\"visible\":false,\"sorting\":false},\"custom_layout\":{\"visible\":false,\"sorting\":false},\"tax_class_id\":{\"visible\":false,\"sorting\":false},\"gift_message_available\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"thumbnail\":{\"visible\":true,\"sorting\":false},\"special_from_date\":{\"visible\":false,\"sorting\":false},\"special_to_date\":{\"visible\":false,\"sorting\":false},\"news_from_date\":{\"visible\":false,\"sorting\":false},\"news_to_date\":{\"visible\":false,\"sorting\":false},\"custom_design_from\":{\"visible\":false,\"sorting\":false},\"custom_design_to\":{\"visible\":false,\"sorting\":false}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"ids\":0,\"entity_id\":1,\"thumbnail\":2,\"name\":3,\"type_id\":4,\"attribute_set_id\":5,\"sku\":6,\"price\":7,\"qty\":8,\"visibility\":9,\"status\":10,\"websites\":11,\"short_description\":12,\"special_price\":13,\"special_from_date\":14,\"special_to_date\":15,\"cost\":16,\"weight\":17,\"manufacturer\":18,\"meta_title\":19,\"meta_keyword\":20,\"meta_description\":21,\"color\":22,\"news_from_date\":23,\"news_to_date\":24,\"custom_design\":25,\"custom_design_from\":26,\"custom_design_to\":27,\"page_layout\":28,\"country_of_manufacture\":29,\"custom_layout\":30,\"url_key\":31,\"msrp\":32,\"tax_class_id\":33,\"gift_message_available\":34,\"actions\":35}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),('3','2','cms_page_listing','current',0,NULL,'{\"current\":{\"search\":{\"value\":\"\"},\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"page_id\":{\"visible\":true,\"sorting\":\"asc\"},\"title\":{\"visible\":true,\"sorting\":false},\"identifier\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keywords\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"page_layout\":{\"visible\":true,\"sorting\":false},\"is_active\":{\"visible\":true,\"sorting\":false},\"custom_theme\":{\"visible\":false,\"sorting\":false},\"custom_root_template\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"creation_time\":{\"visible\":true,\"sorting\":false},\"update_time\":{\"visible\":true,\"sorting\":false},\"custom_theme_from\":{\"visible\":false,\"sorting\":false},\"custom_theme_to\":{\"visible\":false,\"sorting\":false}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"ids\":0,\"page_id\":1,\"title\":2,\"identifier\":3,\"page_layout\":4,\"store_id\":5,\"is_active\":6,\"creation_time\":7,\"update_time\":8,\"custom_theme_from\":9,\"custom_theme_to\":10,\"custom_theme\":11,\"custom_root_template\":12,\"meta_title\":13,\"meta_keywords\":14,\"meta_description\":15,\"actions\":16}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),('4','2','cms_page_listing','default',1,'Standardansicht','{\"views\":{\"default\":{\"label\":\"Standardansicht\",\"index\":\"default\",\"editable\":false,\"data\":{\"search\":{\"value\":\"\"},\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"page_id\":{\"visible\":true,\"sorting\":\"asc\"},\"title\":{\"visible\":true,\"sorting\":false},\"identifier\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keywords\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"page_layout\":{\"visible\":true,\"sorting\":false},\"is_active\":{\"visible\":true,\"sorting\":false},\"custom_theme\":{\"visible\":false,\"sorting\":false},\"custom_root_template\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"creation_time\":{\"visible\":true,\"sorting\":false},\"update_time\":{\"visible\":true,\"sorting\":false},\"custom_theme_from\":{\"visible\":false,\"sorting\":false},\"custom_theme_to\":{\"visible\":false,\"sorting\":false}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"ids\":0,\"page_id\":1,\"title\":2,\"identifier\":3,\"page_layout\":4,\"store_id\":5,\"is_active\":6,\"creation_time\":7,\"update_time\":8,\"custom_theme_from\":9,\"custom_theme_to\":10,\"custom_theme\":11,\"custom_root_template\":12,\"meta_title\":13,\"meta_keywords\":14,\"meta_description\":15,\"actions\":16}},\"value\":\"Standardansicht\"}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),('5','2','aw_rbslider_slide_grid','current',0,NULL,'{\"current\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"id\":{\"visible\":true,\"sorting\":\"asc\"},\"ids\":{\"visible\":true,\"sorting\":false},\"name\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"banners\":{\"visible\":true,\"sorting\":false},\"customer_group_ids\":{\"visible\":true,\"sorting\":false},\"store_ids\":{\"visible\":true,\"sorting\":false},\"thumbnail\":{\"visible\":true,\"sorting\":false},\"display_from\":{\"visible\":true,\"sorting\":false},\"display_to\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"ids\":0,\"id\":1,\"thumbnail\":2,\"name\":3,\"status\":4,\"banners\":5,\"customer_group_ids\":6,\"store_ids\":7,\"display_from\":8,\"display_to\":9}}}','0000-00-00 00:00:00','0000-00-00 00:00:00'),('6','2','aw_rbslider_slide_grid','default',1,'Standardansicht','{\"views\":{\"default\":{\"label\":\"Standardansicht\",\"index\":\"default\",\"editable\":false,\"data\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"id\":{\"visible\":true,\"sorting\":\"asc\"},\"ids\":{\"visible\":true,\"sorting\":false},\"name\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"banners\":{\"visible\":true,\"sorting\":false},\"customer_group_ids\":{\"visible\":true,\"sorting\":false},\"store_ids\":{\"visible\":true,\"sorting\":false},\"thumbnail\":{\"visible\":true,\"sorting\":false},\"display_from\":{\"visible\":true,\"sorting\":false},\"display_to\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"paging\":{\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"positions\":{\"ids\":0,\"id\":1,\"thumbnail\":2,\"name\":3,\"status\":4,\"banners\":5,\"customer_group_ids\":6,\"store_ids\":7,\"display_from\":8,\"display_to\":9}},\"value\":\"Standardansicht\"}}}','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `mgk3_ui_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_url_rewrite`
--

DROP TABLE IF EXISTS `mgk3_url_rewrite`;
CREATE TABLE `mgk3_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `MGK3_URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `MGK3_URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `MGK3_URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';

--
-- Dumping data for table `mgk3_url_rewrite`
--

LOCK TABLES `mgk3_url_rewrite` WRITE;
/*!40000 ALTER TABLE `mgk3_url_rewrite` DISABLE KEYS */;
INSERT INTO `mgk3_url_rewrite` VALUES ('1','cms-page','1','no-route','cms/page/view/page_id/1',0,1,NULL,1,NULL),('2','cms-page','2','home','cms/page/view/page_id/2',0,1,NULL,1,NULL),('3','cms-page','3','enable-cookies','cms/page/view/page_id/3',0,1,NULL,1,NULL),('4','cms-page','4','privacy-policy-cookie-restriction-mode','cms/page/view/page_id/4',0,1,NULL,1,NULL);
/*!40000 ALTER TABLE `mgk3_url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgk3_variable`
--

DROP TABLE IF EXISTS `mgk3_variable`;
CREATE TABLE `mgk3_variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `MGK3_VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';

--
-- Table structure for table `mgk3_variable_value`
--

DROP TABLE IF EXISTS `mgk3_variable_value`;
CREATE TABLE `mgk3_variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `MGK3_VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `MGK3_VARIABLE_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';

--
-- Table structure for table `mgk3_vault_payment_token`
--

DROP TABLE IF EXISTS `mgk3_vault_payment_token`;
CREATE TABLE `mgk3_vault_payment_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `public_hash` varchar(128) NOT NULL COMMENT 'Hash code for using on frontend',
  `payment_method_code` varchar(128) NOT NULL COMMENT 'Payment method code',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Expires At',
  `gateway_token` varchar(255) NOT NULL COMMENT 'Gateway Token',
  `details` text COMMENT 'Details',
  `is_active` tinyint(1) NOT NULL COMMENT 'Is active flag',
  `is_visible` tinyint(1) NOT NULL COMMENT 'Is visible flag',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `MGK3_VAULT_PAYMENT_TOKEN_HASH_UNIQUE_INDEX_PUBLIC_HASH` (`public_hash`),
  UNIQUE KEY `UNQ_1AC336F121321F93C09BF4573404B127` (`payment_method_code`,`customer_id`,`gateway_token`),
  KEY `MGK3_VAULT_PAYMENT_TOKEN_CSTR_ID_MGK3_CSTR_ENTT_ENTT_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vault tokens of payment';

--
-- Table structure for table `mgk3_vault_payment_token_order_payment_link`
--

DROP TABLE IF EXISTS `mgk3_vault_payment_token_order_payment_link`;
CREATE TABLE `mgk3_vault_payment_token_order_payment_link` (
  `order_payment_id` int(10) unsigned NOT NULL COMMENT 'Order payment Id',
  `payment_token_id` int(10) unsigned NOT NULL COMMENT 'Payment token Id',
  PRIMARY KEY (`order_payment_id`,`payment_token_id`),
  KEY `FK_9DDDB313998578BE4AC6CAA0A85DD75C` (`payment_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order payments to vault token';

--
-- Table structure for table `mgk3_weee_tax`
--

DROP TABLE IF EXISTS `mgk3_weee_tax`;
CREATE TABLE `mgk3_weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`value_id`),
  KEY `MGK3_WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `MGK3_WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `MGK3_WEEE_TAX_COUNTRY` (`country`),
  KEY `MGK3_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';

--
-- Table structure for table `mgk3_widget`
--

DROP TABLE IF EXISTS `mgk3_widget`;
CREATE TABLE `mgk3_widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `MGK3_WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';

--
-- Table structure for table `mgk3_widget_instance`
--

DROP TABLE IF EXISTS `mgk3_widget_instance`;
CREATE TABLE `mgk3_widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `MGK3_WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';

--
-- Table structure for table `mgk3_widget_instance_page`
--

DROP TABLE IF EXISTS `mgk3_widget_instance_page`;
CREATE TABLE `mgk3_widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `MGK3_WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';

--
-- Table structure for table `mgk3_widget_instance_page_layout`
--

DROP TABLE IF EXISTS `mgk3_widget_instance_page_layout`;
CREATE TABLE `mgk3_widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `MGK3_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `MGK3_WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';

--
-- Table structure for table `mgk3_wishlist`
--

DROP TABLE IF EXISTS `mgk3_wishlist`;
CREATE TABLE `mgk3_wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `MGK3_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `MGK3_WISHLIST_SHARED` (`shared`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';

--
-- Table structure for table `mgk3_wishlist_item`
--

DROP TABLE IF EXISTS `mgk3_wishlist_item`;
CREATE TABLE `mgk3_wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `MGK3_WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `MGK3_WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `MGK3_WISHLIST_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';

--
-- Table structure for table `mgk3_wishlist_item_option`
--

DROP TABLE IF EXISTS `mgk3_wishlist_item_option`;
CREATE TABLE `mgk3_wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_5B911879575538E6B9C077B194431722` (`wishlist_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';

ALTER TABLE `mgk3_admin_passwords`
  ADD CONSTRAINT `MGK3_ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `mgk3_admin_user` (`user_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_admin_user_session`
  ADD CONSTRAINT `MGK3_ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `mgk3_admin_user` (`user_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_authorization_rule`
  ADD CONSTRAINT `MGK3_AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `mgk3_authorization_role` (`role_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_aw_rbslider_slide_banner`
  ADD CONSTRAINT `MGK3_AW_RBSLIDER_SLIDE_BANNER_BANNER_ID_AW_RBSLIDER_BANNER_ID` FOREIGN KEY (`banner_id`) REFERENCES `mgk3_aw_rbslider_banner` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_AW_RBSLIDER_SLIDE_BANNER_SLIDE_ID_AW_RBSLIDER_SLIDE_ID` FOREIGN KEY (`slide_id`) REFERENCES `mgk3_aw_rbslider_slide` (`id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_aw_rbslider_slide_customer_group`
  ADD CONSTRAINT `FK_3BF212C0A56BE877F8BB2EB6F84B7239` FOREIGN KEY (`customer_group_id`) REFERENCES `mgk3_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_AW_RBSLIDER_SLIDE_CSTR_GROUP_SLIDE_ID_AW_RBSLIDER_SLIDE_ID` FOREIGN KEY (`slide_id`) REFERENCES `mgk3_aw_rbslider_slide` (`id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_aw_rbslider_slide_store`
  ADD CONSTRAINT `MGK3_AW_RBSLIDER_SLIDE_STORE_SLIDE_ID_AW_RBSLIDER_SLIDE_ID` FOREIGN KEY (`slide_id`) REFERENCES `mgk3_aw_rbslider_slide` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_AW_RBSLIDER_SLIDE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_aw_rbslider_statistic`
  ADD CONSTRAINT `FK_4FE2488DD1C9DD98297B72FFA103FBAE` FOREIGN KEY (`slide_banner_id`) REFERENCES `mgk3_aw_rbslider_slide_banner` (`id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_category_entity_datetime`
  ADD CONSTRAINT `MGK3_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_category_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_category_entity_decimal`
  ADD CONSTRAINT `MGK3_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_category_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_category_entity_int`
  ADD CONSTRAINT `MGK3_CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_category_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_category_entity_text`
  ADD CONSTRAINT `MGK3_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_category_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_category_entity_varchar`
  ADD CONSTRAINT `MGK3_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_category_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_category_product`
  ADD CONSTRAINT `MGK3_CAT_CTGR_PRD_CTGR_ID_MGK3_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `mgk3_catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_compare_item`
  ADD CONSTRAINT `MGK3_CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `MGK3_CAT_CMP_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_eav_attribute`
  ADD CONSTRAINT `MGK3_CAT_EAV_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_bundle_option`
  ADD CONSTRAINT `MGK3_CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_bundle_option_value`
  ADD CONSTRAINT `MGK3_CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mgk3_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_bundle_price_index`
  ADD CONSTRAINT `FK_836F87C064A51D55580D10C0D3EE19FE` FOREIGN KEY (`customer_group_id`) REFERENCES `mgk3_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_bundle_selection`
  ADD CONSTRAINT `MGK3_CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mgk3_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_bundle_selection_price`
  ADD CONSTRAINT `FK_0E97634B7AEF4E204ECE7FCD216E0933` FOREIGN KEY (`selection_id`) REFERENCES `mgk3_catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity`
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `mgk3_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_datetime`
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_decimal`
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_gallery`
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_int`
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_media_gallery`
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_media_gallery_value`
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_MGK3_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `mgk3_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_media_gallery_value_to_entity`
  ADD CONSTRAINT `FK_068726AEB52B9FA2F28A3CD95CE3BC3F` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CDF04799A6AF391C2CD97E6BE0AC001B` FOREIGN KEY (`value_id`) REFERENCES `mgk3_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_media_gallery_value_video`
  ADD CONSTRAINT `FK_99F487FFD95D8115FCD4F9CC7A6C5E4B` FOREIGN KEY (`value_id`) REFERENCES `mgk3_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_MGK3_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_text`
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_tier_price`
  ADD CONSTRAINT `FK_5098F91664069FE43719CFF0D4F94324` FOREIGN KEY (`customer_group_id`) REFERENCES `mgk3_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_entity_varchar`
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_index_price`
  ADD CONSTRAINT `MGK3_CAT_PRD_IDX_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `mgk3_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_IDX_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_IDX_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_index_tier_price`
  ADD CONSTRAINT `FK_0E11295DD6F3D155B453442EEDC8D0B2` FOREIGN KEY (`customer_group_id`) REFERENCES `mgk3_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_index_website`
  ADD CONSTRAINT `MGK3_CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_link`
  ADD CONSTRAINT `MGK3_CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `mgk3_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_link_attribute`
  ADD CONSTRAINT `MGK3_CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `mgk3_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_link_attribute_decimal`
  ADD CONSTRAINT `FK_E3C08E54B2CADE525AB1181E27524C97` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `mgk3_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `mgk3_catalog_product_link` (`link_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_link_attribute_int`
  ADD CONSTRAINT `FK_E9ACA37884A1E2BE27B8BFD62E281373` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `mgk3_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `mgk3_catalog_product_link` (`link_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_link_attribute_varchar`
  ADD CONSTRAINT `FK_4D3BC62BFCDA141B5D98DB91243CDEE6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `mgk3_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `mgk3_catalog_product_link` (`link_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_option`
  ADD CONSTRAINT `MGK3_CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_option_price`
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mgk3_catalog_product_option` (`option_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_option_title`
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mgk3_catalog_product_option` (`option_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_option_type_price`
  ADD CONSTRAINT `FK_79C61C715CC1BC96944951C255F6AC42` FOREIGN KEY (`option_type_id`) REFERENCES `mgk3_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_option_type_title`
  ADD CONSTRAINT `FK_1FD1F2329AF1C6BA86055470C52BF94D` FOREIGN KEY (`option_type_id`) REFERENCES `mgk3_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_option_type_value`
  ADD CONSTRAINT `MGK3_CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mgk3_catalog_product_option` (`option_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_relation`
  ADD CONSTRAINT `MGK3_CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_super_attribute`
  ADD CONSTRAINT `MGK3_CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_super_attribute_label`
  ADD CONSTRAINT `FK_DBF394CB6A5E8C22A32887B29540B713` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `mgk3_catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_SPR_ATTR_LBL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_super_link`
  ADD CONSTRAINT `MGK3_CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_product_website`
  ADD CONSTRAINT `MGK3_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalog_url_rewrite_product_category`
  ADD CONSTRAINT `FK_7B9CE1EAB660AB093EC13F021BA68955` FOREIGN KEY (`url_rewrite_id`) REFERENCES `mgk3_url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_MGK3_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `mgk3_catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_cataloginventory_stock_item`
  ADD CONSTRAINT `MGK3_CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `mgk3_cataloginventory_stock` (`stock_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalogrule_customer_group`
  ADD CONSTRAINT `MGK3_CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mgk3_catalogrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `mgk3_customer_group` (`customer_group_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalogrule_group_website`
  ADD CONSTRAINT `MGK3_CATALOGRULE_GROUP_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mgk3_catalogrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CATRULE_GROUP_WS_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `mgk3_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CATRULE_GROUP_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_catalogrule_website`
  ADD CONSTRAINT `MGK3_CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mgk3_catalogrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_checkout_agreement_store`
  ADD CONSTRAINT `MGK3_CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `mgk3_checkout_agreement` (`agreement_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_cms_block_store`
  ADD CONSTRAINT `MGK3_CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `mgk3_cms_block` (`block_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_cms_page_store`
  ADD CONSTRAINT `MGK3_CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `mgk3_cms_page` (`page_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_address_entity`
  ADD CONSTRAINT `MGK3_CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_address_entity_datetime`
  ADD CONSTRAINT `MGK3_CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_customer_address_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_address_entity_decimal`
  ADD CONSTRAINT `MGK3_CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_customer_address_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_address_entity_int`
  ADD CONSTRAINT `MGK3_CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_customer_address_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_address_entity_text`
  ADD CONSTRAINT `MGK3_CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_customer_address_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_address_entity_varchar`
  ADD CONSTRAINT `MGK3_CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_customer_address_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_eav_attribute`
  ADD CONSTRAINT `MGK3_CSTR_EAV_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_eav_attribute_website`
  ADD CONSTRAINT `MGK3_CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_entity`
  ADD CONSTRAINT `MGK3_CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `MGK3_CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_customer_entity_datetime`
  ADD CONSTRAINT `MGK3_CSTR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CSTR_ENTT_DTIME_ENTT_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_entity_decimal`
  ADD CONSTRAINT `MGK3_CSTR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_entity_int`
  ADD CONSTRAINT `MGK3_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_entity_text`
  ADD CONSTRAINT `MGK3_CSTR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_entity_varchar`
  ADD CONSTRAINT `MGK3_CSTR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_customer_form_attribute`
  ADD CONSTRAINT `MGK3_CSTR_FORM_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_design_change`
  ADD CONSTRAINT `MGK3_DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_directory_country_region_name`
  ADD CONSTRAINT `FK_434A5980C399B4E93C8EDBC4ADD9A462` FOREIGN KEY (`region_id`) REFERENCES `mgk3_directory_country_region` (`region_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_downloadable_link`
  ADD CONSTRAINT `MGK3_DL_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_downloadable_link_price`
  ADD CONSTRAINT `MGK3_DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `mgk3_downloadable_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_downloadable_link_purchased`
  ADD CONSTRAINT `MGK3_DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `MGK3_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mgk3_sales_order` (`entity_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_downloadable_link_purchased_item`
  ADD CONSTRAINT `FK_164CFCBEFF38684B1365D32ADEAFB4A2` FOREIGN KEY (`order_item_id`) REFERENCES `mgk3_sales_order_item` (`item_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_50E2C4190899EC24DC306CD27D9A1067` FOREIGN KEY (`purchased_id`) REFERENCES `mgk3_downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_downloadable_link_title`
  ADD CONSTRAINT `MGK3_DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `mgk3_downloadable_link` (`link_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_downloadable_sample`
  ADD CONSTRAINT `MGK3_DL_SAMPLE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_downloadable_sample_title`
  ADD CONSTRAINT `MGK3_DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `mgk3_downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_attribute`
  ADD CONSTRAINT `MGK3_EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mgk3_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_attribute_group`
  ADD CONSTRAINT `MGK3_EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `mgk3_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_attribute_label`
  ADD CONSTRAINT `MGK3_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_attribute_option`
  ADD CONSTRAINT `MGK3_EAV_ATTR_OPT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_attribute_option_swatch`
  ADD CONSTRAINT `MGK3_EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mgk3_eav_attribute_option` (`option_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_attribute_option_value`
  ADD CONSTRAINT `MGK3_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `mgk3_eav_attribute_option` (`option_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_attribute_set`
  ADD CONSTRAINT `MGK3_EAV_ATTR_SET_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mgk3_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_entity`
  ADD CONSTRAINT `MGK3_EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mgk3_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_entity_attribute`
  ADD CONSTRAINT `MGK3_EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `mgk3_eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTT_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_entity_datetime`
  ADD CONSTRAINT `MGK3_EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mgk3_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_entity_decimal`
  ADD CONSTRAINT `MGK3_EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mgk3_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_entity_int`
  ADD CONSTRAINT `MGK3_EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTT_INT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mgk3_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_entity_store`
  ADD CONSTRAINT `MGK3_EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTT_STORE_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mgk3_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_entity_text`
  ADD CONSTRAINT `MGK3_EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTT_TEXT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mgk3_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_entity_varchar`
  ADD CONSTRAINT `MGK3_EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_eav_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mgk3_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_form_element`
  ADD CONSTRAINT `MGK3_EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `mgk3_eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `MGK3_EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `mgk3_eav_form_type` (`type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_form_fieldset`
  ADD CONSTRAINT `MGK3_EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `mgk3_eav_form_type` (`type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_form_fieldset_label`
  ADD CONSTRAINT `MGK3_EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `mgk3_eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_form_type`
  ADD CONSTRAINT `MGK3_EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_eav_form_type_entity`
  ADD CONSTRAINT `MGK3_EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `mgk3_eav_form_type` (`type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `mgk3_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_googleoptimizer_code`
  ADD CONSTRAINT `MGK3_GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_integration`
  ADD CONSTRAINT `MGK3_INTEGRATION_CONSUMER_ID_MGK3_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `mgk3_oauth_consumer` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_layout_link`
  ADD CONSTRAINT `MGK3_LAYOUT_LINK_LAYOUT_UPDATE_ID_LAYOUT_UPDATE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `mgk3_layout_update` (`layout_update_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_LAYOUT_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_LAYOUT_LINK_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `mgk3_theme` (`theme_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_newsletter_problem`
  ADD CONSTRAINT `MGK3_NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `mgk3_newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `mgk3_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_newsletter_queue`
  ADD CONSTRAINT `MGK3_NLTTR_QUEUE_TEMPLATE_ID_NLTTR_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `mgk3_newsletter_template` (`template_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_newsletter_queue_link`
  ADD CONSTRAINT `FK_872527E765CDA81F7041AFC298FDBF09` FOREIGN KEY (`subscriber_id`) REFERENCES `mgk3_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `mgk3_newsletter_queue` (`queue_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_newsletter_queue_store_link`
  ADD CONSTRAINT `MGK3_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_NLTTR_QUEUE_STORE_LNK_QUEUE_ID_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `mgk3_newsletter_queue` (`queue_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_newsletter_subscriber`
  ADD CONSTRAINT `MGK3_NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_oauth_nonce`
  ADD CONSTRAINT `MGK3_OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `mgk3_oauth_consumer` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_oauth_token`
  ADD CONSTRAINT `MGK3_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `mgk3_admin_user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `mgk3_oauth_consumer` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_paypal_billing_agreement`
  ADD CONSTRAINT `MGK3_PAYPAL_BILLING_AGREEMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `MGK3_PAYPAL_BILLING_AGRT_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_paypal_billing_agreement_order`
  ADD CONSTRAINT `FK_1AB8A7D268A89EC0FF19ED4F783EDFC1` FOREIGN KEY (`agreement_id`) REFERENCES `mgk3_paypal_billing_agreement` (`agreement_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_PAYPAL_BILLING_AGRT_ORDER_ORDER_ID_SALES_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `mgk3_sales_order` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_paypal_cert`
  ADD CONSTRAINT `MGK3_PAYPAL_CERT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_paypal_settlement_report_row`
  ADD CONSTRAINT `FK_9BEB1983213188304DD3EBF502388542` FOREIGN KEY (`report_id`) REFERENCES `mgk3_paypal_settlement_report` (`report_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_persistent_session`
  ADD CONSTRAINT `MGK3_PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_product_alert_price`
  ADD CONSTRAINT `MGK3_PRD_ALERT_PRICE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_product_alert_stock`
  ADD CONSTRAINT `MGK3_PRD_ALERT_STOCK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_quote`
  ADD CONSTRAINT `MGK3_QUOTE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_quote_address`
  ADD CONSTRAINT `MGK3_QUOTE_ADDRESS_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `mgk3_quote` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_quote_address_item`
  ADD CONSTRAINT `MGK3_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `mgk3_quote_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_QUOTE_ADDR_ITEM_PARENT_ITEM_ID_QUOTE_ADDR_ITEM_ADDR_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `mgk3_quote_address_item` (`address_item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_QUOTE_ADDR_ITEM_QUOTE_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `mgk3_quote_address` (`address_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_quote_id_mask`
  ADD CONSTRAINT `MGK3_QUOTE_ID_MASK_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `mgk3_quote` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_quote_item`
  ADD CONSTRAINT `MGK3_QUOTE_ITEM_PARENT_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `mgk3_quote_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_QUOTE_ITEM_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `mgk3_quote` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_QUOTE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_quote_item_option`
  ADD CONSTRAINT `MGK3_QUOTE_ITEM_OPTION_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `mgk3_quote_item` (`item_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_quote_payment`
  ADD CONSTRAINT `MGK3_QUOTE_PAYMENT_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `mgk3_quote` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_quote_shipping_rate`
  ADD CONSTRAINT `MGK3_QUOTE_SHIPPING_RATE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`address_id`) REFERENCES `mgk3_quote_address` (`address_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_rating`
  ADD CONSTRAINT `MGK3_RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_rating_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_rating_option`
  ADD CONSTRAINT `MGK3_RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `mgk3_rating` (`rating_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_rating_option_vote`
  ADD CONSTRAINT `MGK3_RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `mgk3_rating_option` (`option_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `mgk3_review` (`review_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_rating_option_vote_aggregated`
  ADD CONSTRAINT `MGK3_RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `mgk3_rating` (`rating_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_rating_store`
  ADD CONSTRAINT `MGK3_RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `mgk3_rating` (`rating_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_RATING_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_rating_title`
  ADD CONSTRAINT `MGK3_RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `mgk3_rating` (`rating_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_RATING_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_report_compared_product_index`
  ADD CONSTRAINT `MGK3_REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_report_event`
  ADD CONSTRAINT `MGK3_REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `mgk3_report_event_types` (`event_type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REPORT_EVENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_report_viewed_product_aggregated_daily`
  ADD CONSTRAINT `MGK3_REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REPORT_VIEWED_PRD_AGGRED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_report_viewed_product_aggregated_monthly`
  ADD CONSTRAINT `FK_E8D1373756169B43CBCE7352BE6CFFBE` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REPORT_VIEWED_PRD_AGGRED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_report_viewed_product_aggregated_yearly`
  ADD CONSTRAINT `MGK3_REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REPORT_VIEWED_PRD_AGGRED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_report_viewed_product_index`
  ADD CONSTRAINT `MGK3_REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_review`
  ADD CONSTRAINT `MGK3_REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_review_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `mgk3_review_status` (`status_id`) ON DELETE NO ACTION;

ALTER TABLE `mgk3_review_detail`
  ADD CONSTRAINT `MGK3_REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `MGK3_REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `mgk3_review` (`review_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REVIEW_DETAIL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_review_entity_summary`
  ADD CONSTRAINT `MGK3_REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_review_store`
  ADD CONSTRAINT `MGK3_REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `mgk3_review` (`review_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_REVIEW_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_bestsellers_aggregated_daily`
  ADD CONSTRAINT `MGK3_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_bestsellers_aggregated_monthly`
  ADD CONSTRAINT `MGK3_SALES_BESTSELLERS_AGGRED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_bestsellers_aggregated_yearly`
  ADD CONSTRAINT `MGK3_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_creditmemo`
  ADD CONSTRAINT `MGK3_SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mgk3_sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_creditmemo_comment`
  ADD CONSTRAINT `MGK3_SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_creditmemo` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_creditmemo_item`
  ADD CONSTRAINT `MGK3_SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_creditmemo` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_invoice`
  ADD CONSTRAINT `MGK3_SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mgk3_sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALES_INVOICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_invoice_comment`
  ADD CONSTRAINT `MGK3_SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_invoice` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_invoice_item`
  ADD CONSTRAINT `MGK3_SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_invoice` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_invoiced_aggregated`
  ADD CONSTRAINT `MGK3_SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_invoiced_aggregated_order`
  ADD CONSTRAINT `MGK3_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_order`
  ADD CONSTRAINT `MGK3_SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `MGK3_SALES_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_order_address`
  ADD CONSTRAINT `MGK3_SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_order` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_order_aggregated_created`
  ADD CONSTRAINT `MGK3_SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_order_aggregated_updated`
  ADD CONSTRAINT `MGK3_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_MGK3_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_order_item`
  ADD CONSTRAINT `MGK3_SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mgk3_sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_order_payment`
  ADD CONSTRAINT `MGK3_SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_order` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_order_status_history`
  ADD CONSTRAINT `MGK3_SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_order` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_order_status_label`
  ADD CONSTRAINT `MGK3_SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `mgk3_sales_order_status` (`status`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_order_status_state`
  ADD CONSTRAINT `MGK3_SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `mgk3_sales_order_status` (`status`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_order_tax_item`
  ADD CONSTRAINT `FK_83A5931E6D31A53A9D41DE69A8415D84` FOREIGN KEY (`associated_item_id`) REFERENCES `mgk3_sales_order_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `mgk3_sales_order_item` (`item_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `mgk3_sales_order_tax` (`tax_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_payment_transaction`
  ADD CONSTRAINT `FK_34A46029C3218650E089D9E6AA46E6C8` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FB1E5F6A3D02C1E451815A90D87DFADE` FOREIGN KEY (`payment_id`) REFERENCES `mgk3_sales_order_payment` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mgk3_sales_order` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_refunded_aggregated`
  ADD CONSTRAINT `MGK3_SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_refunded_aggregated_order`
  ADD CONSTRAINT `MGK3_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_sequence_profile`
  ADD CONSTRAINT `MGK3_SALES_SEQUENCE_PROFILE_META_ID_SALES_SEQUENCE_META_META_ID` FOREIGN KEY (`meta_id`) REFERENCES `mgk3_sales_sequence_meta` (`meta_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_shipment`
  ADD CONSTRAINT `MGK3_SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `mgk3_sales_order` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALES_SHIPMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_shipment_comment`
  ADD CONSTRAINT `MGK3_SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_shipment` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_shipment_item`
  ADD CONSTRAINT `MGK3_SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_shipment` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_shipment_track`
  ADD CONSTRAINT `MGK3_SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `mgk3_sales_shipment` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sales_shipping_aggregated`
  ADD CONSTRAINT `MGK3_SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_sales_shipping_aggregated_order`
  ADD CONSTRAINT `MGK3_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL;

ALTER TABLE `mgk3_salesrule_coupon`
  ADD CONSTRAINT `MGK3_SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mgk3_salesrule` (`rule_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_salesrule_coupon_aggregated`
  ADD CONSTRAINT `MGK3_SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_salesrule_coupon_aggregated_order`
  ADD CONSTRAINT `MGK3_SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_salesrule_coupon_aggregated_updated`
  ADD CONSTRAINT `FK_6C3A3678E3576613EF8DC515B44E3B30` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_salesrule_coupon_usage`
  ADD CONSTRAINT `MGK3_SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `mgk3_salesrule_coupon` (`coupon_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALESRULE_COUPON_USAGE_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_salesrule_customer`
  ADD CONSTRAINT `MGK3_SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mgk3_salesrule` (`rule_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_salesrule_customer_group`
  ADD CONSTRAINT `MGK3_SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `mgk3_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mgk3_salesrule` (`rule_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_salesrule_label`
  ADD CONSTRAINT `MGK3_SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mgk3_salesrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALESRULE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_salesrule_product_attribute`
  ADD CONSTRAINT `MGK3_SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `mgk3_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALESRULE_PRD_ATTR_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mgk3_salesrule` (`rule_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_salesrule_website`
  ADD CONSTRAINT `MGK3_SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `mgk3_salesrule` (`rule_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SALESRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_search_query`
  ADD CONSTRAINT `MGK3_SEARCH_QUERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_search_synonyms`
  ADD CONSTRAINT `MGK3_SEARCH_SYNONYMS_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_SEARCH_SYNONYMS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_sitemap`
  ADD CONSTRAINT `MGK3_SITEMAP_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_store`
  ADD CONSTRAINT `MGK3_STORE_GROUP_ID_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `mgk3_store_group` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_store_group`
  ADD CONSTRAINT `MGK3_STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_tax_calculation`
  ADD CONSTRAINT `MGK3_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `mgk3_tax_class` (`class_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `mgk3_tax_class` (`class_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `mgk3_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `mgk3_tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_tax_calculation_rate_title`
  ADD CONSTRAINT `FK_F16F644BAB267462704608B2A5606990` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `mgk3_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_tax_order_aggregated_created`
  ADD CONSTRAINT `MGK3_TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_tax_order_aggregated_updated`
  ADD CONSTRAINT `MGK3_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_MGK3_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_theme_file`
  ADD CONSTRAINT `MGK3_THEME_FILE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `mgk3_theme` (`theme_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_translation`
  ADD CONSTRAINT `MGK3_TRANSLATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_ui_bookmark`
  ADD CONSTRAINT `MGK3_UI_BOOKMARK_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `mgk3_admin_user` (`user_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_variable_value`
  ADD CONSTRAINT `MGK3_VARIABLE_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_VARIABLE_VALUE_VARIABLE_ID_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `mgk3_variable` (`variable_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_vault_payment_token`
  ADD CONSTRAINT `MGK3_VAULT_PAYMENT_TOKEN_CSTR_ID_MGK3_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_vault_payment_token_order_payment_link`
  ADD CONSTRAINT `FK_9DDDB313998578BE4AC6CAA0A85DD75C` FOREIGN KEY (`payment_token_id`) REFERENCES `mgk3_vault_payment_token` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F2B3983591CCBE38509B9B3399D03DB2` FOREIGN KEY (`order_payment_id`) REFERENCES `mgk3_sales_order_payment` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_weee_tax`
  ADD CONSTRAINT `MGK3_WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `mgk3_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `mgk3_directory_country` (`country_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `mgk3_store_website` (`website_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_widget_instance`
  ADD CONSTRAINT `MGK3_WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `mgk3_theme` (`theme_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_widget_instance_page`
  ADD CONSTRAINT `FK_3778D336435BAFAE5B95A2034AA5DFDC` FOREIGN KEY (`instance_id`) REFERENCES `mgk3_widget_instance` (`instance_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_widget_instance_page_layout`
  ADD CONSTRAINT `FK_76382EFC6FFA8BCD022523F125270837` FOREIGN KEY (`page_id`) REFERENCES `mgk3_widget_instance_page` (`page_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E19909A9FE41E9C0B8D9287D9D2905F1` FOREIGN KEY (`layout_update_id`) REFERENCES `mgk3_layout_update` (`layout_update_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_wishlist`
  ADD CONSTRAINT `MGK3_WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `mgk3_customer_entity` (`entity_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_wishlist_item`
  ADD CONSTRAINT `MGK3_WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `mgk3_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `MGK3_WISHLIST_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `mgk3_store` (`store_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `MGK3_WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `mgk3_wishlist` (`wishlist_id`) ON DELETE CASCADE;

ALTER TABLE `mgk3_wishlist_item_option`
  ADD CONSTRAINT `FK_5B911879575538E6B9C077B194431722` FOREIGN KEY (`wishlist_item_id`) REFERENCES `mgk3_wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */; 
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-16 16:37:20 GMT