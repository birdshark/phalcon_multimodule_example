/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : forge

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 09/06/2018 00:20:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bd_admins
-- ----------------------------
DROP TABLE IF EXISTS `bd_admins`;
CREATE TABLE `bd_admins`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nick` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admins_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_admins
-- ----------------------------
INSERT INTO `bd_admins` VALUES (1, 'bird shark', 'xiazhichao75@126.com', '$2y$10$zVS2fsLHeZ2/RUxOj0if9.ytxd5/z/hUdI2K4g/t3hJLtka/6sDmq', 'bird', '', 'oOL2Gf0yKoROskGsD3juWf1HvDxCg4u2dVbLNxaX310VwwA7FrfM6achX8so', '2016-05-30 08:55:05', '2016-10-24 08:51:19');
INSERT INTO `bd_admins` VALUES (2, '素还真', 'suhuanzhen@pili.com', '$2y$10$2dXLrLPTKeFSLj3yzuTB2.PTRhme0IQpUWEUXKHXcvAGR2SZ65Dh.', '苏打饼', '', 'mzw9YGocrNsDR3CapNEdGToQA7Q7USy5WIrsujBdLWhmk7DfIclgGVYbxeZu', '2016-05-31 10:02:45', '2016-06-21 02:26:13');

-- ----------------------------
-- Table structure for bd_article_comments
-- ----------------------------
DROP TABLE IF EXISTS `bd_article_comments`;
CREATE TABLE `bd_article_comments`  (
  `ac_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `ac_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `ac_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论人',
  `ac_pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上级评论ID',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `ac_article` int(11) NOT NULL,
  PRIMARY KEY (`ac_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_article_comments
-- ----------------------------
INSERT INTO `bd_article_comments` VALUES (1, '<p>40 <img src=\"https://assets-cdn.github.com/images/icons/emoji/unicode/1f3b4.png?v6\" style=\"width: 20px;\">&nbsp; &nbsp;believe it or not</p>', '', '', '2016-10-21 09:22:25', '2016-10-21 09:22:25', 1);
INSERT INTO `bd_article_comments` VALUES (2, '<p>哈哈哈哈哈哈哈</p>', '', '', '2016-10-21 09:24:54', '2016-10-21 09:24:54', 2);
INSERT INTO `bd_article_comments` VALUES (3, '<p>@jayden &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 你在干什么</p>', '', '', '2016-10-24 02:24:15', '2016-10-24 02:24:15', 1);
INSERT INTO `bd_article_comments` VALUES (4, '<p><img src=\"https://assets-cdn.github.com/images/icons/emoji/unicode/1f46f.png?v6\" style=\"width: 20px;\">&nbsp; 你好</p>', '', '', '2016-10-24 02:24:50', '2016-10-24 02:24:50', 1);

-- ----------------------------
-- Table structure for bd_articles
-- ----------------------------
DROP TABLE IF EXISTS `bd_articles`;
CREATE TABLE `bd_articles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `article_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `article_type` tinyint(4) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `article_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_articles
-- ----------------------------
INSERT INTO `bd_articles` VALUES (1, '春雪', '&lt;font face=&quot;Comic Sans MS&quot;&gt;这是正文，正文哦&lt;/font&gt;', '逗逼,内涵', 4, '很完美的爱情故事', 0, 0, 0);
INSERT INTO `bd_articles` VALUES (2, '第一天我该做些什么', '&lt;p&gt;哈哈哈哈哈哈哈哈你是谁啊啊啊啊啊啊啊&lt;/p&gt;', '二炮,逗逼', 1, '你想要的我都不能给', 0, 0, 0);

-- ----------------------------
-- Table structure for bd_gallery
-- ----------------------------
DROP TABLE IF EXISTS `bd_gallery`;
CREATE TABLE `bd_gallery`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `width` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `height` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `added_on` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_gallery
-- ----------------------------
INSERT INTO `bd_gallery` VALUES (1, '/20161014/img_5800b122a1313.jpg', '961105', '1600', '1066', '2016-10-14 10:19:14');
INSERT INTO `bd_gallery` VALUES (2, '/20161014/img_5800b192bb7fc.jpg', '520643', '1600', '900', '2016-10-14 10:21:06');
INSERT INTO `bd_gallery` VALUES (3, '/20161014/img_5800b1934c141.jpg', '319483', '1600', '998', '2016-10-14 10:21:07');
INSERT INTO `bd_gallery` VALUES (4, '/20161014/img_5800b19417e18.jpg', '1848843', '1600', '1066', '2016-10-14 10:21:08');
INSERT INTO `bd_gallery` VALUES (5, '/20161014/img_5800b194ae123.jpg', '448829', '1600', '1186', '2016-10-14 10:21:08');
INSERT INTO `bd_gallery` VALUES (6, '/20161014/img_5800b195322de.jpg', '349982', '1600', '900', '2016-10-14 10:21:09');
INSERT INTO `bd_gallery` VALUES (7, '/20161014/img_5800b19600112.jpg', '524742', '1600', '1599', '2016-10-14 10:21:10');
INSERT INTO `bd_gallery` VALUES (8, '/20161014/img_5800b1967cc8a.jpg', '619037', '1600', '1057', '2016-10-14 10:21:10');
INSERT INTO `bd_gallery` VALUES (9, '/20161014/img_5800b196d6ae2.jpg', '346769', '1600', '900', '2016-10-14 10:21:10');
INSERT INTO `bd_gallery` VALUES (10, '/20161014/img_5800b197ac192.jpg', '295340', '662', '1000', '2016-10-14 10:21:11');
INSERT INTO `bd_gallery` VALUES (11, '/20161014/img_5800b19d3c84b.jpg', '1287904', '1600', '1067', '2016-10-14 10:21:17');
INSERT INTO `bd_gallery` VALUES (12, '/20161014/img_5800b19d3c83d.jpg', '322440', '1600', '1005', '2016-10-14 10:21:17');
INSERT INTO `bd_gallery` VALUES (13, '/20161014/img_5800b19d3c835.jpg', '153196', '1600', '900', '2016-10-14 10:21:17');
INSERT INTO `bd_gallery` VALUES (14, '/20161017/img_580444b2863c1.jpg', '283401', '1600', '900', '2016-10-17 03:25:38');
INSERT INTO `bd_gallery` VALUES (15, '/20161017/img_580444b335db2.jpg', '587437', '1600', '900', '2016-10-17 03:25:39');
INSERT INTO `bd_gallery` VALUES (16, '/20161017/img_580444b3d026c.jpg', '698583', '1600', '900', '2016-10-17 03:25:39');
INSERT INTO `bd_gallery` VALUES (17, '/20161017/img_580444b458c91.jpg', '400287', '1600', '900', '2016-10-17 03:25:40');
INSERT INTO `bd_gallery` VALUES (18, '/20161017/img_580444b4e4377.jpg', '624470', '1600', '900', '2016-10-17 03:25:40');
INSERT INTO `bd_gallery` VALUES (19, '/20161017/img_580444b59d695.jpg', '921212', '1600', '900', '2016-10-17 03:25:41');
INSERT INTO `bd_gallery` VALUES (20, '/20161017/img_580444b63807b.jpg', '725815', '1600', '900', '2016-10-17 03:25:42');
INSERT INTO `bd_gallery` VALUES (21, '/20161017/img_580444b6ca3bc.jpg', '974843', '1600', '900', '2016-10-17 03:25:42');
INSERT INTO `bd_gallery` VALUES (22, '/20161017/img_580444b72a1ab.jpg', '190142', '1600', '900', '2016-10-17 03:25:43');
INSERT INTO `bd_gallery` VALUES (23, '/20161017/img_580444b81c404.jpg', '439983', '1600', '900', '2016-10-17 03:25:44');
INSERT INTO `bd_gallery` VALUES (24, '/20161017/img_580444b91e64d.jpg', '425039', '1600', '900', '2016-10-17 03:25:45');
INSERT INTO `bd_gallery` VALUES (25, '/20161017/img_580444b9a59bf.jpg', '405204', '1600', '900', '2016-10-17 03:25:45');
INSERT INTO `bd_gallery` VALUES (26, '/20161017/img_580444ba25772.jpg', '575006', '1600', '900', '2016-10-17 03:25:46');
INSERT INTO `bd_gallery` VALUES (27, '/20161017/img_580444ba9f2e5.jpg', '386601', '1600', '900', '2016-10-17 03:25:46');
INSERT INTO `bd_gallery` VALUES (28, '/20161017/img_580444bb305a8.jpg', '589839', '1600', '900', '2016-10-17 03:25:47');
INSERT INTO `bd_gallery` VALUES (29, '/20161017/img_580444bbb7d48.jpg', '746387', '1600', '900', '2016-10-17 03:25:47');
INSERT INTO `bd_gallery` VALUES (30, '/20161017/img_580444bc3c0f1.jpg', '387632', '1600', '900', '2016-10-17 03:25:48');
INSERT INTO `bd_gallery` VALUES (31, '/20161017/img_580444bcc4eeb.jpg', '704536', '1600', '900', '2016-10-17 03:25:48');
INSERT INTO `bd_gallery` VALUES (32, '/20161017/img_580444bd4f5b0.jpg', '389059', '1600', '900', '2016-10-17 03:25:49');
INSERT INTO `bd_gallery` VALUES (33, '/20161017/img_580444be158cd.jpg', '300380', '1600', '900', '2016-10-17 03:25:50');
INSERT INTO `bd_gallery` VALUES (34, '/20161017/img_580444bec6852.jpg', '225197', '1600', '900', '2016-10-17 03:25:50');
INSERT INTO `bd_gallery` VALUES (35, '/20161017/img_580444bf632e9.jpg', '451234', '1600', '900', '2016-10-17 03:25:51');
INSERT INTO `bd_gallery` VALUES (36, '/20161017/img_580444c05051d.jpg', '240116', '1600', '900', '2016-10-17 03:25:52');
INSERT INTO `bd_gallery` VALUES (37, '/20161017/img_580444c0d6353.jpg', '791330', '1600', '900', '2016-10-17 03:25:52');
INSERT INTO `bd_gallery` VALUES (38, '/20161017/img_580444c162569.jpg', '478325', '1600', '900', '2016-10-17 03:25:53');
INSERT INTO `bd_gallery` VALUES (39, '/20161017/img_580444c1d3131.jpg', '340174', '1600', '900', '2016-10-17 03:25:53');
INSERT INTO `bd_gallery` VALUES (40, '/20161017/img_580444c265b28.jpg', '543721', '1600', '900', '2016-10-17 03:25:54');
INSERT INTO `bd_gallery` VALUES (41, '/20161017/img_580444c2f00bf.jpg', '608702', '1600', '900', '2016-10-17 03:25:55');
INSERT INTO `bd_gallery` VALUES (42, '/20161017/img_580444c389a48.jpg', '747631', '1600', '900', '2016-10-17 03:25:55');
INSERT INTO `bd_gallery` VALUES (43, '/20161017/img_580444c40f2b3.jpg', '610378', '1600', '900', '2016-10-17 03:25:56');
INSERT INTO `bd_gallery` VALUES (44, '/20161017/img_580444c526eb4.jpg', '573662', '1600', '900', '2016-10-17 03:25:57');
INSERT INTO `bd_gallery` VALUES (45, '/20161017/img_580444c5996d4.jpg', '406345', '1600', '900', '2016-10-17 03:25:57');
INSERT INTO `bd_gallery` VALUES (46, '/20161017/img_580444c628bbb.jpg', '379392', '1600', '900', '2016-10-17 03:25:58');
INSERT INTO `bd_gallery` VALUES (47, '/20161017/img_580444c6b11a1.jpg', '358587', '1600', '900', '2016-10-17 03:25:58');
INSERT INTO `bd_gallery` VALUES (48, '/20161017/img_580444c79747f.jpg', '447180', '1600', '900', '2016-10-17 03:25:59');
INSERT INTO `bd_gallery` VALUES (49, '/20161017/img_580444c825ea5.jpg', '591788', '1600', '900', '2016-10-17 03:26:00');
INSERT INTO `bd_gallery` VALUES (50, '/20161017/img_580444c8bad4b.jpg', '751213', '1600', '900', '2016-10-17 03:26:00');
INSERT INTO `bd_gallery` VALUES (51, '/20161017/img_580444c946d6b.jpg', '440071', '1600', '900', '2016-10-17 03:26:01');
INSERT INTO `bd_gallery` VALUES (52, '/20161017/img_580444ca36d8e.jpg', '417287', '1600', '900', '2016-10-17 03:26:02');
INSERT INTO `bd_gallery` VALUES (53, '/20161017/img_580444cad40a0.jpg', '245959', '1600', '900', '2016-10-17 03:26:02');
INSERT INTO `bd_gallery` VALUES (54, '/20161017/img_580444cb69c7f.jpg', '728744', '1600', '900', '2016-10-17 03:26:03');
INSERT INTO `bd_gallery` VALUES (55, '/20161017/img_580444cbede7b.jpg', '491998', '1600', '900', '2016-10-17 03:26:03');
INSERT INTO `bd_gallery` VALUES (56, '/20161017/img_580444cc8547e.jpg', '700373', '1600', '900', '2016-10-17 03:26:04');
INSERT INTO `bd_gallery` VALUES (57, '/20161017/img_580444cd06ffb.jpg', '327209', '1600', '900', '2016-10-17 03:26:05');
INSERT INTO `bd_gallery` VALUES (58, '/20161017/img_580444cd8b9c6.jpg', '508570', '1600', '900', '2016-10-17 03:26:05');
INSERT INTO `bd_gallery` VALUES (59, '/20161017/img_580444ce22df5.jpg', '544082', '1600', '900', '2016-10-17 03:26:06');
INSERT INTO `bd_gallery` VALUES (60, '/20161017/img_580444cec8272.jpg', '699157', '1600', '900', '2016-10-17 03:26:06');
INSERT INTO `bd_gallery` VALUES (61, '/20161017/img_580444cf8a6d9.jpg', '644588', '1600', '900', '2016-10-17 03:26:07');
INSERT INTO `bd_gallery` VALUES (62, '/20161017/img_580444d0133b8.jpg', '429311', '1600', '900', '2016-10-17 03:26:08');
INSERT INTO `bd_gallery` VALUES (63, '/20161017/img_580444d096afe.jpg', '317716', '1600', '900', '2016-10-17 03:26:08');
INSERT INTO `bd_gallery` VALUES (64, '/20161017/img_580444d12dfa8.jpg', '760041', '1600', '900', '2016-10-17 03:26:09');
INSERT INTO `bd_gallery` VALUES (65, '/20161017/img_580444d1cde61.jpg', '512576', '1600', '900', '2016-10-17 03:26:09');
INSERT INTO `bd_gallery` VALUES (66, '/20161017/img_580444d27ee22.jpg', '612658', '1600', '900', '2016-10-17 03:26:10');
INSERT INTO `bd_gallery` VALUES (67, '/20161017/img_580444d30a96e.jpg', '620269', '1600', '900', '2016-10-17 03:26:11');
INSERT INTO `bd_gallery` VALUES (68, '/20161017/img_580444d38ab3e.jpg', '593386', '1600', '900', '2016-10-17 03:26:11');
INSERT INTO `bd_gallery` VALUES (69, '/20161017/img_580444d42277e.jpg', '984398', '1600', '900', '2016-10-17 03:26:12');
INSERT INTO `bd_gallery` VALUES (70, '/20161017/img_580444d493ea6.jpg', '379626', '1600', '900', '2016-10-17 03:26:12');
INSERT INTO `bd_gallery` VALUES (71, '/20161017/img_580444d53faba.jpg', '746663', '1600', '900', '2016-10-17 03:26:13');
INSERT INTO `bd_gallery` VALUES (72, '/20161017/img_580444d5c27c2.jpg', '591573', '1600', '900', '2016-10-17 03:26:13');
INSERT INTO `bd_gallery` VALUES (73, '/20161017/img_580444d64bd60.jpg', '448092', '1600', '900', '2016-10-17 03:26:14');
INSERT INTO `bd_gallery` VALUES (74, '/20161017/img_580444d6ce0f0.jpg', '248276', '1600', '900', '2016-10-17 03:26:14');
INSERT INTO `bd_gallery` VALUES (75, '/20161017/img_580444d775038.jpg', '723809', '1600', '900', '2016-10-17 03:26:15');
INSERT INTO `bd_gallery` VALUES (76, '/20161017/img_580444d7efa86.jpg', '433678', '1600', '900', '2016-10-17 03:26:15');
INSERT INTO `bd_gallery` VALUES (77, '/20161017/img_580444d88a69b.jpg', '477556', '1600', '900', '2016-10-17 03:26:16');
INSERT INTO `bd_gallery` VALUES (78, '/20161017/img_580444d92b745.jpg', '1068361', '1600', '900', '2016-10-17 03:26:17');
INSERT INTO `bd_gallery` VALUES (79, '/20161017/img_580444d9a31cc.jpg', '361704', '1600', '900', '2016-10-17 03:26:17');
INSERT INTO `bd_gallery` VALUES (80, '/20161017/img_580444da259a0.jpg', '517348', '1600', '900', '2016-10-17 03:26:18');
INSERT INTO `bd_gallery` VALUES (81, '/20161017/img_580444da986d3.jpg', '384890', '1600', '900', '2016-10-17 03:26:18');
INSERT INTO `bd_gallery` VALUES (82, '/20161017/img_580444db2bc3e.jpg', '680473', '1600', '900', '2016-10-17 03:26:19');
INSERT INTO `bd_gallery` VALUES (83, '/20161017/img_580444dc027c7.jpg', '828849', '1600', '900', '2016-10-17 03:26:20');
INSERT INTO `bd_gallery` VALUES (84, '/20161017/img_580444dc9eba3.jpg', '804977', '1600', '900', '2016-10-17 03:26:20');
INSERT INTO `bd_gallery` VALUES (85, '/20161017/img_580444dd2d8da.jpg', '469246', '1600', '900', '2016-10-17 03:26:21');
INSERT INTO `bd_gallery` VALUES (86, '/20161017/img_580444ddac05e.jpg', '530325', '1600', '900', '2016-10-17 03:26:21');
INSERT INTO `bd_gallery` VALUES (87, '/20161017/img_580444de2eb3b.jpg', '370930', '1600', '900', '2016-10-17 03:26:22');
INSERT INTO `bd_gallery` VALUES (88, '/20161017/img_580444deb70a4.jpg', '482633', '1600', '900', '2016-10-17 03:26:22');
INSERT INTO `bd_gallery` VALUES (89, '/20161017/img_580444df39457.jpg', '522876', '1600', '900', '2016-10-17 03:26:23');
INSERT INTO `bd_gallery` VALUES (90, '/20161017/img_580444dfb177d.jpg', '339461', '1600', '900', '2016-10-17 03:26:23');
INSERT INTO `bd_gallery` VALUES (91, '/20161017/img_580444e03fcd5.jpg', '345408', '1600', '900', '2016-10-17 03:26:24');
INSERT INTO `bd_gallery` VALUES (92, '/20161017/img_580444e0b450b.jpg', '318236', '1600', '900', '2016-10-17 03:26:24');
INSERT INTO `bd_gallery` VALUES (93, '/20161017/img_580444e137e39.jpg', '391492', '1600', '900', '2016-10-17 03:26:25');
INSERT INTO `bd_gallery` VALUES (94, '/20161017/img_580444e1c5862.jpg', '795288', '1600', '900', '2016-10-17 03:26:25');
INSERT INTO `bd_gallery` VALUES (95, '/20161017/img_580444e2493e2.jpg', '440202', '1600', '900', '2016-10-17 03:26:26');
INSERT INTO `bd_gallery` VALUES (96, '/20161017/img_580444e2c83f0.jpg', '455425', '1600', '900', '2016-10-17 03:26:26');
INSERT INTO `bd_gallery` VALUES (97, '/20161017/img_580444e35ae37.jpg', '698409', '1600', '900', '2016-10-17 03:26:27');
INSERT INTO `bd_gallery` VALUES (98, '/20161017/img_580444e3de47c.jpg', '676357', '1600', '900', '2016-10-17 03:26:27');
INSERT INTO `bd_gallery` VALUES (99, '/20161017/img_580444e4607df.jpg', '361329', '1600', '900', '2016-10-17 03:26:28');
INSERT INTO `bd_gallery` VALUES (100, '/20161017/img_580444e4dd7c3.jpg', '498441', '1600', '900', '2016-10-17 03:26:28');
INSERT INTO `bd_gallery` VALUES (101, '/20161017/img_580444e561b0e.jpg', '357227', '1600', '900', '2016-10-17 03:26:29');
INSERT INTO `bd_gallery` VALUES (102, '/20161017/img_580444e5ea7bd.jpg', '564097', '1600', '900', '2016-10-17 03:26:29');
INSERT INTO `bd_gallery` VALUES (103, '/20161017/img_580444e6685ad.jpg', '465307', '1600', '900', '2016-10-17 03:26:30');
INSERT INTO `bd_gallery` VALUES (104, '/20161017/img_580444e707b62.jpg', '605853', '1600', '900', '2016-10-17 03:26:31');
INSERT INTO `bd_gallery` VALUES (105, '/20161017/img_580444f7236b4.jpg', '722938', '1600', '900', '2016-10-17 03:26:47');
INSERT INTO `bd_gallery` VALUES (106, '/20161024/img_580dcceb4994c.jpg', '287840', '1600', '900', '2016-10-24 08:57:15');
INSERT INTO `bd_gallery` VALUES (107, '/20161024/img_580dcceb50d49.jpg', '368267', '1600', '900', '2016-10-24 08:57:15');
INSERT INTO `bd_gallery` VALUES (108, '/20161024/img_580dccec0e2fa.jpg', '407947', '1600', '900', '2016-10-24 08:57:16');
INSERT INTO `bd_gallery` VALUES (109, '/20161024/img_580dcced675a9.jpg', '281153', '1600', '900', '2016-10-24 08:57:17');
INSERT INTO `bd_gallery` VALUES (110, '/20161024/img_580dccedc6504.jpg', '603262', '1600', '900', '2016-10-24 08:57:17');
INSERT INTO `bd_gallery` VALUES (111, '/20161024/img_580dccef0b59a.jpg', '440065', '1600', '900', '2016-10-24 08:57:19');
INSERT INTO `bd_gallery` VALUES (112, '/20161024/img_580dccf081c5a.jpg', '319859', '1600', '900', '2016-10-24 08:57:20');
INSERT INTO `bd_gallery` VALUES (113, '/20161024/img_580dccf10afd8.jpg', '525254', '1600', '900', '2016-10-24 08:57:21');
INSERT INTO `bd_gallery` VALUES (114, '/20161024/img_580dccf2557ed.jpg', '396735', '1600', '900', '2016-10-24 08:57:22');
INSERT INTO `bd_gallery` VALUES (115, '/20161024/img_580dccf3464c1.jpg', '781275', '1600', '900', '2016-10-24 08:57:23');
INSERT INTO `bd_gallery` VALUES (116, '/20161024/img_580dccf3c1e14.jpg', '737357', '1600', '900', '2016-10-24 08:57:23');
INSERT INTO `bd_gallery` VALUES (117, '/20161024/img_580dccf45e20b.jpg', '425569', '1600', '900', '2016-10-24 08:57:24');
INSERT INTO `bd_gallery` VALUES (118, '/20161024/img_580dccf61b33a.jpg', '745251', '1600', '900', '2016-10-24 08:57:26');
INSERT INTO `bd_gallery` VALUES (119, '/20161024/img_580dccf730a56.jpg', '639801', '1600', '900', '2016-10-24 08:57:27');
INSERT INTO `bd_gallery` VALUES (120, '/20161024/img_580dccf793182.jpg', '433509', '1600', '900', '2016-10-24 08:57:27');
INSERT INTO `bd_gallery` VALUES (121, '/20161024/img_580dccf8c3465.jpg', '527446', '1600', '900', '2016-10-24 08:57:28');
INSERT INTO `bd_gallery` VALUES (122, '/20161024/img_580dccf9cf666.jpg', '634216', '1600', '900', '2016-10-24 08:57:29');
INSERT INTO `bd_gallery` VALUES (123, '/20161024/img_580dccfa5ca28.jpg', '581361', '1600', '900', '2016-10-24 08:57:30');
INSERT INTO `bd_gallery` VALUES (124, '/20161024/img_580dccfb4b969.jpg', '229034', '1600', '900', '2016-10-24 08:57:31');
INSERT INTO `bd_gallery` VALUES (125, '/20161024/img_580dccfbaf3d4.jpg', '610952', '1600', '900', '2016-10-24 08:57:31');
INSERT INTO `bd_gallery` VALUES (126, '/20161024/img_580dccfc25a94.jpg', '284310', '1600', '900', '2016-10-24 08:57:32');
INSERT INTO `bd_gallery` VALUES (127, '/20161024/img_580dccfcbb2e2.jpg', '520382', '1600', '900', '2016-10-24 08:57:32');
INSERT INTO `bd_gallery` VALUES (128, '/20161024/img_580dccfd2490e.jpg', '535715', '1600', '900', '2016-10-24 08:57:33');
INSERT INTO `bd_gallery` VALUES (129, '/20161024/img_580dccfd9d310.jpg', '305992', '1600', '900', '2016-10-24 08:57:33');
INSERT INTO `bd_gallery` VALUES (130, '/20161024/img_580dccfe34800.jpg', '531192', '1600', '900', '2016-10-24 08:57:34');
INSERT INTO `bd_gallery` VALUES (131, '/20161024/img_580dccfeac8e7.jpg', '495244', '1600', '900', '2016-10-24 08:57:34');
INSERT INTO `bd_gallery` VALUES (132, '/20161024/img_580dccff392a6.jpg', '818458', '1600', '900', '2016-10-24 08:57:35');
INSERT INTO `bd_gallery` VALUES (133, '/20161024/img_580dccffa65fb.jpg', '482665', '1600', '900', '2016-10-24 08:57:35');
INSERT INTO `bd_gallery` VALUES (134, '/20161024/img_580dcd3c462c1.jpg', '520723', '1600', '900', '2016-10-24 08:58:36');
INSERT INTO `bd_gallery` VALUES (135, '/20161024/img_580dcd3c9ecb5.jpg', '206592', '1600', '900', '2016-10-24 08:58:36');
INSERT INTO `bd_gallery` VALUES (136, '/20161024/img_580dcd3d1b19d.jpg', '457774', '1600', '900', '2016-10-24 08:58:37');
INSERT INTO `bd_gallery` VALUES (137, '/20161024/img_580dcd3da9627.jpg', '524532', '1600', '900', '2016-10-24 08:58:37');
INSERT INTO `bd_gallery` VALUES (138, '/20161024/img_580dcd3e1ec32.jpg', '392880', '1600', '900', '2016-10-24 08:58:38');
INSERT INTO `bd_gallery` VALUES (139, '/20161024/img_580dcd3ea353a.jpg', '610398', '1600', '900', '2016-10-24 08:58:38');
INSERT INTO `bd_gallery` VALUES (140, '/20161024/img_580dcd3f2434f.jpg', '455154', '1600', '900', '2016-10-24 08:58:39');
INSERT INTO `bd_gallery` VALUES (141, '/20161024/img_580dcd3fa7927.jpg', '528070', '1600', '900', '2016-10-24 08:58:39');
INSERT INTO `bd_gallery` VALUES (142, '/20161024/img_580dcd401d123.jpg', '220665', '1600', '900', '2016-10-24 08:58:40');
INSERT INTO `bd_gallery` VALUES (143, '/20161024/img_580dcd409b964.jpg', '527617', '1600', '900', '2016-10-24 08:58:40');
INSERT INTO `bd_gallery` VALUES (144, '/20161024/img_580dcd412ac7a.jpg', '826941', '1600', '900', '2016-10-24 08:58:41');
INSERT INTO `bd_gallery` VALUES (145, '/20161024/img_580dcd41a4eaa.jpg', '274547', '1600', '900', '2016-10-24 08:58:41');
INSERT INTO `bd_gallery` VALUES (146, '/20161024/img_580dcd4239149.jpg', '646790', '1600', '900', '2016-10-24 08:58:42');
INSERT INTO `bd_gallery` VALUES (147, '/20161024/img_580dcd42bef92.jpg', '591164', '1600', '900', '2016-10-24 08:58:42');
INSERT INTO `bd_gallery` VALUES (148, '/20161024/img_580dcd4346cd6.jpg', '717881', '1600', '900', '2016-10-24 08:58:43');
INSERT INTO `bd_gallery` VALUES (149, '/20161024/img_580dcd43abfb5.jpg', '458262', '1600', '900', '2016-10-24 08:58:43');
INSERT INTO `bd_gallery` VALUES (150, '/20161024/img_580dcd442b48e.jpg', '184596', '1600', '900', '2016-10-24 08:58:44');
INSERT INTO `bd_gallery` VALUES (151, '/20161024/img_580dcd448e4ec.jpg', '298340', '1600', '900', '2016-10-24 08:58:44');
INSERT INTO `bd_gallery` VALUES (152, '/20161024/img_580dcd4519ca0.jpg', '410442', '1600', '900', '2016-10-24 08:58:45');
INSERT INTO `bd_gallery` VALUES (153, '/20161024/img_580dcd458f849.jpg', '421950', '1600', '900', '2016-10-24 08:58:45');
INSERT INTO `bd_gallery` VALUES (154, '/20161024/img_580dcd460131e.jpg', '370612', '1600', '900', '2016-10-24 08:58:46');
INSERT INTO `bd_gallery` VALUES (155, '/20161024/img_580dcd4692769.jpg', '657886', '1600', '900', '2016-10-24 08:58:46');
INSERT INTO `bd_gallery` VALUES (156, '/20161024/img_580dcd471dce9.jpg', '929966', '1600', '900', '2016-10-24 08:58:47');
INSERT INTO `bd_gallery` VALUES (157, '/20161024/img_580dcd4799dbf.jpg', '442741', '1600', '900', '2016-10-24 08:58:47');
INSERT INTO `bd_gallery` VALUES (158, '/20161024/img_580dcd480c3c2.jpg', '168093', '1600', '900', '2016-10-24 08:58:48');
INSERT INTO `bd_gallery` VALUES (159, '/20161024/img_580dcd489e361.jpg', '677389', '1600', '900', '2016-10-24 08:58:48');
INSERT INTO `bd_gallery` VALUES (160, '/20161024/img_580dcd49362b2.jpg', '957709', '1600', '900', '2016-10-24 08:58:49');
INSERT INTO `bd_gallery` VALUES (161, '/20161024/img_580dcd49a685e.jpg', '492415', '1600', '900', '2016-10-24 08:58:49');
INSERT INTO `bd_gallery` VALUES (162, '/20161024/img_580dcd4a1f418.jpg', '263995', '1600', '900', '2016-10-24 08:58:50');
INSERT INTO `bd_gallery` VALUES (163, '/20161024/img_580dcd4aa5560.jpg', '556819', '1600', '900', '2016-10-24 08:58:50');
INSERT INTO `bd_gallery` VALUES (164, '/20161024/img_580dcd4b2e30c.jpg', '421192', '1600', '900', '2016-10-24 08:58:51');
INSERT INTO `bd_gallery` VALUES (165, '/20161024/img_580dcd4bac38c.jpg', '554078', '1600', '900', '2016-10-24 08:58:51');
INSERT INTO `bd_gallery` VALUES (166, '/20161024/img_580dcd4c36515.jpg', '728630', '1600', '900', '2016-10-24 08:58:52');
INSERT INTO `bd_gallery` VALUES (167, '/20161024/img_580dcd4caca4c.jpg', '476249', '1600', '900', '2016-10-24 08:58:52');
INSERT INTO `bd_gallery` VALUES (168, '/20161024/img_580dcd4d3fa46.jpg', '703830', '1600', '900', '2016-10-24 08:58:53');
INSERT INTO `bd_gallery` VALUES (169, '/20161024/img_580dcd4daa746.jpg', '256497', '1600', '900', '2016-10-24 08:58:53');
INSERT INTO `bd_gallery` VALUES (170, '/20161024/img_580dcd4e48a35.jpg', '716847', '1600', '900', '2016-10-24 08:58:54');
INSERT INTO `bd_gallery` VALUES (171, '/20161024/img_580dcd4ed24c0.jpg', '766202', '1600', '900', '2016-10-24 08:58:54');
INSERT INTO `bd_gallery` VALUES (172, '/20161024/img_580dcd4f4e9a1.jpg', '500985', '1600', '900', '2016-10-24 08:58:55');
INSERT INTO `bd_gallery` VALUES (173, '/20161024/img_580dcd4fd9745.jpg', '585363', '1600', '900', '2016-10-24 08:58:55');
INSERT INTO `bd_gallery` VALUES (174, '/20161024/img_580dcd504b428.jpg', '243524', '1600', '900', '2016-10-24 08:58:56');
INSERT INTO `bd_gallery` VALUES (175, '/20161024/img_580dcd50c1437.jpg', '195988', '1600', '900', '2016-10-24 08:58:56');
INSERT INTO `bd_gallery` VALUES (176, '/20161024/img_580dcd5140129.jpg', '441128', '1600', '900', '2016-10-24 08:58:57');
INSERT INTO `bd_gallery` VALUES (177, '/20161024/img_580dcd51ac488.jpg', '265325', '1600', '900', '2016-10-24 08:58:57');
INSERT INTO `bd_gallery` VALUES (178, '/20161024/img_580dcd5228e0a.jpg', '174152', '1600', '900', '2016-10-24 08:58:58');
INSERT INTO `bd_gallery` VALUES (179, '/20161024/img_580dcd52ad717.jpg', '656517', '1600', '900', '2016-10-24 08:58:58');
INSERT INTO `bd_gallery` VALUES (180, '/20161024/img_580dcd533616f.jpg', '621275', '1600', '900', '2016-10-24 08:58:59');
INSERT INTO `bd_gallery` VALUES (181, '/20161024/img_580dcd53b87a8.jpg', '570221', '1600', '900', '2016-10-24 08:58:59');
INSERT INTO `bd_gallery` VALUES (182, '/20161024/img_580dcd542cbc2.jpg', '411051', '1600', '900', '2016-10-24 08:59:00');

-- ----------------------------
-- Table structure for bd_labels
-- ----------------------------
DROP TABLE IF EXISTS `bd_labels`;
CREATE TABLE `bd_labels`  (
  `label_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `label_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label_status` tinyint(4) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_labels
-- ----------------------------
INSERT INTO `bd_labels` VALUES (1, '二炮', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (2, '逗逼', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (3, '内涵', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (4, '汪星人', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (5, '小伙伴', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (6, '高大上', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (7, '重口味', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (8, '山寨', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (9, '学姐', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (10, '白富美', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (11, '么么哒', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (12, '业界良心', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (13, '嘻哈说', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_labels` VALUES (14, '高端黑', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');

-- ----------------------------
-- Table structure for bd_migrations
-- ----------------------------
DROP TABLE IF EXISTS `bd_migrations`;
CREATE TABLE `bd_migrations`  (
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_migrations
-- ----------------------------
INSERT INTO `bd_migrations` VALUES ('2014_10_12_000000_create_users_table', 1);
INSERT INTO `bd_migrations` VALUES ('2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `bd_migrations` VALUES ('2016_04_11_032007_add_fields_users_table', 1);
INSERT INTO `bd_migrations` VALUES ('2016_04_11_034005_create_articles_table', 1);
INSERT INTO `bd_migrations` VALUES ('2016_04_11_034226_create_labels_table', 1);
INSERT INTO `bd_migrations` VALUES ('2016_04_11_034243_create_types_table', 1);
INSERT INTO `bd_migrations` VALUES ('2016_04_11_034530_create_gallery_table', 1);
INSERT INTO `bd_migrations` VALUES ('2016_04_11_085042_add_fields_users_tables', 1);
INSERT INTO `bd_migrations` VALUES ('2016_04_12_023451_create_admin_table', 1);
INSERT INTO `bd_migrations` VALUES ('2016_04_12_091237_add_timestmaps_type_table', 1);
INSERT INTO `bd_migrations` VALUES ('2016_04_12_092444_add_timestmaps_label_table', 1);
INSERT INTO `bd_migrations` VALUES ('2016_04_13_132454_entrust_setup_tables', 1);
INSERT INTO `bd_migrations` VALUES ('2016_05_30_084436_addExtField2Permission', 1);
INSERT INTO `bd_migrations` VALUES ('2016_05_31_080211_addExtShowField2Permission', 2);
INSERT INTO `bd_migrations` VALUES ('2016_10_21_024020_create_comments_table', 3);
INSERT INTO `bd_migrations` VALUES ('2016_10_21_083002_add_field_to_comments', 4);
INSERT INTO `bd_migrations` VALUES ('2017_02_09_070154_add_field1_to_article', 5);

-- ----------------------------
-- Table structure for bd_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `bd_password_resets`;
CREATE TABLE `bd_password_resets`  (
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  INDEX `password_resets_email_index`(`email`) USING BTREE,
  INDEX `password_resets_token_index`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bd_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `bd_permission_role`;
CREATE TABLE `bd_permission_role`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `bd_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `bd_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_permission_role
-- ----------------------------
INSERT INTO `bd_permission_role` VALUES (1, 1);
INSERT INTO `bd_permission_role` VALUES (2, 1);
INSERT INTO `bd_permission_role` VALUES (3, 1);
INSERT INTO `bd_permission_role` VALUES (4, 1);
INSERT INTO `bd_permission_role` VALUES (5, 1);
INSERT INTO `bd_permission_role` VALUES (6, 1);
INSERT INTO `bd_permission_role` VALUES (7, 1);
INSERT INTO `bd_permission_role` VALUES (8, 1);
INSERT INTO `bd_permission_role` VALUES (9, 1);
INSERT INTO `bd_permission_role` VALUES (10, 1);
INSERT INTO `bd_permission_role` VALUES (11, 1);
INSERT INTO `bd_permission_role` VALUES (12, 1);
INSERT INTO `bd_permission_role` VALUES (13, 1);
INSERT INTO `bd_permission_role` VALUES (14, 1);
INSERT INTO `bd_permission_role` VALUES (15, 1);
INSERT INTO `bd_permission_role` VALUES (16, 1);
INSERT INTO `bd_permission_role` VALUES (17, 1);
INSERT INTO `bd_permission_role` VALUES (18, 1);
INSERT INTO `bd_permission_role` VALUES (19, 1);
INSERT INTO `bd_permission_role` VALUES (20, 1);
INSERT INTO `bd_permission_role` VALUES (21, 1);
INSERT INTO `bd_permission_role` VALUES (22, 1);
INSERT INTO `bd_permission_role` VALUES (23, 1);
INSERT INTO `bd_permission_role` VALUES (24, 1);
INSERT INTO `bd_permission_role` VALUES (4, 2);
INSERT INTO `bd_permission_role` VALUES (5, 2);
INSERT INTO `bd_permission_role` VALUES (6, 2);
INSERT INTO `bd_permission_role` VALUES (7, 2);
INSERT INTO `bd_permission_role` VALUES (8, 2);
INSERT INTO `bd_permission_role` VALUES (9, 2);
INSERT INTO `bd_permission_role` VALUES (10, 2);
INSERT INTO `bd_permission_role` VALUES (11, 2);
INSERT INTO `bd_permission_role` VALUES (12, 2);
INSERT INTO `bd_permission_role` VALUES (13, 2);
INSERT INTO `bd_permission_role` VALUES (17, 2);
INSERT INTO `bd_permission_role` VALUES (16, 3);
INSERT INTO `bd_permission_role` VALUES (17, 3);
INSERT INTO `bd_permission_role` VALUES (18, 3);

-- ----------------------------
-- Table structure for bd_permissions
-- ----------------------------
DROP TABLE IF EXISTS `bd_permissions`;
CREATE TABLE `bd_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `section` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '章节',
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'fa-desktop' COMMENT '图标',
  `mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'common' COMMENT '模块',
  `show` tinyint(4) NOT NULL DEFAULT 0 COMMENT '模式',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_permissions
-- ----------------------------
INSERT INTO `bd_permissions` VALUES (1, 'user-list', '用户列表', '用户列表', '2016-05-30 09:08:00', '2016-05-31 01:14:21', '用户', 'fa-desktop', 'common', 1);
INSERT INTO `bd_permissions` VALUES (2, 'user-edit', '用户编辑', '用户编辑', '2016-05-30 09:11:24', '2016-05-31 08:47:38', '用户', 'fa-desktop', 'common', 0);
INSERT INTO `bd_permissions` VALUES (3, 'user-add', '用户添加', '用户添加', '2016-05-30 09:12:10', '2016-05-31 01:14:57', '用户', 'fa-desktop', 'common', 1);
INSERT INTO `bd_permissions` VALUES (4, 'admin-list', '管理员列表', '管理员列表', '2016-05-30 09:13:04', '2016-05-30 09:13:04', '管理员', 'fa-desktop', 'system', 1);
INSERT INTO `bd_permissions` VALUES (5, 'admin-edit', '管理员编辑', '管理员编辑', '2016-05-30 09:13:54', '2016-05-31 08:47:46', '管理员', 'fa-desktop', 'system', 0);
INSERT INTO `bd_permissions` VALUES (6, 'role-list', '角色列表', '角色列表', '2016-05-30 09:15:02', '2016-05-30 09:15:02', '角色', 'fa-desktop', 'system', 1);
INSERT INTO `bd_permissions` VALUES (7, 'role-add', '角色添加', '角色添加', '2016-05-30 09:15:59', '2016-05-30 09:15:59', '角色', 'fa-desktop', 'system', 1);
INSERT INTO `bd_permissions` VALUES (8, 'role-edit', '角色编辑', '角色编辑', '2016-05-30 09:16:34', '2016-05-31 08:47:59', '角色', 'fa-desktop', 'system', 0);
INSERT INTO `bd_permissions` VALUES (9, 'role-assignment', '角色分配', '角色分配', '2016-05-30 09:17:11', '2016-05-30 09:17:11', '角色', 'fa-desktop', 'system', 1);
INSERT INTO `bd_permissions` VALUES (10, 'permission-list', '权限列表', '权限列表', '2016-05-30 09:17:49', '2016-05-30 09:17:49', '权限', 'fa-desktop', 'system', 1);
INSERT INTO `bd_permissions` VALUES (11, 'permission-add', '权限添加', '权限添加', '2016-05-30 09:18:21', '2016-05-30 09:18:21', '权限', 'fa-desktop', 'system', 1);
INSERT INTO `bd_permissions` VALUES (12, 'permission-edit', '权限编辑', '权限编辑', '2016-05-30 09:18:49', '2016-05-31 08:48:14', '权限', 'fa-desktop', 'system', 0);
INSERT INTO `bd_permissions` VALUES (13, 'permission-assignment', '权限分配', '权限分配', '2016-05-30 09:19:23', '2016-05-30 09:19:23', '权限', 'fa-desktop', 'system', 1);
INSERT INTO `bd_permissions` VALUES (14, 'gallery-list', '图片墙', '图片墙', '2016-05-30 09:21:30', '2016-05-30 09:21:30', '图片', 'fa-desktop', 'common', 1);
INSERT INTO `bd_permissions` VALUES (15, 'gallery-add', '图片添加', '图片添加', '2016-05-30 09:22:10', '2016-05-30 09:22:10', '图片', 'fa-desktop', 'common', 1);
INSERT INTO `bd_permissions` VALUES (16, 'article-list', '文章列表', '文章列表', '2016-05-30 09:23:51', '2016-05-30 09:23:51', '文章', 'fa-desktop', 'common', 1);
INSERT INTO `bd_permissions` VALUES (17, 'article-add', '文章添加', '文章添加', '2016-05-30 09:25:06', '2016-05-30 09:25:06', '文章', 'fa-desktop', 'common', 1);
INSERT INTO `bd_permissions` VALUES (18, 'article-edit', '文章编辑', '文章编辑', '2016-05-30 09:25:54', '2016-05-31 08:48:27', '文章', 'fa-desktop', 'common', 0);
INSERT INTO `bd_permissions` VALUES (19, 'admin-add', '管理员添加', '管理员添加', '2016-05-31 06:51:17', '2016-05-31 06:51:17', '管理员', 'fa-user', 'common', 1);
INSERT INTO `bd_permissions` VALUES (20, 'role-permission', '权限分配-权限选择', '权限分配-权限选择', '2016-05-31 08:42:11', '2016-05-31 08:45:16', '权限', 'fa-user', 'system', 0);
INSERT INTO `bd_permissions` VALUES (21, 'admin-pick', '管理员选择', '管理员选择', '2016-05-31 10:04:30', '2016-10-19 01:43:57', '管理员', 'fa-user', 'system', 0);
INSERT INTO `bd_permissions` VALUES (22, 'admin-role', '角色分配-角色选择', '角色分配-角色选择', '2016-06-01 02:24:51', '2016-06-01 02:24:51', '角色', 'fa-user', 'system', 0);
INSERT INTO `bd_permissions` VALUES (23, 'upload-article', '文章-内容图片上传', '文章-内容图片上传', '2016-06-01 13:20:37', '2016-06-01 13:20:37', '文章', 'fa-desktop', 'common', 0);
INSERT INTO `bd_permissions` VALUES (24, 'upload-multifile', '多图上传', '多图上传', '2016-10-14 08:50:02', '2016-10-14 08:51:23', '上传', 'fa-desktop', 'common', 0);

-- ----------------------------
-- Table structure for bd_role_admin
-- ----------------------------
DROP TABLE IF EXISTS `bd_role_admin`;
CREATE TABLE `bd_role_admin`  (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`admin_id`, `role_id`) USING BTREE,
  INDEX `role_admin_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_admin_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `bd_admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_admin_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `bd_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_role_admin
-- ----------------------------
INSERT INTO `bd_role_admin` VALUES (1, 1);
INSERT INTO `bd_role_admin` VALUES (1, 2);
INSERT INTO `bd_role_admin` VALUES (2, 3);

-- ----------------------------
-- Table structure for bd_roles
-- ----------------------------
DROP TABLE IF EXISTS `bd_roles`;
CREATE TABLE `bd_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_roles
-- ----------------------------
INSERT INTO `bd_roles` VALUES (1, 'system', '系统管理员', '系统管理员', '2016-05-30 08:57:49', '2016-05-30 08:57:49');
INSERT INTO `bd_roles` VALUES (2, 'admin', '管理员', '编辑', '2016-05-30 09:01:03', '2016-05-30 09:01:03');
INSERT INTO `bd_roles` VALUES (3, 'editor', '编辑', '编辑', '2016-05-30 09:01:26', '2016-05-30 09:01:26');

-- ----------------------------
-- Table structure for bd_types
-- ----------------------------
DROP TABLE IF EXISTS `bd_types`;
CREATE TABLE `bd_types`  (
  `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_status` tinyint(4) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bd_types
-- ----------------------------
INSERT INTO `bd_types` VALUES (1, '热门', 1, '2016-05-30 08:55:05', '2016-05-30 08:55:05');
INSERT INTO `bd_types` VALUES (2, '互动', 1, '2016-05-30 08:55:05', '2016-05-30 08:55:05');
INSERT INTO `bd_types` VALUES (3, '视频', 1, '2016-05-30 08:55:05', '2016-05-30 08:55:05');
INSERT INTO `bd_types` VALUES (4, '奇趣', 1, '2016-05-30 08:55:05', '2016-05-30 08:55:05');
INSERT INTO `bd_types` VALUES (5, '爆笑', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_types` VALUES (6, '萌宠', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_types` VALUES (7, '生活', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_types` VALUES (8, '娱乐', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_types` VALUES (9, '资讯', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_types` VALUES (10, '美食', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_types` VALUES (11, '创意', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_types` VALUES (12, '情感', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_types` VALUES (13, '美女', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_types` VALUES (14, '体育', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');
INSERT INTO `bd_types` VALUES (15, '健康', 1, '2016-05-30 08:55:06', '2016-05-30 08:55:06');

-- ----------------------------
-- Table structure for bd_users
-- ----------------------------
DROP TABLE IF EXISTS `bd_users`;
CREATE TABLE `bd_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nick` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
