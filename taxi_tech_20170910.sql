/*
SQLyog Ultimate v11.5 (64 bit)
MySQL - 5.7.13-log : Database - taxitech
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`taxitech` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `databasechangelog` */

DROP TABLE IF EXISTS `databasechangelog`;

CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `databasechangelog` */

/*Table structure for table `databasechangeloglock` */

DROP TABLE IF EXISTS `databasechangeloglock`;

CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `databasechangeloglock` */

/*Table structure for table `jhi_authority` */

DROP TABLE IF EXISTS `jhi_authority`;

CREATE TABLE `jhi_authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jhi_authority` */

/*Table structure for table `jhi_persistent_audit_event` */

DROP TABLE IF EXISTS `jhi_persistent_audit_event`;

CREATE TABLE `jhi_persistent_audit_event` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

/*Data for the table `jhi_persistent_audit_event` */

/*Table structure for table `jhi_persistent_audit_evt_data` */

DROP TABLE IF EXISTS `jhi_persistent_audit_evt_data`;

CREATE TABLE `jhi_persistent_audit_evt_data` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jhi_persistent_audit_evt_data` */

/*Table structure for table `jhi_user` */

DROP TABLE IF EXISTS `jhi_user`;

CREATE TABLE `jhi_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(5) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  `organisation_id` bigint(20) DEFAULT NULL,
  `TELEPHONE` varchar(150) DEFAULT NULL,
  `CODE_OTP` varchar(4) DEFAULT NULL,
  `DATE_EXPIRATION_OTP` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `idx_user_login` (`login`),
  UNIQUE KEY `CODE_OTP` (`CODE_OTP`),
  UNIQUE KEY `TELEPHONE` (`TELEPHONE`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `idx_user_email` (`email`),
  UNIQUE KEY `idx_utilisateur_telephone` (`TELEPHONE`),
  UNIQUE KEY `idx_utilisateur_otp` (`CODE_OTP`),
  KEY `fk_user_organisation_id` (`organisation_id`),
  CONSTRAINT `fk_user_organisation_id` FOREIGN KEY (`organisation_id`) REFERENCES `t_organisation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `jhi_user` */

/*Table structure for table `jhi_user_authority` */

DROP TABLE IF EXISTS `jhi_user_authority`;

CREATE TABLE `jhi_user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jhi_user_authority` */

/*Table structure for table `t_attachment` */

DROP TABLE IF EXISTS `t_attachment`;

CREATE TABLE `t_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(60) NOT NULL,
  `front` varchar(255) NOT NULL,
  `back` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taxi_driver_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attachment_taxi_driver_id` (`taxi_driver_id`),
  CONSTRAINT `fk_attachment_taxi_driver_id` FOREIGN KEY (`taxi_driver_id`) REFERENCES `t_taxi_driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

/*Data for the table `t_attachment` */

/*Table structure for table `t_capture` */

DROP TABLE IF EXISTS `t_capture`;

CREATE TABLE `t_capture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `valeur` longblob NOT NULL,
  `valeur_content_type` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `attachment_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_capture_attachment_id` (`attachment_id`),
  CONSTRAINT `fk_capture_attachment_id` FOREIGN KEY (`attachment_id`) REFERENCES `t_attachment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_capture` */

/*Table structure for table `t_city` */

DROP TABLE IF EXISTS `t_city`;

CREATE TABLE `t_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `version` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_city` */

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(30) NOT NULL,
  `value` varchar(255) NOT NULL,
  `taxi_driver_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_taxi_driver_id` (`taxi_driver_id`),
  CONSTRAINT `fk_comment_taxi_driver_id` FOREIGN KEY (`taxi_driver_id`) REFERENCES `t_taxi_driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

/*Table structure for table `t_conduire` */

DROP TABLE IF EXISTS `t_conduire`;

CREATE TABLE `t_conduire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tutilaire` bit(1) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `raison_retrait` varchar(255) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taxi_driver_id` bigint(20) NOT NULL,
  `vehicule_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_conduire_taxi_driver_id` (`taxi_driver_id`),
  KEY `fk_conduire_vehicule_id` (`vehicule_id`),
  CONSTRAINT `fk_conduire_taxi_driver_id` FOREIGN KEY (`taxi_driver_id`) REFERENCES `t_taxi_driver` (`id`),
  CONSTRAINT `fk_conduire_vehicule_id` FOREIGN KEY (`vehicule_id`) REFERENCES `t_vehicule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_conduire` */

/*Table structure for table `t_like_driver` */

DROP TABLE IF EXISTS `t_like_driver`;

CREATE TABLE `t_like_driver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(30) NOT NULL,
  `valeur` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taxi_driver_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_like_taxi_driver_id` (`taxi_driver_id`),
  CONSTRAINT `fk_like_taxi_driver_id` FOREIGN KEY (`taxi_driver_id`) REFERENCES `t_taxi_driver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_like_driver` */

/*Table structure for table `t_organisation` */

DROP TABLE IF EXISTS `t_organisation`;

CREATE TABLE `t_organisation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `abreviation` varchar(155) NOT NULL,
  `version` int(11) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(255) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logo` longblob,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `NATURE` varchar(30) DEFAULT NULL,
  `SERIAL_NUMBER` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `SERIAL_NUMBER` (`SERIAL_NUMBER`),
  UNIQUE KEY `idx_organisation_serial_number` (`SERIAL_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_organisation` */

/*Table structure for table `t_passager` */

DROP TABLE IF EXISTS `t_passager`;

CREATE TABLE `t_passager` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone` varchar(35) NOT NULL,
  `nom_prenom` varchar(255) NOT NULL,
  `lieu_arrive` varchar(255) NOT NULL,
  `lieu_depart` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,2) DEFAULT NULL,
  `longitude` decimal(10,2) DEFAULT NULL,
  `divers` longtext,
  `phone_imei` varchar(255) DEFAULT NULL,
  `phone_serial_number` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taxi_driver_id` bigint(20) DEFAULT NULL,
  `version` int(11) NOT NULL,
  `CODE` varchar(150) DEFAULT NULL,
  `NATURE` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CODE` (`CODE`),
  UNIQUE KEY `idx_passager_code` (`CODE`),
  KEY `fk_passager_taxi_driver_id` (`taxi_driver_id`),
  CONSTRAINT `fk_passager_taxi_driver_id` FOREIGN KEY (`taxi_driver_id`) REFERENCES `t_taxi_driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;

/*Data for the table `t_passager` */

/*Table structure for table `t_passager_coordonnees` */

DROP TABLE IF EXISTS `t_passager_coordonnees`;

CREATE TABLE `t_passager_coordonnees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `latitude` decimal(10,2) NOT NULL,
  `longitude` decimal(10,2) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `passager_id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_passager_coordonnee_passager_id` (`passager_id`),
  CONSTRAINT `fk_passager_coordonnee_passager_id` FOREIGN KEY (`passager_id`) REFERENCES `t_passager` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_passager_coordonnees` */

/*Table structure for table `t_photo` */

DROP TABLE IF EXISTS `t_photo`;

CREATE TABLE `t_photo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `valeur` longblob NOT NULL,
  `valeur_content_type` varchar(255) DEFAULT NULL,
  `taxi_driver_code` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taxi_driver_id` bigint(20) DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_taxi_driver_id` (`taxi_driver_id`),
  CONSTRAINT `fk_photo_taxi_driver_id` FOREIGN KEY (`taxi_driver_id`) REFERENCES `t_taxi_driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_photo` */

/*Table structure for table `t_photo_profile` */

DROP TABLE IF EXISTS `t_photo_profile`;

CREATE TABLE `t_photo_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `valeur` longblob NOT NULL,
  `valeur_content_type` varchar(255) DEFAULT NULL,
  `user_login` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` bigint(20) DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_photo_profile_jhi_user_id` (`user_id`),
  CONSTRAINT `fk_t_photo_profile_jhi_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_photo_profile` */

/*Table structure for table `t_piece_capacity` */

DROP TABLE IF EXISTS `t_piece_capacity`;

CREATE TABLE `t_piece_capacity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `valeur` longblob NOT NULL,
  `valeur_content_type` varchar(255) DEFAULT NULL,
  `taxi_driver_code` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taxi_driver_id` bigint(20) DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_capacity_taxi_driver_id` (`taxi_driver_id`),
  CONSTRAINT `fk_capacity_taxi_driver_id` FOREIGN KEY (`taxi_driver_id`) REFERENCES `t_taxi_driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_piece_capacity` */

/*Table structure for table `t_piece_cni` */

DROP TABLE IF EXISTS `t_piece_cni`;

CREATE TABLE `t_piece_cni` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `valeur` longblob NOT NULL,
  `valeur_content_type` varchar(255) DEFAULT NULL,
  `taxi_driver_code` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taxi_driver_id` bigint(20) DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cni_taxi_driver_id` (`taxi_driver_id`),
  CONSTRAINT `fk_cni_taxi_driver_id` FOREIGN KEY (`taxi_driver_id`) REFERENCES `t_taxi_driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_piece_cni` */

/*Table structure for table `t_piece_driving_license` */

DROP TABLE IF EXISTS `t_piece_driving_license`;

CREATE TABLE `t_piece_driving_license` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `valeur` longblob NOT NULL,
  `valeur_content_type` varchar(255) DEFAULT NULL,
  `taxi_driver_code` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taxi_driver_id` bigint(20) DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_driving_license_taxi_driver_id` (`taxi_driver_id`),
  CONSTRAINT `fk_driving_license_taxi_driver_id` FOREIGN KEY (`taxi_driver_id`) REFERENCES `t_taxi_driver` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_piece_driving_license` */

/*Table structure for table `t_proprietaire_vehicule` */

DROP TABLE IF EXISTS `t_proprietaire_vehicule`;

CREATE TABLE `t_proprietaire_vehicule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `matricule` varchar(255) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_proprietaire_vehicule` */

/*Table structure for table `t_recepisse` */

DROP TABLE IF EXISTS `t_recepisse`;

CREATE TABLE `t_recepisse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  `num_recepisse` varchar(60) NOT NULL,
  `date_delivrance` date NOT NULL,
  `date_validite_recepisse` date NOT NULL,
  `periode_validite` int(11) NOT NULL,
  `telephone_number` varchar(30) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `capacity_number` varchar(30) NOT NULL,
  `driving_license_number` varchar(30) NOT NULL,
  `nicn` varchar(30) NOT NULL,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `organisation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_recepisse_capacity_number` (`capacity_number`),
  UNIQUE KEY `idx_recepisse_driving_license_number` (`driving_license_number`),
  UNIQUE KEY `idx_recepisse_nicn` (`nicn`),
  UNIQUE KEY `idx_recepisse_telephone` (`telephone_number`),
  UNIQUE KEY `idx_recepisse_num_recepisse` (`num_recepisse`),
  UNIQUE KEY `idx_recepisse_email_address` (`email_address`),
  KEY `fk_recepisse_city_id` (`city_id`),
  KEY `fk_recepisse_organisation_id` (`organisation_id`),
  CONSTRAINT `fk_recepisse_city_id` FOREIGN KEY (`city_id`) REFERENCES `t_city` (`id`),
  CONSTRAINT `fk_recepisse_organisation_id` FOREIGN KEY (`organisation_id`) REFERENCES `t_organisation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `t_recepisse` */

/*Table structure for table `t_score` */

DROP TABLE IF EXISTS `t_score`;

CREATE TABLE `t_score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(30) NOT NULL,
  `score` tinyint(4) NOT NULL,
  `taxi_driver_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_score_telephone_taxi_driver_id_uk` (`telephone`,`taxi_driver_id`),
  KEY `fk_score_taxi_driver_id` (`taxi_driver_id`),
  CONSTRAINT `fk_score_taxi_driver_id` FOREIGN KEY (`taxi_driver_id`) REFERENCES `t_taxi_driver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_score` */

/*Table structure for table `t_self_registry` */

DROP TABLE IF EXISTS `t_self_registry`;

CREATE TABLE `t_self_registry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  `activated_code` varchar(60) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `activated_code_expired_date` date NOT NULL,
  `organisation_id` bigint(20) DEFAULT NULL,
  `SITUATION` varchar(30) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_self_registry_telephone` (`telephone`),
  UNIQUE KEY `idx_self_registry_email_address` (`email_address`),
  KEY `fk_self_registry_organisation_id` (`organisation_id`),
  CONSTRAINT `fk_self_registry_organisation_id` FOREIGN KEY (`organisation_id`) REFERENCES `t_organisation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_self_registry` */

/*Table structure for table `t_taxi_driver` */

DROP TABLE IF EXISTS `t_taxi_driver`;

CREATE TABLE `t_taxi_driver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birth_date` date NOT NULL,
  `capacity_number` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `driving_license_number` varchar(255) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `nicn` varchar(255) NOT NULL,
  `place_of_birth` varchar(255) NOT NULL,
  `telephone_number` varchar(255) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(11) NOT NULL,
  `nationalite` varchar(255) DEFAULT NULL,
  `departement_origine` varchar(255) DEFAULT NULL,
  `situation_matrimoniale` varchar(255) DEFAULT NULL,
  `domicile` varchar(255) DEFAULT NULL,
  `tel_urgent` varchar(255) DEFAULT NULL,
  `num_recepisse` varchar(255) DEFAULT NULL,
  `city_id` bigint(20) NOT NULL,
  `organisation_id` bigint(20) DEFAULT NULL,
  `SITUATION` varchar(30) DEFAULT NULL,
  `capacity_expired_date` date DEFAULT NULL,
  `driving_license_expired_date` date DEFAULT NULL,
  `nicn_expired_date` date DEFAULT NULL,
  `date_validite_badge` date DEFAULT NULL,
  `telephone_number_bis` varchar(255) DEFAULT NULL,
  `lieu_nicn` varchar(255) DEFAULT NULL,
  `timbre_fiscal` varchar(100) DEFAULT NULL,
  `recepisse_taxi_driver_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_taxi_driver_telephone_number_bis` (`telephone_number_bis`),
  KEY `fk_taxi_driver_city_id` (`city_id`),
  KEY `fk_taxi_driver_organisation_id` (`organisation_id`),
  KEY `fk_recepisse_id` (`recepisse_taxi_driver_id`),
  CONSTRAINT `fk_recepisse_id` FOREIGN KEY (`recepisse_taxi_driver_id`) REFERENCES `t_recepisse` (`id`),
  CONSTRAINT `fk_taxi_driver_city_id` FOREIGN KEY (`city_id`) REFERENCES `t_city` (`id`),
  CONSTRAINT `fk_taxi_driver_organisation_id` FOREIGN KEY (`organisation_id`) REFERENCES `t_organisation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

/*Data for the table `t_taxi_driver` */

/*Table structure for table `t_vehicule` */

DROP TABLE IF EXISTS `t_vehicule`;

CREATE TABLE `t_vehicule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(35) NOT NULL,
  `proprietaire` varchar(255) NOT NULL,
  `num_portiere` varchar(255) NOT NULL,
  `cni_proprietaire` varchar(15) NOT NULL,
  `num_carte_grise` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vehicule_carte_grise` (`num_carte_grise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_vehicule` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
