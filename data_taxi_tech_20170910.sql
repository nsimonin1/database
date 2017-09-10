/*
SQLyog Ultimate v11.5 (64 bit)
MySQL - 5.7.13-log : Database - taxi_dev
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`taxi_dev` /*!40100 DEFAULT CHARACTER SET utf8 */;

insert  into `t_organisation`(`id`,`code`,`designation`,`description`,`abreviation`,`version`,`created_by`,`created_date`,`last_modified_by`,`last_modified_date`,`logo`,`logo_content_type`,`NATURE`,`SERIAL_NUMBER`) values (1,'001','SYNDICAT DES TAXIMAN Yaounde','Une organisation créée le 30 mai 2001 à Yaoundé','SYTAYDE',1,'anonymousUser','2017-02-11 23:10:06','anonymousUser','2015-07-31 22:15:53',NULL,NULL,'SYNDICAT',NULL),(2,'000','ADMINISTRATION TAXI','Gestion du socle','GESS',1,'anonymousUser','2017-02-26 19:00:14','anonymousUser','2017-01-02 06:00:00',NULL,NULL,'SOCLE',NULL),(3,'002','SYNDICAT DES TAXIMAN Douala','Une organisation créée le 30 mai 2001 à Yaoundé','SYTADLA',1,'anonymousUser','2017-02-11 23:10:03','anonymousUser','2017-01-26 18:56:24',NULL,NULL,'SYNDICAT',NULL),(4,'003','ETAT DU CAMEROUN','les agents charges de la securite du Cameroun','CAMER',0,'root','2017-02-11 23:08:32','root','2017-02-11 23:08:40',NULL,NULL,'ETAT',NULL);

/*Data for the table `jhi_authority` */

insert  into `jhi_authority`(`name`) values ('ROLE_ADMIN'),('ROLE_AGENT_PUBLIC'),('ROLE_AGENT_PUBLIC_ADMIN'),('ROLE_ATTENTE_ACTIVATION'),('ROLE_MEMBRE'),('ROLE_PRE_AUTHENTICATED'),('ROLE_SOCLE'),('ROLE_SOCLE_ADMIN'),('ROLE_SYNDICAT'),('ROLE_SYNDICAT_ADMIN'),('ROLE_USER');

/*Data for the table `jhi_user` */

insert  into `jhi_user`(`id`,`login`,`password_hash`,`first_name`,`last_name`,`email`,`activated`,`lang_key`,`activation_key`,`reset_key`,`created_by`,`created_date`,`reset_date`,`last_modified_by`,`last_modified_date`,`organisation_id`,`TELEPHONE`,`CODE_OTP`,`DATE_EXPIRATION_OTP`) 
values (3,'admin','$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC','Administrator','Administrator','admin@localhost','','en',NULL,NULL,'system','2017-02-26 19:00:13',NULL,'system',NULL,2,'59081253',NULL,NULL)
,(6,'daniel','$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC','Daniel Rene','Fouomene Pewo','fouomenedaniel@gmail.com','','fr',NULL,NULL,'system','2017-01-26 18:30:29',NULL,'daniel','2017-03-05 14:06:37',3,'674099619',NULL,NULL);

/*Data for the table `jhi_user_authority` */

insert  into `jhi_user_authority`(`user_id`,`authority_name`) values (3,'ROLE_ADMIN'),(6,'ROLE_ADMIN')
,(6,'ROLE_SYNDICAT_ADMIN')
,(3,'ROLE_USER');

/*Data for the table `t_city` */

insert  into `t_city`(`id`,`code`,`name`,`description`,`version`,`created_by`,`created_date`,`last_modified_by`,`last_modified_date`) values (1,'001','Yaoundé','Une ville du cameroun',0,'anonymousUser','2015-07-19 04:47:46','anonymousUser','2015-07-19 04:47:46'),(2,'002','Douala','La ville de Douala test',1,'anonymousUser','2015-08-03 17:46:53','daniel','2017-03-02 03:37:19'),(3,'003','Bafoussam','La ville de Bafoussam',0,'anonymousUser','2017-01-26 19:06:28','anonymousUser','2017-01-26 19:06:18'),(4,'00004','Bertoua','une de l Est du Cameroun',1,'daniel','2017-03-02 04:01:48','daniel','2017-04-01 16:40:36'),(5,'00004','Kribi','Ville de Kribi',0,'daniel','2017-04-01 16:41:58','daniel','2017-04-01 16:41:58'),(6,'00004','Mbouda','Mbouda',0,'admin','2017-05-14 15:03:27','admin','2017-05-14 15:03:27');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
