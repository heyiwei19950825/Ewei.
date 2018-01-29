/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : zerg

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-29 02:00:03
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
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of ewei_admin_user
-- ----------------------------
INSERT INTO `ewei_admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, '1', '0', '2018-01-28 18:10:03', '127.0.0.1');
INSERT INTO `ewei_admin_user` VALUES ('23', 'uyiku', '4297f44b13955235245b2497399d7a93', null, null, '1', '0', '2018-01-10 20:01:13', '127.0.0.1');

-- ----------------------------
-- Table structure for ewei_album_picture
-- ----------------------------
DROP TABLE IF EXISTS `ewei_album_picture`;
CREATE TABLE `ewei_album_picture` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `shop_id` int(10) unsigned DEFAULT '1' COMMENT '所属实例id',
  `album_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `is_wide` int(11) NOT NULL DEFAULT '0' COMMENT '是否宽屏',
  `pic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `pic_tag` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标签',
  `pic_cover` varchar(255) NOT NULL COMMENT '原图图片路径',
  `pic_size` varchar(255) NOT NULL COMMENT '原图大小',
  `pic_spec` varchar(100) NOT NULL COMMENT '原图规格',
  `pic_cover_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图路径',
  `pic_size_big` varchar(255) NOT NULL DEFAULT '0' COMMENT '大图大小',
  `pic_spec_big` varchar(100) NOT NULL DEFAULT '' COMMENT '大图规格',
  `pic_cover_mid` varchar(255) NOT NULL DEFAULT '' COMMENT '中图路径',
  `pic_size_mid` varchar(255) NOT NULL DEFAULT '0' COMMENT '中图大小',
  `pic_spec_mid` varchar(100) NOT NULL DEFAULT '' COMMENT '中图规格',
  `pic_cover_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图路径',
  `pic_size_small` varchar(255) NOT NULL DEFAULT '0' COMMENT '小图大小',
  `pic_spec_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图规格',
  `pic_cover_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图路径',
  `pic_size_micro` varchar(255) NOT NULL DEFAULT '0' COMMENT '微图大小',
  `pic_spec_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图规格',
  `upload_time` int(11) DEFAULT '0' COMMENT '图片上传时间',
  `upload_type` int(11) DEFAULT '1' COMMENT '图片外链',
  `domain` varchar(255) DEFAULT '' COMMENT '图片外链',
  `bucket` varchar(255) DEFAULT '' COMMENT '存储空间名称',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=204 COMMENT='相册图片表';

-- ----------------------------
-- Records of ewei_album_picture
-- ----------------------------
INSERT INTO `ewei_album_picture` VALUES ('1', '0', '30', '0', '11499330924', '1', '/uploads/goods_brand/1515575596.jpg', '350,350', '350,350', '/uploads/goods_brand/1515575596.jpg', '700,700', '700,700', '/uploads/goods_brand/1515575596.jpg', '360,360', '360,360', '/uploads/goods_brand/1515575596.jpg', '240,240', '240,240', '/uploads/goods_brand/1515575596.jpg', '60,60', '60,60', '1499330924', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('2', '0', '30', '0', '21499330928', '2', '/uploads/goods_brand/1515578042.jpg', '350,350', '350,350', '/uploads/goods_brand/1515578042.jpg', '700,700', '700,700', '/uploads/goods_brand/1515578042.jpg', '360,360', '360,360', '/uploads/goods_brand/1515578042.jpg', '240,240', '240,240', '/uploads/goods_brand/1515578042.jpg', '60,60', '60,60', '1499330929', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('3', '0', '30', '0', '31499330933', '3', '/uploads/goods_brand/1515576059.jpg', '350,350', '350,350', '/uploads/goods_brand/1515576059.jpg', '700,700', '700,700', '/uploads/goods_brand/1515576059.jpg', '360,360', '360,360', '/uploads/goods_brand/1515576059.jpg', '240,240', '240,240', '/uploads/goods_brand/1515576059.jpg', '60,60', '60,60', '1499330933', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('4', '0', '30', '0', '21499330996', '2', '/uploads/goods_brand/1515581629.jpg', '350,350', '350,350', '/uploads/goods_brand/1515581629.jpg', '700,700', '700,700', '/uploads/goods_brand/1515581629.jpg', '360,360', '360,360', '/uploads/goods_brand/1515581629.jpg', '240,240', '240,240', '/uploads/goods_brand/1515581629.jpg', '60,60', '60,60', '1499330996', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('5', '0', '30', '0', '41499331769', '4', '/uploads/goods/1515581639469046.jpg', '350,350', '350,350', '/uploads/goods/1515581639469046.jpg', '700,700', '700,700', '/uploads/goods/1515581639469046.jpg', '360,360', '360,360', '/goods/1515581639469046.jpg', '240,240', '240,240', '/uploads/goods/1515581639469046.jpg', '60,60', '60,60', '1499331769', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('6', '0', '30', '0', '61499331772', '6', '/uploads/goods_brand/1515575596.jpg', '350,350', '350,350', '/uploads/goods_brand/1515575596.jpg', '700,700', '700,700', '/uploads/goods_brand/1515575596.jpg', '360,360', '360,360', '/uploads/goods_brand/1515575596.jpg', '240,240', '240,240', '/uploads/goods/1515578038187059.jpg', '60,60', '60,60', '1499331772', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('7', '0', '30', '0', '51499331775', '5', '/uploads/goods_brand/1515575596.jpg', '350,350', '350,350', '/uploads/goods_brand/1515575596.jpg', '700,700', '700,700', '/uploads/goods_brand/1515575596.jpg', '360,360', '360,360', '/uploads/goods_brand/1515575596.jpg', '240,240', '240,240', '/uploads/goods_brand/1515575596.jpg', '60,60', '60,60', '1499331775', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('8', '0', '30', '0', '11499333687', '1', '/uploads/goods_brand/1515575596.jpg', '800,800', '800,800', '/uploads/goods_brand/1515575596.jpg', '700,700', '700,700', '/uploads/goods_brand/1515575596.jpg', '360,360', '360,360', '/uploads/goods_brand/1515575596.jpg', '240,240', '240,240', '/uploads/goods_brand/1515575596.jpg', '60,60', '60,60', '1499333688', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('9', '0', '30', '0', '21499333690', '2', '/uploads/goods_brand/1515575596.jpg', '800,800', '800,800', '/uploads/goods_brand/1515575596.jpg', '700,700', '700,700', '/uploads/goods_brand/1515575596.jpg', '360,360', '360,360', '/uploads/goods_brand/1515575596.jpg', '240,240', '240,240', '/uploads/goods_brand/1515575596.jpg', '60,60', '60,60', '1499333691', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('10', '0', '30', '0', '31499333693', '3', '/uploads/goods_brand/1515575596.jpg', '800,1200', '800,1200', '/uploads/goods_brand/1515575596.jpg', '700,700', '700,700', '/uploads/goods_brand/1515575596.jpg', '360,360', '360,360', '/uploads/goods_brand/1515575596.jpg', '240,240', '240,240', '/uploads/goods_brand/1515575596.jpg', '60,60', '60,60', '1499333694', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('11', '0', '30', '0', '41499333696', '4', '/uploads/goods_brand/1515575596.jpg', '800,800', '800,800', '/uploads/goods_brand/1515575596.jpg', '700,700', '700,700', '/uploads/goods_brand/1515575596.jpg', '360,360', '360,360', '/uploads/goods_brand/1515575596.jpg', '240,240', '240,240', '/uploads/goods_brand/1515575596.jpg', '60,60', '60,60', '1499333697', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('12', '0', '30', '0', '51499333698', '5', '/uploads/goods_brand/1515575596.jpg', '800,800', '800,800', '/uploads/goods_brand/1515575596.jpg', '700,700', '700,700', '/uploads/goods_brand/1515575596.jpg', '360,360', '360,360', '/uploads/goods_brand/1515575596.jpg', '240,240', '240,240', '/uploads/goods_brand/1515575596.jpg', '60,60', '60,60', '1499333699', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('13', '0', '30', '0', '61499333939', '6', '/uploads/goods_brand/1515575596.jpg', '1061,1061', '1061,1061', '/uploads/goods_brand/1515575596.jpg', '700,700', '700,700', '/uploads/goods_brand/1515575596.jpg', '360,360', '360,360', '/uploads/goods_brand/1515575596.jpg', '240,240', '240,240', '/uploads/goods_brand/1515575596.jpg', '60,60', '60,60', '1499333940', '1', '', '');
INSERT INTO `ewei_album_picture` VALUES ('14', '0', '30', '0', '71499333942', '7', '/uploads/goods_brand/1515575596.jpg', '1061,1061', '1061,1061', '/uploads/goods_brand/1515575596.jpg', '700,700', '700,700', '/uploads/goods_brand/1515575596.jpg', '360,360', '360,360', '/uploads/goods_brand/1515575596.jpg', '240,240', '240,240', '/uploads/goods_brand/1515575596.jpg', '60,60', '60,60', '1499333943', '1', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of ewei_article
-- ----------------------------
INSERT INTO `ewei_article` VALUES ('15', '7', '12月16日 子！瞻！庭！引爆眉山餐饮……', '2017-12-14 九宴美食', '<p>啦啦啦啦啦</p>', '九宴美食', '1', '0', '/uploads/common/1515938333.jpg', null, '1', '1', '1', '2018-01-11 00:12:01', '2018-01-11 00:11:39', '');
INSERT INTO `ewei_article` VALUES ('9', '7', '揭露眉山市2018四名评选大赛内幕…', '眉山餐饮e+', '<div class=\"rich_media_inner\"><div class=\"rich_media_area_primary\"><div><div class=\"rich_media_content \"><p style=\"text-align: center;\"><span style=\"font-size: 18px;\"><span style=\"color: rgb(255, 41, 65);\"><strong>★</strong></span><span style=\"color: rgb(2, 30, 170);\"><strong>谁能抵挡美食诱惑？</strong></span></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 41, 65);\"><strong><span style=\"font-size: 20px;\">★</span></strong></span><span style=\"color: rgb(2, 30, 170);\"><strong><span style=\"color: rgb(2, 30, 170);font-size: 20px;\">谁是眉山厨</span></strong><strong><span style=\"color: rgb(2, 30, 170);font-size: 20px;\">坛翘楚？？</span></strong><br/></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 41, 65);\"><strong><span style=\"font-size: 24px;\">★</span></strong></span><span style=\"color: rgb(2, 30, 170);\"><strong><span style=\"color: rgb(2, 30, 170);font-size: 24px;\">谁在拨弄眉山餐饮风云？？？</span></strong></span></p><p style=\"text-align: center;\"><img class=\"\" src=\"https://mmbiz.qpic.cn/mmbiz_png/OvHMwiaeQFxdV9tcUEpxmQHyic9QCoAK4WDibVC1J4bAgqqr5b7AZ4GvlVXthNrGianfeV5gN52ffVYU4OYssddCeg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1\"/></p><p style=\"text-align: center;\"><span style=\"color: rgb(2, 30, 170);font-size: 20px;\"><span style=\"color: rgb(2, 30, 170);\">☞☞&nbsp;亲密舌尖上的美味，展示东坡美食的魅力……</span></span><span style=\"color: rgb(2, 30, 170);font-size: 20px;\">2017年12月由眉山市人民政府第三产业办公室、眉山市商务局、眉山市文化广电新闻出版局、眉山市旅游局指导，眉山电视台和眉山市餐饮行业协会主办的“川厨之乡，美丽眉山——眉山市“名菜、名店、名师、名小吃”评选大赛为您而来……</span></p><p style=\"text-align: center;\"><span style=\"color: rgb(2, 30, 170);font-size: 24px;\"><strong><span style=\"color: rgb(2, 30, 170);font-family: 宋体;\">时间:2018年1月18日～20日</span></strong></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(2, 30, 170);font-size: 24px;\"><strong><span style=\"color: rgb(2, 30, 170);font-family: 宋体;\">地点:圣丰国际农商中心外广场</span></strong></span></p><p style=\"text-align: center;\"><img class=\"\" src=\"https://mmbiz.qpic.cn/mmbiz_jpg/OvHMwiaeQFxfviaFqWlxibQHchkBOJWZFCaybqu2l8s1BOY96VPYmRDl8vTbpbyfMENuoliaoIejbz0nibdW14Md5KA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1\"/></p><p style=\"text-align: center;\"><span style=\"color: rgb(2, 30, 170);font-family: 宋体;font-size: 20px;\">☞☞千载诗书城，万重东坡味……2018.1.18眉山市餐饮行业近10年来最高大上的餐饮赛事在眉山圣丰国际农商中心外广场引爆……</span></p><p style=\"text-align: center;\"><span style=\"color: rgb(2, 30, 170);font-family: 宋体;font-size: 21px;\"><iframe frameborder=\"0\" width=\"670\" height=\"376.875\" src=\"https://v.qq.com/iframe/player.html?vid=k1331rp7uli&width=670&height=376.875&auto=0\"></iframe><br/></span><span style=\"color: rgb(255, 41, 65);\"><strong><span style=\"font-size: 18px;\">★</span></strong></span><strong><span style=\"font-size: 18px;color: rgb(2, 30, 170);\">50多家名流餐饮……</span></strong></p><p style=\"text-align: center;\"><span style=\"font-size: 20px;color: rgb(255, 41, 65);\"><strong><span style=\"font-size: 20px;\">★</span></strong></span><span style=\"font-size: 20px;\"><strong><span style=\"color: rgb(2, 30, 170);\">100多位顶尖大厨……</span></strong></span></p><p style=\"text-align: center;\"><span style=\"font-size: 24px;color: rgb(255, 41, 65);\"><strong><span style=\"font-size: 24px;\">★</span></strong></span><span style=\"font-size: 24px;\"><strong><span style=\"color: rgb(2, 30, 170);\">300多道特色美食……</span></strong></span></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 251, 0);background-color: rgb(255, 41, 65);\"><strong><span style=\"color: rgb(255, 251, 0);background-color: rgb(255, 41, 65);font-family: 宋体;font-size: 20px;\">特别提示：</span></strong></span><span style=\"font-family: 宋体;color: rgb(2, 30, 170);font-size: 20px;\">分享此链接到朋友圈，您就有机会成为本次烹饪美食大赛的大众评委……和眉山市餐饮大咖一起做在评委席上，品尝、点评参赛大厨们做的人间美味啦！</span></p><p><br/></p><p style=\"white-space: normal; text-align: center;\"><strong><span style=\"color: rgb(2, 30, 170);font-family: 宋体;font-size: 18px;\"></span></strong></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 41, 65);\"><strong><span style=\"font-size: 18px;\">★</span></strong></span><strong><span style=\"color: rgb(2, 30, 170);font-size: 18px;\">除了高大上的餐饮赛事……</span></strong></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 41, 65);\"><strong><span style=\"font-size: 20px;\">★</span></strong></span><strong><span style=\"color: rgb(2, 30, 170);font-size: 20px;\">还有农特产品+名车展示展销……</span></strong><span style=\"color: rgb(2, 30, 170);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-size: 24px;color: rgb(255, 41, 65);\"><strong><span style=\"font-size: 24px;\">★</span></strong></span><span style=\"font-size: 24px;\"><strong><span style=\"color: rgb(2, 30, 170);\">团圆饭、团年宴现场预定……</span></strong></span><br/></p><p style=\"text-align: center;\"><img class=\"\" src=\"https://mmbiz.qpic.cn/mmbiz_jpg/OvHMwiaeQFxfviaFqWlxibQHchkBOJWZFCa1mLOzxgAFMRg1uzAvZJdguYJMeOQTEOjDfsuL1fXOkoMPcBfE7EnUA/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1\"/></p><p><br/></p><p style=\"white-space: normal; text-align: center;\"><span style=\"font-size: 18px;\"><span style=\"color: rgb(255, 41, 65);\"><strong><span style=\"font-family: 宋体;\">★</span></strong></span><span style=\"color: rgb(2, 30, 170);\"><strong><span style=\"color: rgb(2, 30, 170);font-family: 宋体;\">2018年1月18日～20日（三天）</span></strong></span></span></p><p style=\"white-space: normal; text-align: center;\"><span style=\"font-size: 20px;\"><span style=\"color: rgb(255, 41, 65);\"><strong><span style=\"font-family: 宋体;\">★</span></strong></span><span style=\"color: rgb(2, 30, 170);\"><strong><span style=\"font-family: 宋体;\">眉山圣丰国际农商中心外广场</span></strong></span></span></p><p style=\"text-align: center;\"><span style=\"font-size: 24px;color: rgb(255, 41, 65);\">★</span><span style=\"font-size: 24px;color: rgb(2, 30, 170);\">到时候，我们再边吃边聊……</span></p></div><div></div><div class=\"ct_mpda_wrp\" style=\"display:none;\"></div><div class=\"reward_area tc\" style=\"display:none;\"><p class=\"tips_global reward_tips\" style=\"display:none;\"><br/></p><p style=\"text-align: center;\"><a class=\"reward_access\" href=\"##\"><span class=\"icon-reward\"></span>赞赏</a></p></div><div class=\"reward_qrcode_area reward_area tc\" style=\"display: none; text-align: center;\"><p class=\"tips_global\" style=\"text-align: center;\">长按二维码向我转账</p><p class=\"reward_tips\" style=\"display:none;\"><br/></p><span class=\"reward_qrcode_img_wrp\"><img class=\"reward_qrcode_img\" src=\"//res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/pic/appmsg/pic_reward_qrcode.2x3534dd.png\"/></span><p class=\"tips_global\">受苹果公司新规定影响，微信 iOS 版的赞赏功能被关闭，可通过二维码转账支持公众号。</p></div></div><div class=\"rich_media_tool\" style=\"text-align: center;\"><div class=\"media_tool_meta tips_global meta_primary\" style=\"display: none; text-align: center;\">阅读</div><span style=\"display:none;\" class=\"media_tool_meta meta_primary tips_global meta_praise\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em class=\"icon_praise_gray\"></em><span class=\"praise_num\"></span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span>&nbsp;&nbsp;</div></div></div>', '眉山餐饮e+', '1', '0', '/uploads/common/1515938072.jpg', null, '1', '1', '2', '2018-01-10 23:47:20', '2018-01-31 23:46:52', '');

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
-- Table structure for ewei_article_goods
-- ----------------------------
DROP TABLE IF EXISTS `ewei_article_goods`;
CREATE TABLE `ewei_article_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='优惠券使用商品表';

-- ----------------------------
-- Records of ewei_article_goods
-- ----------------------------
INSERT INTO `ewei_article_goods` VALUES ('19', '10', '33');
INSERT INTO `ewei_article_goods` VALUES ('20', '10', '37');
INSERT INTO `ewei_article_goods` VALUES ('21', '10', '36');
INSERT INTO `ewei_article_goods` VALUES ('22', '14', '33');
INSERT INTO `ewei_article_goods` VALUES ('23', '14', '37');
INSERT INTO `ewei_article_goods` VALUES ('24', '14', '36');
INSERT INTO `ewei_article_goods` VALUES ('25', '15', '33');
INSERT INTO `ewei_article_goods` VALUES ('26', '15', '37');
INSERT INTO `ewei_article_goods` VALUES ('27', '15', '36');
INSERT INTO `ewei_article_goods` VALUES ('28', '9', '33');
INSERT INTO `ewei_article_goods` VALUES ('29', '9', '37');
INSERT INTO `ewei_article_goods` VALUES ('30', '9', '36');
INSERT INTO `ewei_article_goods` VALUES ('31', '9', '0');
INSERT INTO `ewei_article_goods` VALUES ('32', '16', '33');
INSERT INTO `ewei_article_goods` VALUES ('33', '16', '37');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of ewei_auth_group
-- ----------------------------
INSERT INTO `ewei_auth_group` VALUES ('1', '超级管理组', '1', '1,2,3,73,74,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,83,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,54,55,58,59,60,61,62,56,63,64,65,66,67,57,68,69,70,71,72,81,84,80,85,86,87,88,89,90,91,92,97,98');
INSERT INTO `ewei_auth_group` VALUES ('2', '编辑', '1', '14,13,20,21,22,23,24,15,25,26,27,28,29,30');
INSERT INTO `ewei_auth_group` VALUES ('4', '商家', '1', '14,15,25,26,27,28,29,30,83,81,84,85,86,88,89,90,91,92,103');
INSERT INTO `ewei_auth_group` VALUES ('5', '推广员', '1', '');

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
INSERT INTO `ewei_auth_group_access` VALUES ('23', '4');

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
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='规则表';

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
INSERT INTO `ewei_auth_rule` VALUES ('97', 'admin/shop/default', '商家管理', '1', '1', '0', 'fa fa-male', '94', '');
INSERT INTO `ewei_auth_rule` VALUES ('98', 'admin/shop/index', '商家列表', '1', '1', '97', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('103', 'admin/shopInfo/index', '商铺配置', '1', '1', '0', 'fa fa-gears', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('104', 'admin/Keyword/index', '关键词管理', '1', '1', '84', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('105', 'admin/Keyword/add', '关键词编辑', '1', '0', '84', '', '0', '');
INSERT INTO `ewei_auth_rule` VALUES ('106', 'admin/Keyword/edit', '关键词编辑', '1', '0', '84', '', '0', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

-- ----------------------------
-- Records of ewei_banner
-- ----------------------------
INSERT INTO `ewei_banner` VALUES ('1', 'top 首页轮播图', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

-- ----------------------------
-- Records of ewei_banner_item
-- ----------------------------
INSERT INTO `ewei_banner_item` VALUES ('1', '1', 'uyiku', '优衣库广告', 'http://www.uniqlo.cn/', '_self', '', '1', '0', '1', null, '0', '/uploads/common/1516629219.png');
INSERT INTO `ewei_banner_item` VALUES ('2', '1', '活动', '奥术大师', '', '_self', '', '1', '0', '1', null, '0', '/uploads/common/1516629228.png');

-- ----------------------------
-- Table structure for ewei_cart
-- ----------------------------
DROP TABLE IF EXISTS `ewei_cart`;
CREATE TABLE `ewei_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '买家id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品的skuid',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品的sku名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `num` smallint(5) NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `goods_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `bl_id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '组合套装ID',
  `checked` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否选中',
  PRIMARY KEY (`id`),
  KEY `member_id` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='购物车表';

-- ----------------------------
-- Records of ewei_cart
-- ----------------------------
INSERT INTO `ewei_cart` VALUES ('15', '7', '1', '自选平台', '38', '性感露胸包臀', '0', '', '900.32', '6', 'http://admin.ewei.com/uploads/goods_brand/1515581629.jpg', '0', '1');
INSERT INTO `ewei_cart` VALUES ('16', '7', '1', '自选平台', '33', '无肩带隐形文胸', '0', '', '123.23', '5', 'http://admin.ewei.com/uploads/goods_brand/1515575596.jpg', '0', '1');

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
  `create_time` int(11) DEFAULT NULL,
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

-- ----------------------------
-- Records of ewei_category
-- ----------------------------
INSERT INTO `ewei_category` VALUES ('5', '热菜食材', '好吃的热菜食材', null, '/uploads/goods_group/1515935716.png', null, null, null, '1', '0', '0', '0,', null, null, null, null, null);
INSERT INTO `ewei_category` VALUES ('6', '凉菜食材', null, null, '/uploads/goods_group/1515935735.png', null, null, null, '1', '1', '0', '0,', null, null, null, null, null);
INSERT INTO `ewei_category` VALUES ('9', '鲜活食材', null, null, '/uploads/goods_group/1515936008.png', null, null, null, '1', '5', '0', '0,', null, null, null, null, null);
INSERT INTO `ewei_category` VALUES ('10', '大通产品', null, null, '/uploads/goods_group/1515936073.png', null, null, null, '1', '6', '0', '0,', null, null, null, null, null);
INSERT INTO `ewei_category` VALUES ('13', '酒水饮料', null, null, '/uploads/goods_group/1515938728.png', null, null, null, '1', '2', '0', '0,', null, null, null, null, null);
INSERT INTO `ewei_category` VALUES ('14', '熟食', '全食熟食店', null, '/uploads/goods_group/1516030872.jpg', null, null, null, '1', '0', '5', '0,5,', '2018', null, null, null, null);
INSERT INTO `ewei_category` VALUES ('15', '香肠', '哈尔滨红肠', null, '/uploads/goods_group/1516030887.jpg', null, null, null, '1', '1', '5', '0,5,', '2018', null, null, null, null);
INSERT INTO `ewei_category` VALUES ('16', '熟食', '全食熟食店', null, '/uploads/goods_group/1516030872.jpg', null, null, null, '1', '0', '6', '0,6,', '2018', null, null, null, null);
INSERT INTO `ewei_category` VALUES ('17', '香肠', '哈尔滨红肠', null, '/uploads/goods_group/1516030887.jpg', null, null, null, '1', '1', '6', '0,6,', '2018', null, null, null, null);
INSERT INTO `ewei_category` VALUES ('18', '熟食', '全食熟食店', null, '/uploads/goods_group/1516030872.jpg', null, null, null, '1', '0', '6', '0,6,', '2018', null, null, null, null);
INSERT INTO `ewei_category` VALUES ('19', '香肠', '哈尔滨红肠', null, '/uploads/goods_group/1516030887.jpg', null, null, null, '1', '1', '6', '0,6,', '2018', null, null, null, null);
INSERT INTO `ewei_category` VALUES ('20', '熟食', '全食熟食店', null, '/uploads/goods_group/1516030872.jpg', null, null, null, '1', '0', '6', '0,6,', '2018', null, null, null, null);
INSERT INTO `ewei_category` VALUES ('21', '香肠', '哈尔滨红肠', null, '/uploads/goods_group/1516030887.jpg', null, null, null, '1', '1', '6', '0,6,', '2018', null, null, null, null);
INSERT INTO `ewei_category` VALUES ('22', '熟食', '全食熟食店', null, '/uploads/goods_group/1516030872.jpg', null, null, null, '1', '0', '6', '0,6,', '2018', null, null, null, null);
INSERT INTO `ewei_category` VALUES ('23', '香肠', '哈尔滨红肠', null, '/uploads/goods_group/1516030887.jpg', null, null, null, '1', '1', '6', '0,6,', '2018', null, null, null, null);

-- ----------------------------
-- Table structure for ewei_city
-- ----------------------------
DROP TABLE IF EXISTS `ewei_city`;
CREATE TABLE `ewei_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_name` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(6) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`),
  KEY `IDX_g_city_CityName` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=135 COMMENT='城市表';

-- ----------------------------
-- Records of ewei_city
-- ----------------------------
INSERT INTO `ewei_city` VALUES ('1', '1', '北京市', '100000', '1');
INSERT INTO `ewei_city` VALUES ('2', '2', '天津市', '100000', '0');
INSERT INTO `ewei_city` VALUES ('3', '3', '石家庄市', '050000', '0');
INSERT INTO `ewei_city` VALUES ('4', '3', '唐山市', '063000', '0');
INSERT INTO `ewei_city` VALUES ('5', '3', '秦皇岛市', '066000', '0');
INSERT INTO `ewei_city` VALUES ('6', '3', '邯郸市', '056000', '0');
INSERT INTO `ewei_city` VALUES ('7', '3', '邢台市', '054000', '0');
INSERT INTO `ewei_city` VALUES ('8', '3', '保定市', '071000', '0');
INSERT INTO `ewei_city` VALUES ('9', '3', '张家口市', '075000', '0');
INSERT INTO `ewei_city` VALUES ('10', '3', '承德市', '067000', '0');
INSERT INTO `ewei_city` VALUES ('11', '3', '沧州市', '061000', '0');
INSERT INTO `ewei_city` VALUES ('12', '3', '廊坊市', '065000', '0');
INSERT INTO `ewei_city` VALUES ('13', '3', '衡水市', '053000', '0');
INSERT INTO `ewei_city` VALUES ('14', '4', '太原市', '030000', '0');
INSERT INTO `ewei_city` VALUES ('15', '4', '大同市', '037000', '0');
INSERT INTO `ewei_city` VALUES ('16', '4', '阳泉市', '045000', '0');
INSERT INTO `ewei_city` VALUES ('17', '4', '长治市', '046000', '0');
INSERT INTO `ewei_city` VALUES ('18', '4', '晋城市', '048000', '0');
INSERT INTO `ewei_city` VALUES ('19', '4', '朔州市', '036000', '0');
INSERT INTO `ewei_city` VALUES ('20', '4', '晋中市', '030600', '0');
INSERT INTO `ewei_city` VALUES ('21', '4', '运城市', '044000', '0');
INSERT INTO `ewei_city` VALUES ('22', '4', '忻州市', '034000', '0');
INSERT INTO `ewei_city` VALUES ('23', '4', '临汾市', '041000', '0');
INSERT INTO `ewei_city` VALUES ('24', '4', '吕梁市', '030500', '0');
INSERT INTO `ewei_city` VALUES ('25', '5', '呼和浩特市', '010000', '0');
INSERT INTO `ewei_city` VALUES ('26', '5', '包头市', '014000', '0');
INSERT INTO `ewei_city` VALUES ('27', '5', '乌海市', '016000', '0');
INSERT INTO `ewei_city` VALUES ('28', '5', '赤峰市', '024000', '0');
INSERT INTO `ewei_city` VALUES ('29', '5', '通辽市', '028000', '0');
INSERT INTO `ewei_city` VALUES ('30', '5', '鄂尔多斯市', '010300', '0');
INSERT INTO `ewei_city` VALUES ('31', '5', '呼伦贝尔市', '021000', '0');
INSERT INTO `ewei_city` VALUES ('32', '5', '巴彦淖尔市', '014400', '0');
INSERT INTO `ewei_city` VALUES ('33', '5', '乌兰察布市', '011800', '0');
INSERT INTO `ewei_city` VALUES ('34', '5', '兴安盟', '137500', '0');
INSERT INTO `ewei_city` VALUES ('35', '5', '锡林郭勒盟', '011100', '0');
INSERT INTO `ewei_city` VALUES ('36', '5', '阿拉善盟', '016000', '0');
INSERT INTO `ewei_city` VALUES ('37', '6', '沈阳市', '110000', '0');
INSERT INTO `ewei_city` VALUES ('38', '6', '大连市', '116000', '0');
INSERT INTO `ewei_city` VALUES ('39', '6', '鞍山市', '114000', '0');
INSERT INTO `ewei_city` VALUES ('40', '6', '抚顺市', '113000', '0');
INSERT INTO `ewei_city` VALUES ('41', '6', '本溪市', '117000', '0');
INSERT INTO `ewei_city` VALUES ('42', '6', '丹东市', '118000', '0');
INSERT INTO `ewei_city` VALUES ('43', '6', '锦州市', '121000', '0');
INSERT INTO `ewei_city` VALUES ('44', '6', '营口市', '115000', '0');
INSERT INTO `ewei_city` VALUES ('45', '6', '阜新市', '123000', '0');
INSERT INTO `ewei_city` VALUES ('46', '6', '辽阳市', '111000', '0');
INSERT INTO `ewei_city` VALUES ('47', '6', '盘锦市', '124000', '0');
INSERT INTO `ewei_city` VALUES ('48', '6', '铁岭市', '112000', '0');
INSERT INTO `ewei_city` VALUES ('49', '6', '朝阳市', '122000', '0');
INSERT INTO `ewei_city` VALUES ('50', '6', '葫芦岛市', '125000', '0');
INSERT INTO `ewei_city` VALUES ('51', '7', '长春市', '130000', '0');
INSERT INTO `ewei_city` VALUES ('52', '7', '吉林市', '132000', '0');
INSERT INTO `ewei_city` VALUES ('53', '7', '四平市', '136000', '0');
INSERT INTO `ewei_city` VALUES ('54', '7', '辽源市', '136200', '0');
INSERT INTO `ewei_city` VALUES ('55', '7', '通化市', '134000', '0');
INSERT INTO `ewei_city` VALUES ('56', '7', '白山市', '134300', '0');
INSERT INTO `ewei_city` VALUES ('57', '7', '松原市', '131100', '0');
INSERT INTO `ewei_city` VALUES ('58', '7', '白城市', '137000', '0');
INSERT INTO `ewei_city` VALUES ('59', '7', '延边朝鲜族自治州', '133000', '0');
INSERT INTO `ewei_city` VALUES ('60', '8', '哈尔滨市', '150000', '0');
INSERT INTO `ewei_city` VALUES ('61', '8', '齐齐哈尔市', '161000', '0');
INSERT INTO `ewei_city` VALUES ('62', '8', '鸡西市', '158100', '0');
INSERT INTO `ewei_city` VALUES ('63', '8', '鹤岗市', '154100', '0');
INSERT INTO `ewei_city` VALUES ('64', '8', '双鸭山市', '155100', '0');
INSERT INTO `ewei_city` VALUES ('65', '8', '大庆市', '163000', '0');
INSERT INTO `ewei_city` VALUES ('66', '8', '伊春市', '152300', '0');
INSERT INTO `ewei_city` VALUES ('67', '8', '佳木斯市', '154000', '0');
INSERT INTO `ewei_city` VALUES ('68', '8', '七台河市', '154600', '0');
INSERT INTO `ewei_city` VALUES ('69', '8', '牡丹江市', '157000', '0');
INSERT INTO `ewei_city` VALUES ('70', '8', '黑河市', '164300', '0');
INSERT INTO `ewei_city` VALUES ('71', '8', '绥化市', '152000', '0');
INSERT INTO `ewei_city` VALUES ('72', '8', '大兴安岭地区', '165000', '0');
INSERT INTO `ewei_city` VALUES ('73', '9', '上海市', '200000', '0');
INSERT INTO `ewei_city` VALUES ('74', '10', '南京市', '210000', '0');
INSERT INTO `ewei_city` VALUES ('75', '10', '无锡市', '214000', '0');
INSERT INTO `ewei_city` VALUES ('76', '10', '徐州市', '221000', '0');
INSERT INTO `ewei_city` VALUES ('77', '10', '常州市', '213000', '0');
INSERT INTO `ewei_city` VALUES ('78', '10', '苏州市', '215000', '0');
INSERT INTO `ewei_city` VALUES ('79', '10', '南通市', '226000', '0');
INSERT INTO `ewei_city` VALUES ('80', '10', '连云港市', '222000', '0');
INSERT INTO `ewei_city` VALUES ('81', '10', '淮安市', '223200', '0');
INSERT INTO `ewei_city` VALUES ('82', '10', '盐城市', '224000', '0');
INSERT INTO `ewei_city` VALUES ('83', '10', '扬州市', '225000', '0');
INSERT INTO `ewei_city` VALUES ('84', '10', '镇江市', '212000', '0');
INSERT INTO `ewei_city` VALUES ('85', '10', '泰州市', '225300', '0');
INSERT INTO `ewei_city` VALUES ('86', '10', '宿迁市', '223800', '0');
INSERT INTO `ewei_city` VALUES ('87', '11', '杭州市', '310000', '0');
INSERT INTO `ewei_city` VALUES ('88', '11', '宁波市', '315000', '0');
INSERT INTO `ewei_city` VALUES ('89', '11', '温州市', '325000', '0');
INSERT INTO `ewei_city` VALUES ('90', '11', '嘉兴市', '314000', '0');
INSERT INTO `ewei_city` VALUES ('91', '11', '湖州市', '313000', '0');
INSERT INTO `ewei_city` VALUES ('92', '11', '绍兴市', '312000', '0');
INSERT INTO `ewei_city` VALUES ('93', '11', '金华市', '321000', '0');
INSERT INTO `ewei_city` VALUES ('94', '11', '衢州市', '324000', '0');
INSERT INTO `ewei_city` VALUES ('95', '11', '舟山市', '316000', '0');
INSERT INTO `ewei_city` VALUES ('96', '11', '台州市', '318000', '0');
INSERT INTO `ewei_city` VALUES ('97', '11', '丽水市', '323000', '0');
INSERT INTO `ewei_city` VALUES ('98', '12', '合肥市', '230000', '0');
INSERT INTO `ewei_city` VALUES ('99', '12', '芜湖市', '241000', '0');
INSERT INTO `ewei_city` VALUES ('100', '12', '蚌埠市', '233000', '0');
INSERT INTO `ewei_city` VALUES ('101', '12', '淮南市', '232000', '0');
INSERT INTO `ewei_city` VALUES ('102', '12', '马鞍山市', '243000', '0');
INSERT INTO `ewei_city` VALUES ('103', '12', '淮北市', '235000', '0');
INSERT INTO `ewei_city` VALUES ('104', '12', '铜陵市', '244000', '0');
INSERT INTO `ewei_city` VALUES ('105', '12', '安庆市', '246000', '0');
INSERT INTO `ewei_city` VALUES ('106', '12', '黄山市', '242700', '0');
INSERT INTO `ewei_city` VALUES ('107', '12', '滁州市', '239000', '0');
INSERT INTO `ewei_city` VALUES ('108', '12', '阜阳市', '236100', '0');
INSERT INTO `ewei_city` VALUES ('109', '12', '宿州市', '234100', '0');
INSERT INTO `ewei_city` VALUES ('110', '12', '巢湖市', '238000', '0');
INSERT INTO `ewei_city` VALUES ('111', '12', '六安市', '237000', '0');
INSERT INTO `ewei_city` VALUES ('112', '12', '亳州市', '236800', '0');
INSERT INTO `ewei_city` VALUES ('113', '12', '池州市', '247100', '0');
INSERT INTO `ewei_city` VALUES ('114', '12', '宣城市', '366000', '0');
INSERT INTO `ewei_city` VALUES ('115', '13', '福州市', '350000', '0');
INSERT INTO `ewei_city` VALUES ('116', '13', '厦门市', '361000', '0');
INSERT INTO `ewei_city` VALUES ('117', '13', '莆田市', '351100', '0');
INSERT INTO `ewei_city` VALUES ('118', '13', '三明市', '365000', '0');
INSERT INTO `ewei_city` VALUES ('119', '13', '泉州市', '362000', '0');
INSERT INTO `ewei_city` VALUES ('120', '13', '漳州市', '363000', '0');
INSERT INTO `ewei_city` VALUES ('121', '13', '南平市', '353000', '0');
INSERT INTO `ewei_city` VALUES ('122', '13', '龙岩市', '364000', '0');
INSERT INTO `ewei_city` VALUES ('123', '13', '宁德市', '352100', '0');
INSERT INTO `ewei_city` VALUES ('124', '14', '南昌市', '330000', '0');
INSERT INTO `ewei_city` VALUES ('125', '14', '景德镇市', '333000', '0');
INSERT INTO `ewei_city` VALUES ('126', '14', '萍乡市', '337000', '0');
INSERT INTO `ewei_city` VALUES ('127', '14', '九江市', '332000', '0');
INSERT INTO `ewei_city` VALUES ('128', '14', '新余市', '338000', '0');
INSERT INTO `ewei_city` VALUES ('129', '14', '鹰潭市', '335000', '0');
INSERT INTO `ewei_city` VALUES ('130', '14', '赣州市', '341000', '0');
INSERT INTO `ewei_city` VALUES ('131', '14', '吉安市', '343000', '0');
INSERT INTO `ewei_city` VALUES ('132', '14', '宜春市', '336000', '0');
INSERT INTO `ewei_city` VALUES ('133', '14', '抚州市', '332900', '0');
INSERT INTO `ewei_city` VALUES ('134', '14', '上饶市', '334000', '0');
INSERT INTO `ewei_city` VALUES ('135', '15', '济南市', '250000', '0');
INSERT INTO `ewei_city` VALUES ('136', '15', '青岛市', '266000', '0');
INSERT INTO `ewei_city` VALUES ('137', '15', '淄博市', '255000', '0');
INSERT INTO `ewei_city` VALUES ('138', '15', '枣庄市', '277100', '0');
INSERT INTO `ewei_city` VALUES ('139', '15', '东营市', '257000', '0');
INSERT INTO `ewei_city` VALUES ('140', '15', '烟台市', '264000', '0');
INSERT INTO `ewei_city` VALUES ('141', '15', '潍坊市', '261000', '0');
INSERT INTO `ewei_city` VALUES ('142', '15', '济宁市', '272100', '0');
INSERT INTO `ewei_city` VALUES ('143', '15', '泰安市', '271000', '0');
INSERT INTO `ewei_city` VALUES ('144', '15', '威海市', '265700', '0');
INSERT INTO `ewei_city` VALUES ('145', '15', '日照市', '276800', '0');
INSERT INTO `ewei_city` VALUES ('146', '15', '莱芜市', '271100', '0');
INSERT INTO `ewei_city` VALUES ('147', '15', '临沂市', '276000', '0');
INSERT INTO `ewei_city` VALUES ('148', '15', '德州市', '253000', '0');
INSERT INTO `ewei_city` VALUES ('149', '15', '聊城市', '252000', '0');
INSERT INTO `ewei_city` VALUES ('150', '15', '滨州市', '256600', '0');
INSERT INTO `ewei_city` VALUES ('151', '15', '荷泽市', '255000', '0');
INSERT INTO `ewei_city` VALUES ('152', '16', '郑州市', '450000', '0');
INSERT INTO `ewei_city` VALUES ('153', '16', '开封市', '475000', '0');
INSERT INTO `ewei_city` VALUES ('154', '16', '洛阳市', '471000', '0');
INSERT INTO `ewei_city` VALUES ('155', '16', '平顶山市', '467000', '0');
INSERT INTO `ewei_city` VALUES ('156', '16', '安阳市', '454900', '0');
INSERT INTO `ewei_city` VALUES ('157', '16', '鹤壁市', '456600', '0');
INSERT INTO `ewei_city` VALUES ('158', '16', '新乡市', '453000', '0');
INSERT INTO `ewei_city` VALUES ('159', '16', '焦作市', '454100', '0');
INSERT INTO `ewei_city` VALUES ('160', '16', '濮阳市', '457000', '0');
INSERT INTO `ewei_city` VALUES ('161', '16', '许昌市', '461000', '0');
INSERT INTO `ewei_city` VALUES ('162', '16', '漯河市', '462000', '0');
INSERT INTO `ewei_city` VALUES ('163', '16', '三门峡市', '472000', '0');
INSERT INTO `ewei_city` VALUES ('164', '16', '南阳市', '473000', '0');
INSERT INTO `ewei_city` VALUES ('165', '16', '商丘市', '476000', '0');
INSERT INTO `ewei_city` VALUES ('166', '16', '信阳市', '464000', '0');
INSERT INTO `ewei_city` VALUES ('167', '16', '周口市', '466000', '0');
INSERT INTO `ewei_city` VALUES ('168', '16', '驻马店市', '463000', '0');
INSERT INTO `ewei_city` VALUES ('169', '17', '武汉市', '430000', '0');
INSERT INTO `ewei_city` VALUES ('170', '17', '黄石市', '435000', '0');
INSERT INTO `ewei_city` VALUES ('171', '17', '十堰市', '442000', '0');
INSERT INTO `ewei_city` VALUES ('172', '17', '宜昌市', '443000', '0');
INSERT INTO `ewei_city` VALUES ('173', '17', '襄樊市', '441000', '0');
INSERT INTO `ewei_city` VALUES ('174', '17', '鄂州市', '436000', '0');
INSERT INTO `ewei_city` VALUES ('175', '17', '荆门市', '448000', '0');
INSERT INTO `ewei_city` VALUES ('176', '17', '孝感市', '432100', '0');
INSERT INTO `ewei_city` VALUES ('177', '17', '荆州市', '434000', '0');
INSERT INTO `ewei_city` VALUES ('178', '17', '黄冈市', '438000', '0');
INSERT INTO `ewei_city` VALUES ('179', '17', '咸宁市', '437000', '0');
INSERT INTO `ewei_city` VALUES ('180', '17', '随州市', '441300', '0');
INSERT INTO `ewei_city` VALUES ('181', '17', '恩施土家族苗族自治州', '445000', '0');
INSERT INTO `ewei_city` VALUES ('182', '17', '神农架', '442400', '0');
INSERT INTO `ewei_city` VALUES ('183', '18', '长沙市', '410000', '0');
INSERT INTO `ewei_city` VALUES ('184', '18', '株洲市', '412000', '0');
INSERT INTO `ewei_city` VALUES ('185', '18', '湘潭市', '411100', '0');
INSERT INTO `ewei_city` VALUES ('186', '18', '衡阳市', '421000', '0');
INSERT INTO `ewei_city` VALUES ('187', '18', '邵阳市', '422000', '0');
INSERT INTO `ewei_city` VALUES ('188', '18', '岳阳市', '414000', '0');
INSERT INTO `ewei_city` VALUES ('189', '18', '常德市', '415000', '0');
INSERT INTO `ewei_city` VALUES ('190', '18', '张家界市', '427000', '0');
INSERT INTO `ewei_city` VALUES ('191', '18', '益阳市', '413000', '0');
INSERT INTO `ewei_city` VALUES ('192', '18', '郴州市', '423000', '0');
INSERT INTO `ewei_city` VALUES ('193', '18', '永州市', '425000', '0');
INSERT INTO `ewei_city` VALUES ('194', '18', '怀化市', '418000', '0');
INSERT INTO `ewei_city` VALUES ('195', '18', '娄底市', '417000', '0');
INSERT INTO `ewei_city` VALUES ('196', '18', '湘西土家族苗族自治州', '416000', '0');
INSERT INTO `ewei_city` VALUES ('197', '19', '广州市', '510000', '0');
INSERT INTO `ewei_city` VALUES ('198', '19', '韶关市', '521000', '0');
INSERT INTO `ewei_city` VALUES ('199', '19', '深圳市', '518000', '0');
INSERT INTO `ewei_city` VALUES ('200', '19', '珠海市', '519000', '0');
INSERT INTO `ewei_city` VALUES ('201', '19', '汕头市', '515000', '0');
INSERT INTO `ewei_city` VALUES ('202', '19', '佛山市', '528000', '0');
INSERT INTO `ewei_city` VALUES ('203', '19', '江门市', '529000', '0');
INSERT INTO `ewei_city` VALUES ('204', '19', '湛江市', '524000', '0');
INSERT INTO `ewei_city` VALUES ('205', '19', '茂名市', '525000', '0');
INSERT INTO `ewei_city` VALUES ('206', '19', '肇庆市', '526000', '0');
INSERT INTO `ewei_city` VALUES ('207', '19', '惠州市', '516000', '0');
INSERT INTO `ewei_city` VALUES ('208', '19', '梅州市', '514000', '0');
INSERT INTO `ewei_city` VALUES ('209', '19', '汕尾市', '516600', '1');
INSERT INTO `ewei_city` VALUES ('210', '19', '河源市', '517000', '0');
INSERT INTO `ewei_city` VALUES ('211', '19', '阳江市', '529500', '0');
INSERT INTO `ewei_city` VALUES ('212', '19', '清远市', '511500', '0');
INSERT INTO `ewei_city` VALUES ('213', '19', '东莞市', '511700', '0');
INSERT INTO `ewei_city` VALUES ('214', '19', '中山市', '528400', '0');
INSERT INTO `ewei_city` VALUES ('215', '19', '潮州市', '515600', '0');
INSERT INTO `ewei_city` VALUES ('216', '19', '揭阳市', '522000', '0');
INSERT INTO `ewei_city` VALUES ('217', '19', '云浮市', '527300', '0');
INSERT INTO `ewei_city` VALUES ('218', '20', '南宁市', '530000', '0');
INSERT INTO `ewei_city` VALUES ('219', '20', '柳州市', '545000', '0');
INSERT INTO `ewei_city` VALUES ('220', '20', '桂林市', '541000', '0');
INSERT INTO `ewei_city` VALUES ('221', '20', '梧州市', '543000', '0');
INSERT INTO `ewei_city` VALUES ('222', '20', '北海市', '536000', '0');
INSERT INTO `ewei_city` VALUES ('223', '20', '防城港市', '538000', '0');
INSERT INTO `ewei_city` VALUES ('224', '20', '钦州市', '535000', '0');
INSERT INTO `ewei_city` VALUES ('225', '20', '贵港市', '537100', '0');
INSERT INTO `ewei_city` VALUES ('226', '20', '玉林市', '537000', '0');
INSERT INTO `ewei_city` VALUES ('227', '20', '百色市', '533000', '0');
INSERT INTO `ewei_city` VALUES ('228', '20', '贺州市', '542800', '0');
INSERT INTO `ewei_city` VALUES ('229', '20', '河池市', '547000', '0');
INSERT INTO `ewei_city` VALUES ('230', '20', '来宾市', '546100', '0');
INSERT INTO `ewei_city` VALUES ('231', '20', '崇左市', '532200', '0');
INSERT INTO `ewei_city` VALUES ('232', '21', '海口市', '570000', '0');
INSERT INTO `ewei_city` VALUES ('233', '21', '三亚市', '572000', '0');
INSERT INTO `ewei_city` VALUES ('234', '22', '重庆市', '400000', '0');
INSERT INTO `ewei_city` VALUES ('235', '23', '成都市', '610000', '0');
INSERT INTO `ewei_city` VALUES ('236', '23', '自贡市', '643000', '0');
INSERT INTO `ewei_city` VALUES ('237', '23', '攀枝花市', '617000', '0');
INSERT INTO `ewei_city` VALUES ('238', '23', '泸州市', '646100', '0');
INSERT INTO `ewei_city` VALUES ('239', '23', '德阳市', '618000', '0');
INSERT INTO `ewei_city` VALUES ('240', '23', '绵阳市', '621000', '0');
INSERT INTO `ewei_city` VALUES ('241', '23', '广元市', '628000', '0');
INSERT INTO `ewei_city` VALUES ('242', '23', '遂宁市', '629000', '0');
INSERT INTO `ewei_city` VALUES ('243', '23', '内江市', '641000', '0');
INSERT INTO `ewei_city` VALUES ('244', '23', '乐山市', '614000', '0');
INSERT INTO `ewei_city` VALUES ('245', '23', '南充市', '637000', '0');
INSERT INTO `ewei_city` VALUES ('246', '23', '眉山市', '612100', '0');
INSERT INTO `ewei_city` VALUES ('247', '23', '宜宾市', '644000', '0');
INSERT INTO `ewei_city` VALUES ('248', '23', '广安市', '638000', '0');
INSERT INTO `ewei_city` VALUES ('249', '23', '达州市', '635000', '0');
INSERT INTO `ewei_city` VALUES ('250', '23', '雅安市', '625000', '0');
INSERT INTO `ewei_city` VALUES ('251', '23', '巴中市', '635500', '0');
INSERT INTO `ewei_city` VALUES ('252', '23', '资阳市', '641300', '0');
INSERT INTO `ewei_city` VALUES ('253', '23', '阿坝藏族羌族自治州', '624600', '0');
INSERT INTO `ewei_city` VALUES ('254', '23', '甘孜藏族自治州', '626000', '0');
INSERT INTO `ewei_city` VALUES ('255', '23', '凉山彝族自治州', '615000', '0');
INSERT INTO `ewei_city` VALUES ('256', '24', '贵阳市', '55000', '0');
INSERT INTO `ewei_city` VALUES ('257', '24', '六盘水市', '553000', '0');
INSERT INTO `ewei_city` VALUES ('258', '24', '遵义市', '563000', '0');
INSERT INTO `ewei_city` VALUES ('259', '24', '安顺市', '561000', '0');
INSERT INTO `ewei_city` VALUES ('260', '24', '铜仁地区', '554300', '0');
INSERT INTO `ewei_city` VALUES ('261', '24', '黔西南布依族苗族自治州', '551500', '0');
INSERT INTO `ewei_city` VALUES ('262', '24', '毕节地区', '551700', '0');
INSERT INTO `ewei_city` VALUES ('263', '24', '黔东南苗族侗族自治州', '551500', '0');
INSERT INTO `ewei_city` VALUES ('264', '24', '黔南布依族苗族自治州', '550100', '0');
INSERT INTO `ewei_city` VALUES ('265', '25', '昆明市', '650000', '0');
INSERT INTO `ewei_city` VALUES ('266', '25', '曲靖市', '655000', '0');
INSERT INTO `ewei_city` VALUES ('267', '25', '玉溪市', '653100', '0');
INSERT INTO `ewei_city` VALUES ('268', '25', '保山市', '678000', '0');
INSERT INTO `ewei_city` VALUES ('269', '25', '昭通市', '657000', '0');
INSERT INTO `ewei_city` VALUES ('270', '25', '丽江市', '674100', '0');
INSERT INTO `ewei_city` VALUES ('271', '25', '思茅市', '665000', '0');
INSERT INTO `ewei_city` VALUES ('272', '25', '临沧市', '677000', '0');
INSERT INTO `ewei_city` VALUES ('273', '25', '楚雄彝族自治州', '675000', '0');
INSERT INTO `ewei_city` VALUES ('274', '25', '红河哈尼族彝族自治州', '654400', '0');
INSERT INTO `ewei_city` VALUES ('275', '25', '文山壮族苗族自治州', '663000', '0');
INSERT INTO `ewei_city` VALUES ('276', '25', '西双版纳傣族自治州', '666200', '0');
INSERT INTO `ewei_city` VALUES ('277', '25', '大理白族自治州', '671000', '0');
INSERT INTO `ewei_city` VALUES ('278', '25', '德宏傣族景颇族自治州', '678400', '0');
INSERT INTO `ewei_city` VALUES ('279', '25', '怒江傈僳族自治州', '671400', '0');
INSERT INTO `ewei_city` VALUES ('280', '25', '迪庆藏族自治州', '674400', '0');
INSERT INTO `ewei_city` VALUES ('281', '26', '拉萨市', '850000', '0');
INSERT INTO `ewei_city` VALUES ('282', '26', '昌都地区', '854000', '0');
INSERT INTO `ewei_city` VALUES ('283', '26', '山南地区', '856000', '0');
INSERT INTO `ewei_city` VALUES ('284', '26', '日喀则地区', '857000', '0');
INSERT INTO `ewei_city` VALUES ('285', '26', '那曲地区', '852000', '0');
INSERT INTO `ewei_city` VALUES ('286', '26', '阿里地区', '859100', '0');
INSERT INTO `ewei_city` VALUES ('287', '26', '林芝地区', '860100', '0');
INSERT INTO `ewei_city` VALUES ('288', '27', '西安市', '710000', '0');
INSERT INTO `ewei_city` VALUES ('289', '27', '铜川市', '727000', '0');
INSERT INTO `ewei_city` VALUES ('290', '27', '宝鸡市', '721000', '0');
INSERT INTO `ewei_city` VALUES ('291', '27', '咸阳市', '712000', '0');
INSERT INTO `ewei_city` VALUES ('292', '27', '渭南市', '714000', '0');
INSERT INTO `ewei_city` VALUES ('293', '27', '延安市', '716000', '0');
INSERT INTO `ewei_city` VALUES ('294', '27', '汉中市', '723000', '0');
INSERT INTO `ewei_city` VALUES ('295', '27', '榆林市', '719000', '0');
INSERT INTO `ewei_city` VALUES ('296', '27', '安康市', '725000', '0');
INSERT INTO `ewei_city` VALUES ('297', '27', '商洛市', '711500', '0');
INSERT INTO `ewei_city` VALUES ('298', '28', '兰州市', '730000', '0');
INSERT INTO `ewei_city` VALUES ('299', '28', '嘉峪关市', '735100', '0');
INSERT INTO `ewei_city` VALUES ('300', '28', '金昌市', '737100', '0');
INSERT INTO `ewei_city` VALUES ('301', '28', '白银市', '730900', '0');
INSERT INTO `ewei_city` VALUES ('302', '28', '天水市', '741000', '0');
INSERT INTO `ewei_city` VALUES ('303', '28', '武威市', '733000', '0');
INSERT INTO `ewei_city` VALUES ('304', '28', '张掖市', '734000', '0');
INSERT INTO `ewei_city` VALUES ('305', '28', '平凉市', '744000', '0');
INSERT INTO `ewei_city` VALUES ('306', '28', '酒泉市', '735000', '0');
INSERT INTO `ewei_city` VALUES ('307', '28', '庆阳市', '744500', '0');
INSERT INTO `ewei_city` VALUES ('308', '28', '定西市', '743000', '0');
INSERT INTO `ewei_city` VALUES ('309', '28', '陇南市', '742100', '0');
INSERT INTO `ewei_city` VALUES ('310', '28', '临夏回族自治州', '731100', '0');
INSERT INTO `ewei_city` VALUES ('311', '28', '甘南藏族自治州', '747000', '0');
INSERT INTO `ewei_city` VALUES ('312', '29', '西宁市', '810000', '0');
INSERT INTO `ewei_city` VALUES ('313', '29', '海东地区', '810600', '0');
INSERT INTO `ewei_city` VALUES ('314', '29', '海北藏族自治州', '810300', '0');
INSERT INTO `ewei_city` VALUES ('315', '29', '黄南藏族自治州', '811300', '0');
INSERT INTO `ewei_city` VALUES ('316', '29', '海南藏族自治州', '813000', '0');
INSERT INTO `ewei_city` VALUES ('317', '29', '果洛藏族自治州', '814000', '0');
INSERT INTO `ewei_city` VALUES ('318', '29', '玉树藏族自治州', '815000', '0');
INSERT INTO `ewei_city` VALUES ('319', '29', '海西蒙古族藏族自治州', '817000', '0');
INSERT INTO `ewei_city` VALUES ('320', '30', '银川市', '750000', '0');
INSERT INTO `ewei_city` VALUES ('321', '30', '石嘴山市', '753000', '0');
INSERT INTO `ewei_city` VALUES ('322', '30', '吴忠市', '751100', '0');
INSERT INTO `ewei_city` VALUES ('323', '30', '固原市', '756000', '0');
INSERT INTO `ewei_city` VALUES ('324', '30', '中卫市', '751700', '0');
INSERT INTO `ewei_city` VALUES ('325', '31', '乌鲁木齐市', '830000', '0');
INSERT INTO `ewei_city` VALUES ('326', '31', '克拉玛依市', '834000', '0');
INSERT INTO `ewei_city` VALUES ('327', '31', '吐鲁番地区', '838000', '0');
INSERT INTO `ewei_city` VALUES ('328', '31', '哈密地区', '839000', '0');
INSERT INTO `ewei_city` VALUES ('329', '31', '昌吉回族自治州', '831100', '0');
INSERT INTO `ewei_city` VALUES ('330', '31', '博尔塔拉蒙古自治州', '833400', '0');
INSERT INTO `ewei_city` VALUES ('331', '31', '巴音郭楞蒙古自治州', '841000', '0');
INSERT INTO `ewei_city` VALUES ('332', '31', '阿克苏地区', '843000', '0');
INSERT INTO `ewei_city` VALUES ('333', '31', '克孜勒苏柯尔克孜自治州', '835600', '0');
INSERT INTO `ewei_city` VALUES ('334', '31', '喀什地区', '844000', '0');
INSERT INTO `ewei_city` VALUES ('335', '31', '和田地区', '848000', '0');
INSERT INTO `ewei_city` VALUES ('336', '31', '伊犁哈萨克自治州', '833200', '0');
INSERT INTO `ewei_city` VALUES ('337', '31', '塔城地区', '834700', '0');
INSERT INTO `ewei_city` VALUES ('338', '31', '阿勒泰地区', '836500', '0');
INSERT INTO `ewei_city` VALUES ('339', '31', '石河子市', '832000', '0');
INSERT INTO `ewei_city` VALUES ('340', '31', '阿拉尔市', '843300', '0');
INSERT INTO `ewei_city` VALUES ('341', '31', '图木舒克市', '843900', '0');
INSERT INTO `ewei_city` VALUES ('342', '31', '五家渠市', '831300', '0');
INSERT INTO `ewei_city` VALUES ('343', '32', '香港特别行政区', '000000', '0');
INSERT INTO `ewei_city` VALUES ('344', '33', '澳门特别行政区', '000000', '0');
INSERT INTO `ewei_city` VALUES ('345', '34', '台湾省', '000000', '0');

-- ----------------------------
-- Table structure for ewei_collect
-- ----------------------------
DROP TABLE IF EXISTS `ewei_collect`;
CREATE TABLE `ewei_collect` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ewei_collect
-- ----------------------------
INSERT INTO `ewei_collect` VALUES ('17', '7', '33', '1495381237');
INSERT INTO `ewei_collect` VALUES ('18', '7', '37', '1495466325');
INSERT INTO `ewei_collect` VALUES ('57', '7', '36', '1517155454');

-- ----------------------------
-- Table structure for ewei_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ewei_coupon`;
CREATE TABLE `ewei_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `coupon_type_id` int(1) NOT NULL COMMENT '优惠券类型',
  `coupon_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券编码',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '领用人',
  `use_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券使用订单id',
  `create_order_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建订单id(优惠券只有是完成订单发放的优惠券时才有值)',
  `money` decimal(10,2) NOT NULL COMMENT '面额',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优惠券状态 0未领用 1已领用（未使用） 2已使用 3已过期',
  `get_type` int(11) NOT NULL DEFAULT '0' COMMENT '获取方式1订单2.首页领取',
  `fetch_time` int(11) DEFAULT '0' COMMENT '领取时间',
  `use_time` int(11) DEFAULT '0' COMMENT '使用时间',
  `start_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '有效期开始时间',
  `end_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '有效期结束时间',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=148 COMMENT='优惠券表';

-- ----------------------------
-- Records of ewei_coupon
-- ----------------------------
INSERT INTO `ewei_coupon` VALUES ('1', '1', '1514816761230', '7', '0', '0', '123.00', '0', '0', '0', '0', '2018-01-26 19:33:48', '2019-11-28 19:33:52');
INSERT INTO `ewei_coupon` VALUES ('2', '1', '1514817928998', '7', '0', '0', '123.00', '0', '0', '0', '0', '2018-01-26 19:33:48', '2019-11-28 19:33:52');
INSERT INTO `ewei_coupon` VALUES ('3', '1', '1514819198296', '7', '0', '0', '123.00', '0', '0', '0', '0', '2018-01-26 19:33:48', '2019-11-28 19:33:52');
INSERT INTO `ewei_coupon` VALUES ('4', '1', '1514819240624', '7', '0', '0', '123.00', '0', '0', '0', '0', '2018-01-26 19:33:48', '2019-11-28 19:33:52');
INSERT INTO `ewei_coupon` VALUES ('5', '1', '1514826595837', '7', '0', '0', '123.00', '0', '0', '0', '0', '2018-01-26 19:33:48', '2019-11-28 19:33:52');
INSERT INTO `ewei_coupon` VALUES ('12', '1', '1514826820159', '7', '0', '0', '123.00', '0', '0', '0', '0', '2018-01-26 19:33:48', '2019-11-28 19:33:52');
INSERT INTO `ewei_coupon` VALUES ('16', '2', '1514826907172', '7', '0', '0', '123.00', '0', '0', '0', '0', '2018-01-26 19:33:48', '2019-11-28 19:33:52');
INSERT INTO `ewei_coupon` VALUES ('17', '2', '1514827104578', '7', '0', '0', '1.00', '0', '0', '0', '0', '2018-01-26 19:33:48', '2019-11-28 19:33:52');
INSERT INTO `ewei_coupon` VALUES ('19', '2', '1514827674638', '7', '0', '0', '2.00', '0', '0', '0', '0', '2018-01-26 19:33:48', '2019-11-28 19:33:52');
INSERT INTO `ewei_coupon` VALUES ('20', '2', '1515598535115', '7', '0', '0', '50.00', '0', '0', '0', '0', '2018-01-26 19:33:48', '2019-11-28 19:33:52');

-- ----------------------------
-- Table structure for ewei_coupon_goods
-- ----------------------------
DROP TABLE IF EXISTS `ewei_coupon_goods`;
CREATE TABLE `ewei_coupon_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='优惠券使用商品表';

-- ----------------------------
-- Records of ewei_coupon_goods
-- ----------------------------
INSERT INTO `ewei_coupon_goods` VALUES ('11', '1', '36');
INSERT INTO `ewei_coupon_goods` VALUES ('16', '1', '33');
INSERT INTO `ewei_coupon_goods` VALUES ('17', '2', '33');
INSERT INTO `ewei_coupon_goods` VALUES ('18', '2', '37');

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
  `tag` varchar(255) DEFAULT NULL COMMENT '标签',
  PRIMARY KEY (`coupon_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='优惠券类型表';

-- ----------------------------
-- Records of ewei_coupon_type
-- ----------------------------
INSERT INTO `ewei_coupon_type` VALUES ('1', '测试优惠券', '10.00', '100', '31', '10.00', '0', '0', '1', '1514800601', '1517047003', '0', '0', '/uploads/thumb/20180102/dc761670dc98d2579e6e4571abc1422b.jpg', null);
INSERT INTO `ewei_coupon_type` VALUES ('2', '满99减50', '50.00', '100', '12', '99.00', '3', '0', '1', '1515598829', '1516981232', '0', '0', '/uploads/common/1515598745.jpg', null);

-- ----------------------------
-- Table structure for ewei_district
-- ----------------------------
DROP TABLE IF EXISTS `ewei_district`;
CREATE TABLE `ewei_district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT '0',
  `district_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`district_id`),
  KEY `IDX_g_district_DistrictName` (`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2870 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50 COMMENT='地址 区';

-- ----------------------------
-- Records of ewei_district
-- ----------------------------
INSERT INTO `ewei_district` VALUES ('1', '1', '东城区', '0');
INSERT INTO `ewei_district` VALUES ('2', '1', '西城区', '0');
INSERT INTO `ewei_district` VALUES ('3', '1', '崇文区', '0');
INSERT INTO `ewei_district` VALUES ('4', '1', '宣武区', '0');
INSERT INTO `ewei_district` VALUES ('5', '1', '朝阳区', '0');
INSERT INTO `ewei_district` VALUES ('6', '1', '丰台区', '0');
INSERT INTO `ewei_district` VALUES ('7', '1', '石景山区', '0');
INSERT INTO `ewei_district` VALUES ('8', '1', '海淀区', '0');
INSERT INTO `ewei_district` VALUES ('9', '1', '门头沟区', '0');
INSERT INTO `ewei_district` VALUES ('10', '1', '房山区', '0');
INSERT INTO `ewei_district` VALUES ('11', '1', '通州区', '0');
INSERT INTO `ewei_district` VALUES ('12', '1', '顺义区', '0');
INSERT INTO `ewei_district` VALUES ('13', '1', '昌平区', '0');
INSERT INTO `ewei_district` VALUES ('14', '1', '大兴区', '0');
INSERT INTO `ewei_district` VALUES ('15', '1', '怀柔区', '0');
INSERT INTO `ewei_district` VALUES ('16', '1', '平谷区', '0');
INSERT INTO `ewei_district` VALUES ('17', '1', '密云县', '0');
INSERT INTO `ewei_district` VALUES ('18', '1', '延庆县', '0');
INSERT INTO `ewei_district` VALUES ('19', '2', '和平区', '0');
INSERT INTO `ewei_district` VALUES ('20', '2', '河东区', '0');
INSERT INTO `ewei_district` VALUES ('21', '2', '河西区', '0');
INSERT INTO `ewei_district` VALUES ('22', '2', '南开区', '0');
INSERT INTO `ewei_district` VALUES ('23', '2', '河北区', '0');
INSERT INTO `ewei_district` VALUES ('24', '2', '红桥区', '0');
INSERT INTO `ewei_district` VALUES ('25', '2', '塘沽区', '0');
INSERT INTO `ewei_district` VALUES ('26', '2', '汉沽区', '0');
INSERT INTO `ewei_district` VALUES ('27', '2', '大港区', '0');
INSERT INTO `ewei_district` VALUES ('28', '2', '东丽区', '0');
INSERT INTO `ewei_district` VALUES ('29', '2', '西青区', '0');
INSERT INTO `ewei_district` VALUES ('30', '2', '津南区', '0');
INSERT INTO `ewei_district` VALUES ('31', '2', '北辰区', '0');
INSERT INTO `ewei_district` VALUES ('32', '2', '武清区', '0');
INSERT INTO `ewei_district` VALUES ('33', '2', '宝坻区', '0');
INSERT INTO `ewei_district` VALUES ('34', '2', '宁河县', '0');
INSERT INTO `ewei_district` VALUES ('35', '2', '静海县', '0');
INSERT INTO `ewei_district` VALUES ('36', '2', '蓟县', '0');
INSERT INTO `ewei_district` VALUES ('37', '3', '长安区', '0');
INSERT INTO `ewei_district` VALUES ('38', '3', '桥东区', '0');
INSERT INTO `ewei_district` VALUES ('39', '3', '桥西区', '0');
INSERT INTO `ewei_district` VALUES ('40', '3', '新华区', '0');
INSERT INTO `ewei_district` VALUES ('41', '3', '井陉矿区', '0');
INSERT INTO `ewei_district` VALUES ('42', '3', '裕华区', '0');
INSERT INTO `ewei_district` VALUES ('43', '3', '井陉县', '0');
INSERT INTO `ewei_district` VALUES ('44', '3', '正定县', '0');
INSERT INTO `ewei_district` VALUES ('45', '3', '栾城县', '0');
INSERT INTO `ewei_district` VALUES ('46', '3', '行唐县', '0');
INSERT INTO `ewei_district` VALUES ('47', '3', '灵寿县', '0');
INSERT INTO `ewei_district` VALUES ('48', '3', '高邑县', '0');
INSERT INTO `ewei_district` VALUES ('49', '3', '深泽县', '0');
INSERT INTO `ewei_district` VALUES ('50', '3', '赞皇县', '0');
INSERT INTO `ewei_district` VALUES ('51', '3', '无极县', '0');
INSERT INTO `ewei_district` VALUES ('52', '3', '平山县', '0');
INSERT INTO `ewei_district` VALUES ('53', '3', '元氏县', '0');
INSERT INTO `ewei_district` VALUES ('54', '3', '赵县', '0');
INSERT INTO `ewei_district` VALUES ('55', '3', '辛集市', '0');
INSERT INTO `ewei_district` VALUES ('56', '3', '藁城市', '0');
INSERT INTO `ewei_district` VALUES ('57', '3', '晋州市', '0');
INSERT INTO `ewei_district` VALUES ('58', '3', '新乐市', '0');
INSERT INTO `ewei_district` VALUES ('59', '3', '鹿泉市', '0');
INSERT INTO `ewei_district` VALUES ('60', '4', '路南区', '0');
INSERT INTO `ewei_district` VALUES ('61', '4', '路北区', '0');
INSERT INTO `ewei_district` VALUES ('62', '4', '古冶区', '0');
INSERT INTO `ewei_district` VALUES ('63', '4', '开平区', '0');
INSERT INTO `ewei_district` VALUES ('64', '4', '丰南区', '0');
INSERT INTO `ewei_district` VALUES ('65', '4', '丰润区', '0');
INSERT INTO `ewei_district` VALUES ('66', '4', '滦县', '0');
INSERT INTO `ewei_district` VALUES ('67', '4', '滦南县', '0');
INSERT INTO `ewei_district` VALUES ('68', '4', '乐亭县', '0');
INSERT INTO `ewei_district` VALUES ('69', '4', '迁西县', '0');
INSERT INTO `ewei_district` VALUES ('70', '4', '玉田县', '0');
INSERT INTO `ewei_district` VALUES ('71', '4', '唐海县', '0');
INSERT INTO `ewei_district` VALUES ('72', '4', '遵化市', '0');
INSERT INTO `ewei_district` VALUES ('73', '4', '迁安市', '0');
INSERT INTO `ewei_district` VALUES ('74', '5', '海港区', '0');
INSERT INTO `ewei_district` VALUES ('75', '5', '山海关区', '0');
INSERT INTO `ewei_district` VALUES ('76', '5', '北戴河区', '0');
INSERT INTO `ewei_district` VALUES ('77', '5', '青龙满族自治县', '0');
INSERT INTO `ewei_district` VALUES ('78', '5', '昌黎县', '0');
INSERT INTO `ewei_district` VALUES ('79', '5', '抚宁县', '0');
INSERT INTO `ewei_district` VALUES ('80', '5', '卢龙县', '0');
INSERT INTO `ewei_district` VALUES ('81', '6', '邯山区', '0');
INSERT INTO `ewei_district` VALUES ('82', '6', '丛台区', '0');
INSERT INTO `ewei_district` VALUES ('83', '6', '复兴区', '0');
INSERT INTO `ewei_district` VALUES ('84', '6', '峰峰矿区', '0');
INSERT INTO `ewei_district` VALUES ('85', '6', '邯郸县', '0');
INSERT INTO `ewei_district` VALUES ('86', '6', '临漳县', '0');
INSERT INTO `ewei_district` VALUES ('87', '6', '成安县', '0');
INSERT INTO `ewei_district` VALUES ('88', '6', '大名县', '0');
INSERT INTO `ewei_district` VALUES ('89', '6', '涉县', '0');
INSERT INTO `ewei_district` VALUES ('90', '6', '磁县', '0');
INSERT INTO `ewei_district` VALUES ('91', '6', '肥乡县', '0');
INSERT INTO `ewei_district` VALUES ('92', '6', '永年县', '0');
INSERT INTO `ewei_district` VALUES ('93', '6', '邱县', '0');
INSERT INTO `ewei_district` VALUES ('94', '6', '鸡泽县', '0');
INSERT INTO `ewei_district` VALUES ('95', '6', '广平县', '0');
INSERT INTO `ewei_district` VALUES ('96', '6', '馆陶县', '0');
INSERT INTO `ewei_district` VALUES ('97', '6', '魏县', '0');
INSERT INTO `ewei_district` VALUES ('98', '6', '曲周县', '0');
INSERT INTO `ewei_district` VALUES ('99', '6', '武安市', '0');
INSERT INTO `ewei_district` VALUES ('100', '7', '桥东区', '0');
INSERT INTO `ewei_district` VALUES ('101', '7', '桥西区', '0');
INSERT INTO `ewei_district` VALUES ('102', '7', '邢台县', '0');
INSERT INTO `ewei_district` VALUES ('103', '7', '临城县', '0');
INSERT INTO `ewei_district` VALUES ('104', '7', '内丘县', '0');
INSERT INTO `ewei_district` VALUES ('105', '7', '柏乡县', '0');
INSERT INTO `ewei_district` VALUES ('106', '7', '隆尧县', '0');
INSERT INTO `ewei_district` VALUES ('107', '7', '任县', '0');
INSERT INTO `ewei_district` VALUES ('108', '7', '南和县', '0');
INSERT INTO `ewei_district` VALUES ('109', '7', '宁晋县', '0');
INSERT INTO `ewei_district` VALUES ('110', '7', '巨鹿县', '0');
INSERT INTO `ewei_district` VALUES ('111', '7', '新河县', '0');
INSERT INTO `ewei_district` VALUES ('112', '7', '广宗县', '0');
INSERT INTO `ewei_district` VALUES ('113', '7', '平乡县', '0');
INSERT INTO `ewei_district` VALUES ('114', '7', '威县', '0');
INSERT INTO `ewei_district` VALUES ('115', '7', '清河县', '0');
INSERT INTO `ewei_district` VALUES ('116', '7', '临西县', '0');
INSERT INTO `ewei_district` VALUES ('117', '7', '南宫市', '0');
INSERT INTO `ewei_district` VALUES ('118', '7', '沙河市', '0');
INSERT INTO `ewei_district` VALUES ('119', '8', '新市区', '0');
INSERT INTO `ewei_district` VALUES ('120', '8', '北市区', '0');
INSERT INTO `ewei_district` VALUES ('121', '8', '南市区', '0');
INSERT INTO `ewei_district` VALUES ('122', '8', '满城县', '0');
INSERT INTO `ewei_district` VALUES ('123', '8', '清苑县', '0');
INSERT INTO `ewei_district` VALUES ('124', '8', '涞水县', '0');
INSERT INTO `ewei_district` VALUES ('125', '8', '阜平县', '0');
INSERT INTO `ewei_district` VALUES ('126', '8', '徐水县', '0');
INSERT INTO `ewei_district` VALUES ('127', '8', '定兴县', '0');
INSERT INTO `ewei_district` VALUES ('128', '8', '唐县', '0');
INSERT INTO `ewei_district` VALUES ('129', '8', '高阳县', '0');
INSERT INTO `ewei_district` VALUES ('130', '8', '容城县', '0');
INSERT INTO `ewei_district` VALUES ('131', '8', '涞源县', '0');
INSERT INTO `ewei_district` VALUES ('132', '8', '望都县', '0');
INSERT INTO `ewei_district` VALUES ('133', '8', '安新县', '0');
INSERT INTO `ewei_district` VALUES ('134', '8', '易县', '0');
INSERT INTO `ewei_district` VALUES ('135', '8', '曲阳县', '0');
INSERT INTO `ewei_district` VALUES ('136', '8', '蠡县', '0');
INSERT INTO `ewei_district` VALUES ('137', '8', '顺平县', '0');
INSERT INTO `ewei_district` VALUES ('138', '8', '博野县', '0');
INSERT INTO `ewei_district` VALUES ('139', '8', '雄县', '0');
INSERT INTO `ewei_district` VALUES ('140', '8', '涿州市', '0');
INSERT INTO `ewei_district` VALUES ('141', '8', '定州市', '0');
INSERT INTO `ewei_district` VALUES ('142', '8', '安国市', '0');
INSERT INTO `ewei_district` VALUES ('143', '8', '高碑店市', '0');
INSERT INTO `ewei_district` VALUES ('144', '9', '桥东区', '0');
INSERT INTO `ewei_district` VALUES ('145', '9', '桥西区', '0');
INSERT INTO `ewei_district` VALUES ('146', '9', '宣化区', '0');
INSERT INTO `ewei_district` VALUES ('147', '9', '下花园区', '0');
INSERT INTO `ewei_district` VALUES ('148', '9', '宣化县', '0');
INSERT INTO `ewei_district` VALUES ('149', '9', '张北县', '0');
INSERT INTO `ewei_district` VALUES ('150', '9', '康保县', '0');
INSERT INTO `ewei_district` VALUES ('151', '9', '沽源县', '0');
INSERT INTO `ewei_district` VALUES ('152', '9', '尚义县', '0');
INSERT INTO `ewei_district` VALUES ('153', '9', '蔚县', '0');
INSERT INTO `ewei_district` VALUES ('154', '9', '阳原县', '0');
INSERT INTO `ewei_district` VALUES ('155', '9', '怀安县', '0');
INSERT INTO `ewei_district` VALUES ('156', '9', '万全县', '0');
INSERT INTO `ewei_district` VALUES ('157', '9', '怀来县', '0');
INSERT INTO `ewei_district` VALUES ('158', '9', '涿鹿县', '0');
INSERT INTO `ewei_district` VALUES ('159', '9', '赤城县', '0');
INSERT INTO `ewei_district` VALUES ('160', '9', '崇礼县', '0');
INSERT INTO `ewei_district` VALUES ('161', '10', '双桥区', '0');
INSERT INTO `ewei_district` VALUES ('162', '10', '双滦区', '0');
INSERT INTO `ewei_district` VALUES ('163', '10', '鹰手营子矿区', '0');
INSERT INTO `ewei_district` VALUES ('164', '10', '承德县', '0');
INSERT INTO `ewei_district` VALUES ('165', '10', '兴隆县', '0');
INSERT INTO `ewei_district` VALUES ('166', '10', '平泉县', '0');
INSERT INTO `ewei_district` VALUES ('167', '10', '滦平县', '0');
INSERT INTO `ewei_district` VALUES ('168', '10', '隆化县', '0');
INSERT INTO `ewei_district` VALUES ('169', '10', '丰宁满族自治县', '0');
INSERT INTO `ewei_district` VALUES ('170', '10', '宽城满族自治县', '0');
INSERT INTO `ewei_district` VALUES ('171', '10', '围场满族蒙古族自治县', '0');
INSERT INTO `ewei_district` VALUES ('172', '11', '新华区', '0');
INSERT INTO `ewei_district` VALUES ('173', '11', '运河区', '0');
INSERT INTO `ewei_district` VALUES ('174', '11', '沧县', '0');
INSERT INTO `ewei_district` VALUES ('175', '11', '青县', '0');
INSERT INTO `ewei_district` VALUES ('176', '11', '东光县', '0');
INSERT INTO `ewei_district` VALUES ('177', '11', '海兴县', '0');
INSERT INTO `ewei_district` VALUES ('178', '11', '盐山县', '0');
INSERT INTO `ewei_district` VALUES ('179', '11', '肃宁县', '0');
INSERT INTO `ewei_district` VALUES ('180', '11', '南皮县', '0');
INSERT INTO `ewei_district` VALUES ('181', '11', '吴桥县', '0');
INSERT INTO `ewei_district` VALUES ('182', '11', '献县', '0');
INSERT INTO `ewei_district` VALUES ('183', '11', '孟村回族自治县', '0');
INSERT INTO `ewei_district` VALUES ('184', '11', '泊头市', '0');
INSERT INTO `ewei_district` VALUES ('185', '11', '任丘市', '0');
INSERT INTO `ewei_district` VALUES ('186', '11', '黄骅市', '0');
INSERT INTO `ewei_district` VALUES ('187', '11', '河间市', '0');
INSERT INTO `ewei_district` VALUES ('188', '12', '安次区', '0');
INSERT INTO `ewei_district` VALUES ('189', '12', '广阳区', '0');
INSERT INTO `ewei_district` VALUES ('190', '12', '固安县', '0');
INSERT INTO `ewei_district` VALUES ('191', '12', '永清县', '0');
INSERT INTO `ewei_district` VALUES ('192', '12', '香河县', '0');
INSERT INTO `ewei_district` VALUES ('193', '12', '大城县', '0');
INSERT INTO `ewei_district` VALUES ('194', '12', '文安县', '0');
INSERT INTO `ewei_district` VALUES ('195', '12', '大厂回族自治县', '0');
INSERT INTO `ewei_district` VALUES ('196', '12', '霸州市', '0');
INSERT INTO `ewei_district` VALUES ('197', '12', '三河市', '0');
INSERT INTO `ewei_district` VALUES ('198', '13', '桃城区', '0');
INSERT INTO `ewei_district` VALUES ('199', '13', '枣强县', '0');
INSERT INTO `ewei_district` VALUES ('200', '13', '武邑县', '0');
INSERT INTO `ewei_district` VALUES ('201', '13', '武强县', '0');
INSERT INTO `ewei_district` VALUES ('202', '13', '饶阳县', '0');
INSERT INTO `ewei_district` VALUES ('203', '13', '安平县', '0');
INSERT INTO `ewei_district` VALUES ('204', '13', '故城县', '0');
INSERT INTO `ewei_district` VALUES ('205', '13', '景县', '0');
INSERT INTO `ewei_district` VALUES ('206', '13', '阜城县', '0');
INSERT INTO `ewei_district` VALUES ('207', '13', '冀州市', '0');
INSERT INTO `ewei_district` VALUES ('208', '13', '深州市', '0');
INSERT INTO `ewei_district` VALUES ('209', '14', '小店区', '0');
INSERT INTO `ewei_district` VALUES ('210', '14', '迎泽区', '0');
INSERT INTO `ewei_district` VALUES ('211', '14', '杏花岭区', '0');
INSERT INTO `ewei_district` VALUES ('212', '14', '尖草坪区', '0');
INSERT INTO `ewei_district` VALUES ('213', '14', '万柏林区', '0');
INSERT INTO `ewei_district` VALUES ('214', '14', '晋源区', '0');
INSERT INTO `ewei_district` VALUES ('215', '14', '清徐县', '0');
INSERT INTO `ewei_district` VALUES ('216', '14', '阳曲县', '0');
INSERT INTO `ewei_district` VALUES ('217', '14', '娄烦县', '0');
INSERT INTO `ewei_district` VALUES ('218', '14', '古交市', '0');
INSERT INTO `ewei_district` VALUES ('219', '15', '城区', '0');
INSERT INTO `ewei_district` VALUES ('220', '15', '矿区', '0');
INSERT INTO `ewei_district` VALUES ('221', '15', '南郊区', '0');
INSERT INTO `ewei_district` VALUES ('222', '15', '新荣区', '0');
INSERT INTO `ewei_district` VALUES ('223', '15', '阳高县', '0');
INSERT INTO `ewei_district` VALUES ('224', '15', '天镇县', '0');
INSERT INTO `ewei_district` VALUES ('225', '15', '广灵县', '0');
INSERT INTO `ewei_district` VALUES ('226', '15', '灵丘县', '0');
INSERT INTO `ewei_district` VALUES ('227', '15', '浑源县', '0');
INSERT INTO `ewei_district` VALUES ('228', '15', '左云县', '0');
INSERT INTO `ewei_district` VALUES ('229', '15', '大同县', '0');
INSERT INTO `ewei_district` VALUES ('230', '16', '城区', '0');
INSERT INTO `ewei_district` VALUES ('231', '16', '矿区', '0');
INSERT INTO `ewei_district` VALUES ('232', '16', '郊区', '0');
INSERT INTO `ewei_district` VALUES ('233', '16', '平定县', '0');
INSERT INTO `ewei_district` VALUES ('234', '16', '盂县', '0');
INSERT INTO `ewei_district` VALUES ('235', '17', '城区', '0');
INSERT INTO `ewei_district` VALUES ('236', '17', '郊区', '0');
INSERT INTO `ewei_district` VALUES ('237', '17', '长治县', '0');
INSERT INTO `ewei_district` VALUES ('238', '17', '襄垣县', '0');
INSERT INTO `ewei_district` VALUES ('239', '17', '屯留县', '0');
INSERT INTO `ewei_district` VALUES ('240', '17', '平顺县', '0');
INSERT INTO `ewei_district` VALUES ('241', '17', '黎城县', '0');
INSERT INTO `ewei_district` VALUES ('242', '17', '壶关县', '0');
INSERT INTO `ewei_district` VALUES ('243', '17', '长子县', '0');
INSERT INTO `ewei_district` VALUES ('244', '17', '武乡县', '0');
INSERT INTO `ewei_district` VALUES ('245', '17', '沁县', '0');
INSERT INTO `ewei_district` VALUES ('246', '17', '沁源县', '0');
INSERT INTO `ewei_district` VALUES ('247', '17', '潞城市', '0');
INSERT INTO `ewei_district` VALUES ('248', '18', '城区', '0');
INSERT INTO `ewei_district` VALUES ('249', '18', '沁水县', '0');
INSERT INTO `ewei_district` VALUES ('250', '18', '阳城县', '0');
INSERT INTO `ewei_district` VALUES ('251', '18', '陵川县', '0');
INSERT INTO `ewei_district` VALUES ('252', '18', '泽州县', '0');
INSERT INTO `ewei_district` VALUES ('253', '18', '高平市', '0');
INSERT INTO `ewei_district` VALUES ('254', '19', '朔城区', '0');
INSERT INTO `ewei_district` VALUES ('255', '19', '平鲁区', '0');
INSERT INTO `ewei_district` VALUES ('256', '19', '山阴县', '0');
INSERT INTO `ewei_district` VALUES ('257', '19', '应县', '0');
INSERT INTO `ewei_district` VALUES ('258', '19', '右玉县', '0');
INSERT INTO `ewei_district` VALUES ('259', '19', '怀仁县', '0');
INSERT INTO `ewei_district` VALUES ('260', '20', '榆次区', '0');
INSERT INTO `ewei_district` VALUES ('261', '20', '榆社县', '0');
INSERT INTO `ewei_district` VALUES ('262', '20', '左权县', '0');
INSERT INTO `ewei_district` VALUES ('263', '20', '和顺县', '0');
INSERT INTO `ewei_district` VALUES ('264', '20', '昔阳县', '0');
INSERT INTO `ewei_district` VALUES ('265', '20', '寿阳县', '0');
INSERT INTO `ewei_district` VALUES ('266', '20', '太谷县', '0');
INSERT INTO `ewei_district` VALUES ('267', '20', '祁县', '0');
INSERT INTO `ewei_district` VALUES ('268', '20', '平遥县', '0');
INSERT INTO `ewei_district` VALUES ('269', '20', '灵石县', '0');
INSERT INTO `ewei_district` VALUES ('270', '20', '介休市', '0');
INSERT INTO `ewei_district` VALUES ('271', '21', '盐湖区', '0');
INSERT INTO `ewei_district` VALUES ('272', '21', '临猗县', '0');
INSERT INTO `ewei_district` VALUES ('273', '21', '万荣县', '0');
INSERT INTO `ewei_district` VALUES ('274', '21', '闻喜县', '0');
INSERT INTO `ewei_district` VALUES ('275', '21', '稷山县', '0');
INSERT INTO `ewei_district` VALUES ('276', '21', '新绛县', '0');
INSERT INTO `ewei_district` VALUES ('277', '21', '绛县', '0');
INSERT INTO `ewei_district` VALUES ('278', '21', '垣曲县', '0');
INSERT INTO `ewei_district` VALUES ('279', '21', '夏县', '0');
INSERT INTO `ewei_district` VALUES ('280', '21', '平陆县', '0');
INSERT INTO `ewei_district` VALUES ('281', '21', '芮城县', '0');
INSERT INTO `ewei_district` VALUES ('282', '21', '永济市', '0');
INSERT INTO `ewei_district` VALUES ('283', '21', '河津市', '0');
INSERT INTO `ewei_district` VALUES ('284', '22', '忻府区', '0');
INSERT INTO `ewei_district` VALUES ('285', '22', '定襄县', '0');
INSERT INTO `ewei_district` VALUES ('286', '22', '五台县', '0');
INSERT INTO `ewei_district` VALUES ('287', '22', '代县', '0');
INSERT INTO `ewei_district` VALUES ('288', '22', '繁峙县', '0');
INSERT INTO `ewei_district` VALUES ('289', '22', '宁武县', '0');
INSERT INTO `ewei_district` VALUES ('290', '22', '静乐县', '0');
INSERT INTO `ewei_district` VALUES ('291', '22', '神池县', '0');
INSERT INTO `ewei_district` VALUES ('292', '22', '五寨县', '0');
INSERT INTO `ewei_district` VALUES ('293', '22', '岢岚县', '0');
INSERT INTO `ewei_district` VALUES ('294', '22', '河曲县', '0');
INSERT INTO `ewei_district` VALUES ('295', '22', '保德县', '0');
INSERT INTO `ewei_district` VALUES ('296', '22', '偏关县', '0');
INSERT INTO `ewei_district` VALUES ('297', '22', '原平市', '0');
INSERT INTO `ewei_district` VALUES ('298', '23', '尧都区', '0');
INSERT INTO `ewei_district` VALUES ('299', '23', '曲沃县', '0');
INSERT INTO `ewei_district` VALUES ('300', '23', '翼城县', '0');
INSERT INTO `ewei_district` VALUES ('301', '23', '襄汾县', '0');
INSERT INTO `ewei_district` VALUES ('302', '23', '洪洞县', '0');
INSERT INTO `ewei_district` VALUES ('303', '23', '古县', '0');
INSERT INTO `ewei_district` VALUES ('304', '23', '安泽县', '0');
INSERT INTO `ewei_district` VALUES ('305', '23', '浮山县', '0');
INSERT INTO `ewei_district` VALUES ('306', '23', '吉县', '0');
INSERT INTO `ewei_district` VALUES ('307', '23', '乡宁县', '0');
INSERT INTO `ewei_district` VALUES ('308', '23', '大宁县', '0');
INSERT INTO `ewei_district` VALUES ('309', '23', '隰县', '0');
INSERT INTO `ewei_district` VALUES ('310', '23', '永和县', '0');
INSERT INTO `ewei_district` VALUES ('311', '23', '蒲县', '0');
INSERT INTO `ewei_district` VALUES ('312', '23', '汾西县', '0');
INSERT INTO `ewei_district` VALUES ('313', '23', '侯马市', '0');
INSERT INTO `ewei_district` VALUES ('314', '23', '霍州市', '0');
INSERT INTO `ewei_district` VALUES ('315', '24', '离石区', '0');
INSERT INTO `ewei_district` VALUES ('316', '24', '文水县', '0');
INSERT INTO `ewei_district` VALUES ('317', '24', '交城县', '0');
INSERT INTO `ewei_district` VALUES ('318', '24', '兴县', '0');
INSERT INTO `ewei_district` VALUES ('319', '24', '临县', '0');
INSERT INTO `ewei_district` VALUES ('320', '24', '柳林县', '0');
INSERT INTO `ewei_district` VALUES ('321', '24', '石楼县', '0');
INSERT INTO `ewei_district` VALUES ('322', '24', '岚县', '0');
INSERT INTO `ewei_district` VALUES ('323', '24', '方山县', '0');
INSERT INTO `ewei_district` VALUES ('324', '24', '中阳县', '0');
INSERT INTO `ewei_district` VALUES ('325', '24', '交口县', '0');
INSERT INTO `ewei_district` VALUES ('326', '24', '孝义市', '0');
INSERT INTO `ewei_district` VALUES ('327', '24', '汾阳市', '0');
INSERT INTO `ewei_district` VALUES ('328', '25', '新城区', '0');
INSERT INTO `ewei_district` VALUES ('329', '25', '回民区', '0');
INSERT INTO `ewei_district` VALUES ('330', '25', '玉泉区', '0');
INSERT INTO `ewei_district` VALUES ('331', '25', '赛罕区', '0');
INSERT INTO `ewei_district` VALUES ('332', '25', '土默特左旗', '0');
INSERT INTO `ewei_district` VALUES ('333', '25', '托克托县', '0');
INSERT INTO `ewei_district` VALUES ('334', '25', '和林格尔县', '0');
INSERT INTO `ewei_district` VALUES ('335', '25', '清水河县', '0');
INSERT INTO `ewei_district` VALUES ('336', '25', '武川县', '0');
INSERT INTO `ewei_district` VALUES ('337', '26', '东河区', '0');
INSERT INTO `ewei_district` VALUES ('338', '26', '昆都仑区', '0');
INSERT INTO `ewei_district` VALUES ('339', '26', '青山区', '0');
INSERT INTO `ewei_district` VALUES ('340', '26', '石拐区', '0');
INSERT INTO `ewei_district` VALUES ('341', '26', '白云矿区', '0');
INSERT INTO `ewei_district` VALUES ('342', '26', '九原区', '0');
INSERT INTO `ewei_district` VALUES ('343', '26', '土默特右旗', '0');
INSERT INTO `ewei_district` VALUES ('344', '26', '固阳县', '0');
INSERT INTO `ewei_district` VALUES ('345', '26', '达尔罕茂明安联合旗', '0');
INSERT INTO `ewei_district` VALUES ('346', '27', '海勃湾区', '0');
INSERT INTO `ewei_district` VALUES ('347', '27', '海南区', '0');
INSERT INTO `ewei_district` VALUES ('348', '27', '乌达区', '0');
INSERT INTO `ewei_district` VALUES ('349', '28', '红山区', '0');
INSERT INTO `ewei_district` VALUES ('350', '28', '元宝山区', '0');
INSERT INTO `ewei_district` VALUES ('351', '28', '松山区', '0');
INSERT INTO `ewei_district` VALUES ('352', '28', '阿鲁科尔沁旗', '0');
INSERT INTO `ewei_district` VALUES ('353', '28', '巴林左旗', '0');
INSERT INTO `ewei_district` VALUES ('354', '28', '巴林右旗', '0');
INSERT INTO `ewei_district` VALUES ('355', '28', '林西县', '0');
INSERT INTO `ewei_district` VALUES ('356', '28', '克什克腾旗', '0');
INSERT INTO `ewei_district` VALUES ('357', '28', '翁牛特旗', '0');
INSERT INTO `ewei_district` VALUES ('358', '28', '喀喇沁旗', '0');
INSERT INTO `ewei_district` VALUES ('359', '28', '宁城县', '0');
INSERT INTO `ewei_district` VALUES ('360', '28', '敖汉旗', '0');
INSERT INTO `ewei_district` VALUES ('361', '29', '科尔沁区', '0');
INSERT INTO `ewei_district` VALUES ('362', '29', '科尔沁左翼中旗', '0');
INSERT INTO `ewei_district` VALUES ('363', '29', '科尔沁左翼后旗', '0');
INSERT INTO `ewei_district` VALUES ('364', '29', '开鲁县', '0');
INSERT INTO `ewei_district` VALUES ('365', '29', '库伦旗', '0');
INSERT INTO `ewei_district` VALUES ('366', '29', '奈曼旗', '0');
INSERT INTO `ewei_district` VALUES ('367', '29', '扎鲁特旗', '0');
INSERT INTO `ewei_district` VALUES ('368', '29', '霍林郭勒市', '0');
INSERT INTO `ewei_district` VALUES ('369', '30', '东胜区', '0');
INSERT INTO `ewei_district` VALUES ('370', '30', '达拉特旗', '0');
INSERT INTO `ewei_district` VALUES ('371', '30', '准格尔旗', '0');
INSERT INTO `ewei_district` VALUES ('372', '30', '鄂托克前旗', '0');
INSERT INTO `ewei_district` VALUES ('373', '30', '鄂托克旗', '0');
INSERT INTO `ewei_district` VALUES ('374', '30', '杭锦旗', '0');
INSERT INTO `ewei_district` VALUES ('375', '30', '乌审旗', '0');
INSERT INTO `ewei_district` VALUES ('376', '30', '伊金霍洛旗', '0');
INSERT INTO `ewei_district` VALUES ('377', '31', '海拉尔区', '0');
INSERT INTO `ewei_district` VALUES ('378', '31', '阿荣旗', '0');
INSERT INTO `ewei_district` VALUES ('379', '31', '莫力达瓦达斡尔族自治旗', '0');
INSERT INTO `ewei_district` VALUES ('380', '31', '鄂伦春自治旗', '0');
INSERT INTO `ewei_district` VALUES ('381', '31', '鄂温克族自治旗', '0');
INSERT INTO `ewei_district` VALUES ('382', '31', '陈巴尔虎旗', '0');
INSERT INTO `ewei_district` VALUES ('383', '31', '新巴尔虎左旗', '0');
INSERT INTO `ewei_district` VALUES ('384', '31', '新巴尔虎右旗', '0');
INSERT INTO `ewei_district` VALUES ('385', '31', '满洲里市', '0');
INSERT INTO `ewei_district` VALUES ('386', '31', '牙克石市', '0');
INSERT INTO `ewei_district` VALUES ('387', '31', '扎兰屯市', '0');
INSERT INTO `ewei_district` VALUES ('388', '31', '额尔古纳市', '0');
INSERT INTO `ewei_district` VALUES ('389', '31', '根河市', '0');
INSERT INTO `ewei_district` VALUES ('390', '32', '临河区', '0');
INSERT INTO `ewei_district` VALUES ('391', '32', '五原县', '0');
INSERT INTO `ewei_district` VALUES ('392', '32', '磴口县', '0');
INSERT INTO `ewei_district` VALUES ('393', '32', '乌拉特前旗', '0');
INSERT INTO `ewei_district` VALUES ('394', '32', '乌拉特中旗', '0');
INSERT INTO `ewei_district` VALUES ('395', '32', '乌拉特后旗', '0');
INSERT INTO `ewei_district` VALUES ('396', '32', '杭锦后旗', '0');
INSERT INTO `ewei_district` VALUES ('397', '33', '集宁区', '0');
INSERT INTO `ewei_district` VALUES ('398', '33', '卓资县', '0');
INSERT INTO `ewei_district` VALUES ('399', '33', '化德县', '0');
INSERT INTO `ewei_district` VALUES ('400', '33', '商都县', '0');
INSERT INTO `ewei_district` VALUES ('401', '33', '兴和县', '0');
INSERT INTO `ewei_district` VALUES ('402', '33', '凉城县', '0');
INSERT INTO `ewei_district` VALUES ('403', '33', '察哈尔右翼前旗', '0');
INSERT INTO `ewei_district` VALUES ('404', '33', '察哈尔右翼中旗', '0');
INSERT INTO `ewei_district` VALUES ('405', '33', '察哈尔右翼后旗', '0');
INSERT INTO `ewei_district` VALUES ('406', '33', '四子王旗', '0');
INSERT INTO `ewei_district` VALUES ('407', '33', '丰镇市', '0');
INSERT INTO `ewei_district` VALUES ('408', '34', '乌兰浩特市', '0');
INSERT INTO `ewei_district` VALUES ('409', '34', '阿尔山市', '0');
INSERT INTO `ewei_district` VALUES ('410', '34', '科尔沁右翼前旗', '0');
INSERT INTO `ewei_district` VALUES ('411', '34', '科尔沁右翼中旗', '0');
INSERT INTO `ewei_district` VALUES ('412', '34', '扎赉特旗', '0');
INSERT INTO `ewei_district` VALUES ('413', '34', '突泉县', '0');
INSERT INTO `ewei_district` VALUES ('414', '35', '二连浩特市', '0');
INSERT INTO `ewei_district` VALUES ('415', '35', '锡林浩特市', '0');
INSERT INTO `ewei_district` VALUES ('416', '35', '阿巴嘎旗', '0');
INSERT INTO `ewei_district` VALUES ('417', '35', '苏尼特左旗', '0');
INSERT INTO `ewei_district` VALUES ('418', '35', '苏尼特右旗', '0');
INSERT INTO `ewei_district` VALUES ('419', '35', '东乌珠穆沁旗', '0');
INSERT INTO `ewei_district` VALUES ('420', '35', '西乌珠穆沁旗', '0');
INSERT INTO `ewei_district` VALUES ('421', '35', '太仆寺旗', '0');
INSERT INTO `ewei_district` VALUES ('422', '35', '镶黄旗', '0');
INSERT INTO `ewei_district` VALUES ('423', '35', '正镶白旗', '0');
INSERT INTO `ewei_district` VALUES ('424', '35', '正蓝旗', '0');
INSERT INTO `ewei_district` VALUES ('425', '35', '多伦县', '0');
INSERT INTO `ewei_district` VALUES ('426', '36', '阿拉善左旗', '0');
INSERT INTO `ewei_district` VALUES ('427', '36', '阿拉善右旗', '0');
INSERT INTO `ewei_district` VALUES ('428', '36', '额济纳旗', '0');
INSERT INTO `ewei_district` VALUES ('429', '37', '和平区', '0');
INSERT INTO `ewei_district` VALUES ('430', '37', '沈河区', '0');
INSERT INTO `ewei_district` VALUES ('431', '37', '大东区', '0');
INSERT INTO `ewei_district` VALUES ('432', '37', '皇姑区', '0');
INSERT INTO `ewei_district` VALUES ('433', '37', '铁西区', '0');
INSERT INTO `ewei_district` VALUES ('434', '37', '苏家屯区', '0');
INSERT INTO `ewei_district` VALUES ('435', '37', '东陵区', '0');
INSERT INTO `ewei_district` VALUES ('436', '37', '新城子区', '0');
INSERT INTO `ewei_district` VALUES ('437', '37', '于洪区', '0');
INSERT INTO `ewei_district` VALUES ('438', '37', '辽中县', '0');
INSERT INTO `ewei_district` VALUES ('439', '37', '康平县', '0');
INSERT INTO `ewei_district` VALUES ('440', '37', '法库县', '0');
INSERT INTO `ewei_district` VALUES ('441', '37', '新民市', '0');
INSERT INTO `ewei_district` VALUES ('442', '38', '中山区', '0');
INSERT INTO `ewei_district` VALUES ('443', '38', '西岗区', '0');
INSERT INTO `ewei_district` VALUES ('444', '38', '沙河口区', '0');
INSERT INTO `ewei_district` VALUES ('445', '38', '甘井子区', '0');
INSERT INTO `ewei_district` VALUES ('446', '38', '旅顺口区', '0');
INSERT INTO `ewei_district` VALUES ('447', '38', '金州区', '0');
INSERT INTO `ewei_district` VALUES ('448', '38', '长海县', '0');
INSERT INTO `ewei_district` VALUES ('449', '38', '瓦房店市', '0');
INSERT INTO `ewei_district` VALUES ('450', '38', '普兰店市', '0');
INSERT INTO `ewei_district` VALUES ('451', '38', '庄河市', '0');
INSERT INTO `ewei_district` VALUES ('452', '39', '铁东区', '0');
INSERT INTO `ewei_district` VALUES ('453', '39', '铁西区', '0');
INSERT INTO `ewei_district` VALUES ('454', '39', '立山区', '0');
INSERT INTO `ewei_district` VALUES ('455', '39', '千山区', '0');
INSERT INTO `ewei_district` VALUES ('456', '39', '台安县', '0');
INSERT INTO `ewei_district` VALUES ('457', '39', '岫岩满族自治县', '0');
INSERT INTO `ewei_district` VALUES ('458', '39', '海城市', '0');
INSERT INTO `ewei_district` VALUES ('459', '40', '新抚区', '0');
INSERT INTO `ewei_district` VALUES ('460', '40', '东洲区', '0');
INSERT INTO `ewei_district` VALUES ('461', '40', '望花区', '0');
INSERT INTO `ewei_district` VALUES ('462', '40', '顺城区', '0');
INSERT INTO `ewei_district` VALUES ('463', '40', '抚顺县', '0');
INSERT INTO `ewei_district` VALUES ('464', '40', '新宾满族自治县', '0');
INSERT INTO `ewei_district` VALUES ('465', '40', '清原满族自治县', '0');
INSERT INTO `ewei_district` VALUES ('466', '41', '平山区', '0');
INSERT INTO `ewei_district` VALUES ('467', '41', '溪湖区', '0');
INSERT INTO `ewei_district` VALUES ('468', '41', '明山区', '0');
INSERT INTO `ewei_district` VALUES ('469', '41', '南芬区', '0');
INSERT INTO `ewei_district` VALUES ('470', '41', '本溪满族自治县', '0');
INSERT INTO `ewei_district` VALUES ('471', '41', '桓仁满族自治县', '0');
INSERT INTO `ewei_district` VALUES ('472', '42', '元宝区', '0');
INSERT INTO `ewei_district` VALUES ('473', '42', '振兴区', '0');
INSERT INTO `ewei_district` VALUES ('474', '42', '振安区', '0');
INSERT INTO `ewei_district` VALUES ('475', '42', '宽甸满族自治县', '0');
INSERT INTO `ewei_district` VALUES ('476', '42', '东港市', '0');
INSERT INTO `ewei_district` VALUES ('477', '42', '凤城市', '0');
INSERT INTO `ewei_district` VALUES ('478', '43', '古塔区', '0');
INSERT INTO `ewei_district` VALUES ('479', '43', '凌河区', '0');
INSERT INTO `ewei_district` VALUES ('480', '43', '太和区', '0');
INSERT INTO `ewei_district` VALUES ('481', '43', '黑山县', '0');
INSERT INTO `ewei_district` VALUES ('482', '43', '义县', '0');
INSERT INTO `ewei_district` VALUES ('483', '43', '凌海市', '0');
INSERT INTO `ewei_district` VALUES ('484', '43', '北宁市', '0');
INSERT INTO `ewei_district` VALUES ('485', '44', '站前区', '0');
INSERT INTO `ewei_district` VALUES ('486', '44', '西市区', '0');
INSERT INTO `ewei_district` VALUES ('487', '44', '鲅鱼圈区', '0');
INSERT INTO `ewei_district` VALUES ('488', '44', '老边区', '0');
INSERT INTO `ewei_district` VALUES ('489', '44', '盖州市', '0');
INSERT INTO `ewei_district` VALUES ('490', '44', '大石桥市', '0');
INSERT INTO `ewei_district` VALUES ('491', '45', '海州区', '0');
INSERT INTO `ewei_district` VALUES ('492', '45', '新邱区', '0');
INSERT INTO `ewei_district` VALUES ('493', '45', '太平区', '0');
INSERT INTO `ewei_district` VALUES ('494', '45', '清河门区', '0');
INSERT INTO `ewei_district` VALUES ('495', '45', '细河区', '0');
INSERT INTO `ewei_district` VALUES ('496', '45', '阜新蒙古族自治县', '0');
INSERT INTO `ewei_district` VALUES ('497', '45', '彰武县', '0');
INSERT INTO `ewei_district` VALUES ('498', '46', '白塔区', '0');
INSERT INTO `ewei_district` VALUES ('499', '46', '文圣区', '0');
INSERT INTO `ewei_district` VALUES ('500', '46', '宏伟区', '0');
INSERT INTO `ewei_district` VALUES ('501', '46', '弓长岭区', '0');
INSERT INTO `ewei_district` VALUES ('502', '46', '太子河区', '0');
INSERT INTO `ewei_district` VALUES ('503', '46', '辽阳县', '0');
INSERT INTO `ewei_district` VALUES ('504', '46', '灯塔市', '0');
INSERT INTO `ewei_district` VALUES ('505', '47', '双台子区', '0');
INSERT INTO `ewei_district` VALUES ('506', '47', '兴隆台区', '0');
INSERT INTO `ewei_district` VALUES ('507', '47', '大洼县', '0');
INSERT INTO `ewei_district` VALUES ('508', '47', '盘山县', '0');
INSERT INTO `ewei_district` VALUES ('509', '48', '银州区', '0');
INSERT INTO `ewei_district` VALUES ('510', '48', '清河区', '0');
INSERT INTO `ewei_district` VALUES ('511', '48', '铁岭县', '0');
INSERT INTO `ewei_district` VALUES ('512', '48', '西丰县', '0');
INSERT INTO `ewei_district` VALUES ('513', '48', '昌图县', '0');
INSERT INTO `ewei_district` VALUES ('514', '48', '调兵山市', '0');
INSERT INTO `ewei_district` VALUES ('515', '48', '开原市', '0');
INSERT INTO `ewei_district` VALUES ('516', '49', '双塔区', '0');
INSERT INTO `ewei_district` VALUES ('517', '49', '龙城区', '0');
INSERT INTO `ewei_district` VALUES ('518', '49', '朝阳县', '0');
INSERT INTO `ewei_district` VALUES ('519', '49', '建平县', '0');
INSERT INTO `ewei_district` VALUES ('520', '49', '喀喇沁左翼蒙古族自治县', '0');
INSERT INTO `ewei_district` VALUES ('521', '49', '北票市', '0');
INSERT INTO `ewei_district` VALUES ('522', '49', '凌源市', '0');
INSERT INTO `ewei_district` VALUES ('523', '50', '连山区', '0');
INSERT INTO `ewei_district` VALUES ('524', '50', '龙港区', '0');
INSERT INTO `ewei_district` VALUES ('525', '50', '南票区', '0');
INSERT INTO `ewei_district` VALUES ('526', '50', '绥中县', '0');
INSERT INTO `ewei_district` VALUES ('527', '50', '建昌县', '0');
INSERT INTO `ewei_district` VALUES ('528', '50', '兴城市', '0');
INSERT INTO `ewei_district` VALUES ('529', '51', '南关区', '0');
INSERT INTO `ewei_district` VALUES ('530', '51', '宽城区', '0');
INSERT INTO `ewei_district` VALUES ('531', '51', '朝阳区', '0');
INSERT INTO `ewei_district` VALUES ('532', '51', '二道区', '0');
INSERT INTO `ewei_district` VALUES ('533', '51', '绿园区', '0');
INSERT INTO `ewei_district` VALUES ('534', '51', '双阳区', '0');
INSERT INTO `ewei_district` VALUES ('535', '51', '农安县', '0');
INSERT INTO `ewei_district` VALUES ('536', '51', '九台市', '0');
INSERT INTO `ewei_district` VALUES ('537', '51', '榆树市', '0');
INSERT INTO `ewei_district` VALUES ('538', '51', '德惠市', '0');
INSERT INTO `ewei_district` VALUES ('539', '52', '昌邑区', '0');
INSERT INTO `ewei_district` VALUES ('540', '52', '龙潭区', '0');
INSERT INTO `ewei_district` VALUES ('541', '52', '船营区', '0');
INSERT INTO `ewei_district` VALUES ('542', '52', '丰满区', '0');
INSERT INTO `ewei_district` VALUES ('543', '52', '永吉县', '0');
INSERT INTO `ewei_district` VALUES ('544', '52', '蛟河市', '0');
INSERT INTO `ewei_district` VALUES ('545', '52', '桦甸市', '0');
INSERT INTO `ewei_district` VALUES ('546', '52', '舒兰市', '0');
INSERT INTO `ewei_district` VALUES ('547', '52', '磐石市', '0');
INSERT INTO `ewei_district` VALUES ('548', '53', '铁西区', '0');
INSERT INTO `ewei_district` VALUES ('549', '53', '铁东区', '0');
INSERT INTO `ewei_district` VALUES ('550', '53', '梨树县', '0');
INSERT INTO `ewei_district` VALUES ('551', '53', '伊通满族自治县', '0');
INSERT INTO `ewei_district` VALUES ('552', '53', '公主岭市', '0');
INSERT INTO `ewei_district` VALUES ('553', '53', '双辽市', '0');
INSERT INTO `ewei_district` VALUES ('554', '54', '龙山区', '0');
INSERT INTO `ewei_district` VALUES ('555', '54', '西安区', '0');
INSERT INTO `ewei_district` VALUES ('556', '54', '东丰县', '0');
INSERT INTO `ewei_district` VALUES ('557', '54', '东辽县', '0');
INSERT INTO `ewei_district` VALUES ('558', '55', '东昌区', '0');
INSERT INTO `ewei_district` VALUES ('559', '55', '二道江区', '0');
INSERT INTO `ewei_district` VALUES ('560', '55', '通化县', '0');
INSERT INTO `ewei_district` VALUES ('561', '55', '辉南县', '0');
INSERT INTO `ewei_district` VALUES ('562', '55', '柳河县', '0');
INSERT INTO `ewei_district` VALUES ('563', '55', '梅河口市', '0');
INSERT INTO `ewei_district` VALUES ('564', '55', '集安市', '0');
INSERT INTO `ewei_district` VALUES ('565', '56', '八道江区', '0');
INSERT INTO `ewei_district` VALUES ('566', '56', '抚松县', '0');
INSERT INTO `ewei_district` VALUES ('567', '56', '靖宇县', '0');
INSERT INTO `ewei_district` VALUES ('568', '56', '长白朝鲜族自治县', '0');
INSERT INTO `ewei_district` VALUES ('569', '56', '江源县', '0');
INSERT INTO `ewei_district` VALUES ('570', '56', '临江市', '0');
INSERT INTO `ewei_district` VALUES ('571', '57', '宁江区', '0');
INSERT INTO `ewei_district` VALUES ('572', '57', '前郭尔罗斯蒙古族自治县', '0');
INSERT INTO `ewei_district` VALUES ('573', '57', '长岭县', '0');
INSERT INTO `ewei_district` VALUES ('574', '57', '乾安县', '0');
INSERT INTO `ewei_district` VALUES ('575', '57', '扶余县', '0');
INSERT INTO `ewei_district` VALUES ('576', '58', '洮北区', '0');
INSERT INTO `ewei_district` VALUES ('577', '58', '镇赉县', '0');
INSERT INTO `ewei_district` VALUES ('578', '58', '通榆县', '0');
INSERT INTO `ewei_district` VALUES ('579', '58', '洮南市', '0');
INSERT INTO `ewei_district` VALUES ('580', '58', '大安市', '0');
INSERT INTO `ewei_district` VALUES ('581', '59', '延吉市', '0');
INSERT INTO `ewei_district` VALUES ('582', '59', '图们市', '0');
INSERT INTO `ewei_district` VALUES ('583', '59', '敦化市', '0');
INSERT INTO `ewei_district` VALUES ('584', '59', '珲春市', '0');
INSERT INTO `ewei_district` VALUES ('585', '59', '龙井市', '0');
INSERT INTO `ewei_district` VALUES ('586', '59', '和龙市', '0');
INSERT INTO `ewei_district` VALUES ('587', '59', '汪清县', '0');
INSERT INTO `ewei_district` VALUES ('588', '59', '安图县', '0');
INSERT INTO `ewei_district` VALUES ('589', '60', '道里区', '0');
INSERT INTO `ewei_district` VALUES ('590', '60', '南岗区', '0');
INSERT INTO `ewei_district` VALUES ('591', '60', '道外区', '0');
INSERT INTO `ewei_district` VALUES ('592', '60', '香坊区', '0');
INSERT INTO `ewei_district` VALUES ('593', '60', '动力区', '0');
INSERT INTO `ewei_district` VALUES ('594', '60', '平房区', '0');
INSERT INTO `ewei_district` VALUES ('595', '60', '松北区', '0');
INSERT INTO `ewei_district` VALUES ('596', '60', '呼兰区', '0');
INSERT INTO `ewei_district` VALUES ('597', '60', '依兰县', '0');
INSERT INTO `ewei_district` VALUES ('598', '60', '方正县', '0');
INSERT INTO `ewei_district` VALUES ('599', '60', '宾县', '0');
INSERT INTO `ewei_district` VALUES ('600', '60', '巴彦县', '0');
INSERT INTO `ewei_district` VALUES ('601', '60', '木兰县', '0');
INSERT INTO `ewei_district` VALUES ('602', '60', '通河县', '0');
INSERT INTO `ewei_district` VALUES ('603', '60', '延寿县', '0');
INSERT INTO `ewei_district` VALUES ('604', '60', '阿城市', '0');
INSERT INTO `ewei_district` VALUES ('605', '60', '双城市', '0');
INSERT INTO `ewei_district` VALUES ('606', '60', '尚志市', '0');
INSERT INTO `ewei_district` VALUES ('607', '60', '五常市', '0');
INSERT INTO `ewei_district` VALUES ('608', '61', '龙沙区', '0');
INSERT INTO `ewei_district` VALUES ('609', '61', '建华区', '0');
INSERT INTO `ewei_district` VALUES ('610', '61', '铁锋区', '0');
INSERT INTO `ewei_district` VALUES ('611', '61', '昂昂溪区', '0');
INSERT INTO `ewei_district` VALUES ('612', '61', '富拉尔基区', '0');
INSERT INTO `ewei_district` VALUES ('613', '61', '碾子山区', '0');
INSERT INTO `ewei_district` VALUES ('614', '61', '梅里斯达斡尔族区', '0');
INSERT INTO `ewei_district` VALUES ('615', '61', '龙江县', '0');
INSERT INTO `ewei_district` VALUES ('616', '61', '依安县', '0');
INSERT INTO `ewei_district` VALUES ('617', '61', '泰来县', '0');
INSERT INTO `ewei_district` VALUES ('618', '61', '甘南县', '0');
INSERT INTO `ewei_district` VALUES ('619', '61', '富裕县', '0');
INSERT INTO `ewei_district` VALUES ('620', '61', '克山县', '0');
INSERT INTO `ewei_district` VALUES ('621', '61', '克东县', '0');
INSERT INTO `ewei_district` VALUES ('622', '61', '拜泉县', '0');
INSERT INTO `ewei_district` VALUES ('623', '61', '讷河市', '0');
INSERT INTO `ewei_district` VALUES ('624', '62', '鸡冠区', '0');
INSERT INTO `ewei_district` VALUES ('625', '62', '恒山区', '0');
INSERT INTO `ewei_district` VALUES ('626', '62', '滴道区', '0');
INSERT INTO `ewei_district` VALUES ('627', '62', '梨树区', '0');
INSERT INTO `ewei_district` VALUES ('628', '62', '城子河区', '0');
INSERT INTO `ewei_district` VALUES ('629', '62', '麻山区', '0');
INSERT INTO `ewei_district` VALUES ('630', '62', '鸡东县', '0');
INSERT INTO `ewei_district` VALUES ('631', '62', '虎林市', '0');
INSERT INTO `ewei_district` VALUES ('632', '62', '密山市', '0');
INSERT INTO `ewei_district` VALUES ('633', '63', '向阳区', '0');
INSERT INTO `ewei_district` VALUES ('634', '63', '工农区', '0');
INSERT INTO `ewei_district` VALUES ('635', '63', '南山区', '0');
INSERT INTO `ewei_district` VALUES ('636', '63', '兴安区', '0');
INSERT INTO `ewei_district` VALUES ('637', '63', '东山区', '0');
INSERT INTO `ewei_district` VALUES ('638', '63', '兴山区', '0');
INSERT INTO `ewei_district` VALUES ('639', '63', '萝北县', '0');
INSERT INTO `ewei_district` VALUES ('640', '63', '绥滨县', '0');
INSERT INTO `ewei_district` VALUES ('641', '64', '尖山区', '0');
INSERT INTO `ewei_district` VALUES ('642', '64', '岭东区', '0');
INSERT INTO `ewei_district` VALUES ('643', '64', '四方台区', '0');
INSERT INTO `ewei_district` VALUES ('644', '64', '宝山区', '0');
INSERT INTO `ewei_district` VALUES ('645', '64', '集贤县', '0');
INSERT INTO `ewei_district` VALUES ('646', '64', '友谊县', '0');
INSERT INTO `ewei_district` VALUES ('647', '64', '宝清县', '0');
INSERT INTO `ewei_district` VALUES ('648', '64', '饶河县', '0');
INSERT INTO `ewei_district` VALUES ('649', '65', '萨尔图区', '0');
INSERT INTO `ewei_district` VALUES ('650', '65', '龙凤区', '0');
INSERT INTO `ewei_district` VALUES ('651', '65', '让胡路区', '0');
INSERT INTO `ewei_district` VALUES ('652', '65', '红岗区', '0');
INSERT INTO `ewei_district` VALUES ('653', '65', '大同区', '0');
INSERT INTO `ewei_district` VALUES ('654', '65', '肇州县', '0');
INSERT INTO `ewei_district` VALUES ('655', '65', '肇源县', '0');
INSERT INTO `ewei_district` VALUES ('656', '65', '林甸县', '0');
INSERT INTO `ewei_district` VALUES ('657', '65', '杜尔伯特蒙古族自治县', '0');
INSERT INTO `ewei_district` VALUES ('658', '66', '伊春区', '0');
INSERT INTO `ewei_district` VALUES ('659', '66', '南岔区', '0');
INSERT INTO `ewei_district` VALUES ('660', '66', '友好区', '0');
INSERT INTO `ewei_district` VALUES ('661', '66', '西林区', '0');
INSERT INTO `ewei_district` VALUES ('662', '66', '翠峦区', '0');
INSERT INTO `ewei_district` VALUES ('663', '66', '新青区', '0');
INSERT INTO `ewei_district` VALUES ('664', '66', '美溪区', '0');
INSERT INTO `ewei_district` VALUES ('665', '66', '金山屯区', '0');
INSERT INTO `ewei_district` VALUES ('666', '66', '五营区', '0');
INSERT INTO `ewei_district` VALUES ('667', '66', '乌马河区', '0');
INSERT INTO `ewei_district` VALUES ('668', '66', '汤旺河区', '0');
INSERT INTO `ewei_district` VALUES ('669', '66', '带岭区', '0');
INSERT INTO `ewei_district` VALUES ('670', '66', '乌伊岭区', '0');
INSERT INTO `ewei_district` VALUES ('671', '66', '红星区', '0');
INSERT INTO `ewei_district` VALUES ('672', '66', '上甘岭区', '0');
INSERT INTO `ewei_district` VALUES ('673', '66', '嘉荫县', '0');
INSERT INTO `ewei_district` VALUES ('674', '66', '铁力市', '0');
INSERT INTO `ewei_district` VALUES ('675', '67', '永红区', '0');
INSERT INTO `ewei_district` VALUES ('676', '67', '向阳区', '0');
INSERT INTO `ewei_district` VALUES ('677', '67', '前进区', '0');
INSERT INTO `ewei_district` VALUES ('678', '67', '东风区', '0');
INSERT INTO `ewei_district` VALUES ('679', '67', '郊区', '0');
INSERT INTO `ewei_district` VALUES ('680', '67', '桦南县', '0');
INSERT INTO `ewei_district` VALUES ('681', '67', '桦川县', '0');
INSERT INTO `ewei_district` VALUES ('682', '67', '汤原县', '0');
INSERT INTO `ewei_district` VALUES ('683', '67', '抚远县', '0');
INSERT INTO `ewei_district` VALUES ('684', '67', '同江市', '0');
INSERT INTO `ewei_district` VALUES ('685', '67', '富锦市', '0');
INSERT INTO `ewei_district` VALUES ('686', '68', '新兴区', '0');
INSERT INTO `ewei_district` VALUES ('687', '68', '桃山区', '0');
INSERT INTO `ewei_district` VALUES ('688', '68', '茄子河区', '0');
INSERT INTO `ewei_district` VALUES ('689', '68', '勃利县', '0');
INSERT INTO `ewei_district` VALUES ('690', '69', '东安区', '0');
INSERT INTO `ewei_district` VALUES ('691', '69', '阳明区', '0');
INSERT INTO `ewei_district` VALUES ('692', '69', '爱民区', '0');
INSERT INTO `ewei_district` VALUES ('693', '69', '西安区', '0');
INSERT INTO `ewei_district` VALUES ('694', '69', '东宁县', '0');
INSERT INTO `ewei_district` VALUES ('695', '69', '林口县', '0');
INSERT INTO `ewei_district` VALUES ('696', '69', '绥芬河市', '0');
INSERT INTO `ewei_district` VALUES ('697', '69', '海林市', '0');
INSERT INTO `ewei_district` VALUES ('698', '69', '宁安市', '0');
INSERT INTO `ewei_district` VALUES ('699', '69', '穆棱市', '0');
INSERT INTO `ewei_district` VALUES ('700', '70', '爱辉区', '0');
INSERT INTO `ewei_district` VALUES ('701', '70', '嫩江县', '0');
INSERT INTO `ewei_district` VALUES ('702', '70', '逊克县', '0');
INSERT INTO `ewei_district` VALUES ('703', '70', '孙吴县', '0');
INSERT INTO `ewei_district` VALUES ('704', '70', '北安市', '0');
INSERT INTO `ewei_district` VALUES ('705', '70', '五大连池市', '0');
INSERT INTO `ewei_district` VALUES ('706', '71', '北林区', '0');
INSERT INTO `ewei_district` VALUES ('707', '71', '望奎县', '0');
INSERT INTO `ewei_district` VALUES ('708', '71', '兰西县', '0');
INSERT INTO `ewei_district` VALUES ('709', '71', '青冈县', '0');
INSERT INTO `ewei_district` VALUES ('710', '71', '庆安县', '0');
INSERT INTO `ewei_district` VALUES ('711', '71', '明水县', '0');
INSERT INTO `ewei_district` VALUES ('712', '71', '绥棱县', '0');
INSERT INTO `ewei_district` VALUES ('713', '71', '安达市', '0');
INSERT INTO `ewei_district` VALUES ('714', '71', '肇东市', '0');
INSERT INTO `ewei_district` VALUES ('715', '71', '海伦市', '0');
INSERT INTO `ewei_district` VALUES ('716', '72', '呼玛县', '0');
INSERT INTO `ewei_district` VALUES ('717', '72', '塔河县', '0');
INSERT INTO `ewei_district` VALUES ('718', '72', '漠河县', '0');
INSERT INTO `ewei_district` VALUES ('719', '73', '黄浦区', '0');
INSERT INTO `ewei_district` VALUES ('720', '73', '卢湾区', '0');
INSERT INTO `ewei_district` VALUES ('721', '73', '徐汇区', '0');
INSERT INTO `ewei_district` VALUES ('722', '73', '长宁区', '0');
INSERT INTO `ewei_district` VALUES ('723', '73', '静安区', '0');
INSERT INTO `ewei_district` VALUES ('724', '73', '普陀区', '0');
INSERT INTO `ewei_district` VALUES ('725', '73', '闸北区', '0');
INSERT INTO `ewei_district` VALUES ('726', '73', '虹口区', '0');
INSERT INTO `ewei_district` VALUES ('727', '73', '杨浦区', '0');
INSERT INTO `ewei_district` VALUES ('728', '73', '闵行区', '0');
INSERT INTO `ewei_district` VALUES ('729', '73', '宝山区', '0');
INSERT INTO `ewei_district` VALUES ('730', '73', '嘉定区', '0');
INSERT INTO `ewei_district` VALUES ('731', '73', '浦东新区', '0');
INSERT INTO `ewei_district` VALUES ('732', '73', '金山区', '0');
INSERT INTO `ewei_district` VALUES ('733', '73', '松江区', '0');
INSERT INTO `ewei_district` VALUES ('734', '73', '青浦区', '0');
INSERT INTO `ewei_district` VALUES ('735', '73', '南汇区', '0');
INSERT INTO `ewei_district` VALUES ('736', '73', '奉贤区', '0');
INSERT INTO `ewei_district` VALUES ('737', '73', '崇明县', '0');
INSERT INTO `ewei_district` VALUES ('738', '74', '玄武区', '0');
INSERT INTO `ewei_district` VALUES ('739', '74', '白下区', '0');
INSERT INTO `ewei_district` VALUES ('740', '74', '秦淮区', '0');
INSERT INTO `ewei_district` VALUES ('741', '74', '建邺区', '0');
INSERT INTO `ewei_district` VALUES ('742', '74', '鼓楼区', '0');
INSERT INTO `ewei_district` VALUES ('743', '74', '下关区', '0');
INSERT INTO `ewei_district` VALUES ('744', '74', '浦口区', '0');
INSERT INTO `ewei_district` VALUES ('745', '74', '栖霞区', '0');
INSERT INTO `ewei_district` VALUES ('746', '74', '雨花台区', '0');
INSERT INTO `ewei_district` VALUES ('747', '74', '江宁区', '0');
INSERT INTO `ewei_district` VALUES ('748', '74', '六合区', '0');
INSERT INTO `ewei_district` VALUES ('749', '74', '溧水县', '0');
INSERT INTO `ewei_district` VALUES ('750', '74', '高淳县', '0');
INSERT INTO `ewei_district` VALUES ('751', '75', '崇安区', '0');
INSERT INTO `ewei_district` VALUES ('752', '75', '南长区', '0');
INSERT INTO `ewei_district` VALUES ('753', '75', '北塘区', '0');
INSERT INTO `ewei_district` VALUES ('754', '75', '锡山区', '0');
INSERT INTO `ewei_district` VALUES ('755', '75', '惠山区', '0');
INSERT INTO `ewei_district` VALUES ('756', '75', '滨湖区', '0');
INSERT INTO `ewei_district` VALUES ('757', '75', '江阴市', '0');
INSERT INTO `ewei_district` VALUES ('758', '75', '宜兴市', '0');
INSERT INTO `ewei_district` VALUES ('759', '76', '鼓楼区', '0');
INSERT INTO `ewei_district` VALUES ('760', '76', '云龙区', '0');
INSERT INTO `ewei_district` VALUES ('761', '76', '九里区', '0');
INSERT INTO `ewei_district` VALUES ('762', '76', '贾汪区', '0');
INSERT INTO `ewei_district` VALUES ('763', '76', '泉山区', '0');
INSERT INTO `ewei_district` VALUES ('764', '76', '丰县', '0');
INSERT INTO `ewei_district` VALUES ('765', '76', '沛县', '0');
INSERT INTO `ewei_district` VALUES ('766', '76', '铜山县', '0');
INSERT INTO `ewei_district` VALUES ('767', '76', '睢宁县', '0');
INSERT INTO `ewei_district` VALUES ('768', '76', '新沂市', '0');
INSERT INTO `ewei_district` VALUES ('769', '76', '邳州市', '0');
INSERT INTO `ewei_district` VALUES ('770', '77', '天宁区', '0');
INSERT INTO `ewei_district` VALUES ('771', '77', '钟楼区', '0');
INSERT INTO `ewei_district` VALUES ('772', '77', '戚墅堰区', '0');
INSERT INTO `ewei_district` VALUES ('773', '77', '新北区', '0');
INSERT INTO `ewei_district` VALUES ('774', '77', '武进区', '0');
INSERT INTO `ewei_district` VALUES ('775', '77', '溧阳市', '0');
INSERT INTO `ewei_district` VALUES ('776', '77', '金坛市', '0');
INSERT INTO `ewei_district` VALUES ('777', '78', '沧浪区', '0');
INSERT INTO `ewei_district` VALUES ('778', '78', '平江区', '0');
INSERT INTO `ewei_district` VALUES ('779', '78', '金阊区', '0');
INSERT INTO `ewei_district` VALUES ('780', '78', '虎丘区', '0');
INSERT INTO `ewei_district` VALUES ('781', '78', '吴中区', '0');
INSERT INTO `ewei_district` VALUES ('782', '78', '相城区', '0');
INSERT INTO `ewei_district` VALUES ('783', '78', '常熟市', '0');
INSERT INTO `ewei_district` VALUES ('784', '78', '张家港市', '0');
INSERT INTO `ewei_district` VALUES ('785', '78', '昆山市', '0');
INSERT INTO `ewei_district` VALUES ('786', '78', '吴江市', '0');
INSERT INTO `ewei_district` VALUES ('787', '78', '太仓市', '0');
INSERT INTO `ewei_district` VALUES ('788', '79', '崇川区', '0');
INSERT INTO `ewei_district` VALUES ('789', '79', '港闸区', '0');
INSERT INTO `ewei_district` VALUES ('790', '79', '海安县', '0');
INSERT INTO `ewei_district` VALUES ('791', '79', '如东县', '0');
INSERT INTO `ewei_district` VALUES ('792', '79', '启东市', '0');
INSERT INTO `ewei_district` VALUES ('793', '79', '如皋市', '0');
INSERT INTO `ewei_district` VALUES ('794', '79', '通州市', '0');
INSERT INTO `ewei_district` VALUES ('795', '79', '海门市', '0');
INSERT INTO `ewei_district` VALUES ('796', '80', '连云区', '0');
INSERT INTO `ewei_district` VALUES ('797', '80', '新浦区', '0');
INSERT INTO `ewei_district` VALUES ('798', '80', '海州区', '0');
INSERT INTO `ewei_district` VALUES ('799', '80', '赣榆县', '0');
INSERT INTO `ewei_district` VALUES ('800', '80', '东海县', '0');
INSERT INTO `ewei_district` VALUES ('801', '80', '灌云县', '0');
INSERT INTO `ewei_district` VALUES ('802', '80', '灌南县', '0');
INSERT INTO `ewei_district` VALUES ('803', '81', '清河区', '0');
INSERT INTO `ewei_district` VALUES ('804', '81', '楚州区', '0');
INSERT INTO `ewei_district` VALUES ('805', '81', '淮阴区', '0');
INSERT INTO `ewei_district` VALUES ('806', '81', '清浦区', '0');
INSERT INTO `ewei_district` VALUES ('807', '81', '涟水县', '0');
INSERT INTO `ewei_district` VALUES ('808', '81', '洪泽县', '0');
INSERT INTO `ewei_district` VALUES ('809', '81', '盱眙县', '0');
INSERT INTO `ewei_district` VALUES ('810', '81', '金湖县', '0');
INSERT INTO `ewei_district` VALUES ('811', '82', '亭湖区', '0');
INSERT INTO `ewei_district` VALUES ('812', '82', '盐都区', '0');
INSERT INTO `ewei_district` VALUES ('813', '82', '响水县', '0');
INSERT INTO `ewei_district` VALUES ('814', '82', '滨海县', '0');
INSERT INTO `ewei_district` VALUES ('815', '82', '阜宁县', '0');
INSERT INTO `ewei_district` VALUES ('816', '82', '射阳县', '0');
INSERT INTO `ewei_district` VALUES ('817', '82', '建湖县', '0');
INSERT INTO `ewei_district` VALUES ('818', '82', '东台市', '0');
INSERT INTO `ewei_district` VALUES ('819', '82', '大丰市', '0');
INSERT INTO `ewei_district` VALUES ('820', '83', '广陵区', '0');
INSERT INTO `ewei_district` VALUES ('821', '83', '邗江区', '0');
INSERT INTO `ewei_district` VALUES ('822', '83', '维扬区', '0');
INSERT INTO `ewei_district` VALUES ('823', '83', '宝应县', '0');
INSERT INTO `ewei_district` VALUES ('824', '83', '仪征市', '0');
INSERT INTO `ewei_district` VALUES ('825', '83', '高邮市', '0');
INSERT INTO `ewei_district` VALUES ('826', '83', '江都市', '0');
INSERT INTO `ewei_district` VALUES ('827', '84', '京口区', '0');
INSERT INTO `ewei_district` VALUES ('828', '84', '润州区', '0');
INSERT INTO `ewei_district` VALUES ('829', '84', '丹徒区', '0');
INSERT INTO `ewei_district` VALUES ('830', '84', '丹阳市', '0');
INSERT INTO `ewei_district` VALUES ('831', '84', '扬中市', '0');
INSERT INTO `ewei_district` VALUES ('832', '84', '句容市', '0');
INSERT INTO `ewei_district` VALUES ('833', '85', '海陵区', '0');
INSERT INTO `ewei_district` VALUES ('834', '85', '高港区', '0');
INSERT INTO `ewei_district` VALUES ('835', '85', '兴化市', '0');
INSERT INTO `ewei_district` VALUES ('836', '85', '靖江市', '0');
INSERT INTO `ewei_district` VALUES ('837', '85', '泰兴市', '0');
INSERT INTO `ewei_district` VALUES ('838', '85', '姜堰市', '0');
INSERT INTO `ewei_district` VALUES ('839', '86', '宿城区', '0');
INSERT INTO `ewei_district` VALUES ('840', '86', '宿豫区', '0');
INSERT INTO `ewei_district` VALUES ('841', '86', '沭阳县', '0');
INSERT INTO `ewei_district` VALUES ('842', '86', '泗阳县', '0');
INSERT INTO `ewei_district` VALUES ('843', '86', '泗洪县', '0');
INSERT INTO `ewei_district` VALUES ('844', '87', '上城区', '0');
INSERT INTO `ewei_district` VALUES ('845', '87', '下城区', '0');
INSERT INTO `ewei_district` VALUES ('846', '87', '江干区', '0');
INSERT INTO `ewei_district` VALUES ('847', '87', '拱墅区', '0');
INSERT INTO `ewei_district` VALUES ('848', '87', '西湖区', '0');
INSERT INTO `ewei_district` VALUES ('849', '87', '滨江区', '0');
INSERT INTO `ewei_district` VALUES ('850', '87', '萧山区', '0');
INSERT INTO `ewei_district` VALUES ('851', '87', '余杭区', '0');
INSERT INTO `ewei_district` VALUES ('852', '87', '桐庐县', '0');
INSERT INTO `ewei_district` VALUES ('853', '87', '淳安县', '0');
INSERT INTO `ewei_district` VALUES ('854', '87', '建德市', '0');
INSERT INTO `ewei_district` VALUES ('855', '87', '富阳市', '0');
INSERT INTO `ewei_district` VALUES ('856', '87', '临安市', '0');
INSERT INTO `ewei_district` VALUES ('857', '88', '海曙区', '0');
INSERT INTO `ewei_district` VALUES ('858', '88', '江东区', '0');
INSERT INTO `ewei_district` VALUES ('859', '88', '江北区', '0');
INSERT INTO `ewei_district` VALUES ('860', '88', '北仑区', '0');
INSERT INTO `ewei_district` VALUES ('861', '88', '镇海区', '0');
INSERT INTO `ewei_district` VALUES ('862', '88', '鄞州区', '0');
INSERT INTO `ewei_district` VALUES ('863', '88', '象山县', '0');
INSERT INTO `ewei_district` VALUES ('864', '88', '宁海县', '0');
INSERT INTO `ewei_district` VALUES ('865', '88', '余姚市', '0');
INSERT INTO `ewei_district` VALUES ('866', '88', '慈溪市', '0');
INSERT INTO `ewei_district` VALUES ('867', '88', '奉化市', '0');
INSERT INTO `ewei_district` VALUES ('868', '89', '鹿城区', '0');
INSERT INTO `ewei_district` VALUES ('869', '89', '龙湾区', '0');
INSERT INTO `ewei_district` VALUES ('870', '89', '瓯海区', '0');
INSERT INTO `ewei_district` VALUES ('871', '89', '洞头县', '0');
INSERT INTO `ewei_district` VALUES ('872', '89', '永嘉县', '0');
INSERT INTO `ewei_district` VALUES ('873', '89', '平阳县', '0');
INSERT INTO `ewei_district` VALUES ('874', '89', '苍南县', '0');
INSERT INTO `ewei_district` VALUES ('875', '89', '文成县', '0');
INSERT INTO `ewei_district` VALUES ('876', '89', '泰顺县', '0');
INSERT INTO `ewei_district` VALUES ('877', '89', '瑞安市', '0');
INSERT INTO `ewei_district` VALUES ('878', '89', '乐清市', '0');
INSERT INTO `ewei_district` VALUES ('879', '90', '秀城区', '0');
INSERT INTO `ewei_district` VALUES ('880', '90', '秀洲区', '0');
INSERT INTO `ewei_district` VALUES ('881', '90', '嘉善县', '0');
INSERT INTO `ewei_district` VALUES ('882', '90', '海盐县', '0');
INSERT INTO `ewei_district` VALUES ('883', '90', '海宁市', '0');
INSERT INTO `ewei_district` VALUES ('884', '90', '平湖市', '0');
INSERT INTO `ewei_district` VALUES ('885', '90', '桐乡市', '0');
INSERT INTO `ewei_district` VALUES ('886', '91', '吴兴区', '0');
INSERT INTO `ewei_district` VALUES ('887', '91', '南浔区', '0');
INSERT INTO `ewei_district` VALUES ('888', '91', '德清县', '0');
INSERT INTO `ewei_district` VALUES ('889', '91', '长兴县', '0');
INSERT INTO `ewei_district` VALUES ('890', '91', '安吉县', '0');
INSERT INTO `ewei_district` VALUES ('891', '92', '越城区', '0');
INSERT INTO `ewei_district` VALUES ('892', '92', '绍兴县', '0');
INSERT INTO `ewei_district` VALUES ('893', '92', '新昌县', '0');
INSERT INTO `ewei_district` VALUES ('894', '92', '诸暨市', '0');
INSERT INTO `ewei_district` VALUES ('895', '92', '上虞市', '0');
INSERT INTO `ewei_district` VALUES ('896', '92', '嵊州市', '0');
INSERT INTO `ewei_district` VALUES ('897', '93', '婺城区', '0');
INSERT INTO `ewei_district` VALUES ('898', '93', '金东区', '0');
INSERT INTO `ewei_district` VALUES ('899', '93', '武义县', '0');
INSERT INTO `ewei_district` VALUES ('900', '93', '浦江县', '0');
INSERT INTO `ewei_district` VALUES ('901', '93', '磐安县', '0');
INSERT INTO `ewei_district` VALUES ('902', '93', '兰溪市', '0');
INSERT INTO `ewei_district` VALUES ('903', '93', '义乌市', '0');
INSERT INTO `ewei_district` VALUES ('904', '93', '东阳市', '0');
INSERT INTO `ewei_district` VALUES ('905', '93', '永康市', '0');
INSERT INTO `ewei_district` VALUES ('906', '94', '柯城区', '0');
INSERT INTO `ewei_district` VALUES ('907', '94', '衢江区', '0');
INSERT INTO `ewei_district` VALUES ('908', '94', '常山县', '0');
INSERT INTO `ewei_district` VALUES ('909', '94', '开化县', '0');
INSERT INTO `ewei_district` VALUES ('910', '94', '龙游县', '0');
INSERT INTO `ewei_district` VALUES ('911', '94', '江山市', '0');
INSERT INTO `ewei_district` VALUES ('912', '95', '定海区', '0');
INSERT INTO `ewei_district` VALUES ('913', '95', '普陀区', '0');
INSERT INTO `ewei_district` VALUES ('914', '95', '岱山县', '0');
INSERT INTO `ewei_district` VALUES ('915', '95', '嵊泗县', '0');
INSERT INTO `ewei_district` VALUES ('916', '96', '椒江区', '0');
INSERT INTO `ewei_district` VALUES ('917', '96', '黄岩区', '0');
INSERT INTO `ewei_district` VALUES ('918', '96', '路桥区', '0');
INSERT INTO `ewei_district` VALUES ('919', '96', '玉环县', '0');
INSERT INTO `ewei_district` VALUES ('920', '96', '三门县', '0');
INSERT INTO `ewei_district` VALUES ('921', '96', '天台县', '0');
INSERT INTO `ewei_district` VALUES ('922', '96', '仙居县', '0');
INSERT INTO `ewei_district` VALUES ('923', '96', '温岭市', '0');
INSERT INTO `ewei_district` VALUES ('924', '96', '临海市', '0');
INSERT INTO `ewei_district` VALUES ('925', '97', '莲都区', '0');
INSERT INTO `ewei_district` VALUES ('926', '97', '青田县', '0');
INSERT INTO `ewei_district` VALUES ('927', '97', '缙云县', '0');
INSERT INTO `ewei_district` VALUES ('928', '97', '遂昌县', '0');
INSERT INTO `ewei_district` VALUES ('929', '97', '松阳县', '0');
INSERT INTO `ewei_district` VALUES ('930', '97', '云和县', '0');
INSERT INTO `ewei_district` VALUES ('931', '97', '庆元县', '0');
INSERT INTO `ewei_district` VALUES ('932', '97', '景宁畲族自治县', '0');
INSERT INTO `ewei_district` VALUES ('933', '97', '龙泉市', '0');
INSERT INTO `ewei_district` VALUES ('934', '98', '瑶海区', '0');
INSERT INTO `ewei_district` VALUES ('935', '98', '庐阳区', '0');
INSERT INTO `ewei_district` VALUES ('936', '98', '蜀山区', '0');
INSERT INTO `ewei_district` VALUES ('937', '98', '包河区', '0');
INSERT INTO `ewei_district` VALUES ('938', '98', '长丰县', '0');
INSERT INTO `ewei_district` VALUES ('939', '98', '肥东县', '0');
INSERT INTO `ewei_district` VALUES ('940', '98', '肥西县', '0');
INSERT INTO `ewei_district` VALUES ('941', '99', '镜湖区', '0');
INSERT INTO `ewei_district` VALUES ('942', '99', '马塘区', '0');
INSERT INTO `ewei_district` VALUES ('943', '99', '新芜区', '0');
INSERT INTO `ewei_district` VALUES ('944', '99', '鸠江区', '0');
INSERT INTO `ewei_district` VALUES ('945', '99', '芜湖县', '0');
INSERT INTO `ewei_district` VALUES ('946', '99', '繁昌县', '0');
INSERT INTO `ewei_district` VALUES ('947', '99', '南陵县', '0');
INSERT INTO `ewei_district` VALUES ('948', '100', '龙子湖区', '0');
INSERT INTO `ewei_district` VALUES ('949', '100', '蚌山区', '0');
INSERT INTO `ewei_district` VALUES ('950', '100', '禹会区', '0');
INSERT INTO `ewei_district` VALUES ('951', '100', '淮上区', '0');
INSERT INTO `ewei_district` VALUES ('952', '100', '怀远县', '0');
INSERT INTO `ewei_district` VALUES ('953', '100', '五河县', '0');
INSERT INTO `ewei_district` VALUES ('954', '100', '固镇县', '0');
INSERT INTO `ewei_district` VALUES ('955', '101', '大通区', '0');
INSERT INTO `ewei_district` VALUES ('956', '101', '田家庵区', '0');
INSERT INTO `ewei_district` VALUES ('957', '101', '谢家集区', '0');
INSERT INTO `ewei_district` VALUES ('958', '101', '八公山区', '0');
INSERT INTO `ewei_district` VALUES ('959', '101', '潘集区', '0');
INSERT INTO `ewei_district` VALUES ('960', '101', '凤台县', '0');
INSERT INTO `ewei_district` VALUES ('961', '102', '金家庄区', '0');
INSERT INTO `ewei_district` VALUES ('962', '102', '花山区', '0');
INSERT INTO `ewei_district` VALUES ('963', '102', '雨山区', '0');
INSERT INTO `ewei_district` VALUES ('964', '102', '当涂县', '0');
INSERT INTO `ewei_district` VALUES ('965', '103', '杜集区', '0');
INSERT INTO `ewei_district` VALUES ('966', '103', '相山区', '0');
INSERT INTO `ewei_district` VALUES ('967', '103', '烈山区', '0');
INSERT INTO `ewei_district` VALUES ('968', '103', '濉溪县', '0');
INSERT INTO `ewei_district` VALUES ('969', '104', '铜官山区', '0');
INSERT INTO `ewei_district` VALUES ('970', '104', '狮子山区', '0');
INSERT INTO `ewei_district` VALUES ('971', '104', '郊区', '0');
INSERT INTO `ewei_district` VALUES ('972', '104', '铜陵县', '0');
INSERT INTO `ewei_district` VALUES ('973', '105', '迎江区', '0');
INSERT INTO `ewei_district` VALUES ('974', '105', '大观区', '0');
INSERT INTO `ewei_district` VALUES ('975', '105', '郊区', '0');
INSERT INTO `ewei_district` VALUES ('976', '105', '怀宁县', '0');
INSERT INTO `ewei_district` VALUES ('977', '105', '枞阳县', '0');
INSERT INTO `ewei_district` VALUES ('978', '105', '潜山县', '0');
INSERT INTO `ewei_district` VALUES ('979', '105', '太湖县', '0');
INSERT INTO `ewei_district` VALUES ('980', '105', '宿松县', '0');
INSERT INTO `ewei_district` VALUES ('981', '105', '望江县', '0');
INSERT INTO `ewei_district` VALUES ('982', '105', '岳西县', '0');
INSERT INTO `ewei_district` VALUES ('983', '105', '桐城市', '0');
INSERT INTO `ewei_district` VALUES ('984', '106', '屯溪区', '0');
INSERT INTO `ewei_district` VALUES ('985', '106', '黄山区', '0');
INSERT INTO `ewei_district` VALUES ('986', '106', '徽州区', '0');
INSERT INTO `ewei_district` VALUES ('987', '106', '歙县', '0');
INSERT INTO `ewei_district` VALUES ('988', '106', '休宁县', '0');
INSERT INTO `ewei_district` VALUES ('989', '106', '黟县', '0');
INSERT INTO `ewei_district` VALUES ('990', '106', '祁门县', '0');
INSERT INTO `ewei_district` VALUES ('991', '107', '琅琊区', '0');
INSERT INTO `ewei_district` VALUES ('992', '107', '南谯区', '0');
INSERT INTO `ewei_district` VALUES ('993', '107', '来安县', '0');
INSERT INTO `ewei_district` VALUES ('994', '107', '全椒县', '0');
INSERT INTO `ewei_district` VALUES ('995', '107', '定远县', '0');
INSERT INTO `ewei_district` VALUES ('996', '107', '凤阳县', '0');
INSERT INTO `ewei_district` VALUES ('997', '107', '天长市', '0');
INSERT INTO `ewei_district` VALUES ('998', '107', '明光市', '0');
INSERT INTO `ewei_district` VALUES ('999', '108', '颍州区', '0');
INSERT INTO `ewei_district` VALUES ('1000', '108', '颍东区', '0');
INSERT INTO `ewei_district` VALUES ('1001', '108', '颍泉区', '0');
INSERT INTO `ewei_district` VALUES ('1002', '108', '临泉县', '0');
INSERT INTO `ewei_district` VALUES ('1003', '108', '太和县', '0');
INSERT INTO `ewei_district` VALUES ('1004', '108', '阜南县', '0');
INSERT INTO `ewei_district` VALUES ('1005', '108', '颍上县', '0');
INSERT INTO `ewei_district` VALUES ('1006', '108', '界首市', '0');
INSERT INTO `ewei_district` VALUES ('1007', '109', '埇桥区', '0');
INSERT INTO `ewei_district` VALUES ('1008', '109', '砀山县', '0');
INSERT INTO `ewei_district` VALUES ('1009', '109', '萧县', '0');
INSERT INTO `ewei_district` VALUES ('1010', '109', '灵璧县', '0');
INSERT INTO `ewei_district` VALUES ('1011', '109', '泗县', '0');
INSERT INTO `ewei_district` VALUES ('1012', '110', '居巢区', '0');
INSERT INTO `ewei_district` VALUES ('1013', '110', '庐江县', '0');
INSERT INTO `ewei_district` VALUES ('1014', '110', '无为县', '0');
INSERT INTO `ewei_district` VALUES ('1015', '110', '含山县', '0');
INSERT INTO `ewei_district` VALUES ('1016', '110', '和县', '0');
INSERT INTO `ewei_district` VALUES ('1017', '111', '金安区', '0');
INSERT INTO `ewei_district` VALUES ('1018', '111', '裕安区', '0');
INSERT INTO `ewei_district` VALUES ('1019', '111', '寿县', '0');
INSERT INTO `ewei_district` VALUES ('1020', '111', '霍邱县', '0');
INSERT INTO `ewei_district` VALUES ('1021', '111', '舒城县', '0');
INSERT INTO `ewei_district` VALUES ('1022', '111', '金寨县', '0');
INSERT INTO `ewei_district` VALUES ('1023', '111', '霍山县', '0');
INSERT INTO `ewei_district` VALUES ('1024', '112', '谯城区', '0');
INSERT INTO `ewei_district` VALUES ('1025', '112', '涡阳县', '0');
INSERT INTO `ewei_district` VALUES ('1026', '112', '蒙城县', '0');
INSERT INTO `ewei_district` VALUES ('1027', '112', '利辛县', '0');
INSERT INTO `ewei_district` VALUES ('1028', '113', '贵池区', '0');
INSERT INTO `ewei_district` VALUES ('1029', '113', '东至县', '0');
INSERT INTO `ewei_district` VALUES ('1030', '113', '石台县', '0');
INSERT INTO `ewei_district` VALUES ('1031', '113', '青阳县', '0');
INSERT INTO `ewei_district` VALUES ('1032', '114', '宣州区', '0');
INSERT INTO `ewei_district` VALUES ('1033', '114', '郎溪县', '0');
INSERT INTO `ewei_district` VALUES ('1034', '114', '广德县', '0');
INSERT INTO `ewei_district` VALUES ('1035', '114', '泾县', '0');
INSERT INTO `ewei_district` VALUES ('1036', '114', '绩溪县', '0');
INSERT INTO `ewei_district` VALUES ('1037', '114', '旌德县', '0');
INSERT INTO `ewei_district` VALUES ('1038', '114', '宁国市', '0');
INSERT INTO `ewei_district` VALUES ('1039', '115', '鼓楼区', '0');
INSERT INTO `ewei_district` VALUES ('1040', '115', '台江区', '0');
INSERT INTO `ewei_district` VALUES ('1041', '115', '仓山区', '0');
INSERT INTO `ewei_district` VALUES ('1042', '115', '马尾区', '0');
INSERT INTO `ewei_district` VALUES ('1043', '115', '晋安区', '0');
INSERT INTO `ewei_district` VALUES ('1044', '115', '闽侯县', '0');
INSERT INTO `ewei_district` VALUES ('1045', '115', '连江县', '0');
INSERT INTO `ewei_district` VALUES ('1046', '115', '罗源县', '0');
INSERT INTO `ewei_district` VALUES ('1047', '115', '闽清县', '0');
INSERT INTO `ewei_district` VALUES ('1048', '115', '永泰县', '0');
INSERT INTO `ewei_district` VALUES ('1049', '115', '平潭县', '0');
INSERT INTO `ewei_district` VALUES ('1050', '115', '福清市', '0');
INSERT INTO `ewei_district` VALUES ('1051', '115', '长乐市', '0');
INSERT INTO `ewei_district` VALUES ('1052', '116', '思明区', '0');
INSERT INTO `ewei_district` VALUES ('1053', '116', '海沧区', '0');
INSERT INTO `ewei_district` VALUES ('1054', '116', '湖里区', '0');
INSERT INTO `ewei_district` VALUES ('1055', '116', '集美区', '0');
INSERT INTO `ewei_district` VALUES ('1056', '116', '同安区', '0');
INSERT INTO `ewei_district` VALUES ('1057', '116', '翔安区', '0');
INSERT INTO `ewei_district` VALUES ('1058', '117', '城厢区', '0');
INSERT INTO `ewei_district` VALUES ('1059', '117', '涵江区', '0');
INSERT INTO `ewei_district` VALUES ('1060', '117', '荔城区', '0');
INSERT INTO `ewei_district` VALUES ('1061', '117', '秀屿区', '0');
INSERT INTO `ewei_district` VALUES ('1062', '117', '仙游县', '0');
INSERT INTO `ewei_district` VALUES ('1063', '118', '梅列区', '0');
INSERT INTO `ewei_district` VALUES ('1064', '118', '三元区', '0');
INSERT INTO `ewei_district` VALUES ('1065', '118', '明溪县', '0');
INSERT INTO `ewei_district` VALUES ('1066', '118', '清流县', '0');
INSERT INTO `ewei_district` VALUES ('1067', '118', '宁化县', '0');
INSERT INTO `ewei_district` VALUES ('1068', '118', '大田县', '0');
INSERT INTO `ewei_district` VALUES ('1069', '118', '尤溪县', '0');
INSERT INTO `ewei_district` VALUES ('1070', '118', '沙县', '0');
INSERT INTO `ewei_district` VALUES ('1071', '118', '将乐县', '0');
INSERT INTO `ewei_district` VALUES ('1072', '118', '泰宁县', '0');
INSERT INTO `ewei_district` VALUES ('1073', '118', '建宁县', '0');
INSERT INTO `ewei_district` VALUES ('1074', '118', '永安市', '0');
INSERT INTO `ewei_district` VALUES ('1075', '119', '鲤城区', '0');
INSERT INTO `ewei_district` VALUES ('1076', '119', '丰泽区', '0');
INSERT INTO `ewei_district` VALUES ('1077', '119', '洛江区', '0');
INSERT INTO `ewei_district` VALUES ('1078', '119', '泉港区', '0');
INSERT INTO `ewei_district` VALUES ('1079', '119', '惠安县', '0');
INSERT INTO `ewei_district` VALUES ('1080', '119', '安溪县', '0');
INSERT INTO `ewei_district` VALUES ('1081', '119', '永春县', '0');
INSERT INTO `ewei_district` VALUES ('1082', '119', '德化县', '0');
INSERT INTO `ewei_district` VALUES ('1083', '119', '金门县', '0');
INSERT INTO `ewei_district` VALUES ('1084', '119', '石狮市', '0');
INSERT INTO `ewei_district` VALUES ('1085', '119', '晋江市', '0');
INSERT INTO `ewei_district` VALUES ('1086', '119', '南安市', '0');
INSERT INTO `ewei_district` VALUES ('1087', '120', '芗城区', '0');
INSERT INTO `ewei_district` VALUES ('1088', '120', '龙文区', '0');
INSERT INTO `ewei_district` VALUES ('1089', '120', '云霄县', '0');
INSERT INTO `ewei_district` VALUES ('1090', '120', '漳浦县', '0');
INSERT INTO `ewei_district` VALUES ('1091', '120', '诏安县', '0');
INSERT INTO `ewei_district` VALUES ('1092', '120', '长泰县', '0');
INSERT INTO `ewei_district` VALUES ('1093', '120', '东山县', '0');
INSERT INTO `ewei_district` VALUES ('1094', '120', '南靖县', '0');
INSERT INTO `ewei_district` VALUES ('1095', '120', '平和县', '0');
INSERT INTO `ewei_district` VALUES ('1096', '120', '华安县', '0');
INSERT INTO `ewei_district` VALUES ('1097', '120', '龙海市', '0');
INSERT INTO `ewei_district` VALUES ('1098', '121', '延平区', '0');
INSERT INTO `ewei_district` VALUES ('1099', '121', '顺昌县', '0');
INSERT INTO `ewei_district` VALUES ('1100', '121', '浦城县', '0');
INSERT INTO `ewei_district` VALUES ('1101', '121', '光泽县', '0');
INSERT INTO `ewei_district` VALUES ('1102', '121', '松溪县', '0');
INSERT INTO `ewei_district` VALUES ('1103', '121', '政和县', '0');
INSERT INTO `ewei_district` VALUES ('1104', '121', '邵武市', '0');
INSERT INTO `ewei_district` VALUES ('1105', '121', '武夷山市', '0');
INSERT INTO `ewei_district` VALUES ('1106', '121', '建瓯市', '0');
INSERT INTO `ewei_district` VALUES ('1107', '121', '建阳市', '0');
INSERT INTO `ewei_district` VALUES ('1108', '122', '新罗区', '0');
INSERT INTO `ewei_district` VALUES ('1109', '122', '长汀县', '0');
INSERT INTO `ewei_district` VALUES ('1110', '122', '永定县', '0');
INSERT INTO `ewei_district` VALUES ('1111', '122', '上杭县', '0');
INSERT INTO `ewei_district` VALUES ('1112', '122', '武平县', '0');
INSERT INTO `ewei_district` VALUES ('1113', '122', '连城县', '0');
INSERT INTO `ewei_district` VALUES ('1114', '122', '漳平市', '0');
INSERT INTO `ewei_district` VALUES ('1115', '123', '蕉城区', '0');
INSERT INTO `ewei_district` VALUES ('1116', '123', '霞浦县', '0');
INSERT INTO `ewei_district` VALUES ('1117', '123', '古田县', '0');
INSERT INTO `ewei_district` VALUES ('1118', '123', '屏南县', '0');
INSERT INTO `ewei_district` VALUES ('1119', '123', '寿宁县', '0');
INSERT INTO `ewei_district` VALUES ('1120', '123', '周宁县', '0');
INSERT INTO `ewei_district` VALUES ('1121', '123', '柘荣县', '0');
INSERT INTO `ewei_district` VALUES ('1122', '123', '福安市', '0');
INSERT INTO `ewei_district` VALUES ('1123', '123', '福鼎市', '0');
INSERT INTO `ewei_district` VALUES ('1124', '124', '东湖区', '0');
INSERT INTO `ewei_district` VALUES ('1125', '124', '西湖区', '0');
INSERT INTO `ewei_district` VALUES ('1126', '124', '青云谱区', '0');
INSERT INTO `ewei_district` VALUES ('1127', '124', '湾里区', '0');
INSERT INTO `ewei_district` VALUES ('1128', '124', '青山湖区', '0');
INSERT INTO `ewei_district` VALUES ('1129', '124', '南昌县', '0');
INSERT INTO `ewei_district` VALUES ('1130', '124', '新建县', '0');
INSERT INTO `ewei_district` VALUES ('1131', '124', '安义县', '0');
INSERT INTO `ewei_district` VALUES ('1132', '124', '进贤县', '0');
INSERT INTO `ewei_district` VALUES ('1133', '125', '昌江区', '0');
INSERT INTO `ewei_district` VALUES ('1134', '125', '珠山区', '0');
INSERT INTO `ewei_district` VALUES ('1135', '125', '浮梁县', '0');
INSERT INTO `ewei_district` VALUES ('1136', '125', '乐平市', '0');
INSERT INTO `ewei_district` VALUES ('1137', '126', '安源区', '0');
INSERT INTO `ewei_district` VALUES ('1138', '126', '湘东区', '0');
INSERT INTO `ewei_district` VALUES ('1139', '126', '莲花县', '0');
INSERT INTO `ewei_district` VALUES ('1140', '126', '上栗县', '0');
INSERT INTO `ewei_district` VALUES ('1141', '126', '芦溪县', '0');
INSERT INTO `ewei_district` VALUES ('1142', '127', '庐山区', '0');
INSERT INTO `ewei_district` VALUES ('1143', '127', '浔阳区', '0');
INSERT INTO `ewei_district` VALUES ('1144', '127', '九江县', '0');
INSERT INTO `ewei_district` VALUES ('1145', '127', '武宁县', '0');
INSERT INTO `ewei_district` VALUES ('1146', '127', '修水县', '0');
INSERT INTO `ewei_district` VALUES ('1147', '127', '永修县', '0');
INSERT INTO `ewei_district` VALUES ('1148', '127', '德安县', '0');
INSERT INTO `ewei_district` VALUES ('1149', '127', '星子县', '0');
INSERT INTO `ewei_district` VALUES ('1150', '127', '都昌县', '0');
INSERT INTO `ewei_district` VALUES ('1151', '127', '湖口县', '0');
INSERT INTO `ewei_district` VALUES ('1152', '127', '彭泽县', '0');
INSERT INTO `ewei_district` VALUES ('1153', '127', '瑞昌市', '0');
INSERT INTO `ewei_district` VALUES ('1154', '128', '渝水区', '0');
INSERT INTO `ewei_district` VALUES ('1155', '128', '分宜县', '0');
INSERT INTO `ewei_district` VALUES ('1156', '129', '月湖区', '0');
INSERT INTO `ewei_district` VALUES ('1157', '129', '余江县', '0');
INSERT INTO `ewei_district` VALUES ('1158', '129', '贵溪市', '0');
INSERT INTO `ewei_district` VALUES ('1159', '130', '章贡区', '0');
INSERT INTO `ewei_district` VALUES ('1160', '130', '赣县', '0');
INSERT INTO `ewei_district` VALUES ('1161', '130', '信丰县', '0');
INSERT INTO `ewei_district` VALUES ('1162', '130', '大余县', '0');
INSERT INTO `ewei_district` VALUES ('1163', '130', '上犹县', '0');
INSERT INTO `ewei_district` VALUES ('1164', '130', '崇义县', '0');
INSERT INTO `ewei_district` VALUES ('1165', '130', '安远县', '0');
INSERT INTO `ewei_district` VALUES ('1166', '130', '龙南县', '0');
INSERT INTO `ewei_district` VALUES ('1167', '130', '定南县', '0');
INSERT INTO `ewei_district` VALUES ('1168', '130', '全南县', '0');
INSERT INTO `ewei_district` VALUES ('1169', '130', '宁都县', '0');
INSERT INTO `ewei_district` VALUES ('1170', '130', '于都县', '0');
INSERT INTO `ewei_district` VALUES ('1171', '130', '兴国县', '0');
INSERT INTO `ewei_district` VALUES ('1172', '130', '会昌县', '0');
INSERT INTO `ewei_district` VALUES ('1173', '130', '寻乌县', '0');
INSERT INTO `ewei_district` VALUES ('1174', '130', '石城县', '0');
INSERT INTO `ewei_district` VALUES ('1175', '130', '瑞金市', '0');
INSERT INTO `ewei_district` VALUES ('1176', '130', '南康市', '0');
INSERT INTO `ewei_district` VALUES ('1177', '131', '吉州区', '0');
INSERT INTO `ewei_district` VALUES ('1178', '131', '青原区', '0');
INSERT INTO `ewei_district` VALUES ('1179', '131', '吉安县', '0');
INSERT INTO `ewei_district` VALUES ('1180', '131', '吉水县', '0');
INSERT INTO `ewei_district` VALUES ('1181', '131', '峡江县', '0');
INSERT INTO `ewei_district` VALUES ('1182', '131', '新干县', '0');
INSERT INTO `ewei_district` VALUES ('1183', '131', '永丰县', '0');
INSERT INTO `ewei_district` VALUES ('1184', '131', '泰和县', '0');
INSERT INTO `ewei_district` VALUES ('1185', '131', '遂川县', '0');
INSERT INTO `ewei_district` VALUES ('1186', '131', '万安县', '0');
INSERT INTO `ewei_district` VALUES ('1187', '131', '安福县', '0');
INSERT INTO `ewei_district` VALUES ('1188', '131', '永新县', '0');
INSERT INTO `ewei_district` VALUES ('1189', '131', '井冈山市', '0');
INSERT INTO `ewei_district` VALUES ('1190', '132', '袁州区', '0');
INSERT INTO `ewei_district` VALUES ('1191', '132', '奉新县', '0');
INSERT INTO `ewei_district` VALUES ('1192', '132', '万载县', '0');
INSERT INTO `ewei_district` VALUES ('1193', '132', '上高县', '0');
INSERT INTO `ewei_district` VALUES ('1194', '132', '宜丰县', '0');
INSERT INTO `ewei_district` VALUES ('1195', '132', '靖安县', '0');
INSERT INTO `ewei_district` VALUES ('1196', '132', '铜鼓县', '0');
INSERT INTO `ewei_district` VALUES ('1197', '132', '丰城市', '0');
INSERT INTO `ewei_district` VALUES ('1198', '132', '樟树市', '0');
INSERT INTO `ewei_district` VALUES ('1199', '132', '高安市', '0');
INSERT INTO `ewei_district` VALUES ('1200', '133', '临川区', '0');
INSERT INTO `ewei_district` VALUES ('1201', '133', '南城县', '0');
INSERT INTO `ewei_district` VALUES ('1202', '133', '黎川县', '0');
INSERT INTO `ewei_district` VALUES ('1203', '133', '南丰县', '0');
INSERT INTO `ewei_district` VALUES ('1204', '133', '崇仁县', '0');
INSERT INTO `ewei_district` VALUES ('1205', '133', '乐安县', '0');
INSERT INTO `ewei_district` VALUES ('1206', '133', '宜黄县', '0');
INSERT INTO `ewei_district` VALUES ('1207', '133', '金溪县', '0');
INSERT INTO `ewei_district` VALUES ('1208', '133', '资溪县', '0');
INSERT INTO `ewei_district` VALUES ('1209', '133', '东乡县', '0');
INSERT INTO `ewei_district` VALUES ('1210', '133', '广昌县', '0');
INSERT INTO `ewei_district` VALUES ('1211', '134', '信州区', '0');
INSERT INTO `ewei_district` VALUES ('1212', '134', '上饶县', '0');
INSERT INTO `ewei_district` VALUES ('1213', '134', '广丰县', '0');
INSERT INTO `ewei_district` VALUES ('1214', '134', '玉山县', '0');
INSERT INTO `ewei_district` VALUES ('1215', '134', '铅山县', '0');
INSERT INTO `ewei_district` VALUES ('1216', '134', '横峰县', '0');
INSERT INTO `ewei_district` VALUES ('1217', '134', '弋阳县', '0');
INSERT INTO `ewei_district` VALUES ('1218', '134', '余干县', '0');
INSERT INTO `ewei_district` VALUES ('1219', '134', '鄱阳县', '0');
INSERT INTO `ewei_district` VALUES ('1220', '134', '万年县', '0');
INSERT INTO `ewei_district` VALUES ('1221', '134', '婺源县', '0');
INSERT INTO `ewei_district` VALUES ('1222', '134', '德兴市', '0');
INSERT INTO `ewei_district` VALUES ('1223', '135', '历下区', '0');
INSERT INTO `ewei_district` VALUES ('1224', '135', '市中区', '0');
INSERT INTO `ewei_district` VALUES ('1225', '135', '槐荫区', '0');
INSERT INTO `ewei_district` VALUES ('1226', '135', '天桥区', '0');
INSERT INTO `ewei_district` VALUES ('1227', '135', '历城区', '0');
INSERT INTO `ewei_district` VALUES ('1228', '135', '长清区', '0');
INSERT INTO `ewei_district` VALUES ('1229', '135', '平阴县', '0');
INSERT INTO `ewei_district` VALUES ('1230', '135', '济阳县', '0');
INSERT INTO `ewei_district` VALUES ('1231', '135', '商河县', '0');
INSERT INTO `ewei_district` VALUES ('1232', '135', '章丘市', '0');
INSERT INTO `ewei_district` VALUES ('1233', '136', '市南区', '0');
INSERT INTO `ewei_district` VALUES ('1234', '136', '市北区', '0');
INSERT INTO `ewei_district` VALUES ('1235', '136', '四方区', '0');
INSERT INTO `ewei_district` VALUES ('1236', '136', '黄岛区', '0');
INSERT INTO `ewei_district` VALUES ('1237', '136', '崂山区', '0');
INSERT INTO `ewei_district` VALUES ('1238', '136', '李沧区', '0');
INSERT INTO `ewei_district` VALUES ('1239', '136', '城阳区', '0');
INSERT INTO `ewei_district` VALUES ('1240', '136', '胶州市', '0');
INSERT INTO `ewei_district` VALUES ('1241', '136', '即墨市', '0');
INSERT INTO `ewei_district` VALUES ('1242', '136', '平度市', '0');
INSERT INTO `ewei_district` VALUES ('1243', '136', '胶南市', '0');
INSERT INTO `ewei_district` VALUES ('1244', '136', '莱西市', '0');
INSERT INTO `ewei_district` VALUES ('1245', '137', '淄川区', '0');
INSERT INTO `ewei_district` VALUES ('1246', '137', '张店区', '0');
INSERT INTO `ewei_district` VALUES ('1247', '137', '博山区', '0');
INSERT INTO `ewei_district` VALUES ('1248', '137', '临淄区', '0');
INSERT INTO `ewei_district` VALUES ('1249', '137', '周村区', '0');
INSERT INTO `ewei_district` VALUES ('1250', '137', '桓台县', '0');
INSERT INTO `ewei_district` VALUES ('1251', '137', '高青县', '0');
INSERT INTO `ewei_district` VALUES ('1252', '137', '沂源县', '0');
INSERT INTO `ewei_district` VALUES ('1253', '138', '市中区', '0');
INSERT INTO `ewei_district` VALUES ('1254', '138', '薛城区', '0');
INSERT INTO `ewei_district` VALUES ('1255', '138', '峄城区', '0');
INSERT INTO `ewei_district` VALUES ('1256', '138', '台儿庄区', '0');
INSERT INTO `ewei_district` VALUES ('1257', '138', '山亭区', '0');
INSERT INTO `ewei_district` VALUES ('1258', '138', '滕州市', '0');
INSERT INTO `ewei_district` VALUES ('1259', '139', '东营区', '0');
INSERT INTO `ewei_district` VALUES ('1260', '139', '河口区', '0');
INSERT INTO `ewei_district` VALUES ('1261', '139', '垦利县', '0');
INSERT INTO `ewei_district` VALUES ('1262', '139', '利津县', '0');
INSERT INTO `ewei_district` VALUES ('1263', '139', '广饶县', '0');
INSERT INTO `ewei_district` VALUES ('1264', '140', '芝罘区', '0');
INSERT INTO `ewei_district` VALUES ('1265', '140', '福山区', '0');
INSERT INTO `ewei_district` VALUES ('1266', '140', '牟平区', '0');
INSERT INTO `ewei_district` VALUES ('1267', '140', '莱山区', '0');
INSERT INTO `ewei_district` VALUES ('1268', '140', '长岛县', '0');
INSERT INTO `ewei_district` VALUES ('1269', '140', '龙口市', '0');
INSERT INTO `ewei_district` VALUES ('1270', '140', '莱阳市', '0');
INSERT INTO `ewei_district` VALUES ('1271', '140', '莱州市', '0');
INSERT INTO `ewei_district` VALUES ('1272', '140', '蓬莱市', '0');
INSERT INTO `ewei_district` VALUES ('1273', '140', '招远市', '0');
INSERT INTO `ewei_district` VALUES ('1274', '140', '栖霞市', '0');
INSERT INTO `ewei_district` VALUES ('1275', '140', '海阳市', '0');
INSERT INTO `ewei_district` VALUES ('1276', '141', '潍城区', '0');
INSERT INTO `ewei_district` VALUES ('1277', '141', '寒亭区', '0');
INSERT INTO `ewei_district` VALUES ('1278', '141', '坊子区', '0');
INSERT INTO `ewei_district` VALUES ('1279', '141', '奎文区', '0');
INSERT INTO `ewei_district` VALUES ('1280', '141', '临朐县', '0');
INSERT INTO `ewei_district` VALUES ('1281', '141', '昌乐县', '0');
INSERT INTO `ewei_district` VALUES ('1282', '141', '青州市', '0');
INSERT INTO `ewei_district` VALUES ('1283', '141', '诸城市', '0');
INSERT INTO `ewei_district` VALUES ('1284', '141', '寿光市', '0');
INSERT INTO `ewei_district` VALUES ('1285', '141', '安丘市', '0');
INSERT INTO `ewei_district` VALUES ('1286', '141', '高密市', '0');
INSERT INTO `ewei_district` VALUES ('1287', '141', '昌邑市', '0');
INSERT INTO `ewei_district` VALUES ('1288', '142', '市中区', '0');
INSERT INTO `ewei_district` VALUES ('1289', '142', '任城区', '0');
INSERT INTO `ewei_district` VALUES ('1290', '142', '微山县', '0');
INSERT INTO `ewei_district` VALUES ('1291', '142', '鱼台县', '0');
INSERT INTO `ewei_district` VALUES ('1292', '142', '金乡县', '0');
INSERT INTO `ewei_district` VALUES ('1293', '142', '嘉祥县', '0');
INSERT INTO `ewei_district` VALUES ('1294', '142', '汶上县', '0');
INSERT INTO `ewei_district` VALUES ('1295', '142', '泗水县', '0');
INSERT INTO `ewei_district` VALUES ('1296', '142', '梁山县', '0');
INSERT INTO `ewei_district` VALUES ('1297', '142', '曲阜市', '0');
INSERT INTO `ewei_district` VALUES ('1298', '142', '兖州市', '0');
INSERT INTO `ewei_district` VALUES ('1299', '142', '邹城市', '0');
INSERT INTO `ewei_district` VALUES ('1300', '143', '泰山区', '0');
INSERT INTO `ewei_district` VALUES ('1301', '143', '岱岳区', '0');
INSERT INTO `ewei_district` VALUES ('1302', '143', '宁阳县', '0');
INSERT INTO `ewei_district` VALUES ('1303', '143', '东平县', '0');
INSERT INTO `ewei_district` VALUES ('1304', '143', '新泰市', '0');
INSERT INTO `ewei_district` VALUES ('1305', '143', '肥城市', '0');
INSERT INTO `ewei_district` VALUES ('1306', '144', '环翠区', '0');
INSERT INTO `ewei_district` VALUES ('1307', '144', '文登市', '0');
INSERT INTO `ewei_district` VALUES ('1308', '144', '荣成市', '0');
INSERT INTO `ewei_district` VALUES ('1309', '144', '乳山市', '0');
INSERT INTO `ewei_district` VALUES ('1310', '145', '东港区', '0');
INSERT INTO `ewei_district` VALUES ('1311', '145', '岚山区', '0');
INSERT INTO `ewei_district` VALUES ('1312', '145', '五莲县', '0');
INSERT INTO `ewei_district` VALUES ('1313', '145', '莒县', '0');
INSERT INTO `ewei_district` VALUES ('1314', '146', '莱城区', '0');
INSERT INTO `ewei_district` VALUES ('1315', '146', '钢城区', '0');
INSERT INTO `ewei_district` VALUES ('1316', '147', '兰山区', '0');
INSERT INTO `ewei_district` VALUES ('1317', '147', '罗庄区', '0');
INSERT INTO `ewei_district` VALUES ('1318', '147', '河东区', '0');
INSERT INTO `ewei_district` VALUES ('1319', '147', '沂南县', '0');
INSERT INTO `ewei_district` VALUES ('1320', '147', '郯城县', '0');
INSERT INTO `ewei_district` VALUES ('1321', '147', '沂水县', '0');
INSERT INTO `ewei_district` VALUES ('1322', '147', '苍山县', '0');
INSERT INTO `ewei_district` VALUES ('1323', '147', '费县', '0');
INSERT INTO `ewei_district` VALUES ('1324', '147', '平邑县', '0');
INSERT INTO `ewei_district` VALUES ('1325', '147', '莒南县', '0');
INSERT INTO `ewei_district` VALUES ('1326', '147', '蒙阴县', '0');
INSERT INTO `ewei_district` VALUES ('1327', '147', '临沭县', '0');
INSERT INTO `ewei_district` VALUES ('1328', '148', '德城区', '0');
INSERT INTO `ewei_district` VALUES ('1329', '148', '陵县', '0');
INSERT INTO `ewei_district` VALUES ('1330', '148', '宁津县', '0');
INSERT INTO `ewei_district` VALUES ('1331', '148', '庆云县', '0');
INSERT INTO `ewei_district` VALUES ('1332', '148', '临邑县', '0');
INSERT INTO `ewei_district` VALUES ('1333', '148', '齐河县', '0');
INSERT INTO `ewei_district` VALUES ('1334', '148', '平原县', '0');
INSERT INTO `ewei_district` VALUES ('1335', '148', '夏津县', '0');
INSERT INTO `ewei_district` VALUES ('1336', '148', '武城县', '0');
INSERT INTO `ewei_district` VALUES ('1337', '148', '乐陵市', '0');
INSERT INTO `ewei_district` VALUES ('1338', '148', '禹城市', '0');
INSERT INTO `ewei_district` VALUES ('1339', '149', '东昌府区', '0');
INSERT INTO `ewei_district` VALUES ('1340', '149', '阳谷县', '0');
INSERT INTO `ewei_district` VALUES ('1341', '149', '莘县', '0');
INSERT INTO `ewei_district` VALUES ('1342', '149', '茌平县', '0');
INSERT INTO `ewei_district` VALUES ('1343', '149', '东阿县', '0');
INSERT INTO `ewei_district` VALUES ('1344', '149', '冠县', '0');
INSERT INTO `ewei_district` VALUES ('1345', '149', '高唐县', '0');
INSERT INTO `ewei_district` VALUES ('1346', '149', '临清市', '0');
INSERT INTO `ewei_district` VALUES ('1347', '150', '滨城区', '0');
INSERT INTO `ewei_district` VALUES ('1348', '150', '惠民县', '0');
INSERT INTO `ewei_district` VALUES ('1349', '150', '阳信县', '0');
INSERT INTO `ewei_district` VALUES ('1350', '150', '无棣县', '0');
INSERT INTO `ewei_district` VALUES ('1351', '150', '沾化县', '0');
INSERT INTO `ewei_district` VALUES ('1352', '150', '博兴县', '0');
INSERT INTO `ewei_district` VALUES ('1353', '150', '邹平县', '0');
INSERT INTO `ewei_district` VALUES ('1354', '151', '牡丹区', '0');
INSERT INTO `ewei_district` VALUES ('1355', '151', '曹县', '0');
INSERT INTO `ewei_district` VALUES ('1356', '151', '单县', '0');
INSERT INTO `ewei_district` VALUES ('1357', '151', '成武县', '0');
INSERT INTO `ewei_district` VALUES ('1358', '151', '巨野县', '0');
INSERT INTO `ewei_district` VALUES ('1359', '151', '郓城县', '0');
INSERT INTO `ewei_district` VALUES ('1360', '151', '鄄城县', '0');
INSERT INTO `ewei_district` VALUES ('1361', '151', '定陶县', '0');
INSERT INTO `ewei_district` VALUES ('1362', '151', '东明县', '0');
INSERT INTO `ewei_district` VALUES ('1363', '152', '中原区', '0');
INSERT INTO `ewei_district` VALUES ('1364', '152', '二七区', '0');
INSERT INTO `ewei_district` VALUES ('1365', '152', '管城回族区', '0');
INSERT INTO `ewei_district` VALUES ('1366', '152', '金水区', '0');
INSERT INTO `ewei_district` VALUES ('1367', '152', '上街区', '0');
INSERT INTO `ewei_district` VALUES ('1368', '152', '惠济区', '0');
INSERT INTO `ewei_district` VALUES ('1369', '152', '中牟县', '0');
INSERT INTO `ewei_district` VALUES ('1370', '152', '巩义市', '0');
INSERT INTO `ewei_district` VALUES ('1371', '152', '荥阳市', '0');
INSERT INTO `ewei_district` VALUES ('1372', '152', '新密市', '0');
INSERT INTO `ewei_district` VALUES ('1373', '152', '新郑市', '0');
INSERT INTO `ewei_district` VALUES ('1374', '152', '登封市', '0');
INSERT INTO `ewei_district` VALUES ('1375', '153', '龙亭区', '0');
INSERT INTO `ewei_district` VALUES ('1376', '153', '顺河回族区', '0');
INSERT INTO `ewei_district` VALUES ('1377', '153', '鼓楼区', '0');
INSERT INTO `ewei_district` VALUES ('1378', '153', '南关区', '0');
INSERT INTO `ewei_district` VALUES ('1379', '153', '郊区', '0');
INSERT INTO `ewei_district` VALUES ('1380', '153', '杞县', '0');
INSERT INTO `ewei_district` VALUES ('1381', '153', '通许县', '0');
INSERT INTO `ewei_district` VALUES ('1382', '153', '尉氏县', '0');
INSERT INTO `ewei_district` VALUES ('1383', '153', '开封县', '0');
INSERT INTO `ewei_district` VALUES ('1384', '153', '兰考县', '0');
INSERT INTO `ewei_district` VALUES ('1385', '154', '老城区', '0');
INSERT INTO `ewei_district` VALUES ('1386', '154', '西工区', '0');
INSERT INTO `ewei_district` VALUES ('1387', '154', '廛河回族区', '0');
INSERT INTO `ewei_district` VALUES ('1388', '154', '涧西区', '0');
INSERT INTO `ewei_district` VALUES ('1389', '154', '吉利区', '0');
INSERT INTO `ewei_district` VALUES ('1390', '154', '洛龙区', '0');
INSERT INTO `ewei_district` VALUES ('1391', '154', '孟津县', '0');
INSERT INTO `ewei_district` VALUES ('1392', '154', '新安县', '0');
INSERT INTO `ewei_district` VALUES ('1393', '154', '栾川县', '0');
INSERT INTO `ewei_district` VALUES ('1394', '154', '嵩县', '0');
INSERT INTO `ewei_district` VALUES ('1395', '154', '汝阳县', '0');
INSERT INTO `ewei_district` VALUES ('1396', '154', '宜阳县', '0');
INSERT INTO `ewei_district` VALUES ('1397', '154', '洛宁县', '0');
INSERT INTO `ewei_district` VALUES ('1398', '154', '伊川县', '0');
INSERT INTO `ewei_district` VALUES ('1399', '154', '偃师市', '0');
INSERT INTO `ewei_district` VALUES ('1400', '155', '新华区', '0');
INSERT INTO `ewei_district` VALUES ('1401', '155', '卫东区', '0');
INSERT INTO `ewei_district` VALUES ('1402', '155', '石龙区', '0');
INSERT INTO `ewei_district` VALUES ('1403', '155', '湛河区', '0');
INSERT INTO `ewei_district` VALUES ('1404', '155', '宝丰县', '0');
INSERT INTO `ewei_district` VALUES ('1405', '155', '叶县', '0');
INSERT INTO `ewei_district` VALUES ('1406', '155', '鲁山县', '0');
INSERT INTO `ewei_district` VALUES ('1407', '155', '郏县', '0');
INSERT INTO `ewei_district` VALUES ('1408', '155', '舞钢市', '0');
INSERT INTO `ewei_district` VALUES ('1409', '155', '汝州市', '0');
INSERT INTO `ewei_district` VALUES ('1410', '156', '文峰区', '0');
INSERT INTO `ewei_district` VALUES ('1411', '156', '北关区', '0');
INSERT INTO `ewei_district` VALUES ('1412', '156', '殷都区', '0');
INSERT INTO `ewei_district` VALUES ('1413', '156', '龙安区', '0');
INSERT INTO `ewei_district` VALUES ('1414', '156', '安阳县', '0');
INSERT INTO `ewei_district` VALUES ('1415', '156', '汤阴县', '0');
INSERT INTO `ewei_district` VALUES ('1416', '156', '滑县', '0');
INSERT INTO `ewei_district` VALUES ('1417', '156', '内黄县', '0');
INSERT INTO `ewei_district` VALUES ('1418', '156', '林州市', '0');
INSERT INTO `ewei_district` VALUES ('1419', '157', '鹤山区', '0');
INSERT INTO `ewei_district` VALUES ('1420', '157', '山城区', '0');
INSERT INTO `ewei_district` VALUES ('1421', '157', '淇滨区', '0');
INSERT INTO `ewei_district` VALUES ('1422', '157', '浚县', '0');
INSERT INTO `ewei_district` VALUES ('1423', '157', '淇县', '0');
INSERT INTO `ewei_district` VALUES ('1424', '158', '红旗区', '0');
INSERT INTO `ewei_district` VALUES ('1425', '158', '卫滨区', '0');
INSERT INTO `ewei_district` VALUES ('1426', '158', '凤泉区', '0');
INSERT INTO `ewei_district` VALUES ('1427', '158', '牧野区', '0');
INSERT INTO `ewei_district` VALUES ('1428', '158', '新乡县', '0');
INSERT INTO `ewei_district` VALUES ('1429', '158', '获嘉县', '0');
INSERT INTO `ewei_district` VALUES ('1430', '158', '原阳县', '0');
INSERT INTO `ewei_district` VALUES ('1431', '158', '延津县', '0');
INSERT INTO `ewei_district` VALUES ('1432', '158', '封丘县', '0');
INSERT INTO `ewei_district` VALUES ('1433', '158', '长垣县', '0');
INSERT INTO `ewei_district` VALUES ('1434', '158', '卫辉市', '0');
INSERT INTO `ewei_district` VALUES ('1435', '158', '辉县市', '0');
INSERT INTO `ewei_district` VALUES ('1436', '159', '解放区', '0');
INSERT INTO `ewei_district` VALUES ('1437', '159', '中站区', '0');
INSERT INTO `ewei_district` VALUES ('1438', '159', '马村区', '0');
INSERT INTO `ewei_district` VALUES ('1439', '159', '山阳区', '0');
INSERT INTO `ewei_district` VALUES ('1440', '159', '修武县', '0');
INSERT INTO `ewei_district` VALUES ('1441', '159', '博爱县', '0');
INSERT INTO `ewei_district` VALUES ('1442', '159', '武陟县', '0');
INSERT INTO `ewei_district` VALUES ('1443', '159', '温县', '0');
INSERT INTO `ewei_district` VALUES ('1444', '159', '济源市', '0');
INSERT INTO `ewei_district` VALUES ('1445', '159', '沁阳市', '0');
INSERT INTO `ewei_district` VALUES ('1446', '159', '孟州市', '0');
INSERT INTO `ewei_district` VALUES ('1447', '160', '华龙区', '0');
INSERT INTO `ewei_district` VALUES ('1448', '160', '清丰县', '0');
INSERT INTO `ewei_district` VALUES ('1449', '160', '南乐县', '0');
INSERT INTO `ewei_district` VALUES ('1450', '160', '范县', '0');
INSERT INTO `ewei_district` VALUES ('1451', '160', '台前县', '0');
INSERT INTO `ewei_district` VALUES ('1452', '160', '濮阳县', '0');
INSERT INTO `ewei_district` VALUES ('1453', '161', '魏都区', '0');
INSERT INTO `ewei_district` VALUES ('1454', '161', '许昌县', '0');
INSERT INTO `ewei_district` VALUES ('1455', '161', '鄢陵县', '0');
INSERT INTO `ewei_district` VALUES ('1456', '161', '襄城县', '0');
INSERT INTO `ewei_district` VALUES ('1457', '161', '禹州市', '0');
INSERT INTO `ewei_district` VALUES ('1458', '161', '长葛市', '0');
INSERT INTO `ewei_district` VALUES ('1459', '162', '源汇区', '0');
INSERT INTO `ewei_district` VALUES ('1460', '162', '郾城区', '0');
INSERT INTO `ewei_district` VALUES ('1461', '162', '召陵区', '0');
INSERT INTO `ewei_district` VALUES ('1462', '162', '舞阳县', '0');
INSERT INTO `ewei_district` VALUES ('1463', '162', '临颍县', '0');
INSERT INTO `ewei_district` VALUES ('1464', '163', '市辖区', '0');
INSERT INTO `ewei_district` VALUES ('1465', '163', '湖滨区', '0');
INSERT INTO `ewei_district` VALUES ('1466', '163', '渑池县', '0');
INSERT INTO `ewei_district` VALUES ('1467', '163', '陕县', '0');
INSERT INTO `ewei_district` VALUES ('1468', '163', '卢氏县', '0');
INSERT INTO `ewei_district` VALUES ('1469', '163', '义马市', '0');
INSERT INTO `ewei_district` VALUES ('1470', '163', '灵宝市', '0');
INSERT INTO `ewei_district` VALUES ('1471', '164', '宛城区', '0');
INSERT INTO `ewei_district` VALUES ('1472', '164', '卧龙区', '0');
INSERT INTO `ewei_district` VALUES ('1473', '164', '南召县', '0');
INSERT INTO `ewei_district` VALUES ('1474', '164', '方城县', '0');
INSERT INTO `ewei_district` VALUES ('1475', '164', '西峡县', '0');
INSERT INTO `ewei_district` VALUES ('1476', '164', '镇平县', '0');
INSERT INTO `ewei_district` VALUES ('1477', '164', '内乡县', '0');
INSERT INTO `ewei_district` VALUES ('1478', '164', '淅川县', '0');
INSERT INTO `ewei_district` VALUES ('1479', '164', '社旗县', '0');
INSERT INTO `ewei_district` VALUES ('1480', '164', '唐河县', '0');
INSERT INTO `ewei_district` VALUES ('1481', '164', '新野县', '0');
INSERT INTO `ewei_district` VALUES ('1482', '164', '桐柏县', '0');
INSERT INTO `ewei_district` VALUES ('1483', '164', '邓州市', '0');
INSERT INTO `ewei_district` VALUES ('1484', '165', '梁园区', '0');
INSERT INTO `ewei_district` VALUES ('1485', '165', '睢阳区', '0');
INSERT INTO `ewei_district` VALUES ('1486', '165', '民权县', '0');
INSERT INTO `ewei_district` VALUES ('1487', '165', '睢县', '0');
INSERT INTO `ewei_district` VALUES ('1488', '165', '宁陵县', '0');
INSERT INTO `ewei_district` VALUES ('1489', '165', '柘城县', '0');
INSERT INTO `ewei_district` VALUES ('1490', '165', '虞城县', '0');
INSERT INTO `ewei_district` VALUES ('1491', '165', '夏邑县', '0');
INSERT INTO `ewei_district` VALUES ('1492', '165', '永城市', '0');
INSERT INTO `ewei_district` VALUES ('1493', '166', '浉河区', '0');
INSERT INTO `ewei_district` VALUES ('1494', '166', '平桥区', '0');
INSERT INTO `ewei_district` VALUES ('1495', '166', '罗山县', '0');
INSERT INTO `ewei_district` VALUES ('1496', '166', '光山县', '0');
INSERT INTO `ewei_district` VALUES ('1497', '166', '新县', '0');
INSERT INTO `ewei_district` VALUES ('1498', '166', '商城县', '0');
INSERT INTO `ewei_district` VALUES ('1499', '166', '固始县', '0');
INSERT INTO `ewei_district` VALUES ('1500', '166', '潢川县', '0');
INSERT INTO `ewei_district` VALUES ('1501', '166', '淮滨县', '0');
INSERT INTO `ewei_district` VALUES ('1502', '166', '息县', '0');
INSERT INTO `ewei_district` VALUES ('1503', '167', '川汇区', '0');
INSERT INTO `ewei_district` VALUES ('1504', '167', '扶沟县', '0');
INSERT INTO `ewei_district` VALUES ('1505', '167', '西华县', '0');
INSERT INTO `ewei_district` VALUES ('1506', '167', '商水县', '0');
INSERT INTO `ewei_district` VALUES ('1507', '167', '沈丘县', '0');
INSERT INTO `ewei_district` VALUES ('1508', '167', '郸城县', '0');
INSERT INTO `ewei_district` VALUES ('1509', '167', '淮阳县', '0');
INSERT INTO `ewei_district` VALUES ('1510', '167', '太康县', '0');
INSERT INTO `ewei_district` VALUES ('1511', '167', '鹿邑县', '0');
INSERT INTO `ewei_district` VALUES ('1512', '167', '项城市', '0');
INSERT INTO `ewei_district` VALUES ('1513', '168', '驿城区', '0');
INSERT INTO `ewei_district` VALUES ('1514', '168', '西平县', '0');
INSERT INTO `ewei_district` VALUES ('1515', '168', '上蔡县', '0');
INSERT INTO `ewei_district` VALUES ('1516', '168', '平舆县', '0');
INSERT INTO `ewei_district` VALUES ('1517', '168', '正阳县', '0');
INSERT INTO `ewei_district` VALUES ('1518', '168', '确山县', '0');
INSERT INTO `ewei_district` VALUES ('1519', '168', '泌阳县', '0');
INSERT INTO `ewei_district` VALUES ('1520', '168', '汝南县', '0');
INSERT INTO `ewei_district` VALUES ('1521', '168', '遂平县', '0');
INSERT INTO `ewei_district` VALUES ('1522', '168', '新蔡县', '0');
INSERT INTO `ewei_district` VALUES ('1523', '169', '江岸区', '0');
INSERT INTO `ewei_district` VALUES ('1524', '169', '江汉区', '0');
INSERT INTO `ewei_district` VALUES ('1525', '169', '硚口区', '0');
INSERT INTO `ewei_district` VALUES ('1526', '169', '汉阳区', '0');
INSERT INTO `ewei_district` VALUES ('1527', '169', '武昌区', '0');
INSERT INTO `ewei_district` VALUES ('1528', '169', '青山区', '0');
INSERT INTO `ewei_district` VALUES ('1529', '169', '洪山区', '0');
INSERT INTO `ewei_district` VALUES ('1530', '169', '东西湖区', '0');
INSERT INTO `ewei_district` VALUES ('1531', '169', '汉南区', '0');
INSERT INTO `ewei_district` VALUES ('1532', '169', '蔡甸区', '0');
INSERT INTO `ewei_district` VALUES ('1533', '169', '江夏区', '0');
INSERT INTO `ewei_district` VALUES ('1534', '169', '黄陂区', '0');
INSERT INTO `ewei_district` VALUES ('1535', '169', '新洲区', '0');
INSERT INTO `ewei_district` VALUES ('1536', '170', '黄石港区', '0');
INSERT INTO `ewei_district` VALUES ('1537', '170', '西塞山区', '0');
INSERT INTO `ewei_district` VALUES ('1538', '170', '下陆区', '0');
INSERT INTO `ewei_district` VALUES ('1539', '170', '铁山区', '0');
INSERT INTO `ewei_district` VALUES ('1540', '170', '阳新县', '0');
INSERT INTO `ewei_district` VALUES ('1541', '170', '大冶市', '0');
INSERT INTO `ewei_district` VALUES ('1542', '171', '茅箭区', '0');
INSERT INTO `ewei_district` VALUES ('1543', '171', '张湾区', '0');
INSERT INTO `ewei_district` VALUES ('1544', '171', '郧县', '0');
INSERT INTO `ewei_district` VALUES ('1545', '171', '郧西县', '0');
INSERT INTO `ewei_district` VALUES ('1546', '171', '竹山县', '0');
INSERT INTO `ewei_district` VALUES ('1547', '171', '竹溪县', '0');
INSERT INTO `ewei_district` VALUES ('1548', '171', '房县', '0');
INSERT INTO `ewei_district` VALUES ('1549', '171', '丹江口市', '0');
INSERT INTO `ewei_district` VALUES ('1550', '172', '西陵区', '0');
INSERT INTO `ewei_district` VALUES ('1551', '172', '伍家岗区', '0');
INSERT INTO `ewei_district` VALUES ('1552', '172', '点军区', '0');
INSERT INTO `ewei_district` VALUES ('1553', '172', '猇亭区', '0');
INSERT INTO `ewei_district` VALUES ('1554', '172', '夷陵区', '0');
INSERT INTO `ewei_district` VALUES ('1555', '172', '远安县', '0');
INSERT INTO `ewei_district` VALUES ('1556', '172', '兴山县', '0');
INSERT INTO `ewei_district` VALUES ('1557', '172', '秭归县', '0');
INSERT INTO `ewei_district` VALUES ('1558', '172', '长阳土家族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1559', '172', '五峰土家族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1560', '172', '宜都市', '0');
INSERT INTO `ewei_district` VALUES ('1561', '172', '当阳市', '0');
INSERT INTO `ewei_district` VALUES ('1562', '172', '枝江市', '0');
INSERT INTO `ewei_district` VALUES ('1563', '173', '襄城区', '0');
INSERT INTO `ewei_district` VALUES ('1564', '173', '樊城区', '0');
INSERT INTO `ewei_district` VALUES ('1565', '173', '襄阳区', '0');
INSERT INTO `ewei_district` VALUES ('1566', '173', '南漳县', '0');
INSERT INTO `ewei_district` VALUES ('1567', '173', '谷城县', '0');
INSERT INTO `ewei_district` VALUES ('1568', '173', '保康县', '0');
INSERT INTO `ewei_district` VALUES ('1569', '173', '老河口市', '0');
INSERT INTO `ewei_district` VALUES ('1570', '173', '枣阳市', '0');
INSERT INTO `ewei_district` VALUES ('1571', '173', '宜城市', '0');
INSERT INTO `ewei_district` VALUES ('1572', '174', '梁子湖区', '0');
INSERT INTO `ewei_district` VALUES ('1573', '174', '华容区', '0');
INSERT INTO `ewei_district` VALUES ('1574', '174', '鄂城区', '0');
INSERT INTO `ewei_district` VALUES ('1575', '175', '东宝区', '0');
INSERT INTO `ewei_district` VALUES ('1576', '175', '掇刀区', '0');
INSERT INTO `ewei_district` VALUES ('1577', '175', '京山县', '0');
INSERT INTO `ewei_district` VALUES ('1578', '175', '沙洋县', '0');
INSERT INTO `ewei_district` VALUES ('1579', '175', '钟祥市', '0');
INSERT INTO `ewei_district` VALUES ('1580', '176', '孝南区', '0');
INSERT INTO `ewei_district` VALUES ('1581', '176', '孝昌县', '0');
INSERT INTO `ewei_district` VALUES ('1582', '176', '大悟县', '0');
INSERT INTO `ewei_district` VALUES ('1583', '176', '云梦县', '0');
INSERT INTO `ewei_district` VALUES ('1584', '176', '应城市', '0');
INSERT INTO `ewei_district` VALUES ('1585', '176', '安陆市', '0');
INSERT INTO `ewei_district` VALUES ('1586', '176', '汉川市', '0');
INSERT INTO `ewei_district` VALUES ('1587', '177', '沙市区', '0');
INSERT INTO `ewei_district` VALUES ('1588', '177', '荆州区', '0');
INSERT INTO `ewei_district` VALUES ('1589', '177', '公安县', '0');
INSERT INTO `ewei_district` VALUES ('1590', '177', '监利县', '0');
INSERT INTO `ewei_district` VALUES ('1591', '177', '江陵县', '0');
INSERT INTO `ewei_district` VALUES ('1592', '177', '石首市', '0');
INSERT INTO `ewei_district` VALUES ('1593', '177', '洪湖市', '0');
INSERT INTO `ewei_district` VALUES ('1594', '177', '松滋市', '0');
INSERT INTO `ewei_district` VALUES ('1595', '178', '黄州区', '0');
INSERT INTO `ewei_district` VALUES ('1596', '178', '团风县', '0');
INSERT INTO `ewei_district` VALUES ('1597', '178', '红安县', '0');
INSERT INTO `ewei_district` VALUES ('1598', '178', '罗田县', '0');
INSERT INTO `ewei_district` VALUES ('1599', '178', '英山县', '0');
INSERT INTO `ewei_district` VALUES ('1600', '178', '浠水县', '0');
INSERT INTO `ewei_district` VALUES ('1601', '178', '蕲春县', '0');
INSERT INTO `ewei_district` VALUES ('1602', '178', '黄梅县', '0');
INSERT INTO `ewei_district` VALUES ('1603', '178', '麻城市', '0');
INSERT INTO `ewei_district` VALUES ('1604', '178', '武穴市', '0');
INSERT INTO `ewei_district` VALUES ('1605', '179', '咸安区', '0');
INSERT INTO `ewei_district` VALUES ('1606', '179', '嘉鱼县', '0');
INSERT INTO `ewei_district` VALUES ('1607', '179', '通城县', '0');
INSERT INTO `ewei_district` VALUES ('1608', '179', '崇阳县', '0');
INSERT INTO `ewei_district` VALUES ('1609', '179', '通山县', '0');
INSERT INTO `ewei_district` VALUES ('1610', '179', '赤壁市', '0');
INSERT INTO `ewei_district` VALUES ('1611', '180', '曾都区', '0');
INSERT INTO `ewei_district` VALUES ('1612', '180', '广水市', '0');
INSERT INTO `ewei_district` VALUES ('1613', '181', '恩施市', '0');
INSERT INTO `ewei_district` VALUES ('1614', '181', '利川市', '0');
INSERT INTO `ewei_district` VALUES ('1615', '181', '建始县', '0');
INSERT INTO `ewei_district` VALUES ('1616', '181', '巴东县', '0');
INSERT INTO `ewei_district` VALUES ('1617', '181', '宣恩县', '0');
INSERT INTO `ewei_district` VALUES ('1618', '181', '咸丰县', '0');
INSERT INTO `ewei_district` VALUES ('1619', '181', '来凤县', '0');
INSERT INTO `ewei_district` VALUES ('1620', '181', '鹤峰县', '0');
INSERT INTO `ewei_district` VALUES ('1621', '182', '仙桃市', '0');
INSERT INTO `ewei_district` VALUES ('1622', '182', '潜江市', '0');
INSERT INTO `ewei_district` VALUES ('1623', '182', '天门市', '0');
INSERT INTO `ewei_district` VALUES ('1624', '182', '神农架林区', '0');
INSERT INTO `ewei_district` VALUES ('1625', '183', '芙蓉区', '0');
INSERT INTO `ewei_district` VALUES ('1626', '183', '天心区', '0');
INSERT INTO `ewei_district` VALUES ('1627', '183', '岳麓区', '0');
INSERT INTO `ewei_district` VALUES ('1628', '183', '开福区', '0');
INSERT INTO `ewei_district` VALUES ('1629', '183', '雨花区', '0');
INSERT INTO `ewei_district` VALUES ('1630', '183', '长沙县', '0');
INSERT INTO `ewei_district` VALUES ('1631', '183', '望城县', '0');
INSERT INTO `ewei_district` VALUES ('1632', '183', '宁乡县', '0');
INSERT INTO `ewei_district` VALUES ('1633', '183', '浏阳市', '0');
INSERT INTO `ewei_district` VALUES ('1634', '184', '荷塘区', '0');
INSERT INTO `ewei_district` VALUES ('1635', '184', '芦淞区', '0');
INSERT INTO `ewei_district` VALUES ('1636', '184', '石峰区', '0');
INSERT INTO `ewei_district` VALUES ('1637', '184', '天元区', '0');
INSERT INTO `ewei_district` VALUES ('1638', '184', '株洲县', '0');
INSERT INTO `ewei_district` VALUES ('1639', '184', '攸县', '0');
INSERT INTO `ewei_district` VALUES ('1640', '184', '茶陵县', '0');
INSERT INTO `ewei_district` VALUES ('1641', '184', '炎陵县', '0');
INSERT INTO `ewei_district` VALUES ('1642', '184', '醴陵市', '0');
INSERT INTO `ewei_district` VALUES ('1643', '185', '雨湖区', '0');
INSERT INTO `ewei_district` VALUES ('1644', '185', '岳塘区', '0');
INSERT INTO `ewei_district` VALUES ('1645', '185', '湘潭县', '0');
INSERT INTO `ewei_district` VALUES ('1646', '185', '湘乡市', '0');
INSERT INTO `ewei_district` VALUES ('1647', '185', '韶山市', '0');
INSERT INTO `ewei_district` VALUES ('1648', '186', '珠晖区', '0');
INSERT INTO `ewei_district` VALUES ('1649', '186', '雁峰区', '0');
INSERT INTO `ewei_district` VALUES ('1650', '186', '石鼓区', '0');
INSERT INTO `ewei_district` VALUES ('1651', '186', '蒸湘区', '0');
INSERT INTO `ewei_district` VALUES ('1652', '186', '南岳区', '0');
INSERT INTO `ewei_district` VALUES ('1653', '186', '衡阳县', '0');
INSERT INTO `ewei_district` VALUES ('1654', '186', '衡南县', '0');
INSERT INTO `ewei_district` VALUES ('1655', '186', '衡山县', '0');
INSERT INTO `ewei_district` VALUES ('1656', '186', '衡东县', '0');
INSERT INTO `ewei_district` VALUES ('1657', '186', '祁东县', '0');
INSERT INTO `ewei_district` VALUES ('1658', '186', '耒阳市', '0');
INSERT INTO `ewei_district` VALUES ('1659', '186', '常宁市', '0');
INSERT INTO `ewei_district` VALUES ('1660', '187', '双清区', '0');
INSERT INTO `ewei_district` VALUES ('1661', '187', '大祥区', '0');
INSERT INTO `ewei_district` VALUES ('1662', '187', '北塔区', '0');
INSERT INTO `ewei_district` VALUES ('1663', '187', '邵东县', '0');
INSERT INTO `ewei_district` VALUES ('1664', '187', '新邵县', '0');
INSERT INTO `ewei_district` VALUES ('1665', '187', '邵阳县', '0');
INSERT INTO `ewei_district` VALUES ('1666', '187', '隆回县', '0');
INSERT INTO `ewei_district` VALUES ('1667', '187', '洞口县', '0');
INSERT INTO `ewei_district` VALUES ('1668', '187', '绥宁县', '0');
INSERT INTO `ewei_district` VALUES ('1669', '187', '新宁县', '0');
INSERT INTO `ewei_district` VALUES ('1670', '187', '城步苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1671', '187', '武冈市', '0');
INSERT INTO `ewei_district` VALUES ('1672', '188', '岳阳楼区', '0');
INSERT INTO `ewei_district` VALUES ('1673', '188', '云溪区', '0');
INSERT INTO `ewei_district` VALUES ('1674', '188', '君山区', '0');
INSERT INTO `ewei_district` VALUES ('1675', '188', '岳阳县', '0');
INSERT INTO `ewei_district` VALUES ('1676', '188', '华容县', '0');
INSERT INTO `ewei_district` VALUES ('1677', '188', '湘阴县', '0');
INSERT INTO `ewei_district` VALUES ('1678', '188', '平江县', '0');
INSERT INTO `ewei_district` VALUES ('1679', '188', '汨罗市', '0');
INSERT INTO `ewei_district` VALUES ('1680', '188', '临湘市', '0');
INSERT INTO `ewei_district` VALUES ('1681', '189', '武陵区', '0');
INSERT INTO `ewei_district` VALUES ('1682', '189', '鼎城区', '0');
INSERT INTO `ewei_district` VALUES ('1683', '189', '安乡县', '0');
INSERT INTO `ewei_district` VALUES ('1684', '189', '汉寿县', '0');
INSERT INTO `ewei_district` VALUES ('1685', '189', '澧县', '0');
INSERT INTO `ewei_district` VALUES ('1686', '189', '临澧县', '0');
INSERT INTO `ewei_district` VALUES ('1687', '189', '桃源县', '0');
INSERT INTO `ewei_district` VALUES ('1688', '189', '石门县', '0');
INSERT INTO `ewei_district` VALUES ('1689', '189', '津市市', '0');
INSERT INTO `ewei_district` VALUES ('1690', '190', '永定区', '0');
INSERT INTO `ewei_district` VALUES ('1691', '190', '武陵源区', '0');
INSERT INTO `ewei_district` VALUES ('1692', '190', '慈利县', '0');
INSERT INTO `ewei_district` VALUES ('1693', '190', '桑植县', '0');
INSERT INTO `ewei_district` VALUES ('1694', '191', '资阳区', '0');
INSERT INTO `ewei_district` VALUES ('1695', '191', '赫山区', '0');
INSERT INTO `ewei_district` VALUES ('1696', '191', '南县', '0');
INSERT INTO `ewei_district` VALUES ('1697', '191', '桃江县', '0');
INSERT INTO `ewei_district` VALUES ('1698', '191', '安化县', '0');
INSERT INTO `ewei_district` VALUES ('1699', '191', '沅江市', '0');
INSERT INTO `ewei_district` VALUES ('1700', '192', '北湖区', '0');
INSERT INTO `ewei_district` VALUES ('1701', '192', '苏仙区', '0');
INSERT INTO `ewei_district` VALUES ('1702', '192', '桂阳县', '0');
INSERT INTO `ewei_district` VALUES ('1703', '192', '宜章县', '0');
INSERT INTO `ewei_district` VALUES ('1704', '192', '永兴县', '0');
INSERT INTO `ewei_district` VALUES ('1705', '192', '嘉禾县', '0');
INSERT INTO `ewei_district` VALUES ('1706', '192', '临武县', '0');
INSERT INTO `ewei_district` VALUES ('1707', '192', '汝城县', '0');
INSERT INTO `ewei_district` VALUES ('1708', '192', '桂东县', '0');
INSERT INTO `ewei_district` VALUES ('1709', '192', '安仁县', '0');
INSERT INTO `ewei_district` VALUES ('1710', '192', '资兴市', '0');
INSERT INTO `ewei_district` VALUES ('1711', '193', '芝山区', '0');
INSERT INTO `ewei_district` VALUES ('1712', '193', '冷水滩区', '0');
INSERT INTO `ewei_district` VALUES ('1713', '193', '祁阳县', '0');
INSERT INTO `ewei_district` VALUES ('1714', '193', '东安县', '0');
INSERT INTO `ewei_district` VALUES ('1715', '193', '双牌县', '0');
INSERT INTO `ewei_district` VALUES ('1716', '193', '道县', '0');
INSERT INTO `ewei_district` VALUES ('1717', '193', '江永县', '0');
INSERT INTO `ewei_district` VALUES ('1718', '193', '宁远县', '0');
INSERT INTO `ewei_district` VALUES ('1719', '193', '蓝山县', '0');
INSERT INTO `ewei_district` VALUES ('1720', '193', '新田县', '0');
INSERT INTO `ewei_district` VALUES ('1721', '193', '江华瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1722', '194', '鹤城区', '0');
INSERT INTO `ewei_district` VALUES ('1723', '194', '中方县', '0');
INSERT INTO `ewei_district` VALUES ('1724', '194', '沅陵县', '0');
INSERT INTO `ewei_district` VALUES ('1725', '194', '辰溪县', '0');
INSERT INTO `ewei_district` VALUES ('1726', '194', '溆浦县', '0');
INSERT INTO `ewei_district` VALUES ('1727', '194', '会同县', '0');
INSERT INTO `ewei_district` VALUES ('1728', '194', '麻阳苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1729', '194', '新晃侗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1730', '194', '芷江侗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1731', '194', '靖州苗族侗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1732', '194', '通道侗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1733', '194', '洪江市', '0');
INSERT INTO `ewei_district` VALUES ('1734', '195', '娄星区', '0');
INSERT INTO `ewei_district` VALUES ('1735', '195', '双峰县', '0');
INSERT INTO `ewei_district` VALUES ('1736', '195', '新化县', '0');
INSERT INTO `ewei_district` VALUES ('1737', '195', '冷水江市', '0');
INSERT INTO `ewei_district` VALUES ('1738', '195', '涟源市', '0');
INSERT INTO `ewei_district` VALUES ('1739', '196', '吉首市', '0');
INSERT INTO `ewei_district` VALUES ('1740', '196', '泸溪县', '0');
INSERT INTO `ewei_district` VALUES ('1741', '196', '凤凰县', '0');
INSERT INTO `ewei_district` VALUES ('1742', '196', '花垣县', '0');
INSERT INTO `ewei_district` VALUES ('1743', '196', '保靖县', '0');
INSERT INTO `ewei_district` VALUES ('1744', '196', '古丈县', '0');
INSERT INTO `ewei_district` VALUES ('1745', '196', '永顺县', '0');
INSERT INTO `ewei_district` VALUES ('1746', '196', '龙山县', '0');
INSERT INTO `ewei_district` VALUES ('1747', '197', '东山区', '0');
INSERT INTO `ewei_district` VALUES ('1748', '197', '荔湾区', '0');
INSERT INTO `ewei_district` VALUES ('1749', '197', '越秀区', '0');
INSERT INTO `ewei_district` VALUES ('1750', '197', '海珠区', '0');
INSERT INTO `ewei_district` VALUES ('1751', '197', '天河区', '0');
INSERT INTO `ewei_district` VALUES ('1752', '197', '芳村区', '0');
INSERT INTO `ewei_district` VALUES ('1753', '197', '白云区', '0');
INSERT INTO `ewei_district` VALUES ('1754', '197', '黄埔区', '0');
INSERT INTO `ewei_district` VALUES ('1755', '197', '番禺区', '0');
INSERT INTO `ewei_district` VALUES ('1756', '197', '花都区', '0');
INSERT INTO `ewei_district` VALUES ('1757', '197', '增城市', '0');
INSERT INTO `ewei_district` VALUES ('1759', '198', '武江区', '0');
INSERT INTO `ewei_district` VALUES ('1760', '198', '浈江区', '0');
INSERT INTO `ewei_district` VALUES ('1761', '198', '曲江区', '0');
INSERT INTO `ewei_district` VALUES ('1762', '198', '始兴县', '0');
INSERT INTO `ewei_district` VALUES ('1763', '198', '仁化县', '0');
INSERT INTO `ewei_district` VALUES ('1764', '198', '翁源县', '0');
INSERT INTO `ewei_district` VALUES ('1765', '198', '乳源瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1766', '198', '新丰县', '0');
INSERT INTO `ewei_district` VALUES ('1767', '198', '乐昌市', '0');
INSERT INTO `ewei_district` VALUES ('1768', '198', '南雄市', '0');
INSERT INTO `ewei_district` VALUES ('1769', '199', '罗湖区', '0');
INSERT INTO `ewei_district` VALUES ('1770', '199', '福田区', '0');
INSERT INTO `ewei_district` VALUES ('1771', '199', '南山区', '0');
INSERT INTO `ewei_district` VALUES ('1772', '199', '宝安区', '0');
INSERT INTO `ewei_district` VALUES ('1773', '199', '龙岗区', '0');
INSERT INTO `ewei_district` VALUES ('1774', '199', '盐田区', '0');
INSERT INTO `ewei_district` VALUES ('1775', '200', '香洲区', '0');
INSERT INTO `ewei_district` VALUES ('1776', '200', '斗门区', '0');
INSERT INTO `ewei_district` VALUES ('1777', '200', '金湾区', '0');
INSERT INTO `ewei_district` VALUES ('1778', '201', '龙湖区', '0');
INSERT INTO `ewei_district` VALUES ('1779', '201', '金平区', '0');
INSERT INTO `ewei_district` VALUES ('1780', '201', '濠江区', '0');
INSERT INTO `ewei_district` VALUES ('1781', '201', '潮阳区', '0');
INSERT INTO `ewei_district` VALUES ('1782', '201', '潮南区', '0');
INSERT INTO `ewei_district` VALUES ('1783', '201', '澄海区', '0');
INSERT INTO `ewei_district` VALUES ('1784', '201', '南澳县', '0');
INSERT INTO `ewei_district` VALUES ('1785', '202', '禅城区', '0');
INSERT INTO `ewei_district` VALUES ('1786', '202', '南海区', '0');
INSERT INTO `ewei_district` VALUES ('1787', '202', '顺德区', '0');
INSERT INTO `ewei_district` VALUES ('1788', '202', '三水区', '0');
INSERT INTO `ewei_district` VALUES ('1789', '202', '高明区', '0');
INSERT INTO `ewei_district` VALUES ('1790', '203', '蓬江区', '0');
INSERT INTO `ewei_district` VALUES ('1791', '203', '江海区', '0');
INSERT INTO `ewei_district` VALUES ('1792', '203', '新会区', '0');
INSERT INTO `ewei_district` VALUES ('1793', '203', '台山市', '0');
INSERT INTO `ewei_district` VALUES ('1794', '203', '开平市', '0');
INSERT INTO `ewei_district` VALUES ('1795', '203', '鹤山市', '0');
INSERT INTO `ewei_district` VALUES ('1796', '203', '恩平市', '0');
INSERT INTO `ewei_district` VALUES ('1797', '204', '赤坎区', '0');
INSERT INTO `ewei_district` VALUES ('1798', '204', '霞山区', '0');
INSERT INTO `ewei_district` VALUES ('1799', '204', '坡头区', '0');
INSERT INTO `ewei_district` VALUES ('1800', '204', '麻章区', '0');
INSERT INTO `ewei_district` VALUES ('1801', '204', '遂溪县', '0');
INSERT INTO `ewei_district` VALUES ('1802', '204', '徐闻县', '0');
INSERT INTO `ewei_district` VALUES ('1803', '204', '廉江市', '0');
INSERT INTO `ewei_district` VALUES ('1804', '204', '雷州市', '0');
INSERT INTO `ewei_district` VALUES ('1805', '204', '吴川市', '0');
INSERT INTO `ewei_district` VALUES ('1806', '205', '茂南区', '0');
INSERT INTO `ewei_district` VALUES ('1807', '205', '茂港区', '0');
INSERT INTO `ewei_district` VALUES ('1808', '205', '电白县', '0');
INSERT INTO `ewei_district` VALUES ('1809', '205', '高州市', '0');
INSERT INTO `ewei_district` VALUES ('1810', '205', '化州市', '0');
INSERT INTO `ewei_district` VALUES ('1811', '205', '信宜市', '0');
INSERT INTO `ewei_district` VALUES ('1812', '206', '端州区', '0');
INSERT INTO `ewei_district` VALUES ('1813', '206', '鼎湖区', '0');
INSERT INTO `ewei_district` VALUES ('1814', '206', '广宁县', '0');
INSERT INTO `ewei_district` VALUES ('1815', '206', '怀集县', '0');
INSERT INTO `ewei_district` VALUES ('1816', '206', '封开县', '0');
INSERT INTO `ewei_district` VALUES ('1817', '206', '德庆县', '0');
INSERT INTO `ewei_district` VALUES ('1818', '206', '高要市', '0');
INSERT INTO `ewei_district` VALUES ('1819', '206', '四会市', '0');
INSERT INTO `ewei_district` VALUES ('1820', '207', '惠城区', '0');
INSERT INTO `ewei_district` VALUES ('1821', '207', '惠阳区', '0');
INSERT INTO `ewei_district` VALUES ('1822', '207', '博罗县', '0');
INSERT INTO `ewei_district` VALUES ('1823', '207', '惠东县', '0');
INSERT INTO `ewei_district` VALUES ('1824', '207', '龙门县', '0');
INSERT INTO `ewei_district` VALUES ('1825', '208', '梅江区', '0');
INSERT INTO `ewei_district` VALUES ('1826', '208', '梅县', '0');
INSERT INTO `ewei_district` VALUES ('1827', '208', '大埔县', '0');
INSERT INTO `ewei_district` VALUES ('1828', '208', '丰顺县', '0');
INSERT INTO `ewei_district` VALUES ('1829', '208', '五华县', '0');
INSERT INTO `ewei_district` VALUES ('1830', '208', '平远县', '0');
INSERT INTO `ewei_district` VALUES ('1831', '208', '蕉岭县', '0');
INSERT INTO `ewei_district` VALUES ('1832', '208', '兴宁市', '0');
INSERT INTO `ewei_district` VALUES ('1833', '209', '城区', '0');
INSERT INTO `ewei_district` VALUES ('1834', '209', '海丰县', '0');
INSERT INTO `ewei_district` VALUES ('1835', '209', '陆河县', '0');
INSERT INTO `ewei_district` VALUES ('1836', '209', '陆丰市', '0');
INSERT INTO `ewei_district` VALUES ('1837', '210', '源城区', '0');
INSERT INTO `ewei_district` VALUES ('1838', '210', '紫金县', '0');
INSERT INTO `ewei_district` VALUES ('1839', '210', '龙川县', '0');
INSERT INTO `ewei_district` VALUES ('1840', '210', '连平县', '0');
INSERT INTO `ewei_district` VALUES ('1841', '210', '和平县', '0');
INSERT INTO `ewei_district` VALUES ('1842', '210', '东源县', '0');
INSERT INTO `ewei_district` VALUES ('1843', '211', '江城区', '0');
INSERT INTO `ewei_district` VALUES ('1844', '211', '阳西县', '0');
INSERT INTO `ewei_district` VALUES ('1845', '211', '阳东县', '0');
INSERT INTO `ewei_district` VALUES ('1846', '211', '阳春市', '0');
INSERT INTO `ewei_district` VALUES ('1847', '212', '清城区', '0');
INSERT INTO `ewei_district` VALUES ('1848', '212', '佛冈县', '0');
INSERT INTO `ewei_district` VALUES ('1849', '212', '阳山县', '0');
INSERT INTO `ewei_district` VALUES ('1850', '212', '连山壮族瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1851', '212', '连南瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1852', '212', '清新县', '0');
INSERT INTO `ewei_district` VALUES ('1853', '212', '英德市', '0');
INSERT INTO `ewei_district` VALUES ('1854', '212', '连州市', '0');
INSERT INTO `ewei_district` VALUES ('1855', '215', '湘桥区', '0');
INSERT INTO `ewei_district` VALUES ('1856', '215', '潮安县', '0');
INSERT INTO `ewei_district` VALUES ('1857', '215', '饶平县', '0');
INSERT INTO `ewei_district` VALUES ('1858', '216', '榕城区', '0');
INSERT INTO `ewei_district` VALUES ('1859', '216', '揭东县', '0');
INSERT INTO `ewei_district` VALUES ('1860', '216', '揭西县', '0');
INSERT INTO `ewei_district` VALUES ('1861', '216', '惠来县', '0');
INSERT INTO `ewei_district` VALUES ('1862', '216', '普宁市', '0');
INSERT INTO `ewei_district` VALUES ('1863', '217', '云城区', '0');
INSERT INTO `ewei_district` VALUES ('1864', '217', '新兴县', '0');
INSERT INTO `ewei_district` VALUES ('1865', '217', '郁南县', '0');
INSERT INTO `ewei_district` VALUES ('1866', '217', '云安县', '0');
INSERT INTO `ewei_district` VALUES ('1867', '217', '罗定市', '0');
INSERT INTO `ewei_district` VALUES ('1868', '218', '兴宁区', '0');
INSERT INTO `ewei_district` VALUES ('1869', '218', '青秀区', '0');
INSERT INTO `ewei_district` VALUES ('1870', '218', '江南区', '0');
INSERT INTO `ewei_district` VALUES ('1871', '218', '西乡塘区', '0');
INSERT INTO `ewei_district` VALUES ('1872', '218', '良庆区', '0');
INSERT INTO `ewei_district` VALUES ('1873', '218', '邕宁区', '0');
INSERT INTO `ewei_district` VALUES ('1874', '218', '武鸣县', '0');
INSERT INTO `ewei_district` VALUES ('1875', '218', '隆安县', '0');
INSERT INTO `ewei_district` VALUES ('1876', '218', '马山县', '0');
INSERT INTO `ewei_district` VALUES ('1877', '218', '上林县', '0');
INSERT INTO `ewei_district` VALUES ('1878', '218', '宾阳县', '0');
INSERT INTO `ewei_district` VALUES ('1879', '218', '横县', '0');
INSERT INTO `ewei_district` VALUES ('1880', '219', '城中区', '0');
INSERT INTO `ewei_district` VALUES ('1881', '219', '鱼峰区', '0');
INSERT INTO `ewei_district` VALUES ('1882', '219', '柳南区', '0');
INSERT INTO `ewei_district` VALUES ('1883', '219', '柳北区', '0');
INSERT INTO `ewei_district` VALUES ('1884', '219', '柳江县', '0');
INSERT INTO `ewei_district` VALUES ('1885', '219', '柳城县', '0');
INSERT INTO `ewei_district` VALUES ('1886', '219', '鹿寨县', '0');
INSERT INTO `ewei_district` VALUES ('1887', '219', '融安县', '0');
INSERT INTO `ewei_district` VALUES ('1888', '219', '融水苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1889', '219', '三江侗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1890', '220', '秀峰区', '0');
INSERT INTO `ewei_district` VALUES ('1891', '220', '叠彩区', '0');
INSERT INTO `ewei_district` VALUES ('1892', '220', '象山区', '0');
INSERT INTO `ewei_district` VALUES ('1893', '220', '七星区', '0');
INSERT INTO `ewei_district` VALUES ('1894', '220', '雁山区', '0');
INSERT INTO `ewei_district` VALUES ('1895', '220', '阳朔县', '0');
INSERT INTO `ewei_district` VALUES ('1896', '220', '临桂县', '0');
INSERT INTO `ewei_district` VALUES ('1897', '220', '灵川县', '0');
INSERT INTO `ewei_district` VALUES ('1898', '220', '全州县', '0');
INSERT INTO `ewei_district` VALUES ('1899', '220', '兴安县', '0');
INSERT INTO `ewei_district` VALUES ('1900', '220', '永福县', '0');
INSERT INTO `ewei_district` VALUES ('1901', '220', '灌阳县', '0');
INSERT INTO `ewei_district` VALUES ('1902', '220', '龙胜各族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1903', '220', '资源县', '0');
INSERT INTO `ewei_district` VALUES ('1904', '220', '平乐县', '0');
INSERT INTO `ewei_district` VALUES ('1905', '220', '荔蒲县', '0');
INSERT INTO `ewei_district` VALUES ('1906', '220', '恭城瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1907', '221', '万秀区', '0');
INSERT INTO `ewei_district` VALUES ('1908', '221', '蝶山区', '0');
INSERT INTO `ewei_district` VALUES ('1909', '221', '长洲区', '0');
INSERT INTO `ewei_district` VALUES ('1910', '221', '苍梧县', '0');
INSERT INTO `ewei_district` VALUES ('1911', '221', '藤县', '0');
INSERT INTO `ewei_district` VALUES ('1912', '221', '蒙山县', '0');
INSERT INTO `ewei_district` VALUES ('1913', '221', '岑溪市', '0');
INSERT INTO `ewei_district` VALUES ('1914', '222', '海城区', '0');
INSERT INTO `ewei_district` VALUES ('1915', '222', '银海区', '0');
INSERT INTO `ewei_district` VALUES ('1916', '222', '铁山港区', '0');
INSERT INTO `ewei_district` VALUES ('1917', '222', '合浦县', '0');
INSERT INTO `ewei_district` VALUES ('1918', '223', '港口区', '0');
INSERT INTO `ewei_district` VALUES ('1919', '223', '防城区', '0');
INSERT INTO `ewei_district` VALUES ('1920', '223', '上思县', '0');
INSERT INTO `ewei_district` VALUES ('1921', '223', '东兴市', '0');
INSERT INTO `ewei_district` VALUES ('1922', '224', '钦南区', '0');
INSERT INTO `ewei_district` VALUES ('1923', '224', '钦北区', '0');
INSERT INTO `ewei_district` VALUES ('1924', '224', '灵山县', '0');
INSERT INTO `ewei_district` VALUES ('1925', '224', '浦北县', '0');
INSERT INTO `ewei_district` VALUES ('1926', '225', '港北区', '0');
INSERT INTO `ewei_district` VALUES ('1927', '225', '港南区', '0');
INSERT INTO `ewei_district` VALUES ('1928', '225', '覃塘区', '0');
INSERT INTO `ewei_district` VALUES ('1929', '225', '平南县', '0');
INSERT INTO `ewei_district` VALUES ('1930', '225', '桂平市', '0');
INSERT INTO `ewei_district` VALUES ('1931', '226', '玉州区', '0');
INSERT INTO `ewei_district` VALUES ('1932', '226', '容县', '0');
INSERT INTO `ewei_district` VALUES ('1933', '226', '陆川县', '0');
INSERT INTO `ewei_district` VALUES ('1934', '226', '博白县', '0');
INSERT INTO `ewei_district` VALUES ('1935', '226', '兴业县', '0');
INSERT INTO `ewei_district` VALUES ('1936', '226', '北流市', '0');
INSERT INTO `ewei_district` VALUES ('1937', '227', '右江区', '0');
INSERT INTO `ewei_district` VALUES ('1938', '227', '田阳县', '0');
INSERT INTO `ewei_district` VALUES ('1939', '227', '田东县', '0');
INSERT INTO `ewei_district` VALUES ('1940', '227', '平果县', '0');
INSERT INTO `ewei_district` VALUES ('1941', '227', '德保县', '0');
INSERT INTO `ewei_district` VALUES ('1942', '227', '靖西县', '0');
INSERT INTO `ewei_district` VALUES ('1943', '227', '那坡县', '0');
INSERT INTO `ewei_district` VALUES ('1944', '227', '凌云县', '0');
INSERT INTO `ewei_district` VALUES ('1945', '227', '乐业县', '0');
INSERT INTO `ewei_district` VALUES ('1946', '227', '田林县', '0');
INSERT INTO `ewei_district` VALUES ('1947', '227', '西林县', '0');
INSERT INTO `ewei_district` VALUES ('1948', '227', '隆林各族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1949', '228', '八步区', '0');
INSERT INTO `ewei_district` VALUES ('1950', '228', '昭平县', '0');
INSERT INTO `ewei_district` VALUES ('1951', '228', '钟山县', '0');
INSERT INTO `ewei_district` VALUES ('1952', '228', '富川瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1953', '229', '金城江区', '0');
INSERT INTO `ewei_district` VALUES ('1954', '229', '南丹县', '0');
INSERT INTO `ewei_district` VALUES ('1955', '229', '天峨县', '0');
INSERT INTO `ewei_district` VALUES ('1956', '229', '凤山县', '0');
INSERT INTO `ewei_district` VALUES ('1957', '229', '东兰县', '0');
INSERT INTO `ewei_district` VALUES ('1958', '229', '罗城仫佬族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1959', '229', '环江毛南族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1960', '229', '巴马瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1961', '229', '都安瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1962', '229', '大化瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1963', '229', '宜州市', '0');
INSERT INTO `ewei_district` VALUES ('1964', '230', '兴宾区', '0');
INSERT INTO `ewei_district` VALUES ('1965', '230', '忻城县', '0');
INSERT INTO `ewei_district` VALUES ('1966', '230', '象州县', '0');
INSERT INTO `ewei_district` VALUES ('1967', '230', '武宣县', '0');
INSERT INTO `ewei_district` VALUES ('1968', '230', '金秀瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1969', '230', '合山市', '0');
INSERT INTO `ewei_district` VALUES ('1970', '231', '江洲区', '0');
INSERT INTO `ewei_district` VALUES ('1971', '231', '扶绥县', '0');
INSERT INTO `ewei_district` VALUES ('1972', '231', '宁明县', '0');
INSERT INTO `ewei_district` VALUES ('1973', '231', '龙州县', '0');
INSERT INTO `ewei_district` VALUES ('1974', '231', '大新县', '0');
INSERT INTO `ewei_district` VALUES ('1975', '231', '天等县', '0');
INSERT INTO `ewei_district` VALUES ('1976', '231', '凭祥市', '0');
INSERT INTO `ewei_district` VALUES ('1977', '232', '秀英区', '0');
INSERT INTO `ewei_district` VALUES ('1978', '232', '龙华区', '0');
INSERT INTO `ewei_district` VALUES ('1979', '232', '琼山区', '0');
INSERT INTO `ewei_district` VALUES ('1980', '232', '美兰区', '0');
INSERT INTO `ewei_district` VALUES ('1981', '233', '五指山市', '0');
INSERT INTO `ewei_district` VALUES ('1982', '233', '琼海市', '0');
INSERT INTO `ewei_district` VALUES ('1983', '233', '儋州市', '0');
INSERT INTO `ewei_district` VALUES ('1984', '233', '文昌市', '0');
INSERT INTO `ewei_district` VALUES ('1985', '233', '万宁市', '0');
INSERT INTO `ewei_district` VALUES ('1986', '233', '东方市', '0');
INSERT INTO `ewei_district` VALUES ('1987', '233', '定安县', '0');
INSERT INTO `ewei_district` VALUES ('1988', '233', '屯昌县', '0');
INSERT INTO `ewei_district` VALUES ('1989', '233', '澄迈县', '0');
INSERT INTO `ewei_district` VALUES ('1990', '233', '临高县', '0');
INSERT INTO `ewei_district` VALUES ('1991', '233', '白沙黎族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1992', '233', '昌江黎族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1993', '233', '乐东黎族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1994', '233', '陵水黎族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1995', '233', '保亭黎族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1996', '233', '琼中黎族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('1997', '233', '西沙群岛', '0');
INSERT INTO `ewei_district` VALUES ('1998', '233', '南沙群岛', '0');
INSERT INTO `ewei_district` VALUES ('1999', '233', '中沙群岛的岛礁及其海域', '0');
INSERT INTO `ewei_district` VALUES ('2000', '234', '万州区', '0');
INSERT INTO `ewei_district` VALUES ('2001', '234', '涪陵区', '0');
INSERT INTO `ewei_district` VALUES ('2002', '234', '渝中区', '0');
INSERT INTO `ewei_district` VALUES ('2003', '234', '大渡口区', '0');
INSERT INTO `ewei_district` VALUES ('2004', '234', '江北区', '0');
INSERT INTO `ewei_district` VALUES ('2005', '234', '沙坪坝区', '0');
INSERT INTO `ewei_district` VALUES ('2006', '234', '九龙坡区', '0');
INSERT INTO `ewei_district` VALUES ('2007', '234', '南岸区', '0');
INSERT INTO `ewei_district` VALUES ('2008', '234', '北碚区', '0');
INSERT INTO `ewei_district` VALUES ('2009', '234', '万盛区', '0');
INSERT INTO `ewei_district` VALUES ('2010', '234', '双桥区', '0');
INSERT INTO `ewei_district` VALUES ('2011', '234', '渝北区', '0');
INSERT INTO `ewei_district` VALUES ('2012', '234', '巴南区', '0');
INSERT INTO `ewei_district` VALUES ('2013', '234', '黔江区', '0');
INSERT INTO `ewei_district` VALUES ('2014', '234', '长寿区', '0');
INSERT INTO `ewei_district` VALUES ('2015', '234', '綦江县', '0');
INSERT INTO `ewei_district` VALUES ('2016', '234', '潼南县', '0');
INSERT INTO `ewei_district` VALUES ('2017', '234', '铜梁县', '0');
INSERT INTO `ewei_district` VALUES ('2018', '234', '大足县', '0');
INSERT INTO `ewei_district` VALUES ('2019', '234', '荣昌县', '0');
INSERT INTO `ewei_district` VALUES ('2020', '234', '璧山县', '0');
INSERT INTO `ewei_district` VALUES ('2021', '234', '梁平县', '0');
INSERT INTO `ewei_district` VALUES ('2022', '234', '城口县', '0');
INSERT INTO `ewei_district` VALUES ('2023', '234', '丰都县', '0');
INSERT INTO `ewei_district` VALUES ('2024', '234', '垫江县', '0');
INSERT INTO `ewei_district` VALUES ('2025', '234', '武隆县', '0');
INSERT INTO `ewei_district` VALUES ('2026', '234', '忠县', '0');
INSERT INTO `ewei_district` VALUES ('2027', '234', '开县', '0');
INSERT INTO `ewei_district` VALUES ('2028', '234', '云阳县', '0');
INSERT INTO `ewei_district` VALUES ('2029', '234', '奉节县', '0');
INSERT INTO `ewei_district` VALUES ('2030', '234', '巫山县', '0');
INSERT INTO `ewei_district` VALUES ('2031', '234', '巫溪县', '0');
INSERT INTO `ewei_district` VALUES ('2032', '234', '石柱土家族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2033', '234', '秀山土家族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2034', '234', '酉阳土家族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2035', '234', '彭水苗族土家族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2036', '234', '江津市', '0');
INSERT INTO `ewei_district` VALUES ('2037', '234', '合川市', '0');
INSERT INTO `ewei_district` VALUES ('2038', '234', '永川市', '0');
INSERT INTO `ewei_district` VALUES ('2039', '234', '南川市', '0');
INSERT INTO `ewei_district` VALUES ('2040', '235', '锦江区', '0');
INSERT INTO `ewei_district` VALUES ('2041', '235', '青羊区', '0');
INSERT INTO `ewei_district` VALUES ('2042', '235', '金牛区', '0');
INSERT INTO `ewei_district` VALUES ('2043', '235', '武侯区', '0');
INSERT INTO `ewei_district` VALUES ('2044', '235', '成华区', '0');
INSERT INTO `ewei_district` VALUES ('2045', '235', '龙泉驿区', '0');
INSERT INTO `ewei_district` VALUES ('2046', '235', '青白江区', '0');
INSERT INTO `ewei_district` VALUES ('2047', '235', '新都区', '0');
INSERT INTO `ewei_district` VALUES ('2048', '235', '温江区', '0');
INSERT INTO `ewei_district` VALUES ('2049', '235', '金堂县', '0');
INSERT INTO `ewei_district` VALUES ('2050', '235', '双流县', '0');
INSERT INTO `ewei_district` VALUES ('2051', '235', '郫县', '0');
INSERT INTO `ewei_district` VALUES ('2052', '235', '大邑县', '0');
INSERT INTO `ewei_district` VALUES ('2053', '235', '蒲江县', '0');
INSERT INTO `ewei_district` VALUES ('2054', '235', '新津县', '0');
INSERT INTO `ewei_district` VALUES ('2055', '235', '都江堰市', '0');
INSERT INTO `ewei_district` VALUES ('2056', '235', '彭州市', '0');
INSERT INTO `ewei_district` VALUES ('2057', '235', '邛崃市', '0');
INSERT INTO `ewei_district` VALUES ('2058', '235', '崇州市', '0');
INSERT INTO `ewei_district` VALUES ('2059', '236', '自流井区', '0');
INSERT INTO `ewei_district` VALUES ('2060', '236', '贡井区', '0');
INSERT INTO `ewei_district` VALUES ('2061', '236', '大安区', '0');
INSERT INTO `ewei_district` VALUES ('2062', '236', '沿滩区', '0');
INSERT INTO `ewei_district` VALUES ('2063', '236', '荣县', '0');
INSERT INTO `ewei_district` VALUES ('2064', '236', '富顺县', '0');
INSERT INTO `ewei_district` VALUES ('2065', '237', '东区', '0');
INSERT INTO `ewei_district` VALUES ('2066', '237', '西区', '0');
INSERT INTO `ewei_district` VALUES ('2067', '237', '仁和区', '0');
INSERT INTO `ewei_district` VALUES ('2068', '237', '米易县', '0');
INSERT INTO `ewei_district` VALUES ('2069', '237', '盐边县', '0');
INSERT INTO `ewei_district` VALUES ('2070', '238', '江阳区', '0');
INSERT INTO `ewei_district` VALUES ('2071', '238', '纳溪区', '0');
INSERT INTO `ewei_district` VALUES ('2072', '238', '龙马潭区', '0');
INSERT INTO `ewei_district` VALUES ('2073', '238', '泸县', '0');
INSERT INTO `ewei_district` VALUES ('2074', '238', '合江县', '0');
INSERT INTO `ewei_district` VALUES ('2075', '238', '叙永县', '0');
INSERT INTO `ewei_district` VALUES ('2076', '238', '古蔺县', '0');
INSERT INTO `ewei_district` VALUES ('2077', '239', '旌阳区', '0');
INSERT INTO `ewei_district` VALUES ('2078', '239', '中江县', '0');
INSERT INTO `ewei_district` VALUES ('2079', '239', '罗江县', '0');
INSERT INTO `ewei_district` VALUES ('2080', '239', '广汉市', '0');
INSERT INTO `ewei_district` VALUES ('2081', '239', '什邡市', '0');
INSERT INTO `ewei_district` VALUES ('2082', '239', '绵竹市', '0');
INSERT INTO `ewei_district` VALUES ('2083', '240', '涪城区', '0');
INSERT INTO `ewei_district` VALUES ('2084', '240', '游仙区', '0');
INSERT INTO `ewei_district` VALUES ('2085', '240', '三台县', '0');
INSERT INTO `ewei_district` VALUES ('2086', '240', '盐亭县', '0');
INSERT INTO `ewei_district` VALUES ('2087', '240', '安县', '0');
INSERT INTO `ewei_district` VALUES ('2088', '240', '梓潼县', '0');
INSERT INTO `ewei_district` VALUES ('2089', '240', '北川羌族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2090', '240', '平武县', '0');
INSERT INTO `ewei_district` VALUES ('2091', '240', '江油市', '0');
INSERT INTO `ewei_district` VALUES ('2092', '241', '市中区', '0');
INSERT INTO `ewei_district` VALUES ('2093', '241', '元坝区', '0');
INSERT INTO `ewei_district` VALUES ('2094', '241', '朝天区', '0');
INSERT INTO `ewei_district` VALUES ('2095', '241', '旺苍县', '0');
INSERT INTO `ewei_district` VALUES ('2096', '241', '青川县', '0');
INSERT INTO `ewei_district` VALUES ('2097', '241', '剑阁县', '0');
INSERT INTO `ewei_district` VALUES ('2098', '241', '苍溪县', '0');
INSERT INTO `ewei_district` VALUES ('2099', '242', '船山区', '0');
INSERT INTO `ewei_district` VALUES ('2100', '242', '安居区', '0');
INSERT INTO `ewei_district` VALUES ('2101', '242', '蓬溪县', '0');
INSERT INTO `ewei_district` VALUES ('2102', '242', '射洪县', '0');
INSERT INTO `ewei_district` VALUES ('2103', '242', '大英县', '0');
INSERT INTO `ewei_district` VALUES ('2104', '243', '市中区', '0');
INSERT INTO `ewei_district` VALUES ('2105', '243', '东兴区', '0');
INSERT INTO `ewei_district` VALUES ('2106', '243', '威远县', '0');
INSERT INTO `ewei_district` VALUES ('2107', '243', '资中县', '0');
INSERT INTO `ewei_district` VALUES ('2108', '243', '隆昌县', '0');
INSERT INTO `ewei_district` VALUES ('2109', '244', '市中区', '0');
INSERT INTO `ewei_district` VALUES ('2110', '244', '沙湾区', '0');
INSERT INTO `ewei_district` VALUES ('2111', '244', '五通桥区', '0');
INSERT INTO `ewei_district` VALUES ('2112', '244', '金口河区', '0');
INSERT INTO `ewei_district` VALUES ('2113', '244', '犍为县', '0');
INSERT INTO `ewei_district` VALUES ('2114', '244', '井研县', '0');
INSERT INTO `ewei_district` VALUES ('2115', '244', '夹江县', '0');
INSERT INTO `ewei_district` VALUES ('2116', '244', '沐川县', '0');
INSERT INTO `ewei_district` VALUES ('2117', '244', '峨边彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2118', '244', '马边彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2119', '244', '峨眉山市', '0');
INSERT INTO `ewei_district` VALUES ('2120', '245', '顺庆区', '0');
INSERT INTO `ewei_district` VALUES ('2121', '245', '高坪区', '0');
INSERT INTO `ewei_district` VALUES ('2122', '245', '嘉陵区', '0');
INSERT INTO `ewei_district` VALUES ('2123', '245', '南部县', '0');
INSERT INTO `ewei_district` VALUES ('2124', '245', '营山县', '0');
INSERT INTO `ewei_district` VALUES ('2125', '245', '蓬安县', '0');
INSERT INTO `ewei_district` VALUES ('2126', '245', '仪陇县', '0');
INSERT INTO `ewei_district` VALUES ('2127', '245', '西充县', '0');
INSERT INTO `ewei_district` VALUES ('2128', '245', '阆中市', '0');
INSERT INTO `ewei_district` VALUES ('2129', '246', '东坡区', '0');
INSERT INTO `ewei_district` VALUES ('2130', '246', '仁寿县', '0');
INSERT INTO `ewei_district` VALUES ('2131', '246', '彭山县', '0');
INSERT INTO `ewei_district` VALUES ('2132', '246', '洪雅县', '0');
INSERT INTO `ewei_district` VALUES ('2133', '246', '丹棱县', '0');
INSERT INTO `ewei_district` VALUES ('2134', '246', '青神县', '0');
INSERT INTO `ewei_district` VALUES ('2135', '247', '翠屏区', '0');
INSERT INTO `ewei_district` VALUES ('2136', '247', '宜宾县', '0');
INSERT INTO `ewei_district` VALUES ('2137', '247', '南溪县', '0');
INSERT INTO `ewei_district` VALUES ('2138', '247', '江安县', '0');
INSERT INTO `ewei_district` VALUES ('2139', '247', '长宁县', '0');
INSERT INTO `ewei_district` VALUES ('2140', '247', '高县', '0');
INSERT INTO `ewei_district` VALUES ('2141', '247', '珙县', '0');
INSERT INTO `ewei_district` VALUES ('2142', '247', '筠连县', '0');
INSERT INTO `ewei_district` VALUES ('2143', '247', '兴文县', '0');
INSERT INTO `ewei_district` VALUES ('2144', '247', '屏山县', '0');
INSERT INTO `ewei_district` VALUES ('2145', '248', '广安区', '0');
INSERT INTO `ewei_district` VALUES ('2146', '248', '岳池县', '0');
INSERT INTO `ewei_district` VALUES ('2147', '248', '武胜县', '0');
INSERT INTO `ewei_district` VALUES ('2148', '248', '邻水县', '0');
INSERT INTO `ewei_district` VALUES ('2149', '248', '华蓥市', '0');
INSERT INTO `ewei_district` VALUES ('2150', '249', '通川区', '0');
INSERT INTO `ewei_district` VALUES ('2151', '249', '达县', '0');
INSERT INTO `ewei_district` VALUES ('2152', '249', '宣汉县', '0');
INSERT INTO `ewei_district` VALUES ('2153', '249', '开江县', '0');
INSERT INTO `ewei_district` VALUES ('2154', '249', '大竹县', '0');
INSERT INTO `ewei_district` VALUES ('2155', '249', '渠县', '0');
INSERT INTO `ewei_district` VALUES ('2156', '249', '万源市', '0');
INSERT INTO `ewei_district` VALUES ('2157', '250', '雨城区', '0');
INSERT INTO `ewei_district` VALUES ('2158', '250', '名山县', '0');
INSERT INTO `ewei_district` VALUES ('2159', '250', '荥经县', '0');
INSERT INTO `ewei_district` VALUES ('2160', '250', '汉源县', '0');
INSERT INTO `ewei_district` VALUES ('2161', '250', '石棉县', '0');
INSERT INTO `ewei_district` VALUES ('2162', '250', '天全县', '0');
INSERT INTO `ewei_district` VALUES ('2163', '250', '芦山县', '0');
INSERT INTO `ewei_district` VALUES ('2164', '250', '宝兴县', '0');
INSERT INTO `ewei_district` VALUES ('2165', '251', '巴州区', '0');
INSERT INTO `ewei_district` VALUES ('2166', '251', '通江县', '0');
INSERT INTO `ewei_district` VALUES ('2167', '251', '南江县', '0');
INSERT INTO `ewei_district` VALUES ('2168', '251', '平昌县', '0');
INSERT INTO `ewei_district` VALUES ('2169', '252', '雁江区', '0');
INSERT INTO `ewei_district` VALUES ('2170', '252', '安岳县', '0');
INSERT INTO `ewei_district` VALUES ('2171', '252', '乐至县', '0');
INSERT INTO `ewei_district` VALUES ('2172', '252', '简阳市', '0');
INSERT INTO `ewei_district` VALUES ('2173', '253', '汶川县', '0');
INSERT INTO `ewei_district` VALUES ('2174', '253', '理县', '0');
INSERT INTO `ewei_district` VALUES ('2175', '253', '茂县', '0');
INSERT INTO `ewei_district` VALUES ('2176', '253', '松潘县', '0');
INSERT INTO `ewei_district` VALUES ('2177', '253', '九寨沟县', '0');
INSERT INTO `ewei_district` VALUES ('2178', '253', '金川县', '0');
INSERT INTO `ewei_district` VALUES ('2179', '253', '小金县', '0');
INSERT INTO `ewei_district` VALUES ('2180', '253', '黑水县', '0');
INSERT INTO `ewei_district` VALUES ('2181', '253', '马尔康县', '0');
INSERT INTO `ewei_district` VALUES ('2182', '253', '壤塘县', '0');
INSERT INTO `ewei_district` VALUES ('2183', '253', '阿坝县', '0');
INSERT INTO `ewei_district` VALUES ('2184', '253', '若尔盖县', '0');
INSERT INTO `ewei_district` VALUES ('2185', '253', '红原县', '0');
INSERT INTO `ewei_district` VALUES ('2186', '254', '康定县', '0');
INSERT INTO `ewei_district` VALUES ('2187', '254', '泸定县', '0');
INSERT INTO `ewei_district` VALUES ('2188', '254', '丹巴县', '0');
INSERT INTO `ewei_district` VALUES ('2189', '254', '九龙县', '0');
INSERT INTO `ewei_district` VALUES ('2190', '254', '雅江县', '0');
INSERT INTO `ewei_district` VALUES ('2191', '254', '道孚县', '0');
INSERT INTO `ewei_district` VALUES ('2192', '254', '炉霍县', '0');
INSERT INTO `ewei_district` VALUES ('2193', '254', '甘孜县', '0');
INSERT INTO `ewei_district` VALUES ('2194', '254', '新龙县', '0');
INSERT INTO `ewei_district` VALUES ('2195', '254', '德格县', '0');
INSERT INTO `ewei_district` VALUES ('2196', '254', '白玉县', '0');
INSERT INTO `ewei_district` VALUES ('2197', '254', '石渠县', '0');
INSERT INTO `ewei_district` VALUES ('2198', '254', '色达县', '0');
INSERT INTO `ewei_district` VALUES ('2199', '254', '理塘县', '0');
INSERT INTO `ewei_district` VALUES ('2200', '254', '巴塘县', '0');
INSERT INTO `ewei_district` VALUES ('2201', '254', '乡城县', '0');
INSERT INTO `ewei_district` VALUES ('2202', '254', '稻城县', '0');
INSERT INTO `ewei_district` VALUES ('2203', '254', '得荣县', '0');
INSERT INTO `ewei_district` VALUES ('2204', '255', '西昌市', '0');
INSERT INTO `ewei_district` VALUES ('2205', '255', '木里藏族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2206', '255', '盐源县', '0');
INSERT INTO `ewei_district` VALUES ('2207', '255', '德昌县', '0');
INSERT INTO `ewei_district` VALUES ('2208', '255', '会理县', '0');
INSERT INTO `ewei_district` VALUES ('2209', '255', '会东县', '0');
INSERT INTO `ewei_district` VALUES ('2210', '255', '宁南县', '0');
INSERT INTO `ewei_district` VALUES ('2211', '255', '普格县', '0');
INSERT INTO `ewei_district` VALUES ('2212', '255', '布拖县', '0');
INSERT INTO `ewei_district` VALUES ('2213', '255', '金阳县', '0');
INSERT INTO `ewei_district` VALUES ('2214', '255', '昭觉县', '0');
INSERT INTO `ewei_district` VALUES ('2215', '255', '喜德县', '0');
INSERT INTO `ewei_district` VALUES ('2216', '255', '冕宁县', '0');
INSERT INTO `ewei_district` VALUES ('2217', '255', '越西县', '0');
INSERT INTO `ewei_district` VALUES ('2218', '255', '甘洛县', '0');
INSERT INTO `ewei_district` VALUES ('2219', '255', '美姑县', '0');
INSERT INTO `ewei_district` VALUES ('2220', '255', '雷波县', '0');
INSERT INTO `ewei_district` VALUES ('2221', '256', '南明区', '0');
INSERT INTO `ewei_district` VALUES ('2222', '256', '云岩区', '0');
INSERT INTO `ewei_district` VALUES ('2223', '256', '花溪区', '0');
INSERT INTO `ewei_district` VALUES ('2224', '256', '乌当区', '0');
INSERT INTO `ewei_district` VALUES ('2225', '256', '白云区', '0');
INSERT INTO `ewei_district` VALUES ('2226', '256', '小河区', '0');
INSERT INTO `ewei_district` VALUES ('2227', '256', '开阳县', '0');
INSERT INTO `ewei_district` VALUES ('2228', '256', '息烽县', '0');
INSERT INTO `ewei_district` VALUES ('2229', '256', '修文县', '0');
INSERT INTO `ewei_district` VALUES ('2230', '256', '清镇市', '0');
INSERT INTO `ewei_district` VALUES ('2231', '257', '钟山区', '0');
INSERT INTO `ewei_district` VALUES ('2232', '257', '六枝特区', '0');
INSERT INTO `ewei_district` VALUES ('2233', '257', '水城县', '0');
INSERT INTO `ewei_district` VALUES ('2234', '257', '盘县', '0');
INSERT INTO `ewei_district` VALUES ('2235', '258', '红花岗区', '0');
INSERT INTO `ewei_district` VALUES ('2236', '258', '汇川区', '0');
INSERT INTO `ewei_district` VALUES ('2237', '258', '遵义县', '0');
INSERT INTO `ewei_district` VALUES ('2238', '258', '桐梓县', '0');
INSERT INTO `ewei_district` VALUES ('2239', '258', '绥阳县', '0');
INSERT INTO `ewei_district` VALUES ('2240', '258', '正安县', '0');
INSERT INTO `ewei_district` VALUES ('2241', '258', '道真仡佬族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2242', '258', '务川仡佬族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2243', '258', '凤冈县', '0');
INSERT INTO `ewei_district` VALUES ('2244', '258', '湄潭县', '0');
INSERT INTO `ewei_district` VALUES ('2245', '258', '余庆县', '0');
INSERT INTO `ewei_district` VALUES ('2246', '258', '习水县', '0');
INSERT INTO `ewei_district` VALUES ('2247', '258', '赤水市', '0');
INSERT INTO `ewei_district` VALUES ('2248', '258', '仁怀市', '0');
INSERT INTO `ewei_district` VALUES ('2249', '259', '西秀区', '0');
INSERT INTO `ewei_district` VALUES ('2250', '259', '平坝县', '0');
INSERT INTO `ewei_district` VALUES ('2251', '259', '普定县', '0');
INSERT INTO `ewei_district` VALUES ('2252', '259', '镇宁布依族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2253', '259', '关岭布依族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2254', '259', '紫云苗族布依族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2255', '260', '铜仁市', '0');
INSERT INTO `ewei_district` VALUES ('2256', '260', '江口县', '0');
INSERT INTO `ewei_district` VALUES ('2257', '260', '玉屏侗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2258', '260', '石阡县', '0');
INSERT INTO `ewei_district` VALUES ('2259', '260', '思南县', '0');
INSERT INTO `ewei_district` VALUES ('2260', '260', '印江土家族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2261', '260', '德江县', '0');
INSERT INTO `ewei_district` VALUES ('2262', '260', '沿河土家族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2263', '260', '松桃苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2264', '260', '万山特区', '0');
INSERT INTO `ewei_district` VALUES ('2265', '261', '兴义市', '0');
INSERT INTO `ewei_district` VALUES ('2266', '261', '兴仁县', '0');
INSERT INTO `ewei_district` VALUES ('2267', '261', '普安县', '0');
INSERT INTO `ewei_district` VALUES ('2268', '261', '晴隆县', '0');
INSERT INTO `ewei_district` VALUES ('2269', '261', '贞丰县', '0');
INSERT INTO `ewei_district` VALUES ('2270', '261', '望谟县', '0');
INSERT INTO `ewei_district` VALUES ('2271', '261', '册亨县', '0');
INSERT INTO `ewei_district` VALUES ('2272', '261', '安龙县', '0');
INSERT INTO `ewei_district` VALUES ('2273', '262', '毕节市', '0');
INSERT INTO `ewei_district` VALUES ('2274', '262', '大方县', '0');
INSERT INTO `ewei_district` VALUES ('2275', '262', '黔西县', '0');
INSERT INTO `ewei_district` VALUES ('2276', '262', '金沙县', '0');
INSERT INTO `ewei_district` VALUES ('2277', '262', '织金县', '0');
INSERT INTO `ewei_district` VALUES ('2278', '262', '纳雍县', '0');
INSERT INTO `ewei_district` VALUES ('2279', '262', '威宁彝族回族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2280', '262', '赫章县', '0');
INSERT INTO `ewei_district` VALUES ('2281', '263', '凯里市', '0');
INSERT INTO `ewei_district` VALUES ('2282', '263', '黄平县', '0');
INSERT INTO `ewei_district` VALUES ('2283', '263', '施秉县', '0');
INSERT INTO `ewei_district` VALUES ('2284', '263', '三穗县', '0');
INSERT INTO `ewei_district` VALUES ('2285', '263', '镇远县', '0');
INSERT INTO `ewei_district` VALUES ('2286', '263', '岑巩县', '0');
INSERT INTO `ewei_district` VALUES ('2287', '263', '天柱县', '0');
INSERT INTO `ewei_district` VALUES ('2288', '263', '锦屏县', '0');
INSERT INTO `ewei_district` VALUES ('2289', '263', '剑河县', '0');
INSERT INTO `ewei_district` VALUES ('2290', '263', '台江县', '0');
INSERT INTO `ewei_district` VALUES ('2291', '263', '黎平县', '0');
INSERT INTO `ewei_district` VALUES ('2292', '263', '榕江县', '0');
INSERT INTO `ewei_district` VALUES ('2293', '263', '从江县', '0');
INSERT INTO `ewei_district` VALUES ('2294', '263', '雷山县', '0');
INSERT INTO `ewei_district` VALUES ('2295', '263', '麻江县', '0');
INSERT INTO `ewei_district` VALUES ('2296', '263', '丹寨县', '0');
INSERT INTO `ewei_district` VALUES ('2297', '264', '都匀市', '0');
INSERT INTO `ewei_district` VALUES ('2298', '264', '福泉市', '0');
INSERT INTO `ewei_district` VALUES ('2299', '264', '荔波县', '0');
INSERT INTO `ewei_district` VALUES ('2300', '264', '贵定县', '0');
INSERT INTO `ewei_district` VALUES ('2301', '264', '瓮安县', '0');
INSERT INTO `ewei_district` VALUES ('2302', '264', '独山县', '0');
INSERT INTO `ewei_district` VALUES ('2303', '264', '平塘县', '0');
INSERT INTO `ewei_district` VALUES ('2304', '264', '罗甸县', '0');
INSERT INTO `ewei_district` VALUES ('2305', '264', '长顺县', '0');
INSERT INTO `ewei_district` VALUES ('2306', '264', '龙里县', '0');
INSERT INTO `ewei_district` VALUES ('2307', '264', '惠水县', '0');
INSERT INTO `ewei_district` VALUES ('2308', '264', '三都水族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2309', '265', '五华区', '0');
INSERT INTO `ewei_district` VALUES ('2310', '265', '盘龙区', '0');
INSERT INTO `ewei_district` VALUES ('2311', '265', '官渡区', '0');
INSERT INTO `ewei_district` VALUES ('2312', '265', '西山区', '0');
INSERT INTO `ewei_district` VALUES ('2313', '265', '东川区', '0');
INSERT INTO `ewei_district` VALUES ('2314', '265', '呈贡县', '0');
INSERT INTO `ewei_district` VALUES ('2315', '265', '晋宁县', '0');
INSERT INTO `ewei_district` VALUES ('2316', '265', '富民县', '0');
INSERT INTO `ewei_district` VALUES ('2317', '265', '宜良县', '0');
INSERT INTO `ewei_district` VALUES ('2318', '265', '石林彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2319', '265', '嵩明县', '0');
INSERT INTO `ewei_district` VALUES ('2320', '265', '禄劝彝族苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2321', '265', '寻甸回族彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2322', '265', '安宁市', '0');
INSERT INTO `ewei_district` VALUES ('2323', '266', '麒麟区', '0');
INSERT INTO `ewei_district` VALUES ('2324', '266', '马龙县', '0');
INSERT INTO `ewei_district` VALUES ('2325', '266', '陆良县', '0');
INSERT INTO `ewei_district` VALUES ('2326', '266', '师宗县', '0');
INSERT INTO `ewei_district` VALUES ('2327', '266', '罗平县', '0');
INSERT INTO `ewei_district` VALUES ('2328', '266', '富源县', '0');
INSERT INTO `ewei_district` VALUES ('2329', '266', '会泽县', '0');
INSERT INTO `ewei_district` VALUES ('2330', '266', '沾益县', '0');
INSERT INTO `ewei_district` VALUES ('2331', '266', '宣威市', '0');
INSERT INTO `ewei_district` VALUES ('2332', '267', '红塔区', '0');
INSERT INTO `ewei_district` VALUES ('2333', '267', '江川县', '0');
INSERT INTO `ewei_district` VALUES ('2334', '267', '澄江县', '0');
INSERT INTO `ewei_district` VALUES ('2335', '267', '通海县', '0');
INSERT INTO `ewei_district` VALUES ('2336', '267', '华宁县', '0');
INSERT INTO `ewei_district` VALUES ('2337', '267', '易门县', '0');
INSERT INTO `ewei_district` VALUES ('2338', '267', '峨山彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2339', '267', '新平彝族傣族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2340', '267', '元江哈尼族彝族傣族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2341', '268', '隆阳区', '0');
INSERT INTO `ewei_district` VALUES ('2342', '268', '施甸县', '0');
INSERT INTO `ewei_district` VALUES ('2343', '268', '腾冲县', '0');
INSERT INTO `ewei_district` VALUES ('2344', '268', '龙陵县', '0');
INSERT INTO `ewei_district` VALUES ('2345', '268', '昌宁县', '0');
INSERT INTO `ewei_district` VALUES ('2346', '269', '昭阳区', '0');
INSERT INTO `ewei_district` VALUES ('2347', '269', '鲁甸县', '0');
INSERT INTO `ewei_district` VALUES ('2348', '269', '巧家县', '0');
INSERT INTO `ewei_district` VALUES ('2349', '269', '盐津县', '0');
INSERT INTO `ewei_district` VALUES ('2350', '269', '大关县', '0');
INSERT INTO `ewei_district` VALUES ('2351', '269', '永善县', '0');
INSERT INTO `ewei_district` VALUES ('2352', '269', '绥江县', '0');
INSERT INTO `ewei_district` VALUES ('2353', '269', '镇雄县', '0');
INSERT INTO `ewei_district` VALUES ('2354', '269', '彝良县', '0');
INSERT INTO `ewei_district` VALUES ('2355', '269', '威信县', '0');
INSERT INTO `ewei_district` VALUES ('2356', '269', '水富县', '0');
INSERT INTO `ewei_district` VALUES ('2357', '270', '古城区', '0');
INSERT INTO `ewei_district` VALUES ('2358', '270', '玉龙纳西族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2359', '270', '永胜县', '0');
INSERT INTO `ewei_district` VALUES ('2360', '270', '华坪县', '0');
INSERT INTO `ewei_district` VALUES ('2361', '270', '宁蒗彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2362', '271', '翠云区', '0');
INSERT INTO `ewei_district` VALUES ('2363', '271', '普洱哈尼族彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2364', '271', '墨江哈尼族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2365', '271', '景东彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2366', '271', '景谷傣族彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2367', '271', '镇沅彝族哈尼族拉祜族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2368', '271', '江城哈尼族彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2369', '271', '孟连傣族拉祜族佤族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2370', '271', '澜沧拉祜族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2371', '271', '西盟佤族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2372', '272', '临翔区', '0');
INSERT INTO `ewei_district` VALUES ('2373', '272', '凤庆县', '0');
INSERT INTO `ewei_district` VALUES ('2374', '272', '云县', '0');
INSERT INTO `ewei_district` VALUES ('2375', '272', '永德县', '0');
INSERT INTO `ewei_district` VALUES ('2376', '272', '镇康县', '0');
INSERT INTO `ewei_district` VALUES ('2377', '272', '双江拉祜族佤族布朗族傣族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2378', '272', '耿马傣族佤族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2379', '272', '沧源佤族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2380', '273', '楚雄市', '0');
INSERT INTO `ewei_district` VALUES ('2381', '273', '双柏县', '0');
INSERT INTO `ewei_district` VALUES ('2382', '273', '牟定县', '0');
INSERT INTO `ewei_district` VALUES ('2383', '273', '南华县', '0');
INSERT INTO `ewei_district` VALUES ('2384', '273', '姚安县', '0');
INSERT INTO `ewei_district` VALUES ('2385', '273', '大姚县', '0');
INSERT INTO `ewei_district` VALUES ('2386', '273', '永仁县', '0');
INSERT INTO `ewei_district` VALUES ('2387', '273', '元谋县', '0');
INSERT INTO `ewei_district` VALUES ('2388', '273', '武定县', '0');
INSERT INTO `ewei_district` VALUES ('2389', '273', '禄丰县', '0');
INSERT INTO `ewei_district` VALUES ('2390', '274', '个旧市', '0');
INSERT INTO `ewei_district` VALUES ('2391', '274', '开远市', '0');
INSERT INTO `ewei_district` VALUES ('2392', '274', '蒙自县', '0');
INSERT INTO `ewei_district` VALUES ('2393', '274', '屏边苗族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2394', '274', '建水县', '0');
INSERT INTO `ewei_district` VALUES ('2395', '274', '石屏县', '0');
INSERT INTO `ewei_district` VALUES ('2396', '274', '弥勒县', '0');
INSERT INTO `ewei_district` VALUES ('2397', '274', '泸西县', '0');
INSERT INTO `ewei_district` VALUES ('2398', '274', '元阳县', '0');
INSERT INTO `ewei_district` VALUES ('2399', '274', '红河县', '0');
INSERT INTO `ewei_district` VALUES ('2400', '274', '金平苗族瑶族傣族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2401', '274', '绿春县', '0');
INSERT INTO `ewei_district` VALUES ('2402', '274', '河口瑶族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2403', '275', '文山县', '0');
INSERT INTO `ewei_district` VALUES ('2404', '275', '砚山县', '0');
INSERT INTO `ewei_district` VALUES ('2405', '275', '西畴县', '0');
INSERT INTO `ewei_district` VALUES ('2406', '275', '麻栗坡县', '0');
INSERT INTO `ewei_district` VALUES ('2407', '275', '马关县', '0');
INSERT INTO `ewei_district` VALUES ('2408', '275', '丘北县', '0');
INSERT INTO `ewei_district` VALUES ('2409', '275', '广南县', '0');
INSERT INTO `ewei_district` VALUES ('2410', '275', '富宁县', '0');
INSERT INTO `ewei_district` VALUES ('2411', '276', '景洪市', '0');
INSERT INTO `ewei_district` VALUES ('2412', '276', '勐海县', '0');
INSERT INTO `ewei_district` VALUES ('2413', '276', '勐腊县', '0');
INSERT INTO `ewei_district` VALUES ('2414', '277', '大理市', '0');
INSERT INTO `ewei_district` VALUES ('2415', '277', '漾濞彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2416', '277', '祥云县', '0');
INSERT INTO `ewei_district` VALUES ('2417', '277', '宾川县', '0');
INSERT INTO `ewei_district` VALUES ('2418', '277', '弥渡县', '0');
INSERT INTO `ewei_district` VALUES ('2419', '277', '南涧彝族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2420', '277', '巍山彝族回族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2421', '277', '永平县', '0');
INSERT INTO `ewei_district` VALUES ('2422', '277', '云龙县', '0');
INSERT INTO `ewei_district` VALUES ('2423', '277', '洱源县', '0');
INSERT INTO `ewei_district` VALUES ('2424', '277', '剑川县', '0');
INSERT INTO `ewei_district` VALUES ('2425', '277', '鹤庆县', '0');
INSERT INTO `ewei_district` VALUES ('2426', '278', '瑞丽市', '0');
INSERT INTO `ewei_district` VALUES ('2427', '278', '潞西市', '0');
INSERT INTO `ewei_district` VALUES ('2428', '278', '梁河县', '0');
INSERT INTO `ewei_district` VALUES ('2429', '278', '盈江县', '0');
INSERT INTO `ewei_district` VALUES ('2430', '278', '陇川县', '0');
INSERT INTO `ewei_district` VALUES ('2431', '279', '泸水县', '0');
INSERT INTO `ewei_district` VALUES ('2432', '279', '福贡县', '0');
INSERT INTO `ewei_district` VALUES ('2433', '279', '贡山独龙族怒族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2434', '279', '兰坪白族普米族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2435', '280', '香格里拉县', '0');
INSERT INTO `ewei_district` VALUES ('2436', '280', '德钦县', '0');
INSERT INTO `ewei_district` VALUES ('2437', '280', '维西傈僳族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2438', '281', '城关区', '0');
INSERT INTO `ewei_district` VALUES ('2439', '281', '林周县', '0');
INSERT INTO `ewei_district` VALUES ('2440', '281', '当雄县', '0');
INSERT INTO `ewei_district` VALUES ('2441', '281', '尼木县', '0');
INSERT INTO `ewei_district` VALUES ('2442', '281', '曲水县', '0');
INSERT INTO `ewei_district` VALUES ('2443', '281', '堆龙德庆县', '0');
INSERT INTO `ewei_district` VALUES ('2444', '281', '达孜县', '0');
INSERT INTO `ewei_district` VALUES ('2445', '281', '墨竹工卡县', '0');
INSERT INTO `ewei_district` VALUES ('2446', '282', '昌都县', '0');
INSERT INTO `ewei_district` VALUES ('2447', '282', '江达县', '0');
INSERT INTO `ewei_district` VALUES ('2448', '282', '贡觉县', '0');
INSERT INTO `ewei_district` VALUES ('2449', '282', '类乌齐县', '0');
INSERT INTO `ewei_district` VALUES ('2450', '282', '丁青县', '0');
INSERT INTO `ewei_district` VALUES ('2451', '282', '察雅县', '0');
INSERT INTO `ewei_district` VALUES ('2452', '282', '八宿县', '0');
INSERT INTO `ewei_district` VALUES ('2453', '282', '左贡县', '0');
INSERT INTO `ewei_district` VALUES ('2454', '282', '芒康县', '0');
INSERT INTO `ewei_district` VALUES ('2455', '282', '洛隆县', '0');
INSERT INTO `ewei_district` VALUES ('2456', '282', '边坝县', '0');
INSERT INTO `ewei_district` VALUES ('2457', '283', '乃东县', '0');
INSERT INTO `ewei_district` VALUES ('2458', '283', '扎囊县', '0');
INSERT INTO `ewei_district` VALUES ('2459', '283', '贡嘎县', '0');
INSERT INTO `ewei_district` VALUES ('2460', '283', '桑日县', '0');
INSERT INTO `ewei_district` VALUES ('2461', '283', '琼结县', '0');
INSERT INTO `ewei_district` VALUES ('2462', '283', '曲松县', '0');
INSERT INTO `ewei_district` VALUES ('2463', '283', '措美县', '0');
INSERT INTO `ewei_district` VALUES ('2464', '283', '洛扎县', '0');
INSERT INTO `ewei_district` VALUES ('2465', '283', '加查县', '0');
INSERT INTO `ewei_district` VALUES ('2466', '283', '隆子县', '0');
INSERT INTO `ewei_district` VALUES ('2467', '283', '错那县', '0');
INSERT INTO `ewei_district` VALUES ('2468', '283', '浪卡子县', '0');
INSERT INTO `ewei_district` VALUES ('2469', '284', '日喀则市', '0');
INSERT INTO `ewei_district` VALUES ('2470', '284', '南木林县', '0');
INSERT INTO `ewei_district` VALUES ('2471', '284', '江孜县', '0');
INSERT INTO `ewei_district` VALUES ('2472', '284', '定日县', '0');
INSERT INTO `ewei_district` VALUES ('2473', '284', '萨迦县', '0');
INSERT INTO `ewei_district` VALUES ('2474', '284', '拉孜县', '0');
INSERT INTO `ewei_district` VALUES ('2475', '284', '昂仁县', '0');
INSERT INTO `ewei_district` VALUES ('2476', '284', '谢通门县', '0');
INSERT INTO `ewei_district` VALUES ('2477', '284', '白朗县', '0');
INSERT INTO `ewei_district` VALUES ('2478', '284', '仁布县', '0');
INSERT INTO `ewei_district` VALUES ('2479', '284', '康马县', '0');
INSERT INTO `ewei_district` VALUES ('2480', '284', '定结县', '0');
INSERT INTO `ewei_district` VALUES ('2481', '284', '仲巴县', '0');
INSERT INTO `ewei_district` VALUES ('2482', '284', '亚东县', '0');
INSERT INTO `ewei_district` VALUES ('2483', '284', '吉隆县', '0');
INSERT INTO `ewei_district` VALUES ('2484', '284', '聂拉木县', '0');
INSERT INTO `ewei_district` VALUES ('2485', '284', '萨嘎县', '0');
INSERT INTO `ewei_district` VALUES ('2486', '284', '岗巴县', '0');
INSERT INTO `ewei_district` VALUES ('2487', '285', '那曲县', '0');
INSERT INTO `ewei_district` VALUES ('2488', '285', '嘉黎县', '0');
INSERT INTO `ewei_district` VALUES ('2489', '285', '比如县', '0');
INSERT INTO `ewei_district` VALUES ('2490', '285', '聂荣县', '0');
INSERT INTO `ewei_district` VALUES ('2491', '285', '安多县', '0');
INSERT INTO `ewei_district` VALUES ('2492', '285', '申扎县', '0');
INSERT INTO `ewei_district` VALUES ('2493', '285', '索县', '0');
INSERT INTO `ewei_district` VALUES ('2494', '285', '班戈县', '0');
INSERT INTO `ewei_district` VALUES ('2495', '285', '巴青县', '0');
INSERT INTO `ewei_district` VALUES ('2496', '285', '尼玛县', '0');
INSERT INTO `ewei_district` VALUES ('2497', '286', '普兰县', '0');
INSERT INTO `ewei_district` VALUES ('2498', '286', '札达县', '0');
INSERT INTO `ewei_district` VALUES ('2499', '286', '噶尔县', '0');
INSERT INTO `ewei_district` VALUES ('2500', '286', '日土县', '0');
INSERT INTO `ewei_district` VALUES ('2501', '286', '革吉县', '0');
INSERT INTO `ewei_district` VALUES ('2502', '286', '改则县', '0');
INSERT INTO `ewei_district` VALUES ('2503', '286', '措勤县', '0');
INSERT INTO `ewei_district` VALUES ('2504', '287', '林芝县', '0');
INSERT INTO `ewei_district` VALUES ('2505', '287', '工布江达县', '0');
INSERT INTO `ewei_district` VALUES ('2506', '287', '米林县', '0');
INSERT INTO `ewei_district` VALUES ('2507', '287', '墨脱县', '0');
INSERT INTO `ewei_district` VALUES ('2508', '287', '波密县', '0');
INSERT INTO `ewei_district` VALUES ('2509', '287', '察隅县', '0');
INSERT INTO `ewei_district` VALUES ('2510', '287', '朗县', '0');
INSERT INTO `ewei_district` VALUES ('2511', '288', '新城区', '0');
INSERT INTO `ewei_district` VALUES ('2512', '288', '碑林区', '0');
INSERT INTO `ewei_district` VALUES ('2513', '288', '莲湖区', '0');
INSERT INTO `ewei_district` VALUES ('2514', '288', '灞桥区', '0');
INSERT INTO `ewei_district` VALUES ('2515', '288', '未央区', '0');
INSERT INTO `ewei_district` VALUES ('2516', '288', '雁塔区', '0');
INSERT INTO `ewei_district` VALUES ('2517', '288', '阎良区', '0');
INSERT INTO `ewei_district` VALUES ('2518', '288', '临潼区', '0');
INSERT INTO `ewei_district` VALUES ('2519', '288', '长安区', '0');
INSERT INTO `ewei_district` VALUES ('2520', '288', '蓝田县', '0');
INSERT INTO `ewei_district` VALUES ('2521', '288', '周至县', '0');
INSERT INTO `ewei_district` VALUES ('2522', '288', '户县', '0');
INSERT INTO `ewei_district` VALUES ('2523', '288', '高陵县', '0');
INSERT INTO `ewei_district` VALUES ('2524', '289', '王益区', '0');
INSERT INTO `ewei_district` VALUES ('2525', '289', '印台区', '0');
INSERT INTO `ewei_district` VALUES ('2526', '289', '耀州区', '0');
INSERT INTO `ewei_district` VALUES ('2527', '289', '宜君县', '0');
INSERT INTO `ewei_district` VALUES ('2528', '290', '渭滨区', '0');
INSERT INTO `ewei_district` VALUES ('2529', '290', '金台区', '0');
INSERT INTO `ewei_district` VALUES ('2530', '290', '陈仓区', '0');
INSERT INTO `ewei_district` VALUES ('2531', '290', '凤翔县', '0');
INSERT INTO `ewei_district` VALUES ('2532', '290', '岐山县', '0');
INSERT INTO `ewei_district` VALUES ('2533', '290', '扶风县', '0');
INSERT INTO `ewei_district` VALUES ('2534', '290', '眉县', '0');
INSERT INTO `ewei_district` VALUES ('2535', '290', '陇县', '0');
INSERT INTO `ewei_district` VALUES ('2536', '290', '千阳县', '0');
INSERT INTO `ewei_district` VALUES ('2537', '290', '麟游县', '0');
INSERT INTO `ewei_district` VALUES ('2538', '290', '凤县', '0');
INSERT INTO `ewei_district` VALUES ('2539', '290', '太白县', '0');
INSERT INTO `ewei_district` VALUES ('2540', '291', '秦都区', '0');
INSERT INTO `ewei_district` VALUES ('2541', '291', '杨凌区', '0');
INSERT INTO `ewei_district` VALUES ('2542', '291', '渭城区', '0');
INSERT INTO `ewei_district` VALUES ('2543', '291', '三原县', '0');
INSERT INTO `ewei_district` VALUES ('2544', '291', '泾阳县', '0');
INSERT INTO `ewei_district` VALUES ('2545', '291', '乾县', '0');
INSERT INTO `ewei_district` VALUES ('2546', '291', '礼泉县', '0');
INSERT INTO `ewei_district` VALUES ('2547', '291', '永寿县', '0');
INSERT INTO `ewei_district` VALUES ('2548', '291', '彬县', '0');
INSERT INTO `ewei_district` VALUES ('2549', '291', '长武县', '0');
INSERT INTO `ewei_district` VALUES ('2550', '291', '旬邑县', '0');
INSERT INTO `ewei_district` VALUES ('2551', '291', '淳化县', '0');
INSERT INTO `ewei_district` VALUES ('2552', '291', '武功县', '0');
INSERT INTO `ewei_district` VALUES ('2553', '291', '兴平市', '0');
INSERT INTO `ewei_district` VALUES ('2554', '292', '临渭区', '0');
INSERT INTO `ewei_district` VALUES ('2555', '292', '华县', '0');
INSERT INTO `ewei_district` VALUES ('2556', '292', '潼关县', '0');
INSERT INTO `ewei_district` VALUES ('2557', '292', '大荔县', '0');
INSERT INTO `ewei_district` VALUES ('2558', '292', '合阳县', '0');
INSERT INTO `ewei_district` VALUES ('2559', '292', '澄城县', '0');
INSERT INTO `ewei_district` VALUES ('2560', '292', '蒲城县', '0');
INSERT INTO `ewei_district` VALUES ('2561', '292', '白水县', '0');
INSERT INTO `ewei_district` VALUES ('2562', '292', '富平县', '0');
INSERT INTO `ewei_district` VALUES ('2563', '292', '韩城市', '0');
INSERT INTO `ewei_district` VALUES ('2564', '292', '华阴市', '0');
INSERT INTO `ewei_district` VALUES ('2565', '293', '宝塔区', '0');
INSERT INTO `ewei_district` VALUES ('2566', '293', '延长县', '0');
INSERT INTO `ewei_district` VALUES ('2567', '293', '延川县', '0');
INSERT INTO `ewei_district` VALUES ('2568', '293', '子长县', '0');
INSERT INTO `ewei_district` VALUES ('2569', '293', '安塞县', '0');
INSERT INTO `ewei_district` VALUES ('2570', '293', '志丹县', '0');
INSERT INTO `ewei_district` VALUES ('2571', '293', '吴旗县', '0');
INSERT INTO `ewei_district` VALUES ('2572', '293', '甘泉县', '0');
INSERT INTO `ewei_district` VALUES ('2573', '293', '富县', '0');
INSERT INTO `ewei_district` VALUES ('2574', '293', '洛川县', '0');
INSERT INTO `ewei_district` VALUES ('2575', '293', '宜川县', '0');
INSERT INTO `ewei_district` VALUES ('2576', '293', '黄龙县', '0');
INSERT INTO `ewei_district` VALUES ('2577', '293', '黄陵县', '0');
INSERT INTO `ewei_district` VALUES ('2578', '294', '汉台区', '0');
INSERT INTO `ewei_district` VALUES ('2579', '294', '南郑县', '0');
INSERT INTO `ewei_district` VALUES ('2580', '294', '城固县', '0');
INSERT INTO `ewei_district` VALUES ('2581', '294', '洋县', '0');
INSERT INTO `ewei_district` VALUES ('2582', '294', '西乡县', '0');
INSERT INTO `ewei_district` VALUES ('2583', '294', '勉县', '0');
INSERT INTO `ewei_district` VALUES ('2584', '294', '宁强县', '0');
INSERT INTO `ewei_district` VALUES ('2585', '294', '略阳县', '0');
INSERT INTO `ewei_district` VALUES ('2586', '294', '镇巴县', '0');
INSERT INTO `ewei_district` VALUES ('2587', '294', '留坝县', '0');
INSERT INTO `ewei_district` VALUES ('2588', '294', '佛坪县', '0');
INSERT INTO `ewei_district` VALUES ('2589', '295', '榆阳区', '0');
INSERT INTO `ewei_district` VALUES ('2590', '295', '神木县', '0');
INSERT INTO `ewei_district` VALUES ('2591', '295', '府谷县', '0');
INSERT INTO `ewei_district` VALUES ('2592', '295', '横山县', '0');
INSERT INTO `ewei_district` VALUES ('2593', '295', '靖边县', '0');
INSERT INTO `ewei_district` VALUES ('2594', '295', '定边县', '0');
INSERT INTO `ewei_district` VALUES ('2595', '295', '绥德县', '0');
INSERT INTO `ewei_district` VALUES ('2596', '295', '米脂县', '0');
INSERT INTO `ewei_district` VALUES ('2597', '295', '佳县', '0');
INSERT INTO `ewei_district` VALUES ('2598', '295', '吴堡县', '0');
INSERT INTO `ewei_district` VALUES ('2599', '295', '清涧县', '0');
INSERT INTO `ewei_district` VALUES ('2600', '295', '子洲县', '0');
INSERT INTO `ewei_district` VALUES ('2601', '296', '汉滨区', '0');
INSERT INTO `ewei_district` VALUES ('2602', '296', '汉阴县', '0');
INSERT INTO `ewei_district` VALUES ('2603', '296', '石泉县', '0');
INSERT INTO `ewei_district` VALUES ('2604', '296', '宁陕县', '0');
INSERT INTO `ewei_district` VALUES ('2605', '296', '紫阳县', '0');
INSERT INTO `ewei_district` VALUES ('2606', '296', '岚皋县', '0');
INSERT INTO `ewei_district` VALUES ('2607', '296', '平利县', '0');
INSERT INTO `ewei_district` VALUES ('2608', '296', '镇坪县', '0');
INSERT INTO `ewei_district` VALUES ('2609', '296', '旬阳县', '0');
INSERT INTO `ewei_district` VALUES ('2610', '296', '白河县', '0');
INSERT INTO `ewei_district` VALUES ('2611', '297', '商州区', '0');
INSERT INTO `ewei_district` VALUES ('2612', '297', '洛南县', '0');
INSERT INTO `ewei_district` VALUES ('2613', '297', '丹凤县', '0');
INSERT INTO `ewei_district` VALUES ('2614', '297', '商南县', '0');
INSERT INTO `ewei_district` VALUES ('2615', '297', '山阳县', '0');
INSERT INTO `ewei_district` VALUES ('2616', '297', '镇安县', '0');
INSERT INTO `ewei_district` VALUES ('2617', '297', '柞水县', '0');
INSERT INTO `ewei_district` VALUES ('2618', '298', '城关区', '0');
INSERT INTO `ewei_district` VALUES ('2619', '298', '七里河区', '0');
INSERT INTO `ewei_district` VALUES ('2620', '298', '西固区', '0');
INSERT INTO `ewei_district` VALUES ('2621', '298', '安宁区', '0');
INSERT INTO `ewei_district` VALUES ('2622', '298', '红古区', '0');
INSERT INTO `ewei_district` VALUES ('2623', '298', '永登县', '0');
INSERT INTO `ewei_district` VALUES ('2624', '298', '皋兰县', '0');
INSERT INTO `ewei_district` VALUES ('2625', '298', '榆中县', '0');
INSERT INTO `ewei_district` VALUES ('2626', '300', '金川区', '0');
INSERT INTO `ewei_district` VALUES ('2627', '300', '永昌县', '0');
INSERT INTO `ewei_district` VALUES ('2628', '301', '白银区', '0');
INSERT INTO `ewei_district` VALUES ('2629', '301', '平川区', '0');
INSERT INTO `ewei_district` VALUES ('2630', '301', '靖远县', '0');
INSERT INTO `ewei_district` VALUES ('2631', '301', '会宁县', '0');
INSERT INTO `ewei_district` VALUES ('2632', '301', '景泰县', '0');
INSERT INTO `ewei_district` VALUES ('2633', '302', '秦城区', '0');
INSERT INTO `ewei_district` VALUES ('2634', '302', '北道区', '0');
INSERT INTO `ewei_district` VALUES ('2635', '302', '清水县', '0');
INSERT INTO `ewei_district` VALUES ('2636', '302', '秦安县', '0');
INSERT INTO `ewei_district` VALUES ('2637', '302', '甘谷县', '0');
INSERT INTO `ewei_district` VALUES ('2638', '302', '武山县', '0');
INSERT INTO `ewei_district` VALUES ('2639', '302', '张家川回族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2640', '303', '凉州区', '0');
INSERT INTO `ewei_district` VALUES ('2641', '303', '民勤县', '0');
INSERT INTO `ewei_district` VALUES ('2642', '303', '古浪县', '0');
INSERT INTO `ewei_district` VALUES ('2643', '303', '天祝藏族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2644', '304', '甘州区', '0');
INSERT INTO `ewei_district` VALUES ('2645', '304', '肃南裕固族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2646', '304', '民乐县', '0');
INSERT INTO `ewei_district` VALUES ('2647', '304', '临泽县', '0');
INSERT INTO `ewei_district` VALUES ('2648', '304', '高台县', '0');
INSERT INTO `ewei_district` VALUES ('2649', '304', '山丹县', '0');
INSERT INTO `ewei_district` VALUES ('2650', '305', '崆峒区', '0');
INSERT INTO `ewei_district` VALUES ('2651', '305', '泾川县', '0');
INSERT INTO `ewei_district` VALUES ('2652', '305', '灵台县', '0');
INSERT INTO `ewei_district` VALUES ('2653', '305', '崇信县', '0');
INSERT INTO `ewei_district` VALUES ('2654', '305', '华亭县', '0');
INSERT INTO `ewei_district` VALUES ('2655', '305', '庄浪县', '0');
INSERT INTO `ewei_district` VALUES ('2656', '305', '静宁县', '0');
INSERT INTO `ewei_district` VALUES ('2657', '306', '肃州区', '0');
INSERT INTO `ewei_district` VALUES ('2658', '306', '金塔县', '0');
INSERT INTO `ewei_district` VALUES ('2659', '306', '安西县', '0');
INSERT INTO `ewei_district` VALUES ('2660', '306', '肃北蒙古族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2661', '306', '阿克塞哈萨克族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2662', '306', '玉门市', '0');
INSERT INTO `ewei_district` VALUES ('2663', '306', '敦煌市', '0');
INSERT INTO `ewei_district` VALUES ('2664', '307', '西峰区', '0');
INSERT INTO `ewei_district` VALUES ('2665', '307', '庆城县', '0');
INSERT INTO `ewei_district` VALUES ('2666', '307', '环县', '0');
INSERT INTO `ewei_district` VALUES ('2667', '307', '华池县', '0');
INSERT INTO `ewei_district` VALUES ('2668', '307', '合水县', '0');
INSERT INTO `ewei_district` VALUES ('2669', '307', '正宁县', '0');
INSERT INTO `ewei_district` VALUES ('2670', '307', '宁县', '0');
INSERT INTO `ewei_district` VALUES ('2671', '307', '镇原县', '0');
INSERT INTO `ewei_district` VALUES ('2672', '308', '安定区', '0');
INSERT INTO `ewei_district` VALUES ('2673', '308', '通渭县', '0');
INSERT INTO `ewei_district` VALUES ('2674', '308', '陇西县', '0');
INSERT INTO `ewei_district` VALUES ('2675', '308', '渭源县', '0');
INSERT INTO `ewei_district` VALUES ('2676', '308', '临洮县', '0');
INSERT INTO `ewei_district` VALUES ('2677', '308', '漳县', '0');
INSERT INTO `ewei_district` VALUES ('2678', '308', '岷县', '0');
INSERT INTO `ewei_district` VALUES ('2679', '309', '武都区', '0');
INSERT INTO `ewei_district` VALUES ('2680', '309', '成县', '0');
INSERT INTO `ewei_district` VALUES ('2681', '309', '文县', '0');
INSERT INTO `ewei_district` VALUES ('2682', '309', '宕昌县', '0');
INSERT INTO `ewei_district` VALUES ('2683', '309', '康县', '0');
INSERT INTO `ewei_district` VALUES ('2684', '309', '西和县', '0');
INSERT INTO `ewei_district` VALUES ('2685', '309', '礼县', '0');
INSERT INTO `ewei_district` VALUES ('2686', '309', '徽县', '0');
INSERT INTO `ewei_district` VALUES ('2687', '309', '两当县', '0');
INSERT INTO `ewei_district` VALUES ('2688', '310', '临夏市', '0');
INSERT INTO `ewei_district` VALUES ('2689', '310', '临夏县', '0');
INSERT INTO `ewei_district` VALUES ('2690', '310', '康乐县', '0');
INSERT INTO `ewei_district` VALUES ('2691', '310', '永靖县', '0');
INSERT INTO `ewei_district` VALUES ('2692', '310', '广河县', '0');
INSERT INTO `ewei_district` VALUES ('2693', '310', '和政县', '0');
INSERT INTO `ewei_district` VALUES ('2694', '310', '东乡族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2695', '310', '积石山保安族东乡族撒拉族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2696', '311', '合作市', '0');
INSERT INTO `ewei_district` VALUES ('2697', '311', '临潭县', '0');
INSERT INTO `ewei_district` VALUES ('2698', '311', '卓尼县', '0');
INSERT INTO `ewei_district` VALUES ('2699', '311', '舟曲县', '0');
INSERT INTO `ewei_district` VALUES ('2700', '311', '迭部县', '0');
INSERT INTO `ewei_district` VALUES ('2701', '311', '玛曲县', '0');
INSERT INTO `ewei_district` VALUES ('2702', '311', '碌曲县', '0');
INSERT INTO `ewei_district` VALUES ('2703', '311', '夏河县', '0');
INSERT INTO `ewei_district` VALUES ('2704', '312', '城东区', '0');
INSERT INTO `ewei_district` VALUES ('2705', '312', '城中区', '0');
INSERT INTO `ewei_district` VALUES ('2706', '312', '城西区', '0');
INSERT INTO `ewei_district` VALUES ('2707', '312', '城北区', '0');
INSERT INTO `ewei_district` VALUES ('2708', '312', '大通回族土族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2709', '312', '湟中县', '0');
INSERT INTO `ewei_district` VALUES ('2710', '312', '湟源县', '0');
INSERT INTO `ewei_district` VALUES ('2711', '313', '平安县', '0');
INSERT INTO `ewei_district` VALUES ('2712', '313', '民和回族土族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2713', '313', '乐都县', '0');
INSERT INTO `ewei_district` VALUES ('2714', '313', '互助土族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2715', '313', '化隆回族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2716', '313', '循化撒拉族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2717', '314', '门源回族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2718', '314', '祁连县', '0');
INSERT INTO `ewei_district` VALUES ('2719', '314', '海晏县', '0');
INSERT INTO `ewei_district` VALUES ('2720', '314', '刚察县', '0');
INSERT INTO `ewei_district` VALUES ('2721', '315', '同仁县', '0');
INSERT INTO `ewei_district` VALUES ('2722', '315', '尖扎县', '0');
INSERT INTO `ewei_district` VALUES ('2723', '315', '泽库县', '0');
INSERT INTO `ewei_district` VALUES ('2724', '315', '河南蒙古族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2725', '316', '共和县', '0');
INSERT INTO `ewei_district` VALUES ('2726', '316', '同德县', '0');
INSERT INTO `ewei_district` VALUES ('2727', '316', '贵德县', '0');
INSERT INTO `ewei_district` VALUES ('2728', '316', '兴海县', '0');
INSERT INTO `ewei_district` VALUES ('2729', '316', '贵南县', '0');
INSERT INTO `ewei_district` VALUES ('2730', '317', '玛沁县', '0');
INSERT INTO `ewei_district` VALUES ('2731', '317', '班玛县', '0');
INSERT INTO `ewei_district` VALUES ('2732', '317', '甘德县', '0');
INSERT INTO `ewei_district` VALUES ('2733', '317', '达日县', '0');
INSERT INTO `ewei_district` VALUES ('2734', '317', '久治县', '0');
INSERT INTO `ewei_district` VALUES ('2735', '317', '玛多县', '0');
INSERT INTO `ewei_district` VALUES ('2736', '318', '玉树县', '0');
INSERT INTO `ewei_district` VALUES ('2737', '318', '杂多县', '0');
INSERT INTO `ewei_district` VALUES ('2738', '318', '称多县', '0');
INSERT INTO `ewei_district` VALUES ('2739', '318', '治多县', '0');
INSERT INTO `ewei_district` VALUES ('2740', '318', '囊谦县', '0');
INSERT INTO `ewei_district` VALUES ('2741', '318', '曲麻莱县', '0');
INSERT INTO `ewei_district` VALUES ('2742', '319', '格尔木市', '0');
INSERT INTO `ewei_district` VALUES ('2743', '319', '德令哈市', '0');
INSERT INTO `ewei_district` VALUES ('2744', '319', '乌兰县', '0');
INSERT INTO `ewei_district` VALUES ('2745', '319', '都兰县', '0');
INSERT INTO `ewei_district` VALUES ('2746', '319', '天峻县', '0');
INSERT INTO `ewei_district` VALUES ('2747', '320', '兴庆区', '0');
INSERT INTO `ewei_district` VALUES ('2748', '320', '西夏区', '0');
INSERT INTO `ewei_district` VALUES ('2749', '320', '金凤区', '0');
INSERT INTO `ewei_district` VALUES ('2750', '320', '永宁县', '0');
INSERT INTO `ewei_district` VALUES ('2751', '320', '贺兰县', '0');
INSERT INTO `ewei_district` VALUES ('2752', '320', '灵武市', '0');
INSERT INTO `ewei_district` VALUES ('2753', '321', '大武口区', '0');
INSERT INTO `ewei_district` VALUES ('2754', '321', '惠农区', '0');
INSERT INTO `ewei_district` VALUES ('2755', '321', '平罗县', '0');
INSERT INTO `ewei_district` VALUES ('2756', '322', '利通区', '0');
INSERT INTO `ewei_district` VALUES ('2757', '322', '盐池县', '0');
INSERT INTO `ewei_district` VALUES ('2758', '322', '同心县', '0');
INSERT INTO `ewei_district` VALUES ('2759', '322', '青铜峡市', '0');
INSERT INTO `ewei_district` VALUES ('2760', '323', '原州区', '0');
INSERT INTO `ewei_district` VALUES ('2761', '323', '西吉县', '0');
INSERT INTO `ewei_district` VALUES ('2762', '323', '隆德县', '0');
INSERT INTO `ewei_district` VALUES ('2763', '323', '泾源县', '0');
INSERT INTO `ewei_district` VALUES ('2764', '323', '彭阳县', '0');
INSERT INTO `ewei_district` VALUES ('2765', '324', '沙坡头区', '0');
INSERT INTO `ewei_district` VALUES ('2766', '324', '中宁县', '0');
INSERT INTO `ewei_district` VALUES ('2767', '324', '海原县', '0');
INSERT INTO `ewei_district` VALUES ('2768', '325', '天山区', '0');
INSERT INTO `ewei_district` VALUES ('2769', '325', '沙依巴克区', '0');
INSERT INTO `ewei_district` VALUES ('2770', '325', '新市区', '0');
INSERT INTO `ewei_district` VALUES ('2771', '325', '水磨沟区', '0');
INSERT INTO `ewei_district` VALUES ('2772', '325', '头屯河区', '0');
INSERT INTO `ewei_district` VALUES ('2773', '325', '达坂城区', '0');
INSERT INTO `ewei_district` VALUES ('2774', '325', '东山区', '0');
INSERT INTO `ewei_district` VALUES ('2775', '325', '乌鲁木齐县', '0');
INSERT INTO `ewei_district` VALUES ('2776', '326', '独山子区', '0');
INSERT INTO `ewei_district` VALUES ('2777', '326', '克拉玛依区', '0');
INSERT INTO `ewei_district` VALUES ('2778', '326', '白碱滩区', '0');
INSERT INTO `ewei_district` VALUES ('2779', '326', '乌尔禾区', '0');
INSERT INTO `ewei_district` VALUES ('2780', '327', '吐鲁番市', '0');
INSERT INTO `ewei_district` VALUES ('2781', '327', '鄯善县', '0');
INSERT INTO `ewei_district` VALUES ('2782', '327', '托克逊县', '0');
INSERT INTO `ewei_district` VALUES ('2783', '328', '哈密市', '0');
INSERT INTO `ewei_district` VALUES ('2784', '328', '巴里坤哈萨克自治县', '0');
INSERT INTO `ewei_district` VALUES ('2785', '328', '伊吾县', '0');
INSERT INTO `ewei_district` VALUES ('2786', '329', '昌吉市', '0');
INSERT INTO `ewei_district` VALUES ('2787', '329', '阜康市', '0');
INSERT INTO `ewei_district` VALUES ('2788', '329', '米泉市', '0');
INSERT INTO `ewei_district` VALUES ('2789', '329', '呼图壁县', '0');
INSERT INTO `ewei_district` VALUES ('2790', '329', '玛纳斯县', '0');
INSERT INTO `ewei_district` VALUES ('2791', '329', '奇台县', '0');
INSERT INTO `ewei_district` VALUES ('2792', '329', '吉木萨尔县', '0');
INSERT INTO `ewei_district` VALUES ('2793', '329', '木垒哈萨克自治县', '0');
INSERT INTO `ewei_district` VALUES ('2794', '330', '博乐市', '0');
INSERT INTO `ewei_district` VALUES ('2795', '330', '精河县', '0');
INSERT INTO `ewei_district` VALUES ('2796', '330', '温泉县', '0');
INSERT INTO `ewei_district` VALUES ('2797', '331', '库尔勒市', '0');
INSERT INTO `ewei_district` VALUES ('2798', '331', '轮台县', '0');
INSERT INTO `ewei_district` VALUES ('2799', '331', '尉犁县', '0');
INSERT INTO `ewei_district` VALUES ('2800', '331', '若羌县', '0');
INSERT INTO `ewei_district` VALUES ('2801', '331', '且末县', '0');
INSERT INTO `ewei_district` VALUES ('2802', '331', '焉耆回族自治县', '0');
INSERT INTO `ewei_district` VALUES ('2803', '331', '和静县', '0');
INSERT INTO `ewei_district` VALUES ('2804', '331', '和硕县', '0');
INSERT INTO `ewei_district` VALUES ('2805', '331', '博湖县', '0');
INSERT INTO `ewei_district` VALUES ('2806', '332', '阿克苏市', '0');
INSERT INTO `ewei_district` VALUES ('2807', '332', '温宿县', '0');
INSERT INTO `ewei_district` VALUES ('2808', '332', '库车县', '0');
INSERT INTO `ewei_district` VALUES ('2809', '332', '沙雅县', '0');
INSERT INTO `ewei_district` VALUES ('2810', '332', '新和县', '0');
INSERT INTO `ewei_district` VALUES ('2811', '332', '拜城县', '0');
INSERT INTO `ewei_district` VALUES ('2812', '332', '乌什县', '0');
INSERT INTO `ewei_district` VALUES ('2813', '332', '阿瓦提县', '0');
INSERT INTO `ewei_district` VALUES ('2814', '332', '柯坪县', '0');
INSERT INTO `ewei_district` VALUES ('2815', '333', '阿图什市', '0');
INSERT INTO `ewei_district` VALUES ('2816', '333', '阿克陶县', '0');
INSERT INTO `ewei_district` VALUES ('2817', '333', '阿合奇县', '0');
INSERT INTO `ewei_district` VALUES ('2818', '333', '乌恰县', '0');
INSERT INTO `ewei_district` VALUES ('2819', '334', '喀什市', '0');
INSERT INTO `ewei_district` VALUES ('2820', '334', '疏附县', '0');
INSERT INTO `ewei_district` VALUES ('2821', '334', '疏勒县', '0');
INSERT INTO `ewei_district` VALUES ('2822', '334', '英吉沙县', '0');
INSERT INTO `ewei_district` VALUES ('2823', '334', '泽普县', '0');
INSERT INTO `ewei_district` VALUES ('2824', '334', '莎车县', '0');
INSERT INTO `ewei_district` VALUES ('2825', '334', '叶城县', '0');
INSERT INTO `ewei_district` VALUES ('2826', '334', '麦盖提县', '0');
INSERT INTO `ewei_district` VALUES ('2827', '334', '岳普湖县', '0');
INSERT INTO `ewei_district` VALUES ('2828', '334', '伽师县', '0');
INSERT INTO `ewei_district` VALUES ('2829', '334', '巴楚县', '0');
INSERT INTO `ewei_district` VALUES ('2830', '334', '塔什库尔干塔吉克自治县', '0');
INSERT INTO `ewei_district` VALUES ('2831', '335', '和田市', '0');
INSERT INTO `ewei_district` VALUES ('2832', '335', '和田县', '0');
INSERT INTO `ewei_district` VALUES ('2833', '335', '墨玉县', '0');
INSERT INTO `ewei_district` VALUES ('2834', '335', '皮山县', '0');
INSERT INTO `ewei_district` VALUES ('2835', '335', '洛浦县', '0');
INSERT INTO `ewei_district` VALUES ('2836', '335', '策勒县', '0');
INSERT INTO `ewei_district` VALUES ('2837', '335', '于田县', '0');
INSERT INTO `ewei_district` VALUES ('2838', '335', '民丰县', '0');
INSERT INTO `ewei_district` VALUES ('2839', '336', '伊宁市', '0');
INSERT INTO `ewei_district` VALUES ('2840', '336', '奎屯市', '0');
INSERT INTO `ewei_district` VALUES ('2841', '336', '伊宁县', '0');
INSERT INTO `ewei_district` VALUES ('2842', '336', '察布查尔锡伯自治县', '0');
INSERT INTO `ewei_district` VALUES ('2843', '336', '霍城县', '0');
INSERT INTO `ewei_district` VALUES ('2844', '336', '巩留县', '0');
INSERT INTO `ewei_district` VALUES ('2845', '336', '新源县', '0');
INSERT INTO `ewei_district` VALUES ('2846', '336', '昭苏县', '0');
INSERT INTO `ewei_district` VALUES ('2847', '336', '特克斯县', '0');
INSERT INTO `ewei_district` VALUES ('2848', '336', '尼勒克县', '0');
INSERT INTO `ewei_district` VALUES ('2849', '337', '塔城市', '0');
INSERT INTO `ewei_district` VALUES ('2850', '337', '乌苏市', '0');
INSERT INTO `ewei_district` VALUES ('2851', '337', '额敏县', '0');
INSERT INTO `ewei_district` VALUES ('2852', '337', '沙湾县', '0');
INSERT INTO `ewei_district` VALUES ('2853', '337', '托里县', '0');
INSERT INTO `ewei_district` VALUES ('2854', '337', '裕民县', '0');
INSERT INTO `ewei_district` VALUES ('2855', '337', '和布克赛尔蒙古自治县', '0');
INSERT INTO `ewei_district` VALUES ('2856', '338', '阿勒泰市', '0');
INSERT INTO `ewei_district` VALUES ('2857', '338', '布尔津县', '0');
INSERT INTO `ewei_district` VALUES ('2858', '338', '富蕴县', '0');
INSERT INTO `ewei_district` VALUES ('2859', '338', '福海县', '0');
INSERT INTO `ewei_district` VALUES ('2860', '338', '哈巴河县', '0');
INSERT INTO `ewei_district` VALUES ('2861', '338', '青河县', '0');
INSERT INTO `ewei_district` VALUES ('2862', '338', '吉木乃县', '0');
INSERT INTO `ewei_district` VALUES ('2867', '352', '宛平县', '1');
INSERT INTO `ewei_district` VALUES ('2868', '352', '111111', '5');
INSERT INTO `ewei_district` VALUES ('2869', '345', '台北', '2');

-- ----------------------------
-- Table structure for ewei_express_company
-- ----------------------------
DROP TABLE IF EXISTS `ewei_express_company`;
CREATE TABLE `ewei_express_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(20) NOT NULL DEFAULT '' COMMENT '物流编号',
  `is_enabled` int(11) NOT NULL DEFAULT '1' COMMENT '使用状态',
  `image` varchar(255) DEFAULT '' COMMENT '物流公司模版图片',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '联系电话',
  `orders` int(11) DEFAULT NULL,
  `express_logo` varchar(255) DEFAULT '' COMMENT '公司logo',
  `is_default` int(11) NOT NULL DEFAULT '0' COMMENT '是否设置为默认 0未设置 1 默认',
  `cost` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '费用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流公司';

-- ----------------------------
-- Records of ewei_express_company
-- ----------------------------
INSERT INTO `ewei_express_company` VALUES ('0', '1', '免运费', '000000', '1', '', '139281238129', '0', '/uploads/express/1515584613.jpg', '1', '0.00');
INSERT INTO `ewei_express_company` VALUES ('4', '4', '顺丰快递', '3213', '1', '', '13867271823', '0', '/uploads/express/1515584600.png', '1', '12.00');
INSERT INTO `ewei_express_company` VALUES ('8', '1', '韵达', '123123', '1', '', '123123124124', '0', '/uploads/express/1515585569.png', '0', '12.00');
INSERT INTO `ewei_express_company` VALUES ('9', '4', '邮政', '123123', '1', '', '124215125124', '0', '/uploads/express/1515585694.jpg', '0', '12.00');
INSERT INTO `ewei_express_company` VALUES ('10', '4', '免运费', '123123', '1', '', '124214124', '0', '/uploads/express/1515585883.png', '0', '99999.99');
INSERT INTO `ewei_express_company` VALUES ('11', '0', '免运费', '000000', '1', '', '139281238129', '0', '/uploads/express/1515584613.jpg', '1', '0.00');

-- ----------------------------
-- Table structure for ewei_express_shipping_items
-- ----------------------------
DROP TABLE IF EXISTS `ewei_express_shipping_items`;
CREATE TABLE `ewei_express_shipping_items` (
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '运单模版id',
  `field_name` varchar(30) NOT NULL COMMENT '字段名称',
  `field_display_name` varchar(255) NOT NULL COMMENT '打印项名称',
  `is_print` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否打印',
  `x` int(11) NOT NULL DEFAULT '0' COMMENT 'x',
  `y` int(11) NOT NULL DEFAULT '0' COMMENT 'y',
  PRIMARY KEY (`sid`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流模板打印项';

-- ----------------------------
-- Records of ewei_express_shipping_items
-- ----------------------------
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A1', '订单编号', '1', '10', '11');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A10', '收件人邮编', '1', '10', '86');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A11', '货到付款物流编号', '1', '10', '286');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A12', '代收金额', '1', '10', '186');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A13', '备注', '1', '10', '311');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A2', '发件人公司', '1', '10', '36');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A3', '发件人地址', '1', '10', '136');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A4', '发件人姓名', '1', '10', '111');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A5', '发件人电话', '1', '10', '211');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A6', '发件人邮编', '1', '10', '236');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A7', '收件人地址', '1', '10', '261');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A8', '收件人姓名', '1', '10', '61');
INSERT INTO `ewei_express_shipping_items` VALUES ('1', 'A9', '收件人电话', '1', '10', '161');

-- ----------------------------
-- Table structure for ewei_express_shipping_items_library
-- ----------------------------
DROP TABLE IF EXISTS `ewei_express_shipping_items_library`;
CREATE TABLE `ewei_express_shipping_items_library` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流模版打印项库ID',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `field_name` varchar(50) NOT NULL COMMENT '字段名',
  `field_display_name` varchar(50) NOT NULL COMMENT '字段显示名',
  `is_enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1260 COMMENT='物流模版打印项库';

-- ----------------------------
-- Records of ewei_express_shipping_items_library
-- ----------------------------
INSERT INTO `ewei_express_shipping_items_library` VALUES ('1', '0', 'A1', '订单编号', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('2', '0', 'A2', '发件人公司', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('3', '0', 'A8', '收件人姓名', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('4', '0', 'A10', '收件人邮编', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('5', '0', 'A4', '发件人姓名', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('6', '0', 'A3', '发件人地址', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('7', '0', 'A9', '收件人电话', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('8', '0', 'A12', '代收金额', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('9', '0', 'A5', '发件人电话', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('10', '0', 'A6', '发件人邮编', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('11', '0', 'A7', '收件人地址', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('12', '0', 'A11', '货到付款物流编号', '');
INSERT INTO `ewei_express_shipping_items_library` VALUES ('13', '0', 'A13', '备注', '');

-- ----------------------------
-- Table structure for ewei_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ewei_feedback`;
CREATE TABLE `ewei_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(60) NOT NULL DEFAULT '',
  `msg_title` varchar(200) NOT NULL DEFAULT '',
  `msg_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_content` text NOT NULL,
  `msg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `message_img` varchar(255) NOT NULL DEFAULT '0',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `msg_area` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='反馈';

-- ----------------------------
-- Records of ewei_feedback
-- ----------------------------
INSERT INTO `ewei_feedback` VALUES ('1', '0', '1', 'nideshop', 'nideshop@nideshop.com', '三星SGH-F258什么时候到', '4', '0', '三星SGH-F258什么时候有货', '1242107197', '', '0', '0');

-- ----------------------------
-- Table structure for ewei_footprint
-- ----------------------------
DROP TABLE IF EXISTS `ewei_footprint`;
CREATE TABLE `ewei_footprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `list_pic_url` varchar(255) DEFAULT NULL COMMENT '商品缩略图',
  `retail_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `goods_brief` varchar(255) DEFAULT NULL COMMENT '副标题',
  `add_time` int(13) DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COMMENT='浏览历史记录表';

-- ----------------------------
-- Records of ewei_footprint
-- ----------------------------
INSERT INTO `ewei_footprint` VALUES ('95', '7', '性感兔女郎紧身连', '/uploads/goods_brand/1515576059.jpg', '95.22', '小胸透视激情套装夜店', '1517155630', '36');

-- ----------------------------
-- Table structure for ewei_goods
-- ----------------------------
DROP TABLE IF EXISTS `ewei_goods`;
CREATE TABLE `ewei_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `cid` smallint(5) unsigned NOT NULL COMMENT '分类ID',
  `sid` smallint(5) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `eid` smallint(5) NOT NULL COMMENT '运费模板ID',
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
  `is_collective` tinyint(1) NOT NULL COMMENT '是否开启团购模式',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  `sp_o_price` decimal(7,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品原价格',
  `sp_vip_price` decimal(7,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品会员价格',
  `sp_cost_price` decimal(7,2) unsigned NOT NULL COMMENT '成本价',
  `sp_price` decimal(7,2) unsigned NOT NULL COMMENT '商品售价',
  `sp_inventory` smallint(5) unsigned NOT NULL DEFAULT '999' COMMENT '商品库存',
  `sp_integral` smallint(5) unsigned NOT NULL COMMENT '商品积分赠送',
  `give_integral` smallint(5) NOT NULL COMMENT '购买赠送积分',
  `is_integral` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许积分购买',
  `sp_market` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `btime` datetime NOT NULL COMMENT '开始时间',
  `etime` datetime NOT NULL COMMENT '结束时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of ewei_goods
-- ----------------------------
INSERT INTO `ewei_goods` VALUES ('33', '14', '1', '8', '无肩带隐形文胸', '内衣乳贴上托', '', '<div class=\"J_DetailSection tshop-psm ke-post\"><div class=\"content\"><p><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2vch8axb9F1JjSZFqXXbotVXa_!!169468122.jpg\"/><br/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2M54aa4z_F1JjSZFIXXcxHVXa_!!169468122.jpg\"/><br/><img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB2WpOJuhxmpuFjSZFNXXXrRXXa_!!169468122.jpg\"/> <img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB2JTBsX8H8F1Jjy0FnXXb5AXXa_!!169468122.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB24VF7bXgkyKJjSspiXXcwBpXa_!!169468122.jpg\" class=\"\"/> <img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2EMuAarH9F1JjSZFAXXba3VXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB2NqJuXYD8F1Jjy0FpXXcduVXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB2CstrX3L8F1JjSsphXXXknVXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB26CFZX5GfF1Jjy0FjXXXZdVXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2zk4sXYH8F1Jjy1zbXXaVNVXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB2HFl0X0WgF1Jjy0FhXXbeEFXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2cxpZX.ifF1JjSspdXXclLpXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2G8B_axf9F1JjSZFyXXXnOFXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB2ipmAphtmpuFjSZFqXXbHFpXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2JmlZX5GfF1Jjy0FjXXXZdVXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2S6RsX9f8F1Jjy0FeXXallpXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2JLzDmHFlpuFjy0FgXXbRBVXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB20qrlpctnpuFjSZFvXXbcTpXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2t_zwpbxmpuFjSZJiXXXauVXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB2FkT_mH8kpuFjy0FcXXaUhpXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2lDLypbBmpuFjSZFuXXaG_XXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2eoJsX3L8F1JjSspjXXbZgpXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2jkX1X0qgF1JjSsppXXaBNXXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB214l8arL9F1JjSZFwXXcSuVXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB2SGp1X5afF1Jjy1zcXXcu5XXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2BXR9ap6.F1JjSZFpXXcZjXXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2JM8tX8P8F1JjSspaXXb4ypXa_!!169468122.jpg\" class=\"\"/></p></div></div>', '1', '1', '0', '/uploads/goods_brand/1515575596.jpg', 'a:4:{i:0;s:35:\"/uploads/goods/1515575620134754.jpg\";i:1;s:35:\"/uploads/goods/1515575620230865.jpg\";i:2;s:35:\"/uploads/goods/1515575620534669.jpg\";i:3;s:35:\"/uploads/goods/1515575620101494.jpg\";}', '1', '1', '0', '0', '0', '2018-01-10 17:14:12', '2018-01-10 00:00:00', '32.00', '0.00', '0.00', '123.23', '32', '123', '0', '1', '32', '2018-01-10 00:00:00', '2018-01-26 00:00:00', null, null);
INSERT INTO `ewei_goods` VALUES ('37', '14', '1', '0', '宫廷马甲吊袜带套装性', '服激情', '', '<div class=\"J_DetailSection tshop-psm ke-post\"><div class=\"content\"><p><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB23PzzXyrEK1JjSZFHXXcveXXa_!!169468122.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB29X6CXw2DK1JjSZFOXXabwFXa_!!169468122.jpg\"/><br/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2kJBpX.6EK1JjSZFDXXcIqFXa_!!169468122.jpg\"/> <img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB24VF7bXgkyKJjSspiXXcwBpXa_!!169468122.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB2sEQUXnzGK1JjSsplXXbdspXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB279mnuM0kpuFjSspdXXX4YXXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2RWrxXwYDK1JjSZFCXXX.vXXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB2inDzXxDBK1JjSZFhXXXFFFXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB2HJfuXpHFK1JjSZFzXXb23XXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB22ZLwXxvEK1JjSZFPXXbWYpXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB2EbDuXwYDK1JjSZPfXXcY.pXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB2M__JuYJmpuFjSZFwXXaE4VXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2AWGCXl1tLeJjSszgXXcOHpXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2co_xXu2CK1JjSZFjXXXk_VXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2mrcRXgvGK1Jjy0FcXXXXmVXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB2p4YuXqTEK1JjSZFFXXb6xXXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB2UEM2lmJjpuFjy0FdXXXmoFXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2NPtbuylnpuFjSZFgXXbi7FXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB20jUeq3JlpuFjSspjXXcT.pXa_!!169468122.jpg\" class=\"\"/></p></div></div>', '1', '1', '0', '/uploads/goods_brand/1515578042.jpg', 'a:5:{i:0;s:35:\"/uploads/goods/1515578038343049.jpg\";i:1;s:35:\"/uploads/goods/1515578038186800.jpg\";i:2;s:35:\"/uploads/goods/1515578038187059.jpg\";i:3;s:35:\"/uploads/goods/1515578038126040.jpg\";i:4;s:35:\"/uploads/goods/1515578038120054.jpg\";}', '1', '1', '1', '0', '2', '2018-01-10 17:57:44', '2018-01-10 00:00:00', '123.00', '0.00', '0.00', '153.32', '123', '123', '0', '1', '123', '2018-01-12 00:00:00', '2018-02-01 00:00:00', null, null);
INSERT INTO `ewei_goods` VALUES ('36', '14', '4', '8', '性感兔女郎紧身连', '小胸透视激情套装夜店', '', '<div class=\"J_DetailSection tshop-psm ke-post\"><div class=\"content\"><p><img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB2nCE.X0qgF1Jjy1zdXXc8dFXa_!!169468122.jpg\"/><br/> <img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB2VwNaadmgF1Jjy1XaXXcSEFXa_!!169468122.jpg\"/><br/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB24VF7bXgkyKJjSspiXXcwBpXa_!!169468122.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i1/169468122/TB28tD.aS69F1JjSZPiXXXfCXXa_!!169468122.jpg\"/></p></div></div>', '1', '1', '0', '/uploads/goods_brand/1515576059.jpg', 'a:5:{i:0;s:35:\"/uploads/goods/1515576053116598.jpg\";i:1;s:35:\"/uploads/goods/1515576053110118.jpg\";i:2;s:35:\"/uploads/goods/1515576053123475.jpg\";i:3;s:35:\"/uploads/goods/1515576053202593.jpg\";i:4;s:35:\"/uploads/goods/1515576053831890.jpg\";}', '1', '1', '0', '0', '1', '2018-01-10 17:35:22', '2018-01-10 00:00:00', '123.00', '0.00', '0.00', '95.22', '123', '123', '0', '1', '123', '2018-01-09 00:00:00', '2019-01-23 00:00:00', null, null);
INSERT INTO `ewei_goods` VALUES ('38', '14', '1', '9', '性感露胸包臀', '测试', '', '<div class=\"J_DetailSection tshop-psm ke-post\"><div class=\"content\"><p><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2NBngXbL9F1JjSZFlXXa2sVXa_!!169468122.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB2uRSMXgMEF1JjSZFxXXbcVpXa_!!169468122.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB279mnuM0kpuFjSspdXXX4YXXa_!!169468122.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB23x6fXX_.F1JjSZFjXXahnXXa_!!169468122.jpg\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB26ZO3XdmgF1Jjy0FaXXX5jpXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB280vfXkz_F1JjSZFkXXcCaXXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB25Vu4XcSfF1JjSspbXXcSkVXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i4/169468122/TB2XY1IXgIEF1JjSZFHXXbRVXXa_!!169468122.jpg\" class=\"\"/><br/><img src=\"https://img.alicdn.com/imgextra/i3/169468122/TB2F.53XjmfF1JjSspcXXXZMXXa_!!169468122.jpg\" class=\"\"/><img src=\"https://img.alicdn.com/imgextra/i2/169468122/TB2ydi3XoifF1JjSspdXXclLpXa_!!169468122.jpg\" class=\"\"/></p></div></div>', '', '1', '0', '/uploads/goods_brand/1515581629.jpg', 'a:3:{i:0;s:35:\"/uploads/goods/1515581639839679.jpg\";i:1;s:35:\"/uploads/goods/1515581639469046.jpg\";i:2;s:35:\"/uploads/goods/1515581639395160.jpg\";}', '1', '1', '1', '0', '3', '2018-01-10 18:54:30', '2018-01-10 00:00:00', '123.00', '0.00', '0.00', '900.32', '123', '1232', '32', '1', '123', '2018-01-10 00:00:00', '2018-01-30 00:00:00', null, null);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='商品浏览记录';

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
  `sid` int(11) NOT NULL COMMENT '商家ID',
  `user_number` int(11) NOT NULL COMMENT '开团人数',
  `goods_price` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '开团价格',
  `time` int(11) NOT NULL DEFAULT '3600' COMMENT '时限  默认1个小时',
  `start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开团时间',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `state` enum('1','0') NOT NULL DEFAULT '0' COMMENT '0未开启   1开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COMMENT='开团规则表';

-- ----------------------------
-- Records of ewei_goods_collective
-- ----------------------------
INSERT INTO `ewei_goods_collective` VALUES ('11', '30', '0', '12312', '123.00', '123', '2021-12-30 20:20:11', '2017-08-30 20:20:13', '1');
INSERT INTO `ewei_goods_collective` VALUES ('18', '32', '0', '2', '3.00', '3600', '2018-01-01 22:51:37', '2018-01-01 22:51:37', '1');
INSERT INTO `ewei_goods_collective` VALUES ('48', '36', '1', '123', '123.00', '123', '2018-01-10 00:00:00', '2018-01-18 00:00:00', '1');
INSERT INTO `ewei_goods_collective` VALUES ('46', '37', '1', '123', '123.00', '123', '2018-01-10 00:00:00', '2018-01-26 00:00:00', '1');
INSERT INTO `ewei_goods_collective` VALUES ('44', '38', '1', '2', '123.00', '213', '2018-01-10 00:00:00', '2018-01-26 00:00:00', '1');
INSERT INTO `ewei_goods_collective` VALUES ('45', '33', '1', '0', '0.00', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

-- ----------------------------
-- Table structure for ewei_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `ewei_goods_sku`;
CREATE TABLE `ewei_goods_sku` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `group_id` int(11) DEFAULT '0' COMMENT '分组ID',
  `create_date` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_date` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481 COMMENT='商品skui规格价格库存信息表';

-- ----------------------------
-- Records of ewei_goods_sku
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_keywords
-- ----------------------------
DROP TABLE IF EXISTS `ewei_keywords`;
CREATE TABLE `ewei_keywords` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(90) NOT NULL DEFAULT '',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort_order` int(11) unsigned NOT NULL DEFAULT '100',
  `scheme_url` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词的跳转链接',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='热闹关键词表';

-- ----------------------------
-- Records of ewei_keywords
-- ----------------------------
INSERT INTO `ewei_keywords` VALUES ('1', '性感', '1', '1', '1', '1', '', '0');
INSERT INTO `ewei_keywords` VALUES ('2', '单鞋', '0', '0', '1', '8', '', '0');
INSERT INTO `ewei_keywords` VALUES ('3', '墨镜', '0', '0', '1', '5', '', '0');
INSERT INTO `ewei_keywords` VALUES ('4', '夏凉被', '0', '0', '1', '100', '', '0');
INSERT INTO `ewei_keywords` VALUES ('5', '新品上市', '0', '0', '1', '100', '', '0');
INSERT INTO `ewei_keywords` VALUES ('6', '日式', '0', '0', '1', '100', '', '0');
INSERT INTO `ewei_keywords` VALUES ('7', '母亲节', '0', '0', '1', '100', '', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of ewei_link
-- ----------------------------
INSERT INTO `ewei_link` VALUES ('2', '优衣库特约赞助', 'http://www.taobao.com', '/uploads/common/1515598303.jpg', '1', '0');

-- ----------------------------
-- Table structure for ewei_order
-- ----------------------------
DROP TABLE IF EXISTS `ewei_order`;
CREATE TABLE `ewei_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(255) DEFAULT '' COMMENT '订单编号',
  `out_trade_no` varchar(100) NOT NULL DEFAULT '0' COMMENT '外部交易号',
  `order_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `payment_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付类型。取值范围：\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWEIXIN (微信自有支付)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWEIXIN_DAIXIAO (微信代销支付)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nALIPAY (支付宝支付)',
  `shipping_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单配送方式',
  `order_from` varchar(255) NOT NULL DEFAULT '' COMMENT '订单来源',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '买家会员名称',
  `buyer_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '买家ip',
  `buyer_message` varchar(255) NOT NULL DEFAULT '' COMMENT '买家附言',
  `buyer_invoice` varchar(255) NOT NULL DEFAULT '' COMMENT '买家发票信息',
  `receiver_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人的手机号码',
  `receiver_province` int(11) NOT NULL COMMENT '收货人所在省',
  `receiver_city` int(11) NOT NULL COMMENT '收货人所在城市',
  `receiver_district` int(11) NOT NULL COMMENT '收货人所在街道',
  `receiver_address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `receiver_zip` varchar(6) NOT NULL DEFAULT '' COMMENT '收货人邮编',
  `receiver_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `shop_id` int(11) NOT NULL COMMENT '卖家店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '卖家店铺名称',
  `seller_star` tinyint(4) NOT NULL DEFAULT '0' COMMENT '卖家对订单的标注星标',
  `seller_memo` varchar(255) NOT NULL DEFAULT '' COMMENT '卖家对订单的备注',
  `consign_time_adjust` int(11) NOT NULL DEFAULT '0' COMMENT '卖家延迟发货时间',
  `goods_money` decimal(19,2) NOT NULL COMMENT '商品总价',
  `order_money` decimal(10,2) NOT NULL COMMENT '订单总价',
  `point` int(11) NOT NULL COMMENT '订单消耗积分',
  `point_money` decimal(10,2) NOT NULL COMMENT '订单消耗积分抵多少钱',
  `coupon_money` decimal(10,2) NOT NULL COMMENT '订单代金券支付金额',
  `coupon_id` int(11) NOT NULL COMMENT '订单代金券id',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单余额支付金额',
  `user_platform_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户平台余额支付',
  `promotion_money` decimal(10,2) NOT NULL COMMENT '订单优惠活动金额',
  `shipping_money` decimal(10,2) NOT NULL COMMENT '订单运费',
  `pay_money` decimal(10,2) NOT NULL COMMENT '订单实付金额',
  `refund_money` decimal(10,2) NOT NULL COMMENT '订单退款金额',
  `coin_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购物币金额',
  `give_point` int(11) NOT NULL COMMENT '订单赠送积分',
  `give_coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单成功之后返购物币',
  `order_status` tinyint(4) NOT NULL COMMENT '订单状态',
  `pay_status` tinyint(4) NOT NULL COMMENT '订单付款状态',
  `shipping_status` tinyint(4) NOT NULL COMMENT '订单配送状态',
  `review_status` tinyint(4) NOT NULL COMMENT '订单评价状态',
  `feedback_status` tinyint(4) NOT NULL COMMENT '订单维权状态',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `tax_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_company_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送物流公司ID',
  `give_point_type` int(11) NOT NULL DEFAULT '1' COMMENT '积分返还类型 1 订单完成  2 订单收货 3  支付订单',
  `pay_time` int(11) DEFAULT '0' COMMENT '订单付款时间',
  `shipping_time` int(11) DEFAULT '0' COMMENT '买家要求配送时间',
  `sign_time` int(11) DEFAULT '0' COMMENT '买家签收时间',
  `consign_time` int(11) DEFAULT '0' COMMENT '卖家发货时间',
  `create_time` int(11) DEFAULT '0' COMMENT '订单创建时间',
  `finish_time` int(11) DEFAULT '0' COMMENT '订单完成时间',
  `is_deleted` int(1) NOT NULL DEFAULT '0' COMMENT '订单是否已删除',
  `operator_type` int(1) NOT NULL DEFAULT '0' COMMENT '操作人类型  1店铺  2用户',
  `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `refund_balance_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单退款余额',
  `fixed_telephone` varchar(50) NOT NULL DEFAULT '' COMMENT '固定电话',
  PRIMARY KEY (`id`),
  KEY `UK_ns_order_buyer_id` (`buyer_id`),
  KEY `UK_ns_order_order_no` (`order_no`),
  KEY `UK_ns_order_pay_status` (`pay_status`),
  KEY `UK_ns_order_status` (`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=440 COMMENT='订单表';

-- ----------------------------
-- Records of ewei_order
-- ----------------------------
INSERT INTO `ewei_order` VALUES ('1', '2018010715250001', '151531065872271000', '1', '1', '1', '3', '3', 'admin', '1', '', '', '13932812923', '34', '345', '2869', '123123', '', '123', '1', 'Niushop开源商城', '0', '', '0', '2600.00', '2600.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '2600.00', '0.00', '0.00', '0', '0.00', '3', '2', '2', '0', '0', '0', '0.00', '1', '3', '1515310659', '0', '1515310728', '1515310707', '1515310645', '0', '0', '0', '0', '0.00', '123');
INSERT INTO `ewei_order` VALUES ('2', '2018010923320001', '151551195115351000', '1', '1', '1', '3', '3', 'admin', '1', '', '', '13932812923', '34', '345', '2869', '123123', '', '123', '1', 'Niushop开源商城', '0', '', '0', '2600.00', '2606.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '6.00', '2606.00', '0.00', '0.00', '0', '0.00', '5', '0', '0', '0', '0', '0', '0.00', '1', '3', '0', '0', '0', '0', '1515511952', '0', '0', '0', '0', '0.00', '123');
INSERT INTO `ewei_order` VALUES ('3', '2018010923300001', '151551201065481000', '1', '1', '1', '3', '3', 'admin', '1', '', '', '13932812923', '34', '345', '2869', '123123', '', '123', '1', 'Niushop开源商城', '0', '', '0', '12692.00', '12698.00', '0', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '6.00', '12698.00', '0.00', '0.00', '0', '0.00', '5', '0', '0', '0', '0', '0', '0.00', '1', '3', '0', '0', '0', '0', '1515512010', '0', '0', '0', '0', '0.00', '123');

-- ----------------------------
-- Table structure for ewei_order_action
-- ----------------------------
DROP TABLE IF EXISTS `ewei_order_action`;
CREATE TABLE `ewei_order_action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动作id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '动作内容',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `order_status` int(11) NOT NULL COMMENT '订单大状态',
  `order_status_text` varchar(255) NOT NULL DEFAULT '' COMMENT '订单状态名称',
  `action_time` int(11) DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`action_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1706 COMMENT='订单操作表';

-- ----------------------------
-- Records of ewei_order_action
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_order_block
-- ----------------------------
DROP TABLE IF EXISTS `ewei_order_block`;
CREATE TABLE `ewei_order_block` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of ewei_order_block
-- ----------------------------

-- ----------------------------
-- Table structure for ewei_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ewei_order_goods`;
CREATE TABLE `ewei_order_goods` (
  `order_goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单项ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL COMMENT 'skuID',
  `sku_name` varchar(50) NOT NULL COMMENT 'sku名称',
  `price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商品成本价',
  `num` varchar(255) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `adjust_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '调整金额',
  `goods_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `goods_picture` int(11) NOT NULL DEFAULT '0' COMMENT '商品图片',
  `shop_id` int(11) NOT NULL DEFAULT '1' COMMENT '店铺ID',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买人ID',
  `point_exchange_type` int(11) NOT NULL DEFAULT '0' COMMENT '积分兑换类型0.非积分兑换1.积分兑换',
  `goods_type` varchar(255) NOT NULL DEFAULT '1' COMMENT '商品类型',
  `promotion_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销ID',
  `promotion_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '促销类型',
  `order_type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `order_status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `give_point` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `shipping_status` int(11) NOT NULL DEFAULT '0' COMMENT '物流状态',
  `refund_type` int(11) NOT NULL DEFAULT '1' COMMENT '退款方式',
  `refund_require_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `refund_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '退款原因',
  `refund_shipping_code` varchar(255) NOT NULL DEFAULT '' COMMENT '退款物流单号',
  `refund_shipping_company` varchar(255) NOT NULL DEFAULT '0' COMMENT '退款物流公司名称',
  `refund_real_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际退款金额',
  `refund_status` int(1) NOT NULL DEFAULT '0' COMMENT '退款状态',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_evaluate` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `refund_time` int(11) DEFAULT '0' COMMENT '退款时间',
  `refund_balance_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单退款余额',
  `tmp_express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '批量打印时添加的临时物流公司',
  `tmp_express_company_id` int(11) NOT NULL DEFAULT '0' COMMENT '批量打印时添加的临时物流公司id',
  `tmp_express_no` varchar(50) NOT NULL DEFAULT '' COMMENT '批量打印时添加的临时订单编号',
  PRIMARY KEY (`order_goods_id`),
  KEY `UK_ns_order_goods_buyer_id` (`buyer_id`),
  KEY `UK_ns_order_goods_goods_id` (`goods_id`),
  KEY `UK_ns_order_goods_order_id` (`order_id`),
  KEY `UK_ns_order_goods_promotion_id` (`promotion_id`),
  KEY `UK_ns_order_goods_sku_id` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=289 COMMENT='订单商品表';

-- ----------------------------
-- Records of ewei_order_goods
-- ----------------------------
INSERT INTO `ewei_order_goods` VALUES ('1', '1', '11', 'Skyworth/创维 55V9E 55吋4K超高清智能网络平板LED液晶电视机 60', '38', '', '2600.00', '0.00', '1', '0.00', '2600.00', '1', '0', '3', '0', '1', '0', '0', '1', '0', '0', '1', '1', '0.00', '', '', '0', '0.00', '0', '', '0', '0', '0.00', '', '0', '');
INSERT INTO `ewei_order_goods` VALUES ('2', '2', '11', 'Skyworth/创维 55V9E 55吋4K超高清智能网络平板LED液晶电视机 60', '38', '', '2600.00', '0.00', '1', '0.00', '2600.00', '2', '0', '3', '0', '1', '0', '0', '1', '0', '0', '0', '1', '0.00', '', '', '0', '0.00', '0', '', '0', '0', '0.00', '', '0', '');
INSERT INTO `ewei_order_goods` VALUES ('3', '3', '11', 'Skyworth/创维 55V9E 55吋4K超高清智能网络平板LED液晶电视机 60', '38', '', '2600.00', '0.00', '1', '0.00', '2600.00', '3', '0', '3', '0', '1', '0', '0', '1', '0', '0', '0', '1', '0.00', '', '', '0', '0.00', '0', '', '0', '0', '0.00', '', '0', '');
INSERT INTO `ewei_order_goods` VALUES ('4', '3', '11', '新品TCL 49A660U 49英寸4K金属纤薄高清智能LED液晶网络平板电视', '37', '', '3496.00', '0.00', '1', '0.00', '3496.00', '4', '0', '3', '0', '1', '0', '0', '1', '0', '0', '0', '1', '0.00', '', '', '0', '0.00', '0', '', '0', '0', '0.00', '', '0', '');
INSERT INTO `ewei_order_goods` VALUES ('5', '3', '11', 'Xiaomi/小米 小米电视3s 55英寸 4k壁挂智能液晶平板电视机50 60', '36', '', '2396.00', '0.00', '1', '0.00', '2396.00', '5', '0', '3', '0', '1', '0', '0', '1', '0', '0', '0', '1', '0.00', '', '', '0', '0.00', '0', '', '0', '0', '0.00', '', '0', '');
INSERT INTO `ewei_order_goods` VALUES ('6', '3', '11', 'Sharp/夏普 LCD-70SU665A 70英寸高清4K网络智能液晶平板电视机65', '35', '', '4200.00', '0.00', '1', '0.00', '4200.00', '6', '0', '3', '0', '1', '0', '0', '1', '0', '0', '0', '1', '0.00', '', '', '0', '0.00', '0', '', '0', '0', '0.00', '', '0', '');

-- ----------------------------
-- Table structure for ewei_order_goods_express
-- ----------------------------
DROP TABLE IF EXISTS `ewei_order_goods_express`;
CREATE TABLE `ewei_order_goods_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_id_array` varchar(255) NOT NULL COMMENT '订单项商品组合列表',
  `express_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包裹名称  （包裹- 1 包裹 - 2）',
  `shipping_type` tinyint(4) NOT NULL COMMENT '发货方式1 需要物流 0无需物流',
  `express_company_id` int(11) NOT NULL COMMENT '快递公司id',
  `express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(50) NOT NULL COMMENT '运单编号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `shipping_time` int(11) DEFAULT '0' COMMENT '发货时间',
  PRIMARY KEY (`id`),
  KEY `UK_ns_order_goods_express_order_goods_id_array` (`order_goods_id_array`),
  KEY `UK_ns_order_goods_express_order_id` (`order_id`),
  KEY `UK_ns_order_goods_express_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='商品订单物流信息表（多次发货）';

-- ----------------------------
-- Records of ewei_order_goods_express
-- ----------------------------
INSERT INTO `ewei_order_goods_express` VALUES ('1', '1', '1', 'sdfsdf', '1', '1', 'sdfsdf', '123123123', '3', 'admin', '', '1515310707');

-- ----------------------------
-- Table structure for ewei_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `ewei_order_payment`;
CREATE TABLE `ewei_order_payment` (
  `out_trade_no` varchar(30) NOT NULL COMMENT '支付单编号',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '执行支付的相关店铺ID（0平台）',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '订单类型1.商城订单2.交易商支付',
  `type_alis_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型关联ID',
  `pay_body` varchar(255) NOT NULL DEFAULT '' COMMENT '订单支付简介',
  `pay_detail` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单支付详情',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_type` int(11) NOT NULL DEFAULT '1' COMMENT '支付方式',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `trade_no` varchar(30) NOT NULL DEFAULT '' COMMENT '交易号，支付宝退款用，微信传入空',
  KEY `IDX_ns_order_payment_out_trade_no` (`out_trade_no`),
  KEY `IDX_ns_order_payment_pay_status` (`pay_status`),
  KEY `IDX_ns_order_payment_pay_type` (`pay_type`),
  KEY `IDX_ns_order_payment_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='订单支付表';

-- ----------------------------
-- Records of ewei_order_payment
-- ----------------------------
INSERT INTO `ewei_order_payment` VALUES ('151531065872271000', '0', '1', '1', 'Niushop开源商城订单', 'Niushop开源商城订单', '2600.00', '1', '10', '1515310645', '1515310659', '');
INSERT INTO `ewei_order_payment` VALUES ('151551195115351000', '0', '1', '2', 'Niushop开源商城订单', 'Niushop开源商城订单', '2606.00', '0', '1', '1515511952', '0', '');
INSERT INTO `ewei_order_payment` VALUES ('151551201065481000', '0', '1', '3', 'Niushop开源商城订单', 'Niushop开源商城订单', '12698.00', '0', '1', '1515512010', '0', '');

-- ----------------------------
-- Table structure for ewei_province
-- ----------------------------
DROP TABLE IF EXISTS `ewei_province`;
CREATE TABLE `ewei_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` tinyint(4) NOT NULL DEFAULT '0',
  `province_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`province_id`),
  KEY `IDX_g_province_ProvinceName` (`province_name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481 COMMENT='省份表';

-- ----------------------------
-- Records of ewei_province
-- ----------------------------
INSERT INTO `ewei_province` VALUES ('1', '2', '北京市', '1');
INSERT INTO `ewei_province` VALUES ('2', '2', '天津市', '0');
INSERT INTO `ewei_province` VALUES ('3', '2', '河北省', '0');
INSERT INTO `ewei_province` VALUES ('4', '2', '山西省', '0');
INSERT INTO `ewei_province` VALUES ('5', '2', '内蒙古自治区', '0');
INSERT INTO `ewei_province` VALUES ('6', '5', '辽宁省', '0');
INSERT INTO `ewei_province` VALUES ('7', '5', '吉林省', '0');
INSERT INTO `ewei_province` VALUES ('8', '5', '黑龙江省', '0');
INSERT INTO `ewei_province` VALUES ('9', '1', '上海市', '0');
INSERT INTO `ewei_province` VALUES ('10', '1', '江苏省', '0');
INSERT INTO `ewei_province` VALUES ('11', '1', '浙江省', '0');
INSERT INTO `ewei_province` VALUES ('12', '1', '安徽省', '0');
INSERT INTO `ewei_province` VALUES ('13', '3', '福建省', '0');
INSERT INTO `ewei_province` VALUES ('14', '1', '江西省', '0');
INSERT INTO `ewei_province` VALUES ('15', '2', '山东省', '0');
INSERT INTO `ewei_province` VALUES ('16', '4', '河南省', '0');
INSERT INTO `ewei_province` VALUES ('17', '4', '湖北省', '0');
INSERT INTO `ewei_province` VALUES ('18', '4', '湖南省', '0');
INSERT INTO `ewei_province` VALUES ('19', '3', '广东省', '0');
INSERT INTO `ewei_province` VALUES ('20', '3', '广西壮族自治区', '0');
INSERT INTO `ewei_province` VALUES ('21', '3', '海南省', '0');
INSERT INTO `ewei_province` VALUES ('22', '7', '重庆市', '0');
INSERT INTO `ewei_province` VALUES ('23', '7', '四川省', '0');
INSERT INTO `ewei_province` VALUES ('24', '7', '贵州省', '0');
INSERT INTO `ewei_province` VALUES ('25', '7', '云南省', '0');
INSERT INTO `ewei_province` VALUES ('26', '7', '西藏自治区', '0');
INSERT INTO `ewei_province` VALUES ('27', '6', '陕西省', '0');
INSERT INTO `ewei_province` VALUES ('28', '6', '甘肃省', '0');
INSERT INTO `ewei_province` VALUES ('29', '6', '青海省', '0');
INSERT INTO `ewei_province` VALUES ('30', '6', '宁夏回族自治区', '0');
INSERT INTO `ewei_province` VALUES ('31', '6', '新疆维吾尔自治区', '0');
INSERT INTO `ewei_province` VALUES ('32', '8', '香港特别行政区', '0');
INSERT INTO `ewei_province` VALUES ('33', '8', '澳门特别行政区', '0');
INSERT INTO `ewei_province` VALUES ('34', '8', '台湾省', '0');

-- ----------------------------
-- Table structure for ewei_region
-- ----------------------------
DROP TABLE IF EXISTS `ewei_region`;
CREATE TABLE `ewei_region` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4044 DEFAULT CHARSET=utf8mb4 COMMENT='接口使用城市 数据表';

-- ----------------------------
-- Records of ewei_region
-- ----------------------------
INSERT INTO `ewei_region` VALUES ('1', '0', '中国', '0', '0');
INSERT INTO `ewei_region` VALUES ('2', '1', '北京', '1', '0');
INSERT INTO `ewei_region` VALUES ('3', '1', '天津', '1', '0');
INSERT INTO `ewei_region` VALUES ('4', '1', '河北省', '1', '0');
INSERT INTO `ewei_region` VALUES ('5', '1', '山西省', '1', '0');
INSERT INTO `ewei_region` VALUES ('6', '1', '内蒙古自治区', '1', '0');
INSERT INTO `ewei_region` VALUES ('7', '1', '辽宁省', '1', '0');
INSERT INTO `ewei_region` VALUES ('8', '1', '吉林省', '1', '0');
INSERT INTO `ewei_region` VALUES ('9', '1', '黑龙江省', '1', '0');
INSERT INTO `ewei_region` VALUES ('10', '1', '上海', '1', '0');
INSERT INTO `ewei_region` VALUES ('11', '1', '江苏省', '1', '0');
INSERT INTO `ewei_region` VALUES ('12', '1', '浙江省', '1', '0');
INSERT INTO `ewei_region` VALUES ('13', '1', '安徽省', '1', '0');
INSERT INTO `ewei_region` VALUES ('14', '1', '福建省', '1', '0');
INSERT INTO `ewei_region` VALUES ('15', '1', '江西省', '1', '0');
INSERT INTO `ewei_region` VALUES ('16', '1', '山东省', '1', '0');
INSERT INTO `ewei_region` VALUES ('17', '1', '河南省', '1', '0');
INSERT INTO `ewei_region` VALUES ('18', '1', '湖北省', '1', '0');
INSERT INTO `ewei_region` VALUES ('19', '1', '湖南省', '1', '0');
INSERT INTO `ewei_region` VALUES ('20', '1', '广东省', '1', '0');
INSERT INTO `ewei_region` VALUES ('21', '1', '广西壮族自治区', '1', '0');
INSERT INTO `ewei_region` VALUES ('22', '1', '海南省', '1', '0');
INSERT INTO `ewei_region` VALUES ('23', '1', '重庆', '1', '0');
INSERT INTO `ewei_region` VALUES ('24', '1', '四川省', '1', '0');
INSERT INTO `ewei_region` VALUES ('25', '1', '贵州省', '1', '0');
INSERT INTO `ewei_region` VALUES ('26', '1', '云南省', '1', '0');
INSERT INTO `ewei_region` VALUES ('27', '1', '西藏自治区', '1', '0');
INSERT INTO `ewei_region` VALUES ('28', '1', '陕西省', '1', '0');
INSERT INTO `ewei_region` VALUES ('29', '1', '甘肃省', '1', '0');
INSERT INTO `ewei_region` VALUES ('30', '1', '青海省', '1', '0');
INSERT INTO `ewei_region` VALUES ('31', '1', '宁夏回族自治区', '1', '0');
INSERT INTO `ewei_region` VALUES ('32', '1', '新疆维吾尔自治区', '1', '0');
INSERT INTO `ewei_region` VALUES ('33', '1', '台湾', '1', '0');
INSERT INTO `ewei_region` VALUES ('34', '1', '香港特别行政区', '1', '0');
INSERT INTO `ewei_region` VALUES ('35', '1', '澳门特别行政区', '1', '0');
INSERT INTO `ewei_region` VALUES ('36', '1', '海外', '1', '0');
INSERT INTO `ewei_region` VALUES ('37', '2', '北京市', '2', '0');
INSERT INTO `ewei_region` VALUES ('38', '3', '天津市', '2', '0');
INSERT INTO `ewei_region` VALUES ('39', '4', '石家庄市', '2', '0');
INSERT INTO `ewei_region` VALUES ('40', '4', '唐山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('41', '4', '秦皇岛市', '2', '0');
INSERT INTO `ewei_region` VALUES ('42', '4', '邯郸市', '2', '0');
INSERT INTO `ewei_region` VALUES ('43', '4', '邢台市', '2', '0');
INSERT INTO `ewei_region` VALUES ('44', '4', '保定市', '2', '0');
INSERT INTO `ewei_region` VALUES ('45', '4', '张家口市', '2', '0');
INSERT INTO `ewei_region` VALUES ('46', '4', '承德市', '2', '0');
INSERT INTO `ewei_region` VALUES ('47', '4', '沧州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('48', '4', '廊坊市', '2', '0');
INSERT INTO `ewei_region` VALUES ('49', '4', '衡水市', '2', '0');
INSERT INTO `ewei_region` VALUES ('50', '5', '太原市', '2', '0');
INSERT INTO `ewei_region` VALUES ('51', '5', '大同市', '2', '0');
INSERT INTO `ewei_region` VALUES ('52', '5', '阳泉市', '2', '0');
INSERT INTO `ewei_region` VALUES ('53', '5', '长治市', '2', '0');
INSERT INTO `ewei_region` VALUES ('54', '5', '晋城市', '2', '0');
INSERT INTO `ewei_region` VALUES ('55', '5', '朔州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('56', '5', '晋中市', '2', '0');
INSERT INTO `ewei_region` VALUES ('57', '5', '运城市', '2', '0');
INSERT INTO `ewei_region` VALUES ('58', '5', '忻州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('59', '5', '临汾市', '2', '0');
INSERT INTO `ewei_region` VALUES ('60', '5', '吕梁市', '2', '0');
INSERT INTO `ewei_region` VALUES ('61', '6', '呼和浩特市', '2', '0');
INSERT INTO `ewei_region` VALUES ('62', '6', '包头市', '2', '0');
INSERT INTO `ewei_region` VALUES ('63', '6', '乌海市', '2', '0');
INSERT INTO `ewei_region` VALUES ('64', '6', '赤峰市', '2', '0');
INSERT INTO `ewei_region` VALUES ('65', '6', '通辽市', '2', '0');
INSERT INTO `ewei_region` VALUES ('66', '6', '鄂尔多斯市', '2', '0');
INSERT INTO `ewei_region` VALUES ('67', '6', '呼伦贝尔市', '2', '0');
INSERT INTO `ewei_region` VALUES ('68', '6', '巴彦淖尔市', '2', '0');
INSERT INTO `ewei_region` VALUES ('69', '6', '乌兰察布市', '2', '0');
INSERT INTO `ewei_region` VALUES ('70', '6', '兴安盟', '2', '0');
INSERT INTO `ewei_region` VALUES ('71', '6', '锡林郭勒盟', '2', '0');
INSERT INTO `ewei_region` VALUES ('72', '6', '阿拉善盟', '2', '0');
INSERT INTO `ewei_region` VALUES ('73', '7', '沈阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('74', '7', '大连市', '2', '0');
INSERT INTO `ewei_region` VALUES ('75', '7', '鞍山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('76', '7', '抚顺市', '2', '0');
INSERT INTO `ewei_region` VALUES ('77', '7', '本溪市', '2', '0');
INSERT INTO `ewei_region` VALUES ('78', '7', '丹东市', '2', '0');
INSERT INTO `ewei_region` VALUES ('79', '7', '锦州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('80', '7', '营口市', '2', '0');
INSERT INTO `ewei_region` VALUES ('81', '7', '阜新市', '2', '0');
INSERT INTO `ewei_region` VALUES ('82', '7', '辽阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('83', '7', '盘锦市', '2', '0');
INSERT INTO `ewei_region` VALUES ('84', '7', '铁岭市', '2', '0');
INSERT INTO `ewei_region` VALUES ('85', '7', '朝阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('86', '7', '葫芦岛市', '2', '0');
INSERT INTO `ewei_region` VALUES ('87', '8', '长春市', '2', '0');
INSERT INTO `ewei_region` VALUES ('88', '8', '吉林市', '2', '0');
INSERT INTO `ewei_region` VALUES ('89', '8', '四平市', '2', '0');
INSERT INTO `ewei_region` VALUES ('90', '8', '辽源市', '2', '0');
INSERT INTO `ewei_region` VALUES ('91', '8', '通化市', '2', '0');
INSERT INTO `ewei_region` VALUES ('92', '8', '白山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('93', '8', '松原市', '2', '0');
INSERT INTO `ewei_region` VALUES ('94', '8', '白城市', '2', '0');
INSERT INTO `ewei_region` VALUES ('95', '8', '延边朝鲜族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('96', '9', '哈尔滨市', '2', '0');
INSERT INTO `ewei_region` VALUES ('97', '9', '齐齐哈尔市', '2', '0');
INSERT INTO `ewei_region` VALUES ('98', '9', '鸡西市', '2', '0');
INSERT INTO `ewei_region` VALUES ('99', '9', '鹤岗市', '2', '0');
INSERT INTO `ewei_region` VALUES ('100', '9', '双鸭山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('101', '9', '大庆市', '2', '0');
INSERT INTO `ewei_region` VALUES ('102', '9', '伊春市', '2', '0');
INSERT INTO `ewei_region` VALUES ('103', '9', '佳木斯市', '2', '0');
INSERT INTO `ewei_region` VALUES ('104', '9', '七台河市', '2', '0');
INSERT INTO `ewei_region` VALUES ('105', '9', '牡丹江市', '2', '0');
INSERT INTO `ewei_region` VALUES ('106', '9', '黑河市', '2', '0');
INSERT INTO `ewei_region` VALUES ('107', '9', '绥化市', '2', '0');
INSERT INTO `ewei_region` VALUES ('108', '9', '大兴安岭地区', '2', '0');
INSERT INTO `ewei_region` VALUES ('109', '10', '上海市', '2', '0');
INSERT INTO `ewei_region` VALUES ('110', '11', '南京市', '2', '0');
INSERT INTO `ewei_region` VALUES ('111', '11', '无锡市', '2', '0');
INSERT INTO `ewei_region` VALUES ('112', '11', '徐州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('113', '11', '常州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('114', '11', '苏州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('115', '11', '南通市', '2', '0');
INSERT INTO `ewei_region` VALUES ('116', '11', '连云港市', '2', '0');
INSERT INTO `ewei_region` VALUES ('117', '11', '淮安市', '2', '0');
INSERT INTO `ewei_region` VALUES ('118', '11', '盐城市', '2', '0');
INSERT INTO `ewei_region` VALUES ('119', '11', '扬州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('120', '11', '镇江市', '2', '0');
INSERT INTO `ewei_region` VALUES ('121', '11', '泰州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('122', '11', '宿迁市', '2', '0');
INSERT INTO `ewei_region` VALUES ('123', '12', '杭州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('124', '12', '宁波市', '2', '0');
INSERT INTO `ewei_region` VALUES ('125', '12', '温州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('126', '12', '嘉兴市', '2', '0');
INSERT INTO `ewei_region` VALUES ('127', '12', '湖州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('128', '12', '绍兴市', '2', '0');
INSERT INTO `ewei_region` VALUES ('129', '12', '金华市', '2', '0');
INSERT INTO `ewei_region` VALUES ('130', '12', '衢州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('131', '12', '舟山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('132', '12', '台州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('133', '12', '丽水市', '2', '0');
INSERT INTO `ewei_region` VALUES ('134', '13', '合肥市', '2', '0');
INSERT INTO `ewei_region` VALUES ('135', '13', '芜湖市', '2', '0');
INSERT INTO `ewei_region` VALUES ('136', '13', '蚌埠市', '2', '0');
INSERT INTO `ewei_region` VALUES ('137', '13', '淮南市', '2', '0');
INSERT INTO `ewei_region` VALUES ('138', '13', '马鞍山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('139', '13', '淮北市', '2', '0');
INSERT INTO `ewei_region` VALUES ('140', '13', '铜陵市', '2', '0');
INSERT INTO `ewei_region` VALUES ('141', '13', '安庆市', '2', '0');
INSERT INTO `ewei_region` VALUES ('142', '13', '黄山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('143', '13', '滁州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('144', '13', '阜阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('145', '13', '宿州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('146', '13', '六安市', '2', '0');
INSERT INTO `ewei_region` VALUES ('147', '13', '亳州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('148', '13', '池州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('149', '13', '宣城市', '2', '0');
INSERT INTO `ewei_region` VALUES ('150', '14', '福州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('151', '14', '厦门市', '2', '0');
INSERT INTO `ewei_region` VALUES ('152', '14', '莆田市', '2', '0');
INSERT INTO `ewei_region` VALUES ('153', '14', '三明市', '2', '0');
INSERT INTO `ewei_region` VALUES ('154', '14', '泉州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('155', '14', '漳州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('156', '14', '南平市', '2', '0');
INSERT INTO `ewei_region` VALUES ('157', '14', '龙岩市', '2', '0');
INSERT INTO `ewei_region` VALUES ('158', '14', '宁德市', '2', '0');
INSERT INTO `ewei_region` VALUES ('159', '15', '南昌市', '2', '0');
INSERT INTO `ewei_region` VALUES ('160', '15', '景德镇市', '2', '0');
INSERT INTO `ewei_region` VALUES ('161', '15', '萍乡市', '2', '0');
INSERT INTO `ewei_region` VALUES ('162', '15', '九江市', '2', '0');
INSERT INTO `ewei_region` VALUES ('163', '15', '新余市', '2', '0');
INSERT INTO `ewei_region` VALUES ('164', '15', '鹰潭市', '2', '0');
INSERT INTO `ewei_region` VALUES ('165', '15', '赣州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('166', '15', '吉安市', '2', '0');
INSERT INTO `ewei_region` VALUES ('167', '15', '宜春市', '2', '0');
INSERT INTO `ewei_region` VALUES ('168', '15', '抚州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('169', '15', '上饶市', '2', '0');
INSERT INTO `ewei_region` VALUES ('170', '16', '济南市', '2', '0');
INSERT INTO `ewei_region` VALUES ('171', '16', '青岛市', '2', '0');
INSERT INTO `ewei_region` VALUES ('172', '16', '淄博市', '2', '0');
INSERT INTO `ewei_region` VALUES ('173', '16', '枣庄市', '2', '0');
INSERT INTO `ewei_region` VALUES ('174', '16', '东营市', '2', '0');
INSERT INTO `ewei_region` VALUES ('175', '16', '烟台市', '2', '0');
INSERT INTO `ewei_region` VALUES ('176', '16', '潍坊市', '2', '0');
INSERT INTO `ewei_region` VALUES ('177', '16', '济宁市', '2', '0');
INSERT INTO `ewei_region` VALUES ('178', '16', '泰安市', '2', '0');
INSERT INTO `ewei_region` VALUES ('179', '16', '威海市', '2', '0');
INSERT INTO `ewei_region` VALUES ('180', '16', '日照市', '2', '0');
INSERT INTO `ewei_region` VALUES ('181', '16', '莱芜市', '2', '0');
INSERT INTO `ewei_region` VALUES ('182', '16', '临沂市', '2', '0');
INSERT INTO `ewei_region` VALUES ('183', '16', '德州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('184', '16', '聊城市', '2', '0');
INSERT INTO `ewei_region` VALUES ('185', '16', '滨州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('186', '16', '菏泽市', '2', '0');
INSERT INTO `ewei_region` VALUES ('187', '17', '郑州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('188', '17', '开封市', '2', '0');
INSERT INTO `ewei_region` VALUES ('189', '17', '洛阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('190', '17', '平顶山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('191', '17', '安阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('192', '17', '鹤壁市', '2', '0');
INSERT INTO `ewei_region` VALUES ('193', '17', '新乡市', '2', '0');
INSERT INTO `ewei_region` VALUES ('194', '17', '焦作市', '2', '0');
INSERT INTO `ewei_region` VALUES ('195', '17', '濮阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('196', '17', '许昌市', '2', '0');
INSERT INTO `ewei_region` VALUES ('197', '17', '漯河市', '2', '0');
INSERT INTO `ewei_region` VALUES ('198', '17', '三门峡市', '2', '0');
INSERT INTO `ewei_region` VALUES ('199', '17', '南阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('200', '17', '商丘市', '2', '0');
INSERT INTO `ewei_region` VALUES ('201', '17', '信阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('202', '17', '周口市', '2', '0');
INSERT INTO `ewei_region` VALUES ('203', '17', '驻马店市', '2', '0');
INSERT INTO `ewei_region` VALUES ('204', '18', '武汉市', '2', '0');
INSERT INTO `ewei_region` VALUES ('205', '18', '黄石市', '2', '0');
INSERT INTO `ewei_region` VALUES ('206', '18', '十堰市', '2', '0');
INSERT INTO `ewei_region` VALUES ('207', '18', '宜昌市', '2', '0');
INSERT INTO `ewei_region` VALUES ('208', '18', '襄阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('209', '18', '鄂州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('210', '18', '荆门市', '2', '0');
INSERT INTO `ewei_region` VALUES ('211', '18', '孝感市', '2', '0');
INSERT INTO `ewei_region` VALUES ('212', '18', '荆州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('213', '18', '黄冈市', '2', '0');
INSERT INTO `ewei_region` VALUES ('214', '18', '咸宁市', '2', '0');
INSERT INTO `ewei_region` VALUES ('215', '18', '随州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('216', '18', '恩施土家族苗族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('217', '19', '长沙市', '2', '0');
INSERT INTO `ewei_region` VALUES ('218', '19', '株洲市', '2', '0');
INSERT INTO `ewei_region` VALUES ('219', '19', '湘潭市', '2', '0');
INSERT INTO `ewei_region` VALUES ('220', '19', '衡阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('221', '19', '邵阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('222', '19', '岳阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('223', '19', '常德市', '2', '0');
INSERT INTO `ewei_region` VALUES ('224', '19', '张家界市', '2', '0');
INSERT INTO `ewei_region` VALUES ('225', '19', '益阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('226', '19', '郴州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('227', '19', '永州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('228', '19', '怀化市', '2', '0');
INSERT INTO `ewei_region` VALUES ('229', '19', '娄底市', '2', '0');
INSERT INTO `ewei_region` VALUES ('230', '19', '湘西土家族苗族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('231', '20', '广州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('232', '20', '韶关市', '2', '0');
INSERT INTO `ewei_region` VALUES ('233', '20', '深圳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('234', '20', '珠海市', '2', '0');
INSERT INTO `ewei_region` VALUES ('235', '20', '汕头市', '2', '0');
INSERT INTO `ewei_region` VALUES ('236', '20', '佛山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('237', '20', '江门市', '2', '0');
INSERT INTO `ewei_region` VALUES ('238', '20', '湛江市', '2', '0');
INSERT INTO `ewei_region` VALUES ('239', '20', '茂名市', '2', '0');
INSERT INTO `ewei_region` VALUES ('240', '20', '肇庆市', '2', '0');
INSERT INTO `ewei_region` VALUES ('241', '20', '惠州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('242', '20', '梅州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('243', '20', '汕尾市', '2', '0');
INSERT INTO `ewei_region` VALUES ('244', '20', '河源市', '2', '0');
INSERT INTO `ewei_region` VALUES ('245', '20', '阳江市', '2', '0');
INSERT INTO `ewei_region` VALUES ('246', '20', '清远市', '2', '0');
INSERT INTO `ewei_region` VALUES ('247', '20', '东莞市', '2', '0');
INSERT INTO `ewei_region` VALUES ('248', '20', '中山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('249', '20', '东沙群岛', '2', '0');
INSERT INTO `ewei_region` VALUES ('250', '20', '潮州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('251', '20', '揭阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('252', '20', '云浮市', '2', '0');
INSERT INTO `ewei_region` VALUES ('253', '21', '南宁市', '2', '0');
INSERT INTO `ewei_region` VALUES ('254', '21', '柳州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('255', '21', '桂林市', '2', '0');
INSERT INTO `ewei_region` VALUES ('256', '21', '梧州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('257', '21', '北海市', '2', '0');
INSERT INTO `ewei_region` VALUES ('258', '21', '防城港市', '2', '0');
INSERT INTO `ewei_region` VALUES ('259', '21', '钦州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('260', '21', '贵港市', '2', '0');
INSERT INTO `ewei_region` VALUES ('261', '21', '玉林市', '2', '0');
INSERT INTO `ewei_region` VALUES ('262', '21', '百色市', '2', '0');
INSERT INTO `ewei_region` VALUES ('263', '21', '贺州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('264', '21', '河池市', '2', '0');
INSERT INTO `ewei_region` VALUES ('265', '21', '来宾市', '2', '0');
INSERT INTO `ewei_region` VALUES ('266', '21', '崇左市', '2', '0');
INSERT INTO `ewei_region` VALUES ('267', '22', '海口市', '2', '0');
INSERT INTO `ewei_region` VALUES ('268', '22', '三亚市', '2', '0');
INSERT INTO `ewei_region` VALUES ('269', '22', '三沙市', '2', '0');
INSERT INTO `ewei_region` VALUES ('270', '23', '重庆市', '2', '0');
INSERT INTO `ewei_region` VALUES ('271', '24', '成都市', '2', '0');
INSERT INTO `ewei_region` VALUES ('272', '24', '自贡市', '2', '0');
INSERT INTO `ewei_region` VALUES ('273', '24', '攀枝花市', '2', '0');
INSERT INTO `ewei_region` VALUES ('274', '24', '泸州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('275', '24', '德阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('276', '24', '绵阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('277', '24', '广元市', '2', '0');
INSERT INTO `ewei_region` VALUES ('278', '24', '遂宁市', '2', '0');
INSERT INTO `ewei_region` VALUES ('279', '24', '内江市', '2', '0');
INSERT INTO `ewei_region` VALUES ('280', '24', '乐山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('281', '24', '南充市', '2', '0');
INSERT INTO `ewei_region` VALUES ('282', '24', '眉山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('283', '24', '宜宾市', '2', '0');
INSERT INTO `ewei_region` VALUES ('284', '24', '广安市', '2', '0');
INSERT INTO `ewei_region` VALUES ('285', '24', '达州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('286', '24', '雅安市', '2', '0');
INSERT INTO `ewei_region` VALUES ('287', '24', '巴中市', '2', '0');
INSERT INTO `ewei_region` VALUES ('288', '24', '资阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('289', '24', '阿坝藏族羌族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('290', '24', '甘孜藏族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('291', '24', '凉山彝族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('292', '25', '贵阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('293', '25', '六盘水市', '2', '0');
INSERT INTO `ewei_region` VALUES ('294', '25', '遵义市', '2', '0');
INSERT INTO `ewei_region` VALUES ('295', '25', '安顺市', '2', '0');
INSERT INTO `ewei_region` VALUES ('296', '25', '铜仁市', '2', '0');
INSERT INTO `ewei_region` VALUES ('297', '25', '黔西南布依族苗族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('298', '25', '毕节市', '2', '0');
INSERT INTO `ewei_region` VALUES ('299', '25', '黔东南苗族侗族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('300', '25', '黔南布依族苗族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('301', '26', '昆明市', '2', '0');
INSERT INTO `ewei_region` VALUES ('302', '26', '曲靖市', '2', '0');
INSERT INTO `ewei_region` VALUES ('303', '26', '玉溪市', '2', '0');
INSERT INTO `ewei_region` VALUES ('304', '26', '保山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('305', '26', '昭通市', '2', '0');
INSERT INTO `ewei_region` VALUES ('306', '26', '丽江市', '2', '0');
INSERT INTO `ewei_region` VALUES ('307', '26', '普洱市', '2', '0');
INSERT INTO `ewei_region` VALUES ('308', '26', '临沧市', '2', '0');
INSERT INTO `ewei_region` VALUES ('309', '26', '楚雄彝族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('310', '26', '红河哈尼族彝族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('311', '26', '文山壮族苗族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('312', '26', '西双版纳傣族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('313', '26', '大理白族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('314', '26', '德宏傣族景颇族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('315', '26', '怒江傈僳族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('316', '26', '迪庆藏族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('317', '27', '拉萨市', '2', '0');
INSERT INTO `ewei_region` VALUES ('318', '27', '昌都市', '2', '0');
INSERT INTO `ewei_region` VALUES ('319', '27', '山南地区', '2', '0');
INSERT INTO `ewei_region` VALUES ('320', '27', '日喀则市', '2', '0');
INSERT INTO `ewei_region` VALUES ('321', '27', '那曲地区', '2', '0');
INSERT INTO `ewei_region` VALUES ('322', '27', '阿里地区', '2', '0');
INSERT INTO `ewei_region` VALUES ('323', '27', '林芝市', '2', '0');
INSERT INTO `ewei_region` VALUES ('324', '28', '西安市', '2', '0');
INSERT INTO `ewei_region` VALUES ('325', '28', '铜川市', '2', '0');
INSERT INTO `ewei_region` VALUES ('326', '28', '宝鸡市', '2', '0');
INSERT INTO `ewei_region` VALUES ('327', '28', '咸阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('328', '28', '渭南市', '2', '0');
INSERT INTO `ewei_region` VALUES ('329', '28', '延安市', '2', '0');
INSERT INTO `ewei_region` VALUES ('330', '28', '汉中市', '2', '0');
INSERT INTO `ewei_region` VALUES ('331', '28', '榆林市', '2', '0');
INSERT INTO `ewei_region` VALUES ('332', '28', '安康市', '2', '0');
INSERT INTO `ewei_region` VALUES ('333', '28', '商洛市', '2', '0');
INSERT INTO `ewei_region` VALUES ('334', '29', '兰州市', '2', '0');
INSERT INTO `ewei_region` VALUES ('335', '29', '嘉峪关市', '2', '0');
INSERT INTO `ewei_region` VALUES ('336', '29', '金昌市', '2', '0');
INSERT INTO `ewei_region` VALUES ('337', '29', '白银市', '2', '0');
INSERT INTO `ewei_region` VALUES ('338', '29', '天水市', '2', '0');
INSERT INTO `ewei_region` VALUES ('339', '29', '武威市', '2', '0');
INSERT INTO `ewei_region` VALUES ('340', '29', '张掖市', '2', '0');
INSERT INTO `ewei_region` VALUES ('341', '29', '平凉市', '2', '0');
INSERT INTO `ewei_region` VALUES ('342', '29', '酒泉市', '2', '0');
INSERT INTO `ewei_region` VALUES ('343', '29', '庆阳市', '2', '0');
INSERT INTO `ewei_region` VALUES ('344', '29', '定西市', '2', '0');
INSERT INTO `ewei_region` VALUES ('345', '29', '陇南市', '2', '0');
INSERT INTO `ewei_region` VALUES ('346', '29', '临夏回族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('347', '29', '甘南藏族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('348', '30', '西宁市', '2', '0');
INSERT INTO `ewei_region` VALUES ('349', '30', '海东市', '2', '0');
INSERT INTO `ewei_region` VALUES ('350', '30', '海北藏族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('351', '30', '黄南藏族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('352', '30', '海南藏族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('353', '30', '果洛藏族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('354', '30', '玉树藏族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('355', '30', '海西蒙古族藏族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('356', '31', '银川市', '2', '0');
INSERT INTO `ewei_region` VALUES ('357', '31', '石嘴山市', '2', '0');
INSERT INTO `ewei_region` VALUES ('358', '31', '吴忠市', '2', '0');
INSERT INTO `ewei_region` VALUES ('359', '31', '固原市', '2', '0');
INSERT INTO `ewei_region` VALUES ('360', '31', '中卫市', '2', '0');
INSERT INTO `ewei_region` VALUES ('361', '32', '乌鲁木齐市', '2', '0');
INSERT INTO `ewei_region` VALUES ('362', '32', '克拉玛依市', '2', '0');
INSERT INTO `ewei_region` VALUES ('363', '32', '吐鲁番市', '2', '0');
INSERT INTO `ewei_region` VALUES ('364', '32', '哈密地区', '2', '0');
INSERT INTO `ewei_region` VALUES ('365', '32', '昌吉回族自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('366', '32', '博尔塔拉蒙古自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('367', '32', '巴音郭楞蒙古自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('368', '32', '阿克苏地区', '2', '0');
INSERT INTO `ewei_region` VALUES ('369', '32', '克孜勒苏柯尔克孜自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('370', '32', '喀什地区', '2', '0');
INSERT INTO `ewei_region` VALUES ('371', '32', '和田地区', '2', '0');
INSERT INTO `ewei_region` VALUES ('372', '32', '伊犁哈萨克自治州', '2', '0');
INSERT INTO `ewei_region` VALUES ('373', '32', '塔城地区', '2', '0');
INSERT INTO `ewei_region` VALUES ('374', '32', '阿勒泰地区', '2', '0');
INSERT INTO `ewei_region` VALUES ('375', '33', '台北市', '2', '0');
INSERT INTO `ewei_region` VALUES ('376', '33', '高雄市', '2', '0');
INSERT INTO `ewei_region` VALUES ('377', '33', '台南市', '2', '0');
INSERT INTO `ewei_region` VALUES ('378', '33', '台中市', '2', '0');
INSERT INTO `ewei_region` VALUES ('379', '33', '金门县', '2', '0');
INSERT INTO `ewei_region` VALUES ('380', '33', '南投县', '2', '0');
INSERT INTO `ewei_region` VALUES ('381', '33', '基隆市', '2', '0');
INSERT INTO `ewei_region` VALUES ('382', '33', '新竹市', '2', '0');
INSERT INTO `ewei_region` VALUES ('383', '33', '嘉义市', '2', '0');
INSERT INTO `ewei_region` VALUES ('384', '33', '新北市', '2', '0');
INSERT INTO `ewei_region` VALUES ('385', '33', '宜兰县', '2', '0');
INSERT INTO `ewei_region` VALUES ('386', '33', '新竹县', '2', '0');
INSERT INTO `ewei_region` VALUES ('387', '33', '桃园县', '2', '0');
INSERT INTO `ewei_region` VALUES ('388', '33', '苗栗县', '2', '0');
INSERT INTO `ewei_region` VALUES ('389', '33', '彰化县', '2', '0');
INSERT INTO `ewei_region` VALUES ('390', '33', '嘉义县', '2', '0');
INSERT INTO `ewei_region` VALUES ('391', '33', '云林县', '2', '0');
INSERT INTO `ewei_region` VALUES ('392', '33', '屏东县', '2', '0');
INSERT INTO `ewei_region` VALUES ('393', '33', '台东县', '2', '0');
INSERT INTO `ewei_region` VALUES ('394', '33', '花莲县', '2', '0');
INSERT INTO `ewei_region` VALUES ('395', '33', '澎湖县', '2', '0');
INSERT INTO `ewei_region` VALUES ('396', '33', '连江县', '2', '0');
INSERT INTO `ewei_region` VALUES ('397', '34', '香港岛', '2', '0');
INSERT INTO `ewei_region` VALUES ('398', '34', '九龙', '2', '0');
INSERT INTO `ewei_region` VALUES ('399', '34', '新界', '2', '0');
INSERT INTO `ewei_region` VALUES ('400', '35', '澳门半岛', '2', '0');
INSERT INTO `ewei_region` VALUES ('401', '35', '离岛', '2', '0');
INSERT INTO `ewei_region` VALUES ('402', '36', '海外', '2', '0');
INSERT INTO `ewei_region` VALUES ('403', '37', '东城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('404', '37', '西城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('405', '37', '崇文区', '3', '0');
INSERT INTO `ewei_region` VALUES ('406', '37', '宣武区', '3', '0');
INSERT INTO `ewei_region` VALUES ('407', '37', '朝阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('408', '37', '丰台区', '3', '0');
INSERT INTO `ewei_region` VALUES ('409', '37', '石景山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('410', '37', '海淀区', '3', '0');
INSERT INTO `ewei_region` VALUES ('411', '37', '门头沟区', '3', '0');
INSERT INTO `ewei_region` VALUES ('412', '37', '房山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('413', '37', '通州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('414', '37', '顺义区', '3', '0');
INSERT INTO `ewei_region` VALUES ('415', '37', '昌平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('416', '37', '大兴区', '3', '0');
INSERT INTO `ewei_region` VALUES ('417', '37', '怀柔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('418', '37', '平谷区', '3', '0');
INSERT INTO `ewei_region` VALUES ('419', '37', '密云县', '3', '0');
INSERT INTO `ewei_region` VALUES ('420', '37', '延庆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('421', '37', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('422', '38', '和平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('423', '38', '河东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('424', '38', '河西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('425', '38', '南开区', '3', '0');
INSERT INTO `ewei_region` VALUES ('426', '38', '河北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('427', '38', '红桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('428', '38', '塘沽区', '3', '0');
INSERT INTO `ewei_region` VALUES ('429', '38', '汉沽区', '3', '0');
INSERT INTO `ewei_region` VALUES ('430', '38', '大港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('431', '38', '东丽区', '3', '0');
INSERT INTO `ewei_region` VALUES ('432', '38', '西青区', '3', '0');
INSERT INTO `ewei_region` VALUES ('433', '38', '津南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('434', '38', '北辰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('435', '38', '武清区', '3', '0');
INSERT INTO `ewei_region` VALUES ('436', '38', '宝坻区', '3', '0');
INSERT INTO `ewei_region` VALUES ('437', '38', '滨海新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('438', '38', '宁河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('439', '38', '静海县', '3', '0');
INSERT INTO `ewei_region` VALUES ('440', '38', '蓟县', '3', '0');
INSERT INTO `ewei_region` VALUES ('441', '38', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('442', '39', '长安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('443', '39', '桥东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('444', '39', '桥西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('445', '39', '新华区', '3', '0');
INSERT INTO `ewei_region` VALUES ('446', '39', '井陉矿区', '3', '0');
INSERT INTO `ewei_region` VALUES ('447', '39', '裕华区', '3', '0');
INSERT INTO `ewei_region` VALUES ('448', '39', '井陉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('449', '39', '正定县', '3', '0');
INSERT INTO `ewei_region` VALUES ('450', '39', '栾城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('451', '39', '行唐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('452', '39', '灵寿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('453', '39', '高邑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('454', '39', '深泽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('455', '39', '赞皇县', '3', '0');
INSERT INTO `ewei_region` VALUES ('456', '39', '无极县', '3', '0');
INSERT INTO `ewei_region` VALUES ('457', '39', '平山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('458', '39', '元氏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('459', '39', '赵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('460', '39', '辛集市', '3', '0');
INSERT INTO `ewei_region` VALUES ('461', '39', '藁城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('462', '39', '晋州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('463', '39', '新乐市', '3', '0');
INSERT INTO `ewei_region` VALUES ('464', '39', '鹿泉区', '3', '0');
INSERT INTO `ewei_region` VALUES ('465', '39', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('466', '40', '路南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('467', '40', '路北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('468', '40', '古冶区', '3', '0');
INSERT INTO `ewei_region` VALUES ('469', '40', '开平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('470', '40', '丰南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('471', '40', '丰润区', '3', '0');
INSERT INTO `ewei_region` VALUES ('472', '40', '滦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('473', '40', '滦南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('474', '40', '乐亭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('475', '40', '迁西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('476', '40', '玉田县', '3', '0');
INSERT INTO `ewei_region` VALUES ('477', '40', '曹妃甸区', '3', '0');
INSERT INTO `ewei_region` VALUES ('478', '40', '遵化市', '3', '0');
INSERT INTO `ewei_region` VALUES ('479', '40', '迁安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('480', '40', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('481', '41', '海港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('482', '41', '山海关区', '3', '0');
INSERT INTO `ewei_region` VALUES ('483', '41', '北戴河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('484', '41', '青龙满族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('485', '41', '昌黎县', '3', '0');
INSERT INTO `ewei_region` VALUES ('486', '41', '抚宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('487', '41', '卢龙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('488', '41', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('489', '41', '经济技术开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('490', '42', '邯山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('491', '42', '丛台区', '3', '0');
INSERT INTO `ewei_region` VALUES ('492', '42', '复兴区', '3', '0');
INSERT INTO `ewei_region` VALUES ('493', '42', '峰峰矿区', '3', '0');
INSERT INTO `ewei_region` VALUES ('494', '42', '邯郸县', '3', '0');
INSERT INTO `ewei_region` VALUES ('495', '42', '临漳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('496', '42', '成安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('497', '42', '大名县', '3', '0');
INSERT INTO `ewei_region` VALUES ('498', '42', '涉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('499', '42', '磁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('500', '42', '肥乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('501', '42', '永年县', '3', '0');
INSERT INTO `ewei_region` VALUES ('502', '42', '邱县', '3', '0');
INSERT INTO `ewei_region` VALUES ('503', '42', '鸡泽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('504', '42', '广平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('505', '42', '馆陶县', '3', '0');
INSERT INTO `ewei_region` VALUES ('506', '42', '魏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('507', '42', '曲周县', '3', '0');
INSERT INTO `ewei_region` VALUES ('508', '42', '武安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('509', '42', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('510', '43', '桥东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('511', '43', '桥西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('512', '43', '邢台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('513', '43', '临城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('514', '43', '内丘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('515', '43', '柏乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('516', '43', '隆尧县', '3', '0');
INSERT INTO `ewei_region` VALUES ('517', '43', '任县', '3', '0');
INSERT INTO `ewei_region` VALUES ('518', '43', '南和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('519', '43', '宁晋县', '3', '0');
INSERT INTO `ewei_region` VALUES ('520', '43', '巨鹿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('521', '43', '新河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('522', '43', '广宗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('523', '43', '平乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('524', '43', '威县', '3', '0');
INSERT INTO `ewei_region` VALUES ('525', '43', '清河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('526', '43', '临西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('527', '43', '南宫市', '3', '0');
INSERT INTO `ewei_region` VALUES ('528', '43', '沙河市', '3', '0');
INSERT INTO `ewei_region` VALUES ('529', '43', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('530', '44', '新市区', '3', '0');
INSERT INTO `ewei_region` VALUES ('531', '44', '北市区', '3', '0');
INSERT INTO `ewei_region` VALUES ('532', '44', '南市区', '3', '0');
INSERT INTO `ewei_region` VALUES ('533', '44', '满城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('534', '44', '清苑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('535', '44', '涞水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('536', '44', '阜平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('537', '44', '徐水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('538', '44', '定兴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('539', '44', '唐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('540', '44', '高阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('541', '44', '容城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('542', '44', '涞源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('543', '44', '望都县', '3', '0');
INSERT INTO `ewei_region` VALUES ('544', '44', '安新县', '3', '0');
INSERT INTO `ewei_region` VALUES ('545', '44', '易县', '3', '0');
INSERT INTO `ewei_region` VALUES ('546', '44', '曲阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('547', '44', '蠡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('548', '44', '顺平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('549', '44', '博野县', '3', '0');
INSERT INTO `ewei_region` VALUES ('550', '44', '雄县', '3', '0');
INSERT INTO `ewei_region` VALUES ('551', '44', '涿州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('552', '44', '定州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('553', '44', '安国市', '3', '0');
INSERT INTO `ewei_region` VALUES ('554', '44', '高碑店市', '3', '0');
INSERT INTO `ewei_region` VALUES ('555', '44', '高开区', '3', '0');
INSERT INTO `ewei_region` VALUES ('556', '44', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('557', '45', '桥东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('558', '45', '桥西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('559', '45', '宣化区', '3', '0');
INSERT INTO `ewei_region` VALUES ('560', '45', '下花园区', '3', '0');
INSERT INTO `ewei_region` VALUES ('561', '45', '宣化县', '3', '0');
INSERT INTO `ewei_region` VALUES ('562', '45', '张北县', '3', '0');
INSERT INTO `ewei_region` VALUES ('563', '45', '康保县', '3', '0');
INSERT INTO `ewei_region` VALUES ('564', '45', '沽源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('565', '45', '尚义县', '3', '0');
INSERT INTO `ewei_region` VALUES ('566', '45', '蔚县', '3', '0');
INSERT INTO `ewei_region` VALUES ('567', '45', '阳原县', '3', '0');
INSERT INTO `ewei_region` VALUES ('568', '45', '怀安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('569', '45', '万全县', '3', '0');
INSERT INTO `ewei_region` VALUES ('570', '45', '怀来县', '3', '0');
INSERT INTO `ewei_region` VALUES ('571', '45', '涿鹿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('572', '45', '赤城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('573', '45', '崇礼县', '3', '0');
INSERT INTO `ewei_region` VALUES ('574', '45', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('575', '46', '双桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('576', '46', '双滦区', '3', '0');
INSERT INTO `ewei_region` VALUES ('577', '46', '鹰手营子矿区', '3', '0');
INSERT INTO `ewei_region` VALUES ('578', '46', '承德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('579', '46', '兴隆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('580', '46', '平泉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('581', '46', '滦平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('582', '46', '隆化县', '3', '0');
INSERT INTO `ewei_region` VALUES ('583', '46', '丰宁满族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('584', '46', '宽城满族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('585', '46', '围场满族蒙古族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('586', '46', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('587', '47', '新华区', '3', '0');
INSERT INTO `ewei_region` VALUES ('588', '47', '运河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('589', '47', '沧县', '3', '0');
INSERT INTO `ewei_region` VALUES ('590', '47', '青县', '3', '0');
INSERT INTO `ewei_region` VALUES ('591', '47', '东光县', '3', '0');
INSERT INTO `ewei_region` VALUES ('592', '47', '海兴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('593', '47', '盐山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('594', '47', '肃宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('595', '47', '南皮县', '3', '0');
INSERT INTO `ewei_region` VALUES ('596', '47', '吴桥县', '3', '0');
INSERT INTO `ewei_region` VALUES ('597', '47', '献县', '3', '0');
INSERT INTO `ewei_region` VALUES ('598', '47', '孟村回族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('599', '47', '泊头市', '3', '0');
INSERT INTO `ewei_region` VALUES ('600', '47', '任丘市', '3', '0');
INSERT INTO `ewei_region` VALUES ('601', '47', '黄骅市', '3', '0');
INSERT INTO `ewei_region` VALUES ('602', '47', '河间市', '3', '0');
INSERT INTO `ewei_region` VALUES ('603', '47', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('604', '48', '安次区', '3', '0');
INSERT INTO `ewei_region` VALUES ('605', '48', '广阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('606', '48', '固安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('607', '48', '永清县', '3', '0');
INSERT INTO `ewei_region` VALUES ('608', '48', '香河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('609', '48', '大城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('610', '48', '文安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('611', '48', '大厂回族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('612', '48', '开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('613', '48', '燕郊经济技术开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('614', '48', '霸州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('615', '48', '三河市', '3', '0');
INSERT INTO `ewei_region` VALUES ('616', '48', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('617', '49', '桃城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('618', '49', '枣强县', '3', '0');
INSERT INTO `ewei_region` VALUES ('619', '49', '武邑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('620', '49', '武强县', '3', '0');
INSERT INTO `ewei_region` VALUES ('621', '49', '饶阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('622', '49', '安平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('623', '49', '故城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('624', '49', '景县', '3', '0');
INSERT INTO `ewei_region` VALUES ('625', '49', '阜城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('626', '49', '冀州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('627', '49', '深州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('628', '49', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('629', '50', '小店区', '3', '0');
INSERT INTO `ewei_region` VALUES ('630', '50', '迎泽区', '3', '0');
INSERT INTO `ewei_region` VALUES ('631', '50', '杏花岭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('632', '50', '尖草坪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('633', '50', '万柏林区', '3', '0');
INSERT INTO `ewei_region` VALUES ('634', '50', '晋源区', '3', '0');
INSERT INTO `ewei_region` VALUES ('635', '50', '清徐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('636', '50', '阳曲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('637', '50', '娄烦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('638', '50', '古交市', '3', '0');
INSERT INTO `ewei_region` VALUES ('639', '50', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('640', '51', '城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('641', '51', '矿区', '3', '0');
INSERT INTO `ewei_region` VALUES ('642', '51', '南郊区', '3', '0');
INSERT INTO `ewei_region` VALUES ('643', '51', '新荣区', '3', '0');
INSERT INTO `ewei_region` VALUES ('644', '51', '阳高县', '3', '0');
INSERT INTO `ewei_region` VALUES ('645', '51', '天镇县', '3', '0');
INSERT INTO `ewei_region` VALUES ('646', '51', '广灵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('647', '51', '灵丘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('648', '51', '浑源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('649', '51', '左云县', '3', '0');
INSERT INTO `ewei_region` VALUES ('650', '51', '大同县', '3', '0');
INSERT INTO `ewei_region` VALUES ('651', '51', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('652', '52', '城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('653', '52', '矿区', '3', '0');
INSERT INTO `ewei_region` VALUES ('654', '52', '郊区', '3', '0');
INSERT INTO `ewei_region` VALUES ('655', '52', '平定县', '3', '0');
INSERT INTO `ewei_region` VALUES ('656', '52', '盂县', '3', '0');
INSERT INTO `ewei_region` VALUES ('657', '52', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('658', '53', '长治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('659', '53', '襄垣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('660', '53', '屯留县', '3', '0');
INSERT INTO `ewei_region` VALUES ('661', '53', '平顺县', '3', '0');
INSERT INTO `ewei_region` VALUES ('662', '53', '黎城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('663', '53', '壶关县', '3', '0');
INSERT INTO `ewei_region` VALUES ('664', '53', '长子县', '3', '0');
INSERT INTO `ewei_region` VALUES ('665', '53', '武乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('666', '53', '沁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('667', '53', '沁源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('668', '53', '潞城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('669', '53', '城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('670', '53', '郊区', '3', '0');
INSERT INTO `ewei_region` VALUES ('671', '53', '高新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('672', '53', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('673', '54', '城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('674', '54', '沁水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('675', '54', '阳城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('676', '54', '陵川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('677', '54', '泽州县', '3', '0');
INSERT INTO `ewei_region` VALUES ('678', '54', '高平市', '3', '0');
INSERT INTO `ewei_region` VALUES ('679', '54', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('680', '55', '朔城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('681', '55', '平鲁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('682', '55', '山阴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('683', '55', '应县', '3', '0');
INSERT INTO `ewei_region` VALUES ('684', '55', '右玉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('685', '55', '怀仁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('686', '55', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('687', '56', '榆次区', '3', '0');
INSERT INTO `ewei_region` VALUES ('688', '56', '榆社县', '3', '0');
INSERT INTO `ewei_region` VALUES ('689', '56', '左权县', '3', '0');
INSERT INTO `ewei_region` VALUES ('690', '56', '和顺县', '3', '0');
INSERT INTO `ewei_region` VALUES ('691', '56', '昔阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('692', '56', '寿阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('693', '56', '太谷县', '3', '0');
INSERT INTO `ewei_region` VALUES ('694', '56', '祁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('695', '56', '平遥县', '3', '0');
INSERT INTO `ewei_region` VALUES ('696', '56', '灵石县', '3', '0');
INSERT INTO `ewei_region` VALUES ('697', '56', '介休市', '3', '0');
INSERT INTO `ewei_region` VALUES ('698', '56', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('699', '57', '盐湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('700', '57', '临猗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('701', '57', '万荣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('702', '57', '闻喜县', '3', '0');
INSERT INTO `ewei_region` VALUES ('703', '57', '稷山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('704', '57', '新绛县', '3', '0');
INSERT INTO `ewei_region` VALUES ('705', '57', '绛县', '3', '0');
INSERT INTO `ewei_region` VALUES ('706', '57', '垣曲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('707', '57', '夏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('708', '57', '平陆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('709', '57', '芮城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('710', '57', '永济市', '3', '0');
INSERT INTO `ewei_region` VALUES ('711', '57', '河津市', '3', '0');
INSERT INTO `ewei_region` VALUES ('712', '57', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('713', '58', '忻府区', '3', '0');
INSERT INTO `ewei_region` VALUES ('714', '58', '定襄县', '3', '0');
INSERT INTO `ewei_region` VALUES ('715', '58', '五台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('716', '58', '代县', '3', '0');
INSERT INTO `ewei_region` VALUES ('717', '58', '繁峙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('718', '58', '宁武县', '3', '0');
INSERT INTO `ewei_region` VALUES ('719', '58', '静乐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('720', '58', '神池县', '3', '0');
INSERT INTO `ewei_region` VALUES ('721', '58', '五寨县', '3', '0');
INSERT INTO `ewei_region` VALUES ('722', '58', '岢岚县', '3', '0');
INSERT INTO `ewei_region` VALUES ('723', '58', '河曲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('724', '58', '保德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('725', '58', '偏关县', '3', '0');
INSERT INTO `ewei_region` VALUES ('726', '58', '原平市', '3', '0');
INSERT INTO `ewei_region` VALUES ('727', '58', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('728', '59', '尧都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('729', '59', '曲沃县', '3', '0');
INSERT INTO `ewei_region` VALUES ('730', '59', '翼城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('731', '59', '襄汾县', '3', '0');
INSERT INTO `ewei_region` VALUES ('732', '59', '洪洞县', '3', '0');
INSERT INTO `ewei_region` VALUES ('733', '59', '古县', '3', '0');
INSERT INTO `ewei_region` VALUES ('734', '59', '安泽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('735', '59', '浮山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('736', '59', '吉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('737', '59', '乡宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('738', '59', '大宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('739', '59', '隰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('740', '59', '永和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('741', '59', '蒲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('742', '59', '汾西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('743', '59', '侯马市', '3', '0');
INSERT INTO `ewei_region` VALUES ('744', '59', '霍州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('745', '59', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('746', '60', '离石区', '3', '0');
INSERT INTO `ewei_region` VALUES ('747', '60', '文水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('748', '60', '交城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('749', '60', '兴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('750', '60', '临县', '3', '0');
INSERT INTO `ewei_region` VALUES ('751', '60', '柳林县', '3', '0');
INSERT INTO `ewei_region` VALUES ('752', '60', '石楼县', '3', '0');
INSERT INTO `ewei_region` VALUES ('753', '60', '岚县', '3', '0');
INSERT INTO `ewei_region` VALUES ('754', '60', '方山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('755', '60', '中阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('756', '60', '交口县', '3', '0');
INSERT INTO `ewei_region` VALUES ('757', '60', '孝义市', '3', '0');
INSERT INTO `ewei_region` VALUES ('758', '60', '汾阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('759', '60', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('760', '61', '新城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('761', '61', '回民区', '3', '0');
INSERT INTO `ewei_region` VALUES ('762', '61', '玉泉区', '3', '0');
INSERT INTO `ewei_region` VALUES ('763', '61', '赛罕区', '3', '0');
INSERT INTO `ewei_region` VALUES ('764', '61', '土默特左旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('765', '61', '托克托县', '3', '0');
INSERT INTO `ewei_region` VALUES ('766', '61', '和林格尔县', '3', '0');
INSERT INTO `ewei_region` VALUES ('767', '61', '清水河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('768', '61', '武川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('769', '61', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('770', '62', '东河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('771', '62', '昆都仑区', '3', '0');
INSERT INTO `ewei_region` VALUES ('772', '62', '青山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('773', '62', '石拐区', '3', '0');
INSERT INTO `ewei_region` VALUES ('774', '62', '白云鄂博矿区', '3', '0');
INSERT INTO `ewei_region` VALUES ('775', '62', '九原区', '3', '0');
INSERT INTO `ewei_region` VALUES ('776', '62', '土默特右旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('777', '62', '固阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('778', '62', '达尔罕茂明安联合旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('779', '62', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('780', '63', '海勃湾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('781', '63', '海南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('782', '63', '乌达区', '3', '0');
INSERT INTO `ewei_region` VALUES ('783', '63', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('784', '64', '红山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('785', '64', '元宝山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('786', '64', '松山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('787', '64', '阿鲁科尔沁旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('788', '64', '巴林左旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('789', '64', '巴林右旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('790', '64', '林西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('791', '64', '克什克腾旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('792', '64', '翁牛特旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('793', '64', '喀喇沁旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('794', '64', '宁城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('795', '64', '敖汉旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('796', '64', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('797', '65', '科尔沁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('798', '65', '科尔沁左翼中旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('799', '65', '科尔沁左翼后旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('800', '65', '开鲁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('801', '65', '库伦旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('802', '65', '奈曼旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('803', '65', '扎鲁特旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('804', '65', '霍林郭勒市', '3', '0');
INSERT INTO `ewei_region` VALUES ('805', '65', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('806', '66', '东胜区', '3', '0');
INSERT INTO `ewei_region` VALUES ('807', '66', '达拉特旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('808', '66', '准格尔旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('809', '66', '鄂托克前旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('810', '66', '鄂托克旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('811', '66', '杭锦旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('812', '66', '乌审旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('813', '66', '伊金霍洛旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('814', '66', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('815', '67', '海拉尔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('816', '67', '扎赉诺尔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('817', '67', '阿荣旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('818', '67', '莫力达瓦达斡尔族自治旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('819', '67', '鄂伦春自治旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('820', '67', '鄂温克族自治旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('821', '67', '陈巴尔虎旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('822', '67', '新巴尔虎左旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('823', '67', '新巴尔虎右旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('824', '67', '满洲里市', '3', '0');
INSERT INTO `ewei_region` VALUES ('825', '67', '牙克石市', '3', '0');
INSERT INTO `ewei_region` VALUES ('826', '67', '扎兰屯市', '3', '0');
INSERT INTO `ewei_region` VALUES ('827', '67', '额尔古纳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('828', '67', '根河市', '3', '0');
INSERT INTO `ewei_region` VALUES ('829', '67', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('830', '68', '临河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('831', '68', '五原县', '3', '0');
INSERT INTO `ewei_region` VALUES ('832', '68', '磴口县', '3', '0');
INSERT INTO `ewei_region` VALUES ('833', '68', '乌拉特前旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('834', '68', '乌拉特中旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('835', '68', '乌拉特后旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('836', '68', '杭锦后旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('837', '68', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('838', '69', '集宁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('839', '69', '卓资县', '3', '0');
INSERT INTO `ewei_region` VALUES ('840', '69', '化德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('841', '69', '商都县', '3', '0');
INSERT INTO `ewei_region` VALUES ('842', '69', '兴和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('843', '69', '凉城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('844', '69', '察哈尔右翼前旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('845', '69', '察哈尔右翼中旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('846', '69', '察哈尔右翼后旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('847', '69', '四子王旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('848', '69', '丰镇市', '3', '0');
INSERT INTO `ewei_region` VALUES ('849', '69', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('850', '70', '乌兰浩特市', '3', '0');
INSERT INTO `ewei_region` VALUES ('851', '70', '阿尔山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('852', '70', '科尔沁右翼前旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('853', '70', '科尔沁右翼中旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('854', '70', '扎赉特旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('855', '70', '突泉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('856', '70', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('857', '71', '二连浩特市', '3', '0');
INSERT INTO `ewei_region` VALUES ('858', '71', '锡林浩特市', '3', '0');
INSERT INTO `ewei_region` VALUES ('859', '71', '阿巴嘎旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('860', '71', '苏尼特左旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('861', '71', '苏尼特右旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('862', '71', '东乌珠穆沁旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('863', '71', '西乌珠穆沁旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('864', '71', '太仆寺旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('865', '71', '镶黄旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('866', '71', '正镶白旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('867', '71', '正蓝旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('868', '71', '多伦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('869', '71', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('870', '72', '阿拉善左旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('871', '72', '阿拉善右旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('872', '72', '额济纳旗', '3', '0');
INSERT INTO `ewei_region` VALUES ('873', '72', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('874', '73', '和平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('875', '73', '沈河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('876', '73', '大东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('877', '73', '皇姑区', '3', '0');
INSERT INTO `ewei_region` VALUES ('878', '73', '铁西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('879', '73', '苏家屯区', '3', '0');
INSERT INTO `ewei_region` VALUES ('880', '73', '浑南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('881', '73', '新城子区', '3', '0');
INSERT INTO `ewei_region` VALUES ('882', '73', '于洪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('883', '73', '辽中县', '3', '0');
INSERT INTO `ewei_region` VALUES ('884', '73', '康平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('885', '73', '法库县', '3', '0');
INSERT INTO `ewei_region` VALUES ('886', '73', '新民市', '3', '0');
INSERT INTO `ewei_region` VALUES ('887', '73', '浑南新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('888', '73', '张士开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('889', '73', '沈北新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('890', '73', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('891', '74', '中山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('892', '74', '西岗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('893', '74', '沙河口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('894', '74', '甘井子区', '3', '0');
INSERT INTO `ewei_region` VALUES ('895', '74', '旅顺口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('896', '74', '金州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('897', '74', '长海县', '3', '0');
INSERT INTO `ewei_region` VALUES ('898', '74', '开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('899', '74', '瓦房店市', '3', '0');
INSERT INTO `ewei_region` VALUES ('900', '74', '普兰店市', '3', '0');
INSERT INTO `ewei_region` VALUES ('901', '74', '庄河市', '3', '0');
INSERT INTO `ewei_region` VALUES ('902', '74', '岭前区', '3', '0');
INSERT INTO `ewei_region` VALUES ('903', '74', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('904', '75', '铁东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('905', '75', '铁西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('906', '75', '立山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('907', '75', '千山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('908', '75', '台安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('909', '75', '岫岩满族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('910', '75', '高新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('911', '75', '海城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('912', '75', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('913', '76', '新抚区', '3', '0');
INSERT INTO `ewei_region` VALUES ('914', '76', '东洲区', '3', '0');
INSERT INTO `ewei_region` VALUES ('915', '76', '望花区', '3', '0');
INSERT INTO `ewei_region` VALUES ('916', '76', '顺城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('917', '76', '抚顺县', '3', '0');
INSERT INTO `ewei_region` VALUES ('918', '76', '新宾满族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('919', '76', '清原满族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('920', '76', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('921', '77', '平山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('922', '77', '溪湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('923', '77', '明山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('924', '77', '南芬区', '3', '0');
INSERT INTO `ewei_region` VALUES ('925', '77', '本溪满族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('926', '77', '桓仁满族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('927', '77', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('928', '78', '元宝区', '3', '0');
INSERT INTO `ewei_region` VALUES ('929', '78', '振兴区', '3', '0');
INSERT INTO `ewei_region` VALUES ('930', '78', '振安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('931', '78', '宽甸满族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('932', '78', '东港市', '3', '0');
INSERT INTO `ewei_region` VALUES ('933', '78', '凤城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('934', '78', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('935', '79', '古塔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('936', '79', '凌河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('937', '79', '太和区', '3', '0');
INSERT INTO `ewei_region` VALUES ('938', '79', '黑山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('939', '79', '义县', '3', '0');
INSERT INTO `ewei_region` VALUES ('940', '79', '凌海市', '3', '0');
INSERT INTO `ewei_region` VALUES ('941', '79', '北镇市', '3', '0');
INSERT INTO `ewei_region` VALUES ('942', '79', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('943', '80', '站前区', '3', '0');
INSERT INTO `ewei_region` VALUES ('944', '80', '西市区', '3', '0');
INSERT INTO `ewei_region` VALUES ('945', '80', '鲅鱼圈区', '3', '0');
INSERT INTO `ewei_region` VALUES ('946', '80', '老边区', '3', '0');
INSERT INTO `ewei_region` VALUES ('947', '80', '盖州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('948', '80', '大石桥市', '3', '0');
INSERT INTO `ewei_region` VALUES ('949', '80', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('950', '81', '海州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('951', '81', '新邱区', '3', '0');
INSERT INTO `ewei_region` VALUES ('952', '81', '太平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('953', '81', '清河门区', '3', '0');
INSERT INTO `ewei_region` VALUES ('954', '81', '细河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('955', '81', '阜新蒙古族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('956', '81', '彰武县', '3', '0');
INSERT INTO `ewei_region` VALUES ('957', '81', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('958', '82', '白塔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('959', '82', '文圣区', '3', '0');
INSERT INTO `ewei_region` VALUES ('960', '82', '宏伟区', '3', '0');
INSERT INTO `ewei_region` VALUES ('961', '82', '弓长岭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('962', '82', '太子河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('963', '82', '辽阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('964', '82', '灯塔市', '3', '0');
INSERT INTO `ewei_region` VALUES ('965', '82', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('966', '83', '双台子区', '3', '0');
INSERT INTO `ewei_region` VALUES ('967', '83', '兴隆台区', '3', '0');
INSERT INTO `ewei_region` VALUES ('968', '83', '大洼县', '3', '0');
INSERT INTO `ewei_region` VALUES ('969', '83', '盘山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('970', '83', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('971', '84', '银州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('972', '84', '清河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('973', '84', '铁岭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('974', '84', '西丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('975', '84', '昌图县', '3', '0');
INSERT INTO `ewei_region` VALUES ('976', '84', '调兵山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('977', '84', '开原市', '3', '0');
INSERT INTO `ewei_region` VALUES ('978', '84', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('979', '85', '双塔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('980', '85', '龙城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('981', '85', '朝阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('982', '85', '建平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('983', '85', '喀喇沁左翼蒙古族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('984', '85', '北票市', '3', '0');
INSERT INTO `ewei_region` VALUES ('985', '85', '凌源市', '3', '0');
INSERT INTO `ewei_region` VALUES ('986', '85', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('987', '86', '连山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('988', '86', '龙港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('989', '86', '南票区', '3', '0');
INSERT INTO `ewei_region` VALUES ('990', '86', '绥中县', '3', '0');
INSERT INTO `ewei_region` VALUES ('991', '86', '建昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('992', '86', '兴城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('993', '86', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('994', '87', '南关区', '3', '0');
INSERT INTO `ewei_region` VALUES ('995', '87', '宽城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('996', '87', '朝阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('997', '87', '二道区', '3', '0');
INSERT INTO `ewei_region` VALUES ('998', '87', '绿园区', '3', '0');
INSERT INTO `ewei_region` VALUES ('999', '87', '双阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1000', '87', '农安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1001', '87', '九台区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1002', '87', '榆树市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1003', '87', '德惠市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1004', '87', '高新技术产业开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1005', '87', '汽车产业开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1006', '87', '经济技术开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1007', '87', '净月旅游开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1008', '87', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1009', '88', '昌邑区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1010', '88', '龙潭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1011', '88', '船营区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1012', '88', '丰满区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1013', '88', '永吉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1014', '88', '蛟河市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1015', '88', '桦甸市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1016', '88', '舒兰市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1017', '88', '磐石市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1018', '88', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1019', '89', '铁西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1020', '89', '铁东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1021', '89', '梨树县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1022', '89', '伊通满族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1023', '89', '公主岭市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1024', '89', '双辽市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1025', '89', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1026', '90', '龙山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1027', '90', '西安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1028', '90', '东丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1029', '90', '东辽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1030', '90', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1031', '91', '东昌区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1032', '91', '二道江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1033', '91', '通化县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1034', '91', '辉南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1035', '91', '柳河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1036', '91', '梅河口市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1037', '91', '集安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1038', '91', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1039', '92', '浑江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1040', '92', '抚松县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1041', '92', '靖宇县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1042', '92', '长白朝鲜族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1043', '92', '江源区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1044', '92', '临江市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1045', '92', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1046', '93', '宁江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1047', '93', '前郭尔罗斯蒙古族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1048', '93', '长岭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1049', '93', '乾安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1050', '93', '扶余市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1051', '93', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1052', '94', '洮北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1053', '94', '镇赉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1054', '94', '通榆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1055', '94', '洮南市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1056', '94', '大安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1057', '94', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1058', '95', '延吉市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1059', '95', '图们市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1060', '95', '敦化市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1061', '95', '珲春市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1062', '95', '龙井市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1063', '95', '和龙市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1064', '95', '汪清县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1065', '95', '安图县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1066', '95', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1067', '96', '道里区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1068', '96', '南岗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1069', '96', '道外区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1070', '96', '香坊区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1071', '96', '动力区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1072', '96', '平房区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1073', '96', '松北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1074', '96', '呼兰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1075', '96', '依兰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1076', '96', '方正县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1077', '96', '宾县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1078', '96', '巴彦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1079', '96', '木兰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1080', '96', '通河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1081', '96', '延寿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1082', '96', '阿城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1083', '96', '双城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1084', '96', '尚志市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1085', '96', '五常市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1086', '96', '阿城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1087', '96', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1088', '97', '龙沙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1089', '97', '建华区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1090', '97', '铁锋区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1091', '97', '昂昂溪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1092', '97', '富拉尔基区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1093', '97', '碾子山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1094', '97', '梅里斯达斡尔族区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1095', '97', '龙江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1096', '97', '依安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1097', '97', '泰来县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1098', '97', '甘南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1099', '97', '富裕县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1100', '97', '克山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1101', '97', '克东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1102', '97', '拜泉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1103', '97', '讷河市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1104', '97', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1105', '98', '鸡冠区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1106', '98', '恒山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1107', '98', '滴道区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1108', '98', '梨树区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1109', '98', '城子河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1110', '98', '麻山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1111', '98', '鸡东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1112', '98', '虎林市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1113', '98', '密山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1114', '98', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1115', '99', '向阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1116', '99', '工农区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1117', '99', '南山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1118', '99', '兴安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1119', '99', '东山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1120', '99', '兴山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1121', '99', '萝北县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1122', '99', '绥滨县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1123', '99', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1124', '100', '尖山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1125', '100', '岭东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1126', '100', '四方台区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1127', '100', '宝山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1128', '100', '集贤县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1129', '100', '友谊县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1130', '100', '宝清县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1131', '100', '饶河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1132', '100', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1133', '101', '萨尔图区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1134', '101', '龙凤区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1135', '101', '让胡路区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1136', '101', '红岗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1137', '101', '大同区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1138', '101', '肇州县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1139', '101', '肇源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1140', '101', '林甸县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1141', '101', '杜尔伯特蒙古族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1142', '101', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1143', '102', '伊春区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1144', '102', '南岔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1145', '102', '友好区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1146', '102', '西林区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1147', '102', '翠峦区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1148', '102', '新青区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1149', '102', '美溪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1150', '102', '金山屯区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1151', '102', '五营区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1152', '102', '乌马河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1153', '102', '汤旺河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1154', '102', '带岭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1155', '102', '乌伊岭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1156', '102', '红星区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1157', '102', '上甘岭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1158', '102', '嘉荫县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1159', '102', '铁力市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1160', '102', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1161', '103', '永红区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1162', '103', '向阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1163', '103', '前进区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1164', '103', '东风区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1165', '103', '郊区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1166', '103', '桦南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1167', '103', '桦川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1168', '103', '汤原县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1169', '103', '抚远县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1170', '103', '同江市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1171', '103', '富锦市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1172', '103', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1173', '104', '新兴区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1174', '104', '桃山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1175', '104', '茄子河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1176', '104', '勃利县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1177', '104', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1178', '105', '东安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1179', '105', '阳明区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1180', '105', '爱民区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1181', '105', '西安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1182', '105', '东宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1183', '105', '林口县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1184', '105', '绥芬河市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1185', '105', '海林市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1186', '105', '宁安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1187', '105', '穆棱市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1188', '105', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1189', '106', '爱辉区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1190', '106', '嫩江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1191', '106', '逊克县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1192', '106', '孙吴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1193', '106', '北安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1194', '106', '五大连池市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1195', '106', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1196', '107', '北林区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1197', '107', '望奎县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1198', '107', '兰西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1199', '107', '青冈县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1200', '107', '庆安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1201', '107', '明水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1202', '107', '绥棱县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1203', '107', '安达市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1204', '107', '肇东市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1205', '107', '海伦市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1206', '107', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1207', '108', '松岭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1208', '108', '新林区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1209', '108', '呼中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1210', '108', '呼玛县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1211', '108', '塔河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1212', '108', '漠河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1213', '108', '加格达奇区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1214', '108', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1215', '109', '黄浦区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1216', '109', '卢湾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1217', '109', '徐汇区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1218', '109', '长宁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1219', '109', '静安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1220', '109', '普陀区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1221', '109', '闸北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1222', '109', '虹口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1223', '109', '杨浦区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1224', '109', '闵行区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1225', '109', '宝山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1226', '109', '嘉定区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1227', '109', '浦东新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1228', '109', '金山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1229', '109', '松江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1230', '109', '青浦区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1231', '109', '南汇区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1232', '109', '奉贤区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1233', '109', '川沙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1234', '109', '崇明县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1235', '109', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1236', '110', '玄武区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1237', '110', '白下区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1238', '110', '秦淮区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1239', '110', '建邺区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1240', '110', '鼓楼区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1241', '110', '下关区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1242', '110', '浦口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1243', '110', '栖霞区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1244', '110', '雨花台区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1245', '110', '江宁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1246', '110', '六合区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1247', '110', '溧水区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1248', '110', '高淳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1249', '110', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1250', '111', '崇安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1251', '111', '南长区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1252', '111', '北塘区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1253', '111', '锡山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1254', '111', '惠山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1255', '111', '滨湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1256', '111', '江阴市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1257', '111', '宜兴市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1258', '111', '新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1259', '111', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1260', '112', '鼓楼区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1261', '112', '云龙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1262', '112', '九里区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1263', '112', '贾汪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1264', '112', '泉山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1265', '112', '丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1266', '112', '沛县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1267', '112', '铜山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1268', '112', '睢宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1269', '112', '新沂市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1270', '112', '邳州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1271', '112', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1272', '113', '天宁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1273', '113', '钟楼区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1274', '113', '戚墅堰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1275', '113', '新北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1276', '113', '武进区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1277', '113', '溧阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1278', '113', '金坛市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1279', '113', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1280', '114', '沧浪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1281', '114', '平江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1282', '114', '金阊区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1283', '114', '虎丘区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1284', '114', '吴中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1285', '114', '相城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1286', '114', '姑苏区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1287', '114', '常熟市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1288', '114', '张家港市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1289', '114', '昆山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1290', '114', '吴江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1291', '114', '太仓市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1292', '114', '新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1293', '114', '园区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1294', '114', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1295', '115', '崇川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1296', '115', '港闸区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1297', '115', '通州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1298', '115', '海安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1299', '115', '如东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1300', '115', '启东市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1301', '115', '如皋市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1302', '115', '通州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1303', '115', '海门市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1304', '115', '开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1305', '115', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1306', '116', '连云区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1307', '116', '新浦区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1308', '116', '海州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1309', '116', '赣榆区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1310', '116', '东海县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1311', '116', '灌云县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1312', '116', '灌南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1313', '116', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1314', '117', '清河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1315', '117', '淮安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1316', '117', '淮阴区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1317', '117', '清浦区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1318', '117', '涟水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1319', '117', '洪泽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1320', '117', '盱眙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1321', '117', '金湖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1322', '117', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1323', '118', '亭湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1324', '118', '盐都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1325', '118', '响水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1326', '118', '滨海县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1327', '118', '阜宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1328', '118', '射阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1329', '118', '建湖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1330', '118', '东台市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1331', '118', '大丰市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1332', '118', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1333', '119', '广陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1334', '119', '邗江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1335', '119', '维扬区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1336', '119', '宝应县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1337', '119', '仪征市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1338', '119', '高邮市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1339', '119', '江都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1340', '119', '经济开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1341', '119', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1342', '120', '京口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1343', '120', '润州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1344', '120', '丹徒区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1345', '120', '丹阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1346', '120', '扬中市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1347', '120', '句容市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1348', '120', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1349', '121', '海陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1350', '121', '高港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1351', '121', '兴化市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1352', '121', '靖江市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1353', '121', '泰兴市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1354', '121', '姜堰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1355', '121', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1356', '122', '宿城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1357', '122', '宿豫区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1358', '122', '沭阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1359', '122', '泗阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1360', '122', '泗洪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1361', '122', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1362', '123', '上城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1363', '123', '下城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1364', '123', '江干区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1365', '123', '拱墅区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1366', '123', '西湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1367', '123', '滨江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1368', '123', '萧山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1369', '123', '余杭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1370', '123', '桐庐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1371', '123', '淳安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1372', '123', '建德市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1373', '123', '富阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1374', '123', '临安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1375', '123', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1376', '124', '海曙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1377', '124', '江东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1378', '124', '江北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1379', '124', '北仑区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1380', '124', '镇海区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1381', '124', '鄞州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1382', '124', '象山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1383', '124', '宁海县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1384', '124', '余姚市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1385', '124', '慈溪市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1386', '124', '奉化市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1387', '124', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1388', '125', '鹿城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1389', '125', '龙湾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1390', '125', '瓯海区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1391', '125', '洞头县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1392', '125', '永嘉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1393', '125', '平阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1394', '125', '苍南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1395', '125', '文成县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1396', '125', '泰顺县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1397', '125', '瑞安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1398', '125', '乐清市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1399', '125', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1400', '126', '南湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1401', '126', '秀洲区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1402', '126', '嘉善县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1403', '126', '海盐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1404', '126', '海宁市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1405', '126', '平湖市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1406', '126', '桐乡市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1407', '126', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1408', '127', '吴兴区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1409', '127', '南浔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1410', '127', '德清县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1411', '127', '长兴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1412', '127', '安吉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1413', '127', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1414', '128', '越城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1415', '128', '柯桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1416', '128', '新昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1417', '128', '诸暨市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1418', '128', '上虞区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1419', '128', '嵊州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1420', '128', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1421', '129', '婺城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1422', '129', '金东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1423', '129', '武义县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1424', '129', '浦江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1425', '129', '磐安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1426', '129', '兰溪市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1427', '129', '义乌市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1428', '129', '东阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1429', '129', '永康市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1430', '129', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1431', '130', '柯城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1432', '130', '衢江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1433', '130', '常山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1434', '130', '开化县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1435', '130', '龙游县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1436', '130', '江山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1437', '130', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1438', '131', '定海区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1439', '131', '普陀区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1440', '131', '岱山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1441', '131', '嵊泗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1442', '131', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1443', '132', '椒江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1444', '132', '黄岩区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1445', '132', '路桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1446', '132', '玉环县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1447', '132', '三门县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1448', '132', '天台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1449', '132', '仙居县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1450', '132', '温岭市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1451', '132', '临海市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1452', '132', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1453', '133', '莲都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1454', '133', '青田县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1455', '133', '缙云县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1456', '133', '遂昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1457', '133', '松阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1458', '133', '云和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1459', '133', '庆元县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1460', '133', '景宁畲族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1461', '133', '龙泉市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1462', '133', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1463', '134', '瑶海区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1464', '134', '庐阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1465', '134', '蜀山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1466', '134', '包河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1467', '134', '长丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1468', '134', '肥东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1469', '134', '肥西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1470', '134', '高新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1471', '134', '中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1472', '134', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1473', '135', '镜湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1474', '135', '弋江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1475', '135', '鸠江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1476', '135', '三山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1477', '135', '芜湖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1478', '135', '繁昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1479', '135', '南陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1480', '135', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1481', '136', '龙子湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1482', '136', '蚌山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1483', '136', '禹会区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1484', '136', '淮上区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1485', '136', '怀远县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1486', '136', '五河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1487', '136', '固镇县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1488', '136', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1489', '137', '大通区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1490', '137', '田家庵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1491', '137', '谢家集区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1492', '137', '八公山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1493', '137', '潘集区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1494', '137', '凤台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1495', '137', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1496', '138', '金家庄区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1497', '138', '花山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1498', '138', '雨山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1499', '138', '博望区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1500', '138', '当涂县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1501', '138', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1502', '139', '杜集区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1503', '139', '相山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1504', '139', '烈山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1505', '139', '濉溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1506', '139', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1507', '140', '铜官山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1508', '140', '狮子山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1509', '140', '郊区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1510', '140', '铜陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1511', '140', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1512', '141', '迎江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1513', '141', '大观区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1514', '141', '宜秀区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1515', '141', '怀宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1516', '141', '枞阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1517', '141', '潜山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1518', '141', '太湖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1519', '141', '宿松县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1520', '141', '望江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1521', '141', '岳西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1522', '141', '桐城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1523', '141', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1524', '142', '屯溪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1525', '142', '黄山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1526', '142', '徽州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1527', '142', '歙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1528', '142', '休宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1529', '142', '黟县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1530', '142', '祁门县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1531', '142', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1532', '143', '琅琊区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1533', '143', '南谯区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1534', '143', '来安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1535', '143', '全椒县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1536', '143', '定远县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1537', '143', '凤阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1538', '143', '天长市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1539', '143', '明光市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1540', '143', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1541', '144', '颍州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1542', '144', '颍东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1543', '144', '颍泉区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1544', '144', '临泉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1545', '144', '太和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1546', '144', '阜南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1547', '144', '颍上县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1548', '144', '界首市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1549', '144', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1550', '145', '埇桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1551', '145', '砀山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1552', '145', '萧县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1553', '145', '灵璧县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1554', '145', '泗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1555', '145', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1556', '134', '巢湖市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1557', '134', '居巢区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1558', '134', '庐江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1559', '135', '无为县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1560', '138', '含山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1561', '138', '和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1562', '146', '金安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1563', '146', '裕安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1564', '146', '寿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1565', '146', '霍邱县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1566', '146', '舒城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1567', '146', '金寨县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1568', '146', '霍山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1569', '146', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1570', '147', '谯城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1571', '147', '涡阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1572', '147', '蒙城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1573', '147', '利辛县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1574', '147', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1575', '148', '贵池区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1576', '148', '东至县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1577', '148', '石台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1578', '148', '青阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1579', '148', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1580', '149', '宣州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1581', '149', '郎溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1582', '149', '广德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1583', '149', '泾县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1584', '149', '绩溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1585', '149', '旌德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1586', '149', '宁国市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1587', '149', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1588', '150', '鼓楼区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1589', '150', '台江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1590', '150', '仓山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1591', '150', '马尾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1592', '150', '晋安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1593', '150', '闽侯县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1594', '150', '连江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1595', '150', '罗源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1596', '150', '闽清县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1597', '150', '永泰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1598', '150', '平潭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1599', '150', '福清市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1600', '150', '长乐市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1601', '150', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1602', '151', '思明区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1603', '151', '海沧区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1604', '151', '湖里区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1605', '151', '集美区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1606', '151', '同安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1607', '151', '翔安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1608', '151', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1609', '152', '城厢区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1610', '152', '涵江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1611', '152', '荔城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1612', '152', '秀屿区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1613', '152', '仙游县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1614', '152', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1615', '153', '梅列区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1616', '153', '三元区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1617', '153', '明溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1618', '153', '清流县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1619', '153', '宁化县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1620', '153', '大田县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1621', '153', '尤溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1622', '153', '沙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1623', '153', '将乐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1624', '153', '泰宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1625', '153', '建宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1626', '153', '永安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1627', '153', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1628', '154', '鲤城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1629', '154', '丰泽区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1630', '154', '洛江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1631', '154', '泉港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1632', '154', '惠安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1633', '154', '安溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1634', '154', '永春县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1635', '154', '德化县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1636', '154', '金门县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1637', '154', '石狮市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1638', '154', '晋江市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1639', '154', '南安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1640', '154', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1641', '155', '芗城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1642', '155', '龙文区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1643', '155', '云霄县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1644', '155', '漳浦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1645', '155', '诏安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1646', '155', '长泰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1647', '155', '东山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1648', '155', '南靖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1649', '155', '平和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1650', '155', '华安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1651', '155', '龙海市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1652', '155', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1653', '156', '延平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1654', '156', '顺昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1655', '156', '浦城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1656', '156', '光泽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1657', '156', '松溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1658', '156', '政和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1659', '156', '邵武市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1660', '156', '武夷山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1661', '156', '建瓯市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1662', '156', '建阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1663', '156', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1664', '157', '新罗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1665', '157', '长汀县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1666', '157', '永定区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1667', '157', '上杭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1668', '157', '武平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1669', '157', '连城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1670', '157', '漳平市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1671', '157', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1672', '158', '蕉城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1673', '158', '霞浦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1674', '158', '古田县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1675', '158', '屏南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1676', '158', '寿宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1677', '158', '周宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1678', '158', '柘荣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1679', '158', '福安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1680', '158', '福鼎市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1681', '158', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1682', '159', '东湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1683', '159', '西湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1684', '159', '青云谱区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1685', '159', '湾里区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1686', '159', '青山湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1687', '159', '南昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1688', '159', '新建县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1689', '159', '安义县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1690', '159', '进贤县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1691', '159', '红谷滩新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1692', '159', '经济技术开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1693', '159', '昌北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1694', '159', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1695', '160', '昌江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1696', '160', '珠山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1697', '160', '浮梁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1698', '160', '乐平市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1699', '160', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1700', '161', '安源区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1701', '161', '湘东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1702', '161', '莲花县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1703', '161', '上栗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1704', '161', '芦溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1705', '161', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1706', '162', '庐山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1707', '162', '浔阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1708', '162', '九江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1709', '162', '武宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1710', '162', '修水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1711', '162', '永修县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1712', '162', '德安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1713', '162', '星子县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1714', '162', '都昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1715', '162', '湖口县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1716', '162', '彭泽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1717', '162', '瑞昌市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1718', '162', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1719', '162', '共青城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1720', '163', '渝水区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1721', '163', '分宜县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1722', '163', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1723', '164', '月湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1724', '164', '余江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1725', '164', '贵溪市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1726', '164', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1727', '165', '章贡区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1728', '165', '赣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1729', '165', '信丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1730', '165', '大余县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1731', '165', '上犹县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1732', '165', '崇义县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1733', '165', '安远县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1734', '165', '龙南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1735', '165', '定南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1736', '165', '全南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1737', '165', '宁都县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1738', '165', '于都县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1739', '165', '兴国县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1740', '165', '会昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1741', '165', '寻乌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1742', '165', '石城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1743', '165', '黄金区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1744', '165', '瑞金市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1745', '165', '南康区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1746', '165', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1747', '166', '吉州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1748', '166', '青原区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1749', '166', '吉安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1750', '166', '吉水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1751', '166', '峡江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1752', '166', '新干县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1753', '166', '永丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1754', '166', '泰和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1755', '166', '遂川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1756', '166', '万安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1757', '166', '安福县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1758', '166', '永新县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1759', '166', '井冈山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1760', '166', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1761', '167', '袁州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1762', '167', '奉新县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1763', '167', '万载县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1764', '167', '上高县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1765', '167', '宜丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1766', '167', '靖安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1767', '167', '铜鼓县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1768', '167', '丰城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1769', '167', '樟树市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1770', '167', '高安市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1771', '167', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1772', '168', '临川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1773', '168', '南城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1774', '168', '黎川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1775', '168', '南丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1776', '168', '崇仁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1777', '168', '乐安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1778', '168', '宜黄县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1779', '168', '金溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1780', '168', '资溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1781', '168', '东乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1782', '168', '广昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1783', '168', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1784', '169', '信州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1785', '169', '上饶县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1786', '169', '广丰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1787', '169', '玉山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1788', '169', '铅山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1789', '169', '横峰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1790', '169', '弋阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1791', '169', '余干县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1792', '169', '鄱阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1793', '169', '万年县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1794', '169', '婺源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1795', '169', '德兴市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1796', '169', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1797', '170', '历下区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1798', '170', '市中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1799', '170', '槐荫区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1800', '170', '天桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1801', '170', '历城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1802', '170', '长清区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1803', '170', '平阴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1804', '170', '济阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1805', '170', '商河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1806', '170', '章丘市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1807', '170', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1808', '171', '市南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1809', '171', '市北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1810', '171', '四方区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1811', '171', '黄岛区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1812', '171', '崂山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1813', '171', '李沧区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1814', '171', '城阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1815', '171', '开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1816', '171', '胶州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1817', '171', '即墨市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1818', '171', '平度市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1819', '171', '胶南市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1820', '171', '莱西市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1821', '171', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1822', '172', '淄川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1823', '172', '张店区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1824', '172', '博山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1825', '172', '临淄区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1826', '172', '周村区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1827', '172', '桓台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1828', '172', '高青县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1829', '172', '沂源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1830', '172', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1831', '173', '市中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1832', '173', '薛城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1833', '173', '峄城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1834', '173', '台儿庄区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1835', '173', '山亭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1836', '173', '滕州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1837', '173', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1838', '174', '东营区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1839', '174', '河口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1840', '174', '垦利县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1841', '174', '利津县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1842', '174', '广饶县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1843', '174', '西城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1844', '174', '东城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1845', '174', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1846', '175', '芝罘区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1847', '175', '福山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1848', '175', '牟平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1849', '175', '莱山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1850', '175', '长岛县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1851', '175', '龙口市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1852', '175', '莱阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1853', '175', '莱州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1854', '175', '蓬莱市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1855', '175', '招远市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1856', '175', '栖霞市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1857', '175', '海阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1858', '175', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1859', '176', '潍城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1860', '176', '寒亭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1861', '176', '坊子区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1862', '176', '奎文区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1863', '176', '临朐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1864', '176', '昌乐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1865', '176', '开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1866', '176', '青州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1867', '176', '诸城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1868', '176', '寿光市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1869', '176', '安丘市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1870', '176', '高密市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1871', '176', '昌邑市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1872', '176', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1873', '177', '市中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1874', '177', '任城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1875', '177', '微山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1876', '177', '鱼台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1877', '177', '金乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1878', '177', '嘉祥县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1879', '177', '汶上县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1880', '177', '泗水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1881', '177', '梁山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1882', '177', '曲阜市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1883', '177', '兖州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1884', '177', '邹城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1885', '177', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1886', '178', '泰山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1887', '178', '岱岳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1888', '178', '宁阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1889', '178', '东平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1890', '178', '新泰市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1891', '178', '肥城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1892', '178', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1893', '179', '环翠区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1894', '179', '文登区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1895', '179', '荣成市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1896', '179', '乳山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1897', '179', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1898', '180', '东港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1899', '180', '岚山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1900', '180', '五莲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1901', '180', '莒县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1902', '180', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1903', '181', '莱城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1904', '181', '钢城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1905', '181', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1906', '182', '兰山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1907', '182', '罗庄区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1908', '182', '河东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1909', '182', '沂南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1910', '182', '郯城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1911', '182', '沂水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1912', '182', '兰陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1913', '182', '费县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1914', '182', '平邑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1915', '182', '莒南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1916', '182', '蒙阴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1917', '182', '临沭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1918', '182', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1919', '183', '德城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1920', '183', '陵城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1921', '183', '宁津县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1922', '183', '庆云县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1923', '183', '临邑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1924', '183', '齐河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1925', '183', '平原县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1926', '183', '夏津县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1927', '183', '武城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1928', '183', '开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1929', '183', '乐陵市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1930', '183', '禹城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1931', '183', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1932', '184', '东昌府区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1933', '184', '阳谷县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1934', '184', '莘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1935', '184', '茌平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1936', '184', '东阿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1937', '184', '冠县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1938', '184', '高唐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1939', '184', '临清市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1940', '184', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1941', '185', '滨城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1942', '185', '惠民县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1943', '185', '阳信县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1944', '185', '无棣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1945', '185', '沾化区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1946', '185', '博兴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1947', '185', '邹平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1948', '185', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1949', '186', '牡丹区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1950', '186', '曹县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1951', '186', '单县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1952', '186', '成武县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1953', '186', '巨野县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1954', '186', '郓城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1955', '186', '鄄城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1956', '186', '定陶县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1957', '186', '东明县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1958', '186', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1959', '187', '中原区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1960', '187', '二七区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1961', '187', '管城回族区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1962', '187', '金水区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1963', '187', '上街区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1964', '187', '惠济区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1965', '187', '中牟县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1966', '187', '巩义市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1967', '187', '荥阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1968', '187', '新密市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1969', '187', '新郑市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1970', '187', '登封市', '3', '0');
INSERT INTO `ewei_region` VALUES ('1971', '187', '郑东新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1972', '187', '高新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1973', '187', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1974', '188', '龙亭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1975', '188', '顺河回族区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1976', '188', '鼓楼区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1977', '188', '禹王台区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1978', '188', '金明区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1979', '188', '杞县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1980', '188', '通许县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1981', '188', '尉氏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1982', '188', '祥符区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1983', '188', '兰考县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1984', '188', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1985', '189', '老城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1986', '189', '西工区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1987', '189', '瀍河回族区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1988', '189', '涧西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1989', '189', '吉利区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1990', '189', '洛龙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('1991', '189', '孟津县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1992', '189', '新安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1993', '189', '栾川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1994', '189', '嵩县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1995', '189', '汝阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1996', '189', '宜阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1997', '189', '洛宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1998', '189', '伊川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('1999', '189', '偃师市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2000', '190', '新华区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2001', '190', '卫东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2002', '190', '石龙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2003', '190', '湛河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2004', '190', '宝丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2005', '190', '叶县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2006', '190', '鲁山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2007', '190', '郏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2008', '190', '舞钢市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2009', '190', '汝州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2010', '190', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2011', '191', '文峰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2012', '191', '北关区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2013', '191', '殷都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2014', '191', '龙安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2015', '191', '安阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2016', '191', '汤阴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2017', '191', '滑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2018', '191', '内黄县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2019', '191', '林州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2020', '191', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2021', '192', '鹤山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2022', '192', '山城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2023', '192', '淇滨区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2024', '192', '浚县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2025', '192', '淇县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2026', '192', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2027', '193', '红旗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2028', '193', '卫滨区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2029', '193', '凤泉区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2030', '193', '牧野区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2031', '193', '新乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2032', '193', '获嘉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2033', '193', '原阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2034', '193', '延津县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2035', '193', '封丘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2036', '193', '长垣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2037', '193', '卫辉市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2038', '193', '辉县市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2039', '193', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2040', '194', '解放区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2041', '194', '中站区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2042', '194', '马村区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2043', '194', '山阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2044', '194', '修武县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2045', '194', '博爱县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2046', '194', '武陟县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2047', '194', '温县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2048', '194', '沁阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2049', '194', '孟州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2050', '194', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2051', '195', '华龙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2052', '195', '清丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2053', '195', '南乐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2054', '195', '范县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2055', '195', '台前县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2056', '195', '濮阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2057', '195', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2058', '196', '魏都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2059', '196', '许昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2060', '196', '鄢陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2061', '196', '襄城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2062', '196', '禹州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2063', '196', '长葛市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2064', '196', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2065', '197', '源汇区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2066', '197', '郾城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2067', '197', '召陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2068', '197', '舞阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2069', '197', '临颍县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2070', '197', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2071', '198', '湖滨区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2072', '198', '渑池县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2073', '198', '陕州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2074', '198', '卢氏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2075', '198', '义马市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2076', '198', '灵宝市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2077', '198', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2078', '199', '宛城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2079', '199', '卧龙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2080', '199', '南召县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2081', '199', '方城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2082', '199', '西峡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2083', '199', '镇平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2084', '199', '内乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2085', '199', '淅川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2086', '199', '社旗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2087', '199', '唐河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2088', '199', '新野县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2089', '199', '桐柏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2090', '199', '邓州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2091', '199', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2092', '200', '梁园区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2093', '200', '睢阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2094', '200', '民权县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2095', '200', '睢县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2096', '200', '宁陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2097', '200', '柘城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2098', '200', '虞城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2099', '200', '夏邑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2100', '200', '永城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2101', '200', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2102', '201', '浉河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2103', '201', '平桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2104', '201', '罗山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2105', '201', '光山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2106', '201', '新县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2107', '201', '商城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2108', '201', '固始县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2109', '201', '潢川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2110', '201', '淮滨县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2111', '201', '息县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2112', '201', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2113', '202', '川汇区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2114', '202', '扶沟县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2115', '202', '西华县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2116', '202', '商水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2117', '202', '沈丘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2118', '202', '郸城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2119', '202', '淮阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2120', '202', '太康县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2121', '202', '鹿邑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2122', '202', '项城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2123', '202', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2124', '203', '驿城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2125', '203', '西平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2126', '203', '上蔡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2127', '203', '平舆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2128', '203', '正阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2129', '203', '确山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2130', '203', '泌阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2131', '203', '汝南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2132', '203', '遂平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2133', '203', '新蔡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2134', '203', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2135', '204', '江岸区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2136', '204', '江汉区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2137', '204', '硚口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2138', '204', '汉阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2139', '204', '武昌区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2140', '204', '青山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2141', '204', '洪山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2142', '204', '东西湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2143', '204', '汉南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2144', '204', '蔡甸区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2145', '204', '江夏区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2146', '204', '黄陂区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2147', '204', '新洲区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2148', '204', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2149', '205', '黄石港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2150', '205', '西塞山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2151', '205', '下陆区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2152', '205', '铁山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2153', '205', '阳新县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2154', '205', '大冶市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2155', '205', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2156', '206', '茅箭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2157', '206', '张湾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2158', '206', '郧阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2159', '206', '郧西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2160', '206', '竹山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2161', '206', '竹溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2162', '206', '房县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2163', '206', '丹江口市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2164', '206', '城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2165', '206', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2166', '207', '西陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2167', '207', '伍家岗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2168', '207', '点军区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2169', '207', '猇亭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2170', '207', '夷陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2171', '207', '远安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2172', '207', '兴山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2173', '207', '秭归县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2174', '207', '长阳土家族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2175', '207', '五峰土家族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2176', '207', '葛洲坝区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2177', '207', '开发区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2178', '207', '宜都市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2179', '207', '当阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2180', '207', '枝江市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2181', '207', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2182', '208', '襄城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2183', '208', '樊城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2184', '208', '襄州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2185', '208', '南漳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2186', '208', '谷城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2187', '208', '保康县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2188', '208', '老河口市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2189', '208', '枣阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2190', '208', '宜城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2191', '208', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2192', '209', '梁子湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2193', '209', '华容区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2194', '209', '鄂城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2195', '209', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2196', '210', '东宝区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2197', '210', '掇刀区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2198', '210', '京山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2199', '210', '沙洋县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2200', '210', '钟祥市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2201', '210', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2202', '211', '孝南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2203', '211', '孝昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2204', '211', '大悟县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2205', '211', '云梦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2206', '211', '应城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2207', '211', '安陆市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2208', '211', '汉川市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2209', '211', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2210', '212', '沙市区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2211', '212', '荆州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2212', '212', '公安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2213', '212', '监利县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2214', '212', '江陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2215', '212', '石首市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2216', '212', '洪湖市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2217', '212', '松滋市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2218', '212', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2219', '213', '黄州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2220', '213', '团风县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2221', '213', '红安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2222', '213', '罗田县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2223', '213', '英山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2224', '213', '浠水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2225', '213', '蕲春县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2226', '213', '黄梅县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2227', '213', '麻城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2228', '213', '武穴市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2229', '213', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2230', '214', '咸安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2231', '214', '嘉鱼县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2232', '214', '通城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2233', '214', '崇阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2234', '214', '通山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2235', '214', '赤壁市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2236', '214', '温泉城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2237', '214', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2238', '215', '曾都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2239', '215', '随县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2240', '215', '广水市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2241', '215', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2242', '216', '恩施市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2243', '216', '利川市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2244', '216', '建始县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2245', '216', '巴东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2246', '216', '宣恩县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2247', '216', '咸丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2248', '216', '来凤县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2249', '216', '鹤峰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2250', '216', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2251', '217', '芙蓉区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2252', '217', '天心区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2253', '217', '岳麓区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2254', '217', '开福区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2255', '217', '雨花区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2256', '217', '长沙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2257', '217', '望城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2258', '217', '宁乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2259', '217', '浏阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2260', '217', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2261', '218', '荷塘区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2262', '218', '芦淞区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2263', '218', '石峰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2264', '218', '天元区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2265', '218', '株洲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2266', '218', '攸县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2267', '218', '茶陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2268', '218', '炎陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2269', '218', '醴陵市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2270', '218', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2271', '219', '雨湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2272', '219', '岳塘区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2273', '219', '湘潭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2274', '219', '湘乡市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2275', '219', '韶山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2276', '219', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2277', '220', '珠晖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2278', '220', '雁峰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2279', '220', '石鼓区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2280', '220', '蒸湘区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2281', '220', '南岳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2282', '220', '衡阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2283', '220', '衡南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2284', '220', '衡山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2285', '220', '衡东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2286', '220', '祁东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2287', '220', '耒阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2288', '220', '常宁市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2289', '220', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2290', '221', '双清区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2291', '221', '大祥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2292', '221', '北塔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2293', '221', '邵东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2294', '221', '新邵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2295', '221', '邵阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2296', '221', '隆回县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2297', '221', '洞口县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2298', '221', '绥宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2299', '221', '新宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2300', '221', '城步苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2301', '221', '武冈市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2302', '221', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2303', '222', '岳阳楼区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2304', '222', '云溪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2305', '222', '君山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2306', '222', '岳阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2307', '222', '华容县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2308', '222', '湘阴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2309', '222', '平江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2310', '222', '汨罗市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2311', '222', '临湘市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2312', '222', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2313', '223', '武陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2314', '223', '鼎城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2315', '223', '安乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2316', '223', '汉寿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2317', '223', '澧县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2318', '223', '临澧县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2319', '223', '桃源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2320', '223', '石门县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2321', '223', '津市市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2322', '223', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2323', '224', '永定区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2324', '224', '武陵源区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2325', '224', '慈利县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2326', '224', '桑植县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2327', '224', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2328', '225', '资阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2329', '225', '赫山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2330', '225', '南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2331', '225', '桃江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2332', '225', '安化县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2333', '225', '沅江市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2334', '225', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2335', '226', '北湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2336', '226', '苏仙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2337', '226', '桂阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2338', '226', '宜章县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2339', '226', '永兴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2340', '226', '嘉禾县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2341', '226', '临武县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2342', '226', '汝城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2343', '226', '桂东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2344', '226', '安仁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2345', '226', '资兴市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2346', '226', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2347', '227', '零陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2348', '227', '冷水滩区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2349', '227', '祁阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2350', '227', '东安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2351', '227', '双牌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2352', '227', '道县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2353', '227', '江永县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2354', '227', '宁远县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2355', '227', '蓝山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2356', '227', '新田县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2357', '227', '江华瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2358', '227', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2359', '228', '鹤城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2360', '228', '中方县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2361', '228', '沅陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2362', '228', '辰溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2363', '228', '溆浦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2364', '228', '会同县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2365', '228', '麻阳苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2366', '228', '新晃侗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2367', '228', '芷江侗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2368', '228', '靖州苗族侗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2369', '228', '通道侗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2370', '228', '洪江市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2371', '228', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2372', '229', '娄星区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2373', '229', '双峰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2374', '229', '新化县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2375', '229', '冷水江市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2376', '229', '涟源市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2377', '229', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2378', '230', '吉首市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2379', '230', '泸溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2380', '230', '凤凰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2381', '230', '花垣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2382', '230', '保靖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2383', '230', '古丈县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2384', '230', '永顺县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2385', '230', '龙山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2386', '230', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2387', '231', '荔湾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2388', '231', '越秀区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2389', '231', '海珠区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2390', '231', '天河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2391', '231', '白云区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2392', '231', '黄埔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2393', '231', '番禺区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2394', '231', '花都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2395', '231', '南沙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2396', '231', '萝岗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2397', '231', '增城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2398', '231', '从化区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2399', '231', '东山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2400', '231', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2401', '232', '武江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2402', '232', '浈江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2403', '232', '曲江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2404', '232', '始兴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2405', '232', '仁化县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2406', '232', '翁源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2407', '232', '乳源瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2408', '232', '新丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2409', '232', '乐昌市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2410', '232', '南雄市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2411', '232', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2412', '233', '罗湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2413', '233', '福田区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2414', '233', '南山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2415', '233', '宝安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2416', '233', '龙岗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2417', '233', '盐田区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2418', '233', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2419', '233', '光明新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2420', '233', '坪山新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2421', '233', '大鹏新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2422', '233', '龙华新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2423', '234', '香洲区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2424', '234', '斗门区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2425', '234', '金湾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2426', '234', '金唐区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2427', '234', '南湾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2428', '234', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2429', '235', '龙湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2430', '235', '金平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2431', '235', '濠江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2432', '235', '潮阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2433', '235', '潮南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2434', '235', '澄海区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2435', '235', '南澳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2436', '235', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2437', '236', '禅城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2438', '236', '南海区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2439', '236', '顺德区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2440', '236', '三水区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2441', '236', '高明区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2442', '236', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2443', '237', '蓬江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2444', '237', '江海区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2445', '237', '新会区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2446', '237', '台山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2447', '237', '开平市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2448', '237', '鹤山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2449', '237', '恩平市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2450', '237', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2451', '238', '赤坎区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2452', '238', '霞山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2453', '238', '坡头区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2454', '238', '麻章区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2455', '238', '遂溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2456', '238', '徐闻县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2457', '238', '廉江市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2458', '238', '雷州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2459', '238', '吴川市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2460', '238', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2461', '239', '茂南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2462', '239', '电白区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2463', '239', '电白县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2464', '239', '高州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2465', '239', '化州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2466', '239', '信宜市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2467', '239', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2468', '240', '端州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2469', '240', '鼎湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2470', '240', '广宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2471', '240', '怀集县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2472', '240', '封开县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2473', '240', '德庆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2474', '240', '高要市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2475', '240', '四会市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2476', '240', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2477', '241', '惠城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2478', '241', '惠阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2479', '241', '博罗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2480', '241', '惠东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2481', '241', '龙门县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2482', '241', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2483', '242', '梅江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2484', '242', '梅县区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2485', '242', '大埔县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2486', '242', '丰顺县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2487', '242', '五华县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2488', '242', '平远县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2489', '242', '蕉岭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2490', '242', '兴宁市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2491', '242', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2492', '243', '城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2493', '243', '海丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2494', '243', '陆河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2495', '243', '陆丰市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2496', '243', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2497', '244', '源城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2498', '244', '紫金县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2499', '244', '龙川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2500', '244', '连平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2501', '244', '和平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2502', '244', '东源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2503', '244', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2504', '245', '江城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2505', '245', '阳西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2506', '245', '阳东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2507', '245', '阳春市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2508', '245', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2509', '246', '清城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2510', '246', '佛冈县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2511', '246', '阳山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2512', '246', '连山壮族瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2513', '246', '连南瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2514', '246', '清新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2515', '246', '英德市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2516', '246', '连州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2517', '246', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2518', '250', '湘桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2519', '250', '潮安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2520', '250', '饶平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2521', '250', '枫溪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2522', '250', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2523', '251', '榕城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2524', '251', '揭东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2525', '251', '揭西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2526', '251', '惠来县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2527', '251', '普宁市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2528', '251', '东山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2529', '251', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2530', '252', '云城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2531', '252', '新兴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2532', '252', '郁南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2533', '252', '云安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2534', '252', '罗定市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2535', '252', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2536', '253', '兴宁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2537', '253', '青秀区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2538', '253', '江南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2539', '253', '西乡塘区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2540', '253', '良庆区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2541', '253', '邕宁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2542', '253', '武鸣区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2543', '253', '隆安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2544', '253', '马山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2545', '253', '上林县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2546', '253', '宾阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2547', '253', '横县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2548', '253', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2549', '254', '城中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2550', '254', '鱼峰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2551', '254', '柳南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2552', '254', '柳北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2553', '254', '柳江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2554', '254', '柳城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2555', '254', '鹿寨县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2556', '254', '融安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2557', '254', '融水苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2558', '254', '三江侗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2559', '254', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2560', '255', '秀峰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2561', '255', '叠彩区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2562', '255', '象山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2563', '255', '七星区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2564', '255', '雁山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2565', '255', '阳朔县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2566', '255', '临桂区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2567', '255', '灵川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2568', '255', '全州县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2569', '255', '兴安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2570', '255', '永福县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2571', '255', '灌阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2572', '255', '龙胜各族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2573', '255', '资源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2574', '255', '平乐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2575', '255', '荔浦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2576', '255', '恭城瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2577', '255', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2578', '256', '万秀区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2579', '256', '蝶山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2580', '256', '长洲区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2581', '256', '龙圩区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2582', '256', '苍梧县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2583', '256', '藤县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2584', '256', '蒙山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2585', '256', '岑溪市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2586', '256', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2587', '257', '海城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2588', '257', '银海区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2589', '257', '铁山港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2590', '257', '合浦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2591', '257', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2592', '258', '港口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2593', '258', '防城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2594', '258', '上思县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2595', '258', '东兴市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2596', '258', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2597', '259', '钦南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2598', '259', '钦北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2599', '259', '灵山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2600', '259', '浦北县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2601', '259', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2602', '260', '港北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2603', '260', '港南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2604', '260', '覃塘区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2605', '260', '平南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2606', '260', '桂平市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2607', '260', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2608', '261', '玉州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2609', '261', '福绵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2610', '261', '容县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2611', '261', '陆川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2612', '261', '博白县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2613', '261', '兴业县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2614', '261', '北流市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2615', '261', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2616', '262', '右江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2617', '262', '田阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2618', '262', '田东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2619', '262', '平果县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2620', '262', '德保县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2621', '262', '靖西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2622', '262', '那坡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2623', '262', '凌云县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2624', '262', '乐业县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2625', '262', '田林县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2626', '262', '西林县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2627', '262', '隆林各族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2628', '262', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2629', '263', '八步区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2630', '263', '平桂管理区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2631', '263', '昭平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2632', '263', '钟山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2633', '263', '富川瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2634', '263', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2635', '264', '金城江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2636', '264', '南丹县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2637', '264', '天峨县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2638', '264', '凤山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2639', '264', '东兰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2640', '264', '罗城仫佬族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2641', '264', '环江毛南族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2642', '264', '巴马瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2643', '264', '都安瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2644', '264', '大化瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2645', '264', '宜州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2646', '264', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2647', '265', '兴宾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2648', '265', '忻城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2649', '265', '象州县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2650', '265', '武宣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2651', '265', '金秀瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2652', '265', '合山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2653', '265', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2654', '266', '江州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2655', '266', '扶绥县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2656', '266', '宁明县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2657', '266', '龙州县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2658', '266', '大新县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2659', '266', '天等县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2660', '266', '凭祥市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2661', '266', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2662', '267', '秀英区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2663', '267', '龙华区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2664', '267', '琼山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2665', '267', '美兰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2666', '267', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2667', '269', '西沙群岛', '3', '0');
INSERT INTO `ewei_region` VALUES ('2668', '269', '南沙群岛', '3', '0');
INSERT INTO `ewei_region` VALUES ('2669', '269', '中沙群岛的岛礁及其海域', '3', '0');
INSERT INTO `ewei_region` VALUES ('2670', '189', '高新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2671', '189', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2672', '270', '万州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2673', '270', '涪陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2674', '270', '渝中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2675', '270', '大渡口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2676', '270', '江北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2677', '270', '沙坪坝区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2678', '270', '九龙坡区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2679', '270', '南岸区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2680', '270', '北碚区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2681', '270', '万盛区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2682', '270', '双桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2683', '270', '渝北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2684', '270', '巴南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2685', '270', '黔江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2686', '270', '长寿区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2687', '270', '綦江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2688', '270', '潼南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2689', '270', '铜梁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2690', '270', '大足区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2691', '270', '荣昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2692', '270', '璧山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2693', '270', '梁平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2694', '270', '城口县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2695', '270', '丰都县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2696', '270', '垫江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2697', '270', '武隆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2698', '270', '忠县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2699', '270', '开县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2700', '270', '云阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2701', '270', '奉节县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2702', '270', '巫山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2703', '270', '巫溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2704', '270', '石柱土家族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2705', '270', '秀山土家族苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2706', '270', '酉阳土家族苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2707', '270', '彭水苗族土家族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2708', '270', '江津区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2709', '270', '合川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2710', '270', '永川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2711', '270', '南川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2712', '270', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2713', '271', '锦江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2714', '271', '青羊区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2715', '271', '金牛区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2716', '271', '武侯区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2717', '271', '成华区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2718', '271', '龙泉驿区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2719', '271', '青白江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2720', '271', '新都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2721', '271', '温江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2722', '271', '金堂县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2723', '271', '双流县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2724', '271', '郫县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2725', '271', '大邑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2726', '271', '蒲江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2727', '271', '新津县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2728', '271', '都江堰市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2729', '271', '彭州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2730', '271', '邛崃市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2731', '271', '崇州市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2732', '271', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2733', '272', '自流井区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2734', '272', '贡井区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2735', '272', '大安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2736', '272', '沿滩区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2737', '272', '荣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2738', '272', '富顺县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2739', '272', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2740', '273', '东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2741', '273', '西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2742', '273', '仁和区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2743', '273', '米易县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2744', '273', '盐边县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2745', '273', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2746', '274', '江阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2747', '274', '纳溪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2748', '274', '龙马潭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2749', '274', '泸县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2750', '274', '合江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2751', '274', '叙永县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2752', '274', '古蔺县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2753', '274', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2754', '275', '旌阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2755', '275', '中江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2756', '275', '罗江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2757', '275', '广汉市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2758', '275', '什邡市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2759', '275', '绵竹市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2760', '275', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2761', '276', '涪城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2762', '276', '游仙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2763', '276', '三台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2764', '276', '盐亭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2765', '276', '安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2766', '276', '梓潼县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2767', '276', '北川羌族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2768', '276', '平武县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2769', '276', '高新区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2770', '276', '江油市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2771', '276', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2772', '277', '利州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2773', '277', '昭化区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2774', '277', '朝天区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2775', '277', '旺苍县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2776', '277', '青川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2777', '277', '剑阁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2778', '277', '苍溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2779', '277', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2780', '278', '船山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2781', '278', '安居区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2782', '278', '蓬溪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2783', '278', '射洪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2784', '278', '大英县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2785', '278', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2786', '279', '市中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2787', '279', '东兴区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2788', '279', '威远县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2789', '279', '资中县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2790', '279', '隆昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2791', '279', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2792', '280', '市中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2793', '280', '沙湾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2794', '280', '五通桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2795', '280', '金口河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2796', '280', '犍为县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2797', '280', '井研县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2798', '280', '夹江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2799', '280', '沐川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2800', '280', '峨边彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2801', '280', '马边彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2802', '280', '峨眉山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2803', '280', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2804', '281', '顺庆区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2805', '281', '高坪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2806', '281', '嘉陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2807', '281', '南部县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2808', '281', '营山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2809', '281', '蓬安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2810', '281', '仪陇县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2811', '281', '西充县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2812', '281', '阆中市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2813', '281', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2814', '282', '东坡区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2815', '282', '仁寿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2816', '282', '彭山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2817', '282', '洪雅县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2818', '282', '丹棱县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2819', '282', '青神县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2820', '282', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2821', '283', '翠屏区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2822', '283', '宜宾县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2823', '283', '南溪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2824', '283', '江安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2825', '283', '长宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2826', '283', '高县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2827', '283', '珙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2828', '283', '筠连县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2829', '283', '兴文县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2830', '283', '屏山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2831', '283', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2832', '284', '广安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2833', '284', '前锋区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2834', '284', '岳池县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2835', '284', '武胜县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2836', '284', '邻水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2837', '284', '华蓥市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2838', '284', '市辖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2839', '284', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2840', '285', '通川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2841', '285', '达川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2842', '285', '宣汉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2843', '285', '开江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2844', '285', '大竹县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2845', '285', '渠县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2846', '285', '万源市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2847', '285', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2848', '286', '雨城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2849', '286', '名山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2850', '286', '荥经县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2851', '286', '汉源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2852', '286', '石棉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2853', '286', '天全县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2854', '286', '芦山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2855', '286', '宝兴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2856', '286', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2857', '287', '巴州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2858', '287', '恩阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2859', '287', '通江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2860', '287', '南江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2861', '287', '平昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2862', '287', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2863', '288', '雁江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2864', '288', '安岳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2865', '288', '乐至县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2866', '288', '简阳市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2867', '288', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2868', '289', '汶川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2869', '289', '理县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2870', '289', '茂县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2871', '289', '松潘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2872', '289', '九寨沟县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2873', '289', '金川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2874', '289', '小金县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2875', '289', '黑水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2876', '289', '马尔康县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2877', '289', '壤塘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2878', '289', '阿坝县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2879', '289', '若尔盖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2880', '289', '红原县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2881', '289', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2882', '290', '康定市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2883', '290', '泸定县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2884', '290', '丹巴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2885', '290', '九龙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2886', '290', '雅江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2887', '290', '道孚县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2888', '290', '炉霍县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2889', '290', '甘孜县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2890', '290', '新龙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2891', '290', '德格县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2892', '290', '白玉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2893', '290', '石渠县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2894', '290', '色达县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2895', '290', '理塘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2896', '290', '巴塘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2897', '290', '乡城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2898', '290', '稻城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2899', '290', '得荣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2900', '290', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2901', '291', '西昌市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2902', '291', '木里藏族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2903', '291', '盐源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2904', '291', '德昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2905', '291', '会理县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2906', '291', '会东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2907', '291', '宁南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2908', '291', '普格县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2909', '291', '布拖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2910', '291', '金阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2911', '291', '昭觉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2912', '291', '喜德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2913', '291', '冕宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2914', '291', '越西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2915', '291', '甘洛县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2916', '291', '美姑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2917', '291', '雷波县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2918', '291', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2919', '292', '南明区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2920', '292', '云岩区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2921', '292', '花溪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2922', '292', '乌当区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2923', '292', '白云区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2924', '292', '小河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2925', '292', '开阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2926', '292', '息烽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2927', '292', '修文县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2928', '292', '观山湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2929', '292', '清镇市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2930', '292', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2931', '293', '钟山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2932', '293', '六枝特区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2933', '293', '水城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2934', '293', '盘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2935', '293', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2936', '294', '红花岗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2937', '294', '汇川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2938', '294', '遵义县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2939', '294', '桐梓县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2940', '294', '绥阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2941', '294', '正安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2942', '294', '道真仡佬族苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2943', '294', '务川仡佬族苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2944', '294', '凤冈县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2945', '294', '湄潭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2946', '294', '余庆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2947', '294', '习水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2948', '294', '赤水市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2949', '294', '仁怀市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2950', '294', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2951', '295', '西秀区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2952', '295', '平坝区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2953', '295', '普定县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2954', '295', '镇宁布依族苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2955', '295', '关岭布依族苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2956', '295', '紫云苗族布依族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2957', '295', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2958', '296', '碧江区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2959', '296', '江口县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2960', '296', '玉屏侗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2961', '296', '石阡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2962', '296', '思南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2963', '296', '印江土家族苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2964', '296', '德江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2965', '296', '沿河土家族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2966', '296', '松桃苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2967', '296', '万山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2968', '296', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2969', '297', '兴义市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2970', '297', '兴仁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2971', '297', '普安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2972', '297', '晴隆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2973', '297', '贞丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2974', '297', '望谟县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2975', '297', '册亨县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2976', '297', '安龙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2977', '297', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2978', '298', '七星关区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2979', '298', '大方县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2980', '298', '黔西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2981', '298', '金沙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2982', '298', '织金县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2983', '298', '纳雍县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2984', '298', '威宁彝族回族苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2985', '298', '赫章县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2986', '298', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('2987', '299', '凯里市', '3', '0');
INSERT INTO `ewei_region` VALUES ('2988', '299', '黄平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2989', '299', '施秉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2990', '299', '三穗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2991', '299', '镇远县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2992', '299', '岑巩县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2993', '299', '天柱县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2994', '299', '锦屏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2995', '299', '剑河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2996', '299', '台江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2997', '299', '黎平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2998', '299', '榕江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('2999', '299', '从江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3000', '299', '雷山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3001', '299', '麻江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3002', '299', '丹寨县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3003', '299', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3004', '300', '都匀市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3005', '300', '福泉市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3006', '300', '荔波县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3007', '300', '贵定县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3008', '300', '瓮安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3009', '300', '独山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3010', '300', '平塘县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3011', '300', '罗甸县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3012', '300', '长顺县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3013', '300', '龙里县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3014', '300', '惠水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3015', '300', '三都水族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3016', '300', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3017', '301', '五华区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3018', '301', '盘龙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3019', '301', '官渡区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3020', '301', '西山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3021', '301', '东川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3022', '301', '呈贡区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3023', '301', '晋宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3024', '301', '富民县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3025', '301', '宜良县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3026', '301', '石林彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3027', '301', '嵩明县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3028', '301', '禄劝彝族苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3029', '301', '寻甸回族彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3030', '301', '安宁市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3031', '301', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3032', '302', '麒麟区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3033', '302', '马龙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3034', '302', '陆良县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3035', '302', '师宗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3036', '302', '罗平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3037', '302', '富源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3038', '302', '会泽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3039', '302', '沾益县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3040', '302', '宣威市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3041', '302', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3042', '303', '红塔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3043', '303', '江川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3044', '303', '澄江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3045', '303', '通海县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3046', '303', '华宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3047', '303', '易门县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3048', '303', '峨山彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3049', '303', '新平彝族傣族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3050', '303', '元江哈尼族彝族傣族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3051', '303', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3052', '304', '隆阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3053', '304', '施甸县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3054', '304', '腾冲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3055', '304', '龙陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3056', '304', '昌宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3057', '304', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3058', '305', '昭阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3059', '305', '鲁甸县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3060', '305', '巧家县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3061', '305', '盐津县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3062', '305', '大关县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3063', '305', '永善县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3064', '305', '绥江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3065', '305', '镇雄县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3066', '305', '彝良县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3067', '305', '威信县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3068', '305', '水富县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3069', '305', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3070', '306', '古城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3071', '306', '玉龙纳西族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3072', '306', '永胜县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3073', '306', '华坪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3074', '306', '宁蒗彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3075', '306', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3076', '307', '思茅区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3077', '307', '宁洱哈尼族彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3078', '307', '墨江哈尼族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3079', '307', '景东彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3080', '307', '景谷傣族彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3081', '307', '镇沅彝族哈尼族拉祜族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3082', '307', '江城哈尼族彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3083', '307', '孟连傣族拉祜族佤族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3084', '307', '澜沧拉祜族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3085', '307', '西盟佤族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3086', '307', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3087', '308', '临翔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3088', '308', '凤庆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3089', '308', '云县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3090', '308', '永德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3091', '308', '镇康县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3092', '308', '双江拉祜族佤族布朗族傣族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3093', '308', '耿马傣族佤族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3094', '308', '沧源佤族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3095', '308', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3096', '309', '楚雄市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3097', '309', '双柏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3098', '309', '牟定县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3099', '309', '南华县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3100', '309', '姚安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3101', '309', '大姚县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3102', '309', '永仁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3103', '309', '元谋县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3104', '309', '武定县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3105', '309', '禄丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3106', '309', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3107', '310', '个旧市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3108', '310', '开远市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3109', '310', '蒙自市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3110', '310', '屏边苗族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3111', '310', '建水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3112', '310', '石屏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3113', '310', '弥勒市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3114', '310', '泸西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3115', '310', '元阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3116', '310', '红河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3117', '310', '金平苗族瑶族傣族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3118', '310', '绿春县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3119', '310', '河口瑶族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3120', '310', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3121', '311', '文山市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3122', '311', '砚山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3123', '311', '西畴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3124', '311', '麻栗坡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3125', '311', '马关县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3126', '311', '丘北县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3127', '311', '广南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3128', '311', '富宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3129', '311', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3130', '312', '景洪市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3131', '312', '勐海县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3132', '312', '勐腊县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3133', '312', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3134', '313', '大理市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3135', '313', '漾濞彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3136', '313', '祥云县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3137', '313', '宾川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3138', '313', '弥渡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3139', '313', '南涧彝族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3140', '313', '巍山彝族回族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3141', '313', '永平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3142', '313', '云龙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3143', '313', '洱源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3144', '313', '剑川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3145', '313', '鹤庆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3146', '313', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3147', '314', '瑞丽市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3148', '314', '芒市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3149', '314', '梁河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3150', '314', '盈江县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3151', '314', '陇川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3152', '314', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3153', '315', '泸水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3154', '315', '福贡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3155', '315', '贡山独龙族怒族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3156', '315', '兰坪白族普米族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3157', '315', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3158', '316', '香格里拉市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3159', '316', '德钦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3160', '316', '维西傈僳族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3161', '316', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3162', '317', '城关区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3163', '317', '林周县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3164', '317', '当雄县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3165', '317', '尼木县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3166', '317', '曲水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3167', '317', '堆龙德庆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3168', '317', '达孜县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3169', '317', '墨竹工卡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3170', '317', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3171', '318', '卡若区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3172', '318', '江达县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3173', '318', '贡觉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3174', '318', '类乌齐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3175', '318', '丁青县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3176', '318', '察雅县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3177', '318', '八宿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3178', '318', '左贡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3179', '318', '芒康县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3180', '318', '洛隆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3181', '318', '边坝县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3182', '318', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3183', '319', '乃东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3184', '319', '扎囊县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3185', '319', '贡嘎县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3186', '319', '桑日县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3187', '319', '琼结县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3188', '319', '曲松县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3189', '319', '措美县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3190', '319', '洛扎县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3191', '319', '加查县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3192', '319', '隆子县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3193', '319', '错那县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3194', '319', '浪卡子县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3195', '319', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3196', '320', '桑珠孜区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3197', '320', '南木林县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3198', '320', '江孜县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3199', '320', '定日县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3200', '320', '萨迦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3201', '320', '拉孜县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3202', '320', '昂仁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3203', '320', '谢通门县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3204', '320', '白朗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3205', '320', '仁布县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3206', '320', '康马县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3207', '320', '定结县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3208', '320', '仲巴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3209', '320', '亚东县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3210', '320', '吉隆县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3211', '320', '聂拉木县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3212', '320', '萨嘎县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3213', '320', '岗巴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3214', '320', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3215', '321', '那曲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3216', '321', '嘉黎县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3217', '321', '比如县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3218', '321', '聂荣县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3219', '321', '安多县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3220', '321', '申扎县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3221', '321', '索县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3222', '321', '班戈县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3223', '321', '巴青县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3224', '321', '尼玛县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3225', '321', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3226', '321', '双湖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3227', '322', '普兰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3228', '322', '札达县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3229', '322', '噶尔县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3230', '322', '日土县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3231', '322', '革吉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3232', '322', '改则县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3233', '322', '措勤县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3234', '322', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3235', '323', '巴宜区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3236', '323', '工布江达县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3237', '323', '米林县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3238', '323', '墨脱县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3239', '323', '波密县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3240', '323', '察隅县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3241', '323', '朗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3242', '323', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3243', '324', '新城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3244', '324', '碑林区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3245', '324', '莲湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3246', '324', '灞桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3247', '324', '未央区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3248', '324', '雁塔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3249', '324', '阎良区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3250', '324', '临潼区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3251', '324', '长安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3252', '324', '蓝田县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3253', '324', '周至县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3254', '324', '户县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3255', '324', '高陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3256', '324', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3257', '325', '王益区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3258', '325', '印台区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3259', '325', '耀州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3260', '325', '宜君县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3261', '325', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3262', '326', '渭滨区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3263', '326', '金台区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3264', '326', '陈仓区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3265', '326', '凤翔县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3266', '326', '岐山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3267', '326', '扶风县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3268', '326', '眉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3269', '326', '陇县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3270', '326', '千阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3271', '326', '麟游县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3272', '326', '凤县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3273', '326', '太白县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3274', '326', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3275', '327', '秦都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3276', '327', '杨陵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3277', '327', '渭城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3278', '327', '三原县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3279', '327', '泾阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3280', '327', '乾县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3281', '327', '礼泉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3282', '327', '永寿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3283', '327', '彬县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3284', '327', '长武县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3285', '327', '旬邑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3286', '327', '淳化县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3287', '327', '武功县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3288', '327', '兴平市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3289', '327', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3290', '328', '临渭区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3291', '328', '华县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3292', '328', '潼关县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3293', '328', '大荔县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3294', '328', '合阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3295', '328', '澄城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3296', '328', '蒲城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3297', '328', '白水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3298', '328', '富平县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3299', '328', '韩城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3300', '328', '华阴市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3301', '328', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3302', '329', '宝塔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3303', '329', '延长县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3304', '329', '延川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3305', '329', '子长县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3306', '329', '安塞县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3307', '329', '志丹县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3308', '329', '吴起县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3309', '329', '甘泉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3310', '329', '富县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3311', '329', '洛川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3312', '329', '宜川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3313', '329', '黄龙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3314', '329', '黄陵县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3315', '329', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3316', '330', '汉台区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3317', '330', '南郑县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3318', '330', '城固县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3319', '330', '洋县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3320', '330', '西乡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3321', '330', '勉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3322', '330', '宁强县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3323', '330', '略阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3324', '330', '镇巴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3325', '330', '留坝县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3326', '330', '佛坪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3327', '330', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3328', '331', '榆阳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3329', '331', '神木县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3330', '331', '府谷县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3331', '331', '横山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3332', '331', '靖边县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3333', '331', '定边县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3334', '331', '绥德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3335', '331', '米脂县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3336', '331', '佳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3337', '331', '吴堡县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3338', '331', '清涧县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3339', '331', '子洲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3340', '331', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3341', '332', '汉滨区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3342', '332', '汉阴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3343', '332', '石泉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3344', '332', '宁陕县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3345', '332', '紫阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3346', '332', '岚皋县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3347', '332', '平利县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3348', '332', '镇坪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3349', '332', '旬阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3350', '332', '白河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3351', '332', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3352', '333', '商州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3353', '333', '洛南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3354', '333', '丹凤县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3355', '333', '商南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3356', '333', '山阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3357', '333', '镇安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3358', '333', '柞水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3359', '333', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3360', '334', '城关区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3361', '334', '七里河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3362', '334', '西固区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3363', '334', '安宁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3364', '334', '红古区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3365', '334', '永登县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3366', '334', '皋兰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3367', '334', '榆中县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3368', '334', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3369', '336', '金川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3370', '336', '永昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3371', '336', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3372', '337', '白银区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3373', '337', '平川区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3374', '337', '靖远县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3375', '337', '会宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3376', '337', '景泰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3377', '337', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3378', '338', '秦州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3379', '338', '麦积区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3380', '338', '清水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3381', '338', '秦安县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3382', '338', '甘谷县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3383', '338', '武山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3384', '338', '张家川回族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3385', '338', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3386', '339', '凉州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3387', '339', '民勤县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3388', '339', '古浪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3389', '339', '天祝藏族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3390', '339', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3391', '340', '甘州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3392', '340', '肃南裕固族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3393', '340', '民乐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3394', '340', '临泽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3395', '340', '高台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3396', '340', '山丹县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3397', '340', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3398', '341', '崆峒区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3399', '341', '泾川县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3400', '341', '灵台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3401', '341', '崇信县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3402', '341', '华亭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3403', '341', '庄浪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3404', '341', '静宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3405', '341', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3406', '342', '肃州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3407', '342', '金塔县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3408', '342', '瓜州县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3409', '342', '肃北蒙古族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3410', '342', '阿克塞哈萨克族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3411', '342', '玉门市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3412', '342', '敦煌市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3413', '342', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3414', '343', '西峰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3415', '343', '庆城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3416', '343', '环县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3417', '343', '华池县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3418', '343', '合水县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3419', '343', '正宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3420', '343', '宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3421', '343', '镇原县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3422', '343', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3423', '344', '安定区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3424', '344', '通渭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3425', '344', '陇西县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3426', '344', '渭源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3427', '344', '临洮县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3428', '344', '漳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3429', '344', '岷县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3430', '344', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3431', '345', '武都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3432', '345', '成县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3433', '345', '文县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3434', '345', '宕昌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3435', '345', '康县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3436', '345', '西和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3437', '345', '礼县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3438', '345', '徽县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3439', '345', '两当县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3440', '345', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3441', '346', '临夏市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3442', '346', '临夏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3443', '346', '康乐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3444', '346', '永靖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3445', '346', '广河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3446', '346', '和政县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3447', '346', '东乡族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3448', '346', '积石山保安族东乡族撒拉族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3449', '346', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3450', '347', '合作市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3451', '347', '临潭县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3452', '347', '卓尼县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3453', '347', '舟曲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3454', '347', '迭部县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3455', '347', '玛曲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3456', '347', '碌曲县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3457', '347', '夏河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3458', '347', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3459', '348', '城东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3460', '348', '城中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3461', '348', '城西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3462', '348', '城北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3463', '348', '大通回族土族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3464', '348', '湟中县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3465', '348', '湟源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3466', '348', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3467', '349', '平安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3468', '349', '民和回族土族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3469', '349', '乐都区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3470', '349', '互助土族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3471', '349', '化隆回族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3472', '349', '循化撒拉族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3473', '349', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3474', '350', '门源回族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3475', '350', '祁连县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3476', '350', '海晏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3477', '350', '刚察县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3478', '350', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3479', '351', '同仁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3480', '351', '尖扎县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3481', '351', '泽库县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3482', '351', '河南蒙古族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3483', '351', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3484', '352', '共和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3485', '352', '同德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3486', '352', '贵德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3487', '352', '兴海县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3488', '352', '贵南县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3489', '352', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3490', '353', '玛沁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3491', '353', '班玛县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3492', '353', '甘德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3493', '353', '达日县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3494', '353', '久治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3495', '353', '玛多县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3496', '353', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3497', '354', '玉树市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3498', '354', '杂多县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3499', '354', '称多县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3500', '354', '治多县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3501', '354', '囊谦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3502', '354', '曲麻莱县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3503', '354', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3504', '355', '格尔木市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3505', '355', '德令哈市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3506', '355', '乌兰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3507', '355', '都兰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3508', '355', '天峻县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3509', '355', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3510', '356', '兴庆区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3511', '356', '西夏区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3512', '356', '金凤区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3513', '356', '永宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3514', '356', '贺兰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3515', '356', '灵武市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3516', '356', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3517', '357', '大武口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3518', '357', '惠农区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3519', '357', '平罗县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3520', '357', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3521', '358', '利通区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3522', '358', '红寺堡区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3523', '358', '盐池县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3524', '358', '同心县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3525', '358', '青铜峡市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3526', '358', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3527', '359', '原州区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3528', '359', '西吉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3529', '359', '隆德县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3530', '359', '泾源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3531', '359', '彭阳县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3532', '359', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3533', '360', '沙坡头区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3534', '360', '中宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3535', '360', '海原县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3536', '360', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3537', '361', '天山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3538', '361', '沙依巴克区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3539', '361', '新市区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3540', '361', '水磨沟区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3541', '361', '头屯河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3542', '361', '达坂城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3543', '361', '东山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3544', '361', '米东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3545', '361', '乌鲁木齐县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3546', '361', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3547', '362', '独山子区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3548', '362', '克拉玛依区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3549', '362', '白碱滩区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3550', '362', '乌尔禾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3551', '362', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3552', '363', '高昌区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3553', '363', '鄯善县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3554', '363', '托克逊县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3555', '363', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3556', '364', '哈密市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3557', '364', '巴里坤哈萨克自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3558', '364', '伊吾县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3559', '364', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3560', '365', '昌吉市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3561', '365', '阜康市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3562', '365', '米泉市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3563', '365', '呼图壁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3564', '365', '玛纳斯县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3565', '365', '奇台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3566', '365', '吉木萨尔县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3567', '365', '木垒哈萨克自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3568', '365', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3569', '366', '博乐市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3570', '366', '阿拉山口市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3571', '366', '精河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3572', '366', '温泉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3573', '366', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3574', '367', '库尔勒市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3575', '367', '轮台县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3576', '367', '尉犁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3577', '367', '若羌县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3578', '367', '且末县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3579', '367', '焉耆回族自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3580', '367', '和静县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3581', '367', '和硕县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3582', '367', '博湖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3583', '367', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3584', '368', '阿克苏市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3585', '368', '温宿县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3586', '368', '库车县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3587', '368', '沙雅县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3588', '368', '新和县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3589', '368', '拜城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3590', '368', '乌什县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3591', '368', '阿瓦提县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3592', '368', '柯坪县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3593', '368', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3594', '369', '阿图什市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3595', '369', '阿克陶县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3596', '369', '阿合奇县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3597', '369', '乌恰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3598', '369', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3599', '370', '喀什市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3600', '370', '疏附县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3601', '370', '疏勒县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3602', '370', '英吉沙县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3603', '370', '泽普县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3604', '370', '莎车县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3605', '370', '叶城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3606', '370', '麦盖提县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3607', '370', '岳普湖县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3608', '370', '伽师县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3609', '370', '巴楚县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3610', '370', '塔什库尔干塔吉克自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3611', '370', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3612', '371', '和田市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3613', '371', '和田县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3614', '371', '墨玉县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3615', '371', '皮山县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3616', '371', '洛浦县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3617', '371', '策勒县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3618', '371', '于田县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3619', '371', '民丰县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3620', '371', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3621', '372', '伊宁市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3622', '372', '奎屯市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3623', '372', '伊宁县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3624', '372', '察布查尔锡伯自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3625', '372', '霍城县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3626', '372', '巩留县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3627', '372', '新源县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3628', '372', '昭苏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3629', '372', '特克斯县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3630', '372', '尼勒克县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3631', '372', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3632', '373', '塔城市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3633', '373', '乌苏市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3634', '373', '额敏县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3635', '373', '沙湾县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3636', '373', '托里县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3637', '373', '裕民县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3638', '373', '和布克赛尔蒙古自治县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3639', '373', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3640', '374', '阿勒泰市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3641', '374', '布尔津县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3642', '374', '富蕴县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3643', '374', '福海县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3644', '374', '哈巴河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3645', '374', '青河县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3646', '374', '吉木乃县', '3', '0');
INSERT INTO `ewei_region` VALUES ('3647', '374', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3648', '375', '中正区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3649', '375', '大同区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3650', '375', '中山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3651', '375', '松山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3652', '375', '大安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3653', '375', '万华区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3654', '375', '信义区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3655', '375', '士林区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3656', '375', '北投区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3657', '375', '内湖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3658', '375', '南港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3659', '375', '文山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3660', '375', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3661', '376', '新兴区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3662', '376', '前金区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3663', '376', '芩雅区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3664', '376', '盐埕区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3665', '376', '鼓山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3666', '376', '旗津区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3667', '376', '前镇区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3668', '376', '三民区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3669', '376', '左营区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3670', '376', '楠梓区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3671', '376', '小港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3672', '376', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3673', '376', '苓雅区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3674', '376', '仁武区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3675', '376', '大社区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3676', '376', '冈山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3677', '376', '路竹区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3678', '376', '阿莲区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3679', '376', '田寮区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3680', '376', '燕巢区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3681', '376', '桥头区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3682', '376', '梓官区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3683', '376', '弥陀区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3684', '376', '永安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3685', '376', '湖内区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3686', '376', '凤山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3687', '376', '大寮区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3688', '376', '林园区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3689', '376', '鸟松区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3690', '376', '大树区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3691', '376', '旗山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3692', '376', '美浓区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3693', '376', '六龟区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3694', '376', '内门区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3695', '376', '杉林区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3696', '376', '甲仙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3697', '376', '桃源区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3698', '376', '那玛夏区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3699', '376', '茂林区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3700', '376', '茄萣区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3701', '377', '中西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3702', '377', '东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3703', '377', '南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3704', '377', '北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3705', '377', '安平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3706', '377', '安南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3707', '377', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3708', '377', '永康区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3709', '377', '归仁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3710', '377', '新化区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3711', '377', '左镇区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3712', '377', '玉井区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3713', '377', '楠西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3714', '377', '南化区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3715', '377', '仁德区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3716', '377', '关庙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3717', '377', '龙崎区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3718', '377', '官田区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3719', '377', '麻豆区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3720', '377', '佳里区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3721', '377', '西港区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3722', '377', '七股区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3723', '377', '将军区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3724', '377', '学甲区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3725', '377', '北门区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3726', '377', '新营区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3727', '377', '后壁区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3728', '377', '白河区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3729', '377', '东山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3730', '377', '六甲区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3731', '377', '下营区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3732', '377', '柳营区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3733', '377', '盐水区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3734', '377', '善化区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3735', '377', '大内区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3736', '377', '山上区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3737', '377', '新市区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3738', '377', '安定区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3739', '378', '中区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3740', '378', '东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3741', '378', '南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3742', '378', '西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3743', '378', '北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3744', '378', '北屯区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3745', '378', '西屯区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3746', '378', '南屯区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3747', '378', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3748', '378', '太平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3749', '378', '大里区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3750', '378', '雾峰区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3751', '378', '乌日区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3752', '378', '丰原区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3753', '378', '后里区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3754', '378', '石冈区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3755', '378', '东势区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3756', '378', '和平区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3757', '378', '新社区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3758', '378', '潭子区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3759', '378', '大雅区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3760', '378', '神冈区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3761', '378', '大肚区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3762', '378', '沙鹿区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3763', '378', '龙井区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3764', '378', '梧栖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3765', '378', '清水区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3766', '378', '大甲区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3767', '378', '外埔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3768', '378', '大安区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3769', '379', '金沙镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3770', '379', '金湖镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3771', '379', '金宁乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3772', '379', '金城镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3773', '379', '烈屿乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3774', '379', '乌坵乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3775', '380', '南投市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3776', '380', '中寮乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3777', '380', '草屯镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3778', '380', '国姓乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3779', '380', '埔里镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3780', '380', '仁爱乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3781', '380', '名间乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3782', '380', '集集镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3783', '380', '水里乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3784', '380', '鱼池乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3785', '380', '信义乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3786', '380', '竹山镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3787', '380', '鹿谷乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3788', '381', '仁爱区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3789', '381', '信义区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3790', '381', '中正区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3791', '381', '中山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3792', '381', '安乐区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3793', '381', '暖暖区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3794', '381', '七堵区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3795', '381', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3796', '382', '东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3797', '382', '北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3798', '382', '香山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3799', '382', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3800', '383', '东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3801', '383', '西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3802', '383', '其它区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3803', '384', '万里区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3804', '384', '金山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3805', '384', '板桥区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3806', '384', '汐止区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3807', '384', '深坑区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3808', '384', '石碇区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3809', '384', '瑞芳区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3810', '384', '平溪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3811', '384', '双溪区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3812', '384', '贡寮区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3813', '384', '新店区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3814', '384', '坪林区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3815', '384', '乌来区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3816', '384', '永和区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3817', '384', '中和区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3818', '384', '土城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3819', '384', '三峡区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3820', '384', '树林区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3821', '384', '莺歌区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3822', '384', '三重区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3823', '384', '新庄区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3824', '384', '泰山区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3825', '384', '林口区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3826', '384', '芦洲区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3827', '384', '五股区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3828', '384', '八里区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3829', '384', '淡水区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3830', '384', '三芝区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3831', '384', '石门区', '3', '0');
INSERT INTO `ewei_region` VALUES ('3832', '385', '宜兰市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3833', '385', '头城镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3834', '385', '礁溪乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3835', '385', '壮围乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3836', '385', '员山乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3837', '385', '罗东镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3838', '385', '三星乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3839', '385', '大同乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3840', '385', '五结乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3841', '385', '冬山乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3842', '385', '苏澳镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3843', '385', '南澳乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3844', '385', '钓鱼台', '3', '0');
INSERT INTO `ewei_region` VALUES ('3845', '386', '竹北市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3846', '386', '湖口乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3847', '386', '新丰乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3848', '386', '新埔镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3849', '386', '关西镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3850', '386', '芎林乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3851', '386', '宝山乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3852', '386', '竹东镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3853', '386', '五峰乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3854', '386', '横山乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3855', '386', '尖石乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3856', '386', '北埔乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3857', '386', '峨眉乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3858', '387', '中坜市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3859', '387', '平镇市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3860', '387', '龙潭乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3861', '387', '杨梅市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3862', '387', '新屋乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3863', '387', '观音乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3864', '387', '桃园市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3865', '387', '龟山乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3866', '387', '八德市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3867', '387', '大溪镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3868', '387', '复兴乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3869', '387', '大园乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3870', '387', '芦竹乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3871', '388', '竹南镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3872', '388', '头份镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3873', '388', '三湾乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3874', '388', '南庄乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3875', '388', '狮潭乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3876', '388', '后龙镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3877', '388', '通霄镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3878', '388', '苑里镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3879', '388', '苗栗市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3880', '388', '造桥乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3881', '388', '头屋乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3882', '388', '公馆乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3883', '388', '大湖乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3884', '388', '泰安乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3885', '388', '铜锣乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3886', '388', '三义乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3887', '388', '西湖乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3888', '388', '卓兰镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3889', '389', '彰化市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3890', '389', '芬园乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3891', '389', '花坛乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3892', '389', '秀水乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3893', '389', '鹿港镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3894', '389', '福兴乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3895', '389', '线西乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3896', '389', '和美镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3897', '389', '伸港乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3898', '389', '员林镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3899', '389', '社头乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3900', '389', '永靖乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3901', '389', '埔心乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3902', '389', '溪湖镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3903', '389', '大村乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3904', '389', '埔盐乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3905', '389', '田中镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3906', '389', '北斗镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3907', '389', '田尾乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3908', '389', '埤头乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3909', '389', '溪州乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3910', '389', '竹塘乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3911', '389', '二林镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3912', '389', '大城乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3913', '389', '芳苑乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3914', '389', '二水乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3915', '390', '番路乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3916', '390', '梅山乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3917', '390', '竹崎乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3918', '390', '阿里山乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3919', '390', '中埔乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3920', '390', '大埔乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3921', '390', '水上乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3922', '390', '鹿草乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3923', '390', '太保市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3924', '390', '朴子市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3925', '390', '东石乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3926', '390', '六脚乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3927', '390', '新港乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3928', '390', '民雄乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3929', '390', '大林镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3930', '390', '溪口乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3931', '390', '义竹乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3932', '390', '布袋镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3933', '391', '斗南镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3934', '391', '大埤乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3935', '391', '虎尾镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3936', '391', '土库镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3937', '391', '褒忠乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3938', '391', '东势乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3939', '391', '台西乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3940', '391', '仑背乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3941', '391', '麦寮乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3942', '391', '斗六市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3943', '391', '林内乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3944', '391', '古坑乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3945', '391', '莿桐乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3946', '391', '西螺镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3947', '391', '二仑乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3948', '391', '北港镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3949', '391', '水林乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3950', '391', '口湖乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3951', '391', '四湖乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3952', '391', '元长乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3953', '392', '屏东市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3954', '392', '三地门乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3955', '392', '雾台乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3956', '392', '玛家乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3957', '392', '九如乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3958', '392', '里港乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3959', '392', '高树乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3960', '392', '盐埔乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3961', '392', '长治乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3962', '392', '麟洛乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3963', '392', '竹田乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3964', '392', '内埔乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3965', '392', '万丹乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3966', '392', '潮州镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3967', '392', '泰武乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3968', '392', '来义乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3969', '392', '万峦乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3970', '392', '崁顶乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3971', '392', '新埤乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3972', '392', '南州乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3973', '392', '林边乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3974', '392', '东港镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3975', '392', '琉球乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3976', '392', '佳冬乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3977', '392', '新园乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3978', '392', '枋寮乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3979', '392', '枋山乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3980', '392', '春日乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3981', '392', '狮子乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3982', '392', '车城乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3983', '392', '牡丹乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3984', '392', '恒春镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3985', '392', '满州乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3986', '393', '台东市', '3', '0');
INSERT INTO `ewei_region` VALUES ('3987', '393', '绿岛乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3988', '393', '兰屿乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3989', '393', '延平乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3990', '393', '卑南乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3991', '393', '鹿野乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3992', '393', '关山镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3993', '393', '海端乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3994', '393', '池上乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3995', '393', '东河乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3996', '393', '成功镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('3997', '393', '长滨乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3998', '393', '金峰乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('3999', '393', '大武乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4000', '393', '达仁乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4001', '393', '太麻里乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4002', '394', '花莲市', '3', '0');
INSERT INTO `ewei_region` VALUES ('4003', '394', '新城乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4004', '394', '太鲁阁', '3', '0');
INSERT INTO `ewei_region` VALUES ('4005', '394', '秀林乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4006', '394', '吉安乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4007', '394', '寿丰乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4008', '394', '凤林镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('4009', '394', '光复乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4010', '394', '丰滨乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4011', '394', '瑞穗乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4012', '394', '万荣乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4013', '394', '玉里镇', '3', '0');
INSERT INTO `ewei_region` VALUES ('4014', '394', '卓溪乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4015', '394', '富里乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4016', '395', '马公市', '3', '0');
INSERT INTO `ewei_region` VALUES ('4017', '395', '西屿乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4018', '395', '望安乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4019', '395', '七美乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4020', '395', '白沙乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4021', '395', '湖西乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4022', '396', '南竿乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4023', '396', '北竿乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4024', '396', '莒光乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4025', '396', '东引乡', '3', '0');
INSERT INTO `ewei_region` VALUES ('4026', '397', '中西区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4027', '397', '湾仔', '3', '0');
INSERT INTO `ewei_region` VALUES ('4028', '397', '东区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4029', '397', '南区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4030', '398', '九龙城区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4031', '398', '油尖旺区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4032', '398', '深水埗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4033', '398', '黄大仙区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4034', '398', '观塘区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4035', '399', '北区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4036', '399', '大埔区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4037', '399', '沙田区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4038', '399', '西贡区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4039', '399', '元朗区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4040', '399', '屯门区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4041', '399', '荃湾区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4042', '399', '葵青区', '3', '0');
INSERT INTO `ewei_region` VALUES ('4043', '399', '离岛区', '3', '0');

-- ----------------------------
-- Table structure for ewei_shop
-- ----------------------------
DROP TABLE IF EXISTS `ewei_shop`;
CREATE TABLE `ewei_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺索引id',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_type` int(11) NOT NULL DEFAULT '0' COMMENT '店铺类型等级',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员id',
  `shop_group_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `shop_company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺公司名称',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在省份ID',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在市ID',
  `district_id` mediumint(8) NOT NULL COMMENT '店铺所在区ID',
  `shop_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `shop_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `shop_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '店铺状态，0关闭，1开启，2审核中',
  `shop_close_info` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺关闭原因',
  `shop_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `shop_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺logo',
  `shop_banner` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺横幅',
  `shop_avatar` varchar(150) NOT NULL DEFAULT '' COMMENT '店铺头像',
  `shop_phone` varchar(20) NOT NULL DEFAULT '' COMMENT '商家电话',
  `shop_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `shop_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `shop_sales` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺销售额（不计算退款）',
  `shop_account` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺账户余额',
  `shop_cash` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺可提现金额',
  `live_store_address` varchar(255) NOT NULL DEFAULT '' COMMENT '商家地址',
  `live_store_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '商铺电话',
  `shop_platform_commission_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '平台抽取佣金比率',
  `latitude_longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '线下店铺地图经纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺数据表';

-- ----------------------------
-- Records of ewei_shop
-- ----------------------------
INSERT INTO `ewei_shop` VALUES ('1', '官方旗舰店', '0', '1', '1', '', '1', '1', '2', '国家大剧院', '01000', '0', '', '0', '/uploads/common/1515604929.jpg', '/uploads/common/1515605239.jpg', '', '12354525458', '0', '0', '0.00', '0.00', '0.00', '', '', '0.00', '113.031239,23.052597');
INSERT INTO `ewei_shop` VALUES ('4', '优衣库', '0', '23', '1', '', '6', '2', '5', 'naiasdasdkalsjdj', '000302', '0', '', '0', '/uploads/common/1515597431.jpg', '/uploads/common/1515597471.jpg', '', '12938129239', '0', '0', '0.00', '0.00', '0.00', '', '', '0.00', '111.491085,40.138736');

-- ----------------------------
-- Table structure for ewei_shop_group
-- ----------------------------
DROP TABLE IF EXISTS `ewei_shop_group`;
CREATE TABLE `ewei_shop_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_sort` int(11) NOT NULL DEFAULT '1' COMMENT '分组排序号',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730 COMMENT='店铺分组表';

-- ----------------------------
-- Records of ewei_shop_group
-- ----------------------------
INSERT INTO `ewei_shop_group` VALUES ('1', '蔬菜水果', '1', '1510027210', '1510294312');
INSERT INTO `ewei_shop_group` VALUES ('2', '电子商务', '2', '1510294324', '1510294324');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='导航';

-- ----------------------------
-- Records of ewei_theme
-- ----------------------------
INSERT INTO `ewei_theme` VALUES ('1', '0', '积分商城', '', 'http://admin.ewei.com', '/uploads/common/1516629198.png', '_self', '积分商城', '0', null, '0', null, '0', '1');
INSERT INTO `ewei_theme` VALUES ('2', '0', '附近店铺', '', 'http://admin.ewei.com', '/uploads/common/1516629205.png', '_self', '附近店铺', '0', null, '0', null, '0', '1');

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
  `portrait` varchar(255) NOT NULL COMMENT '头像地址',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `extend` varchar(255) DEFAULT NULL,
  `rank_id` tinyint(1) NOT NULL DEFAULT '1' COMMENT '级别 关联用户级别表',
  `integral` int(10) DEFAULT '0' COMMENT '积分',
  `last_login_time` int(11) DEFAULT NULL,
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '最后登录IP',
  `address` int(11) DEFAULT '0' COMMENT '用户收货地址',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of ewei_user
-- ----------------------------
INSERT INTO `ewei_user` VALUES ('7', 'oc6_40GtOEWKF7_89G6Kvf7A9vaQ', '5a6613761a629', 'Ewei.', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJqIg5COnibM6dpicqBtz5NhibGonHqxZE3U1BFfWDXysl9nQyHQbxKPWMM3gUfRMwTJ19OeaWkgGFSw/0', null, null, '1', null, '1', '0', '1516639094', '127.0.0.1', null, null, '1516639094', '1516639094');

-- ----------------------------
-- Table structure for ewei_user_address
-- ----------------------------
DROP TABLE IF EXISTS `ewei_user_address`;
CREATE TABLE `ewei_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province_id` varchar(20) DEFAULT NULL COMMENT '省',
  `city_id` varchar(20) DEFAULT NULL COMMENT '市',
  `district_id` varchar(20) DEFAULT NULL COMMENT '区',
  `address` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `is_default` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否是默认',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='收货 地质';

-- ----------------------------
-- Records of ewei_user_address
-- ----------------------------
INSERT INTO `ewei_user_address` VALUES ('14', '贺宜伟', '17610226808', '2', '37', '403', '流行花园3区30108', '1', null, '7', null);

-- ----------------------------
-- Table structure for ewei_user_rank
-- ----------------------------
DROP TABLE IF EXISTS `ewei_user_rank`;
CREATE TABLE `ewei_user_rank` (
  `rank_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '级别名称',
  `rank_integral` int(10) unsigned NOT NULL COMMENT '积分要求',
  `rank_discount` float(5,2) unsigned NOT NULL COMMENT '级别优惠折扣',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='等级设置表';

-- ----------------------------
-- Records of ewei_user_rank
-- ----------------------------
INSERT INTO `ewei_user_rank` VALUES ('1', '普通会员', '100', '9.80');
