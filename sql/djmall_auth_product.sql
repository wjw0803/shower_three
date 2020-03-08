/*
Navicat MySQL Data Transfer

Source Server         : HEZI
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : three

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-08 16:54:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for djmall_auth_product
-- ----------------------------
DROP TABLE IF EXISTS `djmall_auth_product`;
CREATE TABLE `djmall_auth_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `status` int(255) DEFAULT NULL COMMENT '0:下架,1:上架',
  `message` varchar(255) DEFAULT NULL COMMENT '产品说明',
  `user_id` int(11) DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_del` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djmall_auth_product
-- ----------------------------
INSERT INTO `djmall_auth_product` VALUES ('34', '浴盐', '20.00', '1', '除螨止痒去鸡皮去角质', '45', '2019-12-04 22:39:11', '2019-12-05 16:40:34', '1');
INSERT INTO `djmall_auth_product` VALUES ('35', '浴油', '20.00', '1', '焕白透亮滋养保湿', '45', '2019-12-04 22:39:19', '2020-03-04 13:44:53', '1');
INSERT INTO `djmall_auth_product` VALUES ('36', '洗浴牛奶', '20.00', '1', '保湿润白滋润', '45', '2019-12-04 22:39:27', '2019-12-05 16:41:07', '1');
INSERT INTO `djmall_auth_product` VALUES ('37', '搓泥宝', '20.00', '1', '去泥去死皮去角质', '45', '2019-12-04 22:39:36', '2019-12-04 22:39:36', '1');
INSERT INTO `djmall_auth_product` VALUES ('38', '精油', '30.00', '1', '去黑头果酸修护毛孔粗大', '45', '2019-12-05 16:19:21', '2019-12-05 16:19:21', '1');
INSERT INTO `djmall_auth_product` VALUES ('39', '沐浴液', '18.00', '1', '润滑滋养持久留香', '45', '2019-12-05 16:20:06', '2019-12-05 16:20:06', '1');
INSERT INTO `djmall_auth_product` VALUES ('40', '剃须刀', '15.00', '1', '彰显男士自信魅力', '45', '2019-12-05 16:19:21', '2019-12-05 16:19:21', '1');
INSERT INTO `djmall_auth_product` VALUES ('41', '沐浴球', '5.00', '1', '可爱搓澡搓背起泡', '45', '2020-03-27 13:16:57', '2020-03-18 13:17:00', '1');
INSERT INTO `djmall_auth_product` VALUES ('42', '搓澡巾', '10.00', '1', '搓灰搓泥手套不疼', '45', '2020-03-27 15:16:57', '2020-03-08 16:53:33', '1');
INSERT INTO `djmall_auth_product` VALUES ('43', '干发帽', '12.00', '1', '吸水速干方便', '45', '2020-03-08 16:53:24', '2020-03-08 16:53:37', '1');
