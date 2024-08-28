/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.22 : Database - smart_fridge
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smart_fridge` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `smart_fridge`;

/*Table structure for table `forum_collect` */

DROP TABLE IF EXISTS `forum_collect`;

CREATE TABLE `forum_collect` (
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户ID',
  `forum_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '论坛ID',
  PRIMARY KEY (`user_id`,`forum_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户和论坛游记的收藏关系表';

/*Data for the table `forum_collect` */

insert  into `forum_collect`(`user_id`,`forum_id`) values
('102','103'),
('102','111');

/*Table structure for table `forum_item` */

DROP TABLE IF EXISTS `forum_item`;

CREATE TABLE `forum_item` (
  `forum_id` bigint NOT NULL AUTO_INCREMENT COMMENT '论坛ID',
  `forum_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '论坛名称',
  `forum_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '论坛描述',
  `forum_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '论坛图片',
  `type` int DEFAULT NULL COMMENT ' 0 论坛，1 游记',
  `status` int DEFAULT NULL COMMENT ' 0 待发布，1 待审核 2 已发布 3 已退稿',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`forum_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='论坛游记信息表';

/*Data for the table `forum_item` */

insert  into `forum_item`(`forum_id`,`forum_name`,`forum_info`,`forum_img`,`type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(111,'222','3333','/profile/forum/2024/05/10/ddfd8e9b780c2cf7.jpg_480x360x95_6460f0a7_20240510220019A001.jpg',0,1,'test123','2024-05-10 22:00:22','',NULL,NULL);

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`table_id`,`table_name`,`table_comment`,`sub_table_name`,`sub_table_fk_name`,`class_name`,`tpl_category`,`tpl_web_type`,`package_name`,`module_name`,`business_name`,`function_name`,`function_author`,`gen_type`,`gen_path`,`options`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(6,'forum_collect','用户和论坛游记的收藏关系表',NULL,NULL,'ForumCollect','crud','element-ui','com.ruoyi.system','appservice','collect','用户和论坛游记的收藏关系','ruoyi','0','/','{}','admin','2024-04-26 22:18:27','','2024-04-26 23:48:17',NULL),
(7,'forum_item','论坛游记信息表',NULL,NULL,'ForumItem','crud','element-ui','com.tang.appservice','appservice','forum','论坛游记信息','ruoyi','0','/','{}','admin','2024-04-26 22:18:27','','2024-04-27 00:05:47',NULL),
(8,'review_item','论坛评论信息表',NULL,NULL,'ReviewItem','crud','element-ui','com.tang.appservice','appservice','review','论坛评论信息','ruoyi','0','/','{}','admin','2024-04-26 22:18:27','','2024-04-27 13:36:45',NULL),
(9,'travel_item','景点信息表',NULL,NULL,'TravelItem','crud','element-ui','com.tang.appservice','appservice','travel','景点信息','ruoyi','0','/','{}','admin','2024-04-26 22:18:27','','2024-04-27 00:14:37',NULL),
(10,'travel_order','用户景点购买关系表',NULL,NULL,'TravelOrder','crud','element-ui','com.ruoyi.system','appservice','order','用户景点购买关系','ruoyi','0','/','{}','admin','2024-04-26 22:18:27','','2024-04-26 23:48:51',NULL);

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values
(43,6,'user_id','用户ID','varchar(32)','String','userId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:17'),
(44,6,'forum_id','论坛ID','varchar(32)','String','forumId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',2,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:17'),
(45,7,'forum_id','论坛ID','bigint','Long','forumId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(46,7,'forum_name','论坛名称','bigint','Long','forumName','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(47,7,'forum_info','论坛描述','varchar(500)','String','forumInfo','0','0','0','1','1','1','1','LIKE','textarea','',3,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(48,7,'forum_img','论坛图片','varchar(100)','String','forumImg','0','0','0','1','1','1','1','EQ','imageUpload','',4,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(49,7,'type','论坛类型','int','Long','type','0','0','0','1','1','1','1','EQ','select','forum_type',5,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(50,7,'status','论坛状态','int','Long','status','0','0','0','1','1','1','1','EQ','select','forum_status',6,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(51,7,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',7,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(52,7,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,'1','BETWEEN','datetime','',8,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(53,7,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',9,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(54,7,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',10,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(55,7,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',11,'admin','2024-04-26 22:18:27','','2024-04-27 00:05:47'),
(56,8,'review_id','评论ID','bigint','Long','reviewId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-26 22:18:27','','2024-04-27 13:36:45'),
(57,8,'review_user_id','评论用户ID','bigint','Long','reviewUserId','0','0','0','1','1','1','1','EQ','input','',2,'admin','2024-04-26 22:18:27','','2024-04-27 13:36:45'),
(58,8,'review_info','评论描述','varchar(500)','String','reviewInfo','0','0','1','1','1','1','1','EQ','textarea','',3,'admin','2024-04-26 22:18:27','','2024-04-27 13:36:45'),
(59,8,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',5,'admin','2024-04-26 22:18:27','','2024-04-27 13:36:45'),
(60,8,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2024-04-26 22:18:27','','2024-04-27 13:36:45'),
(61,8,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',7,'admin','2024-04-26 22:18:27','','2024-04-27 13:36:45'),
(62,8,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',8,'admin','2024-04-26 22:18:27','','2024-04-27 13:36:45'),
(63,8,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',9,'admin','2024-04-26 22:18:27','','2024-04-27 13:36:45'),
(64,9,'travel_id','景点ID','bigint','Long','travelId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-26 22:18:27','','2024-04-27 18:38:48'),
(65,9,'travel_name','经典名称','bigint','String','travelName','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2024-04-26 22:18:27','','2024-04-27 18:38:48'),
(66,9,'travel_info','景点描述','varchar(500)','String','travelInfo','0','0','1','1','1','1','1','EQ','textarea','',3,'admin','2024-04-26 22:18:27','','2024-04-27 18:38:48'),
(67,9,'travel_img','景点图片','varchar(100)','String','travelImg','0','0','0','1','1','1','1','EQ','imageUpload','',5,'admin','2024-04-26 22:18:27','','2024-04-27 18:38:48'),
(68,9,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',6,'admin','2024-04-26 22:18:27','','2024-04-27 18:38:48'),
(69,9,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2024-04-26 22:18:27','','2024-04-27 18:38:48'),
(70,9,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',8,'admin','2024-04-26 22:18:27','','2024-04-27 18:38:48'),
(71,9,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',9,'admin','2024-04-26 22:18:27','','2024-04-27 18:38:48'),
(72,9,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',10,'admin','2024-04-26 22:18:27','','2024-04-27 18:38:48'),
(73,10,'travel_order_id','购买记录ID','varchar(32)','String','travelOrderId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(74,10,'order_no','订单编号','varchar(32)','String','orderNo','0','0','0','0','0','0','0','EQ','input','',2,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(75,10,'status','1:待支付，2 已支付','varchar(10)','String','status','0','0','0','0','0','0','0','EQ','radio','',3,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(76,10,'user_id','用户ID','varchar(32)','String','userId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(77,10,'username','用户名','varchar(32)','String','username','0','0','1','1','1','1','1','LIKE','input','',5,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(78,10,'amount','金额','decimal(10,2)','BigDecimal','amount','0','0','0','1','1','1','1','EQ','input','',6,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(79,10,'pay_type','支付类型 1：微信、2：支付宝、','varchar(255)','String','payType','0','0','0','0','0','0','0','EQ','select','',7,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(80,10,'trade_no','第三方支付编号','varchar(255)','String','tradeNo','0','0','0','0','0','0','0','EQ','input','',8,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(81,10,'forum_id','论坛ID','varchar(32)','String','forumId','0','0','1','1','1','1','1','EQ','input','',9,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(82,10,'create_by',NULL,'varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',10,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(83,10,'create_time',NULL,'datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(84,10,'update_by',NULL,'varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',12,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(85,10,'update_time',NULL,'datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',13,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(86,10,'remark',NULL,'varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',14,'admin','2024-04-26 22:18:27','','2024-04-26 23:48:51'),
(87,8,'forum_id','帖子ID','bigint','Long','forumId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',4,'','2024-04-27 13:36:19','','2024-04-27 13:36:45'),
(88,9,'amount',NULL,'decimal(10,0)','Long','amount','0','0','0','1','1','1','1','EQ','input','',4,'','2024-04-27 18:38:48','',NULL);

/*Table structure for table `review_item` */

DROP TABLE IF EXISTS `review_item`;

CREATE TABLE `review_item` (
  `review_id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `review_user_id` bigint DEFAULT NULL COMMENT '评论用户ID',
  `review_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '论坛描述',
  `forum_id` bigint NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`review_id`,`forum_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='论坛评论信息表';

/*Data for the table `review_item` */

insert  into `review_item`(`review_id`,`review_user_id`,`review_info`,`forum_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(102,102,'你好呀',102,'test123','2024-04-27 13:44:23','',NULL,NULL),
(103,102,'冲呀',102,'test123','2024-04-27 13:47:26','',NULL,NULL),
(104,102,'keyi',102,'test123','2024-04-27 13:50:05','',NULL,NULL),
(105,102,'哈哈哈',102,'test123','2024-04-27 13:54:23','',NULL,NULL),
(106,102,'222',106,'test123','2024-04-28 00:02:27','',NULL,NULL),
(107,102,'不错呀',104,'test123','2024-04-28 00:03:38','',NULL,NULL);

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-03-22 00:06:39','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-03-22 00:06:39','',NULL,'初始化密码 123456'),
(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-03-22 00:06:39','',NULL,'深色主题theme-dark，浅色主题theme-light'),
(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-03-22 00:06:39','admin','2024-05-08 20:21:42','是否开启验证码功能（true开启，false关闭）'),
(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-03-22 00:06:39','',NULL,'是否开启注册用户功能（true开启，false关闭）'),
(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-03-22 00:06:39','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values
(100,0,'0','XX科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-03-22 00:06:14','admin','2024-03-26 09:07:38'),
(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-03-22 00:06:14','',NULL),
(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-03-22 00:06:14','',NULL),
(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-03-22 00:06:14','',NULL),
(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-03-22 00:06:14','',NULL),
(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-03-22 00:06:14','',NULL),
(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-03-22 00:06:14','',NULL),
(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-03-22 00:06:14','',NULL),
(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-03-22 00:06:14','',NULL),
(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-03-22 00:06:14','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-03-22 00:06:37','',NULL,'性别男'),
(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-03-22 00:06:37','',NULL,'性别女'),
(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-03-22 00:06:37','',NULL,'性别未知'),
(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-03-22 00:06:37','',NULL,'显示菜单'),
(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-03-22 00:06:37','',NULL,'隐藏菜单'),
(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-03-22 00:06:37','',NULL,'正常状态'),
(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-03-22 00:06:37','',NULL,'停用状态'),
(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-03-22 00:06:37','',NULL,'正常状态'),
(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-03-22 00:06:37','',NULL,'停用状态'),
(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-03-22 00:06:37','',NULL,'默认分组'),
(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-03-22 00:06:37','',NULL,'系统分组'),
(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-03-22 00:06:37','',NULL,'系统默认是'),
(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-03-22 00:06:37','',NULL,'系统默认否'),
(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-03-22 00:06:37','',NULL,'通知'),
(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-03-22 00:06:37','',NULL,'公告'),
(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-03-22 00:06:37','',NULL,'正常状态'),
(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-03-22 00:06:37','',NULL,'关闭状态'),
(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-03-22 00:06:37','',NULL,'其他操作'),
(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-03-22 00:06:37','',NULL,'新增操作'),
(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-03-22 00:06:37','',NULL,'修改操作'),
(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-03-22 00:06:37','',NULL,'删除操作'),
(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-03-22 00:06:37','',NULL,'授权操作'),
(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-03-22 00:06:37','',NULL,'导出操作'),
(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-03-22 00:06:37','',NULL,'导入操作'),
(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-03-22 00:06:37','',NULL,'强退操作'),
(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-03-22 00:06:37','',NULL,'生成操作'),
(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-03-22 00:06:37','',NULL,'清空操作'),
(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-03-22 00:06:37','',NULL,'正常状态'),
(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-03-22 00:06:37','',NULL,'停用状态'),
(100,0,'happy','0','fyp_music_weather',NULL,'default','N','0','admin','2024-03-23 14:11:13','',NULL,NULL),
(101,0,'stress','1','fyp_music_weather',NULL,'default','N','0','admin','2024-03-23 14:11:26','',NULL,NULL),
(102,0,'sad','2','fyp_music_weather',NULL,'default','N','0','admin','2024-03-23 14:11:35','',NULL,NULL),
(103,0,'angry','3','fyp_music_weather',NULL,'default','N','0','admin','2024-03-23 14:11:53','',NULL,NULL),
(104,0,'bored','4','fyp_music_weather',NULL,'default','N','0','admin','2024-03-23 14:12:03','',NULL,NULL),
(105,0,'tried','5','fyp_music_weather',NULL,'default','N','0','admin','2024-03-23 14:12:13','',NULL,NULL),
(106,0,'I don‘t know','6','fyp_music_weather',NULL,'default','N','0','admin','2024-03-23 14:12:34','',NULL,NULL),
(107,0,'论坛','0','forum_type',NULL,'default','N','0','admin','2024-04-26 22:23:18','',NULL,NULL),
(108,1,'游记','1','forum_type',NULL,'default','N','0','admin','2024-04-26 22:23:26','',NULL,NULL),
(109,0,'待发布','0','forum_status',NULL,'default','N','0','admin','2024-04-26 22:23:46','',NULL,NULL),
(110,1,'待审核','1','forum_status',NULL,'default','N','0','admin','2024-04-26 22:23:54','',NULL,NULL),
(111,2,'已发布','2','forum_status',NULL,'default','N','0','admin','2024-04-26 22:24:04','',NULL,NULL),
(112,3,'已退稿','3','forum_status',NULL,'default','N','0','admin','2024-04-26 22:24:23','',NULL,NULL);

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'用户性别','sys_user_sex','0','admin','2024-03-22 00:06:35','',NULL,'用户性别列表'),
(2,'菜单状态','sys_show_hide','0','admin','2024-03-22 00:06:35','',NULL,'菜单状态列表'),
(3,'系统开关','sys_normal_disable','0','admin','2024-03-22 00:06:35','',NULL,'系统开关列表'),
(4,'任务状态','sys_job_status','0','admin','2024-03-22 00:06:35','',NULL,'任务状态列表'),
(5,'任务分组','sys_job_group','0','admin','2024-03-22 00:06:35','',NULL,'任务分组列表'),
(6,'系统是否','sys_yes_no','0','admin','2024-03-22 00:06:35','',NULL,'系统是否列表'),
(7,'通知类型','sys_notice_type','0','admin','2024-03-22 00:06:35','',NULL,'通知类型列表'),
(8,'通知状态','sys_notice_status','0','admin','2024-03-22 00:06:35','',NULL,'通知状态列表'),
(9,'操作类型','sys_oper_type','0','admin','2024-03-22 00:06:35','',NULL,'操作类型列表'),
(10,'系统状态','sys_common_status','0','admin','2024-03-22 00:06:35','',NULL,'登录状态列表'),
(100,'心情分类','fyp_music_weather','0','admin','2024-03-23 14:10:35','',NULL,NULL),
(101,'论坛类型','forum_type','0','admin','2024-04-26 22:22:06','',NULL,NULL),
(102,'审核状态','forum_status','0','admin','2024-04-26 22:22:44','',NULL,NULL);

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-03-22 00:06:43','',NULL,''),
(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-03-22 00:06:43','',NULL,''),
(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-03-22 00:06:43','',NULL,''),
(100,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','1 * * * * ?','1','1','1','admin','2024-04-24 00:32:49','admin','2024-04-24 12:53:33','');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

insert  into `sys_job_log`(`job_log_id`,`job_name`,`job_group`,`invoke_target`,`job_message`,`status`,`exception_info`,`create_time`) values
(1,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：12毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(2,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(3,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(4,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(5,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(6,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(7,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(8,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(9,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(10,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：2毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(11,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(12,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(13,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(14,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(15,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:13'),
(16,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：3毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 10 more\r\n','2024-04-24 00:33:14'),
(17,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：3毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:14'),
(18,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：2毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:14'),
(19,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:14'),
(20,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：4毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:14'),
(21,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：2毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:14'),
(22,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:14'),
(23,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：6毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:14'),
(24,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:14'),
(25,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:14'),
(26,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:14'),
(27,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：3毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:15'),
(28,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：2毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:16'),
(29,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:17'),
(30,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:18'),
(31,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:19'),
(32,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:20'),
(33,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:21'),
(34,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:22'),
(35,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:23'),
(36,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：2毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:24'),
(37,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:25'),
(38,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:26'),
(39,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:27'),
(40,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：3毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:28'),
(41,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:29'),
(42,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:30'),
(43,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:31'),
(44,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:32'),
(45,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:33'),
(46,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:34'),
(47,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:35'),
(48,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:36'),
(49,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:37'),
(50,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:38'),
(51,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:39'),
(52,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：2毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:40'),
(53,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:41'),
(54,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:42'),
(55,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:43'),
(56,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:44'),
(57,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：2毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:45'),
(58,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:46'),
(59,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:47'),
(60,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:48'),
(61,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:49'),
(62,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:50'),
(63,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:51'),
(64,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:52'),
(65,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:53'),
(66,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：2毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:54'),
(67,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:55'),
(68,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:56'),
(69,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:57'),
(70,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:58'),
(71,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：2毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:33:59'),
(72,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:00'),
(73,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:01'),
(74,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:02'),
(75,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:03'),
(76,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:04'),
(77,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:05'),
(78,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:06'),
(79,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:07'),
(80,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:08'),
(81,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:09'),
(82,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:10'),
(83,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:11'),
(84,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:12'),
(85,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:13'),
(86,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:14'),
(87,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：0毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:15'),
(88,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：1毫秒','1','java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.GeneratedMethodAccessor88.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: com.ruoyi.common.exception.ServiceException: 获取用户账户异常\r\n	at com.ruoyi.common.utils.SecurityUtils.getUsername(SecurityUtils.java:65)\r\n	at com.tang.appservice.service.impl.CabinetInfoServiceImpl.updateCabinetInfo(CabinetInfoServiceImpl.java:89)\r\n	at com.tang.appservice.task.MonitorTask.ryUpdateCabinet(MonitorTask.java:70)\r\n	... 9 more\r\n','2024-04-24 00:34:16'),
(89,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：299毫秒','0','','2024-04-24 00:40:52'),
(90,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：219毫秒','0','','2024-04-24 00:40:52'),
(91,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：281毫秒','0','','2024-04-24 00:40:52'),
(92,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：178毫秒','0','','2024-04-24 00:40:53'),
(93,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：192毫秒','0','','2024-04-24 00:40:53'),
(94,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：183毫秒','0','','2024-04-24 00:40:53'),
(95,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：218毫秒','0','','2024-04-24 00:40:53'),
(96,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：190毫秒','0','','2024-04-24 00:40:54'),
(97,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：124毫秒','0','','2024-04-24 00:40:54'),
(98,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：91毫秒','0','','2024-04-24 00:40:54'),
(99,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：133毫秒','0','','2024-04-24 00:40:54'),
(100,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：79毫秒','0','','2024-04-24 00:40:54'),
(101,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：87毫秒','0','','2024-04-24 00:40:54'),
(102,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：76毫秒','0','','2024-04-24 00:40:54'),
(103,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：105毫秒','0','','2024-04-24 00:40:54'),
(104,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：65毫秒','0','','2024-04-24 00:40:54'),
(105,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：81毫秒','0','','2024-04-24 00:40:54'),
(106,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：118毫秒','0','','2024-04-24 00:40:55'),
(107,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：102毫秒','0','','2024-04-24 00:40:55'),
(108,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：82毫秒','0','','2024-04-24 00:40:55'),
(109,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：117毫秒','0','','2024-04-24 00:40:55'),
(110,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：59毫秒','0','','2024-04-24 00:40:55'),
(111,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：113毫秒','0','','2024-04-24 00:40:55'),
(112,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：133毫秒','0','','2024-04-24 00:40:55'),
(113,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：129毫秒','0','','2024-04-24 00:40:55'),
(114,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：115毫秒','0','','2024-04-24 00:40:55'),
(115,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：78毫秒','0','','2024-04-24 00:40:56'),
(116,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：122毫秒','0','','2024-04-24 00:40:56'),
(117,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：69毫秒','0','','2024-04-24 00:40:56'),
(118,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：111毫秒','0','','2024-04-24 00:40:56'),
(119,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：80毫秒','0','','2024-04-24 00:40:56'),
(120,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：115毫秒','0','','2024-04-24 00:40:56'),
(121,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：70毫秒','0','','2024-04-24 00:40:56'),
(122,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：95毫秒','0','','2024-04-24 00:40:56'),
(123,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：67毫秒','0','','2024-04-24 00:40:56'),
(124,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：67毫秒','0','','2024-04-24 00:40:56'),
(125,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：56毫秒','0','','2024-04-24 00:40:56'),
(126,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：115毫秒','0','','2024-04-24 00:40:57'),
(127,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：75毫秒','0','','2024-04-24 00:40:57'),
(128,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：118毫秒','0','','2024-04-24 00:40:57'),
(129,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：68毫秒','0','','2024-04-24 00:40:57'),
(130,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：90毫秒','0','','2024-04-24 00:40:57'),
(131,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：83毫秒','0','','2024-04-24 00:40:57'),
(132,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：56毫秒','0','','2024-04-24 00:40:57'),
(133,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：47毫秒','0','','2024-04-24 00:40:57'),
(134,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：107毫秒','0','','2024-04-24 00:40:57'),
(135,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：64毫秒','0','','2024-04-24 00:40:57'),
(136,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：78毫秒','0','','2024-04-24 00:40:57'),
(137,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：71毫秒','0','','2024-04-24 00:40:57'),
(138,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：46毫秒','0','','2024-04-24 00:40:58'),
(139,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：44毫秒','0','','2024-04-24 00:40:58'),
(140,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：72毫秒','0','','2024-04-24 00:40:58'),
(141,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：92毫秒','0','','2024-04-24 00:40:58'),
(142,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：51毫秒','0','','2024-04-24 00:40:58'),
(143,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：52毫秒','0','','2024-04-24 00:40:58'),
(144,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：128毫秒','0','','2024-04-24 00:40:58'),
(145,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：72毫秒','0','','2024-04-24 00:40:58'),
(146,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：101毫秒','0','','2024-04-24 00:40:58'),
(147,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：77毫秒','0','','2024-04-24 00:40:58'),
(148,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：111毫秒','0','','2024-04-24 00:40:58'),
(149,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：89毫秒','0','','2024-04-24 00:40:58'),
(150,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：58毫秒','0','','2024-04-24 00:40:59'),
(151,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：77毫秒','0','','2024-04-24 00:40:59'),
(152,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：93毫秒','0','','2024-04-24 00:40:59'),
(153,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：54毫秒','0','','2024-04-24 00:40:59'),
(154,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：60毫秒','0','','2024-04-24 00:40:59'),
(155,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：97毫秒','0','','2024-04-24 00:40:59'),
(156,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：137毫秒','0','','2024-04-24 00:40:59'),
(157,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：293毫秒','0','','2024-04-24 00:40:59'),
(158,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：401毫秒','0','','2024-04-24 00:41:00'),
(159,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：259毫秒','0','','2024-04-24 00:41:00'),
(160,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：239毫秒','0','','2024-04-24 00:41:00'),
(161,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：338毫秒','0','','2024-04-24 00:41:01'),
(162,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：283毫秒','0','','2024-04-24 00:41:01'),
(163,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：423毫秒','0','','2024-04-24 12:47:26'),
(164,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：298毫秒','0','','2024-04-24 12:48:01'),
(165,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：195毫秒','0','','2024-04-24 12:49:01'),
(166,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：272毫秒','0','','2024-04-24 12:50:01'),
(167,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：332毫秒','0','','2024-04-24 12:51:01'),
(168,'updateCab','DEFAULT','monitorTask.ryUpdateCabinet','updateCab 总共耗时：242毫秒','0','','2024-04-24 12:52:01');

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
  KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values
(100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-03-22 15:04:31'),
(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-22 15:04:35'),
(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-22 16:53:27'),
(103,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-23 13:59:33'),
(104,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-23 21:51:09'),
(105,'admin','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 14:34:18'),
(106,'admin','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 14:34:57'),
(107,'admin','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 14:36:07'),
(108,'admin','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 14:37:37'),
(109,'admin','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 14:38:31'),
(110,'admin','192.168.137.1','内网IP','Unknown','Unknown','1','密码输入错误5次，帐户锁定10分钟','2024-03-25 14:38:50'),
(111,'admin','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 14:58:32'),
(112,'aaa','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 14:59:43'),
(113,'aaa','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 14:59:55'),
(114,'aaa','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 15:06:38'),
(115,'aaa','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 15:10:40'),
(116,'222','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 15:28:34'),
(117,'222','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 15:28:36'),
(118,'222','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 15:28:48'),
(119,'222','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 15:29:00'),
(120,'222','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-25 18:13:13'),
(121,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-25 19:59:08'),
(122,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-25 19:59:53'),
(123,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:21:30'),
(124,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:24:38'),
(125,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:25:46'),
(126,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:26:11'),
(127,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:32:59'),
(128,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:33:02'),
(129,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:33:11'),
(130,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:35:34'),
(131,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:35:35'),
(132,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:38:15'),
(133,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-26 00:40:12'),
(134,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-26 09:05:47'),
(135,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-27 13:34:55'),
(136,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-03-27 13:37:38'),
(137,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-27 13:37:51'),
(138,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-03-27 13:38:54'),
(139,'admin','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-27 13:39:00'),
(140,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-27 13:39:07'),
(141,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-03-27 13:40:46'),
(142,'','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-27 13:40:47'),
(143,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-27 13:40:52'),
(144,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-03-27 13:40:54'),
(145,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','注册成功','2024-03-27 22:49:58'),
(146,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-27 22:50:07'),
(147,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 00:03:36'),
(148,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 00:17:40'),
(149,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 00:32:03'),
(150,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 00:35:34'),
(151,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 00:39:15'),
(152,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 00:40:50'),
(153,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 09:37:44'),
(154,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 11:20:51'),
(155,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 16:15:11'),
(156,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 16:18:44'),
(157,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 16:22:07'),
(158,'test1','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-28 16:28:10'),
(159,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 16:28:17'),
(160,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 21:18:03'),
(161,'test1','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-28 21:20:00'),
(162,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 21:20:06'),
(163,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 21:36:42'),
(164,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-03-28 21:38:38'),
(165,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 21:40:09'),
(166,'test1','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-28 22:22:52'),
(167,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-28 22:22:57'),
(168,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 00:30:17'),
(169,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-29 00:39:36'),
(170,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 09:16:14'),
(171,'test1','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-29 11:23:01'),
(172,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 11:34:23'),
(173,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 14:05:45'),
(174,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 14:57:41'),
(175,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 16:02:11'),
(176,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 20:30:56'),
(177,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-03-29 20:45:43'),
(178,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 20:45:49'),
(179,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-03-29 20:47:57'),
(180,'test1','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 20:49:37'),
(181,'test1','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 21:14:06'),
(182,'test1','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 21:15:47'),
(183,'test1','192.168.1.13','内网IP','Unknown','Unknown','0','退出成功','2024-03-29 21:56:27'),
(184,'test1','192.168.1.13','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-29 21:56:33'),
(185,'test1','192.168.1.13','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-29 21:56:38'),
(186,'test1','192.168.1.13','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-29 21:56:46'),
(187,'test1','192.168.1.13','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-29 21:56:48'),
(188,'test1','192.168.1.13','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-29 21:57:01'),
(189,'test11','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 21:57:11'),
(190,'test11','192.168.1.13','内网IP','Unknown','Unknown','0','退出成功','2024-03-29 21:57:37'),
(191,'test11','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 21:57:42'),
(192,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-29 22:04:21'),
(193,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-03-29 22:12:22'),
(194,'test11','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 22:29:10'),
(195,'test1','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 22:32:11'),
(196,'test1','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 23:01:00'),
(197,'test1','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-29 23:01:42'),
(198,'test1','192.168.1.13','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-03-30 09:42:50'),
(199,'test1','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-30 09:42:56'),
(200,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-30 10:01:38'),
(201,'test1','192.168.1.13','内网IP','Unknown','Unknown','0','退出成功','2024-03-30 10:02:54'),
(202,'admin','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-30 10:03:00'),
(203,'admin','192.168.1.13','内网IP','Unknown','Unknown','0','退出成功','2024-03-30 10:21:31'),
(204,'admin','192.168.1.13','内网IP','Unknown','Unknown','0','登录成功','2024-03-30 10:21:37'),
(205,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-04-02 17:28:26'),
(206,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-02 17:28:31'),
(207,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-03 14:07:16'),
(208,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-13 00:18:16'),
(209,'a','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-14 11:15:42'),
(210,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-14 11:15:51'),
(211,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-14 15:04:07'),
(212,'test12','192.168.137.1','内网IP','Unknown','Unknown','0','注册成功','2024-04-14 23:36:14'),
(213,'test12','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-14 23:36:23'),
(214,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-15 21:48:55'),
(215,'test','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-15 23:25:20'),
(216,'test','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-15 23:25:42'),
(217,'test','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-15 23:27:28'),
(218,'test','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-15 23:29:43'),
(219,'test','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-04-15 23:59:15'),
(220,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-15 23:59:34'),
(221,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-21 22:08:22'),
(222,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-04-21 22:38:32'),
(223,'admin','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-21 22:38:40'),
(224,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-21 22:43:41'),
(225,'test','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-22 22:14:04'),
(226,'test','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-22 22:14:12'),
(227,'test','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-22 22:14:46'),
(228,'test','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-22 22:14:54'),
(229,'test','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-22 22:15:00'),
(230,'test','192.168.137.1','内网IP','Unknown','Unknown','1','密码输入错误5次，帐户锁定10分钟','2024-04-22 22:15:09'),
(231,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-22 22:15:16'),
(232,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-22 22:46:15'),
(233,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-04-22 23:04:11'),
(234,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-22 23:05:03'),
(235,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-04-22 23:08:29'),
(236,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-22 23:08:42'),
(237,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-04-22 23:28:58'),
(238,'test1','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-22 23:29:03'),
(239,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-22 23:42:31'),
(240,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-04-23 21:58:53'),
(241,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-23 21:58:57'),
(242,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-24 00:26:14'),
(243,'test','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-24 01:02:21'),
(244,'test','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-24 01:02:23'),
(245,'test','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-24 01:02:29'),
(246,'test','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-24 01:04:16'),
(247,'test','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-24 11:08:58'),
(248,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-24 12:47:03'),
(249,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-04-26 11:18:42'),
(250,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-26 11:18:46'),
(251,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-04-26 11:19:39'),
(252,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-26 11:19:44'),
(253,'test','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-26 11:50:16'),
(254,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','注册成功','2024-04-26 13:37:45'),
(255,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-26 13:37:55'),
(256,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-26 19:06:59'),
(257,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-26 19:11:55'),
(258,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-04-26 19:12:02'),
(259,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-26 19:39:06'),
(260,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-04-26 19:39:10'),
(261,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-26 19:43:53'),
(262,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-26 22:15:49'),
(263,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-26 23:48:05'),
(264,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 00:27:26'),
(265,'test123','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-27 11:11:19'),
(266,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 11:11:26'),
(267,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 11:18:33'),
(268,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 11:22:57'),
(269,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 11:30:28'),
(270,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:03:34'),
(271,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:10:03'),
(272,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:14:11'),
(273,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:15:12'),
(274,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:28:53'),
(275,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:32:20'),
(276,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:33:53'),
(277,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:52:57'),
(278,'test123','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-27 12:53:56'),
(279,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:54:01'),
(280,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:57:01'),
(281,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:58:22'),
(282,'test','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-27 12:59:25'),
(283,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 12:59:27'),
(284,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 13:00:26'),
(285,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 13:01:43'),
(286,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 13:03:36'),
(287,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 13:05:37'),
(288,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 13:07:37'),
(289,'test','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-27 13:29:52'),
(290,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 13:29:55'),
(291,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-27 13:36:10'),
(292,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 13:39:55'),
(293,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 13:47:13'),
(294,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 13:49:56'),
(295,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 13:54:11'),
(296,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 14:03:32'),
(297,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 14:10:20'),
(298,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 14:15:29'),
(299,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 14:31:52'),
(300,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 14:49:49'),
(301,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 14:53:48'),
(302,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 14:59:07'),
(303,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 15:02:39'),
(304,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 17:13:15'),
(305,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 17:15:23'),
(306,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 17:37:22'),
(307,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 17:38:38'),
(308,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 17:50:15'),
(309,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-27 18:38:37'),
(310,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 18:43:50'),
(311,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 19:01:39'),
(312,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 19:03:10'),
(313,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 20:31:48'),
(314,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 20:42:29'),
(315,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-27 20:43:52'),
(316,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 20:44:29'),
(317,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 20:49:31'),
(318,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 20:50:28'),
(319,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 20:52:09'),
(320,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 20:53:28'),
(321,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 20:55:36'),
(322,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:02:27'),
(323,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:05:20'),
(324,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:09:11'),
(325,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:10:14'),
(326,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:11:25'),
(327,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:12:31'),
(328,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:12:32'),
(329,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:15:39'),
(330,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:16:07'),
(331,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:40:20'),
(332,'test1231','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-04-27 21:44:16'),
(333,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:44:20'),
(334,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:45:21'),
(335,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:46:47'),
(336,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:52:48'),
(337,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 21:54:14'),
(338,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:02:22'),
(339,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:04:01'),
(340,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:05:38'),
(341,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:08:40'),
(342,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:11:26'),
(343,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:14:19'),
(344,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:17:01'),
(345,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:24:02'),
(346,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:28:36'),
(347,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:30:02'),
(348,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:31:33'),
(349,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:38:12'),
(350,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:40:54'),
(351,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:42:16'),
(352,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:52:41'),
(353,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 22:54:52'),
(354,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:00:01'),
(355,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:02:14'),
(356,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:12:51'),
(357,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:25:02'),
(358,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:27:12'),
(359,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:29:52'),
(360,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:40:32'),
(361,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:43:10'),
(362,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:48:11'),
(363,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:53:47'),
(364,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:55:31'),
(365,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-04-27 23:55:47'),
(366,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-27 23:56:02'),
(367,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-27 23:59:12'),
(368,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','退出成功','2024-04-28 00:02:36'),
(369,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-04-28 00:02:50'),
(370,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 18:58:56'),
(371,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-08 19:00:29'),
(372,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 19:04:46'),
(373,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-08 19:10:56'),
(374,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-05-08 19:14:03'),
(375,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-05-08 19:22:33'),
(376,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-05-08 19:23:56'),
(377,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 19:26:02'),
(378,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-08 19:29:45'),
(379,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 19:29:55'),
(380,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-08 19:30:01'),
(381,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 19:41:24'),
(382,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-08 20:20:03'),
(383,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 20:20:25'),
(384,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-08 20:20:53'),
(385,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 20:21:31'),
(386,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-08 20:21:49'),
(387,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 20:21:50'),
(388,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-08 20:30:50'),
(389,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 20:31:09'),
(390,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-08 20:31:38'),
(391,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 20:32:09'),
(392,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-08 20:32:17'),
(393,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-09 20:33:59'),
(394,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-09 20:48:19'),
(395,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-09 21:00:01'),
(396,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-09 21:00:03'),
(397,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-09 21:00:28'),
(398,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-09 21:01:04'),
(399,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-10 09:09:57'),
(400,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-10 19:29:28'),
(401,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-10 19:43:11'),
(402,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-10 19:43:14'),
(403,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-10 21:19:54'),
(404,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 21:23:44'),
(405,'test123','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-05-10 21:27:59'),
(406,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 21:28:05'),
(407,'test123','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-05-10 21:37:01'),
(408,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 21:37:06'),
(409,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 21:37:20'),
(410,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 21:38:42'),
(411,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 21:47:58'),
(412,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 21:50:21'),
(413,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 21:51:31'),
(414,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-10 21:53:45'),
(415,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 21:54:56'),
(416,'test123','192.168.137.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-05-10 21:56:55'),
(417,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 21:56:57'),
(418,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 22:06:23'),
(419,'test123','192.168.137.1','内网IP','Unknown','Unknown','0','登录成功','2024-05-10 22:12:55');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2073 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-03-22 00:06:23','',NULL,'系统管理目录'),
(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','1','0','','monitor','admin','2024-03-22 00:06:23','admin','2024-05-08 19:45:38','系统监控目录'),
(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','1','0','','tool','admin','2024-03-22 00:06:23','admin','2024-04-28 00:06:03','系统工具目录'),
(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-03-22 00:06:23','admin','2024-05-08 19:54:41','用户管理菜单'),
(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','1','0','system:role:list','peoples','admin','2024-03-22 00:06:23','admin','2024-05-08 19:46:46','角色管理菜单'),
(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','1','0','system:menu:list','tree-table','admin','2024-03-22 00:06:23','admin','2024-05-10 19:30:09','菜单管理菜单'),
(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','1','0','system:dept:list','tree','admin','2024-03-22 00:06:23','admin','2024-05-08 19:46:32','部门管理菜单'),
(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','1','0','system:post:list','post','admin','2024-03-22 00:06:23','admin','2024-05-08 19:46:27','岗位管理菜单'),
(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','1','0','system:dict:list','dict','admin','2024-03-22 00:06:23','admin','2024-05-08 19:46:24','字典管理菜单'),
(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','1','0','system:config:list','edit','admin','2024-03-22 00:06:23','admin','2024-05-08 20:22:17','参数设置菜单'),
(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','1','0','system:notice:list','message','admin','2024-03-22 00:06:23','admin','2024-05-08 19:46:16','通知公告菜单'),
(108,'日志管理',1,9,'log','','',1,0,'M','1','0','','log','admin','2024-03-22 00:06:23','admin','2024-05-08 19:46:11','日志管理菜单'),
(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-03-22 00:06:23','',NULL,'在线用户菜单'),
(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-03-22 00:06:23','',NULL,'定时任务菜单'),
(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-03-22 00:06:23','',NULL,'数据监控菜单'),
(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-03-22 00:06:23','',NULL,'服务监控菜单'),
(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-03-22 00:06:23','',NULL,'缓存监控菜单'),
(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-03-22 00:06:23','',NULL,'缓存列表菜单'),
(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-03-22 00:06:23','',NULL,'表单构建菜单'),
(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-03-22 00:06:23','',NULL,'代码生成菜单'),
(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-03-22 00:06:23','',NULL,'系统接口菜单'),
(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-03-22 00:06:23','',NULL,'操作日志菜单'),
(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-03-22 00:06:23','',NULL,'登录日志菜单'),
(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-03-22 00:06:23','',NULL,''),
(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-03-22 00:06:23','',NULL,''),
(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-03-22 00:06:23','',NULL,''),
(1005,'用户导入',100,6,'','','',1,0,'F','0','1','system:user:import','#','admin','2024-03-22 00:06:23','admin','2024-05-08 20:10:34',''),
(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-03-22 00:06:23','',NULL,''),
(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-03-22 00:06:23','',NULL,''),
(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-03-22 00:06:23','',NULL,''),
(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-03-22 00:06:23','',NULL,''),
(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-03-22 00:06:23','',NULL,''),
(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-03-22 00:06:23','',NULL,''),
(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-03-22 00:06:23','',NULL,''),
(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-03-22 00:06:23','',NULL,''),
(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-03-22 00:06:23','',NULL,''),
(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-03-22 00:06:23','',NULL,''),
(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-03-22 00:06:23','',NULL,''),
(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-03-22 00:06:23','',NULL,''),
(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-03-22 00:06:23','',NULL,''),
(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-03-22 00:06:23','',NULL,''),
(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-03-22 00:06:23','',NULL,''),
(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-03-22 00:06:23','',NULL,''),
(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-03-22 00:06:23','',NULL,''),
(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-03-22 00:06:23','',NULL,''),
(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-03-22 00:06:23','',NULL,''),
(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-03-22 00:06:23','',NULL,''),
(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-03-22 00:06:23','',NULL,''),
(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-03-22 00:06:23','',NULL,''),
(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-03-22 00:06:23','',NULL,''),
(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-03-22 00:06:23','',NULL,''),
(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-03-22 00:06:23','',NULL,''),
(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-03-22 00:06:23','',NULL,''),
(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-03-22 00:06:23','',NULL,''),
(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-03-22 00:06:23','',NULL,''),
(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-03-22 00:06:23','',NULL,''),
(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-03-22 00:06:23','',NULL,''),
(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-03-22 00:06:23','',NULL,''),
(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-03-22 00:06:23','',NULL,''),
(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-03-22 00:06:23','',NULL,''),
(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-03-22 00:06:23','',NULL,''),
(2042,'旅行助手',0,4,'travel',NULL,NULL,1,0,'M','0','0',NULL,'guide','admin','2024-04-27 00:01:54','',NULL,''),
(2043,'论坛游记信息',2042,2,'forum','appservice/forum/index',NULL,1,0,'C','0','0','appservice:forum:list','#','admin','2024-04-27 00:07:27','admin','2024-04-27 00:13:33','论坛游记信息菜单'),
(2044,'论坛游记信息查询',2043,1,'#','',NULL,1,0,'F','0','0','appservice:forum:query','#','admin','2024-04-27 00:07:27','',NULL,''),
(2045,'论坛游记信息新增',2043,2,'#','',NULL,1,0,'F','0','0','appservice:forum:add','#','admin','2024-04-27 00:07:27','',NULL,''),
(2046,'论坛游记信息修改',2043,3,'#','',NULL,1,0,'F','0','0','appservice:forum:edit','#','admin','2024-04-27 00:07:27','',NULL,''),
(2047,'论坛游记信息删除',2043,4,'#','',NULL,1,0,'F','0','0','appservice:forum:remove','#','admin','2024-04-27 00:07:27','',NULL,''),
(2048,'论坛游记信息导出',2043,5,'#','',NULL,1,0,'F','0','0','appservice:forum:export','#','admin','2024-04-27 00:07:27','',NULL,''),
(2049,'用户景点购买关系',2042,5,'order','appservice/order/index',NULL,1,0,'C','0','0','appservice:order:list','#','admin','2024-04-27 00:07:30','admin','2024-04-27 00:14:00','用户景点购买关系菜单'),
(2050,'用户景点购买关系查询',2049,1,'#','',NULL,1,0,'F','0','0','appservice:order:query','#','admin','2024-04-27 00:07:30','',NULL,''),
(2053,'用户景点购买关系删除',2049,4,'#','',NULL,1,0,'F','0','0','appservice:order:remove','#','admin','2024-04-27 00:07:30','',NULL,''),
(2054,'用户景点购买关系导出',2049,5,'#','',NULL,1,0,'F','0','0','appservice:order:export','#','admin','2024-04-27 00:07:30','',NULL,''),
(2055,'论坛评论信息',2042,3,'review','appservice/review/index',NULL,1,0,'C','1','0','appservice:review:list','#','admin','2024-04-27 00:07:33','admin','2024-04-27 20:55:22','论坛评论信息菜单'),
(2056,'论坛评论信息查询',2055,1,'#','',NULL,1,0,'F','0','0','appservice:review:query','#','admin','2024-04-27 00:07:33','',NULL,''),
(2057,'论坛评论信息新增',2055,2,'#','',NULL,1,0,'F','0','0','appservice:review:add','#','admin','2024-04-27 00:07:33','',NULL,''),
(2058,'论坛评论信息修改',2055,3,'#','',NULL,1,0,'F','0','0','appservice:review:edit','#','admin','2024-04-27 00:07:33','',NULL,''),
(2059,'论坛评论信息删除',2055,4,'#','',NULL,1,0,'F','0','0','appservice:review:remove','#','admin','2024-04-27 00:07:33','',NULL,''),
(2060,'论坛评论信息导出',2055,5,'#','',NULL,1,0,'F','0','0','appservice:review:export','#','admin','2024-04-27 00:07:33','',NULL,''),
(2061,'景点信息',2042,1,'travel','appservice/travel/index',NULL,1,0,'C','0','0','appservice:travel:list','#','admin','2024-04-27 00:07:36','admin','2024-04-27 00:13:15','景点信息菜单'),
(2062,'景点信息查询',2061,1,'#','',NULL,1,0,'F','0','0','appservice:travel:query','#','admin','2024-04-27 00:07:36','',NULL,''),
(2063,'景点信息新增',2061,2,'#','',NULL,1,0,'F','0','0','appservice:travel:add','#','admin','2024-04-27 00:07:36','',NULL,''),
(2064,'景点信息修改',2061,3,'#','',NULL,1,0,'F','0','0','appservice:travel:edit','#','admin','2024-04-27 00:07:36','',NULL,''),
(2065,'景点信息删除',2061,4,'#','',NULL,1,0,'F','0','0','appservice:travel:remove','#','admin','2024-04-27 00:07:36','',NULL,''),
(2066,'景点信息导出',2061,5,'#','',NULL,1,0,'F','0','0','appservice:travel:export','#','admin','2024-04-27 00:07:36','',NULL,''),
(2067,'用户和论坛游记的收藏关系',2042,4,'collect','appservice/collect/index',NULL,1,0,'C','1','0','appservice:collect:list','#','admin','2024-04-27 00:07:38','admin','2024-04-27 20:55:26','用户和论坛游记的收藏关系菜单'),
(2068,'用户和论坛游记的收藏关系查询',2067,1,'#','',NULL,1,0,'F','0','0','appservice:collect:query','#','admin','2024-04-27 00:07:38','',NULL,''),
(2069,'用户和论坛游记的收藏关系新增',2067,2,'#','',NULL,1,0,'F','0','1','appservice:collect:add','#','admin','2024-04-27 00:07:38','admin','2024-05-09 20:57:53',''),
(2070,'用户和论坛游记的收藏关系修改',2067,3,'#','',NULL,1,0,'F','0','1','appservice:collect:edit','#','admin','2024-04-27 00:07:38','admin','2024-05-09 20:57:57',''),
(2071,'用户和论坛游记的收藏关系删除',2067,4,'#','',NULL,1,0,'F','0','0','appservice:collect:remove','#','admin','2024-04-27 00:07:38','',NULL,''),
(2072,'用户和论坛游记的收藏关系导出',2067,5,'#','',NULL,1,0,'F','0','0','appservice:collect:export','#','admin','2024-04-27 00:07:38','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2024-03-22 00:06:46','',NULL,'管理员'),
(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2024-03-22 00:06:46','',NULL,'管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
  KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
  KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values
(1310,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 21:25:30\",\"params\":{},\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 21:25:30',25),
(1311,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 21:38:52\",\"orderDate\":\"2024-05-11\",\"params\":{},\"quantity\":\"2\",\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 21:38:52',8),
(1312,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 21:41:17\",\"orderDate\":\"2024-05-25\",\"params\":{},\"quantity\":\"1\",\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 21:41:17',12599),
(1313,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 21:44:22\",\"orderDate\":\"2024-05-24\",\"params\":{},\"quantity\":\"2\",\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 21:44:22',180),
(1314,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 21:48:14\",\"orderDate\":\"2024-05-24\",\"params\":{},\"quantity\":\"2\",\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 21:48:14',6),
(1315,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 21:51:40\",\"orderDate\":\"2024-05-22\",\"params\":{},\"quantity\":\"3\",\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 21:51:40',32),
(1316,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 21:55:05\",\"orderDate\":\"2024-05-16\",\"params\":{},\"quantity\":2,\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 21:55:05',93),
(1317,'论坛图片',2,'com.tang.appservice.controller.ForumItemController.uploadAdvicePhoto()','POST',1,'test123',NULL,'/appservice/forum/uploadPhoto','192.168.137.1','内网IP','','{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"fileName\":\"ddfd8e9b780c2cf7.jpg_480x360x95_6460f0a7.jpg\",\"forumImg\":\"/profile/forum/2024/05/10/ddfd8e9b780c2cf7.jpg_480x360x95_6460f0a7_20240510220019A001.jpg\",\"fileSize\":173407}}',0,NULL,'2024-05-10 22:00:19',225),
(1318,'论坛游记信息',1,'com.tang.appservice.controller.ForumItemController.add()','POST',1,'test123',NULL,'/appservice/forum','192.168.137.1','内网IP','{\"createBy\":\"test123\",\"createTime\":\"2024-05-10 22:00:22\",\"forumId\":111,\"forumImg\":\"/profile/forum/2024/05/10/ddfd8e9b780c2cf7.jpg_480x360x95_6460f0a7_20240510220019A001.jpg\",\"forumInfo\":\"3333\",\"forumName\":\"222\",\"isCollect\":0,\"params\":{},\"status\":1,\"type\":0}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 22:00:22',76),
(1319,'用户和论坛游记的收藏关系',1,'com.tang.appservice.controller.ForumCollectController.add()','POST',1,'test123',NULL,'/appservice/collect','192.168.137.1','内网IP','{\"forumId\":\"111\",\"params\":{},\"userId\":\"102\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 22:00:25',18),
(1320,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 22:05:13\",\"orderDate\":\"2024-11-13\",\"params\":{},\"quantity\":2,\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 22:05:13',39),
(1321,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 22:05:34\",\"orderDate\":\"2024-11-14\",\"params\":{},\"quantity\":2,\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 22:05:34',27),
(1322,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 22:07:26\",\"orderDate\":\"2024-08-15\",\"params\":{},\"quantity\":1,\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 22:07:26',25364),
(1323,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 22:08:58\",\"orderDate\":\"2024-05-16\",\"params\":{},\"quantity\":2,\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 22:08:58',222),
(1324,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 22:10:35\",\"orderDate\":\"2024-05-16\",\"params\":{},\"quantity\":1,\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 22:10:35',65325),
(1325,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 22:11:23\",\"orderDate\":\"2024-05-16\",\"params\":{},\"quantity\":1,\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'orderDate\' in \'field list\'\r\n### The error may exist in file [F:\\Works\\other_work\\android\\history\\2024\\android_04_21\\fyp_service\\fyp_service\\Fyp\\target\\classes\\mapper\\TravelOrderMapper.xml]\r\n### The error may involve com.tang.appservice.mapper.TravelOrderMapper.insertTravelOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into travel_order          ( status,             user_id,             username,             amount,             quantity,                                       travel_id,             orderDate,             create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,                                       ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'orderDate\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'orderDate\' in \'field list\'','2024-05-10 22:11:23',5537),
(1326,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 22:13:11\",\"orderDate\":\"2024-05-24\",\"params\":{},\"quantity\":2,\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'orderDate\' in \'field list\'\r\n### The error may exist in file [F:\\Works\\other_work\\android\\history\\2024\\android_04_21\\fyp_service\\fyp_service\\Fyp\\target\\classes\\mapper\\TravelOrderMapper.xml]\r\n### The error may involve com.tang.appservice.mapper.TravelOrderMapper.insertTravelOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into travel_order          ( status,             user_id,             username,             amount,             quantity,                                       travel_id,             orderDate,             create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,                                       ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'orderDate\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'orderDate\' in \'field list\'','2024-05-10 22:13:11',193),
(1327,'用户景点购买关系',1,'com.tang.appservice.controller.TravelOrderController.add()','POST',1,'test123',NULL,'/appservice/order','192.168.137.1','内网IP','{\"amount\":33,\"createBy\":\"test123\",\"createTime\":\"2024-05-10 22:14:21\",\"orderDate\":\"2024-05-22\",\"params\":{},\"quantity\":2,\"status\":\"2\",\"travelId\":\"104\",\"userId\":\"102\",\"username\":\"test123\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-10 22:14:21',244);

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'ceo','董事长',1,'0','admin','2024-03-22 00:06:19','',NULL,''),
(2,'se','项目经理',2,'0','admin','2024-03-22 00:06:19','',NULL,''),
(3,'hr','人力资源',3,'0','admin','2024-03-22 00:06:19','',NULL,''),
(4,'user','普通员工',4,'0','admin','2024-03-22 00:06:19','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-03-22 00:06:21','',NULL,'超级管理员'),
(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-03-22 00:06:21','admin','2024-03-22 15:05:44','普通角色');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values
(2,100),
(2,101),
(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '手机号码',
  `birth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`birth`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(1,103,'admin','admin','00','ry@163.com','15888888888',NULL,'1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-05-10 21:53:45','admin','2024-03-22 00:06:16','','2024-05-10 21:53:45','管理员'),
(2,105,'test','test','00','ry@qq.com','15666666666',NULL,'1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','192.168.137.1','2024-04-26 11:50:16','admin','2024-03-22 00:06:16','','2024-04-26 11:50:16','测试员'),
(100,NULL,'test1','test123','00','222@qq.com','130000000',NULL,'0','','$2a$10$6CCCtp9SmMrNGB/ZMh6xeeNgxf250h3uQb9uZ8m1cFXxlvtRcwGFC','0','2','192.168.137.1','2024-04-22 23:29:03','','2024-03-27 22:49:58','test1','2024-04-22 23:29:11',NULL),
(101,NULL,'test12','test12','00','','',NULL,'0','','$2a$10$Ve2fVqLlCvYpp0zT.lg6Ye.UFOphZaf9U0tu44cVR1hLePsU9SaIG','0','0','192.168.137.1','2024-04-14 23:36:23','','2024-04-14 23:36:14','','2024-04-14 23:36:23',NULL),
(102,NULL,'test123','test123','00','1234@qq.com','13000000000','2001-02-20','0','','$2a$10$cEuBLuXvCOHHArhd4WS.X.hVC2S9McrAfrpvznA2QNeBrlASGbXhe','0','0','192.168.137.1','2024-05-10 22:12:56','','2024-04-26 13:37:45','admin','2024-05-10 22:12:55',NULL),
(103,NULL,'luojm','123','00','','13631526903',NULL,'0','','$2a$10$JqCSoEFnoImjDaOAINAf3O7CA4bcwl0QgXgaf9H2eWQUWczWLShmm','0','2','',NULL,'admin','2024-05-08 20:01:18','',NULL,'123456');

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values
(1,1),
(2,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values
(1,1),
(2,2);

/*Table structure for table `travel_item` */

DROP TABLE IF EXISTS `travel_item`;

CREATE TABLE `travel_item` (
  `travel_id` bigint NOT NULL AUTO_INCREMENT COMMENT '景点ID',
  `travel_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '经典名称',
  `travel_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '景点描述',
  `amount` decimal(10,0) DEFAULT NULL,
  `travel_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '景点图片',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`travel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='景点信息表';

/*Data for the table `travel_item` */

insert  into `travel_item`(`travel_id`,`travel_name`,`travel_info`,`amount`,`travel_img`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(104,'333','333',33,'/profile/upload/2024/05/10/Snipaste_2023-09-18_10-01-44_20240510194853A001.png','admin','2024-05-10 19:48:55','',NULL,'3333');

/*Table structure for table `travel_order` */

DROP TABLE IF EXISTS `travel_order`;

CREATE TABLE `travel_order` (
  `travel_order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '购买记录ID',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1:待支付，2 已支付',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `quantity` bigint DEFAULT NULL COMMENT '数量',
  `order_date` varchar(20) DEFAULT NULL COMMENT '订单日期',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付类型 1：微信、2：支付宝、',
  `trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '第三方支付编号',
  `travel_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '论坛ID',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`travel_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户景点购买关系表';

/*Data for the table `travel_order` */

insert  into `travel_order`(`travel_order_id`,`order_no`,`status`,`user_id`,`username`,`quantity`,`order_date`,`amount`,`pay_type`,`trade_no`,`travel_id`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values
(17,NULL,'2','102','test123',2,'2024-05-22',33.00,NULL,NULL,'104','test123','2024-05-10 22:14:22',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
