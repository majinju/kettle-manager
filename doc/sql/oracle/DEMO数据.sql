/*
Navicat MySQL Data Transfer

Source Server         : YUN-SQL
Source Server Version : 50514
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : ORACLE
Target Server Version : 100200
File Encoding         : 65001

Date: 2016-01-29 00:18:46
*/

;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO comments VALUES ('1', '1', '1', '床单没洗干净', TO_TIMESTAMP('2015-10-25 01:16:26', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO comments VALUES ('2', '1', '2', '太棒了，免费，服务还好！', TO_TIMESTAMP('2015-12-04 18:44:53', 'YYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Records of dicts
-- ----------------------------
INSERT INTO dicts VALUES ('1', '1', '被套', 'product', 'category', '');
INSERT INTO dicts VALUES ('2', '2', '床单', 'product', 'category', '');
INSERT INTO dicts VALUES ('3', '3', '浴巾', 'product', 'category', '');
INSERT INTO dicts VALUES ('4', '4', '毛巾', 'product', 'category', '');
INSERT INTO dicts VALUES ('5', '5', '枕套', 'product', 'category', '');
INSERT INTO dicts VALUES ('6', '1', '纯棉', 'product', 'stuff', '');
INSERT INTO dicts VALUES ('7', '2', '涤纶', 'product', 'stuff', '');
INSERT INTO dicts VALUES ('8', '3', '纺纱', 'product', 'stuff', '');
INSERT INTO dicts VALUES ('9', '4', '轻纱', 'product', 'stuff', '');
INSERT INTO dicts VALUES ('10', '1', '90', 'product', 'size', '');
INSERT INTO dicts VALUES ('11', '2', '120', 'product', 'size', '');
INSERT INTO dicts VALUES ('12', '3', '150', 'product', 'size', '');
INSERT INTO dicts VALUES ('13', '4', '180', 'product', 'size', '');
INSERT INTO dicts VALUES ('14', '10', '待支付', 'orders', 'state', '');
INSERT INTO dicts VALUES ('15', '20', '已支付', 'orders', 'state', '');
INSERT INTO dicts VALUES ('16', '30', '已发货', 'orders', 'state', '');
INSERT INTO dicts VALUES ('17', '40', '已收货', 'orders', 'state', '');
INSERT INTO dicts VALUES ('20', '1', '租赁商品', 'product', 'type', '');
INSERT INTO dicts VALUES ('21', '2', '积分商品', 'product', 'type', '');
INSERT INTO dicts VALUES ('22', '1', '普通商户', 'hotel', 'state', '');
INSERT INTO dicts VALUES ('23', '2', '签约商户', 'hotel', 'state', '');
INSERT INTO dicts VALUES ('28', '1', '在线租赁', 'payment', 'pay_business', '');
INSERT INTO dicts VALUES ('29', '1', '支付宝', 'payment', 'platform', '');
INSERT INTO dicts VALUES ('30', '2', '微信', 'payment', 'platform', '');
INSERT INTO dicts VALUES ('33', '0', '正常', 'users', 'status', '');
INSERT INTO dicts VALUES ('34', '1', '封号', 'users', 'status', '');
INSERT INTO dicts VALUES ('35', '2', '禁言', 'users', 'status', '');
INSERT INTO dicts VALUES ('36', '3', '删除', 'users', 'status', '');
INSERT INTO dicts VALUES ('39', '1', '省', 'area', 'lv', '');
INSERT INTO dicts VALUES ('40', '2', '市', 'area', 'lv', '');
INSERT INTO dicts VALUES ('41', '3', '区', 'area', 'lv', '');
INSERT INTO dicts VALUES ('42', '1', '省', 'area', 'lv', '');
INSERT INTO dicts VALUES ('43', '2', '市', 'area', 'lv', '');
INSERT INTO dicts VALUES ('44', '3', '区', 'area', 'lv', '');
INSERT INTO dicts VALUES ('45', '1', '省', 'area', 'lv', '');
INSERT INTO dicts VALUES ('46', '2', '市', 'area', 'lv', '');
INSERT INTO dicts VALUES ('47', '3', '区', 'area', 'lv', '');
INSERT INTO dicts VALUES ('48', '1', '省', 'area', 'lv', '');
INSERT INTO dicts VALUES ('49', '2', '市', 'area', 'lv', '');
INSERT INTO dicts VALUES ('50', '3', '区', 'area', 'lv', '');
INSERT INTO dicts VALUES ('51', '1', '省', 'area', 'lv', '');
INSERT INTO dicts VALUES ('52', '2', '市', 'area', 'lv', '');
INSERT INTO dicts VALUES ('53', '3', '区', 'area', 'lv', '');
INSERT INTO dicts VALUES ('54', '0', '坦克', 'users', 'tag', '');
INSERT INTO dicts VALUES ('55', '1', 'ADC', 'users', 'tag', '');
INSERT INTO dicts VALUES ('56', '2', '打野', 'users', 'tag', '');
INSERT INTO dicts VALUES ('57', '3', 'AP', 'users', 'tag', '');
INSERT INTO dicts VALUES ('58', '1', '省', 'area', 'lv', '');
INSERT INTO dicts VALUES ('59', '2', '市', 'area', 'lv', '');
INSERT INTO dicts VALUES ('60', '3', '区', 'area', 'lv', '');
INSERT INTO dicts VALUES ('61', '1', '省', 'area', 'lv', '');
INSERT INTO dicts VALUES ('62', '2', '市', 'area', 'lv', '');
INSERT INTO dicts VALUES ('63', '3', '区', 'area', 'lv', '');

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO hotel VALUES ('1', '松江锦江之星', '(021)37621128', '上海市松江区西林北路950号', '2', '12', TO_TIMESTAMP('2015-12-04 17:01:30', 'YYYY-MM-DD HH24:MI:SS'), '25', '321', '2705');
INSERT INTO hotel VALUES ('2', '松江锦江之星2', '(021)37621129', '上海市松江区西林北路951号', '1', '0', TO_TIMESTAMP('2015-09-04 17:17:00', 'YYYY-MM-DD HH24:MI:SS'), '2', '52', '505');
INSERT INTO hotel VALUES ('3', '松江锦江之星3', '(021)37621130', '上海市松江区西林北路952号', '1', '0', TO_TIMESTAMP('2015-09-05 17:17:00', 'YYYY-MM-DD HH24:MI:SS'), '3', '36', '398');

-- ----------------------------
-- Records of hotel_bed
-- ----------------------------
INSERT INTO hotel_bed VALUES ('1', '1', '1', '3');
INSERT INTO hotel_bed VALUES ('2', '1', '2', '5');
INSERT INTO hotel_bed VALUES ('3', '1', '3', '2');
INSERT INTO hotel_bed VALUES ('4', '2', '3', '100');

-- ----------------------------
-- Records of hotel_stock
-- ----------------------------
INSERT INTO hotel_stock VALUES ('1', '1', '1', '16');
INSERT INTO hotel_stock VALUES ('2', '1', '2', '11');
INSERT INTO hotel_stock VALUES ('3', '1', '3', '10');
INSERT INTO hotel_stock VALUES ('4', '1', '4', '10');
INSERT INTO hotel_stock VALUES ('5', '1', '5', '20');
INSERT INTO hotel_stock VALUES ('6', '2', '1', '100');

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO item VALUES ('1', '灭世者的死亡之帽', '<p>+140点法术强度。唯一被动：提升30%法术强度。11111</p>', '1449027976244.jpg');
INSERT INTO item VALUES ('2', '麦瑞德裂血手套', '<p>+40点攻击、+40%攻击速度、+25点护甲、唯一被动：物理攻击会造成目标最大生命值的4%的魔法伤害。</p>', null);
INSERT INTO item VALUES ('3', '多兰之盾', '<p>+120点生命值、+10点护甲、+8点生命回复/5秒</p>', null);
INSERT INTO item VALUES ('4', '黑色切割者', '<p>+55点攻击力、+30%攻击速度。唯一被动：物理攻击减少目标15点护甲，持续5秒（最多叠加3次）。</p>', null);
INSERT INTO item VALUES ('5', '长剑', '<p>+10点攻击力</p>', '1437496392574.gif');
INSERT INTO item VALUES ('6', '灵巧披风', '<p>+18%暴击几率</p>', '1437495216704.png');
INSERT INTO item VALUES ('7', '多兰之刃', '<p>+80点生命值、+10点攻击力、+3%生命偷取</p>', '1437494908238.png');

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO order_item VALUES ('1', '1', '3', '洹宾 40*40S店标大提花被套3', '10', '1');
INSERT INTO order_item VALUES ('2', '2', '18', '120床型纯棉四件套', '3', '2');
INSERT INTO order_item VALUES ('3', '2', '18', '120床型纯棉四件套', '3', '2');
INSERT INTO order_item VALUES ('4', '2', '18', '120床型纯棉四件套', '3', '2');
INSERT INTO order_item VALUES ('5', '3', '18', '120床型纯棉四件套', '3', '6');
INSERT INTO order_item VALUES ('6', '4', '19', '150床型纯棉四件套', '2', '1');

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO orders VALUES ('1', '1', '1', '30', '10.00', '0.00', '', '7', '7', TO_TIMESTAMP('2015-10-11 21:46:12', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-10-11 21:46:12', 'YYYY-MM-DD HH24:MI:SS'), '0', null, '上海市松江区西林北路950号', '松江锦江之星1', '(021)37621128');
INSERT INTO orders VALUES ('2', '1', '2', '10', '6.00', '0.00', '', '21', '21', TO_TIMESTAMP('2015-11-06 23:49:02', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-11-06 23:49:02', 'YYYY-MM-DD HH24:MI:SS'), '0', null, 'gongyi', 'gongyi', 'gongyi');
INSERT INTO orders VALUES ('3', '28', '3', '10', '18.00', '0.00', '', '24', '24', TO_TIMESTAMP('2015-11-14 09:12:18', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-11-14 09:12:18', 'YYYY-MM-DD HH24:MI:SS'), '0', null, '淮河路 ', '三系', '18155502888');
INSERT INTO orders VALUES ('4', '1', '4', '10', '2.40', '0.00', '', '7', '7', TO_TIMESTAMP('2015-11-15 21:19:16', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-11-15 21:19:16', 'YYYY-MM-DD HH24:MI:SS'), '0', null, '上海市松江区西林北路950号', '客栈1号', '(021)37621128');

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO product VALUES ('28', '1', '4', '1', '3', '150床型纯棉被套', '1451664266663.jpg', '3', '2.4', '0', '0', '5000', TO_TIMESTAMP('2015-11-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-12-09 01:54:19', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO product VALUES ('29', '1', '4', '1', '4', '150床型纯棉被套', '1451662906897.png', '3', '2.4', '0', '0', '5000', TO_TIMESTAMP('2015-11-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-12-09 01:57:22', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO product VALUES ('30', '1', '7', '1', '0', '纯棉枕套', '1449597463551.jpg', '3', '2.4', '0', '0', '5000', TO_TIMESTAMP('2015-11-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2015-12-09 01:57:36', 'YYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('7', '1', 'test7', '000000', '德玛西亚之力', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '#fb84a5', '');
INSERT INTO users VALUES ('9', '0', 'test9', '000000', '卡牌大师', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '');
INSERT INTO users VALUES ('10', '0', 'test10', '000000', '堕落天使', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '');
INSERT INTO users VALUES ('11', '0', 'test11', '000000', '炼金术士', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '');
INSERT INTO users VALUES ('12', '0', 'test12', '000000', '熔岩巨兽', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '');
INSERT INTO users VALUES ('13', '0', 'test13', '000000', '祖安狂人', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '');
INSERT INTO users VALUES ('14', '0', 'test14', '000000', '钢铁大使', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '');
INSERT INTO users VALUES ('15', '0', 'test15', '000000', '寡妇制造者', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '3,2');
INSERT INTO users VALUES ('16', '0', 'test16', '000000', '时光守护者', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '3');
INSERT INTO users VALUES ('17', '0', 'test17', '000000', '末日使者', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '2,3');
INSERT INTO users VALUES ('18', '0', 'test18', '000000', '殇之木乃伊', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '0,3');
INSERT INTO users VALUES ('19', '0', 'test19', '000000', '牛头酋长', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '0');
INSERT INTO users VALUES ('20', '0', 'test20', '000000', '邪恶小法师', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '3');
INSERT INTO users VALUES ('21', '0', 'test21', '000000', '风暴之怒', TO_TIMESTAMP('2014-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '', '3');
INSERT INTO users VALUES ('22', '0', 'test22', '000000', '麦林炮手', TO_TIMESTAMP('2014-12-30 00:55:49', 'YYYY-MM-DD HH24:MI:SS'), '', '1');
INSERT INTO users VALUES ('23', '2', 'test23', '000000', '黑暗之女', TO_TIMESTAMP('2014-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '', '3');
INSERT INTO users VALUES ('24', '2', 'test24', '000000', '亡灵勇士', TO_TIMESTAMP('2014-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '', '2,3,1');
INSERT INTO users VALUES ('25', '2', 'test25', '000000', '沙漠死神', TO_TIMESTAMP('2014-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '', '0,3');
INSERT INTO users VALUES ('27', '1', 'test21', '000000', '德邦总管', TO_TIMESTAMP('2014-12-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '', '0,1');
INSERT INTO users VALUES ('29', '1', '13524523428', '13524523428', '范德萨范德萨', TO_TIMESTAMP('2016-01-20 17:37:55', 'YYYY-MM-DD HH24:MI:SS'), '', '');
INSERT INTO users VALUES ('30', '1', '13524523428', '13524523428', '范德萨', TO_TIMESTAMP('2016-01-20 17:40:50', 'YYYY-MM-DD HH24:MI:SS'), '', '');
INSERT INTO users VALUES ('31', '1', '123213', '8008208820', '发都是发', TO_TIMESTAMP('2016-01-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '', '1');

-- ----------------------------
-- Records of users_exp
-- ----------------------------
INSERT INTO users_exp VALUES ('6', '1', '23', '1623736455');
INSERT INTO users_exp VALUES ('7', '0', '24', '1623736456');
INSERT INTO users_exp VALUES ('9', '0', '26', '1623736458');
INSERT INTO users_exp VALUES ('10', '0', '27', '1623736459');
INSERT INTO users_exp VALUES ('11', '0', '28', '1623736460');
INSERT INTO users_exp VALUES ('12', '0', '29', '1623736461');
INSERT INTO users_exp VALUES ('13', '0', '30', '1623736462');
INSERT INTO users_exp VALUES ('14', '0', '31', '1623736463');
INSERT INTO users_exp VALUES ('15', '0', '32', '1623736464');
INSERT INTO users_exp VALUES ('16', '0', '33', '1623736465');
INSERT INTO users_exp VALUES ('17', '0', '34', '1623736466');
INSERT INTO users_exp VALUES ('18', '0', '35', '1623736467');
INSERT INTO users_exp VALUES ('19', '0', '36', '1623736468');
INSERT INTO users_exp VALUES ('21', '0', '38', '1623736470');
INSERT INTO users_exp VALUES ('22', '0', '39', '1623736471');
INSERT INTO users_exp VALUES ('23', '0', '40', '1623736472');
INSERT INTO users_exp VALUES ('24', '0', '41', '1623736473');
INSERT INTO users_exp VALUES ('25', '0', '42', '1623736474');
INSERT INTO users_exp VALUES ('26', '0', '43', '1623736475');
INSERT INTO users_exp VALUES ('27', '0', '44', '1623736476');
INSERT INTO users_exp VALUES ('28', '0', '45', '1623736477');
INSERT INTO users_exp VALUES ('29', '0', '1', '100000');
INSERT INTO users_exp VALUES ('30', '213', '1', '10000');
INSERT INTO users_exp VALUES ('31', '213', '1', '145454');

-- ----------------------------
-- Records of users_item
-- ----------------------------
INSERT INTO users_item VALUES ('1', '7', '3');
INSERT INTO users_item VALUES ('2', '27', '2');
INSERT INTO users_item VALUES ('3', '9', '5');
INSERT INTO users_item VALUES ('4', '10', '2');
INSERT INTO users_item VALUES ('5', '11', '3');
INSERT INTO users_item VALUES ('6', '23', '4');
