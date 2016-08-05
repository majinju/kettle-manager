/*
Navicat MySQL Data Transfer

Source Server         : YUN-SQL
Source Server Version : 50514
Source Host           : 127.0.0.1:3306
Source Database       : eova

Target Server Type    : MYSQL
Target Server Version : 50514
File Encoding         : 65001

Date: 2016-02-16 18:18:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `eova_button`
-- ----------------------------
DROP TABLE IF EXISTS `eova_button`;
CREATE TABLE `eova_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(255) NOT NULL COMMENT '菜单Code',
  `name` varchar(255) NOT NULL COMMENT '按钮名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `ui` varchar(255) DEFAULT NULL COMMENT '按钮UI路径',
  `bs` varchar(500) DEFAULT NULL COMMENT '按钮BS路径',
  `order_num` int(11) DEFAULT '0' COMMENT '排序号',
  `group_num` int(11) DEFAULT '0' COMMENT '分组号',
  `is_base` tinyint(1) DEFAULT '0' COMMENT '是否基础功能',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1073 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_button
-- ----------------------------
INSERT INTO `eova_button` VALUES ('1', 'eova_menu', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('2', 'eova_menu', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('3', 'eova_menu', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('4', 'eova_menu', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('5', 'eova_menu', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('6', 'eova_menu', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('7', 'eova_menu', '导出菜单脚本', 'icon-databasego', '/eova/menu/btn/export.html', '/menu/doExport', '12', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('8', 'eova_menu', '基本功能设置', 'icon-cogedit', '/eova/menu/btn/fun.html', '/meta/fun', '11', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('9', 'eova_menu', '新增功能', 'icon-pageadd', '/eova/menu/btn/add.html', '/menu/add', '10', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('20', 'eova_object', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('21', 'eova_object', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('22', 'eova_object', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('23', 'eova_object', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('24', 'eova_object', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('25', 'eova_object', '字段新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '1', '1', '0');
INSERT INTO `eova_button` VALUES ('26', 'eova_object', '字段修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '1', '1', '0');
INSERT INTO `eova_button` VALUES ('27', 'eova_object', '字段删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '1', '1', '0');
INSERT INTO `eova_button` VALUES ('28', 'eova_object', '导出元数据脚本', 'icon-databasego', '/eova/meta/btn/export.html', '/meta/doExport', '11', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('29', 'eova_object', '导入元数据', 'icon-databaseadd', '/eova/meta/btn/import.html', '/meta/import', '10', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('40', 'eova_button', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('41', 'eova_button', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('42', 'eova_button', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('43', 'eova_button', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('44', 'eova_button', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('45', 'eova_button', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('46', 'eova_button', '导出按钮脚本', 'icon-databasego', '/eova/button/btn/export.html', '/button/doExport', '7', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('60', 'eova_dictionary', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('61', 'eova_dictionary', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('62', 'eova_dictionary', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('63', 'eova_dictionary', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('64', 'eova_dictionary', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('65', 'eova_dictionary', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('80', 'eova_task', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('81', 'eova_task', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('82', 'eova_task', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('83', 'eova_task', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('84', 'eova_task', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('85', 'eova_task', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('86', 'eova_task', '启动任务', 'icon-clockplay', '/eova/task/btn/start.html', '/task/start', '10', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('87', 'eova_task', '暂停任务', 'icon-clockpause', '/eova/task/btn/stop.html', '/task/stop', '11', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('88', 'eova_task', '立即运行一次', 'icon-clockgo', '/eova/task/btn/trigger.html', '/task/trigger', '12', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('100', 'sys_auth_role', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('101', 'sys_auth_role', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('102', 'sys_auth_role', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('103', 'sys_auth_role', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('104', 'sys_auth_role', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('105', 'sys_auth_role', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('106', 'sys_auth_role', '权限分配', 'icon-groupedit', '/eova/auth/btn/roleChoose.html', '/auth/getRoleFunJson/*', '10', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('120', 'sys_auth_user', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('121', 'sys_auth_user', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('122', 'sys_auth_user', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('123', 'sys_auth_user', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('124', 'sys_auth_user', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('125', 'sys_auth_user', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('140', 'sys_log', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('141', 'sys_log', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('142', 'sys_log', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('143', 'sys_log', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('144', 'sys_log', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('145', 'sys_log', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('1000', 'biz_demo_tool', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1001', 'biz_demo_tool', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1002', 'biz_demo_tool', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1003', 'biz_demo_tool', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1004', 'biz_demo_tool', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1005', 'biz_demo_tool', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1006', 'biz_demo_usersitem', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1007', 'biz_demo_usersitem', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1008', 'biz_demo_usersitem', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1009', 'biz_demo_usersitem', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1010', 'biz_demo_usersitem', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1011', 'biz_demo_usersitem', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1012', 'biz_demo_usersview', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1013', 'biz_demo_usersview', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1014', 'biz_demo_usersview', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1015', 'biz_demo_usersview', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1016', 'biz_demo_usersview', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1017', 'biz_demo_usersview', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1018', 'biz_users_exp', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1019', 'biz_users_exp', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1020', 'biz_users_exp', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1021', 'biz_users_exp', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1022', 'biz_users_exp', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1023', 'biz_users_exp', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1024', 'biz_demo_users', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1025', 'biz_demo_users', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1026', 'biz_demo_users', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1027', 'biz_demo_users', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1028', 'biz_demo_users', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1029', 'biz_demo_users', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1036', 'biz_product', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1037', 'biz_product', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1038', 'biz_product', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1039', 'biz_product', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1040', 'biz_product', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1041', 'biz_product', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1042', 'biz_hotelzz', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1043', 'biz_hotelzz', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1044', 'biz_hotelzz', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1045', 'biz_hotelzz', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1046', 'biz_hotelzz', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1047', 'biz_hotelzz', '床位新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '1', '1', '0');
INSERT INTO `eova_button` VALUES ('1048', 'biz_hotelzz', '床位修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '1', '1', '0');
INSERT INTO `eova_button` VALUES ('1049', 'biz_hotelzz', '床位删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '1', '1', '0');
INSERT INTO `eova_button` VALUES ('1050', 'biz_hotelzz', '存货新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '2', '1', '0');
INSERT INTO `eova_button` VALUES ('1051', 'biz_hotelzz', '存货修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '2', '1', '0');
INSERT INTO `eova_button` VALUES ('1052', 'biz_hotelzz', '存货删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '2', '1', '0');
INSERT INTO `eova_button` VALUES ('1053', 'biz_4j_test1', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1054', 'biz_4j_test1', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1055', 'biz_4j_test1', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1056', 'biz_4j_test1', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1057', 'biz_4j_test1', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('1058', 'biz_4j_test1', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('1059', 'biz_demo_userscell', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1060', 'biz_demo_userscell', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('1061', 'biz_demo_userscell', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('1062', 'biz_demo_userscell', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('1063', 'biz_demo_userscell', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('1064', 'biz_demo_userscell', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '1');
INSERT INTO `eova_button` VALUES ('1065', 'biz_demo_import', '查询', null, 'query', '/grid/query', '1', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1066', 'biz_demo_import', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', '2', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1067', 'biz_demo_import', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', '3', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1068', 'biz_demo_import', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', '4', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1069', 'biz_demo_import', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', '5', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1070', 'biz_demo_import', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', '6', '0', '1', '0');
INSERT INTO `eova_button` VALUES ('1071', 'biz_product', '产品发布', 'icon-arrowbranch', '/product/btn/release.html', '/product/release', '7', '0', '0', '0');
INSERT INTO `eova_button` VALUES ('1072', 'biz_product', '自定义修改', 'icon-basketedit', '/product/btn/update.html', '/xxx', '8', '0', '0', '0');

-- ----------------------------
-- Table structure for `eova_dict`
-- ----------------------------
DROP TABLE IF EXISTS `eova_dict`;
CREATE TABLE `eova_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `object` varchar(50) NOT NULL,
  `field` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_dict
-- ----------------------------
INSERT INTO `eova_dict` VALUES ('1', 'main', '默认', 'eova_object', 'data_source');
INSERT INTO `eova_dict` VALUES ('2', 'eova', 'EOVA', 'eova_object', 'data_source');
INSERT INTO `eova_dict` VALUES ('20', 'string', '字符', 'eova_field', 'data_type');
INSERT INTO `eova_dict` VALUES ('21', 'number', '数字', 'eova_field', 'data_type');
INSERT INTO `eova_dict` VALUES ('22', 'time', '时间', 'eova_field', 'data_type');
INSERT INTO `eova_dict` VALUES ('40', '1', '新增', 'eova_log', 'type');
INSERT INTO `eova_dict` VALUES ('41', '2', '修改', 'eova_log', 'type');
INSERT INTO `eova_dict` VALUES ('42', '3', '删除', 'eova_log', 'type');
INSERT INTO `eova_dict` VALUES ('50', '文本框', '文本框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('51', '下拉框', '下拉框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('52', '查找框', '查找框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('53', '时间框', '时间框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('54', '文本域', '文本域', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('55', '编辑框', '编辑框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('56', '复选框', '复选框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('57', '自增框', '自增框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('58', '图片框', '图片框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('59', '图标框', '图标框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('60', '文件框', '文件框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('61', '日期框', '日期框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('62', '密码框', '密码框', 'eova_field', 'type');
INSERT INTO `eova_dict` VALUES ('100', '0', '暂停', 'eova_job', 'state');
INSERT INTO `eova_dict` VALUES ('101', '1', '运行', 'eova_job', 'state');

-- ----------------------------
-- Table structure for `eova_field`
-- ----------------------------
DROP TABLE IF EXISTS `eova_field`;
CREATE TABLE `eova_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `object_code` varchar(50) NOT NULL,
  `po_code` varchar(255) DEFAULT NULL COMMENT '持久化对象',
  `en` varchar(50) NOT NULL COMMENT '英文名',
  `cn` varchar(50) NOT NULL COMMENT '中文名',
  `is_auto` tinyint(1) DEFAULT '0' COMMENT '主键是否自增长',
  `data_type` varchar(20) DEFAULT 'string' COMMENT '数据类型',
  `type` varchar(10) DEFAULT '文本框' COMMENT '控件类型',
  `order_num` int(4) DEFAULT '9' COMMENT '排序索引',
  `exp` varchar(800) DEFAULT NULL COMMENT '控件表达式',
  `is_query` tinyint(1) DEFAULT '0' COMMENT '是否可查询',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否可显示',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否禁用',
  `is_order` tinyint(1) DEFAULT '1' COMMENT '是否可排序',
  `is_add` tinyint(1) DEFAULT '1' COMMENT '是否可新增字段',
  `is_update` tinyint(1) DEFAULT '1' COMMENT '是否可修改字段',
  `is_edit` tinyint(1) DEFAULT '1' COMMENT '是否可编辑字段',
  `is_required` tinyint(1) DEFAULT '1' COMMENT '是否必填',
  `is_multiple` tinyint(1) DEFAULT '0' COMMENT '是否多选项',
  `placeholder` varchar(255) DEFAULT NULL COMMENT '输入提示',
  `validator` varchar(255) DEFAULT NULL COMMENT 'UI校验表达式',
  `defaulter` varchar(255) DEFAULT NULL COMMENT '默认值表达式',
  `formatter` varchar(2000) DEFAULT NULL COMMENT '格式化器',
  `width` int(4) DEFAULT '130' COMMENT '控件宽度',
  `height` int(4) DEFAULT '20' COMMENT '控件高度',
  `config` varchar(2000) DEFAULT NULL COMMENT '拓展配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_field
-- ----------------------------
INSERT INTO `eova_field` VALUES ('1', 'eova_object_code', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2', 'eova_object_code', null, 'code', '编码', '0', 'string', '文本框', '2', null, '1', '1', '0', '1', '1', '0', '0', '1', '0', null, 'eovacode', null, null, '200', '20', null);
INSERT INTO `eova_field` VALUES ('3', 'eova_object_code', null, 'name', '名称', '0', 'string', '文本框', '3', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('4', 'eova_object_code', null, 'view_name', '视图', '0', 'string', '文本框', '4', null, '1', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('5', 'eova_object_code', null, 'table_name', '数据表', '0', 'string', '文本框', '5', null, '1', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, '80', '20', null);
INSERT INTO `eova_field` VALUES ('6', 'eova_object_code', null, 'pk_name', '主键', '0', 'string', '文本框', '6', null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('7', 'eova_object_code', null, 'data_source', '数据源', '0', 'string', '下拉框', '7', 'select value ID,name CN from eova_dict where object = \'eova_object\' and field = \'data_source\';ds=eova', '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('8', 'eova_object_code', null, 'is_single', '单选/多选', '0', 'number', '复选框', '8', null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('9', 'eova_object_code', null, 'is_show_num', '显示行号', '0', 'number', '复选框', '9', null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('10', 'eova_object_code', null, 'default_order', '默认排序', '0', 'string', '文本域', '10', null, '0', '1', '0', '1', '1', '1', '0', '0', '0', '例如：id desc (默认按ID倒序)', null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('11', 'eova_object_code', null, 'filter', '过滤条件', '0', 'string', '文本域', '11', null, '0', '1', '0', '1', '1', '1', '0', '0', '0', '例如：status = 1 (只显示状态为1的数据)', null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('12', 'eova_object_code', null, 'diy_js', '依赖JS', '0', 'string', '文本域', '13', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', '自定义JS文件路径', null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('13', 'eova_object_code', null, 'is_celledit', '行内编辑', '0', 'number', '复选框', '8', null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('14', 'eova_object_code', null, 'biz_intercept', '业务拦截器', '0', 'string', '文本域', '12', null, '0', '1', '0', '1', '1', '1', '0', '0', '0', '继承：com.eova.core.meta.MetaObjectIntercept', null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('50', 'eova_field_code', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('51', 'eova_field_code', null, 'object_code', '对象编码', '0', 'string', '查找框', '2', 'select code 编码,name 名称 from eova_object where id > 999 order by id desc;ds=eova', '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, 'eova_user_code', null, '150', '20', null);
INSERT INTO `eova_field` VALUES ('52', 'eova_field_code', null, 'en', '字段名', '0', 'string', '文本框', '4', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', '数据库的字段名', null, null, null, '120', '20', null);
INSERT INTO `eova_field` VALUES ('53', 'eova_field_code', null, 'cn', '中文名', '0', 'string', '文本框', '3', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', '字段对应的中文描述', null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('54', 'eova_field_code', null, 'is_auto', '自增长', '0', 'number', '复选框', '11', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('55', 'eova_field_code', null, 'data_type', '字段类型', '0', 'string', '下拉框', '6', 'select value ID,name CN from eova_dict where object = \'eova_field\' and field = \'data_type\';ds=eova', '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, 'string', null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('56', 'eova_field_code', null, 'type', '控件类型', '0', 'string', '下拉框', '7', 'select value ID,name CN from eova_widget;ds=eova', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '文本框', null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('57', 'eova_field_code', null, 'order_num', '排序', '0', 'number', '文本框', '2', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '0', null, '50', '20', null);
INSERT INTO `eova_field` VALUES ('58', 'eova_field_code', null, 'exp', '表达式', '0', 'string', '文本域', '41', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', '查找框和下拉框需需要表达式', null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('59', 'eova_field_code', null, 'is_query', '允许查询', '0', 'number', '复选框', '20', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('60', 'eova_field_code', null, 'is_show', '允许显示', '0', 'number', '复选框', '21', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('61', 'eova_field_code', null, 'is_order', '允许排序', '0', 'number', '复选框', '28', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('62', 'eova_field_code', null, 'is_add', '允许新增', '0', 'number', '复选框', '24', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('63', 'eova_field_code', null, 'is_update', '允许修改', '0', 'number', '复选框', '25', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('64', 'eova_field_code', null, 'is_required', '是否必填', '0', 'number', '复选框', '27', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('65', 'eova_field_code', null, 'defaulter', '默认值', '0', 'string', '文本域', '42', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', '缺省默认值', null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('66', 'eova_field_code', null, 'width', '宽度', '0', 'number', '文本框', '9', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '130', null, '50', '20', null);
INSERT INTO `eova_field` VALUES ('67', 'eova_field_code', null, 'height', '高度', '0', 'number', '文本框', '10', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '80', null, '50', '20', null);
INSERT INTO `eova_field` VALUES ('68', 'eova_field_code', null, 'is_multiple', '是否有多项', '0', 'number', '复选框', '29', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('69', 'eova_field_code', null, 'is_edit', '允许表内编辑', '0', 'number', '复选框', '26', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '75', '20', null);
INSERT INTO `eova_field` VALUES ('70', 'eova_field_code', null, 'placeholder', '输入提示', '0', 'string', '文本域', '40', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', 'input的placeholder属性', null, null, null, '230', '20', null);
INSERT INTO `eova_field` VALUES ('71', 'eova_field_code', null, 'formatter', '格式化器', '0', 'string', '文本域', '44', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', '格式化的JS,参考EasyUI datagrid formatter', null, null, null, '130', '150', null);
INSERT INTO `eova_field` VALUES ('72', 'eova_field_code', null, 'validator', 'UI校验器', '0', 'string', '文本域', '43', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', 'UI校验规则', null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('73', 'eova_field_code', null, 'is_disable', '是否禁用', '0', 'number', '复选框', '22', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('100', 'eova_menu_code', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '40', '20', null);
INSERT INTO `eova_field` VALUES ('101', 'eova_menu_code', null, 'code', '编码', '0', 'string', '文本框', '4', null, '1', '1', '1', '1', '1', '1', '0', '1', '0', null, 'eovacode', null, null, '200', '20', null);
INSERT INTO `eova_field` VALUES ('102', 'eova_menu_code', null, 'name', '名称', '0', 'string', '文本框', '1', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '180', '20', null);
INSERT INTO `eova_field` VALUES ('103', 'eova_menu_code', null, 'type', '类型', '0', 'string', '文本框', '2', null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '120', '20', null);
INSERT INTO `eova_field` VALUES ('104', 'eova_menu_code', null, 'icon', '图标', '0', 'string', '图标框', '6', null, '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('105', 'eova_menu_code', null, 'order_num', '序号', '0', 'number', '文本框', '9', null, '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '30', '20', null);
INSERT INTO `eova_field` VALUES ('106', 'eova_menu_code', null, 'parent_id', '父节点', '0', 'number', '文本框', '9', '', '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '100', '20', null);
INSERT INTO `eova_field` VALUES ('107', 'eova_menu_code', null, 'is_del', '是否隐藏', '0', 'number', '复选框', '16', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('109', 'eova_menu_code', null, 'biz_intercept', '业务拦截器', '0', 'string', '文本域', '12', null, '0', '1', '0', '1', '1', '1', '0', '0', '0', '继承：模版业务拦截器', null, null, null, '300', '20', null);
INSERT INTO `eova_field` VALUES ('110', 'eova_menu_code', null, 'url', '自定义功能', '0', 'string', '文本域', '15', null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('111', 'eova_menu_code', null, 'filter', '过滤条件', '0', 'string', '文本域', '11', '', '0', '1', '0', '1', '1', '1', '1', '0', '0', '例如：status = 1 (只显示状态为1的数据)', null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('112', 'eova_menu_code', null, 'diy_js', '依赖JS', '0', 'string', '文本域', '13', '', '0', '1', '0', '1', '1', '1', '1', '0', '0', '自定义JS文件路径', null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('150', 'eova_button_code', null, 'is_del', '是否隐藏', '0', 'number', '复选框', '30', null, '0', '1', '0', '1', '0', '1', '1', '1', '0', null, null, null, null, '60', '20', null);
INSERT INTO `eova_field` VALUES ('151', 'eova_button_code', null, 'icon', 'ICON', '0', 'string', '图标框', '3', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, 'function(value,row,index,field){if(value){return\'<span class=\"tree-icon tree-file \'+value+\'\"></span>\'}return value}', '30', '20', null);
INSERT INTO `eova_field` VALUES ('152', 'eova_button_code', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '50', '20', null);
INSERT INTO `eova_field` VALUES ('153', 'eova_button_code', null, 'menu_code', '菜单编码', '0', 'string', '查找框', '2', 'select code 菜单编码,name 菜单名称 from eova_menu where 1=1;ds=eova', '0', '1', '0', '1', '1', '1', '0', '1', '0', null, 'eovacode', null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('154', 'eova_button_code', null, 'name', '功能名称', '0', 'string', '文本框', '4', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('155', 'eova_button_code', null, 'ui', 'UI路径', '0', 'string', '文本域', '10', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '280', '20', null);
INSERT INTO `eova_field` VALUES ('156', 'eova_button_code', null, 'bs', 'BS路径', '0', 'string', '文本域', '20', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '250', '20', null);
INSERT INTO `eova_field` VALUES ('157', 'eova_button_code', null, 'order_num', '序号', '0', 'number', '文本框', '6', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', '按钮的显示顺序', 'digits', '10', null, '50', '20', null);
INSERT INTO `eova_field` VALUES ('158', 'eova_button_code', null, 'group_num', '分组号', '0', 'number', '文本框', '7', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', 'Toolbar分组号', 'digits', '0', null, '50', '20', null);
INSERT INTO `eova_field` VALUES ('159', 'eova_button_code', null, 'is_base', '是否基础功能', '0', 'number', '复选框', '8', null, '0', '0', '0', '1', '0', '0', '0', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('200', 'eova_user_code', null, 'nickname', '昵称', '0', 'string', '文本框', '1', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('201', 'eova_user_code', null, 'login_id', '登录帐号', '0', 'string', '文本框', '2', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('202', 'eova_user_code', null, 'login_pwd', '登录密码', '0', 'string', '文本框', '3', null, '0', '0', '0', '0', '1', '0', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('203', 'eova_user_code', null, 'rid', '角色', '0', 'number', '下拉框', '4', 'select id ID,name CN from eova_role where 1=1;ds=eova', '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('204', 'eova_user_code', null, 'id', 'ID', '1', 'number', '自增框', '0', null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('205', 'eova_user_code', null, 'hotel_id', '所属酒店', '0', 'number', '下拉框', '5', 'select id ID,name CN from hotel where 1=1;ds=main', '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('220', 'eova_role_code', null, 'id', 'ID', '1', 'number', '自增框', '0', null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('221', 'eova_role_code', null, 'name', '角色名', '0', 'string', '文本框', '0', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('222', 'eova_role_code', null, 'info', '角色描述', '0', 'string', '文本框', '0', null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '230', '20', null);
INSERT INTO `eova_field` VALUES ('240', 'eova_dict_code', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('241', 'eova_dict_code', null, 'value', '值', '0', 'string', '文本框', '2', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('242', 'eova_dict_code', null, 'name', '名称', '0', 'string', '文本框', '3', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('243', 'eova_dict_code', null, 'object', '对象', '0', 'string', '文本框', '4', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('244', 'eova_dict_code', null, 'field', '字段', '0', 'string', '文本框', '5', null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('260', 'eova_log_code', null, 'id', 'id', '1', 'number', '自增框', '1', '', '0', '1', '0', '1', '1', '1', '0', '0', '0', '', '', '', '', '130', '20', null);
INSERT INTO `eova_field` VALUES ('261', 'eova_log_code', null, 'user_id', '操作用户', '0', 'number', '查找框', '2', 'select id UID,nickname 用户名 from eova_user where 1=1;ds=eova', '1', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('262', 'eova_log_code', null, 'type', '日志类型', '0', 'number', '文本框', '3', 'select value ID,name CN from eova_dict where object = \'eova_log\' and field = \'type\';ds=eova', '1', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('263', 'eova_log_code', null, 'ip', '操作IP', '0', 'string', '文本框', '4', null, '1', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('264', 'eova_log_code', null, 'info', '详情', '0', 'string', '文本框', '5', '', '1', '1', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '330', '20', null);
INSERT INTO `eova_field` VALUES ('280', 'eova_task_code', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '50', '20', null);
INSERT INTO `eova_field` VALUES ('281', 'eova_task_code', null, 'state', '状态', '0', 'number', '下拉框', '2', 'select value ID,name CN from eova_dict where object = \'eova_job\' and field = \'state\';ds=eova', '1', '1', '0', '1', '0', '0', '0', '0', '0', null, null, '0', null, '50', '20', null);
INSERT INTO `eova_field` VALUES ('282', 'eova_task_code', null, 'name', '名称', '0', 'string', '文本框', '3', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', '任务简称', null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('283', 'eova_task_code', null, 'exp', '表达式', '0', 'string', '文本域', '4', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', 'Quartz表达式', '', '0 0 0/1 * * ?', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('284', 'eova_task_code', null, 'class', '实现类', '0', 'string', '文本域', '5', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', 'Job实现类', null, '', null, '230', '20', null);
INSERT INTO `eova_field` VALUES ('285', 'eova_task_code', null, 'info', '说明', '0', 'string', '文本域', '6', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', '任务的详细描述', null, '', null, '330', '50', null);
INSERT INTO `eova_field` VALUES ('2000', 'celledit_users_code', null, 'id', 'id', '1', 'number', '自增框', '1', null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2001', 'celledit_users_code', null, 'status', '状态', '0', 'number', '文本框', '2', null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2002', 'celledit_users_code', null, 'login_id', '登录账户', '0', 'string', '文本框', '3', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2003', 'celledit_users_code', null, 'login_pwd', '录登密码', '0', 'string', '文本框', '4', null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2004', 'celledit_users_code', null, 'nickname', '昵称', '0', 'string', '文本域', '5', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2005', 'celledit_users_code', null, 'reg_time', '注册时间', '0', 'time', '时间框', '6', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, 'CURRENT_TIMESTAMP', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2006', 'celledit_users_code', null, 'info', '备注', '0', 'string', '文本域', '7', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2012', 'dicts', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2013', 'dicts', null, 'value', '值', '0', 'string', '文本框', '2', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2014', 'dicts', null, 'name', '名称', '0', 'string', '文本框', '3', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2015', 'dicts', null, 'object', '表名', '0', 'string', '文本框', '4', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2016', 'dicts', null, 'field', '字段名', '0', 'string', '文本框', '5', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2017', 'dicts', null, 'ext', '扩展Json', '0', 'string', '文本框', '6', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2018', 'hotel', null, 'province', '省', '0', 'number', '下拉框', '11', 'select id ID,name CN from area where lv = 1;ds=main', '0', '1', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2019', 'hotel', null, 'city', '市', '0', 'number', '下拉框', '12', 'select id ID,name CN from area where lv = 2;ds=main', '0', '1', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2020', 'hotel', null, 'region', '区', '0', 'number', '下拉框', '13', 'select id ID,name CN from area where lv = 3;ds=main', '0', '1', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2021', 'hotel', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2022', 'hotel', null, 'name', '酒店名', '0', 'string', '文本框', '3', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2023', 'hotel', null, 'tel', '电话', '0', 'string', '文本框', '4', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2024', 'hotel', null, 'address', '详细地址', '0', 'string', '文本域', '10', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '250', '20', null);
INSERT INTO `eova_field` VALUES ('2025', 'hotel', null, 'create_time', '创建时间', '0', 'time', '时间框', '8', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2026', 'hotel', null, 'state', '商户状态', '0', 'number', '下拉框', '7', 'select value ID,name CN from dicts where object = \'hotel\' and field = \'state\';ds=main', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2027', 'hotel', null, 'score', '积分', '0', 'number', '文本框', '7', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2028', 'hotel_bed', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '0', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2029', 'hotel_bed', null, 'hotel_id', '酒店', '0', 'number', '下拉框', '2', 'select id ID,name CN from hotel where 1=1;ds=main', '1', '0', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2030', 'hotel_bed', null, 'sizes', '床铺尺码', '0', 'number', '下拉框', '3', 'select value ID,name CN from dicts where object = \'product\' and field = \'size\';ds=main', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2031', 'hotel_bed', null, 'num', '数量', '0', 'number', '文本框', '4', null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '1', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2032', 'hotel_stock', null, 'id', 'ID', '1', 'number', '自增框', '1', '', '0', '0', '0', '1', '1', '1', '1', '1', '0', '', '', '', '', '130', '20', null);
INSERT INTO `eova_field` VALUES ('2033', 'hotel_stock', null, 'hotel_id', '酒店', '0', 'string', '下拉框', '2', 'select id ID,name CN from hotel where 1=1;ds=main', '1', '0', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2034', 'hotel_stock', null, 'category', '商品类型', '0', 'number', '下拉框', '3', 'select value ID,name CN from dicts where object = \'product\' and field = \'category\';ds=main', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2035', 'hotel_stock', null, 'num', '存货量', '0', 'number', '文本框', '4', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '1', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2036', 'item_code', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2037', 'item_code', null, 'name', '名称', '0', 'string', '文本框', '2', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2038', 'item_code', null, 'info', '介绍', '1', 'string', '编辑框', '4', '', '1', '1', '0', '1', '1', '1', '1', '1', '0', '', null, '', 'function(value, row, index, field) {\r\n    if (value && value.length > 10) {\r\n        return \'<span title=\"\' + value + \'\">\' + value + \'</span>\';\r\n    }\r\n    return value;\r\n}', '200', '20', null);
INSERT INTO `eova_field` VALUES ('2039', 'item_code', null, 'img', '图片', '0', 'string', '图片框', '1', '', '0', '1', '0', '1', '1', '1', '1', '1', '0', '', null, '', 'function(value, row, index, field) {\r\n    if (value) {\r\n        return \'<img src=\"/upimg/\' + value + \'\">\';\r\n    }\r\n    return value;\r\n}', '200', '20', null);
INSERT INTO `eova_field` VALUES ('2040', 'meta_template', null, 'meta', 'meta', '0', 'string', '文本框', '9', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2041', 'orders', '', 'diy_fun', '关联', '0', 'string', '文本框', '100', '', '0', '1', '0', '0', '0', '0', '0', '0', '0', '', '', '', 'function(value,row,index,field){return\'<a target=\"_blank\" href=\"/singleGrid/list/biz_comment?query_order_id=\'+row.id+\'\" style=\"color:blue\">查看评价</a> <a target=\"_blank\" href=\"/form/update/payment-\'+row.pay_id+\'\" style=\"color:blue\">支付详情</a>\'}', '130', '20', null);
INSERT INTO `eova_field` VALUES ('2042', 'orders', null, 'hotel_id', '酒店', '0', 'number', '查找框', '1', 'select id ID,name 酒店名,address 地址 from hotel', '1', '1', '0', '1', '1', '1', '1', '1', '0', '', null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2043', 'orders', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2044', 'orders', null, 'pay_id', '支付ID', '0', 'number', '文本框', '6', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2045', 'orders', null, 'state', '订单状态', '0', 'number', '下拉框', '3', 'select value ID,name CN from dicts where object = \'orders\' and field = \'state\';ds=main', '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '10', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2046', 'orders', null, 'money', '应付金额', '0', 'string', '文本框', '4', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0.00', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2047', 'orders', null, 'score', '消耗积分', '0', 'string', '文本框', '5', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0.00', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2048', 'orders', null, 'memo', '备注', '0', 'string', '文本域', '6', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2049', 'orders', null, 'create_user_id', '创建用户ID', '0', 'number', '查找框', '7', 'select id UID,nickname 用户名 from eova_user where 1=1;ds=eova', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2050', 'orders', null, 'update_user_id', '最后更新人', '0', 'number', '查找框', '8', 'select id UID,nickname 用户名 from eova_user where 1=1;ds=eova', '1', '0', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2051', 'orders', null, 'create_time', '订单时间', '0', 'time', '时间框', '9', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2052', 'orders', null, 'update_time', '更新时间', '0', 'time', '时间框', '10', null, '0', '0', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2053', 'orders', null, 'is_invoice', '是否开票', '0', 'number', '复选框', '11', 'select value ID,name CN from dicts where object = \'orders\' and field = \'is_invoice\';ds=main', '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2054', 'orders', null, 'additional_info', '订单补充信息(JSON格式)', '0', 'string', '文本域', '12', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, '', '', '130', '20', null);
INSERT INTO `eova_field` VALUES ('2055', 'order_item', null, 'id', '编号', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2056', 'order_item', null, 'order_id', '订单ID', '0', 'number', '文本框', '2', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2057', 'order_item', null, 'product', '产品', '0', 'string', '文本框', '3', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '230', '20', null);
INSERT INTO `eova_field` VALUES ('2058', 'order_item', null, 'price', '单价', '0', 'string', '文本框', '4', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2059', 'order_item', null, 'num', '购买数量', '0', 'number', '文本框', '5', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '1', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2060', 'payment', null, 'id', '编号', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2061', 'payment', null, 'relation_id', '订单ID', '0', 'number', '文本框', '2', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2062', 'payment', null, 'subject', '商品名', '0', 'string', '文本框', '3', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2063', 'payment', null, 'money', '支付金额', '0', 'string', '文本框', '4', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '0.00', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2064', 'payment', null, 'platform', '支付平台', '0', 'number', '下拉框', '5', 'select value ID,name CN from dicts where object = \'payment\' and field = \'platform\';ds=main', '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2065', 'payment', null, 'pay_business', '支付业务', '0', 'number', '下拉框', '6', 'select value ID,name CN from dicts where object = \'payment\' and field = \'pay_business\';ds=main', '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '1', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2066', 'payment', null, 'pay_sequence', '支付流水号', '0', 'string', '文本框', '7', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2067', 'payment', null, 'platform_sequence', '平台流水号', '0', 'string', '文本框', '8', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2068', 'payment', null, 'bank_sequence', '银行流水号', '0', 'string', '文本框', '9', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2069', 'payment', null, 'status', '支付状态', '0', 'number', '文本框', '10', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2070', 'payment', null, 'failed_reason', '支付失败原因', '0', 'string', '文本框', '11', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2071', 'payment', null, 'extend_info', '支付扩展信息', '0', 'string', '文本域', '20', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, '', null, '130', '120', null);
INSERT INTO `eova_field` VALUES ('2072', 'payment', null, 'create_user_id', '创建用户ID', '0', 'number', '查找框', '2', 'select id UID,nickname 用户名 from eova_user where 1=1;ds=eova', '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2073', 'payment', null, 'create_time', '创建时间', '0', 'time', '时间框', '14', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2074', 'payment', null, 'update_time', '更新时间', '0', 'time', '时间框', '15', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2075', 'player_code', null, 'tag', '标签', '0', 'string', '下拉框', '10', 'select value ID , name CN from dicts where object = \'users\' and field = \'tag\'', '1', '1', '0', '1', '1', '1', '1', '1', '1', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2076', 'player_code', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2077', 'player_code', null, 'status', '状态', '0', 'string', '下拉框', '2', 'select value ID , name CN from dicts where object = \'users\' and field = \'status\' or object = \'${user.id}\'', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2078', 'player_code', null, 'login_id', '登录账户', '0', 'string', '文本框', '3', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2079', 'player_code', null, 'login_pwd', '录登密码', '0', 'string', '密码框', '4', null, '0', '1', '1', '1', '1', '1', '0', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2080', 'player_code', null, 'nickname', '艺人姓名', '0', 'string', '文本框', '1', '', '1', '1', '0', '1', '1', '1', '1', '1', '0', '', null, '', 'function(value, row, index, field) {    if (value) {        return \'<b style=\"\">\'+ value +\'</b>\';    }    return value;}', '130', '20', null);
INSERT INTO `eova_field` VALUES ('2081', 'player_code', null, 'reg_time', '注册时间', '0', 'time', '日期框', '6', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, 'CURRENT_TIMESTAMP', null, '180', '20', null);
INSERT INTO `eova_field` VALUES ('2082', 'player_code', null, 'info', '备注', '0', 'string', '编辑框', '9', null, '0', '1', '0', '1', '0', '0', '0', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2083', 'product', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('2084', 'product', null, 'type', '产品类型', '0', 'number', '下拉框', '2', 'select value ID,name CN from dicts where object = \'product\' and field = \'type\'', '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '1', null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('2085', 'product', null, 'category', '分类', '0', 'number', '下拉框', '3', 'select value ID,name CN from dicts where object = \'product\' and field = \'category\'', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('2086', 'product', null, 'stuff', '材料', '0', 'number', '下拉框', '4', 'select value ID,name CN from dicts where object = \'product\' and field = \'stuff\'', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('2087', 'product', null, 'sizes', '尺码', '0', 'number', '下拉框', '5', 'select value ID,name CN from dicts where object = \'product\' and field = \'size\'', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '70', '20', null);
INSERT INTO `eova_field` VALUES ('2088', 'product', null, 'name', '名称', '0', 'string', '文本框', '6', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '200', '20', null);
INSERT INTO `eova_field` VALUES ('2089', 'product', null, 'img', '商品图片', '0', 'string', '图片框', '1', null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, '', null, '130', '20', '{\"filedir\":\"/image/bucao/product\"}');
INSERT INTO `eova_field` VALUES ('2090', 'product', null, 'test_price', '试用单价', '0', 'string', '文本框', '8', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2091', 'product', null, 'price', '商品单价', '0', 'string', '文本框', '9', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2092', 'product', null, 'cost_score', '消耗积分', '0', 'number', '文本框', '10', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2093', 'product', null, 'score', '奖励积分', '0', 'number', '文本框', '11', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2094', 'product', null, 'stock', '库存', '0', 'number', '文本框', '12', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '1', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2095', 'product', null, 'create_time', '创建时间', '0', 'time', '日期框', '13', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2096', 'product', null, 'update_time', '更新时间', '0', 'time', '时间框', '14', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, 'CURRENT_TIMESTAMP', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2097', 'users_exp_code', null, 'users_id', 'users_id', '0', 'number', '文本框', '1', '', '0', '1', '0', '1', '1', '1', '1', '0', '0', '', null, '', '', '130', '20', null);
INSERT INTO `eova_field` VALUES ('2098', 'users_exp_code', null, 'exp', '经验值', '0', 'number', '文本框', '2', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2099', 'users_exp_code', null, 'avg', '年龄', '0', 'number', '文本框', '3', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2100', 'users_exp_code', null, 'qq', 'QQ', '0', 'string', '文本框', '4', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2101', 'users_item_code', null, 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2102', 'users_item_code', null, 'users_id', '艺人', '0', 'number', '查找框', '2', 'select id ID,nickname CN from users where <%if(user.id != 0){%>  id > ${user.id}<%}%> order by id desc', '1', '1', '0', '0', '1', '1', '1', '0', '0', null, null, '', 'function(value,row,index,field){return\'<a target=\"_blank\" href=\"http://g.cn\" style=\"color:blue\">\'+value+\'</a>\'}', '130', '20', null);
INSERT INTO `eova_field` VALUES ('2103', 'users_item_code', null, 'item_id', '道具', '0', 'number', '下拉框', '3', 'select id ID,name CN from item where 1=1;ds=main', '1', '1', '0', '0', '1', '1', '1', '1', '0', null, null, null, null, '300', '20', null);
INSERT INTO `eova_field` VALUES ('2104', 'users_item_code', '', 'my_fun', '操作', '0', 'number', '文本框', '4', '', '0', '1', '0', '0', '0', '0', '0', '0', '0', '', null, '', 'function(value,row,index,field){return\'<a href=\"/form/add/users_item_code\" style=\"color:blue\">添加</a> <a href=\"/form/update/users_item_code-\'+row.id+\'\" style=\"color:blue\">修改</a>\'}', '130', '20', null);
INSERT INTO `eova_field` VALUES ('2105', 'v_users_code', 'player_code', 'id', 'ID', '1', 'number', '自增框', '1', null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2106', 'v_users_code', 'player_code', 'status', '状态', '0', 'number', '数字框', '2', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, 'range[1~9]', '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2107', 'v_users_code', 'player_code', 'login_id', '登录账户', '0', 'string', '文本框', '3', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', '请输入帐号', 'username', null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2108', 'v_users_code', 'player_code', 'login_pwd', '录登密码', '0', 'string', '密码框', '4', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', '请输入密码', 'length[6~16]', null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2109', 'v_users_code', 'player_code', 'nickname', '昵称', '0', 'string', '文本域', '20', null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, 'chinese;length[2~10]', null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2110', 'v_users_code', 'player_code', 'reg_time', '注册时间', '0', 'time', '时间框', '6', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2111', 'v_users_code', 'player_code', 'info', '备注', '0', 'string', '颜色框', '30', null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2112', 'v_users_code', 'users_exp_code', 'exp', '经验值', '0', 'number', '文本框', '9', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '0', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2113', 'v_users_code', 'users_exp_code', 'avg', '年龄', '0', 'number', '文本框', '10', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, 'range[1~150]', '1', null, '130', '20', null);
INSERT INTO `eova_field` VALUES ('2114', 'v_users_code', 'users_exp_code', 'qq', 'QQ', '0', 'string', '文本框', '22', null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, 'qq', null, null, '130', '20', null);

-- ----------------------------
-- Table structure for `eova_log`
-- ----------------------------
DROP TABLE IF EXISTS `eova_log`;
CREATE TABLE `eova_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作用户',
  `type` int(11) NOT NULL COMMENT '日志类型',
  `ip` varchar(255) NOT NULL COMMENT '操作IP',
  `info` varchar(500) DEFAULT NULL COMMENT '操作详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_log
-- ----------------------------

-- ----------------------------
-- Table structure for `eova_menu`
-- ----------------------------
DROP TABLE IF EXISTS `eova_menu`;
CREATE TABLE `eova_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL COMMENT '编码',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `type` varchar(20) NOT NULL COMMENT '菜单类型',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `order_num` int(11) DEFAULT '0' COMMENT '序号',
  `parent_id` int(11) DEFAULT '0' COMMENT '父节点',
  `is_collapse` tinyint(1) DEFAULT '0' COMMENT '是否折叠',
  `biz_intercept` varchar(255) DEFAULT NULL COMMENT '自定义业务拦截器',
  `url` varchar(255) DEFAULT NULL COMMENT '自定义URL',
  `config` varchar(500) DEFAULT NULL COMMENT '菜单配置JSON',
  `diy_js` varchar(255) DEFAULT NULL COMMENT '依赖JS文件',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  `filter` varchar(500) DEFAULT NULL COMMENT '初始数据过滤条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_menu
-- ----------------------------
INSERT INTO `eova_menu` VALUES ('1', 'eova', '平台维护', 'dir', 'icon-bricks', '3', '0', '0', null, null, null, null, '0', null);
INSERT INTO `eova_menu` VALUES ('2', 'sys', '系统管理', 'dir', 'icon-cog', '2', '0', '0', null, null, null, null, '0', null);
INSERT INTO `eova_menu` VALUES ('3', 'biz', '综合业务', 'dir', 'icon-plugin', '1', '0', '0', null, null, null, null, '0', null);
INSERT INTO `eova_menu` VALUES ('20', 'eova_menu', '菜单管理', 'single_tree', 'icon-applicationsidetree', '1', '1', '0', 'com.eova.core.menu.MenuIntercept', null, '{\"objectCode\":\"eova_menu_code\",\"treegrid\":{\"iconField\":\"icon\",\"parentField\":\"parent_id\",\"treeField\":\"name\"}}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('21', 'eova_button', '按钮管理', 'tree_grid', 'icon-layout', '2', '1', '0', null, null, '{\"objectCode\":\"eova_button_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('22', 'eova_object', '元数据管理', 'master_slave_grid', 'icon-databasetable', '3', '1', '0', 'com.eova.core.object.ObjectIntercept', null, '{\"fields\":[\"object_code\"],\"objectCode\":\"eova_object_code\",\"objectField\":\"code\",\"objects\":[\"eova_field_code\"]}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('23', 'eova_dictionary', '字典管理', 'single_grid', 'icon-bookopen', '5', '1', '0', null, null, '{\"objectCode\":\"eova_dict_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('24', 'eova_icon', '图标实例', 'diy', 'icon-applicationviewicons', '6', '1', '0', null, '/toIcon', null, null, '0', null);
INSERT INTO `eova_menu` VALUES ('25', 'eova_task', '定时调度', 'single_grid', 'icon-clock', '4', '1', '0', '', '', '{\"objectCode\":\"eova_task_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('50', 'sys_auth_user', '用户管理', 'single_grid', 'icon-group', '1', '2', '0', null, null, '{\"objectCode\":\"eova_user_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('51', 'sys_auth_role', '角色管理', 'single_grid', 'icon-groupkey', '2', '2', '0', null, null, '{\"objectCode\":\"eova_role_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('52', 'sys_log', '系统日志', 'single_grid', 'icon-tablemultiple', '3', '2', '0', null, null, '{\"objectCode\":\"eova_log_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('1000', 'biz_demo', '功能演示', 'dir', 'icon-bookopen', '1', '3', '1', null, null, null, null, '0', null);
INSERT INTO `eova_menu` VALUES ('1001', 'biz_demo_users', '单表CRUD', 'single_grid', 'icon-grouplink', '1', '1000', '0', '', '', '{\"objectCode\":\"player_code\"}', null, '0', 'where status = 1 or status = 2');
INSERT INTO `eova_menu` VALUES ('1002', 'biz_demo_tool', '富文本编辑', 'single_grid', 'icon-controller', '1', '1000', '0', null, null, '{\"objectCode\":\"item_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('1003', 'biz_demo_usersitem', '下拉和查找', 'single_grid', 'icon-controller', '1', '1000', '0', null, null, '{\"objectCode\":\"users_item_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('1004', 'biz_demo_usersview', '多表视图', 'single_grid', 'icon-applicationviewcolumns', '1', '1000', '0', null, null, '{\"objectCode\":\"v_users_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('1005', 'biz_demo_userscell', '表格单元格编辑', 'single_grid', 'icon-applicationviewcolumns', '1', '1000', '0', null, null, '{\"objectCode\":\"celledit_users_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('1006', 'biz_demo_import', '导入导出', 'single_grid', 'icon-arrowswitch', '1', '1000', '0', null, null, '{\"objectCode\":\"player_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('1007', 'biz_users_exp', '非自增主键拓展表', 'single_grid', 'icon-applicationdouble', '1', '1000', '0', '', '', '{\"objectCode\":\"users_exp_code\"}', '/ui/js/diy/test.js', '0', null);
INSERT INTO `eova_menu` VALUES ('1009', 'biz_product', '产品管理', 'single_grid', 'icon-box', '1', '3', '0', '', '', '{\"objectCode\":\"product\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('1010', 'biz_hotelzz', '酒店管理', 'master_slave_grid', 'icon-building', '1', '3', '0', '', '', '{\"fields\":[\"hotel_id\",\"hotel_id\"],\"objectCode\":\"hotel\",\"objectField\":\"id\",\"objects\":[\"hotel_bed\",\"hotel_stock\"]}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('1011', 'biz_caidan', '三级菜单', 'dir', 'icon-applicationsidetree', '1', '1000', '0', '', '', '{}', '', '0', '');
INSERT INTO `eova_menu` VALUES ('1012', 'biz_4j', '四级目录', 'dir', '', '1', '1011', '0', '', '', '{}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('1013', 'biz_4j_test1', '仅显有功能目录', 'single_grid', 'icon-applicationosxcascade', '1', '1012', '0', '', '', '{\"objectCode\":\"player_code\"}', null, '0', null);
INSERT INTO `eova_menu` VALUES ('1014', 'biz_demo_area', '区域管理', 'single_tree', 'icon-applicationsidetree', '0', '3', '0', null, null, '{\"objectCode\":\"biz_demo_area\"}', null, '0', null);

-- ----------------------------
-- Table structure for `eova_menu_object`
-- ----------------------------
DROP TABLE IF EXISTS `eova_menu_object`;
CREATE TABLE `eova_menu_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_code` varchar(50) NOT NULL COMMENT '菜单编码',
  `object_code` varchar(50) NOT NULL COMMENT '对象编码',
  `indexs` int(11) DEFAULT '0' COMMENT '对象索引',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_menu_object
-- ----------------------------

-- ----------------------------
-- Table structure for `eova_object`
-- ----------------------------
DROP TABLE IF EXISTS `eova_object`;
CREATE TABLE `eova_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL COMMENT '对象编码',
  `name` varchar(100) NOT NULL COMMENT '对象名称',
  `view_name` varchar(255) DEFAULT NULL COMMENT '查询数据视图',
  `table_name` varchar(255) DEFAULT NULL COMMENT '保存数据主表',
  `pk_name` varchar(50) NOT NULL COMMENT '主键',
  `data_source` varchar(50) DEFAULT 'main' COMMENT '数据源',
  `is_single` tinyint(1) DEFAULT '1' COMMENT '是否单选',
  `is_celledit` tinyint(1) DEFAULT '0' COMMENT '是否可行内编辑',
  `is_show_num` tinyint(1) DEFAULT '1' COMMENT '是否显示行号',
  `is_first_load` tinyint(1) DEFAULT '1' COMMENT '是否初始加载数据',
  `filter` varchar(500) DEFAULT NULL COMMENT '初始数据过滤条件',
  `default_order` varchar(255) DEFAULT NULL COMMENT '默认排序字段(desc)',
  `diy_card` varchar(255) DEFAULT NULL COMMENT '自定义卡片面板',
  `diy_js` varchar(255) DEFAULT NULL COMMENT '依赖JS文件',
  `biz_intercept` varchar(255) DEFAULT NULL COMMENT '自定义业务拦截器',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_object
-- ----------------------------
INSERT INTO `eova_object` VALUES ('1', 'meta_template', '元对象模版数据', null, 'eova_template', 'id', 'eova', '1', '0', '1', '1', null, null, null, null, null);
INSERT INTO `eova_object` VALUES ('2', 'eova_menu_code', '菜单', null, 'eova_menu', 'id', 'eova', '0', '0', '1', '1', 'where id > 999 ', '', null, '', 'com.eova.core.menu.MenuIntercept');
INSERT INTO `eova_object` VALUES ('3', 'eova_object_code', '对象', null, 'eova_object', 'id', 'eova', '0', '0', '1', '1', 'where id > 999 ', 'id desc', null, '', 'com.eova.core.object.ObjectIntercept');
INSERT INTO `eova_object` VALUES ('4', 'eova_field_code', '字段', null, 'eova_field', 'id', 'eova', '1', '1', '1', '1', null, 'order_num', null, null, null);
INSERT INTO `eova_object` VALUES ('5', 'eova_button_code', '按钮', null, 'eova_button', 'id', 'eova', '0', '0', '1', '1', 'where id > 999 and is_base = 0', 'id desc', null, '', '');
INSERT INTO `eova_object` VALUES ('6', 'eova_user_code', '用户', null, 'eova_user', 'id', 'eova', '1', '0', '1', '1', null, 'id desc', null, null, 'com.eova.core.user.UserIntercept');
INSERT INTO `eova_object` VALUES ('7', 'eova_role_code', '角色管理', null, 'eova_role', 'id', 'eova', '1', '0', '1', '1', null, 'id desc', null, null, null);
INSERT INTO `eova_object` VALUES ('8', 'eova_dict_code', '字典管理', null, 'eova_dict', 'id', 'eova', '1', '0', '1', '1', null, 'id desc', null, null, null);
INSERT INTO `eova_object` VALUES ('9', 'eova_log_code', '操作日志', null, 'eova_log', 'id', 'eova', '1', '0', '1', '1', null, 'id desc', null, null, null);
INSERT INTO `eova_object` VALUES ('10', 'eova_task_code', '定时调度', null, 'eova_task', 'id', 'eova', '1', '0', '1', '1', null, null, null, null, 'com.eova.core.task.TaskIntercept');
INSERT INTO `eova_object` VALUES ('1000', 'dicts', '业务字典', null, 'dicts', 'id', 'main', '1', '0', '1', '1', null, null, null, null, null);
INSERT INTO `eova_object` VALUES ('1001', 'player_code', '玩家信息', null, 'users', 'id', 'main', '0', '0', '1', '1', '', 'id desc', null, '', '');
INSERT INTO `eova_object` VALUES ('1002', 'item_code', '道具', null, 'item', 'id', 'main', '1', '0', '1', '1', null, null, null, null, null);
INSERT INTO `eova_object` VALUES ('1003', 'users_item_code', '艺人关联道具', null, 'users_item', 'id', 'main', '1', '0', '1', '1', '', '', null, '', '');
INSERT INTO `eova_object` VALUES ('1004', 'v_users_code', '艺人详情', 'v_users', '', 'id', 'main', '1', '1', '1', '1', '', '', null, '', '');
INSERT INTO `eova_object` VALUES ('1005', 'celledit_users_code', '可编辑用户', null, 'users', 'id', 'main', '1', '1', '1', '1', '', '', null, '', '');
INSERT INTO `eova_object` VALUES ('1006', 'users_exp_code', '艺人信息拓展', null, 'users_exp', 'users_id', 'main', '1', '0', '1', '1', '', '', null, '', '');
INSERT INTO `eova_object` VALUES ('1007', 'hotel', '酒店', null, 'hotel', 'id', 'main', '1', '0', '1', '1', '', '', null, '/ui/js/diy/area.js', '');
INSERT INTO `eova_object` VALUES ('1008', 'order_item', '订单项', null, 'order_item', 'id', 'main', '1', '0', '1', '1', null, null, null, null, null);
INSERT INTO `eova_object` VALUES ('1009', 'payment', '支付', null, 'payment', 'id', 'main', '1', '0', '1', '1', null, null, null, null, null);
INSERT INTO `eova_object` VALUES ('1010', 'product', '产品', null, 'product', 'id', 'main', '1', '0', '1', '1', '', '', null, '', '');
INSERT INTO `eova_object` VALUES ('1011', 'hotel_bed', '酒店床位', null, 'hotel_bed', 'id', 'main', '1', '0', '1', '1', null, null, null, null, null);
INSERT INTO `eova_object` VALUES ('1012', 'orders', '订单管理', null, 'orders', 'id', 'main', '1', '0', '1', '0', null, null, null, null, null);
INSERT INTO `eova_object` VALUES ('1014', 'hotel_stock', '酒店存货', null, 'hotel_stock', 'id', 'main', '1', '0', '1', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `eova_role`
-- ----------------------------
DROP TABLE IF EXISTS `eova_role`;
CREATE TABLE `eova_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '角色名',
  `info` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_role
-- ----------------------------
INSERT INTO `eova_role` VALUES ('1', '超级管理员', '开发者权限(禁止作为业务权限)');
INSERT INTO `eova_role` VALUES ('2', '管理员', '管理所有可用功能');
INSERT INTO `eova_role` VALUES ('3', '测试', '测试人员');

-- ----------------------------
-- Table structure for `eova_role_btn`
-- ----------------------------
DROP TABLE IF EXISTS `eova_role_btn`;
CREATE TABLE `eova_role_btn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL COMMENT '角色',
  `bid` int(11) NOT NULL COMMENT '功能',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_role_btn
-- ----------------------------
INSERT INTO `eova_role_btn` VALUES ('1', '1', '1053');
INSERT INTO `eova_role_btn` VALUES ('2', '1', '1054');
INSERT INTO `eova_role_btn` VALUES ('3', '1', '1055');
INSERT INTO `eova_role_btn` VALUES ('4', '1', '1056');
INSERT INTO `eova_role_btn` VALUES ('5', '1', '1024');
INSERT INTO `eova_role_btn` VALUES ('6', '1', '1025');
INSERT INTO `eova_role_btn` VALUES ('7', '1', '1026');
INSERT INTO `eova_role_btn` VALUES ('8', '1', '1027');
INSERT INTO `eova_role_btn` VALUES ('9', '1', '1028');
INSERT INTO `eova_role_btn` VALUES ('10', '1', '1029');
INSERT INTO `eova_role_btn` VALUES ('11', '1', '1000');
INSERT INTO `eova_role_btn` VALUES ('12', '1', '1001');
INSERT INTO `eova_role_btn` VALUES ('13', '1', '1002');
INSERT INTO `eova_role_btn` VALUES ('14', '1', '1003');
INSERT INTO `eova_role_btn` VALUES ('15', '1', '1004');
INSERT INTO `eova_role_btn` VALUES ('16', '1', '1005');
INSERT INTO `eova_role_btn` VALUES ('17', '1', '1006');
INSERT INTO `eova_role_btn` VALUES ('18', '1', '1007');
INSERT INTO `eova_role_btn` VALUES ('19', '1', '1008');
INSERT INTO `eova_role_btn` VALUES ('20', '1', '1009');
INSERT INTO `eova_role_btn` VALUES ('21', '1', '1010');
INSERT INTO `eova_role_btn` VALUES ('22', '1', '1011');
INSERT INTO `eova_role_btn` VALUES ('23', '1', '1012');
INSERT INTO `eova_role_btn` VALUES ('24', '1', '1013');
INSERT INTO `eova_role_btn` VALUES ('25', '1', '1014');
INSERT INTO `eova_role_btn` VALUES ('26', '1', '1015');
INSERT INTO `eova_role_btn` VALUES ('27', '1', '1016');
INSERT INTO `eova_role_btn` VALUES ('28', '1', '1017');
INSERT INTO `eova_role_btn` VALUES ('29', '1', '1059');
INSERT INTO `eova_role_btn` VALUES ('30', '1', '1065');
INSERT INTO `eova_role_btn` VALUES ('31', '1', '1066');
INSERT INTO `eova_role_btn` VALUES ('32', '1', '1067');
INSERT INTO `eova_role_btn` VALUES ('33', '1', '1068');
INSERT INTO `eova_role_btn` VALUES ('34', '1', '1069');
INSERT INTO `eova_role_btn` VALUES ('35', '1', '1070');
INSERT INTO `eova_role_btn` VALUES ('36', '1', '1018');
INSERT INTO `eova_role_btn` VALUES ('37', '1', '1019');
INSERT INTO `eova_role_btn` VALUES ('38', '1', '1020');
INSERT INTO `eova_role_btn` VALUES ('39', '1', '1021');
INSERT INTO `eova_role_btn` VALUES ('40', '1', '1022');
INSERT INTO `eova_role_btn` VALUES ('41', '1', '1023');
INSERT INTO `eova_role_btn` VALUES ('42', '1', '1036');
INSERT INTO `eova_role_btn` VALUES ('43', '1', '1037');
INSERT INTO `eova_role_btn` VALUES ('44', '1', '1038');
INSERT INTO `eova_role_btn` VALUES ('45', '1', '1039');
INSERT INTO `eova_role_btn` VALUES ('46', '1', '1040');
INSERT INTO `eova_role_btn` VALUES ('47', '1', '1041');
INSERT INTO `eova_role_btn` VALUES ('48', '1', '1042');
INSERT INTO `eova_role_btn` VALUES ('49', '1', '1043');
INSERT INTO `eova_role_btn` VALUES ('50', '1', '1044');
INSERT INTO `eova_role_btn` VALUES ('51', '1', '1045');
INSERT INTO `eova_role_btn` VALUES ('52', '1', '1046');
INSERT INTO `eova_role_btn` VALUES ('53', '1', '1047');
INSERT INTO `eova_role_btn` VALUES ('54', '1', '1048');
INSERT INTO `eova_role_btn` VALUES ('55', '1', '1049');
INSERT INTO `eova_role_btn` VALUES ('56', '1', '1050');
INSERT INTO `eova_role_btn` VALUES ('57', '1', '1051');
INSERT INTO `eova_role_btn` VALUES ('58', '1', '1052');
INSERT INTO `eova_role_btn` VALUES ('65', '1', '120');
INSERT INTO `eova_role_btn` VALUES ('66', '1', '121');
INSERT INTO `eova_role_btn` VALUES ('67', '1', '122');
INSERT INTO `eova_role_btn` VALUES ('68', '1', '123');
INSERT INTO `eova_role_btn` VALUES ('69', '1', '124');
INSERT INTO `eova_role_btn` VALUES ('70', '1', '125');
INSERT INTO `eova_role_btn` VALUES ('71', '1', '100');
INSERT INTO `eova_role_btn` VALUES ('72', '1', '101');
INSERT INTO `eova_role_btn` VALUES ('73', '1', '102');
INSERT INTO `eova_role_btn` VALUES ('74', '1', '103');
INSERT INTO `eova_role_btn` VALUES ('75', '1', '104');
INSERT INTO `eova_role_btn` VALUES ('76', '1', '105');
INSERT INTO `eova_role_btn` VALUES ('77', '1', '106');
INSERT INTO `eova_role_btn` VALUES ('78', '1', '140');
INSERT INTO `eova_role_btn` VALUES ('79', '1', '1');
INSERT INTO `eova_role_btn` VALUES ('80', '1', '3');
INSERT INTO `eova_role_btn` VALUES ('81', '1', '4');
INSERT INTO `eova_role_btn` VALUES ('82', '1', '9');
INSERT INTO `eova_role_btn` VALUES ('83', '1', '8');
INSERT INTO `eova_role_btn` VALUES ('84', '1', '7');
INSERT INTO `eova_role_btn` VALUES ('85', '1', '40');
INSERT INTO `eova_role_btn` VALUES ('86', '1', '41');
INSERT INTO `eova_role_btn` VALUES ('87', '1', '42');
INSERT INTO `eova_role_btn` VALUES ('88', '1', '43');
INSERT INTO `eova_role_btn` VALUES ('89', '1', '44');
INSERT INTO `eova_role_btn` VALUES ('90', '1', '45');
INSERT INTO `eova_role_btn` VALUES ('91', '1', '46');
INSERT INTO `eova_role_btn` VALUES ('92', '1', '20');
INSERT INTO `eova_role_btn` VALUES ('93', '1', '21');
INSERT INTO `eova_role_btn` VALUES ('94', '1', '22');
INSERT INTO `eova_role_btn` VALUES ('95', '1', '23');
INSERT INTO `eova_role_btn` VALUES ('96', '1', '29');
INSERT INTO `eova_role_btn` VALUES ('97', '1', '28');
INSERT INTO `eova_role_btn` VALUES ('98', '1', '25');
INSERT INTO `eova_role_btn` VALUES ('99', '1', '26');
INSERT INTO `eova_role_btn` VALUES ('100', '1', '27');
INSERT INTO `eova_role_btn` VALUES ('101', '1', '80');
INSERT INTO `eova_role_btn` VALUES ('102', '1', '81');
INSERT INTO `eova_role_btn` VALUES ('103', '1', '82');
INSERT INTO `eova_role_btn` VALUES ('104', '1', '83');
INSERT INTO `eova_role_btn` VALUES ('105', '1', '86');
INSERT INTO `eova_role_btn` VALUES ('106', '1', '87');
INSERT INTO `eova_role_btn` VALUES ('107', '1', '88');
INSERT INTO `eova_role_btn` VALUES ('108', '1', '60');
INSERT INTO `eova_role_btn` VALUES ('109', '1', '61');
INSERT INTO `eova_role_btn` VALUES ('110', '1', '62');
INSERT INTO `eova_role_btn` VALUES ('111', '1', '63');
INSERT INTO `eova_role_btn` VALUES ('112', '1', '64');
INSERT INTO `eova_role_btn` VALUES ('113', '1', '65');
INSERT INTO `eova_role_btn` VALUES ('114', '1', '1071');
INSERT INTO `eova_role_btn` VALUES ('115', '1', '1072');

-- ----------------------------
-- Table structure for `eova_task`
-- ----------------------------
DROP TABLE IF EXISTS `eova_task`;
CREATE TABLE `eova_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0=停止，1=启动',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `exp` varchar(50) NOT NULL COMMENT '表达式',
  `class` varchar(255) NOT NULL COMMENT '实现类',
  `info` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_task
-- ----------------------------
INSERT INTO `eova_task` VALUES ('1', '0', '每分', '0 0/1 * * * ?', 'com.oss.job.EveryMinJob', '每分钟来一发');
INSERT INTO `eova_task` VALUES ('2', '0', '每时', '0 0 0/1 * * ?', 'com.oss.job.EveryHourJob', '每小时统计一次');
INSERT INTO `eova_task` VALUES ('12', '0', '每天', '59 59 23 * * ?', 'com.oss.job.EveryDayJob', '每天23点59分59秒跑一下');

-- ----------------------------
-- Table structure for `eova_user`
-- ----------------------------
DROP TABLE IF EXISTS `eova_user`;
CREATE TABLE `eova_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(30) NOT NULL COMMENT '帐号',
  `login_pwd` varchar(50) NOT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT '' COMMENT '中文名',
  `rid` int(11) DEFAULT '0' COMMENT '角色ID',
  `hotel_id` int(11) DEFAULT '0' COMMENT '所属酒店',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_user
-- ----------------------------
INSERT INTO `eova_user` VALUES ('1', 'admin', '89BDF69372C2EF53EA409CDF020B5694', '超级管理员', '1', '0');
INSERT INTO `eova_user` VALUES ('2', 'eova', '89BDF69372C2EF53EA409CDF020B5694', '管理员', '2', '0');
INSERT INTO `eova_user` VALUES ('3', 'test', '89BDF69372C2EF53EA409CDF020B5694', '测试', '3', '19');

-- ----------------------------
-- Table structure for `eova_widget`
-- ----------------------------
DROP TABLE IF EXISTS `eova_widget`;
CREATE TABLE `eova_widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(5) NOT NULL DEFAULT '1' COMMENT '控件类型：1=EOVA控件，2=DIY控件',
  `value` varchar(50) NOT NULL COMMENT '控件值',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `version` float(5,1) DEFAULT '1.0' COMMENT '版本号',
  `path` varchar(50) DEFAULT NULL COMMENT '路径',
  `description` varchar(4000) DEFAULT NULL COMMENT '介绍',
  `config` varchar(4000) DEFAULT NULL COMMENT '控件配置信息JSON',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eova_widget
-- ----------------------------
INSERT INTO `eova_widget` VALUES ('1', '1', '文本框', '文本框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('2', '1', '下拉框', '下拉框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('3', '1', '查找框', '查找框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('4', '1', '时间框', '时间框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('5', '1', '文本域', '文本域', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('6', '1', '编辑框', '编辑框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('7', '1', '复选框', '复选框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('8', '1', '自增框', '自增框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('9', '1', '图片框', '图片框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('10', '1', '图标框', '图标框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('11', '1', '文件框', '文件框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('12', '1', '日期框', '日期框', '1.0', null, null, null);
INSERT INTO `eova_widget` VALUES ('13', '2', '密码框', '密码框', '1.0', '/widget/password/index.html', '我的密码框，系统不给，自己造一个，大家一起爽歪歪', null);
INSERT INTO `eova_widget` VALUES ('14', '2', '数字框', '数字框', '1.0', '/widget/number/index.html', 'number', null);
INSERT INTO `eova_widget` VALUES ('15', '2', '颜色框', '颜色框', '1.0', '/widget/color/index.html', 'color', null);
