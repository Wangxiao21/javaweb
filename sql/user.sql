/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : webapp

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-21 17:32:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `phone` varchar(15) NOT NULL DEFAULT 'userphone',
  `mail` varchar(30) DEFAULT NULL,
  `nickname` varchar(36) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `avatar` varchar(20) DEFAULT NULL,
  `favor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`phone`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123', null, null, '123', '南京市玄武区 马群新街花园城 wangxiao 1830518', null, null, null);
SET FOREIGN_KEY_CHECKS=1;
