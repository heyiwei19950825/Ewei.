/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : zerg

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-10-24 00:35:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
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
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '2016', '2017-10-23 15:50:45', '127.0.0.1');
INSERT INTO `admin_user` VALUES ('2', 'test', 'b9b433cfeb75458aea0cd77cef76f5bf', null, null, '1', '2017', '0000-00-00 00:00:00', '127.0.0.1');
INSERT INTO `admin_user` VALUES ('3', 'feiji', '65c93be26d1538c759127a52b17ce541', null, null, '1', '2017', '0000-00-00 00:00:00', null);
INSERT INTO `admin_user` VALUES ('10', '123123', '4297f44b13955235245b2497399d7a93', null, null, '1', '2017', null, null);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '超级管理组', '1', '1,2,3,73,74,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,54,55,58,59,60,61,62,56,63,64,65,66,67,57,68,69,70,71,72');
INSERT INTO `auth_group` VALUES ('2', '编辑', '1', '14,13,20,21,22,23,24,15,25,26,27,28,29,30');
INSERT INTO `auth_group` VALUES ('4', '商家', '1', '14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48');

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1');
INSERT INTO `auth_group_access` VALUES ('2', '2');
INSERT INTO `auth_group_access` VALUES ('3', '4');
INSERT INTO `auth_group_access` VALUES ('6', '1');
INSERT INTO `auth_group_access` VALUES ('7', '1');
INSERT INTO `auth_group_access` VALUES ('8', '1');
INSERT INTO `auth_group_access` VALUES ('9', '1');
INSERT INTO `auth_group_access` VALUES ('10', '1');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
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
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', 'admin/System/default', '系统配置', '1', '1', '0', 'fa fa-gears', '0', '');
INSERT INTO `auth_rule` VALUES ('2', 'admin/System/siteConfig', '站点配置', '1', '1', '1', '', '0', '');
INSERT INTO `auth_rule` VALUES ('3', 'admin/System/updateSiteConfig', '更新配置', '1', '0', '1', '', '0', '');
INSERT INTO `auth_rule` VALUES ('5', 'admin/Menu/default', '菜单管理', '1', '1', '0', 'fa fa-bars', '100', '');
INSERT INTO `auth_rule` VALUES ('6', 'admin/Menu/index', '后台菜单', '1', '1', '5', '', '0', '');
INSERT INTO `auth_rule` VALUES ('7', 'admin/Menu/add', '添加菜单', '1', '0', '6', '', '0', '');
INSERT INTO `auth_rule` VALUES ('8', 'admin/Menu/save', '保存菜单', '1', '0', '6', '', '0', '');
INSERT INTO `auth_rule` VALUES ('9', 'admin/Menu/edit', '编辑菜单', '1', '0', '6', '', '0', '');
INSERT INTO `auth_rule` VALUES ('10', 'admin/Menu/update', '更新菜单', '1', '0', '6', '', '0', '');
INSERT INTO `auth_rule` VALUES ('11', 'admin/Menu/delete', '删除菜单', '1', '0', '6', '', '0', '');
INSERT INTO `auth_rule` VALUES ('12', 'admin/Nav/index', '导航管理', '1', '1', '5', '', '0', '');
INSERT INTO `auth_rule` VALUES ('13', 'admin/Category/index', '分类管理', '1', '1', '14', 'fa fa-sitemap', '0', '');
INSERT INTO `auth_rule` VALUES ('14', 'admin/Content/default', '商品管理', '1', '1', '0', 'fa fa-file-text', '99', '');
INSERT INTO `auth_rule` VALUES ('15', 'admin/Goods/index', '商品管理', '1', '1', '14', '', '0', '');
INSERT INTO `auth_rule` VALUES ('16', 'admin/User/default', '用户管理', '1', '1', '0', 'fa fa-users', '98', '');
INSERT INTO `auth_rule` VALUES ('17', 'admin/User/index', '普通用户', '1', '1', '16', '', '0', '');
INSERT INTO `auth_rule` VALUES ('18', 'admin/AdminUser/index', '管理员', '1', '1', '16', '', '0', '');
INSERT INTO `auth_rule` VALUES ('19', 'admin/AuthGroup/index', '权限组', '1', '1', '16', '', '0', '');
INSERT INTO `auth_rule` VALUES ('20', 'admin/Category/add', '添加分类', '1', '0', '13', '', '0', '');
INSERT INTO `auth_rule` VALUES ('21', 'admin/Category/save', '保存分类', '1', '0', '13', '', '0', '');
INSERT INTO `auth_rule` VALUES ('22', 'admin/Category/edit', '编辑分类', '1', '0', '13', '', '0', '');
INSERT INTO `auth_rule` VALUES ('23', 'admin/Category/update', '更新分类', '1', '0', '13', '', '0', '');
INSERT INTO `auth_rule` VALUES ('24', 'admin/Category/delete', '删除分类', '1', '0', '13', '', '0', '');
INSERT INTO `auth_rule` VALUES ('25', 'admin/Goods/add', '添加商品', '1', '0', '15', '', '0', '');
INSERT INTO `auth_rule` VALUES ('26', 'admin/Goods/save', '保存商品', '1', '0', '15', '', '0', '');
INSERT INTO `auth_rule` VALUES ('27', 'admin/Goods/edit', '编辑商品', '1', '0', '15', '', '0', '');
INSERT INTO `auth_rule` VALUES ('28', 'admin/Goods/update', '更新商品', '1', '0', '15', '', '0', '');
INSERT INTO `auth_rule` VALUES ('29', 'admin/Goods/delete', '删除商品', '1', '0', '15', '', '0', '');
INSERT INTO `auth_rule` VALUES ('30', 'admin/Goods/toggle', '商品审核', '1', '0', '15', '', '0', '');
INSERT INTO `auth_rule` VALUES ('31', 'admin/AuthGroup/add', '添加权限组', '1', '0', '19', '', '0', '');
INSERT INTO `auth_rule` VALUES ('32', 'admin/AuthGroup/save', '保存权限组', '1', '0', '19', '', '0', '');
INSERT INTO `auth_rule` VALUES ('33', 'admin/AuthGroup/edit', '编辑权限组', '1', '0', '19', '', '0', '');
INSERT INTO `auth_rule` VALUES ('34', 'admin/AuthGroup/update', '更新权限组', '1', '0', '19', '', '0', '');
INSERT INTO `auth_rule` VALUES ('35', 'admin/AuthGroup/delete', '删除权限组', '1', '0', '19', '', '0', '');
INSERT INTO `auth_rule` VALUES ('36', 'admin/AuthGroup/auth', '授权', '1', '0', '19', '', '0', '');
INSERT INTO `auth_rule` VALUES ('37', 'admin/AuthGroup/updateAuthGroupRule', '更新权限组规则', '1', '0', '19', '', '0', '');
INSERT INTO `auth_rule` VALUES ('39', 'admin/Nav/add', '添加导航', '1', '0', '12', '', '0', '');
INSERT INTO `auth_rule` VALUES ('40', 'admin/Nav/save', '保存导航', '1', '0', '12', '', '0', '');
INSERT INTO `auth_rule` VALUES ('41', 'admin/Nav/edit', '编辑导航', '1', '0', '12', '', '0', '');
INSERT INTO `auth_rule` VALUES ('42', 'admin/Nav/update', '更新导航', '1', '0', '12', '', '0', '');
INSERT INTO `auth_rule` VALUES ('43', 'admin/Nav/delete', '删除导航', '1', '0', '12', '', '0', '');
INSERT INTO `auth_rule` VALUES ('44', 'admin/User/add', '添加用户', '1', '0', '17', '', '0', '');
INSERT INTO `auth_rule` VALUES ('45', 'admin/User/save', '保存用户', '1', '0', '17', '', '0', '');
INSERT INTO `auth_rule` VALUES ('46', 'admin/User/edit', '编辑用户', '1', '0', '17', '', '0', '');
INSERT INTO `auth_rule` VALUES ('47', 'admin/User/update', '更新用户', '1', '0', '17', '', '0', '');
INSERT INTO `auth_rule` VALUES ('48', 'admin/User/delete', '删除用户', '1', '0', '17', '', '0', '');
INSERT INTO `auth_rule` VALUES ('49', 'admin/AdminUser/add', '添加管理员', '1', '0', '18', '', '0', '');
INSERT INTO `auth_rule` VALUES ('50', 'admin/AdminUser/save', '保存管理员', '1', '0', '18', '', '0', '');
INSERT INTO `auth_rule` VALUES ('51', 'admin/AdminUser/edit', '编辑管理员', '1', '0', '18', '', '0', '');
INSERT INTO `auth_rule` VALUES ('52', 'admin/AdminUser/update', '更新管理员', '1', '0', '18', '', '0', '');
INSERT INTO `auth_rule` VALUES ('53', 'admin/AdminUser/delete', '删除管理员', '1', '0', '18', '', '0', '');
INSERT INTO `auth_rule` VALUES ('54', 'admin/Slide/default', '扩展管理', '1', '1', '0', 'fa fa-wrench', '95', '');
INSERT INTO `auth_rule` VALUES ('55', 'admin/Banner/index', '轮播分类', '1', '1', '54', '', '0', '');
INSERT INTO `auth_rule` VALUES ('56', 'admin/BannerItem/index', '轮播图管理', '1', '1', '54', '', '0', '');
INSERT INTO `auth_rule` VALUES ('57', 'admin/Link/index', '友情链接', '1', '1', '54', 'fa fa-link', '0', '');
INSERT INTO `auth_rule` VALUES ('58', 'admin/Banner/add', '添加分类', '1', '0', '55', '', '0', '');
INSERT INTO `auth_rule` VALUES ('59', 'admin/Banner/save', '保存分类', '1', '0', '55', '', '0', '');
INSERT INTO `auth_rule` VALUES ('60', 'admin/Banner/edit', '编辑分类', '1', '0', '55', '', '0', '');
INSERT INTO `auth_rule` VALUES ('61', 'admin/Banner/update', '更新分类', '1', '0', '55', '', '0', '');
INSERT INTO `auth_rule` VALUES ('62', 'admin/Banner/delete', '删除分类', '1', '0', '55', '', '0', '');
INSERT INTO `auth_rule` VALUES ('63', 'admin/BannerItem/add', '添加轮播', '1', '0', '56', '', '0', '');
INSERT INTO `auth_rule` VALUES ('64', 'admin/BannerItem/save', '保存轮播', '1', '0', '56', '', '0', '');
INSERT INTO `auth_rule` VALUES ('65', 'admin/BannerItem/edit', '编辑轮播', '1', '0', '56', '', '0', '');
INSERT INTO `auth_rule` VALUES ('66', 'admin/BannerItem/update', '更新轮播', '1', '0', '56', '', '0', '');
INSERT INTO `auth_rule` VALUES ('67', 'admin/Slide/delete', '删除轮播', '1', '0', '56', '', '0', '');
INSERT INTO `auth_rule` VALUES ('68', 'admin/Link/add', '添加链接', '1', '0', '57', '', '0', '');
INSERT INTO `auth_rule` VALUES ('69', 'admin/Link/save', '保存链接', '1', '0', '57', '', '0', '');
INSERT INTO `auth_rule` VALUES ('70', 'admin/Link/edit', '编辑链接', '1', '0', '57', '', '0', '');
INSERT INTO `auth_rule` VALUES ('71', 'admin/Link/update', '更新链接', '1', '0', '57', '', '0', '');
INSERT INTO `auth_rule` VALUES ('72', 'admin/Link/delete', '删除链接', '1', '0', '57', '', '0', '');
INSERT INTO `auth_rule` VALUES ('73', 'admin/ChangePassword/index', '修改密码', '1', '1', '1', '', '0', '');
INSERT INTO `auth_rule` VALUES ('74', 'admin/ChangePassword/updatePassword', '更新密码', '1', '0', '1', '', '0', '');
INSERT INTO `auth_rule` VALUES ('76', 'admin/tools/index', '工具箱', '1', '1', '0', 'fa fa-inbox', '94', '');
INSERT INTO `auth_rule` VALUES ('77', 'admin/tools/toolsMysql', '数据库管理', '1', '1', '76', 'fa fa-database', '0', '');
INSERT INTO `auth_rule` VALUES ('80', 'admin/integral/rule', '积分规则', '1', '1', '54', '', '0', '');
INSERT INTO `auth_rule` VALUES ('81', 'admin/order/index', '订单管理', '1', '1', '0', 'fa fa-houzz', '97', '');
INSERT INTO `auth_rule` VALUES ('82', 'admin/log/index', '数据日志', '1', '1', '0', 'fa fa-ticket', '96', '');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '首页置顶', '首页轮播图', null, null);
INSERT INTO `banner` VALUES ('2', '12312312312312', null, null, null);

-- ----------------------------
-- Table structure for banner_item
-- ----------------------------
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

-- ----------------------------
-- Records of banner_item
-- ----------------------------
INSERT INTO `banner_item` VALUES ('7', '1', '大白菜', '大白菜迁安市大所多', '12312asdasda', '_blank', '', '0', '0', '1', '1508745921', '0', '/uploads/20171023/2fee2d070123a3460e2485e2981962dc.png');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2', '果味', '水果酒', '<p>奥术大师大所</p>', '/uploads/20171021/f4beb847999d2388c787e48de94d6704.png', '', '', '', '1', '1', '0', '0,', null, '6', null, null, null);
INSERT INTO `category` VALUES ('3', '蔬菜', null, null, null, null, null, null, '1', '0', '0', null, null, '5', null, null, null);
INSERT INTO `category` VALUES ('4', '炒货', null, null, null, null, null, null, '1', '0', '0', null, null, '7', null, null, null);
INSERT INTO `category` VALUES ('5', '点心', null, null, null, null, null, null, '1', '0', '0', null, null, '4', null, null, null);
INSERT INTO `category` VALUES ('6', '粗茶', null, null, null, null, null, null, '1', '0', '0', null, null, '8', null, null, null);
INSERT INTO `category` VALUES ('7', '淡饭', null, null, null, null, null, null, '1', '0', '0', null, null, '9', null, null, null);
INSERT INTO `category` VALUES ('9', '苹果', 'asdasd', '<p>asdasdasdasd</p>', '/uploads/20171021/edbdafeabb46dad44b2c78022b4cb2e9.png', 'asdasd', '', '', '1', '0', '2', '0,2,', '2017-10-21 23:18:05', null, null, null, null);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2', '2', '0', '法国原瓶原装进口红酒 AOC级波尔多法定产区干红葡萄酒750ml（6瓶装）', '智利直采名酒，干露酒庄出品', '', '<div class=\"descBox\"><div class=\"infoBox\"><h3>商品特点</h3><div class=\"infoImg\"><div style=\"text-align: center;\"><img src=\"http://img06.jiuxian.com/bill/2017/0104/e22adc02d8114ff98faaf502f3f43c7b.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/ac6bd315b19e4259b72c2f46537ed660.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/460ad5f96b964d1b9889d9beda17bca8.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/d11e484977494d6aa577b065310db8d5.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/9a9caf2f89fc47de93329fd7e65aa7b3.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/0faeb161215c457f8c09b6594a6f8d0b.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0105/427f76c34fb44ca7be1b81cf7cd24cfb.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/1aab30d6a61e45158d90643b6391f3d1.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/d98a4b469eb54d818da25fffd506262d.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/6d319dff0e244361abb761ae987b8fd7.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/62e0c3de94d148478a61be2e69119914.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/42bba782cb3344799a50a993f0bcc710.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/7938a2b0d45f4f10928989aa6427999e.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/237ac63526454270b5e40c2fcca0433e.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/ff2f1bde058e40f38df0bcddd81a348e.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/0ea5367450324d17971f15cacb7dfaf8.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/bc7e08c62fec4619a05233f3cd6a3086.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/8de7908de9634b0699891b6a05a9ea7d.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/4bfe1a9b11b44c6ba01337fa149497ad.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/2bcb51a5b45f47eaa65881aeca20428f.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/5b77697291f743ffb13e1dc113b37a37.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/5cac982189c14ffebc145fbcd747eeb7.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/781713b94e18454cb62015dfd643d4dd.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/29fbbbb6b30e476997e04f0aeebee576.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/9e06bc7791cd4db893e4cc809bb60292.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/4b643f0d11cd40abaff1f6cf6c2c81c5.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/58dd982386984d009a058f3a1c371753.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/03a3b75c1bf84654a51c9e46938c1d7c.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/b4e5295e2a304a81b308f10b07165002.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/dae0a460a1144a28a37dac6c40e241a3.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/bbc76bc1d7cf4af39911bf61f46d9d4e.jpg\"/><img src=\"http://img06.jiuxian.com/bill/2017/0104/447ef10b45444c5eaca27c3dd49ffed1.jpg\"/></div></div></div></div>', '', '0', '0', '/uploads/20171023/03fbee116a1d39e3052e0eac7f1915a2.png', 'a:4:{i:0;s:52:\"/public/uploads/images/20170806/1502011132140051.jpg\";i:1;s:52:\"/public/uploads/images/20170806/1502011132154828.jpg\";i:2;s:52:\"/public/uploads/images/20170806/1502011133541985.jpg\";i:3;s:52:\"/public/uploads/images/20170806/1502011133503127.jpg\";}', '1', '1', '0', '1', '2017-08-06 17:19:30', '2017-08-06 17:18:18', '159.00', '180.00', '50.00', '200.00', '999', '0', '0', '2017-08-06 17:18:21', '2019-08-13 17:18:23', null, null);
INSERT INTO `goods` VALUES ('3', '2', '0', '法国整箱红酒法国原瓶进口葛雷奥利干红葡萄酒750ml（6瓶套）酒杯酒刀', '爆款热销 高性价比套装', '', '<div class=\"descBox\"><div class=\"infoBox\"><h3>商品特点</h3><div class=\"infoImg\"><div style=\"text-align: center;\"><span style=\"color:#FF0000;\"><strong>温馨提示：此产品新旧包装更换中，请以收到的实物为准！ </strong></span><img src=\"http://img10.jiuxian.com/bill/2017/0118/b2d0d42d190d472d819c5b4d8dd5e85f.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/3217f1043c2244b9b41075c48e106473.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/d382b9a830624889b94070871919d0ba.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/42f08c72187244af96148f7f82150bb3.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/fb7d94a428bd4dc598dc59dc8e738cc1.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/0dae4107e0de476a8ed75571b44f6f71.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/0ce747a208424036b4ba07edbed984bf.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/d49f1337ff2946be986cea5ca21dce6d.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/d7e962062c4b435cadf492737d75dbb2.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/1ba87dbf65584c3698cf887eb88a35e2.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/836580b6f74d45f1b9d5676de17eb91d.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/2c4166966e7045a3ac901bb131e0097f.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/06c69de284564cf5a0426ed875ce5423.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/a1174b12bdcf45cf97f0b58f4ecf2766.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/96c2c4c2dde646098fd3d05e594e1dd3.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/6bee185b326449f0a49ae579b3d5b175.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/c948e66594b84d05a97c522249bc5558.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/3e6a196a41da48e697a829d653ad0cfc.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/3999527df28c4b3db0b6d3b69ac12264.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/eaafdee92c0e42c0b2f0560375880a0b.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/b4114abbd03b417a9ae897e4c2457853.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/b984faa5ed334ee88dd409b090dbdc0b.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/58a4903eca8546688333a40cd8188398.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/dc9463a9d04847538d136dfb502562cc.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/b3652104bd1f41d7b7348084b5c26e8f.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/ddbf949552c8445695b47769008cdaad.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/667075d92247417a9aea3acd3bc1e4ab.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/0d08fd6567b5446c89315108861687db.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2017/0118/a4c0c5c600794fe3837fd70e4fd9be3a.jpg\"/></div><div style=\"text-align: center;\"><img src=\"http://img10.jiuxian.com/bill/2015/0603/e413a3df0a0849beaf526bb2784fd4d1.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2015/0603/f96a058e00104c3695744555cc61a342.jpg\"/></div><div style=\"text-align: center;\"><img src=\"http://img10.jiuxian.com/bill/2014/1127/5bf6dec15da845ce9aa588c30781ac7d.jpg\"/><img src=\"http://img10.jiuxian.com/bill/2014/1127/bc2d19fa85894a0f9d03383ef97d2886.jpg\"/></div></div></div></div>', '', '0', '0', '/uploads/20171023/5dbf9497f905e62b39e435b04b6fa53f.png', 'a:3:{i:0;s:52:\"/public/uploads/images/20171022/1508638920107119.png\";i:1;s:52:\"/public/uploads/images/20171022/1508638920768719.png\";i:2;s:52:\"/public/uploads/images/20171022/1508638920471111.png\";}', '1', '0', '0', '0', '2017-08-06 17:25:45', '2017-08-06 17:24:44', '179.00', '189.00', '100.00', '199.00', '999', '0', '0', '2017-08-06 17:24:46', '2021-08-18 17:24:48', null, null);

-- ----------------------------
-- Table structure for goods_browse_record
-- ----------------------------
DROP TABLE IF EXISTS `goods_browse_record`;
CREATE TABLE `goods_browse_record` (
  `id` int(11) NOT NULL,
  `g_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `g_value` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品基本信息 json串',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods_browse_record
-- ----------------------------

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='图片总表';

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '/banner-1a.png', '1', null, null);
INSERT INTO `image` VALUES ('2', '/banner-2a.png', '1', null, null);
INSERT INTO `image` VALUES ('3', '/banner-3a.png', '1', null, null);
INSERT INTO `image` VALUES ('4', '/category-cake.png', '1', null, null);
INSERT INTO `image` VALUES ('5', '/category-vg.png', '1', null, null);
INSERT INTO `image` VALUES ('6', '/category-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('7', '/category-fry-a.png', '1', null, null);
INSERT INTO `image` VALUES ('8', '/category-tea.png', '1', null, null);
INSERT INTO `image` VALUES ('9', '/category-rice.png', '1', null, null);
INSERT INTO `image` VALUES ('10', '/product-dryfruit@1.png', '1', null, null);
INSERT INTO `image` VALUES ('13', '/product-vg@1.png', '1', null, null);
INSERT INTO `image` VALUES ('14', '/product-rice@6.png', '1', null, null);
INSERT INTO `image` VALUES ('16', '/1@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('17', '/2@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('18', '/3@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('19', '/detail-1@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('20', '/detail-2@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('21', '/detail-3@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('22', '/detail-4@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('23', '/detail-5@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('24', '/detail-6@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('25', '/detail-7@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('26', '/detail-8@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('27', '/detail-9@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('28', '/detail-11@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('29', '/detail-10@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('31', '/product-rice@1.png', '1', null, null);
INSERT INTO `image` VALUES ('32', '/product-tea@1.png', '1', null, null);
INSERT INTO `image` VALUES ('33', '/product-dryfruit@2.png', '1', null, null);
INSERT INTO `image` VALUES ('36', '/product-dryfruit@3.png', '1', null, null);
INSERT INTO `image` VALUES ('37', '/product-dryfruit@4.png', '1', null, null);
INSERT INTO `image` VALUES ('38', '/product-dryfruit@5.png', '1', null, null);
INSERT INTO `image` VALUES ('39', '/product-dryfruit-a@6.png', '1', null, null);
INSERT INTO `image` VALUES ('40', '/product-dryfruit@7.png', '1', null, null);
INSERT INTO `image` VALUES ('41', '/product-rice@2.png', '1', null, null);
INSERT INTO `image` VALUES ('42', '/product-rice@3.png', '1', null, null);
INSERT INTO `image` VALUES ('43', '/product-rice@4.png', '1', null, null);
INSERT INTO `image` VALUES ('44', '/product-fry@1.png', '1', null, null);
INSERT INTO `image` VALUES ('45', '/product-fry@2.png', '1', null, null);
INSERT INTO `image` VALUES ('46', '/product-fry@3.png', '1', null, null);
INSERT INTO `image` VALUES ('47', '/product-tea@2.png', '1', null, null);
INSERT INTO `image` VALUES ('48', '/product-tea@3.png', '1', null, null);
INSERT INTO `image` VALUES ('49', '/1@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('50', '/2@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('51', '/3@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('52', '/product-cake@1.png', '1', null, null);
INSERT INTO `image` VALUES ('53', '/product-cake@2.png', '1', null, null);
INSERT INTO `image` VALUES ('54', '/product-cake-a@3.png', '1', null, null);
INSERT INTO `image` VALUES ('55', '/product-cake-a@4.png', '1', null, null);
INSERT INTO `image` VALUES ('56', '/product-dryfruit@8.png', '1', null, null);
INSERT INTO `image` VALUES ('57', '/product-fry@4.png', '1', null, null);
INSERT INTO `image` VALUES ('58', '/product-fry@5.png', '1', null, null);
INSERT INTO `image` VALUES ('59', '/product-rice@5.png', '1', null, null);
INSERT INTO `image` VALUES ('60', '/product-rice@7.png', '1', null, null);
INSERT INTO `image` VALUES ('62', '/detail-12@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('63', '/detail-13@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('65', '/banner-4a.png', '1', null, null);
INSERT INTO `image` VALUES ('66', '/product-vg@4.png', '1', null, null);
INSERT INTO `image` VALUES ('67', '/product-vg@5.png', '1', null, null);
INSERT INTO `image` VALUES ('68', '/product-vg@2.png', '1', null, null);
INSERT INTO `image` VALUES ('69', '/product-vg@3.png', '1', null, null);

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link` varchar(255) DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) DEFAULT '' COMMENT '链接图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 显示  2 隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', 'asdadasdasasdasd1231', 'asdsasdsasd', '/uploads/20171022/47ce60407089b0c5cc75142d2d40d029.png', '1', '0');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('24', 'A912277117586583', '1', null, '1505227711', '188.00', '1', 'https://www.redkylin.com/images/90a1198f814c43de96de5c19e4bdaee0_4.jpg', '法国 香奈 香内红葡萄酒 750ml', '1', '1505227711', '[{\"id\":11,\"name\":\"\\u6cd5\\u56fd \\u9999\\u5948 \\u9999\\u5185\\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/90a1198f814c43de96de5c19e4bdaee0_4.jpg\",\"count\":1,\"totalPrice\":188,\"price\":\"188.00\",\"counts\":1}]', '{\"name\":\"\\u5b89\\u5b87\\u8f69\",\"mobile\":\"15110353879\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u6d77\\u6dc0\\u533a\\u961c\\u6210\\u8def(\\u516b\\u91cc\\u5e84\\u6865\\u4e1c300\\u7c73)\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('25', 'A912277135908092', '1', null, '1505227713', '188.00', '1', 'https://www.redkylin.com/images/90a1198f814c43de96de5c19e4bdaee0_4.jpg', '法国 香奈 香内红葡萄酒 750ml', '1', '1505227713', '[{\"id\":11,\"name\":\"\\u6cd5\\u56fd \\u9999\\u5948 \\u9999\\u5185\\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/90a1198f814c43de96de5c19e4bdaee0_4.jpg\",\"count\":1,\"totalPrice\":188,\"price\":\"188.00\",\"counts\":1}]', '{\"name\":\"\\u5b89\\u5b87\\u8f69\",\"mobile\":\"15110353879\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u6d77\\u6dc0\\u533a\\u961c\\u6210\\u8def(\\u516b\\u91cc\\u5e84\\u6865\\u4e1c300\\u7c73)\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('26', 'A912277141839596', '1', null, '1505227714', '188.00', '1', 'https://www.redkylin.com/images/90a1198f814c43de96de5c19e4bdaee0_4.jpg', '法国 香奈 香内红葡萄酒 750ml', '1', '1505227714', '[{\"id\":11,\"name\":\"\\u6cd5\\u56fd \\u9999\\u5948 \\u9999\\u5185\\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/90a1198f814c43de96de5c19e4bdaee0_4.jpg\",\"count\":1,\"totalPrice\":188,\"price\":\"188.00\",\"counts\":1}]', '{\"name\":\"\\u5b89\\u5b87\\u8f69\",\"mobile\":\"15110353879\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u6d77\\u6dc0\\u533a\\u961c\\u6210\\u8def(\\u516b\\u91cc\\u5e84\\u6865\\u4e1c300\\u7c73)\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('27', 'A912277147439071', '1', null, '1505227714', '188.00', '1', 'https://www.redkylin.com/images/90a1198f814c43de96de5c19e4bdaee0_4.jpg', '法国 香奈 香内红葡萄酒 750ml', '1', '1505227714', '[{\"id\":11,\"name\":\"\\u6cd5\\u56fd \\u9999\\u5948 \\u9999\\u5185\\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/90a1198f814c43de96de5c19e4bdaee0_4.jpg\",\"count\":1,\"totalPrice\":188,\"price\":\"188.00\",\"counts\":1}]', '{\"name\":\"\\u5b89\\u5b87\\u8f69\",\"mobile\":\"15110353879\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u6d77\\u6dc0\\u533a\\u961c\\u6210\\u8def(\\u516b\\u91cc\\u5e84\\u6865\\u4e1c300\\u7c73)\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('28', 'A912303459754345', '8', null, '1505230345', '0.01', '1', 'https://www.redkylin.com/images/6adfe5f80b0941bb8df19d86701988c0_4.jpg', '智利 拉菲 华诗歌/巴斯克 赤霞珠 红葡萄酒 750ml', '1', '1505230345', '[{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('29', 'A912303485006967', '8', null, '1505230348', '0.01', '1', 'https://www.redkylin.com/images/6adfe5f80b0941bb8df19d86701988c0_4.jpg', '智利 拉菲 华诗歌/巴斯克 赤霞珠 红葡萄酒 750ml', '1', '1505230348', '[{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('30', 'A912303492982170', '8', null, '1505230349', '0.01', '1', 'https://www.redkylin.com/images/6adfe5f80b0941bb8df19d86701988c0_4.jpg', '智利 拉菲 华诗歌/巴斯克 赤霞珠 红葡萄酒 750ml', '1', '1505230349', '[{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('31', 'A912303495267592', '8', null, '1505230349', '0.01', '1', 'https://www.redkylin.com/images/6adfe5f80b0941bb8df19d86701988c0_4.jpg', '智利 拉菲 华诗歌/巴斯克 赤霞珠 红葡萄酒 750ml', '1', '1505230349', '[{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('32', 'A913913499950774', '8', null, '1505291349', '0.01', '1', 'https://www.redkylin.com/images/6adfe5f80b0941bb8df19d86701988c0_4.jpg', '智利 拉菲 华诗歌/巴斯克 赤霞珠 红葡萄酒 750ml', '1', '1505291349', '[{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('33', 'A913913511135832', '8', null, '1505291351', '0.01', '1', 'https://www.redkylin.com/images/6adfe5f80b0941bb8df19d86701988c0_4.jpg', '智利 拉菲 华诗歌/巴斯克 赤霞珠 红葡萄酒 750ml', '1', '1505291351', '[{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('34', 'A913913519347471', '8', null, '1505291351', '0.01', '1', 'https://www.redkylin.com/images/6adfe5f80b0941bb8df19d86701988c0_4.jpg', '智利 拉菲 华诗歌/巴斯克 赤霞珠 红葡萄酒 750ml', '1', '1505291351', '[{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('35', 'A913913525851856', '8', null, '1505291352', '0.01', '1', 'https://www.redkylin.com/images/6adfe5f80b0941bb8df19d86701988c0_4.jpg', '智利 拉菲 华诗歌/巴斯克 赤霞珠 红葡萄酒 750ml', '1', '1505291352', '[{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('36', 'A913913528177095', '8', null, '1505291352', '0.01', '1', 'https://www.redkylin.com/images/6adfe5f80b0941bb8df19d86701988c0_4.jpg', '智利 拉菲 华诗歌/巴斯克 赤霞珠 红葡萄酒 750ml', '1', '1505291352', '[{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('37', 'A913913530401598', '8', null, '1505291352', '0.01', '1', 'https://www.redkylin.com/images/6adfe5f80b0941bb8df19d86701988c0_4.jpg', '智利 拉菲 华诗歌/巴斯克 赤霞珠 红葡萄酒 750ml', '1', '1505291352', '[{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('38', 'A913914069947492', '8', null, '1505291406', '42.01', '1', 'https://www.redkylin.com/images/fd2a3a359d5b44ed80735551536b3a3f_4.jpg', '张裕 梅鹿辄红葡萄酒 圆桶装 750ml等', '2', '1505291406', '[{\"id\":4,\"name\":\"\\u5f20\\u88d5 \\u6885\\u9e7f\\u8f84\\u7ea2\\u8461\\u8404\\u9152 \\u5706\\u6876\\u88c5 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/fd2a3a359d5b44ed80735551536b3a3f_4.jpg\",\"count\":1,\"totalPrice\":42,\"price\":\"42.00\",\"counts\":1},{\"id\":13,\"name\":\"\\u667a\\u5229 \\u62c9\\u83f2 \\u534e\\u8bd7\\u6b4c\\/\\u5df4\\u65af\\u514b \\u8d64\\u971e\\u73e0 \\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/6adfe5f80b0941bb8df19d86701988c0_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('39', 'A913914273407437', '8', null, '1505291427', '21.00', '1', 'https://www.redkylin.com/images/a79cfaac1465480a9fb2ed08d0719cae_4.jpg', '法国 拉菲 奥希耶红 红葡萄酒 750ml*6瓶【整箱装】', '1', '1505291427', '[{\"id\":3,\"name\":\"\\u6cd5\\u56fd \\u62c9\\u83f2 \\u5965\\u5e0c\\u8036\\u7ea2 \\u7ea2\\u8461\\u8404\\u9152 750ml*6\\u74f6\\u3010\\u6574\\u7bb1\\u88c5\\u3011\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/a79cfaac1465480a9fb2ed08d0719cae_4.jpg\",\"count\":1,\"totalPrice\":21,\"price\":\"21.00\",\"counts\":1}]', '{\"name\":\"\\u6f58\\u6210\\u98de\",\"mobile\":\"13438863914\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u963f\\u514b\\u66fc\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('40', 'A913980145935401', '1', null, '1505298014', '188.01', '1', 'https://www.redkylin.com/images/90a1198f814c43de96de5c19e4bdaee0_4.jpg', '法国 香奈 香内红葡萄酒 750ml等', '2', '1505298014', '[{\"id\":11,\"name\":\"\\u6cd5\\u56fd \\u9999\\u5948 \\u9999\\u5185\\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/90a1198f814c43de96de5c19e4bdaee0_4.jpg\",\"count\":1,\"totalPrice\":188,\"price\":\"188.00\",\"counts\":1},{\"id\":25,\"name\":\"50\\u5ea6 \\u9752\\u6d77\\u5927\\u66f2 (99-00\\u5e74\\u4ea7) 500ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/81d9a3a4a7b14d7682db14b9dbf0f21d_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1}]', '{\"name\":\"\\u5b89\\u5b87\\u8f69\",\"mobile\":\"15110353879\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u6d77\\u6dc0\\u533a\\u961c\\u6210\\u8def(\\u516b\\u91cc\\u5e84\\u6865\\u4e1c300\\u7c73)\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('41', 'A914935075767405', '1', null, '1505393507', '188.07', '1', 'https://www.redkylin.com/images/90a1198f814c43de96de5c19e4bdaee0_4.jpg', '法国 香奈 香内红葡萄酒 750ml等', '8', '1505393507', '[{\"id\":11,\"name\":\"\\u6cd5\\u56fd \\u9999\\u5948 \\u9999\\u5185\\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/90a1198f814c43de96de5c19e4bdaee0_4.jpg\",\"count\":1,\"totalPrice\":188,\"price\":\"188.00\",\"counts\":1},{\"id\":14,\"name\":\"\\u6fb3\\u5927\\u5229\\u4e9a \\u9ec4\\u5c3e\\u888b\\u9f20 \\u897f\\u62c9\\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/ddd3e440ca334ca5948abc8198b7b9e1_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":25,\"name\":\"50\\u5ea6 \\u9752\\u6d77\\u5927\\u66f2 (99-00\\u5e74\\u4ea7) 500ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/81d9a3a4a7b14d7682db14b9dbf0f21d_4.jpg\",\"count\":6,\"totalPrice\":0.06,\"price\":\"0.01\",\"counts\":6}]', '{\"name\":\"\\u5b89\\u5b87\\u8f69\",\"mobile\":\"15110353879\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u6d77\\u6dc0\\u533a\\u961c\\u6210\\u8def(\\u516b\\u91cc\\u5e84\\u6865\\u4e1c300\\u7c73)\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('42', 'A914935078609295', '1', null, '1505393507', '188.07', '1', 'https://www.redkylin.com/images/90a1198f814c43de96de5c19e4bdaee0_4.jpg', '法国 香奈 香内红葡萄酒 750ml等', '8', '1505393507', '[{\"id\":11,\"name\":\"\\u6cd5\\u56fd \\u9999\\u5948 \\u9999\\u5185\\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/90a1198f814c43de96de5c19e4bdaee0_4.jpg\",\"count\":1,\"totalPrice\":188,\"price\":\"188.00\",\"counts\":1},{\"id\":14,\"name\":\"\\u6fb3\\u5927\\u5229\\u4e9a \\u9ec4\\u5c3e\\u888b\\u9f20 \\u897f\\u62c9\\u7ea2\\u8461\\u8404\\u9152 750ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/ddd3e440ca334ca5948abc8198b7b9e1_4.jpg\",\"count\":1,\"totalPrice\":0.01,\"price\":\"0.01\",\"counts\":1},{\"id\":25,\"name\":\"50\\u5ea6 \\u9752\\u6d77\\u5927\\u66f2 (99-00\\u5e74\\u4ea7) 500ml\",\"main_img_url\":\"https:\\/\\/www.redkylin.com\\/images\\/81d9a3a4a7b14d7682db14b9dbf0f21d_4.jpg\",\"count\":6,\"totalPrice\":0.06,\"price\":\"0.01\",\"counts\":6}]', '{\"name\":\"\\u5b89\\u5b87\\u8f69\",\"mobile\":\"15110353879\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"city\":\"\\u5317\\u4eac\\u5e02\",\"country\":\"\\u4e1c\\u57ce\\u533a\",\"detail\":\"\\u6d77\\u6dc0\\u533a\\u961c\\u6210\\u8def(\\u516b\\u91cc\\u5e84\\u6865\\u4e1c300\\u7c73)\",\"update_time\":\"1970-01-01 08:00:00\"}', null);

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('11', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('23', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('39', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('38', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('12', '5', '1', null, null);
INSERT INTO `order_product` VALUES ('13', '5', '1', null, null);
INSERT INTO `order_product` VALUES ('14', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('15', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('16', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('17', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('18', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('19', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('20', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('21', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('22', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('23', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('24', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('25', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('26', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('27', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('40', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('41', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('42', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('28', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('29', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('30', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('31', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('32', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('33', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('34', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('35', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('36', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('37', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('38', '13', '1', null, null);
INSERT INTO `order_product` VALUES ('41', '14', '6', null, null);
INSERT INTO `order_product` VALUES ('42', '14', '6', null, null);
INSERT INTO `order_product` VALUES ('40', '25', '1', null, null);
INSERT INTO `order_product` VALUES ('41', '25', '1', null, null);
INSERT INTO `order_product` VALUES ('42', '25', '1', null, null);
INSERT INTO `order_product` VALUES ('1', '26', '1', null, null);
INSERT INTO `order_product` VALUES ('2', '26', '1', null, null);
INSERT INTO `order_product` VALUES ('3', '26', '1', null, null);
INSERT INTO `order_product` VALUES ('4', '26', '1', null, null);
INSERT INTO `order_product` VALUES ('5', '26', '1', null, null);
INSERT INTO `order_product` VALUES ('6', '26', '1', null, null);
INSERT INTO `order_product` VALUES ('7', '26', '1', null, null);
INSERT INTO `order_product` VALUES ('8', '26', '1', null, null);
INSERT INTO `order_product` VALUES ('9', '26', '1', null, null);
INSERT INTO `order_product` VALUES ('10', '26', '1', null, null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '芹菜 半斤', '0.01', '998', null, '3', '/product-vg@1.png', '1', null, null, null, '13');
INSERT INTO `product` VALUES ('2', '梨花带雨 3个', '0.01', '984', null, '2', '/product-dryfruit@1.png', '1', null, null, null, '10');
INSERT INTO `product` VALUES ('3', '素米 327克', '0.01', '996', null, '7', '/product-rice@1.png', '1', null, null, null, '31');
INSERT INTO `product` VALUES ('4', '红袖枸杞 6克*3袋', '0.01', '998', null, '6', '/product-tea@1.png', '1', null, null, null, '32');
INSERT INTO `product` VALUES ('5', '春生龙眼 500克', '0.01', '995', null, '2', '/product-dryfruit@2.png', '1', null, null, null, '33');
INSERT INTO `product` VALUES ('6', '小红的猪耳朵 120克', '0.01', '997', null, '5', '/product-cake@2.png', '1', null, null, null, '53');
INSERT INTO `product` VALUES ('7', '泥蒿 半斤', '0.01', '998', null, '3', '/product-vg@2.png', '1', null, null, null, '68');
INSERT INTO `product` VALUES ('8', '夏日芒果 3个', '0.01', '995', null, '2', '/product-dryfruit@3.png', '1', null, null, null, '36');
INSERT INTO `product` VALUES ('9', '冬木红枣 500克', '0.01', '996', null, '2', '/product-dryfruit@4.png', '1', null, null, null, '37');
INSERT INTO `product` VALUES ('10', '万紫千凤梨 300克', '0.01', '996', null, '2', '/product-dryfruit@5.png', '1', null, null, null, '38');
INSERT INTO `product` VALUES ('11', '贵妃笑 100克', '0.01', '994', null, '2', '/product-dryfruit-a@6.png', '1', null, null, null, '39');
INSERT INTO `product` VALUES ('12', '珍奇异果 3个', '0.01', '999', null, '2', '/product-dryfruit@7.png', '1', null, null, null, '40');
INSERT INTO `product` VALUES ('13', '绿豆 125克', '0.01', '999', null, '7', '/product-rice@2.png', '1', null, null, null, '41');
INSERT INTO `product` VALUES ('14', '芝麻 50克', '0.01', '999', null, '7', '/product-rice@3.png', '1', null, null, null, '42');
INSERT INTO `product` VALUES ('15', '猴头菇 370克', '0.01', '999', null, '7', '/product-rice@4.png', '1', null, null, null, '43');
INSERT INTO `product` VALUES ('16', '西红柿 1斤', '0.01', '999', null, '3', '/product-vg@3.png', '1', null, null, null, '69');
INSERT INTO `product` VALUES ('17', '油炸花生 300克', '0.01', '999', null, '4', '/product-fry@1.png', '1', null, null, null, '44');
INSERT INTO `product` VALUES ('18', '春泥西瓜子 128克', '0.01', '997', null, '4', '/product-fry@2.png', '1', null, null, null, '45');
INSERT INTO `product` VALUES ('19', '碧水葵花籽 128克', '0.01', '999', null, '4', '/product-fry@3.png', '1', null, null, null, '46');
INSERT INTO `product` VALUES ('20', '碧螺春 12克*3袋', '0.01', '999', null, '6', '/product-tea@2.png', '1', null, null, null, '47');
INSERT INTO `product` VALUES ('21', '西湖龙井 8克*3袋', '0.01', '998', null, '6', '/product-tea@3.png', '1', null, null, null, '48');
INSERT INTO `product` VALUES ('22', '梅兰清花糕 1个', '0.01', '997', null, '5', '/product-cake-a@3.png', '1', null, null, null, '54');
INSERT INTO `product` VALUES ('23', '清凉薄荷糕 1个', '0.01', '998', null, '5', '/product-cake-a@4.png', '1', null, null, null, '55');
INSERT INTO `product` VALUES ('25', '小明的妙脆角 120克', '0.01', '999', null, '5', '/product-cake@1.png', '1', null, null, null, '52');
INSERT INTO `product` VALUES ('26', '红衣青瓜 混搭160克', '0.01', '999', null, '2', '/product-dryfruit@8.png', '1', null, null, null, '56');
INSERT INTO `product` VALUES ('27', '锈色瓜子 100克', '0.01', '998', null, '4', '/product-fry@4.png', '1', null, null, null, '57');
INSERT INTO `product` VALUES ('28', '春泥花生 200克', '0.01', '999', null, '4', '/product-fry@5.png', '1', null, null, null, '58');
INSERT INTO `product` VALUES ('29', '冰心鸡蛋 2个', '0.01', '999', null, '7', '/product-rice@5.png', '1', null, null, null, '59');
INSERT INTO `product` VALUES ('30', '八宝莲子 200克', '0.01', '999', null, '7', '/product-rice@6.png', '1', null, null, null, '14');
INSERT INTO `product` VALUES ('31', '深涧木耳 78克', '0.01', '999', null, '7', '/product-rice@7.png', '1', null, null, null, '60');
INSERT INTO `product` VALUES ('32', '土豆 半斤', '0.01', '999', null, '3', '/product-vg@4.png', '1', null, null, null, '66');
INSERT INTO `product` VALUES ('33', '青椒 半斤', '0.01', '999', null, '3', '/product-vg@5.png', '1', null, null, null, '67');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('4', '19', null, '1', '11');
INSERT INTO `product_image` VALUES ('5', '20', null, '2', '11');
INSERT INTO `product_image` VALUES ('6', '21', null, '3', '11');
INSERT INTO `product_image` VALUES ('7', '22', null, '4', '11');
INSERT INTO `product_image` VALUES ('8', '23', null, '5', '11');
INSERT INTO `product_image` VALUES ('9', '24', null, '6', '11');
INSERT INTO `product_image` VALUES ('10', '25', null, '7', '11');
INSERT INTO `product_image` VALUES ('11', '26', null, '8', '11');
INSERT INTO `product_image` VALUES ('12', '27', null, '9', '11');
INSERT INTO `product_image` VALUES ('13', '28', null, '11', '11');
INSERT INTO `product_image` VALUES ('14', '29', null, '10', '11');
INSERT INTO `product_image` VALUES ('18', '62', null, '12', '11');
INSERT INTO `product_image` VALUES ('19', '63', null, '13', '11');

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_property
-- ----------------------------
INSERT INTO `product_property` VALUES ('21', '123123', '123123123', '3', null, null);
INSERT INTO `product_property` VALUES ('22', '品名', '梨子', '2', null, null);
INSERT INTO `product_property` VALUES ('23', '产地', '金星', '2', null, null);
INSERT INTO `product_property` VALUES ('24', '净含量', '100g', '2', null, null);
INSERT INTO `product_property` VALUES ('25', '保质期', '10天', '2', null, null);

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES ('1', 'site_config', 'a:7:{s:10:\"site_title\";s:30:\"Think Admin 后台管理系统\";s:9:\"seo_title\";s:0:\"\";s:11:\"seo_keyword\";s:0:\"\";s:15:\"seo_description\";s:0:\"\";s:14:\"site_copyright\";s:0:\"\";s:8:\"site_icp\";s:0:\"\";s:11:\"site_tongji\";s:0:\"\";}');

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='主题信息表';

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES ('1', '0', '11.11双节特惠', '双11疯狂购物街', '/them/1.html', '', '_blank', '疯狂购物，双十一特卖产品', '16', null, '49', null, '1', '1');
INSERT INTO `theme` VALUES ('2', '0', '值得买', '聚划算', '', '', '_blank', '折扣商品、厂家直销、活动特价', '17', null, '50', null, '2', '1');
INSERT INTO `theme` VALUES ('3', '0', '葡萄酒馆', '', '', '', '_blank', '好喝的国产葡萄酒', '18', null, '18', null, '3', '1');

-- ----------------------------
-- Table structure for theme_product
-- ----------------------------
DROP TABLE IF EXISTS `theme_product`;
CREATE TABLE `theme_product` (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题所包含的商品';

-- ----------------------------
-- Records of theme_product
-- ----------------------------
INSERT INTO `theme_product` VALUES ('1', '2');
INSERT INTO `theme_product` VALUES ('1', '5');
INSERT INTO `theme_product` VALUES ('1', '8');
INSERT INTO `theme_product` VALUES ('1', '10');
INSERT INTO `theme_product` VALUES ('1', '12');
INSERT INTO `theme_product` VALUES ('2', '1');
INSERT INTO `theme_product` VALUES ('2', '2');
INSERT INTO `theme_product` VALUES ('2', '3');
INSERT INTO `theme_product` VALUES ('2', '5');
INSERT INTO `theme_product` VALUES ('2', '6');
INSERT INTO `theme_product` VALUES ('2', '16');
INSERT INTO `theme_product` VALUES ('2', '33');
INSERT INTO `theme_product` VALUES ('3', '15');
INSERT INTO `theme_product` VALUES ('3', '18');
INSERT INTO `theme_product` VALUES ('3', '19');
INSERT INTO `theme_product` VALUES ('3', '27');
INSERT INTO `theme_product` VALUES ('3', '30');
INSERT INTO `theme_product` VALUES ('3', '31');

-- ----------------------------
-- Table structure for third_app
-- ----------------------------
DROP TABLE IF EXISTS `third_app`;
CREATE TABLE `third_app` (
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
-- Records of third_app
-- ----------------------------
INSERT INTO `third_app` VALUES ('1', 'starcraft', '777*777', 'CMS', '32', 'Super', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('9', '', '59ec35f27576c', 'asdasd', '12312312312', '123123@qq.com', '1', null, '1', '123', null, null, null, '2017', null);

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_address
-- ----------------------------

-- ----------------------------
-- Table structure for user_rank
-- ----------------------------
DROP TABLE IF EXISTS `user_rank`;
CREATE TABLE `user_rank` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '级别名称',
  `rank_integral` int(10) unsigned NOT NULL COMMENT '积分要求',
  `rank_discount` float(3,1) unsigned NOT NULL COMMENT '级别优惠折扣',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_rank
-- ----------------------------
INSERT INTO `user_rank` VALUES ('1', '青铜', '0', '0.0');
INSERT INTO `user_rank` VALUES ('2', '白银', '1000', '9.0');
INSERT INTO `user_rank` VALUES ('3', '黄金', '5000', '7.0');
INSERT INTO `user_rank` VALUES ('4', '白金', '8000', '6.0');
INSERT INTO `user_rank` VALUES ('5', '钻石', '100000', '5.0');
