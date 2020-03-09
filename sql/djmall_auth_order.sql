/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : three_homework

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-09 16:23:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for djmall_auth_order
-- ----------------------------
DROP TABLE IF EXISTS `djmall_auth_order`;
CREATE TABLE `djmall_auth_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `product_id` int(11) DEFAULT NULL COMMENT '购买商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '购买人',
  `product_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品价钱',
  `is_del` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '是否删除 1:删除 0:未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of djmall_auth_order
-- ----------------------------
INSERT INTO `djmall_auth_order` VALUES ('2', '34', '45', '2', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('3', '34', '45', '3', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('4', '35', '45', '4', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('5', '34', '44', '5', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('6', '36', '45', '洗浴牛奶', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('7', '37', '45', '搓泥宝', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('8', '38', '45', '8', '30.00', '0');
