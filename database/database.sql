-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.17-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for optimisticmind
DROP DATABASE IF EXISTS `optimisticmind`;
CREATE DATABASE IF NOT EXISTS `optimisticmind` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `optimisticmind`;

-- Dumping structure for table optimisticmind.alergies
DROP TABLE IF EXISTS `alergies`;
CREATE TABLE IF NOT EXISTS `alergies` (
  `alergie_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`alergie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.alergies: ~0 rows (approximately)
/*!40000 ALTER TABLE `alergies` DISABLE KEYS */;
/*!40000 ALTER TABLE `alergies` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.alergies_partners
DROP TABLE IF EXISTS `alergies_partners`;
CREATE TABLE IF NOT EXISTS `alergies_partners` (
  `alergie_partner_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk__pars_partner_id` int(11) NOT NULL,
  `fk_alergie_id` int(11) NOT NULL,
  PRIMARY KEY (`alergie_partner_id`),
  KEY `FK__patients_alg__patient_id` (`fk__pars_partner_id`),
  KEY `FK_alergies_partners_alergies` (`fk_alergie_id`),
  CONSTRAINT `FK__patients_alg__patient_id` FOREIGN KEY (`fk__pars_partner_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `FK_alergies_partners_alergies` FOREIGN KEY (`fk_alergie_id`) REFERENCES `alergies` (`alergie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.alergies_partners: ~0 rows (approximately)
/*!40000 ALTER TABLE `alergies_partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `alergies_partners` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.days
DROP TABLE IF EXISTS `days`;
CREATE TABLE IF NOT EXISTS `days` (
  `day_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`day_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.days: ~0 rows (approximately)
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
INSERT INTO `days` (`day_id`, `name`) VALUES
	(1, 'Monday');
/*!40000 ALTER TABLE `days` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.diet
DROP TABLE IF EXISTS `diet`;
CREATE TABLE IF NOT EXISTS `diet` (
  `diet_id` int(11) NOT NULL,
  `ingridients` mediumtext NOT NULL,
  `days` date DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `notes` mediumtext,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY (`diet_id`),
  KEY `FK_diet_patients` (`patient_id`),
  CONSTRAINT `FK_diet_patients` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.diet: ~0 rows (approximately)
/*!40000 ALTER TABLE `diet` DISABLE KEYS */;
/*!40000 ALTER TABLE `diet` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.diseases
DROP TABLE IF EXISTS `diseases`;
CREATE TABLE IF NOT EXISTS `diseases` (
  `desises_id` int(11) NOT NULL AUTO_INCREMENT,
  `sympthoms` varchar(200) NOT NULL,
  `dosis` varchar(200) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`desises_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.diseases: ~0 rows (approximately)
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.equipments
DROP TABLE IF EXISTS `equipments`;
CREATE TABLE IF NOT EXISTS `equipments` (
  `equipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.equipments: ~0 rows (approximately)
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.equipments_patients
DROP TABLE IF EXISTS `equipments_patients`;
CREATE TABLE IF NOT EXISTS `equipments_patients` (
  `equipment_patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_equipment_id` int(11) NOT NULL,
  `fk_patient_id` int(11) NOT NULL,
  PRIMARY KEY (`equipment_patient_id`),
  KEY `FK_equipments_patients_equipments` (`fk_equipment_id`),
  KEY `FK_equipments_patients_patients` (`fk_patient_id`),
  CONSTRAINT `FK_equipments_patients_equipments` FOREIGN KEY (`fk_equipment_id`) REFERENCES `equipments` (`equipment_id`),
  CONSTRAINT `FK_equipments_patients_patients` FOREIGN KEY (`fk_patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.equipments_patients: ~0 rows (approximately)
/*!40000 ALTER TABLE `equipments_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipments_patients` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.family_,members
DROP TABLE IF EXISTS `family_,members`;
CREATE TABLE IF NOT EXISTS `family_,members` (
  `member_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `home_phone` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.family_,members: ~0 rows (approximately)
/*!40000 ALTER TABLE `family_,members` DISABLE KEYS */;
/*!40000 ALTER TABLE `family_,members` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.location
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `short` varchar(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.location: ~14 rows (approximately)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`location_id`, `short`, `name`, `country`) VALUES
	(1, 'ABC', 'ABC', '0ABC'),
	(2, 'AB', 'Alberta', 'CA'),
	(3, 'BC', 'British Columbia', 'CA'),
	(4, 'MB', 'Manitoba', 'CA'),
	(5, 'NB', 'New Brunswick', 'CA'),
	(6, 'NL', 'Newfoundland and Labrador', 'CA'),
	(7, 'NS', 'Nova Scotia', 'CA'),
	(8, 'NU', 'Nunavut', 'CA'),
	(9, 'NT', 'Northwest Territories', 'CA'),
	(10, 'ON', 'Ontario', 'CA'),
	(11, 'PE', 'Prince Edward Island', 'CA'),
	(12, 'QC', 'Quebec', 'CA'),
	(13, 'SK', 'Saskatchewan', 'CA'),
	(14, 'YT', 'Yukon', 'CA');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.medications
DROP TABLE IF EXISTS `medications`;
CREATE TABLE IF NOT EXISTS `medications` (
  `medication_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dosis` varchar(50) NOT NULL,
  `day_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`medication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.medications: ~0 rows (approximately)
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.notes
DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `note_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `importance` int(11) NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.notes: ~0 rows (approximately)
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.partners_family_members
DROP TABLE IF EXISTS `partners_family_members`;
CREATE TABLE IF NOT EXISTS `partners_family_members` (
  `partners_family_id` int(11) NOT NULL AUTO_INCREMENT,
  `partners_id` int(11) NOT NULL,
  `members_id` int(11) NOT NULL,
  PRIMARY KEY (`partners_family_id`),
  UNIQUE KEY `partners_family_id` (`partners_family_id`),
  KEY `FK__patients` (`partners_id`),
  KEY `FK__family_,members` (`members_id`),
  CONSTRAINT `FK__family_,members` FOREIGN KEY (`members_id`) REFERENCES `family_,members` (`member_id`),
  CONSTRAINT `FK__patients` FOREIGN KEY (`partners_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.partners_family_members: ~0 rows (approximately)
/*!40000 ALTER TABLE `partners_family_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners_family_members` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.partners_medications
DROP TABLE IF EXISTS `partners_medications`;
CREATE TABLE IF NOT EXISTS `partners_medications` (
  `partner_medication_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_par_med_partner_id` int(11) NOT NULL,
  `fk_par_med_medication_id` int(11) NOT NULL,
  PRIMARY KEY (`partner_medication_id`),
  KEY `FK__patients_patient_id` (`fk_par_med_partner_id`),
  KEY `FK__medications_medication_id` (`fk_par_med_medication_id`),
  CONSTRAINT `FK__medications_medication_id` FOREIGN KEY (`fk_par_med_medication_id`) REFERENCES `medications` (`medication_id`),
  CONSTRAINT `FK__patients_patient_id` FOREIGN KEY (`fk_par_med_partner_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.partners_medications: ~0 rows (approximately)
/*!40000 ALTER TABLE `partners_medications` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners_medications` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.patients
DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `dob` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `religion` varchar(50) NOT NULL,
  `eyewear` int(11) NOT NULL,
  `language` varchar(50) NOT NULL,
  `doctor` varchar(50) NOT NULL,
  `location_id` int(11) NOT NULL,
  `stage_dementia_id` int(11) NOT NULL,
  `tYpe_dementia_id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `FK_patients_location` (`location_id`),
  KEY `FK_patients_stage_dementia` (`stage_dementia_id`),
  KEY `FK_patients_type_users` (`tYpe_dementia_id`),
  KEY `FK_patients_notes` (`note_id`),
  CONSTRAINT `FK_patients_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `FK_patients_notes` FOREIGN KEY (`note_id`) REFERENCES `notes` (`note_id`),
  CONSTRAINT `FK_patients_stage_dementia` FOREIGN KEY (`stage_dementia_id`) REFERENCES `stage_dementia` (`id_stage`),
  CONSTRAINT `FK_patients_type_users` FOREIGN KEY (`tYpe_dementia_id`) REFERENCES `type_users` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.patients: ~0 rows (approximately)
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.patients_desiesea
DROP TABLE IF EXISTS `patients_desiesea`;
CREATE TABLE IF NOT EXISTS `patients_desiesea` (
  `patient_desiese_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_patients_patient_id` int(11) NOT NULL,
  `fk_desieses_desies_id` int(11) NOT NULL,
  PRIMARY KEY (`patient_desiese_id`),
  KEY `FK__patients_id` (`fk_patients_patient_id`),
  KEY `FK__diseases_id` (`fk_desieses_desies_id`),
  CONSTRAINT `FK__diseases_id` FOREIGN KEY (`fk_desieses_desies_id`) REFERENCES `diseases` (`desises_id`),
  CONSTRAINT `FK__patients_id` FOREIGN KEY (`fk_patients_patient_id`) REFERENCES `patients` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.patients_desiesea: ~0 rows (approximately)
/*!40000 ALTER TABLE `patients_desiesea` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients_desiesea` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.stage_dementia
DROP TABLE IF EXISTS `stage_dementia`;
CREATE TABLE IF NOT EXISTS `stage_dementia` (
  `id_stage` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `dignosis` varchar(50) NOT NULL,
  PRIMARY KEY (`id_stage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.stage_dementia: ~0 rows (approximately)
/*!40000 ALTER TABLE `stage_dementia` DISABLE KEYS */;
/*!40000 ALTER TABLE `stage_dementia` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.type_dementia
DROP TABLE IF EXISTS `type_dementia`;
CREATE TABLE IF NOT EXISTS `type_dementia` (
  `type_dementia_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`type_dementia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.type_dementia: ~0 rows (approximately)
/*!40000 ALTER TABLE `type_dementia` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_dementia` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.type_users
DROP TABLE IF EXISTS `type_users`;
CREATE TABLE IF NOT EXISTS `type_users` (
  `type_id` int(11) NOT NULL,
  `type_name` int(11) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table optimisticmind.type_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `type_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_users` ENABLE KEYS */;

-- Dumping structure for table optimisticmind.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dob` datetime NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `FK_users_type_users` (`type_id`),
  CONSTRAINT `FK_users_type_users` FOREIGN KEY (`type_id`) REFERENCES `type_users` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `users` values(01,"optimistic", "mind", "optimind", "123456","09-12-1988","hi@hi.ca","5193332233",01);

INSERT INTO `type_users` values(01,05);

-- Dumping data for table optimisticmind.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
