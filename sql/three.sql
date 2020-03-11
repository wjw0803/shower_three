/*
Navicat MySQL Data Transfer

Source Server         : test_dj
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : three

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-03-11 11:04:55
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of djmall_auth_order
-- ----------------------------
INSERT INTO `djmall_auth_order` VALUES ('2', '34', '45', '2', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('3', '34', '45', '3', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('4', '35', '45', '4', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('5', '34', '44', '5', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('6', '36', '45', '6', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('7', '37', '45', '7', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('8', '38', '45', '8', '30.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('9', '35', '45', '9', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('10', '37', '45', '10', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('11', '38', '45', '11', '30.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('12', '34', '44', '浴盐', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('13', '35', '44', '浴油', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('14', '36', '44', '洗浴牛奶', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('15', '37', '44', '搓泥宝', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('16', '37', '44', '搓泥宝', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('17', '38', '44', '精油', '30.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('18', '35', '44', '浴油', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('19', '36', '44', '洗浴牛奶', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('20', '37', '44', '搓泥宝', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('21', '38', '44', '精油', '30.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('22', '35', '44', '浴油', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('23', '36', '44', '洗浴牛奶', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('24', '37', '44', '搓泥宝', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('25', '37', '44', '搓泥宝', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('26', '34', '45', '26', '20.00', '0');
INSERT INTO `djmall_auth_order` VALUES ('27', '35', '45', '浴油', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('28', '34', '45', '浴盐', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('29', '35', '45', '浴油', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('30', '36', '45', '洗浴牛奶', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('31', '34', '49', '浴盐', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('32', '35', '49', '浴油', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('33', '35', '49', '浴油', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('34', '36', '49', '洗浴牛奶', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('35', '37', '49', '搓泥宝', '20.00', '1');
INSERT INTO `djmall_auth_order` VALUES ('36', '37', '49', '搓泥宝', '20.00', '1');

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
INSERT INTO `djmall_auth_product` VALUES ('34', '浴盐', '20.00', '1', '除螨止痒去鸡皮去角质.', '45', '2019-12-04 22:39:11', '2020-03-09 14:14:09', '1');
INSERT INTO `djmall_auth_product` VALUES ('35', '浴油', '20.00', '1', '焕白透亮滋养保湿', '45', '2019-12-04 22:39:19', '2020-03-04 13:44:53', '1');
INSERT INTO `djmall_auth_product` VALUES ('36', '洗浴牛奶', '20.00', '1', '保湿润白滋润', '45', '2019-12-04 22:39:27', '2019-12-05 16:41:07', '1');
INSERT INTO `djmall_auth_product` VALUES ('37', '搓泥宝', '20.00', '1', '去泥去死皮去角质', '45', '2019-12-04 22:39:36', '2019-12-04 22:39:36', '1');
INSERT INTO `djmall_auth_product` VALUES ('38', '精油', '30.00', '1', '去黑头果酸修护毛孔粗大', '45', '2019-12-05 16:19:21', '2019-12-05 16:19:21', '1');
INSERT INTO `djmall_auth_product` VALUES ('39', '沐浴液', '18.00', '1', '润滑滋养持久留香', '45', '2019-12-05 16:20:06', '2019-12-05 16:20:06', '1');
INSERT INTO `djmall_auth_product` VALUES ('40', '剃须刀', '15.00', '1', '彰显男士自信魅力', '45', '2019-12-05 16:19:21', '2019-12-05 16:19:21', '1');
INSERT INTO `djmall_auth_product` VALUES ('41', '沐浴球', '5.00', '1', '可爱搓澡搓背起泡', '45', '2020-03-27 13:16:57', '2020-03-18 13:17:00', '1');
INSERT INTO `djmall_auth_product` VALUES ('42', '搓澡巾', '10.00', '1', '搓灰搓泥手套不疼', '45', '2020-03-27 15:16:57', '2020-03-08 16:53:33', '1');
INSERT INTO `djmall_auth_product` VALUES ('43', '干发帽', '12.00', '1', '吸水速干方便', '45', '2020-03-08 16:53:24', '2020-03-08 16:53:37', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='资源表';

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
INSERT INTO `djmall_auth_resource` VALUES ('30', 'ccc', '/403.jsp', '0', null, '1', '1');
INSERT INTO `djmall_auth_resource` VALUES ('31', '维修系统', '/maintain/toShow', '0', null, '1', '1');
INSERT INTO `djmall_auth_resource` VALUES ('32', '维修状态搜索', 'maintain:find', '31', '', '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('34', '商户维修操作', 'maintain:cz', '31', '', '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('35', '维修新增', 'maintain:add', '31', '', '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('36', '维修删除', 'maintain:del', '31', '', '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('40', '商品展示', '/product/toShow', '0', null, '1', '1');
INSERT INTO `djmall_auth_resource` VALUES ('41', '商品购买', 'product:purchase', '40', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('42', '商品新增', 'product:insert', '40', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('43', '商品修改', 'product:update', '40', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('44', '上架/下架', 'product:updateStatus', '40', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('45', '商品删除', 'product:del', '40', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('46', '举报', 'resource:report', '4', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('47', '技师管理', '/user/toExpertShow', '0', null, '1', '1');
INSERT INTO `djmall_auth_resource` VALUES ('48', '预约', 'resource:prevoir', '47', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('49', '接单', 'expertPrevoir:updateOrdreType', '47', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('50', '订单展示', '/order/toShow', '0', null, '1', '1');
INSERT INTO `djmall_auth_resource` VALUES ('51', '退单', 'order:updateStatus', '50', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('52', '充值vip', 'user:getChong', '4', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('53', '领取新人福利', 'user:getFu', '4', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('54', '预约技师', 'expertPrevoir:insert', '4', null, '2', '1');
INSERT INTO `djmall_auth_resource` VALUES ('55', '技师订单展示', '/expertPrevoir/toShow', '50', null, '1', '1');
INSERT INTO `djmall_auth_resource` VALUES ('56', '技师完成服务', 'expertPrevoir:updateOrdreTypeTwo', '50', null, '2', '1');

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
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '46', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '52', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '53', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '31', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '32', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '34', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '35', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '36', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '40', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '41', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '42', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '43', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '44', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '45', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '47', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '48', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '49', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '50', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '51', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '55', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('2', '56', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '5', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '6', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '7', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '4', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '14', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '46', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '54', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '31', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '32', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '34', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '35', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '40', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '41', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '50', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '51', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '55', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('3', '56', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '4', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '14', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '46', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '31', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '35', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '40', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '41', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '47', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '49', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '50', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '51', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('7', '55', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '4', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '13', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '14', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '46', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '52', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '53', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '54', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '40', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '41', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '50', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '51', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '55', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('1', '56', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '4', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '14', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '17', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '46', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '52', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '53', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '40', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '41', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '47', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '48', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '50', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '51', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '55', '1');
INSERT INTO `djmall_auth_role_resource` VALUES ('8', '56', '1');

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
  `is_leave` int(11) DEFAULT NULL COMMENT '辞职状态:0:辞职1:在岗',
  `is_report` int(11) DEFAULT NULL COMMENT '是否举报,默认为0,举报1次加1次',
  `account_money` double DEFAULT NULL COMMENT '账户余额',
  `is_get_money` int(11) DEFAULT NULL COMMENT '是否已领取新人福利 0:未领取1:已领取',
  `vip_validate_time` datetime DEFAULT NULL COMMENT 'vip失效时间',
  `vip_type` int(11) DEFAULT NULL COMMENT 'vip类型 0:日/vip,1:月/vip,2:年/vip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of djmall_auth_user
-- ----------------------------
INSERT INTO `djmall_auth_user` VALUES ('44', '用户1', 'zss', '29dab5f4fd115c3b4a9f30d644dc3fad', '1', '1', '13753713211', '3424235235@qq.com', '1', '2020-02-17 16:22:42', '2020-03-11 10:59:21', null, 'c692e7368fd802d8d7084fbd37dbf9f7', '1', '0', '1004', '0', '2020-03-14 12:21:17', '0');
INSERT INTO `djmall_auth_user` VALUES ('45', '经理', 'bb', '92dc9fe492b93ef0d7704f627bfcdc6a', '1', '1', '15559330182', '815270602@qq.com', '1', '2020-02-17 16:23:13', '2020-03-11 11:01:03', '176292', '7fb3093e0fafd2a1f09b4bc60263e6e9', '1', '0', '50', '0', '2020-03-10 14:32:29', '0');
INSERT INTO `djmall_auth_user` VALUES ('46', 'vip用户', 'za', '74b68cf85d4bfe0aae96db6322b16b0a', '1', '1', '13934670753', '815270603@qq.com', '2', '2020-02-17 19:47:40', '2020-02-18 19:31:57', null, '9f2c403c8a88508efd3c80a9f49e140b', '1', '0', '131', '0', '2020-03-19 12:21:26', '0');
INSERT INTO `djmall_auth_user` VALUES ('47', '用户2', 'www', '7341eed2c432071010e997bbf8fa64a3', '1', '1', '15812345678', '815270611@qq.com', '1', '2020-02-18 16:05:29', '2020-03-09 17:33:45', null, 'ab5850b563cba6f60da730ae41b374c8', '1', '0', '1313', '0', '2020-03-19 12:21:30', '0');
INSERT INTO `djmall_auth_user` VALUES ('48', '用户3', 'lss', 'dc1152105d8625873c08a4d4d0d9200f', '1', '1', '15559330183', '1327801264@qq.com', '1', '2020-03-07 16:32:59', '2020-03-07 20:01:03', null, '74f8e74615db2637ee381449f2ef2f1b', '1', '0', '3131', '0', '2020-03-18 12:21:33', '0');
INSERT INTO `djmall_auth_user` VALUES ('49', '维修工', 'wxg', 'c27c5a58577305f2ac7e222f63cb7806', '1', '1', '13111111111', '1327801266@qq.com', '1', '2020-03-07 19:51:28', '2020-03-10 19:47:07', null, '005956c428e493b192800fa594189400', '1', '0', '11', '0', '2020-03-19 12:21:36', '0');
INSERT INTO `djmall_auth_user` VALUES ('50', '技师', 'js', '8b6b1886c265ca68494b748f853a2b1b', '1', '1', '15812345672', '8152701@qq.com', '2', '2020-03-07 19:56:27', '2020-03-11 10:56:14', null, '90c2b1b69f0303abbfbfb41d7144a138', '1', '1', '13', '0', '2020-03-19 12:21:39', '0');
INSERT INTO `djmall_auth_user` VALUES ('51', '技师2', 'js2', '6b9746db719afdd08efb951a556603f8', '1', '1', '15812345674', '1234@qq.com', '2', '2020-03-07 19:57:44', '2020-03-11 10:46:45', null, '09b6986d676ca16234fa48d916df53ff', '1', '1', '31', '0', '2020-03-26 12:21:42', '0');
INSERT INTO `djmall_auth_user` VALUES ('52', '技师3', 'js3', 'd97ca32908ce8c379b4b274b3e2d30c9', '1', '1', '13711111111', '13278012@qq.com', '2', '2020-03-07 20:13:51', null, null, '06cfb24ad745a2ee9061b2748fc66e94', '1', '1', '13', '0', '2020-03-19 12:21:46', '0');

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
INSERT INTO `djmall_auth_user_role` VALUES ('46', '8', '1');
INSERT INTO `djmall_auth_user_role` VALUES ('47', '1', '1');
INSERT INTO `djmall_auth_user_role` VALUES ('48', '1', '1');
INSERT INTO `djmall_auth_user_role` VALUES ('49', '3', '1');
INSERT INTO `djmall_auth_user_role` VALUES ('50', '7', '1');
INSERT INTO `djmall_auth_user_role` VALUES ('51', '7', '1');
INSERT INTO `djmall_auth_user_role` VALUES ('52', '7', '1');

-- ----------------------------
-- Table structure for expert_prevoir
-- ----------------------------
DROP TABLE IF EXISTS `expert_prevoir`;
CREATE TABLE `expert_prevoir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expert_id` int(11) DEFAULT NULL COMMENT '技师id',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `prevoir_date` datetime DEFAULT NULL COMMENT '预约时间',
  `accepter_date` datetime DEFAULT NULL COMMENT '接单时间',
  `ordre_type` int(11) DEFAULT NULL COMMENT '0为预约  1为已接单   2为完成',
  `prix` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expert_prevoir
-- ----------------------------
INSERT INTO `expert_prevoir` VALUES ('11', '48', '44', '2020-03-09 20:51:02', '2020-03-11 10:56:54', '2', '100');
INSERT INTO `expert_prevoir` VALUES ('12', '48', '48', '2020-03-10 00:11:48', '2020-03-10 00:12:09', '1', '100');
INSERT INTO `expert_prevoir` VALUES ('13', '50', '50', '2020-03-11 10:20:32', null, '0', '100');
INSERT INTO `expert_prevoir` VALUES ('14', '50', '50', '2020-03-11 10:21:30', '2020-03-11 10:56:22', '1', '100');
INSERT INTO `expert_prevoir` VALUES ('15', '50', '51', '2020-03-11 10:39:17', '2020-03-11 10:48:06', '2', '100');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maintain
-- ----------------------------
INSERT INTO `maintain` VALUES ('1', '2020-02-29 19:23:35', 'QQ20200301145423865♦', '1', '3', '1');
INSERT INTO `maintain` VALUES ('2', '2020-04-01 14:53:47', 'QQ20200301145423865♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('3', '2020-03-15 15:05:02', 'QQ20200301150519124♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('4', '2020-03-01 15:05:27', 'QQ20200301150533056♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('5', '2020-03-03 09:17:15', 'QQ20200302091729626♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('6', '2020-03-11 14:28:51', 'QQ20200303142900806♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('7', '2020-03-03 16:59:44', 'QQ20200303165953062♦', '1', '4', '1');
INSERT INTO `maintain` VALUES ('8', '2020-03-09 16:43:01', 'QQ20200308164318253♦', '6', '2', '0');
INSERT INTO `maintain` VALUES ('9', '2020-03-20 16:55:22', 'OVO20200308165530078♦', '7', '4', '1');
INSERT INTO `maintain` VALUES ('10', '2020-03-10 18:27:10', 'OVO20200308182718747♦', '9', '4', '1');
INSERT INTO `maintain` VALUES ('11', '2020-03-11 18:28:01', 'OVO20200308182807556♦', '9', '4', '1');
INSERT INTO `maintain` VALUES ('12', '2020-03-10 19:46:37', 'OVO20200310194649929♦', '10', '3', '1');
