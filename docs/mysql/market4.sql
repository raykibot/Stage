/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80041
Source Host           : localhost:3306
Source Database       : market

Target Server Type    : MYSQL
Target Server Version : 80041
File Encoding         : 65001

Date: 2025-04-13 01:05:06
*/

SET NAMES utf8mb4;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for award
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `award_id` int NOT NULL COMMENT '奖品id',
  `award_key` varchar(32) NOT NULL COMMENT '奖品对接标识，每一个对应一个发奖策略',
  `award_config` varchar(256) NOT NULL COMMENT '奖品配置信息',
  `award_desc` varchar(256) NOT NULL COMMENT '奖品内容描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of award
-- ----------------------------
INSERT INTO `award` VALUES ('1', '101', 'user_credit_random', '1,100', '用户积分', '2025-03-13 17:10:56', '2025-03-13 17:10:56');
INSERT INTO `award` VALUES ('2', '102', 'openai_use_count', '5', 'OpenAI增加使用次数', '2025-03-13 17:10:56', '2025-03-13 17:10:56');
INSERT INTO `award` VALUES ('3', '103', 'openai_use_count', '10', 'OpenAI增加使用次数', '2025-03-13 17:10:56', '2025-03-13 17:10:56');
INSERT INTO `award` VALUES ('4', '104', 'openai_use_count', '20', 'OpenAI增加使用次数', '2025-03-13 17:10:56', '2025-03-13 17:10:56');
INSERT INTO `award` VALUES ('5', '105', 'openai_model', 'gpt-o1', 'OpenAI增加模型', '2025-03-13 17:10:56', '2025-03-13 17:10:56');
INSERT INTO `award` VALUES ('6', '106', 'openai_model', 'gpt-o3-mini', 'OpenAI增加模型', '2025-03-13 17:10:56', '2025-03-13 17:10:56');
INSERT INTO `award` VALUES ('7', '107', 'openai_model', 'dall-e-2', 'OpenAI增加模型', '2025-03-13 17:10:56', '2025-03-13 17:10:56');
INSERT INTO `award` VALUES ('8', '108', 'openai_use_count', '100', 'OpenAI增加使用次数', '2025-03-13 17:10:56', '2025-03-13 17:10:56');
INSERT INTO `award` VALUES ('9', '109', 'openai_model', 'gpt-o3,dall-e-3,gpt-pro', 'OpenAI增加模型', '2025-03-13 17:10:56', '2025-03-13 17:10:56');
INSERT INTO `award` VALUES ('10', '100', 'user_credit_blacklist', '1', '黑名单积分', '2025-03-13 17:10:56', '2025-03-13 17:10:56');

-- ----------------------------
-- Table structure for rule_tree
-- ----------------------------
DROP TABLE IF EXISTS `rule_tree`;
CREATE TABLE `rule_tree` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `tree_id` varchar(32) NOT NULL COMMENT '规则树id',
  `tree_name` varchar(32) NOT NULL COMMENT '规则树名称',
  `tree_desc` varchar(256) NOT NULL COMMENT '规则树描述',
  `tree_node_rule_key` varchar(32) NOT NULL COMMENT '规则树根入口规则',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of rule_tree
-- ----------------------------
INSERT INTO `rule_tree` VALUES ('1', 'tree_lock_1', '规则树', '规则树', 'rule_lock', '2025-03-13 17:15:35', '2025-03-13 17:15:35');
INSERT INTO `rule_tree` VALUES ('2', 'tree_luck_award', '规则树-兜底奖励', '规则树-兜底奖励', 'rule_stock', '2025-03-13 17:15:35', '2025-03-13 17:15:35');
INSERT INTO `rule_tree` VALUES ('3', 'tree_lock_2', '规则树', '规则树', 'rule_lock', '2025-03-13 17:15:35', '2025-03-13 17:15:35');

-- ----------------------------
-- Table structure for rule_tree_node
-- ----------------------------
DROP TABLE IF EXISTS `rule_tree_node`;
CREATE TABLE `rule_tree_node` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `tree_id` varchar(32) NOT NULL COMMENT '规则树id',
  `rule_key` varchar(32) NOT NULL COMMENT '规则key',
  `rule_desc` varchar(256) NOT NULL COMMENT '规则描述',
  `rule_value` varchar(256) DEFAULT NULL COMMENT '规则比值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of rule_tree_node
-- ----------------------------
INSERT INTO `rule_tree_node` VALUES ('1', 'tree_lock_1', 'rule_lock', '限定用户已完成N次抽奖后解锁', '1', '2025-03-13 17:28:13', '2025-03-13 17:28:13');
INSERT INTO `rule_tree_node` VALUES ('2', 'tree_lock_1', 'rule_luck_award', '兜底奖品随机积分', '101:1,100', '2025-03-13 17:28:13', '2025-03-13 17:28:13');
INSERT INTO `rule_tree_node` VALUES ('3', 'tree_lock_1', 'rule_stock', '库存扣减规则', null, '2025-03-13 17:28:13', '2025-03-13 17:28:13');
INSERT INTO `rule_tree_node` VALUES ('4', 'tree_luck_award', 'rule_stock', '库存扣减规则', null, '2025-03-13 17:28:13', '2025-03-13 17:28:13');
INSERT INTO `rule_tree_node` VALUES ('5', 'tree_luck_award', 'rule_luck_award', '兜底奖品随机积分', '101:1,100', '2025-03-13 17:28:13', '2025-03-13 17:28:13');
INSERT INTO `rule_tree_node` VALUES ('6', 'tree_lock_2', 'rule_lock', '限定用户已完成N次抽奖后解锁', '6', '2025-03-13 17:28:13', '2025-03-13 17:28:13');
INSERT INTO `rule_tree_node` VALUES ('7', 'tree_lock_2', 'rule_luck_award', '兜底奖品随机积分', '101:1,100', '2025-03-13 17:28:13', '2025-03-13 17:28:13');
INSERT INTO `rule_tree_node` VALUES ('8', 'tree_lock_2', 'rule_stock', '库存扣减规则', null, '2025-03-13 17:28:13', '2025-03-13 17:28:13');

-- ----------------------------
-- Table structure for rule_tree_node_line
-- ----------------------------
DROP TABLE IF EXISTS `rule_tree_node_line`;
CREATE TABLE `rule_tree_node_line` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `tree_id` varchar(32) NOT NULL COMMENT '规则树id',
  `rule_node_from` varchar(128) NOT NULL COMMENT '规则树节点From',
  `rule_node_to` varchar(128) NOT NULL COMMENT '规则树节点To',
  `rule_limit_type` varchar(32) NOT NULL COMMENT '限定类型',
  `rule_limit_value` varchar(32) NOT NULL COMMENT '限定值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of rule_tree_node_line
-- ----------------------------
INSERT INTO `rule_tree_node_line` VALUES ('1', 'tree_lock_1', 'rule_lock', 'rule_stock', 'EQUAL', 'ALLOW', '2025-03-13 17:38:43', '2025-03-13 17:38:43');
INSERT INTO `rule_tree_node_line` VALUES ('2', 'tree_lock_1', 'rule_lock', 'rule_luck_award', 'EQUAL', 'TAKE_OVER', '2025-03-13 17:38:43', '2025-03-13 17:38:43');
INSERT INTO `rule_tree_node_line` VALUES ('3', 'tree_lock_1', 'rule_stock', 'rule_luck_award', 'EQUAL', 'ALLOW', '2025-03-13 17:38:43', '2025-03-13 17:38:43');
INSERT INTO `rule_tree_node_line` VALUES ('4', 'tree_luck_award', 'rule_stock', 'rule_luck_award', 'EQUAL', 'ALLOW', '2025-03-13 17:38:43', '2025-03-13 17:38:43');
INSERT INTO `rule_tree_node_line` VALUES ('5', 'tree_lock_2', 'rule_lock', 'rule_stock', 'EQUAL', 'ALLOW', '2025-03-13 17:38:43', '2025-03-13 17:38:43');
INSERT INTO `rule_tree_node_line` VALUES ('6', 'tree_lock_2', 'rule_lock', 'rule_luck_award', 'EQUAL', 'TAKE_OVER', '2025-03-13 17:38:43', '2025-03-13 17:38:43');
INSERT INTO `rule_tree_node_line` VALUES ('7', 'tree_lock_2', 'rule_stock', 'rule_luck_award', 'EQUAL', 'ALLOW', '2025-03-13 17:38:43', '2025-03-13 17:38:43');

-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `strategy_desc` varchar(256) NOT NULL COMMENT '策略描述',
  `rule_models` varchar(256) DEFAULT NULL COMMENT '规则模型',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of strategy
-- ----------------------------
INSERT INTO `strategy` VALUES ('1', '100001', '抽奖策略', 'rule_blacklist,rule_weight', '2025-03-13 17:44:43', '2025-03-13 17:44:43');
INSERT INTO `strategy` VALUES ('2', '100002', '抽奖策略-验证lock', 'rule_blacklist', '2025-03-13 17:44:43', '2025-03-13 17:44:43');
INSERT INTO `strategy` VALUES ('3', '100003', '非完整1概率', null, '2025-03-13 17:44:43', '2025-03-13 17:44:43');
INSERT INTO `strategy` VALUES ('4', '100004', '随机抽奖', null, '2025-03-13 17:44:43', '2025-03-13 17:44:43');
INSERT INTO `strategy` VALUES ('5', '100006', '抽奖策略-规则树', null, '2025-03-22 22:44:49', '2025-03-22 22:44:51');

-- ----------------------------
-- Table structure for strategy_award
-- ----------------------------
DROP TABLE IF EXISTS `strategy_award`;
CREATE TABLE `strategy_award` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `award_id` int NOT NULL COMMENT '奖品id',
  `award_title` varchar(32) NOT NULL COMMENT '奖品标题',
  `award_subtitle` varchar(32) DEFAULT NULL COMMENT '奖品副标题',
  `award_count` int NOT NULL COMMENT '奖品库存总量',
  `award_count_surplus` int NOT NULL COMMENT '奖品剩余库存量',
  `award_rate` decimal(6,4) NOT NULL COMMENT '奖品中奖概率',
  `rule_models` varchar(256) NOT NULL COMMENT '规则模型',
  `sort` int NOT NULL COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of strategy_award
-- ----------------------------
INSERT INTO `strategy_award` VALUES ('1', '100001', '101', '随机积分', null, '80000', '79980', '0.3000', 'tree_luck_award', '1', '2025-03-13 18:04:22', '2025-03-13 18:04:22');
INSERT INTO `strategy_award` VALUES ('2', '100001', '102', '5次使用', null, '10000', '9981', '0.2000', 'tree_luck_award', '2', '2025-03-13 18:04:22', '2025-03-13 18:04:22');
INSERT INTO `strategy_award` VALUES ('3', '100001', '103', '10次使用', null, '5000', '4988', '0.2000', 'tree_luck_award', '3', '2025-03-13 18:04:22', '2025-03-13 18:04:22');
INSERT INTO `strategy_award` VALUES ('4', '100001', '104', '20次使用', null, '4000', '3993', '0.1000', 'tree_luck_award', '4', '2025-03-13 18:04:22', '2025-03-13 18:04:22');
INSERT INTO `strategy_award` VALUES ('5', '100001', '105', '增加GPT-01模型', null, '2000', '1997', '0.1000', 'tree_luck_award', '5', '2025-03-13 18:04:22', '2025-03-13 18:04:22');
INSERT INTO `strategy_award` VALUES ('6', '100001', '106', '增加GPT-03-mini模型', null, '1000', '995', '0.0500', 'tree_luck_award', '6', '2025-03-13 18:04:22', '2025-03-13 18:04:22');
INSERT INTO `strategy_award` VALUES ('7', '100001', '107', '增加DALL-E-2模型', '抽奖1次后解锁', '1000', '997', '0.0400', 'tree_luck_award', '7', '2025-03-13 18:04:22', '2025-03-13 18:04:22');
INSERT INTO `strategy_award` VALUES ('8', '100001', '108', '增加100次使用次数', '抽奖2次后解锁', '500', '500', '0.0099', 'tree_luck_award', '8', '2025-03-13 18:04:22', '2025-03-13 18:04:22');
INSERT INTO `strategy_award` VALUES ('9', '100001', '109', '获得所有模型', '抽奖5次后解锁', '300', '300', '0.0001', 'tree_luck_award', '9', '2025-03-13 18:04:22', '2025-03-13 18:04:22');
INSERT INTO `strategy_award` VALUES ('10', '100002', '107', '增加DALL-E-2模型', '抽奖1次后解锁', '1000', '1000', '0.9909', 'tree_luck_award', '1', '2025-03-18 21:52:09', '2025-03-18 21:52:11');
INSERT INTO `strategy_award` VALUES ('11', '100002', '108', '增加100次使用次数', '抽奖2次后解锁', '500', '500', '0.0090', 'tree_luck_award', '2', '2025-03-22 02:57:15', '2025-03-22 02:57:18');
INSERT INTO `strategy_award` VALUES ('12', '100002', '109', '获得所有模型', '抽奖6次后解锁', '300', '300', '0.0001', 'tree_luck_award', '3', '2025-03-22 02:59:06', '2025-03-22 02:59:08');
INSERT INTO `strategy_award` VALUES ('13', '100006', '101', '随即积分', null, '100', '92', '0.0200', 'tree_luck_award', '1', '2025-03-23 20:08:22', '2025-03-23 20:08:24');
INSERT INTO `strategy_award` VALUES ('14', '100006', '102', '7等奖', null, '100', '88', '0.0300', 'tree_luck_award', '2', '2025-03-23 20:09:04', '2025-03-23 20:09:07');
INSERT INTO `strategy_award` VALUES ('15', '100006', '103', '6等奖', null, '100', '84', '0.0300', 'tree_luck_award', '3', '2025-03-23 20:10:15', '2025-03-23 20:10:18');
INSERT INTO `strategy_award` VALUES ('16', '100006', '104', '5等奖', null, '100', '85', '0.0300', 'tree_luck_award', '4', '2025-03-23 20:10:52', '2025-03-23 20:10:54');
INSERT INTO `strategy_award` VALUES ('17', '100006', '105', '4等奖', null, '100', '82', '0.0300', 'tree_luck_award', '5', '2025-03-23 20:11:23', '2025-03-23 20:11:26');
INSERT INTO `strategy_award` VALUES ('18', '100006', '106', '3等奖', '抽奖1次后解锁', '100', '87', '0.0300', 'tree_lock_1', '6', '2025-03-23 20:12:01', '2025-03-23 20:12:03');
INSERT INTO `strategy_award` VALUES ('19', '100006', '107', '2等奖', '抽奖2次后解锁', '100', '92', '0.0300', 'tree_lock_1', '7', '2025-03-23 20:12:35', '2025-03-23 20:12:33');
INSERT INTO `strategy_award` VALUES ('20', '100006', '108', '1等奖', '抽奖6次后解锁', '100', '100', '0.0300', 'tree_lock_2', '8', '2025-03-23 20:13:11', '2025-03-23 20:13:13');

-- ----------------------------
-- Table structure for strategy_rule
-- ----------------------------
DROP TABLE IF EXISTS `strategy_rule`;
CREATE TABLE `strategy_rule` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `strategy_id` int NOT NULL COMMENT '策略id',
  `award_id` int DEFAULT NULL COMMENT '奖品id',
  `rule_type` varchar(128) NOT NULL COMMENT '规则类型',
  `rule_model` varchar(256) NOT NULL COMMENT '抽奖规则类型【rule_random - 随机值计算、rule_lock - 抽奖几次后解锁、rule_luck_award - 幸运奖(兜底奖品)】】',
  `rule_value` varchar(256) NOT NULL COMMENT '规则比值',
  `rule_desc` varchar(256) NOT NULL COMMENT '规则描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of strategy_rule
-- ----------------------------
INSERT INTO `strategy_rule` VALUES ('1', '100001', '101', '2', 'rule_random', '1,1000', '随机积分', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('2', '100001', '107', '2', 'rule_lock', '1', '抽奖1次后解锁', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('3', '100001', '108', '2', 'rule_lock', '2', '抽奖2次后解锁', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('4', '100001', '109', '2', 'rule_lock', '5', '抽奖5次后解锁', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('5', '100001', '107', '2', 'rule_luck_award', '1,100', '兜底奖品100以内随机积分', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('6', '100001', '108', '2', 'rule_luck_award', '1,100', '兜底奖品100以内随机积分', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('7', '100001', '101', '2', 'rule_luck_award', '1,10', '兜底奖品10以内随机积分', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('8', '100001', '102', '2', 'rule_luck_award', '1,20', '兜底奖品20以内随机积分', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('9', '100001', '103', '2', 'rule_luck_award', '1,30', '兜底奖品30以内随机积分', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('10', '100001', '104', '2', 'rule_luck_award', '1,40', '兜底奖品40以内随机积分', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('11', '100001', '105', '2', 'rule_luck_award', '1,50', '兜底奖品50以内随机积分', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('12', '100001', '106', '2', 'rule_luck_award', '1,60', '兜底奖品60以内随机积分', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('13', '100001', null, '1', 'rule_weight', '1000:102,103,104,105,106 2000:102,103,104,105,106,107 3000:102,103,104,105,106,107,108,109', '权重抽奖范围', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('14', '100001', null, '1', 'rule_blacklist', '101:user1,user2,user3,user4', '黑名单用户', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('15', '100002', '107', '2', 'rule_lock', '1', '抽奖1次后解锁', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('16', '100002', '108', '2', 'rule_lock', '2', '抽奖2次后解锁', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
INSERT INTO `strategy_rule` VALUES ('17', '100002', '109', '2', 'rule_lock', '5', '抽奖5次后解锁', '2025-03-13 20:38:53', '2025-03-13 20:38:53');
