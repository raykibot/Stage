/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80041
Source Host           : localhost:3306
Source Database       : market_01

Target Server Type    : MYSQL
Target Server Version : 80041
File Encoding         : 65001

Date: 2025-07-04 00:18:51
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_account
-- ----------------------------
INSERT INTO `raffle_activity_account` VALUES ('24', 's', '100301', '4', '0', '4', '0', '4', '0', '2025-07-03 23:48:11', '2025-07-03 23:57:34');
INSERT INTO `raffle_activity_account` VALUES ('25', 'd', '200402', '4', '0', '4', '0', '4', '0', '2025-07-03 23:54:26', '2025-07-03 23:56:02');
INSERT INTO `raffle_activity_account` VALUES ('26', 'xiaofuge', '100301', '2', '0', '2', '0', '2', '0', '2025-07-04 00:03:29', '2025-07-04 00:03:45');
INSERT INTO `raffle_activity_account` VALUES ('27', '罗家铿', '200402', '2', '0', '2', '0', '2', '0', '2025-07-04 00:04:12', '2025-07-04 00:04:23');
INSERT INTO `raffle_activity_account` VALUES ('28', '王勃', '100301', '2', '0', '2', '0', '2', '0', '2025-07-04 00:07:43', '2025-07-04 00:08:00');
INSERT INTO `raffle_activity_account` VALUES ('29', '王勃', '200402', '2', '0', '2', '0', '2', '0', '2025-07-04 00:08:21', '2025-07-04 00:08:30');

-- ----------------------------
-- Table structure for raffle_activity_account_day
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account_day`;
CREATE TABLE `raffle_activity_account_day` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `activity_id` int NOT NULL COMMENT '活动ID',
  `day` varchar(12) NOT NULL COMMENT '日',
  `day_count` int NOT NULL COMMENT '日次数',
  `day_count_surplus` int NOT NULL COMMENT '日次数剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_activity_month` (`user_id`,`activity_id`,`day`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动账户表-日次数';

-- ----------------------------
-- Records of raffle_activity_account_day
-- ----------------------------
INSERT INTO `raffle_activity_account_day` VALUES ('21', 's', '100301', '2025-07-03', '4', '0', '2025-07-03 23:48:26', '2025-07-03 23:57:34');
INSERT INTO `raffle_activity_account_day` VALUES ('22', 'd', '200402', '2025-07-03', '4', '0', '2025-07-03 23:54:32', '2025-07-03 23:56:02');
INSERT INTO `raffle_activity_account_day` VALUES ('23', 'xiaofuge', '100301', '2025-07-04', '2', '0', '2025-07-04 00:03:33', '2025-07-04 00:03:45');
INSERT INTO `raffle_activity_account_day` VALUES ('24', '罗家铿', '200402', '2025-07-04', '2', '0', '2025-07-04 00:04:17', '2025-07-04 00:04:23');
INSERT INTO `raffle_activity_account_day` VALUES ('25', '王勃', '100301', '2025-07-04', '2', '0', '2025-07-04 00:07:46', '2025-07-04 00:08:00');
INSERT INTO `raffle_activity_account_day` VALUES ('26', '王勃', '200402', '2025-07-04', '2', '0', '2025-07-04 00:08:22', '2025-07-04 00:08:30');

-- ----------------------------
-- Table structure for raffle_activity_account_month
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account_month`;
CREATE TABLE `raffle_activity_account_month` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `activity_id` int NOT NULL COMMENT '活动ID',
  `month` varchar(12) NOT NULL COMMENT '月',
  `month_count` int NOT NULL COMMENT '月次数',
  `month_count_surplus` int NOT NULL COMMENT '月次数剩余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_activity_month` (`user_id`,`activity_id`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='抽奖活动账户表-月次数';

-- ----------------------------
-- Records of raffle_activity_account_month
-- ----------------------------
INSERT INTO `raffle_activity_account_month` VALUES ('16', 's', '100301', '2025-07', '4', '0', '2025-07-03 23:48:26', '2025-07-03 23:57:34');
INSERT INTO `raffle_activity_account_month` VALUES ('17', 'd', '200402', '2025-07', '4', '0', '2025-07-03 23:54:32', '2025-07-03 23:56:02');
INSERT INTO `raffle_activity_account_month` VALUES ('18', 'xiaofuge', '100301', '2025-07', '2', '0', '2025-07-04 00:03:33', '2025-07-04 00:03:45');
INSERT INTO `raffle_activity_account_month` VALUES ('19', '罗家铿', '200402', '2025-07', '2', '0', '2025-07-04 00:04:17', '2025-07-04 00:04:23');
INSERT INTO `raffle_activity_account_month` VALUES ('20', '王勃', '100301', '2025-07', '2', '0', '2025-07-04 00:07:46', '2025-07-04 00:08:00');
INSERT INTO `raffle_activity_account_month` VALUES ('21', '王勃', '200402', '2025-07', '2', '0', '2025-07-04 00:08:22', '2025-07-04 00:08:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_order_0
-- ----------------------------
INSERT INTO `raffle_activity_order_0` VALUES ('80', 'xiaofuge', '9011', '100301', '测试活动', '100006', '250888824688', '2025-06-29 17:33:52', '1', '1', '1', 'completed', 'xiaofuge_sku_20250630', '2025-06-30 01:33:51', '2025-06-30 01:33:51');
INSERT INTO `raffle_activity_order_0` VALUES ('82', 'wangbo', '9011', '100301', '测试活动', '100006', '109122191103', '2025-06-29 17:44:34', '1', '1', '1', 'completed', 'wangbo_sku_20250630', '2025-06-30 01:45:15', '2025-06-30 01:45:15');
INSERT INTO `raffle_activity_order_0` VALUES ('86', 'xiaofuge', '9011', '100301', '测试活动', '100006', '960534988574', '2025-07-02 15:16:07', '1', '1', '1', 'completed', '660683549122', '2025-07-02 23:16:07', '2025-07-02 23:16:07');
INSERT INTO `raffle_activity_order_0` VALUES ('87', 'xiaofuge', '9011', '100301', '测试活动', '100006', '678264175711', '2025-07-02 15:19:56', '1', '1', '1', 'completed', '381858839487', '2025-07-02 23:19:56', '2025-07-02 23:19:56');
INSERT INTO `raffle_activity_order_0` VALUES ('88', 'xiaofuge', '9011', '100301', '测试活动', '100006', '706889846384', '2025-07-02 15:20:20', '1', '1', '1', 'completed', '347403719579', '2025-07-02 23:20:19', '2025-07-02 23:20:19');
INSERT INTO `raffle_activity_order_0` VALUES ('89', 'test2', '9011', '100301', '测试活动', '100006', '114370409790', '2025-07-02 19:00:29', '1', '1', '1', 'completed', '139053204825', '2025-07-03 03:00:29', '2025-07-03 03:00:29');
INSERT INTO `raffle_activity_order_0` VALUES ('90', 'test2', '9011', '100301', '测试活动', '100006', '356540120018', '2025-07-02 19:00:42', '1', '1', '1', 'completed', '868646554747', '2025-07-03 03:00:42', '2025-07-03 03:00:42');
INSERT INTO `raffle_activity_order_0` VALUES ('91', 'test2', '9011', '100301', '测试活动', '100006', '342839330246', '2025-07-02 19:00:54', '1', '1', '1', 'completed', '843455485669', '2025-07-03 03:00:54', '2025-07-03 03:00:54');
INSERT INTO `raffle_activity_order_0` VALUES ('92', '\"test2\"', '9011', '100301', '测试活动', '100006', '410580446294', '2025-07-02 19:03:33', '1', '1', '1', 'completed', '\"test2\"_sku_20250703', '2025-07-03 03:03:33', '2025-07-03 03:03:33');
INSERT INTO `raffle_activity_order_0` VALUES ('93', 'test2', '9011', '100301', '测试活动', '100006', '736083880780', '2025-07-02 19:06:01', '1', '1', '1', 'completed', 'test2_sku_20250703', '2025-07-03 03:06:01', '2025-07-03 03:06:01');
INSERT INTO `raffle_activity_order_0` VALUES ('96', 'test2', '9011', '100301', '测试活动', '100006', '665319133481', '2025-07-03 10:13:33', '1', '1', '1', 'completed', '278563901910', '2025-07-03 18:13:32', '2025-07-03 18:13:32');
INSERT INTO `raffle_activity_order_0` VALUES ('97', 'test2', '9011', '100301', '测试活动', '100006', '111559137320', '2025-07-03 10:27:08', '1', '1', '1', 'completed', '294503125354', '2025-07-03 18:27:08', '2025-07-03 18:27:08');
INSERT INTO `raffle_activity_order_0` VALUES ('98', 'test2', '9011', '100301', '测试活动', '100006', '215258225995', '2025-07-03 13:44:48', '1', '1', '1', 'completed', '992706594557', '2025-07-03 21:44:48', '2025-07-03 21:44:48');
INSERT INTO `raffle_activity_order_0` VALUES ('99', 'test6', '9022', '200402', '正式活动', '100001', '707719038456', '2025-07-03 14:12:26', '2', '2', '2', 'completed', '536448371277', '2025-07-03 22:12:26', '2025-07-03 22:12:26');
INSERT INTO `raffle_activity_order_0` VALUES ('100', 'test6', '9022', '200402', '正式活动', '100001', '513650264461', '2025-07-03 14:15:52', '2', '2', '2', 'completed', '514877441408', '2025-07-03 22:15:52', '2025-07-03 22:15:52');
INSERT INTO `raffle_activity_order_0` VALUES ('101', 'd', '9022', '200402', '正式活动', '100001', '210753105674', '2025-07-03 15:54:27', '2', '2', '2', 'completed', '946477911677', '2025-07-03 23:54:26', '2025-07-03 23:54:26');
INSERT INTO `raffle_activity_order_0` VALUES ('102', 'd', '9022', '200402', '正式活动', '100001', '440373224987', '2025-07-03 15:55:54', '2', '2', '2', 'completed', '013662788743', '2025-07-03 23:55:53', '2025-07-03 23:55:53');
INSERT INTO `raffle_activity_order_0` VALUES ('103', 'xiaofuge', '9011', '100301', '测试活动', '100006', '744622007783', '2025-07-03 16:03:29', '1', '1', '1', 'completed', '806688952912', '2025-07-04 00:03:29', '2025-07-04 00:03:29');
INSERT INTO `raffle_activity_order_0` VALUES ('104', 'xiaofuge', '9011', '100301', '测试活动', '100006', '888965080522', '2025-07-03 16:03:44', '1', '1', '1', 'completed', '238002695214', '2025-07-04 00:03:43', '2025-07-04 00:03:43');
INSERT INTO `raffle_activity_order_0` VALUES ('105', '罗家铿', '9022', '200402', '正式活动', '100001', '825273132767', '2025-07-03 16:04:13', '2', '2', '2', 'completed', '947050226365', '2025-07-04 00:04:12', '2025-07-04 00:04:12');
INSERT INTO `raffle_activity_order_0` VALUES ('106', '王勃', '9011', '100301', '测试活动', '100006', '509550478827', '2025-07-03 16:07:43', '1', '1', '1', 'completed', '王勃_sku_20250704', '2025-07-04 00:07:43', '2025-07-04 00:07:43');
INSERT INTO `raffle_activity_order_0` VALUES ('107', '王勃', '9011', '100301', '测试活动', '100006', '933809257398', '2025-07-03 16:08:00', '1', '1', '1', 'completed', '598421046823', '2025-07-04 00:07:59', '2025-07-04 00:07:59');
INSERT INTO `raffle_activity_order_0` VALUES ('108', '王勃', '9022', '200402', '正式活动', '100001', '865381132585', '2025-07-03 16:08:21', '2', '2', '2', 'completed', '431863263666', '2025-07-04 00:08:21', '2025-07-04 00:08:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_order_1
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_order_2
-- ----------------------------
INSERT INTO `raffle_activity_order_2` VALUES ('1', 'test', '9011', '100301', '测试活动', '100006', '338134922441', '2025-06-29 17:41:05', '1', '1', '1', 'completed', 'test_sku_20250630', '2025-06-30 01:41:04', '2025-06-30 01:41:04');
INSERT INTO `raffle_activity_order_2` VALUES ('2', 'test4', '9022', '200402', '正式活动', '100001', '123264049571', '2025-07-03 12:00:02', '2', '2', '2', 'completed', '980505302612', '2025-07-03 20:00:02', '2025-07-03 20:00:02');
INSERT INTO `raffle_activity_order_2` VALUES ('3', 'test4', '9022', '200402', '正式活动', '100001', '965368676147', '2025-07-03 12:21:09', '2', '2', '2', 'completed', '371597966650', '2025-07-03 20:21:08', '2025-07-03 20:21:08');
INSERT INTO `raffle_activity_order_2` VALUES ('4', 'test4', '9022', '200402', '正式活动', '100001', '977051456223', '2025-07-03 13:46:37', '2', '2', '2', 'completed', '639869018512', '2025-07-03 21:46:37', '2025-07-03 21:46:37');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of raffle_activity_order_3
-- ----------------------------

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` varchar(128) NOT NULL,
  `topic` varchar(64) NOT NULL COMMENT '消息主题',
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息主体',
  `state` varchar(64) NOT NULL DEFAULT 'create' COMMENT '状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `message_id` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('151', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_sku_20243219\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"luojiakeng\"},\"id\":\"13940528563\",\"timestamp\":\"2025-06-29 22:53:40.92\"}', 'completed', '2025-06-29 22:53:41', '2025-06-29 22:53:41', '13940528563');
INSERT INTO `task` VALUES ('152', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_integral_20243219\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"luojiakeng\"},\"id\":\"48090254928\",\"timestamp\":\"2025-06-29 22:53:40.922\"}', 'completed', '2025-06-29 22:53:41', '2025-06-29 22:53:41', '48090254928');
INSERT INTO `task` VALUES ('153', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_sku_10243219\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"luojiakeng\"},\"id\":\"21025562214\",\"timestamp\":\"2025-06-29 22:56:21.331\"}', 'completed', '2025-06-29 22:56:21', '2025-06-29 22:56:21', '21025562214');
INSERT INTO `task` VALUES ('154', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_integral_10243219\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"luojiakeng\"},\"id\":\"54922544884\",\"timestamp\":\"2025-06-29 22:56:21.332\"}', 'completed', '2025-06-29 22:56:21', '2025-06-29 22:56:21', '54922544884');
INSERT INTO `task` VALUES ('155', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_sku_10243219\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"luojiakeng\"},\"id\":\"57367175055\",\"timestamp\":\"2025-06-29 22:59:41.571\"}', 'completed', '2025-06-29 22:59:41', '2025-06-29 22:59:41', '57367175055');
INSERT INTO `task` VALUES ('156', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_integral_10243219\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"luojiakeng\"},\"id\":\"69426260519\",\"timestamp\":\"2025-06-29 22:59:41.573\"}', 'completed', '2025-06-29 22:59:41', '2025-06-29 22:59:41', '69426260519');
INSERT INTO `task` VALUES ('157', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_sku_10243219\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"luojiakeng\"},\"id\":\"48692846983\",\"timestamp\":\"2025-06-29 23:03:22.092\"}', 'completed', '2025-06-29 23:03:22', '2025-06-29 23:03:22', '48692846983');
INSERT INTO `task` VALUES ('158', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_integral_10243219\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"luojiakeng\"},\"id\":\"18665365794\",\"timestamp\":\"2025-06-29 23:03:22.093\"}', 'completed', '2025-06-29 23:03:22', '2025-06-29 23:03:22', '18665365794');
INSERT INTO `task` VALUES ('159', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_sku_10243219\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"luojiakeng\"},\"id\":\"91498959836\",\"timestamp\":\"2025-06-29 23:04:53.256\"}', 'completed', '2025-06-29 23:04:53', '2025-06-29 23:04:53', '91498959836');
INSERT INTO `task` VALUES ('160', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_integral_10243219\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"luojiakeng\"},\"id\":\"85580301384\",\"timestamp\":\"2025-06-29 23:04:53.258\"}', 'completed', '2025-06-29 23:04:53', '2025-06-29 23:04:53', '85580301384');
INSERT INTO `task` VALUES ('161', 'xiaofuge', 'send_rebate', '{\"data\":{\"bizId\":\"xiaofuge_sku_20243219\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"65049753216\",\"timestamp\":\"2025-06-29 23:13:33.918\"}', 'completed', '2025-06-29 23:13:34', '2025-06-29 23:13:34', '65049753216');
INSERT INTO `task` VALUES ('162', 'xiaofuge', 'send_rebate', '{\"data\":{\"bizId\":\"xiaofuge_integral_20243219\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"41835836597\",\"timestamp\":\"2025-06-29 23:13:33.921\"}', 'completed', '2025-06-29 23:13:34', '2025-06-29 23:13:34', '41835836597');
INSERT INTO `task` VALUES ('163', 'xiaofuge', 'send_rebate', '{\"data\":{\"bizId\":\"xiaofuge_sku_30243219\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"93782230243\",\"timestamp\":\"2025-06-29 23:15:40.596\"}', 'completed', '2025-06-29 23:15:40', '2025-06-29 23:15:40', '93782230243');
INSERT INTO `task` VALUES ('164', 'xiaofuge', 'send_rebate', '{\"data\":{\"bizId\":\"xiaofuge_integral_30243219\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"01171352145\",\"timestamp\":\"2025-06-29 23:15:40.598\"}', 'completed', '2025-06-29 23:15:40', '2025-06-29 23:15:40', '01171352145');
INSERT INTO `task` VALUES ('165', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"luojiakeng\"},\"id\":\"469800921475\",\"timestamp\":\"2025-06-29 23:25:38.621\"}', 'completed', '2025-06-29 23:25:38', '2025-06-29 23:25:38', '469800921475');
INSERT INTO `task` VALUES ('166', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"luojiakeng\"},\"id\":\"108437478395\",\"timestamp\":\"2025-06-29 23:27:45.314\"}', 'completed', '2025-06-29 23:27:45', '2025-06-29 23:27:45', '108437478395');
INSERT INTO `task` VALUES ('167', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"luojiakeng\"},\"id\":\"918573636715\",\"timestamp\":\"2025-06-29 23:28:58.451\"}', 'completed', '2025-06-29 23:28:58', '2025-06-29 23:28:58', '918573636715');
INSERT INTO `task` VALUES ('168', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"luojiakeng\"},\"id\":\"681732959659\",\"timestamp\":\"2025-06-29 23:29:44.617\"}', 'completed', '2025-06-29 23:29:44', '2025-06-29 23:29:44', '681732959659');
INSERT INTO `task` VALUES ('169', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"luojiakeng\"},\"id\":\"679862474110\",\"timestamp\":\"2025-06-29 23:30:15.958\"}', 'completed', '2025-06-29 23:30:16', '2025-06-29 23:30:16', '679862474110');
INSERT INTO `task` VALUES ('170', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"luojiakeng\"},\"id\":\"250739951915\",\"timestamp\":\"2025-06-29 23:40:52.601\"}', 'completed', '2025-06-29 23:40:52', '2025-06-29 23:40:52', '250739951915');
INSERT INTO `task` VALUES ('171', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"luojiakeng\"},\"id\":\"714181330970\",\"timestamp\":\"2025-06-29 23:41:11.989\"}', 'completed', '2025-06-29 23:41:12', '2025-06-29 23:41:12', '714181330970');
INSERT INTO `task` VALUES ('172', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"luojiakeng\"},\"id\":\"086933626211\",\"timestamp\":\"2025-06-29 23:41:31.856\"}', 'completed', '2025-06-29 23:41:31', '2025-06-29 23:41:31', '086933626211');
INSERT INTO `task` VALUES ('173', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"luojiakeng\"},\"id\":\"246108912575\",\"timestamp\":\"2025-06-29 23:41:44.904\"}', 'completed', '2025-06-29 23:41:44', '2025-06-29 23:41:44', '246108912575');
INSERT INTO `task` VALUES ('174', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"luojiakeng\"},\"id\":\"709548640719\",\"timestamp\":\"2025-06-29 23:42:11.304\"}', 'completed', '2025-06-29 23:42:11', '2025-06-29 23:42:11', '709548640719');
INSERT INTO `task` VALUES ('175', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"luojiakeng\"},\"id\":\"389141820042\",\"timestamp\":\"2025-06-30 01:24:49.401\"}', 'completed', '2025-06-30 01:24:49', '2025-06-30 01:24:49', '389141820042');
INSERT INTO `task` VALUES ('176', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', 'send_rebate', '{\"data\":{\"bizId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}\"},\"id\":\"44510347134\",\"timestamp\":\"2025-06-30 01:26:24.248\"}', 'completed', '2025-06-30 01:26:24', '2025-06-30 01:26:24', '44510347134');
INSERT INTO `task` VALUES ('177', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', 'send_rebate', '{\"data\":{\"bizId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}\"},\"id\":\"63238249722\",\"timestamp\":\"2025-06-30 01:26:24.25\"}', 'completed', '2025-06-30 01:26:24', '2025-06-30 01:26:24', '63238249722');
INSERT INTO `task` VALUES ('178', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', 'send_rebate', '{\"data\":{\"bizId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}\"},\"id\":\"14566524092\",\"timestamp\":\"2025-06-30 01:27:53.801\"}', 'completed', '2025-06-30 01:27:53', '2025-06-30 01:27:53', '14566524092');
INSERT INTO `task` VALUES ('179', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', 'send_rebate', '{\"data\":{\"bizId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}\"},\"id\":\"06278380540\",\"timestamp\":\"2025-06-30 01:27:53.801\"}', 'completed', '2025-06-30 01:27:53', '2025-06-30 01:27:53', '06278380540');
INSERT INTO `task` VALUES ('180', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', 'send_rebate', '{\"data\":{\"bizId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}\"},\"id\":\"87315762014\",\"timestamp\":\"2025-06-30 01:28:22.821\"}', 'completed', '2025-06-30 01:28:22', '2025-06-30 01:28:22', '87315762014');
INSERT INTO `task` VALUES ('181', '{\r\n    \"userId\":\"luojiakeng\"\r\n}', 'send_rebate', '{\"data\":{\"bizId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"{\\r\\n    \\\"userId\\\":\\\"luojiakeng\\\"\\r\\n}\"},\"id\":\"46314867592\",\"timestamp\":\"2025-06-30 01:28:22.821\"}', 'completed', '2025-06-30 01:28:22', '2025-06-30 01:28:22', '46314867592');
INSERT INTO `task` VALUES ('182', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"luojiakeng\"},\"id\":\"92374666615\",\"timestamp\":\"2025-06-30 01:31:57.731\"}', 'completed', '2025-06-30 01:31:57', '2025-06-30 01:31:57', '92374666615');
INSERT INTO `task` VALUES ('183', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"luojiakeng\"},\"id\":\"93872704438\",\"timestamp\":\"2025-06-30 01:31:57.731\"}', 'completed', '2025-06-30 01:31:57', '2025-06-30 01:31:57', '93872704438');
INSERT INTO `task` VALUES ('184', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"luojiakeng\"},\"id\":\"25637250642\",\"timestamp\":\"2025-06-30 01:32:10.531\"}', 'completed', '2025-06-30 01:32:10', '2025-06-30 01:32:10', '25637250642');
INSERT INTO `task` VALUES ('185', 'luojiakeng', 'send_rebate', '{\"data\":{\"bizId\":\"luojiakeng_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"luojiakeng\"},\"id\":\"51131960182\",\"timestamp\":\"2025-06-30 01:32:10.531\"}', 'completed', '2025-06-30 01:32:10', '2025-06-30 01:32:10', '51131960182');
INSERT INTO `task` VALUES ('186', 'xiaofuge', 'send_rebate', '{\"data\":{\"bizId\":\"xiaofuge_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"63449790943\",\"timestamp\":\"2025-06-30 01:33:51.543\"}', 'completed', '2025-06-30 01:33:51', '2025-06-30 01:33:51', '63449790943');
INSERT INTO `task` VALUES ('187', 'xiaofuge', 'send_rebate', '{\"data\":{\"bizId\":\"xiaofuge_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"99505635027\",\"timestamp\":\"2025-06-30 01:33:51.543\"}', 'completed', '2025-06-30 01:33:51', '2025-06-30 01:33:51', '99505635027');
INSERT INTO `task` VALUES ('188', 'xiaofuge', 'send_rebate', '{\"data\":{\"bizId\":\"xiaofuge_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"xiaofuge\"},\"id\":\"06636403190\",\"timestamp\":\"2025-06-30 01:34:00.236\"}', 'completed', '2025-06-30 01:34:00', '2025-06-30 01:34:00', '06636403190');
INSERT INTO `task` VALUES ('189', 'xiaofuge', 'send_rebate', '{\"data\":{\"bizId\":\"xiaofuge_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"xiaofuge\"},\"id\":\"93718297227\",\"timestamp\":\"2025-06-30 01:34:00.236\"}', 'completed', '2025-06-30 01:34:00', '2025-06-30 01:34:00', '93718297227');
INSERT INTO `task` VALUES ('190', 'test', 'send_rebate', '{\"data\":{\"bizId\":\"test_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"test\"},\"id\":\"87448558598\",\"timestamp\":\"2025-06-30 01:40:55.065\"}', 'completed', '2025-06-30 01:41:04', '2025-06-30 01:41:05', '87448558598');
INSERT INTO `task` VALUES ('191', 'test', 'send_rebate', '{\"data\":{\"bizId\":\"test_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test\"},\"id\":\"94503083580\",\"timestamp\":\"2025-06-30 01:41:01.499\"}', 'completed', '2025-06-30 01:41:04', '2025-06-30 01:41:05', '94503083580');
INSERT INTO `task` VALUES ('192', 'wangbo', 'send_rebate', '{\"data\":{\"bizId\":\"wangbo_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"wangbo\"},\"id\":\"78271720215\",\"timestamp\":\"2025-06-30 01:44:05.024\"}', 'completed', '2025-06-30 01:44:08', '2025-06-30 01:44:08', '78271720215');
INSERT INTO `task` VALUES ('193', 'wangbo', 'send_rebate', '{\"data\":{\"bizId\":\"wangbo_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"wangbo\"},\"id\":\"16443205788\",\"timestamp\":\"2025-06-30 01:44:05.027\"}', 'completed', '2025-06-30 01:44:08', '2025-06-30 01:44:08', '16443205788');
INSERT INTO `task` VALUES ('194', 'wangbo', 'send_rebate', '{\"data\":{\"bizId\":\"wangbo_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"wangbo\"},\"id\":\"52024333231\",\"timestamp\":\"2025-06-30 01:48:38.367\"}', 'completed', '2025-06-30 01:48:38', '2025-06-30 01:48:38', '52024333231');
INSERT INTO `task` VALUES ('195', 'wangbo', 'send_rebate', '{\"data\":{\"bizId\":\"wangbo_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"wangbo\"},\"id\":\"55549391231\",\"timestamp\":\"2025-06-30 01:48:38.372\"}', 'completed', '2025-06-30 01:48:38', '2025-06-30 01:48:38', '55549391231');
INSERT INTO `task` VALUES ('196', 'wangbo', 'send_rebate', '{\"data\":{\"bizId\":\"wangbo_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"wangbo\"},\"id\":\"50425587674\",\"timestamp\":\"2025-06-30 01:54:24.108\"}', 'completed', '2025-06-30 01:54:24', '2025-06-30 01:54:24', '50425587674');
INSERT INTO `task` VALUES ('197', 'wangbo', 'send_rebate', '{\"data\":{\"bizId\":\"wangbo_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"wangbo\"},\"id\":\"11501481275\",\"timestamp\":\"2025-06-30 01:54:24.113\"}', 'completed', '2025-06-30 01:54:24', '2025-06-30 01:54:24', '11501481275');
INSERT INTO `task` VALUES ('198', 'wangbo', 'send_rebate', '{\"data\":{\"bizId\":\"wangbo_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"wangbo\"},\"id\":\"45234536776\",\"timestamp\":\"2025-06-30 02:00:35.889\"}', 'completed', '2025-06-30 02:00:36', '2025-06-30 02:00:36', '45234536776');
INSERT INTO `task` VALUES ('199', 'wangbo', 'send_rebate', '{\"data\":{\"bizId\":\"wangbo_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"wangbo\"},\"id\":\"59791580578\",\"timestamp\":\"2025-06-30 02:00:35.891\"}', 'completed', '2025-06-30 02:00:36', '2025-06-30 02:00:36', '59791580578');
INSERT INTO `task` VALUES ('200', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"38473130637\",\"timestamp\":\"2025-06-30 03:00:47.326\"}', 'completed', '2025-06-30 03:00:47', '2025-06-30 03:00:47', '38473130637');
INSERT INTO `task` VALUES ('201', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"76734204880\",\"timestamp\":\"2025-06-30 03:00:47.328\"}', 'completed', '2025-06-30 03:00:47', '2025-06-30 03:00:47', '76734204880');
INSERT INTO `task` VALUES ('202', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_sku_20250630\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"62265120198\",\"timestamp\":\"2025-06-30 03:02:34.683\"}', 'completed', '2025-06-30 03:02:34', '2025-06-30 03:02:34', '62265120198');
INSERT INTO `task` VALUES ('203', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_integral_20250630\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"51243482193\",\"timestamp\":\"2025-06-30 03:02:34.683\"}', 'completed', '2025-06-30 03:02:34', '2025-06-30 03:02:34', '51243482193');
INSERT INTO `task` VALUES ('204', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_sku_20250702\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"03008397696\",\"timestamp\":\"2025-07-02 22:00:17.877\"}', 'completed', '2025-07-02 22:00:17', '2025-07-02 22:00:17', '03008397696');
INSERT INTO `task` VALUES ('205', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_integral_20250702\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"20097795782\",\"timestamp\":\"2025-07-02 22:00:17.881\"}', 'completed', '2025-07-02 22:00:17', '2025-07-02 22:00:17', '20097795782');
INSERT INTO `task` VALUES ('206', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_sku_20250702\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"27067039966\",\"timestamp\":\"2025-07-02 22:28:51.381\"}', 'completed', '2025-07-02 22:28:51', '2025-07-02 22:28:51', '27067039966');
INSERT INTO `task` VALUES ('207', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_integral_20250702\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"61125214282\",\"timestamp\":\"2025-07-02 22:28:51.381\"}', 'completed', '2025-07-02 22:28:51', '2025-07-02 22:28:51', '61125214282');
INSERT INTO `task` VALUES ('208', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_sku_20250702\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"20232662421\",\"timestamp\":\"2025-07-02 22:35:07.345\"}', 'completed', '2025-07-02 22:35:07', '2025-07-02 22:35:07', '20232662421');
INSERT INTO `task` VALUES ('209', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_integral_20250702\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"61424056783\",\"timestamp\":\"2025-07-02 22:35:07.345\"}', 'completed', '2025-07-02 22:35:07', '2025-07-02 22:35:07', '61424056783');
INSERT INTO `task` VALUES ('210', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_sku_20250702\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"45562358201\",\"timestamp\":\"2025-07-02 22:43:35.07\"}', 'completed', '2025-07-02 22:43:35', '2025-07-02 22:43:35', '45562358201');
INSERT INTO `task` VALUES ('211', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_integral_20250702\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"45859363588\",\"timestamp\":\"2025-07-02 22:43:35.07\"}', 'completed', '2025-07-02 22:43:35', '2025-07-02 22:43:35', '45859363588');
INSERT INTO `task` VALUES ('212', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_sku_20250702\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"18540552339\",\"timestamp\":\"2025-07-02 22:45:47.352\"}', 'completed', '2025-07-02 22:45:47', '2025-07-02 22:45:47', '18540552339');
INSERT INTO `task` VALUES ('213', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_integral_20250702\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"24641858398\",\"timestamp\":\"2025-07-02 22:45:47.354\"}', 'completed', '2025-07-02 22:45:47', '2025-07-02 22:45:47', '24641858398');
INSERT INTO `task` VALUES ('214', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"luojiakeng\"},\"id\":\"863593979206\",\"timestamp\":\"2025-07-02 23:05:49.405\"}', 'completed', '2025-07-02 23:05:49', '2025-07-02 23:05:49', '863593979206');
INSERT INTO `task` VALUES ('215', 'xiaofuge', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"232650224730\",\"timestamp\":\"2025-07-02 23:17:00.226\"}', 'completed', '2025-07-02 23:17:00', '2025-07-02 23:17:00', '232650224730');
INSERT INTO `task` VALUES ('216', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_sku_20250702\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"40618764315\",\"timestamp\":\"2025-07-02 23:31:04.713\"}', 'completed', '2025-07-02 23:31:04', '2025-07-02 23:31:04', '40618764315');
INSERT INTO `task` VALUES ('217', '\"luojiakeng\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"luojiakeng\\\"_integral_20250702\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"\\\"luojiakeng\\\"\"},\"id\":\"32797497219\",\"timestamp\":\"2025-07-02 23:31:04.715\"}', 'completed', '2025-07-02 23:31:04', '2025-07-02 23:31:04', '32797497219');
INSERT INTO `task` VALUES ('218', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"luojiakeng\"},\"id\":\"569926141270\",\"timestamp\":\"2025-07-02 23:31:47.637\"}', 'completed', '2025-07-02 23:31:47', '2025-07-02 23:31:47', '569926141270');
INSERT INTO `task` VALUES ('219', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"luojiakeng\"},\"id\":\"233436568203\",\"timestamp\":\"2025-07-02 23:37:14.569\"}', 'completed', '2025-07-02 23:37:14', '2025-07-02 23:37:14', '233436568203');
INSERT INTO `task` VALUES ('220', 'xiaofuge', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"556022857471\",\"timestamp\":\"2025-07-02 23:45:18.434\"}', 'completed', '2025-07-02 23:45:18', '2025-07-02 23:45:18', '556022857471');
INSERT INTO `task` VALUES ('221', 'xiaofuge', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"374051912227\",\"timestamp\":\"2025-07-03 00:09:21.168\"}', 'completed', '2025-07-03 00:09:21', '2025-07-03 00:09:21', '374051912227');
INSERT INTO `task` VALUES ('222', 'luojiakeng', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"luojiakeng\"},\"id\":\"230223919531\",\"timestamp\":\"2025-07-03 00:10:17.661\"}', 'completed', '2025-07-03 00:10:17', '2025-07-03 00:10:17', '230223919531');
INSERT INTO `task` VALUES ('223', 'test1', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"test1\"},\"id\":\"827786271947\",\"timestamp\":\"2025-07-03 00:42:20.578\"}', 'completed', '2025-07-03 00:42:20', '2025-07-03 00:42:20', '827786271947');
INSERT INTO `task` VALUES ('224', 'test2', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test2\"},\"id\":\"051164617889\",\"timestamp\":\"2025-07-03 03:02:28.761\"}', 'completed', '2025-07-03 03:02:28', '2025-07-03 03:02:28', '051164617889');
INSERT INTO `task` VALUES ('225', 'test2', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test2\"},\"id\":\"570606437673\",\"timestamp\":\"2025-07-03 03:02:38.59\"}', 'completed', '2025-07-03 03:02:38', '2025-07-03 03:02:38', '570606437673');
INSERT INTO `task` VALUES ('226', '\"test2\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"test2\\\"_sku_20250703\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"\\\"test2\\\"\"},\"id\":\"86958089488\",\"timestamp\":\"2025-07-03 03:03:33.23\"}', 'completed', '2025-07-03 03:03:33', '2025-07-03 03:03:33', '86958089488');
INSERT INTO `task` VALUES ('227', '\"test2\"', 'send_rebate', '{\"data\":{\"bizId\":\"\\\"test2\\\"_integral_20250703\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"\\\"test2\\\"\"},\"id\":\"39892636936\",\"timestamp\":\"2025-07-03 03:03:33.233\"}', 'completed', '2025-07-03 03:03:33', '2025-07-03 03:03:33', '39892636936');
INSERT INTO `task` VALUES ('228', 'test2', 'send_rebate', '{\"data\":{\"bizId\":\"test2_sku_20250703\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"test2\"},\"id\":\"33818877745\",\"timestamp\":\"2025-07-03 03:06:01.163\"}', 'completed', '2025-07-03 03:06:01', '2025-07-03 03:06:01', '33818877745');
INSERT INTO `task` VALUES ('229', 'test2', 'send_rebate', '{\"data\":{\"bizId\":\"test2_integral_20250703\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test2\"},\"id\":\"81932868584\",\"timestamp\":\"2025-07-03 03:06:01.163\"}', 'completed', '2025-07-03 03:06:01', '2025-07-03 03:06:01', '81932868584');
INSERT INTO `task` VALUES ('230', 'test2', 'send_rebate', '{\"data\":{\"bizId\":\"test2_sku_20250703\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"test2\"},\"id\":\"00480848439\",\"timestamp\":\"2025-07-03 03:06:18.859\"}', 'completed', '2025-07-03 03:06:18', '2025-07-03 03:06:18', '00480848439');
INSERT INTO `task` VALUES ('231', 'test2', 'send_rebate', '{\"data\":{\"bizId\":\"test2_integral_20250703\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test2\"},\"id\":\"88777347641\",\"timestamp\":\"2025-07-03 03:06:18.859\"}', 'completed', '2025-07-03 03:06:18', '2025-07-03 03:06:18', '88777347641');
INSERT INTO `task` VALUES ('232', 'test2', 'send_rebate', '{\"data\":{\"bizId\":\"test2_sku_20250703\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"test2\"},\"id\":\"15931965854\",\"timestamp\":\"2025-07-03 03:06:38.844\"}', 'completed', '2025-07-03 03:06:38', '2025-07-03 03:06:38', '15931965854');
INSERT INTO `task` VALUES ('233', 'test2', 'send_rebate', '{\"data\":{\"bizId\":\"test2_integral_20250703\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test2\"},\"id\":\"94407176478\",\"timestamp\":\"2025-07-03 03:06:38.844\"}', 'completed', '2025-07-03 03:06:38', '2025-07-03 03:06:38', '94407176478');
INSERT INTO `task` VALUES ('234', 'test1', 'send_rebate', '{\"data\":{\"bizId\":\"test1_sku_20250703\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"test1\"},\"id\":\"38997197958\",\"timestamp\":\"2025-07-03 03:10:59.267\"}', 'completed', '2025-07-03 03:10:59', '2025-07-03 03:10:59', '38997197958');
INSERT INTO `task` VALUES ('235', 'test1', 'send_rebate', '{\"data\":{\"bizId\":\"test1_integral_20250703\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test1\"},\"id\":\"72008196035\",\"timestamp\":\"2025-07-03 03:10:59.267\"}', 'completed', '2025-07-03 03:10:59', '2025-07-03 03:10:59', '72008196035');
INSERT INTO `task` VALUES ('236', 'test1', 'send_rebate', '{\"data\":{\"bizId\":\"test1_sku_20250703\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"test1\"},\"id\":\"52522905929\",\"timestamp\":\"2025-07-03 17:30:24.499\"}', 'completed', '2025-07-03 17:30:24', '2025-07-03 17:30:24', '52522905929');
INSERT INTO `task` VALUES ('237', 'test1', 'send_rebate', '{\"data\":{\"bizId\":\"test1_integral_20250703\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test1\"},\"id\":\"48181035813\",\"timestamp\":\"2025-07-03 17:30:24.503\"}', 'completed', '2025-07-03 17:30:24', '2025-07-03 17:30:24', '48181035813');
INSERT INTO `task` VALUES ('238', 'test1', 'send_rebate', '{\"data\":{\"bizId\":\"test1_sku_20250703\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"test1\"},\"id\":\"79399561245\",\"timestamp\":\"2025-07-03 17:30:51.008\"}', 'completed', '2025-07-03 17:30:51', '2025-07-03 17:30:51', '79399561245');
INSERT INTO `task` VALUES ('239', 'test1', 'send_rebate', '{\"data\":{\"bizId\":\"test1_integral_20250703\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test1\"},\"id\":\"05737602231\",\"timestamp\":\"2025-07-03 17:30:51.008\"}', 'completed', '2025-07-03 17:30:51', '2025-07-03 17:30:51', '05737602231');
INSERT INTO `task` VALUES ('240', 'test3', 'send_rebate', '{\"data\":{\"bizId\":\"test3_sku_20250703\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"test3\"},\"id\":\"18748037971\",\"timestamp\":\"2025-07-03 18:33:05.836\"}', 'completed', '2025-07-03 18:33:05', '2025-07-03 18:33:05', '18748037971');
INSERT INTO `task` VALUES ('241', 'test3', 'send_rebate', '{\"data\":{\"bizId\":\"test3_integral_20250703\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test3\"},\"id\":\"92782401103\",\"timestamp\":\"2025-07-03 18:33:05.838\"}', 'completed', '2025-07-03 18:33:05', '2025-07-03 18:33:05', '92782401103');
INSERT INTO `task` VALUES ('242', 'test3', 'send_award', '{\"data\":{\"awardId\":106,\"awardTitle\":\"增加GPT-03-mini模型\",\"userId\":\"test3\"},\"id\":\"536870093928\",\"timestamp\":\"2025-07-03 18:33:43.837\"}', 'completed', '2025-07-03 18:33:43', '2025-07-03 18:33:43', '536870093928');
INSERT INTO `task` VALUES ('243', 'test3', 'send_award', '{\"data\":{\"awardId\":102,\"awardTitle\":\"5次使用\",\"userId\":\"test3\"},\"id\":\"407267740723\",\"timestamp\":\"2025-07-03 18:40:25.812\"}', 'completed', '2025-07-03 18:40:25', '2025-07-03 18:40:25', '407267740723');
INSERT INTO `task` VALUES ('244', 'test3', 'send_award', '{\"data\":{\"awardId\":103,\"awardTitle\":\"10次使用\",\"userId\":\"test3\"},\"id\":\"421560264233\",\"timestamp\":\"2025-07-03 18:40:45.784\"}', 'completed', '2025-07-03 18:40:45', '2025-07-03 18:40:45', '421560264233');
INSERT INTO `task` VALUES ('245', 'test3', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"增加GPT-01模型\",\"userId\":\"test3\"},\"id\":\"376410871950\",\"timestamp\":\"2025-07-03 18:41:06.77\"}', 'completed', '2025-07-03 18:41:06', '2025-07-03 18:41:06', '376410871950');
INSERT INTO `task` VALUES ('246', 'test3', 'send_award', '{\"data\":{\"awardId\":103,\"awardTitle\":\"10次使用\",\"userId\":\"test3\"},\"id\":\"015538639715\",\"timestamp\":\"2025-07-03 18:42:53.562\"}', 'completed', '2025-07-03 18:42:53', '2025-07-03 18:42:53', '015538639715');
INSERT INTO `task` VALUES ('247', 'test3', 'send_award', '{\"data\":{\"awardId\":106,\"awardTitle\":\"增加GPT-03-mini模型\",\"userId\":\"test3\"},\"id\":\"524271908033\",\"timestamp\":\"2025-07-03 18:48:05.267\"}', 'completed', '2025-07-03 18:48:05', '2025-07-03 18:48:05', '524271908033');
INSERT INTO `task` VALUES ('248', 'test3', 'send_award', '{\"data\":{\"awardId\":103,\"awardTitle\":\"10次使用\",\"userId\":\"test3\"},\"id\":\"571425118863\",\"timestamp\":\"2025-07-03 18:48:45.612\"}', 'completed', '2025-07-03 18:48:45', '2025-07-03 18:48:45', '571425118863');
INSERT INTO `task` VALUES ('249', 'test3', 'send_award', '{\"data\":{\"awardId\":103,\"awardTitle\":\"10次使用\",\"userId\":\"test3\"},\"id\":\"037298552993\",\"timestamp\":\"2025-07-03 18:49:20.824\"}', 'completed', '2025-07-03 18:49:20', '2025-07-03 18:49:20', '037298552993');
INSERT INTO `task` VALUES ('250', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"749988668199\",\"timestamp\":\"2025-07-03 18:54:31.245\"}', 'completed', '2025-07-03 18:54:31', '2025-07-03 18:54:31', '749988668199');
INSERT INTO `task` VALUES ('251', 'test3', 'send_award', '{\"data\":{\"awardId\":102,\"awardTitle\":\"5次使用\",\"userId\":\"test3\"},\"id\":\"936739092370\",\"timestamp\":\"2025-07-03 18:54:39.072\"}', 'completed', '2025-07-03 18:54:39', '2025-07-03 18:54:39', '936739092370');
INSERT INTO `task` VALUES ('252', 'test3', 'send_rebate', '{\"data\":{\"bizId\":\"test3_sku_20250703\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"test3\"},\"id\":\"14332984850\",\"timestamp\":\"2025-07-03 19:33:18.114\"}', 'completed', '2025-07-03 19:33:18', '2025-07-03 19:33:18', '14332984850');
INSERT INTO `task` VALUES ('253', 'test3', 'send_rebate', '{\"data\":{\"bizId\":\"test3_integral_20250703\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"test3\"},\"id\":\"12411023848\",\"timestamp\":\"2025-07-03 19:33:18.114\"}', 'completed', '2025-07-03 19:33:18', '2025-07-03 19:33:18', '12411023848');
INSERT INTO `task` VALUES ('254', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"660668991744\",\"timestamp\":\"2025-07-03 19:34:35.932\"}', 'completed', '2025-07-03 19:34:35', '2025-07-03 19:34:35', '660668991744');
INSERT INTO `task` VALUES ('255', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"298256081950\",\"timestamp\":\"2025-07-03 19:34:46.891\"}', 'completed', '2025-07-03 19:34:46', '2025-07-03 19:34:46', '298256081950');
INSERT INTO `task` VALUES ('256', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"574945218254\",\"timestamp\":\"2025-07-03 19:39:41.184\"}', 'completed', '2025-07-03 19:39:41', '2025-07-03 19:39:41', '574945218254');
INSERT INTO `task` VALUES ('257', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"142560913656\",\"timestamp\":\"2025-07-03 19:39:46.333\"}', 'completed', '2025-07-03 19:39:46', '2025-07-03 19:39:46', '142560913656');
INSERT INTO `task` VALUES ('258', 'test3', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"增加GPT-01模型\",\"userId\":\"test3\"},\"id\":\"803666757410\",\"timestamp\":\"2025-07-03 19:39:53.767\"}', 'completed', '2025-07-03 19:39:53', '2025-07-03 19:39:53', '803666757410');
INSERT INTO `task` VALUES ('259', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"945837033828\",\"timestamp\":\"2025-07-03 19:40:00.917\"}', 'completed', '2025-07-03 19:40:00', '2025-07-03 19:40:00', '945837033828');
INSERT INTO `task` VALUES ('260', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"589551492184\",\"timestamp\":\"2025-07-03 19:49:39.121\"}', 'completed', '2025-07-03 19:49:39', '2025-07-03 19:49:39', '589551492184');
INSERT INTO `task` VALUES ('261', 'test2', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"test2\"},\"id\":\"227343229887\",\"timestamp\":\"2025-07-03 19:51:31.376\"}', 'completed', '2025-07-03 19:51:31', '2025-07-03 19:51:31', '227343229887');
INSERT INTO `task` VALUES ('262', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"713118042864\",\"timestamp\":\"2025-07-03 19:51:43.354\"}', 'completed', '2025-07-03 19:51:43', '2025-07-03 19:51:43', '713118042864');
INSERT INTO `task` VALUES ('263', 'test2', 'send_award', '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"test2\"},\"id\":\"050406080861\",\"timestamp\":\"2025-07-03 19:51:50.022\"}', 'completed', '2025-07-03 19:51:50', '2025-07-03 19:51:50', '050406080861');
INSERT INTO `task` VALUES ('264', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"436328453436\",\"timestamp\":\"2025-07-03 19:51:58.681\"}', 'completed', '2025-07-03 19:51:58', '2025-07-03 19:51:58', '436328453436');
INSERT INTO `task` VALUES ('265', 'test2', 'send_award', '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"test2\"},\"id\":\"488575392996\",\"timestamp\":\"2025-07-03 19:52:06.464\"}', 'completed', '2025-07-03 19:52:06', '2025-07-03 19:52:06', '488575392996');
INSERT INTO `task` VALUES ('266', 'test3', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"增加GPT-01模型\",\"userId\":\"test3\"},\"id\":\"226957988926\",\"timestamp\":\"2025-07-03 19:52:13.131\"}', 'completed', '2025-07-03 19:52:13', '2025-07-03 19:52:13', '226957988926');
INSERT INTO `task` VALUES ('267', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"883383219031\",\"timestamp\":\"2025-07-03 19:59:02\"}', 'completed', '2025-07-03 19:59:02', '2025-07-03 19:59:02', '883383219031');
INSERT INTO `task` VALUES ('268', 'test4', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"增加GPT-01模型\",\"userId\":\"test4\"},\"id\":\"657699528195\",\"timestamp\":\"2025-07-03 20:01:59.353\"}', 'completed', '2025-07-03 20:01:59', '2025-07-03 20:01:59', '657699528195');
INSERT INTO `task` VALUES ('269', 'test4', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test4\"},\"id\":\"579235071454\",\"timestamp\":\"2025-07-03 20:04:59.503\"}', 'completed', '2025-07-03 20:04:59', '2025-07-03 20:04:59', '579235071454');
INSERT INTO `task` VALUES ('270', 'test4', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test4\"},\"id\":\"095305718843\",\"timestamp\":\"2025-07-03 21:43:07.852\"}', 'completed', '2025-07-03 21:43:07', '2025-07-03 21:43:07', '095305718843');
INSERT INTO `task` VALUES ('271', 'test4', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test4\"},\"id\":\"058057853090\",\"timestamp\":\"2025-07-03 21:44:11.61\"}', 'completed', '2025-07-03 21:44:11', '2025-07-03 21:44:11', '058057853090');
INSERT INTO `task` VALUES ('272', 'test4', 'send_award', '{\"data\":{\"awardId\":103,\"awardTitle\":\"10次使用\",\"userId\":\"test4\"},\"id\":\"402959638278\",\"timestamp\":\"2025-07-03 21:47:06.393\"}', 'completed', '2025-07-03 21:47:06', '2025-07-03 21:47:06', '402959638278');
INSERT INTO `task` VALUES ('273', 'test4', 'send_award', '{\"data\":{\"awardId\":106,\"awardTitle\":\"增加GPT-03-mini模型\",\"userId\":\"test4\"},\"id\":\"596829731074\",\"timestamp\":\"2025-07-03 21:47:17.554\"}', 'completed', '2025-07-03 21:47:17', '2025-07-03 21:47:17', '596829731074');
INSERT INTO `task` VALUES ('274', 'test5', 'send_award', '{\"data\":{\"awardId\":102,\"awardTitle\":\"5次使用\",\"userId\":\"test5\"},\"id\":\"211503581906\",\"timestamp\":\"2025-07-03 21:58:57.222\"}', 'completed', '2025-07-03 21:58:57', '2025-07-03 21:58:57', '211503581906');
INSERT INTO `task` VALUES ('275', 'test5', 'send_award', '{\"data\":{\"awardId\":106,\"awardTitle\":\"增加GPT-03-mini模型\",\"userId\":\"test5\"},\"id\":\"286873625716\",\"timestamp\":\"2025-07-03 21:59:28.877\"}', 'completed', '2025-07-03 21:59:28', '2025-07-03 21:59:28', '286873625716');
INSERT INTO `task` VALUES ('276', 'test6', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test6\"},\"id\":\"507971736896\",\"timestamp\":\"2025-07-03 22:16:14.12\"}', 'completed', '2025-07-03 22:16:14', '2025-07-03 22:16:14', '507971736896');
INSERT INTO `task` VALUES ('277', 'test6', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test6\"},\"id\":\"151081866029\",\"timestamp\":\"2025-07-03 22:16:22.529\"}', 'completed', '2025-07-03 22:16:22', '2025-07-03 22:16:22', '151081866029');
INSERT INTO `task` VALUES ('278', 'test6', 'send_award', '{\"data\":{\"awardId\":104,\"awardTitle\":\"20次使用\",\"userId\":\"test6\"},\"id\":\"290048631590\",\"timestamp\":\"2025-07-03 22:16:28.751\"}', 'completed', '2025-07-03 22:16:28', '2025-07-03 22:16:28', '290048631590');
INSERT INTO `task` VALUES ('279', 'test6', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test6\"},\"id\":\"135156001618\",\"timestamp\":\"2025-07-03 22:16:35.25\"}', 'completed', '2025-07-03 22:16:35', '2025-07-03 22:16:35', '135156001618');
INSERT INTO `task` VALUES ('280', 'test2', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test2\"},\"id\":\"503390755453\",\"timestamp\":\"2025-07-03 22:17:02.832\"}', 'completed', '2025-07-03 22:17:02', '2025-07-03 22:17:02', '503390755453');
INSERT INTO `task` VALUES ('281', 'test7', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test7\"},\"id\":\"562775517216\",\"timestamp\":\"2025-07-03 22:23:41.249\"}', 'completed', '2025-07-03 22:23:41', '2025-07-03 22:23:41', '562775517216');
INSERT INTO `task` VALUES ('282', 'test7', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test7\"},\"id\":\"352282915010\",\"timestamp\":\"2025-07-03 22:23:46.304\"}', 'completed', '2025-07-03 22:23:46', '2025-07-03 22:23:46', '352282915010');
INSERT INTO `task` VALUES ('283', 'test2', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test2\"},\"id\":\"007376320991\",\"timestamp\":\"2025-07-03 22:24:18.598\"}', 'completed', '2025-07-03 22:24:18', '2025-07-03 22:24:18', '007376320991');
INSERT INTO `task` VALUES ('284', 'test3', 'send_award', '{\"data\":{\"awardId\":106,\"awardTitle\":\"增加GPT-03-mini模型\",\"userId\":\"test3\"},\"id\":\"602673311243\",\"timestamp\":\"2025-07-03 22:48:45.326\"}', 'completed', '2025-07-03 22:48:45', '2025-07-03 22:48:45', '602673311243');
INSERT INTO `task` VALUES ('285', 'test3', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test3\"},\"id\":\"507238816943\",\"timestamp\":\"2025-07-03 22:49:05.514\"}', 'completed', '2025-07-03 22:49:05', '2025-07-03 22:49:05', '507238816943');
INSERT INTO `task` VALUES ('286', 'test1', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"test1\"},\"id\":\"405844336667\",\"timestamp\":\"2025-07-03 23:08:59.122\"}', 'completed', '2025-07-03 23:08:59', '2025-07-03 23:08:59', '405844336667');
INSERT INTO `task` VALUES ('287', 'test7', 'send_award', '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"test7\"},\"id\":\"781934246017\",\"timestamp\":\"2025-07-03 23:26:31.932\"}', 'completed', '2025-07-03 23:26:31', '2025-07-03 23:26:31', '781934246017');
INSERT INTO `task` VALUES ('288', 'ad', 'send_award', '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"ad\"},\"id\":\"930696591488\",\"timestamp\":\"2025-07-03 23:34:39.75\"}', 'completed', '2025-07-03 23:34:39', '2025-07-03 23:34:39', '930696591488');
INSERT INTO `task` VALUES ('289', 'ad', 'send_rebate', '{\"data\":{\"bizId\":\"ad_sku_20250703\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ad\"},\"id\":\"50688572937\",\"timestamp\":\"2025-07-03 23:34:57.667\"}', 'completed', '2025-07-03 23:34:57', '2025-07-03 23:34:57', '50688572937');
INSERT INTO `task` VALUES ('290', 'ad', 'send_rebate', '{\"data\":{\"bizId\":\"ad_integral_20250703\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ad\"},\"id\":\"82296641930\",\"timestamp\":\"2025-07-03 23:34:57.669\"}', 'completed', '2025-07-03 23:34:57', '2025-07-03 23:34:57', '82296641930');
INSERT INTO `task` VALUES ('291', 's', 'send_award', '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"s\"},\"id\":\"062057077871\",\"timestamp\":\"2025-07-03 23:43:40.539\"}', 'completed', '2025-07-03 23:43:40', '2025-07-03 23:43:40', '062057077871');
INSERT INTO `task` VALUES ('292', 's', 'send_award', '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"s\"},\"id\":\"975175588834\",\"timestamp\":\"2025-07-03 23:48:26.804\"}', 'completed', '2025-07-03 23:48:26', '2025-07-03 23:48:26', '975175588834');
INSERT INTO `task` VALUES ('293', 's', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"s\"},\"id\":\"634554386163\",\"timestamp\":\"2025-07-03 23:48:40.135\"}', 'completed', '2025-07-03 23:48:40', '2025-07-03 23:48:40', '634554386163');
INSERT INTO `task` VALUES ('294', 'd', 'send_award', '{\"data\":{\"awardId\":104,\"awardTitle\":\"20次使用\",\"userId\":\"d\"},\"id\":\"921166320413\",\"timestamp\":\"2025-07-03 23:54:32.128\"}', 'completed', '2025-07-03 23:54:32', '2025-07-03 23:54:32', '921166320413');
INSERT INTO `task` VALUES ('295', 'd', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"d\"},\"id\":\"052909795352\",\"timestamp\":\"2025-07-03 23:54:46.2\"}', 'completed', '2025-07-03 23:54:46', '2025-07-03 23:54:46', '052909795352');
INSERT INTO `task` VALUES ('296', 'd', 'send_award', '{\"data\":{\"awardId\":102,\"awardTitle\":\"5次使用\",\"userId\":\"d\"},\"id\":\"727825506582\",\"timestamp\":\"2025-07-03 23:55:55.991\"}', 'completed', '2025-07-03 23:55:55', '2025-07-03 23:55:55', '727825506582');
INSERT INTO `task` VALUES ('297', 'd', 'send_award', '{\"data\":{\"awardId\":102,\"awardTitle\":\"5次使用\",\"userId\":\"d\"},\"id\":\"332235760375\",\"timestamp\":\"2025-07-03 23:56:02.908\"}', 'completed', '2025-07-03 23:56:02', '2025-07-03 23:56:02', '332235760375');
INSERT INTO `task` VALUES ('298', 's', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"s\"},\"id\":\"399977070638\",\"timestamp\":\"2025-07-03 23:57:04.1\"}', 'completed', '2025-07-03 23:57:04', '2025-07-03 23:57:04', '399977070638');
INSERT INTO `task` VALUES ('299', 's', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"s\"},\"id\":\"958376312338\",\"timestamp\":\"2025-07-03 23:57:34.55\"}', 'completed', '2025-07-03 23:57:34', '2025-07-03 23:57:34', '958376312338');
INSERT INTO `task` VALUES ('300', 'xiaofuge', 'send_award', '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"550570165707\",\"timestamp\":\"2025-07-04 00:03:33.23\"}', 'completed', '2025-07-04 00:03:33', '2025-07-04 00:03:33', '550570165707');
INSERT INTO `task` VALUES ('301', 'xiaofuge', 'send_award', '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"492268587430\",\"timestamp\":\"2025-07-04 00:03:45.462\"}', 'completed', '2025-07-04 00:03:45', '2025-07-04 00:03:45', '492268587430');
INSERT INTO `task` VALUES ('302', '罗家铿', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"罗家铿\"},\"id\":\"133939090794\",\"timestamp\":\"2025-07-04 00:04:17.855\"}', 'completed', '2025-07-04 00:04:17', '2025-07-04 00:04:17', '133939090794');
INSERT INTO `task` VALUES ('303', '罗家铿', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"罗家铿\"},\"id\":\"358060503948\",\"timestamp\":\"2025-07-04 00:04:24.008\"}', 'completed', '2025-07-04 00:04:24', '2025-07-04 00:04:24', '358060503948');
INSERT INTO `task` VALUES ('304', '王勃', 'send_rebate', '{\"data\":{\"bizId\":\"王勃_sku_20250704\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"王勃\"},\"id\":\"22356014647\",\"timestamp\":\"2025-07-04 00:07:43.048\"}', 'completed', '2025-07-04 00:07:43', '2025-07-04 00:07:43', '22356014647');
INSERT INTO `task` VALUES ('305', '王勃', 'send_rebate', '{\"data\":{\"bizId\":\"王勃_integral_20250704\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"王勃\"},\"id\":\"55041835050\",\"timestamp\":\"2025-07-04 00:07:43.049\"}', 'completed', '2025-07-04 00:07:43', '2025-07-04 00:07:43', '55041835050');
INSERT INTO `task` VALUES ('306', '王勃', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"王勃\"},\"id\":\"832315096949\",\"timestamp\":\"2025-07-04 00:07:46.206\"}', 'completed', '2025-07-04 00:07:46', '2025-07-04 00:07:46', '832315096949');
INSERT INTO `task` VALUES ('307', '王勃', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"王勃\"},\"id\":\"108249746949\",\"timestamp\":\"2025-07-04 00:08:00.99\"}', 'completed', '2025-07-04 00:08:01', '2025-07-04 00:08:01', '108249746949');
INSERT INTO `task` VALUES ('308', '王勃', 'send_award', '{\"data\":{\"awardId\":105,\"awardTitle\":\"增加GPT-01模型\",\"userId\":\"王勃\"},\"id\":\"668375054778\",\"timestamp\":\"2025-07-04 00:08:22.903\"}', 'completed', '2025-07-04 00:08:22', '2025-07-04 00:08:22', '668375054778');
INSERT INTO `task` VALUES ('309', '王勃', 'send_award', '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"王勃\"},\"id\":\"370904697617\",\"timestamp\":\"2025-07-04 00:08:30.461\"}', 'completed', '2025-07-04 00:08:30', '2025-07-04 00:08:30', '370904697617');

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
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_award_record_0
-- ----------------------------
INSERT INTO `user_award_record_0` VALUES ('2', 'luojiakeng', '100301', '100006', '101', '453586897180', '用户随机积分', '2025-04-30 14:54:44', 'create', '2025-04-30 22:54:44', '2025-04-30 22:54:44');
INSERT INTO `user_award_record_0` VALUES ('3', 'luojiakeng', '100301', '100006', '101', '612486598829', '用户随机积分', '2025-04-30 14:57:18', 'create', '2025-04-30 22:57:18', '2025-04-30 22:57:18');
INSERT INTO `user_award_record_0` VALUES ('4', 'luojiakeng', '100301', '100006', '101', '828564266652', '用户随机积分', '2025-04-30 14:57:19', 'create', '2025-04-30 22:57:18', '2025-04-30 22:57:18');
INSERT INTO `user_award_record_0` VALUES ('5', 'luojiakeng', '100301', '100006', '101', '869576053860', '用户随机积分', '2025-04-30 14:57:19', 'create', '2025-04-30 22:57:19', '2025-04-30 22:57:19');
INSERT INTO `user_award_record_0` VALUES ('6', 'luojiakeng', '100301', '100006', '101', '027984613322', '用户随机积分', '2025-04-30 14:57:20', 'create', '2025-04-30 22:57:19', '2025-04-30 22:57:19');
INSERT INTO `user_award_record_0` VALUES ('7', 'luojiakeng', '100301', '100006', '101', '874448694039', '用户随机积分', '2025-04-30 14:57:20', 'create', '2025-04-30 22:57:20', '2025-04-30 22:57:20');
INSERT INTO `user_award_record_0` VALUES ('8', 'luojiakeng', '100301', '100006', '101', '986054411956', '用户随机积分', '2025-04-30 14:57:21', 'create', '2025-04-30 22:57:20', '2025-04-30 22:57:20');
INSERT INTO `user_award_record_0` VALUES ('9', 'luojiakeng', '100301', '100006', '101', '439158934067', '用户随机积分', '2025-04-30 14:57:21', 'create', '2025-04-30 22:57:21', '2025-04-30 22:57:21');
INSERT INTO `user_award_record_0` VALUES ('10', 'luojiakeng', '100301', '100006', '101', '838783998181', '用户随机积分', '2025-04-30 14:57:22', 'create', '2025-04-30 22:57:21', '2025-04-30 22:57:21');
INSERT INTO `user_award_record_0` VALUES ('11', 'luojiakeng', '100301', '100006', '101', '526800499138', '用户随机积分', '2025-04-30 14:57:22', 'create', '2025-04-30 22:57:22', '2025-04-30 22:57:22');
INSERT INTO `user_award_record_0` VALUES ('12', 'luojiakeng', '100301', '100006', '101', '683718136321', '用户随机积分', '2025-04-30 14:57:23', 'create', '2025-04-30 22:57:22', '2025-04-30 22:57:22');
INSERT INTO `user_award_record_0` VALUES ('13', 'luojiakeng', '100301', '100006', '101', '556917592670', '用户随机积分', '2025-04-30 14:57:23', 'create', '2025-04-30 22:57:23', '2025-04-30 22:57:23');
INSERT INTO `user_award_record_0` VALUES ('14', 'luojiakeng', '100301', '100006', '101', '994217916140', '用户随机积分', '2025-04-30 14:57:24', 'create', '2025-04-30 22:57:23', '2025-04-30 22:57:23');
INSERT INTO `user_award_record_0` VALUES ('15', 'luojiakeng', '100301', '100006', '101', '680887061861', '用户随机积分', '2025-04-30 14:57:24', 'create', '2025-04-30 22:57:24', '2025-04-30 22:57:24');
INSERT INTO `user_award_record_0` VALUES ('16', 'luojiakeng', '100301', '100006', '101', '648707797428', '用户随机积分', '2025-04-30 14:57:25', 'create', '2025-04-30 22:57:24', '2025-04-30 22:57:24');
INSERT INTO `user_award_record_0` VALUES ('17', 'luojiakeng', '100301', '100006', '101', '662651362395', '用户随机积分', '2025-04-30 14:57:25', 'create', '2025-04-30 22:57:25', '2025-04-30 22:57:25');
INSERT INTO `user_award_record_0` VALUES ('18', 'luojiakeng', '100301', '100006', '101', '292924667682', '用户随机积分', '2025-04-30 14:57:26', 'create', '2025-04-30 22:57:26', '2025-04-30 22:57:26');
INSERT INTO `user_award_record_0` VALUES ('19', 'luojiakeng', '100301', '100006', '101', '600360318443', '用户随机积分', '2025-04-30 14:57:27', 'create', '2025-04-30 22:57:26', '2025-04-30 22:57:26');
INSERT INTO `user_award_record_0` VALUES ('20', 'luojiakeng', '100301', '100006', '101', '930217807276', '用户随机积分', '2025-04-30 14:57:27', 'create', '2025-04-30 22:57:27', '2025-04-30 22:57:27');
INSERT INTO `user_award_record_0` VALUES ('21', 'luojiakeng', '100301', '100006', '101', '627839152814', '用户随机积分', '2025-04-30 14:57:28', 'create', '2025-04-30 22:57:27', '2025-04-30 22:57:27');
INSERT INTO `user_award_record_0` VALUES ('22', 'luojiakeng', '100301', '100006', '101', '158908498562', '用户随机积分', '2025-04-30 14:57:28', 'create', '2025-04-30 22:57:28', '2025-04-30 22:57:28');
INSERT INTO `user_award_record_0` VALUES ('23', 'luojiakeng', '100301', '100006', '101', '382674269121', '用户随机积分', '2025-04-30 14:57:29', 'create', '2025-04-30 22:57:28', '2025-04-30 22:57:28');
INSERT INTO `user_award_record_0` VALUES ('24', 'luojiakeng', '100301', '100006', '101', '231007792498', '用户随机积分', '2025-04-30 14:57:29', 'create', '2025-04-30 22:57:29', '2025-04-30 22:57:29');
INSERT INTO `user_award_record_0` VALUES ('25', 'luojiakeng', '100301', '100006', '101', '997831319285', '用户随机积分', '2025-04-30 14:57:30', 'create', '2025-04-30 22:57:29', '2025-04-30 22:57:29');
INSERT INTO `user_award_record_0` VALUES ('26', 'luojiakeng', '100301', '100006', '101', '364465346168', '用户随机积分', '2025-04-30 14:57:30', 'create', '2025-04-30 22:57:30', '2025-04-30 22:57:30');
INSERT INTO `user_award_record_0` VALUES ('27', 'luojiakeng', '100301', '100006', '101', '762849206787', '用户随机积分', '2025-04-30 14:57:31', 'create', '2025-04-30 22:57:30', '2025-04-30 22:57:30');
INSERT INTO `user_award_record_0` VALUES ('28', 'luojiakeng', '100301', '100006', '101', '777146268342', '用户随机积分', '2025-04-30 14:57:31', 'create', '2025-04-30 22:57:31', '2025-04-30 22:57:31');
INSERT INTO `user_award_record_0` VALUES ('29', 'luojiakeng', '100301', '100006', '101', '513201227840', '用户随机积分', '2025-04-30 14:57:32', 'create', '2025-04-30 22:57:31', '2025-04-30 22:57:31');
INSERT INTO `user_award_record_0` VALUES ('30', 'luojiakeng', '100301', '100006', '101', '367617850745', '用户随机积分', '2025-04-30 14:57:32', 'create', '2025-04-30 22:57:32', '2025-04-30 22:57:32');
INSERT INTO `user_award_record_0` VALUES ('31', 'luojiakeng', '100301', '100006', '101', '905799656290', '用户随机积分', '2025-04-30 14:57:33', 'create', '2025-04-30 22:57:32', '2025-04-30 22:57:32');
INSERT INTO `user_award_record_0` VALUES ('32', 'luojiakeng', '100301', '100006', '101', '178168133520', '用户随机积分', '2025-04-30 14:57:33', 'create', '2025-04-30 22:57:33', '2025-04-30 22:57:33');
INSERT INTO `user_award_record_0` VALUES ('33', 'luojiakeng', '100301', '100006', '101', '878622004648', '用户随机积分', '2025-04-30 14:57:34', 'create', '2025-04-30 22:57:33', '2025-04-30 22:57:33');
INSERT INTO `user_award_record_0` VALUES ('34', 'luojiakeng', '100301', '100006', '101', '628977847454', '用户随机积分', '2025-04-30 14:57:34', 'create', '2025-04-30 22:57:34', '2025-04-30 22:57:34');
INSERT INTO `user_award_record_0` VALUES ('35', 'luojiakeng', '100301', '100006', '101', '626873535166', '用户随机积分', '2025-04-30 14:57:35', 'create', '2025-04-30 22:57:34', '2025-04-30 22:57:34');
INSERT INTO `user_award_record_0` VALUES ('36', 'luojiakeng', '100301', '100006', '101', '128763093995', '用户随机积分', '2025-04-30 14:57:35', 'create', '2025-04-30 22:57:35', '2025-04-30 22:57:35');
INSERT INTO `user_award_record_0` VALUES ('37', 'luojiakeng', '100301', '100006', '101', '257648402186', '用户随机积分', '2025-04-30 14:57:36', 'create', '2025-04-30 22:57:35', '2025-04-30 22:57:35');
INSERT INTO `user_award_record_0` VALUES ('38', 'luojiakeng', '100301', '100006', '101', '579550758145', '用户随机积分', '2025-04-30 14:57:36', 'create', '2025-04-30 22:57:36', '2025-04-30 22:57:36');
INSERT INTO `user_award_record_0` VALUES ('39', 'luojiakeng', '100301', '100006', '101', '907097355822', '用户随机积分', '2025-04-30 14:57:37', 'create', '2025-04-30 22:57:36', '2025-04-30 22:57:36');
INSERT INTO `user_award_record_0` VALUES ('40', 'luojiakeng', '100301', '100006', '101', '770805867744', '用户随机积分', '2025-04-30 14:57:37', 'create', '2025-04-30 22:57:37', '2025-04-30 22:57:37');
INSERT INTO `user_award_record_0` VALUES ('41', 'luojiakeng', '100301', '100006', '101', '152090746281', '用户随机积分', '2025-04-30 14:57:38', 'create', '2025-04-30 22:57:37', '2025-04-30 22:57:37');
INSERT INTO `user_award_record_0` VALUES ('42', 'luojiakeng', '100301', '100006', '101', '625178723987', '用户随机积分', '2025-04-30 14:57:39', 'create', '2025-04-30 22:57:38', '2025-04-30 22:57:38');
INSERT INTO `user_award_record_0` VALUES ('43', 'luojiakeng', '100301', '100006', '101', '589793395810', '用户随机积分', '2025-04-30 14:57:39', 'create', '2025-04-30 22:57:39', '2025-04-30 22:57:39');
INSERT INTO `user_award_record_0` VALUES ('44', 'luojiakeng', '100301', '100006', '101', '334260262770', '用户随机积分', '2025-04-30 14:57:40', 'create', '2025-04-30 22:57:39', '2025-04-30 22:57:39');
INSERT INTO `user_award_record_0` VALUES ('45', 'luojiakeng', '100301', '100006', '101', '551417885247', '用户随机积分', '2025-04-30 14:57:40', 'create', '2025-04-30 22:57:40', '2025-04-30 22:57:40');
INSERT INTO `user_award_record_0` VALUES ('46', 'luojiakeng', '100301', '100006', '101', '818984127198', '用户随机积分', '2025-04-30 14:57:41', 'create', '2025-04-30 22:57:40', '2025-04-30 22:57:40');
INSERT INTO `user_award_record_0` VALUES ('47', 'luojiakeng', '100301', '100006', '101', '493922433251', '用户随机积分', '2025-04-30 14:57:41', 'create', '2025-04-30 22:57:41', '2025-04-30 22:57:41');
INSERT INTO `user_award_record_0` VALUES ('48', 'luojiakeng', '100301', '100006', '101', '699558389400', '用户随机积分', '2025-04-30 14:57:42', 'create', '2025-04-30 22:57:41', '2025-04-30 22:57:41');
INSERT INTO `user_award_record_0` VALUES ('49', 'luojiakeng', '100301', '100006', '101', '782021577163', '用户随机积分', '2025-04-30 14:57:42', 'create', '2025-04-30 22:57:42', '2025-04-30 22:57:42');
INSERT INTO `user_award_record_0` VALUES ('50', 'luojiakeng', '100301', '100006', '101', '029566843994', '用户随机积分', '2025-04-30 14:57:43', 'create', '2025-04-30 22:57:42', '2025-04-30 22:57:42');
INSERT INTO `user_award_record_0` VALUES ('51', 'luojiakeng', '100301', '100006', '101', '050220266997', '用户随机积分', '2025-04-30 14:57:43', 'create', '2025-04-30 22:57:43', '2025-04-30 22:57:43');
INSERT INTO `user_award_record_0` VALUES ('52', 'luojiakeng', '100301', '100006', '101', '851009464246', '用户随机积分', '2025-04-30 14:57:44', 'create', '2025-04-30 22:57:43', '2025-04-30 22:57:43');
INSERT INTO `user_award_record_0` VALUES ('53', 'luojiakeng', '100301', '100006', '101', '652041673785', '用户随机积分', '2025-04-30 14:57:44', 'create', '2025-04-30 22:57:44', '2025-04-30 22:57:44');
INSERT INTO `user_award_record_0` VALUES ('54', 'luojiakeng', '100301', '100006', '101', '317874300416', '用户随机积分', '2025-04-30 14:57:45', 'create', '2025-04-30 22:57:44', '2025-04-30 22:57:44');
INSERT INTO `user_award_record_0` VALUES ('55', 'luojiakeng', '100301', '100006', '101', '037997247277', '用户随机积分', '2025-04-30 14:57:45', 'create', '2025-04-30 22:57:45', '2025-04-30 22:57:45');
INSERT INTO `user_award_record_0` VALUES ('56', 'luojiakeng', '100301', '100006', '101', '147428195678', '用户随机积分', '2025-04-30 14:57:46', 'create', '2025-04-30 22:57:45', '2025-04-30 22:57:45');
INSERT INTO `user_award_record_0` VALUES ('57', 'luojiakeng', '100301', '100006', '101', '248635903540', '用户随机积分', '2025-04-30 14:57:46', 'create', '2025-04-30 22:57:46', '2025-04-30 22:57:46');
INSERT INTO `user_award_record_0` VALUES ('58', 'luojiakeng', '100301', '100006', '101', '264235687426', '用户随机积分', '2025-04-30 14:57:47', 'create', '2025-04-30 22:57:46', '2025-04-30 22:57:46');
INSERT INTO `user_award_record_0` VALUES ('59', 'luojiakeng', '100301', '100006', '101', '545478736627', '用户随机积分', '2025-04-30 14:57:47', 'create', '2025-04-30 22:57:47', '2025-04-30 22:57:47');
INSERT INTO `user_award_record_0` VALUES ('60', 'luojiakeng', '100301', '100006', '101', '562116519038', '用户随机积分', '2025-04-30 14:57:48', 'create', '2025-04-30 22:57:47', '2025-04-30 22:57:47');
INSERT INTO `user_award_record_0` VALUES ('61', 'luojiakeng', '100301', '100006', '101', '619747116368', '用户随机积分', '2025-04-30 14:57:48', 'create', '2025-04-30 22:57:48', '2025-04-30 22:57:48');
INSERT INTO `user_award_record_0` VALUES ('62', 'luojiakeng', '100301', '100006', '101', '966417320944', '用户随机积分', '2025-04-30 14:57:49', 'create', '2025-04-30 22:57:48', '2025-04-30 22:57:48');
INSERT INTO `user_award_record_0` VALUES ('63', 'luojiakeng', '100301', '100006', '101', '701880173459', '用户随机积分', '2025-04-30 14:57:49', 'create', '2025-04-30 22:57:49', '2025-04-30 22:57:49');
INSERT INTO `user_award_record_0` VALUES ('64', 'luojiakeng', '100301', '100006', '101', '388104231481', '用户随机积分', '2025-04-30 14:57:50', 'create', '2025-04-30 22:57:49', '2025-04-30 22:57:49');
INSERT INTO `user_award_record_0` VALUES ('65', 'luojiakeng', '100301', '100006', '101', '946047352491', '用户随机积分', '2025-04-30 14:57:50', 'create', '2025-04-30 22:57:50', '2025-04-30 22:57:50');
INSERT INTO `user_award_record_0` VALUES ('66', 'luojiakeng', '100301', '100006', '101', '329813281706', '用户随机积分', '2025-04-30 14:57:51', 'create', '2025-04-30 22:57:50', '2025-04-30 22:57:50');
INSERT INTO `user_award_record_0` VALUES ('67', 'luojiakeng', '100301', '100006', '101', '960896078780', '用户随机积分', '2025-04-30 14:57:52', 'create', '2025-04-30 22:57:51', '2025-04-30 22:57:51');
INSERT INTO `user_award_record_0` VALUES ('68', 'luojiakeng', '100301', '100006', '101', '568801703621', '用户随机积分', '2025-04-30 14:57:52', 'create', '2025-04-30 22:57:52', '2025-04-30 22:57:52');
INSERT INTO `user_award_record_0` VALUES ('69', 'luojiakeng', '100301', '100006', '101', '159014277811', '用户随机积分', '2025-04-30 14:57:53', 'create', '2025-04-30 22:57:52', '2025-04-30 22:57:52');
INSERT INTO `user_award_record_0` VALUES ('70', 'luojiakeng', '100301', '100006', '101', '218122959855', '用户随机积分', '2025-04-30 14:57:53', 'create', '2025-04-30 22:57:53', '2025-04-30 22:57:53');
INSERT INTO `user_award_record_0` VALUES ('71', 'luojiakeng', '100301', '100006', '101', '173535904313', '用户随机积分', '2025-04-30 14:57:54', 'create', '2025-04-30 22:57:53', '2025-04-30 22:57:53');
INSERT INTO `user_award_record_0` VALUES ('72', 'luojiakeng', '100301', '100006', '101', '535780456383', '用户随机积分', '2025-04-30 14:57:54', 'create', '2025-04-30 22:57:54', '2025-04-30 22:57:54');
INSERT INTO `user_award_record_0` VALUES ('73', 'luojiakeng', '100301', '100006', '101', '375313530912', '用户随机积分', '2025-04-30 14:57:55', 'create', '2025-04-30 22:57:54', '2025-04-30 22:57:54');
INSERT INTO `user_award_record_0` VALUES ('74', 'luojiakeng', '100301', '100006', '101', '121445816229', '用户随机积分', '2025-04-30 14:57:55', 'create', '2025-04-30 22:57:55', '2025-04-30 22:57:55');
INSERT INTO `user_award_record_0` VALUES ('75', 'luojiakeng', '100301', '100006', '101', '025063618721', '用户随机积分', '2025-04-30 14:57:56', 'create', '2025-04-30 22:57:55', '2025-04-30 22:57:55');
INSERT INTO `user_award_record_0` VALUES ('76', 'luojiakeng', '100301', '100006', '101', '960081345452', '用户随机积分', '2025-04-30 14:57:56', 'create', '2025-04-30 22:57:56', '2025-04-30 22:57:56');
INSERT INTO `user_award_record_0` VALUES ('77', 'luojiakeng', '100301', '100006', '101', '007599775610', '用户随机积分', '2025-04-30 14:57:57', 'create', '2025-04-30 22:57:56', '2025-04-30 22:57:56');
INSERT INTO `user_award_record_0` VALUES ('78', 'luojiakeng', '100301', '100006', '101', '018754258015', '用户随机积分', '2025-04-30 14:57:57', 'create', '2025-04-30 22:57:57', '2025-04-30 22:57:57');
INSERT INTO `user_award_record_0` VALUES ('79', 'luojiakeng', '100301', '100006', '101', '702176352744', '用户随机积分', '2025-04-30 14:57:58', 'create', '2025-04-30 22:57:57', '2025-04-30 22:57:57');
INSERT INTO `user_award_record_0` VALUES ('80', 'luojiakeng', '100301', '100006', '101', '160011925818', '用户随机积分', '2025-04-30 14:57:58', 'create', '2025-04-30 22:57:58', '2025-04-30 22:57:58');
INSERT INTO `user_award_record_0` VALUES ('81', 'luojiakeng', '100301', '100006', '101', '931958326553', '用户随机积分', '2025-04-30 14:57:59', 'create', '2025-04-30 22:57:58', '2025-04-30 22:57:58');
INSERT INTO `user_award_record_0` VALUES ('82', 'luojiakeng', '100301', '100006', '101', '858105677512', '用户随机积分', '2025-04-30 14:57:59', 'create', '2025-04-30 22:57:59', '2025-04-30 22:57:59');
INSERT INTO `user_award_record_0` VALUES ('83', 'luojiakeng', '100301', '100006', '101', '723202240458', '用户随机积分', '2025-04-30 14:58:00', 'create', '2025-04-30 22:57:59', '2025-04-30 22:57:59');
INSERT INTO `user_award_record_0` VALUES ('84', 'luojiakeng', '100301', '100006', '101', '867748636974', '用户随机积分', '2025-04-30 14:58:00', 'create', '2025-04-30 22:58:00', '2025-04-30 22:58:00');
INSERT INTO `user_award_record_0` VALUES ('85', 'luojiakeng', '100301', '100006', '101', '934385440150', '用户随机积分', '2025-04-30 14:58:01', 'create', '2025-04-30 22:58:00', '2025-04-30 22:58:00');
INSERT INTO `user_award_record_0` VALUES ('86', 'luojiakeng', '100301', '100006', '101', '800836177381', '用户随机积分', '2025-04-30 14:58:01', 'create', '2025-04-30 22:58:01', '2025-04-30 22:58:01');
INSERT INTO `user_award_record_0` VALUES ('87', 'luojiakeng', '100301', '100006', '101', '299528812089', '用户随机积分', '2025-04-30 14:58:02', 'create', '2025-04-30 22:58:01', '2025-04-30 22:58:01');
INSERT INTO `user_award_record_0` VALUES ('88', 'luojiakeng', '100301', '100006', '101', '494885897644', '用户随机积分', '2025-04-30 14:58:02', 'create', '2025-04-30 22:58:02', '2025-04-30 22:58:02');
INSERT INTO `user_award_record_0` VALUES ('89', 'luojiakeng', '100301', '100006', '101', '739236080871', '用户随机积分', '2025-04-30 14:58:03', 'create', '2025-04-30 22:58:02', '2025-04-30 22:58:02');
INSERT INTO `user_award_record_0` VALUES ('90', 'luojiakeng', '100301', '100006', '101', '478838398047', '用户随机积分', '2025-04-30 14:58:04', 'create', '2025-04-30 22:58:03', '2025-04-30 22:58:03');
INSERT INTO `user_award_record_0` VALUES ('91', 'luojiakeng', '100301', '100006', '101', '545195014336', '用户随机积分', '2025-04-30 14:58:04', 'create', '2025-04-30 22:58:04', '2025-04-30 22:58:04');
INSERT INTO `user_award_record_0` VALUES ('92', 'luojiakeng', '100301', '100006', '101', '856870277524', '用户随机积分', '2025-04-30 14:58:05', 'create', '2025-04-30 22:58:04', '2025-04-30 22:58:04');
INSERT INTO `user_award_record_0` VALUES ('93', 'luojiakeng', '100301', '100006', '101', '214196643762', '用户随机积分', '2025-04-30 14:58:05', 'create', '2025-04-30 22:58:05', '2025-04-30 22:58:05');
INSERT INTO `user_award_record_0` VALUES ('94', 'luojiakeng', '100301', '100006', '101', '535596355732', '用户随机积分', '2025-04-30 14:58:06', 'create', '2025-04-30 22:58:05', '2025-04-30 22:58:05');
INSERT INTO `user_award_record_0` VALUES ('95', 'luojiakeng', '100301', '100006', '101', '832444148709', '用户随机积分', '2025-04-30 14:58:06', 'create', '2025-04-30 22:58:06', '2025-04-30 22:58:06');
INSERT INTO `user_award_record_0` VALUES ('96', 'luojiakeng', '100301', '100006', '101', '058407964833', '用户随机积分', '2025-04-30 14:58:07', 'create', '2025-04-30 22:58:06', '2025-04-30 22:58:06');
INSERT INTO `user_award_record_0` VALUES ('97', 'luojiakeng', '100301', '100006', '101', '191758264870', '用户随机积分', '2025-04-30 14:58:07', 'create', '2025-04-30 22:58:07', '2025-04-30 22:58:07');
INSERT INTO `user_award_record_0` VALUES ('98', 'luojiakeng', '100301', '100006', '101', '148573884957', '用户随机积分', '2025-04-30 14:58:08', 'create', '2025-04-30 22:58:07', '2025-04-30 22:58:07');
INSERT INTO `user_award_record_0` VALUES ('99', 'luojiakeng', '100301', '100006', '101', '354317734773', '用户随机积分', '2025-04-30 14:58:08', 'create', '2025-04-30 22:58:08', '2025-04-30 22:58:08');
INSERT INTO `user_award_record_0` VALUES ('100', 'luojiakeng', '100301', '100006', '101', '013481308686', '用户随机积分', '2025-04-30 14:58:09', 'create', '2025-04-30 22:58:08', '2025-04-30 22:58:08');
INSERT INTO `user_award_record_0` VALUES ('101', 'luojiakeng', '100301', '100006', '101', '452637087621', '用户随机积分', '2025-04-30 14:58:09', 'create', '2025-04-30 22:58:09', '2025-04-30 22:58:09');
INSERT INTO `user_award_record_0` VALUES ('102', 'luojiakeng', '100301', '100006', '101', '769745675362', '用户随机积分', '2025-04-30 14:59:18', 'create', '2025-04-30 22:59:17', '2025-04-30 22:59:17');
INSERT INTO `user_award_record_0` VALUES ('103', 'luojiakeng', '100301', '100006', '101', '375046027488', '用户随机积分', '2025-04-30 14:59:30', 'create', '2025-04-30 22:59:41', '2025-04-30 22:59:41');
INSERT INTO `user_award_record_0` VALUES ('104', 'luojiakeng', '100301', '100006', '101', '126656641425', '用户随机积分', '2025-04-30 15:02:36', 'create', '2025-04-30 23:02:51', '2025-04-30 23:02:51');
INSERT INTO `user_award_record_0` VALUES ('105', 'luojiakeng', '100301', '100006', '101', '911993620734', '用户随机积分', '2025-04-30 15:09:47', 'create', '2025-04-30 23:09:51', '2025-04-30 23:09:51');
INSERT INTO `user_award_record_0` VALUES ('106', 'luojiakeng', '100301', '100006', '101', '795691561277', '用户随机积分', '2025-04-30 16:24:44', 'create', '2025-05-01 00:24:44', '2025-05-01 00:24:44');
INSERT INTO `user_award_record_0` VALUES ('107', 'luojiakeng', '100301', '100006', '101', '111311908101', '用户随机积分', '2025-04-30 17:15:57', 'create', '2025-05-01 01:17:40', '2025-05-01 01:17:40');
INSERT INTO `user_award_record_0` VALUES ('133', 'luojiakeng', '100301', '100006', '105', '607385694710', '4等奖', '2025-05-03 06:11:03', 'create', '2025-05-03 14:16:32', '2025-05-03 14:16:32');
INSERT INTO `user_award_record_0` VALUES ('138', 'luojiakeng', '100301', '100006', '104', '131845888447', '5等奖', '2025-05-03 12:19:13', 'create', '2025-05-03 20:19:13', '2025-05-03 20:19:13');
INSERT INTO `user_award_record_0` VALUES ('139', 'luojiakeng', '100301', '100006', '101', '526475840561', '随机积分', '2025-05-03 12:19:21', 'create', '2025-05-03 20:19:21', '2025-05-03 20:19:21');
INSERT INTO `user_award_record_0` VALUES ('140', 'luojiakeng', '100301', '100006', '101', '704651394229', '随机积分', '2025-05-03 12:19:22', 'create', '2025-05-03 20:19:22', '2025-05-03 20:19:22');
INSERT INTO `user_award_record_0` VALUES ('141', 'luojiakeng', '100301', '100006', '101', '415592649814', '随机积分', '2025-05-03 12:19:23', 'create', '2025-05-03 20:19:23', '2025-05-03 20:19:23');
INSERT INTO `user_award_record_0` VALUES ('142', 'luojiakeng', '100301', '100006', '101', '943252088863', '随机积分', '2025-05-03 12:19:24', 'create', '2025-05-03 20:19:24', '2025-05-03 20:19:24');
INSERT INTO `user_award_record_0` VALUES ('143', 'luojiakeng', '100301', '100006', '105', '129355683160', '4等奖', '2025-05-03 12:19:25', 'create', '2025-05-03 20:19:24', '2025-05-03 20:19:24');
INSERT INTO `user_award_record_0` VALUES ('144', 'luojiakeng', '100301', '100006', '101', '873751983149', '随机积分', '2025-05-03 16:33:50', 'create', '2025-05-04 00:33:50', '2025-05-04 00:33:50');
INSERT INTO `user_award_record_0` VALUES ('145', 'luojiakeng', '100301', '100006', '105', '130515339742', '4等奖', '2025-05-03 16:33:51', 'create', '2025-05-04 00:33:51', '2025-05-04 00:33:51');
INSERT INTO `user_award_record_0` VALUES ('146', 'luojiakeng', '100301', '100006', '104', '188949393832', '5等奖', '2025-05-10 12:52:08', 'create', '2025-05-10 20:55:54', '2025-05-10 20:55:54');
INSERT INTO `user_award_record_0` VALUES ('147', 'luojiakeng', '100301', '100006', '104', '310217451953', '5等奖', '2025-05-10 12:57:53', 'create', '2025-05-10 20:57:54', '2025-05-10 20:57:54');
INSERT INTO `user_award_record_0` VALUES ('148', 'luojiakeng', '100301', '100006', '105', '318143874278', '4等奖', '2025-05-10 12:58:14', 'create', '2025-05-10 20:58:14', '2025-05-10 20:58:14');
INSERT INTO `user_award_record_0` VALUES ('149', 'luojiakeng', '100301', '100006', '101', '968812175182', '随机积分', '2025-05-10 12:58:27', 'create', '2025-05-10 20:58:27', '2025-05-10 20:58:27');
INSERT INTO `user_award_record_0` VALUES ('150', 'xiaofuge', '100301', '100006', '105', '904045329371', '4等奖', '2025-07-02 15:17:00', 'create', '2025-07-02 23:17:00', '2025-07-02 23:17:00');
INSERT INTO `user_award_record_0` VALUES ('151', 'xiaofuge', '100301', '100006', '101', '612442705006', '随机积分', '2025-07-02 15:45:18', 'create', '2025-07-02 23:45:18', '2025-07-02 23:45:18');
INSERT INTO `user_award_record_0` VALUES ('152', 'xiaofuge', '100301', '100006', '105', '824230637097', '4等奖', '2025-07-02 16:09:21', 'create', '2025-07-03 00:09:21', '2025-07-03 00:09:21');
INSERT INTO `user_award_record_0` VALUES ('153', 'test2', '100301', '100006', '101', '789917401258', '随机积分', '2025-07-02 19:02:29', 'create', '2025-07-03 03:02:28', '2025-07-03 03:02:28');
INSERT INTO `user_award_record_0` VALUES ('154', 'test2', '100301', '100006', '101', '323607752219', '随机积分', '2025-07-02 19:02:39', 'create', '2025-07-03 03:02:38', '2025-07-03 03:02:38');
INSERT INTO `user_award_record_0` VALUES ('155', 'test2', '100301', '100006', '105', '723610711110', '4等奖', '2025-07-03 11:51:31', 'create', '2025-07-03 19:51:31', '2025-07-03 19:51:31');
INSERT INTO `user_award_record_0` VALUES ('156', 'test2', '100301', '100006', '102', '648720812406', '7等奖', '2025-07-03 11:51:50', 'create', '2025-07-03 19:51:50', '2025-07-03 19:51:50');
INSERT INTO `user_award_record_0` VALUES ('157', 'test2', '100301', '100006', '104', '216066000527', '5等奖', '2025-07-03 11:52:06', 'create', '2025-07-03 19:52:06', '2025-07-03 19:52:06');
INSERT INTO `user_award_record_0` VALUES ('158', 'test6', '200402', '100001', '101', '145645944750', '随机积分', '2025-07-03 14:16:14', 'create', '2025-07-03 22:16:14', '2025-07-03 22:16:14');
INSERT INTO `user_award_record_0` VALUES ('159', 'test6', '200402', '100001', '101', '457591120600', '随机积分', '2025-07-03 14:16:23', 'create', '2025-07-03 22:16:22', '2025-07-03 22:16:22');
INSERT INTO `user_award_record_0` VALUES ('160', 'test6', '200402', '100001', '104', '083044263981', '20次使用', '2025-07-03 14:16:29', 'create', '2025-07-03 22:16:28', '2025-07-03 22:16:28');
INSERT INTO `user_award_record_0` VALUES ('161', 'test6', '200402', '100001', '101', '764570583256', '随机积分', '2025-07-03 14:16:35', 'create', '2025-07-03 22:16:35', '2025-07-03 22:16:35');
INSERT INTO `user_award_record_0` VALUES ('162', 'test2', '100301', '100006', '101', '442263423996', '随机积分', '2025-07-03 14:17:03', 'create', '2025-07-03 22:17:02', '2025-07-03 22:17:02');
INSERT INTO `user_award_record_0` VALUES ('163', 'test2', '100301', '100006', '101', '625855291853', '随机积分', '2025-07-03 14:24:19', 'create', '2025-07-03 22:24:18', '2025-07-03 22:24:18');
INSERT INTO `user_award_record_0` VALUES ('164', 'd', '200402', '100001', '104', '674281435552', '20次使用', '2025-07-03 15:54:32', 'create', '2025-07-03 23:54:32', '2025-07-03 23:54:32');
INSERT INTO `user_award_record_0` VALUES ('165', 'd', '200402', '100001', '101', '399265979338', '随机积分', '2025-07-03 15:54:46', 'create', '2025-07-03 23:54:46', '2025-07-03 23:54:46');
INSERT INTO `user_award_record_0` VALUES ('166', 'd', '200402', '100001', '102', '481428846677', '5次使用', '2025-07-03 15:55:56', 'create', '2025-07-03 23:55:55', '2025-07-03 23:55:55');
INSERT INTO `user_award_record_0` VALUES ('167', 'd', '200402', '100001', '102', '377940669931', '5次使用', '2025-07-03 15:56:03', 'create', '2025-07-03 23:56:02', '2025-07-03 23:56:02');
INSERT INTO `user_award_record_0` VALUES ('168', 'xiaofuge', '100301', '100006', '104', '814180025193', '5等奖', '2025-07-03 16:03:33', 'create', '2025-07-04 00:03:33', '2025-07-04 00:03:33');
INSERT INTO `user_award_record_0` VALUES ('169', 'xiaofuge', '100301', '100006', '102', '838348315513', '7等奖', '2025-07-03 16:03:45', 'create', '2025-07-04 00:03:45', '2025-07-04 00:03:45');
INSERT INTO `user_award_record_0` VALUES ('170', '罗家铿', '200402', '100001', '101', '675441849590', '随机积分', '2025-07-03 16:04:18', 'create', '2025-07-04 00:04:17', '2025-07-04 00:04:17');
INSERT INTO `user_award_record_0` VALUES ('171', '罗家铿', '200402', '100001', '101', '349119567939', '随机积分', '2025-07-03 16:04:24', 'create', '2025-07-04 00:04:24', '2025-07-04 00:04:24');
INSERT INTO `user_award_record_0` VALUES ('172', '王勃', '100301', '100006', '101', '599038265288', '随机积分', '2025-07-03 16:07:46', 'create', '2025-07-04 00:07:46', '2025-07-04 00:07:46');
INSERT INTO `user_award_record_0` VALUES ('173', '王勃', '100301', '100006', '101', '611682753998', '随机积分', '2025-07-03 16:08:01', 'create', '2025-07-04 00:08:00', '2025-07-04 00:08:00');
INSERT INTO `user_award_record_0` VALUES ('174', '王勃', '200402', '100001', '105', '317032914859', '增加GPT-01模型', '2025-07-03 16:08:23', 'create', '2025-07-04 00:08:22', '2025-07-04 00:08:22');
INSERT INTO `user_award_record_0` VALUES ('175', '王勃', '200402', '100001', '101', '941640415874', '随机积分', '2025-07-03 16:08:30', 'create', '2025-07-04 00:08:30', '2025-07-04 00:08:30');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_award_record_1
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_award_record_2
-- ----------------------------
INSERT INTO `user_award_record_2` VALUES ('1', 'test4', '200402', '100001', '105', '121672997435', '增加GPT-01模型', '2025-07-03 12:01:59', 'create', '2025-07-03 20:01:59', '2025-07-03 20:01:59');
INSERT INTO `user_award_record_2` VALUES ('2', 'test4', '200402', '100001', '101', '902580177757', '随机积分', '2025-07-03 12:05:00', 'create', '2025-07-03 20:04:59', '2025-07-03 20:04:59');
INSERT INTO `user_award_record_2` VALUES ('3', 'test4', '200402', '100001', '101', '705242778782', '随机积分', '2025-07-03 13:43:08', 'create', '2025-07-03 21:43:07', '2025-07-03 21:43:07');
INSERT INTO `user_award_record_2` VALUES ('4', 'test4', '200402', '100001', '101', '886731934028', '随机积分', '2025-07-03 13:44:12', 'create', '2025-07-03 21:44:11', '2025-07-03 21:44:11');
INSERT INTO `user_award_record_2` VALUES ('5', 'test4', '200402', '100001', '103', '136373799227', '10次使用', '2025-07-03 13:47:06', 'create', '2025-07-03 21:47:06', '2025-07-03 21:47:06');
INSERT INTO `user_award_record_2` VALUES ('6', 'test4', '200402', '100001', '106', '938333997398', '增加GPT-03-mini模型', '2025-07-03 13:47:18', 'create', '2025-07-03 21:47:17', '2025-07-03 21:47:17');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_award_record_3
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_behavior_rebate_order_0
-- ----------------------------
INSERT INTO `user_behavior_rebate_order_0` VALUES ('1', 'xiaofuge', '540164400934', 'sign', '签到返利-sku额度', 'sku', '9011', 'xiaofuge_sku_20243219', '2025-06-29 23:13:33', '2025-06-29 23:13:33');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('2', 'xiaofuge', '166824743313', 'sign', '签到返利-积分', 'integral', '10', 'xiaofuge_integral_20243219', '2025-06-29 23:13:34', '2025-06-29 23:13:34');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('3', 'xiaofuge', '812273288772', 'sign', '签到返利-sku额度', 'sku', '9011', 'xiaofuge_sku_30243219', '2025-06-29 23:15:40', '2025-06-29 23:15:40');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('4', 'xiaofuge', '309982842232', 'sign', '签到返利-积分', 'integral', '10', 'xiaofuge_integral_30243219', '2025-06-29 23:15:40', '2025-06-29 23:15:40');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('5', 'xiaofuge', '424989752724', 'sign', '签到返利-sku额度', 'sku', '9011', 'xiaofuge_sku_20250630', '2025-06-30 01:33:51', '2025-06-30 01:33:51');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('6', 'xiaofuge', '880711934228', 'sign', '签到返利-积分', 'integral', '10', 'xiaofuge_integral_20250630', '2025-06-30 01:33:51', '2025-06-30 01:33:51');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('7', 'xiaofuge', '942806692007', 'sign', '签到返利-sku额度', 'sku', '9011', 'xiaofuge_sku_20250630', '2025-06-30 01:34:00', '2025-06-30 01:34:00');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('8', 'xiaofuge', '696428868091', 'sign', '签到返利-积分', 'integral', '10', 'xiaofuge_integral_20250630', '2025-06-30 01:34:00', '2025-06-30 01:34:00');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('9', 'wangbo', '798871264183', 'sign', '签到返利-sku额度', 'sku', '9011', 'wangbo_sku_20250630', '2025-06-30 01:44:08', '2025-06-30 01:44:08');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('10', 'wangbo', '010750982280', 'sign', '签到返利-积分', 'integral', '10', 'wangbo_integral_20250630', '2025-06-30 01:44:08', '2025-06-30 01:44:08');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('11', 'wangbo', '893467302876', 'sign', '签到返利-sku额度', 'sku', '9011', 'wangbo_sku_20250630', '2025-06-30 01:48:38', '2025-06-30 01:48:38');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('12', 'wangbo', '938700516603', 'sign', '签到返利-积分', 'integral', '10', 'wangbo_integral_20250630', '2025-06-30 01:48:38', '2025-06-30 01:48:38');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('13', 'wangbo', '800299106078', 'sign', '签到返利-sku额度', 'sku', '9011', 'wangbo_sku_20250630', '2025-06-30 01:54:24', '2025-06-30 01:54:24');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('14', 'wangbo', '559689200399', 'sign', '签到返利-积分', 'integral', '10', 'wangbo_integral_20250630', '2025-06-30 01:54:24', '2025-06-30 01:54:24');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('15', 'wangbo', '614310292054', 'sign', '签到返利-sku额度', 'sku', '9011', 'wangbo_sku_20250630', '2025-06-30 02:00:35', '2025-06-30 02:00:35');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('16', 'wangbo', '538420006064', 'sign', '签到返利-积分', 'integral', '10', 'wangbo_integral_20250630', '2025-06-30 02:00:36', '2025-06-30 02:00:36');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('17', '\"test2\"', '055342262175', 'sign', '签到返利-sku额度', 'sku', '9011', '\"test2\"_sku_20250703', '2025-07-03 03:03:33', '2025-07-03 03:03:33');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('18', '\"test2\"', '159133725755', 'sign', '签到返利-积分', 'integral', '10', '\"test2\"_integral_20250703', '2025-07-03 03:03:33', '2025-07-03 03:03:33');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('19', 'test2', '659849404663', 'sign', '签到返利-sku额度', 'sku', '9011', 'test2_sku_20250703', '2025-07-03 03:06:01', '2025-07-03 03:06:01');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('20', 'test2', '689530487424', 'sign', '签到返利-积分', 'integral', '10', 'test2_integral_20250703', '2025-07-03 03:06:01', '2025-07-03 03:06:01');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('21', 'test2', '167648691829', 'sign', '签到返利-sku额度', 'sku', '9011', 'test2_sku_20250703', '2025-07-03 03:06:18', '2025-07-03 03:06:18');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('22', 'test2', '397178006762', 'sign', '签到返利-积分', 'integral', '10', 'test2_integral_20250703', '2025-07-03 03:06:18', '2025-07-03 03:06:18');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('23', 'test2', '649001913878', 'sign', '签到返利-sku额度', 'sku', '9011', 'test2_sku_20250703', '2025-07-03 03:06:38', '2025-07-03 03:06:38');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('24', 'test2', '626426236666', 'sign', '签到返利-积分', 'integral', '10', 'test2_integral_20250703', '2025-07-03 03:06:38', '2025-07-03 03:06:38');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('25', '王勃', '767723098145', 'sign', '签到返利-sku额度', 'sku', '9011', '王勃_sku_20250704', '2025-07-04 00:07:43', '2025-07-04 00:07:43');
INSERT INTO `user_behavior_rebate_order_0` VALUES ('26', '王勃', '344494549595', 'sign', '签到返利-积分', 'integral', '10', '王勃_integral_20250704', '2025-07-04 00:07:43', '2025-07-04 00:07:43');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_behavior_rebate_order_1
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_behavior_rebate_order_2
-- ----------------------------
INSERT INTO `user_behavior_rebate_order_2` VALUES ('1', 'test', '628102705549', 'sign', '签到返利-sku额度', 'sku', '9011', 'test_sku_20250630', '2025-06-30 01:41:03', '2025-06-30 01:41:03');
INSERT INTO `user_behavior_rebate_order_2` VALUES ('2', 'test', '121229918720', 'sign', '签到返利-积分', 'integral', '10', 'test_integral_20250630', '2025-06-30 01:41:04', '2025-06-30 01:41:04');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_behavior_rebate_order_3
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_raffle_order_0
-- ----------------------------
INSERT INTO `user_raffle_order_0` VALUES ('2', 'luojiakeng', '100301', '测试活动', '100006', '607385694710', '2025-05-03 06:11:03', 'used', '2025-05-03 14:12:55', '2025-05-03 14:12:55');
INSERT INTO `user_raffle_order_0` VALUES ('3', 'luojiakeng', '100301', '测试活动', '100006', '131845888447', '2025-05-03 12:19:13', 'used', '2025-05-03 20:19:13', '2025-05-03 20:19:13');
INSERT INTO `user_raffle_order_0` VALUES ('4', 'luojiakeng', '100301', '测试活动', '100006', '526475840561', '2025-05-03 12:19:21', 'used', '2025-05-03 20:19:21', '2025-05-03 20:19:21');
INSERT INTO `user_raffle_order_0` VALUES ('5', 'luojiakeng', '100301', '测试活动', '100006', '704651394229', '2025-05-03 12:19:22', 'used', '2025-05-03 20:19:22', '2025-05-03 20:19:22');
INSERT INTO `user_raffle_order_0` VALUES ('6', 'luojiakeng', '100301', '测试活动', '100006', '415592649814', '2025-05-03 12:19:23', 'used', '2025-05-03 20:19:23', '2025-05-03 20:19:23');
INSERT INTO `user_raffle_order_0` VALUES ('7', 'luojiakeng', '100301', '测试活动', '100006', '943252088863', '2025-05-03 12:19:24', 'used', '2025-05-03 20:19:24', '2025-05-03 20:19:24');
INSERT INTO `user_raffle_order_0` VALUES ('8', 'luojiakeng', '100301', '测试活动', '100006', '129355683160', '2025-05-03 12:19:25', 'used', '2025-05-03 20:19:24', '2025-05-03 20:19:24');
INSERT INTO `user_raffle_order_0` VALUES ('9', 'luojiakeng', '100301', '测试活动', '100006', '873751983149', '2025-05-03 16:33:50', 'used', '2025-05-04 00:33:50', '2025-05-04 00:33:50');
INSERT INTO `user_raffle_order_0` VALUES ('10', 'luojiakeng', '100301', '测试活动', '100006', '130515339742', '2025-05-03 16:33:51', 'used', '2025-05-04 00:33:51', '2025-05-04 00:33:51');
INSERT INTO `user_raffle_order_0` VALUES ('11', 'luojiakeng', '100301', '测试活动', '100006', '188949393832', '2025-05-10 12:52:08', 'used', '2025-05-10 20:52:08', '2025-05-10 20:55:54');
INSERT INTO `user_raffle_order_0` VALUES ('12', 'luojiakeng', '100301', '测试活动', '100006', '310217451953', '2025-05-10 12:57:53', 'used', '2025-05-10 20:57:53', '2025-05-10 20:57:54');
INSERT INTO `user_raffle_order_0` VALUES ('13', 'luojiakeng', '100301', '测试活动', '100006', '318143874278', '2025-05-10 12:58:14', 'used', '2025-05-10 20:58:13', '2025-05-10 20:58:14');
INSERT INTO `user_raffle_order_0` VALUES ('14', 'luojiakeng', '100301', '测试活动', '100006', '968812175182', '2025-05-10 12:58:27', 'used', '2025-05-10 20:58:27', '2025-05-10 20:58:27');
INSERT INTO `user_raffle_order_0` VALUES ('15', 'xiaofuge', '100301', '测试活动', '100006', '904045329371', '2025-07-02 15:17:00', 'used', '2025-07-02 23:17:00', '2025-07-02 23:17:00');
INSERT INTO `user_raffle_order_0` VALUES ('16', 'xiaofuge', '100301', '测试活动', '100006', '612442705006', '2025-07-02 15:45:18', 'used', '2025-07-02 23:45:18', '2025-07-02 23:45:18');
INSERT INTO `user_raffle_order_0` VALUES ('17', 'xiaofuge', '100301', '测试活动', '100006', '824230637097', '2025-07-02 16:09:21', 'used', '2025-07-03 00:09:21', '2025-07-03 00:09:21');
INSERT INTO `user_raffle_order_0` VALUES ('18', 'test2', '100301', '测试活动', '100006', '789917401258', '2025-07-02 19:02:29', 'used', '2025-07-03 03:02:28', '2025-07-03 03:02:28');
INSERT INTO `user_raffle_order_0` VALUES ('19', 'test2', '100301', '测试活动', '100006', '323607752219', '2025-07-02 19:02:39', 'used', '2025-07-03 03:02:38', '2025-07-03 03:02:38');
INSERT INTO `user_raffle_order_0` VALUES ('20', 'test2', '100301', '测试活动', '100006', '723610711110', '2025-07-03 11:49:45', 'used', '2025-07-03 19:49:45', '2025-07-03 19:51:31');
INSERT INTO `user_raffle_order_0` VALUES ('21', 'test2', '100301', '测试活动', '100006', '648720812406', '2025-07-03 11:51:50', 'used', '2025-07-03 19:51:50', '2025-07-03 19:51:50');
INSERT INTO `user_raffle_order_0` VALUES ('22', 'test2', '100301', '测试活动', '100006', '216066000527', '2025-07-03 11:52:06', 'used', '2025-07-03 19:52:06', '2025-07-03 19:52:06');
INSERT INTO `user_raffle_order_0` VALUES ('23', 'test6', '200402', '正式活动', '100001', '145645944750', '2025-07-03 14:16:14', 'used', '2025-07-03 22:16:14', '2025-07-03 22:16:14');
INSERT INTO `user_raffle_order_0` VALUES ('24', 'test6', '200402', '正式活动', '100001', '457591120600', '2025-07-03 14:16:22', 'used', '2025-07-03 22:16:22', '2025-07-03 22:16:22');
INSERT INTO `user_raffle_order_0` VALUES ('25', 'test6', '200402', '正式活动', '100001', '083044263981', '2025-07-03 14:16:29', 'used', '2025-07-03 22:16:28', '2025-07-03 22:16:28');
INSERT INTO `user_raffle_order_0` VALUES ('26', 'test6', '200402', '正式活动', '100001', '764570583256', '2025-07-03 14:16:35', 'used', '2025-07-03 22:16:35', '2025-07-03 22:16:35');
INSERT INTO `user_raffle_order_0` VALUES ('27', 'test2', '100301', '测试活动', '100006', '442263423996', '2025-07-03 14:17:03', 'used', '2025-07-03 22:17:02', '2025-07-03 22:17:02');
INSERT INTO `user_raffle_order_0` VALUES ('28', 'test2', '100301', '测试活动', '100006', '625855291853', '2025-07-03 14:24:19', 'used', '2025-07-03 22:24:18', '2025-07-03 22:24:18');
INSERT INTO `user_raffle_order_0` VALUES ('29', 'd', '200402', '正式活动', '100001', '674281435552', '2025-07-03 15:54:32', 'used', '2025-07-03 23:54:32', '2025-07-03 23:54:32');
INSERT INTO `user_raffle_order_0` VALUES ('30', 'd', '200402', '正式活动', '100001', '399265979338', '2025-07-03 15:54:46', 'used', '2025-07-03 23:54:46', '2025-07-03 23:54:46');
INSERT INTO `user_raffle_order_0` VALUES ('31', 'd', '200402', '正式活动', '100001', '481428846677', '2025-07-03 15:55:56', 'used', '2025-07-03 23:55:55', '2025-07-03 23:55:55');
INSERT INTO `user_raffle_order_0` VALUES ('32', 'd', '200402', '正式活动', '100001', '377940669931', '2025-07-03 15:56:03', 'used', '2025-07-03 23:56:02', '2025-07-03 23:56:02');
INSERT INTO `user_raffle_order_0` VALUES ('33', 'xiaofuge', '100301', '测试活动', '100006', '814180025193', '2025-07-03 16:03:33', 'used', '2025-07-04 00:03:33', '2025-07-04 00:03:33');
INSERT INTO `user_raffle_order_0` VALUES ('34', 'xiaofuge', '100301', '测试活动', '100006', '838348315513', '2025-07-03 16:03:45', 'used', '2025-07-04 00:03:45', '2025-07-04 00:03:45');
INSERT INTO `user_raffle_order_0` VALUES ('35', '罗家铿', '200402', '正式活动', '100001', '675441849590', '2025-07-03 16:04:18', 'used', '2025-07-04 00:04:17', '2025-07-04 00:04:17');
INSERT INTO `user_raffle_order_0` VALUES ('36', '罗家铿', '200402', '正式活动', '100001', '349119567939', '2025-07-03 16:04:24', 'used', '2025-07-04 00:04:23', '2025-07-04 00:04:24');
INSERT INTO `user_raffle_order_0` VALUES ('37', '王勃', '100301', '测试活动', '100006', '599038265288', '2025-07-03 16:07:46', 'used', '2025-07-04 00:07:46', '2025-07-04 00:07:46');
INSERT INTO `user_raffle_order_0` VALUES ('38', '王勃', '100301', '测试活动', '100006', '611682753998', '2025-07-03 16:08:01', 'used', '2025-07-04 00:08:00', '2025-07-04 00:08:01');
INSERT INTO `user_raffle_order_0` VALUES ('39', '王勃', '200402', '正式活动', '100001', '317032914859', '2025-07-03 16:08:23', 'used', '2025-07-04 00:08:22', '2025-07-04 00:08:22');
INSERT INTO `user_raffle_order_0` VALUES ('40', '王勃', '200402', '正式活动', '100001', '941640415874', '2025-07-03 16:08:30', 'used', '2025-07-04 00:08:30', '2025-07-04 00:08:30');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_raffle_order_1
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_raffle_order_2
-- ----------------------------
INSERT INTO `user_raffle_order_2` VALUES ('1', 'test4', '200402', '正式活动', '100001', '121672997435', '2025-07-03 12:01:59', 'used', '2025-07-03 20:01:59', '2025-07-03 20:01:59');
INSERT INTO `user_raffle_order_2` VALUES ('2', 'test4', '200402', '正式活动', '100001', '902580177757', '2025-07-03 12:04:59', 'used', '2025-07-03 20:04:59', '2025-07-03 20:04:59');
INSERT INTO `user_raffle_order_2` VALUES ('3', 'test4', '200402', '正式活动', '100001', '705242778782', '2025-07-03 12:21:14', 'used', '2025-07-03 20:21:13', '2025-07-03 21:43:07');
INSERT INTO `user_raffle_order_2` VALUES ('4', 'test4', '200402', '正式活动', '100001', '886731934028', '2025-07-03 13:44:12', 'used', '2025-07-03 21:44:11', '2025-07-03 21:44:11');
INSERT INTO `user_raffle_order_2` VALUES ('5', 'test4', '200402', '正式活动', '100001', '136373799227', '2025-07-03 13:47:06', 'used', '2025-07-03 21:47:06', '2025-07-03 21:47:06');
INSERT INTO `user_raffle_order_2` VALUES ('6', 'test4', '200402', '正式活动', '100001', '938333997398', '2025-07-03 13:47:18', 'used', '2025-07-03 21:47:17', '2025-07-03 21:47:17');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_raffle_order_3
-- ----------------------------
