/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : lawmrc

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 21/12/2019 18:28:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `a_id` int(11) NOT NULL,
  `a_answer` varchar(255) NOT NULL,
  `q_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `k_id` int(11) NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `q_id` (`q_id`),
  KEY `c_id` (`c_id`),
  KEY `k_id` (`k_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`q_id`) REFERENCES `question` (`q_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `crawl1` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`k_id`) REFERENCES `keyword` (`k_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
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

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add answer', 7, 'add_answer');
INSERT INTO `auth_permission` VALUES (26, 'Can change answer', 7, 'change_answer');
INSERT INTO `auth_permission` VALUES (27, 'Can delete answer', 7, 'delete_answer');
INSERT INTO `auth_permission` VALUES (28, 'Can view answer', 7, 'view_answer');
INSERT INTO `auth_permission` VALUES (29, 'Can add crawl', 8, 'add_crawl');
INSERT INTO `auth_permission` VALUES (30, 'Can change crawl', 8, 'change_crawl');
INSERT INTO `auth_permission` VALUES (31, 'Can delete crawl', 8, 'delete_crawl');
INSERT INTO `auth_permission` VALUES (32, 'Can view crawl', 8, 'view_crawl');
INSERT INTO `auth_permission` VALUES (33, 'Can add keyword', 9, 'add_keyword');
INSERT INTO `auth_permission` VALUES (34, 'Can change keyword', 9, 'change_keyword');
INSERT INTO `auth_permission` VALUES (35, 'Can delete keyword', 9, 'delete_keyword');
INSERT INTO `auth_permission` VALUES (36, 'Can view keyword', 9, 'view_keyword');
INSERT INTO `auth_permission` VALUES (37, 'Can add question', 10, 'add_question');
INSERT INTO `auth_permission` VALUES (38, 'Can change question', 10, 'change_question');
INSERT INTO `auth_permission` VALUES (39, 'Can delete question', 10, 'delete_question');
INSERT INTO `auth_permission` VALUES (40, 'Can view question', 10, 'view_question');
INSERT INTO `auth_permission` VALUES (41, 'Can add user', 11, 'add_user');
INSERT INTO `auth_permission` VALUES (42, 'Can change user', 11, 'change_user');
INSERT INTO `auth_permission` VALUES (43, 'Can delete user', 11, 'delete_user');
INSERT INTO `auth_permission` VALUES (44, 'Can view user', 11, 'view_user');
INSERT INTO `auth_permission` VALUES (45, 'Can add auth group', 12, 'add_authgroup');
INSERT INTO `auth_permission` VALUES (46, 'Can change auth group', 12, 'change_authgroup');
INSERT INTO `auth_permission` VALUES (47, 'Can delete auth group', 12, 'delete_authgroup');
INSERT INTO `auth_permission` VALUES (48, 'Can view auth group', 12, 'view_authgroup');
INSERT INTO `auth_permission` VALUES (49, 'Can add auth group permissions', 13, 'add_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (50, 'Can change auth group permissions', 13, 'change_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (51, 'Can delete auth group permissions', 13, 'delete_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (52, 'Can view auth group permissions', 13, 'view_authgrouppermissions');
INSERT INTO `auth_permission` VALUES (53, 'Can add auth permission', 14, 'add_authpermission');
INSERT INTO `auth_permission` VALUES (54, 'Can change auth permission', 14, 'change_authpermission');
INSERT INTO `auth_permission` VALUES (55, 'Can delete auth permission', 14, 'delete_authpermission');
INSERT INTO `auth_permission` VALUES (56, 'Can view auth permission', 14, 'view_authpermission');
INSERT INTO `auth_permission` VALUES (57, 'Can add auth user', 15, 'add_authuser');
INSERT INTO `auth_permission` VALUES (58, 'Can change auth user', 15, 'change_authuser');
INSERT INTO `auth_permission` VALUES (59, 'Can delete auth user', 15, 'delete_authuser');
INSERT INTO `auth_permission` VALUES (60, 'Can view auth user', 15, 'view_authuser');
INSERT INTO `auth_permission` VALUES (61, 'Can add auth user groups', 16, 'add_authusergroups');
INSERT INTO `auth_permission` VALUES (62, 'Can change auth user groups', 16, 'change_authusergroups');
INSERT INTO `auth_permission` VALUES (63, 'Can delete auth user groups', 16, 'delete_authusergroups');
INSERT INTO `auth_permission` VALUES (64, 'Can view auth user groups', 16, 'view_authusergroups');
INSERT INTO `auth_permission` VALUES (65, 'Can add auth user user permissions', 17, 'add_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (66, 'Can change auth user user permissions', 17, 'change_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (67, 'Can delete auth user user permissions', 17, 'delete_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (68, 'Can view auth user user permissions', 17, 'view_authuseruserpermissions');
INSERT INTO `auth_permission` VALUES (69, 'Can add django admin log', 18, 'add_djangoadminlog');
INSERT INTO `auth_permission` VALUES (70, 'Can change django admin log', 18, 'change_djangoadminlog');
INSERT INTO `auth_permission` VALUES (71, 'Can delete django admin log', 18, 'delete_djangoadminlog');
INSERT INTO `auth_permission` VALUES (72, 'Can view django admin log', 18, 'view_djangoadminlog');
INSERT INTO `auth_permission` VALUES (73, 'Can add django content type', 19, 'add_djangocontenttype');
INSERT INTO `auth_permission` VALUES (74, 'Can change django content type', 19, 'change_djangocontenttype');
INSERT INTO `auth_permission` VALUES (75, 'Can delete django content type', 19, 'delete_djangocontenttype');
INSERT INTO `auth_permission` VALUES (76, 'Can view django content type', 19, 'view_djangocontenttype');
INSERT INTO `auth_permission` VALUES (77, 'Can add django migrations', 20, 'add_djangomigrations');
INSERT INTO `auth_permission` VALUES (78, 'Can change django migrations', 20, 'change_djangomigrations');
INSERT INTO `auth_permission` VALUES (79, 'Can delete django migrations', 20, 'delete_djangomigrations');
INSERT INTO `auth_permission` VALUES (80, 'Can view django migrations', 20, 'view_djangomigrations');
INSERT INTO `auth_permission` VALUES (81, 'Can add django session', 21, 'add_djangosession');
INSERT INTO `auth_permission` VALUES (82, 'Can change django session', 21, 'change_djangosession');
INSERT INTO `auth_permission` VALUES (83, 'Can delete django session', 21, 'delete_djangosession');
INSERT INTO `auth_permission` VALUES (84, 'Can view django session', 21, 'view_djangosession');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
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

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
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

-- ----------------------------
-- Table structure for crawl
-- ----------------------------
DROP TABLE IF EXISTS `crawl`;
CREATE TABLE `crawl` (
  `c2_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `md5` varchar(255) NOT NULL,
  `k_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`c2_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crawl
-- ----------------------------
BEGIN;
INSERT INTO `crawl` VALUES (13, '胡浩伟、孔凌云等犯组织、领导传销活动罪张传文、杨文科等犯组织、领导传销活动罪、抢劫罪等麻冬会犯组织、领导传销活动罪、非法拘禁罪郭本宇、陈小强等犯抢劫罪、非法拘禁罪程宁、李金福等犯非法拘禁罪二审刑事判决书', '', '');
INSERT INTO `crawl` VALUES (14, '左晓东等五人故意杀人、抢劫、敲诈勒索一审刑事判决书', '', '');
INSERT INTO `crawl` VALUES (15, '黄岳彬抢劫一审刑事判决书', '', '');
INSERT INTO `crawl` VALUES (16, '被告人彭廷维、彭彪、彭显兵、杨志、杨波、王丹犯抢劫罪、被告人彭廷维、彭显兵、彭彪犯盗窃罪、被告人彭治安、彭显良、彭应红犯掩饰、隐瞒犯罪所得罪，附带民事诉讼原告人', '', '');
INSERT INTO `crawl` VALUES (17, '胡浩伟、孔凌云等犯组织、领导传销活动罪张传文、杨文科等犯组织、领导传销活动罪、抢劫罪等麻冬会犯组织、领导传销活动罪、非法拘禁罪郭本宇、陈小强等犯抢劫罪、非法拘禁罪程宁、李金福等犯非法拘禁罪二审刑事判决书', '2e3cb7815dc41fe8a9c19a336ad4f89e', '');
INSERT INTO `crawl` VALUES (18, '左晓东等五人故意杀人、抢劫、敲诈勒索一审刑事判决书', 'dfc8694686be065d757473cc4d6fe5ca', '');
INSERT INTO `crawl` VALUES (19, '黄岳彬抢劫一审刑事判决书', '16173e67ee4ef65a059adba71eedd9f4', '');
INSERT INTO `crawl` VALUES (20, '被告人彭廷维、彭彪、彭显兵、杨志、杨波、王丹犯抢劫罪、被告人彭廷维、彭显兵、彭彪犯盗窃罪、被告人彭治安、彭显良、彭应红犯掩饰、隐瞒犯罪所得罪，附带民事诉讼原告人', '1a91cabe858a76377b708cbc0445520a', '');
INSERT INTO `crawl` VALUES (21, '段志强等故意伤害、抢劫案', '4f0eb1325c687cc4d6a363fedc6c35fc', '');
INSERT INTO `crawl` VALUES (22, '王正国、姚昆等与李涛抢劫罪二审刑事判决书', '3adbd397f66d8208d9365117d4c6ac88', '');
INSERT INTO `crawl` VALUES (23, '胡浩伟、孔凌云等犯组织、领导传销活动罪张传文、杨文科等犯组织、领导传销活动罪、抢劫罪等麻冬会犯组织、领导传销活动罪、非法拘禁罪郭本宇、陈小强等犯抢劫罪、非法拘禁罪程宁、李金福等犯非法拘禁罪二审刑事判决书', '2e3cb7815dc41fe8a9c19a336ad4f89e', '抢劫');
INSERT INTO `crawl` VALUES (24, '左晓东等五人故意杀人、抢劫、敲诈勒索一审刑事判决书', 'dfc8694686be065d757473cc4d6fe5ca', '抢劫');
INSERT INTO `crawl` VALUES (25, '黄岳彬抢劫一审刑事判决书', '16173e67ee4ef65a059adba71eedd9f4', '抢劫');
INSERT INTO `crawl` VALUES (26, '胡浩伟、孔凌云等犯组织、领导传销活动罪张传文、杨文科等犯组织、领导传销活动罪、抢劫罪等麻冬会犯组织、领导传销活动罪、非法拘禁罪郭本宇、陈小强等犯抢劫罪、非法拘禁罪程宁、李金福等犯非法拘禁罪二审刑事判决书', '2e3cb7815dc41fe8a9c19a336ad4f89e', '抢劫');
INSERT INTO `crawl` VALUES (27, '左晓东等五人故意杀人、抢劫、敲诈勒索一审刑事判决书', 'dfc8694686be065d757473cc4d6fe5ca', '抢劫');
INSERT INTO `crawl` VALUES (28, '黄岳彬抢劫一审刑事判决书', '16173e67ee4ef65a059adba71eedd9f4', '抢劫');
INSERT INTO `crawl` VALUES (29, '胡浩伟、孔凌云等犯组织、领导传销活动罪张传文、杨文科等犯组织、领导传销活动罪、抢劫罪等麻冬会犯组织、领导传销活动罪、非法拘禁罪郭本宇、陈小强等犯抢劫罪、非法拘禁罪程宁、李金福等犯非法拘禁罪二审刑事判决书', '2e3cb7815dc41fe8a9c19a336ad4f89e', '抢劫');
INSERT INTO `crawl` VALUES (30, '胡浩伟、孔凌云等犯组织、领导传销活动罪张传文、杨文科等犯组织、领导传销活动罪、抢劫罪等麻冬会犯组织、领导传销活动罪、非法拘禁罪郭本宇、陈小强等犯抢劫罪、非法拘禁罪程宁、李金福等犯非法拘禁罪二审刑事判决书', '2e3cb7815dc41fe8a9c19a336ad4f89e', '抢劫');
INSERT INTO `crawl` VALUES (31, '左晓东等五人故意杀人、抢劫、敲诈勒索一审刑事判决书', 'dfc8694686be065d757473cc4d6fe5ca', '抢劫');
INSERT INTO `crawl` VALUES (32, '左晓东等五人故意杀人、抢劫、敲诈勒索一审刑事判决书', 'dfc8694686be065d757473cc4d6fe5ca', '抢劫');
COMMIT;

-- ----------------------------
-- Table structure for crawl1
-- ----------------------------
DROP TABLE IF EXISTS `crawl1`;
CREATE TABLE `crawl1` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `k_id` int(11) NOT NULL,
  `c_path` varchar(255) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `k_id` (`k_id`),
  CONSTRAINT `crawl1_ibfk_1` FOREIGN KEY (`k_id`) REFERENCES `keyword` (`k_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'user', 'answer');
INSERT INTO `django_content_type` VALUES (12, 'user', 'authgroup');
INSERT INTO `django_content_type` VALUES (13, 'user', 'authgrouppermissions');
INSERT INTO `django_content_type` VALUES (14, 'user', 'authpermission');
INSERT INTO `django_content_type` VALUES (15, 'user', 'authuser');
INSERT INTO `django_content_type` VALUES (16, 'user', 'authusergroups');
INSERT INTO `django_content_type` VALUES (17, 'user', 'authuseruserpermissions');
INSERT INTO `django_content_type` VALUES (8, 'user', 'crawl');
INSERT INTO `django_content_type` VALUES (18, 'user', 'djangoadminlog');
INSERT INTO `django_content_type` VALUES (19, 'user', 'djangocontenttype');
INSERT INTO `django_content_type` VALUES (20, 'user', 'djangomigrations');
INSERT INTO `django_content_type` VALUES (21, 'user', 'djangosession');
INSERT INTO `django_content_type` VALUES (9, 'user', 'keyword');
INSERT INTO `django_content_type` VALUES (10, 'user', 'question');
INSERT INTO `django_content_type` VALUES (11, 'user', 'user');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-12-17 12:31:08.865555');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-12-17 12:31:09.470942');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-12-17 12:31:11.262164');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-12-17 12:31:11.627565');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-12-17 12:31:11.653096');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-12-17 12:31:13.342581');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-12-17 12:31:13.611184');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-12-17 12:31:13.932006');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-12-17 12:31:13.968914');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-12-17 12:31:14.177350');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-12-17 12:31:14.184645');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-12-17 12:31:14.207269');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-12-17 12:31:14.380805');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-12-17 12:31:14.580279');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2019-12-17 12:31:14.882460');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2019-12-17 12:31:14.909387');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2019-12-17 12:31:14.981386');
INSERT INTO `django_migrations` VALUES (18, 'user', '0001_initial', '2019-12-17 12:58:57.406310');
INSERT INTO `django_migrations` VALUES (19, 'user', '0002_authgroup_authgrouppermissions_authpermission_authuser_authusergroups_authuseruserpermissions_django', '2019-12-19 00:07:05.625858');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('6mtdu5q4paok9pyvvdub9cwdzxg9qp5s', 'Mjk0MDk3OGQ3MDIwOWE5ZDcwMGFmNjQxNWNlYjIwZjk3YWI2MTdmYTp7InVfaWQiOjF9', '2019-12-31 12:41:52.774634');
INSERT INTO `django_session` VALUES ('fxgrmln9u6jp5k2ccpqy9vkvjfrthxa4', 'Mjk0MDk3OGQ3MDIwOWE5ZDcwMGFmNjQxNWNlYjIwZjk3YWI2MTdmYTp7InVfaWQiOjF9', '2019-12-31 12:51:42.949957');
INSERT INTO `django_session` VALUES ('h3dxzesfl1bqpusibliq43gavnw5hkzs', 'Mjk0MDk3OGQ3MDIwOWE5ZDcwMGFmNjQxNWNlYjIwZjk3YWI2MTdmYTp7InVfaWQiOjF9', '2019-12-31 12:50:08.010830');
INSERT INTO `django_session` VALUES ('k9s5lyjc2o5a7k5zvjdbd5ei6mpzg1hz', 'Mjk0MDk3OGQ3MDIwOWE5ZDcwMGFmNjQxNWNlYjIwZjk3YWI2MTdmYTp7InVfaWQiOjF9', '2019-12-31 12:32:15.056257');
INSERT INTO `django_session` VALUES ('lwkuuqzxjxuep9dp9nebu8cfegdbqpxg', 'Mjk0MDk3OGQ3MDIwOWE5ZDcwMGFmNjQxNWNlYjIwZjk3YWI2MTdmYTp7InVfaWQiOjF9', '2020-01-02 00:11:52.017974');
INSERT INTO `django_session` VALUES ('v5636luig5a70kumgz0vz9t8n54fs2lp', 'Mjk0MDk3OGQ3MDIwOWE5ZDcwMGFmNjQxNWNlYjIwZjk3YWI2MTdmYTp7InVfaWQiOjF9', '2019-12-31 12:37:42.262082');
INSERT INTO `django_session` VALUES ('vul3p2trcufz60iyo17g10clyevqeie8', 'Mjk0MDk3OGQ3MDIwOWE5ZDcwMGFmNjQxNWNlYjIwZjk3YWI2MTdmYTp7InVfaWQiOjF9', '2020-01-04 08:27:39.267451');
INSERT INTO `django_session` VALUES ('x03h253aemc6v9tn5hfugbqdgse6yk65', 'Mjk0MDk3OGQ3MDIwOWE5ZDcwMGFmNjQxNWNlYjIwZjk3YWI2MTdmYTp7InVfaWQiOjF9', '2020-01-01 09:34:08.250963');
INSERT INTO `django_session` VALUES ('zagqf8pv0p255v6bze3r9udrremzsomj', 'Mjk0MDk3OGQ3MDIwOWE5ZDcwMGFmNjQxNWNlYjIwZjk3YWI2MTdmYTp7InVfaWQiOjF9', '2019-12-31 12:39:38.631043');
COMMIT;

-- ----------------------------
-- Table structure for keyword
-- ----------------------------
DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `k_id` int(11) NOT NULL AUTO_INCREMENT,
  `k_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`k_id`),
  KEY `k_keyword` (`k_keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of keyword
-- ----------------------------
BEGIN;
INSERT INTO `keyword` VALUES (4, '左晓东等五人故意杀人、抢劫、敲诈勒索一审刑事判决书');
INSERT INTO `keyword` VALUES (1, '抢劫');
INSERT INTO `keyword` VALUES (2, '抢劫');
INSERT INTO `keyword` VALUES (11, '抢劫');
INSERT INTO `keyword` VALUES (12, '抢劫');
INSERT INTO `keyword` VALUES (13, '抢劫');
INSERT INTO `keyword` VALUES (14, '抢劫');
INSERT INTO `keyword` VALUES (15, '抢劫');
INSERT INTO `keyword` VALUES (16, '抢劫');
INSERT INTO `keyword` VALUES (17, '抢劫');
INSERT INTO `keyword` VALUES (18, '抢劫');
INSERT INTO `keyword` VALUES (19, '抢劫');
INSERT INTO `keyword` VALUES (20, '抢劫');
INSERT INTO `keyword` VALUES (21, '抢劫');
INSERT INTO `keyword` VALUES (22, '抢劫');
INSERT INTO `keyword` VALUES (23, '抢劫');
INSERT INTO `keyword` VALUES (24, '抢劫');
INSERT INTO `keyword` VALUES (25, '抢劫');
INSERT INTO `keyword` VALUES (26, '抢劫');
INSERT INTO `keyword` VALUES (27, '抢劫');
INSERT INTO `keyword` VALUES (28, '抢劫');
INSERT INTO `keyword` VALUES (7, '段志强等故意伤害、抢劫案');
INSERT INTO `keyword` VALUES (8, '王正国、姚昆等与李涛抢劫罪二审刑事判决书');
INSERT INTO `keyword` VALUES (3, '胡浩伟、孔凌云等犯组织、领导传销活动罪张传文、杨文科等犯组织、领导传销活动罪、抢劫罪等麻冬会犯组织、领导传销活动罪、非法拘禁罪郭本宇、陈小强等犯抢劫罪、非法拘禁罪程宁、李金福等犯非法拘禁罪二审刑事判决书');
INSERT INTO `keyword` VALUES (6, '被告人彭廷维、彭彪、彭显兵、杨志、杨波、王丹犯抢劫罪、被告人彭廷维、彭显兵、彭彪犯盗窃罪、被告人彭治安、彭显良、彭应红犯掩饰、隐瞒犯罪所得罪，附带民事诉讼原告人');
INSERT INTO `keyword` VALUES (10, '许立俊等抢劫、故意伤害案');
INSERT INTO `keyword` VALUES (9, '赵清益等犯抢劫罪，蒋俊犯非法持有枪支罪刑事判决书');
INSERT INTO `keyword` VALUES (5, '黄岳彬抢劫一审刑事判决书');
COMMIT;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_name` varchar(255) NOT NULL,
  `k_id` int(11) NOT NULL,
  PRIMARY KEY (`q_id`),
  KEY `k_id` (`k_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`k_id`) REFERENCES `keyword` (`k_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(255) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) NOT NULL,
  `u_password` varchar(255) NOT NULL,
  `u_email` varchar(255) NOT NULL,
  `u_phone` varchar(255) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'liu', '123456', 'a@mail.com', '13657845644');
INSERT INTO `user` VALUES (2, 'jiang', '123123', 'b@mail.com', '13657758966');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
