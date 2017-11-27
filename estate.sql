/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : estate

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-11-27 23:26:02
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
  `bill_entry_amount` double(11,0) DEFAULT NULL COMMENT '应收金额',
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
  `ticketStatus` tinyint(1) DEFAULT '0' COMMENT '开票状态',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of billaccount
-- ----------------------------
INSERT INTO `billaccount` VALUES ('1011', '10003', '1020', '1', '100', '2017年11', '20171124', '20171130', null, '1', '2017-11-27 22:27:18', '1', '1', '0', null, null, '0', '0', '2017-11-25 21:50:33');
INSERT INTO `billaccount` VALUES ('1012', '10003', '1022', '1', '138', '2017年07', '20171123', '20171212', null, '1', null, null, '0', '0', null, null, '0', '0', '2017-11-25 21:55:56');
INSERT INTO `billaccount` VALUES ('1013', '10003', '1023', '1', '138', '2017年07', '20171123', '20171212', null, '1', null, null, '0', '0', null, null, '0', '0', '2017-11-25 21:55:56');
INSERT INTO `billaccount` VALUES ('1014', '10003', '1024', '1', '138', '2017年07', '20171123', '20171212', null, '1', null, null, '0', '0', null, null, '0', '0', '2017-11-25 21:55:56');
INSERT INTO `billaccount` VALUES ('1015', '10003', '1020', '2', '20', '2017年11', '20171120', '20171130', null, '1', '2017-11-27 22:27:18', '1', '0', '0', null, null, '0', '0', '2017-11-27 14:16:55');

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
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of housinginfo
-- ----------------------------
INSERT INTO `housinginfo` VALUES ('9', 'ABD44SPAQ5001', '001000100010005', '首创十方界1', '红枫路9号', '2000', '500112', '500100', '500000', '106.537212|29.605355', null, '0571-87654321', '10', '2', '0', '2017-11-20 15:53:22');
INSERT INTO `housinginfo` VALUES ('10001', null, '001000100010002', '问过', '', '2000', '未', '而我却', '22', '106.100356|29.695525', null, '235', null, '1', '1', '2017-11-22 11:27:29');
INSERT INTO `housinginfo` VALUES ('10002', null, '001000100010003', '尔额34', '', '2000', '34', '34', '34', '97.719676|31.370363', null, '344', null, '1', '1', '2017-11-22 11:27:50');
INSERT INTO `housinginfo` VALUES ('10003', 'AUROC82WN5001', '001000100010010', '莫须有小区', '红枫路9号', '2000', '500112', '500100', '500000', '106.536969|29.605632', null, '023-74583381', '50', '2', '0', '2017-11-22 15:13:25');
INSERT INTO `housinginfo` VALUES ('10004', null, '001000100010007', 'qqqq', 'wehwe', '2000', 'weh', '温哥华', 'sdg', '105.529067|30.219042', null, '23236', null, '1', '1', '2017-11-25 15:21:06');
INSERT INTO `housinginfo` VALUES ('10005', null, '001000100010008', '123', '', '2000', 'weh', '温哥华', 'sdg', '105.529067|30.219042', null, '23236', null, '1', '1', '2017-11-25 15:26:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '物业管理系统', null, '&#xe625;', null, '1', '1');
INSERT INTO `menu` VALUES ('2', '停车场管理系统', null, '&#xe669;', null, '2', '1');
INSERT INTO `menu` VALUES ('3', '营销管理系统', null, '&#xe72b;', null, '3', '1');
INSERT INTO `menu` VALUES ('4', '门禁管理系统', null, '&#xe726;', null, '4', '1');
INSERT INTO `menu` VALUES ('5', '参数管理中心', null, '&#xe63c;', null, '5', '1');
INSERT INTO `menu` VALUES ('6', '系统管理中心', null, '&#xe61a;', null, '6', '1');
INSERT INTO `menu` VALUES ('100', '我的服务商', '/rest/service/serviceList', null, '1', '99', '1');
INSERT INTO `menu` VALUES ('101', '我的物业', '/rest/property/propertyList', null, '1', '99', '1');
INSERT INTO `menu` VALUES ('102', '我的小区', '/rest/housing/housingList', null, '1', '99', '1');
INSERT INTO `menu` VALUES ('103', '房屋信息', '/rest/roominfo/roominfoList', null, '1', '99', '1');
INSERT INTO `menu` VALUES ('104', '我的账单', '/rest/billAccount/billAccountList', null, '1', '99', '1');
INSERT INTO `menu` VALUES ('105', '交易中心', null, null, '1', '99', '1');
INSERT INTO `menu` VALUES ('106', '业主催收', null, null, '1', '99', '1');
INSERT INTO `menu` VALUES ('107', '用户管理', '/rest/user/userList', null, '1', '99', '1');
INSERT INTO `menu` VALUES ('201', '开发中', null, null, '2', '99', '1');
INSERT INTO `menu` VALUES ('301', '开发中', null, null, '3', '99', '1');
INSERT INTO `menu` VALUES ('401', '开发中', null, null, '4', '99', '1');
INSERT INTO `menu` VALUES ('501', '开发中', null, null, '5', '99', '1');
INSERT INTO `menu` VALUES ('601', '角色管理', '/rest/role/roleList', null, '6', '99', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of printinfo
-- ----------------------------
INSERT INTO `printinfo` VALUES ('6', '2000', '4004540276', 'cfji72jqwtf8', '', '物业1打印机', null, '2017-11-25 23:30:29');
INSERT INTO `printinfo` VALUES ('3', '10003', '4004540276', 'cfji72jqwtf8', '111', '莫须有小区打印机', null, '2017-11-25 23:01:28');
INSERT INTO `printinfo` VALUES ('4', '9', '4004540276', 'cfji72jqwtf8', '222', '首创十方界1打印机', null, '2017-11-25 23:01:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of propertyinfo
-- ----------------------------
INSERT INTO `propertyinfo` VALUES ('2000', '00100010001', '1级物业', '张三', '17784495626', '重庆市九龙坡', '8', '', '', '201708BB85188ec4dcbc4be69df6ef6b5fa2fX42', '', '', '', '', '2017-11-19 23:01:25');

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
INSERT INTO `role` VALUES ('2', '物业管理员', null, '物业管理员', '2017-11-10 17:21:12');
INSERT INTO `role` VALUES ('3', '小区管理员', null, '小区管理员', '2017-11-13 12:49:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roominfo
-- ----------------------------
INSERT INTO `roominfo` VALUES ('1020', '10003', 'AUROC82WN5001800002100502', '', '2栋', '10单元', '502', '2栋10单元502', '李东', '', '177844966330', '', '0', '1', '2017-11-25 21:40:04');
INSERT INTO `roominfo` VALUES ('1022', '10003', 'AUROC82WN5001800001010011', '', '1栋', '1单元', '1-01', '1栋1单元1-01', '张三', null, '13877777771', null, '0', '1', '2017-11-25 21:55:34');
INSERT INTO `roominfo` VALUES ('1023', '10003', 'AUROC82WN5001800001010012', '', '1栋', '1单元', '1-02', '1栋1单元1-02', '李四', null, '13877777772', null, '0', '1', '2017-11-25 21:55:34');
INSERT INTO `roominfo` VALUES ('1024', '10003', 'AUROC82WN5001800001010013', '', '1栋', '1单元', '1-03', '1栋1单元1-03', '王五', null, '13877777773', null, '0', '1', '2017-11-25 21:55:34');

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
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of serviceinfo
-- ----------------------------
INSERT INTO `serviceinfo` VALUES ('1', '001', '总公司', null, null, null, null, null, null, null, null, '2017-11-19 22:09:21');
INSERT INTO `serviceinfo` VALUES ('8', '0010001', '1级服务商', '', '', '', '', '1', '2017071807800670', 'MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJW2B/Wqka+T7s1HW/rFFKweF7fN+vtqmhkIvtXUoQi3+fiZKZjc1KHGLM8YS9BTUFNDcSvRva23qRlGp4ypbkl+QSx2spc0A2TKllVIBu9yWAvBIEVNBo3s8rRK1VWH8qKtMyYc2Q1rebeeEpFSJAjXGS99JS68GXo1QwDbH9kNAgMBAAECgYAHNHV5mzXbr1DkzDRfAzEVf3VAwUb85op3/fXBMLR3SPNcxXI9CxOonXL2nIK5iejpuOsvYq6wN5CJyN6zZEwMZpEXQ8ELhencbgYgBvBmvyPq5rnUb3MEt/W2B3EmgaCqYTfk0GWa50ybSh94ynBfK+DRy8NHYQg9kYzOfJt2gQJBAMUJ2wVR6PE2iK24jvcX/ajqE7kHRFf0T6bOKA4TRxxDMGNCH189RmXpxoPjrzsofKdh+qgvbLpz3e7cOG18Wp0CQQDCgqeSyxFecmmDvaDkn0Oj4GkgOdz6T23rsCfSVXWaBII0+nBlbWglQc/DwohTmdq8TBe6FnTfbOhDnIMo0DUxAkALXuQ6zF1K/kCo9cuaStIim0+ED/1LrheioqcBGO+zm9UBBWHWFy0m2HTSS6NjIJUA+9CBQCtgHyuhiyfeeZypAkBD4sfLgtYgCXxr/03dHPzFgDgQiEFolzo87PEpBqyRwYsUJGf/7kxP3IU/xHBCBUuDNmd9igLmS6NQnZplLy2xAkEAuIDbFGy34R8rEI5vXcqcMsn0tl5jBHSzbFcN1+3vz8dfudjl0RTqqpDXI1vtgbOph+NG3TVkSYbk0knjDNG15A==', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB', '2017-11-19 22:45:06');
INSERT INTO `serviceinfo` VALUES ('9', '0010002', 'wegw', '', '', '', '', '1', null, null, null, '2017-11-21 16:40:32');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '管理员', 'admin', '123456', '1', '001', '99', '17784495260', 'wangsd@163.com', '1', null, '2017-11-19 22:08:54');
INSERT INTO `users` VALUES ('13', '', '服务商', '111111', '8', '0010001', '1', '', '', '1', '1', '2017-11-20 17:10:07');
INSERT INTO `users` VALUES ('14', '', 'wewh', '111111', '9', '001000100010005', '1', '', '', '1', '1', '2017-11-21 16:40:45');
INSERT INTO `users` VALUES ('15', '莫须有小区', '莫须有小区', '111111', '10003', '001000100010010', '3', '', '', '1', '3', '2017-11-25 22:19:00');
