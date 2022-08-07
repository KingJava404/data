
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pay_card
-- ----------------------------
DROP TABLE IF EXISTS `pay_card`;
CREATE TABLE `pay_card`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `card_num` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡号',
  `total_price` int(11) NOT NULL COMMENT '面额',
  `give_price` float(10, 2) NULL DEFAULT 0.00 COMMENT '赠送(废弃)',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `statu` tinyint(4) NOT NULL COMMENT '状态0未使用，1已使用',
  `use_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用者',
  `creat_time` int(10) UNSIGNED NOT NULL COMMENT '创建时间',
  `stime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '有效开始时间',
  `etime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '到期时间',
  `pic` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `card_desc` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡片描述',
  `card_type` tinyint(1) NULL DEFAULT 0 COMMENT '卡分类：0充值卡，1蜂卡',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indexnum`(`card_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 544 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'mall_fkg系统充值卡表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pay_distributor_earnings
-- ----------------------------
DROP TABLE IF EXISTS `pay_distributor_earnings`;
CREATE TABLE `pay_distributor_earnings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '结算单号',
  `statement_time` datetime NOT NULL DEFAULT '2020-07-01 10:00:28' COMMENT '生成结算单时间',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户用户名',
  `user_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户手机号',
  `user_logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `payment_amount` decimal(10, 2) NOT NULL COMMENT '支付金额',
  `payment_time` datetime NOT NULL DEFAULT '2020-03-01 10:00:28' COMMENT '支付时间',
  `earnings_money` decimal(10, 2) NOT NULL COMMENT '盈利金额',
  `earnings_ratio` decimal(10, 2) NOT NULL COMMENT '盈利比例',
  `return_cash` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `return_time` datetime NOT NULL DEFAULT '2020-07-01 10:00:28' COMMENT '退款时间',
  `return_state` int(2) NOT NULL DEFAULT 1 COMMENT '退款状态 1未退款，2已退款',
  `state` int(11) NOT NULL DEFAULT 10 COMMENT '结算状态0是待提现,1审核中,2打款中,3打款完成,10待生成结算单',
  `earnings_type` int(11) NOT NULL DEFAULT 0 COMMENT '收益类型：1分享红包,2分佣',
  `share_redpacket_state` int(11) NOT NULL DEFAULT 1 COMMENT '分享红包状态:1分享未消费2已消费',
  `add_month` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '月份',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statement_number`(`statement_number`) USING BTREE,
  INDEX `user_parent_id`(`user_parent_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分销商收益记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pay_distributor_share_redpacket
-- ----------------------------
DROP TABLE IF EXISTS `pay_distributor_share_redpacket`;
CREATE TABLE `pay_distributor_share_redpacket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_redpacket_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '分享红包金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分销商分享红包金额' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pay_distributor_statement
-- ----------------------------
DROP TABLE IF EXISTS `pay_distributor_statement`;
CREATE TABLE `pay_distributor_statement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结算单号',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户名',
  `add_month` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加月份',
  `total_payment_amount` decimal(10, 2) NOT NULL COMMENT '总的支付金额',
  `total_earnings_money` decimal(10, 2) NOT NULL COMMENT '总收益',
  `return_cash` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '结算状态0是待提现,1审核中,2打款中,3打款完成,4已退款,10待生成结算单',
  `start_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '结算开始时间',
  `finish_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '结算结束时间',
  `add_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '添加时间',
  `apply_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '申请提现时间',
  `update_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '更新时间',
  `verify_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核人',
  `verify_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核备注',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '银行名称',
  `bank_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开户人姓名',
  `bank_card_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '银行卡号',
  `statement_type` int(11) NOT NULL DEFAULT 0 COMMENT '结算类型：1分享红包,2分佣',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分销商结算单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pay_self_alliance_earnings
-- ----------------------------
DROP TABLE IF EXISTS `pay_self_alliance_earnings`;
CREATE TABLE `pay_self_alliance_earnings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '结算单号',
  `statement_time` datetime NOT NULL DEFAULT '2020-07-01 10:00:28' COMMENT '生成结算单时间',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户用户名',
  `user_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户手机号',
  `user_logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `payment_amount` decimal(10, 2) NOT NULL COMMENT '支付金额',
  `payment_time` datetime NOT NULL DEFAULT '2020-03-01 10:00:28' COMMENT '支付时间',
  `earnings_money` decimal(10, 2) NOT NULL COMMENT '盈利金额',
  `earnings_ratio` decimal(10, 2) NOT NULL COMMENT '盈利比例',
  `return_cash` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `return_time` datetime NOT NULL DEFAULT '2020-07-01 10:00:28' COMMENT '退款时间',
  `return_state` int(2) NOT NULL DEFAULT 1 COMMENT '退款状态 1未退款，2已退款',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '结算状态0是待提现,1审核中,2打款中,3打款完成,10待生成结算单',
  `user_type` int(11) NOT NULL DEFAULT 0 COMMENT '用户类型1主账号,2子账号,3主账号分享,4子账号分享',
  `add_month` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加月份',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statement_number`(`statement_number`) USING BTREE,
  INDEX `user_parent_id`(`user_parent_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `add_month`(`add_month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自营联盟收记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pay_self_alliance_statement
-- ----------------------------
DROP TABLE IF EXISTS `pay_self_alliance_statement`;
CREATE TABLE `pay_self_alliance_statement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结算单号',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户名',
  `add_month` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加月份',
  `total_payment_amount` decimal(10, 2) NOT NULL COMMENT '总的支付金额',
  `total_earnings_money` decimal(10, 2) NOT NULL COMMENT '总收益',
  `return_cash` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '结算状态0是待提现,1审核中,2打款中,3打款完成,4已退款,10待生成结算单',
  `start_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '结算开始时间',
  `finish_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '结算结束时间',
  `add_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '添加时间',
  `apply_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '申请提现时间',
  `update_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '更新时间',
  `verify_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核人',
  `verify_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核备注',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '银行名称',
  `bank_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开户人姓名',
  `bank_card_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '银行卡号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自营联盟结算单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_channel_earnings
-- ----------------------------
DROP TABLE IF EXISTS `pdb_channel_earnings`;
CREATE TABLE `pdb_channel_earnings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_statement` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '渠道商结算单号',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '充值单号',
  `user_parent_id` int(11) NOT NULL COMMENT '上级id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户用户名',
  `user_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户手机号',
  `user_logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `recharge_amount` decimal(10, 0) NOT NULL COMMENT '充值金额',
  `recharge_time` datetime NOT NULL COMMENT '充值时间',
  `earnings_money` decimal(10, 2) NOT NULL COMMENT '盈利金额',
  `earnings_ratio` decimal(10, 2) NOT NULL COMMENT '盈利比例',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '结算状态0是待提现,1审核中,2打款中,3打款完成,10待生成结算单',
  `user_type` int(11) NOT NULL DEFAULT 0 COMMENT '用户类型1渠道商,2子账号,3渠道商分享,4子账号分享',
  `pay_code` int(1) NOT NULL DEFAULT 0 COMMENT '支付方式2-支付宝支付,3-微信支付,9-蜂币支付',
  `add_month` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '添加月份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道商收益' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_channel_statement
-- ----------------------------
DROP TABLE IF EXISTS `pdb_channel_statement`;
CREATE TABLE `pdb_channel_statement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_statement` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道商结算单号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `add_month` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加月份',
  `statement_money` decimal(10, 0) NOT NULL COMMENT '总收益',
  `earnings_money` decimal(10, 0) NOT NULL COMMENT '盈利金额',
  `bank_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '开户人姓名',
  `bank_card_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '银行卡号',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '结算状态0是待提现,1审核中,2打款中,3打款完成',
  `start_time` datetime NOT NULL COMMENT '结算开始时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '结算结束时间',
  `add_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道商申请结算单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_feng_card_info
-- ----------------------------
DROP TABLE IF EXISTS `pdb_feng_card_info`;
CREATE TABLE `pdb_feng_card_info`  (
  `feng_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '蜂卡id',
  `card_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡片账号',
  `card_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡片密码',
  `card_money` decimal(10, 2) NOT NULL COMMENT '卡片金额',
  `time_type` tinyint(2) NULL DEFAULT NULL COMMENT '时间类型',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '用户id',
  `user_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '激活状态;1激活，0未激活',
  `start_activate_time` timestamp NULL DEFAULT NULL COMMENT '充值日期',
  `activation_date` timestamp NULL DEFAULT NULL COMMENT '激活日期',
  PRIMARY KEY (`feng_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '蜂卡激活' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_fx_account
-- ----------------------------
DROP TABLE IF EXISTS `pdb_fx_account`;
CREATE TABLE `pdb_fx_account`  (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `total_account` decimal(20, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '总金额',
  `vk_account` decimal(20, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '微客佣金可提现',
  `yg_account` decimal(20, 2) UNSIGNED NULL DEFAULT NULL COMMENT '员工佣金不可提现',
  `withdraw_freeze_account` decimal(20, 2) NULL DEFAULT NULL COMMENT '提现冻结金额',
  `ali_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户支付宝会员id',
  `ali_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝账号名',
  `mini_wx_open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序openId',
  `mini_wx_user_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '小程序微信名',
  `mini_wx_union_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序用户标识',
  `wx_open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户微信openid',
  `wx_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信授权用户名',
  `wx_union_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信用户标识',
  `create_time` datetime NOT NULL DEFAULT '2021-04-08 00:00:00' COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_mobile`(`user_mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4666 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户分销佣金账户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_fx_record
-- ----------------------------
DROP TABLE IF EXISTS `pdb_fx_record`;
CREATE TABLE `pdb_fx_record`  (
  `record_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易单号',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `record_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `before_record_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '交易之前用户总余额',
  `after_record_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '交易之后用户总余额',
  `record_status` tinyint(1) NOT NULL COMMENT '交易状态 1:待处理 2交易完成 3交易取消4提现失败',
  `trade_type_id` tinyint(4) NULL DEFAULT NULL COMMENT '交易类型1获得佣金 2提现',
  `record_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1微客佣金 2员工佣金',
  `plus_or_minus` int(10) NULL DEFAULT NULL COMMENT '金额正负判断(1:+0:-)',
  `pay_code` int(10) NULL DEFAULT NULL COMMENT '支付方式1支付宝 2微信',
  `pay_from` int(10) NULL DEFAULT NULL COMMENT '支付来源手机端1PC 2wap微信浏览器 3安卓 5ios 6微信小程序 7wap浏览器',
  `ali_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现到支付账户id',
  `ali_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现到支付宝账户名',
  `wx_open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现到微信用户openid',
  `wx_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现到微信用户昵称',
  `record_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `record_status_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态描述',
  `record_date` date NULL DEFAULT NULL COMMENT '日期',
  `create_time` datetime NULL DEFAULT NULL COMMENT '交易时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`record_id`) USING BTREE,
  UNIQUE INDEX `record_id`(`record_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `trade_type_id`(`trade_type_id`) USING BTREE,
  INDEX `record_date`(`record_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户分销佣金交易记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_fx_trade
-- ----------------------------
DROP TABLE IF EXISTS `pdb_fx_trade`;
CREATE TABLE `pdb_fx_trade`  (
  `third_pay_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第三方交易请求单号',
  `record_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易单号',
  `third_trade_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方交易单号',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `total_money` decimal(20, 2) NULL DEFAULT NULL COMMENT '交易总金额',
  `trade_rate` decimal(20, 2) NULL DEFAULT NULL COMMENT '交易费率',
  `trade_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易描述',
  `trade_type_id` tinyint(4) NULL DEFAULT NULL COMMENT '交易类型',
  `trade_status` tinyint(1) NULL DEFAULT NULL COMMENT '是否支付 0:未支付 1:已支付 2:提现失败 3已取消',
  `pay_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝:ALI  微信:WX',
  `error_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方失败错误码',
  `error_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调失败时返回的信息',
  `query_count` int(10) NULL DEFAULT 0 COMMENT '提现失败补偿次数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `notify_time` datetime NULL DEFAULT NULL COMMENT '回调时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`third_pay_id`) USING BTREE,
  UNIQUE INDEX `third_pay_id`(`third_pay_id`) USING BTREE,
  INDEX `record_id`(`record_id`) USING BTREE,
  INDEX `trade_type_id`(`trade_type_id`) USING BTREE,
  INDEX `third_trade_no`(`third_trade_no`) USING BTREE,
  INDEX `error_code`(`error_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分销佣金提现第三方交易记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_money_statics
-- ----------------------------
DROP TABLE IF EXISTS `pdb_money_statics`;
CREATE TABLE `pdb_money_statics`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `money_no_business` decimal(60, 2) NULL DEFAULT NULL COMMENT '不是联营商用户余额',
  `recharge_card_no_business` decimal(60, 2) NULL DEFAULT NULL COMMENT '不是联营商充值卡余额',
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `money_business` decimal(60, 2) NULL DEFAULT NULL COMMENT '联营商用户余额',
  `recharge_card_business` decimal(60, 2) NULL DEFAULT NULL COMMENT '联营商充值卡余额',
  `recharged_amount` decimal(60, 2) NULL DEFAULT NULL COMMENT '已充值金额',
  `unrecharge_amount` decimal(60, 2) NULL DEFAULT NULL COMMENT '激活未充值金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台充值卡统计表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_associates_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_associates_withdraw`;
CREATE TABLE `pdb_pay_associates_withdraw`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(8) NOT NULL COMMENT '用户ID',
  `orderid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易明细ID',
  `os_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '提现金额',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `censor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员',
  `check_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `is_succeed` tinyint(2) NULL DEFAULT 0 COMMENT '0待审核, 1打款中 2审核不通过  3打款完成',
  `bankflow` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行流水账号',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `bank_branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户支行所在地',
  `bank_card_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户人姓名',
  `fee` float(10, 2) NULL DEFAULT 0.00 COMMENT '手续费',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台审核备注',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `os_id` varchar(2555) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算单号',
  `commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '佣金',
  `payment_vouchers` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打款凭证',
  `bank_mobile_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '联营商提现申请表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_card_base
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_card_base`;
CREATE TABLE `pdb_pay_card_base`  (
  `card_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '卡的id',
  `app_id` int(11) NOT NULL DEFAULT 9999 COMMENT 'app id  ： 9999 通用',
  `card_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡名称',
  `card_prize` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡片里面的奖品',
  `card_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '卡片描述',
  `card_start_time` date NOT NULL COMMENT '卡的有效开始时间',
  `card_end_time` date NOT NULL COMMENT '卡的有效结束时间',
  `card_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '卡片图片网址',
  `card_num` int(255) NOT NULL DEFAULT 0 COMMENT '卡片数量',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡片基础信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_card_info
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_card_info`;
CREATE TABLE `pdb_pay_card_info`  (
  `card_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡片激活码',
  `card_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '卡片密码',
  `card_id` int(10) NOT NULL COMMENT '卡片id',
  `card_fetch_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '领奖时间',
  `card_media_id` smallint(6) NOT NULL COMMENT '媒体id,参照base_card_media表',
  `server_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '领卡人的服务器id',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `user_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '领卡人账号',
  `card_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '卡牌生成时间',
  `card_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '充值卡余额',
  `card_froze_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '卡冻结金额',
  `parent_id` int(12) UNSIGNED ZEROFILL NULL DEFAULT 000000000000 COMMENT '标记1可用2已使用0正常',
  PRIMARY KEY (`card_code`) USING BTREE,
  INDEX `ucpIndexs`(`user_id`, `card_money`, `parent_id`) USING BTREE,
  INDEX `card_id`(`card_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卡片信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_card_record
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_card_record`;
CREATE TABLE `pdb_pay_card_record`  (
  `card_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '卡的id',
  `app_id` int(11) NULL DEFAULT 9999 COMMENT 'app id  ： 9999 通用',
  `card_creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `total_price` int(11) NULL DEFAULT NULL COMMENT '面额',
  `card_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '卡片描述',
  `creat_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `stime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '有效开始时间',
  `etime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '到期时间',
  `card_number` int(255) NULL DEFAULT 0 COMMENT '卡片数量',
  `card_start` int(11) NOT NULL COMMENT '开始卡序',
  `card_end` int(11) NOT NULL COMMENT '结束卡序',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '生成充值卡信息记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_consume_deposit
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_consume_deposit`;
CREATE TABLE `pdb_pay_consume_deposit`  (
  `deposit_trade_no` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '交易号',
  `deposit_buyer_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户号',
  `deposit_total_fee` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '交易金额',
  `deposit_pay_channel` int(1) NOT NULL COMMENT '充值的付款方式',
  `deposit_gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易创建时间',
  `deposit_gmt_payment` datetime NULL DEFAULT NULL COMMENT '交易付款时间',
  `deposit_gmt_close` datetime NULL DEFAULT NULL COMMENT '交易关闭时间',
  `deposit_trade_status` tinyint(1) NOT NULL COMMENT '交易状态',
  `deposit_return_trade_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '充值成功以后的流水',
  `deposit_is_recharge_package` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为套餐充值，1-是；0-普通充值',
  `deposit_type` int(11) NULL DEFAULT 1 COMMENT '1是余额 2 是充值卡 ',
  `deposit_operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台充值操作人',
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `deposit_trade_no`(`deposit_trade_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 239 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充值表-支付回调callback使用-确认付款' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_consume_record
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_consume_record`;
CREATE TABLE `pdb_pay_consume_record`  (
  `consume_record_id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT '交易记录id',
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户订单id',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '所属用id',
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `record_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `record_after_money` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '操作之后的金额',
  `record_date` date NOT NULL COMMENT '年-月-日',
  `record_year` smallint(4) NOT NULL COMMENT '年',
  `record_month` tinyint(2) NOT NULL COMMENT '月',
  `record_day` tinyint(2) NOT NULL COMMENT '日',
  `record_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `record_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `trade_type_id` tinyint(1) NOT NULL DEFAULT 0 COMMENT '交易类型(详情pdb_wordbook_pay_trade_type)',
  `user_type` tinyint(1) NOT NULL COMMENT '1-收款方 2-付款方 3-合并订单',
  `record_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '付款状态',
  `record_payorder` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实际支付单号',
  `record_paytime` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `record_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1删除',
  `credit_remain` decimal(16, 2) NULL DEFAULT 0.00 COMMENT '白条剩余还款金额',
  `plus_or_minus` int(10) NOT NULL DEFAULT 1 COMMENT '金额正负判断(1:+0:-)',
  `record_withdraw` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否提现0未提现 1已提现',
  `os_commis_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金金额',
  `os_commis_return_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款佣金金额',
  `record_operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `statement_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `statement_type` tinyint(1) NULL DEFAULT 1 COMMENT '结算订单类型 1-普通订单 2-商家一键上架供应商销售订单商家结算单  3商家一键上架供应商销售订单供应商结算单 4直播分佣结算',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `total_integral` int(11) NULL DEFAULT NULL COMMENT '兑换积分商品所用的积分',
  PRIMARY KEY (`consume_record_id`) USING BTREE,
  UNIQUE INDEX `consume_record_id`(`consume_record_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `record_payorder`(`record_payorder`(255)) USING BTREE,
  INDEX `record_status`(`record_status`) USING BTREE,
  INDEX `user_type`(`user_type`) USING BTREE,
  INDEX `record_time`(`record_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15676 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易明细表-账户收支明细-资金流水表-账户金额变化流水' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_consume_trade
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_consume_trade`;
CREATE TABLE `pdb_pay_consume_trade`  (
  `consume_trade_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易订单id',
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户订单id',
  `buyer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '买家id',
  `seller_id` int(11) NULL DEFAULT 0 COMMENT '卖家id',
  `pay_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '付款人id',
  `order_state_id` tinyint(4) NOT NULL DEFAULT 1 COMMENT '订单状态()',
  `trade_type_id` tinyint(1) NOT NULL COMMENT '交易类型',
  `payment_channel_id` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付渠道',
  `trade_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1:担保交易  2：直接交易',
  `order_payment_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总付款额度 = trade_payment_amount + trade_payment_money + trade_payment_recharge_card + trade_payment_points',
  `trade_payment_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实付金额，在线支付金额',
  `trade_third_party_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '第三方支付金额',
  `trade_payment_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额支付',
  `trade_payment_recharge_card` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '充值卡余额支付',
  `trade_payment_points` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '积分支付',
  `trade_discount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '折扣优惠',
  `trade_commis_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '佣金',
  `trade_commis_refund` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '退还佣金',
  `trade_refund_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单退款',
  `trade_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '总额虚拟的 = trade_order_amount + trade_discount',
  `trade_date` date NOT NULL COMMENT '年-月-日',
  `trade_year` smallint(4) NOT NULL COMMENT '年',
  `trade_month` tinyint(2) NOT NULL COMMENT '月',
  `trade_day` tinyint(2) NOT NULL COMMENT '日',
  `trade_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `trade_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `trade_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `trade_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `trade_pay_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '付款时间',
  `trade_finish_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '结束时间',
  `trade_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `trade_shop_bear` decimal(2, 0) NOT NULL DEFAULT 0 COMMENT '满减活动中店铺承担的折扣金额',
  `trade_platform_bear` decimal(2, 0) NOT NULL DEFAULT 0 COMMENT '满减活动中平台承担的折扣金额',
  `id` bigint(20) NULL DEFAULT NULL COMMENT 'id',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `total_integral` int(11) NULL DEFAULT 0 COMMENT '兑换积分商品所用的积分',
  `integral_goods` int(11) NULL DEFAULT NULL COMMENT '积分商品 0 是 1 否',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `company_id`(`payment_channel_id`) USING BTREE,
  INDEX `consume_trade_id`(`consume_trade_id`) USING BTREE,
  INDEX `buyer_id`(`buyer_id`) USING BTREE,
  INDEX `seller_id`(`seller_id`) USING BTREE,
  INDEX `order_state_id`(`order_state_id`) USING BTREE,
  INDEX `userId`(`buyer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易订单表-强调唯一订单-充值则先创建充值订单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_consume_trade_back
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_consume_trade_back`;
CREATE TABLE `pdb_pay_consume_trade_back`  (
  `consume_trade_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易订单id',
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户订单id',
  `buyer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '买家id',
  `seller_id` int(11) NULL DEFAULT 0 COMMENT '卖家id',
  `pay_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '付款人id',
  `order_state_id` tinyint(4) NOT NULL DEFAULT 1 COMMENT '订单状态()',
  `trade_type_id` tinyint(1) NOT NULL COMMENT '交易类型',
  `payment_channel_id` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付渠道',
  `trade_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1:担保交易  2：直接交易',
  `order_payment_amount` decimal(10, 2) NOT NULL COMMENT '总付款额度 = trade_payment_amount + trade_payment_money + trade_payment_recharge_card + trade_payment_points',
  `trade_payment_amount` decimal(10, 2) NOT NULL COMMENT '实付金额，在线支付金额',
  `trade_third_party_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '第三方支付金额',
  `trade_payment_money` decimal(10, 2) NOT NULL COMMENT '余额支付',
  `trade_payment_recharge_card` decimal(10, 2) NOT NULL COMMENT '充值卡余额支付',
  `trade_payment_points` decimal(10, 2) NOT NULL COMMENT '积分支付',
  `trade_discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣优惠',
  `trade_commis_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '佣金',
  `trade_commis_refund` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还佣金',
  `trade_refund_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单退款',
  `trade_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总额虚拟的 = trade_order_amount + trade_discount',
  `trade_date` date NOT NULL COMMENT '年-月-日',
  `trade_year` smallint(4) NOT NULL COMMENT '年',
  `trade_month` tinyint(2) NOT NULL COMMENT '月',
  `trade_day` tinyint(2) NOT NULL COMMENT '日',
  `trade_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `trade_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `trade_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `trade_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `trade_pay_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '付款时间',
  `trade_finish_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '结束时间',
  `trade_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `trade_shop_bear` decimal(2, 0) NOT NULL COMMENT '满减活动中店铺承担的折扣金额',
  `trade_platform_bear` decimal(2, 0) NOT NULL COMMENT '满减活动中平台承担的折扣金额',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `company_id`(`payment_channel_id`) USING BTREE,
  INDEX `consume_trade_id`(`consume_trade_id`) USING BTREE,
  INDEX `buyer_id`(`buyer_id`) USING BTREE,
  INDEX `seller_id`(`seller_id`) USING BTREE,
  INDEX `order_state_id`(`order_state_id`) USING BTREE,
  INDEX `userId`(`buyer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易订单表-强调唯一订单-充值则先创建充值订单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_consume_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_consume_withdraw`;
CREATE TABLE `pdb_pay_consume_withdraw`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pay_uid` int(8) NOT NULL COMMENT '会员支付ID',
  `orderid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易明细ID',
  `amount` decimal(10, 2) NOT NULL COMMENT '提现金额',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `censor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员',
  `check_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `is_succeed` tinyint(2) NULL DEFAULT 0 COMMENT '是否成功\"0\" => \'\'待审核\'\',\"1\" => \'\'进行中\'\',\"2\" => \'\'打款完成\'\',\"3\" => \'\'通过\'\',\"4\" => \'\'不通过\'\',\',',
  `bankflow` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行流水账号',
  `con` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `bank` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `bank_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行详细地址',
  `cardno` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `cardname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户人姓名',
  `supportTime` int(6) NULL DEFAULT 1 COMMENT '支持时间',
  `fee` float(10, 2) NULL DEFAULT 0.00 COMMENT '手续费',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台审核备注',
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `settlement_order_id` varchar(2555) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算单号',
  `pay_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付人姓名',
  `pay_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付时间',
  `commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '佣金',
  `pay_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '付款金额',
  `withdraw_type` tinyint(1) NULL DEFAULT 1 COMMENT '结算订单类型 1-普通订单 2-商家一键上架供应商销售订单商家结算单  3商家一键上架供应商销售订单供应商结算单 4直播分佣结算',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提现申请表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_transfer_money
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_transfer_money`;
CREATE TABLE `pdb_pay_transfer_money`  (
  `transfer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '转账编号',
  `from_user` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发起转帐或红包的人',
  `to_user` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收人',
  `send_time` datetime NOT NULL COMMENT '发送时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收到时间',
  `transfer_money` decimal(10, 2) NOT NULL COMMENT '转账金额',
  `transfer_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态：0为处理中,1为已收到，2为过期',
  `transfer_txt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '转账说明',
  `transfer_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '交易类型： 1 转帐 2红包',
  `transaction_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易单号',
  PRIMARY KEY (`transfer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '转帐，红包' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_union_order
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_union_order`;
CREATE TABLE `pdb_pay_union_order`  (
  `union_order_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `inorder` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合并订单编号',
  `trade_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称 - 标题',
  `trade_payment_amount` float(10, 2) NOT NULL COMMENT '总价格',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `buyer_id` int(12) NOT NULL COMMENT '买家ID',
  `trade_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `order_state_id` tinyint(1) NOT NULL DEFAULT 1 COMMENT '订单状态 1- 待付款状态',
  `pay_time` datetime NOT NULL COMMENT '支付时间',
  `payment_channel_id` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付通道ID',
  `app_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单来源',
  `trade_type_id` tinyint(1) NOT NULL DEFAULT 0 COMMENT '交易类型',
  `union_cards_pay_amount` decimal(16, 2) NOT NULL COMMENT '购物卡支付金额',
  `union_cards_return_amount` decimal(16, 2) NOT NULL COMMENT '购物卡退款金额',
  `union_money_pay_amount` decimal(16, 2) NOT NULL COMMENT '预存款支付金额',
  `union_money_return_amount` decimal(16, 2) NOT NULL COMMENT '预存款退款金额',
  `union_online_pay_amount` decimal(16, 2) NOT NULL COMMENT '在线支付金额',
  `notify_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付回调参数信息',
  `union_recharge_pay_amount` decimal(16, 2) NOT NULL COMMENT '健康账户支付金额',
  PRIMARY KEY (`union_order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合并支付-单一支付也从此通道' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_user_app
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_user_app`;
CREATE TABLE `pdb_pay_user_app`  (
  `app_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '服务ID',
  `app_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '服务名称',
  `app_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '服务密钥',
  `app_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '服务网址',
  `app_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态  1：启用  0：禁用',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id-平台id，平台结算最后映射到这个用户账户中-platform_id，server_id, platform_user_id',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_user_base
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_user_base`;
CREATE TABLE `pdb_pay_user_base`  (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_pay_passwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付确认密码',
  `user_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否被封禁，0：未封禁，1：封禁',
  `id` bigint(20) NULL DEFAULT NULL COMMENT 'id',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94522 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基础信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_user_base_copy
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_user_base_copy`;
CREATE TABLE `pdb_pay_user_base_copy`  (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_pay_passwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付确认密码',
  `user_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否被封禁，0：未封禁，1：封禁',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基础信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_pay_user_resource
-- ----------------------------
DROP TABLE IF EXISTS `pdb_pay_user_resource`;
CREATE TABLE `pdb_pay_user_resource`  (
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `user_money_pending_settlement` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '待结算余额(废弃)',
  `user_money` decimal(16, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户资金-预付款充值、转账、结算后的款项等等',
  `user_package_money` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '用户充值套餐金额(废弃)',
  `user_money_frozen` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '冻结余额',
  `user_recharge_card` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '充值卡余额-只能从来购物',
  `user_recharge_card_frozen` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '充值卡冻结余额',
  `user_big_treasure` decimal(16, 2) NULL DEFAULT 0.00 COMMENT '用户大宝账户',
  `user_big_treasure_frozen` decimal(16, 2) NULL DEFAULT 0.00,
  `user_small_treasure` decimal(16, 2) NULL DEFAULT 0.00 COMMENT '用户小宝账户',
  `user_points` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '积分',
  `user_points_frozen` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '冻结积分',
  `user_credit_limit` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '信用额度',
  `user_credit_availability` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '可用额度',
  `user_credit_return` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '已还信用额度',
  `user_credit_cycle` mediumint(4) NOT NULL DEFAULT 30 COMMENT '白条还款周期',
  `user_growth` int(10) NOT NULL DEFAULT 0 COMMENT '成长值',
  `user_fixed_recharge_card` decimal(16, 2) NOT NULL DEFAULT 0.00 COMMENT '蜂卡金额',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_recharge_card`(`user_recharge_card`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户资源表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_update_recoup
-- ----------------------------
DROP TABLE IF EXISTS `pdb_update_recoup`;
CREATE TABLE `pdb_update_recoup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recoup_state` int(11) NOT NULL DEFAULT 1 COMMENT '补偿状态1未处理,2已更新',
  `recoup_type` int(11) NOT NULL DEFAULT 0 COMMENT '补偿类型1自营联盟收益',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `recoup_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT '2020-07-26 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '补偿表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_update_user_resource_log
-- ----------------------------
DROP TABLE IF EXISTS `pdb_update_user_resource_log`;
CREATE TABLE `pdb_update_user_resource_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `user_old_money` decimal(16, 2) UNSIGNED NULL DEFAULT NULL COMMENT '更改之前用户余额',
  `user_old_recharge_card` decimal(16, 2) NULL DEFAULT NULL COMMENT '更改之前用户卡余额',
  `user_new_money` decimal(16, 2) UNSIGNED NULL DEFAULT NULL COMMENT '更改之后用户余额',
  `user_new_recharge_card` decimal(16, 2) NULL DEFAULT NULL COMMENT '更改之后用户卡余额',
  `update_money` decimal(16, 2) NULL DEFAULT NULL COMMENT '更新资产金额，-：为扣除，+为增加',
  `update_recharge_card` decimal(16, 2) NULL DEFAULT NULL COMMENT '更新购物卡金额-：为扣除，+为增加',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户资产明细跟踪表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_withdraw_config
-- ----------------------------
DROP TABLE IF EXISTS `pdb_withdraw_config`;
CREATE TABLE `pdb_withdraw_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` decimal(10, 2) NOT NULL DEFAULT 50.00,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提现配置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_wordbook_pay_order_state
-- ----------------------------
DROP TABLE IF EXISTS `pdb_wordbook_pay_order_state`;
CREATE TABLE `pdb_wordbook_pay_order_state`  (
  `order_state_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '状态id',
  `order_state_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态',
  `order_state_text_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_state_text_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_state_text_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_state_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`order_state_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消费状态表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_wordbook_pay_payment_channel
-- ----------------------------
DROP TABLE IF EXISTS `pdb_wordbook_pay_payment_channel`;
CREATE TABLE `pdb_wordbook_pay_payment_channel`  (
  `payment_channel_id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `payment_channel_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '代码名称',
  `payment_channel_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付名称',
  `payment_channel_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式图片',
  `payment_channel_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付接口配置信息',
  `payment_channel_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '接口状态',
  `payment_channel_allow` enum('pc','wap','both') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pc' COMMENT '类型',
  `payment_channel_wechat` tinyint(4) NOT NULL DEFAULT 1 COMMENT '微信中是否可以使用',
  `payment_channel_enable` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`payment_channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付渠道表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_wordbook_pay_record_state
-- ----------------------------
DROP TABLE IF EXISTS `pdb_wordbook_pay_record_state`;
CREATE TABLE `pdb_wordbook_pay_record_state`  (
  `record_state_id` tinyint(4) NOT NULL COMMENT '状态id',
  `record_state_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易状态',
  PRIMARY KEY (`record_state_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_wordbook_pay_service_fee
-- ----------------------------
DROP TABLE IF EXISTS `pdb_wordbook_pay_service_fee`;
CREATE TABLE `pdb_wordbook_pay_service_fee`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务姓名',
  `fee_rates` float(12, 2) NULL DEFAULT 0.00 COMMENT '服务价格',
  `fee_min` int(2) NULL DEFAULT 0 COMMENT '服务最小价格',
  `fee_max` int(2) NULL DEFAULT 0 COMMENT '服务最大价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '服务费用' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_wordbook_pay_trade_mode
-- ----------------------------
DROP TABLE IF EXISTS `pdb_wordbook_pay_trade_mode`;
CREATE TABLE `pdb_wordbook_pay_trade_mode`  (
  `trade_mode_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '交易方式id',
  `trade_mode_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易方式名称',
  `trade_mode_text` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '交易方式名称',
  `trade_mode_partner` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户号',
  `trade_mode_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密钥',
  `trade_mode_sign` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '校验码',
  `trade_mode_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式图片',
  `trade_mode_remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易方式备注',
  PRIMARY KEY (`trade_mode_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易方式表-担保交易' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdb_wordbook_pay_trade_type
-- ----------------------------
DROP TABLE IF EXISTS `pdb_wordbook_pay_trade_type`;
CREATE TABLE `pdb_wordbook_pay_trade_type`  (
  `trade_type_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '状态id',
  `trade_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态',
  `trade_type_text` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`trade_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易类型表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdp_pay_base_app
-- ----------------------------
DROP TABLE IF EXISTS `pdp_pay_base_app`;
CREATE TABLE `pdp_pay_base_app`  (
  `app_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '服务ID',
  `app_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `app_type` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '服务类型',
  `app_seq` int(11) NOT NULL COMMENT '顺序号',
  `app_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务密钥',
  `app_ip_list` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务 IP 列表',
  `app_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务网址',
  `app_admin_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台网址',
  `app_url_recharge` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `app_url_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '检查订单是否存在的url地址',
  `app_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'LOGO 图片地址',
  `app_hosts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名列表',
  `return_fields` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回字段',
  `app_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:启用  0：禁用',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for pdp_pay_web_config
-- ----------------------------
DROP TABLE IF EXISTS `pdp_pay_web_config`;
CREATE TABLE `pdp_pay_web_config`  (
  `config_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数组下标',
  `config_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数组值',
  `config_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置类型',
  `config_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值，1可能，0不可用',
  `config_comment` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置描述',
  `config_datatype` enum('string','json','number') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型',
  PRIMARY KEY (`config_key`) USING BTREE,
  INDEX `index`(`config_key`, `config_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for srm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `srm_supplier`;
CREATE TABLE `srm_supplier`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `legal_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司法人代表',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商地址(省)',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商地址(市)',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商地址(区)',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商详细地址',
  `fixed_area_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话(区号)',
  `fixed_telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话(固定号码)',
  `fixed_ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分机号',
  `fax_area_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真号码(区号)',
  `fax_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真号码(传真号)',
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业邮箱',
  `principal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商联系人',
  `principal_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `status` smallint(6) NOT NULL COMMENT '供应商状态，供应商有如下三种状态：0 删除；1 正常；2 停业,3 关闭运营',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行卡开户名称',
  `bank_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行卡账号',
  `bank_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开户行地址',
  `tax_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后修改日期',
  `version` int(11) NOT NULL COMMENT '版本',
  `is_delete` tinyint(4) NOT NULL COMMENT '是否删除',
  `pause_start_date` date NULL DEFAULT NULL COMMENT '暂停供应开始时间',
  `pause_end_date` date NULL DEFAULT NULL COMMENT '暂停供应结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` date NULL DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

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

SET FOREIGN_KEY_CHECKS = 1;
