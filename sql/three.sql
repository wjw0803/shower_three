/*
Navicat MySQL Data Transfer

Source Server         : test_dj
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : three

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-06 10:20:45
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

-- ----------------------------
-- Table structure for djmall_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `djmall_auth_role`;
CREATE TABLE `djmall_auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
  `is_del` int(11) NOT NULL COMMENT '是否删除 1正常 0删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of djmall_auth_role
-- ----------------------------
INSERT INTO `djmall_auth_role` VALUES ('1', '用户', '1');
INSERT INTO `djmall_auth_role` VALUES ('2', '管理员', '1');
INSERT INTO `djmall_auth_role` VALUES ('3', '商户', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of djmall_auth_user
-- ----------------------------
INSERT INTO `djmall_auth_user` VALUES ('44', '用户1', 'zss', '29dab5f4fd115c3b4a9f30d644dc3fad', '1', '1', '13753713211', '3424235235@qq.com', '1', '2020-02-17 16:22:42', '2020-02-19 19:12:02', null, 'c692e7368fd802d8d7084fbd37dbf9f7');
INSERT INTO `djmall_auth_user` VALUES ('45', '管理员', 'bb', '92dc9fe492b93ef0d7704f627bfcdc6a', '1', '1', '15559330182', '815270602@qq.com', '1', '2020-02-17 16:23:13', '2020-03-06 10:19:05', null, '7fb3093e0fafd2a1f09b4bc60263e6e9');
INSERT INTO `djmall_auth_user` VALUES ('46', '商户', 'za', '74b68cf85d4bfe0aae96db6322b16b0a', '1', '1', '13934670753', '815270603@qq.com', '2', '2020-02-17 19:47:40', '2020-02-18 19:31:57', null, '9f2c403c8a88508efd3c80a9f49e140b');
INSERT INTO `djmall_auth_user` VALUES ('47', '用户2', 'www', '7341eed2c432071010e997bbf8fa64a3', '1', '1', '15812345678', '815270611@qq.com', '1', '2020-02-18 16:05:29', '2020-02-18 16:09:10', null, 'ab5850b563cba6f60da730ae41b374c8');

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
