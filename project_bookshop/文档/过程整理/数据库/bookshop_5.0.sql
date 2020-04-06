/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : bookshop

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 07/04/2020 00:48:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '中国' COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '湖北' COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '武汉' COMMENT '县市',
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '洪山区武汉大学信息学部国际软件学院' COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id，要求：不允许含任何空格',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书籍名称，要求：不允许含任何空格',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者，要求：不允许含任何空格',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址，支持相对/绝对路径，适用的图片格式为：bmp/gif/jpeg/jpg/png/raw/tif',
  `price` double(10, 2) NOT NULL COMMENT '价格，要求：不小于0',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '类型：1：未分类',
  `score` double(4, 2) NULL DEFAULT 10.00 COMMENT '评分：[0, 10]',
  `intro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无' COMMENT '简介，默认\"无\"',
  `nation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未知' COMMENT '国家，默认\"未知\"',
  `year` year NULL DEFAULT NULL COMMENT '年份，默认NULL',
  `hot` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '热门：0：未知 1：不热门 2：热门，默认0',
  `state` tinyint(3) NULL DEFAULT 0 COMMENT '状态：0：在售 1：下架；2：预售',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_book_type`(`type`) USING BTREE,
  CONSTRAINT `fk_book_type` FOREIGN KEY (`type`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书籍',
  `count` int(11) NOT NULL COMMENT '数量',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_cart_book`(`book`) USING BTREE,
  INDEX `fk_cart_user`(`user`) USING BTREE,
  CONSTRAINT `fk_cart_book` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for onebookorderinfo
-- ----------------------------
DROP TABLE IF EXISTS `onebookorderinfo`;
CREATE TABLE `onebookorderinfo`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书籍',
  `count` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_oneorder_book`(`book`) USING BTREE,
  INDEX `fk_oneorder_order`(`order`) USING BTREE,
  CONSTRAINT `fk_oneorder_book` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_oneorder_order` FOREIGN KEY (`order`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NOT NULL COMMENT '订单时间',
  `buyer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下单者',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `price` decimal(10, 2) NOT NULL COMMENT '总价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_orderbuy_user`(`buyer`) USING BTREE,
  INDEX `fk_orderrcv_user`(`receiver`) USING BTREE,
  INDEX `fk_order_address`(`address`) USING BTREE,
  CONSTRAINT `fk_order_address` FOREIGN KEY (`address`) REFERENCES `address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderbuy_user` FOREIGN KEY (`buyer`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderrcv_user` FOREIGN KEY (`receiver`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(11) NOT NULL COMMENT '剩余数量',
  `book` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '书籍',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_stock`(`book`) USING BTREE,
  CONSTRAINT `fk_stock` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'id，非负整数',
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '中文类型名',
  `ename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '英文类型名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '书籍类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id：要求：不允许含任何空格',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名，要求：不允许含任何空格，包括“”，\\t， \\n， \\r等',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码，要求：不允许含任何空格',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话，要求：11位手机号码',
  `authority` tinyint(4) NOT NULL DEFAULT 1 COMMENT '权限，0-管理员；1-顾客，默认1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
