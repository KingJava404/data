
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Untitled
-- ----------------------------
DROP TABLE IF EXISTS `Untitled`;
CREATE TABLE `Untitled`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sms_secret_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密钥',
  `sms_secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '私钥',
  `sms_sdk_app_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信工具应用APP的id',
  `sms_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司标识',
  `sms_template` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板类型，跟yf_sms_template表关联',
  `sms_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '启用和禁用状态，00禁用  01启用，默认启用',
  `sms_isActive` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '伪删除标识 00删除 01正常，默认正常',
  `sms_remark` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息配置备注',
  `sms_registers_tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册，绑定手机模板编码',
  `sms_update_temPlate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改手机号模板编码',
  `sms_update_bankCard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改银行卡模板编码',
  `sms_invite` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请模板编码',
  `sms_login` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录模板编码',
  `sms__createdDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信配置信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for address_plan
-- ----------------------------
DROP TABLE IF EXISTS `address_plan`;
CREATE TABLE `address_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_address_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户联系地址',
  `user_address_province_id` int(11) NULL DEFAULT NULL COMMENT '用户省ID',
  `user_address_city_id` int(11) NULL DEFAULT NULL COMMENT '用户城市ID',
  `user_address_area_id` int(11) NULL DEFAULT NULL COMMENT '用户区ID',
  `user_address_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址区域',
  `user_address_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `start` tinyint(255) NULL DEFAULT 0 COMMENT '开始',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for data_collection_information
-- ----------------------------
DROP TABLE IF EXISTS `data_collection_information`;
CREATE TABLE `data_collection_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `vs_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `is_channel_business` int(1) NOT NULL COMMENT '是否为渠道商(1:渠道商；2：普通用户)',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除(0:未删；1:已删除)',
  `update_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `crt_date` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for fifth_anniversary
-- ----------------------------
DROP TABLE IF EXISTS `fifth_anniversary`;
CREATE TABLE `fifth_anniversary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barrage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弹幕',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `barrage_status` int(11) NOT NULL DEFAULT 0 COMMENT '状态0已查 1未查',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = ' 大屏幕弹幕' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for fkg_worker
-- ----------------------------
DROP TABLE IF EXISTS `fkg_worker`;
CREATE TABLE `fkg_worker`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL COMMENT '关联账号id',
  `bu_men` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门',
  `xing_ming` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `zhang_hao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `zai_zhi` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否在职 0离职 1在职',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for reg_time
-- ----------------------------
DROP TABLE IF EXISTS `reg_time`;
CREATE TABLE `reg_time`  (
  `user_id` int(12) NOT NULL COMMENT '用户ID',
  `useR_reg_time` int(15) NULL DEFAULT NULL COMMENT '用户注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for t_platform_message
-- ----------------------------
DROP TABLE IF EXISTS `t_platform_message`;
CREATE TABLE `t_platform_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `message_content` varchar(511) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息内容',
  `is_reader` int(255) NULL DEFAULT 0 COMMENT '0:未读；1:已读',
  `creater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `message_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '站内信' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for tj_birth_user
-- ----------------------------
DROP TABLE IF EXISTS `tj_birth_user`;
CREATE TABLE `tj_birth_user`  (
  `have_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已有账号 有1 没有0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `ID_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡账号',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = ' 天九生日会员注册辅助表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_admin_associates_set
-- ----------------------------
DROP TABLE IF EXISTS `udb_admin_associates_set`;
CREATE TABLE `udb_admin_associates_set`  (
  `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` mediumint(8) UNSIGNED NOT NULL COMMENT '用户id',
  `district_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '区ID',
  `district_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区名',
  `regional_sub_commission` decimal(10, 2) NULL DEFAULT NULL,
  `self_sub_commission` decimal(10, 2) NULL DEFAULT NULL,
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `operator_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '联营商分佣配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_admin_rights_group
-- ----------------------------
DROP TABLE IF EXISTS `udb_admin_rights_group`;
CREATE TABLE `udb_admin_rights_group`  (
  `rights_group_id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限组id',
  `rights_group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组名称',
  `rights_group_rights_ids` varchar(10480) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限列表',
  `rights_group_add_time` date NOT NULL COMMENT '创建时间',
  `rights_limits_all` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '逗号分隔所有权限',
  `rights_limits_state` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限状态',
  PRIMARY KEY (`rights_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限组表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_admin_user_base
-- ----------------------------
DROP TABLE IF EXISTS `udb_admin_user_base`;
CREATE TABLE `udb_admin_user_base`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户帐号',
  `user_password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码：使用用户中心-此处废弃',
  `user_realname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `user_nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `user_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `user_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户Key',
  `user_delete` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否被封禁，0：未封禁，1：封禁',
  `rights_group_id` smallint(4) NOT NULL COMMENT '用户权限组id',
  `head_portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sub_site_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属子站， 0总站',
  `province_id` int(11) NOT NULL DEFAULT 0 COMMENT '省ID',
  `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '市ID',
  `district_id` int(11) NOT NULL DEFAULT 0 COMMENT '区ID',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `user_position` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `user_department` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `user_gender` tinyint(2) NULL DEFAULT NULL COMMENT '性别，默认0，0女1男',
  `creat_account_time` datetime NULL DEFAULT NULL COMMENT '账号创建时间',
  `account_type` int(11) NULL DEFAULT NULL COMMENT '0门店会员 1 市级代理  2 省级代理 3厂商',
  `store_id` int(11) NULL DEFAULT NULL COMMENT '门店主键id',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_account`(`user_account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11526880 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户基础信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_article_base
-- ----------------------------
DROP TABLE IF EXISTS `udb_article_base`;
CREATE TABLE `udb_article_base`  (
  `article_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `article_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `article_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '调用网址-url，默认为本页面构造的网址，可填写其它页面',
  `article_status` int(1) NULL DEFAULT 2 COMMENT '状态 1:启用  2:关闭',
  `article_add_time` datetime NOT NULL COMMENT '添加时间',
  `article_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章图片',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知消息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_article_group
-- ----------------------------
DROP TABLE IF EXISTS `udb_article_group`;
CREATE TABLE `udb_article_group`  (
  `article_group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `article_group_title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `article_group_lang` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'cn' COMMENT '语言',
  `article_group_sort` smallint(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `article_group_logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'logo',
  `article_group_parent_id` int(11) NOT NULL COMMENT '上级分类id',
  PRIMARY KEY (`article_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站初始化内容分组表\r\n无用' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_channel_apply
-- ----------------------------
DROP TABLE IF EXISTS `udb_channel_apply`;
CREATE TABLE `udb_channel_apply`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL COMMENT '用户ID',
  `user_mobile` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机号',
  `user_industry` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行业',
  `user_province` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `user_city` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市',
  `user_area` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区',
  `user_detail_site` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `add_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `state` int(21) UNSIGNED ZEROFILL NOT NULL COMMENT '状态0是待申请1是审核通过2审核不通过',
  `user_turename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `voucher_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '0是普通1是会员',
  `verify_date` datetime NULL DEFAULT '2020-03-01 10:00:28' COMMENT '审核时间',
  `verify_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道商申请表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_channel_earnings
-- ----------------------------
DROP TABLE IF EXISTS `udb_channel_earnings`;
CREATE TABLE `udb_channel_earnings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '内容',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收益比',
  `channel_describe` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道商收益配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_channel_teammate
-- ----------------------------
DROP TABLE IF EXISTS `udb_channel_teammate`;
CREATE TABLE `udb_channel_teammate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_channel_id` int(11) NOT NULL COMMENT '用户更改ID',
  `add_time` datetime NULL DEFAULT NULL COMMENT '新增时间',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1正常2伪删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道商绑定表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_channel_user_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `udb_channel_user_bank_card`;
CREATE TABLE `udb_channel_user_bank_card`  (
  `card_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行名称',
  `bank_card_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行卡号',
  `bank_user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开户人姓名',
  `card_status` int(1) NULL DEFAULT NULL COMMENT '0不显示 1显示',
  `bank_branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行所在地',
  `add_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道商银行卡\r\n' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_department
-- ----------------------------
DROP TABLE IF EXISTS `udb_department`;
CREATE TABLE `udb_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_department` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_distributor_apply
-- ----------------------------
DROP TABLE IF EXISTS `udb_distributor_apply`;
CREATE TABLE `udb_distributor_apply`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `add_time` datetime NULL DEFAULT '2020-03-01 10:00:28' COMMENT '添加时间',
  `statement_state` int(2) NULL DEFAULT 1 COMMENT '结算状态：1允许结算2不能结算',
  `grade_type` int(10) NULL DEFAULT 2 COMMENT '用户等级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分销商用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_distributor_grade
-- ----------------------------
DROP TABLE IF EXISTS `udb_distributor_grade`;
CREATE TABLE `udb_distributor_grade`  (
  `grade_type` int(11) NOT NULL AUTO_INCREMENT COMMENT '等级类型',
  `grade_describe` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '等级描述',
  `earnings_ratio` decimal(25, 2) NOT NULL COMMENT '收益比例',
  `update_time` datetime NULL DEFAULT '2020-03-01 10:00:28' COMMENT '更新时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`grade_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分销商等级表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_invite_record
-- ----------------------------
DROP TABLE IF EXISTS `udb_invite_record`;
CREATE TABLE `udb_invite_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `user_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机号',
  `user_avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `share_user_id` int(10) NOT NULL COMMENT '分享用户id',
  `relevance_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联id',
  `invite_time` datetime NOT NULL COMMENT '邀请时间',
  `invite_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '邀请类型 1申请微客邀请   2首次分享购买邀请',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `parent_user_id`(`share_user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `share_user_id`, `invite_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邀请记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_language_info
-- ----------------------------
DROP TABLE IF EXISTS `udb_language_info`;
CREATE TABLE `udb_language_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '语言类型配置标识“language”',
  `language_id` int(11) NULL DEFAULT 0 COMMENT '0:(默认)汉语；1：英语',
  `language_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `platform_type_id` int(11) NULL DEFAULT NULL COMMENT '0:pc端；1:移动端',
  `platform_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_live_statistics
-- ----------------------------
DROP TABLE IF EXISTS `udb_live_statistics`;
CREATE TABLE `udb_live_statistics`  (
  `id` int(220) NOT NULL AUTO_INCREMENT,
  `user_id` int(220) NOT NULL COMMENT '用户id',
  `plat_form` int(4) NULL DEFAULT 0 COMMENT '端口  1PC 2wap 3安卓 5ios 6微信小程序 7wap浏览器',
  `user_mobile` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `login_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 290773 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户日活跃-每日第一次登录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_achievement
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_achievement`;
CREATE TABLE `udb_orchard_achievement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `achievement_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '历史成就描述',
  `date` date NULL DEFAULT NULL,
  `add_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '历史成就' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_get_prop_commit
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_get_prop_commit`;
CREATE TABLE `udb_orchard_get_prop_commit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prop_id` int(255) NULL DEFAULT NULL COMMENT '道具id',
  `prop_commit_id` int(11) NULL DEFAULT NULL COMMENT '关联道具id',
  `prop_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道具图片',
  `prop_num` int(11) NULL DEFAULT NULL COMMENT '道具数量',
  `prop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道具名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务中心关联道具表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_get_prop_record
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_get_prop_record`;
CREATE TABLE `udb_orchard_get_prop_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `prop_id` int(11) NULL DEFAULT NULL COMMENT '道具id',
  `get_prop_num` int(11) NULL DEFAULT NULL COMMENT '获取道具数量',
  `prop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道具名',
  `last_prop_num` int(11) NULL DEFAULT NULL COMMENT '之前道具数量',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联订单id',
  `record_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `record_date` date NULL DEFAULT NULL,
  `prop_commit_id` int(11) NULL DEFAULT NULL,
  `seed_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户获取道具历史表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_get_prop_type
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_get_prop_type`;
CREATE TABLE `udb_orchard_get_prop_type`  (
  `prop_commit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '道具关联id',
  `get_prop_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获取道具id渠道1签到2评价3下单',
  `get_prop_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `add_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `get_prop_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`prop_commit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '获取道具渠道表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_growth_record
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_growth_record`;
CREATE TABLE `udb_orchard_growth_record`  (
  `growth_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '成长值历史记录id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `add_growth_value` int(11) NULL DEFAULT NULL COMMENT '添加成长值id',
  `last_growth_value` int(11) NULL DEFAULT NULL COMMENT '上次成长值',
  `prop_id` int(11) NULL DEFAULT NULL COMMENT '使用道具id',
  `record_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `record_date` date NULL DEFAULT NULL COMMENT '时间年月日',
  `record_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`growth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成长值历史记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_level_commit
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_level_commit`;
CREATE TABLE `udb_orchard_level_commit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prop_id` int(255) NULL DEFAULT NULL COMMENT '道具id',
  `seed_level` int(11) NULL DEFAULT NULL COMMENT '关联道具id',
  `prop_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道具图片',
  `prop_num` int(11) NULL DEFAULT NULL COMMENT '道具数量',
  `prop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道具名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务中心关联道具表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_poetry
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_poetry`;
CREATE TABLE `udb_orchard_poetry`  (
  `poetry_id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '题目',
  `author` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `one_sentence` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第一句',
  `two_sentence` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第二句',
  `three_sentence` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三局',
  `four_sentence` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第四局',
  `add_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`poetry_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '古诗词' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_prop_info
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_prop_info`;
CREATE TABLE `udb_orchard_prop_info`  (
  `prop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '道具id',
  `prop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道具名称',
  `prop_unit` int(11) NULL DEFAULT NULL COMMENT '单位',
  `prop_grow_value` int(11) NULL DEFAULT NULL COMMENT '成长值',
  `prop_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`prop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '果园道具表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_seed
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_seed`;
CREATE TABLE `udb_orchard_seed`  (
  `seed_id` int(11) NOT NULL AUTO_INCREMENT,
  `seed_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `creat_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `seed_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '种子图片',
  `seed_num` int(11) NULL DEFAULT NULL COMMENT '种子数量',
  `seed_ripe_num` int(11) NULL DEFAULT NULL COMMENT '结果数量',
  PRIMARY KEY (`seed_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '果园信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_seed_level
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_seed_level`;
CREATE TABLE `udb_orchard_seed_level`  (
  `seed_level` int(11) NOT NULL COMMENT '果树等级',
  `grow_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '果树名称',
  PRIMARY KEY (`seed_level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '果树成长阶段' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_seed_stage
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_seed_stage`;
CREATE TABLE `udb_orchard_seed_stage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seed_id` int(11) NULL DEFAULT NULL COMMENT '种子类型',
  `seed_level` int(11) NULL DEFAULT NULL COMMENT '种子阶段1种子期2发芽期3.成长期4.开花期5.结果期6成熟期7收货期',
  `growth_level` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成长阶段介绍',
  `growth_value_floor` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成长期开始',
  `growth_value_ceil` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成长值结束',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '果树阶段表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_shaky_type
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_shaky_type`;
CREATE TABLE `udb_orchard_shaky_type`  (
  `get_prop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `get_prop_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `add_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`get_prop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '完成活动的方式' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_sign_record
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_sign_record`;
CREATE TABLE `udb_orchard_sign_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `sign_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '签到时间',
  `accumulated_sign` int(11) NOT NULL COMMENT '累计签到',
  `sign_date` date NULL DEFAULT NULL COMMENT '签到日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '果园用户签到表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_user_info
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_user_info`;
CREATE TABLE `udb_orchard_user_info`  (
  `user_id` int(212) NOT NULL,
  `seed_id` int(21) NOT NULL COMMENT '种子id',
  `seed_level` int(21) NULL DEFAULT NULL COMMENT '果实等级',
  `grow_value` int(211) NULL DEFAULT NULL COMMENT '累计成长值',
  `last_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上次更新时间',
  `start_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `present_grow_value` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '当前等级成长值',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户果园信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_orchard_user_prop
-- ----------------------------
DROP TABLE IF EXISTS `udb_orchard_user_prop`;
CREATE TABLE `udb_orchard_user_prop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NULL DEFAULT NULL COMMENT '用户ID',
  `prop_id` int(11) NULL DEFAULT NULL COMMENT '道具id',
  `prop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道具名',
  `prop_num` int(11) NULL DEFAULT NULL COMMENT '道具数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户道具表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_self_alliance_apply
-- ----------------------------
DROP TABLE IF EXISTS `udb_self_alliance_apply`;
CREATE TABLE `udb_self_alliance_apply`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `user_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `user_business` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行业',
  `user_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `user_address` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户地址',
  `add_time` datetime NULL DEFAULT '2020-03-01 10:00:28' COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT '2020-03-01 10:00:28' COMMENT '审核时间',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '状态0是审核中1是审核通过2审核不通过',
  `verify_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核人',
  `verify_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核备注',
  `grade_type` int(5) NULL DEFAULT 1 COMMENT '等级（详解见udb_self_alliance_grade）',
  `statement_state` int(2) NULL DEFAULT 1 COMMENT '结算状态：1允许结算2不能结算',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自营联盟申请表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_self_alliance_grade
-- ----------------------------
DROP TABLE IF EXISTS `udb_self_alliance_grade`;
CREATE TABLE `udb_self_alliance_grade`  (
  `grade_type` int(11) NOT NULL AUTO_INCREMENT COMMENT '等级类型',
  `grade_describe` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '等级描述',
  `earnings_ratio` decimal(25, 2) NOT NULL COMMENT '收益比例',
  `update_time` datetime NULL DEFAULT '2020-03-01 10:00:28' COMMENT '更新时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`grade_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自营联盟等级表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_self_alliance_teammate
-- ----------------------------
DROP TABLE IF EXISTS `udb_self_alliance_teammate`;
CREATE TABLE `udb_self_alliance_teammate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '主账号',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '子账号',
  `add_time` datetime NULL DEFAULT '2020-03-01 10:00:28' COMMENT '添加时间',
  `delete_time` datetime NULL DEFAULT '2020-03-01 10:00:28' COMMENT '删除时间',
  `state` int(2) NOT NULL DEFAULT 1 COMMENT '1正常2伪删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_parent_id`(`user_parent_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自营联盟账号关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_share_url
-- ----------------------------
DROP TABLE IF EXISTS `udb_share_url`;
CREATE TABLE `udb_share_url`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `share_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分享路径',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1自由拼团分享路径',
  `update_time` datetime NOT NULL DEFAULT '2020-03-01 10:00:28' COMMENT '更新时间',
  `var1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备用字段',
  `var2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备用字段',
  `var3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备用字段',
  `var4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备用字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分享地址' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_shop_store_info
-- ----------------------------
DROP TABLE IF EXISTS `udb_shop_store_info`;
CREATE TABLE `udb_shop_store_info`  (
  `store_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店名称 唯一',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '门店管理员id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门店管理员名称',
  `user_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店管理员手机号',
  `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店登录用户手机号',
  `province_id` int(10) NULL DEFAULT NULL COMMENT '省id',
  `city_id` int(10) NULL DEFAULT NULL COMMENT '市id',
  `area_id` int(10) NULL DEFAULT NULL COMMENT '区id',
  `store_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店详细地址',
  `longitude` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店地址经度',
  `latitude` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店地址纬度',
  `store_contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店联系电话',
  `opening_hours` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店营业时间',
  `traffic_route` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交通路线',
  `store_image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '门店图片',
  `store_state` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1正常 2关闭)',
  `register_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`store_id`) USING BTREE,
  UNIQUE INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `store_name`(`store_name`) USING BTREE,
  INDEX `longitude`(`longitude`) USING BTREE,
  INDEX `latitude`(`latitude`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺门店信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_shop_vip_user
-- ----------------------------
DROP TABLE IF EXISTS `udb_shop_vip_user`;
CREATE TABLE `udb_shop_vip_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `user_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员备注',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` int(1) NULL DEFAULT 1 COMMENT '性别',
  `vip_label` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员标签',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `register_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时间',
  `last_login_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `shop_user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享用户id或商家用户id',
  `store_id` int(11) NULL DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店名称',
  `var1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员来源  1商家邀请注册 2微客邀请注册 3.员工邀请注册  4.微客分享购买店铺商品 5自主购买店铺商品',
  `var2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '暂定 微客上级id',
  `var3` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `var4` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`, `shop_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺会员表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_shop_vk_apply
-- ----------------------------
DROP TABLE IF EXISTS `udb_shop_vk_apply`;
CREATE TABLE `udb_shop_vk_apply`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `buy_goods_num` int(10) NOT NULL DEFAULT 0 COMMENT '购买分销商品数',
  `invite_user_num` int(10) NOT NULL DEFAULT 0 COMMENT '邀请用户数',
  `apply_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1待完成条件  2条件满足可申请  3已成为微客  4微客审核失败  5已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺微客会员申请记录表(自动申请条件)' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_shop_vk_user
-- ----------------------------
DROP TABLE IF EXISTS `udb_shop_vk_user`;
CREATE TABLE `udb_shop_vk_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名',
  `shop_user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邀请用户id',
  `store_id` int(10) NULL DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店名称',
  `user_status` int(1) NULL DEFAULT 3 COMMENT '1.通过，2.拒绝，3.待审核 4已删除',
  `invite_num` int(10) NOT NULL DEFAULT 0 COMMENT '推广人数（下级微客数）',
  `share_num` int(10) NOT NULL DEFAULT 0 COMMENT '分享人数',
  `var1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '来源  1商家邀请  2商家自己添加  3.微客邀请',
  `var2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '推广佣金总额',
  `var3` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0.00' COMMENT '分享佣金总额',
  `var4` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sh_status` int(1) NULL DEFAULT NULL COMMENT '弃用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `user_status`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `shop_user_id`(`shop_user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺微客会员表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_shop_yg_user_info
-- ----------------------------
DROP TABLE IF EXISTS `udb_shop_yg_user_info`;
CREATE TABLE `udb_shop_yg_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'y用户名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '商家店铺id',
  `shop_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 's商家店铺名',
  `store_id` int(10) NULL DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店名称',
  `shop_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家用户id',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_status` int(1) NOT NULL DEFAULT 3 COMMENT '1.通过，2.拒绝，3.待审核 4已删除',
  `var1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '推广人数',
  `var2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '分享商品成交金额',
  `var3` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '分享商品退款总额',
  `var4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `user_id_2`(`user_id`, `user_status`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_status`(`user_status`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺员工表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_stock_rights_state
-- ----------------------------
DROP TABLE IF EXISTS `udb_stock_rights_state`;
CREATE TABLE `udb_stock_rights_state`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `deposit_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充值流水号',
  `start_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '开启股权权益状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开启股权权益表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_factory_members
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_factory_members`;
CREATE TABLE `udb_ucenter_factory_members`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `factory_password` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `factory_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '厂商名称',
  `factory_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态(0正常 1删除)',
  `factory_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `province_id` int(10) NOT NULL DEFAULT 0 COMMENT '省id',
  `city_id` int(10) NOT NULL DEFAULT 0 COMMENT '市ID',
  `area_id` int(10) NOT NULL DEFAULT 0 COMMENT '区ID',
  `register_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_mobile`(`user_mobile`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '厂商信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_grade_log
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_grade_log`;
CREATE TABLE `udb_ucenter_grade_log`  (
  `grade_log_id` int(10) NOT NULL AUTO_INCREMENT,
  `points_log_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型 1获取2消费',
  `class_id` tinyint(1) NOT NULL COMMENT '1\'会员登录\',2\'购买商品\',3\'评价\'',
  `user_id` int(10) NOT NULL COMMENT '会员编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名称',
  `admin_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名称',
  `grade_log_grade` int(10) NOT NULL DEFAULT 0 COMMENT '获得经验',
  `freeze_grade` int(10) NOT NULL DEFAULT 0 COMMENT '冻结经验',
  `grade_log_time` datetime NOT NULL COMMENT '创建时间',
  `grade_log_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `grade_log_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标记',
  PRIMARY KEY (`grade_log_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE,
  INDEX `grade_log_time`(`grade_log_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员经验日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_log_action
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_log_action`;
CREATE TABLE `udb_ucenter_log_action`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '玩家Id',
  `user_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色账户',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '角色名称',
  `action_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '行为id == protocal_id -> rights_id',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `action_type_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型id，right_parent_id',
  `log_param` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求的参数',
  `operation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求描述',
  `log_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'ip地址',
  `log_date` date NOT NULL COMMENT '日志日期',
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `log_date`(`log_date`) USING BTREE COMMENT '(null)',
  INDEX `player_id`(`user_id`) USING BTREE COMMENT '(null)'
) ENGINE = InnoDB AUTO_INCREMENT = 2515 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户行为日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_message
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_message`;
CREATE TABLE `udb_ucenter_message`  (
  `message_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `message_user_id` int(10) NOT NULL COMMENT '消息接收者id',
  `message_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息接收者',
  `message_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '消息类型买家1订单信息3账户信息4其他',
  `message_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息标题',
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `message_islook` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否读取0未1读取',
  `message_create_time` datetime NOT NULL COMMENT '消息创建时间',
  `message_mold` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0买家1商家',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统消息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_message_setting
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_message_setting`;
CREATE TABLE `udb_ucenter_message_setting`  (
  `setting_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `message_template_all` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选择开启的所有模板id',
  `setting_time` datetime NOT NULL COMMENT '设置时间',
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息设置表\r\n\r\n无用' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_message_template
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_message_template`;
CREATE TABLE `udb_ucenter_message_template`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '邮件模板id',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件磨边编码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件名称',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题',
  `content_email` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件内容',
  `type` tinyint(1) NOT NULL COMMENT '0商家1用户',
  `is_phone` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭1开启',
  `is_email` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭1开启',
  `is_mail` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0关闭1开启',
  `content_mail` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站内信内容',
  `content_phone` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信内容',
  `force_phone` tinyint(1) NOT NULL DEFAULT 0 COMMENT '手机短信0不强制1强制',
  `force_email` tinyint(1) NOT NULL DEFAULT 0 COMMENT '邮件0不强制1强制',
  `force_mail` tinyint(1) NOT NULL DEFAULT 0 COMMENT '站内信0不强制1强制',
  `mold` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0常用提示1订单提示2卡券提示3售后提示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件模板\r\n\r\n无用' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_points_log
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_points_log`;
CREATE TABLE `udb_ucenter_points_log`  (
  `points_log_id` int(10) NOT NULL AUTO_INCREMENT,
  `points_log_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型 1获取积分2积分消费',
  `class_id` tinyint(1) NOT NULL COMMENT '积分类型1.会员注册,2.会员登录3.评价4.购买商品5.6.管理员操作7.积分换购商品8.积分兑换代金券9退货',
  `user_id` int(10) NOT NULL COMMENT '会员编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员名称',
  `admin_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员名称',
  `points_log_points` int(10) NOT NULL DEFAULT 0 COMMENT '积分变更',
  `freeze_points` int(10) NOT NULL DEFAULT 0 COMMENT '冻结积分',
  `points_log_time` datetime NOT NULL COMMENT '创建时间',
  `points_log_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作 会员注册、会员登录、会员购买、换购商品，平台操作',
  `points_log_operate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `points_log_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标记',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号-确认收货',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`points_log_id`) USING BTREE,
  INDEX `log_user_id`(`user_id`) USING BTREE COMMENT '用户id索引'
) ENGINE = InnoDB AUTO_INCREMENT = 500 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员积分日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_seller_base
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_seller_base`;
CREATE TABLE `udb_ucenter_seller_base`  (
  `seller_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '卖家id',
  `seller_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卖家用户名',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺ID',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `rights_group_id` int(10) UNSIGNED NOT NULL COMMENT '卖家组ID',
  `seller_is_admin` tinyint(3) UNSIGNED NOT NULL COMMENT '是否管理员(0-不是 1-是)',
  `seller_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `seller_group_id` int(10) UNSIGNED NOT NULL COMMENT '卖家组ID',
  `shop_type` tinyint(1) NULL DEFAULT 1 COMMENT '1卖家店铺 2供应商店铺',
  PRIMARY KEY (`seller_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `seller_group_id`(`seller_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2312 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_seller_group
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_seller_group`;
CREATE TABLE `udb_ucenter_seller_group`  (
  `group_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '卖家组编号',
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组名',
  `limits` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `smt_limits` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息权限范围',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  PRIMARY KEY (`group_id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家用户组表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_shop_contract_log
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_shop_contract_log`;
CREATE TABLE `udb_ucenter_shop_contract_log`  (
  `contract_log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `contract_id` int(10) NOT NULL COMMENT '服务id',
  `contract_type_id` int(10) NOT NULL COMMENT '服务id',
  `contract_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务名称',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `contract_log_operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人',
  `contract_log_date` datetime NOT NULL COMMENT '日志生成时间',
  `contract_log_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志内容',
  `contract_cash` decimal(10, 2) NOT NULL COMMENT '支付保证金金额,有正负',
  `contract_log_type` tinyint(1) NOT NULL DEFAULT 4 COMMENT '1-保证金操作 2-加入操作 3-退出操作 4-其它操作',
  `contract_log_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1-待审核(加入/退出) 2-保证金待审核(加入) 3-审核通过(加入/退出) 4-审核不通过(加入/退出) 5-已缴纳保证金',
  `contract_cash_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保证金图片',
  PRIMARY KEY (`contract_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消费者保障服务保证金缴纳日志表\r\n\r\n无用' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_shuadan_user
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_shuadan_user`;
CREATE TABLE `udb_ucenter_shuadan_user`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_parent_shop_id` int(11) NULL DEFAULT 0 COMMENT '上级店铺ID ',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '刷单用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_shudan_user
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_shudan_user`;
CREATE TABLE `udb_ucenter_shudan_user`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_parent_shop_id` int(11) NULL DEFAULT 0 COMMENT '上级店铺ID ',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '刷单用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_store_cardinfo
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_store_cardinfo`;
CREATE TABLE `udb_ucenter_store_cardinfo`  (
  `card_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `bank_card_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行卡号',
  `bank_user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收款/打款人姓名',
  `bank_mobile_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行预留手机号',
  `card_status` int(1) NULL DEFAULT NULL COMMENT '0收款人账号 1打款人账号',
  `bank_branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开户行信息',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店收款/打款人信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_store_members
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_store_members`;
CREATE TABLE `udb_ucenter_store_members`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `store_password` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `store_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店名称 唯一',
  `store_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态(0:未激活,1:未认证,2:已认证,3:锁定)',
  `store_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门店详细地址',
  `agent_id` int(11) NOT NULL COMMENT '代理商id ',
  `discount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣率',
  `store_code` int(11) NOT NULL COMMENT '门店编码 ',
  `province_id` int(10) NOT NULL DEFAULT 0 COMMENT '省id',
  `city_id` int(10) NOT NULL DEFAULT 0 COMMENT '市ID',
  `area_id` int(10) NOT NULL DEFAULT 0 COMMENT '区ID',
  `store_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '门店类型 0门店会员 1 市级代理  2 省级代理',
  `store_id` int(11) NULL DEFAULT NULL COMMENT '门店用户id，可重复',
  `register_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `consignee_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人手机号',
  `is_join` int(11) NULL DEFAULT 1 COMMENT '是否加盟 0未加盟  1已加盟  默认1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_mobile`(`user_mobile`) USING BTREE,
  INDEX `store_name`(`store_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店会员信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_sub_site
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_sub_site`;
CREATE TABLE `udb_ucenter_sub_site`  (
  `subsite_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sub_site_parent_id` int(11) NOT NULL COMMENT '父id',
  `sub_site_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分站名称',
  `sub_site_domain` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分站域名前缀',
  `sub_site_district_ids` varchar(20480) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地区id， 逗号分隔',
  `sub_site_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'logo',
  `sub_site_copyright` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版权',
  `sub_site_template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板',
  `sub_site_is_open` int(1) NOT NULL DEFAULT 1 COMMENT '是否开启',
  `sub_site_des` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `sub_site_web_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO标题',
  `sub_site_web_keyword` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO关键字',
  `sub_site_web_des` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO描述',
  `district_child_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区的最底层id',
  PRIMARY KEY (`subsite_id`) USING BTREE,
  INDEX `domain`(`sub_site_domain`) USING BTREE,
  INDEX `subsite_id`(`subsite_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 294 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '城市分站表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_system_operetion
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_system_operetion`;
CREATE TABLE `udb_ucenter_system_operetion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `operation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作',
  `method` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ip',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 268638 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台后台用户行为表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_user_address
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_user_address`;
CREATE TABLE `udb_ucenter_user_address`  (
  `user_address_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '所属店铺',
  `user_address_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属联系地址',
  `user_address_province_id` int(10) NOT NULL COMMENT '所属地址区',
  `user_address_city_id` int(10) NOT NULL COMMENT '所属地址城市',
  `user_address_area_id` int(10) NOT NULL COMMENT '所属地址区',
  `user_address_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在地区-字符串组合',
  `user_address_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '街道地址-不必重复填写地区',
  `user_address_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `user_address_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认地址0不是1是',
  `user_address_time` datetime NOT NULL,
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`user_address_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 280 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_user_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_user_bank_card`;
CREATE TABLE `udb_ucenter_user_bank_card`  (
  `card_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行名称',
  `bank_card_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行卡号',
  `bank_user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开户人姓名',
  `bank_mobile_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行预留手机号',
  `card_status` int(1) NULL DEFAULT NULL COMMENT '0不显示 1显示',
  `bank_branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行所在地',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '联营商银行卡\r\n' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_user_bind_connect
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_user_bind_connect`;
CREATE TABLE `udb_ucenter_user_bind_connect`  (
  `bind_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '绑定标记：mobie/微信/支付宝openid  绑定类型+openid',
  `bind_type` tinyint(4) NOT NULL COMMENT '绑定类型  1:sinaweibo  2:qq   3:weixin 4.：支付宝  11:email  12:mobile',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `bind_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '绑定时间',
  `bind_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '第三方用户昵称',
  `bind_avator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '第三方用户头像地址',
  `bind_openid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方用户身份认证编号',
  `bind_token` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' COMMENT '第三方用户身份认证口令',
  `bind_province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方用户省份',
  `bind_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方用户市区',
  `bind_unionid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bind_appleid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '手机号绑定appleid',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_auto_login` int(11) NULL DEFAULT 1 COMMENT '微信小程序是否自动登录 1是 2 否',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`bind_id`, `bind_type`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `bind_type`(`bind_type`) USING BTREE,
  INDEX `bind_appleid`(`bind_appleid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户绑定表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_user_business_info
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_user_business_info`;
CREATE TABLE `udb_ucenter_user_business_info`  (
  `tax_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司税号',
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司名称',
  `business_license` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '营业执照',
  `bank_card_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `register_bank` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户行',
  `contact_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contact_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `company_province_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司地址_省',
  `company_city_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司地址_市',
  `company_district_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司地址_区',
  `company_detail_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司地址_详细地址',
  `mail_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '关联用户ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次更新时间',
  `is_approved` int(11) NULL DEFAULT 0 COMMENT '审核状态:0-待审核,1-审核通过,2-审核不通过',
  `audit_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核备注'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '企业用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for udb_ucenter_user_favorites_goods
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_user_favorites_goods`;
CREATE TABLE `udb_ucenter_user_favorites_goods`  (
  `favorites_goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品收藏编号',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `common_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `goods_id` int(10) NULL DEFAULT NULL COMMENT '货品ID',
  `favorites_goods_time` datetime NOT NULL COMMENT '收藏时间',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`favorites_goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏的商品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_user_favorites_shop
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_user_favorites_shop`;
CREATE TABLE `udb_ucenter_user_favorites_shop`  (
  `favorites_shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `shop_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺logo',
  `favorites_shop_time` datetime NOT NULL,
  PRIMARY KEY (`favorites_shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 391 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏的店铺' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_user_grade
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_user_grade`;
CREATE TABLE `udb_ucenter_user_grade`  (
  `user_grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_grade_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_grade_demand` int(10) NOT NULL DEFAULT 0 COMMENT '条件',
  `user_grade_treatment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权益',
  `user_grade_blogo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大图',
  `user_grade_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'LOGO',
  `user_grade_valid` int(1) NOT NULL DEFAULT 0 COMMENT '有效期',
  `user_grade_sum` int(11) NOT NULL DEFAULT 0 COMMENT '年费',
  `user_grade_rate` float(5, 1) NOT NULL DEFAULT 0.0 COMMENT '折扣率',
  `user_grade_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_grade_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户等级表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_user_id_seq
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_user_id_seq`;
CREATE TABLE `udb_ucenter_user_id_seq`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_user_info
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_user_info`;
CREATE TABLE `udb_ucenter_user_info`  (
  `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `password` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `user_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称 不唯一',
  `user_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '状态(0:未激活,1:未认证,2:已认证,3:锁定4.多账号)',
  `user_integral` int(10) NULL DEFAULT 0 COMMENT '用户积分',
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_tj_member` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是天九会员，1-是，0-不是，默认0，不是',
  `client_token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '北京光声_客户端token',
  `merchant_token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '北京光声_商户端token',
  `user_lastlogin_time` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
  `user_lastlogin_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录IP',
  `user_count_login` int(11) NOT NULL COMMENT '登录次数 ',
  `user_is_new` int(3) NOT NULL COMMENT '是否为新用户 0 不是  1是',
  `user_nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `is_management_business` tinyint(2) NULL DEFAULT 0 COMMENT '是否是联营商，1-是，0-不是，默认0，不是\',',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 默认  1 非默认',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `account_type` int(11) NULL DEFAULT NULL COMMENT '0门店会员 1 市级代理  2 省级代理 3厂商',
  `community_background` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社区个人页背景图',
  `user_signature` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社区个性签名',
  `is_business` int(11) NULL DEFAULT 0 COMMENT '是否企业:1-是;0-否',
  `follower_num` int(11) NULL DEFAULT 0 COMMENT '粉丝数',
  `follow_num` int(11) NULL DEFAULT 0 COMMENT '关注数',
  `grade_id` int(11) NULL DEFAULT NULL COMMENT '会员等级id',
  `member_create_time` datetime NULL DEFAULT NULL COMMENT '成为会员时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_mobile`(`user_mobile`) USING BTREE,
  INDEX `user_name`(`user_name`(191)) USING BTREE,
  INDEX `user_lastlogin_ip`(`user_lastlogin_ip`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94522 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基本信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_user_info_detail
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_user_info_detail`;
CREATE TABLE `udb_ucenter_user_info_detail`  (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `user_gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别 0保密1男2女',
  `user_truename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `user_birth` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日(YYYY-MM-DD)',
  `user_sign` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户签名',
  `user_reg_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `user_reg_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `user_phone_code_stats` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获取手机验证码记录(获取次数,上次获取时间) ',
  `user_mobile_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已手机认证 0 否 1是',
  `user_provinceid` int(11) NULL DEFAULT 0 COMMENT '省份id',
  `user_cityid` int(11) NULL DEFAULT 0 COMMENT '城市id',
  `user_areaid` int(11) NULL DEFAULT 0 COMMENT '地区id',
  `user_idcard` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `user_identity_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型  1身份证 2护照 3军官证',
  `user_identity_statu` int(11) NULL DEFAULT NULL COMMENT '0未审核1待审核2审核成功3审核失败',
  `user_identity_font_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件照反面',
  `user_identity_face_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件照正面',
  `user_identity_start_time` date NULL DEFAULT NULL COMMENT '身份证有效期开始时间',
  `user_identity_end_time` date NULL DEFAULT NULL COMMENT '身份证有效期结束时间',
  `user_parent_shop_id` int(11) NULL DEFAULT 0 COMMENT '上级店铺ID ',
  `user_parent_id` int(11) NULL DEFAULT 0 COMMENT '上级推广员ID ',
  `invite_subsite_id` int(11) NULL DEFAULT 0 COMMENT '邀请注册的城市分站ID ',
  `user_platform` int(3) NULL DEFAULT NULL COMMENT '注册用户来源 1:Android; 2:IOS; 6:ios真机调试安装应用',
  `user_grade` int(11) NULL DEFAULT NULL COMMENT '用户经验',
  `user_queen_bee` int(3) NULL DEFAULT 0 COMMENT '是否参加蜂王计划0未参加 1参加',
  `bee_grade` int(3) NULL DEFAULT 0 COMMENT '蜂王等级0普通1幼蜂2蜜蜂3蜂王',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `user_bind_shop_id` int(10) NULL DEFAULT NULL COMMENT '用户绑定店铺id',
  `user_bind_store_id` int(10) NULL DEFAULT NULL COMMENT '用户绑定门店id',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_reg_time`(`user_reg_time`) USING BTREE,
  INDEX `user_parent_shop_id`(`user_parent_shop_id`) USING BTREE,
  INDEX `user_parent_id`(`user_parent_id`) USING BTREE,
  INDEX `user_identity_statu`(`user_identity_statu`) USING BTREE,
  INDEX `user_queen_bee`(`user_queen_bee`) USING BTREE,
  INDEX `bee_grade`(`bee_grade`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户详细信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_ucenter_web_config
-- ----------------------------
DROP TABLE IF EXISTS `udb_ucenter_web_config`;
CREATE TABLE `udb_ucenter_web_config`  (
  `config_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数组下标',
  `config_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数组值',
  `config_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置类型',
  `config_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值，1可能，0不可用',
  `config_comment` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置意见',
  `config_datatype` enum('string','json','number') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型',
  PRIMARY KEY (`config_key`) USING BTREE,
  INDEX `index`(`config_key`, `config_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站配置表\r\n\r\n无用' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_user_address_self
-- ----------------------------
DROP TABLE IF EXISTS `udb_user_address_self`;
CREATE TABLE `udb_user_address_self`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '所属店铺',
  `user_address_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属联系地址',
  `user_address_province_id` int(10) NULL DEFAULT NULL,
  `user_address_city_id` int(10) NULL DEFAULT NULL COMMENT '所属城市',
  `user_address_area_id` int(10) NULL DEFAULT NULL,
  `user_address_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区-字符串组合',
  `user_address_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道地址-不必重复填写地区',
  `user_address_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `user_address_default` tinyint(1) NULL DEFAULT 0 COMMENT '默认地址0不是1是',
  `user_address_time` datetime NULL DEFAULT NULL,
  `is_use` tinyint(1) NULL DEFAULT 0 COMMENT '0未使用 1使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址表----武汉 张家港\r\n\r\n无用' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_user_constant
-- ----------------------------
DROP TABLE IF EXISTS `udb_user_constant`;
CREATE TABLE `udb_user_constant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constant_str` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数量值',
  `constant_int` int(2) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_user_mobile
-- ----------------------------
DROP TABLE IF EXISTS `udb_user_mobile`;
CREATE TABLE `udb_user_mobile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `start` int(2) NULL DEFAULT NULL COMMENT '开始',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_user_update
-- ----------------------------
DROP TABLE IF EXISTS `udb_user_update`;
CREATE TABLE `udb_user_update`  (
  `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_lastlogin_time` datetime NOT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '最后登陆时间更新表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_vk_set
-- ----------------------------
DROP TABLE IF EXISTS `udb_vk_set`;
CREATE TABLE `udb_vk_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `vk_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微客名称',
  `vk_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶部标题',
  `vk_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '顶部图片',
  `apply_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '申请条件  1自动成为  2客户申请',
  `apply_condition` tinyint(1) NOT NULL DEFAULT 1 COMMENT '满足条件  1满足任一勾选条件  2同时满足所有条件',
  `condition_type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '条件类型 1购买指定商品  2邀请会员 3购买+邀请(如果条件是满足任一条件 则两者满足一样即可)',
  `invite_num` int(10) NOT NULL DEFAULT 0 COMMENT '需要邀请的人数',
  `poster_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '海报图片',
  `vk_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启 1开启 2关闭',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微客配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `branch_id` bigint(20) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(11) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for user_mobile
-- ----------------------------
DROP TABLE IF EXISTS `user_mobile`;
CREATE TABLE `user_mobile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `start` int(2) NULL DEFAULT NULL COMMENT '0已使用1未使用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Procedure structure for time_test
-- ----------------------------
DROP PROCEDURE IF EXISTS `time_test`;
delimiter ;;
CREATE PROCEDURE `time_test`()
begin 

 set @t_min=UNIX_TIMESTAMP('2018-02-01');
 set @order_time=now();
 set @cha=@t_max-@t_min;


set @pid = 10000;
while @pid>0 do
 insert into test(t_current_date,last_date) VALUES (FROM_UNIXTIME(@t_min+@cha),now());
set @pid = @pid-1;     
end while;



END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for up_reg_time
-- ----------------------------
DROP PROCEDURE IF EXISTS `up_reg_time`;
delimiter ;;
CREATE PROCEDURE `up_reg_time`()
BEGIN
-- 需要定义接收游标数据的变量 
  DECLARE u_id int(11);
  declare reg_t VARCHAR(19);
  
 
  -- 遍历数据结束标志
  DECLARE done INT DEFAULT FALSE;
 -- 游标
  DECLARE cur CURSOR FOR select user_id,user_lastlogin_time from udb_user_update ;

  -- 将结束标志绑定到游标
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  -- 打开游标
  OPEN cur;
  -- 开始循环
  read_loop: LOOP
    -- 提取游标里的数据，这里只有一个，多个的话也一样；
    FETCH cur INTO u_id,reg_t;
    -- 声明结束的时候
    IF done THEN
     LEAVE read_loop;
    END IF;
    -- 这里做你想做的循环的事件


update udb_ucenter_user_bind_connect set bind_time=reg_t where user_id=u_id;

update udb_ucenter_user_info  set user_lastlogin_time=reg_t where user_id=u_id;

update udb_ucenter_user_info_detail set user_reg_time=UNIX_TIMESTAMP(reg_t) where user_id=u_id;


  END LOOP;
  -- 关闭游标
  CLOSE cur;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
