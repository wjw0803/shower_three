/*
Navicat MySQL Data Transfer

Source Server         : localhostMysql
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : three

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-07 15:32:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for djmall_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `djmall_auth_user`;
CREATE TABLE `djmall_auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ''用户id'',
  `user_name` varchar(255) NOT NULL COMMENT ''用户名'',
  `nickname` varchar(255) NOT NULL COMMENT ''昵称'',
  `password` varchar(255) NOT NULL COMMENT ''密码'',
  `status` int(11) NOT NULL COMMENT ''状态`:-1未激活,1激活'',
  `is_del` int(11) NOT NULL COMMENT ''是否删除,1正常,0删除'',
  `phone` varchar(255) NOT NULL COMMENT ''手机'',
  `email` varchar(255) NOT NULL COMMENT ''邮箱'',
  `sex` int(11) NOT NULL COMMENT ''性别1男,2女'',
  `register_time` datetime NOT NULL COMMENT ''注册时间'',
  `lastlogin_time` datetime DEFAULT NULL COMMENT ''最后登录时间'',
  `verify` varchar(255) DEFAULT NULL COMMENT ''验证码'',
  `salt` varchar(255) NOT NULL COMMENT ''盐'',
  `is_leave` int(11) DEFAULT NULL COMMENT ''辞职状态:0:辞职1:在岗'',
  `is_report` int(11) DEFAULT NULL COMMENT ''是否举报,默认为0,举报1次加1次'',
  `account_money` double DEFAULT NULL COMMENT ''账户余额'',
  `is_get_money` int(11) DEFAULT NULL COMMENT ''是否领取新人福利,0:未领取1:已领取'',
  `validate_code_time` datetime DEFAULT NULL COMMENT ''vip失效时间'',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT=''用户表'';

-- ----------------------------
-- Records of djmall_auth_user
-- ----------------------------
INSERT INTO `djmall_auth_user` VALUES (''44'', ''用户1'', ''zss'', ''29dab5f4fd115c3b4a9f30d644dc3fad'', ''1'', ''1'', ''13753713211'', ''3424235235@qq.com'', ''1'', ''2020-02-17 16:22:42'', ''2020-03-07 11:20:38'', null, ''c692e7368fd802d8d7084fbd37dbf9f7'', null, null, null, null, null);
INSERT INTO `djmall_auth_user` VALUES (''45'', ''管理员'', ''bb'', ''92dc9fe492b93ef0d7704f627bfcdc6a'', ''1'', ''1'', ''15559330182'', ''815270602@qq.com'', ''1'', ''2020-02-17 16:23:13'', ''2020-03-07 10:58:56'', null, ''7fb3093e0fafd2a1f09b4bc60263e6e9'', null, null, null, null, null);
INSERT INTO `djmall_auth_user` VALUES (''46'', ''商户'', ''za'', ''74b68cf85d4bfe0aae96db6322b16b0a'', ''1'', ''1'', ''13934670753'', ''815270603@qq.com'', ''2'', ''2020-02-17 19:47:40'', ''2020-02-18 19:31:57'', null, ''9f2c403c8a88508efd3c80a9f49e140b'', null, null, null, null, null);
INSERT INTO `djmall_auth_user` VALUES (''47'', ''用户2'', ''www'', ''7341eed2c432071010e997bbf8fa64a3'', ''1'', ''1'', ''15812345678'', ''815270611@qq.com'', ''1'', ''2020-02-18 16:05:29'', ''2020-02-18 16:09:10'', null, ''ab5850b563cba6f60da730ae41b374c8'', null, null, null, null, null);
