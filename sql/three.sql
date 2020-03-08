/*
Navicat MySQL Data Transfer

Source Server         : test_dj
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : three

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-07 19:02:49
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

-- ----------------------------
-- Table structure for djmall_auth_resource
-- ----------------------------
DROP TABLE IF EXISTS `djmall_auth_resource`;
CREATE TABLE `djmall_auth_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `resource_name` varchar(255) NOT NULL COMMENT '资源名称',
  `url` varchar(255) NOT NULL COMMENT '资源PATH',
  `p_id` int(11) NOT NULL COMMENT '父级id',
  `resource_code` varchar(255) DEFAULT NULL COMMENT '资源编码',
  `resource_type` int(11) NOT NULL COMMENT '资源类型  1菜单 2按钮',
  `is_del` int(11) NOT NULL COMMENT '是否删除 1正常 0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of djmall_auth_resource
-- ----------------------------
INSERT INTO `djmall_auth_resource` VALUES ('1', '权限管理', '/403.jsp', '0', '', '1', '1');
INSERT INTO `djmall_auth_resource` VALUES ('2', '角色管理', '/role/toShow', '1', '', '1', '1');
INSERT INTO `djmall_auth_resource` VALUES ('3', '资源管理', '/resource/toShow', '1', '', '1', '1');
INSERT INTO `djmall_auth_resource` VALUES ('4', '用户管理', '/user/toShow', '0', null, '1', '1');
INSERT INTO `djmall_auth_resource` VALUES ('5', '添加角色', 'role:add', '2', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('6', '修改角色', '/403.jsp', '2', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('7', '删除角色', '/403.jsp', '2', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('8', '关联资源', '/403.jsp', '2', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('9', '新增资源', 'resource:add', '3', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('10', '修改资源', 'resource:update', '3', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('11', '删除资源', 'resource:del', '3', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('12', '用户授权', 'user:confer', '4', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('13', '用户新增', '/403.jsp', '4', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('14', '用户修改', 'user:update', '4', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('15', '用户激活', 'user:updateStatus', '4', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('16', '用户删除', 'user:del', '4', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('17', '用户重置密码', '/403.jsp', '4', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('18', '用户查询', 'user:show', '4', null, '2', '1');

-- ----------------------------
-- Table structure for djmall_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `djmall_auth_role`;
CREATE TABLE `djmall_auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
  `is_del` int(11) NOT NULL COMMENT '是否删除 1正常 0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of djmall_auth_role
-- ----------------------------
INSERT INTO `djmall_auth_role` VALUES ('1', '普通用户', '1');
INSERT INTO `djmall_auth_role` VALUES ('2', '经理', '1');
INSERT INTO `djmall_auth_role` VALUES ('3', '维修工', '1');
INSERT INTO `djmall_auth_role` VALUES ('7', '技师', '1');
INSERT INTO `djmall_auth_role` VALUES ('8', 'vip用户', '1');

-- ----------------------------
-- Table structure for djmall_auth_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `djmall_auth_role_resource`;
CREATE TABLE `djmall_auth_role_resource` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  `is_del` int(11) NOT NULL COMMENT '是否删除 1正常 0删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源表';

-- ----------------------------
-- Records of djmall_auth_role_resource
-- ----------------------------
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '4', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '5', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '6', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '7', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '4', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '13', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '14', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '1', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '2', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '5', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '6', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '7', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '8', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '3', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '9', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '10', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '11', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '4', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '12', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '13', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '14', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '15', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '16', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '17', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '18', '1');

-- ----------------------------
-- Table structure for djmall_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `djmall_auth_user`;
CREATE TABLE `djmall_auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `status` int(11) NOT NULL COMMENT '状态`:-1未激活,1激活',
  `is_del` int(11) NOT NULL COMMENT '是否删除,1正常,0删除',
  `phone` varchar(255) NOT NULL COMMENT '手机',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `sex` int(11) NOT NULL COMMENT '性别1男,2女',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `lastlogin_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `verify` varchar(255) DEFAULT NULL COMMENT '验证码',
  `salt` varchar(255) NOT NULL COMMENT '盐',
  `is_leave` int(11) DEFAULT NULL,
  `is_report` int(11) DEFAULT NULL,
  `account_money` double DEFAULT NULL,
  `is_get_money` int(11) DEFAULT NULL,
  `validate_code_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of djmall_auth_user
-- ----------------------------
INSERT INTO `djmall_auth_user` VALUES ('44', '用户1', 'zss', '29dab5f4fd115c3b4a9f30d644dc3fad', '1', '1', '13753713211', '3424235235@qq.com', '1', '2020-02-17 16:22:42', '2020-03-07 18:56:59', null, 'c692e7368fd802d8d7084fbd37dbf9f7', null, null, null, null, null);
INSERT INTO `djmall_auth_user` VALUES ('45', '管理员', 'bb', '92dc9fe492b93ef0d7704f627bfcdc6a', '1', '1', '15559330182', '815270602@qq.com', '1', '2020-02-17 16:23:13', '2020-03-07 18:55:45', '176292', '7fb3093e0fafd2a1f09b4bc60263e6e9', null, null, null, null, null);
INSERT INTO `djmall_auth_user` VALUES ('46', '商户', 'za', '74b68cf85d4bfe0aae96db6322b16b0a', '1', '1', '13934670753', '815270603@qq.com', '2', '2020-02-17 19:47:40', '2020-02-18 19:31:57', null, '9f2c403c8a88508efd3c80a9f49e140b', null, null, null, null, null);
INSERT INTO `djmall_auth_user` VALUES ('47', '用户2', 'www', '7341eed2c432071010e997bbf8fa64a3', '1', '1', '15812345678', '815270611@qq.com', '1', '2020-02-18 16:05:29', '2020-03-07 18:58:27', null, 'ab5850b563cba6f60da730ae41b374c8', null, null, null, null, null);
INSERT INTO `djmall_auth_user` VALUES ('48', '用户3', 'lss', 'dc1152105d8625873c08a4d4d0d9200f', '-1', '1', '15559330183', '1327801264@qq.com', '1', '2020-03-07 16:32:59', null, null, '74f8e74615db2637ee381449f2ef2f1b', null, null, null, null, null);

-- ----------------------------
-- Table structure for djmall_auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `djmall_auth_user_role`;
CREATE TABLE `djmall_auth_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id     级别  1,用户2,管理员 3,商户',
  `is_del` int(11) NOT NULL COMMENT '是否删除 1正常 0删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of djmall_auth_user_role
-- ----------------------------
INSERT INTO `djmall_auth_user_role` VALUES ('44', '1', '1');
INSERT INTO `djmall_auth_user_role` VALUES ('45', '2', '1');
INSERT INTO `djmall_auth_user_role` VALUES ('46', '3', '1');
INSERT INTO `djmall_auth_user_role` VALUES ('47', '1', '1');
INSERT INTO `djmall_auth_user_role` VALUES ('48', '1', '1');





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
