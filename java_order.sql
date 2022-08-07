

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) NULL DEFAULT NULL,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for odb_area_sum
-- ----------------------------
DROP TABLE IF EXISTS `odb_area_sum`;
CREATE TABLE `odb_area_sum`  (
  `area_id` int(10) NOT NULL,
  `area_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活跃用户名称',
  `user_count` int(10) NOT NULL DEFAULT 0 COMMENT '活跃用户数量',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '本月区域活跃用户量' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_associates_settlement
-- ----------------------------
DROP TABLE IF EXISTS `odb_associates_settlement`;
CREATE TABLE `odb_associates_settlement`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `os_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结算单编号(年月用户Id)',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `os_start_date` datetime NOT NULL COMMENT '开始日期',
  `os_end_date` datetime NOT NULL COMMENT '结束日期',
  `os_region_amount` decimal(10, 2) NOT NULL COMMENT '区域订单金额',
  `os_region_return_amount` decimal(10, 2) NOT NULL COMMENT '区域退单金额',
  `os_self_amount` decimal(10, 2) NOT NULL COMMENT '自营订单金额',
  `os_self_return_amount` decimal(10, 2) NOT NULL COMMENT '自营退单金额',
  `sub_region_amount` decimal(10, 2) NOT NULL COMMENT '区域分佣金额',
  `sub_self_amount` decimal(10, 2) NOT NULL COMMENT '自营分佣金额',
  `os_amount` decimal(10, 2) NOT NULL COMMENT '应结金额',
  `os_datetime` datetime NOT NULL COMMENT '生成结算单日期',
  `os_date` datetime NOT NULL COMMENT '结算单年月份',
  `os_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1默认(已出账)2联营商已确认，提现中3平台已审核，打款中4打款完成',
  `os_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '财务备注',
  `payment_vouchers` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打款凭证',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1416 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '联营商结算表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_avg_goods_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `odb_avg_goods_evaluation`;
CREATE TABLE `odb_avg_goods_evaluation`  (
  `common_id` int(11) NOT NULL COMMENT '商品ID',
  `evaluation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价',
  `qty` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`common_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评分平均表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_avg_shop_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `odb_avg_shop_evaluation`;
CREATE TABLE `odb_avg_shop_evaluation`  (
  `shop_id` int(10) NOT NULL,
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `avg_servicecredit` decimal(10, 1) UNSIGNED NULL DEFAULT 5.0 COMMENT '平均服务态度评分',
  `avg_deliverycredit` decimal(10, 1) UNSIGNED NULL DEFAULT 5.0 COMMENT '平均发货速度评分',
  `avg_desccredit` decimal(10, 1) NULL DEFAULT NULL COMMENT '平均描述相符分',
  `avg_shipping_time` decimal(10, 2) NULL DEFAULT NULL COMMENT '平均发货时间',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺评分发货速度平均表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_day_order_statics
-- ----------------------------
DROP TABLE IF EXISTS `odb_day_order_statics`;
CREATE TABLE `odb_day_order_statics`  (
  `stat_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `total_refund_fee` decimal(60, 2) NULL DEFAULT NULL COMMENT '总退款金额',
  `total_refund_trade` int(100) NULL DEFAULT NULL COMMENT '总退款数量',
  `total_payment_amount` decimal(60, 2) NULL DEFAULT NULL COMMENT '总订单金额',
  `total_order_trade` int(255) NULL DEFAULT NULL COMMENT '总订单数',
  `complete_trade` int(100) NULL DEFAULT NULL COMMENT '已完成订单数',
  `complete_fee` decimal(60, 2) NULL DEFAULT NULL COMMENT '已完成订单额',
  `cancle_trade` int(10) NULL DEFAULT NULL COMMENT '已取消的订单数',
  `cancle_fee` decimal(60, 2) NULL DEFAULT NULL COMMENT '已取消的订单额',
  PRIMARY KEY (`stat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单每日统计' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_express
-- ----------------------------
DROP TABLE IF EXISTS `odb_express`;
CREATE TABLE `odb_express`  (
  `express_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '快递公司id',
  `express_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司',
  `express_pinyin` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物流',
  `express_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态0关闭1开启',
  `express_displayorder` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否常用0否1是',
  `express_commonorder` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否常用 0 否 1是',
  PRIMARY KEY (`express_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_goods_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `odb_goods_evaluation`;
CREATE TABLE `odb_goods_evaluation`  (
  `evaluation_goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品评论id',
  `user_id` int(10) NOT NULL COMMENT '会员ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名',
  `user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员头像',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `shop_id` int(10) NOT NULL COMMENT '商家ID',
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `common_id` int(10) NOT NULL COMMENT '商品ID',
  `goods_id` int(10) NOT NULL COMMENT '规格Id',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `goods_spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `goods_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格(暂时废弃)',
  `goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片(暂时废弃)',
  `scores` tinyint(1) NULL DEFAULT 5 COMMENT '1-5分',
  `result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结果',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `additional_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '追评内容',
  `additional_content_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '追评回复时间',
  `image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '晒单图片',
  `additional_image` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '追评图片',
  `isanonymous` tinyint(1) NULL DEFAULT 1 COMMENT '是否匿名评价 0 不匿名 1  匿名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态 0禁止显示 1显示 2置顶',
  `explain_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解释内容',
  `additional_explain_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家回复追评内容',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评价时间',
  `additional_reply_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商家回复追评时间',
  `evaluation_from` tinyint(4) NULL DEFAULT NULL COMMENT ' 1 ios  2 pc 3 wap 4 android 5默认好评',
  PRIMARY KEY (`evaluation_goods_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `shop_name`(`shop_name`) USING BTREE,
  INDEX `update_time`(`update_time`) USING BTREE,
  INDEX `common_id`(`common_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `goods_name`(`goods_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评论表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_kdniao_express
-- ----------------------------
DROP TABLE IF EXISTS `odb_kdniao_express`;
CREATE TABLE `odb_kdniao_express`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `express_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递名',
  `express_pinyin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `express_state` int(11) NULL DEFAULT NULL COMMENT '快递状态',
  `customer_name` int(11) NULL DEFAULT NULL COMMENT '操作人姓名',
  `customer_pwd` int(11) NULL DEFAULT NULL COMMENT '操作人密码',
  `month_code` int(11) NULL DEFAULT NULL COMMENT '字码',
  `send_site` int(11) NULL DEFAULT NULL COMMENT '发送码',
  `send_staff` int(11) NULL DEFAULT NULL,
  `logistic_code` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递鸟快递表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_logistic_detaile
-- ----------------------------
DROP TABLE IF EXISTS `odb_logistic_detaile`;
CREATE TABLE `odb_logistic_detaile`  (
  `logistic_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logistic_company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `logistic_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流编号',
  `logistic_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `logistic_status` int(10) NULL DEFAULT NULL COMMENT '0 未发货   4 发货中  6 发货完成 ',
  `order_create_time` datetime NOT NULL,
  `order_receiver_contact` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`logistic_id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '芝麻开门 物流详情' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_mobile_temporary
-- ----------------------------
DROP TABLE IF EXISTS `odb_mobile_temporary`;
CREATE TABLE `odb_mobile_temporary`  (
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `order_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `order_shipping_express_id` int(11) NULL DEFAULT NULL COMMENT '配送公司ID',
  `order_shipping_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '比对表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_month_business
-- ----------------------------
DROP TABLE IF EXISTS `odb_month_business`;
CREATE TABLE `odb_month_business`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(21) NOT NULL COMMENT '用户ID',
  `order_payment_amount` decimal(25, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `district_id` int(25) NULL DEFAULT NULL COMMENT '区域id',
  `district_name` varchar(21) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名',
  `os_order_return_amount` decimal(21, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `business_order_type` int(21) NULL DEFAULT NULL COMMENT '订单类型,1区域订单2自营订单',
  `profit_money` decimal(21, 2) NULL DEFAULT NULL COMMENT '分红后金额',
  `start_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `finish_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '完成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1093 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每月统计联营商分红' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_month_order_statics
-- ----------------------------
DROP TABLE IF EXISTS `odb_month_order_statics`;
CREATE TABLE `odb_month_order_statics`  (
  `stat_id` int(110) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `total_refund_fee` decimal(60, 2) NULL DEFAULT NULL COMMENT '总退款金额',
  `total_refund_trade` int(90) NULL DEFAULT NULL COMMENT '总退款数量',
  `total_payment_amount` decimal(60, 2) NULL DEFAULT NULL COMMENT '总订单金额',
  `total_order_trade` int(255) NULL DEFAULT NULL COMMENT '总订单数',
  `complete_trade` int(100) NULL DEFAULT NULL COMMENT '已完成订单数',
  `complete_fee` decimal(60, 2) NULL DEFAULT NULL COMMENT '已完成订单额',
  `cancle_trade` int(100) NULL DEFAULT NULL COMMENT '已取消的订单数',
  `cancle_fee` decimal(60, 2) NULL DEFAULT NULL COMMENT '已取消的订单额',
  PRIMARY KEY (`stat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单每月统计' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_not_money_order_config
-- ----------------------------
DROP TABLE IF EXISTS `odb_not_money_order_config`;
CREATE TABLE `odb_not_money_order_config`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `config_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下订单未付款 定时取消订单Key',
  `time_out_period` int(20) NULL DEFAULT NULL COMMENT '下订单未付款 定时取消订单vuale  设定多少分钟后 取消订单 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_order_base
-- ----------------------------
DROP TABLE IF EXISTS `odb_order_base`;
CREATE TABLE `odb_order_base`  (
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `shop_id` int(10) NOT NULL COMMENT '卖家店铺id',
  `order_gate_shop_id` int(10) NULL DEFAULT NULL COMMENT '卖家门店id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卖家店铺名称',
  `deliver_shop_id` int(10) NULL DEFAULT NULL COMMENT '发货店铺id',
  `deliver_shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货店铺',
  `buyer_user_id` int(10) NOT NULL DEFAULT 0 COMMENT '买家id',
  `buyer_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家姓名',
  `seller_user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '卖家id',
  `seller_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家姓名',
  `order_date` date NOT NULL COMMENT '订单日期',
  `order_create_time` datetime NOT NULL COMMENT '订单生成时间',
  `order_receiver_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人的姓名',
  `order_receiver_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人的详细地址',
  `order_receiver_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人的联系方式',
  `order_receiver_date` datetime NULL DEFAULT NULL COMMENT '收货时间（最晚收货时间）',
  `order_receiver_province_id` int(10) NOT NULL DEFAULT 0 COMMENT '收货人收货地址区域ID',
  `order_receiver_city_id` int(10) NOT NULL DEFAULT 0 COMMENT '收货人市ID（便于后期扩充）',
  `order_receiver_area_id` int(10) NOT NULL DEFAULT 0 COMMENT '收货人区ID（便于后期统计扩充）',
  `payment_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式id',
  `payment_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式名称',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付(付款)时间',
  `payment_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付单号',
  `payment_other_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方支付平台交易号',
  `pay_code` int(1) NOT NULL DEFAULT 0 COMMENT '支付方式1-余额支付，2-支付宝支付，3-微信支付，4-通联支付,5-健康账户余额支付,6-购物卡支付，7-充值卡+支付宝，8-充值卡+微信,9-蜂币支付，10-蜂币+支付宝，11-蜂币+微信\'',
  `order_seller_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货人的姓名',
  `order_seller_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货人的地址',
  `order_seller_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货人的联系方式',
  `order_shipping_time` datetime NULL DEFAULT NULL COMMENT '配送时间',
  `order_shipping_express_id` int(1) NULL DEFAULT 0 COMMENT '配送公司ID',
  `order_shipping_code` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `order_shipping_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家备注',
  `order_finished_time` datetime NULL DEFAULT NULL COMMENT '订单完成时间',
  `order_invoice` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票信息',
  `order_invoice_id` int(10) NULL DEFAULT NULL COMMENT '发票id',
  `order_goods_amount` decimal(10, 2) NOT NULL COMMENT '商品总价格(不包含运费)',
  `order_payment_amount` decimal(10, 2) NOT NULL COMMENT '应付金额（商品实际支付金额 + 运费）',
  `order_discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠价格（商品金额-支付金额）',
  `order_adjust_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '手工调整金额',
  `order_point_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '买家使用积分',
  `order_shipping_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费价格',
  `order_buyer_evaluation_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '买家评价状态 0-未评价 1-已评价',
  `order_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '订单留言',
  `order_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态 1.待付款 2.已付款 3.待发货 4.已发货 5.已签收 6.确认收货 7.取消 8.退款中 9.已退款 11.待自提\r\n12 虚拟订单已过期',
  `order_points_add` int(10) NOT NULL DEFAULT 0 COMMENT '订单赠送积分',
  `order_discount_type` int(10) NULL DEFAULT 0 COMMENT '优惠方式：0.无；1.代金券；2.红包；3.店铺折扣；4.天九会员；5.红包代金券一起使用',
  `voucher_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '代金券面额',
  `voucher_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代金券编码',
  `order_refund_status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '退款状态:0是无退款,1是退款中,2是退款完成,3退款不通过',
  `order_return_status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '退货状态:0是无退货,1是退货中,2是退货完成，3退货不通过',
  `order_refund_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `order_from` tinyint(4) NULL DEFAULT 1 COMMENT '手机端1PC 2wap微信浏览器 3安卓 5ios 6微信小程序 7wap浏览器',
  `order_commission_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '交易佣金',
  `order_commission_return_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '交易佣金退款',
  `order_is_virtual` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '虚拟订单',
  `order_virtual_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '虚拟商品兑换码',
  `order_virtual_use` tinyint(1) NULL DEFAULT 0 COMMENT '虚拟商品是否使用 0-未使用 1-已使用',
  `order_shop_hidden` tinyint(1) NULL DEFAULT 0 COMMENT '卖家删除',
  `order_buyer_hidden` tinyint(1) NULL DEFAULT 0 COMMENT '买家删除',
  `order_subuser_hidden` tinyint(1) NULL DEFAULT 0 COMMENT '主管账号删除',
  `order_cancel_identity` tinyint(1) NULL DEFAULT 0 COMMENT '订单取消者身份   1-买家 2-卖家 3-系统',
  `order_cancel_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '订单取消原因',
  `order_cancel_date` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `chain_id` int(11) NULL DEFAULT NULL COMMENT '门店id',
  `order_seller_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '卖家给卖家留言',
  `directseller_flag` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否是分佣订单',
  `directseller_p_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '推广员上级',
  `redpacket_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '红包编码',
  `redpacket_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '红包面额',
  `order_rpt_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '红包抵扣订单金额',
  `platform_coupon_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跨店满减券id(购物津贴)',
  `platform_coupon_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '跨店满减面额(购物津贴)',
  `platform_coupon_rpt_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '跨店满减抵扣金额(购物津贴)',
  `order_settlement_time` datetime NULL DEFAULT NULL COMMENT '订单结算时间',
  `order_is_settlement` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '订单是否结算 1-已结算 0-未结算',
  `shop_distributor_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '分销商',
  `order_distribution_seller_type` tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT 'SO订单分销类型 1:直销(E)  2:分销代销转发销售(P, SP)',
  `order_distribution_buyer_type` tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT 'PO订单类型 1:购买(E采购，SP:代销采购)  2:分销采购,代客下单 (P开头)',
  `order_source_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '源订单Id（P开头）:SP开头订单对应的P开头订单',
  `directseller_gp_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '推广员上级的上级',
  `directseller_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '推广员',
  `directseller_is_settlement` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '分销佣金是否结算 1-已经结算 0-未结算',
  `district_id` mediumint(8) NULL DEFAULT 0 COMMENT '所在地,从店铺中同步，冗余检索使用',
  `order_sub_pay` tinyint(1) NULL DEFAULT 0 COMMENT '0：自己支付，1：主管账号支付',
  `order_sub_user` int(10) NULL DEFAULT 0 COMMENT '付款主账号id',
  `order_directseller_commission` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '分销员三级总佣金',
  `directseller_discount` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '等级折扣金额',
  `promoter_user_id` int(10) NULL DEFAULT 0 COMMENT '推广员用户ID',
  `parent_shop_id` int(10) NULL DEFAULT 0 COMMENT '上级店铺ID',
  `invite_subsite_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '推荐注册的城市分站ID(该笔订单由城市分站管理员发展的用户购买）',
  `order_shop_bear` decimal(10, 2) NULL DEFAULT NULL COMMENT '满减活动平台和商家共同承担折扣金额 此为平台承担的折扣金额',
  `order_platform_bear` decimal(10, 2) NULL DEFAULT NULL COMMENT '满减活动平台和商家共同承担折扣金额 此为平台承担的折扣金额',
  `payment_code` tinyint(1) NULL DEFAULT 1 COMMENT '1.线上支付  2.线下支付 3.货到付款',
  `treasure_order_shop_id` int(10) NULL DEFAULT 0 COMMENT '赠品订单上级店铺id',
  `order_promotion_id` tinyint(1) NULL DEFAULT 1 COMMENT '活动ID 0 普通点单 1 砍价（废弃） 2 秒杀 3 限时折扣 4拼团 5 满减增折',
  `groupbuy_status` int(4) NOT NULL DEFAULT 0 COMMENT '北京光声_拼团状态1-拼团中 2-已成功 3未成功 0非拼团',
  `order_buy_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '北京光声_限时抢购id、拼团id、砍价id',
  `order_randerect_return` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还新人随机立减金额',
  `order_operator` tinyint(1) NULL DEFAULT 0 COMMENT '订单来源 1 上海讯有 2 北京',
  `order_delay_status` tinyint(1) NULL DEFAULT 0 COMMENT '0，未启用 1，启用',
  `order_settlement_id` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '结算单id',
  `is_smallOrder` tinyint(1) NULL DEFAULT 0 COMMENT '订单是否是小宝订单。1：是，0不是',
  `order_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除 0：不删除，1：删除',
  `pay_from` tinyint(3) NULL DEFAULT 0 COMMENT '手机端1PC 2wap微信浏览器 3安卓 5ios 6微信小程序 7wap浏览器',
  `return_third_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '第三方退款金额',
  `return_balance_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '余额支付',
  `return_recharge_money` decimal(20, 2) NULL DEFAULT NULL COMMENT '充值卡退款金额',
  `balance_type` int(3) NULL DEFAULT 1 COMMENT '调整类型：1无调整，2多退款，3第三方支付退款到购物卡4,购物卡多支付',
  `balance_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '调整金额',
  `liveId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accountId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` bigint(20) NULL DEFAULT NULL COMMENT 'id',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `virtual_goods` int(11) NULL DEFAULT 1 COMMENT '虚拟订单 0 是 1 否',
  `period_of_validity` datetime NULL DEFAULT NULL COMMENT '虚拟订单有效期',
  `past_due` int(11) NULL DEFAULT NULL COMMENT '过期退款 0 是 1 否',
  `redeem_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '虚拟商品兑换码',
  `redeem_code_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '虚拟商品兑换二维码url',
  `is_cancel` int(2) UNSIGNED NULL DEFAULT 1 COMMENT '是否核销0是1否 2已过期',
  `cancel_date` datetime NULL DEFAULT NULL COMMENT '核销时间',
  `integral_goods` int(11) NULL DEFAULT 1 COMMENT '积分商品订单 0是 1否',
  `total_integral` int(11) NULL DEFAULT 0 COMMENT '所需的积分',
  `order_is_shop_take` int(1) NULL DEFAULT NULL COMMENT '是否是门店自提订单 1是 2否',
  `vk_share_user_id` int(10) NULL DEFAULT 0 COMMENT '微客申请分享人id',
  `dealer_commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '待发货订单 经销商佣金',
  `dealer_return_commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '经销商退还佣金',
  `supply_commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '待发货订单供应商佣金',
  `supply_return_commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '供应商退还佣金',
  `order_type` tinyint(1) NULL DEFAULT 1 COMMENT '1普通订单   2商家批发订单(商家购买批发商商品订单)  3爆品绑定订单   4直播订单',
  `drop_shipping` tinyint(1) NULL DEFAULT 2 COMMENT '用户订单是否供应商代发货 1是  2否',
  `order_last_return_time` datetime NULL DEFAULT NULL COMMENT '订单最后售后时间',
  `order_supply_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品订单供货价',
  `order_company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `pintuan_markId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼团的 团id',
  `manjian_discount` decimal(10, 0) NULL DEFAULT NULL COMMENT '满减优惠金额',
  `manzhe_discount` decimal(10, 0) NULL DEFAULT NULL COMMENT '满折优惠金额',
  `giveaway_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '赠品信息',
  `base_member_discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员折扣',
  `order_supply_is_settlement` int(10) NULL DEFAULT 0 COMMENT '是否 经销 结算',
  `order_supply_settlement_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经销结算id',
  `order_supply_settlement_time` datetime NULL DEFAULT NULL COMMENT '经销结算时间',
  `invoice_status` int(11) NULL DEFAULT 0 COMMENT '开票状态:0-未开票;1-审核中;2-已出票;3-未通过',
  `invoice_id` int(11) NULL DEFAULT NULL COMMENT '发票ID',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `buyer_user_id`(`buyer_user_id`) USING BTREE,
  INDEX `seller_user_id`(`seller_user_id`) USING BTREE,
  INDEX `order_status`(`order_status`) USING BTREE,
  INDEX `order_finished_time`(`order_finished_time`) USING BTREE,
  INDEX `buyer_user_name`(`buyer_user_name`) USING BTREE,
  INDEX `shop_name`(`shop_name`) USING BTREE,
  INDEX `order_create_time`(`order_create_time`) USING BTREE,
  INDEX `payment_number`(`payment_number`) USING BTREE,
  INDEX `order_shipping_express_id`(`order_shipping_express_id`) USING BTREE,
  INDEX `payment_time`(`payment_time`) USING BTREE,
  INDEX `redpacket_code`(`redpacket_code`) USING BTREE,
  INDEX `parent_shop_id`(`parent_shop_id`) USING BTREE,
  INDEX `payment_other_number`(`payment_other_number`) USING BTREE,
  INDEX `order_receiver_area_id`(`order_receiver_area_id`) USING BTREE,
  INDEX `promoter_user_id`(`promoter_user_id`) USING BTREE,
  INDEX `order_goods_amount`(`order_goods_amount`) USING BTREE,
  INDEX `order_payment_amount`(`order_payment_amount`) USING BTREE,
  INDEX `order_refund_status`(`order_refund_status`) USING BTREE,
  INDEX `order_return_status`(`order_return_status`) USING BTREE,
  INDEX `order_is_settlement`(`order_is_settlement`) USING BTREE,
  INDEX `order_settlement_id`(`order_settlement_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详细信息' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_order_commission
-- ----------------------------
DROP TABLE IF EXISTS `odb_order_commission`;
CREATE TABLE `odb_order_commission`  (
  `order_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `goods_num` int(10) NULL DEFAULT NULL COMMENT '购买数量',
  `goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `cat_id` int(10) NULL DEFAULT NULL COMMENT '分类id',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '商品所属店铺id',
  `share_user_id` int(11) NOT NULL COMMENT '分享用户id',
  `share_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享用户名',
  `share_user_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享用户手机号',
  `share_user_shop_id` int(11) NULL DEFAULT NULL COMMENT '分享用户店铺id',
  `share_user_store_id` int(11) NULL DEFAULT NULL COMMENT '分享用户门店id',
  `share_user_store_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享用户门店',
  `buy_user_id` int(11) NOT NULL COMMENT '购买用户id',
  `buy_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买用户名',
  `buy_user_mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买用户手机号',
  `buy_user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买用户头像',
  `buy_user_time` datetime NULL DEFAULT NULL COMMENT '购买用户最后登录时间',
  `order_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1待支付  2未入账  3已入账  4已退款 5已取消',
  `order_price` decimal(10, 2) NOT NULL COMMENT '订单金额',
  `return_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `tg_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '推广佣金比例',
  `fx_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '分享佣金比例',
  `tg_commission` decimal(10, 2) NOT NULL COMMENT '推广佣金',
  `fx_commission` decimal(10, 2) NOT NULL COMMENT '分享佣金',
  `return_tg_commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退还推广佣金',
  `return_fx_commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退还分享佣金',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `return_time` datetime NULL DEFAULT NULL COMMENT '退款时间',
  `commission_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1会员微客佣金   2员工微客佣金',
  `bind_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '购买用户是否分享用户下级  1是  2否',
  `settle_record_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算交易id',
  `settle_state` tinyint(1) NULL DEFAULT 0 COMMENT '0未结算  1已结算',
  `settle_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `is_shop_vk` int(10) NULL DEFAULT 1 COMMENT '购物者是否已成为订单所属店铺的微客：0，否；1，是',
  `fx_tg` int(10) NULL DEFAULT 1 COMMENT '分享 1 推广 2 ',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `share_user_id_2`(`share_user_id`) USING BTREE,
  INDEX `buy_user_id`(`buy_user_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `share_user_id`(`buy_user_id`, `share_user_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `return_time`(`return_time`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '佣金订单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `odb_order_goods`;
CREATE TABLE `odb_order_goods`  (
  `order_goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `shop_id` mediumint(10) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名',
  `goods_id` int(10) NOT NULL COMMENT '商品id',
  `common_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品common_id',
  `buyer_user_id` int(10) NOT NULL DEFAULT 0 COMMENT '买家id',
  `goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goods_class_id` int(10) NULL DEFAULT NULL COMMENT '商品对应的类目ID',
  `spec_id` int(10) NULL DEFAULT NULL COMMENT '规格id(废弃)',
  `order_spec_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格描述(废弃)',
  `order_spec_chineseValue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文规格值',
  `goods_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格（商品原价，goods_base中的商品价格未参加任何活动的价格）',
  `order_goods_num` smallint(5) UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品数量',
  `goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `order_goods_returnnum` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '退货数量',
  `order_goods_amount` decimal(10, 2) NOT NULL COMMENT '商品金额 （实付金额）= order_goods_payment_amount* order_goods_num',
  `order_goods_platform_bear` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠活动中平台承担的金额',
  `order_goods_discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠金额 = （商品原价-实付金额）*商品数量(废弃)',
  `order_goods_payment_amount` decimal(20, 2) UNSIGNED NOT NULL COMMENT '实付金额',
  `order_goods_adjust_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '手工调整金额',
  `order_goods_point_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分费用(废弃)',
  `order_goods_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单商品的佣金 (总)(废弃)',
  `order_goods_status` tinyint(1) NOT NULL COMMENT '订单状态',
  `order_goods_evaluation_status` tinyint(1) NOT NULL COMMENT '评价状态 0为评价，1已评价',
  `order_rpt_price` decimal(10, 2) NOT NULL COMMENT '红包抵扣金额',
  `voucher_price` decimal(10, 2) NOT NULL COMMENT '代金券抵扣金额',
  `platform_coupon_rpt_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '跨店满减抵扣金额',
  `order_goods_benefit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '订单商品优惠(废弃)',
  `goods_return_status` tinyint(1) NOT NULL COMMENT '退货状态:0是无退货,1是退货中,2是退货完成 3商家拒绝退货',
  `goods_refund_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '退款状态：0：无退款 1：退款中 2：退款完成  3：商家拒绝退款',
  `order_goods_time` datetime NOT NULL COMMENT '创建时间',
  `directseller_flag` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否参与分销(废弃)',
  `directseller_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '推广销售员-订单(废弃)',
  `directseller_is_settlement` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '分销佣金是否结算 1-已经结算 0-未结算(废弃)',
  `directseller_commission_0` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '直属一级分佣(废弃)',
  `directseller_commission_1` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '直属二级分佣(废弃)',
  `directseller_commission_2` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '直属三级分佣(废弃)',
  `directseller_goods_discount` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '等级折扣金额(废弃)',
  `order_goods_source_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'SP订单号(废弃)',
  `order_goods_source_ship` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '供应商物流(废弃)',
  `order_goods_finish_time` datetime NULL DEFAULT NULL COMMENT '订单商品完成时间',
  `promoter_commission_price` decimal(10, 4) NULL DEFAULT NULL COMMENT '推广员佣金金额（单件商品）(废弃)',
  `parent_shop_commission_price` decimal(10, 4) NULL DEFAULT NULL COMMENT '上级店铺佣金金额（单件商品）(废弃)',
  `order_goods_id_deliver` tinyint(1) NULL DEFAULT 0 COMMENT '商品订单是否已经发货。1-是，0-否，默认0',
  `order_seller_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货人的姓名',
  `order_seller_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货人的地址',
  `order_seller_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货人的联系方式',
  `order_shipping_time` datetime NULL DEFAULT NULL COMMENT '配送时间',
  `order_shipping_express_id` int(1) NULL DEFAULT 0 COMMENT '配送公司ID',
  `order_shipping_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `shipping_fee` decimal(10, 2) NOT NULL COMMENT '商品运费',
  `order_shipping_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家备注',
  `order_randerect_fee` decimal(10, 2) NULL DEFAULT NULL,
  `order_is_randerect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_id` tinyint(1) NULL DEFAULT 1 COMMENT '活动ID 0 普通点单 1 砍价（废弃） 2 秒杀 3 限时折扣 4拼团 5 满减增折',
  `goods_promotion_id` int(10) NULL DEFAULT 0 COMMENT '活动ID',
  `parent_shop_id` int(10) NULL DEFAULT NULL COMMENT '上级店铺ID',
  `is_smallOrder` tinyint(1) NULL DEFAULT 0 COMMENT '订单是否是小宝订单。1：是，0不是',
  `order_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除 0：不删除，1：删除',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `integral` int(11) NULL DEFAULT NULL COMMENT '商品购买所需积分',
  `dealer_commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '代发货订单 经销商佣金',
  `dealer_return_commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '经销商退还佣金',
  `supply_commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '代发货订单供应商佣金',
  `supply_return_commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '供应商退还佣金',
  `goods_member_discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员折扣',
  PRIMARY KEY (`order_goods_id`) USING BTREE,
  UNIQUE INDEX `order_goods_id`(`order_goods_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE COMMENT '(null)',
  INDEX `buyer_user_id`(`buyer_user_id`) USING BTREE,
  INDEX `order_goods_status`(`order_goods_status`) USING BTREE,
  INDEX `order_goods_time`(`order_goods_time`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `order_goods_id_deliver`(`order_goods_id_deliver`) USING BTREE,
  INDEX `order_shipping_express_id`(`order_shipping_express_id`) USING BTREE,
  INDEX `common_id`(`common_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210463 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `odb_order_invoice`;
CREATE TABLE `odb_order_invoice`  (
  `order_invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `invoice_state` int(11) NULL DEFAULT 0 COMMENT '0不开发票1普通发票2电子发票3增值税发票',
  `invoice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发票抬头[普通发票]',
  `invoice_content` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发票内容[普通发票]',
  `invoice_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位名称',
  `invoice_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '纳税人识别号',
  `invoice_reg_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册地址',
  `invoice_reg_phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册电话',
  `invoice_reg_bname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '开户银行',
  `invoice_reg_baccount` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '银行帐户',
  `invoice_rec_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收票人姓名',
  `invoice_rec_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收票人手机号',
  `invoice_rec_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收票人邮箱',
  `invoice_rec_province` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收票人省份',
  `invoice_goto_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '送票地址',
  `invoice_province_id` int(11) NULL DEFAULT NULL COMMENT '收票人省Id',
  `invoice_city_id` int(11) NULL DEFAULT NULL COMMENT '收票人市id',
  `invoice_area_id` int(11) NULL DEFAULT NULL COMMENT '收票人区id',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`order_invoice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单发票信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_order_not_completed
-- ----------------------------
DROP TABLE IF EXISTS `odb_order_not_completed`;
CREATE TABLE `odb_order_not_completed`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `buyer_user_id` int(11) NULL DEFAULT NULL COMMENT '买家id',
  `order_create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `order_payment_time` datetime NULL DEFAULT NULL COMMENT '订单付款时间',
  `import_time` datetime NULL DEFAULT NULL COMMENT '导入本表时间',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '货品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '月份未完成订单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_order_return
-- ----------------------------
DROP TABLE IF EXISTS `odb_order_return`;
CREATE TABLE `odb_order_return`  (
  `order_return_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '退货记录ID',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `order_is_virtual` tinyint(1) NULL DEFAULT 0 COMMENT '虚拟订单(暂时废弃)',
  `order_amount` decimal(8, 2) NULL DEFAULT NULL COMMENT '订单总额',
  `order_goods_id` int(10) NULL DEFAULT 0 COMMENT '退货商品编号，0为退款',
  `order_goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款商品名称',
  `order_goods_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `order_goods_num` int(10) NULL DEFAULT NULL COMMENT '退货数量',
  `order_goods_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `return_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货编号',
  `return_type` tinyint(1) NULL DEFAULT 1 COMMENT '1-退款申请 2-退货申请',
  `shop_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '卖家ID(shopId)',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `seller_user_id` int(10) NULL DEFAULT NULL COMMENT '卖家Id',
  `seller_user_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家账号',
  `buyer_user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '买家ID',
  `buyer_user_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家会员名',
  `return_add_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `return_reason_id` int(10) NULL DEFAULT NULL COMMENT '退款理由id',
  `return_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款理由',
  `return_message` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货备注',
  `return_real_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `return_addr_id` int(10) NULL DEFAULT NULL COMMENT '收货地址id',
  `return_addr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `return_addr` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址详情',
  `return_shipping_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货物流Id',
  `return_post_code` int(6) NULL DEFAULT NULL COMMENT '邮编',
  `return_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `return_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机',
  `return_state` tinyint(1) NULL DEFAULT 1 COMMENT '0-商家拒绝 1-新发起等待卖家审核 2-卖家审核通过 3-卖家审核不通过 4-卖家收到货物 5-平台审核通过 6-买家已填物流 7-平台拒绝',
  `return_cash` decimal(8, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `return_shop_time` datetime NULL DEFAULT NULL COMMENT '商家处理时间',
  `return_shop_message` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家备注',
  `return_finish_time` datetime NULL DEFAULT NULL COMMENT '退款完成时间',
  `return_commision_fee` decimal(8, 2) NULL DEFAULT NULL COMMENT '退还佣金(暂时废弃)',
  `return_platform_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台留言',
  `return_goods_return` tinyint(1) NULL DEFAULT 0 COMMENT '是否需要退货 0-不需要，1-需要',
  `behalf_deliver` tinyint(1) NULL DEFAULT 0 COMMENT '分销代发货  0：不代发货 1：代发货(分销订单DD) 2：代发货（供应订单SP）(暂时废弃)',
  `return_rpt_cash` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还平台红包金额',
  `return_shop_handle` tinyint(1) NULL DEFAULT NULL COMMENT '商家处理结果  1-待处理  2-卖家审核通过 3-卖家审核不通过(暂废弃，状态同return_state)',
  `return_platform_bear` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还折扣活动中品台承担的折扣金额',
  `order_is_settlement` tinyint(1) NULL DEFAULT 0 COMMENT '是否结算',
  `order_settlement_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `order_settlement_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算单号',
  `order_operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核操作人',
  `order_operator_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `order_supply_is_settlement` tinyint(1) NULL DEFAULT 0 COMMENT '供应商是否结算',
  `order_supply_settlement_time` datetime NULL DEFAULT NULL COMMENT '供应商结算时间',
  `order_supply_settlement_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商结算id',
  `return_member_discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还会员折扣',
  `return_supper_discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还经销等级折扣',
  `return_shipping_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还运费 订单全退退运费 半退不退',
  PRIMARY KEY (`order_return_id`) USING BTREE,
  UNIQUE INDEX `return_code`(`return_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1071 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_order_settlement
-- ----------------------------
DROP TABLE IF EXISTS `odb_order_settlement`;
CREATE TABLE `odb_order_settlement`  (
  `os_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结算单编号(年月店铺ID)',
  `os_start_date` datetime NOT NULL COMMENT '开始日期',
  `os_end_date` datetime NOT NULL COMMENT '结束日期',
  `os_order_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单金额',
  `os_shipping_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '运费',
  `os_order_return_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退单金额',
  `os_commis_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金金额',
  `os_commis_return_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退还佣金',
  `os_shop_cost_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '店铺促销活动费用',
  `os_platform_bear_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '平台承担的店铺折扣金额',
  `os_platform_bear_return_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退还的平台承担的折扣金额',
  `os_dealer_commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '经销商佣金',
  `os_dealer_return_commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '经销商退还佣金',
  `os_supply_commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '供应商佣金',
  `os_supply_return_commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '供应商退还佣金',
  `os_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '应结金额',
  `os_datetime` datetime NOT NULL COMMENT '生成结算单日期',
  `os_date` date NOT NULL COMMENT '结算单年月份',
  `os_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1默认(已出账)2店家已确认3平台已审核4结算完成 5已提现',
  `os_pay_date` datetime NOT NULL COMMENT '付款日期',
  `os_pay_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付备注',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺名',
  `os_order_type` tinyint(1) NOT NULL COMMENT '结算订单类型 1-普通订单 2-商家一键上架供应商销售订单商家结算单  3商家一键上架供应商销售订单供应商结算单 4直播分佣结算',
  `os_redpacket_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '红包金额',
  `os_redpacket_return_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退还红包',
  `district_id` mediumint(8) NOT NULL DEFAULT 0 COMMENT '地区id,0表示全国',
  `os_directseller_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '分销佣金总额',
  `os_order_randerect_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '新人随机立减',
  `os_order_return_randerect_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '新人随机立减退款',
  `os_order_bargain_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '砍价金额',
  `os_is_display` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 1 COMMENT '结算单是否显示 0不显示 1显示',
  `os_fine_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '罚款金额',
  `os_base_member_discount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '会员折扣',
  `os_return_member_discount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '退还会员折扣',
  `os_tg_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '推广佣金',
  `os_fx_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '分享佣金',
  `os_supper_discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '供应商经销等级 折扣',
  `os_return_supper_discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '供应商退还经销等级折扣',
  `os_supply_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '供货价',
  `os_return_supply_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还供货价',
  PRIMARY KEY (`os_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单结算表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_pay_on_delivery
-- ----------------------------
DROP TABLE IF EXISTS `odb_pay_on_delivery`;
CREATE TABLE `odb_pay_on_delivery`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `user_id` int(11) NOT NULL COMMENT '店铺账号的所属用户ID',
  `apply_status` int(11) NOT NULL COMMENT '1：待审核（用户申请开启后数据库状态为1）\n2：正常（平台审核通过）\n3：待审核（用户申请关闭后数据库状态为3）\n4：审核失败（平台审核不通过）',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '开通/关闭理由',
  `platform_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '平台审核的原因',
  `create_time` datetime NULL DEFAULT NULL COMMENT '申请记录创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新记录时间',
  `agree_time` datetime NULL DEFAULT NULL COMMENT '最近通过审核的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_payment_sum
-- ----------------------------
DROP TABLE IF EXISTS `odb_payment_sum`;
CREATE TABLE `odb_payment_sum`  (
  `sum_time` date NOT NULL COMMENT '月份',
  `sum_amount` decimal(10, 2) NOT NULL COMMENT '月度交易额',
  PRIMARY KEY (`sum_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '每月销售额' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_payment_vocher
-- ----------------------------
DROP TABLE IF EXISTS `odb_payment_vocher`;
CREATE TABLE `odb_payment_vocher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联ordere id',
  `order_payment_voucher_imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '支付凭证url 图片路径',
  `review_status` tinyint(3) NULL DEFAULT NULL COMMENT '审核状态  0 待上传   1 待审核 2 已审核 3 审核驳回',
  `review_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `review_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付凭证关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_shop_complain_base
-- ----------------------------
DROP TABLE IF EXISTS `odb_shop_complain_base`;
CREATE TABLE `odb_shop_complain_base`  (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `shop_id` int(10) NOT NULL COMMENT '店铺Id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `buyuser_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家账号',
  `buyuser_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家联系方式',
  `complain_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉内容',
  `complain_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉图片,逗号分隔',
  `complain_datetime` datetime NOT NULL COMMENT '投诉时间',
  `penalty_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '罚款金额',
  `note_taker` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录人',
  `fine_states` int(11) NOT NULL DEFAULT 0 COMMENT '罚款状态0未罚1已取消2已罚',
  `settlement_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算单编号(年月店铺ID)',
  PRIMARY KEY (`complain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺投诉信息表表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_shop_dpexpress
-- ----------------------------
DROP TABLE IF EXISTS `odb_shop_dpexpress`;
CREATE TABLE `odb_shop_dpexpress`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '快递表ID',
  `express_id` int(5) NOT NULL COMMENT '快递ID',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT 'shop_ip店铺ID',
  `CustomerName` char(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '客户简称',
  `CustomerPwd` char(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '秘钥',
  `MonthCode` char(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密钥串',
  `SendSite` char(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '客户商号ID或仓库ID',
  `SendStaff` char(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收件快递员(网点提供)',
  `LogisticCode` char(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '快递单号',
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递公司提供快递账号表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_shop_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `odb_shop_evaluation`;
CREATE TABLE `odb_shop_evaluation`  (
  `evaluation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `shop_id` int(10) NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '买家id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家名',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `evaluation_desccredit` tinyint(1) UNSIGNED NOT NULL DEFAULT 5 COMMENT '描述相符评分',
  `evaluation_servicecredit` tinyint(1) UNSIGNED NOT NULL DEFAULT 5 COMMENT '服务态度评分',
  `evaluation_deliverycredit` tinyint(1) UNSIGNED NOT NULL DEFAULT 5 COMMENT '发货速度评分',
  `evaluation_create_time` datetime NOT NULL COMMENT '评价时间',
  PRIMARY KEY (`evaluation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺评分表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_shop_franchises_type
-- ----------------------------
DROP TABLE IF EXISTS `odb_shop_franchises_type`;
CREATE TABLE `odb_shop_franchises_type`  (
  `shopId` int(11) NOT NULL,
  `desc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序列',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '1-使用中 2-未使用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`shopId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺联营商渠道表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_shop_kdniao
-- ----------------------------
DROP TABLE IF EXISTS `odb_shop_kdniao`;
CREATE TABLE `odb_shop_kdniao`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺编号',
  `EBussinessID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递鸟Id',
  `AppKey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '快递鸟密钥',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '1正常0冻结',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺批量打印快递鸟信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_shop_shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `odb_shop_shipping_address`;
CREATE TABLE `odb_shop_shipping_address`  (
  `shipping_address_id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '所属店铺',
  `shipping_address_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `shipping_address_province_id` int(10) NOT NULL COMMENT '省份ID',
  `shipping_address_city_id` int(10) NOT NULL COMMENT '城市ID',
  `shipping_address_area_id` int(10) NOT NULL COMMENT '区县ID',
  `shipping_address_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在地区-字符串组合',
  `shipping_address_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '街道地址-不必重复填写地区',
  `shipping_address_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `shipping_address_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认地址',
  `shipping_address_time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`shipping_address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发货地址表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_shop_sum
-- ----------------------------
DROP TABLE IF EXISTS `odb_shop_sum`;
CREATE TABLE `odb_shop_sum`  (
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺名称',
  `shop_sum_amount` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_statistics_cat
-- ----------------------------
DROP TABLE IF EXISTS `odb_statistics_cat`;
CREATE TABLE `odb_statistics_cat`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_cat_id` int(11) NOT NULL COMMENT '类目id',
  `first_cat_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目名称',
  `cat_turnover_self` decimal(10, 2) NOT NULL COMMENT '自身交易',
  `cat_turnover_real` decimal(10, 2) NOT NULL COMMENT '真实交易',
  `cat_turnover_all` decimal(10, 2) NOT NULL COMMENT '总交易额',
  `cat_statistics_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计数据 月份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '按商品类型每月插入表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_statistics_month
-- ----------------------------
DROP TABLE IF EXISTS `odb_statistics_month`;
CREATE TABLE `odb_statistics_month`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `turnover_self` decimal(10, 2) NOT NULL COMMENT '自身交易',
  `turnover_real` decimal(10, 2) NULL DEFAULT NULL COMMENT '真实交易',
  `statistics_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计数据 月份',
  `proportion` decimal(10, 2) NULL DEFAULT NULL COMMENT '占比',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '按真是交易和自身交易月度统计表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_statisticsarea_area
-- ----------------------------
DROP TABLE IF EXISTS `odb_statisticsarea_area`;
CREATE TABLE `odb_statisticsarea_area`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `area_id` int(11) NOT NULL COMMENT '区域id',
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称',
  `area_turnover_self` decimal(10, 2) NOT NULL COMMENT '自身交易',
  `area_turnover_real` decimal(10, 2) NULL DEFAULT NULL COMMENT '真实交易',
  `area_turnover_all` decimal(10, 2) NOT NULL COMMENT '总交易额',
  `area_statistics_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计数据 月份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '按区域统计表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_supplier_order_base
-- ----------------------------
DROP TABLE IF EXISTS `odb_supplier_order_base`;
CREATE TABLE `odb_supplier_order_base`  (
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `supplier_shop_id` int(10) NULL DEFAULT NULL COMMENT '供应商店铺id',
  `goods_id` int(10) NULL DEFAULT NULL COMMENT '商品id',
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品id',
  `goods_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '供应商 的商品价格',
  `goods_num` int(10) NULL DEFAULT NULL COMMENT '购买数量',
  `goods_price_sum` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单价 商品价格乘购买数量 减运费 ',
  `goods_payment_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '供应商实付金额 含运费',
  `order_refund_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `order_return_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '退货金额',
  `order_return_discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还的经销折扣 全退 退经销折扣 半退不退',
  `supper_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台抽供应商佣金',
  `supper_return_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台抽供应商退还佣金',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for odb_system_message
-- ----------------------------
DROP TABLE IF EXISTS `odb_system_message`;
CREATE TABLE `odb_system_message`  (
  `message_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `message_user_id` int(10) NOT NULL COMMENT '消息接收者id',
  `message_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息接收者',
  `message_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '消息类型买家1订单信息3账户信息4其他',
  `message_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息标题',
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `message_islook` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否读取0未1读取',
  `message_create_time` datetime NOT NULL COMMENT '消息创建时间',
  `message_isdel` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 0：未删除 1：已删除',
  `message_mold` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0买家1商家',
  `shop_id` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺id',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 606 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统消息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_user_cart
-- ----------------------------
DROP TABLE IF EXISTS `odb_user_cart`;
CREATE TABLE `odb_user_cart`  (
  `cart_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '买家id',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `common_id` int(10) NOT NULL COMMENT '商品Id',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '规格id',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `goods_num` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `goods_stock` int(10) NOT NULL COMMENT '库存',
  `goods_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1普通商品  2供应商商品',
  `goods_spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格(废弃)',
  `goods_spec_chineseValue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格',
  `insert_cart_time` datetime NOT NULL COMMENT '插入购物车时间',
  `cart_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 正常 1 删除 2 店铺关闭商品下架',
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE COMMENT '(null)'
) ENGINE = InnoDB AUTO_INCREMENT = 436336 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_wordbook_order_cancel_reason
-- ----------------------------
DROP TABLE IF EXISTS `odb_wordbook_order_cancel_reason`;
CREATE TABLE `odb_wordbook_order_cancel_reason`  (
  `cancel_reason_id` int(20) NOT NULL AUTO_INCREMENT,
  `cancel_reason_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '取消订单的原因',
  `cancel_identity` tinyint(1) NULL DEFAULT 0 COMMENT '取消订单者的身份 1-买家 2-卖家',
  PRIMARY KEY (`cancel_reason_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单取消原因表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_wordbook_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `odb_wordbook_order_return_reason`;
CREATE TABLE `odb_wordbook_order_return_reason`  (
  `order_return_reason_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_return_reason_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉理由内容',
  `order_return_reason_sort` int(3) NOT NULL DEFAULT 225 COMMENT '投诉理由排序',
  `order_return_reason_type` int(3) NOT NULL COMMENT '投诉类型',
  PRIMARY KEY (`order_return_reason_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退回原因 -- 字典表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_wordbook_order_state
-- ----------------------------
DROP TABLE IF EXISTS `odb_wordbook_order_state`;
CREATE TABLE `odb_wordbook_order_state`  (
  `order_state_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '状态id',
  `order_state_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态',
  `order_state_text_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名1',
  `order_state_text_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名2',
  `order_state_text_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '别名3',
  `order_state_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`order_state_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单状态表 -- 字典表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for temp_order_shopname
-- ----------------------------
DROP TABLE IF EXISTS `temp_order_shopname`;
CREATE TABLE `temp_order_shopname`  (
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺ID',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '/*订单表中所有店铺名称表（由order表shop_name group by 而来，每日更新一次）-- gen */' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for udb_user_blacklis
-- ----------------------------
DROP TABLE IF EXISTS `udb_user_blacklis`;
CREATE TABLE `udb_user_blacklis`  (
  `id` int(26) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '黑名单手机号',
  `stauts` int(1) NOT NULL COMMENT '0是正常1是黑名单',
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

-- ----------------------------
-- View structure for statistics_money_deal
-- ----------------------------
DROP VIEW IF EXISTS `statistics_money_deal`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `statistics_money_deal` AS select `og`.`order_goods_id` AS `order_goods_id`,`og`.`order_id` AS `order_id`,`og`.`goods_id` AS `goods_id`,`og`.`common_id` AS `common_id`,`og`.`buyer_user_id` AS `buyer_user_id`,`og`.`goods_name` AS `goods_name`,`og`.`goods_class_id` AS `goods_class_id`,`og`.`spec_id` AS `spec_id`,`og`.`order_spec_info` AS `order_spec_info`,`og`.`goods_price` AS `goods_price`,`og`.`order_goods_num` AS `order_goods_num`,`og`.`goods_image` AS `goods_image`,`og`.`order_goods_returnnum` AS `order_goods_returnnum`,`og`.`order_goods_amount` AS `order_goods_amount`,`og`.`order_goods_platform_bear` AS `order_goods_platform_bear`,`og`.`order_goods_discount_fee` AS `order_goods_discount_fee`,`og`.`order_goods_payment_amount` AS `order_goods_payment_amount`,`og`.`order_goods_adjust_fee` AS `order_goods_adjust_fee`,`og`.`order_goods_point_fee` AS `order_goods_point_fee`,`og`.`order_goods_commission` AS `order_goods_commission`,`og`.`shop_id` AS `shop_id`,`og`.`order_goods_status` AS `order_goods_status`,`og`.`order_goods_evaluation_status` AS `order_goods_evaluation_status`,`og`.`order_goods_benefit` AS `order_goods_benefit`,`og`.`goods_return_status` AS `goods_return_status`,`og`.`goods_refund_status` AS `goods_refund_status`,`og`.`order_goods_time` AS `order_goods_time`,`og`.`directseller_flag` AS `directseller_flag`,`og`.`directseller_id` AS `directseller_id`,`og`.`directseller_is_settlement` AS `directseller_is_settlement`,`og`.`directseller_commission_0` AS `directseller_commission_0`,`og`.`directseller_commission_1` AS `directseller_commission_1`,`og`.`directseller_commission_2` AS `directseller_commission_2`,`og`.`directseller_goods_discount` AS `directseller_goods_discount`,`og`.`order_goods_source_id` AS `order_goods_source_id`,`og`.`order_goods_source_ship` AS `order_goods_source_ship`,`og`.`order_goods_finish_time` AS `order_goods_finish_time`,`og`.`promoter_commission_price` AS `promoter_commission_price`,`og`.`parent_shop_commission_price` AS `parent_shop_commission_price`,`og`.`order_goods_id_deliver` AS `order_goods_id_deliver`,`og`.`order_seller_name` AS `order_seller_name`,`og`.`order_seller_address` AS `order_seller_address`,`og`.`order_seller_contact` AS `order_seller_contact`,`og`.`order_shipping_time` AS `order_shipping_time`,`og`.`order_shipping_express_id` AS `order_shipping_express_id`,`og`.`order_shipping_code` AS `order_shipping_code`,`og`.`order_shipping_message` AS `order_shipping_message`,`og`.`order_randerect_fee` AS `order_randerect_fee`,`og`.`order_is_randerect` AS `order_is_randerect`,`og`.`promotion_id` AS `promotion_id`,`og`.`goods_promotion_id` AS `goods_promotion_id`,`og`.`parent_shop_id` AS `parent_shop_id`,`ye`.`express_name` AS `express_name` from (`odb_order_goods` `og` left join `odb_express` `ye` on((`og`.`order_shipping_express_id` = `ye`.`express_id`)));

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
-- Procedure structure for update_orderid
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_orderid`;
delimiter ;;
CREATE PROCEDURE `update_orderid`()
BEGIN
-- 需要定义接收游标数据的变量 
  DECLARE o_id CHAR(100);
 


  -- 遍历数据结束标志
  DECLARE done INT DEFAULT FALSE;

 -- 游标
  DECLARE cur CURSOR FOR select order_id from odb_order_base where order_create_time>='2019-01-27' and  order_id='DD-11527571-158379-102-20190127000007-0001';

  -- 将结束标志绑定到游标
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 
  -- 打开游标
  OPEN cur;
  
  -- 开始循环
  read_loop: LOOP
    -- 提取游标里的数据，这里只有一个，多个的话也一样；
    FETCH cur INTO o_id;
    -- 声明结束的时候
    IF done THEN
     LEAVE read_loop;
    END IF;
    -- 这里做你想做的循环的事件
		select concat(right(UNIX_TIMESTAMP(DATE_FORMAT(left(RIGHT(order_id,19),14),'%Y-%m-%d %T')),9),buyer_user_id,round(rand()*8999)+1000) into @new_order_id
from odb_order_base where order_create_time>='2019-01-27' and  order_id='DD-11527571-158379-102-20190127000007-0001' ;

		update java_order.odb_order_base set order_shipping_express_id=exp_id,order_shipping_code=sp_code,order_shipping_time = ADDDATE(payment_time,1),order_status=6,order_finished_time=ADDDATE(payment_time,7) where order_id = o_id;
		
		update java_order.odb_order_goods set order_goods_status=6,order_goods_finish_time= ADDDATE(o_pay_time,7),order_shipping_time = ADDDATE(o_pay_time,1),order_shipping_express_id=exp_id,order_shipping_code=sp_code where order_id=o_id;

		update pay_db.pdb_pay_consume_record set record_status=6 where order_id=o_id;

  END LOOP;
  -- 关闭游标
  CLOSE cur;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_redpacket
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_redpacket`;
delimiter ;;
CREATE PROCEDURE `update_redpacket`()
BEGIN
-- 需要定义接收游标数据的变量 
  DECLARE b_uid VARCHAR(50);
  DECLARE b_uname VARCHAR(50);
  DECLARE o_id VARCHAR(50);
 


  -- 遍历数据结束标志
  DECLARE done INT DEFAULT FALSE;

 -- 游标
  DECLARE cur CURSOR FOR 
select  b.buyer_user_id,b.buyer_user_name,a.order_id 
from java_order.odb_order_goods a ,java_order.odb_order_base b  
where a.ordeR_id =b.ordeR_id 
and  a.goods_id ='47463' 
and b.order_status=3;


  -- 将结束标志绑定到游标
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 
  -- 打开游标
  OPEN cur;
  
  -- 开始循环
  read_loop: LOOP
    -- 提取游标里的数据，这里只有一个，多个的话也一样；
    FETCH cur INTO b_uid,b_uname,o_id;
    -- 声明结束的时候
    IF done THEN
     LEAVE read_loop;
    END IF;
    -- 这里做你想做的循环的事件

-- 执行发货操作
UPDATE odb_order_base a,
 odb_order_goods b
SET a.order_shipping_express_id = 76,
 a.order_shipping_time = NOW(),
 a.order_finished_time = NOW(),
 a.order_receiver_date=NOW(),
 b.order_goods_status=6,
 a.order_status = 6,
b.order_shipping_time=NOW(),
b.order_shipping_express_id = 76,
a.order_shipping_code=DATE_FORMAT(now(),'%Y%m%d%h%i%s'),
b.order_shipping_code=DATE_FORMAT(now(),'%Y%m%d%h%i%s')
WHERE
	a.ordeR_id = b.ordeR_id
AND a.order_id=o_id;



-- 对付款用户发放红包
INSERT INTO java_goods.yf_redpacket_base (
	redpacket_t_id,
	redpacket_title,
	redpacket_desc,
	redpacket_start_date,
	redpacket_end_date,
	redpacket_price,
	shop_limit,
	goods_cat_limit,
	redpacket_t_orderlimit,
	is_allow_transfer,
	redpacket_state,
	redpacket_active_date,
	redpacket_owner_id,
	redpacket_owner_name,
	redpacket_transfer_state,
	redpacket_from,
	is_hidden
)
VALUES
	(242,'3元红包 满3.01可用','10元红包一元购','2019-06-15 10:00:00','2019-06-30 00:00:00','3','1','','3','0','1',NOW(),b_uid,  b_uname,  0,1,0),

	(243,'3元红包 满3.01可用','10元红包一元购','2019-06-15 10:00:00','2019-06-30 00:00:00','3','1','','3','0','1',NOW(),b_uid,  b_uname,  0,1,0),
	
	(244,'4元红包 满4.01可用','10元红包一元购','2019-06-15 10:00:00','2019-06-30 00:00:00','4','1','','4','0','1',NOW(),b_uid,  b_uname,  0,1,0);



  END LOOP;
  -- 关闭游标
  CLOSE cur;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_shipping_code
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_shipping_code`;
delimiter ;;
CREATE PROCEDURE `update_shipping_code`()
BEGIN
-- 需要定义接收游标数据的变量 
  DECLARE o_id CHAR(100);
  DECLARE exp_id char(50);
  DECLARE sp_code char(50);
  DECLARE o_pay_time datetime;


  -- 遍历数据结束标志
  DECLARE done INT DEFAULT FALSE;

 -- 游标
  DECLARE cur CURSOR FOR select order_number,order_shipping_express_id,order_shipping_code from odb_mobile_temporary; #where order_id in (select order_id from exp_id) and order_shipping_express_id<>'77';

  -- 将结束标志绑定到游标
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 
  -- 打开游标
  OPEN cur;
  
  -- 开始循环
  read_loop: LOOP
    -- 提取游标里的数据，这里只有一个，多个的话也一样；
    FETCH cur INTO o_id,exp_id,sp_code;
    -- 声明结束的时候
    IF done THEN
     LEAVE read_loop;
    END IF;
    -- 这里做你想做的循环的事件
		select payment_time into o_pay_time from odb_order_base where order_id = o_id;

		update java_order.odb_order_base set order_shipping_express_id=exp_id,order_shipping_code=sp_code,order_shipping_time = ADDDATE(payment_time,1),order_status=6,order_finished_time=ADDDATE(payment_time,7) where order_id = o_id;
		
		update java_order.odb_order_goods set order_goods_status=6,order_goods_finish_time= ADDDATE(o_pay_time,7),order_shipping_time = ADDDATE(o_pay_time,1),order_shipping_express_id=exp_id,order_shipping_code=sp_code where order_id=o_id;

		update pay_db.pdb_pay_consume_record set record_status=6 where order_id=o_id;

  END LOOP;
  -- 关闭游标
  CLOSE cur;

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
