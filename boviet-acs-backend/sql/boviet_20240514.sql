/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.60
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 192.168.1.60:3306
 Source Schema         : boviet

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 14/05/2024 20:48:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (10, 'sys_language', '系统语言', '', '', 'SysLanguage', 'tree', 'element-ui', 'com.ruoyi.system', 'system', 'lang', '系统语言', 'Qyentnar', '0', '/', '{\"treeCode\":\"id\",\"treeName\":\"id\",\"treeParentCode\":\"id\",\"parentMenuId\":\"1\"}', 'admin', '2024-04-18 21:15:57', '', '2024-05-11 00:00:37', NULL);
INSERT INTO `gen_table` VALUES (11, 'sys_menu', '菜单权限表', NULL, NULL, 'SysMenu', 'crud', '', 'com.ruoyi.system', 'system', 'menu', '菜单权限', 'ruoyi', '0', '/', NULL, 'admin', '2024-05-10 13:06:15', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (48, 10, 'id', 'ID', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-18 21:15:57', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (49, 10, 'menu_id', 'Menu ID', 'int(11)', 'Long', 'menuId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-04-18 21:15:57', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (50, 10, 'lang_zh', '中文', 'varchar(255)', 'String', 'langZh', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-18 21:15:57', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (51, 10, 'lang_en', 'English', 'varchar(255)', 'String', 'langEn', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-18 21:15:57', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (52, 10, 'lang_vi', 'Tiếng Việt', 'varchar(255)', 'String', 'langVi', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-18 21:15:57', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (53, 10, 'lang_key', 'Key word', 'varchar(255)', 'String', 'langKey', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2024-04-19 07:43:20', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (54, 10, 'lang_type', 'Type', 'varchar(20)', 'String', 'langType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, '', '2024-04-19 07:43:20', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (55, 10, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, '', '2024-04-19 09:43:34', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (56, 10, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, '', '2024-04-19 09:43:34', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (57, 10, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, '', '2024-04-19 09:43:34', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (58, 10, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, '', '2024-04-19 09:43:34', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (59, 10, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, '', '2024-04-19 09:43:34', '', '2024-05-11 00:00:37');
INSERT INTO `gen_table_column` VALUES (60, 11, 'menu_id', '菜单ID', 'bigint(20)', 'Long', 'menuId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (61, 11, 'menu_name', '菜单名称', 'varchar(500)', 'String', 'menuName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'textarea', '', 2, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (62, 11, 'parent_id', '父菜单ID', 'bigint(20)', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (63, 11, 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (64, 11, 'path', '路由地址', 'varchar(200)', 'String', 'path', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (65, 11, 'component', '组件路径', 'varchar(255)', 'String', 'component', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (66, 11, 'query', '路由参数', 'varchar(255)', 'String', 'query', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (67, 11, 'is_frame', '是否为外链（0是 1否）', 'int(1)', 'Integer', 'isFrame', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (68, 11, 'is_cache', '是否缓存（0缓存 1不缓存）', 'int(1)', 'Integer', 'isCache', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (69, 11, 'menu_type', '菜单类型（M目录 C菜单 F按钮）', 'char(1)', 'String', 'menuType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 10, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (70, 11, 'visible', '菜单状态（0显示 1隐藏）', 'char(1)', 'String', 'visible', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (71, 11, 'status', '菜单状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 12, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (72, 11, 'perms', '权限标识', 'varchar(100)', 'String', 'perms', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-05-10 13:06:15', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (73, 11, 'icon', '菜单图标', 'varchar(100)', 'String', 'icon', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2024-05-10 13:06:16', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (74, 11, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2024-05-10 13:06:16', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (75, 11, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2024-05-10 13:06:16', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (76, 11, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2024-05-10 13:06:16', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (77, 11, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2024-05-10 13:06:16', '', '2024-05-10 13:08:14');
INSERT INTO `gen_table_column` VALUES (78, 11, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2024-05-10 13:06:16', '', '2024-05-10 13:08:14');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-04-10 15:46:16', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'N', 'admin', '2024-04-10 15:46:16', 'admin', '2024-05-14 19:27:31', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-04-10 15:46:16', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-04-10 15:46:16', 'admin', '2024-04-11 08:00:18', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-04-10 15:46:16', 'admin', '2024-04-11 08:03:26', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-04-10 15:46:16', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-10 15:46:11', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-10 15:46:11', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-10 15:46:11', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-10 15:46:11', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-10 15:46:11', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-10 15:46:11', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-10 15:46:11', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-10 15:46:11', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-10 15:46:11', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-10 15:46:11', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-04-10 15:46:15', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-04-10 15:46:16', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-04-10 15:46:17', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-04-10 15:46:17', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-04-10 15:46:17', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_language
-- ----------------------------
DROP TABLE IF EXISTS `sys_language`;
CREATE TABLE `sys_language`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `lang_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Key word',
  `lang_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Type',
  `lang_zh` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '中文',
  `lang_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'English',
  `lang_vi` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Tiếng Việt',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT 'Menu ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_lang_menu`(`menu_id`) USING BTREE,
  UNIQUE INDEX `idx_lang`(`lang_key`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统语言' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_language
-- ----------------------------
INSERT INTO `sys_language` VALUES (1, NULL, 'Menu', '系统管理', 'System', 'Quản lý hệ thống', 1, 'admin', '2024-04-10 15:46:12', 'admin', '2024-05-11 10:39:29', '系统管理目录');
INSERT INTO `sys_language` VALUES (2, NULL, 'Menu', '系统监控', 'System Monitor', 'Giám sát Hệ Thống', 2, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:39:43', '系统监控目录');
INSERT INTO `sys_language` VALUES (3, NULL, 'Menu', '系统工具', 'System Tool', 'Công cụ hệ thống', 3, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:24:31', '系统工具目录');
INSERT INTO `sys_language` VALUES (4, NULL, 'Menu', '若依官网', 'Ruoyi official website', 'Trang web Ruoyi', 4, 'admin', '2024-04-10 15:46:12', 'admin', '2024-05-11 10:25:13', '若依官网地址');
INSERT INTO `sys_language` VALUES (5, NULL, 'Menu', '用户管理', 'User', 'Quản lý người dùng', 100, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:39:49', '用户管理菜单');
INSERT INTO `sys_language` VALUES (6, NULL, 'Menu', '角色管理', 'Roles', 'Quản lý vai trò', 101, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:39:54', '角色管理菜单');
INSERT INTO `sys_language` VALUES (7, NULL, 'Menu', '菜单管理', 'Menu', 'Quản lý thực đơn', 102, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:39:58', '菜单管理菜单');
INSERT INTO `sys_language` VALUES (8, NULL, 'Menu', '部门管理', 'Department', 'Quản lý bộ phận', 103, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:40:01', '部门管理菜单');
INSERT INTO `sys_language` VALUES (9, NULL, 'Menu', '岗位管理', 'Location', 'Quản lý vị trí', 104, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:40:05', '岗位管理菜单');
INSERT INTO `sys_language` VALUES (10, NULL, 'Menu', '字典管理', 'Dictionary', 'Quản lý từ điển', 105, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:40:09', '字典管理菜单');
INSERT INTO `sys_language` VALUES (11, NULL, 'Menu', '参数设置', 'Parameter', 'Cài đặt tham số', 106, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:40:47', '参数设置菜单');
INSERT INTO `sys_language` VALUES (12, NULL, 'Menu', '通知公告', 'Notification', 'Thông báo', 107, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:35:12', '通知公告菜单');
INSERT INTO `sys_language` VALUES (13, NULL, 'Menu', '日志管理', 'Logs', 'Quản lý nhật ký', 108, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:40:58', '日志管理菜单');
INSERT INTO `sys_language` VALUES (14, NULL, 'Menu', '在线用户', 'Online users', 'Người dùng trực tuyến', 109, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:37:05', '在线用户菜单');
INSERT INTO `sys_language` VALUES (15, NULL, 'Menu', '定时任务', 'Scheduled Tasks', 'Nhiệm vụ theo lịch trình', 110, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:37:35', '定时任务菜单');
INSERT INTO `sys_language` VALUES (16, NULL, 'Menu', '数据监控', 'Data Monitor', 'Giám sát dữ liệu', 111, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:38:49', '数据监控菜单');
INSERT INTO `sys_language` VALUES (17, NULL, 'Menu', '服务监控', 'Service Monitor', 'Giám sát dịch vụ', 112, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:39:00', '服务监控菜单');
INSERT INTO `sys_language` VALUES (18, NULL, 'Menu', '缓存监控', 'Cache Monitor', 'Giám sát bộ đệm', 113, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 10:38:45', '缓存监控菜单');
INSERT INTO `sys_language` VALUES (19, NULL, 'Menu', '缓存列表', 'Cache List', 'Bộ nhớ đệm', 114, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 11:06:43', '缓存列表菜单');
INSERT INTO `sys_language` VALUES (20, NULL, 'Menu', '表单构建', 'Form Building', 'Biểu mẫu', 115, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 11:07:22', '表单构建菜单');
INSERT INTO `sys_language` VALUES (21, NULL, 'Menu', '代码生成', 'Code Generation', 'Tạo mã', 116, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 11:07:54', '代码生成菜单');
INSERT INTO `sys_language` VALUES (22, NULL, 'Menu', '系统接口', 'API', 'API', 117, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 11:08:21', '系统接口菜单');
INSERT INTO `sys_language` VALUES (23, NULL, 'Menu', '操作日志', 'Operation log', 'Nhật ký hoạt động', 500, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 11:08:38', '操作日志菜单');
INSERT INTO `sys_language` VALUES (24, NULL, 'Menu', '登录日志', 'Login log', 'Nhật ký đăng nhập', 501, 'admin', '2024-04-10 15:46:12', '', '2024-05-11 11:09:03', '登录日志菜单');
INSERT INTO `sys_language` VALUES (25, NULL, 'Menu', '用户查询', 'en: 用户查询', 'vi: 用户查询', 1000, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (26, NULL, 'Menu', '用户新增', 'en: 用户新增', 'vi: 用户新增', 1001, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (27, NULL, 'Menu', '用户修改', 'en: 用户修改', 'vi: 用户修改', 1002, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (28, NULL, 'Menu', '用户删除', 'en: 用户删除', 'vi: 用户删除', 1003, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (29, NULL, 'Menu', '用户导出', 'en: 用户导出', 'vi: 用户导出', 1004, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (30, NULL, 'Menu', '用户导入', 'en: 用户导入', 'vi: 用户导入', 1005, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (31, NULL, 'Menu', '重置密码', 'en: 重置密码', 'vi: 重置密码', 1006, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (32, NULL, 'Menu', '角色查询', 'en: 角色查询', 'vi: 角色查询', 1007, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (33, NULL, 'Menu', '角色新增', 'en: 角色新增', 'vi: 角色新增', 1008, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (34, NULL, 'Menu', '角色修改', 'en: 角色修改', 'vi: 角色修改', 1009, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (35, NULL, 'Menu', '角色删除', 'en: 角色删除', 'vi: 角色删除', 1010, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (36, NULL, 'Menu', '角色导出', 'en: 角色导出', 'vi: 角色导出', 1011, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (37, NULL, 'Menu', '菜单查询', 'en: 菜单查询', 'vi: 菜单查询', 1012, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (38, NULL, 'Menu', '菜单新增', 'en: 菜单新增', 'vi: 菜单新增', 1013, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (39, NULL, 'Menu', '菜单修改', 'en: 菜单修改', 'vi: 菜单修改', 1014, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (40, NULL, 'Menu', '菜单删除', 'en: 菜单删除', 'vi: 菜单删除', 1015, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (41, NULL, 'Menu', '部门查询', 'en: 部门查询', 'vi: 部门查询', 1016, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (42, NULL, 'Menu', '部门新增', 'en: 部门新增', 'vi: 部门新增', 1017, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (43, NULL, 'Menu', '部门修改', 'en: 部门修改', 'vi: 部门修改', 1018, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (44, NULL, 'Menu', '部门删除', 'en: 部门删除', 'vi: 部门删除', 1019, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (45, NULL, 'Menu', '岗位查询', 'en: 岗位查询', 'vi: 岗位查询', 1020, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (46, NULL, 'Menu', '岗位新增', 'en: 岗位新增', 'vi: 岗位新增', 1021, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (47, NULL, 'Menu', '岗位修改', 'en: 岗位修改', 'vi: 岗位修改', 1022, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (48, NULL, 'Menu', '岗位删除', 'en: 岗位删除', 'vi: 岗位删除', 1023, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (49, NULL, 'Menu', '岗位导出', 'en: 岗位导出', 'vi: 岗位导出', 1024, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (50, NULL, 'Menu', '字典查询', 'en: 字典查询', 'vi: 字典查询', 1025, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (51, NULL, 'Menu', '字典新增', 'en: 字典新增', 'vi: 字典新增', 1026, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (52, NULL, 'Menu', '字典修改', 'en: 字典修改', 'vi: 字典修改', 1027, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (53, NULL, 'Menu', '字典删除', 'en: 字典删除', 'vi: 字典删除', 1028, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (54, NULL, 'Menu', '字典导出', 'en: 字典导出', 'vi: 字典导出', 1029, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (55, NULL, 'Menu', '参数查询', 'en: 参数查询', 'vi: 参数查询', 1030, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (56, NULL, 'Menu', '参数新增', 'en: 参数新增', 'vi: 参数新增', 1031, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (57, NULL, 'Menu', '参数修改', 'en: 参数修改', 'vi: 参数修改', 1032, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (58, NULL, 'Menu', '参数删除', 'en: 参数删除', 'vi: 参数删除', 1033, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (59, NULL, 'Menu', '参数导出', 'en: 参数导出', 'vi: 参数导出', 1034, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (60, NULL, 'Menu', '公告查询', 'en: 公告查询', 'vi: 公告查询', 1035, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (61, NULL, 'Menu', '公告新增', 'en: 公告新增', 'vi: 公告新增', 1036, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (62, NULL, 'Menu', '公告修改', 'en: 公告修改', 'vi: 公告修改', 1037, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (63, NULL, 'Menu', '公告删除', 'en: 公告删除', 'vi: 公告删除', 1038, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (64, NULL, 'Menu', '操作查询', 'en: 操作查询', 'vi: 操作查询', 1039, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (65, NULL, 'Menu', '操作删除', 'en: 操作删除', 'vi: 操作删除', 1040, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (66, NULL, 'Menu', '日志导出', 'en: 日志导出', 'vi: 日志导出', 1041, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (67, NULL, 'Menu', '登录查询', 'en: 登录查询', 'vi: 登录查询', 1042, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (68, NULL, 'Menu', '登录删除', 'en: 登录删除', 'vi: 登录删除', 1043, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (69, NULL, 'Menu', '日志导出', 'en: 日志导出', 'vi: 日志导出', 1044, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (70, NULL, 'Menu', '账户解锁', 'en: 账户解锁', 'vi: 账户解锁', 1045, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (71, NULL, 'Menu', '在线查询', 'en: 在线查询', 'vi: 在线查询', 1046, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (72, NULL, 'Menu', '批量强退', 'en: 批量强退', 'vi: 批量强退', 1047, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (73, NULL, 'Menu', '单条强退', 'en: 单条强退', 'vi: 单条强退', 1048, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (74, NULL, 'Menu', '任务查询', 'en: 任务查询', 'vi: 任务查询', 1049, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (75, NULL, 'Menu', '任务新增', 'en: 任务新增', 'vi: 任务新增', 1050, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (76, NULL, 'Menu', '任务修改', 'en: 任务修改', 'vi: 任务修改', 1051, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (77, NULL, 'Menu', '任务删除', 'en: 任务删除', 'vi: 任务删除', 1052, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (78, NULL, 'Menu', '状态修改', 'en: 状态修改', 'vi: 状态修改', 1053, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (79, NULL, 'Menu', '任务导出', 'en: 任务导出', 'vi: 任务导出', 1054, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (80, NULL, 'Menu', '生成查询', 'en: 生成查询', 'vi: 生成查询', 1055, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (81, NULL, 'Menu', '生成修改', 'en: 生成修改', 'vi: 生成修改', 1056, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (82, NULL, 'Menu', '生成删除', 'en: 生成删除', 'vi: 生成删除', 1057, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (83, NULL, 'Menu', '导入代码', 'en: 导入代码', 'vi: 导入代码', 1058, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (84, NULL, 'Menu', '预览代码', 'en: 预览代码', 'vi: 预览代码', 1059, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (85, NULL, 'Menu', '生成代码', 'en: 生成代码', 'vi: 生成代码', 1060, '', NULL, '', NULL, NULL);
INSERT INTO `sys_language` VALUES (86, NULL, 'Menu', '语言', 'Language', 'Ngôn ngữ', 2040, 'admin', '2024-04-18 21:19:59', 'admin', '2024-05-10 12:11:09', '系统语言菜单');
INSERT INTO `sys_language` VALUES (88, 'loginTitle', 'Page', '博威尔特', 'Boviet Solar', 'Boviet Solar', NULL, '', '2024-04-19 17:00:34', '', '2024-05-11 09:57:41', NULL);
INSERT INTO `sys_language` VALUES (90, 'btnAdd', 'Page', '新增', 'Add', 'Thêm mới', NULL, '', '2024-04-19 17:27:46', '', '2024-05-10 20:05:10', NULL);
INSERT INTO `sys_language` VALUES (91, 'rememberMe', 'Page', '记住登录', 'rememberMe', 'Lưu đăng nhập', NULL, '', '2024-05-10 09:38:16', '', '2024-05-10 09:39:16', NULL);
INSERT INTO `sys_language` VALUES (92, 'theme', 'Page', 'Theme', 'Theme', 'Giao diện', NULL, '', '2024-05-10 12:07:15', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (93, 'btnSearch', 'Page', '搜索', 'Submit', 'Tìm kiếm', NULL, '', '2024-05-10 12:28:06', '', '2024-05-10 12:30:09', NULL);
INSERT INTO `sys_language` VALUES (94, 'btnReset', 'Page', '重置', 'Reset', 'Làm mới', NULL, '', '2024-05-10 12:28:25', '', '2024-05-10 12:30:18', NULL);
INSERT INTO `sys_language` VALUES (95, 'btnExport', 'Page', '导出', 'Export', 'Export', NULL, '', '2024-05-10 17:24:18', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (96, 'lbl.lang.langKey', 'Page', '关键词', 'Keywords', 'Từ khoá', NULL, '', '2024-05-10 19:40:15', '', '2024-05-11 10:01:31', NULL);
INSERT INTO `sys_language` VALUES (98, 'lbl.lang.langType', 'Page', '类型', 'Type', 'Loại', NULL, '', '2024-05-10 20:15:24', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (99, 'lbl.lang.langZh', 'Page', '中文', 'Chinese', 'Tiếng Trung', NULL, '', '2024-05-10 20:16:05', '', '2024-05-10 20:17:34', NULL);
INSERT INTO `sys_language` VALUES (100, 'lbl.lang.langEn', 'Page', '英语', 'English', 'Tiếng Anh', NULL, '', '2024-05-10 20:17:29', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (101, 'lbl.lang.langVi', 'Page', '越语', 'Vietnamese', 'Tiếng Việt', NULL, '', '2024-05-10 20:18:12', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (102, 'lbl.lang.remark', 'Page', '备注', 'Remark', 'Ghi chú', NULL, '', '2024-05-10 20:20:07', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (103, 'titleAddForm', 'Page', '添加', 'Add new', 'Thêm mới', NULL, '', '2024-05-10 20:21:12', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (104, 'titleEditForm', 'Page', '修改', 'Edit', 'Chỉnh sửa', NULL, '', '2024-05-10 20:21:55', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (105, 'btnEdit', 'Page', '修改', 'Edit', 'Chỉnh sửa', NULL, '', '2024-05-10 20:22:15', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (106, 'btnRemove', 'Page', '删除', 'Delete', 'Xoá', NULL, '', '2024-05-10 20:22:48', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (107, 'formSubmit', 'Page', '确定', 'Submit', 'Đồng ý', NULL, '', '2024-05-10 20:25:26', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (108, 'formCancel', 'Page', '取消', 'Cancel', 'Huỷ bỏ', NULL, '', '2024-05-10 20:25:50', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (109, 'lbl.lang.id', 'Page', 'ID', 'id', 'ID', NULL, 'admin', '2024-05-10 22:37:48', NULL, NULL, NULL);
INSERT INTO `sys_language` VALUES (110, 'dictGeneration', 'Page', '请选择字典生成', 'Please select dictionary generation', 'Vui lòng chọn tạo từ điển', NULL, '', '2024-05-11 00:50:15', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (111, 'lbl.lang.menuId', 'Page', '序号', 'Menu id', 'Mã thực đơn', NULL, '', '2024-05-11 01:12:37', '', '2024-05-11 10:12:49', NULL);
INSERT INTO `sys_language` VALUES (112, 'plh.lang.langZh', 'Page', '请输入中文名称', 'Please enter Chinese labels', 'Vui lòng nhập tên tiếng trung', NULL, '', '2024-05-11 01:13:16', '', '2024-05-11 10:04:11', NULL);
INSERT INTO `sys_language` VALUES (113, 'plh.lang.langEn', 'Page', '请输入英语名称', 'Please enter English labels', 'Vui lòng nhập tên tiếng anh', NULL, '', '2024-05-11 01:14:38', '', '2024-05-11 10:05:50', NULL);
INSERT INTO `sys_language` VALUES (114, 'login', 'Page', '登录', 'Login', 'đăng nhập', NULL, '', '2024-05-11 09:55:55', '', '2024-05-11 09:59:00', NULL);
INSERT INTO `sys_language` VALUES (115, 'logout', 'Page', '退出', 'Logout', 'Đăng xuất', NULL, '', '2024-05-11 09:56:53', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (116, 'user.profile', 'Page', '个人信息', 'User profile', 'Thông tin cá nhân', NULL, '', '2024-05-11 09:57:56', '', '2024-05-14 20:41:55', NULL);
INSERT INTO `sys_language` VALUES (117, 'plh.lang.langKey', 'Page', '请输入关键词', 'Please enter keywords', 'Vui lòng nhập từ khoá', NULL, '', '2024-05-11 10:01:25', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (118, 'plh.lang.langVi', 'Page', '请输入越语名称', 'Please enter a Vietnamese labels', 'Vui lòng nhập tên tiếng Việt', NULL, '', '2024-05-11 10:07:19', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (119, 'plh.lang.remark', 'Page', '请输入备注', 'Please enter remark', 'Vui lòng nhập ghi chú', NULL, '', '2024-05-11 10:08:21', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (120, 'req.lang.langVi', 'Page', '越语不能为空', 'Vietnamese cannot be empty', 'Tiếng Việt không được bỏ trống', NULL, '', '2024-05-11 10:09:46', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (121, 'req.lang.langEn', 'Page', '英语不能为空', 'English cannot be empty', 'Tiếng Anh không được bỏ trống', NULL, '', '2024-05-11 10:10:25', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (122, 'req.lang.langZh', 'Page', '中文不能为空', 'Chinese cannot be empty', 'Tiếng trung không được bỏ trống', NULL, '', '2024-05-11 10:11:03', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (123, 'plh.lang.menuId', 'Page', '请输入序号', 'Please enter menu id', 'Vui lòng nhập mã thực đơn', NULL, '', '2024-05-11 10:13:56', '', NULL, NULL);
INSERT INTO `sys_language` VALUES (124, 'operate', 'Page', '操作', 'Operate', 'Hành động', NULL, '', '2024-05-11 10:23:32', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 333 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-10 22:38:49');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 07:36:18');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-11 07:45:44');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '1', '验证码已失效', '2024-04-11 07:55:34');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 07:55:56');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 07:57:16');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-11 08:00:26');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 08:00:29');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-11 08:03:38');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 08:03:42');
INSERT INTO `sys_logininfor` VALUES (110, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '注册成功', '2024-04-11 08:05:27');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-11 08:05:43');
INSERT INTO `sys_logininfor` VALUES (112, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-11 08:05:50');
INSERT INTO `sys_logininfor` VALUES (113, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 08:05:59');
INSERT INTO `sys_logininfor` VALUES (114, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-11 08:06:10');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 08:06:14');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 10:09:28');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 10:34:22');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 12:44:24');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 12:46:54');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-11 12:57:39');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-16 07:59:49');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-16 08:38:35');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-16 15:13:57');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-16 15:14:31');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '172.16.243.21', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-04-16 15:14:50');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 08:05:51');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 09:50:27');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 10:50:31');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 12:06:34');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 13:07:58');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-17 13:27:34');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 14:39:59');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-17 14:40:06');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 14:40:10');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-17 14:40:13');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-17 14:52:58');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-17 14:53:01');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 14:54:20');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-17 14:54:30');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 14:54:37');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-17 14:54:47');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 14:58:23');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-17 15:04:12');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 15:04:37');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 15:25:28');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-17 15:40:02');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 15:51:08');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-17 15:53:02');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 15:53:08');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-17 15:53:47');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 15:53:53');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-17 15:59:41');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-17 15:59:45');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-18 08:17:54');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 09:01:52');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 10:13:29');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:13:32');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 10:17:19');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:17:32');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:20:33');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:20:48');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:20:54');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-18 10:21:01');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:21:32');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:26:34');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 10:26:40');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:26:50');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 10:26:54');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:27:05');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 10:29:17');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:29:35');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-18 10:29:52');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:29:55');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:31:55');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-18 10:32:39');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 10:34:57');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:35:49');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:39:11');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:41:55');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:45:03');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:48:52');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 10:54:04');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-18 11:00:57');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 11:07:54');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 11:07:57');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 11:08:16');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 11:08:20');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 11:32:15');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 11:32:18');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 11:49:39');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 11:49:43');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 13:41:12');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 13:41:14');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 13:43:41');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 13:45:10');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 13:46:34');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 18:32:06');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 21:15:46');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 21:54:29');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 21:54:34');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 21:56:10');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 21:56:13');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 21:58:19');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 21:58:47');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 21:59:07');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 22:08:47');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 22:10:27');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 22:10:37');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 22:13:32');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 22:31:42');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 22:34:33');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-18 22:36:01');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-18 22:36:06');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-18 22:37:08');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-18 22:41:08');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-04-18 22:41:37');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2024-04-18 22:41:56');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2024-04-18 22:42:02');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2024-04-18 22:46:35');
INSERT INTO `sys_logininfor` VALUES (220, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 22:47:36');
INSERT INTO `sys_logininfor` VALUES (221, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 22:52:19');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 22:52:23');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-18 22:55:00');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 22:57:24');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 23:00:34');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-19 07:43:05');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-19 09:11:06');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-19 10:39:32');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-19 12:33:18');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-19 15:08:14');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 00:53:27');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 00:58:46');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 01:13:00');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 01:15:53');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 01:26:44');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 01:31:29');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 01:32:07');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 01:32:30');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 02:10:42');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 02:14:04');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 02:14:08');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 02:14:13');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 02:16:51');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 02:20:06');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 02:22:28');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 02:29:05');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 02:31:47');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 02:45:55');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 02:47:33');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 02:47:38');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 02:58:53');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-04-20 02:58:58');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-04-20 03:02:37');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-10 08:35:38');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-10 08:39:19');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-10 08:40:39');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-10 09:34:53');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-10 10:05:07');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-10 10:29:20');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-10 11:04:17');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-10 12:47:51');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-10 14:21:01');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-10 18:29:11');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-10 22:29:01');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-10 23:37:58');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 08:54:35');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-11 08:55:58');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 08:56:05');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-11 08:56:57');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 08:56:59');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-11 08:58:30');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 08:58:32');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-11 10:22:16');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-11 10:22:19');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 10:23:39');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 12:38:09');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 13:50:04');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 15:18:03');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 18:28:58');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 22:19:37');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-11 22:21:06');
INSERT INTO `sys_logininfor` VALUES (282, 'ry', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 22:21:14');
INSERT INTO `sys_logininfor` VALUES (283, 'ry', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 22:21:22');
INSERT INTO `sys_logininfor` VALUES (284, 'ry', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-11 22:21:35');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 22:21:41');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-11 22:22:42');
INSERT INTO `sys_logininfor` VALUES (287, 'ry', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 22:22:48');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 22:24:15');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-11 22:25:18');
INSERT INTO `sys_logininfor` VALUES (290, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 22:25:26');
INSERT INTO `sys_logininfor` VALUES (291, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-11 22:25:39');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-11 22:25:43');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-12 00:07:28');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-12 00:25:49');
INSERT INTO `sys_logininfor` VALUES (295, 'ry', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-12 00:25:56');
INSERT INTO `sys_logininfor` VALUES (296, 'ry', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-12 00:41:28');
INSERT INTO `sys_logininfor` VALUES (297, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-12 00:41:34');
INSERT INTO `sys_logininfor` VALUES (298, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-12 00:41:41');
INSERT INTO `sys_logininfor` VALUES (299, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-12 00:41:48');
INSERT INTO `sys_logininfor` VALUES (300, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-12 00:41:55');
INSERT INTO `sys_logininfor` VALUES (301, 'n7186', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-12 00:42:05');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-12 01:55:28');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-12 10:23:56');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-12 10:24:10');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-12 10:24:29');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-13 13:32:57');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-13 13:33:58');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-13 13:34:04');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-13 13:52:51');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-13 14:21:00');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 10:58:56');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 11:09:19');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 12:42:01');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '::1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 12:44:59');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 12:50:07');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-14 12:52:22');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 12:53:01');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-14 12:53:08');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '172.16.214.101', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 12:53:09');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 14:10:22');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-14 14:13:06');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 14:13:11');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-14 14:13:54');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-05-14 14:14:05');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '192.168.1.92', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 19:15:58');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '192.168.1.92', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-14 19:16:09');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '192.168.1.92', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 19:16:23');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '192.168.1.92', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-14 19:16:27');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '192.168.1.92', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 19:16:38');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '192.168.1.92', '内网IP', 'Firefox 12', 'Windows 10', '0', '退出成功', '2024-05-14 19:26:41');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '192.168.1.92', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 19:26:43');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '192.168.1.92', '内网IP', 'Firefox 12', 'Windows 10', '0', '登录成功', '2024-05-14 21:36:30');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2046 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-04-10 15:46:12', 'admin', '2024-04-18 19:33:55', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-04-10 15:46:12', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-04-10 15:46:12', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '1', '', 'guide', 'admin', '2024-04-10 15:46:12', 'admin', '2024-04-11 08:08:37', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-04-10 15:46:12', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-04-10 15:46:12', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-04-10 15:46:12', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-04-10 15:46:12', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-04-10 15:46:12', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-04-10 15:46:12', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-04-10 15:46:12', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-04-10 15:46:12', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-04-10 15:46:12', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-04-10 15:46:12', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-04-10 15:46:12', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-04-10 15:46:12', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-04-10 15:46:12', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-04-10 15:46:12', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-04-10 15:46:12', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-04-10 15:46:12', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-04-10 15:46:12', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-04-10 15:46:12', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-04-10 15:46:12', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-04-10 15:46:12', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-04-10 15:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-04-10 15:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-04-10 15:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-04-10 15:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-04-10 15:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-04-10 15:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-04-10 15:46:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-04-10 15:46:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '系统语言', 1, 1, 'language', 'system/lang/index', NULL, 1, 0, 'C', '0', '0', 'system:language:list', 'language', 'admin', '2024-04-18 21:19:59', 'admin', '2024-04-18 21:43:02', '系统语言菜单');
INSERT INTO `sys_menu` VALUES (2041, '系统语言查询', 2040, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:language:query', '#', 'admin', '2024-04-18 21:19:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '系统语言新增', 2040, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:language:add', '#', 'admin', '2024-04-18 21:19:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '系统语言修改', 2040, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:language:edit', '#', 'admin', '2024-04-18 21:19:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '系统语言删除', 2040, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:language:remove', '#', 'admin', '2024-04-18 21:19:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '系统语言导出', 2040, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:language:export', '#', 'admin', '2024-04-18 21:19:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-04-10 15:46:17', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-04-10 15:46:17', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 390 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:16\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:00:18', 37);
INSERT INTO `sys_oper_log` VALUES (101, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:16\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:03:26', 97);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-04-11 08:07:46', 71);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-04-11 08:07:52', 4);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-10 14:46:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip4\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:08:23', 81);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-04-11 08:08:28', 9);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-10 14:46:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:08:32', 17);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-10 14:46:12\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:08:37', 19);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-04-11 08:08:41', 9);
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"博威尔特\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"boviet\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:13:16', 75);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"test\",\"createTime\":\"2024-04-11 07:13:16\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"博威尔特\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"boviet\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:15:44', 116);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"test\",\"createTime\":\"2024-04-11 07:13:16\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"博威尔特\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"boviet\",\"perms\":\"boviet:test:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:16:28', 115);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"test\",\"createTime\":\"2024-04-11 07:13:16\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"博威尔特\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"boviet\",\"perms\":\"boviet:test:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:17:48', 109);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:17:54', 36);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"博威尔特\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"boviet\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:18:17', 100);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"boviet/test/index\",\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"test\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"test\",\"perms\":\"boviet:test:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:19:03', 119);
INSERT INTO `sys_oper_log` VALUES (116, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"sdf\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-04-11 08:24:43', 3);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_role_dept\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:24:59', 121);
INSERT INTO `sys_oper_log` VALUES (118, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"boviet_user\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-04-11 08:28:36', 2);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:28:59', 48);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:29:17', 48);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/boviet_user', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:29:24', 55);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_user\"}', NULL, 0, NULL, '2024-04-11 08:29:38', 39);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_user\"}', NULL, 0, NULL, '2024-04-11 08:32:23', 31);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:35:07', 19);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:35:12', 48);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"BovietUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":10,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 07:35:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"Name\",\"columnId\":11,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 07:35:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"Phone Number\",\"columnId\":12,\"columnName\":\"phone_number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 07:35:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"Address\",\"columnId\":13,\"columnName\":\"address\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 07:35:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:38:56', 96);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"user\",\"className\":\"BovietUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":10,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 07:35:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 07:38:56\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"Name\",\"columnId\":11,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 07:35:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 07:38:56\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"Phone Number\",\"columnId\":12,\"columnName\":\"phone_number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 07:35:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 07:38:56\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"Address\",\"columnId\":13,\"columnName\":\"address\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 07:35:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 08:39:09', 34);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_user\"}', NULL, 0, NULL, '2024-04-11 08:39:12', 86);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/3', '172.16.214.101', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 10:09:43', 109);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '172.16.214.101', '内网IP', '{\"tables\":\"boviet_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 10:09:47', 83);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '172.16.214.101', '内网IP', '{\"businessName\":\"user\",\"className\":\"BovietUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":17,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"Name\",\"columnId\":18,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"Phone Number\",\"columnId\":19,\"columnName\":\"phone_number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"Address\",\"columnId\":20,\"columnName\":\"address\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 10:11:01', 93);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '172.16.214.101', '内网IP', '{\"tables\":\"boviet_user\"}', NULL, 0, NULL, '2024-04-11 10:11:04', 230);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '172.16.214.101', '内网IP', '{\"businessName\":\"user\",\"className\":\"BovietUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":17,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 09:11:01\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"Name\",\"columnId\":18,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 09:11:01\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"Phone Number\",\"columnId\":19,\"columnName\":\"phone_number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 09:11:01\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"Address\",\"columnId\":20,\"columnName\":\"address\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 10:14:10', 56);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '172.16.214.101', '内网IP', '{\"businessName\":\"user\",\"className\":\"BovietUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":17,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 09:14:10\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"Name\",\"columnId\":18,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 09:14:10\",\"usableColumn\":false},{\"capJavaField\":\"PhoneNumber\",\"columnComment\":\"Phone Number\",\"columnId\":19,\"columnName\":\"phone_number\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phoneNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 09:14:10\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"Address\",\"columnId\":20,\"columnName\":\"address\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 09:09:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 10:14:19', 36);
INSERT INTO `sys_oper_log` VALUES (135, 'User', 1, 'com.ruoyi.web.controller.boviet.BovietUserController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/user', '172.16.214.101', '内网IP', '{\"address\":\"wer\",\"deletetime\":\"2024-04-10\",\"name\":\"sdfsd\",\"params\":{},\"phoneNumber\":\"werwe\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\998.My Project\\01.Code\\03.Java\\01.Ruoyi-vue\\ruoyi-system\\target\\classes\\mapper\\system\\BovietUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.BovietUserMapper.insertBovietUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into boviet_user          ( name,             phone_number,             address,                                       deletetime )           values ( ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2024-04-11 10:19:33', 60);
INSERT INTO `sys_oper_log` VALUES (136, 'User', 1, 'com.ruoyi.web.controller.boviet.BovietUserController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/user', '172.16.214.101', '内网IP', '{\"address\":\"123\",\"createtime\":\"2024-04-01\",\"deletetime\":\"2024-04-24\",\"name\":\"123\",\"params\":{},\"phoneNumber\":\"123\",\"updatetime\":\"2024-04-02\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\998.My Project\\01.Code\\03.Java\\01.Ruoyi-vue\\ruoyi-system\\target\\classes\\mapper\\system\\BovietUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.BovietUserMapper.insertBovietUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into boviet_user          ( name,             phone_number,             address,             createtime,             updatetime,             deletetime )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2024-04-11 10:25:57', 59);
INSERT INTO `sys_oper_log` VALUES (137, 'User', 1, 'com.ruoyi.web.controller.boviet.BovietUserController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/user', '172.16.214.101', '内网IP', '{\"address\":\"123\",\"createtime\":\"2024-04-01\",\"deletetime\":\"2024-04-24\",\"name\":\"123\",\"params\":{},\"phoneNumber\":\"123\",\"updatetime\":\"2024-04-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 10:26:30', 13);
INSERT INTO `sys_oper_log` VALUES (138, 'User', 1, 'com.ruoyi.web.controller.boviet.BovietUserController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/user', '172.16.214.101', '内网IP', '{\"address\":\"234\",\"name\":\"wer\",\"params\":{},\"phoneNumber\":\"234\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 10:31:11', 23);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"department,company\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:04:09', 92);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_notice\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:04:59', 64);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:05:25', 44);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/department', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:05:29', 36);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:07:02', 43);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:07:04', 28);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_company\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:07:13', 35);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_department\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:08:52', 33);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"company\",\"className\":\"BovietCompany\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CompanyName\",\"columnId\":42,\"columnName\":\"company_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CompanyDesc\",\"columnId\":43,\"columnName\":\"company_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":false,\"functionAuthor\":\"ruoyi\",\"functionName\":\"公式\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"boviet\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\"}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"treeCode\":\"id\"},\"sub\":true,\"subTableFkName\":\"company_id\",\"subTableName\":\"boviet_department\",\"tableComment\":\"公式\",\"tableId\":8,\"tableName\":\"boviet_company\",\"tplCategory\":\"sub\",\"tplWebType\":\"element-ui\",\"tree\":fal', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:10:19', 66);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/boviet_company', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:10:26', 43);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_company\"}', NULL, 0, NULL, '2024-04-11 11:10:28', 271);
INSERT INTO `sys_oper_log` VALUES (150, '公式', 1, 'com.ruoyi.web.controller.boviet.BovietCompanyController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/company', '127.0.0.1', '内网IP', '{\"bovietDepartmentList\":[{\"companyId\":1,\"deptDesc\":\"qwe\",\"deptName\":\"qwe\",\"params\":{}}],\"companyDesc\":\"qwe\",\"companyName\":\"asd\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:14:46', 48);
INSERT INTO `sys_oper_log` VALUES (151, '公式', 2, 'com.ruoyi.web.controller.boviet.BovietCompanyController.edit()', 'PUT', 1, 'admin', '研发部门', '/boviet/company', '127.0.0.1', '内网IP', '{\"bovietDepartmentList\":[{\"companyId\":1,\"deptDesc\":\"qwe111\",\"deptName\":\"qwe222\",\"id\":1,\"params\":{}}],\"companyDesc\":\"qwe\",\"companyName\":\"asd\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:15:22', 23);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"company\",\"className\":\"BovietCompany\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:10:26\",\"usableColumn\":false},{\"capJavaField\":\"CompanyName\",\"columnComment\":\"Company Name\",\"columnId\":42,\"columnName\":\"company_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:10:26\",\"usableColumn\":false},{\"capJavaField\":\"CompanyDesc\",\"columnComment\":\"Company Desc\",\"columnId\":43,\"columnName\":\"company_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:10:26\",\"usableColumn\":false}],\"crud\":false,\"functionAuthor\":\"ruoyi\",\"functionName\":\"公式\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"boviet\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\"}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"treeCode\":\"id\"},\"sub\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:16:41', 49);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"BovietDepartment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":44,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptName\",\"columnComment\":\"Department Name\",\"columnId\":45,\"columnName\":\"dept_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptDesc\",\"columnComment\":\"Department Desc\",\"columnId\":46,\"columnName\":\"dept_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"Company Id\",\"columnId\":47,\"columnName\":\"company_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:17:31', 83);
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"BovietDepartment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":44,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:17:31\",\"usableColumn\":false},{\"capJavaField\":\"DeptName\",\"columnComment\":\"Department Name\",\"columnId\":45,\"columnName\":\"dept_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:17:31\",\"usableColumn\":false},{\"capJavaField\":\"DeptDesc\",\"columnComment\":\"Department Desc\",\"columnId\":46,\"columnName\":\"dept_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:17:31\",\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"Company Id\",\"columnId\":47,\"columnName\":\"company_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"in', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:19:06', 73);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"company\",\"className\":\"BovietCompany\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:16:41\",\"usableColumn\":false},{\"capJavaField\":\"CompanyName\",\"columnComment\":\"Company Name\",\"columnId\":42,\"columnName\":\"company_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:16:41\",\"usableColumn\":false},{\"capJavaField\":\"CompanyDesc\",\"columnComment\":\"Company Desc\",\"columnId\":43,\"columnName\":\"company_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:16:41\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"公式\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"boviet\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\"}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"treeCode\":\"id\"},\"sub\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:19:17', 49);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/boviet_company', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:19:21', 53);
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/boviet_department', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:19:27', 55);
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_company\"}', NULL, 0, NULL, '2024-04-11 11:19:50', 176);
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_department\"}', NULL, 0, NULL, '2024-04-11 11:19:52', 61);
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"BovietDepartment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":44,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:19:27\",\"usableColumn\":false},{\"capJavaField\":\"DeptName\",\"columnComment\":\"Department Name\",\"columnId\":45,\"columnName\":\"dept_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:19:27\",\"usableColumn\":false},{\"capJavaField\":\"DeptDesc\",\"columnComment\":\"Department Desc\",\"columnId\":46,\"columnName\":\"dept_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:19:27\",\"usableColumn\":false},{\"capJavaField\":\"CompanyId\",\"columnComment\":\"Company Id\",\"columnId\":47,\"columnName\":\"company_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"in', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:21:55', 111);
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"company\",\"className\":\"BovietCompany\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"Id\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:19:21\",\"usableColumn\":false},{\"capJavaField\":\"CompanyName\",\"columnComment\":\"Company Name\",\"columnId\":42,\"columnName\":\"company_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:19:21\",\"usableColumn\":false},{\"capJavaField\":\"CompanyDesc\",\"columnComment\":\"Company Desc\",\"columnId\":43,\"columnName\":\"company_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-11 10:07:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"companyDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-04-11 10:19:21\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"公式\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"boviet\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\",\\\"parentMenuId\\\":2001}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 11:22:21', 86);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_company\"}', NULL, 0, NULL, '2024-04-11 11:22:24', 30);
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"boviet_department\"}', NULL, 0, NULL, '2024-04-11 11:22:25', 41);
INSERT INTO `sys_oper_log` VALUES (164, '公式', 3, 'com.ruoyi.web.controller.boviet.BovietCompanyController.remove()', 'DELETE', 1, 'admin', '研发部门', '/boviet/company/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 12:50:55', 19);
INSERT INTO `sys_oper_log` VALUES (165, '公式', 1, 'com.ruoyi.web.controller.boviet.BovietCompanyController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/company', '127.0.0.1', '内网IP', '{\"companyDesc\":\"Công ty TNHH khoa học năng lượng mặt trời Boviet Solar\",\"companyName\":\"Boviet Solar\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 12:51:44', 13);
INSERT INTO `sys_oper_log` VALUES (166, '公式', 1, 'com.ruoyi.web.controller.boviet.BovietCompanyController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/company', '127.0.0.1', '内网IP', '{\"companyDesc\":\"Công ty TNHH Italisa\",\"companyName\":\"Italisa\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 12:52:09', 9);
INSERT INTO `sys_oper_log` VALUES (167, '部门', 2, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/boviet/department', '172.16.214.101', '内网IP', '{\"bovietCompanyList\":[],\"companyId\":2,\"deptDesc\":\"qwe111\",\"deptName\":\"qwe222\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 12:59:17', 28);
INSERT INTO `sys_oper_log` VALUES (168, '部门', 1, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/department', '172.16.214.101', '内网IP', '{\"bovietCompanyList\":[{\"companyDesc\":\"2\",\"companyName\":\"2\",\"id\":2,\"params\":{}}],\"companyId\":2,\"deptDesc\":\"wer\",\"deptName\":\"ewrer\",\"id\":2,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\998.My Project\\01.Code\\03.Java\\01.Ruoyi-vue\\ruoyi-system\\target\\classes\\mapper\\system\\BovietDepartmentMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into boviet_company( id, company_name, company_desc) values                  ( ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'PRIMARY\'\n; Duplicate entry \'2\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'PRIMARY\'', '2024-04-11 13:01:18', 60);
INSERT INTO `sys_oper_log` VALUES (169, '部门', 1, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/department', '172.16.214.101', '内网IP', '{\"bovietCompanyList\":[{\"companyDesc\":\"2\",\"companyName\":\"2\",\"id\":3,\"params\":{}}],\"companyId\":3,\"deptDesc\":\"wer\",\"deptName\":\"ewrer\",\"id\":3,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\998.My Project\\01.Code\\03.Java\\01.Ruoyi-vue\\ruoyi-system\\target\\classes\\mapper\\system\\BovietDepartmentMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into boviet_company( id, company_name, company_desc) values                  ( ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3\' for key \'PRIMARY\'\n; Duplicate entry \'3\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3\' for key \'PRIMARY\'', '2024-04-11 13:01:22', 13);
INSERT INTO `sys_oper_log` VALUES (170, '部门', 1, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/department', '172.16.214.101', '内网IP', '{\"bovietCompanyList\":[],\"companyId\":3,\"deptDesc\":\"wer\",\"deptName\":\"ewrer\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 13:01:40', 15);
INSERT INTO `sys_oper_log` VALUES (171, '部门', 2, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/boviet/department', '172.16.214.101', '内网IP', '{\"bovietCompanyList\":[],\"companyId\":3,\"deptDesc\":\"wer\",\"deptName\":\"ewrer\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 13:01:54', 5);
INSERT INTO `sys_oper_log` VALUES (172, '部门', 2, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/boviet/department', '172.16.214.101', '内网IP', '{\"bovietCompanyList\":[],\"companyId\":32,\"deptDesc\":\"wer\",\"deptName\":\"ewrer\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 13:02:00', 11);
INSERT INTO `sys_oper_log` VALUES (173, '部门', 2, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/boviet/department', '127.0.0.1', '内网IP', '{\"bovietCompanyList\":[{\"companyDesc\":\"324\",\"companyName\":\"32\",\"id\":1,\"params\":{}}],\"companyId\":2,\"deptDesc\":\"qwe111\",\"deptName\":\"qwe222\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 13:15:24', 23);
INSERT INTO `sys_oper_log` VALUES (174, '部门', 1, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.add()', 'POST', 1, 'admin', '研发部门', '/boviet/department', '127.0.0.1', '内网IP', '{\"bovietCompanyList\":[{\"companyDesc\":\"23423\",\"companyName\":\"erwerw\",\"id\":5,\"params\":{}}],\"companyId\":234,\"deptDesc\":\"234\",\"deptName\":\"234\",\"id\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-11 13:15:41', 25);
INSERT INTO `sys_oper_log` VALUES (175, '部门', 2, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/boviet/department', '127.0.0.1', '内网IP', '{\"bovietCompanyList\":[{\"companyDesc\":\"324\",\"companyName\":\"32\",\"id\":1,\"params\":{}}],\"companyId\":2,\"deptDesc\":\"qwe111\",\"deptName\":\"qwe222\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-16 08:42:02', 55);
INSERT INTO `sys_oper_log` VALUES (176, '部门', 2, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/boviet/department', '127.0.0.1', '内网IP', '{\"bovietCompanyList\":[],\"companyId\":32,\"deptDesc\":\"wer\",\"deptName\":\"ewrer\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-16 08:42:09', 9);
INSERT INTO `sys_oper_log` VALUES (177, '部门', 2, 'com.ruoyi.web.controller.boviet.BovietDepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/boviet/department', '127.0.0.1', '内网IP', '{\"bovietCompanyList\":[{\"companyDesc\":\"324\",\"companyName\":\"32\",\"id\":1,\"params\":{}}],\"companyId\":2,\"deptDesc\":\"qwe111\",\"deptName\":\"qwe222\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-16 08:42:12', 28);
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 12:13:15', 41);
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 12:13:35', 117);
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"status\":\"1\",\"userId\":1}', NULL, 1, '不允许操作超级管理员用户', '2024-04-18 12:23:02', 16);
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 12:23:12', 63);
INSERT INTO `sys_oper_log` VALUES (182, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"userId\":1}', NULL, 1, '不允许操作超级管理员用户', '2024-04-18 12:24:39', 0);
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 12:25:41', 19874);
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 12:26:02', 110);
INSERT INTO `sys_oper_log` VALUES (185, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 12:26:22', 115);
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"zh-CN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 12:26:36', 21);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"{\\\"menuNameZh\\\":\\\"werew\\\",\\\"menuNameEn\\\":\\\"34234\\\",\\\"menuNameVi\\\":\\\"fffff\\\"}\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"fdsf\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 12:43:57', 137);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-18 11:43:57\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2039,\"menuName\":\"{\\\"menuNameZh\\\":\\\"zh\\\",\\\"menuNameEn\\\":\\\"en\\\",\\\"menuNameVi\\\":\\\"vi\\\"}\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"fdsf\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 13:35:49', 67);
INSERT INTO `sys_oper_log` VALUES (189, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 13:35:56', 35);
INSERT INTO `sys_oper_log` VALUES (190, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 13:36:02', 26);
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 13:48:17', 83);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 13:48:35', 69);
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 13:53:09', 67);
INSERT INTO `sys_oper_log` VALUES (194, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 14:29:42', 69);
INSERT INTO `sys_oper_log` VALUES (195, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 14:32:03', 58);
INSERT INTO `sys_oper_log` VALUES (196, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 14:32:13', 38);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-18 11:43:57\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2039,\"menuName\":\"{\\\"menuNameZh\\\":\\\"zhxxx\\\",\\\"menuNameEn\\\":\\\"en\\\",\\\"menuNameVi\\\":\\\"vi\\\"}\",\"menuNameEn\":\"en\",\"menuNameVi\":\"vi\",\"menuNameZh\":\"zhxxx\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"fdsf\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 14:43:33', 39);
INSERT INTO `sys_oper_log` VALUES (198, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"zh-CN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 14:43:37', 33);
INSERT INTO `sys_oper_log` VALUES (199, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 15:08:09', 135);
INSERT INTO `sys_oper_log` VALUES (200, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 15:08:24', 37);
INSERT INTO `sys_oper_log` VALUES (201, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 19:11:43', 77);
INSERT INTO `sys_oper_log` VALUES (202, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"zh-CN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 19:32:52', 173);
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-04-10 14:46:12\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"{\\\"menuNameZh\\\":\\\"系统管理\\\",\\\"menuNameEn\\\":\\\"System Management\\\",\\\"menuNameVi\\\":\\\"Quản lý hệ thống\\\"}\",\"menuNameEn\":\"System Management\",\"menuNameVi\":\"Quản lý hệ thống\",\"menuNameZh\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 19:33:55', 37);
INSERT INTO `sys_oper_log` VALUES (204, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 19:34:04', 30);
INSERT INTO `sys_oper_log` VALUES (205, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 19:34:07', 24);
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2039', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 19:34:17', 81);
INSERT INTO `sys_oper_log` VALUES (207, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 19:34:48', 68);
INSERT INTO `sys_oper_log` VALUES (208, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_language\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 21:15:57', 151);
INSERT INTO `sys_oper_log` VALUES (209, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 21:16:02', 31);
INSERT INTO `sys_oper_log` VALUES (210, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 21:16:04', 30);
INSERT INTO `sys_oper_log` VALUES (211, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 21:16:06', 36);
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_language', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 21:17:08', 50);
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_language', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 21:18:39', 78);
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"language\",\"className\":\"SysLanguage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":48,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18 20:15:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-18 20:18:39\",\"usableColumn\":false},{\"capJavaField\":\"MenuId\",\"columnComment\":\"Menu ID\",\"columnId\":49,\"columnName\":\"menu_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18 20:15:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"menuId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-18 20:18:39\",\"usableColumn\":false},{\"capJavaField\":\"LangZh\",\"columnComment\":\"中文\",\"columnId\":50,\"columnName\":\"lang_zh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18 20:15:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"langZh\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-18 20:18:39\",\"usableColumn\":false},{\"capJavaField\":\"LangEn\",\"columnComment\":\"English\",\"columnId\":51,\"columnName\":\"lang_en\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18 20:15:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 21:19:36', 79);
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_language\"}', NULL, 0, NULL, '2024-04-18 21:19:39', 86);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/lang/index\",\"createTime\":\"2024-04-18 20:19:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"系统语言\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"language\",\"perms\":\"system:language:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 21:42:54', 43);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/lang/index\",\"createTime\":\"2024-04-18 20:19:59\",\"icon\":\"language\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"系统语言\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"language\",\"perms\":\"system:language:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 21:43:02', 36);
INSERT INTO `sys_oper_log` VALUES (218, '系统语言', 5, 'com.ruoyi.web.controller.system.SysLanguageController.export()', 'POST', 1, 'admin', '研发部门', '/system/language/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-04-18 21:43:59', 1050);
INSERT INTO `sys_oper_log` VALUES (219, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 22:03:57', 63);
INSERT INTO `sys_oper_log` VALUES (220, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 22:04:26', 53);
INSERT INTO `sys_oper_log` VALUES (221, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-18 23:01:02', 42);
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_language', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 07:43:20', 160);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_language', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 07:43:54', 110);
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"lang\",\"className\":\"SysLanguage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":48,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18 20:15:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-19 06:43:54\",\"usableColumn\":false},{\"capJavaField\":\"LangKey\",\"columnComment\":\"Key word\",\"columnId\":53,\"columnName\":\"lang_key\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2024-04-19 06:43:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"langKey\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-19 06:43:54\",\"usableColumn\":false},{\"capJavaField\":\"LangType\",\"columnComment\":\"Type\",\"columnId\":54,\"columnName\":\"lang_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"createTime\":\"2024-04-19 06:43:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"langType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-19 06:43:54\",\"usableColumn\":false},{\"capJavaField\":\"LangZh\",\"columnComment\":\"中文\",\"columnId\":50,\"columnName\":\"lang_zh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18 20:15:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 07:45:19', 70);
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_language\"}', NULL, 0, NULL, '2024-04-19 07:45:22', 89);
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_language', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 09:43:34', 99);
INSERT INTO `sys_oper_log` VALUES (227, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 10:47:36', 70);
INSERT INTO `sys_oper_log` VALUES (228, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 10:47:45', 18);
INSERT INTO `sys_oper_log` VALUES (229, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 12:33:45', 87);
INSERT INTO `sys_oper_log` VALUES (230, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 12:33:51', 20);
INSERT INTO `sys_oper_log` VALUES (231, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"id\":1,\"langEn\":\"en: 系统管理\",\"langType\":\"Menu\",\"langVi\":\"vi: 系统管理\",\"langZh\":\"xx系统管理\",\"menuId\":1,\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-04-19 13:21:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 13:21:29', 40);
INSERT INTO `sys_oper_log` VALUES (232, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:08:23', 59);
INSERT INTO `sys_oper_log` VALUES (233, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:08:51', 29);
INSERT INTO `sys_oper_log` VALUES (234, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-19 15:38:54\",\"id\":86,\"langEn\":\"xxxx\",\"langType\":\"Menu\",\"langVi\":\"yyy\",\"langZh\":\"test\",\"menuId\":2040,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:38:54', 23);
INSERT INTO `sys_oper_log` VALUES (235, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:39:06', 87);
INSERT INTO `sys_oper_log` VALUES (236, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"zh-CN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:39:18', 60);
INSERT INTO `sys_oper_log` VALUES (237, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:39:54', 73);
INSERT INTO `sys_oper_log` VALUES (238, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:40:07', 76);
INSERT INTO `sys_oper_log` VALUES (239, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:41:43', 130);
INSERT INTO `sys_oper_log` VALUES (240, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":1,\"langEn\":\"en: 系统管理\",\"langType\":\"Menu\",\"langVi\":\"vi: 系统管理\",\"langZh\":\"系统管理\",\"menuId\":1,\"params\":{},\"remark\":\"系统管理目录\",\"sysMenu\":{\"children\":[],\"menuId\":1,\"menuName\":\"系统管理\",\"params\":{}},\"updateBy\":\"admin\",\"updateTime\":\"2024-04-19 15:48:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:48:13', 26);
INSERT INTO `sys_oper_log` VALUES (241, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"zh-CN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:48:27', 63);
INSERT INTO `sys_oper_log` VALUES (242, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-19 15:50:52\",\"id\":87,\"langType\":\"Menu\",\"menuId\":2041,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:50:52', 39);
INSERT INTO `sys_oper_log` VALUES (243, '系统语言', 3, 'com.ruoyi.web.controller.system.SysLanguageController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/lang/87', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 15:51:04', 10);
INSERT INTO `sys_oper_log` VALUES (244, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-19 15:53:18\",\"langType\":\"Menu\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'menu_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\998.My Project\\01.Code\\03.Java\\01.Ruoyi-vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysLanguageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysLanguageMapper.insertSysLanguage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_language          ( lang_type,                                                                              create_time )           values ( ?,                                                                              ? )\r\n### Cause: java.sql.SQLException: Field \'menu_id\' doesn\'t have a default value\n; Field \'menu_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'menu_id\' doesn\'t have a default value', '2024-04-19 15:53:18', 328);
INSERT INTO `sys_oper_log` VALUES (245, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-19 15:58:55\",\"langEn\":\"qwe\",\"langKey\":\"qwe\",\"langType\":\"Page\",\"langVi\":\"qwe\",\"langZh\":\"qwe\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'menu_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\998.My Project\\01.Code\\03.Java\\01.Ruoyi-vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysLanguageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysLanguageMapper.insertSysLanguage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_language          ( lang_key,             lang_type,             lang_zh,             lang_en,             lang_vi,                                       create_time )           values ( ?,             ?,             ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'menu_id\' doesn\'t have a default value\n; Field \'menu_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'menu_id\' doesn\'t have a default value', '2024-04-19 15:58:55', 4);
INSERT INTO `sys_oper_log` VALUES (246, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-19 16:00:34\",\"id\":88,\"langEn\":\"wer\",\"langKey\":\"wer\",\"langType\":\"Page\",\"langVi\":\"wer\",\"langZh\":\"wer\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 16:00:34', 360);
INSERT INTO `sys_oper_log` VALUES (247, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":88,\"langEn\":\"Login\",\"langKey\":\"btnLogin\",\"langType\":\"Page\",\"langVi\":\"Đăng nhập\",\"langZh\":\"登录\",\"params\":{},\"updateTime\":\"2024-04-19 16:01:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 16:01:07', 7);
INSERT INTO `sys_oper_log` VALUES (248, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-19 16:01:28\",\"id\":89,\"langType\":\"Menu\",\"langZh\":\"btnLogin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 16:01:28', 17);
INSERT INTO `sys_oper_log` VALUES (249, '系统语言', 3, 'com.ruoyi.web.controller.system.SysLanguageController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/lang/89', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 16:01:33', 10);
INSERT INTO `sys_oper_log` VALUES (250, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-19 16:01:41\",\"langKey\":\"btnLogin\",\"langType\":\"Page\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'btnLogin\' for key \'idx_lang\'\r\n### The error may exist in file [D:\\998.My Project\\01.Code\\03.Java\\01.Ruoyi-vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysLanguageMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysLanguageMapper.insertSysLanguage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_language          ( lang_key,             lang_type,                                                                              create_time )           values ( ?,             ?,                                                                              ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'btnLogin\' for key \'idx_lang\'\n; Duplicate entry \'btnLogin\' for key \'idx_lang\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'btnLogin\' for key \'idx_lang\'', '2024-04-19 16:01:41', 6);
INSERT INTO `sys_oper_log` VALUES (251, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-04-19 16:27:45\",\"id\":90,\"langEn\":\"Add\",\"langKey\":\"btnAdd\",\"langType\":\"Page\",\"langVi\":\"Thêm mới\",\"langZh\":\"新增\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-19 16:27:45', 44);
INSERT INTO `sys_oper_log` VALUES (252, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-20 01:13:06', 42);
INSERT INTO `sys_oper_log` VALUES (253, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":88,\"langEn\":\"Login\",\"langKey\":\"Login\",\"langType\":\"Page\",\"langVi\":\"Đăng nhập\",\"langZh\":\"登录\",\"params\":{},\"updateTime\":\"2024-04-20 02:22:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-20 02:22:56', 18);
INSERT INTO `sys_oper_log` VALUES (254, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-20 02:28:56', 128);
INSERT INTO `sys_oper_log` VALUES (255, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"zh-CN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-20 02:29:00', 29);
INSERT INTO `sys_oper_log` VALUES (256, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-20 02:32:32', 123);
INSERT INTO `sys_oper_log` VALUES (257, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":90,\"langEn\":\"Add\",\"langKey\":\"Add\",\"langType\":\"Page\",\"langVi\":\"Thêm mới\",\"langZh\":\"新增\",\"params\":{},\"updateTime\":\"2024-04-20 03:02:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-20 03:02:57', 22);
INSERT INTO `sys_oper_log` VALUES (258, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-20 03:03:44', 54);
INSERT INTO `sys_oper_log` VALUES (259, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-20 03:03:49', 22);
INSERT INTO `sys_oper_log` VALUES (260, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"zh-CN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-20 03:04:21', 69);
INSERT INTO `sys_oper_log` VALUES (261, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 08:35:53', 56);
INSERT INTO `sys_oper_log` VALUES (262, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 08:38:16\",\"id\":91,\"langEn\":\"rememberMe\",\"langKey\":\"rememberMe\",\"langType\":\"Page\",\"langVi\":\"Lưu đăng nhập\",\"langZh\":\"rememberMe\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 08:38:16', 72);
INSERT INTO `sys_oper_log` VALUES (263, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":91,\"langEn\":\"rememberMe\",\"langKey\":\"rememberMe\",\"langType\":\"Page\",\"langVi\":\"Lưu đăng nhập\",\"langZh\":\"记住登录\",\"params\":{},\"updateTime\":\"2024-05-10 08:39:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 08:39:16', 11);
INSERT INTO `sys_oper_log` VALUES (264, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/05/10/avatar_man_icon_20240510101816A001.png\",\"code\":200}', 0, NULL, '2024-05-10 10:18:16', 145);
INSERT INTO `sys_oper_log` VALUES (265, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"vanquyen.tran@bowayalloy.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"0389359449\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 10:27:34', 118);
INSERT INTO `sys_oper_log` VALUES (266, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"vanquyen.tran@bowayalloy.com\",\"nickName\":\"陈文权_Trần Văn Quyền\",\"params\":{},\"phonenumber\":\"0389359449\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 10:28:04', 36);
INSERT INTO `sys_oper_log` VALUES (267, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 11:07:15\",\"id\":92,\"langEn\":\"Theme\",\"langKey\":\"theme\",\"langType\":\"Page\",\"langVi\":\"Giao diện\",\"langZh\":\"Theme\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 11:07:15', 15);
INSERT INTO `sys_oper_log` VALUES (268, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 11:07:19', 50);
INSERT INTO `sys_oper_log` VALUES (269, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 11:07:23', 27);
INSERT INTO `sys_oper_log` VALUES (270, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-18 20:19:59\",\"id\":86,\"langEn\":\"Language\",\"langType\":\"Menu\",\"langVi\":\"Ngôn ngữ\",\"langZh\":\"语言\",\"menuId\":2040,\"params\":{},\"remark\":\"系统语言菜单\",\"sysMenu\":{\"children\":[],\"menuId\":2040,\"menuName\":\"系统语言\",\"params\":{}},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-10 11:11:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 11:11:09', 23);
INSERT INTO `sys_oper_log` VALUES (271, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 11:28:06\",\"id\":93,\"langEn\":\"Submit\",\"langKey\":\"btnSubmit\",\"langType\":\"Page\",\"langVi\":\"Submit\",\"langZh\":\"搜索\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 11:28:06', 50);
INSERT INTO `sys_oper_log` VALUES (272, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 11:28:24\",\"id\":94,\"langEn\":\"Reset\",\"langKey\":\"btnReset\",\"langType\":\"Page\",\"langVi\":\"Reset\",\"langZh\":\"重置\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 11:28:24', 11);
INSERT INTO `sys_oper_log` VALUES (273, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":93,\"langEn\":\"Submit\",\"langKey\":\"btnSearch\",\"langType\":\"Page\",\"langVi\":\"Tìm kiếm\",\"langZh\":\"搜索\",\"params\":{},\"updateTime\":\"2024-05-10 11:30:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 11:30:09', 8);
INSERT INTO `sys_oper_log` VALUES (274, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":94,\"langEn\":\"Reset\",\"langKey\":\"btnReset\",\"langType\":\"Page\",\"langVi\":\"Làm mới\",\"langZh\":\"重置\",\"params\":{},\"updateTime\":\"2024-05-10 11:30:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 11:30:17', 13);
INSERT INTO `sys_oper_log` VALUES (275, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_menu\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 13:06:16', 443);
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_menu', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 13:07:53', 191);
INSERT INTO `sys_oper_log` VALUES (277, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/sys_menu', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 13:08:14', 198);
INSERT INTO `sys_oper_log` VALUES (278, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 16:02:10', 156);
INSERT INTO `sys_oper_log` VALUES (279, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 16:24:18\",\"id\":95,\"langEn\":\"Export\",\"langKey\":\"btnExport\",\"langType\":\"Page\",\"langVi\":\"Export\",\"langZh\":\"导出\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 16:24:18', 51);
INSERT INTO `sys_oper_log` VALUES (280, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 18:40:14\",\"id\":96,\"langEn\":\"Keywords\",\"langKey\":\"lbl.lang.langKey\",\"langType\":\"Page\",\"langVi\":\"Từ khoá\",\"langZh\":\"关键字\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 18:40:15', 24);
INSERT INTO `sys_oper_log` VALUES (281, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"zh-CN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 18:40:53', 116);
INSERT INTO `sys_oper_log` VALUES (282, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 18:41:07', 37);
INSERT INTO `sys_oper_log` VALUES (283, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"zh-CN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 18:48:34', 90);
INSERT INTO `sys_oper_log` VALUES (284, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 18:48:39', 32);
INSERT INTO `sys_oper_log` VALUES (285, '系统语言', 5, 'com.ruoyi.web.controller.system.SysLanguageController.export()', 'POST', 1, 'admin', '研发部门', '/system/lang/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-05-10 18:50:53', 918);
INSERT INTO `sys_oper_log` VALUES (286, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:04:37\",\"id\":97,\"langEn\":\"1\",\"langKey\":\"2`\",\"langType\":\"Page\",\"langVi\":\"1\",\"langZh\":\"q\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:04:37', 20);
INSERT INTO `sys_oper_log` VALUES (287, '系统语言', 3, 'com.ruoyi.web.controller.system.SysLanguageController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/lang/97', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:04:43', 19);
INSERT INTO `sys_oper_log` VALUES (288, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":90,\"langEn\":\"Add\",\"langKey\":\"btnAdd\",\"langType\":\"Page\",\"langVi\":\"Thêm mới\",\"langZh\":\"新增\",\"params\":{},\"updateTime\":\"2024-05-10 19:05:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:05:10', 10);
INSERT INTO `sys_oper_log` VALUES (289, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:12:02', 112);
INSERT INTO `sys_oper_log` VALUES (290, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:15:23\",\"id\":98,\"langEn\":\"Type\",\"langKey\":\"lbl.lang.langType\",\"langType\":\"Page\",\"langVi\":\"Loại\",\"langZh\":\"类型\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:15:23', 12);
INSERT INTO `sys_oper_log` VALUES (291, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:16:05\",\"id\":99,\"langEn\":\"English\",\"langKey\":\"lbl.lang.langZh\",\"langType\":\"Page\",\"langVi\":\"Tiếng việt\",\"langZh\":\"中文\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:16:05', 10);
INSERT INTO `sys_oper_log` VALUES (292, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":99,\"langEn\":\"Chinese\",\"langKey\":\"lbl.lang.langZh\",\"langType\":\"Page\",\"langVi\":\"Tiếng trung\",\"langZh\":\"中文\",\"params\":{},\"updateTime\":\"2024-05-10 19:16:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:16:41', 19);
INSERT INTO `sys_oper_log` VALUES (293, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:17:28\",\"id\":100,\"langEn\":\"English\",\"langKey\":\"lbl.lang.langEn\",\"langType\":\"Page\",\"langVi\":\"Tiếng Anh\",\"langZh\":\"英语\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:17:28', 10);
INSERT INTO `sys_oper_log` VALUES (294, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":99,\"langEn\":\"Chinese\",\"langKey\":\"lbl.lang.langZh\",\"langType\":\"Page\",\"langVi\":\"Tiếng Trung\",\"langZh\":\"中文\",\"params\":{},\"updateTime\":\"2024-05-10 19:17:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:17:34', 11);
INSERT INTO `sys_oper_log` VALUES (295, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:18:12\",\"id\":101,\"langEn\":\"Vietnamese\",\"langKey\":\"lbl.lang.langVi\",\"langType\":\"Page\",\"langVi\":\"Tiếng Việt\",\"langZh\":\"越语\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:18:12', 9);
INSERT INTO `sys_oper_log` VALUES (296, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:20:06\",\"id\":102,\"langEn\":\"Remark\",\"langKey\":\"lbl.lang.remark\",\"langType\":\"Page\",\"langVi\":\"Ghi chú\",\"langZh\":\"备注\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:20:06', 10);
INSERT INTO `sys_oper_log` VALUES (297, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:21:12\",\"id\":103,\"langEn\":\"Add new\",\"langKey\":\"titleAddForm\",\"langType\":\"Page\",\"langVi\":\"Thêm mới\",\"langZh\":\"添加\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:21:12', 11);
INSERT INTO `sys_oper_log` VALUES (298, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:21:55\",\"id\":104,\"langEn\":\"Edit\",\"langKey\":\"titleEditForm\",\"langType\":\"Page\",\"langVi\":\"Chỉnh sửa\",\"langZh\":\"修改\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:21:55', 11);
INSERT INTO `sys_oper_log` VALUES (299, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:22:15\",\"id\":105,\"langEn\":\"Edit\",\"langKey\":\"btnEdit\",\"langType\":\"Page\",\"langVi\":\"Chỉnh sửa\",\"langZh\":\"修改\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:22:15', 10);
INSERT INTO `sys_oper_log` VALUES (300, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:22:48\",\"id\":106,\"langEn\":\"Delete\",\"langKey\":\"btnRemove\",\"langType\":\"Page\",\"langVi\":\"Xoá\",\"langZh\":\"删除\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:22:48', 11);
INSERT INTO `sys_oper_log` VALUES (301, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:25:26\",\"id\":107,\"langEn\":\"Submit\",\"langKey\":\"formSubmit\",\"langType\":\"Page\",\"langVi\":\"Đồng ý\",\"langZh\":\"确定\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:25:26', 51);
INSERT INTO `sys_oper_log` VALUES (302, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 19:25:49\",\"id\":108,\"langEn\":\"Cancel\",\"langKey\":\"formCancel\",\"langType\":\"Page\",\"langVi\":\"Huỷ bỏ\",\"langZh\":\"取消\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:25:49', 17);
INSERT INTO `sys_oper_log` VALUES (303, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 19:26:05', 32);
INSERT INTO `sys_oper_log` VALUES (304, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-10 23:50:15\",\"id\":110,\"langEn\":\"Please select dictionary generation\",\"langKey\":\"dictGeneration\",\"langType\":\"Page\",\"langVi\":\"Vui lòng chọn tạo từ điển\",\"langZh\":\"请选择字典生成\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 23:50:15', 25);
INSERT INTO `sys_oper_log` VALUES (305, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"lang\",\"className\":\"SysLanguage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":48,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18 20:15:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-19 08:43:34\",\"usableColumn\":false},{\"capJavaField\":\"LangKey\",\"columnComment\":\"Key word\",\"columnId\":53,\"columnName\":\"lang_key\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2024-04-19 06:43:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"langKey\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-19 08:43:34\",\"usableColumn\":false},{\"capJavaField\":\"LangType\",\"columnComment\":\"Type\",\"columnId\":54,\"columnName\":\"lang_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"createTime\":\"2024-04-19 06:43:20\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"langType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-19 08:43:34\",\"usableColumn\":false},{\"capJavaField\":\"LangZh\",\"columnComment\":\"中文\",\"columnId\":50,\"columnName\":\"lang_zh\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-18 20:15:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 00:00:37', 110);
INSERT INTO `sys_oper_log` VALUES (306, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 00:12:36\",\"id\":111,\"langEn\":\"Menu Id\",\"langKey\":\"lbl.lang.menuId\",\"langType\":\"Page\",\"langVi\":\"Menu Id\",\"langZh\":\"Menu Id\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 00:12:36', 18);
INSERT INTO `sys_oper_log` VALUES (307, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 00:13:16\",\"id\":112,\"langEn\":\"asd\",\"langKey\":\"plh.lang.langZh\",\"langType\":\"Page\",\"langVi\":\"asd\",\"langZh\":\"asd\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 00:13:16', 9);
INSERT INTO `sys_oper_log` VALUES (308, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 00:14:38\",\"id\":113,\"langEn\":\"sss\",\"langKey\":\"plh.lang.langEn\",\"langType\":\"Page\",\"langVi\":\"sss\",\"langZh\":\"asd\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 00:14:38', 10);
INSERT INTO `sys_oper_log` VALUES (309, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 08:55:54\",\"id\":114,\"langEn\":\"Login\",\"langKey\":\"logtinTitle\",\"langType\":\"Page\",\"langVi\":\"đăng nhập\",\"langZh\":\"登录\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:55:54', 21);
INSERT INTO `sys_oper_log` VALUES (310, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":88,\"langEn\":\"Login\",\"langKey\":\"loginTitle\",\"langType\":\"Page\",\"langVi\":\"Đăng nhập\",\"langZh\":\"登录\",\"params\":{},\"updateTime\":\"2024-05-11 08:56:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:56:15', 12);
INSERT INTO `sys_oper_log` VALUES (311, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 08:56:52\",\"id\":115,\"langEn\":\"Logout\",\"langKey\":\"logout\",\"langType\":\"Page\",\"langVi\":\"Đăng xuất\",\"langZh\":\"退出\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:56:52', 12);
INSERT INTO `sys_oper_log` VALUES (312, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":88,\"langEn\":\"Boviet Solar\",\"langKey\":\"loginTitle\",\"langType\":\"Page\",\"langVi\":\"Boviet Solar\",\"langZh\":\"博威尔特\",\"params\":{},\"updateTime\":\"2024-05-11 08:57:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:57:41', 19);
INSERT INTO `sys_oper_log` VALUES (313, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 08:57:55\",\"id\":116,\"langEn\":\"123\",\"langKey\":\"userProfile\",\"langType\":\"Page\",\"langVi\":\"123\",\"langZh\":\"123\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:57:55', 13);
INSERT INTO `sys_oper_log` VALUES (314, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":114,\"langEn\":\"Login\",\"langKey\":\"login\",\"langType\":\"Page\",\"langVi\":\"đăng nhập\",\"langZh\":\"登录\",\"params\":{},\"updateTime\":\"2024-05-11 08:59:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:59:00', 10);
INSERT INTO `sys_oper_log` VALUES (315, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":116,\"langEn\":\"User profile\",\"langKey\":\"userProfile\",\"langType\":\"Page\",\"langVi\":\"Thông tin cá nhân\",\"langZh\":\"个人信息\",\"params\":{},\"updateTime\":\"2024-05-11 08:59:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:59:24', 19);
INSERT INTO `sys_oper_log` VALUES (316, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 08:59:30', 19);
INSERT INTO `sys_oper_log` VALUES (317, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 09:01:25\",\"id\":117,\"langEn\":\"Please enter keywords\",\"langKey\":\"plh.lang.langKey\",\"langType\":\"Page\",\"langVi\":\"Vui lòng nhập từ khoá\",\"langZh\":\"请输入关键词\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:01:25', 30);
INSERT INTO `sys_oper_log` VALUES (318, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":96,\"langEn\":\"Keywords\",\"langKey\":\"lbl.lang.langKey\",\"langType\":\"Page\",\"langVi\":\"Từ khoá\",\"langZh\":\"关键词\",\"params\":{},\"updateTime\":\"2024-05-11 09:01:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:01:30', 12);
INSERT INTO `sys_oper_log` VALUES (319, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":112,\"langEn\":\"Please enter Chinese labels\",\"langKey\":\"plh.lang.langZh\",\"langType\":\"Page\",\"langVi\":\"Vui lòng nhập tên tiếng trung\",\"langZh\":\"请输入中文名称\",\"params\":{},\"updateTime\":\"2024-05-11 09:04:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:04:11', 42);
INSERT INTO `sys_oper_log` VALUES (320, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":113,\"langEn\":\"Please enter English labels\",\"langKey\":\"plh.lang.langEn\",\"langType\":\"Page\",\"langVi\":\"Vui lòng nhập tên tiếng Việt\",\"langZh\":\"请输入英语名称\",\"params\":{},\"updateTime\":\"2024-05-11 09:05:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:05:41', 11);
INSERT INTO `sys_oper_log` VALUES (321, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":113,\"langEn\":\"Please enter English labels\",\"langKey\":\"plh.lang.langEn\",\"langType\":\"Page\",\"langVi\":\"Vui lòng nhập tên tiếng anh\",\"langZh\":\"请输入英语名称\",\"params\":{},\"updateTime\":\"2024-05-11 09:05:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:05:50', 12);
INSERT INTO `sys_oper_log` VALUES (322, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 09:07:18\",\"id\":118,\"langEn\":\"Please enter a Vietnamese labels\",\"langKey\":\"plh.lang.langVi\",\"langType\":\"Page\",\"langVi\":\"Vui lòng nhập tên tiếng Việt\",\"langZh\":\"请输入越语名称\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:07:18', 20);
INSERT INTO `sys_oper_log` VALUES (323, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 09:08:21\",\"id\":119,\"langEn\":\"Please enter remark\",\"langKey\":\"plh.lang.remark\",\"langType\":\"Page\",\"langVi\":\"Vui lòng nhập ghi chú\",\"langZh\":\"请输入备注\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:08:21', 19);
INSERT INTO `sys_oper_log` VALUES (324, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 09:09:46\",\"id\":120,\"langEn\":\"Vietnamese cannot be empty\",\"langKey\":\"req.lang.langVi\",\"langType\":\"Page\",\"langVi\":\"Tiếng Việt không được bỏ trống\",\"langZh\":\"越语不能为空\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:09:46', 24);
INSERT INTO `sys_oper_log` VALUES (325, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 09:10:24\",\"id\":121,\"langEn\":\"English cannot be empty\",\"langKey\":\"req.lang.langEn\",\"langType\":\"Page\",\"langVi\":\"Tiếng Anh không được bỏ trống\",\"langZh\":\"英语不能为空\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:10:24', 22);
INSERT INTO `sys_oper_log` VALUES (326, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 09:11:02\",\"id\":122,\"langEn\":\"Chinese cannot be empty\",\"langKey\":\"req.lang.langZh\",\"langType\":\"Page\",\"langVi\":\"Tiếng trung không được bỏ trống\",\"langZh\":\"中文不能为空\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:11:02', 10);
INSERT INTO `sys_oper_log` VALUES (327, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"id\":111,\"langEn\":\"Menu id\",\"langKey\":\"lbl.lang.menuId\",\"langType\":\"Page\",\"langVi\":\"Mã thực đơn\",\"langZh\":\"序号\",\"params\":{},\"updateTime\":\"2024-05-11 09:12:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:12:49', 12);
INSERT INTO `sys_oper_log` VALUES (328, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 09:13:55\",\"id\":123,\"langEn\":\"Please enter menu id\",\"langKey\":\"plh.lang.menuId\",\"langType\":\"Page\",\"langVi\":\"Vui lòng nhập mã thực đơn\",\"langZh\":\"请输入序号\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:13:55', 11);
INSERT INTO `sys_oper_log` VALUES (329, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":1,\"langEn\":\"System Management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý hệ thống\",\"langZh\":\"系统管理\",\"menuId\":1,\"params\":{},\"remark\":\"系统管理目录\",\"sysMenu\":{\"children\":[],\"menuId\":1,\"menuName\":\"系统管理\",\"params\":{}},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 09:15:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:15:42', 19);
INSERT INTO `sys_oper_log` VALUES (330, '系统语言', 1, 'com.ruoyi.web.controller.system.SysLanguageController.add()', 'POST', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-05-11 09:23:31\",\"id\":124,\"langEn\":\"Operate\",\"langKey\":\"operate\",\"langType\":\"Page\",\"langVi\":\"Hành động\",\"langZh\":\"操作\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:23:31', 11);
INSERT INTO `sys_oper_log` VALUES (331, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":2,\"langEn\":\"System monitoring\",\"langType\":\"Menu\",\"langVi\":\"Giám sát Hệ Thống\",\"langZh\":\"系统监控\",\"menuId\":2,\"params\":{},\"remark\":\"系统监控目录\",\"sysMenu\":{\"children\":[],\"menuId\":2,\"menuName\":\"系统监控\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:24:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:24:10', 12);
INSERT INTO `sys_oper_log` VALUES (332, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":3,\"langEn\":\"System Tool\",\"langType\":\"Menu\",\"langVi\":\"Công cụ hệ thống\",\"langZh\":\"系统工具\",\"menuId\":3,\"params\":{},\"remark\":\"系统工具目录\",\"sysMenu\":{\"children\":[],\"menuId\":3,\"menuName\":\"系统工具\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:24:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:24:30', 9);
INSERT INTO `sys_oper_log` VALUES (333, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":4,\"langEn\":\"Ruoyi official website\",\"langType\":\"Menu\",\"langVi\":\"Trang web Ruoyi\",\"langZh\":\"若依官网\",\"menuId\":4,\"params\":{},\"remark\":\"若依官网地址\",\"sysMenu\":{\"children\":[],\"menuId\":4,\"menuName\":\"若依官网\",\"params\":{}},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 09:25:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:25:12', 10);
INSERT INTO `sys_oper_log` VALUES (334, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":5,\"langEn\":\"User Management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý người dùng\",\"langZh\":\"用户管理\",\"menuId\":100,\"params\":{},\"remark\":\"用户管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":100,\"menuName\":\"用户管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:25:28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:25:28', 11);
INSERT INTO `sys_oper_log` VALUES (335, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":6,\"langEn\":\"Role management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý vai trò\",\"langZh\":\"角色管理\",\"menuId\":101,\"params\":{},\"remark\":\"角色管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":101,\"menuName\":\"角色管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:25:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:25:48', 56);
INSERT INTO `sys_oper_log` VALUES (336, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":7,\"langEn\":\"Menu management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý thực đơn\",\"langZh\":\"菜单管理\",\"menuId\":102,\"params\":{},\"remark\":\"菜单管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":102,\"menuName\":\"菜单管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:26:19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:26:19', 10);
INSERT INTO `sys_oper_log` VALUES (337, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":8,\"langEn\":\"Department management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý bộ phận\",\"langZh\":\"部门管理\",\"menuId\":103,\"params\":{},\"remark\":\"部门管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":103,\"menuName\":\"部门管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:26:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:26:33', 12);
INSERT INTO `sys_oper_log` VALUES (338, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":2,\"langEn\":\"System Monitoring\",\"langType\":\"Menu\",\"langVi\":\"Giám sát Hệ Thống\",\"langZh\":\"系统监控\",\"menuId\":2,\"params\":{},\"remark\":\"系统监控目录\",\"sysMenu\":{\"children\":[],\"menuId\":2,\"menuName\":\"系统监控\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:26:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:26:48', 11);
INSERT INTO `sys_oper_log` VALUES (339, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":6,\"langEn\":\"Role Management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý vai trò\",\"langZh\":\"角色管理\",\"menuId\":101,\"params\":{},\"remark\":\"角色管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":101,\"menuName\":\"角色管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:27:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:27:10', 9);
INSERT INTO `sys_oper_log` VALUES (340, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":8,\"langEn\":\"Department Management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý bộ phận\",\"langZh\":\"部门管理\",\"menuId\":103,\"params\":{},\"remark\":\"部门管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":103,\"menuName\":\"部门管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:27:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:27:16', 9);
INSERT INTO `sys_oper_log` VALUES (341, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":9,\"langEn\":\"Location Management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý vị trí\",\"langZh\":\"岗位管理\",\"menuId\":104,\"params\":{},\"remark\":\"岗位管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":104,\"menuName\":\"岗位管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:27:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:27:33', 9);
INSERT INTO `sys_oper_log` VALUES (342, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":10,\"langEn\":\"Dictionary Management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý từ điển\",\"langZh\":\"字典管理\",\"menuId\":105,\"params\":{},\"remark\":\"字典管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":105,\"menuName\":\"字典管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:27:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:27:59', 9);
INSERT INTO `sys_oper_log` VALUES (343, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:28:45', 25);
INSERT INTO `sys_oper_log` VALUES (344, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:30:48', 29);
INSERT INTO `sys_oper_log` VALUES (345, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":11,\"langEn\":\"Parameter settings\",\"langType\":\"Menu\",\"langVi\":\"Cài đặt tham số\",\"langZh\":\"参数设置\",\"menuId\":106,\"params\":{},\"remark\":\"参数设置菜单\",\"sysMenu\":{\"children\":[],\"menuId\":106,\"menuName\":\"参数设置\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:31:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:31:45', 10);
INSERT INTO `sys_oper_log` VALUES (346, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":12,\"langEn\":\"Notification\",\"langType\":\"Menu\",\"langVi\":\"Thông báo\",\"langZh\":\"通知公告\",\"menuId\":107,\"params\":{},\"remark\":\"通知公告菜单\",\"sysMenu\":{\"children\":[],\"menuId\":107,\"menuName\":\"通知公告\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:35:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:35:11', 11);
INSERT INTO `sys_oper_log` VALUES (347, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":13,\"langEn\":\"Log Management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý nhật ký\",\"langZh\":\"日志管理\",\"menuId\":108,\"params\":{},\"remark\":\"日志管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":108,\"menuName\":\"日志管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:35:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:35:49', 11);
INSERT INTO `sys_oper_log` VALUES (348, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":13,\"langEn\":\"History\",\"langType\":\"Menu\",\"langVi\":\"Quản lý nhật ký\",\"langZh\":\"日志管理\",\"menuId\":108,\"params\":{},\"remark\":\"日志管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":108,\"menuName\":\"日志管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:36:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:36:23', 56);
INSERT INTO `sys_oper_log` VALUES (349, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":13,\"langEn\":\"Log Management\",\"langType\":\"Menu\",\"langVi\":\"Quản lý nhật ký\",\"langZh\":\"日志管理\",\"menuId\":108,\"params\":{},\"remark\":\"日志管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":108,\"menuName\":\"日志管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:36:36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:36:36', 10);
INSERT INTO `sys_oper_log` VALUES (350, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":14,\"langEn\":\"Online users\",\"langType\":\"Menu\",\"langVi\":\"Người dùng trực tuyến\",\"langZh\":\"在线用户\",\"menuId\":109,\"params\":{},\"remark\":\"在线用户菜单\",\"sysMenu\":{\"children\":[],\"menuId\":109,\"menuName\":\"在线用户\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:37:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:37:05', 10);
INSERT INTO `sys_oper_log` VALUES (351, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":15,\"langEn\":\"Scheduled Tasks\",\"langType\":\"Menu\",\"langVi\":\"Nhiệm vụ theo lịch trình\",\"langZh\":\"定时任务\",\"menuId\":110,\"params\":{},\"remark\":\"定时任务菜单\",\"sysMenu\":{\"children\":[],\"menuId\":110,\"menuName\":\"定时任务\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:37:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:37:34', 10);
INSERT INTO `sys_oper_log` VALUES (352, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":16,\"langEn\":\"Data Monitoring\",\"langType\":\"Menu\",\"langVi\":\"Giám sát dữ liệu\",\"langZh\":\"数据监控\",\"menuId\":111,\"params\":{},\"remark\":\"数据监控菜单\",\"sysMenu\":{\"children\":[],\"menuId\":111,\"menuName\":\"数据监控\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:38:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:38:00', 10);
INSERT INTO `sys_oper_log` VALUES (353, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":17,\"langEn\":\"Service Monitoring\",\"langType\":\"Menu\",\"langVi\":\"Giám sát dịch vụ\",\"langZh\":\"服务监控\",\"menuId\":112,\"params\":{},\"remark\":\"服务监控菜单\",\"sysMenu\":{\"children\":[],\"menuId\":112,\"menuName\":\"服务监控\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:38:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:38:21', 9);
INSERT INTO `sys_oper_log` VALUES (354, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":18,\"langEn\":\"Cache Monitor\",\"langType\":\"Menu\",\"langVi\":\"Giám sát bộ đệm\",\"langZh\":\"缓存监控\",\"menuId\":113,\"params\":{},\"remark\":\"缓存监控菜单\",\"sysMenu\":{\"children\":[],\"menuId\":113,\"menuName\":\"缓存监控\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:38:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:38:44', 11);
INSERT INTO `sys_oper_log` VALUES (355, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":16,\"langEn\":\"Data Monitor\",\"langType\":\"Menu\",\"langVi\":\"Giám sát dữ liệu\",\"langZh\":\"数据监控\",\"menuId\":111,\"params\":{},\"remark\":\"数据监控菜单\",\"sysMenu\":{\"children\":[],\"menuId\":111,\"menuName\":\"数据监控\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:38:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:38:49', 9);
INSERT INTO `sys_oper_log` VALUES (356, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":17,\"langEn\":\"Service Monitor\",\"langType\":\"Menu\",\"langVi\":\"Giám sát dịch vụ\",\"langZh\":\"服务监控\",\"menuId\":112,\"params\":{},\"remark\":\"服务监控菜单\",\"sysMenu\":{\"children\":[],\"menuId\":112,\"menuName\":\"服务监控\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:38:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:38:59', 8);
INSERT INTO `sys_oper_log` VALUES (357, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":1,\"langEn\":\"System\",\"langType\":\"Menu\",\"langVi\":\"Quản lý hệ thống\",\"langZh\":\"系统管理\",\"menuId\":1,\"params\":{},\"remark\":\"系统管理目录\",\"sysMenu\":{\"children\":[],\"menuId\":1,\"menuName\":\"系统管理\",\"params\":{}},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-11 09:39:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:39:29', 8);
INSERT INTO `sys_oper_log` VALUES (358, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":2,\"langEn\":\"System Monitor\",\"langType\":\"Menu\",\"langVi\":\"Giám sát Hệ Thống\",\"langZh\":\"系统监控\",\"menuId\":2,\"params\":{},\"remark\":\"系统监控目录\",\"sysMenu\":{\"children\":[],\"menuId\":2,\"menuName\":\"系统监控\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:39:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:39:42', 10);
INSERT INTO `sys_oper_log` VALUES (359, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":5,\"langEn\":\"User\",\"langType\":\"Menu\",\"langVi\":\"Quản lý người dùng\",\"langZh\":\"用户管理\",\"menuId\":100,\"params\":{},\"remark\":\"用户管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":100,\"menuName\":\"用户管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:39:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:39:48', 10);
INSERT INTO `sys_oper_log` VALUES (360, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":6,\"langEn\":\"Roles\",\"langType\":\"Menu\",\"langVi\":\"Quản lý vai trò\",\"langZh\":\"角色管理\",\"menuId\":101,\"params\":{},\"remark\":\"角色管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":101,\"menuName\":\"角色管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:39:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:39:54', 10);
INSERT INTO `sys_oper_log` VALUES (361, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":7,\"langEn\":\"Menu\",\"langType\":\"Menu\",\"langVi\":\"Quản lý thực đơn\",\"langZh\":\"菜单管理\",\"menuId\":102,\"params\":{},\"remark\":\"菜单管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":102,\"menuName\":\"菜单管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:39:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:39:57', 10);
INSERT INTO `sys_oper_log` VALUES (362, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":8,\"langEn\":\"Department\",\"langType\":\"Menu\",\"langVi\":\"Quản lý bộ phận\",\"langZh\":\"部门管理\",\"menuId\":103,\"params\":{},\"remark\":\"部门管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":103,\"menuName\":\"部门管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:40:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:40:00', 8);
INSERT INTO `sys_oper_log` VALUES (363, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":9,\"langEn\":\"Location\",\"langType\":\"Menu\",\"langVi\":\"Quản lý vị trí\",\"langZh\":\"岗位管理\",\"menuId\":104,\"params\":{},\"remark\":\"岗位管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":104,\"menuName\":\"岗位管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:40:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:40:04', 11);
INSERT INTO `sys_oper_log` VALUES (364, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":10,\"langEn\":\"Dictionary\",\"langType\":\"Menu\",\"langVi\":\"Quản lý từ điển\",\"langZh\":\"字典管理\",\"menuId\":105,\"params\":{},\"remark\":\"字典管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":105,\"menuName\":\"字典管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:40:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:40:08', 10);
INSERT INTO `sys_oper_log` VALUES (365, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":11,\"langEn\":\"Parameter\",\"langType\":\"Menu\",\"langVi\":\"Cài đặt tham số\",\"langZh\":\"参数设置\",\"menuId\":106,\"params\":{},\"remark\":\"参数设置菜单\",\"sysMenu\":{\"children\":[],\"menuId\":106,\"menuName\":\"参数设置\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:40:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:40:46', 9);
INSERT INTO `sys_oper_log` VALUES (366, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":13,\"langEn\":\"Logs\",\"langType\":\"Menu\",\"langVi\":\"Quản lý nhật ký\",\"langZh\":\"日志管理\",\"menuId\":108,\"params\":{},\"remark\":\"日志管理菜单\",\"sysMenu\":{\"children\":[],\"menuId\":108,\"menuName\":\"日志管理\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 09:40:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:40:58', 9);
INSERT INTO `sys_oper_log` VALUES (367, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":19,\"langEn\":\"Cache List\",\"langType\":\"Menu\",\"langVi\":\"Bộ nhớ đệm\",\"langZh\":\"缓存列表\",\"menuId\":114,\"params\":{},\"remark\":\"缓存列表菜单\",\"sysMenu\":{\"children\":[],\"menuId\":114,\"menuName\":\"缓存列表\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 10:06:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 10:06:43', 36);
INSERT INTO `sys_oper_log` VALUES (368, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":20,\"langEn\":\"Form Building\",\"langType\":\"Menu\",\"langVi\":\"Biểu mẫu\",\"langZh\":\"表单构建\",\"menuId\":115,\"params\":{},\"remark\":\"表单构建菜单\",\"sysMenu\":{\"children\":[],\"menuId\":115,\"menuName\":\"表单构建\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 10:07:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 10:07:21', 56);
INSERT INTO `sys_oper_log` VALUES (369, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":21,\"langEn\":\"Code Generation\",\"langType\":\"Menu\",\"langVi\":\"Tạo mã\",\"langZh\":\"代码生成\",\"menuId\":116,\"params\":{},\"remark\":\"代码生成菜单\",\"sysMenu\":{\"children\":[],\"menuId\":116,\"menuName\":\"代码生成\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 10:07:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 10:07:54', 10);
INSERT INTO `sys_oper_log` VALUES (370, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":22,\"langEn\":\"API\",\"langType\":\"Menu\",\"langVi\":\"API\",\"langZh\":\"系统接口\",\"menuId\":117,\"params\":{},\"remark\":\"系统接口菜单\",\"sysMenu\":{\"children\":[],\"menuId\":117,\"menuName\":\"系统接口\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 10:08:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 10:08:20', 10);
INSERT INTO `sys_oper_log` VALUES (371, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":23,\"langEn\":\"Operation log\",\"langType\":\"Menu\",\"langVi\":\"Nhật ký hoạt động\",\"langZh\":\"操作日志\",\"menuId\":500,\"params\":{},\"remark\":\"操作日志菜单\",\"sysMenu\":{\"children\":[],\"menuId\":500,\"menuName\":\"操作日志\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 10:08:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 10:08:38', 8);
INSERT INTO `sys_oper_log` VALUES (372, '系统语言', 2, 'com.ruoyi.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-10 14:46:12\",\"id\":24,\"langEn\":\"Login log\",\"langType\":\"Menu\",\"langVi\":\"Nhật ký đăng nhập\",\"langZh\":\"登录日志\",\"menuId\":501,\"params\":{},\"remark\":\"登录日志菜单\",\"sysMenu\":{\"children\":[],\"menuId\":501,\"menuName\":\"登录日志\",\"params\":{}},\"updateBy\":\"\",\"updateTime\":\"2024-05-11 10:09:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 10:09:03', 9);
INSERT INTO `sys_oper_log` VALUES (373, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:20:59', 185);
INSERT INTO `sys_oper_log` VALUES (374, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 15:46:12\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@qq.com\",\"language\":\"en-US\",\"loginDate\":\"2024-05-11 22:21:22\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:22:20', 133);
INSERT INTO `sys_oper_log` VALUES (375, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 15:46:12\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@qq.com\",\"language\":\"en-US\",\"loginDate\":\"2024-05-11 22:21:22\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:22:38', 64);
INSERT INTO `sys_oper_log` VALUES (376, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:24:52', 41);
INSERT INTO `sys_oper_log` VALUES (377, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2024-04-11 08:05:27\",\"delFlag\":\"0\",\"deptId\":103,\"email\":\"\",\"loginDate\":\"2024-04-11 09:05:59\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"n7186\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"n7186\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:25:04', 104);
INSERT INTO `sys_oper_log` VALUES (378, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:25:14', 109);
INSERT INTO `sys_oper_log` VALUES (379, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2024-04-11 08:05:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"language\":\"vi-VN\",\"loginDate\":\"2024-05-11 22:25:27\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"n7186\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"n7186\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:26:19', 34);
INSERT INTO `sys_oper_log` VALUES (380, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:26:31', 62);
INSERT INTO `sys_oper_log` VALUES (381, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:26:42', 106);
INSERT INTO `sys_oper_log` VALUES (382, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2024-04-11 08:05:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"language\":\"vi-VN\",\"loginDate\":\"2024-05-11 22:25:27\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"n7186\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[2],\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"n7186\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 00:08:20', 164);
INSERT INTO `sys_oper_log` VALUES (383, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'ry', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":false,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"ry\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 00:41:20', 130);
INSERT INTO `sys_oper_log` VALUES (384, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'ry', '研发部门', '/system/user/updateLanguage', '127.0.0.1', '内网IP', '{\"admin\":false,\"language\":\"vi-VN\",\"params\":{},\"updateBy\":\"ry\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 00:41:24', 25);
INSERT INTO `sys_oper_log` VALUES (385, '用户头像', 2, 'com.boviet.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/05/12/avatar_unknown_icon_20240512015759A001.png\",\"code\":200}', 0, NULL, '2024-05-12 01:57:59', 242);
INSERT INTO `sys_oper_log` VALUES (386, '参数管理', 2, 'com.boviet.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '192.168.1.92', '内网IP', '{\"configId\":2,\"configKey\":\"sys.user.initPassword\",\"configName\":\"用户管理-账号初始密码\",\"configType\":\"N\",\"configValue\":\"123456\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 16:46:16\",\"params\":{},\"remark\":\"初始化密码 123456\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 19:27:32', 138);
INSERT INTO `sys_oper_log` VALUES (387, '用户管理', 2, 'com.boviet.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '192.168.1.92', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 19:27:49', 27);
INSERT INTO `sys_oper_log` VALUES (388, '用户管理', 2, 'com.boviet.web.controller.system.SysUserController.updateLanguage()', 'PUT', 1, 'admin', '研发部门', '/system/user/updateLanguage', '192.168.1.92', '内网IP', '{\"admin\":true,\"language\":\"en-US\",\"params\":{},\"updateBy\":\"admin\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 21:36:37', 81);
INSERT INTO `sys_oper_log` VALUES (389, '系统语言', 2, 'com.boviet.web.controller.system.SysLanguageController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/lang', '192.168.1.92', '内网IP', '{\"id\":116,\"langEn\":\"User profile\",\"langKey\":\"user.profile\",\"langType\":\"Page\",\"langVi\":\"Thông tin cá nhân\",\"langZh\":\"个人信息\",\"params\":{},\"updateTime\":\"2024-05-14 21:41:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 21:41:55', 64);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-04-10 15:46:12', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-04-10 15:46:12', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-04-10 15:46:12', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-04-10 15:46:12', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-04-10 15:46:12', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-04-10 15:46:12', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `language` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '语言',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '陈文权_Trần Văn Quyền', '00', 'vanquyen.tran@bowayalloy.com', '0389359449', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'en-US', '192.168.1.92', '2024-05-14 20:36:30', 'admin', '2024-04-10 15:46:12', 'admin', '2024-05-14 21:36:37', '管理员');
INSERT INTO `sys_user` VALUES (2, 103, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$SeP2cy6ikQal.kop8H3VvuS1LD83ODrmZVZQSzpdZYY.mtpkkegz6', '0', '0', 'vi-VN', '127.0.0.1', '2024-05-12 00:25:56', 'admin', '2024-04-10 15:46:12', 'ry', '2024-05-12 00:41:24', '测试员');
INSERT INTO `sys_user` VALUES (100, 105, 'n7186', 'n7186', '00', '', '', '0', '', '$2a$10$mMihNQJhPOvcS69MmUeLdeRZj/i./8fV3yL8LC39lOt9XqyBL0r6i', '0', '0', 'en-US', '127.0.0.1', '2024-05-12 00:42:06', '', '2024-04-11 08:05:27', 'admin', '2024-05-12 00:42:05', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 2);

SET FOREIGN_KEY_CHECKS = 1;
