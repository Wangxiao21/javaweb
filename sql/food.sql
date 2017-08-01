/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : webapp

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-21 17:31:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `price` float(5,2) DEFAULT '0.00',
  `shopid` int(5) NOT NULL,
  `reserve` int(10) DEFAULT '0',
  `avatar` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_foodshop` (`shopid`),
  CONSTRAINT `fk_foodshop` FOREIGN KEY (`shopid`) REFERENCES `shop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('11', '炒菜', '宫保鸡丁', '8.00', '21', '12', 'f1.jpg');
INSERT INTO `food` VALUES ('12', '饭类', '黄焖鸡', '8.00', '21', '11', 'f2.jpg');
INSERT INTO `food` VALUES ('13', '特色菜', '叉烧拼盘', '8.00', '21', '10', 'f3.jpg');
INSERT INTO `food` VALUES ('14', '特色菜', '红烧猪肘', '8.00', '21', '10', 'f4.jpg');
INSERT INTO `food` VALUES ('15', '小炒', '辣炒土豆丝', '8.00', '21', '20', 'f5.jpg');
INSERT INTO `food` VALUES ('16', '特色菜', '酱香鸭', '8.00', '21', '20', 'f6.jpg');
INSERT INTO `food` VALUES ('17', '特色菜', '青菜', '8.00', '21', '25', 'f7.jpg');
INSERT INTO `food` VALUES ('18', '炒菜', '小炒肉', '8.00', '21', '33', 'f8.jpg');
INSERT INTO `food` VALUES ('19', '小炒', '土豆丝', '8.00', '21', '20', 'f9.jpg');
INSERT INTO `food` VALUES ('20', '小炒', '回锅肉', '8.00', '21', '20', 'f10.jpg');
INSERT INTO `food` VALUES ('21', '鱼类', '糖醋鱼', '8.00', '21', '20', 'f11.jpg');
INSERT INTO `food` VALUES ('22', '鱼类', '酸菜鱼', '8.00', '21', '30', 'f12.jpg');
INSERT INTO `food` VALUES ('23', '小炒', '麻婆豆腐', '8.00', '21', '23', 'f13.jpg');
INSERT INTO `food` VALUES ('24', '小炒', '青菜干锅', '8.00', '21', '25', 'f14.jpg');
INSERT INTO `food` VALUES ('25', '饭类', '海鲜石锅', '8.00', '21', '21', 'f15.jpg');
INSERT INTO `food` VALUES ('26', '饮料', '巧克力奶茶', '8.00', '21', '20', 'f16.jpg');
INSERT INTO `food` VALUES ('27', '饮料', '柠檬茶', '8.00', '21', '26', 'f17.jpg');
INSERT INTO `food` VALUES ('28', '饮料', '芒果冰沙', '8.00', '21', '33', 'f18.jpg');
INSERT INTO `food` VALUES ('29', '饮料', '咖啡冰沙', '8.00', '21', '23', 'f19.jpg');
SET FOREIGN_KEY_CHECKS=1;
