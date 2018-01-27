-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mx
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'普通用户'),(2,'白金');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,65),(2,1,66),(3,1,67),(4,1,68),(5,1,75),(6,1,76),(11,2,28),(12,2,29),(13,2,30),(14,2,31),(7,2,32),(9,2,33),(8,2,65),(10,2,66);
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 用户信息',6,'add_userprofile'),(17,'Can change 用户信息',6,'change_userprofile'),(18,'Can delete 用户信息',6,'delete_userprofile'),(19,'Can add 轮播图',7,'add_banner'),(20,'Can change 轮播图',7,'change_banner'),(21,'Can delete 轮播图',7,'delete_banner'),(22,'Can add 邮箱验证码',8,'add_emailverifyrecord'),(23,'Can change 邮箱验证码',8,'change_emailverifyrecord'),(24,'Can delete 邮箱验证码',8,'delete_emailverifyrecord'),(25,'Can add 视频',9,'add_video'),(26,'Can change 视频',9,'change_video'),(27,'Can delete 视频',9,'delete_video'),(28,'Can add 课程',10,'add_course'),(29,'Can change 课程',10,'change_course'),(30,'Can delete 课程',10,'delete_course'),(31,'Can add 课程资源',11,'add_courseresource'),(32,'Can change 课程资源',11,'change_courseresource'),(33,'Can delete 课程资源',11,'delete_courseresource'),(34,'Can add 章节',12,'add_lesson'),(35,'Can change 章节',12,'change_lesson'),(36,'Can delete 章节',12,'delete_lesson'),(37,'Can add 教师',13,'add_teacher'),(38,'Can change 教师',13,'change_teacher'),(39,'Can delete 教师',13,'delete_teacher'),(40,'Can add 城市',14,'add_citydict'),(41,'Can change 城市',14,'change_citydict'),(42,'Can delete 城市',14,'delete_citydict'),(43,'Can add 课程机构',15,'add_courseorg'),(44,'Can change 课程机构',15,'change_courseorg'),(45,'Can delete 课程机构',15,'delete_courseorg'),(46,'Can add 用户咨询',16,'add_userask'),(47,'Can change 用户咨询',16,'change_userask'),(48,'Can delete 用户咨询',16,'delete_userask'),(49,'Can add 用户课程',17,'add_usercourse'),(50,'Can change 用户课程',17,'change_usercourse'),(51,'Can delete 用户课程',17,'delete_usercourse'),(52,'Can add 用户收藏',18,'add_userfavorite'),(53,'Can change 用户收藏',18,'change_userfavorite'),(54,'Can delete 用户收藏',18,'delete_userfavorite'),(55,'Can add 课程评论',19,'add_coursecomments'),(56,'Can change 课程评论',19,'change_coursecomments'),(57,'Can delete 课程评论',19,'delete_coursecomments'),(58,'Can add 用户消息',20,'add_usermessage'),(59,'Can change 用户消息',20,'change_usermessage'),(60,'Can delete 用户消息',20,'delete_usermessage'),(61,'Can view log entry',1,'view_logentry'),(62,'Can view group',3,'view_group'),(63,'Can view permission',2,'view_permission'),(64,'Can view content type',4,'view_contenttype'),(65,'Can view 课程',10,'view_course'),(66,'Can view 课程资源',11,'view_courseresource'),(67,'Can view 章节',12,'view_lesson'),(68,'Can view 视频',9,'view_video'),(69,'Can view 课程评论',19,'view_coursecomments'),(70,'Can view 用户咨询',16,'view_userask'),(71,'Can view 用户课程',17,'view_usercourse'),(72,'Can view 用户收藏',18,'view_userfavorite'),(73,'Can view 用户消息',20,'view_usermessage'),(74,'Can view 城市',14,'view_citydict'),(75,'Can view 课程机构',15,'view_courseorg'),(76,'Can view 教师',13,'view_teacher'),(77,'Can view session',5,'view_session'),(78,'Can view 轮播图',7,'view_banner'),(79,'Can view 邮箱验证码',8,'view_emailverifyrecord'),(80,'Can view 用户信息',6,'view_userprofile'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can add User Setting',22,'add_usersettings'),(85,'Can change User Setting',22,'change_usersettings'),(86,'Can delete User Setting',22,'delete_usersettings'),(87,'Can add User Widget',23,'add_userwidget'),(88,'Can change User Widget',23,'change_userwidget'),(89,'Can delete User Widget',23,'delete_userwidget'),(90,'Can add log entry',24,'add_log'),(91,'Can change log entry',24,'change_log'),(92,'Can delete log entry',24,'delete_log'),(93,'Can view Bookmark',21,'view_bookmark'),(94,'Can view log entry',24,'view_log'),(95,'Can view User Setting',22,'view_usersettings'),(96,'Can view User Widget',23,'view_userwidget'),(97,'Can add captcha store',25,'add_captchastore'),(98,'Can change captcha store',25,'change_captchastore'),(99,'Can delete captcha store',25,'delete_captchastore'),(100,'Can view captcha store',25,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (69,'TUCL','tucl','96f8121d33ce7421ad3750e1bac8d202d1182e86','2018-01-15 21:43:09.904541'),(70,'PJYE','pjye','063f52cac33e6fcbeffb43102c6adda1a68a6fd5','2018-01-15 21:44:19.507507'),(72,'CAAW','caaw','28891cc63f3dfd5927db3d6d2c98add37386f8cc','2018-01-15 22:01:35.496764'),(73,'TAAJ','taaj','2bd0ca71c1215233df5d9195645444661e4ed90b','2018-01-16 00:16:36.428696'),(74,'TMVF','tmvf','13668d44488f5e74151aba4bdf97945ec0d958a4','2018-01-16 10:24:00.041916'),(75,'EBUJ','ebuj','796bc6f4c9da1162ca4172f6d4bb8778e0b49099','2018-01-16 10:25:27.456071'),(76,'YTBJ','ytbj','82b9b301333da17cfcf954734be2b52371a4b9a6','2018-01-16 10:25:36.909003'),(77,'MBXO','mbxo','b018fdc8c81f86e88efec3c8028eaa4e1904fef3','2018-01-16 10:25:43.151260'),(78,'TWQJ','twqj','c3b4941a5c854cfbd8b11ed833d2da74c9d76bd9','2018-01-16 10:25:56.042895'),(79,'CECM','cecm','3711d8db49fcc77c3550968ec24b29b3edd98b41','2018-01-16 10:25:59.740866'),(80,'KFKG','kfkg','ee4df6f891790381e8ba0e881d3f1d5da8a1ac6e','2018-01-16 13:18:52.889236'),(81,'GHTL','ghtl','50b39958a0b6f625a46376c614b954eacb8e74d6','2018-01-17 16:27:24.862065'),(82,'SZEJ','szej','b6e79993e88e440a63bbd83b3d65230613a57fb1','2018-01-17 18:23:26.716303');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(5) NOT NULL,
  `times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `you_can_learn` varchar(300) NOT NULL,
  `you_need_to_know` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_course_org_id_4d2c4aab_fk_organizat` (`course_org_id`),
  KEY `courses_course_teacher_id_846fa526_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'django','一种常见的web框架','Django是一个开放源代码的Web应用框架，由Python写成。采用了MVC的软件设计模式，即模型M，视图V和控制器C。它最初是被开发来用于管理劳伦斯出版集团旗下的一些以新闻内容为主的网站的，即是CMS（内容管理系统）软件。并于2005年7月在BSD许可证下发布。这套框架是以比利时的吉普赛爵士吉他手DjangoReinhardt来命名的。','cj',60,1,0,'courses/2018/01/django.jpg',6,'2018-01-17 16:33:00.000000',1,'后端开发','python',NULL,'','',0),(2,'瑜伽','练习瑜伽，柔软身体','【瑜珈简介】　　\r\n瑜伽一词，是从印度梵语yug或yuj而来，是一个发音，其含意为“一致”“结合”或“和谐”。瑜伽就是一个通过提升意识，帮助人类充分发挥潜能的体系。瑜伽 姿势运用古老而易于掌握的技巧，改善人们生理、心理、情感和精神方面的能力，是一种达到身体、心灵与精神和谐统一的运动方式。古印度人更相信人可以与天合一，他们以不同的瑜伽修炼方法融入日常生活而奉行不渝：道德、忘我的动作、稳定的头脑、宗教性的责任、无欲无求、冥想和宇宙的自然和创造。','zj',50,2,0,'courses/2018/01/瑜伽.jpg',1,'2018-01-19 22:56:00.000000',3,'后端开发','',3,'','',0),(3,'国学课','学习中国古典文化知识','国学，是以先秦经典及诸子百家学说为根基，涵盖了 两汉经学、 魏晋玄学、 隋唐道学、 宋明理学、 明清实学和同时期的先秦诗赋、 汉赋、 六朝骈文、 唐宋诗词、 元曲与 明清小说并历代史学等一套完整的文化、学术体系。中国历史上“国学”是指以“国子监”为首的官学，自 “ 西学东渐”后相对 西学而言泛指“中国传统思想文化学术”。','cj',120,4,6,'courses/2018/01/国学_T2YhV2r.jpg',2,'2018-01-19 22:58:00.000000',7,'后端开发','python',2,'学到顶天、立地、为往圣继绝学、为天下开太平，为国家富强而努力奋斗！','对中国历史有大概了解',0),(4,'English','英语口语','英语（English），属于印欧语系中日耳曼语族下的西日耳曼语支，是由古代从丹麦等斯堪的纳维亚半岛以及德国、荷兰及周边移民至不列颠群岛的盎格鲁、撒克逊和朱特部落的日耳曼人所说的语言演变而来，并通过英国的殖民活动传播到了世界各地。由于在历史上曾和多种民族语言接触，它的词汇从一元变为多元，语法从“多屈折”变为“少屈折”，语音也发生了规律性根据以英语作为母语的人数计算，英语是最多国家使用的官方语言，英语也是世界上最广泛的第二语言，也是欧盟的，最多国际组织和英联邦国家的官方语言，拥有世界第三位的母语使用者人数，仅少于汉语和西班牙语母语使用者人数。在19至20世纪的，英国和美国在文化、经济、军事、政治和科学在世界上的领先地位使得英语成为一种国际语言。如今，许多国际场合都使用英语做为沟通媒介。英语也是与电脑联系最密切的语言，大多数编程语言都与英语有联系，而且随着网络的使用，使英文的使用更普及。英语是联合国的工作语言之一','zj',30,0,0,'courses/2018/01/英语.jpg',2,'2018-01-19 23:00:00.000000',8,'后端开发','',NULL,'','',0),(5,'人工智能','机器学习和人工智能','如今，世界上许多顶尖的公司都置身于一场独一无二的竞赛中：赋予人工智能（AI）生命力。机器学习系统已经成为许多企业的核心，所以关于人工智能或神经网络升级的消息经常出现在我们的新闻中也就不足为奇了。此类消息的标题通常都是这样的：“人工智能打败了人类玩家”，或者“人工智能模仿人类语言”，甚至还有像“人工智能会利用机器学习来检测癌症”这样的标题。','gj',150,1,0,'courses/2018/01/智能.jpg',4,'2018-01-19 23:02:00.000000',9,'后端开发','python',2,'','',0),(6,'酒店管理','五星级酒店管理','随着市场经济的深入发展，旅游产业的兴起，社会需要大量熟悉酒店、餐饮企业管理方法及运作方式，具备较高服务技能与管理水平、具有良好职业道德的高技能人才。本专业培养德、智、体、美、劳全面发展的，具有酒店管理、酒店服务等基本知识，熟悉旅游行业现状，具备旅游服务技能，酒店各岗位服务技能、企业基层管理能力、社会交际能力，面向高星级酒店（宾馆、酒店）及餐饮企业管理、服务第一线的具有良好职业道德的高技能人才，能较好的满足酒店管理、服务的需要。','zj',200,0,0,'courses/2018/01/酒店.jpg',2,'2018-01-19 23:04:00.000000',5,'后端开发','',NULL,'','',0),(7,'OS','操作系统','<p>&nbsp; &nbsp; 操作系统（英语：Operating System，简称OS）是管理和控制计算机硬件与软件资源的计算机程序，是直接运行在“裸机”上的最基本的系统软件，任何其他软件都必须在操作系统的支持下才能运行。操 \r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;作系统是用户和计算机的接口，同时也是计算机硬件和其他软件的接口。操作系统的功能包括管理计算机系统的硬件、软件及数据资源，控制程序运行，改善人机界面，为其它应用软件提供支持等，使计算机系统所有资源最大限度地发挥作用，提供了各种形式的用户界面，使用户有一个好的工作环境，为其它软件的开发提供必要的服务和相应的接口。实际上，用户是不用接触操作系统的，操作系统管理着计算机硬件资源，同时按着应用程序的资源请求，为其分配资源，如：划分CPU时间，内存空间的开辟，调用打印机等</p>','zj',100,1,0,'courses/2018/01/os.jpg',4,'2018-01-19 23:06:00.000000',3,'后端开发','python',4,'阿斯蒂芬','阿斯蒂芬',0),(8,'登山','攀登珠穆朗玛','珠穆朗玛峰（珠峰）是喜马拉雅山脉的主峰，位于中国与尼泊尔边境线上，它的北部在中国西藏定日县境内（西坡在定日县扎西宗乡，东坡在定日县曲当乡，有珠峰大本营），南部在尼泊尔境内，而顶峰位于中国境内，是世界最高峰。是中国跨越四个县的珠穆朗玛峰自然保护区和尼泊尔国家公园的中心所在。\r\n       藏语中“珠穆”是女神的意思，“朗玛”是第三的意思。因为在珠穆朗玛峰的附近还有四座山峰，珠峰位居第三，所以称为珠穆朗玛峰。\r\n珠穆朗玛峰是世界海拔最高的山峰，按2005年中国国家测绘局测量的岩面高为8844.43米，尼泊尔则使用传统的雪盖高8848米（29029英尺），2010年起两国官方互相承认对方的测量数据。除了是海拔最高的山峰之外，它也是距离地心第五远的高峰[1]  。','gj',50,0,0,'courses/2018/01/珠峰.png',1,'2018-01-25 21:45:00.000000',7,'人生','珠峰',6,'敬畏自然，悟得人生道理','身体好，有毅力',1),(9,'动物世界','认识梅花鹿','梅花鹿（学名：Cervus nippon）是一种中型鹿，体长140-170厘米，肩高85-100厘米，成年体重100-150千克，雌鹿较小,雄鹿有角，一般四叉。背中央有暗褐色背线。尾短，背面黑色，腹面白色。夏毛棕黄色，遍布鲜明的白色梅花斑点，臀斑白色，故称“梅花鹿”。生活于森林边缘或山地草原地区。季节不同，栖息地也有所改变。雄鹿平时独居，发情交配时归群。晨昏活动，以青草树叶为食，好舔食盐碱。每胎1仔，幼仔身上有白色斑点。主要分布于中国，日本和俄罗斯。','zj',150,0,0,'courses/2018/01/鹿.png',1,'2018-01-25 21:51:00.000000',9,'动物','鹿',8,'爱护野生动物','美学功底',1),(10,'量子通信','量子卫星，加密无破解传输信息','这次量子保密通信与潘建伟的博士导师、奥利地科学院Anton Zeilinger教授合作完成。“墨子号”向北京附近的兴隆地面站和维也纳附近的格拉茨（Graz）地面站进行了量子纠缠分发，与两个地面站间各自产生一段密钥。接着，按照地面指令，“墨子号”给两段密钥进行逐位异或运算，将结果发送给其中一个地面站，由此，中欧两个距离长达7600公里的位点之间建立了密码。\r\n\r\n        此外，中国科学院还与奥地利科学院进行了洲际量子保密视频会议，采用128位高级加密标准（每秒刷新128位种子密钥表）。视频会议持续了75分钟，共传输约2GB数据，中奥双方交换了一段560kbit的量子密钥。','gj',500,0,0,'courses/2018/01/量子通信.png',4,'2018-01-25 21:55:00.000000',5,'技术','量子',4,'感知高端技术','量子力学基础',1),(11,'斯蒂芬','斯蒂芬','<p>斯蒂芬ass地方阿斯蒂芬<br/></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://127.0.0.1:8000/static/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/media/org/2018/01/zyjy.png\" title=\"zyjy.png\">zyjy.png</a></p><table><tbody><tr class=\"firstRow\"><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td></tr><tr><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td></tr><tr><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td></tr><tr><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td></tr><tr><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td></tr><tr><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td><td width=\"125\" valign=\"top\"><br/></td></tr></tbody></table><p><img src=\"/media/courses/ueditor/刺猬_20180127130051_907.png\" title=\"\" alt=\"刺猬.png\"/><br/></p>','gj',150,0,0,'',5,'2018-01-27 12:59:00.000000',3,'后端开发','关乎',1,'沃尔特','斯蒂芬',1),(12,'斯蒂芬','任天野','<p><img src=\"http://img.baidu.com/hi/jx2/j_0015.gif\"/>豆腐干豆腐干<img src=\"/media/courses/ueditor/古风-banner_20180127130733_444.png\" title=\"\" alt=\"古风-banner.png\"/> </p>','zj',34,0,0,'',1,'2018-01-27 13:06:00.000000',5,'后端开发','你',6,'飞过海','飞过海',0);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'django框架','course/resource/201801/django.png','2018-01-21 13:54:00.000000',1),(2,'yuja','course/resource/201801/yuja.png','2018-01-21 13:58:00.000000',2),(3,'老子','course/resource/201801/laozi.png','2018-01-21 13:58:00.000000',3),(4,'机器人','course/resource/201801/人工智能.png','2018-01-21 13:59:00.000000',5);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'第一章、国学概要','2018-01-21 13:47:00.000000',3),(2,'第二章、先秦诸子','2018-01-21 13:49:00.000000',3),(3,'第三章、独尊儒术','2018-01-21 13:49:00.000000',3),(4,'第四章、大佛东来','2018-01-21 13:49:00.000000',3),(5,'inlines','2018-01-26 21:27:00.000000',10);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'1.1、起源','2018-01-21 13:50:00.000000',1,'file://C:\\Users\\Administrator\\Desktop\\fullstack\\Python fullstack s4 数据库篇-day59',0),(2,'1.2、三皇','2018-01-21 13:51:00.000000',1,'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4',0),(3,'1.3、五帝','2018-01-21 13:51:00.000000',1,'http://www.guoxue.com/?p=47872',0),(4,'2.1、老子之学','2018-01-21 13:51:00.000000',2,'http://www.guoxue.com/?p=47872',0),(5,'2.2、孔子儒学','2018-01-21 13:52:00.000000',2,'http://www.guoxue.com/?p=47872',0),(6,'2.3、法家治国','2018-01-21 13:52:00.000000',2,'http://www.guoxue.com/?p=47872',0),(7,'3.1、汉武帝','2018-01-21 13:52:00.000000',3,'http://www.guoxue.com/?p=47872',0),(8,'3.2、董仲舒','2018-01-21 13:53:00.000000',3,'http://www.guoxue.com/?p=47872',0),(9,'3.3、天人合一','2018-01-21 13:53:00.000000',3,'http://www.guoxue.com/?p=47872',0),(10,'4.1、豪强崛起','2018-01-21 13:53:00.000000',4,'http://www.guoxue.com/?p=47872',0),(11,'4.2、民不聊生','2018-01-21 13:53:00.000000',4,'http://www.guoxue.com/?p=47872',0),(12,'4.3、天下大乱','2018-01-21 13:54:00.000000',4,'http://www.guoxue.com/?p=47872',0);
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(25,'captcha','captchastore'),(4,'contenttypes','contenttype'),(10,'courses','course'),(11,'courses','courseresource'),(12,'courses','lesson'),(9,'courses','video'),(19,'operation','coursecomments'),(16,'operation','userask'),(17,'operation','usercourse'),(18,'operation','userfavorite'),(20,'operation','usermessage'),(14,'organization','citydict'),(15,'organization','courseorg'),(13,'organization','teacher'),(5,'sessions','session'),(7,'users','banner'),(8,'users','emailverifyrecord'),(6,'users','userprofile'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-01-12 12:49:59.044711'),(2,'contenttypes','0002_remove_content_type_name','2018-01-12 12:50:00.276960'),(3,'auth','0001_initial','2018-01-12 12:50:02.675348'),(4,'auth','0002_alter_permission_name_max_length','2018-01-12 12:50:03.503614'),(5,'auth','0003_alter_user_email_max_length','2018-01-12 12:50:03.546663'),(6,'auth','0004_alter_user_username_opts','2018-01-12 12:50:03.602322'),(7,'auth','0005_alter_user_last_login_null','2018-01-12 12:50:03.727485'),(8,'auth','0006_require_contenttypes_0002','2018-01-12 12:50:03.906260'),(9,'auth','0007_alter_validators_add_error_messages','2018-01-12 12:50:04.013795'),(10,'auth','0008_alter_user_username_max_length','2018-01-12 12:50:04.092902'),(11,'users','0001_initial','2018-01-12 12:50:07.561022'),(12,'admin','0001_initial','2018-01-12 12:50:08.302396'),(13,'admin','0002_logentry_remove_auto_add','2018-01-12 12:50:08.369547'),(14,'sessions','0001_initial','2018-01-12 12:50:09.110413'),(15,'courses','0001_initial','2018-01-12 14:17:19.960988'),(16,'operation','0001_initial','2018-01-12 14:17:23.713175'),(17,'organization','0001_initial','2018-01-12 14:17:25.053458'),(18,'users','0002_banner_emailverifyrecord','2018-01-12 14:17:25.809773'),(19,'xadmin','0001_initial','2018-01-12 14:52:30.219218'),(20,'xadmin','0002_log','2018-01-12 14:52:31.086289'),(21,'xadmin','0003_auto_20160715_0100','2018-01-12 14:52:32.033827'),(22,'captcha','0001_initial','2018-01-13 20:45:39.299848'),(23,'courses','0002_auto_20180113_2045','2018-01-13 20:45:39.366878'),(24,'users','0003_auto_20180113_2045','2018-01-13 20:45:39.446776'),(25,'organization','0002_auto_20180116_1421','2018-01-16 14:22:51.016436'),(26,'organization','0003_auto_20180116_1422','2018-01-16 14:22:51.136531'),(27,'organization','0004_auto_20180117_1228','2018-01-17 12:28:42.392226'),(28,'courses','0003_course_course_org','2018-01-17 16:33:34.115595'),(29,'organization','0005_teacher_image','2018-01-17 18:32:59.771393'),(30,'courses','0004_auto_20180120_1725','2018-01-20 17:25:22.676640'),(31,'courses','0005_course_tag','2018-01-20 21:21:29.520607'),(32,'courses','0006_video_url','2018-01-21 14:05:12.606834'),(33,'courses','0007_video_times','2018-01-21 14:26:37.728453'),(34,'courses','0008_course_teacher','2018-01-21 14:42:50.849015'),(35,'courses','0009_auto_20180121_1452','2018-01-21 14:52:23.800181'),(36,'organization','0006_teacher_age','2018-01-22 14:28:52.690888'),(37,'courses','0010_course_is_banner','2018-01-25 21:11:09.023875'),(38,'organization','0007_courseorg_tag','2018-01-25 22:21:16.976414');
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
INSERT INTO `django_session` VALUES ('b95zxw0vrh775ewtsbn75dc2coa49r4o','MzJjN2I1ODE1OWY0MmM5NjQxNzIyOGU0MzY0Mjg3YTczMTI1NWY0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFlZTA1MTg3NmUwMmIxMmNlMTAwZWRhN2RmN2NlY2FhZGIxMTk5ZjcifQ==','2018-02-06 19:57:58.914957'),('k3lu7qxaujs3u2q1du1nf6mi2tae025i','MzJjN2I1ODE1OWY0MmM5NjQxNzIyOGU0MzY0Mjg3YTczMTI1NWY0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFlZTA1MTg3NmUwMmIxMmNlMTAwZWRhN2RmN2NlY2FhZGIxMTk5ZjcifQ==','2018-01-27 16:36:47.556243'),('ljtait2pxwu0mzalq5teinvq99mtli9j','MzJjN2I1ODE1OWY0MmM5NjQxNzIyOGU0MzY0Mjg3YTczMTI1NWY0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFlZTA1MTg3NmUwMmIxMmNlMTAwZWRhN2RmN2NlY2FhZGIxMTk5ZjcifQ==','2018-01-27 16:36:53.548046'),('zdwvj9zfnfvhny6n9scye157uqm46fmz','ODZhMGNmY2U5NTFhYTQ5OTE3ZmY1MzY1ZTEwYmEyYzg5NTU4ODk4NDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjkyMzUyMjZmNDdmZWI1ZGM5YjU2N2MwOTY3ZmM4ZWNkNGZhZWM0MzIiLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJjb3Vyc2VvcmciXSwiIl19','2018-02-09 20:25:06.603539');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
INSERT INTO `operation_coursecomments` VALUES (1,'飞过海','2018-01-21 16:17:37.259999',3,1),(2,'可以了','2018-01-21 16:18:09.011663',3,1),(3,'课程id能用的','2018-01-21 16:18:26.149810',3,1),(4,'拉斯队交锋‘Afghanistan规范二套方式’','2018-01-21 16:18:38.532076',3,1),(5,'最后一个','2018-01-21 16:37:59.188602',3,1);
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'天不怕','12345678912','django','2018-01-17 15:29:55.037967'),(2,'天不怕','12345678912','django','2018-01-17 15:29:55.040466'),(3,'二人','1234','eee','2018-01-17 15:30:30.361439'),(4,'二人','1234','eee','2018-01-17 15:30:30.363439'),(5,'人人','345','斯蒂芬','2018-01-17 15:33:57.521684'),(6,'人人','345','斯蒂芬','2018-01-17 15:33:57.517682'),(7,'理了理','12345','python','2018-01-17 15:41:08.203382'),(8,'234','234','234','2018-01-17 15:43:28.883636'),(9,'456','546','456','2018-01-17 15:44:29.344164'),(10,'234','234','546','2018-01-17 15:44:36.745637'),(11,'345','345','345','2018-01-17 15:45:08.417189'),(12,'345','345','45','2018-01-17 15:46:58.946895'),(13,'345','567','768','2018-01-17 15:47:06.244175'),(14,'234','56','768','2018-01-17 15:47:14.930650'),(15,'234','567','768','2018-01-17 15:47:27.834484'),(16,'678','345','dfg','2018-01-17 15:47:40.393644'),(17,'345','34','435','2018-01-17 15:51:28.764542'),(18,'呃呃呃','15737925363','linux','2018-01-17 16:07:52.979589');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (1,'2018-01-20 17:35:00.000000',3,6),(2,'2018-01-20 19:59:00.000000',3,2),(3,'2018-01-21 17:46:32.000000',4,6),(4,'2018-01-21 21:01:08.248810',7,1),(5,'2018-01-21 22:43:16.881156',3,1),(6,'2018-01-24 15:11:54.609312',6,1),(7,'2018-01-25 15:50:58.067570',5,1);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (26,9,2,'2018-01-20 22:37:39.235029',1),(32,5,2,'2018-01-22 20:07:17.266674',1),(34,2,3,'2018-01-22 20:11:18.840742',1),(36,6,1,'2018-01-24 13:04:59.760519',1),(41,1,2,'2018-01-25 20:04:28.557047',1),(42,3,1,'2018-01-26 19:30:36.249578',6);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (1,1,'欢迎注册！',1,'2018-01-24 14:02:00.000000'),(2,1,'您已经激活！',1,'2018-01-24 14:02:00.000000'),(3,1,'欢迎咨询',1,'2018-01-24 14:03:00.000000');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'北京','京城','2018-01-16 13:32:00.000000'),(2,'上海','经济中心','2018-01-16 13:33:00.000000'),(3,'深圳','开发区','2018-01-16 13:33:00.000000'),(4,'郑州','省会','2018-01-16 13:34:00.000000'),(5,'洛阳','有牡丹','2018-01-16 13:34:00.000000'),(6,'海南','热带','2018-01-16 13:34:00.000000'),(7,'南海','三百万','2018-01-16 13:34:00.000000'),(8,'新疆','西域','2018-01-16 13:35:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `courses` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'蓝天教育','教育机构在发展中普遍存在一些问题，如人员编制不满，招不上来人；人员编制满了，执行力差；校长是教学出身，不懂市场和运营；课程很好，但是不会宣传出去；产品很好，但是不会设置课程，产品研发跟不上……纵观一家专业、成功的教育培训机构，不只有专业的市场招生、强大的课程体系，而是从市场定位、到团队管理，从组织架构，到社会责任，都有着清晰的定位与目标。这也是当前很多培训机构所不具备的管理思维。',81,0,'org/2018/01/htjh.jpg','北京','2018-01-16 13:55:00.000000',1,'pxjg',0,0,'实事求是'),(2,'大正教育','绍兴大政教育是由绍兴大政教育信息咨询有限公司出资举办的公务员考试研究中心。我中心是一家以公务员、事业单位考试辅导为主，兼顾政法干警、选调生、军转干部、教师、银行等各类公职人员录用考试，集教育教学研究、咨询、面授为一体的专业公考辅导基地。大政教育以“师资决定质量，实力赢得未来”为办学宗旨，专注于公务员事业单位笔试面试考试研究与服务，组建了大政公务员考试研究中心专家团队。省内各县市的在职公务员、历年考...',10,0,'org/2018/01/htjh_fJ9AtDR.jpg','上海','2018-01-16 14:02:00.000000',2,'pxjg',0,0,'实事求是'),(3,'大树教育','大树教育科技（北京）有限公司成立于2013年，是中国领先的综合性软件与教育信息服务企业。大树教育开发了国内最早的国际学校数据信息库产品，并依托强大的国际学校行业和家长社区资源，为国际学校、国际教育机构提供市场招生、推广等服务。大树教育与美国、加拿大多家领先教育企业建立了深入合作，并且是国内最大教育门户网站--新浪教育频道国际学校领域唯一合作方，连续三年承办新浪国际学校择校展、十大国际学校评选、在线教育行业高峰论坛等活动。大树教育目标是成为立足中国、服务全球、行业领先的全链条教育信息技术服务供应商。',10,0,'org/2018/01/tree.png','深圳','2018-01-16 14:03:00.000000',3,'pxjg',3,0,'实事求是'),(4,'启蒙教育','在一些不知道新理论的人特别是儿童，不具备验证科学知识的能力时，只能简单使他们记住结果而应用科学知识，这种忽略证明过程的教育方法叫启蒙教育。启蒙教育常用的说理方法是用一些被启蒙者已知的类似常识，来说明道理，而不是讲述科学证明过程。启蒙教育对于一个人的成长至关重要，良好的开端等于成功的一半。而我们知道，由于条件不同，类似的道理，与实际可能是不同的，所以启蒙知识，不能应用于科学理论的争论。',0,0,'org/2018/01/science.png','南海','2018-01-16 14:06:00.000000',7,'pxjg',0,0,'实事求是'),(5,'正思教育','正思教育创立于2015年，位于福州长乐市，由三位创始人主办，其中有来自知名的教学培训机构的老师、服务过知名企业的管理人员。正思教育前身是厦门市的一家中学生课外辅导机构，并在厦门市取得优异的成绩。2014年，怀着对长乐家乡的思念，团队决定将项目移至长乐市区，为家乡的学子带来先进的教学方法。\r\n         正思教育的创始人是一批年轻、有激情、不拘一格的年轻人，有伟大的蓝图并保持源源不断的冲劲，有远大的梦想并时刻踏踏实实地前行。\r\n正思教育旨在为中学生提供优秀的课外辅导资源，一直坚持“好老师+好内容”的教学理念。虽成立一年之余，但其特色的教学方式及教学效果迅速得到长乐地区的学生及家长的认可。2016年11月，正思教育旗下“我为分狂”品牌在线教育正式开通，通过网络新媒体的方式为全国的学子输送优秀的教学资源。',0,0,'org/2018/01/zsjy.png','海南','2018-01-16 14:08:00.000000',6,'pxjg',3,0,'实事求是'),(6,'孟母教育','孟子（前372年－前289年），名轲，字子舆（待考，一说字子车或子居。按：车，古文；舆，今字。车又音居，是故，子舆、子车、子居，皆孟子之字也）。汉族，战国时期邹国人，鲁国庆父后裔。孟子继承并发扬了孔子的思想，成为仅次于孔子的一代儒家宗师，对后世中国文化的影响全面而巨大，有“亚圣”之称，与孔子合称为“孔孟”。中国古代著名思想家、教育家，战国时期儒家代表人物。孟子及其门人著有《孟子》一书。',3,0,'org/2018/01/saint.png','洛阳','2018-01-16 14:10:00.000000',5,'pxjg',0,0,'实事求是'),(7,'琢玉教育','上海琢玉教育是一家基于人本心理学观点而创立的中小学生课外辅导机构。成立于2008年，扎根顾于上海。为上海市“阳光心晴”工作室青少年心理咨询指定咨询点。荣获2011-2012年度上海市黄浦区共青团“青年文明号”。琢玉致力于培养学生在学习生活中的自我实现感，为中小学生提供高品质的课外辅导。',3,0,'org/2018/01/zyjy.png','上海','2018-01-16 14:11:00.000000',2,'pxjg',0,0,'实事求是'),(8,'Rice edu','莱斯大学（Rice University）是美国著名私立大学、美国南方最高学府。学校成立于1892年，由得克萨斯州棉花巨富威廉·马歇尔·莱斯William Marshall Rice创建。莱斯大学位于美国南方宁静的得克萨斯州休斯敦市郊，曾与杜克大学、范德堡大学齐名，称为南方哈佛（The Harvard of the South）。莱斯大学是发现碳60（“富勒烯”或称“足球碳”）的地方，学校教授理察·斯莫利（Richard Smalley）和罗伯特·柯尔（Robert Curl）因此获得了1996年度诺贝尔化学奖。2010年，莱斯大学在英国Times Higher Education泰晤士高等教育全球材料科学研究机构（包括大学和科研院所）的排名中力压哈佛，斯坦福，剑桥大学等知名院校，高居世界第一。2013年《美国新闻与世界报告》排名中，莱斯大学位列第18名。',3,0,'org/2018/01/rice_26Xahi3.png','郑州','2018-01-16 14:13:00.000000',4,'gx',0,0,'实事求是'),(9,'腾飞教育','上海市腾飞教育网是上海树俊进修学校旗下的中学生网络教育个性化辅导机构,早在成立之初，腾飞对于自己的办学理念就有着明确的定位：\r\n1、提供更好的教育资源：在传统教育中，由于各地、各区县的实际教学条件、教学资源情况千差万别，良莠不齐，很多学员也往往不知道该到什么地方寻找优秀的师资；而腾飞教育优势就是可以把各地的优秀师资汇集到一起，使各个地区的的学员都能听到更好地名师讲授的课程，从而提高整体的学习水平。\r\n2、提供更优的教学服务:专职班主任跟踪制度，从学习到心理为广大学员保驾护航。\r\n3、教育的普通性或通识教育。给学生以人文教育的熏陶，培养学生在注重传统的学历教育之外，同时具有一定的人文意识、人文知识、人文精神等；',85,0,'org/2018/01/tfjy.png','上海','2018-01-16 14:14:00.000000',2,'pxjg',0,0,'实事求是');
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'张老五',5,'天天网','讲师','幽默',3,0,'2018-01-17 16:25:00.000000',3,'teacher/2018/01/bm.jpg',35),(2,'李老二',3,'英达伟业','初级讲师','严谨',2,0,'2018-01-17 16:26:00.000000',5,'teacher/2018/01/bill.jpg',40),(3,'李颖',4,'政府机构','科员','通俗易懂',4,0,'2018-01-17 16:27:00.000000',1,'teacher/2018/01/pt.jpg',28),(4,'美眉',18,'新天地咨询公司','经理','全心全意',4,0,'2018-01-22 14:37:00.000000',7,'teacher/2018/01/海明威.png',25),(5,'大桥',15,'我第一','高级讲师','温柔',4,0,'2018-01-22 14:39:00.000000',9,'teacher/2018/01/无名氏.png',40),(6,'爱因斯坦',50,'斯坦福','教授','独立思考',0,0,'2018-01-22 14:40:00.000000',4,'teacher/2018/01/爱因斯坦.png',70),(7,'格瓦拉',20,'玻利维亚','革命领导人','坚强不屈',0,0,'2018-01-22 14:40:00.000000',2,'teacher/2018/01/切格瓦拉.png',45),(8,'伊丽莎白',50,'英国','女王','过生日重要',0,0,'2018-01-22 14:41:00.000000',7,'teacher/2018/01/伊丽莎白.png',99);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (1,'古风有缘','banner/2018/01/古风-banner_xdmIO8D.png','http://www.wjszx.com.cn/gufeng-b.html',1,'2018-01-25 21:28:00.000000'),(2,'二次元','banner/2018/01/二次元.png','http://www.xingmaow.com/',2,'2018-01-25 21:33:00.000000'),(3,'宇宙','banner/2018/01/宇宙.gif','http://open.163.com/special/opencourse/aspacetimeodyssey.html',3,'2018-01-25 21:35:00.000000'),(4,'花卉','banner/2018/01/花卉.png','http://www.ivsky.com/tupian/zhiwuhuahui/',4,'2018-01-25 21:38:00.000000'),(5,'AI','banner/2018/01/AI.png','http://tech.sina.com.cn/roll/2018-01-23/doc-ifyqtycx2283031.shtml',5,'2018-01-25 21:40:00.000000'),(6,'高铁','banner/2018/01/高铁.png','http://crh.gaotie.cn/CRHMAP.html',6,'2018-01-25 21:40:00.000000');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(15) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (2,'222','2@163.com','register','2018-01-12 15:37:00.000000'),(4,'moHxfgIMrerER1Yg','327599582@qq.com','register','2018-01-15 18:56:08.565138'),(5,'o9nTKxjWVGzpRHdU','327599582@qq.com ','forget','2018-01-15 21:40:08.526259'),(6,'6oaOV1YlTgCGc5YE','15737925363ooo@163.com','update_email','2018-01-23 21:30:44.606652'),(7,'ykcLfcHbfzLfeOgv','15737925363@163.com','update_email','2018-01-23 21:32:43.325894'),(8,'vXlJoa3277bRk7yl','15737925363@163.com','update_email','2018-01-23 21:59:54.345040'),(9,'08EzcYBGViP6jFVM','327599582@qq.com','update_email','2018-01-23 22:02:22.440021');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
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
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$36000$xmGze1B67BtG$CWHOx9cr28zaQzoGaoNM9PiMiCApHO/zi8lqpQ18A40=','2018-01-26 19:35:50.000221',1,'lyb','','','15737925363@163.com',1,1,'2018-01-12 14:28:35.318311','山水','2018-01-09','male','北京中南海','15714715201','image/2018/01/熊_uGE9ckK.png'),(2,'pbkdf2_sha256$36000$n0CjjOAC3Gip$E1hF65UcGe2oMoslOKz9MFf65FC063h8MQVzSCAFIBc=',NULL,0,'123可i月','斯蒂芬','安师大','qqq@qq.com',0,1,'2018-01-12 15:19:00.000000','vcb','2018-01-20','female','sadfsdfdfert','sdfvcb','image/2018/01/下载.jpg'),(5,'pbkdf2_sha256$36000$zxr5Txr6Zgsj$MHjsjaf7KXey6FLfrRFTG5qXRT4RF/5N9Nij117ucRo=','2018-01-16 00:22:52.596131',0,'327599582@qq.com','','','99582@qq.com',0,1,'2018-01-15 18:56:08.469897','',NULL,'male','',NULL,'image/default.png'),(6,'pbkdf2_sha256$36000$rWdAp3IhS5IH$TylrJBpYEGeffGtnytOWAhG0vuC7cTPuBdoVvEXtzlY=','2018-01-26 19:38:00.000000',0,'且为','','','',1,1,'2018-01-20 17:36:00.000000','额的若干vsdf','2018-01-26','male','额的若干vsdfasdf','斯蒂芬斯蒂芬','image/2018/01/高铁_WwDnOyJ.png'),(7,'pbkdf2_sha256$36000$WBNfzAx9YtJn$ea00/uhniyKbTyQP2378ZwR8Df82aNmPNVBOOS5GpYQ=',NULL,0,'呜呜呜呜','','','',1,1,'2018-01-20 17:41:00.000000','123','2018-01-26','male','第三方','阿斯蒂芬','image/2018/01/二次元_vfyOUxh.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
INSERT INTO `users_userprofile_groups` VALUES (1,6,1),(2,7,2);
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
INSERT INTO `users_userprofile_user_permissions` VALUES (1,6,65),(3,6,67),(2,6,74);
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-01-12 15:19:25.832905','127.0.0.1','2','123可i月','create','已添加。',6,1),(2,'2018-01-12 15:31:22.698687','127.0.0.1','1','1@qq.com(123)','create','已添加。',8,1),(3,'2018-01-12 15:37:25.793750','127.0.0.1','2','2@163.com(222)','create','已添加。',8,1),(4,'2018-01-12 15:38:17.211839','127.0.0.1',NULL,'','delete','批量删除 1 个 邮箱验证码',NULL,1),(5,'2018-01-16 13:33:34.983386','127.0.0.1','1','CityDict object','create','已添加。',14,1),(6,'2018-01-16 13:33:55.088902','127.0.0.1','2','CityDict object','create','已添加。',14,1),(7,'2018-01-16 13:34:10.562279','127.0.0.1','3','CityDict object','create','已添加。',14,1),(8,'2018-01-16 13:34:23.745928','127.0.0.1','4','CityDict object','create','已添加。',14,1),(9,'2018-01-16 13:34:35.956828','127.0.0.1','5','CityDict object','create','已添加。',14,1),(10,'2018-01-16 13:34:53.658952','127.0.0.1','6','CityDict object','create','已添加。',14,1),(11,'2018-01-16 13:35:23.204443','127.0.0.1','7','CityDict object','create','已添加。',14,1),(12,'2018-01-16 13:35:51.906693','127.0.0.1','8','CityDict object','create','已添加。',14,1),(13,'2018-01-16 13:56:44.711460','127.0.0.1','1','蓝天教育','create','已添加。',15,1),(14,'2018-01-16 14:03:45.925250','127.0.0.1','2','大正教育','create','已添加。',15,1),(15,'2018-01-16 14:06:37.002029','127.0.0.1','3','大树教育','create','已添加。',15,1),(16,'2018-01-16 14:08:11.587672','127.0.0.1','4','启蒙教育','create','已添加。',15,1),(17,'2018-01-16 14:10:09.510184','127.0.0.1','5','正思教育','create','已添加。',15,1),(18,'2018-01-16 14:11:48.559078','127.0.0.1','6','孟母教育','create','已添加。',15,1),(19,'2018-01-16 14:13:10.785801','127.0.0.1','7','琢玉教育','create','已添加。',15,1),(20,'2018-01-16 14:14:24.853731','127.0.0.1','8','Rice edu','create','已添加。',15,1),(21,'2018-01-16 14:15:51.325348','127.0.0.1','9','腾飞教育','create','已添加。',15,1),(22,'2018-01-16 14:25:20.310217','127.0.0.1','8','Rice edu','change','修改 category 和 image',15,1),(23,'2018-01-17 16:26:28.497774','127.0.0.1','1','张老五','create','已添加。',13,1),(24,'2018-01-17 16:27:11.339140','127.0.0.1','2','李老二','create','已添加。',13,1),(25,'2018-01-17 16:27:53.678659','127.0.0.1','3','李颖','create','已添加。',13,1),(26,'2018-01-17 17:29:53.858786','127.0.0.1','1','django','create','已添加。',10,1),(27,'2018-01-17 18:34:42.599753','127.0.0.1','3','李颖','change','修改 image',13,1),(28,'2018-01-17 18:35:14.775801','127.0.0.1','2','李老二','change','修改 image',13,1),(29,'2018-01-17 18:35:45.649416','127.0.0.1','1','张老五','change','修改 image',13,1),(30,'2018-01-17 18:42:56.530241','127.0.0.1','3','李颖','change','修改 org 和 image',13,1),(31,'2018-01-18 14:09:23.980540','127.0.0.1','3','李颖','change','修改 image',13,1),(32,'2018-01-18 14:10:52.111290','127.0.0.1','3','李颖','change','修改 image',13,1),(33,'2018-01-19 22:58:30.642060','127.0.0.1','2','瑜伽','create','已添加。',10,1),(34,'2018-01-19 23:00:23.564169','127.0.0.1','3','国学课','create','已添加。',10,1),(35,'2018-01-19 23:01:58.400080','127.0.0.1','4','English','create','已添加。',10,1),(36,'2018-01-19 23:04:22.132370','127.0.0.1','5','人工智能','create','已添加。',10,1),(37,'2018-01-19 23:06:11.210236','127.0.0.1','6','酒店管理','create','已添加。',10,1),(38,'2018-01-19 23:08:07.656586','127.0.0.1','7','OS','create','已添加。',10,1),(39,'2018-01-20 17:36:05.031839','127.0.0.1','6','且为','create','已添加。',6,1),(40,'2018-01-20 17:36:15.860090','127.0.0.1','1','UserCourse object','create','已添加。',17,1),(41,'2018-01-20 17:41:28.850531','127.0.0.1','7','呜呜呜呜','create','已添加。',6,1),(42,'2018-01-20 17:43:46.002853','127.0.0.1','2','123可i月','change','修改 first_name，last_name，email，nick_name，birthday，gender，address，mobile 和 image',6,1),(43,'2018-01-20 19:59:38.376514','127.0.0.1','2','UserCourse object','create','已添加。',17,1),(44,'2018-01-21 13:49:00.245520','127.0.0.1','1','第一章、国学概要','create','已添加。',12,1),(45,'2018-01-21 13:49:24.620200','127.0.0.1','2','第二章、先秦诸子','create','已添加。',12,1),(46,'2018-01-21 13:49:46.494807','127.0.0.1','3','第三章、独尊儒术','create','已添加。',12,1),(47,'2018-01-21 13:50:05.213299','127.0.0.1','4','第四章、大佛东来','create','已添加。',12,1),(48,'2018-01-21 13:51:20.886722','127.0.0.1','1','1.1、起源','create','已添加。',9,1),(49,'2018-01-21 13:51:33.313854','127.0.0.1','2','1.2、三皇','create','已添加。',9,1),(50,'2018-01-21 13:51:48.871833','127.0.0.1','3','1.3、五帝','create','已添加。',9,1),(51,'2018-01-21 13:52:14.511338','127.0.0.1','4','2.1、老子之学','create','已添加。',9,1),(52,'2018-01-21 13:52:27.916738','127.0.0.1','5','2.2、孔子儒学','create','已添加。',9,1),(53,'2018-01-21 13:52:58.723346','127.0.0.1','6','2.3、法家治国','create','已添加。',9,1),(54,'2018-01-21 13:53:11.211738','127.0.0.1','7','3.1、汉武帝','create','已添加。',9,1),(55,'2018-01-21 13:53:26.200134','127.0.0.1','8','3.2、董仲舒','create','已添加。',9,1),(56,'2018-01-21 13:53:38.999344','127.0.0.1','9','3.3、天人合一','create','已添加。',9,1),(57,'2018-01-21 13:53:59.764841','127.0.0.1','10','4.1、豪强崛起','create','已添加。',9,1),(58,'2018-01-21 13:54:11.687279','127.0.0.1','11','4.2、民不聊生','create','已添加。',9,1),(59,'2018-01-21 13:54:27.052291','127.0.0.1','12','4.3、天下大乱','create','已添加。',9,1),(60,'2018-01-21 13:58:37.195902','127.0.0.1','1','django框架','create','已添加。',11,1),(61,'2018-01-21 13:58:51.984712','127.0.0.1','2','yuja','create','已添加。',11,1),(62,'2018-01-21 13:59:11.942496','127.0.0.1','3','老子','create','已添加。',11,1),(63,'2018-01-21 13:59:30.660798','127.0.0.1','4','机器人','create','已添加。',11,1),(64,'2018-01-21 14:06:36.474122','127.0.0.1','1','1.1、起源','change','修改 url',9,1),(65,'2018-01-21 14:06:50.282153','127.0.0.1','2','1.2、三皇','change','修改 url',9,1),(66,'2018-01-21 14:06:56.409306','127.0.0.1','3','1.3、五帝','change','修改 url',9,1),(67,'2018-01-21 14:07:01.848709','127.0.0.1','4','2.1、老子之学','change','修改 url',9,1),(68,'2018-01-21 14:07:06.793448','127.0.0.1','5','2.2、孔子儒学','change','修改 url',9,1),(69,'2018-01-21 14:07:12.321391','127.0.0.1','7','3.1、汉武帝','change','修改 url',9,1),(70,'2018-01-21 14:07:17.902740','127.0.0.1','6','2.3、法家治国','change','修改 url',9,1),(71,'2018-01-21 14:07:24.994936','127.0.0.1','12','4.3、天下大乱','change','修改 url',9,1),(72,'2018-01-21 14:07:29.104242','127.0.0.1','11','4.2、民不聊生','change','修改 url',9,1),(73,'2018-01-21 14:07:33.297499','127.0.0.1','10','4.1、豪强崛起','change','修改 url',9,1),(74,'2018-01-21 14:07:37.400302','127.0.0.1','9','3.3、天人合一','change','修改 url',9,1),(75,'2018-01-21 14:07:42.137418','127.0.0.1','8','3.2、董仲舒','change','修改 url',9,1),(76,'2018-01-21 14:07:46.611561','127.0.0.1','7','3.1、汉武帝','change','没有字段被修改。',9,1),(77,'2018-01-21 14:44:54.298967','127.0.0.1','3','国学课','change','修改 teacher 和 image',10,1),(78,'2018-01-21 14:54:36.030681','127.0.0.1','3','国学课','change','修改 you_need_to_know，you_can_learn 和 image',10,1),(79,'2018-01-21 23:34:31.700531','127.0.0.1','1','1.1、起源','change','修改 url',9,1),(80,'2018-01-21 23:48:26.173964','127.0.0.1','1','1.1、起源','change','修改 url',9,1),(81,'2018-01-21 23:49:55.688421','127.0.0.1','1','1.1、起源','change','修改 url',9,1),(82,'2018-01-21 23:53:00.314986','127.0.0.1','1','1.1、起源','change','修改 url',9,1),(83,'2018-01-22 00:04:46.630585','127.0.0.1','2','1.2、三皇','change','修改 url',9,1),(84,'2018-01-22 14:39:03.638472','127.0.0.1','4','美眉','create','已添加。',13,1),(85,'2018-01-22 14:40:20.561759','127.0.0.1','5','大桥','create','已添加。',13,1),(86,'2018-01-22 14:40:55.498602','127.0.0.1','6','爱因斯坦','create','已添加。',13,1),(87,'2018-01-22 14:41:56.093903','127.0.0.1','7','格瓦拉','create','已添加。',13,1),(88,'2018-01-22 14:42:42.565266','127.0.0.1','8','伊丽莎白','create','已添加。',13,1),(89,'2018-01-24 14:02:44.692261','127.0.0.1','1','UserMessage object','create','已添加。',20,1),(90,'2018-01-24 14:03:00.509722','127.0.0.1','2','UserMessage object','create','已添加。',20,1),(91,'2018-01-24 14:03:17.613203','127.0.0.1','3','UserMessage object','create','已添加。',20,1),(92,'2018-01-25 21:31:40.489996','127.0.0.1','1','Banner object','create','已添加。',7,1),(93,'2018-01-25 21:32:32.259232','127.0.0.1','1','Banner object','change','修改 image 和 url',7,1),(94,'2018-01-25 21:33:55.284457','127.0.0.1','2','Banner object','create','已添加。',7,1),(95,'2018-01-25 21:36:29.434518','127.0.0.1','3','Banner object','create','已添加。',7,1),(96,'2018-01-25 21:39:09.030647','127.0.0.1','4','Banner object','create','已添加。',7,1),(97,'2018-01-25 21:40:15.574250','127.0.0.1','5','Banner object','create','已添加。',7,1),(98,'2018-01-25 21:42:32.598958','127.0.0.1','6','Banner object','create','已添加。',7,1),(99,'2018-01-25 21:51:08.686222','127.0.0.1','8','登山','create','已添加。',10,1),(100,'2018-01-25 21:55:16.299528','127.0.0.1','9','动物世界','create','已添加。',10,1),(101,'2018-01-25 21:58:03.673108','127.0.0.1','10','量子通信','create','已添加。',10,1),(102,'2018-01-26 19:27:20.467060','127.0.0.1','6','且为','change','修改 user_permissions，nick_name，birthday，address，mobile 和 image',6,1),(103,'2018-01-26 19:29:12.729074','127.0.0.1','6','且为','change','修改 image',6,1),(104,'2018-01-26 19:40:41.152934','127.0.0.1','6','且为','change','修改 last_login，user_permissions 和 image',6,1),(105,'2018-01-26 19:47:21.693740','127.0.0.1','1','普通用户','create','已添加。',3,1),(106,'2018-01-26 19:48:30.598074','127.0.0.1','2','白金','create','已添加。',3,1),(107,'2018-01-26 19:53:12.407551','127.0.0.1','6','且为','change','修改 groups 和 image',6,1),(108,'2018-01-26 19:53:54.806485','127.0.0.1','7','呜呜呜呜','change','修改 groups，nick_name，birthday，address，mobile 和 image',6,1),(109,'2018-01-26 19:55:07.312114','127.0.0.1','7','呜呜呜呜','change','修改 is_staff 和 image',6,1),(110,'2018-01-26 21:28:27.690815','127.0.0.1','10','量子通信','change','没有字段被修改。',10,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1),(3,'users_userprofile_editform_portal','box-0,box-1,box-2,box-3,box-4|box-5',1),(4,'dashboard:home:pos','',6),(5,'site-theme','https://bootswatch.com/3/sandstone/bootstrap.min.css',6);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-27 15:32:23
