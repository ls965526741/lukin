/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : lukin

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 23/03/2022 10:00:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `selected` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (10, '8', '9', '4', '1', '全糖,冷');
INSERT INTO `carts` VALUES (11, '18', '9', '1', '1', '标准,冰');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smallImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `largeImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typeDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isHot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tem_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `milk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `milk_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sugar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sugar_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cream` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cream_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updatedAt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'latte001', 'latte', '黑糖拿铁', '28.00', '经典日式黑糖风味拿铁，黑糖与咖啡的美妙融合，香甜温暖、自然醇厚，口感绵长。（建议到店饮用，奶油融化前口感更佳）\n 主要原材料：浓缩咖啡、牛奶、黑糖调味糖浆、原味调味糖浆、可选择添加搅打奶油（含香草风味糖浆）\n 图片仅供参考，请以实物为准，建议取餐后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0378_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0378_02.jpg', '拿铁', '0', '冷/热', '温度', '', '奶', '全糖/半糖', '糖', '默认奶油/无奶油', '奶油', 'Brown Sugar Latte', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('2', 'latte002', 'latte', '香草拿铁', '28.00', '拿铁中融入清新香草风味，沁人心脾。\n主要原材料：浓缩咖啡，牛奶，香草风味糖浆。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0379_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0379_02.jpg', '拿铁', '0', '冷/热', '温度', '', '奶', '全糖/半糖', '糖', '', '奶油', 'Vanilla Latte', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('3', 'coffee001', 'coffee', '标准美式', '22.00', 'Espresso（意式浓缩）与水的黄金配比，带来浓郁的咖啡芬芳，成为脑海中挥之不去的绝妙体验。\n主要原材料：浓缩咖啡，水。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0380_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0380_02.jpg', '咖啡', '0', '冷/热', '温度', '', '奶', '全糖/半糖', '糖', '', '奶油', 'Americano', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('4', 'coffee002', 'coffee', '焦糖玛奇朵', '28.00', '焦糖风味奶咖，上层注入丰富奶泡，层次感分明。（建议到店饮用）\n主要原材料：浓缩咖啡，牛奶，香草风味糖浆，焦糖调味酱。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0381_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0381_02.jpg', '咖啡', '0', '冷/热', '温度', '', '奶', '全糖/半糖', '糖', '', '奶油', 'Caramel Macchiato', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('5', 'coffee003', 'coffee', '摩卡', '28.00', '浓缩咖啡与牛奶彼此融合，加入香浓巧克力风味。（建议到店饮用，奶油融化前口感更佳）\n主要原材料：浓缩咖啡，牛奶，巧克力酱，搅打奶油（含香草风味糖浆）。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0382_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0382_02.jpg', '咖啡', '0', '冷/热', '温度', '', '奶', '全糖/半糖', '糖', '', '奶油', 'Mocha', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('6', 'latte003', 'latte', '拿铁', '25.00', '经典意式奶咖。浓缩咖啡与香醇牛奶融合，口感圆润。\n主要原材料：浓缩咖啡，牛奶。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0383_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0383_02.jpg', '拿铁', '0', '冷/热', '温度', '', '奶', '全糖/半糖', '糖', '', '奶油', 'Latte', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('7', 'latte004', 'coffee', '焦糖拿铁', '28.00', '拿铁中融入醇香焦糖风味，香甜温暖，令人沉醉。\n主要原材料：浓缩咖啡，牛奶，焦糖风味糖浆。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0384_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0384_02.jpg', '拿铁', '1', '冷/热', '温度', '', '奶', '全糖/半糖', '糖', '', '奶油', 'Caramel Latte', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('8', 'latte005', 'coffee', '榛果拿铁', '28.00', '榛果爱好者的选择！香甜榛果风味与咖啡牛奶融合，诠释另一种新鲜风味。\n主要原材料：浓缩咖啡，牛奶，榛子风味糖浆。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0385_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0385_02.jpg', '拿铁', '1', '冷/热', '温度', '', '奶', '全糖/半糖', '糖', '', '奶油', 'Hazelnut Latte', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('9', 'coffee004', 'coffee', '卡布奇诺', '25.00', '经典奶咖。奶泡与咖啡交融，绵密醇香，轻盈如雪。（建议到店饮用，奶泡消失前口感更佳）\n主要原材料：浓缩咖啡，牛奶。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0386_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0386_02.jpg', '咖啡', '0', '冷/热', '温度', '', '奶', '全糖/半糖', '糖', '', '奶油', 'Cappuccino', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('10', 'rena_ice001', 'rena_ice', '巧克力瑞纳冰', '28.00', '醇香巧克力风味搭配牛奶，口感香甜酷爽。（到店饮用口感更佳）\n主要原料：巧克力酱，牛奶，冰沙粉，冰块，搅打奶油（含香草风味糖浆）。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0387_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0387_02.jpg', '瑞纳冰', '0', '', '温度', '', '奶', '', '糖', '默认奶油/无奶油', '奶油', 'Chocolate Exfreezo', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('11', 'rena_ice002', 'rena_ice', '抹茶瑞纳冰', '28.00', '经典抹茶搭配香滑奶油，入口伴有浓郁的抹茶清香。（到店饮用口感更佳）\n主要原料：抹茶风味固体饮料，冰沙粉，牛奶，冰块，搅打稀奶油。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0388_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0388_02.jpg', '瑞纳冰', '0', '', '温度', '', '奶', '', '糖', '默认奶油/无奶油', '奶油', 'Matcha Exfreezo', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('12', 'rena_ice003', 'rena_ice', '卡布奇诺瑞纳冰', '28.00', '卡布奇诺咖啡风味融入牛奶与细腻沙冰，香甜纯滑。（到店饮用口感更佳）\n主要原料：卡布奇诺咖啡风味冰沙粉，牛奶，冰沙粉，冰块，搅打奶油（含香草风味糖浆）。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0389_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0389_02.jpg', '瑞纳冰', '0', '', '温度', '', '奶', '', '糖', '默认奶油/无奶油', '奶油', 'Coppuccino Exfreezo', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('13', 'coffee006', 'coffee', '奥瑞白', '28.00', '咖啡与牛奶黄金配比，奶香四溢，口感香醇。\n主要原材料：浓缩咖啡，牛奶。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0390_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0390_02.jpg', '咖啡', '1', '热', '温度', '', '奶', '无糖/半份糖/单份糖', '糖', '', '奶油', 'Flat White', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('14', 'coffee005', 'coffee', '焦糖标准美式', '25.00', '焦糖风味糖浆的融入，提升了美式的原始风味，入口清甜，香气四溢。\n主要原材料：浓缩咖啡，水，焦糖风味糖浆。\n图片仅供参考，请以实物为准。建议送达后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0391_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0391_02.jpg', '咖啡', '0', '热', '温度', '', '奶', '无糖/半份糖/单份糖', '糖', '', '奶油', 'Caramel Americano', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('15', 'latte006', 'latte', '黑糖啵啵拿铁', '28.00', '独特的黑糖风味拿铁，佐以Q嫩儒糯的黑糖口味珍珠，创造出层次丰富的美妙口感。（建议搅拌后饮用）\n主要原材料：浓缩咖啡，黑糖味珍珠，纯牛奶，黑糖味调味糖浆，原味调味糖浆，可选择添加搅打奶油（含香草风味糖浆）\n图片仅供参考，请以实物为准，建议取餐后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/IMG_0392_02p.jpg', 'http://www.kangliuyong.com:10002/images/product_large/IMG_0392_02.jpg', '拿铁', '1', '冷/热', '温度', '', '奶', '全糖/半糖', '糖', '默认奶油/无奶油', '奶油', 'Brown Sugar Bubble Latte', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('16', 'latte007', 'latte', '元气厚乳拿铁', '21.00', '【新年第一杯，元气开场】香浓核桃风味×酥脆坚果碎稀奶油顶，给你加个元气buff！\n以luckin经典厚乳拿铁为底，新年要有新风味~特添精选厚乳，采用先进冷萃工艺，乳蛋白含量6%。\n主要原料：浓缩咖啡、冷萃厚牛乳（调制奶浆）、纯牛奶、胡桃风味糖浆、糖衣扁桃仁碎、稀奶油（含香草味糖浆）。\n图片及包装仅供参考，请以实物为准。建议送达后尽快饮用。到店饮用口感更佳。', 'http://www.kangliuyong.com:10002/images/product_small/b001_small.jpg', 'http://www.kangliuyong.com:10002/images/product_large/b001.jpg', '拿铁', '0', '冰/热', '温度', '', '奶', '标准糖/半糖', '糖', '默认奶油/无奶油', '奶油', 'Walnut Flavored Newer Latte', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('17', 'latte008', 'latte', '海盐芝士厚乳拿铁', '18.00', '【特添精选厚乳，采用先进冷萃工艺，乳蛋白含量6%】悉心拼配滑润醇香的厚乳拿铁，缓缓浇入轻盈绵密的海盐芝士奶盖，更添美妙风味。\n主要原料：浓缩咖啡、冷萃厚牛乳（调制奶浆）、纯牛奶、原味调味糖浆、海盐芝士奶盖风味固体饮料、稀奶油。\n图片及包装仅供参考，请以实物为准。建议送达后尽快饮用。到店饮用口感更佳。\n致敏物质：本产品含有乳及乳制品、大豆制品，对此有过敏历史的小伙伴注意哦～', 'http://www.kangliuyong.com:10002/images/product_small/c001_small.jpg', 'http://www.kangliuyong.com:10002/images/product_large/c001.jpg', '拿铁', '0', '冰/热', '温度', '', '奶', '标准糖/半糖/无糖', '糖', '', '奶油', 'Salty Cheese Newer Latte', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('18', 'fruit_tea001', 'fruit_tea', '满杯百香果', '17.00', '清新又浓郁的百香果香气，混合清新茉莉茶香，加上椰果与寒天的爽滑Q弹，满杯椰香果香茶香。\n主要原材料：椰果、百香果汁、原味寒天晶球、茉莉绿茶、原味调味糖浆。\n图片仅供参考，请以实物为准，建议取餐后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/d001_small.png', 'http://www.kangliuyong.com:10002/images/product_large/d001.png', '水果茶', '1', '冰', '温度', '', '奶', '标准/半糖/0卡糖', '糖', '', '奶油', 'Passion Fruit & Coconut Jelly Jasmine Tea', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('19', 'fruit_tea002', 'fruit_tea', '草莓酸饮', '19.00', '草莓和椰果的酸甜搭配，混合醇香牛奶与清新优格，交织出Q滑细腻的口感，莓香四溢很好喝。（饮用前建议搅拌）\n主要原材料：牛奶、草莓汁饮料浓浆、椰果、风味酸奶。\n图片仅供参考，请以实物为准，建议取餐后尽快饮用。', 'http://www.kangliuyong.com:10002/images/product_small/e001_small.png', 'http://www.kangliuyong.com:10002/images/product_large/e001.png', '水果茶', '0', '冰', '温度', '', '奶', '标准/半糖/0卡糖', '糖', '', '奶油', 'Strawberry sour drink', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('20', 'fruit_tea005', 'fruit_tea', '椰子冰', '20.00', '【不含咖啡】优选纯牛奶为底，融进满满椰香，又加入柔和香草风味，椰子控必喝。\n主要原料：纯牛奶、椰子风味粉、香草风味糖浆、原味冰沙粉、冰块、稀奶油（含香草风味糖浆）。\n图片及包装仅供参考，请以实物为准。温馨提示：瑞纳冰系列产品形态为冰沙，无法进行少冰去冰操作，请您谅解。建议送达后尽快饮用。到店饮用口感更佳。 ', 'http://www.kangliuyong.com:10002/images/product_small/h001_small.png', 'http://www.kangliuyong.com:10002/images/product_large/h001.png', '水果茶', '1', '冰', '温度', '', '奶', '标准/半糖/0卡糖', '糖', '', '奶油', 'Coconut ice', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('21', 'latte009', 'latte', '茴香拿铁', '22.00', '平滑、香甜、细致的花香，这款诱人的拿铁咖啡定会愉悦您的味蕾，活跃您的感官。主要原料：1颗 Master Origin Ethiopia 优选咖啡、250毫升牛奶、20毫升大茴香糖浆、绿茉莉花茶包、大茴香瓣。\n图片及包装仅供参考，请以实物为准。建议送达后尽快饮用。到店饮用口感更佳。', 'http://www.kangliuyong.com:10002/images/product_small/i001_small.png', 'http://www.kangliuyong.com:10002/images/product_large/i001.jpg', '拿铁', '0', '冰', '温度', '', '奶', '标准/半糖/0卡糖', '糖', '', '奶油', 'Anise latte', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');
INSERT INTO `goods` VALUES ('22', 'coffee008', 'coffee', '甜美焦糖冰咖啡', '24.00', '美味饮品，享受美妙的意式浓缩咖啡时刻！主要原料：1个 Caramelito 优选咖啡胶囊、1勺焦糖冰淇淋、咸焦糖糖浆、100毫升香草味牛奶、碎冰。\n图片及包装仅供参考，请以实物为准。建议送达后尽快饮用。到店饮用口感更佳。', 'http://www.kangliuyong.com:10002/images/product_small/j001_small.png', 'http://www.kangliuyong.com:10002/images/product_large/j001.jpg', '咖啡', '0', '热', '温度', '', '奶', '无糖/半份糖/单份糖', '糖', '', '奶油', 'Sweet caramel iced coffee', '2021-01-24T10:53:54.000Z', '2021-01-24T10:53:54.000Z');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cart_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '8', '9', NULL, NULL, '28.00', '4', '0', NULL, NULL);
INSERT INTO `orders` VALUES (2, '18', '9', NULL, NULL, '17.00', '1', '0', NULL, NULL);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL COMMENT '用户id',
  `user_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/ed3e5493045d980e29c648b3aa83b6ce.jpg' COMMENT '用户头像',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` int(0) NULL DEFAULT 0 COMMENT '性别',
  `birthday` int(0) NULL DEFAULT NULL COMMENT '生日',
  `personalized` int(0) NULL DEFAULT NULL COMMENT '个性签名',
  `school` int(0) NULL DEFAULT NULL COMMENT '学校名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (2, 9, 'img/ed3e5493045d980e29c648b3aa83b6ce.png', 'admin', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名, 唯一',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'email, 唯一',
  `password` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为管理员, 0: 不是管理员(默认); 1: 是管理员',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (9, 'admin', NULL, '$2a$10$GTqo6AmtQC6dc/ldqSVpeufnZond7o3F20Ox9Vi.uRgG45UD1Rk.S', 0);

SET FOREIGN_KEY_CHECKS = 1;
