/*
Navicat MySQL Data Transfer

Source Server         : test_dj
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : three

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-08 18:32:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for maintain
-- ----------------------------
DROP TABLE IF EXISTS `maintain`;
CREATE TABLE `maintain` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `maintain_time` datetime NOT NULL COMMENT '填写维修时间',
  `maintain_id` varchar(255) NOT NULL COMMENT '维修单号',
  `maintain_project` int(11) NOT NULL COMMENT '维修项目',
  `status` int(11) NOT NULL COMMENT '处理状态 1 已提交  2已审核 3维修完成',
  `is_del` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maintain
-- ----------------------------
INSERT INTO `maintain` VALUES ('1', '2020-02-29 19:23:35', 'QQ20200301145423865♦', '1', '3', '1');
INSERT INTO `maintain` VALUES ('2', '2020-04-01 14:53:47', 'QQ20200301145423865♦', '1', '2', '1');
INSERT INTO `maintain` VALUES ('3', '2020-03-15 15:05:02', 'QQ20200301150519124♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('4', '2020-03-01 15:05:27', 'QQ20200301150533056♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('5', '2020-03-03 09:17:15', 'QQ20200302091729626♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('6', '2020-03-11 14:28:51', 'QQ20200303142900806♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('7', '2020-03-03 16:59:44', 'QQ20200303165953062♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('8', '2020-03-09 16:43:01', 'QQ20200308164318253♦', '6', '2', '0');
INSERT INTO `maintain` VALUES ('9', '2020-03-20 16:55:22', 'OVO20200308165530078♦', '7', '4', '1');
INSERT INTO `maintain` VALUES ('10', '2020-03-10 18:27:10', 'OVO20200308182718747♦', '9', '4', '1');
INSERT INTO `maintain` VALUES ('11', '2020-03-11 18:28:01', 'OVO20200308182807556♦', '9', '2', '1');
