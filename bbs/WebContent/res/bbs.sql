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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`com_id`,`parent_com_id`,`sub_id`,`com_content`,`com_time`,`com_by`,`com_by_name`) values (1,NULL,2,'a','2017-06-09 14:55:42',2,'dnf'),(2,NULL,2,'b','2017-06-09 14:55:57',2,'dnf'),(3,1,2,'ab',NULL,1,'wjl'),(6,2,2,'bc','2017-06-20 16:52:45',2,'dnf'),(9,8,2,'ca','2017-06-20 17:29:08',2,'dnf'),(11,1,2,'ac','2017-06-20 17:48:59',2,'dnf'),(12,3,2,'abc','2017-06-20 17:49:03',2,'dnf'),(13,NULL,2,'c','2017-06-20 17:49:10',2,'dnf'),(14,13,2,'ca','2017-06-20 17:49:15',2,'dnf'),(16,NULL,1,'百度一下，你就知道','2017-06-20 17:51:55',2,'dnf'),(17,16,1,'网址：http://www.baidu.com','2017-06-20 17:53:18',2,'dnf');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `resource` */

insert  into `resource`(`res_id`,`type`,`content`) values (1,'P','upload/dianxin.png'),(2,'P','upload/shouji.png');

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `sub_id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `sub_content` longtext,
  `create_time` timestamp NULL DEFAULT NULL,
  `create_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `subject` */

insert  into `subject`(`sub_id`,`title`,`sub_content`,`create_time`,`create_by`) values (1,'bbs的设计方法','不会设计就到网上查呗','2017-06-09 13:57:30',1),(2,'真热啊！','北京的天气现在很不稳定，热起来真受不了！','2017-06-09 13:58:28',1);

/*Table structure for table `subject_resource` */

DROP TABLE IF EXISTS `subject_resource`;

CREATE TABLE `subject_resource` (
  `sub_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  PRIMARY KEY (`sub_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `subject_resource` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`password`) values (1,'wjl','123'),(2,'dnf','555'),(3,'bbq','222');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
