/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : webapp

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-07-21 17:32:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `address` varchar(150) NOT NULL,
  `tags` varchar(50) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `password` varchar(20) NOT NULL,
  `userphone` varchar(15) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `star` float(3,1) DEFAULT '0.0',
  `speed` int(5) DEFAULT '0',
  `avatar` varchar(20) DEFAULT NULL,
  `opentime` varchar(20) DEFAULT NULL,
  `license` varchar(20) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `tips` varchar(300) DEFAULT NULL,
  `delivercost` int(5) DEFAULT '0',
  `mincost` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('21', '新街口 石鼓路6号', '火锅', '火锅店', '123', '123', '888', '4.5', '18', '1.jpeg', '8:00-21:00', null, '0', '赠饮活动5日止，新上大活动。抢购只能一份，不能加东西在减，否则要退单的。', '6', '30');
INSERT INTO `shop` VALUES ('22', '马群新街 花园城3号', '咖啡', '咖啡厅', '123', '123', '888', '4.0', '22', '2.jpeg', '8:00-17:00', null, '0', '赠饮活动5日止，新上大活动。抢购只能一份，不能加东西在减，否则要退单的。', '8', '35');
INSERT INTO `shop` VALUES ('23', '新街口 石鼓路42号', '日本料理', '日本料理', '123', '123', '888', '4.5', '25', '3.jpeg', '9:00-21:00', null, '0', '本店已在饿了么上线！欢迎各位小主下单！本店优先配送饿了么订单！', '8', '40');
INSERT INTO `shop` VALUES ('24', '新街口 中山路18号', '西餐', '西餐', '123', '123', '888', '4.0', '37', '4.jpeg', '9:00-22:00', null, '0', '顾客朋友们本店火锅冒菜锅底和麻辣香锅锅底只能选择一个，不要选择两个，不然没办法做，', '8', '33');
INSERT INTO `shop` VALUES ('25', '夫子庙 大石坝街48号', '烧烤', '烧烤', '123', '123', '888', '5.0', '35', '5.jpeg', '12:00-24:00', null, '0', '1外卖请一定留详细，`准确的送餐地址和电话，电话保持畅通，这样我们才能及时把餐送到!', '8', '30');
INSERT INTO `shop` VALUES ('26', '大行宫 太平北路56号', '甜点', '面包甜点', '123', '123', '888', '3.5', '23', '6.jpeg', '8:00-21:30', null, '0', '外卖不送上楼，请大家配合谢谢。', '8', '28');
INSERT INTO `shop` VALUES ('27', '江东中路万达百货负一楼', '新疆菜', '新疆菜', '123', '123', '888', '4.0', '40', '7.jpeg', '11:00-22:00', null, '0', '本店专业从事快餐外送业务，专业为企事业单位、学校、个人配送，为了能让您准时用餐，请您每天提前1小时订餐。', '8', '26');
INSERT INTO `shop` VALUES ('28', '中山门大街9号', '川菜', '川菜', '123', '123', '888', '4.0', '30', '8.jpeg', '9:00-21:00', null, '0', '请务必备注用餐人数，香醋和辣油按人数随餐附赠。 订餐须知', '8', '25');
INSERT INTO `shop` VALUES ('29', '太平南路1号新世纪广场', '粤菜', '粤菜', '123', '123', '888', '4.5', '35', '9.jpeg', '9:00-21:00', null, '0', '集食号，为你集结天下美食。请确保您的电话畅通，以便送餐员能及时联系上您', '8', '20');
INSERT INTO `shop` VALUES ('30', '胜太西路28号', '自助餐', '自助餐', '123', '123', '888', '5.0', '27', '10.jpeg', '10:00-22:00', null, '0', '身边的苏客，放心的外卖,拿起手机赶紧点餐吧。', '8', '25');
INSERT INTO `shop` VALUES ('31', '学海路1号', '小吃快餐', '小吃快餐', '123', '123', '888', '4.0', '33', '11.jpeg', '9:00-24:00', null, '0', '可提供发票', '10', '30');
SET FOREIGN_KEY_CHECKS=1;
