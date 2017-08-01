/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : webapp

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-21 17:30:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ads
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(20) NOT NULL,
  `pvp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ads_pvp` (`pvp_id`),
  CONSTRAINT `FK_ads_pvp` FOREIGN KEY (`pvp_id`) REFERENCES `pvp` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ads
-- ----------------------------
INSERT INTO `ads` VALUES ('1', '7hao', '1');
INSERT INTO `ads` VALUES ('2', 'dsdfad', '1');
SET FOREIGN_KEY_CHECKS=1;
