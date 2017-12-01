/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : estate

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-12-01 17:48:34
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
  `buyer_user_id` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of billaccount
-- ----------------------------
INSERT INTO `billaccount` VALUES ('1011', '10003', '1020', '1', '100', '2017年11', '20171124', '20171130', null, '1', '2017-11-27 22:27:18', '1', '1', '0', null, null, '1', '0', null, null, '2017-11-25 21:50:33');
INSERT INTO `billaccount` VALUES ('1012', '10003', '1022', '1', '138', '2017年07', '20171123', '20171212', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-11-25 21:55:56');
INSERT INTO `billaccount` VALUES ('1013', '10003', '1023', '1', '138', '2017年07', '20171123', '20171212', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-11-25 21:55:56');
INSERT INTO `billaccount` VALUES ('1014', '10003', '1024', '1', '138', '2017年07', '20171123', '20171212', null, '1', null, null, '0', '0', null, null, '0', '0', null, null, '2017-11-25 21:55:56');
INSERT INTO `billaccount` VALUES ('1015', '10003', '1020', '2', '10', '2017年11', '20171120', '20171130', null, '1', '2017-11-27 22:27:18', '1', '1', '0', null, null, '0', '0', null, null, '2017-11-27 14:16:55');
INSERT INTO `billaccount` VALUES ('1151', '10003', '1398', '1', '138', '2017年07', '20171123', '20171212', null, '0', null, null, '0', '0', null, null, '0', '0', null, null, '2017-12-01 16:48:57');

-- ----------------------------
-- Table structure for costtype
-- ----------------------------
DROP TABLE IF EXISTS `costtype`;
CREATE TABLE `costtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of costtype
-- ----------------------------
INSERT INTO `costtype` VALUES ('1', '物业管理费1');

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
INSERT INTO `housinginfo` VALUES ('10001', null, '001000100010002', '问过', '', '2000', '未', '而我却', '22', '106.100356|29.695525', null, '235', null, '1', '1', '2017-11-22 11:27:29');
INSERT INTO `housinginfo` VALUES ('10002', null, '001000100010003', '尔额34', '', '2000', '34', '34', '34', '97.719676|31.370363', null, '344', null, '1', '1', '2017-11-22 11:27:50');
INSERT INTO `housinginfo` VALUES ('10003', 'AUROC82WN5001', '001000100010010', '莫须有小区', '红枫路9号', '2000', '500112', '500100', '500000', '106.536969|29.605632', null, '023-74583381', '50', '4', '0', '2017-11-22 15:13:25');
INSERT INTO `housinginfo` VALUES ('10004', null, '001000100010007', 'qqqq', 'wehwe', '2000', 'weh', '温哥华', 'sdg', '105.529067|30.219042', null, '23236', null, '1', '1', '2017-11-25 15:21:06');
INSERT INTO `housinginfo` VALUES ('10005', null, '001000100010008', '123', '', '2000', 'weh', '温哥华', 'sdg', '105.529067|30.219042', null, '23236', null, '1', '1', '2017-11-25 15:26:54');
INSERT INTO `housinginfo` VALUES ('10006', null, '001000200010003', '九堡肖苑', '东西大道与新104国道交汇处', '2001', '330104', '330100', '330000', '120.266761|30.307819', null, '0571-88683117', null, '1', '0', '2017-11-30 21:27:19');
INSERT INTO `housinginfo` VALUES ('10007', null, '001000200010004', '112', '', '2001', '121', '121', '1241', '12', null, '12', null, '1', '1', '2017-11-30 22:31:32');
INSERT INTO `housinginfo` VALUES ('10008', null, '001000200010005', 'qwg', 'qw', '2001', 'gqw', 'gqw', 'qgw', '121', null, 'qwg', null, '1', '1', '2017-11-30 22:32:39');
INSERT INTO `housinginfo` VALUES ('10009', 'AF2FBBVGM3301', '001000200010009', '西溪永乐城', '杭州市余杭区文一西路与水城北路交叉口', '2001', '330110', '330100', '330000', '120.00538|30.273972', null, '0571-88683117', null, '3', '0', '2017-11-30 22:35:00');
INSERT INTO `housinginfo` VALUES ('10010', null, '001000200010007', '西溪永乐城2', '杭州市余杭区文一西路与水城北路交叉口', '2001', '330104', '330100', '330000', '120.005261|30.273779', null, '0571-88683117', null, '1', '1', '2017-11-30 22:35:48');

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
INSERT INTO `role_menu` VALUES ('99', '602');

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
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of serviceinfo
-- ----------------------------
INSERT INTO `serviceinfo` VALUES ('1', '001', '总公司', null, null, null, null, null, null, null, null, '2017-11-19 22:09:21');
INSERT INTO `serviceinfo` VALUES ('10', '0010002', '杭州早早科技有限公司', '杭州', '熊和砍', '', '', '1', '2017071807800670', 'MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJW2B/Wqka+T7s1HW/rFFKweF7fN+vtqmhkIvtXUoQi3+fiZKZjc1KHGLM8YS9BTUFNDcSvRva23qRlGp4ypbkl+QSx2spc0A2TKllVIBu9yWAvBIEVNBo3s8rRK1VWH8qKtMyYc2Q1rebeeEpFSJAjXGS99JS68GXo1QwDbH9kNAgMBAAECgYAHNHV5mzXbr1DkzDRfAzEVf3VAwUb85op3/fXBMLR3SPNcxXI9CxOonXL2nIK5iejpuOsvYq6wN5CJyN6zZEwMZpEXQ8ELhencbgYgBvBmvyPq5rnUb3MEt/W2B3EmgaCqYTfk0GWa50ybSh94ynBfK+DRy8NHYQg9kYzOfJt2gQJBAMUJ2wVR6PE2iK24jvcX/ajqE7kHRFf0T6bOKA4TRxxDMGNCH189RmXpxoPjrzsofKdh+qgvbLpz3e7cOG18Wp0CQQDCgqeSyxFecmmDvaDkn0Oj4GkgOdz6T23rsCfSVXWaBII0+nBlbWglQc/DwohTmdq8TBe6FnTfbOhDnIMo0DUxAkALXuQ6zF1K/kCo9cuaStIim0+ED/1LrheioqcBGO+zm9UBBWHWFy0m2HTSS6NjIJUA+9CBQCtgHyuhiyfeeZypAkBD4sfLgtYgCXxr/03dHPzFgDgQiEFolzo87PEpBqyRwYsUJGf/7kxP3IU/xHBCBUuDNmd9igLmS6NQnZplLy2xAkEAuIDbFGy34R8rEI5vXcqcMsn0tl5jBHSzbFcN1+3vz8dfudjl0RTqqpDXI1vtgbOph+NG3TVkSYbk0knjDNG15A==', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB', '2017-11-30 20:16:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '管理员', 'admin', '123456', '1', '001', '99', '17784495260', 'wangsd@163.com', '1', null, '2017-11-19 22:08:54');
INSERT INTO `users` VALUES ('16', '杭州早早科技有限公司', '早早科技', '111111', '10', '0010002', '1', '', '', '1', '1', '2017-11-30 20:43:03');
INSERT INTO `users` VALUES ('17', '', '九堡肖苑', '111111', '10006', '001000200010003', '3', '', '', '1', '3', '2017-11-30 21:36:47');
