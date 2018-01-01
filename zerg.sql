/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : zerg

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-02 01:52:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ewei_ad
-- ----------------------------
DROP TABLE IF EXISTS `ewei_ad`;
CREATE TABLE `ewei_ad` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ad_position_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告展示位置',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '媒体类型',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '链接',
  `image_url` text NOT NULL COMMENT '图片',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `position_id` (`ad_position_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='广告';

-- ----------------------------
-- Records of ewei_ad
-- ----------------------------
INSERT INTO `ewei_ad` VALUES ('1', '1', '1', '合作 谁是你的菜', '', 'http://yanxuan.nosdn.127.net/65091eebc48899298171c2eb6696fe27.jpg', '合作 谁是你的菜', '0', '1');
INSERT INTO `ewei_ad` VALUES ('2', '1', '1', '活动 美食节', '', 'http://yanxuan.nosdn.127.net/bff2e49136fcef1fd829f5036e07f116.jpg', '活动 美食节', '0', '1');
INSERT INTO `ewei_ad` VALUES ('3', '1', '1', '活动 母亲节', '', 'http://yanxuan.nosdn.127.net/8e50c65fda145e6dd1bf4fb7ee0fcecc.jpg', '活动 母亲节', '0', '1');

-- ----------------------------
-- Table structure for ewei_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `ewei_admin_user`;
CREATE TABLE `ewei_admin_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `create_time` int(20) DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of ewei_admin_user
-- ----------------------------
INSERT INTO `ewei_admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '2016', '2018-01-01 17:34:14', '127.0.0.1');

-- ----------------------------
-- Table structure for ewei_article
-- ----------------------------
DROP TABLE IF EXISTS `ewei_article`;
CREATE TABLE `ewei_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cid` smallint(5) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `introduction` varchar(255) DEFAULT '' COMMENT '简介',
  `content` longtext COMMENT '内容',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0 待审核  1 审核',
  `reading` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶  0 不置顶  1 置顶',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐  0 不推荐  1 推荐',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `goods_ids` varchar(100) NOT NULL COMMENT '关联商品ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of ewei_article
-- ----------------------------
INSERT INTO `ewei_article` VALUES ('2', '7', '测试文章1', 'Ewei PHPer BigNiu', '<p>Ewei PHPer BigNiu</p><p>Ewei PHPer BigNiu</p><p>Ewei PHPer BigNiu</p><p>Ewei PHPer BigNiu</p><p>Ewei PHPer BigNiu</p><p><img src=\"/public/uploads/images/20171230/1514641087757187.png\" title=\"1514641087757187.png\" alt=\"j12.png\"/></p>', '测试员Ewei', '1', '0', '', null, '0', '0', '0', '2017-12-30 21:38:13', '2017-12-30 21:37:33', '');
INSERT INTO `ewei_article` VALUES ('3', '7', '123123', '1231231', '<p>123123123</p>', '123123', '1', '0', '', null, '0', '0', '0', '2017-12-30 23:08:03', '2017-12-30 23:07:49', '');
INSERT INTO `ewei_article` VALUES ('4', '7', '123123', '123123', '<p>12312312</p>', '123123', '1', '0', '', null, '0', '0', '0', '2017-12-30 23:09:42', '2017-12-30 23:08:04', '');
INSERT INTO `ewei_article` VALUES ('5', '7', 'asdasd', 'asdasd', '<p>asdasd</p>', 'asdasd', '1', '0', '', null, '0', '0', '0', '2017-12-30 23:10:41', '2017-12-30 23:10:05', '');
INSERT INTO `ewei_article` VALUES ('6', '7', '123123123', '123123', '<p>123123123</p>', '123123', '1', '0', '', null, '0', '0', '0', '2017-12-30 23:12:30', '2017-12-30 23:12:18', '30,31,');
INSERT INTO `ewei_article` VALUES ('7', '7', 'asdasd', 'dasd', '<p>asdasd</p>', 'asdas', '1', '0', '', null, '0', '0', '0', '2017-12-30 23:13:11', '2017-12-30 23:12:31', '');
INSERT INTO `ewei_article` VALUES ('8', '7', '阿斯达四大', '按时', '<p>asdasd啊<br/></p>', 'asdasd', '1', '0', '/uploads/thumb/20171231/6822e6d2d7af2fb574ae07efb73b111a.png', 'a:4:{i:0;s:52:\"/public/uploads/images/20171231/1514651526103224.png\";i:1;s:52:\"/public/uploads/images/20171231/1514651527236072.png\";i:2;s:52:\"/public/uploads/images/20171231/1514651527768504.png\";i:3;s:52:\"/public/uploads/images/20171231/1514651527420721.png\";}', '0', '0', '0', '2017-12-31 00:32:19', '2017-12-31 00:31:53', '32,');

-- ----------------------------
-- Table structure for ewei_article_category
-- ----------------------------
DROP TABLE IF EXISTS `ewei_article_category`;
CREATE TABLE `ewei_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `alias` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '导航别名',
  `content` longtext CHARACTER SET utf8 COMMENT '分类内容',
  `thumb` varchar(255) DEFAULT NULL COMMENT 'banner图',
  `icon` varchar(20) DEFAULT NULL COMMENT '分类图标',
  `list_template` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `detail_template` varchar(255) DEFAULT NULL COMMENT '分类详情模板',
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '分类类型  1  列表  2 单页',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `create_time` datetime DEFAULT NULL,
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='文章类目';

-- ----------------------------
-- Records of ewei_article_category
-- ----------------------------
INSERT INTO `ewei_article_category` VALUES ('7', '测试专题1', null, null, '/uploads/thumb/20171230/de4dbbb7bcffdecfab545ff9a62971d9.png', null, null, null, '1', '1', '0', '0,', '2017-12-30 21:37:21', null, null, null, null);

-- ----------------------------
-- Table structure for ewei_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `ewei_auth_group`;
CREATE TABLE `ewei_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of ewei_auth_group
-- ----------------------------
INSERT INTO `ewei_auth_group` VALUES ('1', '超级管理组', '1', '1,2,3,73,74,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,83,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,80,54,55,58,59,60,61,62,56,63,64,65,66,67,57,68,69,70,71,72,81');
INSERT INTO `ewei_auth_group` VALUES ('2', '编辑', '1', '14,13,20,21,22,23,24,15,25,26,27,28,29,30');
INSERT INTO `ewei_auth_group` VALUES ('4', '商家', '1', '14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48,84,80,85,86,87,88,89,90,91,92,93,94,95,96');

-- ----------------------------
-- Table structure for ewei_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `ewei_auth_group_access`;
CREATE TABLE `ewei_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

-- ----------------------------
-- Records of ewei_auth_group_access
-- ----------------------------
INSERT INTO `ewei_auth_group_access` VALUES ('1', '1');
INSERT INTO `ewei_auth_group_access` VALUES ('2', '2');
INSERT INTO `ewei_auth_group_access` VALUES ('3', '4');
INSERT INTO `ewei_auth_group_access` VALUES ('6', '1');
INSERT INTO `ewei_auth_group_access` VALUES ('7', '1');
INSERT INTO `ewei_auth_group_access` VALUES ('8', '1');
INSERT INTO `ewei_auth_group_access` VALUES ('9', '1');
INSERT INTO `ewei_auth_group_access` VALUES ('10', '1');

-- ----------------------------
-- Table structure for ewei_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ewei_auth_rule`;
CREATE TABLE `ewei_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of ewei_auth_rule
-- ----------------------------
INSERT INTO `ewei_auth_rule` VALUES ('1', 'admin/System/default', '系统配置', '1', '1', '0', 'fa fa-gears', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('2', 'admin/System/siteConfig', '站点配置', '1', '1', '1', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('3', 'admin/System/updateSiteConfig', '更新配置', '1', '0', '1', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('5', 'admin/Menu/default', '菜单管理', '1', '1', '0', 'fa fa-bars', '100', '');
INSERT INTO `ewei_auth_rule` VALUES ('6', 'admin/Menu/index', '后台菜单', '1', '1', '5', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('7', 'admin/Menu/add', '添加菜单', '1', '0', '6', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('8', 'admin/Menu/save', '保存菜单', '1', '0', '6', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('9', 'admin/Menu/edit', '编辑菜单', '1', '0', '6', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('10', 'admin/Menu/update', '更新菜单', '1', '0', '6', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('11', 'admin/Menu/delete', '删除菜单', '1', '0', '6', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('12', 'admin/Nav/index', '导航管理', '1', '1', '5', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('13', 'admin/Category/index', '分类管理', '1', '1', '14', 'fa fa-sitemap', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('14', 'admin/Content/default', '商品管理', '1', '1', '0', 'fa fa-file-text', '99', '');
INSERT INTO `ewei_auth_rule` VALUES ('15', 'admin/Goods/index', '商品管理', '1', '1', '14', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('16', 'admin/User/default', '用户管理', '1', '1', '0', 'fa fa-users', '98', '');
INSERT INTO `ewei_auth_rule` VALUES ('17', 'admin/User/index', '普通用户', '1', '1', '16', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('18', 'admin/AdminUser/index', '管理员', '1', '1', '16', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('19', 'admin/AuthGroup/index', '权限组', '1', '1', '16', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('20', 'admin/Category/add', '添加分类', '1', '0', '13', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('21', 'admin/Category/save', '保存分类', '1', '0', '13', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('22', 'admin/Category/edit', '编辑分类', '1', '0', '13', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('23', 'admin/Category/update', '更新分类', '1', '0', '13', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('24', 'admin/Category/delete', '删除分类', '1', '0', '13', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('25', 'admin/Goods/add', '添加商品', '1', '0', '15', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('26', 'admin/Goods/save', '保存商品', '1', '0', '15', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('27', 'admin/Goods/edit', '编辑商品', '1', '0', '15', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('28', 'admin/Goods/update', '更新商品', '1', '0', '15', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('29', 'admin/Goods/delete', '删除商品', '1', '0', '15', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('30', 'admin/Goods/toggle', '商品审核', '1', '0', '15', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('31', 'admin/AuthGroup/add', '添加权限组', '1', '0', '19', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('32', 'admin/AuthGroup/save', '保存权限组', '1', '0', '19', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('33', 'admin/AuthGroup/edit', '编辑权限组', '1', '0', '19', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('34', 'admin/AuthGroup/update', '更新权限组', '1', '0', '19', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('35', 'admin/AuthGroup/delete', '删除权限组', '1', '0', '19', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('36', 'admin/AuthGroup/auth', '授权', '1', '0', '19', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('37', 'admin/AuthGroup/updateAuthGroupRule', '更新权限组规则', '1', '0', '19', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('39', 'admin/Nav/add', '添加导航', '1', '0', '12', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('40', 'admin/Nav/save', '保存导航', '1', '0', '12', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('41', 'admin/Nav/edit', '编辑导航', '1', '0', '12', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('42', 'admin/Nav/update', '更新导航', '1', '0', '12', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('43', 'admin/Nav/delete', '删除导航', '1', '0', '12', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('44', 'admin/User/add', '添加用户', '1', '0', '17', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('45', 'admin/User/save', '保存用户', '1', '0', '17', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('46', 'admin/User/edit', '编辑用户', '1', '0', '17', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('47', 'admin/User/update', '更新用户', '1', '0', '17', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('48', 'admin/User/delete', '删除用户', '1', '0', '17', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('49', 'admin/AdminUser/add', '添加管理员', '1', '0', '18', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('50', 'admin/AdminUser/save', '保存管理员', '1', '0', '18', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('51', 'admin/AdminUser/edit', '编辑管理员', '1', '0', '18', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('52', 'admin/AdminUser/update', '更新管理员', '1', '0', '18', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('53', 'admin/AdminUser/delete', '删除管理员', '1', '0', '18', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('54', 'admin/Slide/default', '扩展管理', '1', '1', '0', 'fa fa-wrench', '92', '');
INSERT INTO `ewei_auth_rule` VALUES ('55', 'admin/Banner/index', '轮播分类', '1', '1', '54', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('56', 'admin/BannerItem/index', '轮播图管理', '1', '1', '54', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('57', 'admin/Link/index', '友情链接', '1', '1', '54', 'fa fa-link', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('58', 'admin/Banner/add', '添加分类', '1', '0', '55', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('59', 'admin/Banner/save', '保存分类', '1', '0', '55', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('60', 'admin/Banner/edit', '编辑分类', '1', '0', '55', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('61', 'admin/Banner/update', '更新分类', '1', '0', '55', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('62', 'admin/Banner/delete', '删除分类', '1', '0', '55', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('63', 'admin/BannerItem/add', '添加轮播', '1', '0', '56', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('64', 'admin/BannerItem/save', '保存轮播', '1', '0', '56', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('65', 'admin/BannerItem/edit', '编辑轮播', '1', '0', '56', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('66', 'admin/BannerItem/update', '更新轮播', '1', '0', '56', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('67', 'admin/Slide/delete', '删除轮播', '1', '0', '56', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('68', 'admin/Link/add', '添加链接', '1', '0', '57', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('69', 'admin/Link/save', '保存链接', '1', '0', '57', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('70', 'admin/Link/edit', '编辑链接', '1', '0', '57', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('71', 'admin/Link/update', '更新链接', '1', '0', '57', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('72', 'admin/Link/delete', '删除链接', '1', '0', '57', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('73', 'admin/ChangePassword/index', '修改密码', '1', '1', '1', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('74', 'admin/ChangePassword/updatePassword', '更新密码', '1', '0', '1', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('76', 'admin/tools/index', '工具箱', '1', '0', '0', 'fa fa-inbox', '94', '');
INSERT INTO `ewei_auth_rule` VALUES ('77', 'admin/tools/toolsMysql', '数据库管理', '1', '0', '76', 'fa fa-database', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('80', 'admin/integral/rule', '积分规则', '1', '1', '84', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('81', 'admin/order/index', '订单管理', '1', '1', '0', 'fa fa-shopping-cart', '97', '');
INSERT INTO `ewei_auth_rule` VALUES ('83', 'admin/collective/index', '开团管理', '1', '1', '14', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('84', 'admin/Marketing/default', '营销管理', '1', '1', '0', 'fa fa-bullhorn', '93', '');
INSERT INTO `ewei_auth_rule` VALUES ('85', 'admin/Promotion/coupon', '优惠券管理', '1', '1', '84', 'fa fa-houzz', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('86', 'admin/Article/index', '文章管理', '1', '1', '84', 'fa fa-pencil-square-o', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('87', 'admin/ArticleCategory/index', '专题管理', '1', '1', '84', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('88', 'admin/Carriage/default', '运输管理', '1', '1', '0', 'fa  fa-truck', '93', '');
INSERT INTO `ewei_auth_rule` VALUES ('89', 'admin/Expressage/index', '快递管理', '1', '1', '88', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('90', 'admin/Expressage/update', '运输修改', '1', '0', '88', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('91', 'admin/Expressage/add', '运输添加', '1', '0', '88', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('92', 'admin/Expressage/del', '运输删除', '1', '0', '88', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('93', 'admin/Freight/index', '运费模板', '1', '1', '88', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('94', 'admin/Freight/add', '运费模板添加', '1', '0', '88', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('95', 'admin/Freight/update', '运费模板修改', '1', '0', '88', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('96', 'admin/Freight/del', '运费模板删除', '1', '0', '88', '', '0', '');

-- ----------------------------
-- Table structure for ewei_banner
-- ----------------------------
DROP TABLE IF EXISTS `ewei_banner`;
CREATE TABLE `ewei_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

-- ----------------------------
-- Records of ewei_banner
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_banner_item
-- ----------------------------
DROP TABLE IF EXISTS `ewei_banner_item`;
CREATE TABLE `ewei_banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL COMMENT '外键，关联banner表',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '轮播图名称',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '说明',
  `link` varchar(255) NOT NULL COMMENT '链接',
  `target` varchar(10) NOT NULL COMMENT '打开方式',
  `key_word` varchar(100) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态  1 显示  0  隐藏',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) NOT NULL,
  `image` varchar(255) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

-- ----------------------------
-- Records of ewei_banner_item
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_category
-- ----------------------------
DROP TABLE IF EXISTS `ewei_category`;
CREATE TABLE `ewei_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `alias` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '导航别名',
  `content` longtext CHARACTER SET utf8 COMMENT '分类内容',
  `thumb` varchar(255) DEFAULT NULL COMMENT 'banner图',
  `icon` varchar(20) DEFAULT NULL COMMENT '分类图标',
  `list_template` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `detail_template` varchar(255) DEFAULT NULL COMMENT '分类详情模板',
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '分类类型  1  列表  2 单页',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `create_time` datetime DEFAULT NULL,
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

-- ----------------------------
-- Records of ewei_category
-- ----------------------------
INSERT INTO `ewei_category` VALUES ('5', '啦啦啦', null, null, '/uploads/thumb/20171217/6ae39dbe752394fcb70384be0a49b781.jpg', null, null, null, '1', '0', '0', '0,', '2017-12-17 20:50:34', null, null, null, null);

-- ----------------------------
-- Table structure for ewei_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ewei_coupon`;
CREATE TABLE `ewei_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `coupon_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券编码',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '领用人',
  `use_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券使用订单id',
  `create_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建订单id(优惠券只有是完成订单发放的优惠券时才有值)',
  `money` decimal(10,2) NOT NULL COMMENT '面额',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优惠券状态 0未领用 1已领用（未使用） 2已使用 3已过期',
  `get_type` int(11) NOT NULL DEFAULT '0' COMMENT '获取方式1订单2.首页领取',
  `fetch_time` int(11) DEFAULT '0' COMMENT '领取时间',
  `use_time` int(11) DEFAULT '0' COMMENT '使用时间',
  `start_time` int(11) DEFAULT '0' COMMENT '有效期开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '有效期结束时间',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=148 COMMENT='优惠券表';

-- ----------------------------
-- Records of ewei_coupon
-- ----------------------------
INSERT INTO `ewei_coupon` VALUES ('1', '1', '1514816761230', '0', '0', '0', '123.00', '0', '0', '0', '0', '1514814795', '1517328000');
INSERT INTO `ewei_coupon` VALUES ('2', '1', '1514817928998', '0', '0', '0', '123.00', '0', '0', '0', '0', '1514736000', '1516204800');
INSERT INTO `ewei_coupon` VALUES ('3', '1', '1514819198296', '0', '0', '0', '123.00', '0', '0', '0', '0', '1514800601', '1517047003');
INSERT INTO `ewei_coupon` VALUES ('4', '1', '1514819240624', '0', '0', '0', '123.00', '0', '0', '0', '0', '1514800601', '1517047003');
INSERT INTO `ewei_coupon` VALUES ('5', '1', '1514826595837', '0', '0', '0', '123.00', '0', '0', '0', '0', '1514822400', '1516896000');
INSERT INTO `ewei_coupon` VALUES ('12', '1', '1514826820159', '0', '0', '0', '123.00', '0', '0', '0', '0', '1514822400', '1515600000');
INSERT INTO `ewei_coupon` VALUES ('16', '1', '1514826907172', '0', '0', '0', '123.00', '0', '0', '0', '0', '1514822400', '1517500800');
INSERT INTO `ewei_coupon` VALUES ('17', '1', '1514827104578', '0', '0', '0', '1.00', '0', '0', '0', '0', '1514822400', '1516204800');
INSERT INTO `ewei_coupon` VALUES ('19', '42', '1514827674638', '0', '0', '0', '2.00', '0', '0', '0', '0', '1514822400', '1516723200');

-- ----------------------------
-- Table structure for ewei_coupon_goods
-- ----------------------------
DROP TABLE IF EXISTS `ewei_coupon_goods`;
CREATE TABLE `ewei_coupon_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='优惠券使用商品表';

-- ----------------------------
-- Records of ewei_coupon_goods
-- ----------------------------
INSERT INTO `ewei_coupon_goods` VALUES ('11', '20', '32');
INSERT INTO `ewei_coupon_goods` VALUES ('13', '42', '32');
INSERT INTO `ewei_coupon_goods` VALUES ('16', '1', '32');

-- ----------------------------
-- Table structure for ewei_coupon_type
-- ----------------------------
DROP TABLE IF EXISTS `ewei_coupon_type`;
CREATE TABLE `ewei_coupon_type` (
  `coupon_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券类型Id',
  `coupon_name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `money` decimal(10,2) NOT NULL COMMENT '发放面额',
  `count` int(11) NOT NULL COMMENT '发放数量',
  `max_fetch` int(11) NOT NULL DEFAULT '0' COMMENT '每人最大领取个数 0无限制',
  `at_least` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '满多少元使用 0代表无限制',
  `need_user_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '领取人会员等级',
  `range_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '使用范围0部分产品使用 1全场产品使用',
  `is_show` int(11) NOT NULL DEFAULT '0' COMMENT '是否允许首页显示0不显示1显示',
  `start_time` int(11) DEFAULT '0' COMMENT '有效日期开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '有效日期结束时间',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '修改时间',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`coupon_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='优惠券类型表';

-- ----------------------------
-- Records of ewei_coupon_type
-- ----------------------------
INSERT INTO `ewei_coupon_type` VALUES ('1', '测试优惠券', '10.00', '100', '31', '10.00', '0', '0', '1', '1514800601', '1517047003', '0', '0', '/uploads/thumb/20180102/dc761670dc98d2579e6e4571abc1422b.jpg');

-- ----------------------------
-- Table structure for ewei_goods
-- ----------------------------
DROP TABLE IF EXISTS `ewei_goods`;
CREATE TABLE `ewei_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `cid` smallint(5) unsigned NOT NULL COMMENT '分类ID',
  `sid` smallint(5) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `prefix_title` varchar(255) NOT NULL COMMENT '前缀名称',
  `introduction` varchar(255) DEFAULT '' COMMENT '简介',
  `content` longtext COMMENT '内容',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0 待审核  1 审核',
  `reading` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶  0 不置顶  1 置顶',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐  0 不推荐  1 推荐',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '热卖商品  0 否 1 是',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `sp_o_price` decimal(7,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `sp_vip_price` decimal(7,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品会员价格',
  `sp_cost_price` decimal(7,2) unsigned NOT NULL COMMENT '成本价',
  `sp_price` decimal(7,2) unsigned NOT NULL COMMENT '商品售价',
  `sp_inventory` smallint(5) unsigned NOT NULL DEFAULT '999' COMMENT '商品库存',
  `sp_integral` smallint(5) unsigned NOT NULL COMMENT '商品积分赠送',
  `sp_market` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `btime` datetime NOT NULL COMMENT '开始时间',
  `etime` datetime NOT NULL COMMENT '结束时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of ewei_goods
-- ----------------------------
INSERT INTO `ewei_goods` VALUES ('32', '5', '0', '测试商品', '测试标题', '', '<p>奥术大师大所asdasd爱上了雕刻按时大厦开始打扫卡萨丁康佳的阿斯利康达到爱思帝卡死asdasd</p>', '', '1', '0', '/uploads/thumb/20180101/a2158650096cb11f064970ff1f47804b.jpg', 'a:3:{i:0;s:52:\"/public/uploads/images/20180101/1514818270499685.jpg\";i:1;s:52:\"/public/uploads/images/20180101/1514818270194073.jpg\";i:2;s:52:\"/public/uploads/images/20180101/1514818270597065.jpg\";}', '1', '1', '0', '2', '2018-01-01 22:51:23', '2018-01-01 00:00:00', '300.00', '19.23', '0.00', '200.00', '65535', '0', '300', '2018-01-01 00:00:00', '2018-01-19 00:00:00', null, null);

-- ----------------------------
-- Table structure for ewei_goods_browse_record
-- ----------------------------
DROP TABLE IF EXISTS `ewei_goods_browse_record`;
CREATE TABLE `ewei_goods_browse_record` (
  `id` int(11) NOT NULL,
  `g_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `g_value` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品基本信息 json串',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ewei_goods_browse_record
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_goods_collective
-- ----------------------------
DROP TABLE IF EXISTS `ewei_goods_collective`;
CREATE TABLE `ewei_goods_collective` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `user_number` int(11) NOT NULL COMMENT '开团人数',
  `goods_price` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '开团价格',
  `time` int(11) NOT NULL DEFAULT '3600' COMMENT '时限  默认1个小时',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开团时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `state` enum('1','0') NOT NULL DEFAULT '0' COMMENT '0未开启   1开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='开团规则表';

-- ----------------------------
-- Records of ewei_goods_collective
-- ----------------------------
INSERT INTO `ewei_goods_collective` VALUES ('11', '30', '12312', '123.00', '123', '2021-12-30 20:20:11', '2017-08-30 20:20:13', '1');
INSERT INTO `ewei_goods_collective` VALUES ('12', '32', '2', '3.00', '3600', '2018-01-01 22:51:37', '2018-01-01 22:51:37', '1');

-- ----------------------------
-- Table structure for ewei_image
-- ----------------------------
DROP TABLE IF EXISTS `ewei_image`;
CREATE TABLE `ewei_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图片总表';

-- ----------------------------
-- Records of ewei_image
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_link
-- ----------------------------
DROP TABLE IF EXISTS `ewei_link`;
CREATE TABLE `ewei_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link` varchar(255) DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) DEFAULT '' COMMENT '链接图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 显示  2 隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of ewei_link
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_order
-- ----------------------------
DROP TABLE IF EXISTS `ewei_order`;
CREATE TABLE `ewei_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足，5：已完成，6：已关闭，7：订单异常',
  `snap_img` varchar(255) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ewei_order
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ewei_order_goods`;
CREATE TABLE `ewei_order_goods` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单关联商品表';

-- ----------------------------
-- Records of ewei_order_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_product
-- ----------------------------
DROP TABLE IF EXISTS `ewei_product`;
CREATE TABLE `ewei_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '商品名称',
  `price` decimal(6,2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `category_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `main_img_url` varchar(255) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片来自 1 本地 ，2公网',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `img_id` int(11) DEFAULT NULL COMMENT '图片外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ewei_product
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_product_image
-- ----------------------------
DROP TABLE IF EXISTS `ewei_product_image`;
CREATE TABLE `ewei_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ewei_product_image
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_product_property
-- ----------------------------
DROP TABLE IF EXISTS `ewei_product_property`;
CREATE TABLE `ewei_product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品规格';

-- ----------------------------
-- Records of ewei_product_property
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_system
-- ----------------------------
DROP TABLE IF EXISTS `ewei_system`;
CREATE TABLE `ewei_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of ewei_system
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_theme
-- ----------------------------
DROP TABLE IF EXISTS `ewei_theme`;
CREATE TABLE `ewei_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父类ID',
  `name` varchar(50) NOT NULL COMMENT '专题名称',
  `alias` varchar(50) DEFAULT NULL COMMENT '别名',
  `link` varchar(255) DEFAULT NULL COMMENT '导航链接',
  `icon` varchar(255) DEFAULT NULL COMMENT '导航图标',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` int(11) NOT NULL COMMENT '主题图，外键',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `head_img_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `sort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态  0 隐藏  1 显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题信息表';

-- ----------------------------
-- Records of ewei_theme
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_theme_product
-- ----------------------------
DROP TABLE IF EXISTS `ewei_theme_product`;
CREATE TABLE `ewei_theme_product` (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题所包含的商品';

-- ----------------------------
-- Records of ewei_theme_product
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_third_app
-- ----------------------------
DROP TABLE IF EXISTS `ewei_third_app`;
CREATE TABLE `ewei_third_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='访问API的各应用账号密码表';

-- ----------------------------
-- Records of ewei_third_app
-- ----------------------------
INSERT INTO `ewei_third_app` VALUES ('1', 'starcraft', '777*777', 'CMS', '32', 'Super', null, null);

-- ----------------------------
-- Table structure for ewei_user
-- ----------------------------
DROP TABLE IF EXISTS `ewei_user`;
CREATE TABLE `ewei_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `uni_id` varchar(50) NOT NULL COMMENT '站内ID',
  `nickname` varchar(50) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) DEFAULT NULL COMMENT '用户状态  1 正常  2 禁止',
  `extend` varchar(255) DEFAULT NULL,
  `rank_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT '级别 关联用户级别表',
  `integral` int(10) DEFAULT '0' COMMENT '积分',
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '最后登录IP',
  `delete_time` int(20) DEFAULT NULL,
  `create_time` int(20) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of ewei_user
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_user_address
-- ----------------------------
DROP TABLE IF EXISTS `ewei_user_address`;
CREATE TABLE `ewei_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收货 地质';

-- ----------------------------
-- Records of ewei_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_user_rank
-- ----------------------------
DROP TABLE IF EXISTS `ewei_user_rank`;
CREATE TABLE `ewei_user_rank` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '级别名称',
  `rank_integral` int(10) unsigned NOT NULL COMMENT '积分要求',
  `rank_discount` float(3,1) unsigned NOT NULL COMMENT '级别优惠折扣',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='等级设置表';

-- ----------------------------
-- Records of ewei_user_rank
-- ----------------------------
