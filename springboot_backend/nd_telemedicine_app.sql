/*
 Navicat Premium Data Transfer

 Source Server         : tencent cloud
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : 49.234.121.26:3306
 Source Schema         : nd_telemedicine_app

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 22/08/2022 12:20:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nd_appointment
-- ----------------------------
DROP TABLE IF EXISTS `nd_appointment`;
CREATE TABLE `nd_appointment` (
  `id` bigint(20) DEFAULT NULL,
  `patient_id` bigint(20) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `nd_appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `nd_user` (`id`),
  CONSTRAINT `nd_appointment_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `nd_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for nd_chat
-- ----------------------------
DROP TABLE IF EXISTS `nd_chat`;
CREATE TABLE `nd_chat` (
  `id` bigint(20) NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `time` datetime NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  CONSTRAINT `nd_chat_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `nd_user` (`id`),
  CONSTRAINT `nd_chat_ibfk_2` FOREIGN KEY (`to_id`) REFERENCES `nd_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for nd_doctor_availability
-- ----------------------------
DROP TABLE IF EXISTS `nd_doctor_availability`;
CREATE TABLE `nd_doctor_availability` (
  `doctor_id` bigint(20) DEFAULT NULL,
  `available_time_from` datetime DEFAULT NULL,
  `available_time_to` datetime DEFAULT NULL,
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `nd_doctor_availability_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `nd_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for nd_health_condition
-- ----------------------------
DROP TABLE IF EXISTS `nd_health_condition`;
CREATE TABLE `nd_health_condition` (
  `patient_id` bigint(20) NOT NULL,
  `health_condition` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`patient_id`,`health_condition`,`date`),
  CONSTRAINT `nd_health_condition_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `nd_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for nd_user
-- ----------------------------
DROP TABLE IF EXISTS `nd_user`;
CREATE TABLE `nd_user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `nd_user_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `nd_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
