/*
Navicat MySQL Data Transfer

Source Server         : test_dj
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : three

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-08 18:32:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for basic_data
-- ----------------------------
DROP TABLE IF EXISTS `basic_data`;
CREATE TABLE `basic_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_name` varchar(255) NOT NULL,
  `p_id` int(11) NOT NULL,
  `is_del` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_data
-- ----------------------------
INSERT INTO `basic_data` VALUES ('1', '处理状态', '0', '1');
INSERT INTO `basic_data` VALUES ('2', '已预约', '1', '1');
INSERT INTO `basic_data` VALUES ('3', '待审核', '1', '1');
INSERT INTO `basic_data` VALUES ('4', '已通过', '1', '1');
INSERT INTO `basic_data` VALUES ('5', '维修项目', '0', '1');
INSERT INTO `basic_data` VALUES ('6', '插座', '5', '1');
INSERT INTO `basic_data` VALUES ('7', '灯具', '5', '1');
INSERT INTO `basic_data` VALUES ('8', '空调', '5', '1');
INSERT INTO `basic_data` VALUES ('9', '电视', '5', '1');
INSERT INTO `basic_data` VALUES ('10', '电脑', '5', '1');
