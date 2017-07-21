/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.26 : Database - bbs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bbs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bbs`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `com_id` int(5) NOT NULL AUTO_INCREMENT,
  `parent_com_id` int(5) DEFAULT NULL,
  `sub_id` int(5) DEFAULT NULL,
  `com_content` varchar(255) DEFAULT NULL,
  `com_time` timestamp NULL DEFAULT NULL,
  `com_by` int(11) DEFAULT NULL,
  `com_by_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`com_id`,`parent_com_id`,`sub_id`,`com_content`,`com_time`,`com_by`,`com_by_name`) values (1,NULL,2,'a','2017-06-09 14:55:42',2,'dnf'),(2,NULL,2,'b','2017-06-09 14:55:57',2,'dnf'),(3,1,2,'ab',NULL,1,'wjl'),(6,2,2,'bc','2017-06-20 16:52:45',2,'dnf'),(9,8,2,'ca','2017-06-20 17:29:08',2,'dnf'),(11,1,2,'ac','2017-06-20 17:48:59',2,'dnf'),(12,3,2,'abc','2017-06-20 17:49:03',2,'dnf'),(13,NULL,2,'c','2017-06-20 17:49:10',2,'dnf'),(14,13,2,'ca','2017-06-20 17:49:15',2,'dnf'),(16,NULL,1,'百度一下，你就知道','2017-06-20 17:51:55',2,'dnf'),(17,16,1,'网址：http://www.baidu.com','2017-06-20 17:53:18',2,'dnf'),(18,NULL,14,'写的不错','2017-07-19 14:52:16',2,'dnf'),(20,NULL,14,'内容挺丰富','2017-07-19 14:53:22',2,'dnf'),(21,NULL,14,'很有创意！','2017-07-19 14:54:07',2,'dnf'),(22,18,14,'还好啦。','2017-07-19 14:54:33',2,'dnf'),(23,20,14,'我花了很长时间找素材','2017-07-19 14:54:50',2,'dnf'),(24,21,14,'这是我苦思冥想的结晶啊！','2017-07-19 14:55:10',2,'dnf'),(25,20,14,'我写了很长时间','2017-07-19 14:55:49',2,'dnf'),(26,23,14,'我还专门跑到美国去寻找素材','2017-07-19 14:56:19',2,'dnf'),(27,26,14,'呵呵！','2017-07-19 16:33:00',1,'wjl');

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `p_id` int(5) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`id`,`p_id`,`name`) values (1,NULL,'中国'),(2,1,'北京'),(3,1,'湖北'),(4,3,'襄阳'),(5,3,'武汉'),(6,4,'二汽'),(7,NULL,'美国'),(8,7,'纽约'),(9,8,'白宫'),(10,7,'洛杉矶');

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

/*Data for the table `resource` */

insert  into `resource`(`res_id`,`type`,`content`) values (89,'T','让我们红尘作伴活的潇潇洒洒，\n策马奔腾共享人世繁华！'),(90,'P','upload/dianxin.png'),(91,'V','upload/sdyjq.mp4'),(92,'P','upload/shouji.png'),(93,'T','轰轰烈烈把握青春年华！'),(98,'T','我写的差不多啦\n\n   挺幸苦的！\n但是也学到很多。。。'),(99,'T','我现在要测试下文本的格式\n    所以我要专门的换行\n   看看还有没有换行'),(100,'T','wjl的主题'),(101,'P','upload/two.jpg'),(102,'V','upload/movie.ogg'),(103,'T','wjl的文本');

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `sub_id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `sub_content` longtext,
  `create_time` timestamp NULL DEFAULT NULL,
  `create_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `subject` */

insert  into `subject`(`sub_id`,`title`,`sub_content`,`create_time`,`create_by`) values (1,'bbs的设计方法','不会设计就到网上查呗','2017-06-09 13:57:30',1),(2,'真热啊！','北京的天气现在很不稳定，热起来真受不了！','2017-06-09 13:58:28',1),(14,'还珠格格',NULL,'2017-07-18 20:14:30',2),(19,'差不多写完啦',NULL,'2017-07-19 15:00:26',2),(20,'测试换行',NULL,'2017-07-19 15:02:29',2),(21,'新人到了！',NULL,'2017-07-19 18:52:58',1);

/*Table structure for table `subject_resource` */

DROP TABLE IF EXISTS `subject_resource`;

CREATE TABLE `subject_resource` (
  `sub_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  PRIMARY KEY (`sub_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `subject_resource` */

insert  into `subject_resource`(`sub_id`,`res_id`) values (14,89),(14,90),(14,91),(14,92),(14,93),(19,98),(20,99),(21,100),(21,101),(21,102),(21,103);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`password`) values (1,'wjl','123'),(2,'dnf','555'),(3,'bbq','222');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
