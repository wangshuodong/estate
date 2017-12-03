/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : estate

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-12-03 23:19:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for billaccount
-- ----------------------------
DROP TABLE IF EXISTS `billaccount`;
CREATE TABLE `billaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `housing_id` int(11) DEFAULT NULL COMMENT '对应小区id',
  `roominfo_id` int(11) DEFAULT NULL COMMENT '对应房间id',
  `cost_type` int(11) DEFAULT NULL COMMENT '费用类型名称',
  `bill_entry_amount` double(11,2) DEFAULT NULL COMMENT '应收金额',
  `acct_period` varchar(255) DEFAULT NULL COMMENT '账期，用于归类和向用户展示',
  `release_day` varchar(255) DEFAULT NULL COMMENT '出账日期20160831',
  `deadline` varchar(255) DEFAULT NULL COMMENT '缴费截止日期20160831',
  `relate_id` varchar(255) DEFAULT NULL COMMENT '缴费明细条目关联ID。若物业系统业务约束上传的多条明细条目必须被一次同时支付，则对应的明细条目需传入同样的relate_id。',
  `status` tinyint(1) DEFAULT '0' COMMENT '0:未同步 1：已同步',
  `payDate` datetime DEFAULT NULL COMMENT '付款时间',
  `payType` int(11) DEFAULT NULL COMMENT '微信 支付宝 现金 刷卡 银行转账',
  `payStatus` tinyint(1) DEFAULT '0' COMMENT '付款状态 0：未付款  1：已付款',
  `deleteStatus` tinyint(1) DEFAULT '0',
  `alipay_trade_no` varchar(255) DEFAULT NULL COMMENT '支付宝付款成功回传编号',
  `weixin_trade_no` varchar(255) DEFAULT NULL COMMENT '微信付款成功回传编号',
  `printStatus` tinyint(1) DEFAULT '0' COMMENT '打印状态',
  `ticketStatus` int(11) DEFAULT '0' COMMENT '开票状态0未开票，1审核中，2同意，3，拒绝，4开票成功，5开票失败',
  `buyer_user_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2611 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of billaccount
-- ----------------------------
INSERT INTO `billaccount` VALUES ('1011', '10003', '1020', '1', '100.00', '2017年11', '20171124', '20171130', null, '1', '2017-11-27 22:27:18', '1', '1', '0', null, null, '1', '0', null, null, '2017-11-25 21:50:33');
INSERT INTO `billaccount` VALUES ('1012', '10003', '1022', '1', '138.00', '2017年07', '20171123', '20171212', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-11-25 21:55:56');
INSERT INTO `billaccount` VALUES ('1013', '10003', '1023', '1', '138.00', '2017年07', '20171123', '20171212', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-11-25 21:55:56');
INSERT INTO `billaccount` VALUES ('1014', '10003', '1024', '1', '138.00', '2017年07', '20171123', '20171212', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-11-25 21:55:56');
INSERT INTO `billaccount` VALUES ('1015', '10003', '1020', '2', '10.00', '2017年11', '20171120', '20171130', null, '1', '2017-11-27 22:27:18', '1', '1', '0', null, null, '0', '0', null, null, '2017-11-27 14:16:55');
INSERT INTO `billaccount` VALUES ('1151', '10009', '1026', '1', '1811.00', '20180101-20181231', '20171130', '20191231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:16');
INSERT INTO `billaccount` VALUES ('1152', '10009', '1027', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:16');
INSERT INTO `billaccount` VALUES ('1153', '10009', '1028', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:16');
INSERT INTO `billaccount` VALUES ('1154', '10009', '1029', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:16');
INSERT INTO `billaccount` VALUES ('1155', '10009', '1030', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:16');
INSERT INTO `billaccount` VALUES ('1156', '10009', '1031', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:16');
INSERT INTO `billaccount` VALUES ('1157', '10009', '1032', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:16');
INSERT INTO `billaccount` VALUES ('1158', '10009', '1033', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:16');
INSERT INTO `billaccount` VALUES ('1159', '10009', '1034', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:16');
INSERT INTO `billaccount` VALUES ('1160', '10009', '1035', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1161', '10009', '1036', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1162', '10009', '1037', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1163', '10009', '1038', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1164', '10009', '1039', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1165', '10009', '1040', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1166', '10009', '1041', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1167', '10009', '1042', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1168', '10009', '1043', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1169', '10009', '1044', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1170', '10009', '1045', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1171', '10009', '1046', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1172', '10009', '1047', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1173', '10009', '1048', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1174', '10009', '1049', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1175', '10009', '1050', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1176', '10009', '1051', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1177', '10009', '1052', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1178', '10009', '1053', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1179', '10009', '1054', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1180', '10009', '1055', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1181', '10009', '1056', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:17');
INSERT INTO `billaccount` VALUES ('1182', '10009', '1057', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1183', '10009', '1058', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1184', '10009', '1059', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1185', '10009', '1060', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1186', '10009', '1061', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1187', '10009', '1062', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1188', '10009', '1063', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1189', '10009', '1064', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1190', '10009', '1065', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1191', '10009', '1066', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1192', '10009', '1067', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1193', '10009', '1068', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1194', '10009', '1069', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1195', '10009', '1070', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:18');
INSERT INTO `billaccount` VALUES ('1196', '10009', '1071', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1197', '10009', '1072', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1198', '10009', '1073', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1199', '10009', '1074', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1200', '10009', '1075', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1201', '10009', '1076', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1202', '10009', '1077', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1203', '10009', '1078', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1204', '10009', '1079', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1205', '10009', '1080', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1206', '10009', '1081', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1207', '10009', '1082', '1', '0.00', '', '20171130', '', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1208', '10009', '1083', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1209', '10009', '1084', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1210', '10009', '1085', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1211', '10009', '1086', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1212', '10009', '1087', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1213', '10009', '1088', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1214', '10009', '1089', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1215', '10009', '1090', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:19');
INSERT INTO `billaccount` VALUES ('1216', '10009', '1091', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1217', '10009', '1092', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1218', '10009', '1093', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1219', '10009', '1094', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1220', '10009', '1095', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1221', '10009', '1096', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1222', '10009', '1097', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1223', '10009', '1098', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1224', '10009', '1099', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1225', '10009', '1100', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1226', '10009', '1101', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1227', '10009', '1102', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1228', '10009', '1103', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1229', '10009', '1104', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1230', '10009', '1105', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1231', '10009', '1106', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1232', '10009', '1107', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1233', '10009', '1108', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1234', '10009', '1109', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1235', '10009', '1110', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1236', '10009', '1111', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1237', '10009', '1112', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1238', '10009', '1113', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1239', '10009', '1114', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:20');
INSERT INTO `billaccount` VALUES ('1240', '10009', '1115', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1241', '10009', '1116', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1242', '10009', '1117', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1243', '10009', '1118', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1244', '10009', '1119', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1245', '10009', '1120', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1246', '10009', '1121', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1247', '10009', '1122', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1248', '10009', '1123', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1249', '10009', '1124', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1250', '10009', '1125', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1251', '10009', '1126', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1252', '10009', '1127', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1253', '10009', '1128', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1254', '10009', '1129', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:21');
INSERT INTO `billaccount` VALUES ('1255', '10009', '1130', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:22');
INSERT INTO `billaccount` VALUES ('1256', '10009', '1131', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:22');
INSERT INTO `billaccount` VALUES ('1257', '10009', '1132', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:23');
INSERT INTO `billaccount` VALUES ('1258', '10009', '1133', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:23');
INSERT INTO `billaccount` VALUES ('1259', '10009', '1134', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:24');
INSERT INTO `billaccount` VALUES ('1260', '10009', '1135', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:24');
INSERT INTO `billaccount` VALUES ('1261', '10009', '1136', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:25');
INSERT INTO `billaccount` VALUES ('1262', '10009', '1137', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:25');
INSERT INTO `billaccount` VALUES ('1263', '10009', '1138', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:26');
INSERT INTO `billaccount` VALUES ('1264', '10009', '1139', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:26');
INSERT INTO `billaccount` VALUES ('1265', '10009', '1140', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:27');
INSERT INTO `billaccount` VALUES ('1266', '10009', '1141', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:27');
INSERT INTO `billaccount` VALUES ('1267', '10009', '1142', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:28');
INSERT INTO `billaccount` VALUES ('1268', '10009', '1143', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:28');
INSERT INTO `billaccount` VALUES ('1269', '10009', '1144', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:29');
INSERT INTO `billaccount` VALUES ('1270', '10009', '1145', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:29');
INSERT INTO `billaccount` VALUES ('1271', '10009', '1146', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:30');
INSERT INTO `billaccount` VALUES ('1272', '10009', '1147', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:30');
INSERT INTO `billaccount` VALUES ('1273', '10009', '1148', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:31');
INSERT INTO `billaccount` VALUES ('1274', '10009', '1149', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:31');
INSERT INTO `billaccount` VALUES ('1275', '10009', '1150', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:32');
INSERT INTO `billaccount` VALUES ('1276', '10009', '1151', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:32');
INSERT INTO `billaccount` VALUES ('1277', '10009', '1152', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:33');
INSERT INTO `billaccount` VALUES ('1278', '10009', '1153', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:33');
INSERT INTO `billaccount` VALUES ('1279', '10009', '1154', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:34');
INSERT INTO `billaccount` VALUES ('1280', '10009', '1155', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:34');
INSERT INTO `billaccount` VALUES ('1281', '10009', '1156', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:35');
INSERT INTO `billaccount` VALUES ('1282', '10009', '1157', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:36');
INSERT INTO `billaccount` VALUES ('1283', '10009', '1158', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:36');
INSERT INTO `billaccount` VALUES ('1284', '10009', '1159', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:37');
INSERT INTO `billaccount` VALUES ('1285', '10009', '1160', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 17:32:37');
INSERT INTO `billaccount` VALUES ('1286', '10009', '1026', '1', '1811.00', '20180101-20181231', '20171130', '20191231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:20');
INSERT INTO `billaccount` VALUES ('1287', '10009', '1082', '1', '0.00', '', '20171130', '', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:20');
INSERT INTO `billaccount` VALUES ('1288', '10009', '1161', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1289', '10009', '1162', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1290', '10009', '1163', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1291', '10009', '1164', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1292', '10009', '1165', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1293', '10009', '1166', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1294', '10009', '1167', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1295', '10009', '1168', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1296', '10009', '1169', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1297', '10009', '1170', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1298', '10009', '1171', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1299', '10009', '1172', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1300', '10009', '1173', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1301', '10009', '1174', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1302', '10009', '1175', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1303', '10009', '1176', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1304', '10009', '1177', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1305', '10009', '1178', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1306', '10009', '1179', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1307', '10009', '1180', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1308', '10009', '1181', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1309', '10009', '1182', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1310', '10009', '1183', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1311', '10009', '1184', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1312', '10009', '1185', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1313', '10009', '1186', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1314', '10009', '1187', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1315', '10009', '1188', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1316', '10009', '1189', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1317', '10009', '1190', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1318', '10009', '1191', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1319', '10009', '1192', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1320', '10009', '1193', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1321', '10009', '1194', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1322', '10009', '1195', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1323', '10009', '1196', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1324', '10009', '1197', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1325', '10009', '1198', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1326', '10009', '1199', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1327', '10009', '1200', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1328', '10009', '1201', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1329', '10009', '1202', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1330', '10009', '1203', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1331', '10009', '1204', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1332', '10009', '1205', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1333', '10009', '1206', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1334', '10009', '1207', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1335', '10009', '1208', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1336', '10009', '1209', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1337', '10009', '1210', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1338', '10009', '1211', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1339', '10009', '1212', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1340', '10009', '1213', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1341', '10009', '1214', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1342', '10009', '1215', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1343', '10009', '1216', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:21');
INSERT INTO `billaccount` VALUES ('1344', '10009', '1217', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1345', '10009', '1218', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1346', '10009', '1219', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1347', '10009', '1220', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1348', '10009', '1221', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1349', '10009', '1222', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1350', '10009', '1223', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1351', '10009', '1224', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1352', '10009', '1225', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1353', '10009', '1226', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1354', '10009', '1227', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1355', '10009', '1228', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1356', '10009', '1229', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1357', '10009', '1230', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1358', '10009', '1231', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1359', '10009', '1232', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1360', '10009', '1233', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1361', '10009', '1234', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1362', '10009', '1235', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1363', '10009', '1236', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1364', '10009', '1237', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1365', '10009', '1238', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1366', '10009', '1239', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1367', '10009', '1240', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1368', '10009', '1241', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1369', '10009', '1242', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1370', '10009', '1243', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1371', '10009', '1244', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1372', '10009', '1245', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1373', '10009', '1246', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1374', '10009', '1247', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1375', '10009', '1248', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1376', '10009', '1249', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1377', '10009', '1250', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1378', '10009', '1251', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1379', '10009', '1252', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1380', '10009', '1253', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1381', '10009', '1254', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1382', '10009', '1255', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1383', '10009', '1256', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1384', '10009', '1257', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1385', '10009', '1258', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1386', '10009', '1259', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1387', '10009', '1260', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1388', '10009', '1261', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1389', '10009', '1262', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1390', '10009', '1263', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1391', '10009', '1264', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1392', '10009', '1265', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1393', '10009', '1266', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1394', '10009', '1267', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1395', '10009', '1268', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1396', '10009', '1269', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1397', '10009', '1270', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1398', '10009', '1271', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1399', '10009', '1272', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1400', '10009', '1273', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1401', '10009', '1274', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1402', '10009', '1275', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1403', '10009', '1276', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1404', '10009', '1277', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1405', '10009', '1278', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1406', '10009', '1279', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1407', '10009', '1280', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1408', '10009', '1281', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1409', '10009', '1282', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1410', '10009', '1283', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1411', '10009', '1284', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1412', '10009', '1285', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1413', '10009', '1286', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1414', '10009', '1287', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1415', '10009', '1288', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1416', '10009', '1289', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1417', '10009', '1290', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1418', '10009', '1291', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1419', '10009', '1292', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1420', '10009', '1293', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1421', '10009', '1294', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1422', '10009', '1295', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1423', '10009', '1296', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1424', '10009', '1297', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1425', '10009', '1298', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1426', '10009', '1299', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1427', '10009', '1300', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1428', '10009', '1301', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1429', '10009', '1302', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1430', '10009', '1303', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:22');
INSERT INTO `billaccount` VALUES ('1431', '10009', '1304', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1432', '10009', '1305', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1433', '10009', '1306', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1434', '10009', '1307', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1435', '10009', '1308', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1436', '10009', '1309', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1437', '10009', '1310', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1438', '10009', '1311', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1439', '10009', '1312', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1440', '10009', '1313', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1441', '10009', '1314', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1442', '10009', '1315', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1443', '10009', '1316', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1444', '10009', '1317', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1445', '10009', '1318', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1446', '10009', '1319', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1447', '10009', '1320', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1448', '10009', '1321', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1449', '10009', '1322', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1450', '10009', '1323', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1451', '10009', '1324', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1452', '10009', '1325', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1453', '10009', '1326', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1454', '10009', '1327', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1455', '10009', '1328', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1456', '10009', '1329', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1457', '10009', '1330', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1458', '10009', '1331', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1459', '10009', '1332', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1460', '10009', '1333', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1461', '10009', '1334', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1462', '10009', '1335', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1463', '10009', '1336', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1464', '10009', '1337', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1465', '10009', '1338', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1466', '10009', '1339', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1467', '10009', '1340', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1468', '10009', '1341', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1469', '10009', '1342', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1470', '10009', '1343', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1471', '10009', '1344', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1472', '10009', '1345', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1473', '10009', '1346', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1474', '10009', '1347', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1475', '10009', '1348', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1476', '10009', '1349', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1477', '10009', '1350', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1478', '10009', '1351', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1479', '10009', '1352', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1480', '10009', '1353', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1481', '10009', '1354', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1482', '10009', '1355', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1483', '10009', '1356', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1484', '10009', '1357', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1485', '10009', '1358', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1486', '10009', '1359', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1487', '10009', '1360', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1488', '10009', '1361', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1489', '10009', '1362', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1490', '10009', '1363', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1491', '10009', '1364', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1492', '10009', '1365', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1493', '10009', '1366', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1494', '10009', '1367', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1495', '10009', '1368', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1496', '10009', '1369', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1497', '10009', '1370', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1498', '10009', '1371', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1499', '10009', '1372', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1500', '10009', '1373', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1501', '10009', '1374', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1502', '10009', '1375', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1503', '10009', '1376', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1504', '10009', '1377', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1505', '10009', '1378', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1506', '10009', '1379', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1507', '10009', '1380', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1508', '10009', '1381', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1509', '10009', '1382', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1510', '10009', '1383', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1511', '10009', '1384', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1512', '10009', '1385', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1513', '10009', '1386', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1514', '10009', '1387', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1515', '10009', '1388', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1516', '10009', '1389', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1517', '10009', '1390', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1518', '10009', '1391', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1519', '10009', '1392', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1520', '10009', '1393', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1521', '10009', '1394', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1522', '10009', '1395', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1523', '10009', '1396', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1524', '10009', '1397', '1', '0.00', '20180101-20181231', '20171130', '20181231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-01 23:19:23');
INSERT INTO `billaccount` VALUES ('1525', '10009', '1199', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1526', '10009', '1200', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1527', '10009', '1203', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1528', '10009', '1204', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1529', '10009', '1208', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1530', '10009', '1211', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1531', '10009', '1212', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1532', '10009', '1216', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1533', '10009', '1219', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1534', '10009', '1220', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1535', '10009', '1223', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1536', '10009', '1227', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1537', '10009', '1228', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1538', '10009', '1231', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1539', '10009', '1232', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1540', '10009', '1235', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1541', '10009', '1236', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1542', '10009', '1239', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1543', '10009', '1240', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1544', '10009', '1243', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1545', '10009', '1244', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:27');
INSERT INTO `billaccount` VALUES ('1546', '10009', '1247', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1547', '10009', '1248', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1548', '10009', '1251', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1549', '10009', '1252', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1550', '10009', '1255', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1551', '10009', '1256', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1552', '10009', '1259', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1553', '10009', '1260', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1554', '10009', '1263', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1555', '10009', '1264', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1556', '10009', '1267', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1557', '10009', '1268', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1558', '10009', '1271', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1559', '10009', '1272', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1560', '10009', '1275', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1561', '10009', '1276', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1562', '10009', '1279', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1563', '10009', '1280', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1564', '10009', '1283', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1565', '10009', '1284', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1566', '10009', '1287', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1567', '10009', '1288', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1568', '10009', '1291', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1569', '10009', '1292', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1570', '10009', '1299', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1571', '10009', '1300', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1572', '10009', '1304', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1573', '10009', '1308', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1574', '10009', '1311', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1575', '10009', '1312', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1576', '10009', '1316', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1577', '10009', '1319', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1578', '10009', '1320', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1579', '10009', '1323', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1580', '10009', '1324', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1581', '10009', '1327', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1582', '10009', '1328', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1583', '10009', '1331', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1584', '10009', '1332', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1585', '10009', '1335', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1586', '10009', '1336', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1587', '10009', '1339', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1588', '10009', '1340', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1589', '10009', '1343', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1590', '10009', '1344', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1591', '10009', '1347', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1592', '10009', '1348', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1593', '10009', '1351', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1594', '10009', '1355', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1595', '10009', '1356', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1596', '10009', '1359', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1597', '10009', '1360', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1598', '10009', '1363', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1599', '10009', '1364', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1600', '10009', '1367', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1601', '10009', '1368', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1602', '10009', '1371', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1603', '10009', '1375', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1604', '10009', '1376', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1605', '10009', '1379', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1606', '10009', '1380', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1607', '10009', '1383', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1608', '10009', '1387', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1609', '10009', '1388', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1610', '10009', '1391', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1611', '10009', '1392', '1', '1793.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1612', '10009', '1301', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1613', '10009', '1305', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1614', '10009', '1309', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1615', '10009', '1313', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1616', '10009', '1317', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1617', '10009', '1321', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1618', '10009', '1325', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1619', '10009', '1329', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1620', '10009', '1333', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1621', '10009', '1337', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1622', '10009', '1341', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1623', '10009', '1345', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1624', '10009', '1349', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1625', '10009', '1353', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1626', '10009', '1357', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1627', '10009', '1361', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1628', '10009', '1365', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1629', '10009', '1369', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1630', '10009', '1373', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1631', '10009', '1377', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1632', '10009', '1381', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1633', '10009', '1385', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1634', '10009', '1389', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1635', '10009', '1393', '1', '1795.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1636', '10009', '1201', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1637', '10009', '1205', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1638', '10009', '1213', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1639', '10009', '1217', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1640', '10009', '1221', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1641', '10009', '1225', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1642', '10009', '1229', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1643', '10009', '1233', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1644', '10009', '1237', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1645', '10009', '1241', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1646', '10009', '1245', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1647', '10009', '1249', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1648', '10009', '1253', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1649', '10009', '1257', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1650', '10009', '1261', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1651', '10009', '1265', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1652', '10009', '1269', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1653', '10009', '1273', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1654', '10009', '1277', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1655', '10009', '1281', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1656', '10009', '1285', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1657', '10009', '1289', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1658', '10009', '1293', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1659', '10009', '1298', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1660', '10009', '1302', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1661', '10009', '1306', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:28');
INSERT INTO `billaccount` VALUES ('1662', '10009', '1310', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1663', '10009', '1314', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1664', '10009', '1318', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1665', '10009', '1322', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1666', '10009', '1326', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1667', '10009', '1330', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1668', '10009', '1334', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1669', '10009', '1338', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1670', '10009', '1342', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1671', '10009', '1346', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1672', '10009', '1354', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1673', '10009', '1362', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1674', '10009', '1366', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1675', '10009', '1374', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1676', '10009', '1378', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1677', '10009', '1382', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1678', '10009', '1386', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1679', '10009', '1390', '1', '1802.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1680', '10009', '1027', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1681', '10009', '1028', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1682', '10009', '1031', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1683', '10009', '1032', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1684', '10009', '1035', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1685', '10009', '1036', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1686', '10009', '1039', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1687', '10009', '1040', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1688', '10009', '1043', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1689', '10009', '1044', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1690', '10009', '1047', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1691', '10009', '1048', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1692', '10009', '1051', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1693', '10009', '1052', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1694', '10009', '1055', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1695', '10009', '1056', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1696', '10009', '1059', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1697', '10009', '1060', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1698', '10009', '1063', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1699', '10009', '1064', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1700', '10009', '1067', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1701', '10009', '1068', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1702', '10009', '1071', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1703', '10009', '1072', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1704', '10009', '1075', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1705', '10009', '1076', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1706', '10009', '1079', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1707', '10009', '1080', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1708', '10009', '1083', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1709', '10009', '1084', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1710', '10009', '1087', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1711', '10009', '1088', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1712', '10009', '1091', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1713', '10009', '1092', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1714', '10009', '1095', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1715', '10009', '1096', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1716', '10009', '1099', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1717', '10009', '1100', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1718', '10009', '1103', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1719', '10009', '1104', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1720', '10009', '1107', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1721', '10009', '1108', '1', '1810.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1722', '10009', '1026', '1', '1811.00', '20180101-20181231', '20171130', '20191231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1723', '10009', '1029', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1724', '10009', '1030', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1725', '10009', '1033', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1726', '10009', '1034', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1727', '10009', '1037', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1728', '10009', '1038', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1729', '10009', '1041', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1730', '10009', '1042', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1731', '10009', '1045', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1732', '10009', '1046', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1733', '10009', '1049', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1734', '10009', '1050', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1735', '10009', '1053', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1736', '10009', '1054', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1737', '10009', '1057', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1738', '10009', '1058', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1739', '10009', '1061', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1740', '10009', '1062', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1741', '10009', '1065', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1742', '10009', '1066', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1743', '10009', '1069', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1744', '10009', '1070', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1745', '10009', '1073', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1746', '10009', '1074', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1747', '10009', '1077', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1748', '10009', '1078', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1749', '10009', '1081', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1750', '10009', '1085', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1751', '10009', '1089', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1752', '10009', '1090', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1753', '10009', '1093', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1754', '10009', '1094', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1755', '10009', '1097', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1756', '10009', '1098', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1757', '10009', '1101', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1758', '10009', '1102', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1759', '10009', '1105', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1760', '10009', '1106', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1761', '10009', '1109', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1762', '10009', '1113', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1763', '10009', '1114', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1764', '10009', '1117', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1765', '10009', '1118', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1766', '10009', '1121', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1767', '10009', '1122', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1768', '10009', '1125', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1769', '10009', '1126', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1770', '10009', '1129', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1771', '10009', '1130', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1772', '10009', '1133', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1773', '10009', '1134', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1774', '10009', '1137', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1775', '10009', '1138', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1776', '10009', '1141', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1777', '10009', '1142', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:29');
INSERT INTO `billaccount` VALUES ('1778', '10009', '1145', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1779', '10009', '1146', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1780', '10009', '1149', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1781', '10009', '1150', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1782', '10009', '1153', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1783', '10009', '1154', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1784', '10009', '1157', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1785', '10009', '1158', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1786', '10009', '1162', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1787', '10009', '1166', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1788', '10009', '1169', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1789', '10009', '1170', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1790', '10009', '1173', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1791', '10009', '1174', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1792', '10009', '1177', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1793', '10009', '1178', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1794', '10009', '1181', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1795', '10009', '1182', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1796', '10009', '1185', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1797', '10009', '1186', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1798', '10009', '1189', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1799', '10009', '1190', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1800', '10009', '1193', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1801', '10009', '1194', '1', '1811.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1802', '10009', '1112', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1803', '10009', '1115', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1804', '10009', '1116', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1805', '10009', '1119', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1806', '10009', '1120', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1807', '10009', '1123', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1808', '10009', '1124', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1809', '10009', '1127', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1810', '10009', '1128', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1811', '10009', '1131', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1812', '10009', '1132', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1813', '10009', '1135', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1814', '10009', '1136', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1815', '10009', '1139', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1816', '10009', '1140', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1817', '10009', '1143', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1818', '10009', '1144', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1819', '10009', '1147', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1820', '10009', '1148', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1821', '10009', '1151', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1822', '10009', '1152', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1823', '10009', '1155', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1824', '10009', '1156', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1825', '10009', '1159', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1826', '10009', '1160', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1827', '10009', '1163', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1828', '10009', '1164', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1829', '10009', '1167', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1830', '10009', '1168', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1831', '10009', '1171', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1832', '10009', '1172', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1833', '10009', '1175', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1834', '10009', '1176', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1835', '10009', '1179', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1836', '10009', '1180', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1837', '10009', '1183', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1838', '10009', '1184', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1839', '10009', '1187', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1840', '10009', '1188', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1841', '10009', '1191', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1842', '10009', '1192', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1843', '10009', '1195', '1', '1813.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1844', '10009', '1198', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1845', '10009', '1202', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1846', '10009', '1206', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1847', '10009', '1210', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1848', '10009', '1214', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1849', '10009', '1218', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1850', '10009', '1222', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1851', '10009', '1226', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1852', '10009', '1230', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1853', '10009', '1234', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1854', '10009', '1238', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1855', '10009', '1242', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1856', '10009', '1246', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1857', '10009', '1250', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1858', '10009', '1254', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1859', '10009', '1258', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1860', '10009', '1262', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1861', '10009', '1266', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1862', '10009', '1270', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1863', '10009', '1282', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1864', '10009', '1286', '1', '2168.00', '20180101-20181231', '20171130', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 23:43:30');
INSERT INTO `billaccount` VALUES ('1865', '10009', '1198', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:34');
INSERT INTO `billaccount` VALUES ('1866', '10009', '1202', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1867', '10009', '1206', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1868', '10009', '1210', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1869', '10009', '1214', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1870', '10009', '1218', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1871', '10009', '1222', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1872', '10009', '1226', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1873', '10009', '1230', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1874', '10009', '1234', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1875', '10009', '1238', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1876', '10009', '1242', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1877', '10009', '1246', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1878', '10009', '1250', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1879', '10009', '1254', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1880', '10009', '1258', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1881', '10009', '1262', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1882', '10009', '1266', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1883', '10009', '1270', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1884', '10009', '1282', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1885', '10009', '1286', '3', '645.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1886', '10009', '1112', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1887', '10009', '1115', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1888', '10009', '1116', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1889', '10009', '1119', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1890', '10009', '1120', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1891', '10009', '1123', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1892', '10009', '1124', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1893', '10009', '1127', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1894', '10009', '1128', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1895', '10009', '1131', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1896', '10009', '1132', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1897', '10009', '1135', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1898', '10009', '1136', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1899', '10009', '1139', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1900', '10009', '1140', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1901', '10009', '1143', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1902', '10009', '1144', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1903', '10009', '1147', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1904', '10009', '1148', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1905', '10009', '1151', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1906', '10009', '1152', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1907', '10009', '1155', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1908', '10009', '1156', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1909', '10009', '1159', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1910', '10009', '1160', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1911', '10009', '1163', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1912', '10009', '1164', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1913', '10009', '1167', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1914', '10009', '1168', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1915', '10009', '1171', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1916', '10009', '1172', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1917', '10009', '1175', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1918', '10009', '1176', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1919', '10009', '1179', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1920', '10009', '1180', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1921', '10009', '1183', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1922', '10009', '1184', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1923', '10009', '1187', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1924', '10009', '1188', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1925', '10009', '1191', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1926', '10009', '1192', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1927', '10009', '1195', '3', '540.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1928', '10009', '1026', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1929', '10009', '1029', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1930', '10009', '1030', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1931', '10009', '1033', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1932', '10009', '1034', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1933', '10009', '1037', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1934', '10009', '1038', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1935', '10009', '1041', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1936', '10009', '1042', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1937', '10009', '1045', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1938', '10009', '1046', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1939', '10009', '1049', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1940', '10009', '1050', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1941', '10009', '1053', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:35');
INSERT INTO `billaccount` VALUES ('1942', '10009', '1054', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1943', '10009', '1057', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1944', '10009', '1058', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1945', '10009', '1061', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1946', '10009', '1062', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1947', '10009', '1065', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1948', '10009', '1066', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1949', '10009', '1069', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1950', '10009', '1070', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1951', '10009', '1073', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1952', '10009', '1074', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1953', '10009', '1077', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1954', '10009', '1078', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1955', '10009', '1081', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1956', '10009', '1085', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1957', '10009', '1089', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1958', '10009', '1090', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1959', '10009', '1093', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1960', '10009', '1094', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1961', '10009', '1097', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1962', '10009', '1098', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1963', '10009', '1101', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1964', '10009', '1102', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1965', '10009', '1105', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1966', '10009', '1106', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1967', '10009', '1109', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1968', '10009', '1113', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1969', '10009', '1114', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1970', '10009', '1117', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1971', '10009', '1118', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1972', '10009', '1121', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1973', '10009', '1122', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1974', '10009', '1125', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1975', '10009', '1126', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1976', '10009', '1129', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1977', '10009', '1130', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1978', '10009', '1133', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1979', '10009', '1134', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1980', '10009', '1137', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1981', '10009', '1138', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1982', '10009', '1141', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1983', '10009', '1142', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1984', '10009', '1145', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1985', '10009', '1146', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1986', '10009', '1149', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1987', '10009', '1150', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1988', '10009', '1153', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1989', '10009', '1154', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1990', '10009', '1157', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1991', '10009', '1158', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1992', '10009', '1162', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1993', '10009', '1165', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1994', '10009', '1166', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1995', '10009', '1169', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1996', '10009', '1170', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1997', '10009', '1173', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1998', '10009', '1174', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('1999', '10009', '1177', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2000', '10009', '1178', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2001', '10009', '1181', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2002', '10009', '1182', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2003', '10009', '1185', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2004', '10009', '1186', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2005', '10009', '1189', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2006', '10009', '1190', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2007', '10009', '1193', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2008', '10009', '1194', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2009', '10009', '1027', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2010', '10009', '1028', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2011', '10009', '1031', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2012', '10009', '1032', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2013', '10009', '1035', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2014', '10009', '1036', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2015', '10009', '1039', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2016', '10009', '1040', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2017', '10009', '1043', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2018', '10009', '1044', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2019', '10009', '1047', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2020', '10009', '1048', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2021', '10009', '1051', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2022', '10009', '1052', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2023', '10009', '1055', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2024', '10009', '1056', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2025', '10009', '1059', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2026', '10009', '1060', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2027', '10009', '1063', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2028', '10009', '1064', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2029', '10009', '1067', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2030', '10009', '1068', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2031', '10009', '1071', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2032', '10009', '1072', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2033', '10009', '1075', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2034', '10009', '1076', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:36');
INSERT INTO `billaccount` VALUES ('2035', '10009', '1079', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2036', '10009', '1080', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2037', '10009', '1083', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2038', '10009', '1084', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2039', '10009', '1087', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2040', '10009', '1088', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2041', '10009', '1091', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2042', '10009', '1092', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2043', '10009', '1095', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2044', '10009', '1096', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2045', '10009', '1099', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2046', '10009', '1100', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2047', '10009', '1103', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2048', '10009', '1104', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2049', '10009', '1107', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2050', '10009', '1108', '3', '539.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2051', '10009', '1201', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2052', '10009', '1205', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2053', '10009', '1209', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2054', '10009', '1213', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2055', '10009', '1217', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2056', '10009', '1221', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2057', '10009', '1225', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2058', '10009', '1229', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2059', '10009', '1233', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2060', '10009', '1237', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2061', '10009', '1241', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2062', '10009', '1245', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2063', '10009', '1249', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2064', '10009', '1253', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2065', '10009', '1257', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2066', '10009', '1261', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2067', '10009', '1265', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2068', '10009', '1269', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2069', '10009', '1273', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2070', '10009', '1277', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2071', '10009', '1281', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2072', '10009', '1285', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2073', '10009', '1289', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2074', '10009', '1293', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2075', '10009', '1298', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2076', '10009', '1302', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2077', '10009', '1306', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2078', '10009', '1310', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2079', '10009', '1314', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2080', '10009', '1318', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2081', '10009', '1322', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2082', '10009', '1326', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2083', '10009', '1330', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2084', '10009', '1334', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2085', '10009', '1338', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2086', '10009', '1342', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2087', '10009', '1346', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2088', '10009', '1354', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2089', '10009', '1362', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2090', '10009', '1366', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2091', '10009', '1374', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2092', '10009', '1378', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2093', '10009', '1382', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2094', '10009', '1386', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2095', '10009', '1390', '3', '536.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2096', '10009', '1301', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2097', '10009', '1305', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2098', '10009', '1309', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2099', '10009', '1313', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2100', '10009', '1317', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2101', '10009', '1321', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2102', '10009', '1325', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2103', '10009', '1329', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2104', '10009', '1333', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2105', '10009', '1337', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2106', '10009', '1341', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2107', '10009', '1345', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2108', '10009', '1349', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2109', '10009', '1353', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2110', '10009', '1357', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2111', '10009', '1361', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2112', '10009', '1365', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2113', '10009', '1369', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2114', '10009', '1373', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2115', '10009', '1377', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2116', '10009', '1381', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2117', '10009', '1385', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2118', '10009', '1389', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2119', '10009', '1393', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2120', '10009', '1199', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2121', '10009', '1200', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2122', '10009', '1203', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2123', '10009', '1204', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2124', '10009', '1207', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2125', '10009', '1208', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2126', '10009', '1211', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2127', '10009', '1212', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2128', '10009', '1215', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2129', '10009', '1216', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:37');
INSERT INTO `billaccount` VALUES ('2130', '10009', '1219', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2131', '10009', '1220', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2132', '10009', '1223', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2133', '10009', '1224', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2134', '10009', '1227', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2135', '10009', '1228', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2136', '10009', '1231', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2137', '10009', '1232', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2138', '10009', '1235', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2139', '10009', '1236', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2140', '10009', '1239', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2141', '10009', '1240', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2142', '10009', '1243', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2143', '10009', '1244', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2144', '10009', '1247', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2145', '10009', '1248', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2146', '10009', '1251', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2147', '10009', '1252', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2148', '10009', '1255', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2149', '10009', '1256', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2150', '10009', '1259', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2151', '10009', '1260', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2152', '10009', '1263', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2153', '10009', '1264', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2154', '10009', '1267', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2155', '10009', '1268', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2156', '10009', '1271', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2157', '10009', '1272', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2158', '10009', '1275', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2159', '10009', '1276', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2160', '10009', '1279', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2161', '10009', '1280', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2162', '10009', '1283', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2163', '10009', '1284', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2164', '10009', '1287', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2165', '10009', '1288', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2166', '10009', '1291', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2167', '10009', '1292', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2168', '10009', '1299', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2169', '10009', '1300', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2170', '10009', '1304', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2171', '10009', '1308', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2172', '10009', '1311', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2173', '10009', '1312', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2174', '10009', '1316', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2175', '10009', '1319', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2176', '10009', '1320', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2177', '10009', '1323', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2178', '10009', '1324', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2179', '10009', '1327', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2180', '10009', '1328', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2181', '10009', '1331', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2182', '10009', '1332', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2183', '10009', '1335', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2184', '10009', '1336', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2185', '10009', '1339', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2186', '10009', '1340', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2187', '10009', '1343', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2188', '10009', '1344', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2189', '10009', '1347', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2190', '10009', '1348', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2191', '10009', '1351', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2192', '10009', '1355', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2193', '10009', '1356', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2194', '10009', '1359', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2195', '10009', '1360', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2196', '10009', '1363', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2197', '10009', '1364', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2198', '10009', '1367', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2199', '10009', '1368', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2200', '10009', '1371', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2201', '10009', '1375', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2202', '10009', '1376', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2203', '10009', '1379', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2204', '10009', '1380', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2205', '10009', '1383', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2206', '10009', '1387', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2207', '10009', '1388', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2208', '10009', '1391', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2209', '10009', '1392', '3', '534.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2210', '10009', '1086', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2211', '10009', '1110', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2212', '10009', '1111', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2213', '10009', '1196', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2214', '10009', '1197', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2215', '10009', '1274', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2216', '10009', '1278', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2217', '10009', '1295', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2218', '10009', '1296', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:38');
INSERT INTO `billaccount` VALUES ('2219', '10009', '1297', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2220', '10009', '1303', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2221', '10009', '1307', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2222', '10009', '1315', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2223', '10009', '1350', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2224', '10009', '1358', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2225', '10009', '1370', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2226', '10009', '1384', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2227', '10009', '1394', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2228', '10009', '1395', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2229', '10009', '1396', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2230', '10009', '1397', '3', '0.00', '20171001-20180930', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:22:39');
INSERT INTO `billaccount` VALUES ('2231', '10009', '1026', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2232', '10009', '1027', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2233', '10009', '1028', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2234', '10009', '1029', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2235', '10009', '1030', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2236', '10009', '1031', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2237', '10009', '1032', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2238', '10009', '1033', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2239', '10009', '1034', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2240', '10009', '1035', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2241', '10009', '1036', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2242', '10009', '1037', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2243', '10009', '1038', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2244', '10009', '1039', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2245', '10009', '1040', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2246', '10009', '1041', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2247', '10009', '1042', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2248', '10009', '1043', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2249', '10009', '1044', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2250', '10009', '1045', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2251', '10009', '1046', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2252', '10009', '1047', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2253', '10009', '1048', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2254', '10009', '1049', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2255', '10009', '1050', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2256', '10009', '1051', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2257', '10009', '1052', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2258', '10009', '1053', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2259', '10009', '1054', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2260', '10009', '1055', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2261', '10009', '1056', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2262', '10009', '1057', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2263', '10009', '1058', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2264', '10009', '1059', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2265', '10009', '1060', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2266', '10009', '1061', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2267', '10009', '1062', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2268', '10009', '1063', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2269', '10009', '1064', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2270', '10009', '1065', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2271', '10009', '1066', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2272', '10009', '1067', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2273', '10009', '1068', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2274', '10009', '1069', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2275', '10009', '1070', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2276', '10009', '1071', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2277', '10009', '1072', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2278', '10009', '1073', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2279', '10009', '1074', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2280', '10009', '1075', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2281', '10009', '1076', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2282', '10009', '1077', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2283', '10009', '1078', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2284', '10009', '1079', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2285', '10009', '1080', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2286', '10009', '1081', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2287', '10009', '1082', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2288', '10009', '1083', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2289', '10009', '1084', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2290', '10009', '1085', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2291', '10009', '1086', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:12');
INSERT INTO `billaccount` VALUES ('2292', '10009', '1087', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2293', '10009', '1088', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2294', '10009', '1089', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2295', '10009', '1090', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2296', '10009', '1091', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2297', '10009', '1092', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2298', '10009', '1093', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2299', '10009', '1094', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2300', '10009', '1095', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2301', '10009', '1096', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2302', '10009', '1097', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2303', '10009', '1098', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2304', '10009', '1099', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2305', '10009', '1100', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2306', '10009', '1101', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2307', '10009', '1102', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2308', '10009', '1103', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2309', '10009', '1104', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2310', '10009', '1105', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2311', '10009', '1106', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2312', '10009', '1107', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2313', '10009', '1108', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2314', '10009', '1109', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2315', '10009', '1110', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2316', '10009', '1111', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2317', '10009', '1112', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2318', '10009', '1113', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2319', '10009', '1114', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2320', '10009', '1115', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2321', '10009', '1116', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2322', '10009', '1117', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2323', '10009', '1118', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2324', '10009', '1119', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2325', '10009', '1120', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2326', '10009', '1121', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2327', '10009', '1122', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2328', '10009', '1123', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2329', '10009', '1124', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2330', '10009', '1125', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2331', '10009', '1126', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2332', '10009', '1127', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2333', '10009', '1128', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2334', '10009', '1129', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2335', '10009', '1130', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2336', '10009', '1131', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2337', '10009', '1132', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2338', '10009', '1133', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2339', '10009', '1134', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2340', '10009', '1135', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2341', '10009', '1136', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2342', '10009', '1137', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2343', '10009', '1138', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2344', '10009', '1139', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2345', '10009', '1140', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2346', '10009', '1141', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2347', '10009', '1142', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2348', '10009', '1143', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2349', '10009', '1144', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2350', '10009', '1145', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2351', '10009', '1146', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2352', '10009', '1147', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2353', '10009', '1148', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2354', '10009', '1149', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2355', '10009', '1150', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2356', '10009', '1151', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2357', '10009', '1152', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2358', '10009', '1153', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2359', '10009', '1154', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2360', '10009', '1155', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2361', '10009', '1156', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2362', '10009', '1157', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2363', '10009', '1158', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2364', '10009', '1159', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2365', '10009', '1160', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2366', '10009', '1162', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2367', '10009', '1163', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2368', '10009', '1164', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2369', '10009', '1165', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2370', '10009', '1166', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2371', '10009', '1167', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2372', '10009', '1168', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2373', '10009', '1169', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2374', '10009', '1170', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2375', '10009', '1171', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2376', '10009', '1172', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2377', '10009', '1173', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2378', '10009', '1174', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2379', '10009', '1175', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2380', '10009', '1176', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2381', '10009', '1177', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2382', '10009', '1178', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2383', '10009', '1179', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2384', '10009', '1180', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2385', '10009', '1181', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2386', '10009', '1182', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2387', '10009', '1183', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2388', '10009', '1184', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2389', '10009', '1185', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2390', '10009', '1186', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2391', '10009', '1187', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2392', '10009', '1188', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2393', '10009', '1189', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2394', '10009', '1190', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2395', '10009', '1191', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2396', '10009', '1192', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2397', '10009', '1193', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2398', '10009', '1194', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2399', '10009', '1195', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2400', '10009', '1196', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2401', '10009', '1197', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:13');
INSERT INTO `billaccount` VALUES ('2402', '10009', '1198', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2403', '10009', '1199', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2404', '10009', '1200', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2405', '10009', '1201', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2406', '10009', '1202', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2407', '10009', '1203', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2408', '10009', '1204', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2409', '10009', '1205', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2410', '10009', '1206', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2411', '10009', '1207', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2412', '10009', '1208', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2413', '10009', '1209', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2414', '10009', '1210', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2415', '10009', '1211', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2416', '10009', '1212', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2417', '10009', '1213', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2418', '10009', '1214', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2419', '10009', '1215', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2420', '10009', '1216', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2421', '10009', '1217', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2422', '10009', '1218', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2423', '10009', '1219', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2424', '10009', '1220', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2425', '10009', '1221', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2426', '10009', '1222', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2427', '10009', '1223', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2428', '10009', '1224', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2429', '10009', '1225', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2430', '10009', '1226', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2431', '10009', '1227', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2432', '10009', '1228', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2433', '10009', '1229', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2434', '10009', '1230', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2435', '10009', '1231', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2436', '10009', '1232', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2437', '10009', '1233', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2438', '10009', '1234', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2439', '10009', '1235', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2440', '10009', '1236', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2441', '10009', '1237', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2442', '10009', '1238', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2443', '10009', '1239', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2444', '10009', '1240', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2445', '10009', '1241', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2446', '10009', '1242', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2447', '10009', '1243', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2448', '10009', '1244', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2449', '10009', '1245', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2450', '10009', '1246', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2451', '10009', '1247', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2452', '10009', '1248', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2453', '10009', '1249', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2454', '10009', '1250', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2455', '10009', '1251', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2456', '10009', '1252', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2457', '10009', '1253', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2458', '10009', '1254', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2459', '10009', '1255', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2460', '10009', '1256', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2461', '10009', '1257', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2462', '10009', '1258', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2463', '10009', '1259', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2464', '10009', '1260', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2465', '10009', '1261', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2466', '10009', '1262', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2467', '10009', '1263', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2468', '10009', '1264', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2469', '10009', '1265', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2470', '10009', '1266', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2471', '10009', '1267', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2472', '10009', '1268', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2473', '10009', '1269', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2474', '10009', '1270', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2475', '10009', '1271', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2476', '10009', '1272', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2477', '10009', '1273', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2478', '10009', '1274', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2479', '10009', '1275', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2480', '10009', '1276', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2481', '10009', '1277', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2482', '10009', '1278', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2483', '10009', '1279', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2484', '10009', '1280', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2485', '10009', '1281', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2486', '10009', '1282', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2487', '10009', '1283', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2488', '10009', '1284', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2489', '10009', '1285', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2490', '10009', '1286', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2491', '10009', '1287', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2492', '10009', '1288', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2493', '10009', '1289', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2494', '10009', '1290', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2495', '10009', '1291', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2496', '10009', '1292', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2497', '10009', '1293', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2498', '10009', '1294', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2499', '10009', '1295', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2500', '10009', '1296', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2501', '10009', '1297', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2502', '10009', '1298', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2503', '10009', '1299', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2504', '10009', '1300', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2505', '10009', '1301', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2506', '10009', '1302', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2507', '10009', '1303', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2508', '10009', '1304', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2509', '10009', '1305', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:14');
INSERT INTO `billaccount` VALUES ('2510', '10009', '1306', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2511', '10009', '1307', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2512', '10009', '1308', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2513', '10009', '1309', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2514', '10009', '1310', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2515', '10009', '1311', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2516', '10009', '1312', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2517', '10009', '1313', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2518', '10009', '1314', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2519', '10009', '1315', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2520', '10009', '1316', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2521', '10009', '1317', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2522', '10009', '1318', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2523', '10009', '1319', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2524', '10009', '1320', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2525', '10009', '1321', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2526', '10009', '1322', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2527', '10009', '1323', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2528', '10009', '1324', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2529', '10009', '1325', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2530', '10009', '1326', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2531', '10009', '1327', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2532', '10009', '1328', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2533', '10009', '1329', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2534', '10009', '1330', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2535', '10009', '1331', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2536', '10009', '1332', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2537', '10009', '1333', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2538', '10009', '1334', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2539', '10009', '1335', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2540', '10009', '1336', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2541', '10009', '1337', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2542', '10009', '1338', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2543', '10009', '1339', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2544', '10009', '1340', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2545', '10009', '1341', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2546', '10009', '1342', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2547', '10009', '1343', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2548', '10009', '1344', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2549', '10009', '1345', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2550', '10009', '1346', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2551', '10009', '1347', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2552', '10009', '1348', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2553', '10009', '1349', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2554', '10009', '1350', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2555', '10009', '1351', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2556', '10009', '1353', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2557', '10009', '1354', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2558', '10009', '1355', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2559', '10009', '1356', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2560', '10009', '1357', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2561', '10009', '1358', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2562', '10009', '1359', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2563', '10009', '1360', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2564', '10009', '1361', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2565', '10009', '1362', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2566', '10009', '1363', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2567', '10009', '1364', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2568', '10009', '1365', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2569', '10009', '1366', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2570', '10009', '1367', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2571', '10009', '1368', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2572', '10009', '1369', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2573', '10009', '1370', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2574', '10009', '1371', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2575', '10009', '1373', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2576', '10009', '1374', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2577', '10009', '1375', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2578', '10009', '1376', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2579', '10009', '1377', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2580', '10009', '1378', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2581', '10009', '1379', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2582', '10009', '1380', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2583', '10009', '1381', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2584', '10009', '1382', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2585', '10009', '1383', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2586', '10009', '1384', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2587', '10009', '1385', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2588', '10009', '1386', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2589', '10009', '1387', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2590', '10009', '1388', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2591', '10009', '1389', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2592', '10009', '1390', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2593', '10009', '1391', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2594', '10009', '1392', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2595', '10009', '1393', '4', '200.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2596', '10009', '1394', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2597', '10009', '1395', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2598', '10009', '1396', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2599', '10009', '1397', '4', '0.00', '2017年预存水费', '20171203', '20181231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 13:34:15');
INSERT INTO `billaccount` VALUES ('2600', '10009', '1397', '1', '0.00', '201701', '20171203', '20171231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-03 18:03:41');
INSERT INTO `billaccount` VALUES ('2601', '10009', '1026', '1', '0.00', '2015', '20171201', '20171231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-03 18:36:31');
INSERT INTO `billaccount` VALUES ('2602', '10009', '1026', '1', '0.00', '2014', '20171201', '20171231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-03 18:37:56');
INSERT INTO `billaccount` VALUES ('2603', '10009', '1026', '1', '0.00', '2013', '20171201', '20171231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-03 18:39:27');
INSERT INTO `billaccount` VALUES ('2604', '10009', '1026', '1', '0.00', '20125', '20171201', '20171231', null, '0', null, null, '0', '1', null, null, '0', '0', null, null, '2017-12-03 18:40:12');
INSERT INTO `billaccount` VALUES ('2605', '10009', '1026', '1', '0.01', '2012', '20171201', '20171231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 18:48:56');
INSERT INTO `billaccount` VALUES ('2606', '10009', '1027', '1', '0.02', '2011', '20171201', '20171231', null, '1', '2017-12-03 19:35:11', '1', '1', '0', null, null, '1', '0', null, null, '2017-12-03 18:49:28');
INSERT INTO `billaccount` VALUES ('2607', '10009', '1026', '1', '0.01', '2009', '20171201', '20171231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 19:25:41');
INSERT INTO `billaccount` VALUES ('2608', '10009', '1026', '1', '0.01', '2008', '20171201', '20171231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 20:20:42');
INSERT INTO `billaccount` VALUES ('2609', '10009', '1028', '1', '0.10', '2019', '20171201', '20171231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 20:31:19');
INSERT INTO `billaccount` VALUES ('2610', '10009', '1026', '1', '0.01', '2001', '20171201', '20171231', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-03 20:48:07');

-- ----------------------------
-- Table structure for costtype
-- ----------------------------
DROP TABLE IF EXISTS `costtype`;
CREATE TABLE `costtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of costtype
-- ----------------------------
INSERT INTO `costtype` VALUES ('1', '物业管理费');
INSERT INTO `costtype` VALUES ('2', '能源管理费');
INSERT INTO `costtype` VALUES ('3', '公共能耗费');
INSERT INTO `costtype` VALUES ('4', '预存水费');

-- ----------------------------
-- Table structure for housinginfo
-- ----------------------------
DROP TABLE IF EXISTS `housinginfo`;
CREATE TABLE `housinginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付宝小区统一编号',
  `code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '上级物业id',
  `district_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '区县编码',
  `city_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '地级市编码',
  `province_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '省份编码',
  `community_locations` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '小区所在的经纬度列表',
  `associated_pois` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '小区对应的高德POI兴趣点列表',
  `hotline` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '服务热线电话',
  `message_num` int(11) DEFAULT NULL COMMENT '短信条数',
  `status` int(11) DEFAULT NULL COMMENT '1未同步2已同步3已初始化\r\n4已上线',
  `deleteStatus` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of housinginfo
-- ----------------------------
INSERT INTO `housinginfo` VALUES ('9', 'ABD44SPAQ5001', '001000100010011', '首创十方界', '红枫路9号', '2000', '500112', '500100', '500000', '106.537212|29.605355', null, '0571-87654321', '10', '2', '0', '2017-11-20 15:53:22');
INSERT INTO `housinginfo` VALUES ('10003', 'AUROC82WN5001', '001000100010010', '莫须有小区', '红枫路9号', '2000', '500112', '500100', '500000', '106.536969|29.605632', null, '023-74583381', '50', '4', '0', '2017-11-22 15:13:25');
INSERT INTO `housinginfo` VALUES ('10006', null, '001000200010003', '九堡肖苑', '东西大道与新104国道交汇处', '2001', '330104', '330100', '330000', '120.266761|30.307819', null, '0571-88683117', null, '1', '0', '2017-11-30 21:27:19');
INSERT INTO `housinginfo` VALUES ('10009', 'AF2FBBVGM3301', '001000200010012', '西溪永乐城', '杭州市余杭区文一西路与水城北路交叉口', '2001', '330110', '330100', '330000', '120.00538|30.273972', null, '0571-88683117', null, '4', '0', '2017-11-30 22:35:00');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon_Cls` varchar(255) DEFAULT NULL COMMENT '图标',
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `enable` tinyint(4) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=603 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '物业管理系统', null, '&#xe625;', null, '1', '1');
INSERT INTO `menu` VALUES ('2', '停车场管理系统', null, '&#xe669;', null, '2', '1');
INSERT INTO `menu` VALUES ('3', '营销管理系统', null, '&#xe72b;', null, '3', '1');
INSERT INTO `menu` VALUES ('4', '门禁管理系统', null, '&#xe726;', null, '4', '1');
INSERT INTO `menu` VALUES ('5', '参数管理中心', null, '&#xe63c;', null, '5', '1');
INSERT INTO `menu` VALUES ('6', '系统管理中心', null, '&#xe61a;', null, '6', '1');
INSERT INTO `menu` VALUES ('100', '我的服务商', '/rest/service/serviceList', null, '1', '90', '1');
INSERT INTO `menu` VALUES ('101', '我的物业', '/rest/property/propertyList', null, '1', '91', '1');
INSERT INTO `menu` VALUES ('102', '我的小区', '/rest/housing/housingList', null, '1', '92', '1');
INSERT INTO `menu` VALUES ('103', '房屋信息', '/rest/roominfo/roominfoList', null, '1', '93', '1');
INSERT INTO `menu` VALUES ('104', '我的账单', '/rest/billAccount/billAccountList', null, '1', '94', '1');
INSERT INTO `menu` VALUES ('105', '交易中心', null, null, '1', '95', '1');
INSERT INTO `menu` VALUES ('106', '业主催收', null, null, '1', '96', '1');
INSERT INTO `menu` VALUES ('107', '用户管理', '/rest/user/userList', null, '1', '97', '1');
INSERT INTO `menu` VALUES ('201', '开发中', null, null, '2', '99', '1');
INSERT INTO `menu` VALUES ('301', '开发中', null, null, '3', '99', '1');
INSERT INTO `menu` VALUES ('401', '开发中', null, null, '4', '99', '1');
INSERT INTO `menu` VALUES ('501', '开发中', null, null, '5', '99', '1');
INSERT INTO `menu` VALUES ('601', '角色管理', '/rest/role/roleList', null, '6', '99', '1');
INSERT INTO `menu` VALUES ('602', '费用类型', '/rest/costtype/costtypeList', null, '6', '99', '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(32) DEFAULT NULL COMMENT '权限名',
  `permission_sign` varchar(128) DEFAULT NULL COMMENT '权限标识,程序中判断使用,如"user:create"',
  `description` varchar(256) DEFAULT NULL COMMENT '权限描述,UI界面显示使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '我的服务商', 'service:*', null);

-- ----------------------------
-- Table structure for printinfo
-- ----------------------------
DROP TABLE IF EXISTS `printinfo`;
CREATE TABLE `printinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `machine_code` varchar(255) DEFAULT NULL COMMENT '打印机终端号',
  `msign` varchar(255) DEFAULT NULL COMMENT '打印机密钥',
  `mobile_phone` varchar(255) DEFAULT NULL,
  `print_name` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of printinfo
-- ----------------------------
INSERT INTO `printinfo` VALUES ('6', '2000', '4004540276', 'cfji72jqwtf8', '', '物业1打印机', null, '2017-11-25 23:30:29');
INSERT INTO `printinfo` VALUES ('3', '10003', '4004540276', 'cfji72jqwtf8', '111', '莫须有小区打印机', null, '2017-11-25 23:01:28');
INSERT INTO `printinfo` VALUES ('4', '9', '4004540276', 'cfji72jqwtf8', '222', '首创十方界1打印机', null, '2017-11-25 23:01:42');
INSERT INTO `printinfo` VALUES ('7', '10009', '4004540276', 'cfji72jqwtf8', '18368829800', '永乐城', null, '2017-12-03 17:58:05');

-- ----------------------------
-- Table structure for propertyinfo
-- ----------------------------
DROP TABLE IF EXISTS `propertyinfo`;
CREATE TABLE `propertyinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact_people` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '上级物业id',
  `alipay_login_id` varchar(255) DEFAULT NULL COMMENT '商户账号',
  `app_id` varchar(255) DEFAULT NULL COMMENT '商户PID',
  `token` varchar(255) DEFAULT NULL COMMENT '授权TOKEN',
  `alipay_debit_num` varchar(255) DEFAULT NULL COMMENT '支付宝代扣协议编号',
  `weixin_debit_num` varchar(255) DEFAULT NULL COMMENT '微信代扣协议编号',
  `weixin_children_num` varchar(255) DEFAULT NULL COMMENT '微信子商户',
  `api` varchar(255) DEFAULT NULL COMMENT 'API',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of propertyinfo
-- ----------------------------
INSERT INTO `propertyinfo` VALUES ('2000', '00100010001', '1级物业', '张三', '17784495626', '重庆市九龙坡', '8', '', '', '201708BB85188ec4dcbc4be69df6ef6b5fa2fX42', '', '', '', '', '2017-11-19 23:01:25');
INSERT INTO `propertyinfo` VALUES ('2001', '00100020001', '杭州西开发物业管理发展有限公司', '熊和砍', '', '', '10', 'xikaifawuyegongsi@163.com', '2088021994219050', '201710BB47735a4ec11f45fd80838366df347X05', '', '', '', '', '2017-11-30 20:47:49');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `role_sign` varchar(255) DEFAULT NULL COMMENT '角色标识,程序中判断使用,如"admin"',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '服务商管理员', 'service', '服务商管理员', '2017-11-10 16:24:56');
INSERT INTO `role` VALUES ('2', '物业管理员', 'property', '物业管理员', '2017-11-10 17:21:12');
INSERT INTO `role` VALUES ('3', '小区管理员', 'housing', '小区管理员', '2017-11-13 12:49:19');
INSERT INTO `role` VALUES ('99', '超级管理员', 'super_admin', '超级管理员', '2017-11-07 14:42:12');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '1');
INSERT INTO `role_menu` VALUES ('1', '2');
INSERT INTO `role_menu` VALUES ('1', '3');
INSERT INTO `role_menu` VALUES ('1', '4');
INSERT INTO `role_menu` VALUES ('1', '5');
INSERT INTO `role_menu` VALUES ('1', '6');
INSERT INTO `role_menu` VALUES ('1', '100');
INSERT INTO `role_menu` VALUES ('1', '101');
INSERT INTO `role_menu` VALUES ('1', '102');
INSERT INTO `role_menu` VALUES ('1', '103');
INSERT INTO `role_menu` VALUES ('1', '104');
INSERT INTO `role_menu` VALUES ('1', '105');
INSERT INTO `role_menu` VALUES ('1', '106');
INSERT INTO `role_menu` VALUES ('1', '107');
INSERT INTO `role_menu` VALUES ('1', '201');
INSERT INTO `role_menu` VALUES ('1', '301');
INSERT INTO `role_menu` VALUES ('1', '401');
INSERT INTO `role_menu` VALUES ('1', '501');
INSERT INTO `role_menu` VALUES ('1', '601');
INSERT INTO `role_menu` VALUES ('1', '602');
INSERT INTO `role_menu` VALUES ('2', '1');
INSERT INTO `role_menu` VALUES ('2', '2');
INSERT INTO `role_menu` VALUES ('2', '3');
INSERT INTO `role_menu` VALUES ('2', '4');
INSERT INTO `role_menu` VALUES ('2', '5');
INSERT INTO `role_menu` VALUES ('2', '101');
INSERT INTO `role_menu` VALUES ('2', '102');
INSERT INTO `role_menu` VALUES ('2', '103');
INSERT INTO `role_menu` VALUES ('2', '104');
INSERT INTO `role_menu` VALUES ('2', '105');
INSERT INTO `role_menu` VALUES ('2', '106');
INSERT INTO `role_menu` VALUES ('2', '201');
INSERT INTO `role_menu` VALUES ('2', '301');
INSERT INTO `role_menu` VALUES ('2', '401');
INSERT INTO `role_menu` VALUES ('2', '501');
INSERT INTO `role_menu` VALUES ('3', '1');
INSERT INTO `role_menu` VALUES ('3', '2');
INSERT INTO `role_menu` VALUES ('3', '3');
INSERT INTO `role_menu` VALUES ('3', '4');
INSERT INTO `role_menu` VALUES ('3', '5');
INSERT INTO `role_menu` VALUES ('3', '102');
INSERT INTO `role_menu` VALUES ('3', '103');
INSERT INTO `role_menu` VALUES ('3', '104');
INSERT INTO `role_menu` VALUES ('3', '105');
INSERT INTO `role_menu` VALUES ('3', '106');
INSERT INTO `role_menu` VALUES ('3', '201');
INSERT INTO `role_menu` VALUES ('3', '301');
INSERT INTO `role_menu` VALUES ('3', '401');
INSERT INTO `role_menu` VALUES ('3', '501');
INSERT INTO `role_menu` VALUES ('16', '1');
INSERT INTO `role_menu` VALUES ('16', '2');
INSERT INTO `role_menu` VALUES ('16', '3');
INSERT INTO `role_menu` VALUES ('16', '4');
INSERT INTO `role_menu` VALUES ('16', '5');
INSERT INTO `role_menu` VALUES ('16', '102');
INSERT INTO `role_menu` VALUES ('16', '103');
INSERT INTO `role_menu` VALUES ('16', '104');
INSERT INTO `role_menu` VALUES ('16', '105');
INSERT INTO `role_menu` VALUES ('16', '106');
INSERT INTO `role_menu` VALUES ('16', '201');
INSERT INTO `role_menu` VALUES ('16', '301');
INSERT INTO `role_menu` VALUES ('16', '401');
INSERT INTO `role_menu` VALUES ('16', '501');
INSERT INTO `role_menu` VALUES ('99', '1');
INSERT INTO `role_menu` VALUES ('99', '2');
INSERT INTO `role_menu` VALUES ('99', '3');
INSERT INTO `role_menu` VALUES ('99', '4');
INSERT INTO `role_menu` VALUES ('99', '5');
INSERT INTO `role_menu` VALUES ('99', '6');
INSERT INTO `role_menu` VALUES ('99', '100');
INSERT INTO `role_menu` VALUES ('99', '101');
INSERT INTO `role_menu` VALUES ('99', '102');
INSERT INTO `role_menu` VALUES ('99', '103');
INSERT INTO `role_menu` VALUES ('99', '104');
INSERT INTO `role_menu` VALUES ('99', '105');
INSERT INTO `role_menu` VALUES ('99', '106');
INSERT INTO `role_menu` VALUES ('99', '107');
INSERT INTO `role_menu` VALUES ('99', '201');
INSERT INTO `role_menu` VALUES ('99', '301');
INSERT INTO `role_menu` VALUES ('99', '401');
INSERT INTO `role_menu` VALUES ('99', '501');
INSERT INTO `role_menu` VALUES ('99', '601');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色id',
  `permission_id` bigint(20) unsigned NOT NULL COMMENT '权限id',
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色与权限关联表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');

-- ----------------------------
-- Table structure for roominfo
-- ----------------------------
DROP TABLE IF EXISTS `roominfo`;
CREATE TABLE `roominfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `room_id` varchar(255) DEFAULT NULL COMMENT '支付宝房屋编号',
  `group_name` varchar(255) DEFAULT NULL COMMENT '房屋所在的组团名称。例如“一期”，“东区”，“香桂苑”等',
  `building` varchar(255) DEFAULT NULL COMMENT '房屋所在楼栋名称。例如“1栋”，“1幢”等',
  `unit` varchar(255) DEFAULT NULL COMMENT '房屋所在单元名称',
  `room` varchar(255) DEFAULT NULL COMMENT '房屋所在房号。例如“1101室”，“11B室”等',
  `address` varchar(255) DEFAULT NULL COMMENT '房间的完整门牌地址，例如一期1栋2单元2202室',
  `owner_name` varchar(255) DEFAULT NULL COMMENT '业主姓名',
  `owner_card` varchar(255) DEFAULT NULL COMMENT '业主身份证',
  `owner_phone` varchar(255) DEFAULT NULL COMMENT '业主电话',
  `entryDate` varchar(255) DEFAULT NULL COMMENT '入住时间',
  `deleteStatus` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT 'false没有同步，true同步',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1399 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roominfo
-- ----------------------------
INSERT INTO `roominfo` VALUES ('1020', '10003', 'AUROC82WN5001800002100502', '', '2栋', '10单元', '502', '2栋10单元502', '李东', '', '177844966330', '', '0', '1', '2017-11-25 21:40:04');
INSERT INTO `roominfo` VALUES ('1022', '10003', 'AUROC82WN5001800001010011', '', '1栋', '1单元', '1-01', '1栋1单元1-01', '张三', null, '13877777771', null, '0', '1', '2017-11-25 21:55:34');
INSERT INTO `roominfo` VALUES ('1023', '10003', 'AUROC82WN5001800001010012', '', '1栋', '1单元', '1-02', '1栋1单元1-02', '李四', null, '13877777772', null, '0', '1', '2017-11-25 21:55:34');
INSERT INTO `roominfo` VALUES ('1024', '10003', 'AUROC82WN5001800001010013', '', '1栋', '1单元', '1-03', '1栋1单元1-03', '王五', null, '13877777773', null, '0', '1', '2017-11-25 21:55:34');
INSERT INTO `roominfo` VALUES ('1025', '10006', null, '', '1栋', '1单元', '101', '1栋1单元101', '熊合砍', '888888888888888888', '18888888888', '2017-11-30', '1', '0', '2017-11-30 21:38:50');
INSERT INTO `roominfo` VALUES ('1026', '10009', 'AF2FBBVGM3301800001010201', '', '永乐城1幢', '1单元', '201', '永乐城1幢1单元201', '彭彩芹', '', '13777489995', '', '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1027', '10009', 'AF2FBBVGM3301800001010202', '', '永乐城1幢', '1单元', '202', '永乐城1幢1单元202', '张红霞', null, '13372509610', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1028', '10009', 'AF2FBBVGM3301800001010203', '', '永乐城1幢', '1单元', '203', '永乐城1幢1单元203', '王玲', null, '15858146819', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1029', '10009', 'AF2FBBVGM3301800001010204', '', '永乐城1幢', '1单元', '204', '永乐城1幢1单元204', '宋媛莉', null, '18758091896', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1030', '10009', 'AF2FBBVGM3301800001010301', '', '永乐城1幢', '1单元', '301', '永乐城1幢1单元301', '刘卫国', null, '13516804556', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1031', '10009', 'AF2FBBVGM3301800001010302', '', '永乐城1幢', '1单元', '302', '永乐城1幢1单元302', '孙宜满', null, '18814817015', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1032', '10009', 'AF2FBBVGM3301800001010303', '', '永乐城1幢', '1单元', '303', '永乐城1幢1单元303', '王霄汉', null, '18868705362', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1033', '10009', 'AF2FBBVGM3301800001010304', '', '永乐城1幢', '1单元', '304', '永乐城1幢1单元304', '马秀文', null, '15355034542', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1034', '10009', 'AF2FBBVGM3301800001010401', '', '永乐城1幢', '1单元', '401', '永乐城1幢1单元401', '陈德钞', null, '15158132014', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1035', '10009', 'AF2FBBVGM3301800001010402', '', '永乐城1幢', '1单元', '402', '永乐城1幢1单元402', '宋志飞', null, '15558068912', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1036', '10009', 'AF2FBBVGM3301800001010403', '', '永乐城1幢', '1单元', '403', '永乐城1幢1单元403', '刘亮', null, '13777444410', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1037', '10009', 'AF2FBBVGM3301800001010404', '', '永乐城1幢', '1单元', '404', '永乐城1幢1单元404', '俞卫良', null, '18668007610', null, '0', '1', '2017-11-30 22:45:22');
INSERT INTO `roominfo` VALUES ('1038', '10009', 'AF2FBBVGM3301800001010501', '', '永乐城1幢', '1单元', '501', '永乐城1幢1单元501', '于海瑞', null, '15905814148', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1039', '10009', 'AF2FBBVGM3301800001010502', '', '永乐城1幢', '1单元', '502', '永乐城1幢1单元502', '王宏辉', null, '13606542656', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1040', '10009', 'AF2FBBVGM3301800001010503', '', '永乐城1幢', '1单元', '503', '永乐城1幢1单元503', '黄晟', null, '18167158209', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1041', '10009', 'AF2FBBVGM3301800001010504', '', '永乐城1幢', '1单元', '504', '永乐城1幢1单元504', '邱贞欣', null, '13606543921', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1042', '10009', 'AF2FBBVGM3301800001010601', '', '永乐城1幢', '1单元', '601', '永乐城1幢1单元601', '汤玮', null, '13616717500', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1043', '10009', 'AF2FBBVGM3301800001010602', '', '永乐城1幢', '1单元', '602', '永乐城1幢1单元602', '袁少鹏', null, '18072987733', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1044', '10009', 'AF2FBBVGM3301800001010603', '', '永乐城1幢', '1单元', '603', '永乐城1幢1单元603', '陈世革', null, '18768117933', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1045', '10009', 'AF2FBBVGM3301800001010604', '', '永乐城1幢', '1单元', '604', '永乐城1幢1单元604', '张利勇', null, '13588072064', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1046', '10009', 'AF2FBBVGM3301800001010701', '', '永乐城1幢', '1单元', '701', '永乐城1幢1单元701', '张晓军', null, '13857106400', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1047', '10009', 'AF2FBBVGM3301800001010702', '', '永乐城1幢', '1单元', '702', '永乐城1幢1单元702', '施诗', null, '15857827396', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1048', '10009', 'AF2FBBVGM3301800001010703', '', '永乐城1幢', '1单元', '703', '永乐城1幢1单元703', '张金芳', null, '18667006265', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1049', '10009', 'AF2FBBVGM3301800001010704', '', '永乐城1幢', '1单元', '704', '永乐城1幢1单元704', '杨丹', null, '13806507746', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1050', '10009', 'AF2FBBVGM3301800001010801', '', '永乐城1幢', '1单元', '801', '永乐城1幢1单元801', '李菲', null, '18767194556', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1051', '10009', 'AF2FBBVGM3301800001010802', '', '永乐城1幢', '1单元', '802', '永乐城1幢1单元802', '陆佳维', null, '15967122086', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1052', '10009', 'AF2FBBVGM3301800001010803', '', '永乐城1幢', '1单元', '803', '永乐城1幢1单元803', '杨征宇', null, '13738053127', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1053', '10009', 'AF2FBBVGM3301800001010804', '', '永乐城1幢', '1单元', '804', '永乐城1幢1单元804', '陈加寿', null, '18768144710', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1054', '10009', 'AF2FBBVGM3301800001010901', '', '永乐城1幢', '1单元', '901', '永乐城1幢1单元901', '夏为发', null, '13867424573', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1055', '10009', 'AF2FBBVGM3301800001010902', '', '永乐城1幢', '1单元', '902', '永乐城1幢1单元902', '许慧彬', null, '13093795511', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1056', '10009', 'AF2FBBVGM3301800001010903', '', '永乐城1幢', '1单元', '903', '永乐城1幢1单元903', '张建强', null, '13681926650', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1057', '10009', 'AF2FBBVGM3301800001010904', '', '永乐城1幢', '1单元', '904', '永乐城1幢1单元904', '吕海荣', null, '18658831986', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1058', '10009', 'AF2FBBVGM3301800001011001', '', '永乐城1幢', '1单元', '1001', '永乐城1幢1单元1001', '蒋俊丽', null, '15168408818', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1059', '10009', 'AF2FBBVGM3301800001011002', '', '永乐城1幢', '1单元', '1002', '永乐城1幢1单元1002', '胡新平', null, '13758144988', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1060', '10009', 'AF2FBBVGM3301800001011003', '', '永乐城1幢', '1单元', '1003', '永乐城1幢1单元1003', '董鲁军', null, '18058738306', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1061', '10009', 'AF2FBBVGM3301800001011004', '', '永乐城1幢', '1单元', '1004', '永乐城1幢1单元1004', '王肃静', null, '13738067026', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1062', '10009', 'AF2FBBVGM3301800001011101', '', '永乐城1幢', '1单元', '1101', '永乐城1幢1单元1101', '郁星星', null, '15067190651', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1063', '10009', 'AF2FBBVGM3301800001011102', '', '永乐城1幢', '1单元', '1102', '永乐城1幢1单元1102', '郑肖骏', null, '18057118202', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1064', '10009', 'AF2FBBVGM3301800001011103', '', '永乐城1幢', '1单元', '1103', '永乐城1幢1单元1103', '殷忠平', null, '13034200939', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1065', '10009', 'AF2FBBVGM3301800001011104', '', '永乐城1幢', '1单元', '1104', '永乐城1幢1单元1104', '陈金平', null, '13958087215', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1066', '10009', 'AF2FBBVGM3301800001011201', '', '永乐城1幢', '1单元', '1201', '永乐城1幢1单元1201', '赵晓璐', null, '15858131347', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1067', '10009', 'AF2FBBVGM3301800001011202', '', '永乐城1幢', '1单元', '1202', '永乐城1幢1单元1202', '闻佳剑', null, '15957168225', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1068', '10009', 'AF2FBBVGM3301800001011203', '', '永乐城1幢', '1单元', '1203', '永乐城1幢1单元1203', '叶毅凯', null, '15168415528', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1069', '10009', 'AF2FBBVGM3301800001011204', '', '永乐城1幢', '1单元', '1204', '永乐城1幢1单元1204', '吴鸣飞', null, '13777494911', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1070', '10009', 'AF2FBBVGM3301800001011301', '', '永乐城1幢', '1单元', '1301', '永乐城1幢1单元1301', '饶亮', null, '18358166366', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1071', '10009', 'AF2FBBVGM3301800001011302', '', '永乐城1幢', '1单元', '1302', '永乐城1幢1单元1302', '叶菁', null, '13918440028', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1072', '10009', 'AF2FBBVGM3301800001011303', '', '永乐城1幢', '1单元', '1303', '永乐城1幢1单元1303', '俞学涛', null, '13148398551', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1073', '10009', 'AF2FBBVGM3301800001011304', '', '永乐城1幢', '1单元', '1304', '永乐城1幢1单元1304', '沈设', null, '18758066668', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1074', '10009', 'AF2FBBVGM3301800001011401', '', '永乐城1幢', '1单元', '1401', '永乐城1幢1单元1401', '徐彩燕', null, '15858123185', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1075', '10009', 'AF2FBBVGM3301800001011402', '', '永乐城1幢', '1单元', '1402', '永乐城1幢1单元1402', '郑经邦', null, '18221670086', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1076', '10009', 'AF2FBBVGM3301800001011403', '', '永乐城1幢', '1单元', '1403', '永乐城1幢1单元1403', '王艳威', null, '13616517175', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1077', '10009', 'AF2FBBVGM3301800001011404', '', '永乐城1幢', '1单元', '1404', '永乐城1幢1单元1404', '徐旺松', null, '13750829340', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1078', '10009', 'AF2FBBVGM3301800001011501', '', '永乐城1幢', '1单元', '1501', '永乐城1幢1单元1501', '卢海兵', null, '15658138923', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1079', '10009', 'AF2FBBVGM3301800001011502', '', '永乐城1幢', '1单元', '1502', '永乐城1幢1单元1502', '应永明', null, '13968085936', null, '0', '1', '2017-11-30 22:45:23');
INSERT INTO `roominfo` VALUES ('1080', '10009', 'AF2FBBVGM3301800001011503', '', '永乐城1幢', '1单元', '1503', '永乐城1幢1单元1503', '周君', null, '15925617744', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1081', '10009', 'AF2FBBVGM3301800001011504', '', '永乐城1幢', '1单元', '1504', '永乐城1幢1单元1504', '朱斌斌', null, '13989826032', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1082', '10009', 'AF2FBBVGM3301800001011601', '', '永乐城1幢', '1单元', '1601', '永乐城1幢1单元1601', '', null, '', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1083', '10009', 'AF2FBBVGM3301800001011602', '', '永乐城1幢', '1单元', '1602', '永乐城1幢1单元1602', '潘根富', null, '13656665501', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1084', '10009', 'AF2FBBVGM3301800001011603', '', '永乐城1幢', '1单元', '1603', '永乐城1幢1单元1603', '陈伟', null, '15088616212', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1085', '10009', 'AF2FBBVGM3301800001011604', '', '永乐城1幢', '1单元', '1604', '永乐城1幢1单元1604', '张立', null, '18518296309', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1086', '10009', 'AF2FBBVGM3301800001011701', '', '永乐城1幢', '1单元', '1701', '永乐城1幢1单元1701', '', null, '', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1087', '10009', 'AF2FBBVGM3301800001011702', '', '永乐城1幢', '1单元', '1702', '永乐城1幢1单元1702', '王昀岚', null, '13588893050', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1088', '10009', 'AF2FBBVGM3301800001011703', '', '永乐城1幢', '1单元', '1703', '永乐城1幢1单元1703', '王鹏', null, '18667183766', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1089', '10009', 'AF2FBBVGM3301800001011704', '', '永乐城1幢', '1单元', '1704', '永乐城1幢1单元1704', '金敏', null, '18072990617', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1090', '10009', 'AF2FBBVGM3301800001011801', '', '永乐城1幢', '1单元', '1801', '永乐城1幢1单元1801', '范增吉', null, '18626868290', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1091', '10009', 'AF2FBBVGM3301800001011802', '', '永乐城1幢', '1单元', '1802', '永乐城1幢1单元1802', '张曦', null, '13675874070', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1092', '10009', 'AF2FBBVGM3301800001011803', '', '永乐城1幢', '1单元', '1803', '永乐城1幢1单元1803', '朱立军', null, '13967007966', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1093', '10009', 'AF2FBBVGM3301800001011804', '', '永乐城1幢', '1单元', '1804', '永乐城1幢1单元1804', '蒋延辉', null, '13656640664', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1094', '10009', 'AF2FBBVGM3301800001011901', '', '永乐城1幢', '1单元', '1901', '永乐城1幢1单元1901', '徐迈', null, '18267161398', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1095', '10009', 'AF2FBBVGM3301800001011902', '', '永乐城1幢', '1单元', '1902', '永乐城1幢1单元1902', '吴雄俊', null, '15057152014', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1096', '10009', 'AF2FBBVGM3301800001011903', '', '永乐城1幢', '1单元', '1903', '永乐城1幢1单元1903', '骆晨豪', null, '13825764783', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1097', '10009', 'AF2FBBVGM3301800001011904', '', '永乐城1幢', '1单元', '1904', '永乐城1幢1单元1904', '张祥阳', null, '17682343517', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1098', '10009', 'AF2FBBVGM3301800001012001', '', '永乐城1幢', '1单元', '2001', '永乐城1幢1单元2001', '顾干强', null, '13600546958', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1099', '10009', 'AF2FBBVGM3301800001012002', '', '永乐城1幢', '1单元', '2002', '永乐城1幢1单元2002', '潘雷', null, '15906642182', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1100', '10009', 'AF2FBBVGM3301800001012003', '', '永乐城1幢', '1单元', '2003', '永乐城1幢1单元2003', '戴本侠', null, '15168330233', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1101', '10009', 'AF2FBBVGM3301800001012004', '', '永乐城1幢', '1单元', '2004', '永乐城1幢1单元2004', '毛顺', null, '15757190513', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1102', '10009', 'AF2FBBVGM3301800001012101', '', '永乐城1幢', '1单元', '2101', '永乐城1幢1单元2101', '兰建斌', null, '15857176213', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1103', '10009', 'AF2FBBVGM3301800001012102', '', '永乐城1幢', '1单元', '2102', '永乐城1幢1单元2102', '刘丽玲', null, '18258416280', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1104', '10009', 'AF2FBBVGM3301800001012103', '', '永乐城1幢', '1单元', '2103', '永乐城1幢1单元2103', '周文斯', null, '15268545611', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1105', '10009', 'AF2FBBVGM3301800001012104', '', '永乐城1幢', '1单元', '2104', '永乐城1幢1单元2104', '凌爱珍', null, '18667109892', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1106', '10009', 'AF2FBBVGM3301800001012201', '', '永乐城1幢', '1单元', '2201', '永乐城1幢1单元2201', '陈勇', null, '18767104581', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1107', '10009', 'AF2FBBVGM3301800001012202', '', '永乐城1幢', '1单元', '2202', '永乐城1幢1单元2202', '林涛', null, '13732200799', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1108', '10009', 'AF2FBBVGM3301800001012203', '', '永乐城1幢', '1单元', '2203', '永乐城1幢1单元2203', '王晓真', null, '15375244777', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1109', '10009', 'AF2FBBVGM3301800001012204', '', '永乐城1幢', '1单元', '2204', '永乐城1幢1单元2204', '贾朋朋', null, '18814865769', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1110', '10009', 'AF2FBBVGM3301800001012301', '', '永乐城1幢', '1单元', '2301', '永乐城1幢1单元2301', '', null, '', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1111', '10009', 'AF2FBBVGM3301800001012302', '', '永乐城1幢', '1单元', '2302', '永乐城1幢1单元2302', '', null, '', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1112', '10009', 'AF2FBBVGM3301800002010201', '', '永乐城2幢', '1单元', '201', '永乐城2幢1单元201', '滕树林', null, '18657154282', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1113', '10009', 'AF2FBBVGM3301800002010202', '', '永乐城2幢', '1单元', '202', '永乐城2幢1单元202', '尚晓斌', null, '13588850040', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1114', '10009', 'AF2FBBVGM3301800002010203', '', '永乐城2幢', '1单元', '203', '永乐城2幢1单元203', '张俊杰', null, '15068175022', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1115', '10009', 'AF2FBBVGM3301800002010204', '', '永乐城2幢', '1单元', '204', '永乐城2幢1单元204', '刘丹', null, '15381060033', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1116', '10009', 'AF2FBBVGM3301800002010301', '', '永乐城2幢', '1单元', '301', '永乐城2幢1单元301', '赵晴', null, '18368113211', null, '0', '1', '2017-11-30 22:45:24');
INSERT INTO `roominfo` VALUES ('1117', '10009', 'AF2FBBVGM3301800002010302', '', '永乐城2幢', '1单元', '302', '永乐城2幢1单元302', '王海峰', null, '13752379996', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1118', '10009', 'AF2FBBVGM3301800002010303', '', '永乐城2幢', '1单元', '303', '永乐城2幢1单元303', '占璐', null, '18768198540', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1119', '10009', 'AF2FBBVGM3301800002010304', '', '永乐城2幢', '1单元', '304', '永乐城2幢1单元304', '肖建', null, '13906856396', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1120', '10009', 'AF2FBBVGM3301800002010401', '', '永乐城2幢', '1单元', '401', '永乐城2幢1单元401', '池学智', null, '15168339332', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1121', '10009', 'AF2FBBVGM3301800002010402', '', '永乐城2幢', '1单元', '402', '永乐城2幢1单元402', '夏超雷', null, '15336588712', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1122', '10009', 'AF2FBBVGM3301800002010403', '', '永乐城2幢', '1单元', '403', '永乐城2幢1单元403', '刘长国', null, '15167183892', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1123', '10009', 'AF2FBBVGM3301800002010404', '', '永乐城2幢', '1单元', '404', '永乐城2幢1单元404', '金实城', null, '15658151625', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1124', '10009', 'AF2FBBVGM3301800002010501', '', '永乐城2幢', '1单元', '501', '永乐城2幢1单元501', '姜美娣', null, '13906516648', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1125', '10009', 'AF2FBBVGM3301800002010502', '', '永乐城2幢', '1单元', '502', '永乐城2幢1单元502', '王淇', null, '18566232923', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1126', '10009', 'AF2FBBVGM3301800002010503', '', '永乐城2幢', '1单元', '503', '永乐城2幢1单元503', '胡洪豪', null, '15825532069', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1127', '10009', 'AF2FBBVGM3301800002010504', '', '永乐城2幢', '1单元', '504', '永乐城2幢1单元504', '赵建华', null, '18058795188', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1128', '10009', 'AF2FBBVGM3301800002010601', '', '永乐城2幢', '1单元', '601', '永乐城2幢1单元601', '刘锋军', null, '13862351340', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1129', '10009', 'AF2FBBVGM3301800002010602', '', '永乐城2幢', '1单元', '602', '永乐城2幢1单元602', '尚小广', null, '15958162604', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1130', '10009', 'AF2FBBVGM3301800002010603', '', '永乐城2幢', '1单元', '603', '永乐城2幢1单元603', '李梅', null, '18868722677', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1131', '10009', 'AF2FBBVGM3301800002010604', '', '永乐城2幢', '1单元', '604', '永乐城2幢1单元604', '阮欣', null, '15805706338', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1132', '10009', 'AF2FBBVGM3301800002010701', '', '永乐城2幢', '1单元', '701', '永乐城2幢1单元701', '鲍君卿', null, '13325717203', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1133', '10009', 'AF2FBBVGM3301800002010702', '', '永乐城2幢', '1单元', '702', '永乐城2幢1单元702', '师天新', null, '18857882538', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1134', '10009', 'AF2FBBVGM3301800002010703', '', '永乐城2幢', '1单元', '703', '永乐城2幢1单元703', '王泽杰', null, '15867122058', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1135', '10009', 'AF2FBBVGM3301800002010704', '', '永乐城2幢', '1单元', '704', '永乐城2幢1单元704', '郑燕芳', null, '13588027016', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1136', '10009', 'AF2FBBVGM3301800002010801', '', '永乐城2幢', '1单元', '801', '永乐城2幢1单元801', '谢宝晶', null, '15058170296', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1137', '10009', 'AF2FBBVGM3301800002010802', '', '永乐城2幢', '1单元', '802', '永乐城2幢1单元802', '王成李', null, '15858276673', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1138', '10009', 'AF2FBBVGM3301800002010803', '', '永乐城2幢', '1单元', '803', '永乐城2幢1单元803', '龚报鸿', null, '15374338087', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1139', '10009', 'AF2FBBVGM3301800002010804', '', '永乐城2幢', '1单元', '804', '永乐城2幢1单元804', '唐洪亮', null, '18906532649', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1140', '10009', 'AF2FBBVGM3301800002010901', '', '永乐城2幢', '1单元', '901', '永乐城2幢1单元901', '张兆钰', null, '15168325332', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1141', '10009', 'AF2FBBVGM3301800002010902', '', '永乐城2幢', '1单元', '902', '永乐城2幢1单元902', '施玮', null, '15857110945', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1142', '10009', 'AF2FBBVGM3301800002010903', '', '永乐城2幢', '1单元', '903', '永乐城2幢1单元903', '林宏月', null, '15203972169', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1143', '10009', 'AF2FBBVGM3301800002010904', '', '永乐城2幢', '1单元', '904', '永乐城2幢1单元904', '朱刚', null, '15158113713', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1144', '10009', 'AF2FBBVGM3301800002011001', '', '永乐城2幢', '1单元', '1001', '永乐城2幢1单元1001', '翁清南', null, '15058188825', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1145', '10009', 'AF2FBBVGM3301800002011002', '', '永乐城2幢', '1单元', '1002', '永乐城2幢1单元1002', '陈俊杰', null, '15658829329', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1146', '10009', 'AF2FBBVGM3301800002011003', '', '永乐城2幢', '1单元', '1003', '永乐城2幢1单元1003', '蒋雨良', null, '13725288523', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1147', '10009', 'AF2FBBVGM3301800002011004', '', '永乐城2幢', '1单元', '1004', '永乐城2幢1单元1004', '张雷', null, '13175089868', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1148', '10009', 'AF2FBBVGM3301800002011101', '', '永乐城2幢', '1单元', '1101', '永乐城2幢1单元1101', '乐晴波', null, '13806637906', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1149', '10009', 'AF2FBBVGM3301800002011102', '', '永乐城2幢', '1单元', '1102', '永乐城2幢1单元1102', '魏凌云', null, '13858108063', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1150', '10009', 'AF2FBBVGM3301800002011103', '', '永乐城2幢', '1单元', '1103', '永乐城2幢1单元1103', '沈凯礼', null, '18694581280', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1151', '10009', 'AF2FBBVGM3301800002011104', '', '永乐城2幢', '1单元', '1104', '永乐城2幢1单元1104', '黄凡', null, '15868804464', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1152', '10009', 'AF2FBBVGM3301800002011201', '', '永乐城2幢', '1单元', '1201', '永乐城2幢1单元1201', '吴奇', null, '13858140587', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1153', '10009', 'AF2FBBVGM3301800002011202', '', '永乐城2幢', '1单元', '1202', '永乐城2幢1单元1202', '赵为录', null, '18920270616', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1154', '10009', 'AF2FBBVGM3301800002011203', '', '永乐城2幢', '1单元', '1203', '永乐城2幢1单元1203', '沈晨秋', null, '18767123418', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1155', '10009', 'AF2FBBVGM3301800002011204', '', '永乐城2幢', '1单元', '1204', '永乐城2幢1单元1204', '楼国松', null, '15158078258', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1156', '10009', 'AF2FBBVGM3301800002011301', '', '永乐城2幢', '1单元', '1301', '永乐城2幢1单元1301', '陈建栋', null, '15869025313', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1157', '10009', 'AF2FBBVGM3301800002011302', '', '永乐城2幢', '1单元', '1302', '永乐城2幢1单元1302', '周伟', null, '15397155674', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1158', '10009', 'AF2FBBVGM3301800002011303', '', '永乐城2幢', '1单元', '1303', '永乐城2幢1单元1303', '余银桂', null, '15394957933', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1159', '10009', 'AF2FBBVGM3301800002011304', '', '永乐城2幢', '1单元', '1304', '永乐城2幢1单元1304', '杨彬', null, '15397158326', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1160', '10009', 'AF2FBBVGM3301800002011401', '', '永乐城2幢', '1单元', '1401', '永乐城2幢1单元1401', '李冰松', null, '13989845268', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1161', '10009', 'AF2FBBVGM3301800002011402', '', '永乐城2幢', '1单元', '1402', '永乐城2幢1单元1402', '刘洋', null, '', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1162', '10009', 'AF2FBBVGM3301800002011403', '', '永乐城2幢', '1单元', '1403', '永乐城2幢1单元1403', '洪震', null, '13858826199', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1163', '10009', 'AF2FBBVGM3301800002011404', '', '永乐城2幢', '1单元', '1404', '永乐城2幢1单元1404', '邱在华', null, '18006817780', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1164', '10009', 'AF2FBBVGM3301800002011501', '', '永乐城2幢', '1单元', '1501', '永乐城2幢1单元1501', '叶超', null, '18758192357', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1165', '10009', 'AF2FBBVGM3301800002011502', '', '永乐城2幢', '1单元', '1502', '永乐城2幢1单元1502', '王畅', null, '18668012213', null, '0', '1', '2017-11-30 22:45:25');
INSERT INTO `roominfo` VALUES ('1166', '10009', 'AF2FBBVGM3301800002011503', '', '永乐城2幢', '1单元', '1503', '永乐城2幢1单元1503', '任宝林', null, '18158138821', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1167', '10009', 'AF2FBBVGM3301800002011504', '', '永乐城2幢', '1单元', '1504', '永乐城2幢1单元1504', '麻玉菡', null, '13306518293', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1168', '10009', 'AF2FBBVGM3301800002011601', '', '永乐城2幢', '1单元', '1601', '永乐城2幢1单元1601', '金圣杰', null, '15158035336', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1169', '10009', 'AF2FBBVGM3301800002011602', '', '永乐城2幢', '1单元', '1602', '永乐城2幢1单元1602', '刘瑶', null, '13588385469', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1170', '10009', 'AF2FBBVGM3301800002011603', '', '永乐城2幢', '1单元', '1603', '永乐城2幢1单元1603', '李文', null, '18096583156', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1171', '10009', 'AF2FBBVGM3301800002011604', '', '永乐城2幢', '1单元', '1604', '永乐城2幢1单元1604', '郑佳楠', null, '13335818080', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1172', '10009', 'AF2FBBVGM3301800002011701', '', '永乐城2幢', '1单元', '1701', '永乐城2幢1单元1701', '石吉东', null, '15088618465', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1173', '10009', 'AF2FBBVGM3301800002011702', '', '永乐城2幢', '1单元', '1702', '永乐城2幢1单元1702', '朱康强', null, '15858235798', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1174', '10009', 'AF2FBBVGM3301800002011703', '', '永乐城2幢', '1单元', '1703', '永乐城2幢1单元1703', '王剑辉', null, '15869025091', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1175', '10009', 'AF2FBBVGM3301800002011704', '', '永乐城2幢', '1单元', '1704', '永乐城2幢1单元1704', '曹轲', null, '15658899512', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1176', '10009', 'AF2FBBVGM3301800002011801', '', '永乐城2幢', '1单元', '1801', '永乐城2幢1单元1801', '许锡彬', null, '13510411744', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1177', '10009', 'AF2FBBVGM3301800002011802', '', '永乐城2幢', '1单元', '1802', '永乐城2幢1单元1802', '潘剑云', null, '13735819246', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1178', '10009', 'AF2FBBVGM3301800002011803', '', '永乐城2幢', '1单元', '1803', '永乐城2幢1单元1803', '陈康增', null, '18681464646', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1179', '10009', 'AF2FBBVGM3301800002011804', '', '永乐城2幢', '1单元', '1804', '永乐城2幢1单元1804', '求哲虹', null, '18657507355', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1180', '10009', 'AF2FBBVGM3301800002011901', '', '永乐城2幢', '1单元', '1901', '永乐城2幢1单元1901', '方建明', null, '13750880584', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1181', '10009', 'AF2FBBVGM3301800002011902', '', '永乐城2幢', '1单元', '1902', '永乐城2幢1单元1902', '范金阳', null, '18758031186', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1182', '10009', 'AF2FBBVGM3301800002011903', '', '永乐城2幢', '1单元', '1903', '永乐城2幢1单元1903', '朱金才', null, '18858130653', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1183', '10009', 'AF2FBBVGM3301800002011904', '', '永乐城2幢', '1单元', '1904', '永乐城2幢1单元1904', '沙志刚', null, '18258863244', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1184', '10009', 'AF2FBBVGM3301800002012001', '', '永乐城2幢', '1单元', '2001', '永乐城2幢1单元2001', '刘建雨', null, '18767104645', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1185', '10009', 'AF2FBBVGM3301800002012002', '', '永乐城2幢', '1单元', '2002', '永乐城2幢1单元2002', '王志强', null, '13656680720', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1186', '10009', 'AF2FBBVGM3301800002012003', '', '永乐城2幢', '1单元', '2003', '永乐城2幢1单元2003', '沙启荷', null, '15067183002', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1187', '10009', 'AF2FBBVGM3301800002012004', '', '永乐城2幢', '1单元', '2004', '永乐城2幢1单元2004', '杨永鑫', null, '13750816105', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1188', '10009', 'AF2FBBVGM3301800002012101', '', '永乐城2幢', '1单元', '2101', '永乐城2幢1单元2101', '童靓峰', null, '18657100074', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1189', '10009', 'AF2FBBVGM3301800002012102', '', '永乐城2幢', '1单元', '2102', '永乐城2幢1单元2102', '赵前鑫', null, '18267186955', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1190', '10009', 'AF2FBBVGM3301800002012103', '', '永乐城2幢', '1单元', '2103', '永乐城2幢1单元2103', '陈先昌', null, '13777583916', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1191', '10009', 'AF2FBBVGM3301800002012104', '', '永乐城2幢', '1单元', '2104', '永乐城2幢1单元2104', '张杰', null, '15168365069', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1192', '10009', 'AF2FBBVGM3301800002012201', '', '永乐城2幢', '1单元', '2201', '永乐城2幢1单元2201', '赵土军', null, '13757006131', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1193', '10009', 'AF2FBBVGM3301800002012202', '', '永乐城2幢', '1单元', '2202', '永乐城2幢1单元2202', '周学奕', null, '18968039909', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1194', '10009', 'AF2FBBVGM3301800002012203', '', '永乐城2幢', '1单元', '2203', '永乐城2幢1单元2203', '徐道忠', null, '15605250175', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1195', '10009', 'AF2FBBVGM3301800002012204', '', '永乐城2幢', '1单元', '2204', '永乐城2幢1单元2204', '徐静', null, '13958597626', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1196', '10009', 'AF2FBBVGM3301800002012301', '', '永乐城2幢', '1单元', '2301', '永乐城2幢1单元2301', '', null, '', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1197', '10009', 'AF2FBBVGM3301800002012302', '', '永乐城2幢', '1单元', '2302', '永乐城2幢1单元2302', '', null, '', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1198', '10009', 'AF2FBBVGM3301800003010301', '', '永乐城3幢', '1单元', '301', '永乐城3幢1单元301', '严青松', null, '18968096701', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1199', '10009', 'AF2FBBVGM3301800003010302', '', '永乐城3幢', '1单元', '302', '永乐城3幢1单元302', '曾文东', null, '13868078217', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1200', '10009', 'AF2FBBVGM3301800003010303', '', '永乐城3幢', '1单元', '303', '永乐城3幢1单元303', '张勤峰', null, '18968096368', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1201', '10009', 'AF2FBBVGM3301800003010304', '', '永乐城3幢', '1单元', '304', '永乐城3幢1单元304', '刘玉华', null, '15658011977', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1202', '10009', 'AF2FBBVGM3301800003010401', '', '永乐城3幢', '1单元', '401', '永乐城3幢1单元401', '陈晓琴', null, '13868089130', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1203', '10009', 'AF2FBBVGM3301800003010402', '', '永乐城3幢', '1单元', '402', '永乐城3幢1单元402', '杨有玲', null, '13958097096', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1204', '10009', 'AF2FBBVGM3301800003010403', '', '永乐城3幢', '1单元', '403', '永乐城3幢1单元403', '周晓峰', null, '15168243791', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1205', '10009', 'AF2FBBVGM3301800003010404', '', '永乐城3幢', '1单元', '404', '永乐城3幢1单元404', '陈吕滨', null, '15558012888', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1206', '10009', 'AF2FBBVGM3301800003010501', '', '永乐城3幢', '1单元', '501', '永乐城3幢1单元501', '张舟航', null, '13065730741', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1207', '10009', 'AF2FBBVGM3301800003010502', '', '永乐城3幢', '1单元', '502', '永乐城3幢1单元502', '杨晓', null, '15158115683', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1208', '10009', 'AF2FBBVGM3301800003010503', '', '永乐城3幢', '1单元', '503', '永乐城3幢1单元503', '徐林俊', null, '18768111685', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1209', '10009', 'AF2FBBVGM3301800003010504', '', '永乐城3幢', '1单元', '504', '永乐城3幢1单元504', '黎成林', null, '13758224630', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1210', '10009', 'AF2FBBVGM3301800003010601', '', '永乐城3幢', '1单元', '601', '永乐城3幢1单元601', '刘嘉敏', null, '18668048503', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1211', '10009', 'AF2FBBVGM3301800003010602', '', '永乐城3幢', '1单元', '602', '永乐城3幢1单元602', '滕颖', null, '13362460425', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1212', '10009', 'AF2FBBVGM3301800003010603', '', '永乐城3幢', '1单元', '603', '永乐城3幢1单元603', '吴刚', null, '13732285155', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1213', '10009', 'AF2FBBVGM3301800003010604', '', '永乐城3幢', '1单元', '604', '永乐城3幢1单元604', '张龙', null, '15257107207', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1214', '10009', 'AF2FBBVGM3301800003010701', '', '永乐城3幢', '1单元', '701', '永乐城3幢1单元701', '王申宇', null, '15257884629', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1215', '10009', 'AF2FBBVGM3301800003010702', '', '永乐城3幢', '1单元', '702', '永乐城3幢1单元702', '张逸阳', null, '15968840923', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1216', '10009', 'AF2FBBVGM3301800003010703', '', '永乐城3幢', '1单元', '703', '永乐城3幢1单元703', '林筱剑', null, '15868843416', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1217', '10009', 'AF2FBBVGM3301800003010704', '', '永乐城3幢', '1单元', '704', '永乐城3幢1单元704', '邵文正', null, '13906531512', null, '0', '1', '2017-11-30 22:45:26');
INSERT INTO `roominfo` VALUES ('1218', '10009', 'AF2FBBVGM3301800003010801', '', '永乐城3幢', '1单元', '801', '永乐城3幢1单元801', '胡仓锁', null, '13732159136', null, '0', '1', '2017-11-30 22:45:27');
INSERT INTO `roominfo` VALUES ('1219', '10009', 'AF2FBBVGM3301800003010802', '', '永乐城3幢', '1单元', '802', '永乐城3幢1单元802', '陆晓栋', null, '15267134504', null, '0', '1', '2017-11-30 22:45:27');
INSERT INTO `roominfo` VALUES ('1220', '10009', 'AF2FBBVGM3301800003010803', '', '永乐城3幢', '1单元', '803', '永乐城3幢1单元803', '江志鸿', null, '15857191317', null, '0', '1', '2017-11-30 22:45:27');
INSERT INTO `roominfo` VALUES ('1221', '10009', 'AF2FBBVGM3301800003010804', '', '永乐城3幢', '1单元', '804', '永乐城3幢1单元804', '沈剑儿', null, '13989856878', null, '0', '1', '2017-11-30 22:45:27');
INSERT INTO `roominfo` VALUES ('1222', '10009', 'AF2FBBVGM3301800003010901', '', '永乐城3幢', '1单元', '901', '永乐城3幢1单元901', '盛涛', null, '18668018688', null, '0', '1', '2017-11-30 22:45:27');
INSERT INTO `roominfo` VALUES ('1223', '10009', 'AF2FBBVGM3301800003010902', '', '永乐城3幢', '1单元', '902', '永乐城3幢1单元902', '杨威', null, '18858146868', null, '0', '1', '2017-11-30 22:45:27');
INSERT INTO `roominfo` VALUES ('1224', '10009', 'AF2FBBVGM3301800003010903', '', '永乐城3幢', '1单元', '903', '永乐城3幢1单元903', '朱小辉', null, '15967145021', null, '0', '1', '2017-11-30 22:45:28');
INSERT INTO `roominfo` VALUES ('1225', '10009', 'AF2FBBVGM3301800003010904', '', '永乐城3幢', '1单元', '904', '永乐城3幢1单元904', '柯华', null, '15067179128', null, '0', '1', '2017-11-30 22:45:28');
INSERT INTO `roominfo` VALUES ('1226', '10009', 'AF2FBBVGM3301800003011001', '', '永乐城3幢', '1单元', '1001', '永乐城3幢1单元1001', '郭晓征', null, '17557288715', null, '0', '1', '2017-11-30 22:45:28');
INSERT INTO `roominfo` VALUES ('1227', '10009', 'AF2FBBVGM3301800003011002', '', '永乐城3幢', '1单元', '1002', '永乐城3幢1单元1002', '张金玉', null, '18600945670', null, '0', '1', '2017-11-30 22:45:28');
INSERT INTO `roominfo` VALUES ('1228', '10009', 'AF2FBBVGM3301800003011003', '', '永乐城3幢', '1单元', '1003', '永乐城3幢1单元1003', '杨清', null, '13671927014', null, '0', '1', '2017-11-30 22:45:29');
INSERT INTO `roominfo` VALUES ('1229', '10009', 'AF2FBBVGM3301800003011004', '', '永乐城3幢', '1单元', '1004', '永乐城3幢1单元1004', '丰丹', null, '13251027807', null, '0', '1', '2017-11-30 22:45:29');
INSERT INTO `roominfo` VALUES ('1230', '10009', 'AF2FBBVGM3301800003011101', '', '永乐城3幢', '1单元', '1101', '永乐城3幢1单元1101', '朱灵晓', null, '13588450867', null, '0', '1', '2017-11-30 22:45:29');
INSERT INTO `roominfo` VALUES ('1231', '10009', 'AF2FBBVGM3301800003011102', '', '永乐城3幢', '1单元', '1102', '永乐城3幢1单元1102', '杜俊杰', null, '18910500960', null, '0', '1', '2017-11-30 22:45:30');
INSERT INTO `roominfo` VALUES ('1232', '10009', 'AF2FBBVGM3301800003011103', '', '永乐城3幢', '1单元', '1103', '永乐城3幢1单元1103', '万炳滨', null, '18668125588', null, '0', '1', '2017-11-30 22:45:30');
INSERT INTO `roominfo` VALUES ('1233', '10009', 'AF2FBBVGM3301800003011104', '', '永乐城3幢', '1单元', '1104', '永乐城3幢1单元1104', '刘义圆', null, '18957102881', null, '0', '1', '2017-11-30 22:45:30');
INSERT INTO `roominfo` VALUES ('1234', '10009', 'AF2FBBVGM3301800003011201', '', '永乐城3幢', '1单元', '1201', '永乐城3幢1单元1201', '郑丽珍', null, '13868698877', null, '0', '1', '2017-11-30 22:45:30');
INSERT INTO `roominfo` VALUES ('1235', '10009', 'AF2FBBVGM3301800003011202', '', '永乐城3幢', '1单元', '1202', '永乐城3幢1单元1202', '毛利平', null, '18268877339', null, '0', '1', '2017-11-30 22:45:31');
INSERT INTO `roominfo` VALUES ('1236', '10009', 'AF2FBBVGM3301800003011203', '', '永乐城3幢', '1单元', '1203', '永乐城3幢1单元1203', '陈宏权', null, '15869155526', null, '0', '1', '2017-11-30 22:45:31');
INSERT INTO `roominfo` VALUES ('1237', '10009', 'AF2FBBVGM3301800003011204', '', '永乐城3幢', '1单元', '1204', '永乐城3幢1单元1204', '施竞', null, '13003636442', null, '0', '1', '2017-11-30 22:45:31');
INSERT INTO `roominfo` VALUES ('1238', '10009', 'AF2FBBVGM3301800003011301', '', '永乐城3幢', '1单元', '1301', '永乐城3幢1单元1301', '王俊', null, '15700090170', null, '0', '1', '2017-11-30 22:45:32');
INSERT INTO `roominfo` VALUES ('1239', '10009', 'AF2FBBVGM3301800003011302', '', '永乐城3幢', '1单元', '1302', '永乐城3幢1单元1302', '刘旋尧', null, '18257140570', null, '0', '1', '2017-11-30 22:45:32');
INSERT INTO `roominfo` VALUES ('1240', '10009', 'AF2FBBVGM3301800003011303', '', '永乐城3幢', '1单元', '1303', '永乐城3幢1单元1303', '朱云飞', null, '15856952522', null, '0', '1', '2017-11-30 22:45:32');
INSERT INTO `roominfo` VALUES ('1241', '10009', 'AF2FBBVGM3301800003011304', '', '永乐城3幢', '1单元', '1304', '永乐城3幢1单元1304', '李浩然', null, '15821262894', null, '0', '1', '2017-11-30 22:45:32');
INSERT INTO `roominfo` VALUES ('1242', '10009', 'AF2FBBVGM3301800003011401', '', '永乐城3幢', '1单元', '1401', '永乐城3幢1单元1401', '王洋捷', null, '18606715856', null, '0', '1', '2017-11-30 22:45:33');
INSERT INTO `roominfo` VALUES ('1243', '10009', 'AF2FBBVGM3301800003011402', '', '永乐城3幢', '1单元', '1402', '永乐城3幢1单元1402', '贾慧民', null, '13967488840', null, '0', '1', '2017-11-30 22:45:33');
INSERT INTO `roominfo` VALUES ('1244', '10009', 'AF2FBBVGM3301800003011403', '', '永乐城3幢', '1单元', '1403', '永乐城3幢1单元1403', '刘金生', null, '13538982779', null, '0', '1', '2017-11-30 22:45:33');
INSERT INTO `roominfo` VALUES ('1245', '10009', 'AF2FBBVGM3301800003011404', '', '永乐城3幢', '1单元', '1404', '永乐城3幢1单元1404', '仇静', null, '13516725653', null, '0', '1', '2017-11-30 22:45:34');
INSERT INTO `roominfo` VALUES ('1246', '10009', 'AF2FBBVGM3301800003011501', '', '永乐城3幢', '1单元', '1501', '永乐城3幢1单元1501', '姚峰', null, '15825549424', null, '0', '1', '2017-11-30 22:45:34');
INSERT INTO `roominfo` VALUES ('1247', '10009', 'AF2FBBVGM3301800003011502', '', '永乐城3幢', '1单元', '1502', '永乐城3幢1单元1502', '徐江', null, '18658890330', null, '0', '1', '2017-11-30 22:45:34');
INSERT INTO `roominfo` VALUES ('1248', '10009', 'AF2FBBVGM3301800003011503', '', '永乐城3幢', '1单元', '1503', '永乐城3幢1单元1503', '陈开贵', null, '13735987212', null, '0', '1', '2017-11-30 22:45:34');
INSERT INTO `roominfo` VALUES ('1249', '10009', 'AF2FBBVGM3301800003011504', '', '永乐城3幢', '1单元', '1504', '永乐城3幢1单元1504', '杨彪', null, '15268572667', null, '0', '1', '2017-11-30 22:45:35');
INSERT INTO `roominfo` VALUES ('1250', '10009', 'AF2FBBVGM3301800003011601', '', '永乐城3幢', '1单元', '1601', '永乐城3幢1单元1601', '赵军铭', null, '13373856060', null, '0', '1', '2017-11-30 22:45:35');
INSERT INTO `roominfo` VALUES ('1251', '10009', 'AF2FBBVGM3301800003011602', '', '永乐城3幢', '1单元', '1602', '永乐城3幢1单元1602', '颜伊芳', null, '15867196871', null, '0', '1', '2017-11-30 22:45:35');
INSERT INTO `roominfo` VALUES ('1252', '10009', 'AF2FBBVGM3301800003011603', '', '永乐城3幢', '1单元', '1603', '永乐城3幢1单元1603', '邵昱人', null, '13819392710', null, '0', '1', '2017-11-30 22:45:36');
INSERT INTO `roominfo` VALUES ('1253', '10009', 'AF2FBBVGM3301800003011604', '', '永乐城3幢', '1单元', '1604', '永乐城3幢1单元1604', '黄昕', null, '13757184225', null, '0', '1', '2017-11-30 22:45:36');
INSERT INTO `roominfo` VALUES ('1254', '10009', 'AF2FBBVGM3301800003011701', '', '永乐城3幢', '1单元', '1701', '永乐城3幢1单元1701', '刘金华', null, '13958099326', null, '0', '1', '2017-11-30 22:45:36');
INSERT INTO `roominfo` VALUES ('1255', '10009', 'AF2FBBVGM3301800003011702', '', '永乐城3幢', '1单元', '1702', '永乐城3幢1单元1702', '董继星', null, '15618855331', null, '0', '1', '2017-11-30 22:45:36');
INSERT INTO `roominfo` VALUES ('1256', '10009', 'AF2FBBVGM3301800003011703', '', '永乐城3幢', '1单元', '1703', '永乐城3幢1单元1703', '朱家良', null, '13355782930', null, '0', '1', '2017-11-30 22:45:37');
INSERT INTO `roominfo` VALUES ('1257', '10009', 'AF2FBBVGM3301800003011704', '', '永乐城3幢', '1单元', '1704', '永乐城3幢1单元1704', '李卫斌', null, '13675825299', null, '0', '1', '2017-11-30 22:45:37');
INSERT INTO `roominfo` VALUES ('1258', '10009', 'AF2FBBVGM3301800003011801', '', '永乐城3幢', '1单元', '1801', '永乐城3幢1单元1801', '吴程恺', null, '18814848068', null, '0', '1', '2017-11-30 22:45:37');
INSERT INTO `roominfo` VALUES ('1259', '10009', 'AF2FBBVGM3301800003011802', '', '永乐城3幢', '1单元', '1802', '永乐城3幢1单元1802', '蔡侃侃', null, '13758102836', null, '0', '1', '2017-11-30 22:45:37');
INSERT INTO `roominfo` VALUES ('1260', '10009', 'AF2FBBVGM3301800003011803', '', '永乐城3幢', '1单元', '1803', '永乐城3幢1单元1803', '叶永良', null, '13575626525', null, '0', '1', '2017-11-30 22:45:38');
INSERT INTO `roominfo` VALUES ('1261', '10009', 'AF2FBBVGM3301800003011804', '', '永乐城3幢', '1单元', '1804', '永乐城3幢1单元1804', '邓志豪', null, '15558088180', null, '0', '1', '2017-11-30 22:45:38');
INSERT INTO `roominfo` VALUES ('1262', '10009', 'AF2FBBVGM3301800003011901', '', '永乐城3幢', '1单元', '1901', '永乐城3幢1单元1901', '叶信炯', null, '15601839133', null, '0', '1', '2017-11-30 22:45:38');
INSERT INTO `roominfo` VALUES ('1263', '10009', 'AF2FBBVGM3301800003011902', '', '永乐城3幢', '1单元', '1902', '永乐城3幢1单元1902', '姚飞飞', null, '18868407668', null, '0', '1', '2017-11-30 22:45:39');
INSERT INTO `roominfo` VALUES ('1264', '10009', 'AF2FBBVGM3301800003011903', '', '永乐城3幢', '1单元', '1903', '永乐城3幢1单元1903', '张明', null, '13567658181', null, '0', '1', '2017-11-30 22:45:39');
INSERT INTO `roominfo` VALUES ('1265', '10009', 'AF2FBBVGM3301800003011904', '', '永乐城3幢', '1单元', '1904', '永乐城3幢1单元1904', '田洪飞', null, '13634141196', null, '0', '1', '2017-11-30 22:45:39');
INSERT INTO `roominfo` VALUES ('1266', '10009', 'AF2FBBVGM3301800003012001', '', '永乐城3幢', '1单元', '2001', '永乐城3幢1单元2001', '方艺', null, '18358132288', null, '0', '1', '2017-11-30 22:45:39');
INSERT INTO `roominfo` VALUES ('1267', '10009', 'AF2FBBVGM3301800003012002', '', '永乐城3幢', '1单元', '2002', '永乐城3幢1单元2002', '王佳琦', null, '18691567114', null, '0', '1', '2017-11-30 22:45:40');
INSERT INTO `roominfo` VALUES ('1268', '10009', 'AF2FBBVGM3301800003012003', '', '永乐城3幢', '1单元', '2003', '永乐城3幢1单元2003', '李潇', null, '15990392501', null, '0', '1', '2017-11-30 22:45:40');
INSERT INTO `roominfo` VALUES ('1269', '10009', 'AF2FBBVGM3301800003012004', '', '永乐城3幢', '1单元', '2004', '永乐城3幢1单元2004', '杨向勇', null, '18665869723', null, '0', '1', '2017-11-30 22:45:40');
INSERT INTO `roominfo` VALUES ('1270', '10009', 'AF2FBBVGM3301800003012101', '', '永乐城3幢', '1单元', '2101', '永乐城3幢1单元2101', '吕航', null, '13456968665', null, '0', '1', '2017-11-30 22:45:40');
INSERT INTO `roominfo` VALUES ('1271', '10009', 'AF2FBBVGM3301800003012102', '', '永乐城3幢', '1单元', '2102', '永乐城3幢1单元2102', '孙艳霞', null, '13868131100', null, '0', '1', '2017-11-30 22:45:41');
INSERT INTO `roominfo` VALUES ('1272', '10009', 'AF2FBBVGM3301800003012103', '', '永乐城3幢', '1单元', '2103', '永乐城3幢1单元2103', '江丹萍', null, '13858633936', null, '0', '1', '2017-11-30 22:45:41');
INSERT INTO `roominfo` VALUES ('1273', '10009', 'AF2FBBVGM3301800003012104', '', '永乐城3幢', '1单元', '2104', '永乐城3幢1单元2104', '颜盈盈', null, '13606808345', null, '0', '1', '2017-11-30 22:45:41');
INSERT INTO `roominfo` VALUES ('1274', '10009', 'AF2FBBVGM3301800003012201', '', '永乐城3幢', '1单元', '2201', '永乐城3幢1单元2201', '', null, '', null, '0', '1', '2017-11-30 22:45:42');
INSERT INTO `roominfo` VALUES ('1275', '10009', 'AF2FBBVGM3301800003012202', '', '永乐城3幢', '1单元', '2202', '永乐城3幢1单元2202', '施彤云', null, '13858158065', null, '0', '1', '2017-11-30 22:45:42');
INSERT INTO `roominfo` VALUES ('1276', '10009', 'AF2FBBVGM3301800003012203', '', '永乐城3幢', '1单元', '2203', '永乐城3幢1单元2203', '李孙鹏', null, '13566194472', null, '0', '1', '2017-11-30 22:45:42');
INSERT INTO `roominfo` VALUES ('1277', '10009', 'AF2FBBVGM3301800003012204', '', '永乐城3幢', '1单元', '2204', '永乐城3幢1单元2204', '朱彦君', null, '18868879309', null, '0', '1', '2017-11-30 22:45:42');
INSERT INTO `roominfo` VALUES ('1278', '10009', 'AF2FBBVGM3301800003012301', '', '永乐城3幢', '1单元', '2301', '永乐城3幢1单元2301', '', null, '', null, '0', '1', '2017-11-30 22:45:43');
INSERT INTO `roominfo` VALUES ('1279', '10009', 'AF2FBBVGM3301800003012302', '', '永乐城3幢', '1单元', '2302', '永乐城3幢1单元2302', '葛晓云', null, '13037817991', null, '0', '1', '2017-11-30 22:45:43');
INSERT INTO `roominfo` VALUES ('1280', '10009', 'AF2FBBVGM3301800003012303', '', '永乐城3幢', '1单元', '2303', '永乐城3幢1单元2303', '刘翀', null, '15267143603', null, '0', '1', '2017-11-30 22:45:43');
INSERT INTO `roominfo` VALUES ('1281', '10009', 'AF2FBBVGM3301800003012304', '', '永乐城3幢', '1单元', '2304', '永乐城3幢1单元2304', '詹秋娥', null, '13656686127', null, '0', '1', '2017-11-30 22:45:43');
INSERT INTO `roominfo` VALUES ('1282', '10009', 'AF2FBBVGM3301800003012401', '', '永乐城3幢', '1单元', '2401', '永乐城3幢1单元2401', '杨征', null, '13516721866', null, '0', '1', '2017-11-30 22:45:44');
INSERT INTO `roominfo` VALUES ('1283', '10009', 'AF2FBBVGM3301800003012402', '', '永乐城3幢', '1单元', '2402', '永乐城3幢1单元2402', '陈国章', null, '15201206672', null, '0', '1', '2017-11-30 22:45:44');
INSERT INTO `roominfo` VALUES ('1284', '10009', 'AF2FBBVGM3301800003012403', '', '永乐城3幢', '1单元', '2403', '永乐城3幢1单元2403', '刘继', null, '13777497956', null, '0', '1', '2017-11-30 22:45:44');
INSERT INTO `roominfo` VALUES ('1285', '10009', 'AF2FBBVGM3301800003012404', '', '永乐城3幢', '1单元', '2404', '永乐城3幢1单元2404', '余稳定', null, '15828583043', null, '0', '1', '2017-11-30 22:45:45');
INSERT INTO `roominfo` VALUES ('1286', '10009', 'AF2FBBVGM3301800003012501', '', '永乐城3幢', '1单元', '2501', '永乐城3幢1单元2501', '王贤达', null, '18860913088', null, '0', '1', '2017-11-30 22:45:45');
INSERT INTO `roominfo` VALUES ('1287', '10009', 'AF2FBBVGM3301800003012502', '', '永乐城3幢', '1单元', '2502', '永乐城3幢1单元2502', '毛倩娅', null, '15968814105', null, '0', '1', '2017-11-30 22:45:45');
INSERT INTO `roominfo` VALUES ('1288', '10009', 'AF2FBBVGM3301800003012503', '', '永乐城3幢', '1单元', '2503', '永乐城3幢1单元2503', '初盈洲', null, '17767107517', null, '0', '1', '2017-11-30 22:45:45');
INSERT INTO `roominfo` VALUES ('1289', '10009', 'AF2FBBVGM3301800003012504', '', '永乐城3幢', '1单元', '2504', '永乐城3幢1单元2504', '黄勇', null, '13588062849', null, '0', '1', '2017-11-30 22:45:46');
INSERT INTO `roominfo` VALUES ('1290', '10009', 'AF2FBBVGM3301800003012601', '', '永乐城3幢', '1单元', '2601', '永乐城3幢1单元2601', '赵凌峰', null, '13764893378', null, '0', '1', '2017-11-30 22:45:46');
INSERT INTO `roominfo` VALUES ('1291', '10009', 'AF2FBBVGM3301800003012602', '', '永乐城3幢', '1单元', '2602', '永乐城3幢1单元2602', '林学票', null, '13906663230', null, '0', '1', '2017-11-30 22:45:46');
INSERT INTO `roominfo` VALUES ('1292', '10009', 'AF2FBBVGM3301800003012603', '', '永乐城3幢', '1单元', '2603', '永乐城3幢1单元2603', '吴梦雪', null, '13685740107', null, '0', '1', '2017-11-30 22:45:46');
INSERT INTO `roominfo` VALUES ('1293', '10009', 'AF2FBBVGM3301800003012604', '', '永乐城3幢', '1单元', '2604', '永乐城3幢1单元2604', '李会朋', null, '13675888662', null, '0', '1', '2017-11-30 22:45:47');
INSERT INTO `roominfo` VALUES ('1294', '10009', 'AF2FBBVGM3301800003012701', '', '永乐城3幢', '1单元', '2701', '永乐城3幢1单元2701', '', null, '', null, '0', '1', '2017-11-30 22:45:47');
INSERT INTO `roominfo` VALUES ('1295', '10009', 'AF2FBBVGM3301800003012702', '', '永乐城3幢', '1单元', '2702', '永乐城3幢1单元2702', '', null, '', null, '0', '1', '2017-11-30 22:45:47');
INSERT INTO `roominfo` VALUES ('1296', '10009', 'AF2FBBVGM3301800003012703', '', '永乐城3幢', '1单元', '2703', '永乐城3幢1单元2703', '', null, '', null, '0', '1', '2017-11-30 22:45:48');
INSERT INTO `roominfo` VALUES ('1297', '10009', 'AF2FBBVGM3301800003012704', '', '永乐城3幢', '1单元', '2704', '永乐城3幢1单元2704', '', null, '', null, '0', '1', '2017-11-30 22:45:48');
INSERT INTO `roominfo` VALUES ('1298', '10009', 'AF2FBBVGM3301800003020301', '', '永乐城3幢', '2单元', '301', '永乐城3幢2单元301', '黄仁书', null, '15221171115', null, '0', '1', '2017-11-30 22:45:48');
INSERT INTO `roominfo` VALUES ('1299', '10009', 'AF2FBBVGM3301800003020302', '', '永乐城3幢', '2单元', '302', '永乐城3幢2单元302', '杨欣', null, '15306580050', null, '0', '1', '2017-11-30 22:45:48');
INSERT INTO `roominfo` VALUES ('1300', '10009', 'AF2FBBVGM3301800003020303', '', '永乐城3幢', '2单元', '303', '永乐城3幢2单元303', '李善睿', null, '18069878081', null, '0', '1', '2017-11-30 22:45:49');
INSERT INTO `roominfo` VALUES ('1301', '10009', 'AF2FBBVGM3301800003020304', '', '永乐城3幢', '2单元', '304', '永乐城3幢2单元304', '樊玉军', null, '13066952563', null, '0', '1', '2017-11-30 22:45:49');
INSERT INTO `roominfo` VALUES ('1302', '10009', 'AF2FBBVGM3301800003020401', '', '永乐城3幢', '2单元', '401', '永乐城3幢2单元401', '王玥', null, '18688831358', null, '0', '1', '2017-11-30 22:45:49');
INSERT INTO `roominfo` VALUES ('1303', '10009', 'AF2FBBVGM3301800003020402', '', '永乐城3幢', '2单元', '402', '永乐城3幢2单元402', '', null, '', null, '0', '1', '2017-11-30 22:45:49');
INSERT INTO `roominfo` VALUES ('1304', '10009', 'AF2FBBVGM3301800003020403', '', '永乐城3幢', '2单元', '403', '永乐城3幢2单元403', '马晓卿', null, '15967196700', null, '0', '1', '2017-11-30 22:45:50');
INSERT INTO `roominfo` VALUES ('1305', '10009', 'AF2FBBVGM3301800003020404', '', '永乐城3幢', '2单元', '404', '永乐城3幢2单元404', '段山峰', null, '13606632435', null, '0', '1', '2017-11-30 22:45:50');
INSERT INTO `roominfo` VALUES ('1306', '10009', 'AF2FBBVGM3301800003020501', '', '永乐城3幢', '2单元', '501', '永乐城3幢2单元501', '鲁长红', null, '13805633582', null, '0', '1', '2017-11-30 22:45:50');
INSERT INTO `roominfo` VALUES ('1307', '10009', 'AF2FBBVGM3301800003020502', '', '永乐城3幢', '2单元', '502', '永乐城3幢2单元502', '', null, '', null, '0', '1', '2017-11-30 22:45:51');
INSERT INTO `roominfo` VALUES ('1308', '10009', 'AF2FBBVGM3301800003020503', '', '永乐城3幢', '2单元', '503', '永乐城3幢2单元503', '杨阳', null, '15168228555', null, '0', '1', '2017-11-30 22:45:51');
INSERT INTO `roominfo` VALUES ('1309', '10009', 'AF2FBBVGM3301800003020504', '', '永乐城3幢', '2单元', '504', '永乐城3幢2单元504', '王吓利', null, '18667932670', null, '0', '1', '2017-11-30 22:45:51');
INSERT INTO `roominfo` VALUES ('1310', '10009', 'AF2FBBVGM3301800003020601', '', '永乐城3幢', '2单元', '601', '永乐城3幢2单元601', '毛家辉', null, '13707032072', null, '0', '1', '2017-11-30 22:45:52');
INSERT INTO `roominfo` VALUES ('1311', '10009', 'AF2FBBVGM3301800003020602', '', '永乐城3幢', '2单元', '602', '永乐城3幢2单元602', '郭钧道', null, '18019099916', null, '0', '1', '2017-11-30 22:45:52');
INSERT INTO `roominfo` VALUES ('1312', '10009', 'AF2FBBVGM3301800003020603', '', '永乐城3幢', '2单元', '603', '永乐城3幢2单元603', '许文华', null, '18009919865', null, '0', '1', '2017-11-30 22:45:52');
INSERT INTO `roominfo` VALUES ('1313', '10009', 'AF2FBBVGM3301800003020604', '', '永乐城3幢', '2单元', '604', '永乐城3幢2单元604', '汪金柬', null, '18258171512', null, '0', '1', '2017-11-30 22:45:52');
INSERT INTO `roominfo` VALUES ('1314', '10009', 'AF2FBBVGM3301800003020701', '', '永乐城3幢', '2单元', '701', '永乐城3幢2单元701', '许琦', null, '15921098679', null, '0', '1', '2017-11-30 22:45:53');
INSERT INTO `roominfo` VALUES ('1315', '10009', 'AF2FBBVGM3301800003020702', '', '永乐城3幢', '2单元', '702', '永乐城3幢2单元702', '', null, '', null, '0', '1', '2017-11-30 22:45:53');
INSERT INTO `roominfo` VALUES ('1316', '10009', 'AF2FBBVGM3301800003020703', '', '永乐城3幢', '2单元', '703', '永乐城3幢2单元703', '杨萌', null, '18142003546', null, '0', '1', '2017-11-30 22:45:53');
INSERT INTO `roominfo` VALUES ('1317', '10009', 'AF2FBBVGM3301800003020704', '', '永乐城3幢', '2单元', '704', '永乐城3幢2单元704', '丁必顺', null, '15088692177', null, '0', '1', '2017-11-30 22:45:53');
INSERT INTO `roominfo` VALUES ('1318', '10009', 'AF2FBBVGM3301800003020801', '', '永乐城3幢', '2单元', '801', '永乐城3幢2单元801', '李铭勋', null, '18045067679', null, '0', '1', '2017-11-30 22:45:54');
INSERT INTO `roominfo` VALUES ('1319', '10009', 'AF2FBBVGM3301800003020802', '', '永乐城3幢', '2单元', '802', '永乐城3幢2单元802', '王铭安', null, '18045067679', null, '0', '1', '2017-11-30 22:45:54');
INSERT INTO `roominfo` VALUES ('1320', '10009', 'AF2FBBVGM3301800003020803', '', '永乐城3幢', '2单元', '803', '永乐城3幢2单元803', '张颖', null, '17681950677', null, '0', '1', '2017-11-30 22:45:54');
INSERT INTO `roominfo` VALUES ('1321', '10009', 'AF2FBBVGM3301800003020804', '', '永乐城3幢', '2单元', '804', '永乐城3幢2单元804', '汪新彪', null, '13738100138', null, '0', '1', '2017-11-30 22:45:54');
INSERT INTO `roominfo` VALUES ('1322', '10009', 'AF2FBBVGM3301800003020901', '', '永乐城3幢', '2单元', '901', '永乐城3幢2单元901', '张慧巧', null, '18768133793', null, '0', '1', '2017-11-30 22:45:55');
INSERT INTO `roominfo` VALUES ('1323', '10009', 'AF2FBBVGM3301800003020902', '', '永乐城3幢', '2单元', '902', '永乐城3幢2单元902', '陈永戬', null, '15921713690', null, '0', '1', '2017-11-30 22:45:55');
INSERT INTO `roominfo` VALUES ('1324', '10009', 'AF2FBBVGM3301800003020903', '', '永乐城3幢', '2单元', '903', '永乐城3幢2单元903', '朱冠伍', null, '15967137747', null, '0', '1', '2017-11-30 22:45:55');
INSERT INTO `roominfo` VALUES ('1325', '10009', 'AF2FBBVGM3301800003020904', '', '永乐城3幢', '2单元', '904', '永乐城3幢2单元904', '王祖熙', null, '18989459299', null, '0', '1', '2017-11-30 22:45:55');
INSERT INTO `roominfo` VALUES ('1326', '10009', 'AF2FBBVGM3301800003021001', '', '永乐城3幢', '2单元', '1001', '永乐城3幢2单元1001', '楼阳清', null, '15868955777', null, '0', '1', '2017-11-30 22:45:56');
INSERT INTO `roominfo` VALUES ('1327', '10009', 'AF2FBBVGM3301800003021002', '', '永乐城3幢', '2单元', '1002', '永乐城3幢2单元1002', '李希朋', null, '15201953659', null, '0', '1', '2017-11-30 22:45:56');
INSERT INTO `roominfo` VALUES ('1328', '10009', 'AF2FBBVGM3301800003021003', '', '永乐城3幢', '2单元', '1003', '永乐城3幢2单元1003', '崔秀玲', null, '13512194467', null, '0', '1', '2017-11-30 22:45:56');
INSERT INTO `roominfo` VALUES ('1329', '10009', 'AF2FBBVGM3301800003021004', '', '永乐城3幢', '2单元', '1004', '永乐城3幢2单元1004', '肖凯', null, '17606530195', null, '0', '1', '2017-11-30 22:45:56');
INSERT INTO `roominfo` VALUES ('1330', '10009', 'AF2FBBVGM3301800003021101', '', '永乐城3幢', '2单元', '1101', '永乐城3幢2单元1101', '龚晓荣', null, '13167276510', null, '0', '1', '2017-11-30 22:45:57');
INSERT INTO `roominfo` VALUES ('1331', '10009', 'AF2FBBVGM3301800003021102', '', '永乐城3幢', '2单元', '1102', '永乐城3幢2单元1102', '许漭', null, '18955774585', null, '0', '1', '2017-11-30 22:45:57');
INSERT INTO `roominfo` VALUES ('1332', '10009', 'AF2FBBVGM3301800003021103', '', '永乐城3幢', '2单元', '1103', '永乐城3幢2单元1103', '刘毅', null, '13858142242', null, '0', '1', '2017-11-30 22:45:57');
INSERT INTO `roominfo` VALUES ('1333', '10009', 'AF2FBBVGM3301800003021104', '', '永乐城3幢', '2单元', '1104', '永乐城3幢2单元1104', '卢鹏升', null, '18668009280', null, '0', '1', '2017-11-30 22:45:57');
INSERT INTO `roominfo` VALUES ('1334', '10009', 'AF2FBBVGM3301800003021201', '', '永乐城3幢', '2单元', '1201', '永乐城3幢2单元1201', '陈松林', null, '13524560938', null, '0', '1', '2017-11-30 22:45:58');
INSERT INTO `roominfo` VALUES ('1335', '10009', 'AF2FBBVGM3301800003021202', '', '永乐城3幢', '2单元', '1202', '永乐城3幢2单元1202', '曾丽珍', null, '13817159485', null, '0', '1', '2017-11-30 22:45:58');
INSERT INTO `roominfo` VALUES ('1336', '10009', 'AF2FBBVGM3301800003021203', '', '永乐城3幢', '2单元', '1203', '永乐城3幢2单元1203', '高磊', null, '15695889918', null, '0', '1', '2017-11-30 22:45:58');
INSERT INTO `roominfo` VALUES ('1337', '10009', 'AF2FBBVGM3301800003021204', '', '永乐城3幢', '2单元', '1204', '永乐城3幢2单元1204', '陈忠青', null, '15967788896', null, '0', '1', '2017-11-30 22:45:59');
INSERT INTO `roominfo` VALUES ('1338', '10009', 'AF2FBBVGM3301800003021301', '', '永乐城3幢', '2单元', '1301', '永乐城3幢2单元1301', '陈云桂', null, '13761701726', null, '0', '1', '2017-11-30 22:45:59');
INSERT INTO `roominfo` VALUES ('1339', '10009', 'AF2FBBVGM3301800003021302', '', '永乐城3幢', '2单元', '1302', '永乐城3幢2单元1302', '李晓虹', null, '18668006236', null, '0', '1', '2017-11-30 22:45:59');
INSERT INTO `roominfo` VALUES ('1340', '10009', 'AF2FBBVGM3301800003021303', '', '永乐城3幢', '2单元', '1303', '永乐城3幢2单元1303', '陈曦', null, '13758194228', null, '0', '1', '2017-11-30 22:45:59');
INSERT INTO `roominfo` VALUES ('1341', '10009', 'AF2FBBVGM3301800003021304', '', '永乐城3幢', '2单元', '1304', '永乐城3幢2单元1304', '石莹莹', null, '18611840685', null, '0', '1', '2017-11-30 22:46:00');
INSERT INTO `roominfo` VALUES ('1342', '10009', 'AF2FBBVGM3301800003021401', '', '永乐城3幢', '2单元', '1401', '永乐城3幢2单元1401', '叶一舟', null, '13818205756', null, '0', '1', '2017-11-30 22:46:00');
INSERT INTO `roominfo` VALUES ('1343', '10009', 'AF2FBBVGM3301800003021402', '', '永乐城3幢', '2单元', '1402', '永乐城3幢2单元1402', '王寿英', null, '13965618068', null, '0', '1', '2017-11-30 22:46:00');
INSERT INTO `roominfo` VALUES ('1344', '10009', 'AF2FBBVGM3301800003021403', '', '永乐城3幢', '2单元', '1403', '永乐城3幢2单元1403', '王曼蝶', null, '18602504493', null, '0', '1', '2017-11-30 22:46:00');
INSERT INTO `roominfo` VALUES ('1345', '10009', 'AF2FBBVGM3301800003021404', '', '永乐城3幢', '2单元', '1404', '永乐城3幢2单元1404', '陈明', null, '18768464905', null, '0', '1', '2017-11-30 22:46:01');
INSERT INTO `roominfo` VALUES ('1346', '10009', 'AF2FBBVGM3301800003021501', '', '永乐城3幢', '2单元', '1501', '永乐城3幢2单元1501', '郑爱华', null, '13858781855', null, '0', '1', '2017-11-30 22:46:01');
INSERT INTO `roominfo` VALUES ('1347', '10009', 'AF2FBBVGM3301800003021502', '', '永乐城3幢', '2单元', '1502', '永乐城3幢2单元1502', '高建', null, '13813935013', null, '0', '1', '2017-11-30 22:46:01');
INSERT INTO `roominfo` VALUES ('1348', '10009', 'AF2FBBVGM3301800003021503', '', '永乐城3幢', '2单元', '1503', '永乐城3幢2单元1503', '朱力', null, '13082836539', null, '0', '1', '2017-11-30 22:46:01');
INSERT INTO `roominfo` VALUES ('1349', '10009', 'AF2FBBVGM3301800003021504', '', '永乐城3幢', '2单元', '1504', '永乐城3幢2单元1504', '罗晶', null, '18668231533', null, '0', '1', '2017-11-30 22:46:02');
INSERT INTO `roominfo` VALUES ('1350', '10009', 'AF2FBBVGM3301800003021601', '', '永乐城3幢', '2单元', '1601', '永乐城3幢2单元1601', '', null, '', null, '0', '1', '2017-11-30 22:46:02');
INSERT INTO `roominfo` VALUES ('1351', '10009', 'AF2FBBVGM3301800003021602', '', '永乐城3幢', '2单元', '1602', '永乐城3幢2单元1602', '周仲浩', null, '13600566265', null, '0', '1', '2017-11-30 22:46:02');
INSERT INTO `roominfo` VALUES ('1352', '10009', 'AF2FBBVGM3301800003021603', '', '永乐城3幢', '2单元', '1603', '永乐城3幢2单元1603', '毛红燕', null, '', null, '0', '1', '2017-11-30 22:46:02');
INSERT INTO `roominfo` VALUES ('1353', '10009', 'AF2FBBVGM3301800003021604', '', '永乐城3幢', '2单元', '1604', '永乐城3幢2单元1604', '王小琼', null, '13758272975', null, '0', '1', '2017-11-30 22:46:03');
INSERT INTO `roominfo` VALUES ('1354', '10009', 'AF2FBBVGM3301800003021701', '', '永乐城3幢', '2单元', '1701', '永乐城3幢2单元1701', '王毅', null, '13757838533', null, '0', '1', '2017-11-30 22:46:03');
INSERT INTO `roominfo` VALUES ('1355', '10009', 'AF2FBBVGM3301800003021702', '', '永乐城3幢', '2单元', '1702', '永乐城3幢2单元1702', '许谙', null, '13600566263', null, '0', '1', '2017-11-30 22:46:03');
INSERT INTO `roominfo` VALUES ('1356', '10009', 'AF2FBBVGM3301800003021703', '', '永乐城3幢', '2单元', '1703', '永乐城3幢2单元1703', '梅美英', null, '13606506021', null, '0', '1', '2017-11-30 22:46:04');
INSERT INTO `roominfo` VALUES ('1357', '10009', 'AF2FBBVGM3301800003021704', '', '永乐城3幢', '2单元', '1704', '永乐城3幢2单元1704', '席德武', null, '13675812723', null, '0', '1', '2017-11-30 22:46:04');
INSERT INTO `roominfo` VALUES ('1358', '10009', 'AF2FBBVGM3301800003021801', '', '永乐城3幢', '2单元', '1801', '永乐城3幢2单元1801', '', null, '', null, '0', '1', '2017-11-30 22:46:04');
INSERT INTO `roominfo` VALUES ('1359', '10009', 'AF2FBBVGM3301800003021802', '', '永乐城3幢', '2单元', '1802', '永乐城3幢2单元1802', '游文琳', null, '13754310066', null, '0', '1', '2017-11-30 22:46:04');
INSERT INTO `roominfo` VALUES ('1360', '10009', 'AF2FBBVGM3301800003021803', '', '永乐城3幢', '2单元', '1803', '永乐城3幢2单元1803', '贾雪峰', null, '18657103900', null, '0', '1', '2017-11-30 22:46:05');
INSERT INTO `roominfo` VALUES ('1361', '10009', 'AF2FBBVGM3301800003021804', '', '永乐城3幢', '2单元', '1804', '永乐城3幢2单元1804', '陆晓杰', null, '13255718078', null, '0', '1', '2017-11-30 22:46:05');
INSERT INTO `roominfo` VALUES ('1362', '10009', 'AF2FBBVGM3301800003021901', '', '永乐城3幢', '2单元', '1901', '永乐城3幢2单元1901', '毛冬明', null, '15821600516', null, '0', '1', '2017-11-30 22:46:05');
INSERT INTO `roominfo` VALUES ('1363', '10009', 'AF2FBBVGM3301800003021902', '', '永乐城3幢', '2单元', '1902', '永乐城3幢2单元1902', '臧立涛', null, '15869161476', null, '0', '1', '2017-11-30 22:46:05');
INSERT INTO `roominfo` VALUES ('1364', '10009', 'AF2FBBVGM3301800003021903', '', '永乐城3幢', '2单元', '1903', '永乐城3幢2单元1903', '许波', null, '13858019689', null, '0', '1', '2017-11-30 22:46:06');
INSERT INTO `roominfo` VALUES ('1365', '10009', 'AF2FBBVGM3301800003021904', '', '永乐城3幢', '2单元', '1904', '永乐城3幢2单元1904', '邓才兵', null, '13516825980', null, '0', '1', '2017-11-30 22:46:06');
INSERT INTO `roominfo` VALUES ('1366', '10009', 'AF2FBBVGM3301800003022001', '', '永乐城3幢', '2单元', '2001', '永乐城3幢2单元2001', '蒋晓云', null, '13605651565', null, '0', '1', '2017-11-30 22:46:06');
INSERT INTO `roominfo` VALUES ('1367', '10009', 'AF2FBBVGM3301800003022002', '', '永乐城3幢', '2单元', '2002', '永乐城3幢2单元2002', '夏梅', null, '15856909990', null, '0', '1', '2017-11-30 22:46:06');
INSERT INTO `roominfo` VALUES ('1368', '10009', 'AF2FBBVGM3301800003022003', '', '永乐城3幢', '2单元', '2003', '永乐城3幢2单元2003', '胡隆杰', null, '18324499463', null, '0', '1', '2017-11-30 22:46:07');
INSERT INTO `roominfo` VALUES ('1369', '10009', 'AF2FBBVGM3301800003022004', '', '永乐城3幢', '2单元', '2004', '永乐城3幢2单元2004', '郭建行', null, '18601779683', null, '0', '1', '2017-11-30 22:46:07');
INSERT INTO `roominfo` VALUES ('1370', '10009', 'AF2FBBVGM3301800003022101', '', '永乐城3幢', '2单元', '2101', '永乐城3幢2单元2101', '', null, '', null, '0', '1', '2017-11-30 22:46:07');
INSERT INTO `roominfo` VALUES ('1371', '10009', 'AF2FBBVGM3301800003022102', '', '永乐城3幢', '2单元', '2102', '永乐城3幢2单元2102', '陈大章', null, '13816688365', null, '0', '1', '2017-11-30 22:46:07');
INSERT INTO `roominfo` VALUES ('1372', '10009', 'AF2FBBVGM3301800003022103', '', '永乐城3幢', '2单元', '2103', '永乐城3幢2单元2103', '廖瑜', null, '', null, '0', '1', '2017-11-30 22:46:08');
INSERT INTO `roominfo` VALUES ('1373', '10009', 'AF2FBBVGM3301800003022104', '', '永乐城3幢', '2单元', '2104', '永乐城3幢2单元2104', '仲天庭', null, '15250720126', null, '0', '1', '2017-11-30 22:46:08');
INSERT INTO `roominfo` VALUES ('1374', '10009', 'AF2FBBVGM3301800003022201', '', '永乐城3幢', '2单元', '2201', '永乐城3幢2单元2201', '蔡宗旭', null, '15921202956', null, '0', '1', '2017-11-30 22:46:08');
INSERT INTO `roominfo` VALUES ('1375', '10009', 'AF2FBBVGM3301800003022202', '', '永乐城3幢', '2单元', '2202', '永乐城3幢2单元2202', '姜烨煊', null, '13305779879', null, '0', '1', '2017-11-30 22:46:09');
INSERT INTO `roominfo` VALUES ('1376', '10009', 'AF2FBBVGM3301800003022203', '', '永乐城3幢', '2单元', '2203', '永乐城3幢2单元2203', '倪雅', null, '18357130628', null, '0', '1', '2017-11-30 22:46:09');
INSERT INTO `roominfo` VALUES ('1377', '10009', 'AF2FBBVGM3301800003022204', '', '永乐城3幢', '2单元', '2204', '永乐城3幢2单元2204', '曹宏宏', null, '18357766656', null, '0', '1', '2017-11-30 22:46:09');
INSERT INTO `roominfo` VALUES ('1378', '10009', 'AF2FBBVGM3301800003022301', '', '永乐城3幢', '2单元', '2301', '永乐城3幢2单元2301', '余家荣', null, '15618393949', null, '0', '1', '2017-11-30 22:46:09');
INSERT INTO `roominfo` VALUES ('1379', '10009', 'AF2FBBVGM3301800003022302', '', '永乐城3幢', '2单元', '2302', '永乐城3幢2单元2302', '谢许香', null, '18621521805', null, '0', '1', '2017-11-30 22:46:10');
INSERT INTO `roominfo` VALUES ('1380', '10009', 'AF2FBBVGM3301800003022303', '', '永乐城3幢', '2单元', '2303', '永乐城3幢2单元2303', '陈静', null, '13588860123', null, '0', '1', '2017-11-30 22:46:10');
INSERT INTO `roominfo` VALUES ('1381', '10009', 'AF2FBBVGM3301800003022304', '', '永乐城3幢', '2单元', '2304', '永乐城3幢2单元2304', '曹光者', null, '13906774018', null, '0', '1', '2017-11-30 22:46:10');
INSERT INTO `roominfo` VALUES ('1382', '10009', 'AF2FBBVGM3301800003022401', '', '永乐城3幢', '2单元', '2401', '永乐城3幢2单元2401', '廖娅伶', null, '13764491774', null, '0', '1', '2017-11-30 22:46:10');
INSERT INTO `roominfo` VALUES ('1383', '10009', 'AF2FBBVGM3301800003022402', '', '永乐城3幢', '2单元', '2402', '永乐城3幢2单元2402', '彭涛', null, '13816277463', null, '0', '1', '2017-11-30 22:46:11');
INSERT INTO `roominfo` VALUES ('1384', '10009', 'AF2FBBVGM3301800003022403', '', '永乐城3幢', '2单元', '2403', '永乐城3幢2单元2403', '', null, '', null, '0', '1', '2017-11-30 22:46:11');
INSERT INTO `roominfo` VALUES ('1385', '10009', 'AF2FBBVGM3301800003022404', '', '永乐城3幢', '2单元', '2404', '永乐城3幢2单元2404', '李响', null, '18521561923', null, '0', '1', '2017-11-30 22:46:11');
INSERT INTO `roominfo` VALUES ('1386', '10009', 'AF2FBBVGM3301800003022501', '', '永乐城3幢', '2单元', '2501', '永乐城3幢2单元2501', '金莹', null, '13817467771', null, '0', '1', '2017-11-30 22:46:11');
INSERT INTO `roominfo` VALUES ('1387', '10009', 'AF2FBBVGM3301800003022502', '', '永乐城3幢', '2单元', '2502', '永乐城3幢2单元2502', '徐永彪', null, '18858154326', null, '0', '1', '2017-11-30 22:46:12');
INSERT INTO `roominfo` VALUES ('1388', '10009', 'AF2FBBVGM3301800003022503', '', '永乐城3幢', '2单元', '2503', '永乐城3幢2单元2503', '王文江', null, '15820783527', null, '0', '1', '2017-11-30 22:46:12');
INSERT INTO `roominfo` VALUES ('1389', '10009', 'AF2FBBVGM3301800003022504', '', '永乐城3幢', '2单元', '2504', '永乐城3幢2单元2504', '高君', null, '18057150263', null, '0', '1', '2017-11-30 22:46:12');
INSERT INTO `roominfo` VALUES ('1390', '10009', 'AF2FBBVGM3301800003022601', '', '永乐城3幢', '2单元', '2601', '永乐城3幢2单元2601', '胡甬江', null, '13917901470', null, '0', '1', '2017-11-30 22:46:12');
INSERT INTO `roominfo` VALUES ('1391', '10009', 'AF2FBBVGM3301800003022602', '', '永乐城3幢', '2单元', '2602', '永乐城3幢2单元2602', '李晖', null, '13764491774', null, '0', '1', '2017-11-30 22:46:13');
INSERT INTO `roominfo` VALUES ('1392', '10009', 'AF2FBBVGM3301800003022603', '', '永乐城3幢', '2单元', '2603', '永乐城3幢2单元2603', '周玲', null, '13857325920', null, '0', '1', '2017-11-30 22:46:13');
INSERT INTO `roominfo` VALUES ('1393', '10009', 'AF2FBBVGM3301800003022604', '', '永乐城3幢', '2单元', '2604', '永乐城3幢2单元2604', '陈一俊', null, '13858023411', null, '0', '1', '2017-11-30 22:46:13');
INSERT INTO `roominfo` VALUES ('1394', '10009', 'AF2FBBVGM3301800003022701', '', '永乐城3幢', '2单元', '2701', '永乐城3幢2单元2701', '', null, '', null, '0', '1', '2017-11-30 22:46:13');
INSERT INTO `roominfo` VALUES ('1395', '10009', 'AF2FBBVGM3301800003022702', '', '永乐城3幢', '2单元', '2702', '永乐城3幢2单元2702', '', null, '', null, '0', '1', '2017-11-30 22:46:14');
INSERT INTO `roominfo` VALUES ('1396', '10009', 'AF2FBBVGM3301800003022703', '', '永乐城3幢', '2单元', '2703', '永乐城3幢2单元2703', '', null, '', null, '0', '1', '2017-11-30 22:46:14');
INSERT INTO `roominfo` VALUES ('1397', '10009', 'AF2FBBVGM3301800003022704', '', '永乐城3幢', '2单元', '2704', '永乐城3幢2单元2704', '', null, '', null, '0', '1', '2017-11-30 22:46:14');
INSERT INTO `roominfo` VALUES ('1398', '10003', null, '', '1栋', '1单元', '1-01室', '1栋1单元1-01室', '张三', null, '13877777771', null, '0', '0', '2017-11-30 23:34:57');

-- ----------------------------
-- Table structure for serviceinfo
-- ----------------------------
DROP TABLE IF EXISTS `serviceinfo`;
CREATE TABLE `serviceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL COMMENT '区域',
  `contact_people` varchar(255) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `contact_address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级服务商id',
  `app_id` varchar(255) DEFAULT NULL COMMENT '应用ID,您的APPID',
  `merchant_private_key` varchar(2555) DEFAULT NULL COMMENT '商户私钥',
  `alipay_public_key` varchar(2555) DEFAULT NULL COMMENT '支付宝公钥',
  `return_url` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of serviceinfo
-- ----------------------------
INSERT INTO `serviceinfo` VALUES ('1', '001', '总公司', null, null, null, null, null, null, null, null, null, '2017-11-19 22:09:21');
INSERT INTO `serviceinfo` VALUES ('10', '0010002', '杭州早早科技有限公司', '杭州', '熊和砍', '', '', '1', '2017071807800670', 'MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJW2B/Wqka+T7s1HW/rFFKweF7fN+vtqmhkIvtXUoQi3+fiZKZjc1KHGLM8YS9BTUFNDcSvRva23qRlGp4ypbkl+QSx2spc0A2TKllVIBu9yWAvBIEVNBo3s8rRK1VWH8qKtMyYc2Q1rebeeEpFSJAjXGS99JS68GXo1QwDbH9kNAgMBAAECgYAHNHV5mzXbr1DkzDRfAzEVf3VAwUb85op3/fXBMLR3SPNcxXI9CxOonXL2nIK5iejpuOsvYq6wN5CJyN6zZEwMZpEXQ8ELhencbgYgBvBmvyPq5rnUb3MEt/W2B3EmgaCqYTfk0GWa50ybSh94ynBfK+DRy8NHYQg9kYzOfJt2gQJBAMUJ2wVR6PE2iK24jvcX/ajqE7kHRFf0T6bOKA4TRxxDMGNCH189RmXpxoPjrzsofKdh+qgvbLpz3e7cOG18Wp0CQQDCgqeSyxFecmmDvaDkn0Oj4GkgOdz6T23rsCfSVXWaBII0+nBlbWglQc/DwohTmdq8TBe6FnTfbOhDnIMo0DUxAkALXuQ6zF1K/kCo9cuaStIim0+ED/1LrheioqcBGO+zm9UBBWHWFy0m2HTSS6NjIJUA+9CBQCtgHyuhiyfeeZypAkBD4sfLgtYgCXxr/03dHPzFgDgQiEFolzo87PEpBqyRwYsUJGf/7kxP3IU/xHBCBUuDNmd9igLmS6NQnZplLy2xAkEAuIDbFGy34R8rEI5vXcqcMsn0tl5jBHSzbFcN1+3vz8dfudjl0RTqqpDXI1vtgbOph+NG3TVkSYbk0knjDNG15A==', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB', 'https://www.zaozaopay.com/rest/page/alipay_estate_return?id=10', '2017-11-30 20:16:07');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billaccount_id` int(11) DEFAULT NULL,
  `title_name` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `type` int(11) DEFAULT NULL COMMENT '发票类型0单位，1个人',
  `register_no` varchar(255) DEFAULT NULL COMMENT '税号',
  `amount` double(11,0) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户昵称',
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '部门id',
  `parent_code` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL COMMENT '是否启用',
  `type` int(11) DEFAULT NULL COMMENT '1代表服务商，2代表物业，3代表小区',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '管理员', 'admin', '123456', '1', '001', '99', '17784495260', 'wangsd@163.com', '1', null, '2017-11-19 22:08:54');
INSERT INTO `users` VALUES ('16', '杭州早早科技有限公司', '早早科技', '111111', '10', '0010002', '1', '', '', '1', '1', '2017-11-30 20:43:03');
INSERT INTO `users` VALUES ('17', '', '九堡肖苑', '111111', '10006', '001000200010003', '3', '', '', '1', '3', '2017-11-30 21:36:47');
INSERT INTO `users` VALUES ('18', '西溪永乐城', '西溪永乐城', '111111', '10009', '001000200010012', '3', '', '', '1', '3', '2017-12-03 13:28:26');
