

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for a_shop_name
-- ----------------------------
DROP TABLE IF EXISTS `a_shop_name`;
CREATE TABLE `a_shop_name`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `shop_name` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '店铺名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for activity_none_goods
-- ----------------------------
DROP TABLE IF EXISTS `activity_none_goods`;
CREATE TABLE `activity_none_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `none_type` int(10) NULL DEFAULT NULL COMMENT '商品类型',
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NOT NULL DEFAULT 0 COMMENT '排序，数字越大，越靠前',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NOT NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核失败原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5725 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动专区商品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for activity_none_slide
-- ----------------------------
DROP TABLE IF EXISTS `activity_none_slide`;
CREATE TABLE `activity_none_slide`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `none_type` int(10) NOT NULL DEFAULT 0 COMMENT '专区类型',
  `action_slide` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播地址',
  `action_type` tinyint(5) NOT NULL DEFAULT 0 COMMENT '详情跳转类型',
  `action_detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '跳转详情',
  `display_order` int(10) NOT NULL DEFAULT 0 COMMENT '排序，数字越大，越靠前',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 671 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动专区轮播' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for activity_none_type
-- ----------------------------
DROP TABLE IF EXISTS `activity_none_type`;
CREATE TABLE `activity_none_type`  (
  `display_order` int(10) NULL DEFAULT 0,
  `none_type` int(10) NOT NULL AUTO_INCREMENT COMMENT '类型专区',
  `none_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '专区名称',
  PRIMARY KEY (`none_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专区活动类型' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for branch_table
-- ----------------------------
DROP TABLE IF EXISTS `branch_table`;
CREATE TABLE `branch_table`  (
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transaction_id` bigint(20) NULL DEFAULT NULL,
  `resource_group_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `client_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_data` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`branch_id`) USING BTREE,
  INDEX `idx_xid`(`xid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for dealer_apply_cat
-- ----------------------------
DROP TABLE IF EXISTS `dealer_apply_cat`;
CREATE TABLE `dealer_apply_cat`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `apply_id` int(11) NOT NULL COMMENT '申请id',
  `cat_id` int(10) NOT NULL DEFAULT 0 COMMENT '分类id',
  `parent_cat_id` int(10) NOT NULL DEFAULT 0 COMMENT '上级商家类目id',
  `dealer_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分销状态 1待审核  2审核通过 3审核不通过',
  `supplier_shop_id` int(10) NOT NULL COMMENT '供应商店铺id',
  `supplier_shop_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商店铺',
  `dealer_shop_id` int(10) NOT NULL COMMENT '经销商店铺id',
  `dealer_shop_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经销商店铺名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '经销商申请的分类' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for dealer_apply_info
-- ----------------------------
DROP TABLE IF EXISTS `dealer_apply_info`;
CREATE TABLE `dealer_apply_info`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `supplier_shop_id` int(10) NOT NULL COMMENT '供应商店铺id',
  `supplier_shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商店铺名',
  `supplier_user_id` int(11) NOT NULL COMMENT '供应商用户id',
  `supplier_user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商用户名',
  `dealer_shop_id` int(10) NOT NULL COMMENT '经销商id',
  `dealer_shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经销商店铺名',
  `dealer_user_id` int(11) NOT NULL COMMENT '经销商用户id',
  `dealer_user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经销商用户名',
  `dealer_user_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经销商手机号',
  `dealer_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分销状态 1待审核  2审核通过 3审核不通过  4已删除',
  `dealer_remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '申请审核说明',
  `dealer_level_id` int(10) NULL DEFAULT 0 COMMENT '经销等级',
  `dealer_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经销等级名称',
  `dealer_discount` int(10) NULL DEFAULT 0 COMMENT '经销折扣',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分销商申请信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for dealer_level_info
-- ----------------------------
DROP TABLE IF EXISTS `dealer_level_info`;
CREATE TABLE `dealer_level_info`  (
  `dealer_level_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '经销商等级id',
  `supplier_shop_id` int(11) NOT NULL COMMENT '供应商店铺id',
  `dealer_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经销商等级名称',
  `dealer_discount` int(10) NOT NULL COMMENT '等级折扣',
  `dealer_level_sort` int(10) NOT NULL DEFAULT 1 COMMENT '等级排序',
  `dealer_level_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '经销商等级状态  1正常 2删除',
  PRIMARY KEY (`dealer_level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '经销商等级' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for dealer_putaway_record
-- ----------------------------
DROP TABLE IF EXISTS `dealer_putaway_record`;
CREATE TABLE `dealer_putaway_record`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `supply_common_id` int(10) NOT NULL COMMENT '供应商商品commonId',
  `supply_goods_id` int(10) NOT NULL DEFAULT 0 COMMENT '立即购买供应商品id',
  `dealer_common_id` int(10) NOT NULL COMMENT '经销商品commonId',
  `dealer_goods_id` int(10) NOT NULL DEFAULT 0 COMMENT '立即购买经销商品id（一键上架全部上架值为0）',
  `dealer_shop_id` int(11) NOT NULL COMMENT '经销店铺id',
  `dealer_shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经销店铺名',
  `supplier_shop_id` int(10) NOT NULL COMMENT '供应商店铺id',
  `supplier_shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商店铺',
  `dealer_price` decimal(20, 2) NOT NULL COMMENT '经销供货价',
  `dealer_num` int(10) NOT NULL DEFAULT 0 COMMENT '上架数量',
  `record_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '一键上架记录状态  1正常  2取消',
  `dealer_type` tinyint(1) NULL DEFAULT 1 COMMENT '1一键上架  2立即购买',
  `dealer_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '经销发布时间',
  `is_price_update` int(11) NULL DEFAULT 2 COMMENT '同步商品商品价格是否修改 1 是 2 否 未修改价格的商品不展示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品供应记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for dealer_set
-- ----------------------------
DROP TABLE IF EXISTS `dealer_set`;
CREATE TABLE `dealer_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置key',
  `value1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '爆品数量/佣金比例  都用这个字段',
  `value2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '上限折扣价',
  `value3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '折扣价',
  `config_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1可用  2不可用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商配置项' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for delay_goods_config
-- ----------------------------
DROP TABLE IF EXISTS `delay_goods_config`;
CREATE TABLE `delay_goods_config`  (
  `common_id` int(10) NOT NULL COMMENT 'commonId',
  `sell_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '经销审核 1是 2否',
  `sell_edit` tinyint(1) NOT NULL DEFAULT 1 COMMENT '允许编辑内容 1是 2否',
  `sell_edit_price` tinyint(1) NOT NULL DEFAULT 1 COMMENT '允许修改价格 1是 2否',
  `sell_deliver` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否代发货 1是 2否',
  `config_remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '说明',
  `sell_goods_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商家货号',
  `sell_type` tinyint(1) NULL DEFAULT 1 COMMENT '暂时不用',
  PRIMARY KEY (`common_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '经销商品配置信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_app_version
-- ----------------------------
DROP TABLE IF EXISTS `gdb_app_version`;
CREATE TABLE `gdb_app_version`  (
  `id` int(200) NOT NULL,
  `versionCode` int(20) NOT NULL COMMENT 'APP名称',
  `versionName` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'APPID',
  `apkPath` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前上线版本号',
  `updateInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT '2001-01-01 01:01:01',
  `isForce` tinyint(10) NULL DEFAULT NULL,
  `iOSAppVersion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iOSAppPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '北京光声_IOSAPP应用版本' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_article_info
-- ----------------------------
DROP TABLE IF EXISTS `gdb_article_info`;
CREATE TABLE `gdb_article_info`  (
  `article_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '心得ID',
  `user_id` int(11) NOT NULL COMMENT '作者ID',
  `article_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '心得标题',
  `article_content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '心得内容',
  `article_cover` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '心得封面',
  `read_num` int(11) NULL DEFAULT 0 COMMENT '阅读量',
  `remark_num` int(11) NULL DEFAULT 0 COMMENT '评论量',
  `audit_state` int(11) NULL DEFAULT 0 COMMENT '审核状态:0-待审核,1-审核通过',
  `audit_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核备注',
  `common_id` int(11) NOT NULL COMMENT '商品ID',
  `tag_id` int(11) NULL DEFAULT NULL COMMENT '话题ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品规格ID',
  `cat_id` int(11) NOT NULL COMMENT '商品分类',
  `article_type` int(11) NULL DEFAULT NULL COMMENT '心得类型:1-图片,2-视频',
  `like_num` int(11) NULL DEFAULT 0 COMMENT '点赞数',
  `star_num` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社区心得表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_article_like
-- ----------------------------
DROP TABLE IF EXISTS `gdb_article_like`;
CREATE TABLE `gdb_article_like`  (
  `like_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `article_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '心得ID',
  `liked_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被点赞ID,可以是心得ID,可以是评论ID',
  `like_user` int(11) NULL DEFAULT NULL COMMENT '点赞用户ID',
  `liked_user` int(11) NULL DEFAULT NULL COMMENT '被点赞用户ID',
  `like_type` int(11) NOT NULL COMMENT '点赞类型:1-心得;2-评论',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` int(11) NULL DEFAULT 0 COMMENT '已读状态:1-已读,0-未读',
  PRIMARY KEY (`like_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社区心得点赞表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_article_remark
-- ----------------------------
DROP TABLE IF EXISTS `gdb_article_remark`;
CREATE TABLE `gdb_article_remark`  (
  `remark_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `article_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '心得ID',
  `remark_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `remarked_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '被评论ID',
  `remark_user` int(11) NULL DEFAULT NULL COMMENT '评论用户ID',
  `remarked_user` int(11) NULL DEFAULT NULL COMMENT '被评论用户ID',
  `remark_type` int(11) NOT NULL COMMENT '评论层级:1-一级;2-二级',
  `audit_state` int(11) NULL DEFAULT 0 COMMENT '审核状态:0-待审核,1-审核通过',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `audit_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核状态',
  `like_num` int(11) NULL DEFAULT 0 COMMENT '点赞量',
  PRIMARY KEY (`remark_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社区心得评论表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_article_resource
-- ----------------------------
DROP TABLE IF EXISTS `gdb_article_resource`;
CREATE TABLE `gdb_article_resource`  (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `article_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '心得ID',
  `resource_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源链接',
  `resource_type` int(11) NULL DEFAULT 1 COMMENT '资源类型:1-图片,2-视频',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社区心得资源表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_article_star
-- ----------------------------
DROP TABLE IF EXISTS `gdb_article_star`;
CREATE TABLE `gdb_article_star`  (
  `star_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `article_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '心得ID',
  `star_user` int(11) NULL DEFAULT NULL COMMENT '收藏用户ID',
  `starred_user` int(11) NULL DEFAULT NULL COMMENT '被收藏用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近更新时间',
  `is_read` int(11) NULL DEFAULT 0 COMMENT '已读状态:1-已读,0-未读',
  PRIMARY KEY (`star_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社区心得收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for gdb_article_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `gdb_article_user_follow`;
CREATE TABLE `gdb_article_user_follow`  (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注ID',
  `follow_user_id` int(11) NOT NULL COMMENT '关注用户ID',
  `followed_user_id` int(11) NOT NULL COMMENT '被关注用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近更新时间',
  `is_read` int(11) NULL DEFAULT 0 COMMENT '已读状态:1-已读,0-未读',
  PRIMARY KEY (`follow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社区用户关注表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for gdb_extend_find
-- ----------------------------
DROP TABLE IF EXISTS `gdb_extend_find`;
CREATE TABLE `gdb_extend_find`  (
  `find_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `extend_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容标题',
  `extend_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章封面',
  `extend_content_abstract` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推广的文字摘要',
  `extend_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推广的内容',
  `extend_read` int(10) NOT NULL DEFAULT 0 COMMENT '内容阅读数',
  `extend_collect` int(10) NOT NULL DEFAULT 0 COMMENT '内容点赞数',
  `extend_evaluate` int(10) NOT NULL DEFAULT 0 COMMENT '内容评论数',
  `extend_enable` int(10) NOT NULL DEFAULT 1 COMMENT '图文是否可用-1：可用 2:不可用',
  `extend_verify_status` int(10) NOT NULL DEFAULT 0 COMMENT '审核状态-1：审核中 2:审核成功 3:审核失败  0:关闭',
  `extend_verify_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核信息备注',
  `extend_goods_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相关商品,以英文逗号分割,eg:124,456',
  `extend_goods_image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主图集合，以英文逗号分割',
  `extend_type` int(10) NOT NULL DEFAULT 0 COMMENT '图文展示类型-待定',
  `extend_publish_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '文章发布时间',
  `extend_publisher` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布者',
  `last_read_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '最后一次阅读时间',
  `user_id` int(32) NOT NULL DEFAULT 0 COMMENT '编辑者id',
  `extend_update_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '用户更新时间',
  PRIMARY KEY (`find_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图文发现表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_extend_find_collect
-- ----------------------------
DROP TABLE IF EXISTS `gdb_extend_find_collect`;
CREATE TABLE `gdb_extend_find_collect`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `find_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺活动id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `extend_is_liked` int(10) NOT NULL DEFAULT 2 COMMENT '用户是否点赞1:已点2:未点',
  `update_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺活动点赞表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_feed_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_feed_base`;
CREATE TABLE `gdb_feed_base`  (
  `feed_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `feed_group_id` tinyint(2) NOT NULL DEFAULT 0 COMMENT '问题组',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `feed_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '问题描述',
  `feed_url` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '页面链接（选填）',
  `feed_state` tinyint(4) NOT NULL DEFAULT 0 COMMENT '反馈状态 1 : 已经确认',
  `feed_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '反馈时间',
  `feed_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈内容',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `user_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人联系方式',
  PRIMARY KEY (`feed_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '反馈表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_fine_selected_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_fine_selected_goods`;
CREATE TABLE `gdb_fine_selected_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) NOT NULL COMMENT '商品id',
  `display_order` tinyint(2) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '精选商品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_goods_recommend
-- ----------------------------
DROP TABLE IF EXISTS `gdb_goods_recommend`;
CREATE TABLE `gdb_goods_recommend`  (
  `goods_recommend_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品推荐id',
  `goods_cat_id` int(10) NOT NULL COMMENT '商品分类id',
  `common_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐商品id，最多四个',
  `recommend_num` int(5) NOT NULL COMMENT '推荐数量',
  `sub_site_id` int(11) NOT NULL DEFAULT 0 COMMENT '分站id',
  PRIMARY KEY (`goods_recommend_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品推荐表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_honeycomb_article
-- ----------------------------
DROP TABLE IF EXISTS `gdb_honeycomb_article`;
CREATE TABLE `gdb_honeycomb_article`  (
  `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `extend_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容标题',
  `extend_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章封面',
  `extend_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '推广的内容',
  `extend_collect` int(10) NOT NULL DEFAULT 0 COMMENT '内容点赞数',
  `extend_evaluate` int(10) NOT NULL DEFAULT 0 COMMENT '内容评论数',
  `extend_verify_status` int(10) NOT NULL DEFAULT 2 COMMENT '审核状态-1：审核成功 2:审核中 3:审核失败  0:关闭',
  `extend_verify_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核信息备注',
  `extend_goods_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '相关商品,以英文逗号分割,eg:124,456',
  `extend_goods_image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主图集合，以英文逗号分割',
  `extend_type` int(10) NOT NULL DEFAULT 1 COMMENT '上传类型1:图片2视频',
  `extend_publish_time` timestamp NOT NULL DEFAULT '2019-09-02 23:35:00' COMMENT '文章发布时间',
  `extend_publisher_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布者',
  `extend_publisher_id` int(10) NOT NULL DEFAULT 0 COMMENT '编辑者id',
  `extend_publisher_logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布者头像',
  `article_scale` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章比例',
  `display_order` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图文发现表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_honeycomb_article_collect
-- ----------------------------
DROP TABLE IF EXISTS `gdb_honeycomb_article_collect`;
CREATE TABLE `gdb_honeycomb_article_collect`  (
  `collect_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺活动id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `extend_is_liked` int(10) NOT NULL DEFAULT 2 COMMENT '用户是否点赞1:已点2:未点',
  `update_time` timestamp NOT NULL DEFAULT '2019-09-10 08:00:00' COMMENT '更新时间',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺活动点赞表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_honeycomb_article_label
-- ----------------------------
DROP TABLE IF EXISTS `gdb_honeycomb_article_label`;
CREATE TABLE `gdb_honeycomb_article_label`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `label_id` int(10) NULL DEFAULT 0 COMMENT '标签id',
  `article_id` int(10) NULL DEFAULT 0 COMMENT '文章id',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '蜂巢文章表对应的标签' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_honeycomb_label
-- ----------------------------
DROP TABLE IF EXISTS `gdb_honeycomb_label`;
CREATE TABLE `gdb_honeycomb_label`  (
  `label_id` int(10) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `label_hot_num` int(10) NULL DEFAULT 0 COMMENT '标签热度值',
  `label_is_hot` int(2) NULL DEFAULT 0 COMMENT '是否热门标签1热门',
  `display_order` tinyint(2) NOT NULL DEFAULT 0 COMMENT '显示顺序，值越大，权重越高',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `label_is_index` int(2) NOT NULL DEFAULT 0 COMMENT '是否显示在首页：显示1',
  `label_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标签地址',
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '蜂巢标签' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_index_action_type
-- ----------------------------
DROP TABLE IF EXISTS `gdb_index_action_type`;
CREATE TABLE `gdb_index_action_type`  (
  `action_type` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `display_order` int(10) NOT NULL DEFAULT 0 COMMENT '排序,数字越大，越靠前',
  `activity_status` int(2) NOT NULL DEFAULT 1 COMMENT '使用状态 0:未启用 1:启用',
  PRIMARY KEY (`action_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页跳转类型' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_mall_notice_information
-- ----------------------------
DROP TABLE IF EXISTS `gdb_mall_notice_information`;
CREATE TABLE `gdb_mall_notice_information`  (
  `notice_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容标题',
  `notice_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章封面',
  `notice_content_abstract` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推广的文字摘要',
  `notice_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推广的内容',
  `notice_read` int(10) NOT NULL DEFAULT 0 COMMENT '内容阅读数',
  `notice_collect` int(10) NOT NULL DEFAULT 0 COMMENT '内容点赞数',
  `notice_evaluate` int(10) NOT NULL DEFAULT 0 COMMENT '内容评论数',
  `notice_enable` int(10) NOT NULL DEFAULT 1 COMMENT '图文是否可用-1：可用 2:不可用',
  `notice_verify_status` int(10) NOT NULL DEFAULT 0 COMMENT '审核状态-1：审核中 2:审核成功 3:审核失败  0:关闭',
  `notice_verify_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核信息备注',
  `notice_publish_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '文章发布时间',
  `notice_publisher` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布者',
  `last_read_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '最后一次阅读时间',
  `user_id` int(32) NOT NULL DEFAULT 0 COMMENT '用户id',
  `notice_update_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '用户更新时间',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商城公告' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_member_grade
-- ----------------------------
DROP TABLE IF EXISTS `gdb_member_grade`;
CREATE TABLE `gdb_member_grade`  (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员等级ID',
  `grade_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员等级名称',
  PRIMARY KEY (`grade_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gdb_member_grade_set
-- ----------------------------
DROP TABLE IF EXISTS `gdb_member_grade_set`;
CREATE TABLE `gdb_member_grade_set`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `grade_id` int(11) NOT NULL COMMENT '会员等级id',
  `grade_rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员等级规则',
  `grade_discount` int(11) NULL DEFAULT NULL COMMENT '会员等级折扣',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gdb_member_grade_user
-- ----------------------------
DROP TABLE IF EXISTS `gdb_member_grade_user`;
CREATE TABLE `gdb_member_grade_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `shop_grade_id` int(11) NULL DEFAULT NULL COMMENT '店铺会员等级id',
  `member_create_time` datetime NULL DEFAULT NULL COMMENT '会员创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gdb_merchant_activity_none_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_activity_none_goods`;
CREATE TABLE `gdb_merchant_activity_none_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL COMMENT '默认顺序',
  `activity_none_type` int(10) NULL DEFAULT 1 COMMENT '活动类型1特产推荐;2新品推荐;3为你推荐;4蜂狂特价;5新人专区;6平台活动专区;7:9.9包邮专区;8:品牌生活;9:好货溯源;10:猜你喜欢;11:时令果蔬;12:节日钜惠;13:限时折扣;14:超级拼团;',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专区活动商品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_activity_none_slide
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_activity_none_slide`;
CREATE TABLE `gdb_merchant_activity_none_slide`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_slide` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '活动轮播',
  `action_type` int(3) NULL DEFAULT 1 COMMENT '跳转类型:1-商品goodsid,2:店铺shopId,3:链接',
  `action_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '跳转内容',
  `display_order` int(10) NULL DEFAULT 0,
  `activity_none_type` int(10) NULL DEFAULT 1 COMMENT '活动类型1特产推荐;2新品推荐;3为你推荐;4蜂狂特价;5新人专区;6平台活动专区;7:9.9包邮专区;8:品牌生活;9:好货溯源;10:猜你喜欢;11:时令果蔬;12:节日钜惠;13:限时折扣;14:超级拼团;',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专区活动轮播' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_activity_none_type
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_activity_none_type`;
CREATE TABLE `gdb_merchant_activity_none_type`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `display_order` int(10) NULL DEFAULT 0,
  `activity_none_type` int(10) NULL DEFAULT 1 COMMENT '活动类型1特产推荐;2新品推荐;3为你推荐;4蜂狂特价;5新人专区;6平台活动专区;7:9.9包邮专区;8:品牌生活;9:好货溯源;10:猜你喜欢;11:时令果蔬;12:节日钜惠;13:限时折扣;14:超级拼团;',
  `activity_none_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '专区名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专区活动类型' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_agreement
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_agreement`;
CREATE TABLE `gdb_merchant_agreement`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '协议id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家协议/用户协议',
  `url` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'url',
  `sign` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标记',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户/商家协议表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_article_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_article_base`;
CREATE TABLE `gdb_merchant_article_base`  (
  `article_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `article_desc` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `article_title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `article_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '调用网址-url，默认为本页面构造的网址，可填写其它页面',
  `article_group_id` tinyint(3) NOT NULL COMMENT '组',
  `article_template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板',
  `article_seo_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `article_seo_keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO关键字',
  `article_seo_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO描述',
  `article_reply_flag` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用问答留言',
  `article_lang` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'cn' COMMENT '语言',
  `article_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型-0文章1公告',
  `article_sort` int(2) NOT NULL DEFAULT 0 COMMENT '排序',
  `article_status` int(1) NOT NULL DEFAULT 2 COMMENT '状态 1:启用  2:关闭',
  `article_add_time` datetime NOT NULL COMMENT '添加世间',
  `article_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章图片',
  `article_islook` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否读取0未1读取',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站初始化内容设置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_article_group
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_article_group`;
CREATE TABLE `gdb_merchant_article_group`  (
  `article_group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `article_group_title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `article_group_lang` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'cn' COMMENT '语言',
  `article_group_sort` smallint(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `article_group_logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'logo',
  `article_group_parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级分类id',
  PRIMARY KEY (`article_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站初始化内容分组表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_base_cron
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_base_cron`;
CREATE TABLE `gdb_merchant_base_cron`  (
  `cron_id` int(6) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `cron_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `cron_script` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务脚本',
  `cron_lasttransact` int(10) NOT NULL COMMENT '上次执行时间',
  `cron_nexttransact` int(10) NOT NULL COMMENT '下一次执行时间',
  `cron_minute` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '*' COMMENT '分',
  `cron_hour` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '*' COMMENT '小时',
  `cron_day` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '*' COMMENT '日',
  `cron_month` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '*' COMMENT '月',
  `cron_week` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '*' COMMENT '周',
  `cron_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '其是启用',
  PRIMARY KEY (`cron_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '计划任务' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_base_district
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_base_district`;
CREATE TABLE `gdb_merchant_base_district`  (
  `district_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '地区id',
  `district_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地区名称',
  `district_parent_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `district_displayorder` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `district_region` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区域名称 - 华北、东北、华东、华南、华中、西南、西北、港澳台、海外',
  `district_is_leaf` tinyint(1) NOT NULL DEFAULT 1 COMMENT '无子类',
  `district_is_level` tinyint(1) NOT NULL DEFAULT 1 COMMENT '等级',
  PRIMARY KEY (`district_id`) USING BTREE,
  INDEX `upid`(`district_parent_id`, `district_displayorder`) USING BTREE COMMENT '(null)',
  INDEX `district_id`(`district_id`) USING BTREE COMMENT 'null'
) ENGINE = InnoDB AUTO_INCREMENT = 6331 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_base_filter_keyword
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_base_filter_keyword`;
CREATE TABLE `gdb_merchant_base_filter_keyword`  (
  `keyword_find` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `keyword_replace` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '敏感内容',
  `keyword_statu` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:禁止 2：替换',
  `keyword_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`keyword_find`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敏感词过滤表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_brand_life
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_brand_life`;
CREATE TABLE `gdb_merchant_brand_life`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌生活' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_chain_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_chain_base`;
CREATE TABLE `gdb_merchant_chain_base`  (
  `chain_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '门店Id',
  `chain_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店名称',
  `chain_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `chain_telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `chain_contacter` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `chain_province_id` mediumint(8) NOT NULL DEFAULT 0 COMMENT '省id',
  `chain_province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份',
  `chain_city_id` mediumint(8) NOT NULL DEFAULT 0 COMMENT '市id',
  `chain_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `chain_county_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '县',
  `chain_county` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '县区',
  `chain_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `chain_opening_hours` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '营业时间',
  `chain_traffic_line` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '交通路线',
  `chain_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店图片',
  `chain_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '添加时间',
  PRIMARY KEY (`chain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店表     线下实体店会用到' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_chain_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_chain_goods`;
CREATE TABLE `gdb_merchant_chain_goods`  (
  `chain_goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '门店商品id',
  `chain_id` int(10) NOT NULL DEFAULT 0 COMMENT '门店id',
  `shop_id` int(10) NOT NULL DEFAULT 0 COMMENT '商店id',
  `goods_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品id',
  `common_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品common_id',
  `goods_stock` int(10) NOT NULL DEFAULT 0 COMMENT '商品商品库存',
  PRIMARY KEY (`chain_goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_chain_user
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_chain_user`;
CREATE TABLE `gdb_merchant_chain_user`  (
  `chain_user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '门店用户id',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `chain_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属门店',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺ID',
  `chain_user_login_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '最后登录时间',
  PRIMARY KEY (`chain_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_class_bind
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_class_bind`;
CREATE TABLE `gdb_merchant_class_bind`  (
  `shop_class_bind_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `product_class_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品分类id',
  `product_first_class_id` int(10) NULL DEFAULT NULL COMMENT '第一次类型ID',
  `product_second_class_id` int(10) NULL DEFAULT NULL COMMENT '第二次类型ID',
  `commission_rate` decimal(4, 2) NOT NULL COMMENT '百分比',
  `shop_class_bind_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `shop_class_bind_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核拒绝原因',
  `product_cat_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型ID',
  `product_cat_names` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `bigbaby_commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '大宝佣金',
  `baby_commission` decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`shop_class_bind_id`) USING BTREE,
  UNIQUE INDEX `shop_id`(`shop_id`, `product_class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7443 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺经营类目-更新绑定类目时备份-孟响-19/04/16\r\n' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_common_corner_marker
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_common_corner_marker`;
CREATE TABLE `gdb_merchant_common_corner_marker`  (
  `corner_id` int(10) NOT NULL AUTO_INCREMENT,
  `corner_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角标名称',
  `corner_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角标地址',
  `update_date` timestamp NOT NULL DEFAULT '2019-10-23 08:00:00' COMMENT '更新时间',
  `corner_is_enable` int(3) NOT NULL DEFAULT 1 COMMENT '角标是否可用1-可用2不可用',
  PRIMARY KEY (`corner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动角标' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_complain_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_complain_base`;
CREATE TABLE `gdb_merchant_complain_base`  (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `user_id_accuser` int(10) NOT NULL COMMENT '原告id',
  `user_account_accuser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原告名称',
  `user_id_accused` int(10) NOT NULL COMMENT '被告id',
  `user_account_accused` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被告名称',
  `complain_subject_content` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉主题',
  `complain_subject_id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉内容',
  `complain_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投诉图片,逗号分隔',
  `complain_datetime` datetime NOT NULL COMMENT '投诉时间',
  `complain_handle_datetime` datetime NOT NULL COMMENT '投诉处理时间',
  `complain_handle_user_id` int(10) NOT NULL COMMENT '投诉处理人id',
  `appeal_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申诉内容',
  `appeal_datetime` datetime NOT NULL COMMENT '申诉时间',
  `appeal_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申诉图片,逗号分隔',
  `final_handle_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最终处理意见',
  `final_handle_datetime` datetime NOT NULL COMMENT '最终处理时间',
  `user_id_final_handle` int(10) NOT NULL COMMENT '最终处理人id',
  `complain_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '投诉状态(1-新投诉/2-投诉通过转给被投诉人(待申诉)/3-被投诉人已申诉(对话中)/4-提交仲裁(待仲裁)/5-已关闭)',
  `complain_active` tinyint(4) NOT NULL DEFAULT 0 COMMENT '投诉是否通过平台审批(0未通过/1通过)',
  PRIMARY KEY (`complain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_complain_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_complain_goods`;
CREATE TABLE `gdb_merchant_complain_goods`  (
  `complain_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉商品序列id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品图片',
  `complain_message` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被投诉商品的问题描述',
  `order_goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单商品ID',
  `order_goods_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单商品类型:1默认2团购商品3限时折扣商品4组合套装(待定)',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  PRIMARY KEY (`complain_goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_complain_talk
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_complain_talk`;
CREATE TABLE `gdb_merchant_complain_talk`  (
  `talk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉对话id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `user_id` int(11) NOT NULL COMMENT '发言人id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发言人名称',
  `talk_member_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发言人类型(1-投诉人/2-被投诉人/3-平台)',
  `talk_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '发言状态(1-显示/0-不显示)',
  `talk_admin` int(11) NOT NULL DEFAULT 0 COMMENT '对话管理员，屏蔽对话人的id',
  `talk_datetime` datetime NOT NULL COMMENT '对话发表时间',
  PRIMARY KEY (`talk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投诉对话表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_consult_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_consult_base`;
CREATE TABLE `gdb_merchant_consult_base`  (
  `consult_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '咨询id',
  `consult_type_id` int(10) NOT NULL COMMENT '咨询类别id',
  `consult_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '咨询类别名',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `goods_id` int(10) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `user_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `consult_question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '咨询内容',
  `question_time` datetime NOT NULL COMMENT '提问时间',
  `answer_time` datetime NOT NULL COMMENT '回答时间',
  `consult_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1-未回复 2-已回复',
  `consult_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回答',
  `consult_answer_time` datetime NOT NULL COMMENT '回复时间',
  `answer_user_id` int(100) NULL DEFAULT NULL COMMENT '回复人ID',
  `answer_user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复人姓名',
  `no_show_user` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否匿名，1-匿名',
  PRIMARY KEY (`consult_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品咨询' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_consult_type
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_consult_type`;
CREATE TABLE `gdb_merchant_consult_type`  (
  `consult_type_id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '问题分类id',
  `consult_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `consult_type_sort` int(3) NOT NULL DEFAULT 255 COMMENT '咨询类型排序',
  PRIMARY KEY (`consult_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '咨询问题分类表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_discount_rec
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_discount_rec`;
CREATE TABLE `gdb_merchant_discount_rec`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 10 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时折扣' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_express
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_express`;
CREATE TABLE `gdb_merchant_express`  (
  `express_id` int(10) NOT NULL AUTO_INCREMENT,
  `express_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司',
  `express_pinyin` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物流',
  `express_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态0关闭1开启',
  `express_displayorder` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否常用0否1是',
  `express_commonorder` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否常用',
  PRIMARY KEY (`express_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_express_seeting
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_express_seeting`;
CREATE TABLE `gdb_merchant_express_seeting`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商家平台设置包邮表',
  `merchant_id` int(10) NULL DEFAULT 0 COMMENT '商家id',
  `free_shipping` decimal(10, 2) NULL DEFAULT NULL COMMENT '满足N元包邮',
  `pay_shipping` decimal(10, 2) NULL DEFAULT NULL COMMENT '不满足包邮，固定邮费金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(2) NULL DEFAULT 0 COMMENT '0不删除 1删除',
  `create_id` int(10) NULL DEFAULT 0 COMMENT '创建人',
  `update_id` int(10) NULL DEFAULT 0 COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_find_shop
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_find_shop`;
CREATE TABLE `gdb_merchant_find_shop`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `display_order` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NOT NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核失败原因',
  `common_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发现好店' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_fkgou_specialty_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_fkgou_specialty_goods`;
CREATE TABLE `gdb_merchant_fkgou_specialty_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '更新时间',
  `activity_verify` int(3) NOT NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '蜂狂特价' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_fkgou_supply_specialty_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_fkgou_supply_specialty_goods`;
CREATE TABLE `gdb_merchant_fkgou_supply_specialty_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '更新时间',
  `activity_verify` int(3) NOT NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '批发市场蜂狂特价' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_floor_adpage
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_floor_adpage`;
CREATE TABLE `gdb_merchant_floor_adpage`  (
  `floor_adpage_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '楼层id',
  `floor_adpage_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '楼层名称',
  `left_adpage_banner` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '左侧轮播',
  `right_hot_recommend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '特色推荐',
  `left_adpage_nav` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '左侧楼层导航',
  `right_adpage_nav` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '右侧楼层导航',
  `floor_adpage_order` int(10) NULL DEFAULT 9999999 COMMENT '楼层默认排序',
  `floor_status` int(5) NULL DEFAULT 1 COMMENT '楼层状态1启用2不启用',
  `floor_update_time` datetime NULL DEFAULT '1970-05-24 10:42:02' COMMENT '楼层更新时间',
  `floor_type` tinyint(1) NOT NULL COMMENT '1 普通店铺配置  2供应商配置',
  PRIMARY KEY (`floor_adpage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'pc首页楼层广告' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_free_postage
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_free_postage`;
CREATE TABLE `gdb_merchant_free_postage`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '9.9免费专区' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_fruits_vegetables_rec
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_fruits_vegetables_rec`;
CREATE TABLE `gdb_merchant_fruits_vegetables_rec`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 10 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '时令果蔬' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_good_traceability
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_good_traceability`;
CREATE TABLE `gdb_merchant_good_traceability`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NOT NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NOT NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '好货溯源' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_base`;
CREATE TABLE `gdb_merchant_goods_base`  (
  `goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `common_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品公共表id',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺名称',
  `supplier_shop_id` int(10) NOT NULL DEFAULT 0 COMMENT '供应商店铺id',
  `supplier_goods_id` int(10) NOT NULL DEFAULT 0 COMMENT '供应商商品id',
  `goods_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称（+规格名称）',
  `goods_promotion_tips` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '促销提示',
  `cat_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品分类id',
  `brand_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '品牌id',
  `goods_spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品规格-JSON存储',
  `goods_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `guide_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '供应商商品单独销售指导价',
  `goods_market_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `goods_stock` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品库存',
  `goods_shop_gate_stock` int(10) NULL DEFAULT NULL COMMENT '门店库存总和最大值',
  `goods_alarm` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存预警值',
  `goods_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商家编号货号',
  `goods_barcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品二维码',
  `goods_is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '商品推荐 1是，0否 默认0',
  `goods_click` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品点击数量',
  `goods_salenum` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `goods_collect` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏数量',
  `goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品主图',
  `color_id` int(10) NOT NULL DEFAULT 0,
  `goods_evaluation_good_star` tinyint(3) UNSIGNED NOT NULL DEFAULT 5 COMMENT '好评星级',
  `goods_evaluation_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评价数',
  `goods_max_sale` int(10) NOT NULL DEFAULT 0 COMMENT '单人最大购买数量',
  `goods_is_shelves` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1-上架 2-下架 0店铺关闭手动下架',
  `goods_parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品来源id',
  `goods_cubage` decimal(10, 3) NULL DEFAULT NULL COMMENT '商品重量',
  `goods_baby_price` decimal(10, 2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '小宝价格',
  `goods_min_sale` int(10) NOT NULL DEFAULT 0 COMMENT '最小限购数据',
  `merchant_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家编号',
  `commodity_bar_type_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品条型码',
  `is_use` int(1) NULL DEFAULT NULL COMMENT '是否使用0：未使用；1：已使用',
  `spec_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格值',
  `goods_volume` decimal(10, 2) NULL DEFAULT NULL COMMENT '体积',
  `goods_cost_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本价',
  `commission` decimal(10, 2) NULL DEFAULT NULL COMMENT '佣金',
  `selling_point` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '直播卖点',
  `goods_send_back` int(10) NULL DEFAULT NULL COMMENT '商品是否寄回样品 0:是 1:否',
  `is_delete` int(1) NULL DEFAULT 0 COMMENT '是否删除(0:否;1:是)',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `need_integral` int(10) NULL DEFAULT NULL COMMENT '购买积分商品所需积分',
  `tax_inclusive_amount` int(255) NULL DEFAULT NULL COMMENT '含税金额',
  `dw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`goods_id`) USING BTREE,
  UNIQUE INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `common_id`(`common_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `cat_id`(`cat_id`) USING BTREE,
  INDEX `brand_id`(`brand_id`) USING BTREE,
  INDEX `goods_parent_id`(`goods_parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14113316 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_brand`;
CREATE TABLE `gdb_merchant_goods_brand`  (
  `brand_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '品牌编号',
  `brand_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名称',
  `cat_id` int(10) UNSIGNED NOT NULL COMMENT '分类id',
  `brand_initial` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '首字母',
  `brand_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌图片',
  `brand_enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用 ： 0. 否； 1.是',
  `brand_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐 ： 0. 否； 1.是',
  `shop_id` int(10) NOT NULL DEFAULT 0 COMMENT '上传店铺的id',
  `order_operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核操作人',
  `order_operator_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`brand_id`) USING BTREE,
  INDEX `brand_name`(`brand_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 426 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品品牌表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_cat
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_cat`;
CREATE TABLE `gdb_merchant_goods_cat`  (
  `cat_id` int(9) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 分类名称',
  `cat_parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父类',
  `cat_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类图片',
  `type_id` int(10) NOT NULL DEFAULT 0 COMMENT '类型id',
  `cat_commission` float NOT NULL DEFAULT 0 COMMENT '分佣比例',
  `cat_is_virtual` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否允许虚拟',
  `cat_displayorder` smallint(3) NOT NULL DEFAULT 255 COMMENT '排序',
  `cat_level` tinyint(1) NOT NULL COMMENT '分类级别',
  `cat_show_status` tinyint(1) NULL DEFAULT 1 COMMENT '是否在前台显示',
  `baby_commission` decimal(10, 0) NOT NULL COMMENT '大宝占类目佣金的比例',
  `bigbaby_commission` decimal(10, 0) NULL DEFAULT NULL COMMENT 'zanbuyong',
  `cat_frist_parent_id` int(10) NULL DEFAULT NULL,
  `is_integral_goods` int(10) NULL DEFAULT 0 COMMENT '标注该分类是否是 积分商品的分类 1 是 2 否',
  PRIMARY KEY (`cat_id`) USING BTREE,
  INDEX `cat_parent_id`(`cat_parent_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1006081507 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_cat_nav
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_cat_nav`;
CREATE TABLE `gdb_merchant_goods_cat_nav`  (
  `goods_cat_nav_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_cat_nav_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类别名',
  `goods_cat_nav_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐品牌',
  `goods_cat_nav_recommend` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐分类',
  `goods_cat_nav_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类图片',
  `goods_cat_nav_adv` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告图',
  `goods_cat_id` int(10) NOT NULL COMMENT '商品分类id',
  PRIMARY KEY (`goods_cat_nav_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类导航' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_common
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_common`;
CREATE TABLE `gdb_merchant_goods_common`  (
  `common_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `common_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `common_promotion_tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品广告词',
  `cat_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品分类',
  `cat_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品分类',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_cat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `shop_goods_cat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '店铺商品分类id  -- json',
  `goods_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商品goods_id',
  `shop_self_support` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否自营商品 1 不是 2 是',
  `shop_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 3 COMMENT '店铺状态-3：开店成功 2:待审核付款 1:待审核资料  0:关闭',
  `common_property` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性',
  `common_spec_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `common_spec_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规格值',
  `brand_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '品牌id',
  `brand_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '品牌名称',
  `type_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '类型id',
  `common_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品主图',
  `common_packing_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `common_service` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `common_state` int(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品状态 0下架，1正常，10违规（禁售）,2店铺下架商品下架,3商品删除',
  `common_state_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '违规原因',
  `common_verify` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '商品审核 1通过，0未通过，10审核中',
  `common_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核失败原因',
  `common_add_time` datetime NOT NULL DEFAULT '2019-01-29 13:37:12' COMMENT '商品添加时间',
  `common_sell_time` datetime NULL DEFAULT '2019-01-29 13:37:12' COMMENT '上架时间',
  `common_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `common_market_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `common_cost_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '成本价',
  `common_stock` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品价格\r\n市场价\r\n成本价\r\n商品库存\r\n商品库存',
  `common_limit` smallint(3) NOT NULL DEFAULT 0 COMMENT '每人限购 0 代表不限购',
  `common_alarm` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `common_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商家编号',
  `common_platform_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '平台货号',
  `common_cubage` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品重量',
  `common_collect` int(10) NOT NULL DEFAULT 0 COMMENT '商品收藏量',
  `common_evaluate` int(10) NOT NULL DEFAULT 0 COMMENT '商品评论数',
  `common_salenum` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品销量',
  `common_invoices` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '是否开具增值税发票 1是，0否',
  `common_is_return` tinyint(1) NOT NULL DEFAULT 1,
  `common_formatid_top` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '顶部关联板式',
  `common_formatid_bottom` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '底部关联板式',
  `common_is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '商品推荐',
  `common_is_virtual` tinyint(1) NULL DEFAULT 0 COMMENT '虚拟商品',
  `common_virtual_date` date NULL DEFAULT NULL COMMENT '虚拟商品有效期',
  `common_virtual_refund` tinyint(1) NULL DEFAULT 0 COMMENT '支持过期退款',
  `transport_type_id` int(10) NULL DEFAULT 0 COMMENT '0--> 固定运费   非零：transport_type_id  运费类型',
  `common_location` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品所在地 json',
  `common_is_tuan` tinyint(1) NULL DEFAULT 0 COMMENT '商品是否参加团购活动',
  `common_is_xian` tinyint(1) NULL DEFAULT 0 COMMENT '商品是否参加促销0不参加,1砍价,2秒杀,3限时折扣,4拼团,5满减赠折',
  `common_is_jia` tinyint(1) NOT NULL DEFAULT 0 COMMENT '商品是否参加加价购活动',
  `common_shop_contract_1` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消费者保障-由店铺映射到商品，用来检索使用',
  `common_shop_contract_2` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消费者保障-由店铺映射到商品，用来检索使用',
  `common_shop_contract_3` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消费者保障-由店铺映射到商品，用来检索使用',
  `common_shop_contract_4` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消费者保障-由店铺映射到商品，用来检索使用',
  `common_shop_contract_5` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消费者保障-由店铺映射到商品，用来检索使用',
  `common_shop_contract_6` tinyint(1) NULL DEFAULT 0,
  `cps_rate` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '一级分佣比例',
  `second_cps_rate` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '二级分佣比例',
  `third_cps_rate` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '三级分佣比例',
  `common_cps_rate` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '一级分佣比例',
  `common_second_cps_rate` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '二级分佣比例',
  `common_third_cps_rate` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '三级分佣比例',
  `common_is_directseller` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否参与推广 0不参与 1参与',
  `product_lock_flag` tinyint(1) NULL DEFAULT 0 COMMENT '店铺必须分销标记  1:不可删除   0：可以删除',
  `product_agent_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '代理商id-可更改，该店铺下级都属于该代理商。',
  `district_id` mediumint(8) NOT NULL DEFAULT 0 COMMENT '所在地,从店铺中同步，冗余检索使用',
  `supply_shop_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商品来源-供应商店铺id',
  `common_parent_id` int(10) NOT NULL DEFAULT 0 COMMENT '分销原产品',
  `goods_recommended_min_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '建议最低零售价',
  `goods_recommended_max_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '建议最高零售价',
  `product_distributor_flag` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否为分销商品 0-自有商品',
  `common_distributor_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分销说明',
  `common_distributor_flag` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1价格修改 2内容修改',
  `common_cps_commission` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '直属一级佣金-便于佣金排序',
  `common_goods_from` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1正常添加，2淘宝导入。默认为1',
  `transport_area_id` int(10) NOT NULL DEFAULT 0 COMMENT '售卖区域id,和yf_transport_area中的id对应',
  `transport_template` int(10) NOT NULL DEFAULT 0 COMMENT '运费模板',
  `common_is_man` tinyint(1) NOT NULL DEFAULT 0,
  `common_is_invoice` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开票',
  `cat_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类id列表',
  `common_update_by` int(10) NULL DEFAULT 0 COMMENT '更新人',
  `common_update_time` datetime NULL DEFAULT '2001-01-01 01:01:01' COMMENT '更新时间',
  `common_is_locked` int(2) NOT NULL DEFAULT 1 COMMENT '锁定 1 锁定 2 不锁定',
  `common_type` int(2) NOT NULL DEFAULT 1 COMMENT '1:商城价2:小宝价格3:商城和小宝价组合',
  `common_baby_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '小宝价格',
  `restriction_times` int(4) NOT NULL DEFAULT 2 COMMENT '限购次数',
  `restriction_hours` int(4) NOT NULL DEFAULT 2 COMMENT '限购天数',
  `order_operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `order_operator_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `common_is_treasure` int(11) NOT NULL DEFAULT 0 COMMENT '是否为聚宝1是',
  `common_click` int(10) NULL DEFAULT 0 COMMENT '商品点击数量',
  `corner_id` int(10) NULL DEFAULT 0 COMMENT '角标id',
  `type` int(3) NULL DEFAULT 1 COMMENT '主图类型 1图片2视频',
  `common_video` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '视频',
  `common_is_screen` int(3) NULL DEFAULT 1 COMMENT '商品是否屏蔽：1-否；2-是',
  `common_verify_time` datetime NULL DEFAULT '2020-04-16 00:00:00' COMMENT '提交审核时间',
  `submit_verify_time` datetime NULL DEFAULT '2020-04-16 00:00:00' COMMENT '提交审核时间',
  `spec_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `import_number` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导入时保存图片名字',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `virtual_goods` int(10) NULL DEFAULT 1 COMMENT '虚拟商品 0 是 1 否',
  `period_of_validity` datetime NULL DEFAULT NULL COMMENT '虚拟商品有效期',
  `past_due` int(10) NULL DEFAULT NULL COMMENT '过期退款 0 是 1 否',
  `integral_goods` int(10) NULL DEFAULT 1 COMMENT '积分商品 0是 1否',
  `common_is_shop_take` int(1) NULL DEFAULT NULL COMMENT '是否是门店自提商品 1是 2否',
  `goods_type` tinyint(1) NULL DEFAULT 1 COMMENT '1普通商品   2供应商商品',
  `dealer_goods_flag` tinyint(1) NULL DEFAULT 0 COMMENT '是否经销商品  0普通商品   1经销商品(商家一键上架供应商商品)  2购买经销商品（商家通过立即购买供应商上架的商品）',
  PRIMARY KEY (`common_id`) USING BTREE,
  INDEX `cat_id`(`cat_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `common_verify`(`common_verify`) USING BTREE,
  INDEX `common_state`(`common_state`) USING BTREE,
  INDEX `common_name`(`common_name`(255)) USING BTREE,
  INDEX `shop_name`(`shop_name`) USING BTREE,
  INDEX `brand_name`(`brand_name`) USING BTREE,
  INDEX `brand_id`(`brand_id`) USING BTREE,
  INDEX `shop_status`(`shop_status`) USING BTREE,
  INDEX `common_id`(`common_id`) USING BTREE,
  INDEX `common_is_xian`(`common_is_xian`) USING BTREE,
  INDEX `common_is_tuan`(`common_is_tuan`) USING BTREE,
  INDEX `common_is_virtual`(`common_is_virtual`) USING BTREE,
  INDEX `transport_type_id`(`transport_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118763 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??Ʒ???????ݱ?-δ???ɷֱ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_common_detail
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_common_detail`;
CREATE TABLE `gdb_merchant_goods_common_detail`  (
  `common_id` int(11) NOT NULL AUTO_INCREMENT,
  `common_body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品内容',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`common_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118763 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品公共内容详情表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_food_exhibition_hall
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_food_exhibition_hall`;
CREATE TABLE `gdb_merchant_goods_food_exhibition_hall`  (
  `exhibition_hall_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '展馆ID',
  `exhibition_hall_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '展馆名称',
  `exhibition_hall_area` int(5) NULL DEFAULT NULL COMMENT '特产馆所属区域，1华北2东北3华南4中南5西南6西北',
  `exhibition_hall_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '展馆主图',
  `exhibition_hall_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '展馆logo',
  `exhibition_hall_logo_wap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wap端logo',
  `exhibition_hall_desc1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '展馆图文描述',
  `exhibition_hall_desc2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `exhibition_hall_desc3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '展馆商品ID',
  `publish_time` datetime NOT NULL COMMENT '创建时间',
  `exhibition_hall_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '展馆状态：1正常 0关闭，暂时不用，便于以后扩充',
  PRIMARY KEY (`exhibition_hall_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '美食中国表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_format
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_format`;
CREATE TABLE `gdb_merchant_goods_format`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版式名称',
  `position` tinyint(1) NULL DEFAULT NULL COMMENT '位置',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关联板式表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_images
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_images`;
CREATE TABLE `gdb_merchant_goods_images`  (
  `images_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品图片id',
  `common_id` int(10) UNSIGNED NOT NULL COMMENT '商品公共内容id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺id',
  `images_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `images_displayorder` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `images_is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '默认主题，1是，0否',
  `type` tinyint(3) NULL DEFAULT 1 COMMENT '主图类型： 1图片2视频',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`images_id`) USING BTREE,
  INDEX `common_id`(`common_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 512377 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_label
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_label`;
CREATE TABLE `gdb_merchant_goods_label`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `weight` int(10) NULL DEFAULT NULL COMMENT '顺序',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品标签表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_property
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_property`;
CREATE TABLE `gdb_merchant_goods_property`  (
  `property_id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `property_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `type_id` int(10) NOT NULL COMMENT '所属类型id',
  `property_item` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值列',
  `property_is_search` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否被搜索。0为不搜索、1为搜索',
  `property_format` enum('text','select','checkbox') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '显示类型',
  `property_displayorder` smallint(3) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`property_id`) USING BTREE,
  INDEX `catid`(`property_format`) USING BTREE COMMENT '(null)'
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_property_index
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_property_index`;
CREATE TABLE `gdb_merchant_goods_property_index`  (
  `goods_property_index_id` int(11) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) UNSIGNED NOT NULL COMMENT '商品公共表id',
  `property_id` int(10) UNSIGNED NOT NULL COMMENT '属性id',
  `property_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  PRIMARY KEY (`goods_property_index_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品与属性值对应表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_rec
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_rec`;
CREATE TABLE `gdb_merchant_goods_rec`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '更新人',
  `common_id` int(10) NULL DEFAULT NULL,
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品推荐' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_rec_index
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_rec_index`;
CREATE TABLE `gdb_merchant_goods_rec_index`  (
  `rec_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐ID',
  `common_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '热门商品commonid',
  `publish_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `package_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '推荐状态：1正常 0关闭，暂时不用，便于以后扩充',
  `terminal_type` int(11) NOT NULL DEFAULT 1 COMMENT '终端选择，1pc，2移动端',
  `descrip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '描述',
  PRIMARY KEY (`rec_goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_recommend
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_recommend`;
CREATE TABLE `gdb_merchant_goods_recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推荐ID',
  `common_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '热门商品commonid',
  `recommend_add_time` datetime NOT NULL COMMENT '商品添加时间',
  `recommend_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型选择，1商品列表页',
  `recommend_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `recommend_type`(`recommend_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_spec`;
CREATE TABLE `gdb_merchant_goods_spec`  (
  `spec_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spec_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格名称',
  `cat_id` int(10) UNSIGNED NOT NULL COMMENT '快捷定位',
  `spec_displayorder` smallint(3) NOT NULL DEFAULT 0 COMMENT '排序',
  `spec_readonly` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1不可删除',
  PRIMARY KEY (`spec_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_spec_value`;
CREATE TABLE `gdb_merchant_goods_spec_value`  (
  `spec_value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `spec_value_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格值名称',
  `spec_id` int(10) UNSIGNED NOT NULL COMMENT '所属规格id',
  `type_id` int(10) NULL DEFAULT NULL COMMENT '类型ID',
  `cat_id` int(10) NULL DEFAULT NULL COMMENT '分类ID',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺ID',
  `spec_value_displayorder` smallint(3) NULL DEFAULT 1 COMMENT '排序',
  `cat_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '商品分类id',
  `creation_time` timestamp NULL DEFAULT '2001-01-01 09:01:01' COMMENT '创建时间，默认是系统时间',
  PRIMARY KEY (`spec_value_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85887 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格值表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_stepprice
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_stepprice`;
CREATE TABLE `gdb_merchant_goods_stepprice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `grade_id` int(11) NULL DEFAULT NULL COMMENT '会员等级id',
  `min_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最小数量',
  `max_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最大数量',
  `
price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gdb_merchant_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_type`;
CREATE TABLE `gdb_merchant_goods_type`  (
  `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `type_displayorder` tinyint(1) UNSIGNED NOT NULL DEFAULT 255 COMMENT '排序',
  `cat_id` int(10) NOT NULL DEFAULT -1 COMMENT '仅仅定位，无用',
  `cat_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `type_draft` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '草稿：只允许存在一条记录',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类型表-要取消各种快捷定位' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_goods_type_spec
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_goods_type_spec`;
CREATE TABLE `gdb_merchant_goods_type_spec`  (
  `type_spec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_id` int(10) UNSIGNED NOT NULL COMMENT '类型id',
  `spec_id` int(10) UNSIGNED NOT NULL COMMENT '规格id',
  PRIMARY KEY (`type_spec_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 363 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类型与规格对应表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_guess_you_like_rec
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_guess_you_like_rec`;
CREATE TABLE `gdb_merchant_guess_you_like_rec`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 10 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '猜你喜欢' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_holiday_favours_rec
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_holiday_favours_rec`;
CREATE TABLE `gdb_merchant_holiday_favours_rec`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 10 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节日钜惠' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_hot_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_hot_goods`;
CREATE TABLE `gdb_merchant_hot_goods`  (
  `goods_id` int(10) NOT NULL COMMENT '商品id',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品主图',
  `common_id` int(10) NOT NULL COMMENT 'commonId',
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌名',
  `goods_sale_num` int(10) NOT NULL DEFAULT 0 COMMENT '爆品销售数量',
  `hot_num` int(10) NOT NULL DEFAULT 1 COMMENT '热度   前端显示的时候 热度*销量',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺名称',
  `supply_price` decimal(10, 2) NOT NULL COMMENT '供货价',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '爆品价',
  `common_promotion_tips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品广告语',
  `corner_id` int(11) NULL DEFAULT 74 COMMENT '热销角标图id',
  `cat_id_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属分类  最多三个   中间用逗号隔开',
  `goods_sort` int(10) NOT NULL DEFAULT 1 COMMENT '排序 从小到大',
  `goods_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1待审核  2审核通过  3审核不通过 4删除',
  `goods_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  `start_time` date NULL DEFAULT NULL COMMENT '爆品开始日期',
  `end_time` date NULL DEFAULT NULL COMMENT '爆品结束日期',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`goods_id`) USING BTREE,
  UNIQUE INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `common_id`(`common_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `goods_sort`(`goods_sort`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商爆品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_mb_tpl_layout
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_mb_tpl_layout`;
CREATE TABLE `gdb_merchant_mb_tpl_layout`  (
  `mb_tpl_layout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mb_tpl_layout_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `mb_tpl_layout_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `mb_tpl_layout_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值:imageType;//商品id2:店铺id3:链接4:分类10:红包11:美食中国12:为你推荐13:特价推荐14:新品推荐\'\'15:溯源资讯16:店铺活动17:精选商品18:商城公告\'\',19新人专区;20平台活动专区;21:9.9包邮专区;22:品牌生活;23:好货溯源;24蜂狂特价;25猜你喜欢;26:时令果蔬;27:节日钜惠;28:限时折扣;29:超级拼团;30:拼团列表;31:新人红包配置值:imageType;//商品id2:店铺id3:链接4:分类10:红包11:美食中国12:为你推荐13:特价推荐14:新品推荐\'\'15:溯源资讯16:店铺活动17:精选商品18:商城公告\'\',19新人专区;20平台活动专区;21:9.9包邮专区;22:品牌生活;23:好货溯源;24蜂狂特价;25猜你喜欢;26:时令果蔬;27:节日钜惠;28:限时折扣;29:超级拼团;30:拼团列表;31:新人红包;32:限时折扣列表;33:限时秒杀;34:多品红包列表;35:礼品专区;36:红包限时抢;37:邀请送红包(分享好友);',
  `mb_tpl_layout_enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '使用启用 0:未启用 1:启用',
  `mb_tpl_layout_order` tinyint(2) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `mb_data_type` int(5) NOT NULL DEFAULT 3 COMMENT '数据格式类型1goods字符串2对象',
  `sub_site_id` int(11) NOT NULL DEFAULT 0 COMMENT '分站id',
  `mb_tpl_layout_goods` tinyint(1) NOT NULL DEFAULT 0 COMMENT '商品数量',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `create_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2018-09-05 --' COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2018-09-05 --' COMMENT '更新时间',
  `frame_background` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '外框背景',
  `inner_frame_background` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '内框背景',
  `none_layout_title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '栏目标题',
  `rec_goods` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '推荐商品',
  PRIMARY KEY (`mb_tpl_layout_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 176 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '手机端模板' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_modularizationd
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_modularizationd`;
CREATE TABLE `gdb_merchant_modularizationd`  (
  `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `page_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面名称',
  `page_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '页面内容',
  `page_type` int(10) NULL DEFAULT 0 COMMENT '0 未发布 1 以发布',
  `page_start` int(10) NULL DEFAULT 0 COMMENT '0 未使用 1已使用',
  `page_default` int(10) NULL DEFAULT 0 COMMENT '0 不是系统默认 1 是系统默认 ',
  `page_cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统默认页面 封面url',
  `page_is_index` int(10) NULL DEFAULT 1 COMMENT '是否是首页 1 是 2 二级页',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `goodsAllIdJson` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '当前页面的所有商品id',
  PRIMARY KEY (`page_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组件化 页面' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_modularizationd_copy1
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_modularizationd_copy1`;
CREATE TABLE `gdb_merchant_modularizationd_copy1`  (
  `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `page_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面名称',
  `page_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '页面内容',
  `page_type` int(10) NULL DEFAULT 0 COMMENT '0 未发布 1 以发布',
  `page_start` int(10) NULL DEFAULT 0 COMMENT '0 未使用 1已使用',
  `page_default` int(10) NULL DEFAULT 0 COMMENT '0 不是系统默认 1 是系统默认 ',
  `page_cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统默认页面 封面url',
  `page_is_index` int(10) NULL DEFAULT 1 COMMENT '是否是首页 1 是 2 二级页',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `goodsAllIdJson` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '当前页面的所有商品id',
  PRIMARY KEY (`page_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组件化 页面' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_new_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_new_goods`;
CREATE TABLE `gdb_merchant_new_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新品推荐' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_newborn_none
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_newborn_none`;
CREATE TABLE `gdb_merchant_newborn_none`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL,
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新人专区' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_platform_activities
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_platform_activities`;
CREATE TABLE `gdb_merchant_platform_activities`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台活动专区' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_platform_job
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_platform_job`;
CREATE TABLE `gdb_merchant_platform_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `time_out_period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超时时间配置 （例如：查询超过30分钟的数据）',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_platform_report
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_platform_report`;
CREATE TABLE `gdb_merchant_platform_report`  (
  `report_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) NOT NULL COMMENT '会员id',
  `user_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名',
  `goods_id` int(10) NOT NULL COMMENT '被举报的商品id',
  `goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被举报的商品名称',
  `goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `type_id` int(10) NOT NULL COMMENT '举报类型id',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报类型名',
  `report_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报信息',
  `report_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `report_time` datetime NOT NULL COMMENT '举报时间',
  `shop_id` int(10) NOT NULL COMMENT '被举报商品的店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被举报商品的店铺',
  `report_state` tinyint(1) NOT NULL COMMENT '举报状态(1未处理/2已处理)',
  `report_result` tinyint(1) NOT NULL COMMENT '举报处理结果(1无效举报/2恶意举报/3有效举报)',
  `report_message` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报处理信息',
  `report_handle_time` datetime NOT NULL COMMENT '举报处理时间',
  `report_handle_admin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '管理员',
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '举报表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_platform_report_subject
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_platform_report_subject`;
CREATE TABLE `gdb_merchant_platform_report_subject`  (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报主题id',
  `subject_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报主题内容',
  `type_id` int(11) NOT NULL COMMENT '举报类型id',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报类型名称 ',
  PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '举报主题表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_platform_report_subject_type
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_platform_report_subject_type`;
CREATE TABLE `gdb_merchant_platform_report_subject_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报类型id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报类型名称 ',
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报类型描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '举报类型表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_report_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_report_base`;
CREATE TABLE `gdb_merchant_report_base`  (
  `report_id` int(10) NOT NULL AUTO_INCREMENT,
  `report_type_id` int(10) NULL DEFAULT NULL COMMENT '报表类型ID',
  `report_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表类型名称',
  `report_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表信息',
  `report_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1-未处理 2-已处理',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '用户ID',
  `user_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户内容',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺ID',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `goods_id` int(10) NULL DEFAULT NULL COMMENT '货品ID',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货品名称',
  `goods_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货品图片',
  `report_date` datetime NULL DEFAULT NULL COMMENT '货品时间',
  `report_handle_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理消息',
  `report_handle_state` tinyint(1) NULL DEFAULT 0 COMMENT '0-未处理 1-有效 2-无效',
  `report_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表图片',
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_report_subject
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_report_subject`;
CREATE TABLE `gdb_merchant_report_subject`  (
  `report_subject_id` int(10) NOT NULL AUTO_INCREMENT,
  `report_subject_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理消息',
  `report_type_id` int(10) NULL DEFAULT NULL COMMENT '报表类型ID',
  `report_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表类型名称',
  PRIMARY KEY (`report_subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_report_type
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_report_type`;
CREATE TABLE `gdb_merchant_report_type`  (
  `report_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `report_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表类型名称',
  `report_type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表类型备注',
  PRIMARY KEY (`report_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_search_word
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_search_word`;
CREATE TABLE `gdb_merchant_search_word`  (
  `search_id` int(11) NOT NULL AUTO_INCREMENT,
  `search_keyword` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key值',
  `search_char_index` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下标',
  `search_nums` int(11) NULL DEFAULT 0 COMMENT '数量',
  PRIMARY KEY (`search_id`) USING BTREE,
  INDEX `search_keyword`(`search_keyword`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 951 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索热门词' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_share_config
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_share_config`;
CREATE TABLE `gdb_merchant_share_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `share_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `share_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享地址',
  `share_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分享类型，1商品，2店铺',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '详情页分享配置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_agreement
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_agreement`;
CREATE TABLE `gdb_merchant_shop_agreement`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `agreement_id` int(10) NOT NULL COMMENT '协议id',
  `update_date` timestamp NOT NULL DEFAULT '2019-10-10 08:00:00' COMMENT '更新时间',
  `shop_is_agree` tinyint(4) NOT NULL DEFAULT 1 COMMENT '店铺是否同意(0-不同意,1-同意,2-失效)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺补充协议' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_agreement_rule
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_agreement_rule`;
CREATE TABLE `gdb_merchant_shop_agreement_rule`  (
  `agreement_id` int(10) NOT NULL AUTO_INCREMENT,
  `agreement_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '协议名称',
  `agreement_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '协议内容',
  `agreement_start` timestamp NOT NULL DEFAULT '2019-10-10 08:00:00' COMMENT '协议开始时间',
  `agreement_end` timestamp NOT NULL DEFAULT '2019-10-10 08:00:00' COMMENT '协议结束时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2019-10-10 08:00:00' COMMENT '更新时间',
  `agreement_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '协议状态(1-有效,2-失效)',
  PRIMARY KEY (`agreement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺补充协议规则表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_bankcard_audit
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_bankcard_audit`;
CREATE TABLE `gdb_merchant_shop_bankcard_audit`  (
  `audit_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '审核编号-自增',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT '' COMMENT '店铺名称',
  `bank_account` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT '' COMMENT '开户姓名/开户企业名',
  `bank_number` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT '' COMMENT '银行卡号',
  `bank_address` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT '' COMMENT '开户行地址',
  `bank_code` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '银行支行联行号',
  `original_bank_account` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT '' COMMENT '原 开户姓名/开户企业名',
  `original_bank_number` varchar(100) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT '' COMMENT '原银行卡号',
  `original_bank_address` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT '' COMMENT '原开户地址',
  `original_bank_code` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '原银行支行联行号',
  `form_submitter` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '' COMMENT '修改提交人（不能为空）',
  `audit_create_time` datetime NULL DEFAULT NULL COMMENT '审核创建时间',
  `audit_operator` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '审核操作人（不能为空）',
  `audit_operater_time` datetime NULL DEFAULT NULL COMMENT '审核操作时间',
  `audit_status` int(10) NULL DEFAULT 0 COMMENT '审核状态（0：待审核 ， 1：审核通过，2：审核不通过）',
  `bank_name` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `province_id` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '省份ID',
  `city_id` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '市ID',
  `district_id` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '区ID',
  PRIMARY KEY (`audit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '店铺银行卡信息审核表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_base`;
CREATE TABLE `gdb_merchant_shop_base`  (
  `shop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT 0 COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺名称',
  `shop_grade_id` int(10) NULL DEFAULT 0 COMMENT '店铺等级',
  `shop_class_id` int(10) NULL DEFAULT 0 COMMENT '店铺绑定分类，如果是自营店铺就为0.',
  `shop_all_class` tinyint(1) NOT NULL DEFAULT 0 COMMENT '绑定所有经营类目',
  `shop_self_support` enum('true','false') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'false' COMMENT '是否自营',
  `shop_business` tinyint(1) NULL DEFAULT 0 COMMENT '0:个人入驻 1:企业入驻 2门店厂商',
  `shop_create_time` datetime NULL DEFAULT NULL COMMENT '开店时间',
  `shop_end_time` datetime NULL DEFAULT NULL COMMENT '有效期截止时间',
  `shop_settlement_cycle` mediumint(4) NULL DEFAULT 30 COMMENT '结算周期-天为单位-如果您想设置结算周期为一个月，则可以输入30',
  `shop_settlement_last_time` datetime NULL DEFAULT NULL COMMENT '店铺上次结算时间，若是新开店铺没有结算单，则是开店日期',
  `shop_points` int(10) NULL DEFAULT 0 COMMENT '积分',
  `shop_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺logo',
  `shop_banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺banner',
  `shop_status` int(10) NULL DEFAULT 0 COMMENT '店铺状态-3：开店成功 2:待审核付款 1:待审核资料  0:关闭',
  `shop_close_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关闭原因',
  `shop_collect` int(10) NULL DEFAULT 0 COMMENT '店铺粉丝数',
  `shop_workingtime` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工作时间',
  `shop_slide` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `shop_slideurl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `shop_domain` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '二级域名',
  `shop_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '详细地址',
  `shop_qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'qq',
  `shop_ww` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '旺旺',
  `shop_tel` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '卖家电话',
  `shop_free_shipping` int(10) NULL DEFAULT 0 COMMENT '免运费额度',
  `shop_payment` tinyint(1) NULL DEFAULT 0 COMMENT '0:未付款，1已付款',
  `joinin_year` int(10) NULL DEFAULT 0 COMMENT '加入时间',
  `is_renovation` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启装修(0:否，1：是)',
  `is_only_renovation` tinyint(1) NULL DEFAULT 0 COMMENT '是否仅显示装修(1：是，0：否）',
  `is_index_left` tinyint(1) NULL DEFAULT 0 COMMENT '是否左侧显示',
  `shop_print_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印订单页面下方说明',
  `shop_stamp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺印章-将出现在打印订单的右下角位置',
  `shop_parent_id` int(11) NULL DEFAULT NULL COMMENT '上级店铺id-创建店铺决定，所属分销商-不可更改！ 佣金公平性考虑',
  `shop_type` tinyint(4) NULL DEFAULT 1 COMMENT '店铺类型: 1-卖家店铺; 2:供应商店铺',
  `district_id` mediumint(8) NULL DEFAULT 0 COMMENT '所在地，使用最后一级分类',
  `shop_verify_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核信息备注',
  `shop_common_service` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺售后服务',
  `shop_rec_commission_rate` decimal(10, 2) NULL DEFAULT NULL,
  `shop_display_order` int(10) NULL DEFAULT 9999999 COMMENT '店铺默认排序',
  `shop_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺介绍',
  `shop_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺图片(wap中的店铺首页banner)',
  `wap_shop_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wap 店铺 logo',
  `shop_commission_rate` decimal(10, 2) NULL DEFAULT NULL,
  `shop_cooperative_agreements` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作协议',
  `shop_invoices` int(1) NULL DEFAULT 0 COMMENT '是否开具增值税发票 1是，0否',
  `shop_issue_invoice` tinyint(1) NULL DEFAULT 1 COMMENT '是否需要开票 0 不需要 1待审核 2审核通过 3审核失败',
  `shop_issue_userinfo` tinyint(1) NULL DEFAULT NULL COMMENT '公司基本信息审核  1待审核 2审核通过 3审核失败',
  `shop_issue_banktax` tinyint(1) NULL DEFAULT NULL COMMENT '银行税务信息审核  1待审核 2审核通过 3审核失败',
  `shop_issue_business` tinyint(1) NULL DEFAULT NULL COMMENT '税务信息审核  1待审核 2审核通过 3审核失败',
  `payment_verify_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '付款信息审核1待审核 2审核通过 3审核失败',
  `payment_verify_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核付款信息',
  `shop_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '暂无描述信息' COMMENT '店铺描述信息',
  `shop_origin` int(10) NOT NULL DEFAULT 0 COMMENT '1 渠道店铺 0正常店铺 2暂停使用的渠道店铺',
  `mobile_shop_slide` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端店铺轮播',
  `mobile_shop_slideurl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端轮播跳转地址',
  `shop_operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核操作人',
  `shop_operator_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `treasure_grade_id` int(11) NOT NULL DEFAULT 0 COMMENT '聚宝等级:1银牌2金牌3vip4钻石',
  `treasure_status` int(11) NOT NULL DEFAULT 1 COMMENT '聚宝付款信息1:尚未缴纳2:已缴纳3审核中4审核失败',
  `treasure_payment` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '聚宝付款金额',
  `treasure_payment_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '聚宝商家缴纳备注信息',
  `treasure_payment_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '平台审核原因',
  `treasure_join_date` datetime NOT NULL DEFAULT '2019-08-12 00:00:00' COMMENT '店铺审核通过时间',
  `treasure_join_voucher` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '付款凭证',
  `recommender_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '推荐人',
  `shop_name_verify` tinyint(3) NULL DEFAULT 1 COMMENT '店铺修改审核1-正常，2-审核中,3-审核失败',
  `new_shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '新更改的店铺名',
  `shop_business_verify` tinyint(3) NULL DEFAULT 1 COMMENT '入驻类型修改审核1-正常，2-审核中,3-审核失败',
  `shop_business_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '入驻类型审核备注',
  `shop_name_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺名审核备注',
  `shop_business_is_modify` tinyint(3) NULL DEFAULT 0 COMMENT '入驻类型是否修改1-是',
  `fine_num` int(11) NOT NULL DEFAULT 0 COMMENT '罚款次数',
  `shop_verify_status` int(5) NULL DEFAULT 1 COMMENT '店铺资质审核状态 1通过，0未通过，10审核中',
  `shop_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺资质审核备注',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `invoice_switch_status` int(11) NULL DEFAULT 0 COMMENT '发票功能开关状态:0-关闭;1-开启',
  `invoice_audit_status` int(11) NULL DEFAULT 3 COMMENT '发票开关审核状态:0-待审核；1-通过；2-不通过；3-未申请',
  `invoice_switch_reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家申请理由',
  `invoice_switch_create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请记录创建时间',
  `invoice_switch_update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请记录更新时间',
  `platform_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台审核备注',
  PRIMARY KEY (`shop_id`) USING BTREE,
  INDEX `shop_self_support`(`shop_self_support`) USING BTREE,
  INDEX `shop_status`(`shop_status`) USING BTREE,
  INDEX `shop_origin`(`shop_origin`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159626 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_class
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_class`;
CREATE TABLE `gdb_merchant_shop_class`  (
  `shop_class_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '店铺分类id',
  `shop_class_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺分类名称',
  `shop_class_deposit` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '保证金数额(元) 目前按类目收取保证金 该字段无用',
  `shop_class_displayorder` smallint(3) NOT NULL DEFAULT 255 COMMENT '显示次序',
  `shop_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '店铺类型 1普通店铺   2供应商店铺',
  PRIMARY KEY (`shop_class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺分类表-平台设置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_company
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_company`;
CREATE TABLE `gdb_merchant_shop_company`  (
  `shop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺编号',
  `shop_company_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司名称',
  `shop_company_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司所在地',
  `company_address_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司详细地址',
  `company_employee_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '员工总数',
  `company_registered_capital` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册资金',
  `company_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司电话',
  `contacts_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系人电话',
  `contacts_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系人email',
  `contacts_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `legal_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '法定代表人姓名',
  `legal_person_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '法人身份证号',
  `legal_person_electronic` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '法人身份证电子版',
  `legal_person_electronic2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '证件照反面',
  `legal_identity_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '证件类型 1身份证 2护照 3军官证',
  `business_license_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照所在地',
  `establish_date` date NULL DEFAULT NULL COMMENT '成立日期',
  `business_licence_start` date NOT NULL COMMENT '法定经营范围开始时间',
  `business_licence_end` date NOT NULL COMMENT '法定经营范围结束时间',
  `business_sphere` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务范围',
  `business_license_electronic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照电子版',
  `organization_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `organization_code_start` date NULL DEFAULT NULL COMMENT '组织机构代码证有效期开始时间',
  `organization_code_end` date NULL DEFAULT NULL COMMENT '组织机构代码证有效期结束时间',
  `organization_code_electronic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码证电子版',
  `general_taxpayer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一般纳税人证明',
  `bank_account_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '银行开户名',
  `bank_account_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司银行账号',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行联行号',
  `bank_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行所在地',
  `bank_licence_electronic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行许可证电子版',
  `tax_registration_certificate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记证号',
  `taxpayer_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `tax_registration_certificate_electronic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记证号电子版',
  `payment_voucher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款凭证',
  `payment_voucher_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款凭证说明',
  `business_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '营业执照号',
  `fee` float(10, 2) NULL DEFAULT NULL COMMENT '收费标准',
  `deposit` float(10, 2) NULL DEFAULT NULL COMMENT '保证金',
  `deposit_status` int(10) NOT NULL DEFAULT 2 COMMENT '1:已缴纳2:尚未缴纳3审核中4审核失败',
  `return_bond_status` int(10) NOT NULL DEFAULT 1 COMMENT '5：退保成功2:退保申请3:退保审核4:审核成功1:正常',
  `return_bond_voucher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '退保凭证',
  `return_bond_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '退保原因',
  `update_time` datetime NOT NULL DEFAULT '2019-07-11 15:14:55' COMMENT '更新时间',
  `return_bond_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '退保备注',
  `deposit_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '质保金审核备注',
  `shop_operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核操作人',
  `shop_operator_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `province_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份ID',
  `city_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市ID',
  `district_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区ID',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159626 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺公司信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_companys
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_companys`;
CREATE TABLE `gdb_merchant_shop_companys`  (
  `shop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺编号',
  `shop_company_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司名称',
  `shop_company_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司所在地',
  `company_address_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司详细地址',
  `company_employee_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '员工总数',
  `company_registered_capital` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册资金',
  `company_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司电话',
  `contacts_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系人电话',
  `contacts_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系人email',
  `contacts_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `legal_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '法定代表人姓名',
  `legal_person_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '法人身份证号',
  `legal_person_electronic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '法人身份证电子版',
  `legal_person_electronic2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '证件照反面',
  `legal_identity_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '证件类型 1身份证 2护照 3军官证',
  `business_license_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照所在地',
  `establish_date` date NULL DEFAULT NULL COMMENT '成立日期',
  `business_licence_start` date NOT NULL COMMENT '法定经营范围开始时间',
  `business_licence_end` date NOT NULL COMMENT '法定经营范围结束时间',
  `business_sphere` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务范围',
  `business_license_electronic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照电子版',
  `organization_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `organization_code_start` date NULL DEFAULT NULL COMMENT '组织机构代码证有效期开始时间',
  `organization_code_end` date NULL DEFAULT NULL COMMENT '组织机构代码证有效期结束时间',
  `organization_code_electronic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码证电子版',
  `general_taxpayer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一般纳税人证明',
  `bank_account_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行开户名',
  `bank_account_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司银行账号',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行联行号',
  `bank_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行所在地',
  `bank_licence_electronic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行许可证电子版',
  `tax_registration_certificate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记证号',
  `taxpayer_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `tax_registration_certificate_electronic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记证号电子版',
  `payment_voucher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款凭证',
  `payment_voucher_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款凭证说明',
  `business_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '营业执照号',
  `fee` float(10, 2) NULL DEFAULT NULL COMMENT '收费标准',
  `deposit` float(10, 2) NULL DEFAULT NULL COMMENT '保证金',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺公司信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_contract
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_contract`;
CREATE TABLE `gdb_merchant_shop_contract`  (
  `contract_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `contract_type_id` int(10) NOT NULL COMMENT '服务id',
  `shop_id` int(10) NOT NULL COMMENT '商铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商铺名称',
  `contract_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务类别名称',
  `contract_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：1-可以使用 2-永久不能使用',
  `contract_use_state` tinyint(1) NOT NULL DEFAULT 2 COMMENT '加入状态：1--已加入 2-已退出',
  `contract_cash` decimal(8, 2) NOT NULL COMMENT '保障金余额',
  `contract_log_id` int(10) NOT NULL COMMENT '保证金当前日志id',
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消费者保障服务店铺关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_contract_log
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_contract_log`;
CREATE TABLE `gdb_merchant_shop_contract_log`  (
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
  `contract_cash_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保证金图片',
  PRIMARY KEY (`contract_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消费者保障服务保证金缴纳日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_contract_type
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_contract_type`;
CREATE TABLE `gdb_merchant_shop_contract_type`  (
  `contract_type_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '服务id',
  `contract_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务名称',
  `contract_type_cash` decimal(10, 2) NOT NULL COMMENT '保证金金额',
  `contract_type_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务logo',
  `contract_type_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务介绍',
  `contract_type_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务介绍文章链接',
  `contract_type_sort` int(3) NOT NULL COMMENT '显示顺序',
  `contract_type_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '服务状态：1-开启，2-关闭',
  PRIMARY KEY (`contract_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消费者保障服务类型表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_custom_service
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_custom_service`;
CREATE TABLE `gdb_merchant_shop_custom_service`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客服名称',
  `tool` tinyint(1) NOT NULL COMMENT '客服工具',
  `number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客服账号',
  `type` tinyint(1) NOT NULL COMMENT '客服类型 0-售前客服 1-售后客服',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺客服表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_decoration
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_decoration`;
CREATE TABLE `gdb_merchant_shop_decoration`  (
  `decoration_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '装修编号',
  `decoration_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '装修名称',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `decoration_setting` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '装修整体设置(背景、边距等)',
  `decoration_nav` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '装修导航',
  `decoration_banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '装修头部banner',
  PRIMARY KEY (`decoration_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺装修表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_decoration_block
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_decoration_block`;
CREATE TABLE `gdb_merchant_shop_decoration_block`  (
  `block_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '装修块编号',
  `decoration_id` int(10) UNSIGNED NOT NULL COMMENT '装修编号',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `block_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '块内容',
  `block_module_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装修块模块类型',
  `block_full_width` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '是否100%宽度(0-否 1-是)',
  `block_sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '块排序',
  PRIMARY KEY (`block_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺装修块表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_domain
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_domain`;
CREATE TABLE `gdb_merchant_shop_domain`  (
  `shop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_sub_domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二级域名',
  `shop_edit_domain` int(10) NOT NULL COMMENT '编辑次数',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '二级域名表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_evaluation`;
CREATE TABLE `gdb_merchant_shop_evaluation`  (
  `evaluation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `shop_id` int(10) NOT NULL COMMENT '店铺ID',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '买家id',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `evaluation_desccredit` tinyint(1) UNSIGNED NOT NULL DEFAULT 5 COMMENT '描述相符评分',
  `evaluation_servicecredit` tinyint(1) UNSIGNED NOT NULL DEFAULT 5 COMMENT '服务态度评分',
  `evaluation_deliverycredit` tinyint(1) UNSIGNED NOT NULL DEFAULT 5 COMMENT '发货速度评分',
  `evaluation_create_time` datetime NOT NULL COMMENT '评价时间',
  PRIMARY KEY (`evaluation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺评分表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_express
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_express`;
CREATE TABLE `gdb_merchant_shop_express`  (
  `user_express_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '店铺物流id',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `waybill_tpl_id` int(10) UNSIGNED NOT NULL COMMENT '绑定关系-运单',
  `express_id` mediumint(8) NOT NULL DEFAULT 0 COMMENT '快递公司id',
  `user_is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为默认',
  `user_tpl_item` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '显示项目--json',
  PRIMARY KEY (`user_express_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6189 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '默认物流公司表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_goods_cat
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_goods_cat`;
CREATE TABLE `gdb_merchant_shop_goods_cat`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `common_id` int(10) NOT NULL COMMENT '商品id',
  `shop_goods_cat_id` int(10) NOT NULL COMMENT '分类ID',
  `shop_goods_cat_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺商品分类名称',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺ID',
  `parent_id` int(10) NOT NULL DEFAULT 0 COMMENT '父类ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `common_id`(`common_id`) USING BTREE,
  INDEX `shop_goods_cat_id`(`shop_goods_cat_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 838 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺商品分类关系表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_grade
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_grade`;
CREATE TABLE `gdb_merchant_shop_grade`  (
  `shop_grade_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺等级id   1 普通店铺 10 渠道店铺',
  `shop_grade_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shop_grade_fee` decimal(6, 2) NOT NULL COMMENT '收费标准-收费标准，单：元/年，必须为数字，在会员开通或升级店铺时将显示在前台',
  `shop_grade_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请说明',
  `shop_grade_goods_limit` mediumint(8) NOT NULL DEFAULT 0 COMMENT '可发布商品数 0:无限制',
  `shop_grade_album_limit` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可上传图片数',
  `shop_grade_template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺可选模板',
  `shop_grade_function_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '可用附加功能-function_editor_multimedia',
  `shop_grade_sort` mediumint(8) NOT NULL DEFAULT 0 COMMENT '级别-数值越大表明级别越高',
  PRIMARY KEY (`shop_grade_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺等级表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_help
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_help`;
CREATE TABLE `gdb_merchant_shop_help`  (
  `shop_help_id` int(10) NOT NULL,
  `help_sort` tinyint(1) UNSIGNED NULL DEFAULT 255 COMMENT '排序',
  `help_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `help_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '帮助内容',
  `help_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '跳转链接',
  `update_time` date NOT NULL COMMENT '更新时间',
  `page_show` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '页面类型:1为店铺,2为会员,默认为1,3为供应商',
  `help_type` tinyint(1) NULL DEFAULT 0 COMMENT '类型',
  PRIMARY KEY (`shop_help_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '开店指引表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_message_log
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_message_log`;
CREATE TABLE `gdb_merchant_shop_message_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺编号',
  `shop_id` int(10) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店铺名称',
  `shop_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '详细地址',
  `legal_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '法定代表人姓名',
  `legal_person_electronic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '法人身份证电子版',
  `legal_person_electronic2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '证件照反面',
  `shop_tel` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '卖家电话',
  `shop_company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '公司名称',
  `shop_company_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司所在地',
  `company_address_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司详细地址',
  `bank_account_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '银行开户名',
  `bank_account_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司银行账号',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行联行号',
  `bank_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行所在地',
  `company_employee_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '员工总数',
  `company_registered_capital` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册资金',
  `company_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司电话',
  `business_license_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照所在地',
  `business_license_electronic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '营业执照电子版',
  `business_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '营业执照号',
  `shop_verify_status` int(10) NOT NULL DEFAULT 10 COMMENT '店铺审核状态 1通过，0未通过，10审核中',
  `shop_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺信息审核备注',
  `update_by` int(10) NULL DEFAULT 0 COMMENT '审核操作人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `shop_business` int(11) NOT NULL DEFAULT 0 COMMENT '0:个人入驻 1:企业入驻',
  `shop_business_verify` int(3) NULL DEFAULT 1 COMMENT '入驻类型修改审核 1通过，0未通过，10审核中',
  `shop_business_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '入驻类型审核备注',
  `shop_business_is_modify` int(3) NULL DEFAULT 0 COMMENT '入驻类型是否修改1-是',
  `province_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份ID',
  `city_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市ID',
  `district_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺信息表日志' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_nav
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_nav`;
CREATE TABLE `gdb_merchant_shop_nav`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航名称',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '卖家店铺ID',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '导航内容',
  `displayorder` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '导航排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '导航是否显示',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺导航的外链URL',
  `target` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺导航外链是否在新窗口打开：0不开新窗口1开新窗口，默认是0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖家店铺导航信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_renewal
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_renewal`;
CREATE TABLE `gdb_merchant_shop_renewal`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '会员id',
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名称(不用存废弃)',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `shop_grade_id` int(10) UNSIGNED NOT NULL COMMENT '店铺等级id',
  `shop_grade_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺等级名称',
  `shop_grade_fee` decimal(10, 2) NOT NULL COMMENT '店铺等级费用',
  `renew_time` int(10) UNSIGNED NOT NULL COMMENT '续费时长',
  `renew_cost` decimal(10, 2) NOT NULL COMMENT '续费总费用',
  `create_time` datetime NOT NULL COMMENT '申请时间',
  `start_time` datetime NOT NULL COMMENT '有效期开始时间',
  `end_time` datetime NOT NULL COMMENT '有效期结束时间',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `admin_id` int(10) UNSIGNED NOT NULL COMMENT '管理员id',
  `admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名称',
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `district_id` mediumint(8) NOT NULL DEFAULT 0 COMMENT '所在地，使用最后一级分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '续费申请表\r\n' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_self_cat
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_self_cat`;
CREATE TABLE `gdb_merchant_shop_self_cat`  (
  `shop_goods_cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_goods_cat_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺商品分类名称',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺ID',
  `parent_id` int(10) NULL DEFAULT NULL COMMENT '父类ID',
  `shop_goods_cat_displayorder` smallint(3) NULL DEFAULT NULL COMMENT '默认',
  `shop_goods_cat_status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`shop_goods_cat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1035 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺商品分类表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_settled_backups
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_settled_backups`;
CREATE TABLE `gdb_merchant_shop_settled_backups`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `shop_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入驻内容',
  `update_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺入驻信息修改备份' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_shipping_address`;
CREATE TABLE `gdb_merchant_shop_shipping_address`  (
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
  `shipping_address_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`shipping_address_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1237 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发货地址表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_supplier
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_supplier`;
CREATE TABLE `gdb_merchant_shop_supplier`  (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '供货商id',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `supplier_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供货商名称',
  `contacts` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `contacts_tel` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注信息',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供货商表\r\n' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_template
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_template`;
CREATE TABLE `gdb_merchant_shop_template`  (
  `shop_temp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺模板名称  --根据模板名称来找寻对应的文件',
  `shop_style_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '风格名称',
  `shop_temp_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板对应的图片',
  PRIMARY KEY (`shop_temp_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺模板表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shop_videos
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shop_videos`;
CREATE TABLE `gdb_merchant_shop_videos`  (
  `video_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '视频id',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺id',
  `video_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频地址',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  PRIMARY KEY (`video_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺视频空间' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_shudan_job
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_shudan_job`;
CREATE TABLE `gdb_merchant_shudan_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'ip地址',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_specialty_goods_rec
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_specialty_goods_rec`;
CREATE TABLE `gdb_merchant_specialty_goods_rec`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品ID',
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '特产推荐' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_super_pintuan_rec
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_super_pintuan_rec`;
CREATE TABLE `gdb_merchant_super_pintuan_rec`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL,
  `display_order` int(10) NULL DEFAULT NULL,
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 10 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '审核失败原因',
  `special_area_sale` int(10) NULL DEFAULT 0 COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '超级拼团' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_sys_configs
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_sys_configs`;
CREATE TABLE `gdb_merchant_sys_configs`  (
  `config_key` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置键',
  `config_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值:imageType;//商品id2:店铺id3:链接4:分类10:红包11:美食中国12:为你推荐13:特价推荐14:新品推荐\'15:溯源资讯16:店铺活动17:精选商品18:商城公告\',19新人专区;20平台活动专区;21:9.9包邮专区;22:品牌生活;23:好货溯源',
  `config_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置类型',
  `config_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置内容描述',
  `config_sort` int(11) NOT NULL DEFAULT 0 COMMENT '配置排序',
  `op_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作类型，1关键字，2商品编号{\"goodsId\":5026,\"commonId\":5026}，3链接{\"url\":http://},4店铺{\"shopId\":11} 5不传值 6分类id {\\\"catId\\\":10000104}',
  `op_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型值',
  `config_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值，1可用，0不可用',
  `terminal_type` int(11) NOT NULL DEFAULT 1 COMMENT '终端选择，1pc，2移动端',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_date` datetime NULL DEFAULT '2018-09-05 00:00:00' COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '更新人',
  `update_date` datetime NULL DEFAULT '2018-09-05 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`config_key`) USING BTREE,
  INDEX `config_type`(`config_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_transport_area
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_transport_area`;
CREATE TABLE `gdb_merchant_transport_area`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '售卖区域模板',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物流及售卖区域模板名',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `area_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3226 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '售卖区域表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_transport_rule
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_transport_rule`;
CREATE TABLE `gdb_merchant_transport_rule`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `area_name` varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区域城市名称',
  `area_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域城市id',
  `rule_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1按重量  2按件数    3按体积',
  `update_time` datetime NOT NULL COMMENT '最后编辑时间',
  `transport_template_id` int(11) NOT NULL DEFAULT 0 COMMENT '模板id，与transport_template表中的id对应',
  `logistics_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '物流类型，扩展字段',
  `default_num` float(5, 1) NOT NULL DEFAULT 1.0 COMMENT '默认数量',
  `default_price` decimal(6, 2) NOT NULL COMMENT '默认运费',
  `add_num` float(5, 1) NOT NULL DEFAULT 1.0 COMMENT '增加数量',
  `add_price` decimal(6, 2) NOT NULL COMMENT '增加运费',
  `default_type` int(2) NULL DEFAULT 0 COMMENT '是否默认规则0:否1:是',
  PRIMARY KEY (`id`, `logistics_type`) USING BTREE,
  INDEX `transport_template_id`(`transport_template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9789 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运费规则表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_transport_template
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_transport_template`;
CREATE TABLE `gdb_merchant_transport_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运费模板id',
  `name` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  `shop_id` int(11) NULL DEFAULT 0 COMMENT '店铺ID',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态，1开启，0关闭',
  `const_price` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '固定运费',
  `is_free_postage` tinyint(1) NULL DEFAULT 0 COMMENT '是否包邮 0不包邮 1全国包邮 2自定义',
  `rule_type` tinyint(1) NULL DEFAULT NULL,
  `free_postage_cond` int(11) NULL DEFAULT 0 COMMENT '满多少kg/件包邮',
  `free_postage_areas` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `shipping_price` decimal(11, 2) NULL DEFAULT NULL COMMENT '低于包邮条件的运费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3791 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运费模板表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_treasure_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_treasure_goods`;
CREATE TABLE `gdb_merchant_treasure_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '聚宝商品id',
  `treasure_grade_id` int(10) NULL DEFAULT 0 COMMENT '聚宝等级id',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '聚宝商品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_treasure_grade
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_treasure_grade`;
CREATE TABLE `gdb_merchant_treasure_grade`  (
  `treasure_grade_id` int(10) NOT NULL AUTO_INCREMENT,
  `treasure_grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '等级名称',
  `number_of_gifts` int(5) NULL DEFAULT 0 COMMENT '赠送次数',
  `number_of_years` int(5) NULL DEFAULT 0 COMMENT '赠送年数',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `display_order` int(5) NOT NULL DEFAULT 0 COMMENT '权重',
  `order_full_amount` decimal(10, 2) NOT NULL COMMENT '订单满额',
  `treasure_grade_logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '等级logo',
  `treasure_payment` decimal(10, 2) NOT NULL COMMENT '等级缴纳金额',
  PRIMARY KEY (`treasure_grade_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '聚宝等级' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_treasure_shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_treasure_shop_goods`;
CREATE TABLE `gdb_merchant_treasure_shop_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `treasure_grade_id` int(10) NOT NULL DEFAULT 0 COMMENT '聚宝等级id',
  `number_of_gifts` int(5) NOT NULL DEFAULT 0 COMMENT '赠送次数',
  `send_end_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '赠送结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参与聚宝的店铺赠送的商品次数' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_treasure_user
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_treasure_user`;
CREATE TABLE `gdb_merchant_treasure_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '聚宝店铺id',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `user_id` int(12) NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT ' 用户名',
  `number_of_gifts` int(10) NOT NULL DEFAULT 0 COMMENT '赠送次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '聚宝用户' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_type_brand
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_type_brand`;
CREATE TABLE `gdb_merchant_type_brand`  (
  `type_brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_id` int(10) UNSIGNED NOT NULL COMMENT '类型id',
  `brand_id` int(10) UNSIGNED NOT NULL COMMENT '规格id',
  PRIMARY KEY (`type_brand_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 745 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类型与品牌对应表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_upload_album
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_upload_album`;
CREATE TABLE `gdb_merchant_upload_album`  (
  `album_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品图片Id',
  `album_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品图片地址',
  `album_cover` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `album_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `album_num` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容数量',
  `album_is_default` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '默认相册，1是，0否',
  `album_displayorder` smallint(4) NOT NULL DEFAULT 255 COMMENT '排序',
  `album_type` enum('video','other','image') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'image' COMMENT '附件册',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属用户id',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`album_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户相册表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_upload_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_upload_base`;
CREATE TABLE `gdb_merchant_upload_base`  (
  `upload_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品图片Id',
  `album_id` bigint(20) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `upload_url_prefix` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `upload_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `upload_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件的url   upload_url = upload_url_prefix  + upload_path',
  `upload_thumbs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'JSON存储其它尺寸',
  `upload_original` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原附件',
  `upload_source` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '源头-网站抓取',
  `upload_displayorder` tinyint(4) NOT NULL DEFAULT 50 COMMENT '排序',
  `upload_type` enum('video','other','image') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'image' COMMENT 'image|video|',
  `upload_image_spec` int(10) NOT NULL DEFAULT 0 COMMENT '规格',
  `upload_size` int(10) NOT NULL COMMENT '原文件大小',
  `upload_mime_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上传的附件类型',
  `upload_metadata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `upload_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件标题',
  `upload_time` int(10) NULL DEFAULT NULL COMMENT '附件日期',
  PRIMARY KEY (`upload_id`) USING BTREE,
  INDEX `album_id`(`user_id`, `album_id`, `upload_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户附件表-图片、视频' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_user_favorites_shop
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_user_favorites_shop`;
CREATE TABLE `gdb_merchant_user_favorites_shop`  (
  `favorites_shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `shop_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺logo',
  `favorites_shop_time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`favorites_shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏的店铺' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_user_footprint
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_user_footprint`;
CREATE TABLE `gdb_merchant_user_footprint`  (
  `footprint_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `common_id` int(10) NOT NULL COMMENT '商品id',
  `cat_id` int(10) UNSIGNED NOT NULL COMMENT '商品分类',
  `footprint_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2018-09-05 --' COMMENT '时间',
  `footprint_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2018-09-05 --' COMMENT '足记 - 年月日',
  PRIMARY KEY (`footprint_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `common_id`) USING BTREE COMMENT '(null)'
) ENGINE = InnoDB AUTO_INCREMENT = 1461 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品访问足迹表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_merchant_waybill_tpl
-- ----------------------------
DROP TABLE IF EXISTS `gdb_merchant_waybill_tpl`;
CREATE TABLE `gdb_merchant_waybill_tpl`  (
  `waybill_tpl_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `waybill_tpl_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '所属用户',
  `shop_id` int(10) NOT NULL DEFAULT 0 COMMENT '所属店铺id',
  `express_id` mediumint(8) NOT NULL COMMENT '物流公司id',
  `waybill_tpl_width` int(11) NOT NULL DEFAULT 0 COMMENT '运单宽度，单位为毫米(mm)',
  `waybill_tpl_height` int(11) NOT NULL DEFAULT 0 COMMENT '运单高度，单位为毫米(mm)',
  `waybill_tpl_top` int(255) NOT NULL DEFAULT 0 COMMENT '运单模板上偏移量，单位为毫米(mm)',
  `waybill_tpl_left` int(255) NOT NULL DEFAULT 0 COMMENT '运单模板左偏移量，单位为毫米(mm)',
  `waybill_tpl_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板图片-请上传扫描好的运单图片，图片尺寸必须与快递单实际尺寸相符',
  `waybill_tpl_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用0否1是',
  `waybill_tpl_build-in` tinyint(1) NOT NULL DEFAULT 1 COMMENT '系统内置0否1是',
  `waybill_tpl_item` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '显示项目--json',
  PRIMARY KEY (`waybill_tpl_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运单模板' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_pc_index_config
-- ----------------------------
DROP TABLE IF EXISTS `gdb_pc_index_config`;
CREATE TABLE `gdb_pc_index_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面名称',
  `page_type` int(11) NULL DEFAULT NULL COMMENT '页面类型 1 天天特价 2 特色专题  3 为你推荐 4楼层',
  `page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面标题',
  `page_two_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二级页面标题',
  `page_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '页面数据',
  `page_start` int(11) NULL DEFAULT 1 COMMENT '页面状态 1 开启 2 关闭',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_platform_brank
-- ----------------------------
DROP TABLE IF EXISTS `gdb_platform_brank`;
CREATE TABLE `gdb_platform_brank`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_card_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行卡卡号',
  `bank_card_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开户人姓名',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开户银行名称',
  `brank_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `brank_update_time` datetime(6) NOT NULL COMMENT '修改时间',
  `brank_unionpay_good` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银联号',
  `zfb_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝收款码',
  `warranty_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '质保金',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台收款银行卡表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_poverty_reilef
-- ----------------------------
DROP TABLE IF EXISTS `gdb_poverty_reilef`;
CREATE TABLE `gdb_poverty_reilef`  (
  `commit_list_id` int(22) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shop_name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `shop_id` int(10) NOT NULL COMMENT '店铺ID',
  `poverty_relief_num` int(22) NOT NULL COMMENT '爱心人士数量,扶贫',
  `poverty_relief_image` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '扶贫图片',
  `poverty_relief_title` varchar(25) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '扶贫标题',
  `poverty_relief_introduce` varchar(21844) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '扶贫介绍',
  `poverty_relief_district` varchar(25) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '扶贫区域',
  `status` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '状态o默认开始1关闭',
  `add_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `operation` varchar(25) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`commit_list_id`, `shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '扶贫申请表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_poverty_relief_commit
-- ----------------------------
DROP TABLE IF EXISTS `gdb_poverty_relief_commit`;
CREATE TABLE `gdb_poverty_relief_commit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commit_list_id` int(11) NULL DEFAULT NULL COMMENT '商品集合',
  `common_image` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '图片名称',
  `shop_name` varchar(25) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `common_id` int(11) NOT NULL,
  `common_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `common_name` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '货品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '扶贫关联商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_bargain_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_bargain_base`;
CREATE TABLE `gdb_promotion_bargain_base`  (
  `bargain_id` int(10) NOT NULL AUTO_INCREMENT,
  `bargain_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `bargain_start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `bargain_end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `bargain_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态， 1-正常/2-结束/3-管理员关闭',
  `bargain_create_time` datetime NULL DEFAULT NULL,
  `bargain_baseline` decimal(10, 2) NOT NULL COMMENT '砍价底线',
  `bargain_times` int(5) NOT NULL DEFAULT 0 COMMENT '参与次数',
  `bargain_display` int(10) NOT NULL DEFAULT 0 COMMENT '排序数字',
  `bargain_update_time` datetime NOT NULL COMMENT '更新时间',
  `bargain_first_range_start` decimal(10, 2) NOT NULL COMMENT '第一刀开始区间',
  `bargain_first_range_end` decimal(10, 2) NOT NULL COMMENT '第一刀结束区间',
  `bargain_other_range_start` decimal(10, 2) NOT NULL COMMENT '其他刀开始区间',
  `bargain_other_range_end` decimal(10, 2) NOT NULL COMMENT '其他刀结束区间',
  `bargain_origin` tinyint(1) NOT NULL,
  `bargain_second_range_start` decimal(10, 2) NOT NULL,
  `bargain_second_range_end` decimal(10, 2) NOT NULL COMMENT '第二刀',
  `bargain_count` int(10) NOT NULL COMMENT '统计砍价成功的数量',
  `bargain_kucun` int(10) NOT NULL DEFAULT 1 COMMENT '砍价设置库存',
  PRIMARY KEY (`bargain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价商品列表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_bargain_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_bargain_goods`;
CREATE TABLE `gdb_promotion_bargain_goods`  (
  `bargain_goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价商品表id',
  `bargain_id` int(10) UNSIGNED NOT NULL COMMENT '限时活动编号',
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品编号',
  `common_id` int(10) NOT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `goods_start_time` datetime NOT NULL COMMENT '开始时间',
  `goods_end_time` datetime NOT NULL COMMENT '结束时间',
  `bargain_status` tinyint(1) NOT NULL COMMENT '活动状态',
  `bargain_count` int(10) NOT NULL DEFAULT 12 COMMENT '砍价成功统计次数',
  `common_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  PRIMARY KEY (`bargain_goods_id`) USING BTREE,
  INDEX `bargain_goods_id`(`bargain_goods_id`) USING BTREE,
  INDEX `bargain_id`(`bargain_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `common_id`(`common_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_bargain_help
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_bargain_help`;
CREATE TABLE `gdb_promotion_bargain_help`  (
  `bargain_help_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帮砍ID',
  `bargain_id` int(10) NOT NULL DEFAULT 0 COMMENT '砍价ID',
  `bargain_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '帮砍用户名称',
  `bargain_user_id` int(10) NOT NULL DEFAULT 0 COMMENT '帮砍用户ID',
  `bargain_cut_price` decimal(10, 2) NOT NULL COMMENT '砍掉价格',
  `bargain_cut_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '砍价语句',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `user_bargain_id` int(10) UNSIGNED ZEROFILL NULL DEFAULT 0000000000,
  `bargain_is_self` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1自砍 2帮砍',
  `bargain_user_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(10) NOT NULL COMMENT '砍价用户ID',
  `bargain_help_times` int(10) NOT NULL DEFAULT 1 COMMENT '砍多少刀',
  `bargain_help_source` tinyint(255) NULL DEFAULT 0,
  PRIMARY KEY (`bargain_help_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价团列表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_bargain_user_limit
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_bargain_user_limit`;
CREATE TABLE `gdb_promotion_bargain_user_limit`  (
  `user_id` int(10) NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `user_logo` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `user_sex` int(1) NULL DEFAULT NULL COMMENT '用户性别',
  `bargain_cut_times` int(10) NOT NULL COMMENT '帮砍总次数',
  `bargain_cut_price` decimal(10, 2) NOT NULL COMMENT '帮砍总金额',
  `bargain_cut_limit` decimal(10, 2) NOT NULL COMMENT '帮砍额度',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否设置帮砍额度 1设置 ',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户帮砍统计表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_discount_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_discount_base`;
CREATE TABLE `gdb_promotion_discount_base`  (
  `discount_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '限时编号',
  `discount_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `discount_title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `discount_explain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动说明',
  `combo_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '套餐编号',
  `discount_start_time` datetime NOT NULL COMMENT '活动开始时间',
  `discount_end_time` datetime NOT NULL COMMENT '活动结束时间',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户编号',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `user_nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `discount_lower_limit` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '购买下限，1为不限制',
  `discount_state` int(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态， 1-正常/2-结束/3-管理员关闭',
  `discount_upper_limit` int(10) NOT NULL,
  `discount_hour` int(2) NOT NULL,
  `discount_create_time` datetime NOT NULL DEFAULT '2019-01-29 17:08:20' COMMENT '活动创建时间',
  PRIMARY KEY (`discount_id`) USING BTREE,
  INDEX `discount_id`(`discount_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时折扣活动表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_discount_combo
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_discount_combo`;
CREATE TABLE `gdb_promotion_discount_combo`  (
  `combo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '限时折扣套餐编号',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户编号',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `combo_start_time` datetime NOT NULL COMMENT '套餐开始时间',
  `combo_end_time` datetime NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`combo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时折扣套餐表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_discount_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_discount_goods`;
CREATE TABLE `gdb_promotion_discount_goods`  (
  `discount_goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '限时折扣商品表',
  `discount_id` int(10) UNSIGNED NOT NULL COMMENT '限时活动编号',
  `discount_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `discount_title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `discount_explain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动说明',
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品编号',
  `common_id` int(10) NOT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品原价',
  `discount_price` decimal(10, 2) NOT NULL COMMENT '限时折扣价格',
  `goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `goods_start_time` datetime NOT NULL COMMENT '开始时间',
  `goods_end_time` datetime NOT NULL COMMENT '结束时间',
  `goods_lower_limit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买下限，0为不限制',
  `discount_goods_state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态， 1-正常/2-结束/3-管理员关闭',
  `discount_goods_recommend` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐标志 0-未推荐 1-已推荐',
  `goods_upper_limit` int(10) NOT NULL COMMENT '购买上限',
  `goods_buy_count` int(11) NULL DEFAULT NULL COMMENT '北京光声_已购买的个数',
  PRIMARY KEY (`discount_goods_id`) USING BTREE,
  INDEX `discount_id`(`discount_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `common_id`(`common_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `goods_upper_limit`(`goods_upper_limit`) USING BTREE,
  INDEX `goods_lower_limit`(`goods_lower_limit`) USING BTREE,
  INDEX `discount_goods_state`(`discount_goods_state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时折扣商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_discount_remind
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_discount_remind`;
CREATE TABLE `gdb_promotion_discount_remind`  (
  `discount_remind_id` int(11) NULL DEFAULT NULL COMMENT '限时抢购提醒ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `discount_goods_id` int(11) NULL DEFAULT NULL COMMENT '限时抢购商品ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '北京光声_限时抢购提醒表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_discount_time
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_discount_time`;
CREATE TABLE `gdb_promotion_discount_time`  (
  `discount_time_id` decimal(11, 0) NULL DEFAULT NULL COMMENT '抢购ID',
  `discount_date` datetime NULL DEFAULT NULL COMMENT '日期',
  `discount_start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `discount_end_time` datetime NULL DEFAULT NULL COMMENT '结束时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '北京光声_限时抢购时间段' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_manjianzengzhe_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_manjianzengzhe_base`;
CREATE TABLE `gdb_promotion_manjianzengzhe_base`  (
  `promotion_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `start_time` datetime NOT NULL COMMENT '活动开始时间',
  `end_time` datetime NOT NULL COMMENT '活动结束时间',
  `promotion_status` int(11) NULL DEFAULT NULL COMMENT '活动状态:1-正常;0-已结束;2-管理员已关闭',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `promotion_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`promotion_id`) USING BTREE,
  UNIQUE INDEX `gdb_promotion_manjianzengzhe_base_promotion_id_uindex`(`promotion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '满减赠折基本信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_manjianzengzhe_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_manjianzengzhe_goods`;
CREATE TABLE `gdb_promotion_manjianzengzhe_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `promotion_id` int(11) NULL DEFAULT NULL COMMENT '活动ID',
  `common_id` int(11) NULL DEFAULT NULL COMMENT '商品公共表ID',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺ID',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '满减赠折商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_manjianzengzhe_rule
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_manjianzengzhe_rule`;
CREATE TABLE `gdb_promotion_manjianzengzhe_rule`  (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `promotion_id` int(11) NOT NULL COMMENT '活动ID',
  `promotion_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动内容',
  `has_giveaway` int(11) NULL DEFAULT 0 COMMENT '是否有赠品:1-有;0-无',
  `giveaway_id` int(11) NULL DEFAULT NULL COMMENT '赠品ID',
  `meet_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '满足金额',
  `discount_content` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠内容',
  `discount_type` int(11) NULL DEFAULT NULL COMMENT '折扣类型:1-满减;2-满赠;3-满折',
  `created_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '满减赠折规则表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_none_common
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_none_common`;
CREATE TABLE `gdb_promotion_none_common`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_none_type` int(10) NULL DEFAULT 1 COMMENT '活动类型1特产推荐;2新品推荐;3为你推荐;4蜂狂特价;5新人专区;6平台活动专区;7:9.9包邮专区;8:品牌生活;9:好货溯源;10:猜你喜欢;11:时令果蔬;12:节日钜惠;13:限时折扣;14:超级拼团;',
  `display_order` int(5) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NULL DEFAULT 10 COMMENT '审核 1通过，0未通过，10审核中',
  `common_id` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品参与的专区' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_pintuan
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_pintuan`;
CREATE TABLE `gdb_promotion_pintuan`  (
  `pintuan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '商家ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '拼团活动名称',
  `person_num` int(11) NOT NULL DEFAULT 1 COMMENT '几人成团',
  `start_time` datetime NOT NULL DEFAULT '2019-04-22 14:10:07' COMMENT '开团时间',
  `end_time` datetime NOT NULL DEFAULT '2019-04-22 14:10:07' COMMENT '结束时间',
  `created_time` datetime NOT NULL DEFAULT '2019-04-22 14:10:07' COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否可用，1为可用。',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐，0不推荐，1推荐',
  `common_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品ID',
  `start_hour` int(2) NOT NULL DEFAULT 1 COMMENT '持续时间',
  `update_time` datetime NOT NULL DEFAULT '2019-04-22 14:10:07' COMMENT '更新时间',
  `display_order` int(5) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`pintuan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团主表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_pintuan_buyer
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_pintuan_buyer`;
CREATE TABLE `gdb_promotion_pintuan_buyer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_id` int(11) NOT NULL COMMENT '拼团详情',
  `user_id` int(11) NOT NULL COMMENT '购买者ID',
  `created_time` datetime NOT NULL COMMENT '购买时间',
  `mark_id` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否是同一个团的，对应yf_pingtuan_mark表',
  `ranking` int(11) NOT NULL COMMENT '在团购，人中排第几。0为单独团',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://fkgou-images.oss-cn-qingdao.aliyuncs.com/file/upload/20190110/20190110094018.png?Expires=1862444433&OSSAccessKeyId=LTAIHv7U1m8yTCrg&Signature=UaFGoQWe9s9r18850JAePkBRwh4%3D' COMMENT '头像地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购买人' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_pintuan_cart
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_pintuan_cart`;
CREATE TABLE `gdb_promotion_pintuan_cart`  (
  `cart_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '买家id',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_num` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  `cart_status` tinyint(1) NOT NULL COMMENT '状态',
  `pt_detail_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE COMMENT '(null)'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团购物车表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_pintuan_combo
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_pintuan_combo`;
CREATE TABLE `gdb_promotion_pintuan_combo`  (
  `combo_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '套餐编号',
  `user_id` int(10) NOT NULL COMMENT '会员编号',
  `user_nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名称',
  `shop_id` int(10) NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `combo_start_time` datetime NOT NULL COMMENT '开始时间',
  `combo_end_time` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`combo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团套餐表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_pintuan_config
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_pintuan_config`;
CREATE TABLE `gdb_promotion_pintuan_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块',
  `config_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '1 代表模块1 （不可新增 删除）  2 代表 模块 2（可新增 删除）',
  `config_title_one` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级标题',
  `config_title_two` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二级标题',
  `config_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_pintuan_detail
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_pintuan_detail`;
CREATE TABLE `gdb_promotion_pintuan_detail`  (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `pintuan_id` int(11) NOT NULL COMMENT '拼团共用ID，如开始时间等',
  `goods_id` int(11) NOT NULL COMMENT '参加拼团的商品ID',
  `price_ori` float(10, 2) NOT NULL COMMENT '原价格',
  `price` float(10, 2) NOT NULL COMMENT '团购价格',
  `price_one` float(10, 2) NOT NULL COMMENT '单独购买价格',
  `recommend_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '推荐图片地址',
  `cid` int(11) NOT NULL COMMENT '商品类别id',
  `common_id` int(11) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团详情' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_pintuan_mark
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_pintuan_mark`;
CREATE TABLE `gdb_promotion_pintuan_mark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `mark_id` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '团长标识',
  `user_id` int(11) NOT NULL COMMENT '团长ID',
  `detail_id` int(11) NOT NULL COMMENT '拼团详情',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `num` tinyint(4) NOT NULL COMMENT '当前参团人数',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0,等待成团。1为已成团，2为成团失败，3为已完成退款',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `surplus_num` tinyint(4) NOT NULL DEFAULT 0 COMMENT '还差几人成团',
  `user_avatar` varchar(522) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://fkgou-images.oss-cn-qingdao.aliyuncs.com/file/upload/20190110/20190110094018.png?Expires=1862444433&OSSAccessKeyId=LTAIHv7U1m8yTCrg&Signature=UaFGoQWe9s9r18850JAePkBRwh4%3D' COMMENT '头像地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团，团长标识-我的拼团' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_pintuan_temp
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_pintuan_temp`;
CREATE TABLE `gdb_promotion_pintuan_temp`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `detail_id` int(11) NOT NULL COMMENT '活动详情id',
  `mark_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '团长id,0表示当前用户为团长',
  `goods_id` bigint(20) NOT NULL COMMENT '商品id',
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0拼团，1单独购买',
  `pay_start` int(11) NOT NULL DEFAULT 0 COMMENT '支付状态 0 未付款 1 已付款 2 以退款',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团信息表 参与者所属团 及拼团类型' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_seckill_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_seckill_base`;
CREATE TABLE `gdb_promotion_seckill_base`  (
  `seckill_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '限时编号',
  `seckill_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `seckill_title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `seckill_explain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动说明',
  `combo_id` int(10) UNSIGNED NOT NULL COMMENT '套餐编号',
  `seckill_start_time` datetime NOT NULL COMMENT '活动开始时间',
  `seckill_end_time` datetime NOT NULL COMMENT '活动结束时间',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户编号',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `user_nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `seckill_lower_limit` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '购买下限，1为不限制',
  `seckill_state` int(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态， 1-正常/2-结束/3-管理员关闭',
  `seckill_hour` int(2) NOT NULL COMMENT '场次',
  `seckill_upper_limit` int(10) NOT NULL COMMENT '最高购买数量',
  `seckill_join_limit` int(10) NOT NULL COMMENT '参与次数限制',
  `seckill_create_time` datetime NOT NULL DEFAULT '2019-01-29 17:08:20' COMMENT '活动创建时间',
  PRIMARY KEY (`seckill_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时秒杀活动表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_seckill_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_seckill_goods`;
CREATE TABLE `gdb_promotion_seckill_goods`  (
  `seckill_goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '限时秒杀商品表',
  `seckill_id` int(10) UNSIGNED NOT NULL COMMENT '限时活动编号',
  `seckill_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `seckill_title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `seckill_explain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动说明',
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品编号',
  `common_id` int(10) NOT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品原价',
  `seckill_price` decimal(10, 2) NOT NULL COMMENT '限时秒杀价格',
  `goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `goods_start_time` datetime NOT NULL COMMENT '开始时间',
  `goods_end_time` datetime NOT NULL COMMENT '结束时间',
  `goods_lower_limit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买下限，0为不限制',
  `seckill_goods_state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态， 1-正常/2-结束/3-管理员关闭',
  `seckill_goods_recommend` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐标志 0-未推荐 1-已推荐',
  `goods_upper_limit` int(10) NOT NULL COMMENT '限购数量',
  `seckill_num` int(10) NOT NULL COMMENT '秒杀数量',
  PRIMARY KEY (`seckill_goods_id`) USING BTREE,
  INDEX `seckill_id`(`seckill_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `common_id`(`common_id`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时秒杀商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_user_bargain
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_user_bargain`;
CREATE TABLE `gdb_promotion_user_bargain`  (
  `user_bargain_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `bargain_id` int(10) NOT NULL DEFAULT 0 COMMENT '砍价ID',
  `cut_price` decimal(10, 2) NOT NULL COMMENT '已砍价格',
  `common_id` int(10) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `bargain_baseline` decimal(10, 2) NOT NULL COMMENT '砍价底线',
  `user_bargain_status` tinyint(1) NOT NULL COMMENT '1 正常 2 结束 3 关闭 4 砍完 5待付款 6完成 7失败',
  `user_address_id` int(10) NOT NULL COMMENT '收货地址',
  `finished_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`user_bargain_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_voucher_common
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_voucher_common`;
CREATE TABLE `gdb_promotion_voucher_common`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_t_id` int(10) NOT NULL DEFAULT 0 COMMENT '代金券模版编号',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `display_order` int(5) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `voucher_t_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '代金券模版状态(1-有效,2-失效)',
  `common_id` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品参与的跨店满减活动' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_voucher_goods
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_voucher_goods`;
CREATE TABLE `gdb_promotion_voucher_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_t_id` int(10) NOT NULL DEFAULT 0 COMMENT '代金券模版编号',
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `display_order` int(5) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NOT NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核失败原因',
  `common_id` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券使用的商品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_voucher_inform
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_voucher_inform`;
CREATE TABLE `gdb_promotion_voucher_inform`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `voucher_t_id` int(10) NOT NULL COMMENT '代金券模版编号',
  `voucher_t_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '代金券模版名称',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `voucher_b_start_date` datetime NOT NULL DEFAULT '2019-06-25 00:00:00' COMMENT '优惠券报名开始时间',
  `voucher_b_end_date` datetime NOT NULL DEFAULT '2019-06-25 00:00:00' COMMENT '优惠券报名开始时间',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券报名通知' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_promotion_voucher_shop
-- ----------------------------
DROP TABLE IF EXISTS `gdb_promotion_voucher_shop`;
CREATE TABLE `gdb_promotion_voucher_shop`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) NOT NULL COMMENT '店铺id',
  `display_order` int(5) NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NOT NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核失败原因',
  `voucher_t_id` int(10) NOT NULL DEFAULT 0 COMMENT '代金券模版编号',
  `wait_verify_goods_num` int(10) NOT NULL DEFAULT 0 COMMENT '待审核数',
  `pass_verify_goods_num` int(10) NOT NULL DEFAULT 0 COMMENT '通过审核的商品数',
  `refuse_verify_goods_num` int(10) NOT NULL DEFAULT 0 COMMENT '拒绝审核审核商品数',
  `all_goods_num` int(10) NOT NULL DEFAULT 0 COMMENT '提报商品总数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台优惠券的参加店铺' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_shop_fx_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `gdb_shop_fx_goods_info`;
CREATE TABLE `gdb_shop_fx_goods_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名',
  `sc_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市场价',
  `cb_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '成本价',
  `pc_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品价格',
  `goods_status` int(1) NOT NULL DEFAULT 1 COMMENT '1上架 2下架',
  `sale_nums` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '分享销售数量',
  `goods_nums` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '弃用',
  `reward_type` int(11) NULL DEFAULT 1 COMMENT '佣金比率类型 1：使用默认 2：自定义',
  `tg_rate` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推广佣金比例（数字格式 运算需要自己/100）',
  `fx_rate` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享佣金比例（数字格式 运算需要自己/100）',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '推广排序',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺id',
  `shop_user_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家用户id',
  `var1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `var2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `var3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `var4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_status` int(1) NULL DEFAULT NULL COMMENT '弃用',
  `goods_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `goods_name`(`goods_name`) USING BTREE,
  INDEX `shop_id`(`shop_id`) USING BTREE,
  INDEX `shop_user_id`(`shop_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 221 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_shop_gate
-- ----------------------------
DROP TABLE IF EXISTS `gdb_shop_gate`;
CREATE TABLE `gdb_shop_gate`  (
  `shop_gate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '门店ID',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '用户ID',
  `shop_id` int(10) NOT NULL COMMENT '所属店铺',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名(手机号：1.已注册；2.未开通店铺和门店)',
  `gate_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `state` int(10) NOT NULL COMMENT '店铺状态：0.关闭；1.开启',
  `shop_gate_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店名称',
  `shop_gate_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店描述',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `detail_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纬度',
  `gate_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `business_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业时间',
  `traffic_route` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交通路线',
  `gate_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实况照片URL',
  `limits` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限',
  PRIMARY KEY (`shop_gate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_shop_gate_goods_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_shop_gate_goods_base`;
CREATE TABLE `gdb_shop_gate_goods_base`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增主键',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `shop_gate_id` int(11) NULL DEFAULT NULL COMMENT '门店id',
  `common_id` int(11) NULL DEFAULT NULL COMMENT '货品id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `shop_gate_goods_stock` int(11) NULL DEFAULT NULL COMMENT '门店商品库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店商品库存对应表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_shop_settled_recommender
-- ----------------------------
DROP TABLE IF EXISTS `gdb_shop_settled_recommender`;
CREATE TABLE `gdb_shop_settled_recommender`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `recommender_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '推荐人',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺推荐人' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_spinwin_activity
-- ----------------------------
DROP TABLE IF EXISTS `gdb_spinwin_activity`;
CREATE TABLE `gdb_spinwin_activity`  (
  `activity_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `activity_start_time` timestamp NOT NULL DEFAULT '2019-09-02 23:35:00' COMMENT '活动开始时间',
  `activity_end_time` timestamp NOT NULL DEFAULT '2019-09-02 23:35:00' COMMENT '活动结束时间',
  `partake_num_is_display` int(10) NOT NULL DEFAULT 1 COMMENT '参与人数是否显示：1-显示，2-隐藏',
  `partake_num` int(10) NOT NULL DEFAULT 0 COMMENT '参与人数',
  `partake_num_is_limit` int(10) NOT NULL DEFAULT 1 COMMENT '参与人数限制是否限制：1-不限，2-限制',
  `partake_num_limit` int(10) NOT NULL DEFAULT 0 COMMENT '参与人数限制',
  `graphic_explanation` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图文说明',
  `first_screen_advertise` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '首屏广告',
  `first_screen_is_display` int(10) NOT NULL DEFAULT 1 COMMENT '首屏广告是否展示1-显示2-不显示',
  `is_round_award_information` int(10) NOT NULL DEFAULT 1 COMMENT '是否轮播获奖信息：1-开启，2关闭',
  `activity_is_enable` int(3) NOT NULL DEFAULT 1 COMMENT '活动是否可用1-可用2不可用3-删除',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2019-11-19 21:13:00' COMMENT '更新时间',
  `total_sweepstakes_is_limit` int(10) NOT NULL DEFAULT 1 COMMENT '总抽奖机会:是否限制：1-不限，2-限制',
  `total_sweepstakes_limit` int(10) NOT NULL DEFAULT 0 COMMENT '总抽奖机会',
  `winning_times_per_person` int(10) NOT NULL DEFAULT 0 COMMENT '每人每日抽奖次数',
  `winning_rate` decimal(10, 2) NULL DEFAULT NULL,
  `expected_number_of_participants` int(10) NOT NULL DEFAULT 0 COMMENT '预计参与人数',
  `turntable_background` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '转盘背景',
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '幸运大转盘活动' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_spinwin_activity_gift
-- ----------------------------
DROP TABLE IF EXISTS `gdb_spinwin_activity_gift`;
CREATE TABLE `gdb_spinwin_activity_gift`  (
  `gift_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gift_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '礼品名称',
  `redpacket_t_id` int(11) NOT NULL DEFAULT 0 COMMENT '红包模版编号',
  `gift_is_redpacket` int(3) NOT NULL DEFAULT 1 COMMENT '礼品是否是红包1-是,2-否',
  `gift_is_enable` int(3) NOT NULL DEFAULT 1 COMMENT '礼品是否可用1-可用,2-不可用',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `gift_image` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '礼品图片',
  PRIMARY KEY (`gift_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大转盘活动礼品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_spinwin_activity_person
-- ----------------------------
DROP TABLE IF EXISTS `gdb_spinwin_activity_person`;
CREATE TABLE `gdb_spinwin_activity_person`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prize_id` int(10) NOT NULL DEFAULT 0 COMMENT '奖项id',
  `activity_id` int(10) NOT NULL DEFAULT 0 COMMENT '活动id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `redpacket_id` int(10) NULL DEFAULT 0 COMMENT '红包id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '幸运大转盘抽奖记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_spinwin_activity_prize
-- ----------------------------
DROP TABLE IF EXISTS `gdb_spinwin_activity_prize`;
CREATE TABLE `gdb_spinwin_activity_prize`  (
  `prize_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prize_grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '奖项等级',
  `prize_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '奖项名称',
  `gift_id` int(10) NOT NULL DEFAULT 0 COMMENT '礼品id',
  `activity_id` int(10) NOT NULL DEFAULT 0 COMMENT '活动id',
  `gift_num` int(10) NOT NULL DEFAULT 0 COMMENT '礼品数量',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `give_out_gift_num` int(10) NOT NULL DEFAULT 0 COMMENT '给出的礼品数量',
  `is_win` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否中奖 1中奖2不中奖',
  `display_order` int(10) NOT NULL DEFAULT 0 COMMENT '奖项排序',
  PRIMARY KEY (`prize_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大转盘活动奖项' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_spinwin_lucky_draw_times
-- ----------------------------
DROP TABLE IF EXISTS `gdb_spinwin_lucky_draw_times`;
CREATE TABLE `gdb_spinwin_lucky_draw_times`  (
  `time_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) NOT NULL DEFAULT 0 COMMENT '活动id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `lucky_draw_times` int(10) NOT NULL DEFAULT 0 COMMENT '总抽奖次数',
  `surplus_draw_times` int(10) NOT NULL DEFAULT 0 COMMENT '剩余抽奖次数',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `winning_times` int(10) NOT NULL DEFAULT 0 COMMENT '中奖次数',
  `number_of_daily_lottery` int(10) NOT NULL DEFAULT 0 COMMENT '每日抽奖次数',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `num_sweepstakes_today` int(10) NOT NULL DEFAULT 0 COMMENT '今日抽奖次数',
  PRIMARY KEY (`time_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '大转盘用户抽奖次数' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_app_config
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_app_config`;
CREATE TABLE `gdb_system_app_config`  (
  `config_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数组下标',
  `config_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数组值',
  `config_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设置类型',
  `config_enable` decimal(1, 0) NULL DEFAULT NULL COMMENT '状态值，1可能，0不可用',
  `config_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `config_datatype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `config_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计量单位'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '北京光声_限时配置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_base_app
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_base_app`;
CREATE TABLE `gdb_system_base_app`  (
  `app_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '服务ID',
  `app_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `app_type` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '服务类型',
  `app_seq` int(11) NOT NULL COMMENT '顺序号',
  `app_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务密钥',
  `app_ip_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '服务 IP 列表',
  `app_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务网址',
  `app_admin_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台网址',
  `app_url_recharge` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_url_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '检查订单是否存在的url地址',
  `app_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'LOGO 图片地址',
  `app_hosts` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '域名列表',
  `return_fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回字段',
  `app_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:启用  0：禁用',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_message_template
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_message_template`;
CREATE TABLE `gdb_system_message_template`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件模板' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_page_layout
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_page_layout`;
CREATE TABLE `gdb_system_page_layout`  (
  `layout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `layout_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '框架名称',
  `layout_structure` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '框架结构|可以逐条存取，考虑到由平台统一设定，直接一个字段存取',
  PRIMARY KEY (`layout_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '页面布局版式-模板' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_page_settings
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_page_settings`;
CREATE TABLE `gdb_system_page_settings`  (
  `page_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名称',
  `user_id` mediumint(8) NOT NULL COMMENT '所属用户',
  `page_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '颜色',
  `page_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在页面',
  `layout_id` int(10) NOT NULL COMMENT '模版',
  `page_update_time` datetime NOT NULL COMMENT '更新时间',
  `page_order` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `page_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `page_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块html代码',
  `page_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块JSON代码',
  `page_cat_id` int(11) NOT NULL DEFAULT 1 COMMENT '所属分类，真正显示页面',
  `sub_site_id` mediumint(4) NOT NULL DEFAULT 0 COMMENT '所属分站Id:0-总站 -1-供应商首页  其他表示分站',
  PRIMARY KEY (`page_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '页面模块表-用户获取最终的广告           pc端类目模块设置 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_platform_custom_service
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_platform_custom_service`;
CREATE TABLE `gdb_system_platform_custom_service`  (
  `custom_service_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '平台咨询ID',
  `custom_service_type_id` int(10) UNSIGNED NOT NULL COMMENT '平台咨询类型ID',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户Id',
  `user_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `custom_service_question` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '咨询内容',
  `custom_service_question_time` datetime NOT NULL COMMENT '咨询时间',
  `user_id_admin` int(10) UNSIGNED NOT NULL COMMENT '平台客服id-管理员id',
  `custom_service_answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '咨询回复',
  `custom_service_answer_time` datetime NOT NULL COMMENT '回复时间',
  `custom_service_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否回复  1   2:已经回复',
  PRIMARY KEY (`custom_service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台客服-平台咨询表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_platform_custom_service_type
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_platform_custom_service_type`;
CREATE TABLE `gdb_system_platform_custom_service_type`  (
  `custom_service_type_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '平台咨询类型ID',
  `custom_service_type_sort` int(3) NOT NULL DEFAULT 255 COMMENT '平台咨询类型排序',
  `custom_service_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台咨询类型名',
  `custom_service_type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台咨询类型备注',
  PRIMARY KEY (`custom_service_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台咨询类别表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_platform_nav
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_platform_nav`;
CREATE TABLE `gdb_system_platform_nav`  (
  `nav_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `nav_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类别，0自定义导航，1商品分类，2文章导航，3活动导航，默认为0',
  `nav_item_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类别ID，对应着nav_type中的内容，默认为0',
  `nav_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航标题',
  `nav_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航链接',
  `nav_location` tinyint(1) NOT NULL DEFAULT 0 COMMENT '导航位置，0头部，1中部，2底部，默认为0',
  `nav_new_open` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否以新窗口打开，0为否，1为是，默认为0',
  `nav_displayorder` tinyint(3) UNSIGNED NOT NULL DEFAULT 255 COMMENT '排序',
  `nav_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用 0 否  1是',
  `nav_readonly` tinyint(4) NOT NULL DEFAULT 0 COMMENT '不可修改-团购、积分等等',
  `nav_is_rec` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否被推荐1推荐',
  `nav_property` tinyint(1) NULL DEFAULT 0 COMMENT '1商城 2批发市场',
  PRIMARY KEY (`nav_id`) USING BTREE,
  INDEX `nav_displayorder`(`nav_displayorder`) USING BTREE,
  INDEX `nav_active`(`nav_active`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '页面导航表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_sub_site
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_sub_site`;
CREATE TABLE `gdb_system_sub_site`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '城市分站表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_user_app
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_user_app`;
CREATE TABLE `gdb_system_user_app`  (
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `app_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '服务ID',
  `app_user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户在该服务的ID',
  `app_user_level` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户在该服务的等级',
  `active_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '激活时间',
  `app_quantity` int(11) NOT NULL DEFAULT 1 COMMENT 'app数量',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_name`, `app_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与服务对应表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_user_app_server
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_user_app_server`;
CREATE TABLE `gdb_system_user_app_server`  (
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '这个user_name是指玩家在运营商那边的唯一标记，不是官方平台的账号',
  `app_id` int(11) NOT NULL COMMENT '应用在官方平台的app_id',
  `server_id` int(11) NOT NULL COMMENT '服务器id',
  `active_time` int(11) NOT NULL COMMENT '激活时间',
  PRIMARY KEY (`user_name`, `app_id`, `server_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户激活应用的服务器列表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_web_config
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_web_config`;
CREATE TABLE `gdb_system_web_config`  (
  `config_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数组下标',
  `config_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数组值',
  `config_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值，1可能，0不可用',
  `config_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config_datatype` enum('string','json','number') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型',
  PRIMARY KEY (`config_key`) USING BTREE,
  INDEX `index`(`config_key`, `config_type`) USING BTREE COMMENT '(null)'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_widget_base
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_widget_base`;
CREATE TABLE `gdb_system_widget_base`  (
  `widget_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` mediumint(8) NOT NULL DEFAULT 0 COMMENT '用户id',
  `page_id` int(8) NOT NULL COMMENT '广告页id',
  `layout_id` tinyint(4) NOT NULL DEFAULT 0 COMMENT '模板布局id， 如果没有可以为0，可以理解为组概念',
  `widget_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告位名:如果有layout, 则用block1... 程序自动命名。  目前只按照具备layout的功能开发',
  `widget_cat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别，目前有layout设定决定：广告（自定义数据）|商品分类（商城获取）|商品（商城获取）',
  `widget_width` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宽度',
  `widget_height` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '高度',
  `widget_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型: 图片 幻灯片 滚动 文字  - 如果针对mall等等固定使用地方，可以修改成固定类型',
  `widget_desc` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `widget_price` decimal(10, 2) NOT NULL COMMENT '价格',
  `widget_unit` enum('day','week','month') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',
  `widget_total` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '广告数量',
  `widget_time` datetime NOT NULL COMMENT '创建时间',
  `widget_view_num` int(10) NOT NULL DEFAULT 0 COMMENT 'page view  - 独立建表更好 - cpm可以使用',
  `widget_click_num` int(10) NOT NULL DEFAULT 0 COMMENT '点击次数 - 独立建表更好 - cpc可以使用',
  `widget_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用',
  PRIMARY KEY (`widget_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告位表 首页模块设置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_widget_item
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_widget_item`;
CREATE TABLE `gdb_system_widget_item`  (
  `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `widget_id` int(5) UNSIGNED NOT NULL COMMENT '广告位id',
  `item_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '广告名',
  `item_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '点击访问网址',
  `item_text` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `item_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `item_bgcolor` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '背景颜色',
  `item_province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `item_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '市',
  `item_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区',
  `item_street` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `item_cat_id` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类别ID',
  `item_stime` datetime NOT NULL COMMENT '开始时间',
  `item_etime` datetime NOT NULL COMMENT '结束时间',
  `item_sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 50 COMMENT '排序',
  `item_active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否启用',
  `item_time` datetime NOT NULL COMMENT '创建时间',
  `item_click_num` int(10) UNSIGNED NOT NULL COMMENT '点击次数-- 独立建表更好',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告内容表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_system_widget_nav
-- ----------------------------
DROP TABLE IF EXISTS `gdb_system_widget_nav`;
CREATE TABLE `gdb_system_widget_nav`  (
  `widget_nav_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `widget_nav_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '分类名称',
  `widget_nav_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头部url',
  `page_id` int(10) NOT NULL DEFAULT 0 COMMENT '模板id',
  PRIMARY KEY (`widget_nav_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告位楼层头部分类表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_tag_class_info
-- ----------------------------
DROP TABLE IF EXISTS `gdb_tag_class_info`;
CREATE TABLE `gdb_tag_class_info`  (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `class_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `is_active` int(11) NULL DEFAULT 1 COMMENT '是否启用:1-开启,0-关闭',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题分类表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_tag_info
-- ----------------------------
DROP TABLE IF EXISTS `gdb_tag_info`;
CREATE TABLE `gdb_tag_info`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题ID',
  `class_id` int(11) NOT NULL COMMENT '所属分类',
  `tag_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '话题内容',
  `tag_subtitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '话题副标题',
  `tag_cover` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '话题封面',
  `is_active` int(11) NULL DEFAULT 1 COMMENT '是否启用:1-开启,0-关闭',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社区话题表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_taxRate
-- ----------------------------
DROP TABLE IF EXISTS `gdb_taxRate`;
CREATE TABLE `gdb_taxRate`  (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tax_rate_sl` int(11) NOT NULL COMMENT '商城税率',
  PRIMARY KEY (`tax_rate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gdb_trace_information
-- ----------------------------
DROP TABLE IF EXISTS `gdb_trace_information`;
CREATE TABLE `gdb_trace_information`  (
  `trace_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺id',
  `trace_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容标题',
  `trace_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章封面',
  `trace_content_abstract` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推广的文字摘要',
  `trace_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推广的内容',
  `trace_read` int(10) NOT NULL DEFAULT 0 COMMENT '内容阅读数',
  `trace_collect` int(10) NOT NULL DEFAULT 0 COMMENT '内容点赞数',
  `trace_evaluate` int(10) NOT NULL DEFAULT 0 COMMENT '内容评论数',
  `trace_enable` int(10) NOT NULL DEFAULT 1 COMMENT '图文是否可用-1：可用 2:不可用',
  `trace_verify_status` int(10) NOT NULL DEFAULT 0 COMMENT '审核状态-1：审核中 2:审核成功 3:审核失败  0:关闭',
  `trace_verify_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核信息备注',
  `trace_goods_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '相关商品,以英文逗号分割,eg:124,456',
  `trace_goods_image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主图集合，以英文逗号分割',
  `trace_type` int(10) NOT NULL DEFAULT 0 COMMENT '图文展示类型-待定',
  `trace_publish_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '文章发布时间',
  `trace_publisher` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发布者',
  `last_read_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '最后一次阅读时间',
  `user_id` int(32) NOT NULL DEFAULT 0 COMMENT '用户id',
  `trace_update_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '用户更新时间',
  PRIMARY KEY (`trace_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '溯源资讯' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_trace_information_collect
-- ----------------------------
DROP TABLE IF EXISTS `gdb_trace_information_collect`;
CREATE TABLE `gdb_trace_information_collect`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `trace_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺活动id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `extend_is_liked` int(10) NOT NULL DEFAULT 2 COMMENT '是否点赞1:已点2:未点',
  `update_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '溯源资讯点赞表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_ucenter_log_action
-- ----------------------------
DROP TABLE IF EXISTS `gdb_ucenter_log_action`;
CREATE TABLE `gdb_ucenter_log_action`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '玩家Id',
  `user_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色账户',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `action_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '行为id == protocal_id -> rights_id',
  `action_type_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型id，right_parent_id',
  `log_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求的参数',
  `log_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `log_date` date NOT NULL COMMENT '日志日期',
  `log_time` timestamp NOT NULL DEFAULT '2001-01-01 09:01:01' COMMENT '记录时间',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NULL DEFAULT NULL COMMENT '是否删除0:否;1:是',
  `sys_version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `log_date`(`log_date`) USING BTREE COMMENT '(null)',
  INDEX `player_id`(`user_id`) USING BTREE COMMENT '(null)'
) ENGINE = InnoDB AUTO_INCREMENT = 90052 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户行为日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_user_app
-- ----------------------------
DROP TABLE IF EXISTS `gdb_user_app`;
CREATE TABLE `gdb_user_app`  (
  `app_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '服务ID',
  `app_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '服务名称',
  `app_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '服务密钥',
  `app_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '服务网址',
  `app_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态  1：启用  0：禁用',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id-平台id，平台结算最后映射到这个用户账户中-platform_id，server_id, platform_user_id',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '应用配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for gdb_vk_set
-- ----------------------------
DROP TABLE IF EXISTS `gdb_vk_set`;
CREATE TABLE `gdb_vk_set`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `commision_config` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 无业绩归属   1推广人分佣  2分享人分佣  3推广+分享',
  `tg_rate` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '推广佣金',
  `fx_rate` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '分享佣金',
  `background_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分销中心背景图',
  `after_sales_days` int(10) NOT NULL DEFAULT 30 COMMENT '售后天数',
  `vk_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1开启 2关闭',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微客配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for global_table
-- ----------------------------
DROP TABLE IF EXISTS `global_table`;
CREATE TABLE `global_table`  (
  `xid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transaction_id` bigint(20) NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `application_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_service_group` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeout` int(11) NULL DEFAULT NULL,
  `begin_time` bigint(20) NULL DEFAULT NULL,
  `application_data` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime NULL DEFAULT NULL,
  `gmt_modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`xid`) USING BTREE,
  INDEX `idx_gmt_modified_status`(`gmt_modified`, `status`) USING BTREE,
  INDEX `idx_transaction_id`(`transaction_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for index_action_type
-- ----------------------------
DROP TABLE IF EXISTS `index_action_type`;
CREATE TABLE `index_action_type`  (
  `action_type` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `display_order` int(10) NOT NULL DEFAULT 0 COMMENT '排序,数字越大，越靠前',
  `activity_status` int(2) NOT NULL DEFAULT 1 COMMENT '使用状态 0:未启用 1:启用',
  PRIMARY KEY (`action_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页跳转类型' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for lock_table
-- ----------------------------
DROP TABLE IF EXISTS `lock_table`;
CREATE TABLE `lock_table`  (
  `row_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xid` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_id` bigint(20) NULL DEFAULT NULL,
  `branch_id` bigint(20) NOT NULL,
  `resource_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pk` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime NULL DEFAULT NULL,
  `gmt_modified` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`row_key`) USING BTREE,
  INDEX `idx_branch_id`(`branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for odb_invoice_address
-- ----------------------------
DROP TABLE IF EXISTS `odb_invoice_address`;
CREATE TABLE `odb_invoice_address`  (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '收票人ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人姓名',
  `user_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人手机号',
  `user_mail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `address_province` int(11) NULL DEFAULT NULL COMMENT '收票地址-省',
  `address_city` int(11) NULL DEFAULT NULL COMMENT '收票地址-市',
  `address_area` int(11) NULL DEFAULT NULL COMMENT '收票地址-区',
  `address_detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `is_default` int(11) NULL DEFAULT 0 COMMENT '是否默认:1-是；0-否',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次更新时间',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发票地址管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for odb_invoice_template_info
-- ----------------------------
DROP TABLE IF EXISTS `odb_invoice_template_info`;
CREATE TABLE `odb_invoice_template_info`  (
  `invoice_tmp_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `invoice_type` int(11) NOT NULL DEFAULT 0 COMMENT '发票类型: 0-普票；1-增值税专用票',
  `invoice_head_type` int(11) NOT NULL DEFAULT 1 COMMENT '抬头类型:1-个人；2-单位',
  `invoice_head` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发票抬头',
  `company_tax_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位税号',
  `register_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册地址',
  `register_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册电话',
  `opening_bank` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `is_default` int(11) NULL DEFAULT 0 COMMENT '是否默认：1-是；0-否',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次更新时间',
  `invoice_content` int(11) NULL DEFAULT 0 COMMENT '发票内容:0-商品明细;1-商品类别',
  PRIMARY KEY (`invoice_tmp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '发票模版管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for odb_order_invoice_info
-- ----------------------------
DROP TABLE IF EXISTS `odb_order_invoice_info`;
CREATE TABLE `odb_order_invoice_info`  (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发票ID',
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `invoice_content` int(11) NULL DEFAULT 0 COMMENT '发票内容:0-商品明细;1-商品类别',
  `audit_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家审核备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '开票时间',
  `invoice_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '发票金额',
  `invoice_status` int(11) NOT NULL DEFAULT 0 COMMENT '开票状态:0-未开票;1-审核中;2-已出票;3-未通过',
  `last_update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次更新时间',
  `user_id` int(11) NOT NULL COMMENT '收票人ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人姓名',
  `user_mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人手机号',
  `user_mail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `address_province` int(11) NULL DEFAULT NULL COMMENT '收票地址-省',
  `address_city` int(11) NULL DEFAULT NULL COMMENT '收票地址-市',
  `address_area` int(11) NULL DEFAULT NULL COMMENT '收票地址-区',
  `address_detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `invoice_type` int(11) NOT NULL DEFAULT 0 COMMENT '发票类型: 0-普票；1-增值税专用票',
  `invoice_head_type` int(11) NOT NULL DEFAULT 1 COMMENT '抬头类型:1-个人；2-单位',
  `invoice_head` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发票抬头',
  `company_tax_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位税号',
  `register_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册地址',
  `register_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册电话',
  `opening_bank` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  PRIMARY KEY (`invoice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单发票表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for self_support_index_detail
-- ----------------------------
DROP TABLE IF EXISTS `self_support_index_detail`;
CREATE TABLE `self_support_index_detail`  (
  `detail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module_id` int(5) NOT NULL DEFAULT 0 COMMENT '模块id',
  `detail_type` tinyint(5) NOT NULL DEFAULT 0 COMMENT '模块内数据展示类型',
  `detail_title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情标题',
  `detail_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情内容',
  `action_type` tinyint(5) NOT NULL DEFAULT 0 COMMENT '详情跳转类型',
  `action_detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '跳转详情',
  `two_pages_type` tinyint(5) NOT NULL DEFAULT 0 COMMENT '二级页类型',
  `detail_status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '使用状态 0:未启用 1:启用',
  `display_order` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序,数字越大，越靠前',
  `update_date` datetime NOT NULL DEFAULT '2018-09-05 00:00:00' COMMENT '更新时间',
  `update_by` int(10) NOT NULL DEFAULT 0 COMMENT '更新人id',
  `none_type` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1469 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自营专区商品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for self_support_index_module
-- ----------------------------
DROP TABLE IF EXISTS `self_support_index_module`;
CREATE TABLE `self_support_index_module`  (
  `module_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `module_title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模块标题',
  `title_action_type` tinyint(5) NOT NULL DEFAULT 0 COMMENT '标题跳转类型',
  `title_action_detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题跳转详情',
  `frame_background` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '外框背景',
  `inner_frame_background` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内框背景',
  `module_status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '使用状态 0:未启用 1:启用',
  `display_order` tinyint(2) NOT NULL DEFAULT 0 COMMENT '排序,数字越大，越靠前',
  `update_date` datetime NOT NULL DEFAULT '2018-09-05 00:00:00' COMMENT '更新时间',
  `update_by` int(10) NOT NULL DEFAULT 0 COMMENT '更新人id',
  PRIMARY KEY (`module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for self_support_none_goods
-- ----------------------------
DROP TABLE IF EXISTS `self_support_none_goods`;
CREATE TABLE `self_support_none_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `none_type` int(10) NOT NULL,
  `common_id` int(10) NOT NULL,
  `display_order` int(10) NOT NULL DEFAULT 0 COMMENT '排序，数字越大，越靠前',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  `activity_verify` tinyint(3) NOT NULL DEFAULT 1 COMMENT '审核 1通过，0未通过，10审核中',
  `activity_verify_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核失败原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自营专区商品' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for self_support_none_slide
-- ----------------------------
DROP TABLE IF EXISTS `self_support_none_slide`;
CREATE TABLE `self_support_none_slide`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `none_type` int(10) NOT NULL DEFAULT 0 COMMENT '专区类型',
  `action_slide` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播地址',
  `action_type` tinyint(5) NOT NULL DEFAULT 0 COMMENT '详情跳转类型',
  `action_detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '跳转详情',
  `display_order` int(10) NOT NULL DEFAULT 0 COMMENT '排序，数字越大，越靠前',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `update_date` timestamp NOT NULL DEFAULT '2018-09-05 08:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 604 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自营专区轮播' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for self_support_none_type
-- ----------------------------
DROP TABLE IF EXISTS `self_support_none_type`;
CREATE TABLE `self_support_none_type`  (
  `none_type` int(10) NOT NULL AUTO_INCREMENT,
  `none_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `display_order` int(10) NULL DEFAULT 0 COMMENT '排序,数字越大，越靠前',
  PRIMARY KEY (`none_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自营专区类型' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for shop_cat_add
-- ----------------------------
DROP TABLE IF EXISTS `shop_cat_add`;
CREATE TABLE `shop_cat_add`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NULL DEFAULT NULL,
  `cat_id` int(11) NULL DEFAULT NULL,
  `cat_level` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺绑定类目更新附加表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for shop_move
-- ----------------------------
DROP TABLE IF EXISTS `shop_move`;
CREATE TABLE `shop_move`  (
  `old_shop_id` int(10) NOT NULL,
  `new_shop_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`old_shop_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '更新部分店铺数据' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for shop_record
-- ----------------------------
DROP TABLE IF EXISTS `shop_record`;
CREATE TABLE `shop_record`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_type` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动类型',
  `shop_name` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT '' COMMENT '店铺名称',
  `user_id` int(10) NULL DEFAULT 0 COMMENT '用户id',
  `shop_id` int(10) NULL DEFAULT 0 COMMENT '店铺id',
  `shop_grade_id` int(10) NULL DEFAULT 0 COMMENT '店铺等级',
  `shop_address` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT '' COMMENT '详细地址',
  `shop_detail` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL COMMENT '店铺介绍',
  `activity_id` int(10) NOT NULL COMMENT '报名活动ID',
  `participation_time` datetime NOT NULL COMMENT '参与时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '参加活动报名店铺记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for shop_registration
-- ----------------------------
DROP TABLE IF EXISTS `shop_registration`;
CREATE TABLE `shop_registration`  (
  `activity_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `area_type` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专区类型1特产推荐2新品推荐3为您推荐4蜂狂特价5新人专区7。9.9包邮 8品牌生活',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `registration_start_time` datetime NOT NULL COMMENT '报名开始时间',
  `registration_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '报名状态 0.开启 1.关闭',
  `registration_end_time` datetime NOT NULL COMMENT '报名结束时间',
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '商家活动报名表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for shop_version
-- ----------------------------
DROP TABLE IF EXISTS `shop_version`;
CREATE TABLE `shop_version`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `version_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本号',
  `version_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本更新详情',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = gbk COLLATE = gbk_chinese_ci COMMENT = '商家版本号' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for specialty_goods_slide
-- ----------------------------
DROP TABLE IF EXISTS `specialty_goods_slide`;
CREATE TABLE `specialty_goods_slide`  (
  `config_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置键',
  `config_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置值:imageType;//商品id2:店铺id3:链接4:分类10:红包11:美食中国12:为你推荐13:特价推荐14:新品推荐\'15:溯源资讯16:店铺活动17:精选商品18:商城公告\',19新人专区;20平台活动专区;21:9.9包邮专区;22:品牌生活;23:好货溯源',
  `config_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置类型',
  `config_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置内容描述',
  `config_sort` int(11) NOT NULL DEFAULT 0 COMMENT '配置排序',
  `op_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作类型，1关键字，2商品编号{\"goodsId\":5026,\"commonId\":5026}，3链接{\"url\":http://},4店铺{\"shopId\":11} 5不传值 6分类id {\\\"catId\\\":10000104}',
  `op_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型值',
  `config_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值，1可用，0不可用',
  `terminal_type` int(11) NOT NULL DEFAULT 1 COMMENT '终端选择，1pc，2移动端',
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_date` datetime NOT NULL DEFAULT '2018-09-05 00:00:00' COMMENT '创建时间',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '更新人',
  `update_date` datetime NOT NULL DEFAULT '2018-09-05 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`config_key`) USING BTREE,
  INDEX `config_type`(`config_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `system_exception_log`;
CREATE TABLE `system_exception_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户id,记录操作用户',
  `origin_from` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '来源1PC 2wap 3安卓 5ios 6微信小程序 7wap浏览器',
  `time` datetime NOT NULL COMMENT '操作时间',
  `class_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类名称',
  `method_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '方法名称',
  `params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '传入参数',
  `ip` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作ip',
  `exception_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '异常信息',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求路径',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for t_shop_customer_server
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_customer_server`;
CREATE TABLE `t_shop_customer_server`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `customer_service_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客服姓名',
  `qq_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `is_delete` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除(0:否;1:是)',
  `on_line` int(1) NOT NULL DEFAULT 1 COMMENT '是否在线(0:否;1:是)',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT '2001-01-01 01:01:01',
  `updator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT '2001-01-01 01:01:01',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺客服' ROW_FORMAT = COMPACT;

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
-- Table structure for update_shop
-- ----------------------------
DROP TABLE IF EXISTS `update_shop`;
CREATE TABLE `update_shop`  (
  `shop_id` int(10) NOT NULL,
  `shop_slideurl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type1` int(3) NULL DEFAULT NULL,
  `image2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type2` int(3) NULL DEFAULT NULL,
  `image3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type3` int(3) NULL DEFAULT NULL,
  `image4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type4` int(3) NULL DEFAULT NULL,
  `image5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type5` int(3) NULL DEFAULT NULL,
  `tt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for wx_live_goods
-- ----------------------------
DROP TABLE IF EXISTS `wx_live_goods`;
CREATE TABLE `wx_live_goods`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `common_id` int(10) NULL DEFAULT NULL COMMENT '商品id',
  `goods_id` int(10) NULL DEFAULT NULL COMMENT '规格id',
  `wx_goods_id` int(10) NULL DEFAULT NULL COMMENT '小程序审核后返回的goodsId',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺id',
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `common_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `common_stock` int(10) NULL DEFAULT NULL COMMENT '商品库存',
  `common_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operation` int(10) NULL DEFAULT 0 COMMENT '操作 0无 1添加 2删除',
  `isverify` int(1) NULL DEFAULT NULL COMMENT '审核状态 1 通过 2 审核中 3 不通过  4待平台审核  5待微信审核',
  `cause` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信直播商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for wx_live_hosts
-- ----------------------------
DROP TABLE IF EXISTS `wx_live_hosts`;
CREATE TABLE `wx_live_hosts`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '主播用户id',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '主播对应商家id',
  `shop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主播对应商家名称',
  `wechat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主播微信号',
  `shop_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家手机号',
  `head_portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `creata_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operation` int(1) NULL DEFAULT NULL COMMENT '操作 1 添加 2 删除 0无',
  `state` int(1) NULL DEFAULT NULL COMMENT '状态  1 通过  2 审核中 3 未通过 4 待平台审核 5 带微信审核 6 关闭',
  `cause` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核原因   ',
  `hoststate` int(1) NULL DEFAULT 2 COMMENT '是否停播 1 是 2否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信直播主播申请表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for wx_live_studio
-- ----------------------------
DROP TABLE IF EXISTS `wx_live_studio`;
CREATE TABLE `wx_live_studio`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` int(10) NULL DEFAULT NULL COMMENT '店铺id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房间名字',
  `coverImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '直播间背景图',
  `startTime` datetime NOT NULL COMMENT '直播开始时间',
  `endTime` datetime NOT NULL COMMENT '直播结束时间',
  `anchorName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主播昵称',
  `anchorWechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主播微信号',
  `subAnchorWechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主播副号微信号',
  `createrWechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者微信号',
  `shareImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '直播间分享图',
  `feedsImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购物直播频道封面图',
  `isFeedsPublic` int(1) NULL DEFAULT 1 COMMENT ' 是否开启官方收录，1 开启，0 关闭',
  `type` int(1) NOT NULL COMMENT '直播类型，1 推流 0 手机直播',
  `closeLike` int(1) NOT NULL COMMENT '是否关闭点赞 1 关闭  0 开启',
  `closeGoods` int(1) NOT NULL COMMENT '是否关闭商品货架 1 关闭  0开启',
  `closeComment` int(1) NOT NULL COMMENT '是否开启评论 1 关闭 0开启',
  `closeReplay` int(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否关闭回放 1 关闭 0开启',
  `closeShare` int(1) NULL DEFAULT 1 COMMENT '是否关闭分享 1关闭 0开启',
  `closeKf` int(1) NULL DEFAULT 0 COMMENT '是否关闭客服',
  `operation` int(1) NULL DEFAULT NULL COMMENT '0 无 1添加',
  `isverify` int(1) NULL DEFAULT NULL COMMENT '审核状态 1 通过 2 审核中 3 不通过  4 未开始 5 一开始\r\n6 已结束',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信直播直播间申请表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_Integral_rules
-- ----------------------------
DROP TABLE IF EXISTS `yf_Integral_rules`;
CREATE TABLE `yf_Integral_rules`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_login` int(255) NOT NULL COMMENT '登录赠送积分',
  `rule_register` int(255) NULL DEFAULT NULL COMMENT '注册赠送积分',
  `rule_consume` int(255) NULL DEFAULT NULL COMMENT '\r\n消费与赠送积分比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分规则表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_groupbuy_area
-- ----------------------------
DROP TABLE IF EXISTS `yf_groupbuy_area`;
CREATE TABLE `yf_groupbuy_area`  (
  `groupbuy_area_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '地区编号',
  `groupbuy_area_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区名称',
  `groupbuy_area_parent_id` int(10) UNSIGNED NOT NULL COMMENT '父地区编号',
  `groupbuy_area_sort` tinyint(1) UNSIGNED NOT NULL COMMENT '排序',
  `groupbuy_area_deep` tinyint(1) UNSIGNED NOT NULL COMMENT '深度',
  PRIMARY KEY (`groupbuy_area_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团购地区表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_groupbuy_base
-- ----------------------------
DROP TABLE IF EXISTS `yf_groupbuy_base`;
CREATE TABLE `yf_groupbuy_base`  (
  `groupbuy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '团购ID',
  `groupbuy_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `groupbuy_starttime` datetime NOT NULL COMMENT '开始时间',
  `groupbuy_endtime` datetime NOT NULL COMMENT '结束时间',
  `goods_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `common_id` int(10) UNSIGNED NOT NULL COMMENT '商品公共表ID',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `shop_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品原价',
  `groupbuy_price` decimal(10, 2) NOT NULL COMMENT '团购价格',
  `groupbuy_rebate` decimal(10, 2) NOT NULL COMMENT '折扣',
  `groupbuy_virtual_quantity` int(10) UNSIGNED NOT NULL COMMENT '虚拟购买数量',
  `groupbuy_upper_limit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买上限',
  `groupbuy_buyer_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已购买人数',
  `groupbuy_buy_quantity` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买数量',
  `groupbuy_intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '本团介绍',
  `groupbuy_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '团购状态 1.审核中 2.正常 3.结束 4.审核失败 5.管理员关闭',
  `groupbuy_recommend` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐 0.未推荐 1.已推荐',
  `groupbuy_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '团购类型：1-线上团（实物）；2-虚拟团',
  `groupbuy_views` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '查看次数',
  `groupbuy_cat_id` int(10) UNSIGNED NOT NULL COMMENT '团购类别编号',
  `groupbuy_scat_id` int(10) NOT NULL,
  `groupbuy_city_id` int(10) NOT NULL,
  `groupbuy_area_id` int(10) UNSIGNED NOT NULL COMMENT '团购地区编号',
  `groupbuy_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团购图片',
  `groupbuy_image_rec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团购推荐位图片',
  `groupbuy_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  PRIMARY KEY (`groupbuy_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团购商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_groupbuy_cat
-- ----------------------------
DROP TABLE IF EXISTS `yf_groupbuy_cat`;
CREATE TABLE `yf_groupbuy_cat`  (
  `groupbuy_cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `groupbuy_cat_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  `groupbuy_cat_parent_id` int(10) UNSIGNED NOT NULL COMMENT '父类别编号',
  `groupbuy_cat_sort` tinyint(1) UNSIGNED NOT NULL COMMENT '排序',
  `groupbuy_cat_deep` tinyint(1) UNSIGNED NOT NULL COMMENT '深度',
  `groupbuy_cat_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '团购类型 1-实物，2-虚拟商品',
  PRIMARY KEY (`groupbuy_cat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团购类别表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_groupbuy_combo
-- ----------------------------
DROP TABLE IF EXISTS `yf_groupbuy_combo`;
CREATE TABLE `yf_groupbuy_combo`  (
  `combo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '团购套餐编号',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户编号',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `combo_starttime` datetime NOT NULL COMMENT '套餐开始时间',
  `combo_endtime` datetime NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`combo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团购套餐表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_groupbuy_price_range
-- ----------------------------
DROP TABLE IF EXISTS `yf_groupbuy_price_range`;
CREATE TABLE `yf_groupbuy_price_range`  (
  `range_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '价格区间编号',
  `range_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区间名称',
  `range_start` int(10) UNSIGNED NOT NULL COMMENT '区间下限',
  `range_end` int(10) UNSIGNED NOT NULL COMMENT '区间上限',
  PRIMARY KEY (`range_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团购价格区间表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_im_config
-- ----------------------------
DROP TABLE IF EXISTS `yf_im_config`;
CREATE TABLE `yf_im_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `im_domain_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'im域名',
  `im_app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'im app key',
  `im_app_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'im app Secret',
  `im_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'im token',
  `wy_app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网易app key',
  `wy_app_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网易 app Secret',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_increase_base
-- ----------------------------
DROP TABLE IF EXISTS `yf_increase_base`;
CREATE TABLE `yf_increase_base`  (
  `increase_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '加价购活动编号',
  `increase_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `combo_id` int(10) UNSIGNED NOT NULL COMMENT '套餐编号',
  `increase_start_time` datetime NOT NULL COMMENT '活动开始时间',
  `increase_end_time` datetime NOT NULL COMMENT '活动结束时间',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户编号',
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `increase_state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '活动状态(1-正常/2-已结束/3-管理员关闭)',
  PRIMARY KEY (`increase_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加价购活动表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_increase_combo
-- ----------------------------
DROP TABLE IF EXISTS `yf_increase_combo`;
CREATE TABLE `yf_increase_combo`  (
  `combo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '加价购套餐编号',
  `combo_start_time` datetime NOT NULL COMMENT '开始时间',
  `combo_end_time` datetime NOT NULL COMMENT '结束时间',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户编号',
  `user_nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  PRIMARY KEY (`combo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加价购套餐表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_increase_goods
-- ----------------------------
DROP TABLE IF EXISTS `yf_increase_goods`;
CREATE TABLE `yf_increase_goods`  (
  `increase_goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '加价购商品表id',
  `increase_id` int(10) UNSIGNED NOT NULL COMMENT '限时活动编号',
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品编号',
  `common_id` int(10) NOT NULL,
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `goods_start_time` datetime NOT NULL COMMENT '开始时间',
  `goods_end_time` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`increase_goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加价购商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_increase_redemp_goods
-- ----------------------------
DROP TABLE IF EXISTS `yf_increase_redemp_goods`;
CREATE TABLE `yf_increase_redemp_goods`  (
  `redemp_goods_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '加价购换购商品表',
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT '加价购规则编号',
  `increase_id` int(10) UNSIGNED NOT NULL COMMENT '加价购活动编号',
  `goods_id` int(10) UNSIGNED NOT NULL COMMENT '商品编号',
  `shop_id` int(10) UNSIGNED NOT NULL COMMENT '店铺编号',
  `redemp_price` decimal(10, 2) NOT NULL COMMENT '换购价',
  PRIMARY KEY (`redemp_goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加价购换购商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_increase_rule
-- ----------------------------
DROP TABLE IF EXISTS `yf_increase_rule`;
CREATE TABLE `yf_increase_rule`  (
  `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '加价购规则编号',
  `increase_id` int(10) UNSIGNED NOT NULL COMMENT '活动编号',
  `rule_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '规则级别价格',
  `rule_goods_limit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '限定换购数量，0为不限定数量',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加价购规则表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_membership_grade
-- ----------------------------
DROP TABLE IF EXISTS `yf_membership_grade`;
CREATE TABLE `yf_membership_grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `grade_rule` int(15) NULL DEFAULT NULL COMMENT '等级规则',
  `grade_discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `grade_start` int(10) NULL DEFAULT NULL COMMENT '1正常 2 删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_modularization_flie
-- ----------------------------
DROP TABLE IF EXISTS `yf_modularization_flie`;
CREATE TABLE `yf_modularization_flie`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称 + 文件后缀',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `file_cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频封面url',
  `file_type` int(10) NULL DEFAULT NULL COMMENT '文件类型  1 图片 2 视频',
  `file_create_time` datetime NULL DEFAULT NULL COMMENT '文件上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 417 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组件化  图片 视频空间  ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `yf_oss_config`;
CREATE TABLE `yf_oss_config`  (
  `oss_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `oss_backetName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'API的bucket名称',
  `oss_folder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'API的文件夹名称',
  `oss_region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器集群地址',
  `oss_endpoint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名',
  `oss_accessKeyId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密钥',
  `oss_accessKeySecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '私钥',
  `oss_states` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态值 00禁用  01启用，默认启用',
  `oss_isActive` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '伪删除标识 00删除 01正常，默认删除',
  `oss_createdDate` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `oss_updateDate` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `oss_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置的备注信息',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '阿里OSS配置信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_pay_config
-- ----------------------------
DROP TABLE IF EXISTS `yf_pay_config`;
CREATE TABLE `yf_pay_config`  (
  `id` bigint(100) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paymentMode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式 00微信 PC h5 01 app 02微信小程序 03支付宝APP',
  `appID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP Id',
  `appSecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP Secret',
  `appMCHId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户号',
  `appAPIKey` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP密钥',
  `refundUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信退款URL',
  `notifyUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付回调接口',
  `redirectUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信异步通知页面路径',
  `wapNotifyUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信wap端回调',
  `appletNotifyUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信小程序回调',
  `wapCombinationPayUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信wap端支付',
  `combinationPayUrlWeChat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信小程序组合支付',
  `combinationPayfkUrlWeChat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信小程序组合支付付款',
  `wapMergerPaymentUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信wap端合并支付',
  `mergerPaymentUrlWeChat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信小程序合并支付',
  `notifyUrlByWapFkRecharge` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信充值回调Wap',
  `weChatPcPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信pc端证书地址',
  `weChatWapPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信wap端证书地址',
  `gatewayURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝网关请求地址',
  `shoppingNotifyUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝服务器异步通知页面路径',
  `rechargeNotifyUrl2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝付款服务器异步通知页面路径',
  `shoppingReturnUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝页面跳转同步通知页面路径',
  `shoppingReturnUrlPc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝pc购物回调',
  `combinationPayReturnUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝组合支付同步回调',
  `combinationPayUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝组合支付异步回调',
  `combinationPayfkUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝付款组合支付异步回调',
  `mergerPaymentReturnUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝合并支付同步回调',
  `mergerPaymentUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝合并支付异步回调',
  `paymentStatus` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '启用和禁用状态，00禁用  01启用，默认启用',
  `paymentIsActive` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '伪删除标识 00删除 01正常，默认正常',
  `paymentUpdateDate` timestamp NULL DEFAULT '2001-01-01 09:01:01' COMMENT '更新时间',
  `cert_public_key_res2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝公钥证书',
  `cert_root_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝根证书',
  `cert_app_public_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用公钥证书',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付配置信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_points_cart
-- ----------------------------
DROP TABLE IF EXISTS `yf_points_cart`;
CREATE TABLE `yf_points_cart`  (
  `points_cart_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `points_user_id` int(10) NOT NULL COMMENT '会员编号',
  `points_goods_id` int(10) NOT NULL COMMENT '积分礼品序号',
  `points_goods_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分礼品名称',
  `points_goods_points` int(10) NOT NULL COMMENT '积分礼品兑换积分',
  `points_goods_choosenum` int(10) NOT NULL COMMENT '选择积分礼品数量',
  `points_goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分礼品图片',
  PRIMARY KEY (`points_cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分礼品兑换购物车' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_points_goods
-- ----------------------------
DROP TABLE IF EXISTS `yf_points_goods`;
CREATE TABLE `yf_points_goods`  (
  `points_goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '积分礼品索引id',
  `points_goods_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分礼品名称',
  `points_goods_price` decimal(10, 2) NOT NULL COMMENT '积分礼品原价',
  `points_goods_points` int(10) NOT NULL COMMENT '积分礼品兑换所需积分',
  `points_goods_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分礼品默认封面图片',
  `points_goods_tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分礼品标签',
  `points_goods_serial` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分礼品货号',
  `points_goods_storage` int(10) NOT NULL DEFAULT 0 COMMENT '积分礼品库存数',
  `points_goods_shelves` tinyint(1) NOT NULL COMMENT '积分礼品上架 0表示下架 1表示上架',
  `points_goods_recommend` tinyint(1) NOT NULL COMMENT '积分礼品是否推荐,1-是、0-否',
  `points_goods_add_time` datetime NOT NULL COMMENT '积分礼品添加时间',
  `points_goods_keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分礼品关键字',
  `points_goods_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分礼品描述',
  `points_goods_body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分礼品详细内容',
  `points_goods_salenum` int(10) NOT NULL DEFAULT 0 COMMENT '积分礼品售出数量',
  `points_goods_view` int(10) NOT NULL DEFAULT 0 COMMENT '积分商品浏览次数',
  `points_goods_limitgrade` int(10) NOT NULL DEFAULT 0 COMMENT '换购针对会员等级限制，默认为0,所有等级都可换购',
  `points_goods_islimit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否限制每会员兑换数量，0不限制，1限制，默认0',
  `points_goods_limitnum` int(10) NOT NULL COMMENT '每会员限制兑换数量',
  `points_goods_islimittime` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否限制兑换时间 0为不限制 1为限制',
  `points_goods_starttime` datetime NOT NULL COMMENT '兑换开始时间',
  `points_goods_endtime` datetime NOT NULL COMMENT '兑换结束时间',
  `points_goods_sort` int(10) NOT NULL DEFAULT 0 COMMENT '礼品排序',
  PRIMARY KEY (`points_goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分礼品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_points_order
-- ----------------------------
DROP TABLE IF EXISTS `yf_points_order`;
CREATE TABLE `yf_points_order`  (
  `points_order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '兑换订单编号',
  `points_order_rid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兑换订单号',
  `points_buyerid` int(10) NOT NULL COMMENT '兑换会员id',
  `points_buyername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兑换会员姓名',
  `points_buyeremail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兑换会员email',
  `points_addtime` datetime NOT NULL COMMENT '兑换订单生成时间',
  `points_paymenttime` datetime NOT NULL COMMENT '支付(付款)时间',
  `points_shippingtime` datetime NOT NULL COMMENT '配送时间',
  `points_shippingcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物流单号',
  `points_logistics` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物流公司名称',
  `points_finnshedtime` datetime NOT NULL COMMENT '订单完成时间',
  `points_allpoints` int(10) NOT NULL DEFAULT 0 COMMENT '兑换总积分',
  `points_orderamount` decimal(10, 2) NOT NULL COMMENT '兑换订单总金额',
  `points_shippingcharge` tinyint(1) NOT NULL DEFAULT 0 COMMENT '运费承担方式 0表示平台 1表示买家',
  `points_shippingfee` decimal(10, 2) NOT NULL COMMENT '运费金额',
  `points_ordermessage` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '订单留言',
  `points_orderstate` int(4) NOT NULL DEFAULT 1 COMMENT '订单状态：1(已下单，等待发货);2(已发货，等待收货);3(确认收货)4(取消):',
  PRIMARY KEY (`points_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分兑换订单表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_points_orderaddress
-- ----------------------------
DROP TABLE IF EXISTS `yf_points_orderaddress`;
CREATE TABLE `yf_points_orderaddress`  (
  `points_oaid` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `points_orderid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `points_truename` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `points_areaid` int(10) NOT NULL COMMENT '地区id',
  `points_areainfo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区内容',
  `points_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `points_zipcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮政编码',
  `points_telphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `points_mobphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  PRIMARY KEY (`points_oaid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '兑换订单地址表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_points_ordergoods
-- ----------------------------
DROP TABLE IF EXISTS `yf_points_ordergoods`;
CREATE TABLE `yf_points_ordergoods`  (
  `points_recid` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单礼品表索引',
  `points_orderid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id',
  `points_goodsid` int(10) NOT NULL COMMENT '礼品id',
  `points_goodsname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '礼品名称',
  `points_goodspoints` int(10) NOT NULL COMMENT '礼品兑换积分',
  `points_goodsnum` int(10) NOT NULL COMMENT '礼品数量',
  `points_goodsimage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '礼品图片',
  PRIMARY KEY (`points_recid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '兑换订单商品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_recharge_package
-- ----------------------------
DROP TABLE IF EXISTS `yf_recharge_package`;
CREATE TABLE `yf_recharge_package`  (
  `recharge_package_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐ID',
  `recharge_package_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐名称',
  `package_recharge_price` decimal(10, 2) NOT NULL COMMENT '套餐充值金额',
  `package_give_periods` int(10) NOT NULL DEFAULT 1 COMMENT '赠送期数，0-长久赠送',
  `give_money_each_periods` decimal(10, 2) NOT NULL COMMENT '每期赠送金额',
  `package_present_goods_id` int(10) NOT NULL COMMENT '赠送商品ID',
  `package_create_time` datetime NOT NULL COMMENT '套餐创建时间',
  `package_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '套餐状态：1正常 0关闭',
  PRIMARY KEY (`recharge_package_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充值套餐表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_recharge_package_order
-- ----------------------------
DROP TABLE IF EXISTS `yf_recharge_package_order`;
CREATE TABLE `yf_recharge_package_order`  (
  `order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单索引ID',
  `order_sn` bigint(20) UNSIGNED NOT NULL COMMENT '套餐订单编号',
  `buyer_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `buyer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `seller_id` int(10) NOT NULL COMMENT '卖家ID',
  `seller_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卖家名称',
  `shop_id` int(10) NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `order_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '套餐订单价格',
  `receiver_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人名称',
  `receiver_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址',
  `receiver_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人联系方式',
  `goods_id` int(10) NOT NULL DEFAULT 0 COMMENT '套餐商品goods_id',
  `order_goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单商品名称',
  `order_goods_price` decimal(10, 2) NOT NULL COMMENT '订单商品价格',
  `order_goods_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单商品图片',
  `order_payment_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '订单支付状态：1待付款、2已付款、3取消',
  `order_exec_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '充值订单执行状态，0-等待执行，1-执行中，2执行结束',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付（付款）时间',
  `finnshed_time` datetime NULL DEFAULT NULL COMMENT '订单完成时间',
  `recharge_package_id` int(10) NULL DEFAULT NULL COMMENT '套餐ID',
  `recharge_package_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `pay_order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付单号',
  `package_give_periods` int(10) NOT NULL DEFAULT 0 COMMENT '赠送期数',
  `give_money_each_periods` int(10) NOT NULL DEFAULT 0 COMMENT '每期赠送金额',
  `have_gived_periods` int(10) NOT NULL DEFAULT 0 COMMENT '已赠送期数',
  `next_exec_date` datetime NOT NULL COMMENT '下次执行时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充值套餐订单表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_redpacket_base
-- ----------------------------
DROP TABLE IF EXISTS `yf_redpacket_base`;
CREATE TABLE `yf_redpacket_base`  (
  `redpacket_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '红包编号',
  `redpacket_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '红包编码',
  `redpacket_t_id` int(11) NOT NULL COMMENT '红包模版编号',
  `redpacket_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包标题',
  `redpacket_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包描述改为用户须知',
  `redpacket_start_date` datetime NOT NULL COMMENT '红包有效期开始时间',
  `redpacket_end_date` datetime NOT NULL COMMENT '红包有效期结束时间',
  `redpacket_price` int(11) NOT NULL COMMENT '红包面额',
  `shop_limit` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包使用店铺显示，默认为空，不限店铺使用，多个店铺ID之间用逗号分隔',
  `goods_cat_limit` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包使用商品分类限制，默认为空，不限分类，多个商品分类ID之间用逗号分隔',
  `redpacket_t_orderlimit` decimal(10, 2) NOT NULL COMMENT '红包使用时的订单限额',
  `is_allow_transfer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '红包是否允许转增，1-是，0-否，默认0',
  `redpacket_state` tinyint(4) NOT NULL COMMENT '红包状态(1-未用,2-已用,3-过期)',
  `redpacket_active_date` datetime NOT NULL COMMENT '红包发放日期',
  `redpacket_owner_id` int(11) NOT NULL COMMENT '红包所有者id',
  `redpacket_owner_name` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '红包所有者名称',
  `redpacket_order_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '使用该红包的订单编号',
  `redpacket_transfer_state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '红包转增状态，0-默认；1-赠送中；2-已赠送；3-撤回赠送',
  `redpacket_from` tinyint(1) NOT NULL DEFAULT 0 COMMENT '红包来源：1-用户自己领取，2-其它用户转增',
  `is_hidden` tinyint(1) NULL DEFAULT 0 COMMENT '北京光声_用户删除标记(1:删除）',
  `mac_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机mac地址',
  `redpacket_type` int(10) NULL DEFAULT 2 COMMENT '红包类型，1-新人注册红包，2-普通红包，3-多品红包 4-店铺红包 5-单品新人红包 6-专属红包 默认2',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`redpacket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 480 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '红包表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_redpacket_template
-- ----------------------------
DROP TABLE IF EXISTS `yf_redpacket_template`;
CREATE TABLE `yf_redpacket_template`  (
  `redpacket_t_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '红包模版编号',
  `redpacket_t_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '红包类型，1-新人注册红包，2-普通红包，3-多品红包 4-店铺红包 5-单品多品红包 6-专属红包默认2',
  `redpacket_t_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包模版名称',
  `redpacket_t_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包模版描述',
  `redpacket_t_start_date` datetime NOT NULL COMMENT '红包模版有效期开始时间',
  `redpacket_t_end_date` datetime NOT NULL COMMENT '红包模版有效期结束时间',
  `redpacket_t_price` int(10) NOT NULL COMMENT '红包模版面额',
  `shop_limit` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包使用店铺显示，默认为空，不限店铺使用，多个店铺ID之间用逗号分隔',
  `goods_cat_limit` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包使用商品分类限制，默认为空，不限分类，多个商品分类ID之间用逗号分隔',
  `redpacket_t_orderlimit` decimal(10, 2) NOT NULL COMMENT '红包使用时的消费限额',
  `is_allow_transfer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '红包是否允许转增，1-是，0-否，默认0',
  `redpacket_t_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '红包模版状态(1-有效,2-失效,3-删除)',
  `redpacket_t_total` int(10) NOT NULL COMMENT '模版可发放的红包总数',
  `redpacket_t_giveout` int(10) NOT NULL COMMENT '模版已发放的红包数量',
  `redpacket_t_used` int(10) NOT NULL COMMENT '模版已经使用过的红包',
  `redpacket_t_add_date` datetime NOT NULL COMMENT '模版的创建时间',
  `redpacket_t_update_date` datetime NOT NULL COMMENT '模版的最后修改时间',
  `redpacket_t_points` int(10) NOT NULL DEFAULT 0 COMMENT '兑换所需积分',
  `redpacket_t_eachlimit` int(10) NOT NULL DEFAULT 1 COMMENT '每人限领张数',
  `redpacket_t_user_grade_limit` tinyint(4) NOT NULL DEFAULT 1 COMMENT '领取红包的用户等级限制',
  `redpacket_t_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包图片',
  `redpacket_t_access_method` tinyint(1) NOT NULL DEFAULT 1 COMMENT '红包领取方式，1-积分兑换(默认)，2-卡密兑换，3-免费领取',
  `redpacket_t_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '推荐状态，0-为不推荐，1-推荐',
  `redpacket_use_platform` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '红包使用端口 0无限制  1PC 2wap 3安卓 5ios 6微信小程序 7wap浏览器',
  `redpacket_get_platform` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '红包领用端口 0无限制  1PC 2wap 3安卓 5ios 6微信小程序 7wap浏览器',
  `many_redpacket_type` int(3) NULL DEFAULT 1 COMMENT '多品红包类型：1多品配置2专区',
  `action_type` int(3) NULL DEFAULT 34 COMMENT '多品红包跳转类型3:链接;12:为你推荐13:特产推荐;14:新品推荐;19:新人专区;20:平台活动专区;21:9.9包邮专区;22:品牌生活;23:好货溯源;24:蜂狂特价;25:猜你喜欢;26:时令果蔬;27:节日钜惠;28:限时折扣;29:超级拼团;34:多品红包列表',
  `many_redpacket_skip_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '多品红包跳转地址',
  `order_operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `order_operator_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `action_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转名称',
  `redpacket_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批',
  `front_end_is_display` tinyint(3) NOT NULL DEFAULT 1 COMMENT '前端是否显示1显示2不显示',
  `redpacket_is_booking` tinyint(3) NULL DEFAULT 1 COMMENT '红包是否倒计时1-否2-是',
  `rob_redpacket_start_date` datetime NULL DEFAULT NULL COMMENT '抢红包开始时间',
  `rob_redpacket_end_date` datetime NULL DEFAULT NULL COMMENT '抢红包结束时间',
  PRIMARY KEY (`redpacket_t_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '红包模版表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_redpacket_transfer
-- ----------------------------
DROP TABLE IF EXISTS `yf_redpacket_transfer`;
CREATE TABLE `yf_redpacket_transfer`  (
  `redpacket_transfer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '红包转增ID',
  `redpacket_id` int(11) NOT NULL COMMENT '红包编号',
  `redpacket_t_id` int(11) NOT NULL COMMENT '红包模版编号',
  `redpacket_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包编码',
  `transfer_launch_time` datetime NOT NULL COMMENT '转增发起日期',
  `transfer_receive_time` datetime NOT NULL COMMENT '转增红包领取日期',
  `original_owner_user_id` int(11) NOT NULL COMMENT '红包原先所有者ID',
  `original_owner_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包原先所有者名称',
  `receive_user_id` int(11) NOT NULL COMMENT '红包转增领取者ID',
  `receive_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '红包转增领取者名称',
  PRIMARY KEY (`redpacket_transfer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '红包转增记录表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_rongyun_Info
-- ----------------------------
DROP TABLE IF EXISTS `yf_rongyun_Info`;
CREATE TABLE `yf_rongyun_Info`  (
  `id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shopId` int(255) NOT NULL COMMENT '店铺id',
  `userId` int(255) NOT NULL COMMENT '融云客服注册用户id',
  `creationTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_share_get_redpacket_grade
-- ----------------------------
DROP TABLE IF EXISTS `yf_share_get_redpacket_grade`;
CREATE TABLE `yf_share_get_redpacket_grade`  (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '等级id',
  `rule_id` int(11) NOT NULL COMMENT '规则id',
  `rule_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则标题',
  `redpacket_t_id` int(11) NOT NULL COMMENT '红包模版编号',
  `redpacket_t_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '红包名称',
  `grade_update_date` datetime NOT NULL COMMENT '更新时间',
  `grade_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人名称',
  `need_satisfy_person_num` int(10) NOT NULL DEFAULT 0 COMMENT '获取此红包需满足的人数',
  PRIMARY KEY (`grade_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分享获取红包等级表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_share_get_redpacket_rule
-- ----------------------------
DROP TABLE IF EXISTS `yf_share_get_redpacket_rule`;
CREATE TABLE `yf_share_get_redpacket_rule`  (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `rule_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则名称',
  `rule_start_date` datetime NOT NULL COMMENT '规则开始时间',
  `rule_end_date` datetime NOT NULL COMMENT '规则结束时间',
  `rule_state` tinyint(4) NOT NULL COMMENT '规则状态(1-正常,2-过期)',
  `rule_update_date` datetime NOT NULL COMMENT '更新时间',
  `rule_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '更新人名称',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分享获取红包规则表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_sms_info
-- ----------------------------
DROP TABLE IF EXISTS `yf_sms_info`;
CREATE TABLE `yf_sms_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sms_secret_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '私钥',
  `sms_secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密钥',
  `sms_sdk_app_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信工具应用APP的id',
  `sms_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司标识',
  `sms_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '启用和禁用状态，00禁用  01启用，默认启用',
  `sms_isActive` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '伪删除标识 00删除 01正常，默认正常',
  `sms_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息配置备注',
  `sms_registers_tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册，绑定手机模板编码',
  `sms_update_temPlate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改手机号模板编码',
  `sms_update_bankCard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改银行卡模板编码',
  `sms_invite` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请模板编码',
  `sms_login` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录模板编码',
  `sms_general` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通用模板编码',
  `sms__createdDate` timestamp NULL DEFAULT '2001-01-01 09:01:01' COMMENT '创建时间',
  `sms_modify_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家提现',
  `sms_inventory` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台 库存不足 短信模板',
  `sms_shipments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货成功，提醒短信',
  `sms_push_the_delivery` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台台，提醒商家发货',
  `sms_general_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通用',
  `sms_goods_obligation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家提醒用户付款',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信配置信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_tag_class
-- ----------------------------
DROP TABLE IF EXISTS `yf_tag_class`;
CREATE TABLE `yf_tag_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员标签等级关联表id',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `tag_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员标签id',
  `member_class_id` int(11) NULL DEFAULT NULL COMMENT '会员等级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3718 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_tag_info
-- ----------------------------
DROP TABLE IF EXISTS `yf_tag_info`;
CREATE TABLE `yf_tag_info`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员标签id',
  `tag_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员标签name',
  `tag_weight` int(11) NOT NULL COMMENT '会员标签权重',
  `tag_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员标签图片',
  `tag_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员标签描述',
  `tag_add_data` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '会员标签新增时间',
  `tag_isActive` int(11) NOT NULL DEFAULT 1 COMMENT '会员标签00删除 01正常，默认正常',
  `tag_upd_data` timestamp NULL DEFAULT NULL COMMENT '会员标签更新时间',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_user_share_get_redpacket_person
-- ----------------------------
DROP TABLE IF EXISTS `yf_user_share_get_redpacket_person`;
CREATE TABLE `yf_user_share_get_redpacket_person`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '等级id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `invite_person_num` int(11) NOT NULL COMMENT '邀请人数',
  `redpacket_is_give` int(2) NOT NULL DEFAULT 0 COMMENT '红包是否发放：1-已发放2-活动失效',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `user_avatar` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `end_update_date` datetime NULL DEFAULT NULL COMMENT '最后邀请人的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户分享人数统计' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_voucher_base
-- ----------------------------
DROP TABLE IF EXISTS `yf_voucher_base`;
CREATE TABLE `yf_voucher_base`  (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券编号',
  `voucher_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '代金券编码',
  `voucher_t_id` int(11) NOT NULL DEFAULT 0 COMMENT '代金券模版编号',
  `voucher_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '代金券标题',
  `voucher_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '代金券描述',
  `voucher_start_date` datetime NOT NULL COMMENT '代金券有效期开始时间',
  `voucher_end_date` datetime NOT NULL COMMENT '代金券有效期结束时间',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面额',
  `voucher_limit` decimal(10, 2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '代金券的店铺id',
  `voucher_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '代金券状态(1-未用,2-已用,3-过期,4-收回)',
  `voucher_active_date` datetime NOT NULL COMMENT '代金券发放日期',
  `voucher_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '代金券类别',
  `voucher_owner_id` int(11) NOT NULL DEFAULT 0 COMMENT '代金券所有者id',
  `voucher_owner_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '代金券所有者名称',
  `voucher_order_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '使用该代金券的订单编号',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '北京光声_用户删除标记（1:删除）',
  PRIMARY KEY (`voucher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 235 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代金券表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_voucher_combo
-- ----------------------------
DROP TABLE IF EXISTS `yf_voucher_combo`;
CREATE TABLE `yf_voucher_combo`  (
  `combo_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '套餐编号',
  `user_id` int(10) NOT NULL COMMENT '会员编号',
  `user_nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名称',
  `shop_id` int(10) NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `combo_start_time` datetime NOT NULL COMMENT '开始时间',
  `combo_end_time` datetime NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`combo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代金券套餐表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_voucher_price
-- ----------------------------
DROP TABLE IF EXISTS `yf_voucher_price`;
CREATE TABLE `yf_voucher_price`  (
  `voucher_price_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券面值编号',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面值',
  `voucher_price_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代金券描述',
  `voucher_defaultpoints` int(11) NULL DEFAULT 0 COMMENT '代金券默认的兑换所需积分，可以为0',
  PRIMARY KEY (`voucher_price_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代金券面额表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_voucher_template
-- ----------------------------
DROP TABLE IF EXISTS `yf_voucher_template`;
CREATE TABLE `yf_voucher_template`  (
  `voucher_t_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '代金券模版编号',
  `voucher_t_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '代金券模版名称',
  `voucher_t_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '代金券模版描述',
  `shop_class_id` int(10) NOT NULL DEFAULT 0,
  `voucher_t_start_date` datetime NOT NULL DEFAULT '2019-06-25 00:00:00' COMMENT '代金券模版有效期开始时间',
  `voucher_t_end_date` datetime NOT NULL DEFAULT '2019-06-25 00:00:00' COMMENT '代金券模版有效期结束时间',
  `voucher_t_price` int(10) NOT NULL DEFAULT 0 COMMENT '代金券模版面额',
  `voucher_t_limit` decimal(10, 2) NOT NULL COMMENT '代金券使用时的订单限额',
  `shop_id` int(10) NOT NULL DEFAULT 0 COMMENT '代金券模版的店铺id',
  `shop_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺名称',
  `voucher_t_creator_id` int(10) NOT NULL DEFAULT 0 COMMENT '代金券模版的创建者id',
  `voucher_t_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '代金券模版状态(1-有效,2-失效)',
  `voucher_t_total` int(10) NOT NULL DEFAULT 0 COMMENT '模版可发放的代金券总数',
  `voucher_t_giveout` int(10) NOT NULL DEFAULT 0 COMMENT '模版已发放的代金券数量',
  `voucher_t_used` int(10) NOT NULL DEFAULT 0 COMMENT '模版已经使用过的代金券',
  `voucher_t_add_date` datetime NOT NULL DEFAULT '2019-06-25 00:00:00' COMMENT '模版的创建时间',
  `voucher_t_update_date` datetime NOT NULL DEFAULT '2019-06-25 00:00:00' COMMENT '模版的最后修改时间',
  `combo_id` int(10) NOT NULL DEFAULT 0 COMMENT '套餐编号',
  `voucher_t_points` int(10) NOT NULL DEFAULT 0 COMMENT '兑换所需积分',
  `voucher_t_eachlimit` int(10) NOT NULL DEFAULT 1 COMMENT '每人限领张数',
  `voucher_t_styleimg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '样式模版图片',
  `voucher_t_customimg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '自定义代金券模板图片',
  `voucher_t_access_method` tinyint(1) NOT NULL DEFAULT 3 COMMENT '代金券领取方式，1-积分兑换(默认)，2-卡密兑换，3-免费领取',
  `voucher_t_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '推荐状态，0-为不推荐，1-推荐',
  `voucher_t_user_grade_limit` tinyint(4) NOT NULL DEFAULT 1 COMMENT '领取代金券的用户等级限制',
  `voucher_t_type` int(1) NOT NULL DEFAULT 3 COMMENT '代金券类型：1-单个店铺，2-多店铺参与',
  `voucher_t_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参加平台活动审核失败原因',
  `voucher_b_start_date` datetime NOT NULL DEFAULT '2019-06-25 00:00:00' COMMENT '优惠券报名开始时间',
  `voucher_b_end_date` datetime NOT NULL DEFAULT '2019-06-25 00:00:00' COMMENT '优惠券报名结束时间',
  PRIMARY KEY (`voucher_t_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 176 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代金券模版表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for yf_web_config
-- ----------------------------
DROP TABLE IF EXISTS `yf_web_config`;
CREATE TABLE `yf_web_config`  (
  `config_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数组下标',
  `config_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数组值',
  `config_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值，1可能，0不可用',
  `config_comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `config_datatype` enum('string','json','number') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'string' COMMENT '数据类型',
  PRIMARY KEY (`config_key`) USING BTREE,
  INDEX `index`(`config_key`, `config_type`) USING BTREE COMMENT '(null)'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- View structure for gdb_merchant_goods_orderby_view
-- ----------------------------
DROP VIEW IF EXISTS `gdb_merchant_goods_orderby_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `gdb_merchant_goods_orderby_view` AS select `a`.`common_id` AS `common_id`,`a`.`goods_id` AS `goods_id`,`a`.`common_name` AS `common_name`,`a`.`common_salenum` AS `common_salenum`,`a`.`common_price` AS `common_price`,`a`.`common_market_price` AS `common_market_price`,`a`.`common_image` AS `common_image`,`a`.`common_promotion_tips` AS `common_promotion_tips`,`a`.`common_evaluate` AS `common_evaluate`,`a`.`common_collect` AS `common_collect`,`a`.`shop_id` AS `shop_id`,`a`.`shop_name` AS `shop_name`,`a`.`common_type` AS `common_type`,`a`.`common_baby_price` AS `common_baby_price`,`a`.`common_add_time` AS `common_add_time`,`a`.`common_is_xian` AS `common_is_xian`,`a`.`corner_id` AS `corner_id`,if(isnull(`c`.`qty`),0,`c`.`qty`) AS `qty`,`b`.`avg_shipping_time` AS `avg_shipping_time`,`a`.`shop_status` AS `shop_status`,`a`.`common_verify` AS `common_verify`,`a`.`common_state` AS `common_state`,`a`.`common_stock` AS `common_stock`,`a`.`cat_id` AS `cat_id`,`a`.`shop_self_support` AS `shop_self_support`,`a`.`brand_id` AS `brand_id`,`a`.`common_sell_time` AS `common_sell_time`,`a`.`common_is_screen` AS `common_is_screen` from (((`java_goods`.`gdb_merchant_goods_common` `a` left join `java_order`.`odb_avg_shop_evaluation` `b` on((`a`.`shop_id` = `b`.`shop_id`))) left join `java_order`.`odb_avg_goods_evaluation` `c` on((`a`.`common_id` = `c`.`common_id`))) left join `java_goods`.`gdb_merchant_shop_base` `d` on((`a`.`shop_id` = `d`.`shop_id`))) where ((`d`.`shop_status` = 3) and (`a`.`common_verify` = 1) and (`a`.`common_state` = 1));

-- ----------------------------
-- View structure for gdb_merchant_goods_rec_view
-- ----------------------------
DROP VIEW IF EXISTS `gdb_merchant_goods_rec_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `gdb_merchant_goods_rec_view` AS select `gr`.`common_id` AS `common_id`,`gc`.`common_image` AS `common_image`,`gc`.`common_name` AS `common_name`,concat('https://www.fkgou.com/pc/pages/description.html?goodsId=',`gc`.`goods_id`) AS `com_url`,`gc`.`common_salenum` AS `common_salenum`,`gr`.`display_order` AS `display_order`,`gc`.`common_evaluate` AS `common_evaluate` from (`gdb_merchant_goods_rec` `gr` left join `gdb_merchant_goods_common` `gc` on((`gc`.`common_id` = `gr`.`common_id`)));

-- ----------------------------
-- View structure for gdb_merchant_goods_rec_view2
-- ----------------------------
DROP VIEW IF EXISTS `gdb_merchant_goods_rec_view2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `gdb_merchant_goods_rec_view2` AS select `common`.`common_id` AS `common_id`,`rec`.`common_id` AS `goods_id`,`common`.`common_image` AS `common_image`,`common`.`common_name` AS `common_name`,concat('https://sctest.fangbao101.com/pc/pages/description.html?goodsId=',`rec`.`common_id`) AS `com_url`,`common`.`common_salenum` AS `common_salenum`,`rec`.`display_order` AS `display_order`,`common`.`common_evaluate` AS `common_evaluate` from ((`gdb_merchant_goods_rec` `rec` join `gdb_merchant_goods_base` `base`) join `gdb_merchant_goods_common` `common`) where ((`rec`.`common_id` = `base`.`goods_id`) and (`rec`.`common_id` = `common`.`common_id`));

-- ----------------------------
-- View structure for shop_favorites
-- ----------------------------
DROP VIEW IF EXISTS `shop_favorites`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `shop_favorites` AS select `ef`.`find_id` AS `find_id`,`ef`.`shop_id` AS `shop_id`,`ef`.`extend_title` AS `extend_title`,`ef`.`extend_read` AS `extend_read`,`ef`.`extend_content_abstract` AS `extend_content_abstract`,`ef`.`extend_collect` AS `extend_collect`,`sb`.`shop_name` AS `shop_name`,`fs`.`shop_id` AS `user_favorites_shop_id`,`fs`.`user_id` AS `user_id`,`ef`.`extend_enable` AS `extend_enable` from ((`java_goods`.`gdb_extend_find` `ef` left join `java_goods`.`gdb_merchant_shop_base` `sb` on((`sb`.`shop_id` = `ef`.`shop_id`))) left join `java_ucenter`.`udb_ucenter_user_favorites_shop` `fs` on((`fs`.`shop_id` = `sb`.`shop_id`)));

-- ----------------------------
-- Procedure structure for call display;
-- ----------------------------
DROP PROCEDURE IF EXISTS `call display;`;
delimiter ;;
CREATE PROCEDURE `call display;`()
BEGIN 
select sum(display_order) into @sum from gdb_merchant_goods_rec;
select common_id from 
(
select common_id,display_order+round(rand()*(@sum-1)+1) as display_order1  from gdb_merchant_goods_rec ) as a order by display_order1 desc limit 10;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for display
-- ----------------------------
DROP PROCEDURE IF EXISTS `display`;
delimiter ;;
CREATE PROCEDURE `display`(in `pagesize` int)
BEGIN
set @pagesize=pagesize;
select sum(display_order) into @sum from gdb_merchant_goods_rec ;
PREPARE p_s from '
SELECT
	a.common_id,
	gc.common_name
FROM
	(
		SELECT
			common_id,
			display_order + round(rand() *(@sum - 1) + 1) AS display_order1
		FROM
			gdb_merchant_goods_rec where activity_verify = 1
	) AS a
LEFT JOIN gdb_merchant_goods_common gc ON a.common_id = gc.common_id
where gc.common_state = 1 and gc.common_verify= 1 and gc.shop_status = 3 and gc.common_is_screen = 1
ORDER BY
	display_order1 DESC
 limit ? ';
execute p_s using @pagesize;
DEALLOCATE PREPARE p_s;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for display1
-- ----------------------------
DROP PROCEDURE IF EXISTS `display1`;
delimiter ;;
CREATE PROCEDURE `display1`(IN pagesize int)
BEGIN 
set @pagesize=pagesize;
select sum(display_order) into @sum from gdb_merchant_specialty_goods_rec ;
PREPARE p_s from '
select a.common_id from 
(select common_id,display_order+round(rand()*(@sum-1)+1) as display_order1  from gdb_merchant_specialty_goods_rec where activity_verify = 1) as a 
LEFT JOIN gdb_merchant_goods_common gc ON a.common_id = gc.common_id
where gc.common_state = 1 and gc.common_verify= 1 and gc.common_is_screen = 1
order by display_order1 desc limit ? ';
execute p_s using @pagesize;
DEALLOCATE PREPARE p_s;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for display2
-- ----------------------------
DROP PROCEDURE IF EXISTS `display2`;
delimiter ;;
CREATE PROCEDURE `display2`(in `pagesize` int)
BEGIN 
set @pagesize=pagesize;
select sum(display_order) into @sum from gdb_merchant_new_goods ;
PREPARE p_s from '
select a.common_id from 
(select common_id,display_order+round(rand()*(@sum-1)+1) as display_order1  from gdb_merchant_new_goods where activity_verify = 1) as a 
LEFT JOIN gdb_merchant_goods_common gc ON a.common_id = gc.common_id
where gc.common_state = 1 and gc.common_verify= 1 and gc.common_is_screen = 1
order by display_order1 desc limit ? ';
execute p_s using @pagesize;
DEALLOCATE PREPARE p_s;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for specialtyGoods
-- ----------------------------
DROP PROCEDURE IF EXISTS `specialtyGoods`;
delimiter ;;
CREATE PROCEDURE `specialtyGoods`(IN pagesize int)
BEGIN 
set @pagesize=pagesize;
select sum(display_order) into @sum from gdb_merchant_fkgou_specialty_goods ;
PREPARE p_s from '
SELECT
	gc.goods_id,
	gc.common_id,
	gc.common_name,
	gc.goods_id,
	gc.common_price,
	gc.common_image,
	gc.common_salenum,
	gc.common_market_price,
	gc.common_state,
	gc.common_promotion_tips,
	a.display_order + round(rand() *(@sum - 1) + 1) AS display_order1
FROM
	activity_none_goods a
LEFT JOIN gdb_merchant_goods_common gc ON a.common_id = gc.common_id
left join gdb_merchant_shop_base sb on gc.shop_id =sb.shop_id
WHERE
	a.activity_verify = 1   and sb.shop_status=3
 and gc.common_state=1 and gc.common_is_screen = 1 and none_type=4
ORDER BY
	display_order1 DESC limit ? ';
execute p_s using @pagesize;
DEALLOCATE PREPARE p_s;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for supplyspecialtyGoods
-- ----------------------------
DROP PROCEDURE IF EXISTS `supplyspecialtyGoods`;
delimiter ;;
CREATE PROCEDURE `supplyspecialtyGoods`(IN pagesize int)
BEGIN 
set @pagesize=pagesize;
select sum(display_order) into @sum from gdb_merchant_fkgou_supply_specialty_goods ;
PREPARE p_s from '
SELECT
	gc.goods_id,
	gc.common_id,
	gc.common_name,
	gc.goods_id,
	gc.common_price,
	gc.common_image,
	gc.common_salenum,
	gc.common_market_price,
	gc.common_state,
	gc.common_promotion_tips,
	a.display_order + round(rand() *(@sum - 1) + 1) AS display_order1
FROM
	activity_none_goods a
LEFT JOIN gdb_merchant_goods_common gc ON a.common_id = gc.common_id
left join gdb_merchant_shop_base sb on gc.shop_id =sb.shop_id
WHERE
	a.activity_verify = 1   and sb.shop_status=3
 and gc.common_state=1 and gc.common_is_screen = 1 and none_type=23
ORDER BY
	display_order1 DESC limit ? ';
execute p_s using @pagesize;
DEALLOCATE PREPARE p_s;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
