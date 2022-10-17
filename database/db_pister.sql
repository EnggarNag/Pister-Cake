/*
 Navicat Premium Data Transfer

 Source Server         : localhost_saya
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : localhost:3306
 Source Schema         : db_pister

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 10/07/2022 21:17:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `subtotal` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 1, 1, 205000);
INSERT INTO `cart` VALUES (6, 1, 1, 205000);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total` int NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (5, 6, '2022-07-09', '620220709164311', 700000, 'neo', 'Jauh Pake helm', '81122334455', 'paid');
INSERT INTO `orders` VALUES (6, 6, '2022-07-09', '620220709164853', 689000, 'neo', 'Digidaw', '8886277267', 'paid');
INSERT INTO `orders` VALUES (7, 6, '2022-07-09', '620220709173517', 450000, 'neo', 'Wakanda ', '0811122334433', 'paid');
INSERT INTO `orders` VALUES (8, 6, '2022-07-10', '620220710150553', 450000, 'neo', 'Jauh lah pokonya', '085555112233', 'paid');

-- ----------------------------
-- Table structure for orders_confirm
-- ----------------------------
DROP TABLE IF EXISTS `orders_confirm`;
CREATE TABLE `orders_confirm`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orders_id` int NOT NULL,
  `account_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `account_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nominal` int NOT NULL,
  `note` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `image` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_confirm
-- ----------------------------
INSERT INTO `orders_confirm` VALUES (4, 6, 'neo', '8886277267', 2147483647, 'Ga pake bawang ama kue nya.krim nya aja', 'adacfdd355a93cad516291583979be88.jpg');
INSERT INTO `orders_confirm` VALUES (5, 7, 'neo', '8886277267', 2147483647, 'Ya gitulah pokoknya', '003fa357653e2f7192ebc08e7243bf50.jpg');
INSERT INTO `orders_confirm` VALUES (6, 8, 'neo', '085555112233', 2147483647, 'Ga pake kue', '51b4d55c440044114094374503d5162c.jpg');

-- ----------------------------
-- Table structure for orders_detail
-- ----------------------------
DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE `orders_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orders_id` int NOT NULL,
  `product_id` int NOT NULL,
  `subtotal` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_detail
-- ----------------------------
INSERT INTO `orders_detail` VALUES (7, 4, 1, 205000);
INSERT INTO `orders_detail` VALUES (8, 4, 5, 500000);
INSERT INTO `orders_detail` VALUES (9, 5, 3, 700000);
INSERT INTO `orders_detail` VALUES (10, 6, 2, 689000);
INSERT INTO `orders_detail` VALUES (11, 7, 9, 450000);
INSERT INTO `orders_detail` VALUES (12, 8, 9, 450000);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `price` int NOT NULL,
  `edition` enum('reguler','premium') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Choco Strawberry', 205000, 'reguler', 'choco strawberry.png', '																																										<p>							<b>CHOCO STRAWBERRY CAKE\r\n</b></p><p>Choco Strawberry merupakan kue yang cocok untuk merayakan ulang tahun untuk anggota keluarga tercinta ataupun kekasih halu mu, dihiasi dengan strawberry, krim coklat yang dilapisi dengan kepingan coklat disetiap pinggirannya\r\n</p>																																');
INSERT INTO `products` VALUES (2, 'Rainbow Cake', 689000, 'premium', 'rainbowcake.png', '																					<p>							Rainbow cake merupakan kue yang cantik dan digemari banyak orang karena warnanya yang cantik dan tentu saja dengan rasa yang sangat unik karena rainbow kue ini memiliki krim disetiap lapisannya sehingga kamu akan merasakan manis yang berlapis lapis </p>\r\n								');
INSERT INTO `products` VALUES (3, 'Red Velvet ', 700000, 'premium', 'redvelvet.png', '																					<p>							Kue Red Velvet merupakan kue yang sangat cocok dipadukan dengan cream cheese yang gurih disetiap lapisannya. Kue red velvet memiliki tampilan warna yang menarik mata dan menyajikan rasa yang sangat unik\r\n													');
INSERT INTO `products` VALUES (4, 'Matcha Cake', 500000, 'reguler', 'matchacake.png', '														<p>Kue Macha merupakan kue yang di lapisi dengan teh hijau jepang atau macha yang memiliki rasa khas teh hijau yang menyegarkan, ditemani dengan krim vanila yang lembut khas toko kami memberikan sensasi baru pada produk kami yang satu ini.</p>\r\n\r\n		');
INSERT INTO `products` VALUES (8, 'Tiramisu Cake', 500000, 'premium', 'faaa85260b74433acf696502dc5b6ab3.png', '							Kue tiramisu ini menyajikan rasa kopi yang berasal dari bubuk espresso pilihan. Perpaduan rasa coklat dan kopi dalam sebuah cake minciptakan rasa yang sangat unik						');
INSERT INTO `products` VALUES (9, 'Blueberry cheescake', 450000, 'reguler', 'blueberry_cheescake.jpg', '<p>Blueberry cheescake kue yang berbahan dasar chees dan selai blueberry. Kue ini menyajikan rasa yang sangat segar dimulut, akan ada sensasi asam dan manis saat kita memaknnya<p>');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `role` enum('1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin@gmail.com', '$2y$10$I52FUe8oEeyXPw8y6olwD.m12vecYpd0FiS66r2iN08cOiRmHE.I6', '1');
INSERT INTO `users` VALUES (6, 'neo', 'neo@gmail.com', '$2y$10$QPBVVZTNItHm3QgDuNRw7uyzm.IKWfJKrNWC9AhRs9r2nKHRo5Mzi', '2');

SET FOREIGN_KEY_CHECKS = 1;
