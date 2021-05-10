/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.193.128
 Source Server Type    : MySQL
 Source Server Version : 50704
 Source Host           : 192.168.193.128:3306
 Source Schema         : prize

 Target Server Type    : MySQL
 Target Server Version : 50704
 File Encoding         : 65001

 Date: 10/09/2019 17:13:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for card_game
-- ----------------------------
DROP TABLE IF EXISTS `card_game`;
CREATE TABLE `card_game`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动主题',
  `info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动简介',
  `starttime` datetime(0) NOT NULL COMMENT '开始时间',
  `endtime` datetime(0) NOT NULL COMMENT '结束时间',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '类型（1=概率类，2=随机类）',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态（0=新建，1=已加载）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of card_game
-- ----------------------------
INSERT INTO `card_game` VALUES (1, '10周年庆典', '三月的**，春暖花开，十岁的**，欢歌笑语。今天，在这个特殊的日子里，榜样精英高朋满座，新朋老友济济一堂。在这里，我怀着感恩的心，同十年来给予世纪**厚爱的各级领导，各位合作伙伴以及为公司付出辛勤劳动的全体员工一起，分享属于大家的光荣与梦想。', '2019-09-09 17:12:12', '2019-09-09 17:30:16', 2, 0);
INSERT INTO `card_game` VALUES (2, '年会抽奖第一轮', '年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮年会抽奖第一轮', '2019-09-05 10:12:21', '2019-08-29 00:00:00', 2, 0);
INSERT INTO `card_game` VALUES (3, '年会抽奖第二轮', '年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮年会抽奖第二轮', '2019-09-05 10:12:15', '2019-08-29 00:00:00', 2, 0);
INSERT INTO `card_game` VALUES (4, '2019抢房节', '2019抢房节2019抢房节2019抢房节2019抢房节2019抢房节2019抢房节2019抢房节2019抢房节2019抢房节2019抢房节', '2019-09-09 10:11:35', '2019-09-09 16:30:51', 2, 0);

-- ----------------------------
-- Table structure for card_game_product
-- ----------------------------
DROP TABLE IF EXISTS `card_game_product`;
CREATE TABLE `card_game_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gameid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '活动',
  `productid` int(11) NULL DEFAULT NULL COMMENT '奖品',
  `amount` smallint(6) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `game_id_constrant`(`gameid`) USING BTREE,
  CONSTRAINT `card_game_product_ibfk_1` FOREIGN KEY (`gameid`) REFERENCES `card_game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of card_game_product
-- ----------------------------
INSERT INTO `card_game_product` VALUES (1, 1, 2, 8);
INSERT INTO `card_game_product` VALUES (3, 2, 1, 3);
INSERT INTO `card_game_product` VALUES (4, 3, 1, 33);
INSERT INTO `card_game_product` VALUES (5, 1, 1, 6);
INSERT INTO `card_game_product` VALUES (6, 2, 1, 11);
INSERT INTO `card_game_product` VALUES (7, 1, 4, 10);
INSERT INTO `card_game_product` VALUES (8, 3, 3, 2);
INSERT INTO `card_game_product` VALUES (10, 4, 5, 5);
INSERT INTO `card_game_product` VALUES (11, 4, 6, 5);
INSERT INTO `card_game_product` VALUES (12, 4, 3, 6);
INSERT INTO `card_game_product` VALUES (13, 3, 1, 1);
INSERT INTO `card_game_product` VALUES (14, 4, 2, 4);
INSERT INTO `card_game_product` VALUES (15, 1, 3, 6);
INSERT INTO `card_game_product` VALUES (16, 1, 5, 5);
INSERT INTO `card_game_product` VALUES (17, 1, 6, 7);

-- ----------------------------
-- Table structure for card_game_rules
-- ----------------------------
DROP TABLE IF EXISTS `card_game_rules`;
CREATE TABLE `card_game_rules`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gameid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '活动id',
  `userlevel` smallint(6) NOT NULL COMMENT '会员等级',
  `enter_times` smallint(6) NOT NULL DEFAULT 0 COMMENT '可抽奖次数（0为不限）',
  `goal_times` smallint(6) NOT NULL DEFAULT 0 COMMENT '最大中奖次数（0为不限）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `gameid`(`gameid`, `userlevel`) USING BTREE,
  CONSTRAINT `card_game_rules_ibfk_1` FOREIGN KEY (`gameid`) REFERENCES `card_game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动策略' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of card_game_rules
-- ----------------------------
INSERT INTO `card_game_rules` VALUES (1, 1, 0, 1, 3);
INSERT INTO `card_game_rules` VALUES (2, 2, 2, 0, 0);
INSERT INTO `card_game_rules` VALUES (3, 3, 2, 0, 0);
INSERT INTO `card_game_rules` VALUES (7, 4, 1, 2, 0);
INSERT INTO `card_game_rules` VALUES (8, 4, 2, 31, 0);
INSERT INTO `card_game_rules` VALUES (9, 3, 3, 0, 0);
INSERT INTO `card_game_rules` VALUES (10, 3, 4, 0, 0);
INSERT INTO `card_game_rules` VALUES (17, 4, 3, 1, 2);
INSERT INTO `card_game_rules` VALUES (18, 4, 4, 0, 100);

-- ----------------------------
-- Table structure for card_product
-- ----------------------------
DROP TABLE IF EXISTS `card_product`;
CREATE TABLE `card_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品名称',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of card_product
-- ----------------------------
INSERT INTO `card_product` VALUES (1, 'iPhoneX一部', '/upload/images/aaa123.JPEG', 'iPhone X是美国Apple（苹果公司）于北京时间2017年9月13日凌晨1点，在Apple Park新总部的史蒂夫·乔布斯剧院会上发布的新机型。其中“X”是罗马数字“10”的意思，代表着苹果向iPhone问世十周年致敬。', 5000.00);
INSERT INTO `card_product` VALUES (2, '哈士奇一只', '/upload/images/QQ图片20190830102931.jpg', '西伯利亚雪橇犬是原始的古老犬种，主要生活在在西伯利亚东北部、格陵兰南部。哈士奇名字是源自其独特的嘶哑叫声 [1]  。哈士奇性格多变，有的极端胆小，也有的极端暴力，进入人类社会和家庭的哈士奇，都已经没有了这种极端的性格，比较温顺，是一种流行于全球的宠物犬。哈士奇、金毛犬与拉布拉多并列为三大无攻击性犬类 [2]  ，被世界各地人们广泛饲养，并在全球范围内有大量该犬种的赛事。', 1000.00);
INSERT INTO `card_product` VALUES (3, '二环内四合院一套', '/upload/images/1232qa.jpg', '四合院，又称四合房，是中国的一种传统合院式建筑，其格局为一个院子四面建有房屋，从四面将庭院合围在中间，故名四合院。\n四合院就是三合院前面又加门房的屋舍来封闭。若呈“口”字形的称为一进院落；“日”字形的称为二进院落；“目”字形的称为三进院落。 [1]  一般而言，大宅院中，第一进为门屋，第二进是厅堂，第三进或后进为私室或闺房，是妇女或眷属的活动空间，一般人不得随意进入，难怪古人有诗云：“庭院深深深几许”。庭院越深，越不得窥其堂奥。', 50000000.00);
INSERT INTO `card_product` VALUES (4, '劳斯莱斯一辆', '/upload/images/lslsi.jpg', '劳斯莱斯（Rolls-Royce）是超豪华汽车厂商，1906年成立于英国，公司创始人为Frederick Henry Royce（亨利·莱斯）和Charles Stewart Rolls（查理·劳斯）。Rolls-Royce出产的轿车是顶级汽车的杰出代表，以其豪华而享誉全球，是欧美汽车（omeiche）的主要代表之一。', 5000000.00);
INSERT INTO `card_product` VALUES (5, '美国商务办公室一套', '/upload/images/123d.jpg', '白宫（英语：The White House）也称为白屋，是美国总统的官邸和办公室。1902年被西奥多·罗斯福总统正式命名为“白宫”。白宫由美国国家公园管理局拥有', 1000.00);
INSERT INTO `card_product` VALUES (6, '地下车位一个', '/upload/images/asdasd2.jpg', '地库设计导则 - 说明 ? 本指引针对的项目类型仅为区域内GCT主流项目。 ? 本指引是在广深区域目前操作项目的前提下,根据各项目经验梳理出的小结.', 500.00);

-- ----------------------------
-- Table structure for card_user
-- ----------------------------
DROP TABLE IF EXISTS `card_user`;
CREATE TABLE `card_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `passwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `level` smallint(6) NOT NULL DEFAULT 0 COMMENT '等级',
  `createtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `updatetime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of card_user
-- ----------------------------
INSERT INTO `card_user` VALUES (2, 'sad', '-37e18d7262b3d09c90f9807633eb79d4', '1122211', '111', '1111', 1, '2019-09-02 16:41:31', '2019-09-02 22:32:19');
INSERT INTO `card_user` VALUES (3, 'qqq', '-4d359874b36c906fa047d0d8cc0ad681', '1', '1', '1', 3, '2019-09-02 18:10:14', '2019-09-02 18:10:14');
INSERT INTO `card_user` VALUES (4, '1', 'cc175b9c0f1b6a831c399e269772661', '1', '1', '1', 3, '2019-09-02 18:10:47', '2019-09-03 22:46:54');
INSERT INTO `card_user` VALUES (5, '2', '-3b35bdc75f46dc7df233af65908a7b65', '1222', '1', '1', 3, '2019-09-02 18:10:57', '2019-09-02 22:29:42');
INSERT INTO `card_user` VALUES (6, 'a', 'cc175b9c0f1b6a831c399e269772661', 'a', '12', '12', 4, '2019-09-09 13:01:02', '2019-09-09 13:01:02');

-- ----------------------------
-- Table structure for card_user_hit
-- ----------------------------
DROP TABLE IF EXISTS `card_user_hit`;
CREATE TABLE `card_user_hit`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gameid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '活动',
  `userid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户',
  `productid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '奖品',
  `hittime` datetime(0) NULL DEFAULT NULL COMMENT '中奖时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of card_user_hit
-- ----------------------------
INSERT INTO `card_user_hit` VALUES (1, 1, 6, 4, '2019-09-09 17:27:00');
INSERT INTO `card_user_hit` VALUES (2, 1, 6, 6, '2019-09-09 17:27:24');
INSERT INTO `card_user_hit` VALUES (3, 1, 6, 2, '2019-09-09 17:27:24');
INSERT INTO `card_user_hit` VALUES (4, 1, 6, 4, '2019-09-09 17:27:24');
INSERT INTO `card_user_hit` VALUES (5, 1, 6, 3, '2019-09-09 17:27:24');
INSERT INTO `card_user_hit` VALUES (6, 1, 6, 6, '2019-09-09 17:27:25');
INSERT INTO `card_user_hit` VALUES (7, 1, 6, 4, '2019-09-09 17:27:25');
INSERT INTO `card_user_hit` VALUES (8, 1, 6, 1, '2019-09-09 17:27:25');
INSERT INTO `card_user_hit` VALUES (9, 1, 6, 6, '2019-09-09 17:27:25');
INSERT INTO `card_user_hit` VALUES (10, 1, 6, 2, '2019-09-09 17:27:25');
INSERT INTO `card_user_hit` VALUES (11, 1, 6, 4, '2019-09-09 17:27:26');
INSERT INTO `card_user_hit` VALUES (12, 1, 6, 5, '2019-09-09 17:27:26');
INSERT INTO `card_user_hit` VALUES (13, 1, 6, 1, '2019-09-09 17:27:26');
INSERT INTO `card_user_hit` VALUES (14, 1, 6, 3, '2019-09-09 17:27:27');
INSERT INTO `card_user_hit` VALUES (15, 1, 6, 4, '2019-09-09 17:27:27');
INSERT INTO `card_user_hit` VALUES (16, 1, 6, 4, '2019-09-09 17:27:27');
INSERT INTO `card_user_hit` VALUES (17, 1, 6, 4, '2019-09-09 17:27:27');
INSERT INTO `card_user_hit` VALUES (18, 1, 6, 3, '2019-09-09 17:27:27');
INSERT INTO `card_user_hit` VALUES (19, 1, 6, 1, '2019-09-09 17:27:28');
INSERT INTO `card_user_hit` VALUES (20, 1, 6, 5, '2019-09-09 17:27:28');
INSERT INTO `card_user_hit` VALUES (21, 1, 6, 2, '2019-09-09 17:27:28');
INSERT INTO `card_user_hit` VALUES (22, 1, 6, 4, '2019-09-09 17:27:28');
INSERT INTO `card_user_hit` VALUES (23, 1, 6, 1, '2019-09-09 17:27:29');
INSERT INTO `card_user_hit` VALUES (24, 1, 6, 6, '2019-09-09 17:27:29');
INSERT INTO `card_user_hit` VALUES (25, 1, 6, 3, '2019-09-09 17:27:29');
INSERT INTO `card_user_hit` VALUES (26, 1, 6, 3, '2019-09-09 17:27:29');
INSERT INTO `card_user_hit` VALUES (27, 1, 6, 6, '2019-09-09 17:27:29');
INSERT INTO `card_user_hit` VALUES (28, 1, 6, 3, '2019-09-09 17:27:30');
INSERT INTO `card_user_hit` VALUES (29, 1, 6, 5, '2019-09-09 17:27:30');
INSERT INTO `card_user_hit` VALUES (30, 1, 6, 2, '2019-09-09 17:27:30');
INSERT INTO `card_user_hit` VALUES (31, 1, 6, 6, '2019-09-09 17:27:30');
INSERT INTO `card_user_hit` VALUES (32, 1, 6, 2, '2019-09-09 17:27:30');
INSERT INTO `card_user_hit` VALUES (33, 1, 6, 4, '2019-09-09 17:27:30');
INSERT INTO `card_user_hit` VALUES (34, 1, 6, 5, '2019-09-09 17:27:31');
INSERT INTO `card_user_hit` VALUES (35, 1, 6, 5, '2019-09-09 17:27:31');
INSERT INTO `card_user_hit` VALUES (36, 1, 6, 2, '2019-09-09 17:27:49');
INSERT INTO `card_user_hit` VALUES (37, 1, 6, 2, '2019-09-09 17:27:53');
INSERT INTO `card_user_hit` VALUES (38, 1, 6, 6, '2019-09-09 17:28:08');

-- ----------------------------
-- Table structure for common_file
-- ----------------------------
DROP TABLE IF EXISTS `common_file`;
CREATE TABLE `common_file`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '分类（1：图片，2：文件）',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `sys_user_id` int(11) NOT NULL COMMENT '系统用户',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of common_file
-- ----------------------------
INSERT INTO `common_file` VALUES (1, 1, 'P41025-1754072.jpg', 8, '2016-12-21 00:36:24');
INSERT INTO `common_file` VALUES (2, 1, 'P41025-154800.jpg', 8, '2016-12-21 00:40:14');
INSERT INTO `common_file` VALUES (3, 1, 'P41025-1753192.jpg', 8, '2016-12-21 00:41:00');
INSERT INTO `common_file` VALUES (4, 1, 'P41025-1758078.jpg', 8, '2016-12-21 00:45:39');
INSERT INTO `common_file` VALUES (5, 1, 'P41025-1757555.jpg', 8, '2016-12-21 00:45:42');
INSERT INTO `common_file` VALUES (6, 1, 'P41025-1757528.jpg', 8, '2016-12-21 00:45:45');
INSERT INTO `common_file` VALUES (7, 1, 'P41025-1754153.jpg', 8, '2016-12-21 00:45:48');
INSERT INTO `common_file` VALUES (8, 1, 'P41025-1757529.jpg', 8, '2016-12-21 00:54:42');
INSERT INTO `common_file` VALUES (9, 1, 'P41025-1754154.jpg', 8, '2016-12-21 00:55:20');
INSERT INTO `common_file` VALUES (10, 1, '微信截图_20190819145430.png', 1, '2019-08-22 13:30:05');
INSERT INTO `common_file` VALUES (11, 1, 'u=1605774217,834111375&fm=77&w_h=121_75&cs=3249942303,2001844009.jpg', 1, '2019-08-22 13:30:23');
INSERT INTO `common_file` VALUES (12, 1, 'QQ图片20190212181320.png', 1, '2019-08-22 13:33:02');
INSERT INTO `common_file` VALUES (13, 1, '97918bc0-3697-42c9-aa15-4c38f5eba3e4.gif', 1, '2019-08-22 13:47:48');
INSERT INTO `common_file` VALUES (14, 1, 'u=2572528570,3179480776&fm=58&w=121&h=140&img.JPEG', 1, '2019-08-24 03:15:19');
INSERT INTO `common_file` VALUES (15, 1, 'aaa123.JPEG', 1, '2019-08-24 03:16:14');
INSERT INTO `common_file` VALUES (16, 1, 'QQ图片20190830102931.jpg', 1, '2019-08-24 09:18:09');
INSERT INTO `common_file` VALUES (17, 1, '1232qa.jpg', 1, '2019-08-24 09:21:11');
INSERT INTO `common_file` VALUES (18, 1, 'lslsi.jpg', 1, '2019-08-24 09:22:55');
INSERT INTO `common_file` VALUES (19, 1, 'shxxsh.jpg', 1, '2019-08-24 09:27:16');
INSERT INTO `common_file` VALUES (20, 1, '1232qa1.jpg', 2, '2019-08-24 12:22:12');
INSERT INTO `common_file` VALUES (21, 1, '123d.jpg', 1, '2019-09-02 09:49:15');
INSERT INTO `common_file` VALUES (22, 1, 'asdasd.jpg', 1, '2019-09-02 09:50:36');
INSERT INTO `common_file` VALUES (23, 1, 'asdasd1.jpg', 1, '2019-09-02 13:40:14');
INSERT INTO `common_file` VALUES (24, 1, 'asdasd2.jpg', 1, '2019-09-02 13:41:19');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (6, '1', '/upload/images/a.jpeg', '2019-08-20 03:12:44');
INSERT INTO `images` VALUES (7, '123', '/upload/images/QQ图片20190212181320.png', '2019-08-22 13:30:25');
INSERT INTO `images` VALUES (8, '432', '/upload/images/QQ图片20190723093437.gif', '2019-08-22 13:47:49');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dict_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `dict_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '键',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '值',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'datarule_symbol', '=', '=', '2016-03-01 22:42:05');
INSERT INTO `sys_dict` VALUES (2, 'datarule_symbol', '>', '>', '2016-03-01 22:42:21');
INSERT INTO `sys_dict` VALUES (3, 'datarule_symbol', '<', '<', '2016-03-01 22:42:28');
INSERT INTO `sys_dict` VALUES (6, 'db_source', 'prize', '基本库', '2019-09-02 10:58:04');
INSERT INTO `sys_dict` VALUES (7, 'db_source', 'prize', '业务库', '2019-09-02 10:58:10');
INSERT INTO `sys_dict` VALUES (8, 'task_type', '1', 'url', '2017-03-12 23:29:43');
INSERT INTO `sys_dict` VALUES (9, 'task_type', '2', 'sql', '2017-03-12 23:29:51');
INSERT INTO `sys_dict` VALUES (10, 'task_statu', '1', '等待运行', '2017-03-12 23:31:55');
INSERT INTO `sys_dict` VALUES (11, 'task_statu', '2', '已停止', '2017-03-12 23:32:12');
INSERT INTO `sys_dict` VALUES (12, 'task_type', '3', 'ITask', '2017-03-18 14:47:57');
INSERT INTO `sys_dict` VALUES (13, 'task_statu', '3', '运行中', '2017-03-28 23:26:26');
INSERT INTO `sys_dict` VALUES (14, 'card_user_level', '0', '普通会员', '2019-08-23 05:07:19');
INSERT INTO `sys_dict` VALUES (15, 'card_user_level', '1', '一级会员', '2019-08-23 05:07:20');
INSERT INTO `sys_dict` VALUES (16, 'card_user_level', '2', '二级会员', '2019-08-23 05:07:22');
INSERT INTO `sys_dict` VALUES (17, 'card_user_level', '3', '三级会员', '2019-08-23 05:07:23');
INSERT INTO `sys_dict` VALUES (18, 'card_user_level', '4', '四级会员', '2019-08-24 03:29:25');
INSERT INTO `sys_dict` VALUES (19, 'card_game_type', '1', '幸运转盘', '2019-08-24 03:32:09');
INSERT INTO `sys_dict` VALUES (20, 'card_game_type', '2', '随机类', '2019-08-24 03:32:54');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `session_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'session id',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆ip',
  `is_success` int(11) NULL DEFAULT NULL COMMENT '是否成功（0：失败，1：成功）',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登陆日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1, 'zcurd', '50A8B32B93D45492ACC24A26A5E9B69A', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-21 22:22:59');
INSERT INTO `sys_login_log` VALUES (2, 'admin', '50A8B32B93D45492ACC24A26A5E9B69A', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-21 22:23:15');
INSERT INTO `sys_login_log` VALUES (3, 'admin', '50A8B32B93D45492ACC24A26A5E9B69A', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-21 22:23:18');
INSERT INTO `sys_login_log` VALUES (4, 'zcurd', 'DF865A7DD08C01E6242AAFEB828B1D3F', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-21 22:45:10');
INSERT INTO `sys_login_log` VALUES (5, 'admin', 'DF865A7DD08C01E6242AAFEB828B1D3F', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-21 22:45:19');
INSERT INTO `sys_login_log` VALUES (6, 'admin', 'CC20CEEE1AEF74D67A520C0EB9F72115', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-21 23:07:22');
INSERT INTO `sys_login_log` VALUES (7, 'admin', 'CC20CEEE1AEF74D67A520C0EB9F72115', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-21 23:07:56');
INSERT INTO `sys_login_log` VALUES (8, 'admin', 'AC39D4A15DA7B949B86E110589DB7892', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-22 00:00:49');
INSERT INTO `sys_login_log` VALUES (9, 'zcurd', 'AC39D4A15DA7B949B86E110589DB7892', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-22 00:06:22');
INSERT INTO `sys_login_log` VALUES (10, 'readonly', 'AC39D4A15DA7B949B86E110589DB7892', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-22 00:06:27');
INSERT INTO `sys_login_log` VALUES (11, 'readonly', 'AC39D4A15DA7B949B86E110589DB7892', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-22 00:06:31');
INSERT INTO `sys_login_log` VALUES (12, 'readonly', '89E8DD548643DB05F245AC5D72062E84', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-22 00:51:06');
INSERT INTO `sys_login_log` VALUES (13, 'admin', '89E8DD548643DB05F245AC5D72062E84', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-22 00:51:08');
INSERT INTO `sys_login_log` VALUES (14, 'readonly', '89E8DD548643DB05F245AC5D72062E84', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-22 00:54:27');
INSERT INTO `sys_login_log` VALUES (15, 'admin', '89E8DD548643DB05F245AC5D72062E84', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-22 00:55:59');
INSERT INTO `sys_login_log` VALUES (16, 'admin', 'C7B22B07087C74EA527705190589811E', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-22 21:16:59');
INSERT INTO `sys_login_log` VALUES (17, 'admin', 'C1375749FD2954770FA1E0857E7F626C', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-22 22:30:22');
INSERT INTO `sys_login_log` VALUES (18, 'admin', '48159648994CA229E678CBE66C21DE20', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-22 23:15:49');
INSERT INTO `sys_login_log` VALUES (19, 'admin', '3ECEF1EA4F3C479755589ACE80C9D6C7', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-22 23:44:32');
INSERT INTO `sys_login_log` VALUES (20, 'admin', '577EDCC0EBEA06E0E7C7E8FBCB304D6D', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-25 11:53:59');
INSERT INTO `sys_login_log` VALUES (21, 'admin', '577EDCC0EBEA06E0E7C7E8FBCB304D6D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 11:54:05');
INSERT INTO `sys_login_log` VALUES (22, 'admin', 'F998153DBB1B1F44E2AF32D15ABA002A', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 11:57:52');
INSERT INTO `sys_login_log` VALUES (23, 'admin', '9B7DB0C102C7A7E674388C4277C548D9', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 13:12:16');
INSERT INTO `sys_login_log` VALUES (24, 'admin', '0FC1CCAF310FB45BA23FC0E37AECC2A1', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 13:38:05');
INSERT INTO `sys_login_log` VALUES (25, 'admin', '02A21BEB9AC6C8A927ABDD1A2DF0034D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 17:32:43');
INSERT INTO `sys_login_log` VALUES (26, 'admin', 'EABB990E1CD8BABBE42E0C77E12FAC72', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 17:34:10');
INSERT INTO `sys_login_log` VALUES (27, 'admin', 'ADD2AAD9269752BD695BFF47FAB7B439', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 20:47:29');
INSERT INTO `sys_login_log` VALUES (28, 'zcurd', 'ADD2AAD9269752BD695BFF47FAB7B439', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 20:47:36');
INSERT INTO `sys_login_log` VALUES (29, 'readonly', 'ADD2AAD9269752BD695BFF47FAB7B439', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 20:47:42');
INSERT INTO `sys_login_log` VALUES (30, 'admin', '98116782DFF2772AD957CBAEE3AA422C', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-25 20:48:35');
INSERT INTO `sys_login_log` VALUES (31, 'admin', '98116782DFF2772AD957CBAEE3AA422C', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 20:48:39');
INSERT INTO `sys_login_log` VALUES (32, 'readonly', 'ADD2AAD9269752BD695BFF47FAB7B439', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 20:50:09');
INSERT INTO `sys_login_log` VALUES (33, 'readonly', 'ADD2AAD9269752BD695BFF47FAB7B439', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 20:54:04');
INSERT INTO `sys_login_log` VALUES (34, 'admin', 'C9A988A5D4B25CA6CE9E3399CFE5540F', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 20:55:42');
INSERT INTO `sys_login_log` VALUES (35, 'readonly', 'C9A988A5D4B25CA6CE9E3399CFE5540F', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 20:55:45');
INSERT INTO `sys_login_log` VALUES (36, 'readonly', 'C9A988A5D4B25CA6CE9E3399CFE5540F', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 20:56:18');
INSERT INTO `sys_login_log` VALUES (37, 'admin', 'CC3AC091E022BF7F599D6C3299C65B2E', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-25 20:56:29');
INSERT INTO `sys_login_log` VALUES (38, 'admin', 'CC3AC091E022BF7F599D6C3299C65B2E', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-25 20:56:30');
INSERT INTO `sys_login_log` VALUES (39, 'admin', 'CC3AC091E022BF7F599D6C3299C65B2E', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 20:56:36');
INSERT INTO `sys_login_log` VALUES (40, 'readonly', '13F689DB00C134529D5B3D0322AE6CEC', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 21:45:49');
INSERT INTO `sys_login_log` VALUES (41, 'admin', 'BC4CB12B1E5DC328A4648B50D7234382', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 22:21:30');
INSERT INTO `sys_login_log` VALUES (42, 'admin', '499909795D16FAD7EAE1C0EAAE0841E8', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 22:23:50');
INSERT INTO `sys_login_log` VALUES (43, 'readonly', '499909795D16FAD7EAE1C0EAAE0841E8', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 22:26:10');
INSERT INTO `sys_login_log` VALUES (44, 'readonly', '58C6F718A57276A2FA2AF427C114944C', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 23:32:19');
INSERT INTO `sys_login_log` VALUES (45, 'readonly', '58C6F718A57276A2FA2AF427C114944C', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 23:33:28');
INSERT INTO `sys_login_log` VALUES (46, 'admin', 'EA1B633896D7E46F6605DE9967919D14', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 23:34:54');
INSERT INTO `sys_login_log` VALUES (47, 'readonly', 'EA1B633896D7E46F6605DE9967919D14', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 23:35:01');
INSERT INTO `sys_login_log` VALUES (48, 'admin', '166E453CF53485E8F47F2FCB65693D57', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-25 23:35:26');
INSERT INTO `sys_login_log` VALUES (49, 'admin', '166E453CF53485E8F47F2FCB65693D57', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 23:35:30');
INSERT INTO `sys_login_log` VALUES (50, 'admin', '166E453CF53485E8F47F2FCB65693D57', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-25 23:38:58');
INSERT INTO `sys_login_log` VALUES (51, 'admin', '166E453CF53485E8F47F2FCB65693D57', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-25 23:39:06');
INSERT INTO `sys_login_log` VALUES (52, 'admin', '57D191BEFF6ABBED2971E20591DC6B54', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-27 23:33:52');
INSERT INTO `sys_login_log` VALUES (53, 'readonly', '57D191BEFF6ABBED2971E20591DC6B54', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-27 23:34:11');
INSERT INTO `sys_login_log` VALUES (54, 'readonly', '0948A6C3A86C3F28848C287FB4DB819E', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-27 23:50:07');
INSERT INTO `sys_login_log` VALUES (55, 'readonly', '58EDF7CD86E9216C6BCCC56C5A95D1CB', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-28 00:03:15');
INSERT INTO `sys_login_log` VALUES (56, 'admin', '6E703FAF92B0203B1D26DC8507C46A55', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-28 00:03:52');
INSERT INTO `sys_login_log` VALUES (57, 'admin', '6E703FAF92B0203B1D26DC8507C46A55', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-28 00:03:57');
INSERT INTO `sys_login_log` VALUES (58, 'readonly', '58EDF7CD86E9216C6BCCC56C5A95D1CB', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-28 00:04:43');
INSERT INTO `sys_login_log` VALUES (59, 'zhong', '58EDF7CD86E9216C6BCCC56C5A95D1CB', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-28 00:07:22');
INSERT INTO `sys_login_log` VALUES (60, 'readonly', '58EDF7CD86E9216C6BCCC56C5A95D1CB', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-28 00:14:55');
INSERT INTO `sys_login_log` VALUES (61, 'readonly', 'A4E550982F91E4FC9C6114979BFEE2D1', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-28 00:18:34');
INSERT INTO `sys_login_log` VALUES (62, 'admin', 'FB7CCD177314018CB7C0B374E3729F0B', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-28 00:18:55');
INSERT INTO `sys_login_log` VALUES (63, 'admin', 'FB7CCD177314018CB7C0B374E3729F0B', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-28 00:18:58');
INSERT INTO `sys_login_log` VALUES (64, 'readonly', 'FB35764239C0F80BE15C21E687921CB6', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-28 23:21:02');
INSERT INTO `sys_login_log` VALUES (65, 'admin', '29FF7673B787A4EE91BB6BD127C220C6', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-28 23:30:09');
INSERT INTO `sys_login_log` VALUES (66, 'admin', '29FF7673B787A4EE91BB6BD127C220C6', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-28 23:30:12');
INSERT INTO `sys_login_log` VALUES (67, 'readonly', '1557024319832CF0424798722D15A576', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-31 00:09:11');
INSERT INTO `sys_login_log` VALUES (68, 'admin', '2CF7CCD22345243EECC50D70544AB262', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-31 00:09:40');
INSERT INTO `sys_login_log` VALUES (69, 'admin', 'E7C920C3B1FFBD3AAF4A0DC9C290D64E', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-31 00:38:30');
INSERT INTO `sys_login_log` VALUES (70, 'readonly', '23E6CDAF805B8C07677B9ACC4657E93C', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-31 01:37:52');
INSERT INTO `sys_login_log` VALUES (71, 'readonly', '39CA14CD28180D2441A8251788EF4407', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-31 01:48:26');
INSERT INTO `sys_login_log` VALUES (72, 'admin', 'B903AD467328D2D6F2904E83FE029565', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-03-31 23:46:26');
INSERT INTO `sys_login_log` VALUES (73, 'admin', 'B903AD467328D2D6F2904E83FE029565', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-31 23:46:28');
INSERT INTO `sys_login_log` VALUES (74, 'readonly', '0069CC27F3289E7A5CCA1FBDE98ECAD0', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-31 23:46:36');
INSERT INTO `sys_login_log` VALUES (75, 'admin', 'E96910F77EE3E203B89F0CC283E011C5', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-31 23:58:02');
INSERT INTO `sys_login_log` VALUES (76, 'readonly', '84495C1FCB276AC4B3D56D2517638214', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-03-31 23:59:40');
INSERT INTO `sys_login_log` VALUES (77, 'admin', 'E96910F77EE3E203B89F0CC283E011C5', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-04-01 00:10:15');
INSERT INTO `sys_login_log` VALUES (78, 'admin', 'F291B80CBB3ABDF4A6925F51E0C92256', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-04-03 22:48:15');
INSERT INTO `sys_login_log` VALUES (79, 'admin', '677F6446BF98FFDF184A2DA5535C3B09', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-04-03 23:03:37');
INSERT INTO `sys_login_log` VALUES (80, 'admin', '365377460496EEA24FD15EED0F879DB3', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-04-03 23:47:20');
INSERT INTO `sys_login_log` VALUES (81, 'admin', '4E7C7246AC2CAF48640D47B8A35AE030', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-04-07 22:36:02');
INSERT INTO `sys_login_log` VALUES (82, 'admin', '13C89526D7C1F4ADD85D9BEDFE039F4A', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-02 15:41:15');
INSERT INTO `sys_login_log` VALUES (83, 'admin', '2CCAC6DC9E60E716F634834854858DDC', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-02 17:10:54');
INSERT INTO `sys_login_log` VALUES (84, 'readonly', '2CCAC6DC9E60E716F634834854858DDC', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-02 17:11:07');
INSERT INTO `sys_login_log` VALUES (85, 'readonly', 'A372F03D2A492A1B6D503B374490097E', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-02 17:22:13');
INSERT INTO `sys_login_log` VALUES (86, 'admin', 'D9695CBE8682B65751E69C964EF1D400', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-02 17:49:17');
INSERT INTO `sys_login_log` VALUES (87, 'admin', 'D9695CBE8682B65751E69C964EF1D400', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-02 17:49:48');
INSERT INTO `sys_login_log` VALUES (88, 'admin', 'D9695CBE8682B65751E69C964EF1D400', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-02 17:49:53');
INSERT INTO `sys_login_log` VALUES (89, 'admin1', 'F0031EA951F3178B8327C7566BEDADC4', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-06-03 10:05:21');
INSERT INTO `sys_login_log` VALUES (90, 'admin1', 'F0031EA951F3178B8327C7566BEDADC4', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-06-03 10:05:21');
INSERT INTO `sys_login_log` VALUES (91, 'admin1', 'F0031EA951F3178B8327C7566BEDADC4', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-06-03 10:05:21');
INSERT INTO `sys_login_log` VALUES (92, 'admin1', 'F0031EA951F3178B8327C7566BEDADC4', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-06-03 10:05:21');
INSERT INTO `sys_login_log` VALUES (93, 'admin1', 'F0031EA951F3178B8327C7566BEDADC4', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2018-06-03 10:05:21');
INSERT INTO `sys_login_log` VALUES (94, 'admin1', 'F0031EA951F3178B8327C7566BEDADC4', '0:0:0:0:0:0:0:1', 0, '验证码错误！', '2018-06-03 10:05:22');
INSERT INTO `sys_login_log` VALUES (95, 'admin', 'F0031EA951F3178B8327C7566BEDADC4', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-03 10:05:28');
INSERT INTO `sys_login_log` VALUES (96, 'zcurd', 'F0031EA951F3178B8327C7566BEDADC4', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-03 10:06:21');
INSERT INTO `sys_login_log` VALUES (97, 'admin', '118DCE9B27302502E75EC5A70E41DFD9', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-03 10:13:43');
INSERT INTO `sys_login_log` VALUES (98, 'admin', '55F511F25BBC6C6341692B4578C3C104', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-03 10:42:44');
INSERT INTO `sys_login_log` VALUES (99, 'admin', '63056DCDE2380ED167680B832BB443BA', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2018-06-03 11:29:15');
INSERT INTO `sys_login_log` VALUES (100, 'admin', '7B08499E43B2E2746993E6D96911604A', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-22 15:46:22');
INSERT INTO `sys_login_log` VALUES (101, 'admin', 'B2609D69E6028F652C27AA36811A1DD4', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-22 17:37:51');
INSERT INTO `sys_login_log` VALUES (102, 'admin', 'FCCB613C168D11B71EB6FD2CA497F0C8', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-22 17:46:21');
INSERT INTO `sys_login_log` VALUES (103, 'admin', 'CF98A4710F0394055C9B64E747621FF9', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-26 16:26:15');
INSERT INTO `sys_login_log` VALUES (104, 'admin', '7B099C7C2A94172D3BA866FEC2660660', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-26 16:47:29');
INSERT INTO `sys_login_log` VALUES (105, 'admin', '6FB4366CC2ED31E1681F436A95BBCA15', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-26 16:50:42');
INSERT INTO `sys_login_log` VALUES (106, 'admin', '6FB4366CC2ED31E1681F436A95BBCA15', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-26 16:52:50');
INSERT INTO `sys_login_log` VALUES (107, 'admin', '6FB4366CC2ED31E1681F436A95BBCA15', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-26 17:07:07');
INSERT INTO `sys_login_log` VALUES (108, 'admin', 'D795C45C5CF427FC2E53096AF3B03FBC', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-27 08:42:44');
INSERT INTO `sys_login_log` VALUES (109, 'admin', 'FF2C6591058A3DE4C89BFBB946E70765', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-27 10:33:30');
INSERT INTO `sys_login_log` VALUES (110, 'admin', 'F3105968565C894349B815AD90887240', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-27 17:07:01');
INSERT INTO `sys_login_log` VALUES (111, 'admin', 'FFBD85773903862972F44BD94276F159', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 11:01:46');
INSERT INTO `sys_login_log` VALUES (112, 'admin', '498B9217F395B0A2C45EC6FE51B2E60A', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 13:37:10');
INSERT INTO `sys_login_log` VALUES (113, 'admin', 'FC11281878FDC9A49D7DDB5449C476F2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 13:41:36');
INSERT INTO `sys_login_log` VALUES (114, 'admin', 'FC11281878FDC9A49D7DDB5449C476F2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 13:42:38');
INSERT INTO `sys_login_log` VALUES (115, 'admin', 'FC11281878FDC9A49D7DDB5449C476F2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 13:46:22');
INSERT INTO `sys_login_log` VALUES (116, 'admin', 'FC11281878FDC9A49D7DDB5449C476F2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 13:47:05');
INSERT INTO `sys_login_log` VALUES (117, 'test', 'FC11281878FDC9A49D7DDB5449C476F2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 13:48:54');
INSERT INTO `sys_login_log` VALUES (118, 'admin', 'FC11281878FDC9A49D7DDB5449C476F2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 13:49:20');
INSERT INTO `sys_login_log` VALUES (119, 'zcurd', 'FC11281878FDC9A49D7DDB5449C476F2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 13:49:59');
INSERT INTO `sys_login_log` VALUES (120, 'zcurd', 'FC11281878FDC9A49D7DDB5449C476F2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 14:08:09');
INSERT INTO `sys_login_log` VALUES (121, 'admin', 'FC11281878FDC9A49D7DDB5449C476F2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 14:08:14');
INSERT INTO `sys_login_log` VALUES (122, 'zcurd', 'FC11281878FDC9A49D7DDB5449C476F2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-28 14:08:26');
INSERT INTO `sys_login_log` VALUES (123, 'admin', '2CFDFBB4A04A756A8F5A870B8C0368D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 09:19:07');
INSERT INTO `sys_login_log` VALUES (124, 'admin', '6AB2C41AE1EF63A527A8617A6E0435A9', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 14:41:06');
INSERT INTO `sys_login_log` VALUES (125, 'admin', '6AB2C41AE1EF63A527A8617A6E0435A9', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 14:42:17');
INSERT INTO `sys_login_log` VALUES (126, 'admin', '0DDD0710E71E7543BD8989EEF2BEEA65', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 14:42:41');
INSERT INTO `sys_login_log` VALUES (127, 'zcurd', '0DDD0710E71E7543BD8989EEF2BEEA65', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 14:45:59');
INSERT INTO `sys_login_log` VALUES (128, 'admin', '0DDD0710E71E7543BD8989EEF2BEEA65', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 14:47:04');
INSERT INTO `sys_login_log` VALUES (129, 'zcurd', '0DDD0710E71E7543BD8989EEF2BEEA65', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 14:47:20');
INSERT INTO `sys_login_log` VALUES (130, 'zcurd', '0DDD0710E71E7543BD8989EEF2BEEA65', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 15:23:45');
INSERT INTO `sys_login_log` VALUES (131, 'zcurd', '0DDD0710E71E7543BD8989EEF2BEEA65', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 15:23:48');
INSERT INTO `sys_login_log` VALUES (132, 'zcurd', '0DDD0710E71E7543BD8989EEF2BEEA65', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 15:23:55');
INSERT INTO `sys_login_log` VALUES (133, 'zcurd', '0DDD0710E71E7543BD8989EEF2BEEA65', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 15:26:31');
INSERT INTO `sys_login_log` VALUES (134, 'admin', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 17:28:18');
INSERT INTO `sys_login_log` VALUES (135, 'zcurd', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 17:37:59');
INSERT INTO `sys_login_log` VALUES (136, 'zcurd', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 17:40:47');
INSERT INTO `sys_login_log` VALUES (137, 'admin', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 17:40:52');
INSERT INTO `sys_login_log` VALUES (138, 'zcurd', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 17:44:20');
INSERT INTO `sys_login_log` VALUES (139, 'admin', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 17:44:57');
INSERT INTO `sys_login_log` VALUES (140, 'zcurd', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 17:52:11');
INSERT INTO `sys_login_log` VALUES (141, 'admin', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 17:53:54');
INSERT INTO `sys_login_log` VALUES (142, 'zcurd', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 19:36:36');
INSERT INTO `sys_login_log` VALUES (143, 'admin', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 19:44:27');
INSERT INTO `sys_login_log` VALUES (144, 'zcurd', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 19:45:12');
INSERT INTO `sys_login_log` VALUES (145, 'admin', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 19:45:37');
INSERT INTO `sys_login_log` VALUES (146, 'zcurd', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 19:46:03');
INSERT INTO `sys_login_log` VALUES (147, 'admin', '7B0BBC2E46530F50539614B0392406D2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-29 19:46:20');
INSERT INTO `sys_login_log` VALUES (148, 'admin', 'D89E13EFAF021E76AC76DB05BD2CEE10', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 09:40:39');
INSERT INTO `sys_login_log` VALUES (149, 'admin', 'D620269F26EB869B4F2F14942454A12E', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 11:34:48');
INSERT INTO `sys_login_log` VALUES (150, 'zcurd', 'D620269F26EB869B4F2F14942454A12E', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 11:34:59');
INSERT INTO `sys_login_log` VALUES (151, 'zcurd', '6C142FB5FB1D982D9A3FAA18A4C4B7FD', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 13:52:22');
INSERT INTO `sys_login_log` VALUES (152, 'zcurd', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 14:37:28');
INSERT INTO `sys_login_log` VALUES (153, 'zcurd', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 14:44:20');
INSERT INTO `sys_login_log` VALUES (154, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 14:45:22');
INSERT INTO `sys_login_log` VALUES (155, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:11');
INSERT INTO `sys_login_log` VALUES (156, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:18');
INSERT INTO `sys_login_log` VALUES (157, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:19');
INSERT INTO `sys_login_log` VALUES (158, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:20');
INSERT INTO `sys_login_log` VALUES (159, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:21');
INSERT INTO `sys_login_log` VALUES (160, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:21');
INSERT INTO `sys_login_log` VALUES (161, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:21');
INSERT INTO `sys_login_log` VALUES (162, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:22');
INSERT INTO `sys_login_log` VALUES (163, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:26');
INSERT INTO `sys_login_log` VALUES (164, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:27');
INSERT INTO `sys_login_log` VALUES (165, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:28');
INSERT INTO `sys_login_log` VALUES (166, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:28');
INSERT INTO `sys_login_log` VALUES (167, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:28');
INSERT INTO `sys_login_log` VALUES (168, 'admin', '2333C22B724A221A420AA052FDC59E8D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:33:28');
INSERT INTO `sys_login_log` VALUES (169, 'admin', '073F034B4B731AAF8CC6170653020B91', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:39:06');
INSERT INTO `sys_login_log` VALUES (170, 'admin', '76811415549B14EE78CECCCC14419960', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:40:23');
INSERT INTO `sys_login_log` VALUES (171, 'admin', 'E889205DA27A1F0F6CE282A847CE54A6', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 15:44:20');
INSERT INTO `sys_login_log` VALUES (172, 'admin', '5113E7627F04895466A7FE37BAD93605', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 16:55:20');
INSERT INTO `sys_login_log` VALUES (173, 'admin', '68DA2AEA19899AFB83E05BEEE5F24C3D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 17:19:50');
INSERT INTO `sys_login_log` VALUES (174, 'admin', 'BB2E8A21CFA70CDBB21A5894F89DBCCA', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 17:38:11');
INSERT INTO `sys_login_log` VALUES (175, 'admin', '82786F304C9861781911CB95F18DB10F', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-08-30 17:47:48');
INSERT INTO `sys_login_log` VALUES (176, 'admin', '3320B33F8B230E58F673800246DBBBC6', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 09:18:39');
INSERT INTO `sys_login_log` VALUES (177, 'admin', 'F6A6B3553BBEF2DEE964A11F41CB6E29', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 09:41:04');
INSERT INTO `sys_login_log` VALUES (178, 'zcurd', 'F6A6B3553BBEF2DEE964A11F41CB6E29', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 09:54:11');
INSERT INTO `sys_login_log` VALUES (179, 'admin', 'F6A6B3553BBEF2DEE964A11F41CB6E29', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 09:55:06');
INSERT INTO `sys_login_log` VALUES (180, 'zcurd', '5F6B08E2623D4E2E42469E55094BB59D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:02:54');
INSERT INTO `sys_login_log` VALUES (181, 'zcurd', '5F6B08E2623D4E2E42469E55094BB59D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:04:37');
INSERT INTO `sys_login_log` VALUES (182, 'zcurd', '5F6B08E2623D4E2E42469E55094BB59D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:06:15');
INSERT INTO `sys_login_log` VALUES (183, 'zcurd', '5F6B08E2623D4E2E42469E55094BB59D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:07:09');
INSERT INTO `sys_login_log` VALUES (184, 'zcurd', '5F6B08E2623D4E2E42469E55094BB59D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:09:34');
INSERT INTO `sys_login_log` VALUES (185, 'zcurd', 'DC474C516D40E7623FCE23DDDFCE3AFF', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:23:55');
INSERT INTO `sys_login_log` VALUES (186, 'admin', '875DD0CDA1532425B931514C79A3812F', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:30:56');
INSERT INTO `sys_login_log` VALUES (187, 'admin', '5004634A7D88E632850A1A9E05D7B209', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:38:23');
INSERT INTO `sys_login_log` VALUES (188, 'zcurd', 'C1A8F55606BCDCF55AA5A61865C2A16D', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:39:33');
INSERT INTO `sys_login_log` VALUES (189, 'admin', '2689BFCB1500541FBBB3DE1D0187EC80', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:39:38');
INSERT INTO `sys_login_log` VALUES (190, 'admin', '6329F6B98000567F3F372EE06739902A', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 10:53:41');
INSERT INTO `sys_login_log` VALUES (191, 'admin', '714EBAC964641EB5A24B3AB612C7C73B', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 11:02:01');
INSERT INTO `sys_login_log` VALUES (192, 'admin', 'A9D27393F4C8D89CBB357CA0012AA139', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 11:05:21');
INSERT INTO `sys_login_log` VALUES (193, 'admin', '995DE3D360A046003B287BA6541FC726', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 11:18:12');
INSERT INTO `sys_login_log` VALUES (194, 'zcurd', 'D32320C91B444F51B5ADA3C908C966A3', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 11:19:06');
INSERT INTO `sys_login_log` VALUES (195, 'admin', '906AA79842CB7A5596D10E65254E7D23', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 11:30:30');
INSERT INTO `sys_login_log` VALUES (196, 'admin', 'C250086F193C42C93E5D86B91094CA0A', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 11:36:42');
INSERT INTO `sys_login_log` VALUES (197, 'zcurd', 'CF4254162745F8BAE895A2F38382213A', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 13:36:24');
INSERT INTO `sys_login_log` VALUES (198, 'admin', '6EAF43EAA2EB315E5489015EEFD8DD84', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 13:46:15');
INSERT INTO `sys_login_log` VALUES (199, 'admin', 'B86859AEB11F4BD46AA504CE9AA8FEAC', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 13:48:32');
INSERT INTO `sys_login_log` VALUES (200, 'admin', '059B0596E99DA9B977A15CE87F5982ED', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 13:52:36');
INSERT INTO `sys_login_log` VALUES (201, 'zcurd', '4813FC895255DC6DD29CCD242A40F5C4', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 14:27:31');
INSERT INTO `sys_login_log` VALUES (202, 'zcurd', '5E34B4A423AA1D9F5D9C121762AE14A5', '172.16.43.171', 0, '用户名或密码错误！', '2019-09-02 14:30:15');
INSERT INTO `sys_login_log` VALUES (203, 'zcurd', '5E34B4A423AA1D9F5D9C121762AE14A5', '172.16.43.171', 1, '登陆成功', '2019-09-02 14:30:20');
INSERT INTO `sys_login_log` VALUES (204, 'zcurd', '5E34B4A423AA1D9F5D9C121762AE14A5', '172.16.43.171', 0, '用户名或密码错误！', '2019-09-02 14:30:39');
INSERT INTO `sys_login_log` VALUES (205, 'zcurd', '5E34B4A423AA1D9F5D9C121762AE14A5', '172.16.43.171', 0, '用户名或密码错误！', '2019-09-02 14:30:40');
INSERT INTO `sys_login_log` VALUES (206, 'zcurd', '5E34B4A423AA1D9F5D9C121762AE14A5', '172.16.43.171', 0, '用户名或密码错误！', '2019-09-02 14:30:42');
INSERT INTO `sys_login_log` VALUES (207, 'zcurd', '5E34B4A423AA1D9F5D9C121762AE14A5', '172.16.43.171', 0, '用户名或密码错误！', '2019-09-02 14:30:43');
INSERT INTO `sys_login_log` VALUES (208, 'zcurd', '5E34B4A423AA1D9F5D9C121762AE14A5', '172.16.43.171', 0, '验证码错误！', '2019-09-02 14:30:44');
INSERT INTO `sys_login_log` VALUES (209, 'test', '5E34B4A423AA1D9F5D9C121762AE14A5', '172.16.43.171', 0, '验证码错误！', '2019-09-02 14:31:24');
INSERT INTO `sys_login_log` VALUES (210, 'test', '5E34B4A423AA1D9F5D9C121762AE14A5', '172.16.43.171', 1, '登陆成功', '2019-09-02 14:31:30');
INSERT INTO `sys_login_log` VALUES (211, 'test', '5E34B4A423AA1D9F5D9C121762AE14A5', '172.16.43.171', 1, '登陆成功', '2019-09-02 14:33:18');
INSERT INTO `sys_login_log` VALUES (212, 'zcurd', 'D1B08BC035CFA7C6AE9447C03FE337E8', '172.16.43.164', 1, '登陆成功', '2019-09-02 14:36:25');
INSERT INTO `sys_login_log` VALUES (213, 'admin', 'EE19BFFF6042951C1EFBE0E07652F87C', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 15:52:49');
INSERT INTO `sys_login_log` VALUES (214, 'admin', '3A92D87798847CD551FD5620144E8ECB', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 18:08:06');
INSERT INTO `sys_login_log` VALUES (215, 'admin', '72E5C189FFF2781A9C1FAC896850C441', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 18:09:16');
INSERT INTO `sys_login_log` VALUES (216, 'admin', '1A98C0C485B1AA7F04081F5EB49F9003', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-02 18:15:03');
INSERT INTO `sys_login_log` VALUES (217, 'admin', '31CDCA05425E458B16A3B479566684F5', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-03 09:05:15');
INSERT INTO `sys_login_log` VALUES (218, 'admin', 'CBA2F852694702C9762940F5D237C28F', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-03 11:01:34');
INSERT INTO `sys_login_log` VALUES (219, 'admin', 'BAC77418F57835DA0840E5CCC7D31059', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-03 13:47:52');
INSERT INTO `sys_login_log` VALUES (220, 'zcurd', '1E7B481553692F5648329A752E12BF6E', '172.16.43.171', 1, '登陆成功', '2019-09-03 14:55:45');
INSERT INTO `sys_login_log` VALUES (221, 'zcurd', '1E7B481553692F5648329A752E12BF6E', '172.16.43.171', 1, '登陆成功', '2019-09-03 15:02:18');
INSERT INTO `sys_login_log` VALUES (222, 'zcurd', '1E7B481553692F5648329A752E12BF6E', '172.16.43.171', 1, '登陆成功', '2019-09-03 15:05:02');
INSERT INTO `sys_login_log` VALUES (223, 'zcurd', '9AA5AA9A8448464F4801D21501E5A4AA', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-04 09:31:36');
INSERT INTO `sys_login_log` VALUES (224, 'zcurd', '4CE13FACF153B9DE51C959C58056E427', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-05 16:09:31');
INSERT INTO `sys_login_log` VALUES (225, 'zcurd', '3D367645125931E1999B46F7574F5608', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-06 08:57:22');
INSERT INTO `sys_login_log` VALUES (226, 'zcurd', '99146D0C5D85CE2835696973D4816638', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-06 11:19:15');
INSERT INTO `sys_login_log` VALUES (227, 'zcurd', '59D75ADCC263E78FACEFFBC4D40C78B3', '172.16.43.164', 1, '登陆成功', '2019-09-06 14:09:51');
INSERT INTO `sys_login_log` VALUES (228, 'zcurd', 'C62A4604FBA4F6EA392E390D3D210B8B', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-06 14:10:11');
INSERT INTO `sys_login_log` VALUES (229, 'admin', 'C62A4604FBA4F6EA392E390D3D210B8B', '0:0:0:0:0:0:0:1', 0, '用户名或密码错误！', '2019-09-06 14:45:52');
INSERT INTO `sys_login_log` VALUES (230, 'admin', 'C62A4604FBA4F6EA392E390D3D210B8B', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-06 14:45:57');
INSERT INTO `sys_login_log` VALUES (231, 'zcurd', 'C62A4604FBA4F6EA392E390D3D210B8B', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-06 14:47:33');
INSERT INTO `sys_login_log` VALUES (232, 'zcurd', 'CDBF02148722F9A8011DF867B4C79B77', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-06 15:21:55');
INSERT INTO `sys_login_log` VALUES (233, 'zcurd', '24927572F08E1D65BEDD5DAB67B31FF6', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-09 14:07:56');
INSERT INTO `sys_login_log` VALUES (234, 'admin', '24927572F08E1D65BEDD5DAB67B31FF6', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-09 14:35:04');
INSERT INTO `sys_login_log` VALUES (235, 'zcurd', '46CB3669A24A54FA64493C84AAD0C700', '172.16.43.164', 1, '登陆成功', '2019-09-09 17:30:09');
INSERT INTO `sys_login_log` VALUES (236, 'zcurd', '3046B93A82FF00E15811CB9AD8DC0526', '172.16.43.164', 1, '登陆成功', '2019-09-09 17:34:48');
INSERT INTO `sys_login_log` VALUES (237, 'admin', 'AC1C1CB3F3484495EA424027D04A208A', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-09 17:51:05');
INSERT INTO `sys_login_log` VALUES (238, 'zcurd', '5043048660396F8FA1CC14673269D760', '172.16.43.164', 1, '登陆成功', '2019-09-10 09:17:58');
INSERT INTO `sys_login_log` VALUES (239, 'zcurd', 'DDBF13A4D86AFF2988461BADBBC24496', '172.16.43.164', 1, '登陆成功', '2019-09-10 11:20:21');
INSERT INTO `sys_login_log` VALUES (240, 'admin', '2F1B525BD03CD9BFAF068CBB615FFAE2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-10 11:27:08');
INSERT INTO `sys_login_log` VALUES (241, 'zcurd', '2F1B525BD03CD9BFAF068CBB615FFAE2', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-10 11:28:20');
INSERT INTO `sys_login_log` VALUES (242, 'zcurd', 'B6746A9B234AF5370E2FD475B97470A1', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-10 14:17:29');
INSERT INTO `sys_login_log` VALUES (243, 'admin', 'B6746A9B234AF5370E2FD475B97470A1', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-10 14:40:50');
INSERT INTO `sys_login_log` VALUES (244, 'admin', '91DDF2F5600B0278BCBB62EBB45F0C5F', '0:0:0:0:0:0:0:1', 1, '登陆成功', '2019-09-10 15:16:21');
INSERT INTO `sys_login_log` VALUES (245, 'zcurd', '60EBFF38CA0C683511C3C550943DE8F7', '172.16.43.164', 1, '登陆成功', '2019-09-10 16:21:27');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '所属菜单',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 'z', 0, 'glyphicon-cog', 90, '2016-01-06 19:37:31');
INSERT INTO `sys_menu` VALUES (2, '在线表单', '/zcurdHead/listPage', 1, 'glyphicon-cloud', 1, '2016-01-07 21:41:21');
INSERT INTO `sys_menu` VALUES (3, '菜单管理', '/menu/list', 1, 'glyphicon-menu-hamburger', 5, '2016-01-06 19:37:38');
INSERT INTO `sys_menu` VALUES (4, '字典管理', '/zcurd/7/listPage', 1, 'glyphicon-book', 6, '2016-02-29 11:44:07');
INSERT INTO `sys_menu` VALUES (5, '用户管理', NULL, 0, 'glyphicon-user', 5, '2016-01-06 19:37:31');
INSERT INTO `sys_menu` VALUES (6, '角色管理', '/zcurd/8/listPage', 5, 'glyphicon-user', 1, '2016-01-07 03:32:08');
INSERT INTO `sys_menu` VALUES (7, '系统用户', '/zcurd/12/listPage', 5, 'glyphicon-king', 2, '2016-02-16 03:59:22');
INSERT INTO `sys_menu` VALUES (9, '内容管理', 'aa', 0, 'glyphicon-search', 99, '2016-09-12 22:10:51');
INSERT INTO `sys_menu` VALUES (13, '操作日志', '/oplog/listPage', 1, 'glyphicon-time', 7, '2016-10-16 10:08:02');
INSERT INTO `sys_menu` VALUES (14, '图片管理', '/zcurd/18/listPage', 9, 'glyphicon-picture', 3, '2016-12-21 01:12:05');
INSERT INTO `sys_menu` VALUES (15, '定时任务', '/task/listPage', 1, 'glyphicon-tasks', 2, '2017-03-15 23:55:04');
INSERT INTO `sys_menu` VALUES (16, 'baidu', 'http://www.baidu.com', 9, 'glyphicon-euro', 1, '2019-08-22 21:40:35');
INSERT INTO `sys_menu` VALUES (17, '奖券管理', '/a', 0, 'glyphicon-gift', 2, '2019-08-23 02:22:04');
INSERT INTO `sys_menu` VALUES (18, '奖品管理', '/zcurd/32/listPage', 17, 'glyphicon-calendar', 1, '2019-08-23 02:22:40');
INSERT INTO `sys_menu` VALUES (21, '会员管理', '/aa', 0, 'glyphicon-user', 1, '2019-08-23 02:25:18');
INSERT INTO `sys_menu` VALUES (22, '会员管理', '/carduser/listPage', 21, 'glyphicon-user', 1, '2019-08-23 02:25:38');
INSERT INTO `sys_menu` VALUES (23, '等级管理', '/zcurd/33/listPage', 21, 'glyphicon-road', 2, '2019-08-23 02:26:04');
INSERT INTO `sys_menu` VALUES (24, '活动管理', '/s', 0, 'glyphicon-headphones', 3, '2019-08-23 02:26:36');
INSERT INTO `sys_menu` VALUES (25, '活动配置', '/zcurd/34/listPage', 24, 'glyphicon-flag', 1, '2019-08-23 02:27:48');
INSERT INTO `sys_menu` VALUES (26, '模板管理', '/ssf', 24, 'glyphicon-list-alt', 2, '2019-08-23 02:28:05');
INSERT INTO `sys_menu` VALUES (27, '信息管理', 'z', 0, 'glyphicon-th', 6, '2019-08-23 02:31:24');
INSERT INTO `sys_menu` VALUES (28, '活动信息', '/aa', 27, 'glyphicon-film', 1, '2019-08-23 02:33:07');
INSERT INTO `sys_menu` VALUES (29, '中奖统计', '/userhit/listPage', 27, 'glyphicon-inbox', 2, '2019-08-23 02:33:34');

-- ----------------------------
-- Table structure for sys_menu_btn
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_btn`;
CREATE TABLE `sys_menu_btn`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '所属菜单',
  `btn_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮名称',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面class名称',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台method名称',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单按钮' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu_btn
-- ----------------------------
INSERT INTO `sys_menu_btn` VALUES (3, 12, '增加', 'addBtn', 'add,addPage', '2016-10-16 13:55:52');
INSERT INTO `sys_menu_btn` VALUES (4, 12, '修改', 'updateBtn', 'update,updatePage', '2016-10-16 13:55:52');
INSERT INTO `sys_menu_btn` VALUES (5, 12, '删除', 'delBtn', 'delete', '2016-10-16 13:55:52');
INSERT INTO `sys_menu_btn` VALUES (6, 12, '导出', 'exportBtn', 'exportCsv', '2016-10-16 13:55:52');
INSERT INTO `sys_menu_btn` VALUES (7, 10, '增加', 'addBtn', 'add,addPage', '2016-10-16 14:11:44');
INSERT INTO `sys_menu_btn` VALUES (8, 10, '修改', 'updateBtn', 'update,updatePage', '2016-10-16 14:11:44');
INSERT INTO `sys_menu_btn` VALUES (9, 10, '删除', 'delBtn', 'delete', '2016-10-16 14:11:44');
INSERT INTO `sys_menu_btn` VALUES (10, 10, '导出', 'exportBtn', 'exportCsv', '2016-10-16 14:11:44');
INSERT INTO `sys_menu_btn` VALUES (11, 11, '增加', 'addBtn', 'add,addPage', '2016-10-16 14:14:28');
INSERT INTO `sys_menu_btn` VALUES (12, 11, '修改', 'updateBtn', 'update,updatePage', '2016-10-16 14:14:28');
INSERT INTO `sys_menu_btn` VALUES (13, 11, '删除', 'delBtn', 'delete', '2016-10-16 14:14:28');
INSERT INTO `sys_menu_btn` VALUES (14, 11, '导出', 'exportBtn', 'exportCsv', '2016-10-16 14:14:28');
INSERT INTO `sys_menu_btn` VALUES (15, 14, '增加', 'addBtn', 'add,addPage', '2016-12-21 22:52:59');
INSERT INTO `sys_menu_btn` VALUES (16, 14, '修改', 'updateBtn', 'update,updatePage', '2016-12-21 22:52:59');
INSERT INTO `sys_menu_btn` VALUES (17, 14, '删除', 'delBtn', 'delete', '2016-12-21 22:52:59');
INSERT INTO `sys_menu_btn` VALUES (18, 14, '导出', 'exportBtn', 'exportCsv', '2016-12-21 22:52:59');
INSERT INTO `sys_menu_btn` VALUES (19, 6, '增加', 'addBtn', 'add,addPage,/zcurd/5/\\w+,/zcurd/6/\\w+', '2016-12-21 22:55:21');
INSERT INTO `sys_menu_btn` VALUES (20, 6, '修改', 'updateBtn,operate', '/role/editAuthPage,/role/getAllMenu,/zcurd/6/\\w+,/zcurd/5/\\w+,/role/editAuth', '2016-12-21 22:55:21');
INSERT INTO `sys_menu_btn` VALUES (21, 6, '删除', 'delBtn', 'delete', '2016-12-21 22:55:21');
INSERT INTO `sys_menu_btn` VALUES (22, 6, '导出', 'exportBtn', 'exportCsv', '2016-12-21 22:55:21');
INSERT INTO `sys_menu_btn` VALUES (23, 7, '增加', 'addBtn', 'add,addPage', '2016-12-21 22:56:44');
INSERT INTO `sys_menu_btn` VALUES (24, 7, '修改', 'updateBtn', 'update,updatePage', '2016-12-21 22:56:44');
INSERT INTO `sys_menu_btn` VALUES (25, 7, '删除', 'delBtn', 'delete', '2016-12-21 22:56:44');
INSERT INTO `sys_menu_btn` VALUES (26, 7, '导出', 'exportBtn', 'exportCsv', '2016-12-21 22:56:44');
INSERT INTO `sys_menu_btn` VALUES (31, 3, '增加', 'addBtn', 'add,addPage', '2016-12-21 23:01:15');
INSERT INTO `sys_menu_btn` VALUES (32, 3, '修改', 'updateBtn', 'update,updatePage', '2016-12-21 23:01:15');
INSERT INTO `sys_menu_btn` VALUES (33, 3, '删除', 'delBtn', 'delete', '2016-12-21 23:01:15');
INSERT INTO `sys_menu_btn` VALUES (34, 3, '导出', 'exportBtn', 'exportCsv', '2016-12-21 23:01:15');
INSERT INTO `sys_menu_btn` VALUES (35, 4, '增加', 'addBtn', 'add,addPage', '2016-12-21 23:01:28');
INSERT INTO `sys_menu_btn` VALUES (36, 4, '修改', 'updateBtn', 'update,updatePage', '2016-12-21 23:01:28');
INSERT INTO `sys_menu_btn` VALUES (37, 4, '删除', 'delBtn', 'delete', '2016-12-21 23:01:28');
INSERT INTO `sys_menu_btn` VALUES (38, 4, '导出', 'exportBtn', 'exportCsv', '2016-12-21 23:01:28');
INSERT INTO `sys_menu_btn` VALUES (39, 7, '重置密码', 'exBtn4', '/user/resetPassword', '2017-01-27 15:07:20');
INSERT INTO `sys_menu_btn` VALUES (44, 15, '增加', 'addBtn', 'add,addPage', '2017-11-22 23:28:19');
INSERT INTO `sys_menu_btn` VALUES (45, 15, '修改', 'updateBtn', 'update,updatePage', '2017-11-22 23:28:19');
INSERT INTO `sys_menu_btn` VALUES (46, 15, '删除', 'delBtn', 'delete', '2017-11-22 23:28:19');
INSERT INTO `sys_menu_btn` VALUES (47, 15, '导出', 'exportBtn', 'exportCsv', '2017-11-22 23:28:19');
INSERT INTO `sys_menu_btn` VALUES (48, 2, '删除', 'delBtn', '/zcurdHead/delete', '2018-03-28 00:19:14');
INSERT INTO `sys_menu_btn` VALUES (49, 2, '修改', 'updateBtn', '/zcurdHead/updatePage,/zcurdHead/update,/zcurdHead/listField', '2018-03-28 00:19:14');
INSERT INTO `sys_menu_btn` VALUES (51, 2, '生成表单', 'genFormBtn', '/zcurdHead/genFormPage,/zcurdHead/genFormData,/zcurdHead/genForm', '2018-03-28 00:19:14');
INSERT INTO `sys_menu_btn` VALUES (52, 2, '扩展按钮', 'extendBtnBtn', '/zcurd/1/\\w+', '2018-03-28 00:40:12');
INSERT INTO `sys_menu_btn` VALUES (53, 2, '扩展JS', 'extendJsBtn', '/zcurd/2/\\w+', '2018-03-28 23:46:52');
INSERT INTO `sys_menu_btn` VALUES (54, 2, '生成代码', 'genCodeBtn', '/zcurdHead/genCode', '2018-03-28 23:47:58');
INSERT INTO `sys_menu_btn` VALUES (55, 3, '列表', '_no_', '/menu/listAll', '2018-03-28 23:49:45');
INSERT INTO `sys_menu_btn` VALUES (59, 13, '导出', 'exportBtn', 'exportCsv', '2018-03-29 00:06:08');
INSERT INTO `sys_menu_btn` VALUES (60, 22, '增加', 'addBtn', 'add,addPage', '2019-08-23 14:20:06');
INSERT INTO `sys_menu_btn` VALUES (61, 22, '修改', 'updateBtn', 'update,updatePage', '2019-08-23 14:20:06');
INSERT INTO `sys_menu_btn` VALUES (62, 22, '删除', 'delBtn', 'delete', '2019-08-23 14:20:06');
INSERT INTO `sys_menu_btn` VALUES (63, 22, '导出', 'exportBtn', 'exportCsv', '2019-08-23 14:20:06');
INSERT INTO `sys_menu_btn` VALUES (64, 16, '增加', 'addBtn', 'add,addPage', '2019-08-23 14:21:36');
INSERT INTO `sys_menu_btn` VALUES (65, 16, '修改', 'updateBtn', 'update,updatePage', '2019-08-23 14:21:36');
INSERT INTO `sys_menu_btn` VALUES (66, 16, '删除', 'delBtn', 'delete', '2019-08-23 14:21:36');
INSERT INTO `sys_menu_btn` VALUES (67, 16, '导出', 'exportBtn', 'exportCsv', '2019-08-23 14:21:36');
INSERT INTO `sys_menu_btn` VALUES (68, 23, '增加', 'addBtn', 'add,addPage', '2019-08-24 03:21:32');
INSERT INTO `sys_menu_btn` VALUES (69, 23, '修改', 'updateBtn', 'update,updatePage', '2019-08-24 03:21:32');
INSERT INTO `sys_menu_btn` VALUES (70, 23, '删除', 'delBtn', 'delete', '2019-08-24 03:21:32');
INSERT INTO `sys_menu_btn` VALUES (71, 23, '导出', 'exportBtn', 'exportCsv', '2019-08-24 03:21:32');
INSERT INTO `sys_menu_btn` VALUES (72, 18, '增加', 'addBtn', 'add,addPage', '2019-08-24 04:36:50');
INSERT INTO `sys_menu_btn` VALUES (73, 18, '修改', 'updateBtn', 'update,updatePage', '2019-08-24 04:36:50');
INSERT INTO `sys_menu_btn` VALUES (74, 18, '删除', 'delBtn', 'delete', '2019-08-24 04:36:50');
INSERT INTO `sys_menu_btn` VALUES (75, 18, '导出', 'exportBtn', 'exportCsv', '2019-08-24 04:36:50');
INSERT INTO `sys_menu_btn` VALUES (76, 25, '增加', 'addBtn', 'add,addPage', '2019-08-24 04:36:55');
INSERT INTO `sys_menu_btn` VALUES (77, 25, '修改', 'updateBtn', 'update,updatePage', '2019-08-24 04:36:55');
INSERT INTO `sys_menu_btn` VALUES (78, 25, '删除', 'delBtn', 'delete', '2019-08-24 04:36:55');
INSERT INTO `sys_menu_btn` VALUES (79, 25, '导出', 'exportBtn', 'exportCsv', '2019-08-24 04:36:55');
INSERT INTO `sys_menu_btn` VALUES (80, 25, '奖品配置', 'aa', '/gameproduct/listPage,/gameproduct/addPage,/gameproduct/updatePage,/gameproduct/add,/gameproduct/update,/gameproduct/delete', '2019-09-02 10:04:25');
INSERT INTO `sys_menu_btn` VALUES (81, 25, '策略配置', 'aa', '/gamerules/listPage,/gamerules/addPage,/gamerules/updatePage,/gamerules/add,/gamerules/update,/gamerules/delete', '2019-09-02 12:58:11');
INSERT INTO `sys_menu_btn` VALUES (82, 22, '修改密码', 'detailBtn', 'updatePwdPage,update', '2019-09-02 22:31:59');

-- ----------------------------
-- Table structure for sys_menu_datarule
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_datarule`;
CREATE TABLE `sys_menu_datarule`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `symbol` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '符号',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sql条件值',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu_datarule
-- ----------------------------
INSERT INTO `sys_menu_datarule` VALUES (3, 12, 'status', '=', '1', '2016-09-27 00:16:00');
INSERT INTO `sys_menu_datarule` VALUES (4, 6, 'id', '>', '2', '2016-12-21 22:56:25');
INSERT INTO `sys_menu_datarule` VALUES (5, 7, 'id', '>', '10', '2016-12-21 22:57:56');
INSERT INTO `sys_menu_datarule` VALUES (6, 2, 'id', '>', '18', '2016-12-21 23:01:01');
INSERT INTO `sys_menu_datarule` VALUES (8, 15, 'id', '>', '10', '2017-11-22 23:28:35');
INSERT INTO `sys_menu_datarule` VALUES (9, 11, 'closing_price', '>=', '1000', '2018-03-29 00:17:58');
INSERT INTO `sys_menu_datarule` VALUES (10, 11, 'closing_price', '<', '2000', '2018-03-29 00:18:20');
INSERT INTO `sys_menu_datarule` VALUES (11, 11, 'closing_price', '>=2000 and closing_price<3000 and 1=', '1', '2018-03-29 00:19:20');
INSERT INTO `sys_menu_datarule` VALUES (12, 23, 'dict_type', '=', 'card_user_level', '2019-08-24 03:22:17');
INSERT INTO `sys_menu_datarule` VALUES (13, 25, 'status', '=', '0', '2019-09-09 19:55:10');

-- ----------------------------
-- Table structure for sys_oplog
-- ----------------------------
DROP TABLE IF EXISTS `sys_oplog`;
CREATE TABLE `sys_oplog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `op_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 727 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oplog
-- ----------------------------
INSERT INTO `sys_oplog` VALUES (726, 2, '登陆系统', '172.16.43.164', '2019-09-10 16:21:27');
INSERT INTO `sys_oplog` VALUES (725, 1, '[中奖信息] 导出cvs', '0:0:0:0:0:0:0:1', '2019-09-10 15:17:50');
INSERT INTO `sys_oplog` VALUES (724, 1, '[菜单管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-10 15:17:27');
INSERT INTO `sys_oplog` VALUES (723, 1, '[菜单管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-10 15:16:59');
INSERT INTO `sys_oplog` VALUES (722, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-10 15:16:21');
INSERT INTO `sys_oplog` VALUES (721, 1, '[在线表单] 生成代码', '0:0:0:0:0:0:0:1', '2019-09-10 14:57:52');
INSERT INTO `sys_oplog` VALUES (720, 1, '[在线表单] 修改', '0:0:0:0:0:0:0:1', '2019-09-10 14:57:42');
INSERT INTO `sys_oplog` VALUES (719, 1, '[在线表单] 修改', '0:0:0:0:0:0:0:1', '2019-09-10 14:57:09');
INSERT INTO `sys_oplog` VALUES (718, 1, '[在线表单] 修改', '0:0:0:0:0:0:0:1', '2019-09-10 14:56:20');
INSERT INTO `sys_oplog` VALUES (717, 1, '[在线表单] 生成表单', '0:0:0:0:0:0:0:1', '2019-09-10 14:55:11');
INSERT INTO `sys_oplog` VALUES (716, 1, '[在线表单] 删除', '0:0:0:0:0:0:0:1', '2019-09-10 14:55:06');
INSERT INTO `sys_oplog` VALUES (715, 1, '[在线表单] 修改', '0:0:0:0:0:0:0:1', '2019-09-10 14:48:17');
INSERT INTO `sys_oplog` VALUES (714, 1, '[在线表单] 生成表单', '0:0:0:0:0:0:0:1', '2019-09-10 14:45:42');
INSERT INTO `sys_oplog` VALUES (713, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-10 14:40:50');
INSERT INTO `sys_oplog` VALUES (712, 2, '退出系统', '0:0:0:0:0:0:0:1', '2019-09-10 14:40:47');
INSERT INTO `sys_oplog` VALUES (711, 2, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-10 14:17:29');
INSERT INTO `sys_oplog` VALUES (710, 2, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-10 11:28:20');
INSERT INTO `sys_oplog` VALUES (709, 1, '退出系统', '0:0:0:0:0:0:0:1', '2019-09-10 11:28:17');
INSERT INTO `sys_oplog` VALUES (708, 1, '[权限管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-10 11:28:09');
INSERT INTO `sys_oplog` VALUES (707, 1, '[菜单数据（权限编辑）] 增加', '0:0:0:0:0:0:0:1', '2019-09-10 11:28:03');
INSERT INTO `sys_oplog` VALUES (706, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-10 11:27:08');
INSERT INTO `sys_oplog` VALUES (705, 2, '登陆系统', '172.16.43.164', '2019-09-10 11:20:21');
INSERT INTO `sys_oplog` VALUES (704, 2, '登陆系统', '172.16.43.164', '2019-09-10 09:17:58');
INSERT INTO `sys_oplog` VALUES (703, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-09 17:51:05');
INSERT INTO `sys_oplog` VALUES (702, 2, '登陆系统', '172.16.43.164', '2019-09-09 17:34:48');
INSERT INTO `sys_oplog` VALUES (701, 2, '登陆系统', '172.16.43.164', '2019-09-09 17:30:09');
INSERT INTO `sys_oplog` VALUES (700, 1, '[在线表单] 修改', '0:0:0:0:0:0:0:1', '2019-09-09 14:37:30');
INSERT INTO `sys_oplog` VALUES (699, 1, '[在线表单] 修改', '0:0:0:0:0:0:0:1', '2019-09-09 14:35:24');
INSERT INTO `sys_oplog` VALUES (698, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-09 14:35:04');
INSERT INTO `sys_oplog` VALUES (697, 2, '退出系统', '0:0:0:0:0:0:0:1', '2019-09-09 14:34:56');
INSERT INTO `sys_oplog` VALUES (696, 2, '[活动管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-09 14:34:27');
INSERT INTO `sys_oplog` VALUES (695, 2, '[配置奖品] 增加', '0:0:0:0:0:0:0:1', '2019-09-09 14:33:47');
INSERT INTO `sys_oplog` VALUES (694, 2, '[配置奖品] 增加', '0:0:0:0:0:0:0:1', '2019-09-09 14:33:40');
INSERT INTO `sys_oplog` VALUES (693, 2, '[配置奖品] 增加', '0:0:0:0:0:0:0:1', '2019-09-09 14:33:32');
INSERT INTO `sys_oplog` VALUES (692, 2, '[配置奖品] 修改', '0:0:0:0:0:0:0:1', '2019-09-09 14:33:23');
INSERT INTO `sys_oplog` VALUES (691, 2, '[配置奖品] 修改', '0:0:0:0:0:0:0:1', '2019-09-09 14:33:18');
INSERT INTO `sys_oplog` VALUES (690, 2, '[配置奖品] 修改', '0:0:0:0:0:0:0:1', '2019-09-09 14:33:12');
INSERT INTO `sys_oplog` VALUES (689, 2, '[活动策略] 增加', '0:0:0:0:0:0:0:1', '2019-09-09 14:08:58');
INSERT INTO `sys_oplog` VALUES (688, 2, '[会员a] 增加', '0:0:0:0:0:0:0:1', '2019-09-09 14:08:16');
INSERT INTO `sys_oplog` VALUES (687, 2, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-09 14:07:56');
INSERT INTO `sys_oplog` VALUES (686, 2, '[活动管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-06 16:00:43');
INSERT INTO `sys_oplog` VALUES (685, 2, '[活动管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-06 15:52:05');
INSERT INTO `sys_oplog` VALUES (684, 2, '[配置奖品] 修改', '0:0:0:0:0:0:0:1', '2019-09-06 15:51:09');
INSERT INTO `sys_oplog` VALUES (683, 2, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-06 15:21:55');
INSERT INTO `sys_oplog` VALUES (682, 2, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-06 14:47:33');
INSERT INTO `sys_oplog` VALUES (681, 1, '退出系统', '0:0:0:0:0:0:0:1', '2019-09-06 14:47:31');
INSERT INTO `sys_oplog` VALUES (680, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-06 14:45:57');
INSERT INTO `sys_oplog` VALUES (679, 2, '退出系统', '0:0:0:0:0:0:0:1', '2019-09-06 14:45:46');
INSERT INTO `sys_oplog` VALUES (678, 2, '[配置奖品] 修改', '172.16.43.164', '2019-09-06 14:42:03');
INSERT INTO `sys_oplog` VALUES (677, 2, '[配置奖品] 增加', '172.16.43.164', '2019-09-06 14:41:37');
INSERT INTO `sys_oplog` VALUES (676, 2, '[会员信息] 导出cvs', '172.16.43.164', '2019-09-06 14:20:20');
INSERT INTO `sys_oplog` VALUES (675, 2, '[会员信息] 导出cvs', '172.16.43.164', '2019-09-06 14:20:20');
INSERT INTO `sys_oplog` VALUES (674, 2, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-06 14:10:11');
INSERT INTO `sys_oplog` VALUES (673, 2, '登陆系统', '172.16.43.164', '2019-09-06 14:09:51');
INSERT INTO `sys_oplog` VALUES (672, 2, '[会员1] 修改密码', '0:0:0:0:0:0:0:1', '2019-09-06 11:19:25');
INSERT INTO `sys_oplog` VALUES (671, 2, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-06 11:19:15');
INSERT INTO `sys_oplog` VALUES (670, 2, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-06 08:57:22');
INSERT INTO `sys_oplog` VALUES (669, 2, '[活动管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-05 18:00:47');
INSERT INTO `sys_oplog` VALUES (668, 2, '[活动管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-05 17:37:56');
INSERT INTO `sys_oplog` VALUES (667, 2, '[活动管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-05 16:56:54');
INSERT INTO `sys_oplog` VALUES (666, 2, '[活动管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-05 16:26:16');
INSERT INTO `sys_oplog` VALUES (665, 2, '[活动管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-05 16:14:13');
INSERT INTO `sys_oplog` VALUES (664, 2, '[活动管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-05 16:12:21');
INSERT INTO `sys_oplog` VALUES (663, 2, '[活动管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-05 16:10:27');
INSERT INTO `sys_oplog` VALUES (662, 2, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-05 16:09:31');
INSERT INTO `sys_oplog` VALUES (661, 2, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-04 09:31:36');
INSERT INTO `sys_oplog` VALUES (600, 2, '登陆系统', '172.16.43.171', '2019-09-02 14:30:20');
INSERT INTO `sys_oplog` VALUES (601, 2, '退出系统', '172.16.43.171', '2019-09-02 14:30:35');
INSERT INTO `sys_oplog` VALUES (602, 1, '[用户管理] 增加', '0:0:0:0:0:0:0:1', '2019-09-02 14:31:06');
INSERT INTO `sys_oplog` VALUES (603, 3, '登陆系统', '172.16.43.171', '2019-09-02 14:31:30');
INSERT INTO `sys_oplog` VALUES (604, 1, '[菜单按钮（权限编辑）] 增加', '0:0:0:0:0:0:0:1', '2019-09-02 14:32:10');
INSERT INTO `sys_oplog` VALUES (605, 1, '[菜单按钮（权限编辑）] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 14:32:55');
INSERT INTO `sys_oplog` VALUES (606, 1, '[权限管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 14:32:58');
INSERT INTO `sys_oplog` VALUES (607, 3, '退出系统', '172.16.43.171', '2019-09-02 14:33:02');
INSERT INTO `sys_oplog` VALUES (608, 3, '登陆系统', '172.16.43.171', '2019-09-02 14:33:18');
INSERT INTO `sys_oplog` VALUES (609, 3, '[活动策略] 修改', '172.16.43.171', '2019-09-02 14:33:27');
INSERT INTO `sys_oplog` VALUES (610, 3, '[活动策略] 增加', '172.16.43.171', '2019-09-02 14:33:38');
INSERT INTO `sys_oplog` VALUES (611, 3, '[活动策略] 删除', '172.16.43.171', '2019-09-02 14:33:44');
INSERT INTO `sys_oplog` VALUES (612, 3, '[会员信息表] 修改', '172.16.43.171', '2019-09-02 14:34:20');
INSERT INTO `sys_oplog` VALUES (613, 2, '登陆系统', '172.16.43.164', '2019-09-02 14:36:25');
INSERT INTO `sys_oplog` VALUES (614, 1, '[奖品管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 15:13:41');
INSERT INTO `sys_oplog` VALUES (615, 1, '[奖品管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 15:15:19');
INSERT INTO `sys_oplog` VALUES (616, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-02 15:52:49');
INSERT INTO `sys_oplog` VALUES (617, 1, '[活动策略] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 15:53:03');
INSERT INTO `sys_oplog` VALUES (618, 1, '[在线表单] 生成代码', '0:0:0:0:0:0:0:1', '2019-09-02 15:54:59');
INSERT INTO `sys_oplog` VALUES (619, 1, '[在线表单] 生成代码', '0:0:0:0:0:0:0:1', '2019-09-02 15:55:09');
INSERT INTO `sys_oplog` VALUES (620, 1, '[菜单管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 16:36:34');
INSERT INTO `sys_oplog` VALUES (621, 1, '[会员信息表] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 17:40:53');
INSERT INTO `sys_oplog` VALUES (622, 1, '[在线表单] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 17:43:25');
INSERT INTO `sys_oplog` VALUES (623, 1, '[在线表单] 生成代码', '0:0:0:0:0:0:0:1', '2019-09-02 17:43:28');
INSERT INTO `sys_oplog` VALUES (624, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-02 18:08:06');
INSERT INTO `sys_oplog` VALUES (625, 1, '[菜单管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 18:08:33');
INSERT INTO `sys_oplog` VALUES (626, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-02 18:09:16');
INSERT INTO `sys_oplog` VALUES (627, 1, '[菜单管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 18:09:29');
INSERT INTO `sys_oplog` VALUES (628, 1, '[在线表单] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 18:11:59');
INSERT INTO `sys_oplog` VALUES (629, 1, '[在线表单] 生成代码', '0:0:0:0:0:0:0:1', '2019-09-02 18:12:02');
INSERT INTO `sys_oplog` VALUES (630, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-02 18:15:03');
INSERT INTO `sys_oplog` VALUES (631, 1, '[会员信息] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 18:15:10');
INSERT INTO `sys_oplog` VALUES (632, 1, '[会员信息] 修改', '0:0:0:0:0:0:0:1', '2019-09-02 18:15:19');
INSERT INTO `sys_oplog` VALUES (633, 1, '[会员信息] 增加', '0:0:0:0:0:0:0:1', '2019-09-02 18:15:31');
INSERT INTO `sys_oplog` VALUES (634, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-03 09:05:15');
INSERT INTO `sys_oplog` VALUES (635, 1, '[会员信息] 修改', '0:0:0:0:0:0:0:1', '2019-09-03 09:05:32');
INSERT INTO `sys_oplog` VALUES (636, 1, '[会员信息] 增加', '0:0:0:0:0:0:0:1', '2019-09-03 09:34:39');
INSERT INTO `sys_oplog` VALUES (637, 1, '[会员信息] 增加', '0:0:0:0:0:0:0:1', '2019-09-03 09:35:34');
INSERT INTO `sys_oplog` VALUES (638, 1, '[会员信息] 增加', '0:0:0:0:0:0:0:1', '2019-09-03 09:38:07');
INSERT INTO `sys_oplog` VALUES (639, 1, '[会员信息] 增加', '0:0:0:0:0:0:0:1', '2019-09-03 09:38:40');
INSERT INTO `sys_oplog` VALUES (640, 1, '[会员信息] 增加', '0:0:0:0:0:0:0:1', '2019-09-03 09:38:50');
INSERT INTO `sys_oplog` VALUES (641, 1, '[会员信息] 删除', '0:0:0:0:0:0:0:1', '2019-09-03 09:39:53');
INSERT INTO `sys_oplog` VALUES (642, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-03 11:01:34');
INSERT INTO `sys_oplog` VALUES (643, 1, '登陆系统', '0:0:0:0:0:0:0:1', '2019-09-03 13:47:52');
INSERT INTO `sys_oplog` VALUES (644, 1, '[会员1] 修改密码', '0:0:0:0:0:0:0:1', '2019-09-03 14:27:12');
INSERT INTO `sys_oplog` VALUES (645, 1, '[会员sad] 修改密码', '0:0:0:0:0:0:0:1', '2019-09-03 14:28:57');
INSERT INTO `sys_oplog` VALUES (646, 1, '[会员信息] 修改', '0:0:0:0:0:0:0:1', '2019-09-03 14:29:15');
INSERT INTO `sys_oplog` VALUES (647, 1, '[会员信息] 修改', '0:0:0:0:0:0:0:1', '2019-09-03 14:29:28');
INSERT INTO `sys_oplog` VALUES (648, 2, '登陆系统', '172.16.43.171', '2019-09-03 14:55:45');
INSERT INTO `sys_oplog` VALUES (649, 1, '[菜单管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-03 14:56:14');
INSERT INTO `sys_oplog` VALUES (650, 1, '[权限管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-03 15:01:51');
INSERT INTO `sys_oplog` VALUES (651, 1, '[权限管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-03 15:02:10');
INSERT INTO `sys_oplog` VALUES (652, 2, '退出系统', '172.16.43.171', '2019-09-03 15:02:16');
INSERT INTO `sys_oplog` VALUES (653, 2, '登陆系统', '172.16.43.171', '2019-09-03 15:02:18');
INSERT INTO `sys_oplog` VALUES (654, 2, '[会员信息] 修改', '172.16.43.171', '2019-09-03 15:02:33');
INSERT INTO `sys_oplog` VALUES (655, 2, '[会员sad] 修改', '172.16.43.171', '2019-09-03 15:02:50');
INSERT INTO `sys_oplog` VALUES (656, 1, '[菜单按钮（权限编辑）] 增加', '0:0:0:0:0:0:0:1', '2019-09-03 15:04:50');
INSERT INTO `sys_oplog` VALUES (657, 1, '[权限管理] 修改', '0:0:0:0:0:0:0:1', '2019-09-03 15:04:53');
INSERT INTO `sys_oplog` VALUES (658, 2, '退出系统', '172.16.43.171', '2019-09-03 15:05:01');
INSERT INTO `sys_oplog` VALUES (659, 2, '登陆系统', '172.16.43.171', '2019-09-03 15:05:02');
INSERT INTO `sys_oplog` VALUES (660, 2, '[会员sad] 修改密码', '172.16.43.171', '2019-09-03 15:05:10');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (6, '运营人员', '2019-08-23 14:19:50');

-- ----------------------------
-- Table structure for sys_role_btn
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_btn`;
CREATE TABLE `sys_role_btn`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `btn_id` int(11) NULL DEFAULT NULL COMMENT '按钮id',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1669 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_btn
-- ----------------------------
INSERT INTO `sys_role_btn` VALUES (1129, 5, 55, '2018-03-31 00:32:29');
INSERT INTO `sys_role_btn` VALUES (1130, 5, 20, '2018-03-31 00:32:29');
INSERT INTO `sys_role_btn` VALUES (1131, 4, 12, '2018-03-31 23:59:33');
INSERT INTO `sys_role_btn` VALUES (1229, 1, 54, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1230, 1, 53, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1231, 1, 52, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1232, 1, 51, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1233, 1, 49, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1234, 1, 48, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1235, 1, 55, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1236, 1, 34, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1237, 1, 33, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1238, 1, 32, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1239, 1, 31, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1240, 1, 38, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1241, 1, 36, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1242, 1, 35, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1243, 1, 22, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1244, 1, 20, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1245, 1, 19, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1246, 1, 10, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1247, 1, 9, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1248, 1, 8, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1249, 1, 7, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1250, 1, 14, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1251, 1, 13, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1252, 1, 12, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1253, 1, 11, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1254, 1, 6, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1255, 1, 5, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1256, 1, 4, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1257, 1, 3, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1258, 1, 59, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1259, 1, 18, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1260, 1, 16, '2019-08-23 14:15:08');
INSERT INTO `sys_role_btn` VALUES (1261, 2, 34, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1262, 2, 32, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1263, 2, 31, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1264, 2, 36, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1265, 2, 35, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1266, 2, 22, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1267, 2, 21, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1268, 2, 24, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1269, 2, 23, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1270, 2, 10, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1271, 2, 9, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1272, 2, 8, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1273, 2, 7, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1274, 2, 14, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1275, 2, 13, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1276, 2, 12, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1277, 2, 11, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1278, 2, 6, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1279, 2, 5, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1280, 2, 4, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1281, 2, 3, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1282, 2, 18, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1283, 2, 17, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1284, 2, 16, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1285, 2, 15, '2019-08-23 14:15:15');
INSERT INTO `sys_role_btn` VALUES (1642, 6, 59, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1643, 6, 18, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1644, 6, 17, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1645, 6, 16, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1646, 6, 15, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1647, 6, 67, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1648, 6, 66, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1649, 6, 65, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1650, 6, 64, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1651, 6, 75, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1652, 6, 74, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1653, 6, 73, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1654, 6, 72, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1655, 6, 82, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1656, 6, 63, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1657, 6, 62, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1658, 6, 61, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1659, 6, 60, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1660, 6, 70, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1661, 6, 69, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1662, 6, 68, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1663, 6, 81, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1664, 6, 80, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1665, 6, 79, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1666, 6, 78, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1667, 6, 77, '2019-09-09 19:55:16');
INSERT INTO `sys_role_btn` VALUES (1668, 6, 76, '2019-09-09 19:55:16');

-- ----------------------------
-- Table structure for sys_role_datarule
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_datarule`;
CREATE TABLE `sys_role_datarule`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) NOT NULL COMMENT '角色',
  `datarule_id` int(11) NOT NULL COMMENT '数据规则',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色数据规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_datarule
-- ----------------------------
INSERT INTO `sys_role_datarule` VALUES (179, 4, 10, '2018-03-31 23:59:33');
INSERT INTO `sys_role_datarule` VALUES (180, 4, 9, '2018-03-31 23:59:33');
INSERT INTO `sys_role_datarule` VALUES (181, 4, 3, '2018-03-31 23:59:33');
INSERT INTO `sys_role_datarule` VALUES (195, 6, 12, '2019-09-09 19:55:16');
INSERT INTO `sys_role_datarule` VALUES (196, 6, 13, '2019-09-09 19:55:16');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 941 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (794, 5, 6, '2018-03-31 00:32:29');
INSERT INTO `sys_role_menu` VALUES (795, 5, 2, '2018-03-31 00:32:29');
INSERT INTO `sys_role_menu` VALUES (796, 5, 15, '2018-03-31 00:32:29');
INSERT INTO `sys_role_menu` VALUES (797, 5, 3, '2018-03-31 00:32:29');
INSERT INTO `sys_role_menu` VALUES (798, 5, 4, '2018-03-31 00:32:29');
INSERT INTO `sys_role_menu` VALUES (799, 5, 13, '2018-03-31 00:32:29');
INSERT INTO `sys_role_menu` VALUES (800, 4, 12, '2018-03-31 23:59:33');
INSERT INTO `sys_role_menu` VALUES (801, 4, 10, '2018-03-31 23:59:33');
INSERT INTO `sys_role_menu` VALUES (802, 4, 11, '2018-03-31 23:59:33');
INSERT INTO `sys_role_menu` VALUES (803, 4, 14, '2018-03-31 23:59:33');
INSERT INTO `sys_role_menu` VALUES (828, 1, 6, '2019-08-23 14:15:08');
INSERT INTO `sys_role_menu` VALUES (829, 1, 7, '2019-08-23 14:15:08');
INSERT INTO `sys_role_menu` VALUES (830, 1, 2, '2019-08-23 14:15:08');
INSERT INTO `sys_role_menu` VALUES (831, 1, 15, '2019-08-23 14:15:08');
INSERT INTO `sys_role_menu` VALUES (832, 1, 3, '2019-08-23 14:15:08');
INSERT INTO `sys_role_menu` VALUES (833, 1, 4, '2019-08-23 14:15:08');
INSERT INTO `sys_role_menu` VALUES (834, 1, 13, '2019-08-23 14:15:08');
INSERT INTO `sys_role_menu` VALUES (835, 2, 16, '2019-08-23 14:15:15');
INSERT INTO `sys_role_menu` VALUES (836, 2, 14, '2019-08-23 14:15:15');
INSERT INTO `sys_role_menu` VALUES (936, 6, 22, '2019-09-09 19:55:16');
INSERT INTO `sys_role_menu` VALUES (937, 6, 23, '2019-09-09 19:55:16');
INSERT INTO `sys_role_menu` VALUES (938, 6, 18, '2019-09-09 19:55:16');
INSERT INTO `sys_role_menu` VALUES (939, 6, 25, '2019-09-09 19:55:16');
INSERT INTO `sys_role_menu` VALUES (940, 6, 13, '2019-09-09 19:55:16');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `roles` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '-1ef523c6b645a65441a91fa80df077c2', NULL, '2016-01-08 15:33:05');
INSERT INTO `sys_user` VALUES (2, 'zcurd', '-1ef523c6b645a65441a91fa80df077c2', '6', '2016-10-29 16:59:44');
INSERT INTO `sys_user` VALUES (3, 'test', '98f6bcd4621d373cade4e832627b4f6', '6', '2019-09-02 12:57:07');

-- ----------------------------
-- Table structure for task_base
-- ----------------------------
DROP TABLE IF EXISTS `task_base`;
CREATE TABLE `task_base`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `target_type` int(11) NULL DEFAULT NULL COMMENT '任务类型',
  `target_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '任务值',
  `cron` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `last_run_result` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次执行结果',
  `last_run_time` datetime(0) NULL DEFAULT NULL COMMENT '上次执行时间',
  `last_run_time_cost` int(11) NULL DEFAULT NULL COMMENT '上次执行耗时',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task_base
-- ----------------------------
INSERT INTO `task_base` VALUES (1, '重置账号数据', 2, 'delete from sys_menu;\nINSERT INTO `sys_menu` (`id`, `menu_name`, `menu_url`, `parent_id`, `icon`, `order_num`, `create_time`)\nVALUES\n	(1,\'系统管理\',NULL,0,\'glyphicon-cog\',6,\'2016-01-06 19:37:31\'),\n	(2,\'在线表单\',\'/zcurdHead/list\',1,\'glyphicon-cloud\',1,\'2016-01-07 21:41:21\'),\n	(3,\'菜单管理\',\'/menu/list\',1,\'glyphicon-menu-hamburger\',5,\'2016-01-06 19:37:38\'),\n	(4,\'字典管理\',\'/zcurd/7/listPage\',1,\'glyphicon-book\',6,\'2016-02-29 11:44:07\'),\n	(5,\'用户管理\',NULL,0,\'glyphicon-user\',5,\'2016-01-06 19:37:31\'),\n	(6,\'角色管理\',\'/zcurd/8/listPage\',5,\'glyphicon-user\',1,\'2016-01-07 03:32:08\'),\n	(7,\'系统用户\',\'/zcurd/12/listPage\',5,\'glyphicon-king\',2,\'2016-02-16 03:59:22\'),\n	(9,\'内容管理\',NULL,0,\'glyphicon-search\',2,\'2016-09-12 22:10:51\'),\n	(10,\'客户管理\',\'/zcurd/15/listPage\',9,\'glyphicon-th-list\',1,\'2016-09-12 22:11:26\'),\n	(11,\'大盘数据\',\'/zcurd/16/listPage\',9,\'glyphicon-flag\',2,\'2016-09-12 22:12:33\'),\n	(12,\'小说采集\',\'/zcurd/17/listPage\',9,\'glyphicon-cd\',0,\'2016-09-18 18:55:28\'),\n	(13,\'操作日志\',\'/oplog/listPage\',1,\'glyphicon-time\',7,\'2016-10-16 10:08:02\'),\n	(14,\'图片管理\',\'/zcurd/18/listPage\',9,\'glyphicon-picture\',3,\'2016-12-21 01:12:05\'),\n	(15,\'定时任务\',\'/task/listPage\',1,\'glyphicon-tasks\',2,\'2017-03-15 23:55:04\');\n\ndelete from sys_menu_btn;\nINSERT INTO `sys_menu_btn` (`id`, `menu_id`, `btn_name`, `class_name`, `method_name`, `create_time`)\nVALUES\n	(3,12,\'增加\',\'addBtn\',\'add,addPage\',\'2016-10-16 13:55:52\'),\n	(4,12,\'修改\',\'updateBtn\',\'update,updatePage\',\'2016-10-16 13:55:52\'),\n	(5,12,\'删除\',\'delBtn\',\'delete\',\'2016-10-16 13:55:52\'),\n	(6,12,\'导出\',\'exportBtn\',\'exportCsv\',\'2016-10-16 13:55:52\'),\n	(7,10,\'增加\',\'addBtn\',\'add,addPage\',\'2016-10-16 14:11:44\'),\n	(8,10,\'修改\',\'updateBtn\',\'update,updatePage\',\'2016-10-16 14:11:44\'),\n	(9,10,\'删除\',\'delBtn\',\'delete\',\'2016-10-16 14:11:44\'),\n	(10,10,\'导出\',\'exportBtn\',\'exportCsv\',\'2016-10-16 14:11:44\'),\n	(11,11,\'增加\',\'addBtn\',\'add,addPage\',\'2016-10-16 14:14:28\'),\n	(12,11,\'修改\',\'updateBtn\',\'update,updatePage\',\'2016-10-16 14:14:28\'),\n	(13,11,\'删除\',\'delBtn\',\'delete\',\'2016-10-16 14:14:28\'),\n	(14,11,\'导出\',\'exportBtn\',\'exportCsv\',\'2016-10-16 14:14:28\'),\n	(15,14,\'增加\',\'addBtn\',\'add,addPage\',\'2016-12-21 22:52:59\'),\n	(16,14,\'修改\',\'updateBtn\',\'update,updatePage\',\'2016-12-21 22:52:59\'),\n	(17,14,\'删除\',\'delBtn\',\'delete\',\'2016-12-21 22:52:59\'),\n	(18,14,\'导出\',\'exportBtn\',\'exportCsv\',\'2016-12-21 22:52:59\'),\n	(19,6,\'增加\',\'addBtn\',\'add,addPage\',\'2016-12-21 22:55:21\'),\n	(20,6,\'修改\',\'updateBtn\',\'update,updatePage\',\'2016-12-21 22:55:21\'),\n	(21,6,\'删除\',\'delBtn\',\'delete\',\'2016-12-21 22:55:21\'),\n	(22,6,\'导出\',\'exportBtn\',\'exportCsv\',\'2016-12-21 22:55:21\'),\n	(23,7,\'增加\',\'addBtn\',\'add,addPage\',\'2016-12-21 22:56:44\'),\n	(24,7,\'修改\',\'updateBtn\',\'update,updatePage\',\'2016-12-21 22:56:44\'),\n	(25,7,\'删除\',\'delBtn\',\'delete\',\'2016-12-21 22:56:44\'),\n	(26,7,\'导出\',\'exportBtn\',\'exportCsv\',\'2016-12-21 22:56:44\'),\n	(29,2,\'删除\',\'delBtn\',\'delete\',\'2016-12-21 22:58:28\'),\n	(31,3,\'增加\',\'addBtn\',\'add,addPage\',\'2016-12-21 23:01:15\'),\n	(32,3,\'修改\',\'updateBtn\',\'update,updatePage\',\'2016-12-21 23:01:15\'),\n	(33,3,\'删除\',\'delBtn\',\'delete\',\'2016-12-21 23:01:15\'),\n	(34,3,\'导出\',\'exportBtn\',\'exportCsv\',\'2016-12-21 23:01:15\'),\n	(35,4,\'增加\',\'addBtn\',\'add,addPage\',\'2016-12-21 23:01:28\'),\n	(36,4,\'修改\',\'updateBtn\',\'update,updatePage\',\'2016-12-21 23:01:28\'),\n	(37,4,\'删除\',\'delBtn\',\'delete\',\'2016-12-21 23:01:28\'),\n	(38,4,\'导出\',\'exportBtn\',\'exportCsv\',\'2016-12-21 23:01:28\'),\n	(39,7,\'重置密码\',\'exBtn4\',\'/user/resetPassword\',\'2017-01-27 15:07:20\'),\n	(44,15,\'增加\',\'addBtn\',\'add,addPage\',\'2017-11-22 23:28:19\'),\n	(45,15,\'修改\',\'updateBtn\',\'update,updatePage\',\'2017-11-22 23:28:19\'),\n	(46,15,\'删除\',\'delBtn\',\'delete\',\'2017-11-22 23:28:19\'),\n	(47,15,\'导出\',\'exportBtn\',\'exportCsv\',\'2017-11-22 23:28:19\');\n\ndelete from sys_role;\nINSERT INTO `sys_role` (`id`, `role_name`, `create_time`)\nVALUES\n	(1,\'系统管理员\',\'2016-02-04 21:05:45\'),\n	(2,\'内容运营\',\'2016-02-04 21:06:12\'),\n	(4,\'readonly\',\'2016-10-16 14:22:10\');\n\ndelete from sys_role_btn;\nINSERT INTO `sys_role_btn` (`id`, `role_id`, `btn_id`, `create_time`)\nVALUES\n	(450,2,34,\'2016-12-21 23:05:22\'),\n	(451,2,32,\'2016-12-21 23:05:22\'),\n	(452,2,31,\'2016-12-21 23:05:22\'),\n	(453,2,36,\'2016-12-21 23:05:22\'),\n	(454,2,35,\'2016-12-21 23:05:22\'),\n	(455,2,22,\'2016-12-21 23:05:22\'),\n	(456,2,21,\'2016-12-21 23:05:22\'),\n	(457,2,24,\'2016-12-21 23:05:22\'),\n	(458,2,23,\'2016-12-21 23:05:22\'),\n	(459,2,10,\'2016-12-21 23:05:22\'),\n	(460,2,9,\'2016-12-21 23:05:22\'),\n	(461,2,8,\'2016-12-21 23:05:22\'),\n	(462,2,7,\'2016-12-21 23:05:22\'),\n	(463,2,14,\'2016-12-21 23:05:22\'),\n	(464,2,13,\'2016-12-21 23:05:22\'),\n	(465,2,12,\'2016-12-21 23:05:22\'),\n	(466,2,11,\'2016-12-21 23:05:22\'),\n	(467,2,6,\'2016-12-21 23:05:22\'),\n	(468,2,5,\'2016-12-21 23:05:22\'),\n	(469,2,4,\'2016-12-21 23:05:22\'),\n	(470,2,3,\'2016-12-21 23:05:22\'),\n	(471,2,18,\'2016-12-21 23:05:22\'),\n	(472,2,17,\'2016-12-21 23:05:22\'),\n	(473,2,16,\'2016-12-21 23:05:22\'),\n	(474,2,15,\'2016-12-21 23:05:22\'),\n	(521,1,32,\'2017-11-22 23:28:40\'),\n	(522,1,31,\'2017-11-22 23:28:40\'),\n	(523,1,38,\'2017-11-22 23:28:40\'),\n	(524,1,36,\'2017-11-22 23:28:40\'),\n	(525,1,35,\'2017-11-22 23:28:40\'),\n	(526,1,22,\'2017-11-22 23:28:40\'),\n	(527,1,20,\'2017-11-22 23:28:40\'),\n	(528,1,19,\'2017-11-22 23:28:40\'),\n	(529,1,10,\'2017-11-22 23:28:40\'),\n	(530,1,9,\'2017-11-22 23:28:40\'),\n	(531,1,8,\'2017-11-22 23:28:40\'),\n	(532,1,7,\'2017-11-22 23:28:40\'),\n	(533,1,14,\'2017-11-22 23:28:40\'),\n	(534,1,13,\'2017-11-22 23:28:40\'),\n	(535,1,12,\'2017-11-22 23:28:40\'),\n	(536,1,11,\'2017-11-22 23:28:40\'),\n	(537,1,6,\'2017-11-22 23:28:40\'),\n	(538,1,5,\'2017-11-22 23:28:40\'),\n	(539,1,4,\'2017-11-22 23:28:40\'),\n	(540,1,3,\'2017-11-22 23:28:40\');\n\ndelete from sys_role_datarule;\nINSERT INTO `sys_role_datarule` (`id`, `role_id`, `datarule_id`, `create_time`)\nVALUES\n	(18,3,3,\'2016-10-16 15:01:17\'),\n	(23,4,3,\'2016-12-21 22:53:05\'),\n	(44,2,6,\'2016-12-21 23:05:22\'),\n	(45,2,4,\'2016-12-21 23:05:22\'),\n	(46,2,5,\'2016-12-21 23:05:22\'),\n	(56,1,6,\'2017-11-22 23:28:40\'),\n	(57,1,4,\'2017-11-22 23:28:40\'),\n	(58,1,5,\'2017-11-22 23:28:40\'),\n	(59,1,3,\'2017-11-22 23:28:40\'),\n	(60,1,8,\'2017-11-22 23:28:40\');\n\ndelete from sys_role_menu;\nINSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`)\nVALUES\n	(472,4,12,\'2016-12-21 22:53:05\'),\n	(473,4,10,\'2016-12-21 22:53:05\'),\n	(474,4,11,\'2016-12-21 22:53:05\'),\n	(475,4,14,\'2016-12-21 22:53:05\'),\n	(578,2,12,\'2016-12-21 23:05:22\'),\n	(579,2,10,\'2016-12-21 23:05:22\'),\n	(580,2,11,\'2016-12-21 23:05:22\'),\n	(581,2,14,\'2016-12-21 23:05:22\'),\n	(596,1,6,\'2017-11-22 23:28:40\'),\n	(597,1,7,\'2017-11-22 23:28:40\'),\n	(598,1,2,\'2017-11-22 23:28:40\'),\n	(599,1,15,\'2017-11-22 23:28:40\'),\n	(600,1,3,\'2017-11-22 23:28:40\'),\n	(601,1,4,\'2017-11-22 23:28:40\'),\n	(602,1,13,\'2017-11-22 23:28:40\');\n\ndelete from sys_user;\nINSERT INTO `sys_user` (`id`, `user_name`, `password`, `roles`, `create_time`)\nVALUES\n	(1,\'admin\',\'25d55ad283aa400af464c76d713c07ad\',NULL,\'2016-01-08 15:33:05\'),\n	(2,\'zcurd\',\'-1ef523c6b645a65441a91fa80df077c2\',\'2,1\',\'2016-10-29 16:59:44\'),\n	(3,\'readonly\',\'-1ef523c6b645a65441a91fa80df077c2\',\'4\',\'2016-10-16 14:22:46\'),\n	(11,\'zhong\',\'-1ef523c6b645a65441a91fa80df077c2\',\'2,1\',\'2016-02-21 01:19:47\');', '* * 2 * *', '成功', '2017-11-22 23:46:17', 9, 2, NULL, '2017-11-22 00:07:23');
INSERT INTO `task_base` VALUES (11, '测试-请示URL', 1, 'https://www.baidu.com', '* * */1 * *', '成功', '2017-11-22 23:23:00', 3, 2, 1, '2017-03-04 16:08:06');
INSERT INTO `task_base` VALUES (12, '测试-查询', 2, 'select 2', '* * */1 * *', '成功', '2018-03-21 22:45:00', 10, 2, NULL, '2017-03-04 17:32:02');
INSERT INTO `task_base` VALUES (13, '测试-存储过程（体验地址不支持）', 2, 'call zcurd_base.pro_test()', '* * */1 * *', '成功', '2017-04-09 09:31:24', 2, 2, NULL, '2017-03-05 00:30:20');
INSERT INTO `task_base` VALUES (14, '测试-ITask', 3, 'com.zcurd.common.task.DemoTask', '* * */1 * *', '成功', '2017-03-26 22:50:00', 3, 2, NULL, '2017-03-18 14:43:55');

-- ----------------------------
-- Table structure for task_log
-- ----------------------------
DROP TABLE IF EXISTS `task_log`;
CREATE TABLE `task_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `task_id` int(11) NULL DEFAULT NULL COMMENT '所属任务',
  `result` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行结果',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `cost_time` int(11) NULL DEFAULT NULL COMMENT '耗时',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务-日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task_log
-- ----------------------------
INSERT INTO `task_log` VALUES (1, 12, '成功', '2017-11-22 23:48:00', '2017-11-22 23:48:00', 3, NULL);
INSERT INTO `task_log` VALUES (2, 12, '成功', '2017-11-22 23:49:00', '2017-11-22 23:49:00', 3, NULL);
INSERT INTO `task_log` VALUES (3, 12, '成功', '2018-03-21 22:23:00', '2018-03-21 22:23:00', 5, NULL);
INSERT INTO `task_log` VALUES (4, 12, '成功', '2018-03-21 22:24:00', '2018-03-21 22:24:00', 5, NULL);
INSERT INTO `task_log` VALUES (5, 12, '成功', '2018-03-21 22:25:00', '2018-03-21 22:25:00', 6, NULL);
INSERT INTO `task_log` VALUES (6, 12, '成功', '2018-03-21 22:26:00', '2018-03-21 22:26:00', 5, NULL);
INSERT INTO `task_log` VALUES (7, 12, '成功', '2018-03-21 22:27:00', '2018-03-21 22:27:00', 7, NULL);
INSERT INTO `task_log` VALUES (8, 12, '成功', '2018-03-21 22:28:00', '2018-03-21 22:28:00', 6, NULL);
INSERT INTO `task_log` VALUES (9, 12, '成功', '2018-03-21 22:29:00', '2018-03-21 22:29:00', 5, NULL);
INSERT INTO `task_log` VALUES (10, 12, '成功', '2018-03-21 22:30:00', '2018-03-21 22:30:00', 5, NULL);
INSERT INTO `task_log` VALUES (11, 12, '成功', '2018-03-21 22:31:00', '2018-03-21 22:31:00', 6, NULL);
INSERT INTO `task_log` VALUES (12, 12, '成功', '2018-03-21 22:32:00', '2018-03-21 22:32:00', 5, NULL);
INSERT INTO `task_log` VALUES (13, 12, '成功', '2018-03-21 22:33:00', '2018-03-21 22:33:00', 6, NULL);
INSERT INTO `task_log` VALUES (14, 12, '成功', '2018-03-21 22:34:00', '2018-03-21 22:34:00', 6, NULL);
INSERT INTO `task_log` VALUES (15, 12, '成功', '2018-03-21 22:35:00', '2018-03-21 22:35:00', 4, NULL);
INSERT INTO `task_log` VALUES (16, 12, '成功', '2018-03-21 22:36:00', '2018-03-21 22:36:00', 5, NULL);
INSERT INTO `task_log` VALUES (17, 12, '成功', '2018-03-21 22:37:00', '2018-03-21 22:37:00', 5, NULL);
INSERT INTO `task_log` VALUES (18, 12, '成功', '2018-03-21 22:38:00', '2018-03-21 22:38:00', 5, NULL);
INSERT INTO `task_log` VALUES (19, 12, '成功', '2018-03-21 22:39:00', '2018-03-21 22:39:00', 5, NULL);
INSERT INTO `task_log` VALUES (20, 12, '成功', '2018-03-21 22:40:00', '2018-03-21 22:40:00', 5, NULL);
INSERT INTO `task_log` VALUES (21, 12, '成功', '2018-03-21 22:41:00', '2018-03-21 22:41:00', 5, NULL);
INSERT INTO `task_log` VALUES (22, 12, '成功', '2018-03-21 22:42:00', '2018-03-21 22:42:00', 6, NULL);
INSERT INTO `task_log` VALUES (23, 12, '成功', '2018-03-21 22:43:00', '2018-03-21 22:43:00', 2, NULL);
INSERT INTO `task_log` VALUES (24, 12, '成功', '2018-03-21 22:45:00', '2018-03-21 22:45:00', 10, NULL);

-- ----------------------------
-- Table structure for tb_proc_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_proc_log`;
CREATE TABLE `tb_proc_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `proc_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过程名称',
  `statu` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `start_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `cost_time` int(11) NULL DEFAULT NULL COMMENT '耗时',
  `error_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'error_code',
  `error_msg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'error_msg',
  `step` int(11) NULL DEFAULT NULL COMMENT 'step',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储过程运行日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zcurd_field
-- ----------------------------
DROP TABLE IF EXISTS `zcurd_field`;
CREATE TABLE `zcurd_field`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `head_id` int(11) NULL DEFAULT NULL COMMENT '所属表',
  `field_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `column_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列表列名',
  `column_length` int(11) NULL DEFAULT 120 COMMENT '列宽',
  `data_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `input_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'easyui-textbox' COMMENT '控件类型',
  `is_show_list` int(11) NULL DEFAULT 1 COMMENT '是否列表显示',
  `is_allow_detail` int(11) NULL DEFAULT 1 COMMENT '是否详情显示',
  `is_allow_add` int(11) NULL DEFAULT 1 COMMENT '是否允许增加',
  `is_allow_update` int(11) NULL DEFAULT 1 COMMENT '是否允许编辑',
  `is_search` int(11) NULL DEFAULT 0 COMMENT '是否搜索',
  `is_allow_null` int(11) NULL DEFAULT 1 COMMENT '是否允许为空',
  `dict_sql` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典sql',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '顺序',
  `search_type` int(11) NULL DEFAULT 1 COMMENT '搜索类型(1:值,2:范围)',
  `is_sum` int(11) NULL DEFAULT 0 COMMENT '是否汇总',
  `default_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10266 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线表单字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zcurd_field
-- ----------------------------
INSERT INTO `zcurd_field` VALUES (2, 1, 'func_content', '方法内容', 120, 'text', 'textarea', 0, 1, 1, 1, 0, 0, '', 6, 1, 0, NULL, '2016-01-11 21:58:48');
INSERT INTO `zcurd_field` VALUES (1, 1, 'create_time', '创建时间', 130, 'timestamp', 'easyui-textbox', 1, 1, 0, 0, 0, 1, '', 7, 1, 0, NULL, '2016-01-11 21:58:48');
INSERT INTO `zcurd_field` VALUES (4, 1, 'location', '按钮位置', 80, 'int', 'easyui-combobox', 1, 1, 1, 1, 0, 0, 'select 1, \'顶部\' union all select 2, \'行内\'', 4, 1, 0, NULL, '2016-01-11 21:58:48');
INSERT INTO `zcurd_field` VALUES (5, 1, 'action', '行为', 80, 'int', 'easyui-combobox', 1, 1, 1, 1, 0, 0, 'select 0, \'自定义\' union all select 1, \'打开子页面\'', 5, 1, 0, NULL, '2016-01-11 21:58:48');
INSERT INTO `zcurd_field` VALUES (190, 15, 'archremark', '资料归档备注', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 119, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (189, 15, 'archtime', '资料归档时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 118, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (188, 15, 'archstatus', '资料归档情况', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 117, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (187, 15, 'approvalopinion', '审批意见', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 116, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (186, 15, 'gjrelation', '共借人关系', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 115, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (7, 2, 'js_content', '扩展js', 120, 'text', 'textarea', 0, 1, 1, 1, 0, 0, '', 4, 1, 0, NULL, '2016-01-12 15:35:01');
INSERT INTO `zcurd_field` VALUES (6, 2, 'create_time', '创建时间', 130, 'timestamp', 'easyui-textbox', 1, 1, 0, 0, 0, 1, '', 5, 1, 0, NULL, '2016-01-12 15:35:01');
INSERT INTO `zcurd_field` VALUES (8, 2, 'page', '页面', 120, 'varchar', 'easyui-combobox', 1, 1, 1, 1, 0, 0, 'select \'list\' as \'key\', \'list\' as \'value\' union all select \'add\', \'add\' union all select \'update\', \'update\' union all select \'detail\', \'detail\'', 2, 1, 0, NULL, '2016-01-12 15:35:01');
INSERT INTO `zcurd_field` VALUES (182, 15, 'refundtime', '退款时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 111, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (183, 15, 'loanMoney', 'loanMoney', 120, 'double', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 112, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (184, 15, 'creditLevel', '信用卡等级', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 113, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (185, 15, 'buyhouseaddress', '客户新买房新地址', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 114, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (26, 5, 'menu_id', '所属菜单', 100, 'int', 'easyui-combobox', 1, 1, 1, 1, 1, 0, 'select id, menu_name from sys_menu', 1, 1, 0, NULL, '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES (28, 5, 'class_name', '页面class名称', 100, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 3, 1, 0, NULL, '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES (27, 5, 'btn_name', '按钮名称', 100, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 2, 1, 0, NULL, '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES (34, 6, 'value', '字段件值', 80, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 5, 1, 0, NULL, '2016-02-25 23:55:58');
INSERT INTO `zcurd_field` VALUES (36, 6, 'symbol', '符号', 80, 'varchar', 'easyui-combobox', 1, 1, 1, 1, 0, 0, 'select dict_key, dict_value from sys_dict where dict_type=\'datarule_symbol\'', 4, 1, 0, NULL, '2016-02-28 03:20:56');
INSERT INTO `zcurd_field` VALUES (33, 6, 'field_name', '字段名称', 100, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 3, 1, 0, NULL, '2016-02-25 23:55:58');
INSERT INTO `zcurd_field` VALUES (32, 6, 'menu_id', '菜单', 100, 'int', 'easyui-combobox', 1, 1, 1, 1, 1, 0, 'select id, menu_name from sys_menu', 2, 1, 0, NULL, '2016-02-25 23:55:58');
INSERT INTO `zcurd_field` VALUES (194, 15, 'overduecount', '逾期次数', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 123, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (193, 15, 'repaystatus', '还款情况', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 122, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (192, 15, 'mortgageremark', '按揭备注', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 121, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (191, 15, 'mortgagestatus', '按揭情况', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 120, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (181, 15, 'refundamount', '退款金额', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 110, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (43, 8, 'role_name', '角色名称', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 1, 1, 0, NULL, '2016-02-12 01:58:39');
INSERT INTO `zcurd_field` VALUES (42, 8, 'id', 'id', 120, 'int', 'easyui-numberspinner', 1, 1, 1, 1, 0, 0, '', 0, 1, 0, NULL, '2016-02-12 01:58:39');
INSERT INTO `zcurd_field` VALUES (44, 8, 'create_time', '创建时间', 120, 'timestamp', 'easyui-datebox', 1, 1, 0, 0, 0, 1, '', 2, 1, 0, NULL, '2016-02-12 01:58:39');
INSERT INTO `zcurd_field` VALUES (30, 5, 'create_time', '创建时间', 120, 'timestamp', 'easyui-datebox', 0, 0, 0, 0, 0, 0, '', 5, 1, 0, NULL, '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES (37, 7, 'id', 'id', 120, 'int', 'easyui-numberspinner', 1, 1, 1, 1, 0, 0, '', 0, 1, 0, NULL, '2016-03-01 04:39:14');
INSERT INTO `zcurd_field` VALUES (41, 7, 'create_time', '创建时间', 120, 'timestamp', 'easyui-datebox', 1, 1, 0, 0, 1, 0, '', 4, 2, 0, NULL, '2016-03-01 04:39:14');
INSERT INTO `zcurd_field` VALUES (40, 7, 'dict_value', '值', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 2, 1, 0, NULL, '2016-03-01 04:39:14');
INSERT INTO `zcurd_field` VALUES (39, 7, 'dict_key', '键', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 3, 1, 0, NULL, '2016-03-01 04:39:14');
INSERT INTO `zcurd_field` VALUES (38, 7, 'dict_type', '类型', 120, 'varchar', 'easyui-combobox', 1, 1, 1, 1, 1, 0, 'select distinct dict_type as \'key\', dict_type as \'value\' from sys_dict', 1, 1, 0, NULL, '2016-03-01 04:39:14');
INSERT INTO `zcurd_field` VALUES (61, 12, 'roles', '角色', 120, 'varchar', 'easyui-combobox', 1, 1, 1, 1, 0, 1, 'select id, role_name from sys_role', 4, 1, 0, NULL, '2016-02-23 04:31:08');
INSERT INTO `zcurd_field` VALUES (60, 12, 'create_time', '创建时间', 120, 'timestamp', 'easyui-textbox', 1, 1, 0, 0, 1, 1, '', 5, 2, 0, NULL, '2016-01-07 21:31:45');
INSERT INTO `zcurd_field` VALUES (59, 12, 'password', '密码', 120, 'varchar', 'easyui-textbox', 0, 0, 1, 0, 0, 1, '', 3, 1, 0, NULL, '2016-01-07 21:31:45');
INSERT INTO `zcurd_field` VALUES (57, 12, 'id', 'id', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, '', 1, 1, 0, NULL, '2016-01-07 21:31:45');
INSERT INTO `zcurd_field` VALUES (58, 12, 'user_name', '用户名', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 2, 1, 0, NULL, '2016-01-07 21:31:45');
INSERT INTO `zcurd_field` VALUES (180, 15, 'consultantphone', '顾问号码', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 109, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (179, 15, 'houseConsultant', '职业顾问', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 108, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (178, 15, 'loanbankaccount', '还款银行卡号', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 107, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (177, 15, 'accountbranch', '开户支行', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 106, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (31, 6, 'id', 'id', 120, 'int', 'easyui-numberspinner', 1, 1, 1, 1, 0, 0, '', 1, 1, 0, NULL, '2016-02-25 23:55:58');
INSERT INTO `zcurd_field` VALUES (176, 15, 'applyloandate', '申请放款时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 105, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (175, 15, 'urgentlevel', '紧急程度', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 104, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (174, 15, 'othertime', 'othertime', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 103, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (173, 15, 'otheramount', '加他付款方式', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 102, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (172, 15, 'transfertime', '转账时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 101, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (171, 15, 'transferamount', '转账金额', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 100, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (170, 15, 'cashtime', '现金付款时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 99, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (169, 15, 'cashamount', '现金金额', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 98, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (168, 15, 'postime', 'pos刷卡时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 97, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (167, 15, 'posamount', '放款金额', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 96, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (166, 15, 'recviway', '还款方式1 pos机器 2现金  3转账  4其他', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 95, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (165, 15, 'loantime', '放款时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 94, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (164, 15, 'loanstatus', '放款状态', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 93, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (163, 15, 'signtime', '签约时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 92, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (162, 15, 'signstatus', '签约状态', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 91, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (161, 15, 'repay', 'repay', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 90, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (160, 15, 'period', 'period', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 89, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (159, 15, 'personPath', 'personPath', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 88, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (158, 15, 'fkid', 'fkid', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 87, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (157, 15, 'examindate', '报审时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 86, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (156, 15, 'fundname', 'fundname', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 85, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (155, 15, 'fund', 'fund', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 84, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (154, 15, 'loantimelimit', 'loantimelimit', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 83, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (153, 15, 'zcompanyaddress', 'zcompanyaddress', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 82, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (152, 15, 'gunitaddress', 'gunitaddress', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 81, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (151, 15, 'xsname', 'xsname', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 80, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (150, 15, 'xsid', 'xsid', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 79, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (149, 15, 'relations', 'relations', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 78, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (148, 15, 'creditLoanMoney', 'creditLoanMoney', 120, 'double', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 77, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (147, 15, 'zenterpborrow', 'zenterpborrow', 120, 'double', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 76, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (146, 15, 'creditNumber', 'creditNumber', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 75, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (145, 15, 'aname', 'aname', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 74, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (144, 15, 'ctime', 'ctime', 120, 'datetime', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 73, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (143, 15, 'adid', 'adid', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 72, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (142, 15, 'contposition', '紧急联系人工作职位', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 71, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (141, 15, 'contworkdep', '紧急联系人工作部门', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 70, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (140, 15, 'contunitaddress', '紧急联系人单位地址', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 69, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (139, 15, 'contunitphone', '紧急联系人单位电话', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 68, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (138, 15, 'contunitname', '紧急联系人单位名称', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 67, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (137, 15, 'contaddress', '紧急联系人地址', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 66, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (136, 15, 'contphone', '紧急联系人住宅电话', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 65, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (135, 15, 'contmobile', '紧急联系人电话', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 64, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (134, 15, 'contloan', '经济联系人是否知晓贷款', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 63, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (133, 15, 'contrelation', '紧急联系人关系', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 62, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (132, 15, 'contsex', '紧急联系人性别', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 61, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (131, 15, 'contage', '紧急联系人年龄', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 60, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (130, 15, 'contname', '紧急联系人姓名', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 59, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (129, 15, 'otherloan', '其他贷款', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 58, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (128, 15, 'creditconsume', '信用卡已消费', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 57, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (127, 15, 'creditlimit', '信用卡最高额度', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 56, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (126, 15, 'bankaccount', '用户银行账户', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 55, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (125, 15, 'age', '年龄', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 54, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (124, 15, 'zsharesratio', '占股比例-自雇', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 53, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (123, 15, 'zmanageplace', '经营场所-自雇', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 52, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (122, 15, 'zenterploan', '企业借款-自雇', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 51, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (121, 15, 'zenterpfund', '企业资产-自雇', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 50, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (120, 15, 'zyearbus', '年营业额-自雇', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 49, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (119, 15, 'zmonincome', '月收入—自雇', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 48, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (118, 15, 'zindustrytype', '行业类型-自雇', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 47, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (117, 15, 'zcompanyname', '企业名-自雇', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 46, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (116, 15, 'gsalaryway', '工作发放形式-工薪', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 45, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (115, 15, 'gworklife', '工作年限-工薪', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 44, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (114, 15, 'gmonincome', '月收入-工薪', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 43, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (113, 15, 'gjoblevel', '工作级别-工薪', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 42, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (112, 15, 'gunitnature', '单位性质-工薪', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 41, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (111, 15, 'gunitname', '单位名称-工薪', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 40, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (110, 15, 'job', '职业', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 39, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (109, 15, 'familyaddress', '家庭地址', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 38, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (108, 15, 'marriagestatus', '婚姻状态', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 37, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (107, 15, 'homestatus', '置业状况', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 36, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (106, 15, 'applyamount', '申请金额', 120, 'double', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 35, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (105, 15, 'loanproduct', '贷款产品', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 34, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (104, 15, 'fristpayratio', '首付比例', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 33, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (103, 15, 'buyhouseamount', '购房金额', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 32, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (102, 15, 'familycount', '家庭人口数量', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 31, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (101, 15, 'salaryway', '工资发放形式', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 30, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (100, 15, 'domloction', '户籍所在地', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 29, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (99, 15, 'health', '健康状况', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 28, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (98, 15, 'higdegree', '最高学位', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 27, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (97, 15, 'pidunit', '发证机关', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 26, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (96, 15, 'pidvaildity', '证件有效期', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 25, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (95, 15, 'pidtype', '证件类型', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 24, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (94, 15, 'nation', '民族', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 23, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (93, 15, 'natiomality', '国籍', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 22, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (10221, 33, 'create_time', '创建时间', 120, 'timestamp', 'easyui-datebox', 1, 1, 0, 0, 0, 0, '', 50, 1, 0, '', '2019-08-24 03:26:02');
INSERT INTO `zcurd_field` VALUES (10220, 33, 'dict_value', '等级名称', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 40, 1, 0, '', '2019-08-24 03:26:02');
INSERT INTO `zcurd_field` VALUES (10217, 33, 'id', 'id', 120, 'int unsigned', 'easyui-textbox', 0, 0, 0, 0, 0, 0, '', 1, 1, 0, '', '2019-08-24 03:26:02');
INSERT INTO `zcurd_field` VALUES (10219, 33, 'dict_key', '等级代号', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 30, 1, 0, '', '2019-08-24 03:26:02');
INSERT INTO `zcurd_field` VALUES (10218, 33, 'dict_type', '类型', 120, 'varchar', 'easyui-textbox', 0, 0, 0, 0, 0, 0, '', 20, 1, 0, 'card_user_level', '2019-08-24 03:26:02');
INSERT INTO `zcurd_field` VALUES (92, 15, 'birthday', '出生年月', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 21, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (91, 15, 'sex', '客户性别', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 20, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (90, 15, 'etime', '贷款结束时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 19, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (89, 15, 'stime', '贷款开始时间', 120, 'date', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 18, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (88, 15, 'price', '贷款金额', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 0, NULL, 17, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (87, 15, 'ordercode', '订单id', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 16, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (86, 15, 'tempcontent', '修改数据', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 15, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (85, 15, 'score', '按模型计算得分', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 14, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (84, 15, 'mid', '使用模型', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 13, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (83, 15, 'status', '状态', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 12, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (82, 15, 'type', '客户类型', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 11, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (81, 15, 'pname', '项目名', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 10, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (80, 15, 'pid', '项目id', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 9, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (79, 15, 'cityname', '城市名', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 8, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (78, 15, 'cityid', '城市id', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 7, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (77, 15, 'mobile', '客户手机号码', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 6, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (76, 15, 'idcard', '客户身份证', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 5, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (75, 15, 'name', '客户姓名', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 4, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (74, 15, 'parentid', '主借人id', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 3, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (73, 15, 'source', '客户来源', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 2, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (72, 15, 'cid', '主键客户信息表', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 1, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (10215, 32, 'info', '简介', 120, 'varchar', 'textarea', 1, 1, 1, 1, 0, 1, '', 40, 1, 0, '', '2019-08-24 03:13:08');
INSERT INTO `zcurd_field` VALUES (10216, 32, 'price', '市场价', 120, 'decimal', 'easyui-numberspinner', 1, 1, 1, 1, 1, 1, '', 50, 2, 0, '', '2019-08-24 03:13:08');
INSERT INTO `zcurd_field` VALUES (10213, 32, 'name', '奖品名称', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 20, 1, 0, '', '2019-08-24 03:13:08');
INSERT INTO `zcurd_field` VALUES (10211, 31, 'updatetime', '更新时间', 120, 'datetime', 'easyui-datebox', 1, 1, 0, 0, 0, 0, '', 90, 1, 0, '', '2019-08-23 02:49:31');
INSERT INTO `zcurd_field` VALUES (10214, 32, 'pic', '图片', 120, 'varchar', 'easyui-filebox_img', 1, 1, 1, 1, 0, 1, '', 30, 1, 0, '', '2019-08-24 03:13:08');
INSERT INTO `zcurd_field` VALUES (10209, 31, 'level', '等级', 120, 'smallint', 'easyui-combobox', 1, 1, 1, 1, 1, 0, 'select dict_key,dict_value from sys_dict where dict_type=\'card_user_level\' ', 70, 1, 0, '', '2019-08-23 02:49:31');
INSERT INTO `zcurd_field` VALUES (10000, 1, 'head_id', '所属表单', 100, 'int', 'easyui-combobox', 1, 1, 1, 1, 1, 0, 'select id, form_name from zcurd_head', 1, 1, 0, NULL, '2016-09-27 00:06:53');
INSERT INTO `zcurd_field` VALUES (3, 1, 'btn_name', '按钮名称', 80, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 2, 1, 0, NULL, '2016-01-11 21:58:48');
INSERT INTO `zcurd_field` VALUES (35, 6, 'create_time', '创建时间', 120, 'timestamp', 'easyui-datebox', 0, 0, 0, 0, 0, 0, '', 6, 1, 0, NULL, '2016-02-25 23:55:58');
INSERT INTO `zcurd_field` VALUES (25, 5, 'id', 'id', 120, 'int', 'easyui-numberspinner', 1, 1, 1, 1, 0, 0, '', 0, 1, 0, NULL, '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES (29, 5, 'method_name', '后台method名称', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, '', 4, 1, 0, NULL, '2016-02-14 16:35:56');
INSERT INTO `zcurd_field` VALUES (195, 15, 'overfueremark', '逾期记录', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 124, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (196, 15, 'cheLoanMoney', 'cheLoanMoney', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 125, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (197, 15, 'houseLoanMoney', 'houseLoanMoney', 120, 'int', 'easyui-textbox', 1, 1, 1, 1, 0, 1, NULL, 126, 1, 0, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_field` VALUES (10001, 2, 'sql_content', '扩展sql', 120, 'varchar', 'textarea', 1, 1, 1, 1, 0, 1, '', 3, 1, 0, NULL, '2016-11-19 16:08:05');
INSERT INTO `zcurd_field` VALUES (9, 2, 'head_id', '所属表单', 120, 'int', 'easyui-combobox', 1, 1, 1, 1, 1, 0, 'select id, form_name from zcurd_head', 1, 1, 0, NULL, '2016-01-12 15:35:01');
INSERT INTO `zcurd_field` VALUES (10004, 18, 'url', '图片地址', 120, 'varchar', 'easyui-filebox_img', 1, 1, 1, 1, 0, 0, '', 3, 1, 0, NULL, '2016-12-20 00:17:53');
INSERT INTO `zcurd_field` VALUES (10005, 18, 'create_time', '创建时间', 120, 'timestamp', 'easyui-datebox', 1, 1, 0, 0, 0, 0, '', 4, 1, 0, NULL, '2016-12-20 00:17:53');
INSERT INTO `zcurd_field` VALUES (10003, 18, 'name', '图片名称', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 2, 1, 0, NULL, '2016-12-20 00:17:53');
INSERT INTO `zcurd_field` VALUES (10002, 18, 'id', 'id', 120, 'int unsigned', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 1, 1, 0, NULL, '2016-12-20 00:17:53');
INSERT INTO `zcurd_field` VALUES (10212, 32, 'id', 'id', 120, 'int unsigned', 'easyui-textbox', 1, 0, 0, 0, 0, 0, '', 1, 1, 0, '', '2019-08-24 03:13:08');
INSERT INTO `zcurd_field` VALUES (10210, 31, 'createtime', '注册时间', 120, 'datetime', 'easyui-datebox', 1, 1, 0, 0, 1, 0, '', 80, 2, 0, '', '2019-08-23 02:49:31');
INSERT INTO `zcurd_field` VALUES (10207, 31, 'idcard', '身份证号', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 50, 1, 0, '', '2019-08-23 02:49:31');
INSERT INTO `zcurd_field` VALUES (10038, 1, 'btn_icon', '按钮图标', 80, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 3, 1, 0, NULL, '2017-01-27 15:38:07');
INSERT INTO `zcurd_field` VALUES (10044, 23, 'create_user_id', '创建人', 120, 'int', 'easyui-numberspinner', 0, 1, 0, 0, 0, 1, '', 10, 1, 0, '${user.id}', '2017-03-04 16:10:22');
INSERT INTO `zcurd_field` VALUES (10047, 23, 'status', '状态', 80, 'int', 'easyui-combobox', 1, 1, 1, 1, 1, 1, 'select dict_key, dict_value from sys_dict where dict_type=\'task_statu\'', 9, 1, 0, '2', '2017-03-04 16:10:22');
INSERT INTO `zcurd_field` VALUES (10046, 23, 'last_run_time_cost', '上次执行耗时', 90, 'int', 'easyui-numberspinner', 1, 1, 0, 0, 0, 1, '', 8, 1, 0, '', '2017-03-04 16:10:22');
INSERT INTO `zcurd_field` VALUES (10045, 23, 'last_run_time', '上次执行时间', 120, 'datetime', 'easyui-datebox', 1, 1, 0, 0, 0, 1, '', 7, 1, 0, '', '2017-03-04 16:10:22');
INSERT INTO `zcurd_field` VALUES (10049, 23, 'last_run_result', '上次执行结果', 90, NULL, 'easyui-textbox', 1, 1, 0, 0, 0, 1, '', 5, 1, 0, '', '2017-03-12 23:52:52');
INSERT INTO `zcurd_field` VALUES (10043, 23, 'cron', 'cron表达式', 100, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 4, 1, 0, '', '2017-03-04 16:10:22');
INSERT INTO `zcurd_field` VALUES (10040, 23, 'name', '名称', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 1, 1, 0, '', '2017-03-04 16:10:22');
INSERT INTO `zcurd_field` VALUES (10041, 23, 'target_type', '任务类型', 70, 'int', 'easyui-combobox', 1, 1, 1, 1, 1, 0, 'select dict_key, dict_value from sys_dict where dict_type=\'task_type\'', 2, 1, 0, '', '2017-03-04 16:10:22');
INSERT INTO `zcurd_field` VALUES (10042, 23, 'target_value', '任务值', 140, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 3, 1, 0, '', '2017-03-04 16:10:22');
INSERT INTO `zcurd_field` VALUES (10039, 23, 'id', 'id', 120, 'int', 'easyui-numberspinner', 1, 1, 1, 1, 0, 0, '', 0, 1, 0, '', '2017-03-04 16:10:22');
INSERT INTO `zcurd_field` VALUES (10048, 23, 'create_time', '创建时间', 120, 'timestamp', 'easyui-datebox', 1, 1, 0, 0, 0, 1, '', 10, 1, 0, '', '2017-03-04 16:10:22');
INSERT INTO `zcurd_field` VALUES (10050, 24, 'id', 'id', 120, 'int', 'easyui-numberspinner', 1, 1, 0, 0, 0, 0, '', 1, 1, 0, '', '2017-03-15 00:07:20');
INSERT INTO `zcurd_field` VALUES (10051, 24, 'task_id', '所属任务', 120, 'int', 'easyui-combobox', 1, 1, 0, 0, 1, 1, 'select id, name from task_base', 2, 1, 0, '', '2017-03-15 00:07:20');
INSERT INTO `zcurd_field` VALUES (10052, 24, 'result', '执行结果', 80, 'varchar', 'easyui-textbox', 1, 1, 0, 0, 0, 1, '', 3, 1, 0, '', '2017-03-15 00:07:20');
INSERT INTO `zcurd_field` VALUES (10053, 24, 'start_time', '开始时间', 130, 'datetime', 'easyui-datebox', 1, 1, 0, 0, 0, 1, '', 4, 1, 0, '', '2017-03-15 00:07:20');
INSERT INTO `zcurd_field` VALUES (10054, 24, 'end_time', '结束时间', 130, 'datetime', 'easyui-datebox', 0, 1, 0, 0, 0, 1, '', 5, 1, 0, '', '2017-03-15 00:07:20');
INSERT INTO `zcurd_field` VALUES (10055, 24, 'cost_time', '耗时(毫秒)', 80, 'int', 'easyui-numberspinner', 1, 1, 0, 0, 0, 1, '', 6, 1, 0, '', '2017-03-15 00:07:20');
INSERT INTO `zcurd_field` VALUES (10056, 24, 'remark', '备注', 120, 'varchar', 'easyui-textbox', 1, 1, 0, 0, 0, 1, '', 7, 1, 0, '', '2017-03-15 00:07:20');
INSERT INTO `zcurd_field` VALUES (10227, 34, 'endtime', '结束时间', 120, 'datetime', 'easyui-datetimebox', 1, 1, 1, 1, 0, 1, '', 60, 1, 0, '', '2019-08-24 03:31:13');
INSERT INTO `zcurd_field` VALUES (10228, 34, 'type', '类型', 120, 'tinyint', 'easyui-combobox', 1, 1, 1, 1, 1, 1, 'select dict_key,dict_value from sys_dict where dict_type=\'card_game_type\'', 70, 1, 0, '', '2019-08-24 03:31:13');
INSERT INTO `zcurd_field` VALUES (10226, 34, 'starttime', '开始时间', 120, 'datetime', 'easyui-datetimebox', 1, 1, 1, 1, 1, 1, '', 50, 2, 0, '', '2019-08-24 03:31:13');
INSERT INTO `zcurd_field` VALUES (10222, 34, 'id', 'id', 120, 'int unsigned', 'easyui-textbox', 1, 0, 0, 0, 0, 0, '', 1, 1, 0, '', '2019-08-24 03:31:13');
INSERT INTO `zcurd_field` VALUES (10224, 34, 'info', '活动简介', 120, 'varchar', 'textarea', 0, 1, 1, 1, 0, 1, '', 30, 1, 0, '', '2019-08-24 03:31:13');
INSERT INTO `zcurd_field` VALUES (10223, 34, 'title', '活动主题', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 20, 1, 0, '', '2019-08-24 03:31:13');
INSERT INTO `zcurd_field` VALUES (10237, 36, 'goal_times', '最大中奖次数（0为不限）', 120, 'smallint', 'easyui-numberspinner', 1, 1, 1, 1, 0, 0, '', 50, 1, 0, '0', '2019-09-02 10:31:09');
INSERT INTO `zcurd_field` VALUES (10236, 36, 'enter_times', '可抽奖次数（0为不限）', 120, 'smallint', 'easyui-numberspinner', 1, 1, 1, 1, 0, 0, '', 40, 1, 0, '0', '2019-09-02 10:31:09');
INSERT INTO `zcurd_field` VALUES (10234, 36, 'gameid', '活动', 120, 'int unsigned', 'easyui-combobox', 1, 1, 0, 0, 0, 0, 'select id,title from card_game', 20, 1, 0, '', '2019-09-02 10:31:09');
INSERT INTO `zcurd_field` VALUES (10235, 36, 'userlevel', '会员等级', 120, 'smallint', 'easyui-combobox', 1, 1, 1, 1, 0, 0, 'select dict_key,dict_value from sys_dict where dict_type=\'card_user_level\' ', 30, 1, 0, '', '2019-09-02 10:31:09');
INSERT INTO `zcurd_field` VALUES (10232, 35, 'amount', '数量', 120, 'smallint', 'easyui-numberspinner', 1, 1, 1, 1, 0, 0, '', 40, 1, 0, '', '2019-08-24 13:02:57');
INSERT INTO `zcurd_field` VALUES (10231, 35, 'productid', '奖品', 120, 'int', 'easyui-combobox', 1, 1, 1, 1, 0, 0, 'select id,name from card_product', 30, 1, 0, '', '2019-08-24 13:02:57');
INSERT INTO `zcurd_field` VALUES (10230, 35, 'gameid', '活动', 120, 'int', 'easyui-combobox', 1, 1, 1, 1, 0, 0, 'select id,title from card_game', 20, 1, 0, '', '2019-08-24 13:02:57');
INSERT INTO `zcurd_field` VALUES (10229, 35, 'id', 'id', 120, 'int unsigned', 'easyui-textbox', 0, 0, 0, 0, 0, 0, '', 1, 1, 0, '', '2019-08-24 13:02:57');
INSERT INTO `zcurd_field` VALUES (10205, 31, 'passwd', '密码', 120, 'varchar', 'easyui-textbox', 0, 0, 1, 0, 0, 0, '', 30, 1, 0, '', '2019-08-23 02:49:31');
INSERT INTO `zcurd_field` VALUES (10206, 31, 'realname', '姓名', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 40, 1, 0, '', '2019-08-23 02:49:31');
INSERT INTO `zcurd_field` VALUES (10204, 31, 'uname', '用户名', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 20, 1, 0, '', '2019-08-23 02:49:31');
INSERT INTO `zcurd_field` VALUES (10233, 36, 'id', 'id', 120, 'int', 'easyui-numberspinner', 1, 1, 0, 0, 0, 0, '', 1, 1, 0, '', '2019-09-02 10:31:09');
INSERT INTO `zcurd_field` VALUES (10208, 31, 'phone', '手机号码', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 60, 1, 0, '', '2019-08-23 02:49:31');
INSERT INTO `zcurd_field` VALUES (10203, 31, 'id', 'id', 120, 'int unsigned', 'easyui-textbox', 1, 0, 0, 0, 0, 0, '', 1, 1, 0, '', '2019-08-23 02:49:31');
INSERT INTO `zcurd_field` VALUES (10265, 38, 'hittime', '中奖时间', 120, 'datetime', 'easyui-datebox', 1, 1, 1, 1, 1, 1, '', 150, 2, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10264, 38, 'productid', '奖品id', 120, 'int unsigned', 'easyui-textbox', 0, 1, 1, 1, 0, 1, '', 140, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10263, 38, 'userid', '用户id', 120, 'int unsigned', 'easyui-textbox', 0, 1, 1, 1, 0, 1, '', 130, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10261, 38, 'price', '市场价', 120, 'decimal', 'easyui-textbox', 1, 1, 1, 1, 0, 1, '', 110, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10262, 38, 'gameid', '活动id', 120, 'int unsigned', 'easyui-textbox', 0, 1, 1, 1, 0, 1, '', 120, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10260, 38, 'name', '奖品名称', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 100, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10259, 38, 'level', '会员等级', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 90, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10257, 38, 'idcard', '身份证号', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 70, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10258, 38, 'phone', '手机号码', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 80, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10256, 38, 'realname', '姓名', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 1, '', 60, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10253, 38, 'title', '活动主题', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 30, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10254, 38, 'type', '活动类型', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 40, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10255, 38, 'uname', '用户名', 120, 'varchar', 'easyui-textbox', 1, 1, 1, 1, 1, 0, '', 50, 1, 0, '', '2019-09-10 14:55:11');
INSERT INTO `zcurd_field` VALUES (10252, 38, 'id', 'id', 120, 'int unsigned', 'easyui-textbox', 1, 1, 1, 1, 0, 0, '', 20, 1, 0, '', '2019-09-10 14:55:11');

-- ----------------------------
-- Table structure for zcurd_head
-- ----------------------------
DROP TABLE IF EXISTS `zcurd_head`;
CREATE TABLE `zcurd_head`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库表名',
  `form_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单名称',
  `id_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'id' COMMENT '主键字段',
  `is_auto` int(11) NULL DEFAULT 1 COMMENT '是否自增',
  `form_type` int(11) NULL DEFAULT 1 COMMENT '表单类型（1:单表,2:主从）',
  `dialog_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '600x400' COMMENT '弹窗大小',
  `db_source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源',
  `handle_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理类',
  `delete_flag_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标志字段',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zcurd_head
-- ----------------------------
INSERT INTO `zcurd_head` VALUES (1, 'zcurd_head_btn', '表单扩展按钮', 'id', 1, 1, '600x400', 'zcurd_base', 'com.zcurd.common.handler.FlushFormCurdHandle', NULL, '2016-01-11 21:58:48');
INSERT INTO `zcurd_head` VALUES (2, 'zcurd_head_js', '表单扩展js', 'id', 1, 1, '600x400', 'zcurd_base', 'com.zcurd.common.handler.FlushFormCurdHandle', NULL, '2016-01-12 15:35:01');
INSERT INTO `zcurd_head` VALUES (5, 'sys_menu_btn', '菜单按钮（权限编辑）', 'id', 1, 1, '400x300', 'zcurd_base', NULL, NULL, '2016-02-14 16:35:56');
INSERT INTO `zcurd_head` VALUES (6, 'sys_menu_datarule', '菜单数据（权限编辑）', 'id', 1, 1, '400x300', 'zcurd_base', NULL, NULL, '2016-02-25 23:55:58');
INSERT INTO `zcurd_head` VALUES (7, 'sys_dict', '数据字典', 'id', 1, 1, '400x300', 'zcurd_base', NULL, NULL, '2016-03-01 04:39:14');
INSERT INTO `zcurd_head` VALUES (8, 'sys_role', '角色管理', 'id', 1, 1, '400x300', 'zcurd_base', NULL, NULL, '2016-02-12 01:58:39');
INSERT INTO `zcurd_head` VALUES (18, 'images', '图片管理', 'id', 1, 1, '600x400', 'zcurd_busi', NULL, NULL, '2016-12-20 00:17:53');
INSERT INTO `zcurd_head` VALUES (12, 'sys_user', '用户管理', 'id', 1, 1, '400x300', 'zcurd_base', 'com.zcurd.common.handler.PasswordCurdHandle', NULL, '2016-01-07 21:31:45');
INSERT INTO `zcurd_head` VALUES (15, 'customer', '客户管理', 'cid', 1, 1, '800x600', 'zcurd_busi', NULL, NULL, '2016-09-18 17:31:32');
INSERT INTO `zcurd_head` VALUES (33, 'sys_dict', '会员等级管理', 'id', 1, 1, '600x400', 'zcurd_base', NULL, NULL, '2019-08-24 03:26:02');
INSERT INTO `zcurd_head` VALUES (34, 'card_game', '活动管理', 'id', 1, 1, '600x400', 'zcurd_busi', NULL, NULL, '2019-08-24 03:31:13');
INSERT INTO `zcurd_head` VALUES (35, 'card_game_product', '配置奖品', 'id', 1, 1, '400x200', 'zcurd_busi', NULL, NULL, '2019-08-24 13:02:57');
INSERT INTO `zcurd_head` VALUES (32, 'card_product', '奖品管理', 'id', 1, 1, '600x400', 'zcurd_busi', NULL, NULL, '2019-08-24 03:13:08');
INSERT INTO `zcurd_head` VALUES (23, 'task_base', '定时任务', 'id', 1, 1, '600x400', 'zcurd_base', NULL, NULL, '2017-03-04 16:10:22');
INSERT INTO `zcurd_head` VALUES (24, 'task_log', '定时任务-日志', 'id', 1, 1, '600x400', 'zcurd_base', NULL, NULL, '2017-03-15 00:07:20');
INSERT INTO `zcurd_head` VALUES (31, 'card_user', '会员信息', 'id', 1, 1, '600x450', 'zcurd_busi', NULL, NULL, '2019-08-23 02:49:31');
INSERT INTO `zcurd_head` VALUES (36, 'card_game_rules', '活动策略', 'id', 1, 1, '600x400', 'zcurd_busi', NULL, NULL, '2019-09-02 10:31:09');
INSERT INTO `zcurd_head` VALUES (38, 'view_card_user_hit', '中奖信息', 'id', 1, 1, '600x400', 'zcurd_busi', NULL, NULL, '2019-09-10 14:55:11');

-- ----------------------------
-- Table structure for zcurd_head_btn
-- ----------------------------
DROP TABLE IF EXISTS `zcurd_head_btn`;
CREATE TABLE `zcurd_head_btn`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `head_id` int(11) NULL DEFAULT NULL COMMENT '所属表单',
  `btn_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮名称',
  `btn_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮图标',
  `location` int(11) NULL DEFAULT 1 COMMENT '按钮位置（1：顶部，2：行内）',
  `action` int(11) NULL DEFAULT 1 COMMENT '行为（0：无，1：打开子页面）',
  `func_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法内容',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单按钮' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zcurd_head_btn
-- ----------------------------
INSERT INTO `zcurd_head_btn` VALUES (1, 8, '权限设置', NULL, 2, 1, 'function(index) {\r\n var row = datagrid.datagrid(\"getRows\")[index];\r\n  //var url = basePath + \"/zcurd/135/listPage?riskgradeid=\" + row.id;\r\n var url = basePath + \"/role/editAuthPage?roleId=\" + row.id;\r\n _openSubPage(url);\r\n}', '2016-02-12 21:23:10');
INSERT INTO `zcurd_head_btn` VALUES (2, 134, '管理', NULL, 2, 1, 'function(index) {\n var row = datagrid.datagrid(\"getRows\")[index];\n  var url = basePath + \"/zcurd/135/listPage?riskgradeid=\" + row.id;\n _openSubPage(url);\n}', '2016-01-12 13:28:50');
INSERT INTO `zcurd_head_btn` VALUES (3, 133, '测试', NULL, 2, 0, 'function(){}', '2016-01-13 09:30:35');
INSERT INTO `zcurd_head_btn` VALUES (4, 12, '重置密码', 'glyphicon-repeat', 1, 0, 'function() {\n    var rowsSel = datagrid.datagrid(\"getSelections\");\n	if(rowsSel.length != 1) {\n		showWarnMsg(\"请选择需要重置密码的一条数据！\");\n		return;\n	}\n	confirmMsg(\"确认重置密码？\", function() {\n		var id = rowsSel[0].id;\n		$.post(basePath + \"/user/resetPassword\", {id: id}, function() {\n			showMsg(\"密码重置成功！\");\n		});\n	});\n}', '2017-01-27 13:44:37');
INSERT INTO `zcurd_head_btn` VALUES (5, 23, '停止', 'xx', 2, 0, 'function() {\n\n}', '2017-03-12 23:12:56');
INSERT INTO `zcurd_head_btn` VALUES (6, 22, 'aaabbbcc', 'aaa', 1, 0, 'function() {}', '2017-04-12 00:46:35');
INSERT INTO `zcurd_head_btn` VALUES (7, 30, '测试按钮', NULL, 1, 0, 'alert(1);', '2019-08-22 11:49:40');
INSERT INTO `zcurd_head_btn` VALUES (8, 18, '测试按钮', '1', 1, 0, 'function btnClick8(a){\n	var ids = [];\n	$.each(datagrid.datagrid(\"getSelections\"), function(i, item) {\n		ids.push(item.id);\n	});\n	if(ids.length < 1) {\n		showWarnMsg(\"请选择需要删除的数据！\");\n		return;\n	}\n	confirmMsg(\"确认删除？\", function() {\n		showWarnMsg(\"删什么删？只是个测试按钮\"+ids);\n	});\n\n}', '2019-08-22 11:52:00');
INSERT INTO `zcurd_head_btn` VALUES (9, 34, '奖品配置', 'glyphicon-export', 2, 1, 'function(index){\nvar row = datagrid.datagrid(\"getRows\")[index];\n \n var url = basePath + \"/gameproduct/listPage?gameid=\" + \n  row.id;\n _openSubPage(url);\n\n}', '2019-08-24 14:13:50');
INSERT INTO `zcurd_head_btn` VALUES (10, 34, '策略配置', 'glyphicon-pencil', 2, 1, 'function(index){\nvar row = datagrid.datagrid(\"getRows\")[index];\n \n var url = basePath + \"/gamerules/listPage?gameid=\" + \n  row.id;\n _openSubPage(url);\n\n}', '2019-09-02 10:54:32');

-- ----------------------------
-- Table structure for zcurd_head_js
-- ----------------------------
DROP TABLE IF EXISTS `zcurd_head_js`;
CREATE TABLE `zcurd_head_js`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `head_id` int(11) NULL DEFAULT NULL COMMENT '所属表单',
  `page` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面',
  `sql_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展sql',
  `js_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展js',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单扩展js' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zcurd_head_js
-- ----------------------------
INSERT INTO `zcurd_head_js` VALUES (1, 134, 'list', NULL, 'var operateWidth = 80;\r\nvar subPageWidth = \"50%\";\r\nvar subPageTitle = \"等级详情\";\r\ndgOptions.singleSelect=true;', '2016-01-12 16:25:45');
INSERT INTO `zcurd_head_js` VALUES (2, 5, 'list', NULL, '$(\"#searchBtnWrap\").hide();\n$(\".wrap_search\").hide();\ndgOptions.pageSize=1000;\ndgOptions.pagination=false;\n\nwindow.parent.getDgSelections = function() {\n    return datagrid.datagrid(\"getSelections\");\n}\n\ndgOptions.onLoadSuccess = selectAuthRow;\nfunction selectAuthRow() {\n  	var btnIds = window.parent.getCurrMenuBtns();\n 	var rows = datagrid.datagrid(\"getData\").rows;\n 	if(btnIds && rows.length > 0) {\n   		$.each(rows, function(i, item) {\n      		$.each(btnIds, function(j, btnId) {\n	       		if(item.id == btnId) {\n	          		datagrid.datagrid(\"selectRow\", i);\n	        	}\n     		});\n   		});\n 	}\n\n 	//如果无数据，则显示一键生成\n	if(rows.length == 0) {\n		genAuthBtnBatch();\n	}\n}\n\n//显示一键生成\nfunction genAuthBtnBatch() {\n	$(\"<button id=\'genAuthBtnBatchBtn\' style=\'position: fixed; top: 120px; left: 50%; margin-left: -30px; padding: 2px;\'>一键生成<button>\")\n	.linkbutton().click(function() {\n		$.post(\"../../role/genAuthBtnBatch\", {menuId: $(\"#menu_id\").val()}, function() {\n			$(\"#genAuthBtnBatchBtn\").remove();\n			showMsg(\"生成成功！\");\n			datagrid.datagrid(\"reload\");\n		});\n	}).appendTo(\"body\");\n}', '2016-02-15 11:13:14');
INSERT INTO `zcurd_head_js` VALUES (3, 8, 'list', NULL, 'var operateWidth = 80;\nvar subPageWidth = \"55%\";\nvar subPageTitle = \"权限设置\";\ndgOptions.singleSelect=true;\n\nif(noAuthBtn.indexOf(\"operate\") != -1) {\n    $.each(dgOptions.columns[0], function(i, item) {\n        if(item. field == \'operate\') {\n            item. hidden = true;\n        }\n    });\n}', '2016-02-16 16:32:31');
INSERT INTO `zcurd_head_js` VALUES (4, 131, 'update', NULL, '$(function() {\n  changeComboboxToMult(\"roles\");\n});', '2016-02-23 23:09:57');
INSERT INTO `zcurd_head_js` VALUES (5, 12, 'add', NULL, '$(function() {\n changeComboboxToMult(\"roles\");\n});', '2016-02-23 23:10:03');
INSERT INTO `zcurd_head_js` VALUES (6, 152, 'list', NULL, '$(\"#searchBtnWrap\").hide();\n$(\".wrap_search\").hide();\ndgOptions.pageSize=1000;\ndgOptions.pagination=false;\n\nwindow.parent.getDgSelections2 = function() {\n    return datagrid.datagrid(\"getSelections\");\n}\n\ndgOptions.onLoadSuccess = selectAuthRow;\nfunction selectAuthRow() {\n var dataruleIds = window.parent.getCurrMenuDatarules();\n var rows = datagrid.datagrid(\"getData\").rows;\n if(dataruleIds && rows.length > 0) {\n    $.each(rows, function(i, item) {\n      $.each(dataruleIds, function(j, dataruleId) {\n       if(item.id == dataruleId) {\n         datagrid.datagrid(\"selectRow\", i);\n        }\n     });\n   });\n }\n}', '2016-02-15 11:13:14');
INSERT INTO `zcurd_head_js` VALUES (7, 6, 'list', NULL, '$(\"#searchBtnWrap\").hide();\n$(\".wrap_search\").hide();\ndgOptions.pageSize=1000;\ndgOptions.pagination=false;\n\nwindow.parent.getDgSelections2 = function() {\n    return datagrid.datagrid(\"getSelections\");\n}\n\ndgOptions.onLoadSuccess = selectAuthRow;\nfunction selectAuthRow() {\n	var dataruleIds = window.parent.getCurrMenuDatarules();\n	var rows = datagrid.datagrid(\"getData\").rows;\n	if(dataruleIds && rows.length > 0) {\n		$.each(rows, function(i, item) {\n			$.each(dataruleIds, function(j, dataruleId) {\n				if(item.id == dataruleId) {\n					datagrid.datagrid(\"selectRow\", i);\n				}\n			});\n		});\n	}\n}', '2016-09-27 00:17:56');
INSERT INTO `zcurd_head_js` VALUES (8, 12, 'update,detail', NULL, '$(function() {\n changeComboboxToMult(\"roles\");\n});', '2016-09-27 00:40:00');
INSERT INTO `zcurd_head_js` VALUES (13, 6, 'update,add', NULL, '$(\"#value_label\").html(\"<a class=\'symbol_var\' title=\'支持变量\'>$</a>\" + $(\"#value_label\").html())', '2017-02-26 00:39:55');
INSERT INTO `zcurd_head_js` VALUES (9, 2, 'update,add', NULL, '$(function() {\n changeComboboxToMult(\"page\");\n});', '2016-11-19 19:52:45');
INSERT INTO `zcurd_head_js` VALUES (14, 24, 'list', NULL, '$(\"#searchBtnWrap\").hide();\n$(\".wrap_search\").hide();\n\n$(\"#tb\").remove();', '2017-03-15 23:59:42');
INSERT INTO `zcurd_head_js` VALUES (15, 18, 'list', NULL, 'function btnClick8(a){\n\nalert(1);\n\n}', '2019-08-22 11:53:07');

-- ----------------------------
-- View structure for view_card_user_hit
-- ----------------------------
DROP VIEW IF EXISTS `view_card_user_hit`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `view_card_user_hit` AS select `h`.`id` AS `id`,`g`.`title` AS `title`,`sd2`.`dict_value` AS `type`,`u`.`uname` AS `uname`,`u`.`realname` AS `realname`,`u`.`idcard` AS `idcard`,`u`.`phone` AS `phone`,`sd1`.`dict_value` AS `level`,`p`.`name` AS `name`,`p`.`price` AS `price`,`h`.`gameid` AS `gameid`,`h`.`userid` AS `userid`,`h`.`productid` AS `productid`,`h`.`hittime` AS `hittime` from (((((`card_game` `g` join `card_product` `p`) join `card_user` `u`) join `card_user_hit` `h`) join `sys_dict` `sd1` on(((`u`.`level` = `sd1`.`dict_key`) and (`sd1`.`dict_type` = 'card_user_level')))) join `sys_dict` `sd2` on(((`g`.`type` = `sd2`.`dict_key`) and (`sd2`.`dict_type` = 'card_game_type')))) where ((`h`.`gameid` = `g`.`id`) and (`h`.`userid` = `u`.`id`) and (`h`.`productid` = `p`.`id`));

-- ----------------------------
-- View structure for view_game_product_num
-- ----------------------------
DROP VIEW IF EXISTS `view_game_product_num`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`%` SQL SECURITY DEFINER VIEW `view_game_product_num` AS select `g`.`id` AS `id`,`g`.`title` AS `title`,`g`.`starttime` AS `starttime`,`g`.`endtime` AS `endtime`,`sd2`.`dict_value` AS `type`,sum(`cgp`.`amount`) AS `total`,count(`h`.`id`) AS `hit` from (((`card_game` `g` left join `card_game_product` `cgp` on((`g`.`id` = `cgp`.`gameid`))) left join `card_user_hit` `h` on((`g`.`id` = `h`.`gameid`))) join `sys_dict` `sd2` on(((`g`.`type` = `sd2`.`dict_key`) and (`sd2`.`dict_type` = 'card_game_type'))));

SET FOREIGN_KEY_CHECKS = 1;
