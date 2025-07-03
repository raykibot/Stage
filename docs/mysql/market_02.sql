/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80041
Source Host           : localhost:3306
Source Database       : market_02

Target Server Type    : MYSQL
Target Server Version : 80041
File Encoding         : 65001

Date: 2025-07-04 00:18:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for raffle_activity_account
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account`;
CREATE TABLE `raffle_activity_account` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` varchar(128) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `total_count` int NOT NULL COMMENT '总次数',
  `total_count_surplus` int NOT NULL COMMENT '总次数-剩余',
  `day_count` int NOT NULL COMMENT '日次数',
  `day_count_surplus` int NOT NULL COMMENT '日次数-剩余',
  `month_count` int NOT NULL COMMENT '月次数',
  `month_count_surplus` int NOT NULL COMMENT '月次数-剩余',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_account
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_account_day
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account_day`;
CREATE TABLE `raffle_activity_account_day` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `day` varchar(12) NOT NULL COMMENT '日期',
  `day_count` int NOT NULL COMMENT '日次数',
  `day_count_surplus` int NOT NULL COMMENT '日次数剩余',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `activity_id` (`activity_id`),
  UNIQUE KEY `day` (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_account_day
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_account_month
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account_month`;
CREATE TABLE `raffle_activity_account_month` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `month` varchar(12) NOT NULL COMMENT '月',
  `month_count` int NOT NULL COMMENT '月次数',
  `month_count_surplus` int NOT NULL COMMENT '月次数剩余',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `activity_id` (`activity_id`),
  UNIQUE KEY `month` (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_account_month
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_order_0
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_0`;
CREATE TABLE `raffle_activity_order_0` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `sku` int NOT NULL COMMENT '活动sku',
  `activity_id` int NOT NULL COMMENT '活动id',
  `activity_name` varchar(128) NOT NULL COMMENT '活动名称',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(64) NOT NULL COMMENT '状态',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务单号唯一id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `out_business_no` (`out_business_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_order_0
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_order_1
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_1`;
CREATE TABLE `raffle_activity_order_1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `sku` int NOT NULL COMMENT '活动sku',
  `activity_id` int NOT NULL COMMENT '活动id',
  `activity_name` varchar(128) NOT NULL COMMENT '活动名称',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(64) NOT NULL COMMENT '状态',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务单号唯一id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `out_business_no` (`out_business_no`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_order_1
-- ----------------------------
INSERT INTO `raffle_activity_order_1` VALUES ('1', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', '9011', '100301', '测试活动', '100006', '718684612817', '2025-06-29 17:26:24', '1', '1', '1', 'completed', '{\r\n    \"userId\":\"luojiakeng\"\r\n}_sku_20250630', '2025-06-30 01:26:24', '2025-06-30 01:26:24');
INSERT INTO `raffle_activity_order_1` VALUES ('4', '\"luojiakeng\"', '9011', '100301', '测试活动', '100006', '905851070935', '2025-06-29 19:00:47', '1', '1', '1', 'completed', '\"luojiakeng\"_sku_20250630', '2025-06-30 03:00:47', '2025-06-30 03:00:47');
INSERT INTO `raffle_activity_order_1` VALUES ('6', '\"luojiakeng\"', '9011', '100301', '测试活动', '100006', '072991449355', '2025-07-02 14:00:18', '1', '1', '1', 'completed', '\"luojiakeng\"_sku_20250702', '2025-07-02 22:00:18', '2025-07-02 22:00:18');
INSERT INTO `raffle_activity_order_1` VALUES ('12', 'test3', '9022', '200402', '正式活动', '100001', '334406990702', '2025-07-03 10:21:40', '2', '2', '2', 'completed', '217489199367', '2025-07-03 18:21:43', '2025-07-03 18:21:43');
INSERT INTO `raffle_activity_order_1` VALUES ('13', 'test3', '9022', '200402', '正式活动', '100001', '070612616675', '2025-07-03 10:32:28', '2', '2', '2', 'completed', '813732925513', '2025-07-03 18:32:28', '2025-07-03 18:32:28');
INSERT INTO `raffle_activity_order_1` VALUES ('14', 'test3', '9022', '200402', '正式活动', '100001', '800874313607', '2025-07-03 10:32:45', '2', '2', '2', 'completed', '388315775468', '2025-07-03 18:32:44', '2025-07-03 18:32:44');
INSERT INTO `raffle_activity_order_1` VALUES ('15', 'test3', '9011', '100301', '测试活动', '100006', '192318295035', '2025-07-03 10:33:06', '1', '1', '1', 'completed', 'test3_sku_20250703', '2025-07-03 18:33:05', '2025-07-03 18:33:05');
INSERT INTO `raffle_activity_order_1` VALUES ('16', 'test3', '9022', '200402', '正式活动', '100001', '588022910025', '2025-07-03 10:48:42', '2', '2', '2', 'completed', '416267984680', '2025-07-03 18:48:42', '2025-07-03 18:48:42');
INSERT INTO `raffle_activity_order_1` VALUES ('17', 'test3', '9022', '200402', '正式活动', '100001', '289007609401', '2025-07-03 10:53:49', '2', '2', '2', 'completed', '244989039226', '2025-07-03 18:53:48', '2025-07-03 18:53:48');
INSERT INTO `raffle_activity_order_1` VALUES ('18', 'test3', '9022', '200402', '正式活动', '100001', '933662204992', '2025-07-03 11:34:26', '2', '2', '2', 'completed', '791965425386', '2025-07-03 19:34:25', '2025-07-03 19:34:25');
INSERT INTO `raffle_activity_order_1` VALUES ('19', 'test3', '9022', '200402', '正式活动', '100001', '305981358936', '2025-07-03 11:38:46', '2', '2', '2', 'completed', '230081557561', '2025-07-03 19:38:45', '2025-07-03 19:38:45');
INSERT INTO `raffle_activity_order_1` VALUES ('20', 'test3', '9022', '200402', '正式活动', '100001', '382248255671', '2025-07-03 11:38:46', '2', '2', '2', 'completed', '427405094208', '2025-07-03 19:38:45', '2025-07-03 19:38:45');
INSERT INTO `raffle_activity_order_1` VALUES ('21', 'test3', '9022', '200402', '正式活动', '100001', '712372999534', '2025-07-03 11:38:46', '2', '2', '2', 'completed', '140456626085', '2025-07-03 19:38:45', '2025-07-03 19:38:45');
INSERT INTO `raffle_activity_order_1` VALUES ('22', 'test3', '9022', '200402', '正式活动', '100001', '403677324907', '2025-07-03 11:38:46', '2', '2', '2', 'completed', '275108654841', '2025-07-03 19:38:45', '2025-07-03 19:38:45');
INSERT INTO `raffle_activity_order_1` VALUES ('23', 'test3', '9022', '200402', '正式活动', '100001', '055027597127', '2025-07-03 11:38:46', '2', '2', '2', 'completed', '124836304939', '2025-07-03 19:38:45', '2025-07-03 19:38:45');
INSERT INTO `raffle_activity_order_1` VALUES ('24', 'test3', '9022', '200402', '正式活动', '100001', '819962215034', '2025-07-03 11:38:46', '2', '2', '2', 'completed', '609151764913', '2025-07-03 19:38:45', '2025-07-03 19:38:45');
INSERT INTO `raffle_activity_order_1` VALUES ('25', 'test3', '9022', '200402', '正式活动', '100001', '804122182798', '2025-07-03 11:38:46', '2', '2', '2', 'completed', '776247633641', '2025-07-03 19:38:45', '2025-07-03 19:38:45');
INSERT INTO `raffle_activity_order_1` VALUES ('26', 'test3', '9022', '200402', '正式活动', '100001', '548806627116', '2025-07-03 11:38:46', '2', '2', '2', 'completed', '537602469280', '2025-07-03 19:38:45', '2025-07-03 19:38:45');
INSERT INTO `raffle_activity_order_1` VALUES ('27', 'test3', '9022', '200402', '正式活动', '100001', '340134116359', '2025-07-03 11:38:46', '2', '2', '2', 'completed', '373140136142', '2025-07-03 19:38:46', '2025-07-03 19:38:46');
INSERT INTO `raffle_activity_order_1` VALUES ('28', 'test3', '9022', '200402', '正式活动', '100001', '699993760939', '2025-07-03 11:38:46', '2', '2', '2', 'completed', '256792142209', '2025-07-03 19:38:46', '2025-07-03 19:38:46');
INSERT INTO `raffle_activity_order_1` VALUES ('29', 'test7', '9022', '200402', '正式活动', '100001', '329598062730', '2025-07-03 14:23:33', '2', '2', '2', 'completed', '515260489095', '2025-07-03 22:23:32', '2025-07-03 22:23:32');
INSERT INTO `raffle_activity_order_1` VALUES ('30', 'test3', '9022', '200402', '正式活动', '100001', '863856246622', '2025-07-03 14:49:02', '2', '2', '2', 'completed', '153146123543', '2025-07-03 22:49:02', '2025-07-03 22:49:02');
INSERT INTO `raffle_activity_order_1` VALUES ('31', 'test7', '9011', '100301', '测试活动', '100006', '981121343197', '2025-07-03 15:03:52', '1', '1', '1', 'completed', '142470866203', '2025-07-03 23:03:51', '2025-07-03 23:03:51');
INSERT INTO `raffle_activity_order_1` VALUES ('32', 'test7', '9022', '200402', '正式活动', '100001', '435685809919', '2025-07-03 15:05:44', '2', '2', '2', 'completed', '506140646330', '2025-07-03 23:05:43', '2025-07-03 23:05:43');
INSERT INTO `raffle_activity_order_1` VALUES ('33', 'test7', '9011', '100301', '测试活动', '100006', '861438408862', '2025-07-03 15:06:42', '1', '1', '1', 'completed', '863788905973', '2025-07-03 23:06:41', '2025-07-03 23:06:41');

-- ----------------------------
-- Table structure for raffle_activity_order_2
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_2`;
CREATE TABLE `raffle_activity_order_2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `sku` int NOT NULL COMMENT '活动sku',
  `activity_id` int NOT NULL COMMENT '活动id',
  `activity_name` varchar(128) NOT NULL COMMENT '活动名称',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(64) NOT NULL COMMENT '状态',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务单号唯一id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `out_business_no` (`out_business_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_order_2
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_order_3
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_3`;
CREATE TABLE `raffle_activity_order_3` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `sku` int NOT NULL COMMENT '活动sku',
  `activity_id` int NOT NULL COMMENT '活动id',
  `activity_name` varchar(128) NOT NULL COMMENT '活动名称',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `total_count` int NOT NULL COMMENT '总次数',
  `day_count` int NOT NULL COMMENT '日次数',
  `month_count` int NOT NULL COMMENT '月次数',
  `state` varchar(64) NOT NULL COMMENT '状态',
  `out_business_no` varchar(64) NOT NULL COMMENT '业务单号唯一id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `out_business_no` (`out_business_no`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_order_3
-- ----------------------------
INSERT INTO `raffle_activity_order_3` VALUES ('1', 'luojiakeng', '9011', '100301', '测试活动', '100006', '697998819255', '2025-06-29 13:16:09', '1', '1', '1', 'completed', 'luojiakeng_sku_20250629', '2025-06-29 21:16:08', '2025-06-29 21:16:08');
INSERT INTO `raffle_activity_order_3` VALUES ('2', 'luojiakeng', '9011', '100301', '测试活动', '100006', '864049775277', '2025-06-29 13:32:45', '1', '1', '1', 'completed', '161094324114', '2025-06-29 21:32:44', '2025-06-29 21:32:44');
INSERT INTO `raffle_activity_order_3` VALUES ('3', 'luojiakeng', '9011', '100301', '测试活动', '100006', '170940310882', '2025-06-29 15:03:23', '1', '1', '1', 'completed', 'luojiakeng_sku_10243219', '2025-06-29 23:03:22', '2025-06-29 23:03:22');
INSERT INTO `raffle_activity_order_3` VALUES ('12', 'luojiakeng', '9011', '100301', '测试活动', '100006', '610472953591', '2025-06-29 17:31:58', '1', '1', '1', 'completed', 'luojiakeng_sku_20250630', '2025-06-30 01:31:57', '2025-06-30 01:31:57');
INSERT INTO `raffle_activity_order_3` VALUES ('14', 'test1', '9011', '100301', '测试活动', '100006', '617620322657', '2025-07-02 16:15:52', '1', '1', '1', 'completed', '642077615818', '2025-07-03 00:15:51', '2025-07-03 00:15:51');
INSERT INTO `raffle_activity_order_3` VALUES ('15', 'test1', '9011', '100301', '测试活动', '100006', '782981978604', '2025-07-02 16:25:58', '1', '1', '1', 'completed', '838384337314', '2025-07-03 00:25:58', '2025-07-03 00:25:58');
INSERT INTO `raffle_activity_order_3` VALUES ('16', 'test1', '9011', '100301', '测试活动', '100006', '592970846308', '2025-07-02 19:10:59', '1', '1', '1', 'completed', 'test1_sku_20250703', '2025-07-03 03:10:59', '2025-07-03 03:10:59');
INSERT INTO `raffle_activity_order_3` VALUES ('19', 'test5', '9022', '200402', '正式活动', '100001', '155955309662', '2025-07-03 13:57:46', '2', '2', '2', 'completed', '706454828145', '2025-07-03 21:57:45', '2025-07-03 21:57:45');
INSERT INTO `raffle_activity_order_3` VALUES ('20', 'test5', '9022', '200402', '正式活动', '100001', '301389684886', '2025-07-03 14:11:07', '2', '2', '2', 'completed', '303860760452', '2025-07-03 22:11:07', '2025-07-03 22:11:07');
INSERT INTO `raffle_activity_order_3` VALUES ('21', 'test1', '9011', '100301', '测试活动', '100006', '791788842197', '2025-07-03 15:26:11', '1', '1', '1', 'completed', '788049230108', '2025-07-03 23:26:10', '2025-07-03 23:26:10');
INSERT INTO `raffle_activity_order_3` VALUES ('22', 'ad', '9011', '100301', '测试活动', '100006', '160076758575', '2025-07-03 15:34:37', '1', '1', '1', 'completed', '410668939346', '2025-07-03 23:34:37', '2025-07-03 23:34:37');
INSERT INTO `raffle_activity_order_3` VALUES ('23', 'ad', '9011', '100301', '测试活动', '100006', '141427069705', '2025-07-03 15:34:58', '1', '1', '1', 'completed', 'ad_sku_20250703', '2025-07-03 23:34:57', '2025-07-03 23:34:57');
INSERT INTO `raffle_activity_order_3` VALUES ('24', 's', '9011', '100301', '测试活动', '100006', '733098419827', '2025-07-03 15:42:56', '1', '1', '1', 'completed', '202350055724', '2025-07-03 23:42:55', '2025-07-03 23:42:55');
INSERT INTO `raffle_activity_order_3` VALUES ('25', 's', '9011', '100301', '测试活动', '100006', '051931836522', '2025-07-03 15:48:11', '1', '1', '1', 'completed', '375997980903', '2025-07-03 23:48:11', '2025-07-03 23:48:11');
INSERT INTO `raffle_activity_order_3` VALUES ('26', 's', '9011', '100301', '测试活动', '100006', '693099576798', '2025-07-03 15:48:19', '1', '1', '1', 'completed', '576204843879', '2025-07-03 23:48:19', '2025-07-03 23:48:19');
INSERT INTO `raffle_activity_order_3` VALUES ('27', 's', '9011', '100301', '测试活动', '100006', '544150372473', '2025-07-03 15:48:23', '1', '1', '1', 'completed', '638276294687', '2025-07-03 23:48:22', '2025-07-03 23:48:22');
INSERT INTO `raffle_activity_order_3` VALUES ('28', 's', '9011', '100301', '测试活动', '100006', '862676213236', '2025-07-03 15:57:33', '1', '1', '1', 'completed', '036262260909', '2025-07-03 23:57:32', '2025-07-03 23:57:32');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `topic` varchar(64) NOT NULL COMMENT '消息主题',
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息主体',
  `state` varchar(64) NOT NULL DEFAULT 'create' COMMENT '状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `message_id` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of task
-- ----------------------------

-- ----------------------------
-- Table structure for user_award_record_0
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_0`;
CREATE TABLE `user_award_record_0` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `award_id` int NOT NULL COMMENT '奖品id',
  `order_id` varchar(64) NOT NULL COMMENT '订单id',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题',
  `order_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(64) NOT NULL DEFAULT 'create' COMMENT '订单状态 - create创建 -completed发奖完成',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_award_record_0
-- ----------------------------

-- ----------------------------
-- Table structure for user_award_record_1
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_1`;
CREATE TABLE `user_award_record_1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `award_id` int NOT NULL COMMENT '奖品id',
  `order_id` varchar(64) NOT NULL COMMENT '订单id',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题',
  `order_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(64) NOT NULL DEFAULT 'create' COMMENT '订单状态 - create创建 -completed发奖完成',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_award_record_1
-- ----------------------------
INSERT INTO `user_award_record_1` VALUES ('1', 'test3', '200402', '100001', '106', '584899699389', '增加GPT-03-mini模型', '2025-07-03 10:33:44', 'create', '2025-07-03 18:33:43', '2025-07-03 18:33:43');
INSERT INTO `user_award_record_1` VALUES ('2', 'test3', '200402', '100001', '102', '344677167631', '5次使用', '2025-07-03 10:40:26', 'create', '2025-07-03 18:40:25', '2025-07-03 18:40:25');
INSERT INTO `user_award_record_1` VALUES ('3', 'test3', '200402', '100001', '103', '751878180473', '10次使用', '2025-07-03 10:40:46', 'create', '2025-07-03 18:40:45', '2025-07-03 18:40:45');
INSERT INTO `user_award_record_1` VALUES ('4', 'test3', '200402', '100001', '105', '583904639124', '增加GPT-01模型', '2025-07-03 10:41:07', 'create', '2025-07-03 18:41:06', '2025-07-03 18:41:06');
INSERT INTO `user_award_record_1` VALUES ('5', 'test3', '200402', '100001', '103', '248778511580', '10次使用', '2025-07-03 10:42:54', 'create', '2025-07-03 18:42:53', '2025-07-03 18:42:53');
INSERT INTO `user_award_record_1` VALUES ('6', 'test3', '200402', '100001', '106', '079756058615', '增加GPT-03-mini模型', '2025-07-03 10:48:05', 'create', '2025-07-03 18:48:05', '2025-07-03 18:48:05');
INSERT INTO `user_award_record_1` VALUES ('7', 'test3', '200402', '100001', '103', '153708368461', '10次使用', '2025-07-03 10:48:46', 'create', '2025-07-03 18:48:45', '2025-07-03 18:48:45');
INSERT INTO `user_award_record_1` VALUES ('8', 'test3', '200402', '100001', '103', '167139373112', '10次使用', '2025-07-03 10:49:21', 'create', '2025-07-03 18:49:20', '2025-07-03 18:49:20');
INSERT INTO `user_award_record_1` VALUES ('9', 'test3', '200402', '100001', '101', '897294707900', '随机积分', '2025-07-03 10:54:31', 'create', '2025-07-03 18:54:31', '2025-07-03 18:54:31');
INSERT INTO `user_award_record_1` VALUES ('10', 'test3', '200402', '100001', '102', '560146780281', '5次使用', '2025-07-03 10:54:39', 'create', '2025-07-03 18:54:39', '2025-07-03 18:54:39');
INSERT INTO `user_award_record_1` VALUES ('11', 'test3', '200402', '100001', '101', '498707305275', '随机积分', '2025-07-03 11:34:36', 'create', '2025-07-03 19:34:35', '2025-07-03 19:34:35');
INSERT INTO `user_award_record_1` VALUES ('12', 'test3', '200402', '100001', '101', '748113168909', '随机积分', '2025-07-03 11:34:47', 'create', '2025-07-03 19:34:46', '2025-07-03 19:34:46');
INSERT INTO `user_award_record_1` VALUES ('13', 'test3', '200402', '100001', '101', '485848587810', '随机积分', '2025-07-03 11:39:41', 'create', '2025-07-03 19:39:41', '2025-07-03 19:39:41');
INSERT INTO `user_award_record_1` VALUES ('14', 'test3', '200402', '100001', '101', '876974749891', '随机积分', '2025-07-03 11:39:46', 'create', '2025-07-03 19:39:46', '2025-07-03 19:39:46');
INSERT INTO `user_award_record_1` VALUES ('15', 'test3', '200402', '100001', '105', '817859352434', '增加GPT-01模型', '2025-07-03 11:39:54', 'create', '2025-07-03 19:39:53', '2025-07-03 19:39:53');
INSERT INTO `user_award_record_1` VALUES ('16', 'test3', '200402', '100001', '101', '248220108022', '随机积分', '2025-07-03 11:40:01', 'create', '2025-07-03 19:40:00', '2025-07-03 19:40:00');
INSERT INTO `user_award_record_1` VALUES ('17', 'test3', '200402', '100001', '101', '371295038304', '随机积分', '2025-07-03 11:49:39', 'create', '2025-07-03 19:49:39', '2025-07-03 19:49:39');
INSERT INTO `user_award_record_1` VALUES ('18', 'test3', '200402', '100001', '101', '195746267950', '随机积分', '2025-07-03 11:51:43', 'create', '2025-07-03 19:51:43', '2025-07-03 19:51:43');
INSERT INTO `user_award_record_1` VALUES ('19', 'test3', '200402', '100001', '101', '239494337786', '随机积分', '2025-07-03 11:51:59', 'create', '2025-07-03 19:51:58', '2025-07-03 19:51:58');
INSERT INTO `user_award_record_1` VALUES ('20', 'test3', '200402', '100001', '105', '108829496453', '增加GPT-01模型', '2025-07-03 11:52:13', 'create', '2025-07-03 19:52:13', '2025-07-03 19:52:13');
INSERT INTO `user_award_record_1` VALUES ('21', 'test3', '200402', '100001', '101', '561950272690', '随机积分', '2025-07-03 11:59:02', 'create', '2025-07-03 19:59:02', '2025-07-03 19:59:02');
INSERT INTO `user_award_record_1` VALUES ('22', 'test7', '200402', '100001', '101', '713734069669', '随机积分', '2025-07-03 14:23:41', 'create', '2025-07-03 22:23:41', '2025-07-03 22:23:41');
INSERT INTO `user_award_record_1` VALUES ('23', 'test7', '200402', '100001', '101', '454703594343', '随机积分', '2025-07-03 14:23:46', 'create', '2025-07-03 22:23:46', '2025-07-03 22:23:46');
INSERT INTO `user_award_record_1` VALUES ('24', 'test3', '200402', '100001', '106', '899961597141', '增加GPT-03-mini模型', '2025-07-03 14:48:45', 'create', '2025-07-03 22:48:45', '2025-07-03 22:48:45');
INSERT INTO `user_award_record_1` VALUES ('25', 'test3', '200402', '100001', '101', '454325056706', '随机积分', '2025-07-03 14:49:06', 'create', '2025-07-03 22:49:05', '2025-07-03 22:49:05');
INSERT INTO `user_award_record_1` VALUES ('26', 'test7', '100301', '100006', '102', '938920621605', '7等奖', '2025-07-03 15:26:32', 'create', '2025-07-03 23:26:31', '2025-07-03 23:26:31');

-- ----------------------------
-- Table structure for user_award_record_2
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_2`;
CREATE TABLE `user_award_record_2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `award_id` int NOT NULL COMMENT '奖品id',
  `order_id` varchar(64) NOT NULL COMMENT '订单id',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题',
  `order_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(64) NOT NULL DEFAULT 'create' COMMENT '订单状态 - create创建 -completed发奖完成',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_award_record_2
-- ----------------------------

-- ----------------------------
-- Table structure for user_award_record_3
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_3`;
CREATE TABLE `user_award_record_3` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `award_id` int NOT NULL COMMENT '奖品id',
  `order_id` varchar(64) NOT NULL COMMENT '订单id',
  `award_title` varchar(128) NOT NULL COMMENT '奖品标题',
  `order_time` datetime NOT NULL COMMENT '中奖时间',
  `award_state` varchar(64) NOT NULL DEFAULT 'create' COMMENT '订单状态 - create创建 -completed发奖完成',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_award_record_3
-- ----------------------------
INSERT INTO `user_award_record_3` VALUES ('1', 'luojiakeng', '100301', '100006', '105', '377387606626', '4等奖', '2025-06-29 15:25:39', 'create', '2025-06-29 23:25:38', '2025-06-29 23:25:38');
INSERT INTO `user_award_record_3` VALUES ('2', 'luojiakeng', '100301', '100006', '101', '039418654141', '随机积分', '2025-06-29 15:27:45', 'create', '2025-06-29 23:27:45', '2025-06-29 23:27:45');
INSERT INTO `user_award_record_3` VALUES ('3', 'luojiakeng', '100301', '100006', '101', '151133422413', '随机积分', '2025-06-29 15:28:58', 'create', '2025-06-29 23:28:58', '2025-06-29 23:28:58');
INSERT INTO `user_award_record_3` VALUES ('4', 'luojiakeng', '100301', '100006', '103', '140057699670', '6等奖', '2025-06-29 15:29:45', 'create', '2025-06-29 23:29:44', '2025-06-29 23:29:44');
INSERT INTO `user_award_record_3` VALUES ('5', 'luojiakeng', '100301', '100006', '101', '453341915645', '随机积分', '2025-06-29 15:30:16', 'create', '2025-06-29 23:30:16', '2025-06-29 23:30:16');
INSERT INTO `user_award_record_3` VALUES ('6', 'luojiakeng', '100301', '100006', '101', '942675236366', '随机积分', '2025-06-29 15:40:53', 'create', '2025-06-29 23:40:52', '2025-06-29 23:40:52');
INSERT INTO `user_award_record_3` VALUES ('7', 'luojiakeng', '100301', '100006', '105', '954910050919', '4等奖', '2025-06-29 15:41:12', 'create', '2025-06-29 23:41:12', '2025-06-29 23:41:12');
INSERT INTO `user_award_record_3` VALUES ('8', 'luojiakeng', '100301', '100006', '105', '311132916347', '4等奖', '2025-06-29 15:41:32', 'create', '2025-06-29 23:41:31', '2025-06-29 23:41:31');
INSERT INTO `user_award_record_3` VALUES ('9', 'luojiakeng', '100301', '100006', '105', '181482557354', '4等奖', '2025-06-29 15:41:45', 'create', '2025-06-29 23:41:44', '2025-06-29 23:41:44');
INSERT INTO `user_award_record_3` VALUES ('10', 'luojiakeng', '100301', '100006', '101', '962912478903', '随机积分', '2025-06-29 15:42:11', 'create', '2025-06-29 23:42:11', '2025-06-29 23:42:11');
INSERT INTO `user_award_record_3` VALUES ('11', 'luojiakeng', '100301', '100006', '101', '234323151332', '随机积分', '2025-06-29 17:24:49', 'create', '2025-06-30 01:24:49', '2025-06-30 01:24:49');
INSERT INTO `user_award_record_3` VALUES ('12', 'luojiakeng', '100301', '100006', '105', '174752424773', '4等奖', '2025-07-02 15:05:49', 'create', '2025-07-02 23:05:49', '2025-07-02 23:05:49');
INSERT INTO `user_award_record_3` VALUES ('13', 'luojiakeng', '100301', '100006', '101', '968622301517', '随机积分', '2025-07-02 15:31:48', 'create', '2025-07-02 23:31:47', '2025-07-02 23:31:47');
INSERT INTO `user_award_record_3` VALUES ('14', 'luojiakeng', '100301', '100006', '104', '114668840278', '5等奖', '2025-07-02 15:37:15', 'create', '2025-07-02 23:37:14', '2025-07-02 23:37:14');
INSERT INTO `user_award_record_3` VALUES ('15', 'luojiakeng', '100301', '100006', '101', '343835098475', '随机积分', '2025-07-02 16:10:18', 'create', '2025-07-03 00:10:17', '2025-07-03 00:10:17');
INSERT INTO `user_award_record_3` VALUES ('16', 'test1', '100301', '100006', '105', '469861727510', '4等奖', '2025-07-02 16:42:21', 'create', '2025-07-03 00:42:20', '2025-07-03 00:42:20');
INSERT INTO `user_award_record_3` VALUES ('17', 'test5', '200402', '100001', '102', '175406830451', '5次使用', '2025-07-03 13:58:57', 'create', '2025-07-03 21:58:57', '2025-07-03 21:58:57');
INSERT INTO `user_award_record_3` VALUES ('18', 'test5', '200402', '100001', '106', '881221993476', '增加GPT-03-mini模型', '2025-07-03 13:59:29', 'create', '2025-07-03 21:59:28', '2025-07-03 21:59:28');
INSERT INTO `user_award_record_3` VALUES ('19', 'test1', '100301', '100006', '101', '661943461627', '随机积分', '2025-07-03 15:08:59', 'create', '2025-07-03 23:08:59', '2025-07-03 23:08:59');
INSERT INTO `user_award_record_3` VALUES ('20', 'ad', '100301', '100006', '102', '369686200761', '7等奖', '2025-07-03 15:34:40', 'create', '2025-07-03 23:34:39', '2025-07-03 23:34:39');
INSERT INTO `user_award_record_3` VALUES ('21', 's', '100301', '100006', '104', '587982758107', '5等奖', '2025-07-03 15:43:41', 'create', '2025-07-03 23:43:40', '2025-07-03 23:43:40');
INSERT INTO `user_award_record_3` VALUES ('22', 's', '100301', '100006', '102', '857578073165', '7等奖', '2025-07-03 15:48:27', 'create', '2025-07-03 23:48:26', '2025-07-03 23:48:26');
INSERT INTO `user_award_record_3` VALUES ('23', 's', '100301', '100006', '101', '254718820184', '随机积分', '2025-07-03 15:48:40', 'create', '2025-07-03 23:48:40', '2025-07-03 23:48:40');
INSERT INTO `user_award_record_3` VALUES ('24', 's', '100301', '100006', '101', '952884957272', '随机积分', '2025-07-03 15:57:04', 'create', '2025-07-03 23:57:04', '2025-07-03 23:57:04');
INSERT INTO `user_award_record_3` VALUES ('25', 's', '100301', '100006', '101', '426003617215', '随机积分', '2025-07-03 15:57:35', 'create', '2025-07-03 23:57:34', '2025-07-03 23:57:34');

-- ----------------------------
-- Table structure for user_behavior_rebate_order_0
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_0`;
CREATE TABLE `user_behavior_rebate_order_0` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `behavior_type` varchar(256) NOT NULL COMMENT '行为类型',
  `rebate_desc` varchar(256) NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(256) NOT NULL COMMENT '返利类型',
  `rebate_config` varchar(256) NOT NULL COMMENT '返利配置',
  `biz_id` varchar(64) NOT NULL COMMENT '业务id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_behavior_rebate_order_0
-- ----------------------------

-- ----------------------------
-- Table structure for user_behavior_rebate_order_1
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_1`;
CREATE TABLE `user_behavior_rebate_order_1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `behavior_type` varchar(256) NOT NULL COMMENT '行为类型',
  `rebate_desc` varchar(256) NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(256) NOT NULL COMMENT '返利类型',
  `rebate_config` varchar(256) NOT NULL COMMENT '返利配置',
  `biz_id` varchar(64) NOT NULL COMMENT '业务id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_behavior_rebate_order_1
-- ----------------------------
INSERT INTO `user_behavior_rebate_order_1` VALUES ('1', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', '692141450027', 'sign', '签到返利-sku额度', 'sku', '9011', '{\r\n    \"userId\":\"luojiakeng\"\r\n}_sku_20250630', '2025-06-30 01:26:24', '2025-06-30 01:26:24');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('2', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', '400398876009', 'sign', '签到返利-积分', 'integral', '10', '{\r\n    \"userId\":\"luojiakeng\"\r\n}_integral_20250630', '2025-06-30 01:26:24', '2025-06-30 01:26:24');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('3', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', '379974178399', 'sign', '签到返利-sku额度', 'sku', '9011', '{\r\n    \"userId\":\"luojiakeng\"\r\n}_sku_20250630', '2025-06-30 01:27:53', '2025-06-30 01:27:53');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('4', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', '868023277850', 'sign', '签到返利-积分', 'integral', '10', '{\r\n    \"userId\":\"luojiakeng\"\r\n}_integral_20250630', '2025-06-30 01:27:53', '2025-06-30 01:27:53');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('5', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', '884459933601', 'sign', '签到返利-sku额度', 'sku', '9011', '{\r\n    \"userId\":\"luojiakeng\"\r\n}_sku_20250630', '2025-06-30 01:28:22', '2025-06-30 01:28:22');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('6', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', '677284041240', 'sign', '签到返利-积分', 'integral', '10', '{\r\n    \"userId\":\"luojiakeng\"\r\n}_integral_20250630', '2025-06-30 01:28:22', '2025-06-30 01:28:22');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('7', '\"luojiakeng\"', '712932380021', 'sign', '签到返利-sku额度', 'sku', '9011', '\"luojiakeng\"_sku_20250630', '2025-06-30 03:00:47', '2025-06-30 03:00:47');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('8', '\"luojiakeng\"', '669740543342', 'sign', '签到返利-积分', 'integral', '10', '\"luojiakeng\"_integral_20250630', '2025-06-30 03:00:47', '2025-06-30 03:00:47');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('9', '\"luojiakeng\"', '941947465785', 'sign', '签到返利-sku额度', 'sku', '9011', '\"luojiakeng\"_sku_20250630', '2025-06-30 03:02:34', '2025-06-30 03:02:34');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('10', '\"luojiakeng\"', '198496957349', 'sign', '签到返利-积分', 'integral', '10', '\"luojiakeng\"_integral_20250630', '2025-06-30 03:02:34', '2025-06-30 03:02:34');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('11', '\"luojiakeng\"', '119363568280', 'sign', '签到返利-sku额度', 'sku', '9011', '\"luojiakeng\"_sku_20250702', '2025-07-02 22:00:17', '2025-07-02 22:00:17');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('12', '\"luojiakeng\"', '758055087286', 'sign', '签到返利-积分', 'integral', '10', '\"luojiakeng\"_integral_20250702', '2025-07-02 22:00:17', '2025-07-02 22:00:17');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('13', '\"luojiakeng\"', '490502695990', 'sign', '签到返利-sku额度', 'sku', '9011', '\"luojiakeng\"_sku_20250702', '2025-07-02 22:28:51', '2025-07-02 22:28:51');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('14', '\"luojiakeng\"', '237976901254', 'sign', '签到返利-积分', 'integral', '10', '\"luojiakeng\"_integral_20250702', '2025-07-02 22:28:51', '2025-07-02 22:28:51');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('15', '\"luojiakeng\"', '506295278534', 'sign', '签到返利-sku额度', 'sku', '9011', '\"luojiakeng\"_sku_20250702', '2025-07-02 22:35:07', '2025-07-02 22:35:07');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('16', '\"luojiakeng\"', '770954315212', 'sign', '签到返利-积分', 'integral', '10', '\"luojiakeng\"_integral_20250702', '2025-07-02 22:35:07', '2025-07-02 22:35:07');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('17', '\"luojiakeng\"', '240637174415', 'sign', '签到返利-sku额度', 'sku', '9011', '\"luojiakeng\"_sku_20250702', '2025-07-02 22:43:35', '2025-07-02 22:43:35');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('18', '\"luojiakeng\"', '749523786926', 'sign', '签到返利-积分', 'integral', '10', '\"luojiakeng\"_integral_20250702', '2025-07-02 22:43:35', '2025-07-02 22:43:35');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('19', '\"luojiakeng\"', '520621593069', 'sign', '签到返利-sku额度', 'sku', '9011', '\"luojiakeng\"_sku_20250702', '2025-07-02 22:45:47', '2025-07-02 22:45:47');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('20', '\"luojiakeng\"', '726929332071', 'sign', '签到返利-积分', 'integral', '10', '\"luojiakeng\"_integral_20250702', '2025-07-02 22:45:47', '2025-07-02 22:45:47');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('21', '\"luojiakeng\"', '658894605348', 'sign', '签到返利-sku额度', 'sku', '9011', '\"luojiakeng\"_sku_20250702', '2025-07-02 23:31:04', '2025-07-02 23:31:04');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('22', '\"luojiakeng\"', '764034376156', 'sign', '签到返利-积分', 'integral', '10', '\"luojiakeng\"_integral_20250702', '2025-07-02 23:31:04', '2025-07-02 23:31:04');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('23', 'test3', '810112055320', 'sign', '签到返利-sku额度', 'sku', '9011', 'test3_sku_20250703', '2025-07-03 18:33:05', '2025-07-03 18:33:05');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('24', 'test3', '496111615518', 'sign', '签到返利-积分', 'integral', '10', 'test3_integral_20250703', '2025-07-03 18:33:05', '2025-07-03 18:33:05');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('25', 'test3', '868114533438', 'sign', '签到返利-sku额度', 'sku', '9011', 'test3_sku_20250703', '2025-07-03 19:33:18', '2025-07-03 19:33:18');
INSERT INTO `user_behavior_rebate_order_1` VALUES ('26', 'test3', '719603631320', 'sign', '签到返利-积分', 'integral', '10', 'test3_integral_20250703', '2025-07-03 19:33:18', '2025-07-03 19:33:18');

-- ----------------------------
-- Table structure for user_behavior_rebate_order_2
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_2`;
CREATE TABLE `user_behavior_rebate_order_2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `behavior_type` varchar(256) NOT NULL COMMENT '行为类型',
  `rebate_desc` varchar(256) NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(256) NOT NULL COMMENT '返利类型',
  `rebate_config` varchar(256) NOT NULL COMMENT '返利配置',
  `biz_id` varchar(64) NOT NULL COMMENT '业务id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_behavior_rebate_order_2
-- ----------------------------

-- ----------------------------
-- Table structure for user_behavior_rebate_order_3
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_3`;
CREATE TABLE `user_behavior_rebate_order_3` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `behavior_type` varchar(256) NOT NULL COMMENT '行为类型',
  `rebate_desc` varchar(256) NOT NULL COMMENT '返利描述',
  `rebate_type` varchar(256) NOT NULL COMMENT '返利类型',
  `rebate_config` varchar(256) NOT NULL COMMENT '返利配置',
  `biz_id` varchar(64) NOT NULL COMMENT '业务id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_behavior_rebate_order_3
-- ----------------------------
INSERT INTO `user_behavior_rebate_order_3` VALUES ('41', 'luojiakeng', '642558555187', 'sign', '签到返利-sku额度', 'sku', '9011', 'luojiakeng_sku_20250630', '2025-06-30 01:31:57', '2025-06-30 01:31:57');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('42', 'luojiakeng', '879220781623', 'sign', '签到返利-积分', 'integral', '10', 'luojiakeng_integral_20250630', '2025-06-30 01:31:57', '2025-06-30 01:31:57');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('43', 'luojiakeng', '292019114114', 'sign', '签到返利-sku额度', 'sku', '9011', 'luojiakeng_sku_20250630', '2025-06-30 01:32:10', '2025-06-30 01:32:10');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('44', 'luojiakeng', '513326515310', 'sign', '签到返利-积分', 'integral', '10', 'luojiakeng_integral_20250630', '2025-06-30 01:32:10', '2025-06-30 01:32:10');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('45', 'test1', '320937317724', 'sign', '签到返利-sku额度', 'sku', '9011', 'test1_sku_20250703', '2025-07-03 03:10:59', '2025-07-03 03:10:59');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('46', 'test1', '579681727830', 'sign', '签到返利-积分', 'integral', '10', 'test1_integral_20250703', '2025-07-03 03:10:59', '2025-07-03 03:10:59');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('47', 'test1', '850749310675', 'sign', '签到返利-sku额度', 'sku', '9011', 'test1_sku_20250703', '2025-07-03 17:30:24', '2025-07-03 17:30:24');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('48', 'test1', '580804812478', 'sign', '签到返利-积分', 'integral', '10', 'test1_integral_20250703', '2025-07-03 17:30:24', '2025-07-03 17:30:24');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('49', 'test1', '666062758952', 'sign', '签到返利-sku额度', 'sku', '9011', 'test1_sku_20250703', '2025-07-03 17:30:51', '2025-07-03 17:30:51');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('50', 'test1', '523773752546', 'sign', '签到返利-积分', 'integral', '10', 'test1_integral_20250703', '2025-07-03 17:30:51', '2025-07-03 17:30:51');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('51', 'ad', '319931655052', 'sign', '签到返利-sku额度', 'sku', '9011', 'ad_sku_20250703', '2025-07-03 23:34:57', '2025-07-03 23:34:57');
INSERT INTO `user_behavior_rebate_order_3` VALUES ('52', 'ad', '905114718013', 'sign', '签到返利-积分', 'integral', '10', 'ad_integral_20250703', '2025-07-03 23:34:57', '2025-07-03 23:34:57');

-- ----------------------------
-- Table structure for user_raffle_order_0
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_0`;
CREATE TABLE `user_raffle_order_0` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `activity_name` varchar(128) NOT NULL COMMENT '活动名称',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(64) NOT NULL DEFAULT 'create' COMMENT '订单状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_raffle_order_0
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_1
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_1`;
CREATE TABLE `user_raffle_order_1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `activity_name` varchar(128) NOT NULL COMMENT '活动名称',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(64) NOT NULL DEFAULT 'create' COMMENT '订单状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_raffle_order_1
-- ----------------------------
INSERT INTO `user_raffle_order_1` VALUES ('1', 'test3', '200402', '正式活动', '100001', '584899699389', '2025-07-03 10:33:44', 'used', '2025-07-03 18:33:43', '2025-07-03 18:33:43');
INSERT INTO `user_raffle_order_1` VALUES ('2', 'test3', '200402', '正式活动', '100001', '344677167631', '2025-07-03 10:40:26', 'used', '2025-07-03 18:40:25', '2025-07-03 18:40:25');
INSERT INTO `user_raffle_order_1` VALUES ('3', 'test3', '200402', '正式活动', '100001', '751878180473', '2025-07-03 10:40:46', 'used', '2025-07-03 18:40:45', '2025-07-03 18:40:45');
INSERT INTO `user_raffle_order_1` VALUES ('4', 'test3', '200402', '正式活动', '100001', '583904639124', '2025-07-03 10:41:07', 'used', '2025-07-03 18:41:06', '2025-07-03 18:41:06');
INSERT INTO `user_raffle_order_1` VALUES ('5', 'test3', '200402', '正式活动', '100001', '248778511580', '2025-07-03 10:42:54', 'used', '2025-07-03 18:42:53', '2025-07-03 18:42:53');
INSERT INTO `user_raffle_order_1` VALUES ('6', 'test3', '200402', '正式活动', '100001', '079756058615', '2025-07-03 10:48:05', 'used', '2025-07-03 18:48:05', '2025-07-03 18:48:05');
INSERT INTO `user_raffle_order_1` VALUES ('7', 'test3', '200402', '正式活动', '100001', '153708368461', '2025-07-03 10:48:46', 'used', '2025-07-03 18:48:45', '2025-07-03 18:48:45');
INSERT INTO `user_raffle_order_1` VALUES ('8', 'test3', '200402', '正式活动', '100001', '167139373112', '2025-07-03 10:49:21', 'used', '2025-07-03 18:49:20', '2025-07-03 18:49:20');
INSERT INTO `user_raffle_order_1` VALUES ('9', 'test3', '200402', '正式活动', '100001', '897294707900', '2025-07-03 10:54:31', 'used', '2025-07-03 18:54:31', '2025-07-03 18:54:31');
INSERT INTO `user_raffle_order_1` VALUES ('10', 'test3', '200402', '正式活动', '100001', '560146780281', '2025-07-03 10:54:39', 'used', '2025-07-03 18:54:39', '2025-07-03 18:54:39');
INSERT INTO `user_raffle_order_1` VALUES ('11', 'test3', '200402', '正式活动', '100001', '498707305275', '2025-07-03 11:34:36', 'used', '2025-07-03 19:34:35', '2025-07-03 19:34:35');
INSERT INTO `user_raffle_order_1` VALUES ('12', 'test3', '200402', '正式活动', '100001', '748113168909', '2025-07-03 11:34:47', 'used', '2025-07-03 19:34:46', '2025-07-03 19:34:46');
INSERT INTO `user_raffle_order_1` VALUES ('13', 'test3', '200402', '正式活动', '100001', '485848587810', '2025-07-03 11:39:41', 'used', '2025-07-03 19:39:41', '2025-07-03 19:39:41');
INSERT INTO `user_raffle_order_1` VALUES ('14', 'test3', '200402', '正式活动', '100001', '876974749891', '2025-07-03 11:39:46', 'used', '2025-07-03 19:39:46', '2025-07-03 19:39:46');
INSERT INTO `user_raffle_order_1` VALUES ('15', 'test3', '200402', '正式活动', '100001', '817859352434', '2025-07-03 11:39:54', 'used', '2025-07-03 19:39:53', '2025-07-03 19:39:53');
INSERT INTO `user_raffle_order_1` VALUES ('16', 'test3', '200402', '正式活动', '100001', '248220108022', '2025-07-03 11:40:01', 'used', '2025-07-03 19:40:00', '2025-07-03 19:40:00');
INSERT INTO `user_raffle_order_1` VALUES ('17', 'test3', '200402', '正式活动', '100001', '371295038304', '2025-07-03 11:49:39', 'used', '2025-07-03 19:49:39', '2025-07-03 19:49:39');
INSERT INTO `user_raffle_order_1` VALUES ('18', 'test3', '200402', '正式活动', '100001', '195746267950', '2025-07-03 11:51:43', 'used', '2025-07-03 19:51:43', '2025-07-03 19:51:43');
INSERT INTO `user_raffle_order_1` VALUES ('19', 'test3', '200402', '正式活动', '100001', '239494337786', '2025-07-03 11:51:59', 'used', '2025-07-03 19:51:58', '2025-07-03 19:51:58');
INSERT INTO `user_raffle_order_1` VALUES ('20', 'test3', '200402', '正式活动', '100001', '108829496453', '2025-07-03 11:52:13', 'used', '2025-07-03 19:52:13', '2025-07-03 19:52:13');
INSERT INTO `user_raffle_order_1` VALUES ('21', 'test3', '200402', '正式活动', '100001', '561950272690', '2025-07-03 11:59:02', 'used', '2025-07-03 19:59:01', '2025-07-03 19:59:02');
INSERT INTO `user_raffle_order_1` VALUES ('22', 'test7', '200402', '正式活动', '100001', '713734069669', '2025-07-03 14:23:41', 'used', '2025-07-03 22:23:41', '2025-07-03 22:23:41');
INSERT INTO `user_raffle_order_1` VALUES ('23', 'test7', '200402', '正式活动', '100001', '454703594343', '2025-07-03 14:23:46', 'used', '2025-07-03 22:23:46', '2025-07-03 22:23:46');
INSERT INTO `user_raffle_order_1` VALUES ('24', 'test3', '200402', '正式活动', '100001', '899961597141', '2025-07-03 14:48:45', 'used', '2025-07-03 22:48:45', '2025-07-03 22:48:45');
INSERT INTO `user_raffle_order_1` VALUES ('25', 'test3', '200402', '正式活动', '100001', '454325056706', '2025-07-03 14:49:05', 'used', '2025-07-03 22:49:05', '2025-07-03 22:49:05');
INSERT INTO `user_raffle_order_1` VALUES ('26', 'test7', '100301', '测试活动', '100006', '938920621605', '2025-07-03 15:26:32', 'used', '2025-07-03 23:26:31', '2025-07-03 23:26:31');

-- ----------------------------
-- Table structure for user_raffle_order_2
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_2`;
CREATE TABLE `user_raffle_order_2` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `activity_name` varchar(128) NOT NULL COMMENT '活动名称',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(64) NOT NULL DEFAULT 'create' COMMENT '订单状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_raffle_order_2
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_3
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_3`;
CREATE TABLE `user_raffle_order_3` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `activity_id` int NOT NULL COMMENT '活动id',
  `activity_name` varchar(128) NOT NULL COMMENT '活动名称',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` varchar(64) NOT NULL DEFAULT 'create' COMMENT '订单状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_raffle_order_3
-- ----------------------------
INSERT INTO `user_raffle_order_3` VALUES ('1', 'luojiakeng', '100301', '测试活动', '100006', '377387606626', '2025-06-29 13:18:34', 'used', '2025-06-29 21:18:35', '2025-06-29 23:25:38');
INSERT INTO `user_raffle_order_3` VALUES ('2', 'luojiakeng', '100301', '测试活动', '100006', '039418654141', '2025-06-29 15:27:44', 'used', '2025-06-29 23:27:45', '2025-06-29 23:27:45');
INSERT INTO `user_raffle_order_3` VALUES ('3', 'luojiakeng', '100301', '测试活动', '100006', '151133422413', '2025-06-29 15:28:57', 'used', '2025-06-29 23:28:58', '2025-06-29 23:28:58');
INSERT INTO `user_raffle_order_3` VALUES ('4', 'luojiakeng', '100301', '测试活动', '100006', '140057699670', '2025-06-29 15:29:43', 'used', '2025-06-29 23:29:44', '2025-06-29 23:29:44');
INSERT INTO `user_raffle_order_3` VALUES ('5', 'luojiakeng', '100301', '测试活动', '100006', '453341915645', '2025-06-29 15:30:14', 'used', '2025-06-29 23:30:15', '2025-06-29 23:30:16');
INSERT INTO `user_raffle_order_3` VALUES ('6', 'luojiakeng', '100301', '测试活动', '100006', '942675236366', '2025-06-29 15:40:51', 'used', '2025-06-29 23:40:52', '2025-06-29 23:40:52');
INSERT INTO `user_raffle_order_3` VALUES ('7', 'luojiakeng', '100301', '测试活动', '100006', '954910050919', '2025-06-29 15:41:11', 'used', '2025-06-29 23:41:11', '2025-06-29 23:41:12');
INSERT INTO `user_raffle_order_3` VALUES ('8', 'luojiakeng', '100301', '测试活动', '100006', '311132916347', '2025-06-29 15:41:31', 'used', '2025-06-29 23:41:31', '2025-06-29 23:41:31');
INSERT INTO `user_raffle_order_3` VALUES ('9', 'luojiakeng', '100301', '测试活动', '100006', '181482557354', '2025-06-29 15:41:43', 'used', '2025-06-29 23:41:44', '2025-06-29 23:41:44');
INSERT INTO `user_raffle_order_3` VALUES ('10', 'luojiakeng', '100301', '测试活动', '100006', '962912478903', '2025-06-29 15:42:10', 'used', '2025-06-29 23:42:11', '2025-06-29 23:42:11');
INSERT INTO `user_raffle_order_3` VALUES ('11', 'luojiakeng', '100301', '测试活动', '100006', '234323151332', '2025-06-29 17:24:49', 'used', '2025-06-30 01:24:49', '2025-06-30 01:24:49');
INSERT INTO `user_raffle_order_3` VALUES ('12', 'luojiakeng', '100301', '测试活动', '100006', '174752424773', '2025-07-02 15:05:49', 'used', '2025-07-02 23:05:49', '2025-07-02 23:05:49');
INSERT INTO `user_raffle_order_3` VALUES ('13', 'luojiakeng', '100301', '测试活动', '100006', '968622301517', '2025-07-02 15:31:48', 'used', '2025-07-02 23:31:47', '2025-07-02 23:31:47');
INSERT INTO `user_raffle_order_3` VALUES ('14', 'luojiakeng', '100301', '测试活动', '100006', '114668840278', '2025-07-02 15:37:15', 'used', '2025-07-02 23:37:14', '2025-07-02 23:37:14');
INSERT INTO `user_raffle_order_3` VALUES ('15', 'luojiakeng', '100301', '测试活动', '100006', '343835098475', '2025-07-02 16:10:18', 'used', '2025-07-03 00:10:17', '2025-07-03 00:10:17');
INSERT INTO `user_raffle_order_3` VALUES ('16', 'test1', '100301', '测试活动', '100006', '469861727510', '2025-07-02 16:16:52', 'used', '2025-07-03 00:16:51', '2025-07-03 00:42:20');
INSERT INTO `user_raffle_order_3` VALUES ('17', 'test5', '200402', '正式活动', '100001', '175406830451', '2025-07-03 13:58:57', 'used', '2025-07-03 21:58:57', '2025-07-03 21:58:57');
INSERT INTO `user_raffle_order_3` VALUES ('18', 'test5', '200402', '正式活动', '100001', '881221993476', '2025-07-03 13:59:29', 'used', '2025-07-03 21:59:28', '2025-07-03 21:59:28');
INSERT INTO `user_raffle_order_3` VALUES ('19', 'test1', '100301', '测试活动', '100006', '661943461627', '2025-07-03 15:08:59', 'used', '2025-07-03 23:08:59', '2025-07-03 23:08:59');
INSERT INTO `user_raffle_order_3` VALUES ('20', 'ad', '100301', '测试活动', '100006', '369686200761', '2025-07-03 15:34:40', 'used', '2025-07-03 23:34:39', '2025-07-03 23:34:39');
INSERT INTO `user_raffle_order_3` VALUES ('21', 's', '100301', '测试活动', '100006', '587982758107', '2025-07-03 15:42:57', 'used', '2025-07-03 23:42:57', '2025-07-03 23:43:40');
INSERT INTO `user_raffle_order_3` VALUES ('22', 's', '100301', '测试活动', '100006', '857578073165', '2025-07-03 15:48:27', 'used', '2025-07-03 23:48:26', '2025-07-03 23:48:26');
INSERT INTO `user_raffle_order_3` VALUES ('23', 's', '100301', '测试活动', '100006', '254718820184', '2025-07-03 15:48:40', 'used', '2025-07-03 23:48:40', '2025-07-03 23:48:40');
INSERT INTO `user_raffle_order_3` VALUES ('24', 's', '100301', '测试活动', '100006', '952884957272', '2025-07-03 15:57:04', 'used', '2025-07-03 23:57:04', '2025-07-03 23:57:04');
INSERT INTO `user_raffle_order_3` VALUES ('25', 's', '100301', '测试活动', '100006', '426003617215', '2025-07-03 15:57:35', 'used', '2025-07-03 23:57:34', '2025-07-03 23:57:34');
