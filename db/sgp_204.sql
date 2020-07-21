/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : sgp_204

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 21/07/2020 14:33:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activations
-- ----------------------------
DROP TABLE IF EXISTS `activations`;
CREATE TABLE `activations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` datetime(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `activations_user_id_index`(`user_id`) USING BTREE,
  CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activations
-- ----------------------------
INSERT INTO `activations` VALUES (1, 1, '0f9WluIlqf8NUR4zcMPzM0gOG1LGVjVH', 1, '2020-07-21 14:44:51', '2020-07-21 14:44:50', '2020-07-21 14:44:51');

-- ----------------------------
-- Table structure for attribute_categories
-- ----------------------------
DROP TABLE IF EXISTS `attribute_categories`;
CREATE TABLE `attribute_categories`  (
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`attribute_id`, `category_id`) USING BTREE,
  INDEX `attribute_categories_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `attribute_categories_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `attribute_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attribute_set_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_set_translations`;
CREATE TABLE `attribute_set_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_set_translations_attribute_set_id_locale_unique`(`attribute_set_id`, `locale`) USING BTREE,
  CONSTRAINT `attribute_set_translations_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attribute_sets
-- ----------------------------
DROP TABLE IF EXISTS `attribute_sets`;
CREATE TABLE `attribute_sets`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attribute_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_translations`;
CREATE TABLE `attribute_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_translations_attribute_id_locale_unique`(`attribute_id`, `locale`) USING BTREE,
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attribute_value_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value_translations`;
CREATE TABLE `attribute_value_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_value_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_value_translations_attribute_value_id_locale_unique`(`attribute_value_id`, `locale`) USING BTREE,
  CONSTRAINT `attribute_value_translations_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE `attribute_values`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `attribute_values_attribute_id_index`(`attribute_id`) USING BTREE,
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `is_filterable` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attributes_slug_unique`(`slug`) USING BTREE,
  INDEX `attributes_attribute_set_id_index`(`attribute_set_id`) USING BTREE,
  CONSTRAINT `attributes_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for brand_translations
-- ----------------------------
DROP TABLE IF EXISTS `brand_translations`;
CREATE TABLE `brand_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `brand_translations_brand_id_locale_unique`(`brand_id`, `locale`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brand_translations
-- ----------------------------
INSERT INTO `brand_translations` VALUES (1, 1, 'en', 'Guma Pharma');

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `brands_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'guma-pharma', 1, '2020-07-21 21:23:13', '2020-07-21 21:23:13');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) UNSIGNED NULL DEFAULT NULL,
  `is_searchable` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING BTREE,
  INDEX `categories_parent_id_foreign`(`parent_id`) USING BTREE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, NULL, 'antianemic', NULL, 1, 1, '2020-07-18 03:35:34', '2020-07-18 03:36:10');
INSERT INTO `categories` VALUES (2, NULL, 'antibiotic', NULL, 0, 1, '2020-07-18 03:36:34', '2020-07-18 03:36:34');
INSERT INTO `categories` VALUES (3, NULL, 'antivertiginous', NULL, 0, 1, '2020-07-18 03:36:47', '2020-07-18 03:36:47');
INSERT INTO `categories` VALUES (4, NULL, 'cardiovascular', NULL, 0, 1, '2020-07-18 03:36:55', '2020-07-18 03:36:55');
INSERT INTO `categories` VALUES (5, NULL, 'gastrointestinal', NULL, 0, 1, '2020-07-18 03:37:10', '2020-07-18 03:37:10');
INSERT INTO `categories` VALUES (6, NULL, 'inmunosupressor', NULL, 0, 1, '2020-07-18 03:37:21', '2020-07-18 03:37:21');
INSERT INTO `categories` VALUES (7, NULL, 'pain-and-antiespasmodics', NULL, 0, 0, '2020-07-18 03:37:35', '2020-07-21 21:21:53');
INSERT INTO `categories` VALUES (8, NULL, 'respiratory', NULL, 0, 1, '2020-07-18 03:37:43', '2020-07-18 03:37:43');
INSERT INTO `categories` VALUES (9, NULL, 'urology', NULL, 0, 1, '2020-07-18 03:37:50', '2020-07-18 03:37:50');
INSERT INTO `categories` VALUES (22, NULL, 'neurology', NULL, 0, 0, '2020-07-21 21:22:25', '2020-07-21 21:22:25');
INSERT INTO `categories` VALUES (23, NULL, 'respiratory-18Nk2kCE', NULL, 0, 0, '2020-07-21 21:22:34', '2020-07-21 21:22:34');

-- ----------------------------
-- Table structure for category_translations
-- ----------------------------
DROP TABLE IF EXISTS `category_translations`;
CREATE TABLE `category_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_translations_category_id_locale_unique`(`category_id`, `locale`) USING BTREE,
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_translations
-- ----------------------------
INSERT INTO `category_translations` VALUES (1, 1, 'en', 'ANTIANEMIC');
INSERT INTO `category_translations` VALUES (2, 2, 'en', 'ANTIBIOTIC');
INSERT INTO `category_translations` VALUES (3, 3, 'en', 'ANTIVERTIGINOUS');
INSERT INTO `category_translations` VALUES (4, 4, 'en', 'CARDIOVASCULAR');
INSERT INTO `category_translations` VALUES (5, 5, 'en', 'GASTROINTESTINAL');
INSERT INTO `category_translations` VALUES (6, 6, 'en', 'INMUNOSUPRESSOR');
INSERT INTO `category_translations` VALUES (7, 7, 'en', 'PAIN AND ANTIESPASMODICS');
INSERT INTO `category_translations` VALUES (8, 8, 'en', 'RESPIRATORY');
INSERT INTO `category_translations` VALUES (9, 9, 'en', 'UROLOGY');
INSERT INTO `category_translations` VALUES (18, 22, 'en', 'NEUROLOGY');
INSERT INTO `category_translations` VALUES (19, 23, 'en', 'RESPIRATORY');

-- ----------------------------
-- Table structure for coupon_categories
-- ----------------------------
DROP TABLE IF EXISTS `coupon_categories`;
CREATE TABLE `coupon_categories`  (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`coupon_id`, `category_id`, `exclude`) USING BTREE,
  INDEX `coupon_categories_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `coupon_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `coupon_categories_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupon_products
-- ----------------------------
DROP TABLE IF EXISTS `coupon_products`;
CREATE TABLE `coupon_products`  (
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`coupon_id`, `product_id`) USING BTREE,
  INDEX `coupon_products_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `coupon_products_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `coupon_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupon_translations
-- ----------------------------
DROP TABLE IF EXISTS `coupon_translations`;
CREATE TABLE `coupon_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `coupon_translations_coupon_id_locale_unique`(`coupon_id`, `locale`) USING BTREE,
  CONSTRAINT `coupon_translations_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `is_percent` tinyint(1) NOT NULL,
  `free_shipping` tinyint(1) NOT NULL,
  `minimum_spend` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `maximum_spend` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `usage_limit_per_coupon` int(10) UNSIGNED NULL DEFAULT NULL,
  `usage_limit_per_customer` int(10) UNSIGNED NULL DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `coupons_code_index`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cross_sell_products
-- ----------------------------
DROP TABLE IF EXISTS `cross_sell_products`;
CREATE TABLE `cross_sell_products`  (
  `product_id` int(10) UNSIGNED NOT NULL,
  `cross_sell_product_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `cross_sell_product_id`) USING BTREE,
  INDEX `cross_sell_products_cross_sell_product_id_foreign`(`cross_sell_product_id`) USING BTREE,
  CONSTRAINT `cross_sell_products_cross_sell_product_id_foreign` FOREIGN KEY (`cross_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cross_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for currency_rates
-- ----------------------------
DROP TABLE IF EXISTS `currency_rates`;
CREATE TABLE `currency_rates`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8, 4) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `currency_rates_currency_unique`(`currency`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currency_rates
-- ----------------------------
INSERT INTO `currency_rates` VALUES (1, 'USD', 1.0000, '2020-07-21 14:44:55', '2020-07-21 14:44:55');
INSERT INTO `currency_rates` VALUES (2, 'NIO', 1.0000, '2020-07-21 17:59:42', '2020-07-21 17:59:42');

-- ----------------------------
-- Table structure for entity_files
-- ----------------------------
DROP TABLE IF EXISTS `entity_files`;
CREATE TABLE `entity_files`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `zone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `entity_files_entity_type_entity_id_index`(`entity_type`, `entity_id`) USING BTREE,
  INDEX `entity_files_file_id_index`(`file_id`) USING BTREE,
  INDEX `entity_files_zone_index`(`zone`) USING BTREE,
  CONSTRAINT `entity_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entity_files
-- ----------------------------
INSERT INTO `entity_files` VALUES (20, 14, 'Modules\\Brand\\Entities\\Brand', 1, 'logo', '2020-07-21 21:23:14', '2020-07-21 21:23:14');
INSERT INTO `entity_files` VALUES (21, 14, 'Modules\\Brand\\Entities\\Brand', 1, 'banner', '2020-07-21 21:23:14', '2020-07-21 21:23:14');
INSERT INTO `entity_files` VALUES (23, 13, 'Modules\\Product\\Entities\\Product', 13, 'base_image', '2020-07-21 17:43:38', '2020-07-21 17:43:38');
INSERT INTO `entity_files` VALUES (25, 11, 'Modules\\Product\\Entities\\Product', 11, 'base_image', '2020-07-21 17:48:54', '2020-07-21 17:48:54');
INSERT INTO `entity_files` VALUES (26, 10, 'Modules\\Product\\Entities\\Product', 10, 'base_image', '2020-07-21 17:50:31', '2020-07-21 17:50:31');
INSERT INTO `entity_files` VALUES (27, 9, 'Modules\\Product\\Entities\\Product', 9, 'base_image', '2020-07-21 17:50:51', '2020-07-21 17:50:51');
INSERT INTO `entity_files` VALUES (28, 8, 'Modules\\Product\\Entities\\Product', 8, 'base_image', '2020-07-21 17:53:36', '2020-07-21 17:53:36');
INSERT INTO `entity_files` VALUES (29, 6, 'Modules\\Product\\Entities\\Product', 6, 'base_image', '2020-07-21 17:54:21', '2020-07-21 17:54:21');
INSERT INTO `entity_files` VALUES (30, 2, 'Modules\\Product\\Entities\\Product', 2, 'base_image', '2020-07-21 17:55:11', '2020-07-21 17:55:11');
INSERT INTO `entity_files` VALUES (31, 3, 'Modules\\Product\\Entities\\Product', 3, 'base_image', '2020-07-21 17:55:34', '2020-07-21 17:55:34');
INSERT INTO `entity_files` VALUES (32, 4, 'Modules\\Product\\Entities\\Product', 4, 'base_image', '2020-07-21 17:55:57', '2020-07-21 17:55:57');
INSERT INTO `entity_files` VALUES (33, 5, 'Modules\\Product\\Entities\\Product', 5, 'base_image', '2020-07-21 17:56:38', '2020-07-21 17:56:38');
INSERT INTO `entity_files` VALUES (34, 7, 'Modules\\Product\\Entities\\Product', 7, 'base_image', '2020-07-21 17:57:06', '2020-07-21 17:57:06');
INSERT INTO `entity_files` VALUES (35, 12, 'Modules\\Product\\Entities\\Product', 12, 'base_image', '2020-07-21 17:58:48', '2020-07-21 17:58:48');
INSERT INTO `entity_files` VALUES (36, 1, 'Modules\\Product\\Entities\\Product', 1, 'base_image', '2020-07-21 17:59:15', '2020-07-21 17:59:15');

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `files_user_id_index`(`user_id`) USING BTREE,
  INDEX `files_filename_index`(`filename`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES (1, 1, 'FEFOZ_100Mg-5Ml_Guma_Pharma.jpg', 'public_storage', 'media/0dmR8JxMZUJtq88bWvDLPdvf5wmUriz3D7qLSr76.jpeg', 'jpeg', 'image/jpeg', '53071', '2020-07-21 21:06:37', '2020-07-21 21:06:37');
INSERT INTO `files` VALUES (2, 1, 'bactelid1-vademecum1.png', 'public_storage', 'media/cqtzBWY314O5raOp26AksYTOfHTSeYwGVHche45Z.png', 'png', 'image/png', '93975', '2020-07-21 21:07:20', '2020-07-21 21:07:20');
INSERT INTO `files` VALUES (3, 1, 'ONDEMEL_4Mg-Ml_GumaPharma.jpg', 'public_storage', 'media/35x5KVm4X5EdMCTFygfZdTKgFJcHgSi1QVYstsNz.jpeg', 'jpeg', 'image/jpeg', '85130', '2020-07-21 21:08:18', '2020-07-21 21:08:18');
INSERT INTO `files` VALUES (4, 1, 'Vertinull_16Mg._Guma_Pharma.jpg', 'public_storage', 'media/9z9YBPGppJG91nRiFkVwtRQIHtXUVHKtpR98Z8CH.jpeg', 'jpeg', 'image/jpeg', '37623', '2020-07-21 21:10:24', '2020-07-21 21:10:24');
INSERT INTO `files` VALUES (5, 1, 'vertinul2-24-vademecum1.png', 'public_storage', 'media/U5vGMR3Jk9Faww1KD83owA05UJNs1CNTKXXPDs3r.png', 'png', 'image/png', '134247', '2020-07-21 21:11:25', '2020-07-21 21:11:25');
INSERT INTO `files` VALUES (6, 1, 'olarten1-20-vademecum1.png', 'public_storage', 'media/QODEQT6g0mIbyUImUV19sOCuCGe60Gqr4UMZsgkd.png', 'png', 'image/png', '99185', '2020-07-21 21:11:50', '2020-07-21 21:11:50');
INSERT INTO `files` VALUES (7, 1, 'Olarten_40Mg._Guma_Pharma.jpg', 'public_storage', 'media/ESzt78CF2RXeI9kNgLLJlzJ22k9qHMkleTOWxUna.jpeg', 'jpeg', 'image/jpeg', '31130', '2020-07-21 21:13:08', '2020-07-21 21:13:08');
INSERT INTO `files` VALUES (8, 1, 'Pulmotan_125Mg._Guma_Pharma.jpg', 'public_storage', 'media/9t7hLnp98eo0FQFkTi1PjYDMyXgrdXfnC6SLBzaS.jpeg', 'jpeg', 'image/jpeg', '35761', '2020-07-21 21:15:43', '2020-07-21 21:15:43');
INSERT INTO `files` VALUES (9, 1, 'Gumazol_40Mg._Guma_Pharma.jpg', 'public_storage', 'media/bVdQdayZJM4eTSqreJvq4NTr4Wm9w7to80pwnTAW.jpeg', 'jpeg', 'image/jpeg', '42611', '2020-07-21 21:16:44', '2020-07-21 21:16:44');
INSERT INTO `files` VALUES (10, 1, 'LEPIREL2_GumaPharma-1.png', 'public_storage', 'media/W59x311fjJQc16S1TrN9P0ZKpWn9671J8SEp0ZPv.png', 'png', 'image/png', '197810', '2020-07-21 21:18:20', '2020-07-21 21:18:20');
INSERT INTO `files` VALUES (11, 1, 'panzide1-vademecum1.png', 'public_storage', 'media/Kmom8IXAXRQEzICUws4OVf3WnYWgKi4tStHXGnXy.png', 'png', 'image/png', '147043', '2020-07-21 21:19:17', '2020-07-21 21:19:17');
INSERT INTO `files` VALUES (12, 1, 'limupres1-vademecum1.png', 'public_storage', 'media/3wdNSoHm9ksZHSCI6zfkWxsuh3n5XIMfMf9XqwdL.png', 'png', 'image/png', '123903', '2020-07-21 21:20:19', '2020-07-21 21:20:19');
INSERT INTO `files` VALUES (13, 1, 'butive01-gumapharma.png', 'public_storage', 'media/axiIicZSmwa3MP4HBxuHJM7i6T9ycd9RzS7mAS7h.png', 'png', 'image/png', '113963', '2020-07-21 21:21:26', '2020-07-21 21:21:26');
INSERT INTO `files` VALUES (14, 1, 'logogp.png', 'public_storage', 'media/59ny0QrizDlc8VZA9lS6HLanScUrQziBubofnCjr.png', 'png', 'image/png', '9964', '2020-07-21 21:23:01', '2020-07-21 21:23:01');
INSERT INTO `files` VALUES (15, 1, 'sI7VgfyGD34wV72X3pk8CCCI3QrpsZu1TiEM3kJ6.webp', 'public_storage', 'media/pBXocROFxQUZuUy6RcsVgluzMPtFmV4rzcPsdKM7.webp', 'webp', 'image/webp', '10110', '2020-07-21 21:36:53', '2020-07-21 21:36:53');
INSERT INTO `files` VALUES (16, 1, 'kTJZ8JjEO16NYuj28aN9f88c1SKIm9ELvYOE8pvC.webp', 'public_storage', 'media/AWzSbEIF0Q0qPMQyzgL8QOyCJj5yuQdhwKjT1VzC.webp', 'webp', 'image/webp', '16076', '2020-07-21 21:37:26', '2020-07-21 21:37:26');
INSERT INTO `files` VALUES (17, 1, 'yAaq3dHTWLOlac12ioxGgVrZ3xtrIhKnL5r3roIl.webp', 'public_storage', 'media/i0xO637iVR62NDawIEBDUpjjwSuXUlSXCjPyJonk.webp', 'webp', 'image/webp', '7720', '2020-07-21 21:38:14', '2020-07-21 21:38:14');
INSERT INTO `files` VALUES (18, 1, 'newsletter.jpg', 'public_storage', 'media/CMtUVpgq9THFVO3Uys7PjiXj7JGODqqDLZsyIBwi.jpeg', 'jpeg', 'image/jpeg', '28725', '2020-07-21 21:42:06', '2020-07-21 21:42:06');
INSERT INTO `files` VALUES (19, 1, 'GdxlRSTcxPNGi4gqv86yVx4N2FcpnBSrIa8i7xVe.webp', 'public_storage', 'media/INmwhzdByTe4Un8I9LwU4aUkY48tWP5PLQlxX1ew.webp', 'webp', 'image/webp', '4968', '2020-07-21 21:43:33', '2020-07-21 21:43:33');
INSERT INTO `files` VALUES (20, 1, '5siKhRlEDQFmbiJRwCNBW3rDsbG7m1r2PibvtNeF.webp', 'public_storage', 'media/e67fqom5lYd2OX6Y4XWUcPa2m0AkGJtnXNB2O3xN.webp', 'webp', 'image/webp', '13542', '2020-07-21 21:43:54', '2020-07-21 21:43:54');
INSERT INTO `files` VALUES (21, 1, 'yl6rNkswnKQzh7mouQ0HpagRLwBpnq3Mt9LZMRak.webp', 'public_storage', 'media/oqpJJhoJ09XbPW2s9qpW7ZSCA34JAVBK2oruVwrN.webp', 'webp', 'image/webp', '6674', '2020-07-21 21:44:12', '2020-07-21 21:44:12');
INSERT INTO `files` VALUES (22, 1, 'vm21euwszrldK6E9iEtqsm2WtiJ4OyaA7VIGHPe3.webp', 'public_storage', 'media/KgLM1Bjv3hxUw7gtMWtfuWAgwxXCKxhTd4in4103.webp', 'webp', 'image/webp', '7018', '2020-07-21 21:44:41', '2020-07-21 21:44:41');
INSERT INTO `files` VALUES (23, 1, 'Bn01.webp', 'public_storage', 'media/GMPc1rjYtza2oKwpBO7SZZkWfPUixDRud3e4pMJx.webp', 'webp', 'image/webp', '5562', '2020-07-21 21:45:12', '2020-07-21 21:45:12');
INSERT INTO `files` VALUES (24, 1, 'Bn02.webp', 'public_storage', 'media/uy4d1wm20BrhCl4xAFQj18D39CkvOFeucJlo4xa8.webp', 'webp', 'image/webp', '20518', '2020-07-21 21:45:26', '2020-07-21 21:45:26');
INSERT INTO `files` VALUES (25, 1, 'Bn03.webp', 'public_storage', 'media/wZwEe0gITViOh6u8GWMlmw6qxdX2L2w3oduQcWcK.webp', 'webp', 'image/webp', '3782', '2020-07-21 21:45:36', '2020-07-21 21:45:36');
INSERT INTO `files` VALUES (26, 1, 'Two column banners 1.webp', 'public_storage', 'media/8mzd5fg9j86POSQyHaqr5z0g45HAwXbMreDSkQcA.webp', 'webp', 'image/webp', '10972', '2020-07-21 21:49:09', '2020-07-21 21:49:09');
INSERT INTO `files` VALUES (27, 1, 'Two column banners 2.webp', 'public_storage', 'media/ATjpWQ9DufeeX1GPebCPBUZXUZpqlvj9j4L5XClv.webp', 'webp', 'image/webp', '9150', '2020-07-21 21:49:20', '2020-07-21 21:49:20');
INSERT INTO `files` VALUES (28, 1, 'Three Column Banners 1.webp', 'public_storage', 'media/l09yICoryfle7IkLE7PLoZu8IkZBO241aOUf9yDD.webp', 'webp', 'image/webp', '9482', '2020-07-21 21:50:30', '2020-07-21 21:50:30');
INSERT INTO `files` VALUES (29, 1, 'Three Column Banners 2.webp', 'public_storage', 'media/vCu3UVM1FmxkWwzgHLmI6I3CUqcSiRtKMQprDLLY.webp', 'webp', 'image/webp', '6920', '2020-07-21 21:50:38', '2020-07-21 21:50:38');
INSERT INTO `files` VALUES (30, 1, 'Three Column Banners 3.webp', 'public_storage', 'media/wRCBBMMnHeEUm6J0z3uxPoJ9iTC3ErHCB9t5XIwz.webp', 'webp', 'image/webp', '9220', '2020-07-21 21:50:42', '2020-07-21 21:50:42');
INSERT INTO `files` VALUES (31, 1, 'One Column Banner.webp', 'public_storage', 'media/aCLK6ClC1nzGU5SwDoG1KcV6ILpZntvM3OHs4TWg.webp', 'webp', 'image/webp', '14010', '2020-07-21 21:52:09', '2020-07-21 21:52:09');
INSERT INTO `files` VALUES (32, 1, 'r28gsyypi1oT531dU1MY1EjSskTWQbRIm7OHyTCl.webp', 'public_storage', 'media/I4fNRmicVbHcRIvG69ysU80NmQjJfrikojJAOVSK.webp', 'webp', 'image/webp', '2930', '2020-07-21 18:03:00', '2020-07-21 18:03:00');
INSERT INTO `files` VALUES (33, 1, '5siKhRlEDQFmbiJRwCNBW3rDsbG7m1r2PibvtNeF.webp', 'public_storage', 'media/1kjQw97eC7qWHWOFlBTI4JhzSPSkaBBngVwSfGiQ.webp', 'webp', 'image/webp', '13542', '2020-07-21 18:25:46', '2020-07-21 18:25:46');
INSERT INTO `files` VALUES (34, 1, 'bactelid1-vademecum1.png', 'public_storage', 'media/j2AMYUO2Mx5mqHy18aXDAfLcMt0j3S1GDbcN6R4W.png', 'png', 'image/png', '93975', '2020-07-21 18:25:47', '2020-07-21 18:25:47');
INSERT INTO `files` VALUES (35, 1, 'Bn01.webp', 'public_storage', 'media/wGMshNwOZMigB8eS9xC1voeRbajPM1sWSWhinG3u.webp', 'webp', 'image/webp', '5562', '2020-07-21 18:25:48', '2020-07-21 18:25:48');
INSERT INTO `files` VALUES (36, 1, 'Bn02.webp', 'public_storage', 'media/AWlXCoGesIOFSwh5aFoqxpJtFZ0kjbS0k7s6G6cr.webp', 'webp', 'image/webp', '20518', '2020-07-21 18:25:49', '2020-07-21 18:25:49');
INSERT INTO `files` VALUES (37, 1, 'Bn03.webp', 'public_storage', 'media/RuRqECHh2pintFGOb2Qkh9rFqQYmJUJt8wFXbpM0.webp', 'webp', 'image/webp', '3782', '2020-07-21 18:25:50', '2020-07-21 18:25:50');
INSERT INTO `files` VALUES (38, 1, 'butive01-gumapharma.png', 'public_storage', 'media/NmuzurjKv3lS7bhujVhX7PF4iMB4ZVl5pUPQlY6G.png', 'png', 'image/png', '113963', '2020-07-21 18:25:51', '2020-07-21 18:25:51');
INSERT INTO `files` VALUES (39, 1, 'FEFOZ_100Mg-5Ml_Guma_Pharma.jpg', 'public_storage', 'media/6wuzYLI6SFAJv8m480rhFUHtXmDnoS1rvzTaRFzs.jpeg', 'jpeg', 'image/jpeg', '53071', '2020-07-21 18:25:52', '2020-07-21 18:25:52');
INSERT INTO `files` VALUES (40, 1, 'ONDEMEL_4Mg-Ml_GumaPharma.jpg', 'public_storage', 'media/Q1xGQtolJMUDy0KvZQXTJNXU39SW8ptgYksseVow.jpeg', 'jpeg', 'image/jpeg', '85130', '2020-07-21 18:25:53', '2020-07-21 18:25:53');
INSERT INTO `files` VALUES (41, 1, 'One Column Banner.webp', 'public_storage', 'media/uuZHTUav6CgveDBByZLrfch3FOplXfJObVbWg7Cr.webp', 'webp', 'image/webp', '14010', '2020-07-21 18:25:54', '2020-07-21 18:25:54');
INSERT INTO `files` VALUES (42, 1, 'panzide1-vademecum1.png', 'public_storage', 'media/ljGF9GPTK3BJYri1hGMKJ1563HhMiUxI8HHX03Fd.png', 'png', 'image/png', '147043', '2020-07-21 18:25:55', '2020-07-21 18:25:55');
INSERT INTO `files` VALUES (43, 1, 'Pulmotan_125Mg._Guma_Pharma.jpg', 'public_storage', 'media/b8UKe1l6iXXkefjMdjhaQqQZ8iq6Ys84fISSXWU5.jpeg', 'jpeg', 'image/jpeg', '35761', '2020-07-21 18:25:56', '2020-07-21 18:25:56');
INSERT INTO `files` VALUES (44, 1, 'r28gsyypi1oT531dU1MY1EjSskTWQbRIm7OHyTCl.webp', 'public_storage', 'media/QaK0MkVvV0ZqqWoaMDj2FcOXhkAtovQPPcyd0Prs.webp', 'webp', 'image/webp', '2930', '2020-07-21 18:25:57', '2020-07-21 18:25:57');
INSERT INTO `files` VALUES (45, 1, 'sI7VgfyGD34wV72X3pk8CCCI3QrpsZu1TiEM3kJ6.webp', 'public_storage', 'media/6v9xsaiI3NYM8OXCI14laHsGKbHb9m04O9bRwc2y.webp', 'webp', 'image/webp', '10110', '2020-07-21 18:25:58', '2020-07-21 18:25:58');
INSERT INTO `files` VALUES (46, 1, 'Slider01 (1).jpg', 'public_storage', 'media/FEBqhHvuHnempnsWiQjGu1goBcCHO2PQw9qz6ew2.jpeg', 'jpeg', 'image/jpeg', '313303', '2020-07-21 18:25:59', '2020-07-21 18:25:59');
INSERT INTO `files` VALUES (47, 1, 'vm21euwszrldK6E9iEtqsm2WtiJ4OyaA7VIGHPe3.webp', 'public_storage', 'media/8UsVfgnWtp9HGuC6oDATi6gOVpaYN86obPaX2qYl.webp', 'webp', 'image/webp', '7018', '2020-07-21 18:26:00', '2020-07-21 18:26:00');
INSERT INTO `files` VALUES (48, 1, 'yAaq3dHTWLOlac12ioxGgVrZ3xtrIhKnL5r3roIl.webp', 'public_storage', 'media/3snY79wq1Nslp17Wbk8mJL7bDadZszEFOP8FgWPC.webp', 'webp', 'image/webp', '7720', '2020-07-21 18:26:01', '2020-07-21 18:26:01');
INSERT INTO `files` VALUES (49, 1, 'yl6rNkswnKQzh7mouQ0HpagRLwBpnq3Mt9LZMRak.webp', 'public_storage', 'media/hDncERVSVgReaCkuV5n2xuRr8S6Qw95AICtXpXsz.webp', 'webp', 'image/webp', '6674', '2020-07-21 18:26:02', '2020-07-21 18:26:02');
INSERT INTO `files` VALUES (50, 1, 'gumapharma-logo-portada.png', 'public_storage', 'media/b3RljdW1LEfmKVT2cKqcTBzgeqYRZEVHXLo0VMGb.png', 'png', 'image/png', '9964', '2020-07-21 20:20:41', '2020-07-21 20:20:41');
INSERT INTO `files` VALUES (53, 1, 'o7Z3fzwifjBga5shBOeoFJoLl9p3v9Nl12YIhMlE.webp', 'public_storage', 'media/eMyhI2JOybtZfEBXUwhwWeSlA4tnqdwDHIiYVEAM.webp', 'webp', 'image/webp', '3934', '2020-07-21 20:26:40', '2020-07-21 20:26:40');
INSERT INTO `files` VALUES (54, 1, '800X168.png', 'public_storage', 'media/yTfqUZZcmxxYzNgYmGrQaEdw0ToTSgjU3EzYcZgw.png', 'png', 'image/png', '28614', '2020-07-21 20:31:33', '2020-07-21 20:31:33');

-- ----------------------------
-- Table structure for flash_sale_product_orders
-- ----------------------------
DROP TABLE IF EXISTS `flash_sale_product_orders`;
CREATE TABLE `flash_sale_product_orders`  (
  `flash_sale_product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`flash_sale_product_id`, `order_id`) USING BTREE,
  INDEX `flash_sale_product_orders_order_id_foreign`(`order_id`) USING BTREE,
  CONSTRAINT `flash_sale_product_orders_flash_sale_product_id_foreign` FOREIGN KEY (`flash_sale_product_id`) REFERENCES `flash_sale_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `flash_sale_product_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flash_sale_products
-- ----------------------------
DROP TABLE IF EXISTS `flash_sale_products`;
CREATE TABLE `flash_sale_products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flash_sale_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(18, 4) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `flash_sale_products_flash_sale_id_foreign`(`flash_sale_id`) USING BTREE,
  INDEX `flash_sale_products_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `flash_sale_products_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `flash_sale_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flash_sale_products
-- ----------------------------
INSERT INTO `flash_sale_products` VALUES (1, 1, 8, '2020-07-30', 7.0000, 1500, 0);
INSERT INTO `flash_sale_products` VALUES (2, 1, 10, '2020-07-30', 7.0000, 1500, 1);
INSERT INTO `flash_sale_products` VALUES (3, 1, 7, '2020-07-30', 7.0000, 1500, 2);
INSERT INTO `flash_sale_products` VALUES (4, 1, 1, '2020-07-30', 7.0000, 1500, 3);

-- ----------------------------
-- Table structure for flash_sale_translations
-- ----------------------------
DROP TABLE IF EXISTS `flash_sale_translations`;
CREATE TABLE `flash_sale_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `flash_sale_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flash_sale_translations_flash_sale_id_locale_unique`(`flash_sale_id`, `locale`) USING BTREE,
  CONSTRAINT `flash_sale_translations_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flash_sale_translations
-- ----------------------------
INSERT INTO `flash_sale_translations` VALUES (1, 1, 'en', 'Flash Sale');

-- ----------------------------
-- Table structure for flash_sales
-- ----------------------------
DROP TABLE IF EXISTS `flash_sales`;
CREATE TABLE `flash_sales`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flash_sales
-- ----------------------------
INSERT INTO `flash_sales` VALUES (1, '2020-07-21 21:57:15', '2020-07-21 21:57:15');

-- ----------------------------
-- Table structure for menu_item_translations
-- ----------------------------
DROP TABLE IF EXISTS `menu_item_translations`;
CREATE TABLE `menu_item_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_item_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu_item_translations_menu_item_id_locale_unique`(`menu_item_id`, `locale`) USING BTREE,
  CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_item_translations
-- ----------------------------
INSERT INTO `menu_item_translations` VALUES (1, 1, 'en', 'root');
INSERT INTO `menu_item_translations` VALUES (2, 2, 'en', 'Shop');
INSERT INTO `menu_item_translations` VALUES (3, 3, 'en', 'Brands');
INSERT INTO `menu_item_translations` VALUES (4, 4, 'en', 'About Us');
INSERT INTO `menu_item_translations` VALUES (5, 5, 'en', 'Terms Of Use');
INSERT INTO `menu_item_translations` VALUES (6, 6, 'en', 'FAQ');
INSERT INTO `menu_item_translations` VALUES (7, 7, 'en', 'BUY THEME!');
INSERT INTO `menu_item_translations` VALUES (8, 8, 'en', 'root');
INSERT INTO `menu_item_translations` VALUES (9, 9, 'en', 'ANTIANEMIC');
INSERT INTO `menu_item_translations` VALUES (10, 10, 'en', 'ANTIBIOTIC');
INSERT INTO `menu_item_translations` VALUES (11, 11, 'en', 'ANTIVERTIGINOUS');
INSERT INTO `menu_item_translations` VALUES (12, 12, 'en', 'CARDIOVASCULAR');
INSERT INTO `menu_item_translations` VALUES (13, 13, 'en', 'GASTROINTESTINAL');
INSERT INTO `menu_item_translations` VALUES (14, 14, 'en', 'INMUNOSUPRESSOR');
INSERT INTO `menu_item_translations` VALUES (15, 15, 'en', 'RESPIRATORY');
INSERT INTO `menu_item_translations` VALUES (16, 16, 'en', 'UROLOGY');
INSERT INTO `menu_item_translations` VALUES (17, 17, 'en', 'root');
INSERT INTO `menu_item_translations` VALUES (18, 18, 'en', 'About Us');
INSERT INTO `menu_item_translations` VALUES (19, 19, 'en', 'Return Policy');
INSERT INTO `menu_item_translations` VALUES (20, 20, 'en', 'FAQ');
INSERT INTO `menu_item_translations` VALUES (21, 21, 'en', 'Privacy & Policy');
INSERT INTO `menu_item_translations` VALUES (22, 22, 'en', 'Terms Of Use');
INSERT INTO `menu_item_translations` VALUES (23, 23, 'en', 'root');
INSERT INTO `menu_item_translations` VALUES (24, 24, 'en', 'New Arrivals');
INSERT INTO `menu_item_translations` VALUES (25, 25, 'en', 'Specials');
INSERT INTO `menu_item_translations` VALUES (26, 26, 'en', 'Hot Deals');
INSERT INTO `menu_item_translations` VALUES (27, 27, 'en', 'Backpacks');
INSERT INTO `menu_item_translations` VALUES (28, 28, 'en', 'Men\'s Fashion');

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `category_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `page_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `target` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) UNSIGNED NULL DEFAULT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT 0,
  `is_fluid` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_items_parent_id_foreign`(`parent_id`) USING BTREE,
  INDEX `menu_items_category_id_foreign`(`category_id`) USING BTREE,
  INDEX `menu_items_page_id_foreign`(`page_id`) USING BTREE,
  INDEX `menu_items_menu_id_index`(`menu_id`) USING BTREE,
  CONSTRAINT `menu_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `menu_items_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES (1, 1, NULL, NULL, NULL, 'URL', NULL, NULL, '_self', 0, 1, 0, 1, '2020-07-21 21:27:44', '2020-07-21 21:27:44');
INSERT INTO `menu_items` VALUES (2, 1, 1, NULL, NULL, 'url', '/products', NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:28:01', '2020-07-21 21:28:01');
INSERT INTO `menu_items` VALUES (3, 1, 1, NULL, NULL, 'url', '/brands', NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:28:43', '2020-07-21 21:28:43');
INSERT INTO `menu_items` VALUES (4, 1, 1, NULL, 1, 'page', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:28:54', '2020-07-21 21:28:54');
INSERT INTO `menu_items` VALUES (5, 1, 1, NULL, 4, 'page', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:29:06', '2020-07-21 21:29:06');
INSERT INTO `menu_items` VALUES (6, 1, 1, NULL, 2, 'page', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:29:16', '2020-07-21 21:29:16');
INSERT INTO `menu_items` VALUES (7, 1, 1, NULL, NULL, 'url', 'https://codecanyon.net/item/fleetcart-laravel-ecommerce-system/23014826', NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:29:29', '2020-07-21 21:29:29');
INSERT INTO `menu_items` VALUES (8, 2, NULL, NULL, NULL, 'URL', NULL, NULL, '_self', 0, 1, 0, 1, '2020-07-21 21:29:43', '2020-07-21 21:29:43');
INSERT INTO `menu_items` VALUES (9, 2, 8, 1, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:30:09', '2020-07-21 21:30:09');
INSERT INTO `menu_items` VALUES (10, 2, 8, 2, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:30:24', '2020-07-21 21:30:24');
INSERT INTO `menu_items` VALUES (11, 2, 8, 3, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:30:42', '2020-07-21 21:30:42');
INSERT INTO `menu_items` VALUES (12, 2, 8, 4, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:30:55', '2020-07-21 21:30:55');
INSERT INTO `menu_items` VALUES (13, 2, 8, 5, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:31:07', '2020-07-21 21:31:07');
INSERT INTO `menu_items` VALUES (14, 2, 8, 6, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:31:18', '2020-07-21 21:31:18');
INSERT INTO `menu_items` VALUES (15, 2, 8, 8, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:31:34', '2020-07-21 21:31:34');
INSERT INTO `menu_items` VALUES (16, 2, 8, 9, NULL, 'category', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:31:45', '2020-07-21 21:31:45');
INSERT INTO `menu_items` VALUES (17, 3, NULL, NULL, NULL, 'URL', NULL, NULL, '_self', 0, 1, 0, 1, '2020-07-21 21:33:01', '2020-07-21 21:33:01');
INSERT INTO `menu_items` VALUES (18, 3, 17, NULL, 1, 'page', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:33:17', '2020-07-21 21:33:17');
INSERT INTO `menu_items` VALUES (19, 3, 17, NULL, 3, 'page', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:33:30', '2020-07-21 21:33:30');
INSERT INTO `menu_items` VALUES (20, 3, 17, NULL, 2, 'page', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:33:40', '2020-07-21 21:33:40');
INSERT INTO `menu_items` VALUES (21, 3, 17, NULL, 5, 'page', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:33:49', '2020-07-21 21:33:49');
INSERT INTO `menu_items` VALUES (22, 3, 17, NULL, 4, 'page', NULL, NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:34:01', '2020-07-21 21:34:01');
INSERT INTO `menu_items` VALUES (23, 4, NULL, NULL, NULL, 'URL', NULL, NULL, '_self', 0, 1, 0, 1, '2020-07-21 21:34:19', '2020-07-21 21:34:19');
INSERT INTO `menu_items` VALUES (24, 4, 23, NULL, NULL, 'url', '/categories/hot-sale/products', NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:34:31', '2020-07-21 21:34:31');
INSERT INTO `menu_items` VALUES (25, 4, 23, NULL, NULL, 'url', '/brands/samsung/products', NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:34:42', '2020-07-21 21:34:42');
INSERT INTO `menu_items` VALUES (26, 4, 23, NULL, NULL, 'url', '/brands/msi/products', NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:34:54', '2020-07-21 21:34:54');
INSERT INTO `menu_items` VALUES (27, 4, 23, NULL, NULL, 'url', '/categories/backpacks/products', NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:35:05', '2020-07-21 21:35:05');
INSERT INTO `menu_items` VALUES (28, 4, 23, NULL, NULL, 'url', '/categories/mens-fashion/products', NULL, '_self', NULL, 0, 0, 1, '2020-07-21 21:35:16', '2020-07-21 21:35:16');

-- ----------------------------
-- Table structure for menu_translations
-- ----------------------------
DROP TABLE IF EXISTS `menu_translations`;
CREATE TABLE `menu_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu_translations_menu_id_locale_unique`(`menu_id`, `locale`) USING BTREE,
  CONSTRAINT `menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_translations
-- ----------------------------
INSERT INTO `menu_translations` VALUES (1, 1, 'en', 'Primary Menu');
INSERT INTO `menu_translations` VALUES (2, 2, 'en', 'Category Menu');
INSERT INTO `menu_translations` VALUES (3, 3, 'en', 'Footer Menu 1');
INSERT INTO `menu_translations` VALUES (4, 4, 'en', 'Footer Menu 2');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 1, '2020-07-21 21:27:44', '2020-07-21 21:27:44');
INSERT INTO `menus` VALUES (2, 1, '2020-07-21 21:29:43', '2020-07-21 21:29:43');
INSERT INTO `menus` VALUES (3, 1, '2020-07-21 21:33:01', '2020-07-21 21:33:01');
INSERT INTO `menus` VALUES (4, 1, '2020-07-21 21:34:19', '2020-07-21 21:34:19');

-- ----------------------------
-- Table structure for meta_data
-- ----------------------------
DROP TABLE IF EXISTS `meta_data`;
CREATE TABLE `meta_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `meta_data_entity_type_entity_id_index`(`entity_type`, `entity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meta_data
-- ----------------------------
INSERT INTO `meta_data` VALUES (1, 'Modules\\Product\\Entities\\Product', 1, '2020-07-21 21:06:43', '2020-07-21 21:06:43');
INSERT INTO `meta_data` VALUES (2, 'Modules\\Product\\Entities\\Product', 2, '2020-07-21 21:08:01', '2020-07-21 21:08:01');
INSERT INTO `meta_data` VALUES (3, 'Modules\\Product\\Entities\\Product', 3, '2020-07-21 21:09:03', '2020-07-21 21:09:03');
INSERT INTO `meta_data` VALUES (4, 'Modules\\Product\\Entities\\Product', 4, '2020-07-21 21:10:36', '2020-07-21 21:10:36');
INSERT INTO `meta_data` VALUES (5, 'Modules\\Product\\Entities\\Product', 5, '2020-07-21 21:11:32', '2020-07-21 21:11:32');
INSERT INTO `meta_data` VALUES (6, 'Modules\\Product\\Entities\\Product', 6, '2020-07-21 21:12:34', '2020-07-21 21:12:34');
INSERT INTO `meta_data` VALUES (7, 'Modules\\Product\\Entities\\Product', 7, '2020-07-21 21:13:14', '2020-07-21 21:13:14');
INSERT INTO `meta_data` VALUES (8, 'Modules\\Product\\Entities\\Product', 8, '2020-07-21 21:15:52', '2020-07-21 21:15:52');
INSERT INTO `meta_data` VALUES (9, 'Modules\\Product\\Entities\\Product', 9, '2020-07-21 21:16:50', '2020-07-21 21:16:50');
INSERT INTO `meta_data` VALUES (10, 'Modules\\Product\\Entities\\Product', 10, '2020-07-21 21:18:26', '2020-07-21 21:18:26');
INSERT INTO `meta_data` VALUES (11, 'Modules\\Product\\Entities\\Product', 11, '2020-07-21 21:19:25', '2020-07-21 21:19:25');
INSERT INTO `meta_data` VALUES (12, 'Modules\\Product\\Entities\\Product', 12, '2020-07-21 21:20:26', '2020-07-21 21:20:26');
INSERT INTO `meta_data` VALUES (13, 'Modules\\Product\\Entities\\Product', 13, '2020-07-21 21:21:31', '2020-07-21 21:21:31');
INSERT INTO `meta_data` VALUES (14, 'Modules\\Brand\\Entities\\Brand', 1, '2020-07-21 21:23:14', '2020-07-21 21:23:14');
INSERT INTO `meta_data` VALUES (15, 'Modules\\Page\\Entities\\Page', 1, '2020-07-21 21:25:48', '2020-07-21 21:25:48');
INSERT INTO `meta_data` VALUES (16, 'Modules\\Page\\Entities\\Page', 2, '2020-07-21 21:26:01', '2020-07-21 21:26:01');
INSERT INTO `meta_data` VALUES (17, 'Modules\\Page\\Entities\\Page', 3, '2020-07-21 21:26:22', '2020-07-21 21:26:22');
INSERT INTO `meta_data` VALUES (18, 'Modules\\Page\\Entities\\Page', 4, '2020-07-21 21:26:38', '2020-07-21 21:26:38');
INSERT INTO `meta_data` VALUES (19, 'Modules\\Page\\Entities\\Page', 5, '2020-07-21 21:26:56', '2020-07-21 21:26:56');

-- ----------------------------
-- Table structure for meta_data_translations
-- ----------------------------
DROP TABLE IF EXISTS `meta_data_translations`;
CREATE TABLE `meta_data_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `meta_data_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `meta_data_translations_meta_data_id_locale_unique`(`meta_data_id`, `locale`) USING BTREE,
  CONSTRAINT `meta_data_translations_meta_data_id_foreign` FOREIGN KEY (`meta_data_id`) REFERENCES `meta_data` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meta_data_translations
-- ----------------------------
INSERT INTO `meta_data_translations` VALUES (1, 1, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (2, 2, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (3, 3, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (4, 4, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (5, 5, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (6, 6, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (7, 7, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (8, 8, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (9, 9, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (10, 10, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (11, 11, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (12, 12, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (13, 13, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (14, 14, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (15, 15, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (16, 16, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (17, 17, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (18, 18, 'en', NULL, NULL);
INSERT INTO `meta_data_translations` VALUES (19, 19, 'en', NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_07_02_230147_migration_cartalyst_sentinel', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_14_200250_create_settings_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_26_162751_create_files_table', 1);
INSERT INTO `migrations` VALUES (4, '2014_10_30_191858_create_pages_table', 1);
INSERT INTO `migrations` VALUES (5, '2014_11_31_125848_create_page_translations_table', 1);
INSERT INTO `migrations` VALUES (6, '2015_02_27_105241_create_entity_files_table', 1);
INSERT INTO `migrations` VALUES (7, '2015_11_20_184604486385_create_translations_table', 1);
INSERT INTO `migrations` VALUES (8, '2015_11_20_184604743083_create_translation_translations_table', 1);
INSERT INTO `migrations` VALUES (9, '2017_05_29_155126144426_create_products_table', 1);
INSERT INTO `migrations` VALUES (10, '2017_05_30_155126416338_create_product_translations_table', 1);
INSERT INTO `migrations` VALUES (11, '2017_08_02_153217_create_options_table', 1);
INSERT INTO `migrations` VALUES (12, '2017_08_02_153348_create_option_translations_table', 1);
INSERT INTO `migrations` VALUES (13, '2017_08_02_153406_create_option_values_table', 1);
INSERT INTO `migrations` VALUES (14, '2017_08_02_153736_create_option_value_translations_table', 1);
INSERT INTO `migrations` VALUES (15, '2017_08_03_156576_create_product_options_table', 1);
INSERT INTO `migrations` VALUES (16, '2017_08_17_170128_create_related_products_table', 1);
INSERT INTO `migrations` VALUES (17, '2017_08_17_175236_create_up_sell_products_table', 1);
INSERT INTO `migrations` VALUES (18, '2017_08_17_175828_create_cross_sell_products_table', 1);
INSERT INTO `migrations` VALUES (19, '2017_11_09_141332910964_create_categories_table', 1);
INSERT INTO `migrations` VALUES (20, '2017_11_09_141332931539_create_category_translations_table', 1);
INSERT INTO `migrations` VALUES (21, '2017_11_26_083614526622_create_meta_data_table', 1);
INSERT INTO `migrations` VALUES (22, '2017_11_26_083614526828_create_meta_data_translations_table', 1);
INSERT INTO `migrations` VALUES (23, '2018_01_24_125642_create_product_categories_table', 1);
INSERT INTO `migrations` VALUES (24, '2018_02_04_150917488267_create_coupons_table', 1);
INSERT INTO `migrations` VALUES (25, '2018_02_04_150917488698_create_coupon_translations_table', 1);
INSERT INTO `migrations` VALUES (26, '2018_03_11_181317_create_coupon_products_table', 1);
INSERT INTO `migrations` VALUES (27, '2018_03_15_091937_create_coupon_categories_table', 1);
INSERT INTO `migrations` VALUES (28, '2018_04_18_154028776225_create_reviews_table', 1);
INSERT INTO `migrations` VALUES (29, '2018_05_17_115822452977_create_currency_rates_table', 1);
INSERT INTO `migrations` VALUES (30, '2018_07_03_124153537506_create_sliders_table', 1);
INSERT INTO `migrations` VALUES (31, '2018_07_03_124153537695_create_slider_translations_table', 1);
INSERT INTO `migrations` VALUES (32, '2018_07_03_133107770172_create_slider_slides_table', 1);
INSERT INTO `migrations` VALUES (33, '2018_07_03_133107770486_create_slider_slide_translations_table', 1);
INSERT INTO `migrations` VALUES (34, '2018_07_28_190524758357_create_attribute_sets_table', 1);
INSERT INTO `migrations` VALUES (35, '2018_07_28_190524758497_create_attribute_set_translations_table', 1);
INSERT INTO `migrations` VALUES (36, '2018_07_28_190524758646_create_attributes_table', 1);
INSERT INTO `migrations` VALUES (37, '2018_07_28_190524758877_create_attribute_translations_table', 1);
INSERT INTO `migrations` VALUES (38, '2018_07_28_190524759461_create_product_attributes_table', 1);
INSERT INTO `migrations` VALUES (39, '2018_08_01_001919718631_create_tax_classes_table', 1);
INSERT INTO `migrations` VALUES (40, '2018_08_01_001919718935_create_tax_class_translations_table', 1);
INSERT INTO `migrations` VALUES (41, '2018_08_01_001919723551_create_tax_rates_table', 1);
INSERT INTO `migrations` VALUES (42, '2018_08_01_001919723781_create_tax_rate_translations_table', 1);
INSERT INTO `migrations` VALUES (43, '2018_08_03_195922206748_create_attribute_values_table', 1);
INSERT INTO `migrations` VALUES (44, '2018_08_03_195922207019_create_attribute_value_translations_table', 1);
INSERT INTO `migrations` VALUES (45, '2018_08_04_190524764275_create_product_attribute_values_table', 1);
INSERT INTO `migrations` VALUES (46, '2018_08_07_135631306565_create_orders_table', 1);
INSERT INTO `migrations` VALUES (47, '2018_08_07_135631309451_create_order_products_table', 1);
INSERT INTO `migrations` VALUES (48, '2018_08_07_135631309512_create_order_product_options_table', 1);
INSERT INTO `migrations` VALUES (49, '2018_08_07_135631309624_create_order_product_option_values_table', 1);
INSERT INTO `migrations` VALUES (50, '2018_09_11_213926106353_create_transactions_table', 1);
INSERT INTO `migrations` VALUES (51, '2018_09_19_081602135631_create_order_taxes_table', 1);
INSERT INTO `migrations` VALUES (52, '2018_09_19_103745_create_setting_translations_table', 1);
INSERT INTO `migrations` VALUES (53, '2018_10_01_224852175056_create_wish_lists_table', 1);
INSERT INTO `migrations` VALUES (54, '2018_10_04_185608_create_search_terms_table', 1);
INSERT INTO `migrations` VALUES (55, '2018_11_03_160015_create_menus_table', 1);
INSERT INTO `migrations` VALUES (56, '2018_11_03_160138_create_menu_translations_table', 1);
INSERT INTO `migrations` VALUES (57, '2018_11_03_160753_create_menu_items_table', 1);
INSERT INTO `migrations` VALUES (58, '2018_11_03_160804_create_menu_item_translation_table', 1);
INSERT INTO `migrations` VALUES (59, '2019_02_05_162605_add_position_to_slider_slides_table', 1);
INSERT INTO `migrations` VALUES (60, '2019_02_09_164343_remove_file_id_from_slider_slides_table', 1);
INSERT INTO `migrations` VALUES (61, '2019_02_09_164434_add_file_id_to_slider_slide_translations_table', 1);
INSERT INTO `migrations` VALUES (62, '2019_02_14_103408_create_attribute_categories_table', 1);
INSERT INTO `migrations` VALUES (63, '2019_08_09_164759_add_slug_column_to_attributes_table', 1);
INSERT INTO `migrations` VALUES (64, '2019_11_01_201511_add_special_price_type_column_to_products_table', 1);
INSERT INTO `migrations` VALUES (65, '2019_11_23_193101_add_value_column_to_order_product_options_table', 1);
INSERT INTO `migrations` VALUES (66, '2020_01_04_211424_add_icon_column_to_menu_items_table', 1);
INSERT INTO `migrations` VALUES (67, '2020_01_05_160502_add_direction_column_to_slider_slide_translations_table', 1);
INSERT INTO `migrations` VALUES (68, '2020_01_05_234014_add_speed_column_to_sliders_table', 1);
INSERT INTO `migrations` VALUES (69, '2020_01_05_235014_add_fade_column_to_sliders_table', 1);
INSERT INTO `migrations` VALUES (70, '2020_01_15_000346259038_create_flash_sales_table', 1);
INSERT INTO `migrations` VALUES (71, '2020_01_15_000346259349_create_flash_sale_translations_table', 1);
INSERT INTO `migrations` VALUES (72, '2020_01_23_011234_create_flash_sale_products_table', 1);
INSERT INTO `migrations` VALUES (73, '2020_01_30_015722_create_flash_sale_product_orders_table', 1);
INSERT INTO `migrations` VALUES (74, '2020_02_22_215943_delete_meta_keywords_column_from_meta_data_translations_table', 1);
INSERT INTO `migrations` VALUES (75, '2020_03_05_214602901973_create_brands_table', 1);
INSERT INTO `migrations` VALUES (76, '2020_03_05_214602902369_create_brand_translations_table', 1);
INSERT INTO `migrations` VALUES (77, '2020_03_06_234605_add_brand_id_column_to_products_table', 1);
INSERT INTO `migrations` VALUES (78, '2020_04_06_211526_add_note_column_to_orders_table', 1);
INSERT INTO `migrations` VALUES (79, '2020_04_28_034118164376_create_tags_table', 1);
INSERT INTO `migrations` VALUES (80, '2020_04_28_034118164618_create_tag_translations_table', 1);
INSERT INTO `migrations` VALUES (81, '2020_04_28_225657_create_product_tags_table', 1);
INSERT INTO `migrations` VALUES (82, '2020_05_10_041616_create_updater_scripts_table', 1);

-- ----------------------------
-- Table structure for option_translations
-- ----------------------------
DROP TABLE IF EXISTS `option_translations`;
CREATE TABLE `option_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `option_translations_option_id_locale_unique`(`option_id`, `locale`) USING BTREE,
  CONSTRAINT `option_translations_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of option_translations
-- ----------------------------
INSERT INTO `option_translations` VALUES (1, 1, 'en', '10122011');

-- ----------------------------
-- Table structure for option_value_translations
-- ----------------------------
DROP TABLE IF EXISTS `option_value_translations`;
CREATE TABLE `option_value_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_value_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `option_value_translations_option_value_id_locale_unique`(`option_value_id`, `locale`) USING BTREE,
  CONSTRAINT `option_value_translations_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for option_values
-- ----------------------------
DROP TABLE IF EXISTS `option_values`;
CREATE TABLE `option_values`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `price_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `option_values_option_id_index`(`option_id`) USING BTREE,
  CONSTRAINT `option_values_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of option_values
-- ----------------------------
INSERT INTO `option_values` VALUES (1, 1, NULL, 'fixed', 0, '2020-07-21 17:42:26', '2020-07-21 17:42:26');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(10) UNSIGNED NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES (1, 'field', 0, 0, 0, NULL, '2020-07-21 17:42:25', '2020-07-21 17:42:25');

-- ----------------------------
-- Table structure for order_product_option_values
-- ----------------------------
DROP TABLE IF EXISTS `order_product_option_values`;
CREATE TABLE `order_product_option_values`  (
  `order_product_option_id` int(10) UNSIGNED NOT NULL,
  `option_value_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`order_product_option_id`, `option_value_id`) USING BTREE,
  INDEX `order_product_option_values_option_value_id_foreign`(`option_value_id`) USING BTREE,
  CONSTRAINT `order_product_option_values_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_product_option_values_order_product_option_id_foreign` FOREIGN KEY (`order_product_option_id`) REFERENCES `order_product_options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_product_options
-- ----------------------------
DROP TABLE IF EXISTS `order_product_options`;
CREATE TABLE `order_product_options`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_product_id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_product_options_order_product_id_option_id_unique`(`order_product_id`, `option_id`) USING BTREE,
  INDEX `order_product_options_option_id_foreign`(`option_id`) USING BTREE,
  CONSTRAINT `order_product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_product_options_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_products
-- ----------------------------
DROP TABLE IF EXISTS `order_products`;
CREATE TABLE `order_products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(18, 4) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `line_total` decimal(18, 4) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_products_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_products_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_products
-- ----------------------------
INSERT INTO `order_products` VALUES (1, 1, 3, 1.0000, 1, 1.0000);

-- ----------------------------
-- Table structure for order_taxes
-- ----------------------------
DROP TABLE IF EXISTS `order_taxes`;
CREATE TABLE `order_taxes`  (
  `order_id` int(10) UNSIGNED NOT NULL,
  `tax_rate_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15, 4) UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`, `tax_rate_id`) USING BTREE,
  INDEX `order_taxes_tax_rate_id_foreign`(`tax_rate_id`) USING BTREE,
  CONSTRAINT `order_taxes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_taxes_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL,
  `customer_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `customer_first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `billing_city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipping_city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(18, 4) UNSIGNED NOT NULL,
  `shipping_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_cost` decimal(18, 4) UNSIGNED NOT NULL,
  `coupon_id` int(11) NULL DEFAULT NULL,
  `discount` decimal(18, 4) UNSIGNED NOT NULL,
  `total` decimal(18, 4) UNSIGNED NOT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` decimal(18, 4) NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_customer_id_index`(`customer_id`) USING BTREE,
  INDEX `orders_coupon_id_index`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 'analista.guma@gmail.com', '82449100', 'Maryan', 'Espinoza', 'Maryan', 'Espinoza', 'De La Dgi 6c Al Sur', NULL, 'Jinotepe', 'managua', '45000', 'NI', 'Maryan', 'Espinoza', 'De La Dgi 6c Al Sur', NULL, 'Jinotepe', 'managua', '45000', 'NI', 1.0000, 'free_shipping', 0.0000, NULL, 0.0000, 1.0000, 'cod', 'USD', 1.0000, 'en', 'completed', NULL, NULL, '2020-07-21 16:31:00', '2020-07-21 16:32:34');

-- ----------------------------
-- Table structure for page_translations
-- ----------------------------
DROP TABLE IF EXISTS `page_translations`;
CREATE TABLE `page_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `page_translations_page_id_locale_unique`(`page_id`, `locale`) USING BTREE,
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of page_translations
-- ----------------------------
INSERT INTO `page_translations` VALUES (1, 1, 'en', 'About Us', '<h1 style=\"text-align: center;\">About Us</h1>\r\n<p>&nbsp;</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"/storage/media/HmOKyObsMLWvxahqNqsnvjox2PYfZJMPNxuHMs29.jpeg\" alt=\"\" width=\"100%\" height=\"100%\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>In luctus nunc id lectus pellentesque lacinia.</li>\r\n<li>Pellentesque laoreet mi molestie tortor aliquam, sed hendrerit nisi consectetur.</li>\r\n<li>Nam sed sapien sed lacus placerat euismod in consectetur ex.</li>\r\n<li>Sed et odio ultrices, semper sem sed, scelerisque libero.</li>\r\n<li>Proin ut ex varius libero viverra pellentesque.</li>\r\n</ul>');
INSERT INTO `page_translations` VALUES (2, 2, 'en', 'FAQ', '<h1 style=\"text-align: center;\">Help &amp; FAQ</h1>\r\n<p>&nbsp;</p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>What does LOREM mean?</h4>\r\n<p>&lsquo;Lorem ipsum dolor sit amet, consectetur adipisici elit&hellip;&rsquo; (complete text) is dummy text that is not meant to mean anything. It is used as a placeholder in magazine layouts, for example, in order to give an impression of the finished document. The text is intentionally unintelligible so that the viewer is not distracted by the content. The language is not real Latin and even the first word &lsquo;Lorem&rsquo; does not exist. It is said that the lorem ipsum text has been common among typesetters since the 16th century.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Why do we use it?</h4>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Where does it come from?</h4>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Where can I get some?</h4>\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Why do we use Lorem Ipsum?</h4>\r\n<p>Many times, readers will get distracted by readable text when looking at the layout of a page. Instead of using filler text that says &ldquo;Insert content here,&rdquo; Lorem Ipsum uses a normal distribution of letters, making it resemble standard English. This makes it easier for designers to focus on visual elements, as opposed to what the text on a page actually says. Lorem Ipsum is absolutely necessary in most design cases, too. Web design projects like landing pages, website redesigns and so on only look as intended when they\'re fully-fleshed out with content.</p>');
INSERT INTO `page_translations` VALUES (3, 3, 'en', 'Return Policy', '<h1 style=\"text-align: center;\">Return Policy</h1>\r\n<p>&nbsp;</p>\r\n<p>Studio Lorem Ipsum will accept returns of UNWORN MERCHANDISE within 14 days of receipt of your order. If 14 days have gone by since receipt of your order, unfortunately we can&rsquo;t offer you a refund or exchange.</p>\r\n<p>&nbsp;</p>\r\n<p>To be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.</p>\r\n<p>&nbsp;</p>\r\n<p>To complete your return, we require a receipt or proof of purchase.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Refunds (if applicable)</h4>\r\n<p>Once your return is received and inspected, we will send you an email to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.<br />If you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Late or missing refunds (if applicable)</h4>\r\n<ul>\r\n<li>If you haven&rsquo;t received a refund yet, first check your bank account again.</li>\r\n<li>Then contact your credit card company, it may take some time before your refund is officially posted.</li>\r\n<li>Next contact your bank. There is often some processing time before a refund is posted.</li>\r\n<li>If you&rsquo;ve done all of this and you still have not received your refund yet, please contact us.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Gifts</h4>\r\n<p>If the item was marked as a gift when purchased and shipped directly to you, you&rsquo;ll receive a gift credit for the value of your return. Once the returned item is received, a gift certificate will be mailed to you.</p>\r\n<p>&nbsp;</p>\r\n<p>If the item wasn&rsquo;t marked as a gift when purchased, or the gift giver had the order shipped to themselves to give to you later, we will send a refund to the gift giver and he will find out about your return.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Shipping</h4>\r\n<p>To return your product, you can request to return the product within 14 days of receipt of your order, and we will email you the return label which you can use to ship the product. Once your return is received and inspected, the refund will be processed to your original method of payment.</p>');
INSERT INTO `page_translations` VALUES (4, 4, 'en', 'Terms & Conditions', '<h1 style=\"text-align: center;\">Terms of Service</h1>\r\n<p>&nbsp;</p>\r\n<p>This website is operated by a.season. Throughout the site, the terms &ldquo;we&rdquo;, &ldquo;us&rdquo; and &ldquo;our&rdquo; refer to a.season. a.season offers this website, including all information, tools and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here.</p>\r\n<p>&nbsp;</p>\r\n<p>By visiting our site and/ or purchasing something from us, you engage in our &ldquo;Service&rdquo; and agree to be bound by the following terms and conditions (&ldquo;Terms of Service&rdquo;, &ldquo;Terms&rdquo;), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Online Store Terms</h4>\r\n<p>By agreeing to these Terms of Service, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>General Conditions</h4>\r\n<p>We reserve the right to refuse service to anyone for any reason at any time.<br />You understand that your content (not including credit card information), may be transferred unencrypted and involve (a) transmissions over various networks; and (b) changes to conform and adapt to technical requirements of connecting networks or devices. Credit card information is always encrypted during transfer over networks.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>License</h4>\r\n<p>You must not:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Republish material from&nbsp;<span class=\"highlight preview_website_name\">Website Name</span></li>\r\n<li>Sell, rent or sub-license material from&nbsp;<span class=\"highlight preview_website_name\">Website Name</span></li>\r\n<li>Reproduce, duplicate or copy material from&nbsp;<span class=\"highlight preview_website_name\">Website Name</span></li>\r\n<li>Redistribute content from&nbsp;<span class=\"highlight preview_website_name\">Website Name</span></li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Disclaimer</h4>\r\n<p>To the maximum extent permitted by applicable law, we exclude all representations:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>limit or exclude our or your liability for death or personal injury;</li>\r\n<li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>\r\n<li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>\r\n<li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>');
INSERT INTO `page_translations` VALUES (5, 5, 'en', 'Privacy & Policy', '<h1 style=\"text-align: center;\">Privacy Policy</h1>\r\n<p>&nbsp;</p>\r\n<p>Your privacy is as important to us as it is to you. We know you hate SPAM and so do we. That is why we will never sell or share your information with anyone without your express permission. We respect your rights and will do everything in our power to protect your personal information. In the interest of full disclosure, we provide this notice explaining our online information collection practices. This privacy notice discloses the privacy practices for <a href=\"https://envaysoft.com/\">EnvaySoft</a>&nbsp;(herein known as we, us and our company) and applies solely to information collected by this web site.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Information Collection, Use, and Sharing</h4>\r\n<p>We are the sole owners of the information collected on this site. We only have access to information that you voluntarily give us via email or other direct contact from you. We will not sell or rent this information to anyone. We will use your information to respond to you, regarding the reason you contacted us. We will not share your information with any third party outside of our organization, other than as necessary to fulfill your request, e.g. to ship an order.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Disclosure</h4>\r\n<p>This site uses Google web analytics service. Google may record mouse clicks, mouse movements, scrolling activity as well as text you type in this website. This site does not use Google to collect any personally identifiable information entered in this website. Google does track your browsing habits across web sites which do not use Google services.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Security</h4>\r\n<p>We take precautions to protect your information. When you submit sensitive information via the website, your information is protected both online and offline.</p>\r\n<p>Wherever we collect sensitive information (such as credit card data), that information is encrypted and transmitted to us in a secure way. You can verify this by looking for a closed lock icon at the bottom of your web browser, or looking for &ldquo;https&rdquo; at the beginning of the address of the web page.</p>\r\n<p>While we use encryption to protect sensitive information transmitted online, we also protect your information offline. Only employees who need the information to perform a specific job (for example, billing or customer service) are granted access to personally identifiable information. The computers/servers in which we store personally identifiable information are kept in a secure environment.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<h4>Email Policy</h4>\r\n<p>The following are situations in which you may provide Your Information to us:</p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>\r\n<p>When you fill out forms or fields through our Services.</p>\r\n</li>\r\n<li>\r\n<p>When you register for an account with our Service.</p>\r\n</li>\r\n<li>\r\n<p>When you create a subscription for our newsletter or Services.</p>\r\n</li>\r\n<li>\r\n<p>When you provide responses to a survey.</p>\r\n</li>\r\n<li>\r\n<p>When you answer questions on a quiz.</p>\r\n</li>\r\n<li>\r\n<p>When you join or enroll in an event through our Services.</p>\r\n</li>\r\n<li>\r\n<p>When you order services or products from, or through our Service.</p>\r\n</li>\r\n<li>\r\n<p>When you provide information to us through a third-party application, service or Website.</p>\r\n</li>\r\n</ul>');

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pages_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (1, 'about-us', 1, '2020-07-21 21:25:48', '2020-07-21 21:25:48');
INSERT INTO `pages` VALUES (2, 'faq', 1, '2020-07-21 21:26:01', '2020-07-21 21:26:01');
INSERT INTO `pages` VALUES (3, 'return-policy', 1, '2020-07-21 21:26:22', '2020-07-21 21:26:22');
INSERT INTO `pages` VALUES (4, 'terms-conditions', 1, '2020-07-21 21:26:38', '2020-07-21 21:26:38');
INSERT INTO `pages` VALUES (5, 'privacy-policy', 1, '2020-07-21 21:26:56', '2020-07-21 21:26:56');

-- ----------------------------
-- Table structure for persistences
-- ----------------------------
DROP TABLE IF EXISTS `persistences`;
CREATE TABLE `persistences`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `persistences_code_unique`(`code`) USING BTREE,
  INDEX `persistences_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persistences
-- ----------------------------
INSERT INTO `persistences` VALUES (1, 1, 'P2r1OAzPYeS0z9J41nyvoIrBu82EPljt', '2020-07-21 20:47:38', '2020-07-21 20:47:38');

-- ----------------------------
-- Table structure for product_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE `product_attribute_values`  (
  `product_attribute_id` int(10) UNSIGNED NOT NULL,
  `attribute_value_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_attribute_id`, `attribute_value_id`) USING BTREE,
  INDEX `product_attribute_values_attribute_value_id_foreign`(`attribute_value_id`) USING BTREE,
  CONSTRAINT `product_attribute_values_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE `product_attributes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_attributes_product_id_index`(`product_id`) USING BTREE,
  INDEX `product_attributes_attribute_id_index`(`attribute_id`) USING BTREE,
  CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories`  (
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`) USING BTREE,
  INDEX `product_categories_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
INSERT INTO `product_categories` VALUES (1, 1);
INSERT INTO `product_categories` VALUES (3, 1);
INSERT INTO `product_categories` VALUES (2, 2);
INSERT INTO `product_categories` VALUES (4, 3);
INSERT INTO `product_categories` VALUES (5, 3);
INSERT INTO `product_categories` VALUES (6, 4);
INSERT INTO `product_categories` VALUES (8, 4);
INSERT INTO `product_categories` VALUES (9, 5);
INSERT INTO `product_categories` VALUES (10, 5);
INSERT INTO `product_categories` VALUES (11, 5);
INSERT INTO `product_categories` VALUES (12, 6);
INSERT INTO `product_categories` VALUES (13, 9);

-- ----------------------------
-- Table structure for product_options
-- ----------------------------
DROP TABLE IF EXISTS `product_options`;
CREATE TABLE `product_options`  (
  `product_id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `option_id`) USING BTREE,
  INDEX `product_options_option_id_foreign`(`option_id`) USING BTREE,
  CONSTRAINT `product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_tags
-- ----------------------------
DROP TABLE IF EXISTS `product_tags`;
CREATE TABLE `product_tags`  (
  `product_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `tag_id`) USING BTREE,
  INDEX `product_tags_tag_id_foreign`(`tag_id`) USING BTREE,
  CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_translations`;
CREATE TABLE `product_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_translations_product_id_locale_unique`(`product_id`, `locale`) USING BTREE,
  FULLTEXT INDEX `name`(`name`),
  CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_translations
-- ----------------------------
INSERT INTO `product_translations` VALUES (1, 1, 'en', 'Fefoz Injection Solution', '<p><strong>Composition</strong><br />Each 1ml contains</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong><br />Treatment of severe iron-deficiency anemia in patients with problems of intestinal iron absorption.</p>\r\n<p><strong>DOSAGE</strong><br />Adults: 100-200 mg of Fe (5-10 ml), 1-3 times/weekly.</p>\r\n<p><strong>PRESENTATIONS</strong><br />Carton containing 5 ampoules with 5 ml of injection solution in tray.</p>', NULL);
INSERT INTO `product_translations` VALUES (2, 2, 'en', 'Bactelid® 600 mg Film-coated Tablets', '<p><strong>Composition</strong><br />Each film-coated tablet contains:<br />Linezolid&hellip;600 mg<br />Excipients&hellip;&hellip;&hellip;q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong><br />Nosocomial pneumonia<br />Community-acquired pneumonia<br />Complicated infections of skin and soft tissues</p>\r\n<p><strong>DOSAGE</strong><br />Nosocomial or community-acquired pneumonia, complicated infection of skin and soft tissues: 600 mg 2 times/daily, 10-14 days.</p>\r\n<p><strong>PRESENTATIONS</strong><br />Carton containing 10 film-coated tablets in blister pack.</p>', NULL);
INSERT INTO `product_translations` VALUES (3, 3, 'en', 'Ondemel® 4 mg/ml Injection Solution', '<p><strong>Composition</strong><br />Each 1ml contains:<br />Ondansetron Hydrochloride USP eq. to Ondansetron 4 mg<br />Vehicle q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong><br /><strong>Adults</strong><br />Treatment of nausea and vomiting induced by cytotoxic chemotherapy and radiotherapy and for prevention and treatment of post-operative nausea and vomiting (PONV).</p>\r\n<p><strong>Pediatric Population</strong><br />Treatment of nausea and vomiting induced by chemotherapy in children &gt; 6 months of age. Prevention and treatment of post-operative nausea and vomiting in children &gt; 1 month of age.</p>\r\n<p><strong>DOSAGE</strong><br />Adults and children (4-18 years) in the prophylaxis of nausea and vomiting induced by cytostatic drugs, 0.15 mg/Kg (or 8 mg) by IV route during 15 min, administering the first dose 30 min before the cytostatic drug and the other two at 4-hr intervals.</p>\r\n<p><strong>PRESENTATIONS</strong></p>\r\n<p>Carton containing 10 ampoules with 2ml of injection solution in tray.</p>', NULL);
INSERT INTO `product_translations` VALUES (4, 4, 'en', 'Vertinull® 16 mg Film-coated Tablets BP', '<div><strong>Composition</strong></div>\r\n<div>Each film-coated tablet contains:<br />Betahistine Dihydrochloride BP&hellip;16 mg<br />Excipients&hellip;&hellip;&hellip;q.s.</div>\r\n<div>&nbsp;</div>\r\n<div>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong><br />Vertinull&reg; 16 mg Film-coated Tablets BP is indicated for the treatment of M&eacute;ni&egrave;re&rsquo;s disease defined by three symptoms: dizziness (with nausea and vomit), hearing loss, tinnitus.</p>\r\n<p><strong>DOSAGE</strong><br />Adults: 24-48 mg/day divided in 3 intakes. Individually adjust according to the response.</p>\r\n<p><strong>PRESENTATIONS</strong><br />Carton containing 30 film-coated tablets in blister pack.</p>\r\n</div>', NULL);
INSERT INTO `product_translations` VALUES (5, 5, 'en', 'Vertinull® 24 mg Film-coated Tablets BP', '<p><strong>Composition</strong></p>\r\n<p>Each film-coated tablet contains:<br />Betahistine Dihydrochloride BP&hellip;24 mg<br />Excipients&hellip;&hellip;&hellip;q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong></p>\r\n<p>Vertinull&reg; 16 mg Film-coated Tablets BP is indicated for the treatment of M&eacute;ni&egrave;re&rsquo;s disease defined by three symptoms: dizziness (with nausea and vomit), hearing loss, tinnitus.</p>\r\n<p><strong>DOSAGE</strong><br />Adults: 24-48 mg/day divided in 3 intakes. Individually adjust according to the response.</p>\r\n<p><strong>PRESENTATIONS</strong><br />Carton containing 30 film-coated tablets in blister pack.</p>', NULL);
INSERT INTO `product_translations` VALUES (6, 6, 'en', 'Olarten® 20 mg Film-coated Tablets USP', '<p><strong>Composition</strong><br />Each film-coated tablet contains:<br />Olmesartan Medoxomil USP &hellip;&hellip;&hellip;20 mg<br />Excipients&hellip;&hellip;&hellip;q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong></p>\r\n<p>Treatment of essential hypertension in adults.<br />Treatment of hypertension in children and teenagers from 6 to less than 18 years of age.</p>\r\n<p><strong>DOSAGE</strong></p>\r\n<p>It is recommended that treatment should begin with a dose of 20 mg once a day in monotherapy. If after 2 weeks the blood pressure is not controlled, the dose can be increased to 40mg once a day.</p>\r\n<p><strong>PRESENTATIONS</strong></p>\r\n<p>Carton containing 30 film-coated tablets in blister pack.</p>', NULL);
INSERT INTO `product_translations` VALUES (7, 7, 'en', 'Olarten® 40 mg Film-coated Tablets USP', '<p><strong>Composition</strong><br />Each film-coated tablet contains:<br />Olmesartan Medoxomil USP &hellip;&hellip;&hellip;40 mg<br />Excipients&hellip;&hellip;&hellip;q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong></p>\r\n<p>Treatment of essential hypertension in adults.<br />Treatment of hypertension in children and teenagers from 6 to less than 18 years of age.</p>\r\n<p><strong>DOSAGE</strong>:</p>\r\n<p>It is recommended that treatment should begin with a dose of 20 mg once a day in monotherapy. If after 2 weeks the blood pressure is not controlled, the dose can be increased to 40mg once a day.</p>\r\n<p><strong>PRESENTATIONS</strong></p>\r\n<p>Carton containing 30 film-coated tablets in blister pack.</p>', NULL);
INSERT INTO `product_translations` VALUES (8, 8, 'en', 'Pulmotan® 125 mg Film-coated Tablets', '<p><strong>Composition</strong><br />Each film-coated tablet contains:<br />Bosentan Monohydrate eq. to Bosentan&hellip;125 mg<br />Excipients&hellip;&hellip;&hellip;q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong><br />Primary arterial pulmonary hypertension (idiopathic and hereditary).<br />Secondary arterial pulmonary hypertension to scleroderma without significant interstitial pulmonary disease.<br />Arterial pulmonary hypertension associated with inborn systemic-pulmonary short circuits and Eisenmenger syndrome.</p>\r\n<p><strong>DOSAGE</strong></p>\r\n<p>Adults: starts with 62.5 mg/12 hr during 4 weeks, increase to 125 mg/12 hr</p>\r\n<p><strong>PRESENTATIONS</strong><br />Carton containing 60 film-coated tablets in blister pack.</p>', NULL);
INSERT INTO `product_translations` VALUES (9, 9, 'en', 'Gumazol® 40 mg DR Capsules USP', '<p><strong>Composition</strong><br />Each DR capsule contains:<br />Esomeprazole Magnesium USP eq. to Esomeprazole&hellip;40 mg<br />Excipients&hellip;&hellip;&hellip;q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong></p>\r\n<p>Gastroesophageal Reflux Disease (GERD)<br />In combination with an appropriate antibacterial therapy for the eradication of Helicobacter Pylori.<br />Patients who need a continuous NSAID therapy.<br />Therapy for continuation of prevention of peptic ulcer rebleeding induced by intravenous route.<br />Treatment of Zollinger-Ellison Syndrome.</p>\r\n<p><strong>DOSAGE</strong><br />Symptomatic treatment of GERD. Adults and teenagers 12 years and older: 20 mg once/daily.<br />Zollinger-Ellison Syndrome. Adults: Initial dose, 40 mg twice/daily, then 80-160 mg/daily (dose &gt; 80 mg split in 2 times/daily).</p>\r\n<p><strong>PRESENTATIONS</strong><br />Carton containing 30 DR capsules in blister pack.</p>', NULL);
INSERT INTO `product_translations` VALUES (10, 10, 'en', 'Lepirel® 25 mg  Tablets', '<p><strong>Composition</strong><br />Each tablet contains:<br />Levosulpiride&hellip; 25 mg<br />Excipients&hellip; q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong><br />Treatment of dysmotility-type functional dyspepsia in those patients who do not respond to hygienic-dietary regimen.</p>\r\n<p>DOSAGE<br />Recommended dose: 25 mg/8 hrs (at least 20 min before eating).</p>\r\n<p><strong>PRESENTATIONS</strong><br />Carton containing 30 tablets in blister pack.</p>', NULL);
INSERT INTO `product_translations` VALUES (11, 11, 'en', 'Panzide® 40 mg Enteric Coated Tablets', '<p><strong>Composition</strong><br />Each enteric coated tablet contains:<br />Pantoprazole Sodium USP eq. to Pantoprazole&hellip;40 mg<br />Excipients&hellip;&hellip;&hellip;q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong></p>\r\n<p>Adults and teenagers 12 years and older<br />Reflux Esophagitis.</p>\r\n<p>Adults<br />Eradication of Helicobacter pylori (H. pylori) in combination with an adequate antibiotic therapy in patients with H. pylori associated to ulcers.<br />Gastric and duodenal ulcers<br />Zollinger-Ellison Syndrome and other pathologic hypersecretory diseases.</p>\r\n<p><strong>DOSAGE</strong></p>\r\n<p>Moderate and serious reflux esophagitis: oral, 40-80 mg/24 h, 4-8 weeks.<br />Eradication of H. pylori, oral, 40 mg 2 times/daily.</p>\r\n<p><strong>PRESENTATIONS</strong></p>\r\n<p>Carton containing 30 enteric coated tablets in blister pack.</p>', NULL);
INSERT INTO `product_translations` VALUES (12, 12, 'en', 'Limupres® 0.75 mg Tablets', '<div><strong>Composition</strong></div>\r\n<div>Each uncoated tablet contains:</div>\r\n<div>\r\n<p>Everolimus&hellip; 0.75 mg<br />Excipients&hellip; q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong><br />Kidney / Heart transplant<br />Liver transplant</p>\r\n<p><strong>DOSAGE</strong><br />Initial dose of 0.75 mg twice daily in concomitant administration with Cyclosporine for the general population of patients with kidney/heart transplant, administered as soon as possible after the transplant.<br />The dose of 1.0 mg twice daily in concomitant administration with Tacrolimus for the population of patients with liver transplant who receive the initial dose about 4 weeks after the transplant.</p>\r\n<p><strong>PRESENTATIONS</strong><br />Carton containing 30 tablets in blister pack plus leaflet.</p>\r\n</div>', NULL);
INSERT INTO `product_translations` VALUES (13, 13, 'en', 'Butive 5mg. Tablets USP', '<p><strong>Composition</strong><br />Each tablet contains:<br />Oxybutynin Hydrochloride USP&hellip;5 mg<br />Excipients&hellip;&hellip;&hellip;q.s.</p>\r\n<p><strong>THERAPEUTIC INDICATIONS</strong></p>\r\n<p>Butive&reg; (Oxybutynin) is indicated for the symptomatic treatment of urgent urinary incontinence and/or increased urinary frequency as may occur in patients with unstable bladder.</p>\r\n<p><strong>DOSAGE</strong></p>\r\n<p>Adults: 5 mg 3 times/daily. In the case of nighttime voiding disorder: 15 mg/daily in one single intake by the end of the day.</p>\r\n<p><strong>PRESENTATIONS</strong><br />Carton containing 30 tablets in blister pack plus leaflet.</p>', NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `tax_class_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(18, 4) UNSIGNED NOT NULL,
  `special_price` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `special_price_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `special_price_start` date NULL DEFAULT NULL,
  `special_price_end` date NULL DEFAULT NULL,
  `selling_price` decimal(18, 4) UNSIGNED NULL DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `manage_stock` tinyint(1) NOT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `viewed` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `new_from` datetime(0) NULL DEFAULT NULL,
  `new_to` datetime(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_slug_unique`(`slug`) USING BTREE,
  INDEX `products_brand_id_foreign`(`brand_id`) USING BTREE,
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, NULL, NULL, 'fefoz-injection-solution', 0.0000, NULL, 'fixed', NULL, NULL, 0.0000, '0', 1, 0, 0, 0, 1, NULL, NULL, NULL, '2020-07-21 21:06:43', '2020-07-21 17:59:15');
INSERT INTO `products` VALUES (2, NULL, NULL, 'bactelid-600-mg-film-coated-tablets', 9230.0000, NULL, 'fixed', NULL, NULL, 9230.0000, '10105012', 1, 4996, 1, 0, 1, NULL, NULL, NULL, '2020-07-21 21:08:01', '2020-07-21 17:55:11');
INSERT INTO `products` VALUES (3, NULL, NULL, 'ondemel-4-mgml-injection-solution', 707.6900, NULL, 'fixed', NULL, NULL, 707.6900, '10113011', 1, 4796, 1, 1, 1, NULL, NULL, NULL, '2020-07-21 21:09:03', '2020-07-21 17:55:34');
INSERT INTO `products` VALUES (4, NULL, NULL, 'vertinull-16-mg-film-coated-tablets-bp', 576.9200, NULL, 'fixed', NULL, NULL, 576.9200, '10113021', 1, 1881, 1, 0, 1, NULL, NULL, NULL, '2020-07-21 21:10:35', '2020-07-21 17:55:57');
INSERT INTO `products` VALUES (5, NULL, NULL, 'vertinull-24-mg-film-coated-tablets-bp', 576.9200, NULL, 'fixed', NULL, NULL, 576.9200, '10113021', 1, 1881, 1, 0, 1, NULL, NULL, NULL, '2020-07-21 21:11:31', '2020-07-21 17:56:38');
INSERT INTO `products` VALUES (6, NULL, NULL, 'olarten-20-mg-film-coated-tablets-usp', 692.3100, NULL, 'fixed', NULL, NULL, 692.3100, '10110011', 1, 5252, 1, 0, 1, NULL, NULL, NULL, '2020-07-21 21:12:34', '2020-07-21 17:54:21');
INSERT INTO `products` VALUES (7, NULL, NULL, 'olarten-40-mg-film-coated-tablets-usp', 807.6900, NULL, 'fixed', NULL, NULL, 807.6900, '10110021', 1, 1827, 1, 0, 1, NULL, NULL, NULL, '2020-07-21 21:13:14', '2020-07-21 17:57:06');
INSERT INTO `products` VALUES (8, NULL, NULL, 'pulmotan-125-mg-film-coated-tablets', 50000.0000, NULL, 'fixed', NULL, NULL, 50000.0000, '10103011', 1, 18, 1, 0, 1, NULL, NULL, NULL, '2020-07-21 21:15:51', '2020-07-21 17:53:36');
INSERT INTO `products` VALUES (9, NULL, NULL, 'gumazol-40-mg-dr-capsules-usp', 923.0800, NULL, 'fixed', NULL, NULL, 923.0800, '10113041', 1, 7903, 1, 0, 1, NULL, NULL, NULL, '2020-07-21 21:16:50', '2020-07-21 17:50:51');
INSERT INTO `products` VALUES (10, NULL, NULL, 'lepirel-25-mg-tablets', 473.0800, NULL, 'fixed', NULL, NULL, 473.0800, '10113031', 1, 2048, 1, 0, 1, NULL, NULL, NULL, '2020-07-21 21:18:26', '2020-07-21 17:50:31');
INSERT INTO `products` VALUES (11, NULL, NULL, 'panzide-40-mg-enteric-coated-tablets', 1038.4600, NULL, 'fixed', NULL, NULL, 1038.4600, '10113051', 1, 9208, 1, 1, 1, NULL, NULL, NULL, '2020-07-21 21:19:25', '2020-07-21 18:00:08');
INSERT INTO `products` VALUES (12, NULL, NULL, 'limupres-075-mg-tablets', 0.0000, NULL, 'fixed', NULL, NULL, 0.0000, '10130011', 1, 0, 0, 0, 1, NULL, NULL, NULL, '2020-07-21 21:20:26', '2020-07-21 17:48:30');
INSERT INTO `products` VALUES (13, NULL, NULL, 'butive-5mg-tablets-usp', 323.0800, NULL, 'fixed', NULL, NULL, 323.0800, '10122011', 1, 15868, 1, 1, 1, NULL, NULL, NULL, '2020-07-21 21:21:31', '2020-07-21 17:44:04');

-- ----------------------------
-- Table structure for related_products
-- ----------------------------
DROP TABLE IF EXISTS `related_products`;
CREATE TABLE `related_products`  (
  `product_id` int(10) UNSIGNED NOT NULL,
  `related_product_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `related_product_id`) USING BTREE,
  INDEX `related_products_related_product_id_foreign`(`related_product_id`) USING BTREE,
  CONSTRAINT `related_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `related_products_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reminders
-- ----------------------------
DROP TABLE IF EXISTS `reminders`;
CREATE TABLE `reminders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` datetime(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reminders_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `reviewer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reviews_reviewer_id_index`(`reviewer_id`) USING BTREE,
  INDEX `reviews_product_id_index`(`product_id`) USING BTREE,
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (1, 1, 3, 5, 'Me encanto el Producto', 'Me encanto', 1, '2020-07-21 16:36:38', '2020-07-21 16:36:38');

-- ----------------------------
-- Table structure for role_translations
-- ----------------------------
DROP TABLE IF EXISTS `role_translations`;
CREATE TABLE `role_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_translations_role_id_locale_unique`(`role_id`, `locale`) USING BTREE,
  CONSTRAINT `role_translations_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_translations
-- ----------------------------
INSERT INTO `role_translations` VALUES (1, 1, 'es', 'Admin');
INSERT INTO `role_translations` VALUES (2, 2, 'es', 'Customer');
INSERT INTO `role_translations` VALUES (3, 1, 'en', 'Admin');
INSERT INTO `role_translations` VALUES (4, 2, 'en', 'Customer');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '{\"admin.attributes.index\":true,\"admin.attributes.create\":true,\"admin.attributes.edit\":true,\"admin.attributes.destroy\":true,\"admin.attribute_sets.index\":true,\"admin.attribute_sets.create\":true,\"admin.attribute_sets.edit\":true,\"admin.attribute_sets.destroy\":true,\"admin.brands.index\":true,\"admin.brands.create\":true,\"admin.brands.edit\":true,\"admin.brands.destroy\":true,\"admin.categories.index\":true,\"admin.categories.create\":true,\"admin.categories.edit\":true,\"admin.categories.destroy\":true,\"admin.coupons.index\":true,\"admin.coupons.create\":true,\"admin.coupons.edit\":true,\"admin.coupons.destroy\":true,\"admin.currency_rates.index\":true,\"admin.currency_rates.edit\":true,\"admin.flash_sales.index\":true,\"admin.flash_sales.create\":true,\"admin.flash_sales.edit\":true,\"admin.flash_sales.destroy\":true,\"admin.importer.index\":true,\"admin.importer.create\":true,\"admin.media.index\":true,\"admin.media.create\":true,\"admin.media.destroy\":true,\"admin.menus.index\":true,\"admin.menus.create\":true,\"admin.menus.edit\":true,\"admin.menus.destroy\":true,\"admin.menu_items.index\":true,\"admin.menu_items.create\":true,\"admin.menu_items.edit\":true,\"admin.menu_items.destroy\":true,\"admin.options.index\":true,\"admin.options.create\":true,\"admin.options.edit\":true,\"admin.options.destroy\":true,\"admin.orders.index\":true,\"admin.orders.show\":true,\"admin.orders.edit\":true,\"admin.pages.index\":true,\"admin.pages.create\":true,\"admin.pages.edit\":true,\"admin.pages.destroy\":true,\"admin.products.index\":true,\"admin.products.create\":true,\"admin.products.edit\":true,\"admin.products.destroy\":true,\"admin.reports.index\":true,\"admin.reviews.index\":true,\"admin.reviews.edit\":true,\"admin.reviews.destroy\":true,\"admin.settings.edit\":true,\"admin.sliders.index\":true,\"admin.sliders.create\":true,\"admin.sliders.edit\":true,\"admin.sliders.destroy\":true,\"admin.tags.index\":true,\"admin.tags.create\":true,\"admin.tags.edit\":true,\"admin.tags.destroy\":true,\"admin.taxes.index\":true,\"admin.taxes.create\":true,\"admin.taxes.edit\":true,\"admin.taxes.destroy\":true,\"admin.transactions.index\":true,\"admin.translations.index\":true,\"admin.translations.edit\":true,\"admin.users.index\":true,\"admin.users.create\":true,\"admin.users.edit\":true,\"admin.users.destroy\":true,\"admin.roles.index\":true,\"admin.roles.create\":true,\"admin.roles.edit\":true,\"admin.roles.destroy\":true,\"admin.storefront.edit\":true}', '2020-07-21 14:44:50', '2020-07-21 17:32:52');
INSERT INTO `roles` VALUES (2, '[]', '2020-07-21 14:44:52', '2020-07-21 17:33:19');

-- ----------------------------
-- Table structure for search_terms
-- ----------------------------
DROP TABLE IF EXISTS `search_terms`;
CREATE TABLE `search_terms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int(10) UNSIGNED NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `search_terms_term_unique`(`term`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of search_terms
-- ----------------------------
INSERT INTO `search_terms` VALUES (1, 'A', 0, 1, '2020-07-21 17:49:24', '2020-07-21 17:49:24');

-- ----------------------------
-- Table structure for setting_translations
-- ----------------------------
DROP TABLE IF EXISTS `setting_translations`;
CREATE TABLE `setting_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `setting_translations_setting_id_locale_unique`(`setting_id`, `locale`) USING BTREE,
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting_translations
-- ----------------------------
INSERT INTO `setting_translations` VALUES (1, 1, 'es', 's:9:\"SGP ADMIN\";');
INSERT INTO `setting_translations` VALUES (2, 22, 'es', 's:13:\"Free Shipping\";');
INSERT INTO `setting_translations` VALUES (3, 23, 'es', 's:12:\"Local Pickup\";');
INSERT INTO `setting_translations` VALUES (4, 24, 'es', 's:9:\"Flat Rate\";');
INSERT INTO `setting_translations` VALUES (5, 25, 'es', 's:6:\"PayPal\";');
INSERT INTO `setting_translations` VALUES (6, 26, 'es', 's:28:\"Pay via your PayPal account.\";');
INSERT INTO `setting_translations` VALUES (7, 27, 'es', 's:6:\"Stripe\";');
INSERT INTO `setting_translations` VALUES (8, 28, 'es', 's:29:\"Pay via credit or debit card.\";');
INSERT INTO `setting_translations` VALUES (9, 29, 'es', 's:8:\"Razorpay\";');
INSERT INTO `setting_translations` VALUES (10, 30, 'es', 's:74:\"Pay securely by Credit or Debit card or Internet Banking through Razorpay.\";');
INSERT INTO `setting_translations` VALUES (11, 31, 'es', 's:9:\"Instamojo\";');
INSERT INTO `setting_translations` VALUES (12, 32, 'es', 's:16:\"CC/DB/NB/Wallets\";');
INSERT INTO `setting_translations` VALUES (13, 33, 'es', 's:16:\"Cash On Delivery\";');
INSERT INTO `setting_translations` VALUES (14, 34, 'es', 's:28:\"Pay with cash upon delivery.\";');
INSERT INTO `setting_translations` VALUES (15, 35, 'es', 's:13:\"Bank Transfer\";');
INSERT INTO `setting_translations` VALUES (16, 36, 'es', 's:100:\"Make your payment directly into our bank account. Please use your Order ID as the payment reference.\";');
INSERT INTO `setting_translations` VALUES (17, 37, 'es', 's:19:\"Check / Money Order\";');
INSERT INTO `setting_translations` VALUES (18, 38, 'es', 's:33:\"Please send a check to our store.\";');
INSERT INTO `setting_translations` VALUES (19, 40, 'en', 's:27:\"Welcome to GumaPharma store\";');
INSERT INTO `setting_translations` VALUES (20, 41, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (21, 42, 'en', 's:2:\"54\";');
INSERT INTO `setting_translations` VALUES (22, 43, 'en', 's:24:\"Free shipping over $100+\";');
INSERT INTO `setting_translations` VALUES (23, 44, 'en', 's:12:\"Our Services\";');
INSERT INTO `setting_translations` VALUES (24, 45, 'en', 's:11:\"Information\";');
INSERT INTO `setting_translations` VALUES (25, 39, 'en', 's:92:\"Copyright © <a href=\"{{ store_url }}\">{{ store_name }}</a> {{ year }}. All rights reserved.\";');
INSERT INTO `setting_translations` VALUES (26, 46, 'en', 's:12:\"24/7 SUPPORT\";');
INSERT INTO `setting_translations` VALUES (27, 47, 'en', 's:18:\"Support every time\";');
INSERT INTO `setting_translations` VALUES (28, 48, 'en', 's:14:\"ACCEPT PAYMENT\";');
INSERT INTO `setting_translations` VALUES (29, 49, 'en', 's:20:\"Visa, Paypal, Master\";');
INSERT INTO `setting_translations` VALUES (30, 50, 'en', 's:15:\"SECURED PAYMENT\";');
INSERT INTO `setting_translations` VALUES (31, 51, 'en', 's:12:\"100% secured\";');
INSERT INTO `setting_translations` VALUES (32, 52, 'en', 's:13:\"FREE SHIPPING\";');
INSERT INTO `setting_translations` VALUES (33, 53, 'en', 's:15:\"Order over $100\";');
INSERT INTO `setting_translations` VALUES (34, 54, 'en', 's:14:\"30 DAYS RETURN\";');
INSERT INTO `setting_translations` VALUES (35, 55, 'en', 's:17:\"30 days guarantee\";');
INSERT INTO `setting_translations` VALUES (36, 56, 'en', 's:2:\"19\";');
INSERT INTO `setting_translations` VALUES (37, 57, 'en', 's:2:\"20\";');
INSERT INTO `setting_translations` VALUES (38, 58, 'en', 's:2:\"21\";');
INSERT INTO `setting_translations` VALUES (39, 59, 'en', 's:2:\"23\";');
INSERT INTO `setting_translations` VALUES (40, 60, 'en', 's:2:\"24\";');
INSERT INTO `setting_translations` VALUES (41, 61, 'en', 's:2:\"25\";');
INSERT INTO `setting_translations` VALUES (42, 62, 'en', 's:36:\"Top Categories in Sales and Trending\";');
INSERT INTO `setting_translations` VALUES (43, 63, 'en', 's:107:\"Last Month upto 1500+ Products Sales From this catagory. You can choose a product from here and save money.\";');
INSERT INTO `setting_translations` VALUES (44, 64, 'en', 's:8:\"Featured\";');
INSERT INTO `setting_translations` VALUES (45, 65, 'en', 's:7:\"Special\";');
INSERT INTO `setting_translations` VALUES (46, 66, 'en', 's:11:\"New Arrival\";');
INSERT INTO `setting_translations` VALUES (47, 67, 'en', 's:6:\"Latest\";');
INSERT INTO `setting_translations` VALUES (48, 68, 'en', 's:2:\"26\";');
INSERT INTO `setting_translations` VALUES (49, 69, 'en', 's:2:\"27\";');
INSERT INTO `setting_translations` VALUES (50, 70, 'en', 's:10:\"ANTIANEMIC\";');
INSERT INTO `setting_translations` VALUES (51, 71, 'en', 's:10:\"ANTIBIOTIC\";');
INSERT INTO `setting_translations` VALUES (52, 72, 'en', 's:15:\"ANTIVERTIGINOUS\";');
INSERT INTO `setting_translations` VALUES (53, 73, 'en', 's:14:\"CARDIOVASCULAR\";');
INSERT INTO `setting_translations` VALUES (54, 74, 'en', 's:2:\"28\";');
INSERT INTO `setting_translations` VALUES (55, 75, 'en', 's:2:\"29\";');
INSERT INTO `setting_translations` VALUES (56, 76, 'en', 's:2:\"30\";');
INSERT INTO `setting_translations` VALUES (57, 77, 'en', 's:16:\"Hot Best Sellers\";');
INSERT INTO `setting_translations` VALUES (58, 78, 'en', 's:15:\"Latest Products\";');
INSERT INTO `setting_translations` VALUES (59, 79, 'en', 's:15:\"Recently Viewed\";');
INSERT INTO `setting_translations` VALUES (60, 80, 'en', 's:7:\"On Sale\";');
INSERT INTO `setting_translations` VALUES (61, 81, 'en', 's:11:\"Top Selling\";');
INSERT INTO `setting_translations` VALUES (62, 82, 'en', 's:2:\"31\";');
INSERT INTO `setting_translations` VALUES (63, 1, 'en', 's:16:\"SHOP GUMA PHARMA\";');
INSERT INTO `setting_translations` VALUES (64, 237, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (65, 22, 'en', 's:13:\"Free Shipping\";');
INSERT INTO `setting_translations` VALUES (66, 23, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (67, 24, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (68, 25, 'en', 's:6:\"PayPal\";');
INSERT INTO `setting_translations` VALUES (69, 26, 'en', 's:28:\"Pay via your PayPal account.\";');
INSERT INTO `setting_translations` VALUES (70, 27, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (71, 28, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (72, 29, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (73, 30, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (74, 31, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (75, 32, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (76, 33, 'en', 's:16:\"Cash On Delivery\";');
INSERT INTO `setting_translations` VALUES (77, 34, 'en', 's:28:\"Pay with cash upon delivery.\";');
INSERT INTO `setting_translations` VALUES (78, 35, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (79, 36, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (80, 238, 'en', 'N;');
INSERT INTO `setting_translations` VALUES (81, 37, 'en', 's:19:\"Check / Money Order\";');
INSERT INTO `setting_translations` VALUES (82, 38, 'en', 's:33:\"Please send a check to our store.\";');
INSERT INTO `setting_translations` VALUES (83, 239, 'en', 's:154:\"Please send your payment to the following account.\r\n<br>\r\nBank Name: Lorem Ipsum.\r\n<br>\r\nBeneficiary Name: John Doe.\r\n<br>\r\nAccount Number/IBAN: 123456789\";');
INSERT INTO `setting_translations` VALUES (84, 291, 'en', 'N;');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_translatable` tinyint(1) NOT NULL DEFAULT 0,
  `plain_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_key_unique`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 293 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'store_name', 1, NULL, '2020-07-21 14:44:51', '2020-07-21 14:44:51');
INSERT INTO `settings` VALUES (2, 'store_email', 0, 's:17:\"info@gumacorp.com\";', '2020-07-21 14:44:51', '2020-07-21 16:19:50');
INSERT INTO `settings` VALUES (3, 'search_engine', 0, 's:5:\"mysql\";', '2020-07-21 14:44:51', '2020-07-21 14:44:51');
INSERT INTO `settings` VALUES (4, 'algolia_app_id', 0, 'N;', '2020-07-21 14:44:51', '2020-07-21 14:44:51');
INSERT INTO `settings` VALUES (5, 'algolia_secret', 0, 'N;', '2020-07-21 14:44:52', '2020-07-21 14:44:52');
INSERT INTO `settings` VALUES (6, 'active_theme', 0, 's:10:\"Storefront\";', '2020-07-21 14:44:52', '2020-07-21 14:44:52');
INSERT INTO `settings` VALUES (7, 'supported_countries', 0, 'a:3:{i:0;s:2:\"BD\";i:1;s:2:\"NI\";i:2;s:2:\"US\";}', '2020-07-21 14:44:52', '2020-07-21 16:28:49');
INSERT INTO `settings` VALUES (8, 'default_country', 0, 's:2:\"US\";', '2020-07-21 14:44:52', '2020-07-21 22:16:16');
INSERT INTO `settings` VALUES (9, 'supported_locales', 0, 'a:1:{i:0;s:2:\"en\";}', '2020-07-21 14:44:52', '2020-07-21 16:49:45');
INSERT INTO `settings` VALUES (10, 'default_locale', 0, 's:2:\"en\";', '2020-07-21 14:44:52', '2020-07-21 14:44:52');
INSERT INTO `settings` VALUES (11, 'default_timezone', 0, 's:3:\"UTC\";', '2020-07-21 14:44:52', '2020-07-21 22:16:17');
INSERT INTO `settings` VALUES (12, 'customer_role', 0, 's:1:\"2\";', '2020-07-21 14:44:53', '2020-07-21 22:15:36');
INSERT INTO `settings` VALUES (13, 'reviews_enabled', 0, 's:1:\"1\";', '2020-07-21 14:44:53', '2020-07-21 22:15:37');
INSERT INTO `settings` VALUES (14, 'auto_approve_reviews', 0, 's:1:\"0\";', '2020-07-21 14:44:53', '2020-07-21 17:32:08');
INSERT INTO `settings` VALUES (15, 'cookie_bar_enabled', 0, 's:1:\"1\";', '2020-07-21 14:44:53', '2020-07-21 22:15:37');
INSERT INTO `settings` VALUES (16, 'supported_currencies', 0, 'a:1:{i:0;s:3:\"NIO\";}', '2020-07-21 14:44:53', '2020-07-21 17:59:43');
INSERT INTO `settings` VALUES (17, 'default_currency', 0, 's:3:\"NIO\";', '2020-07-21 14:44:53', '2020-07-21 17:59:43');
INSERT INTO `settings` VALUES (18, 'send_order_invoice_email', 0, 'b:0;', '2020-07-21 14:44:53', '2020-07-21 14:44:53');
INSERT INTO `settings` VALUES (19, 'newsletter_enabled', 0, 's:1:\"0\";', '2020-07-21 14:44:53', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (20, 'local_pickup_cost', 0, 's:1:\"0\";', '2020-07-21 14:44:53', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (21, 'flat_rate_cost', 0, 's:1:\"0\";', '2020-07-21 14:44:53', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (22, 'free_shipping_label', 1, NULL, '2020-07-21 14:44:53', '2020-07-21 14:44:53');
INSERT INTO `settings` VALUES (23, 'local_pickup_label', 1, NULL, '2020-07-21 14:44:53', '2020-07-21 14:44:53');
INSERT INTO `settings` VALUES (24, 'flat_rate_label', 1, NULL, '2020-07-21 14:44:54', '2020-07-21 14:44:54');
INSERT INTO `settings` VALUES (25, 'paypal_label', 1, NULL, '2020-07-21 14:44:54', '2020-07-21 14:44:54');
INSERT INTO `settings` VALUES (26, 'paypal_description', 1, NULL, '2020-07-21 14:44:54', '2020-07-21 14:44:54');
INSERT INTO `settings` VALUES (27, 'stripe_label', 1, NULL, '2020-07-21 14:44:54', '2020-07-21 14:44:54');
INSERT INTO `settings` VALUES (28, 'stripe_description', 1, NULL, '2020-07-21 14:44:54', '2020-07-21 14:44:54');
INSERT INTO `settings` VALUES (29, 'razorpay_label', 1, NULL, '2020-07-21 14:44:54', '2020-07-21 14:44:54');
INSERT INTO `settings` VALUES (30, 'razorpay_description', 1, NULL, '2020-07-21 14:44:54', '2020-07-21 14:44:54');
INSERT INTO `settings` VALUES (31, 'instamojo_label', 1, NULL, '2020-07-21 14:44:54', '2020-07-21 14:44:54');
INSERT INTO `settings` VALUES (32, 'instamojo_description', 1, NULL, '2020-07-21 14:44:54', '2020-07-21 14:44:54');
INSERT INTO `settings` VALUES (33, 'cod_label', 1, NULL, '2020-07-21 14:44:55', '2020-07-21 14:44:55');
INSERT INTO `settings` VALUES (34, 'cod_description', 1, NULL, '2020-07-21 14:44:55', '2020-07-21 14:44:55');
INSERT INTO `settings` VALUES (35, 'bank_transfer_label', 1, NULL, '2020-07-21 14:44:55', '2020-07-21 14:44:55');
INSERT INTO `settings` VALUES (36, 'bank_transfer_description', 1, NULL, '2020-07-21 14:44:55', '2020-07-21 14:44:55');
INSERT INTO `settings` VALUES (37, 'check_payment_label', 1, NULL, '2020-07-21 14:44:55', '2020-07-21 14:44:55');
INSERT INTO `settings` VALUES (38, 'check_payment_description', 1, NULL, '2020-07-21 14:44:55', '2020-07-21 14:44:55');
INSERT INTO `settings` VALUES (39, 'storefront_copyright_text', 1, 's:92:\"Copyright © <a href=\"{{ store_url }}\">{{ store_name }}</a> {{ year }}. All rights reserved.\";', '2020-07-21 14:44:55', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (40, 'storefront_welcome_text', 1, NULL, '2020-07-21 21:42:53', '2020-07-21 21:42:53');
INSERT INTO `settings` VALUES (41, 'storefront_address', 1, NULL, '2020-07-21 21:42:54', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (42, 'storefront_header_logo', 1, NULL, '2020-07-21 21:42:54', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (43, 'storefront_navbar_text', 1, NULL, '2020-07-21 21:42:54', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (44, 'storefront_footer_menu_one_title', 1, NULL, '2020-07-21 21:42:54', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (45, 'storefront_footer_menu_two_title', 1, NULL, '2020-07-21 21:42:54', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (46, 'storefront_feature_1_title', 1, NULL, '2020-07-21 21:42:54', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (47, 'storefront_feature_1_subtitle', 1, NULL, '2020-07-21 21:42:54', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (48, 'storefront_feature_2_title', 1, NULL, '2020-07-21 21:42:54', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (49, 'storefront_feature_2_subtitle', 1, NULL, '2020-07-21 21:42:54', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (50, 'storefront_feature_3_title', 1, NULL, '2020-07-21 21:42:54', '2020-07-21 21:42:54');
INSERT INTO `settings` VALUES (51, 'storefront_feature_3_subtitle', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (52, 'storefront_feature_4_title', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (53, 'storefront_feature_4_subtitle', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (54, 'storefront_feature_5_title', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (55, 'storefront_feature_5_subtitle', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (56, 'storefront_product_page_banner_file_id', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (57, 'storefront_slider_banner_1_file_id', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (58, 'storefront_slider_banner_2_file_id', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (59, 'storefront_three_column_full_width_banners_1_file_id', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (60, 'storefront_three_column_full_width_banners_2_file_id', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (61, 'storefront_three_column_full_width_banners_3_file_id', 1, NULL, '2020-07-21 21:42:55', '2020-07-21 21:42:55');
INSERT INTO `settings` VALUES (62, 'storefront_featured_categories_section_title', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (63, 'storefront_featured_categories_section_subtitle', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (64, 'storefront_product_tabs_1_section_tab_1_title', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (65, 'storefront_product_tabs_1_section_tab_2_title', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (66, 'storefront_product_tabs_1_section_tab_3_title', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (67, 'storefront_product_tabs_1_section_tab_4_title', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (68, 'storefront_two_column_banners_1_file_id', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (69, 'storefront_two_column_banners_2_file_id', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (70, 'storefront_product_grid_section_tab_1_title', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (71, 'storefront_product_grid_section_tab_2_title', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (72, 'storefront_product_grid_section_tab_3_title', 1, NULL, '2020-07-21 21:42:56', '2020-07-21 21:42:56');
INSERT INTO `settings` VALUES (73, 'storefront_product_grid_section_tab_4_title', 1, NULL, '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (74, 'storefront_three_column_banners_1_file_id', 1, NULL, '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (75, 'storefront_three_column_banners_2_file_id', 1, NULL, '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (76, 'storefront_three_column_banners_3_file_id', 1, NULL, '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (77, 'storefront_product_tabs_2_section_title', 1, NULL, '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (78, 'storefront_product_tabs_2_section_tab_1_title', 1, NULL, '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (79, 'storefront_product_tabs_2_section_tab_2_title', 1, NULL, '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (80, 'storefront_product_tabs_2_section_tab_3_title', 1, NULL, '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (81, 'storefront_product_tabs_2_section_tab_4_title', 1, NULL, '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (82, 'storefront_one_column_banner_file_id', 1, NULL, '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (83, 'storefront_theme_color', 0, 's:4:\"blue\";', '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (84, 'storefront_custom_theme_color', 0, 's:7:\"#000000\";', '2020-07-21 21:42:57', '2020-07-21 21:42:57');
INSERT INTO `settings` VALUES (85, 'storefront_mail_theme_color', 0, 's:4:\"blue\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (86, 'storefront_custom_mail_theme_color', 0, 's:7:\"#000000\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (87, 'storefront_slider', 0, 's:1:\"1\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (88, 'storefront_terms_page', 0, 's:1:\"4\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (89, 'storefront_privacy_page', 0, 's:1:\"5\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (90, 'storefront_primary_menu', 0, 's:1:\"1\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (91, 'storefront_category_menu', 0, 's:1:\"2\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (92, 'storefront_footer_menu_one', 0, 's:1:\"3\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (93, 'storefront_footer_menu_two', 0, 's:1:\"4\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (94, 'storefront_newsletter_bg_image', 0, 's:2:\"18\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (95, 'storefront_features_section_enabled', 0, 's:1:\"1\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (96, 'storefront_feature_1_icon', 0, 's:17:\"las la-headphones\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (97, 'storefront_feature_2_icon', 0, 's:18:\"las la-credit-card\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (98, 'storefront_feature_3_icon', 0, 's:17:\"las la-shield-alt\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (99, 'storefront_feature_4_icon', 0, 's:12:\"las la-truck\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (100, 'storefront_feature_5_icon', 0, 's:21:\"las la-calendar-minus\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (101, 'storefront_product_page_banner_call_to_action_url', 0, 's:1:\"#\";', '2020-07-21 21:42:58', '2020-07-21 21:45:46');
INSERT INTO `settings` VALUES (102, 'storefront_product_page_banner_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:42:58', '2020-07-21 21:42:58');
INSERT INTO `settings` VALUES (103, 'storefront_facebook_link', 0, 's:1:\"#\";', '2020-07-21 21:42:58', '2020-07-21 16:20:31');
INSERT INTO `settings` VALUES (104, 'storefront_twitter_link', 0, 's:1:\"#\";', '2020-07-21 21:42:58', '2020-07-21 16:20:31');
INSERT INTO `settings` VALUES (105, 'storefront_instagram_link', 0, 's:1:\"#\";', '2020-07-21 21:42:59', '2020-07-21 16:20:31');
INSERT INTO `settings` VALUES (106, 'storefront_youtube_link', 0, 's:1:\"#\";', '2020-07-21 21:42:59', '2020-07-21 16:20:31');
INSERT INTO `settings` VALUES (107, 'storefront_slider_banner_1_call_to_action_url', 0, 's:1:\"3\";', '2020-07-21 21:42:59', '2020-07-21 21:45:46');
INSERT INTO `settings` VALUES (108, 'storefront_slider_banner_1_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:42:59', '2020-07-21 21:42:59');
INSERT INTO `settings` VALUES (109, 'storefront_slider_banner_2_call_to_action_url', 0, 's:1:\"#\";', '2020-07-21 21:42:59', '2020-07-21 21:45:46');
INSERT INTO `settings` VALUES (110, 'storefront_slider_banner_2_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:42:59', '2020-07-21 21:42:59');
INSERT INTO `settings` VALUES (111, 'storefront_three_column_full_width_banners_enabled', 0, 's:1:\"1\";', '2020-07-21 21:42:59', '2020-07-21 21:45:46');
INSERT INTO `settings` VALUES (112, 'storefront_three_column_full_width_banners_1_call_to_action_url', 0, 's:1:\"#\";', '2020-07-21 21:42:59', '2020-07-21 21:45:46');
INSERT INTO `settings` VALUES (113, 'storefront_three_column_full_width_banners_1_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:42:59', '2020-07-21 21:42:59');
INSERT INTO `settings` VALUES (114, 'storefront_three_column_full_width_banners_2_call_to_action_url', 0, 's:1:\"#\";', '2020-07-21 21:42:59', '2020-07-21 21:45:46');
INSERT INTO `settings` VALUES (115, 'storefront_three_column_full_width_banners_2_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:42:59', '2020-07-21 21:42:59');
INSERT INTO `settings` VALUES (116, 'storefront_three_column_full_width_banners_3_call_to_action_url', 0, 's:1:\"#\";', '2020-07-21 21:42:59', '2020-07-21 21:45:46');
INSERT INTO `settings` VALUES (117, 'storefront_three_column_full_width_banners_3_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:42:59', '2020-07-21 21:42:59');
INSERT INTO `settings` VALUES (118, 'storefront_featured_categories_section_enabled', 0, 's:1:\"1\";', '2020-07-21 21:42:59', '2020-07-21 21:46:43');
INSERT INTO `settings` VALUES (119, 'storefront_featured_categories_section_category_1_category_id', 0, 's:1:\"1\";', '2020-07-21 21:42:59', '2020-07-21 21:46:43');
INSERT INTO `settings` VALUES (120, 'storefront_featured_categories_section_category_1_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:42:59', '2020-07-21 21:46:43');
INSERT INTO `settings` VALUES (121, 'storefront_featured_categories_section_category_1_products_limit', 0, 'N;', '2020-07-21 21:42:59', '2020-07-21 21:42:59');
INSERT INTO `settings` VALUES (122, 'storefront_featured_categories_section_category_2_category_id', 0, 's:1:\"2\";', '2020-07-21 21:42:59', '2020-07-21 21:46:43');
INSERT INTO `settings` VALUES (123, 'storefront_featured_categories_section_category_2_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:42:59', '2020-07-21 21:46:43');
INSERT INTO `settings` VALUES (124, 'storefront_featured_categories_section_category_2_products_limit', 0, 'N;', '2020-07-21 21:42:59', '2020-07-21 21:42:59');
INSERT INTO `settings` VALUES (125, 'storefront_featured_categories_section_category_3_category_id', 0, 's:1:\"3\";', '2020-07-21 21:43:00', '2020-07-21 21:46:43');
INSERT INTO `settings` VALUES (126, 'storefront_featured_categories_section_category_3_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:00', '2020-07-21 21:46:43');
INSERT INTO `settings` VALUES (127, 'storefront_featured_categories_section_category_3_products_limit', 0, 'N;', '2020-07-21 21:43:00', '2020-07-21 21:43:00');
INSERT INTO `settings` VALUES (128, 'storefront_featured_categories_section_category_4_category_id', 0, 's:1:\"4\";', '2020-07-21 21:43:00', '2020-07-21 21:46:43');
INSERT INTO `settings` VALUES (129, 'storefront_featured_categories_section_category_4_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:00', '2020-07-21 21:46:43');
INSERT INTO `settings` VALUES (130, 'storefront_featured_categories_section_category_4_products_limit', 0, 'N;', '2020-07-21 21:43:00', '2020-07-21 21:43:00');
INSERT INTO `settings` VALUES (131, 'storefront_featured_categories_section_category_5_category_id', 0, 's:1:\"5\";', '2020-07-21 21:43:00', '2020-07-21 21:46:44');
INSERT INTO `settings` VALUES (132, 'storefront_featured_categories_section_category_5_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:00', '2020-07-21 21:46:44');
INSERT INTO `settings` VALUES (133, 'storefront_featured_categories_section_category_5_products_limit', 0, 'N;', '2020-07-21 21:43:00', '2020-07-21 21:43:00');
INSERT INTO `settings` VALUES (134, 'storefront_featured_categories_section_category_6_category_id', 0, 's:1:\"6\";', '2020-07-21 21:43:00', '2020-07-21 21:46:44');
INSERT INTO `settings` VALUES (135, 'storefront_featured_categories_section_category_6_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:00', '2020-07-21 21:46:44');
INSERT INTO `settings` VALUES (136, 'storefront_featured_categories_section_category_6_products_limit', 0, 'N;', '2020-07-21 21:43:00', '2020-07-21 21:43:00');
INSERT INTO `settings` VALUES (137, 'storefront_product_tabs_1_section_enabled', 0, 's:1:\"1\";', '2020-07-21 21:43:00', '2020-07-21 21:47:26');
INSERT INTO `settings` VALUES (138, 'storefront_product_tabs_1_section_tab_1_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:00', '2020-07-21 21:47:26');
INSERT INTO `settings` VALUES (139, 'storefront_product_tabs_1_section_tab_1_category_id', 0, 's:1:\"1\";', '2020-07-21 21:43:00', '2020-07-21 21:47:26');
INSERT INTO `settings` VALUES (140, 'storefront_product_tabs_1_section_tab_1_products_limit', 0, 'N;', '2020-07-21 21:43:00', '2020-07-21 21:43:00');
INSERT INTO `settings` VALUES (141, 'storefront_product_tabs_1_section_tab_2_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:00', '2020-07-21 21:47:26');
INSERT INTO `settings` VALUES (142, 'storefront_product_tabs_1_section_tab_2_category_id', 0, 's:1:\"2\";', '2020-07-21 21:43:00', '2020-07-21 21:47:26');
INSERT INTO `settings` VALUES (143, 'storefront_product_tabs_1_section_tab_2_products_limit', 0, 'N;', '2020-07-21 21:43:00', '2020-07-21 21:43:00');
INSERT INTO `settings` VALUES (144, 'storefront_product_tabs_1_section_tab_3_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:01', '2020-07-21 21:47:26');
INSERT INTO `settings` VALUES (145, 'storefront_product_tabs_1_section_tab_3_category_id', 0, 's:1:\"3\";', '2020-07-21 21:43:01', '2020-07-21 21:47:26');
INSERT INTO `settings` VALUES (146, 'storefront_product_tabs_1_section_tab_3_products_limit', 0, 'N;', '2020-07-21 21:43:01', '2020-07-21 21:43:01');
INSERT INTO `settings` VALUES (147, 'storefront_product_tabs_1_section_tab_4_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:01', '2020-07-21 21:47:26');
INSERT INTO `settings` VALUES (148, 'storefront_product_tabs_1_section_tab_4_category_id', 0, 's:1:\"3\";', '2020-07-21 21:43:01', '2020-07-21 21:47:26');
INSERT INTO `settings` VALUES (149, 'storefront_product_tabs_1_section_tab_4_products_limit', 0, 'N;', '2020-07-21 21:43:01', '2020-07-21 21:43:01');
INSERT INTO `settings` VALUES (150, 'storefront_top_brands_section_enabled', 0, 's:1:\"1\";', '2020-07-21 21:43:01', '2020-07-21 21:47:36');
INSERT INTO `settings` VALUES (151, 'storefront_flash_sale_and_vertical_products_section_enabled', 0, 's:1:\"1\";', '2020-07-21 21:43:01', '2020-07-21 21:48:53');
INSERT INTO `settings` VALUES (152, 'storefront_flash_sale_title', 0, 's:17:\"Best <b>Deals</b>\";', '2020-07-21 21:43:01', '2020-07-21 21:48:54');
INSERT INTO `settings` VALUES (153, 'storefront_active_flash_sale_campaign', 0, 's:1:\"1\";', '2020-07-21 21:43:01', '2020-07-21 21:57:34');
INSERT INTO `settings` VALUES (154, 'storefront_vertical_products_1_title', 0, 's:10:\"ANTIANEMIC\";', '2020-07-21 21:43:01', '2020-07-21 21:48:54');
INSERT INTO `settings` VALUES (155, 'storefront_vertical_products_1_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:01', '2020-07-21 21:48:54');
INSERT INTO `settings` VALUES (156, 'storefront_vertical_products_1_category_id', 0, 's:1:\"1\";', '2020-07-21 21:43:01', '2020-07-21 21:48:54');
INSERT INTO `settings` VALUES (157, 'storefront_vertical_products_1_products_limit', 0, 'N;', '2020-07-21 21:43:01', '2020-07-21 21:43:01');
INSERT INTO `settings` VALUES (158, 'storefront_vertical_products_2_title', 0, 's:10:\"ANTIBIOTIC\";', '2020-07-21 21:43:01', '2020-07-21 21:48:54');
INSERT INTO `settings` VALUES (159, 'storefront_vertical_products_2_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:01', '2020-07-21 21:48:54');
INSERT INTO `settings` VALUES (160, 'storefront_vertical_products_2_category_id', 0, 's:1:\"2\";', '2020-07-21 21:43:01', '2020-07-21 21:48:54');
INSERT INTO `settings` VALUES (161, 'storefront_vertical_products_2_products_limit', 0, 'N;', '2020-07-21 21:43:01', '2020-07-21 21:43:01');
INSERT INTO `settings` VALUES (162, 'storefront_vertical_products_3_title', 0, 's:15:\"ANTIVERTIGINOUS\";', '2020-07-21 21:43:01', '2020-07-21 21:48:54');
INSERT INTO `settings` VALUES (163, 'storefront_vertical_products_3_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:02', '2020-07-21 21:48:54');
INSERT INTO `settings` VALUES (164, 'storefront_vertical_products_3_category_id', 0, 's:1:\"3\";', '2020-07-21 21:43:02', '2020-07-21 21:48:54');
INSERT INTO `settings` VALUES (165, 'storefront_vertical_products_3_products_limit', 0, 'N;', '2020-07-21 21:43:02', '2020-07-21 21:43:02');
INSERT INTO `settings` VALUES (166, 'storefront_two_column_banners_enabled', 0, 's:1:\"1\";', '2020-07-21 21:43:02', '2020-07-21 21:52:23');
INSERT INTO `settings` VALUES (167, 'storefront_two_column_banners_1_call_to_action_url', 0, 's:1:\"#\";', '2020-07-21 21:43:02', '2020-07-21 21:52:23');
INSERT INTO `settings` VALUES (168, 'storefront_two_column_banners_1_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:43:02', '2020-07-21 21:43:02');
INSERT INTO `settings` VALUES (169, 'storefront_two_column_banners_2_call_to_action_url', 0, 's:1:\"#\";', '2020-07-21 21:43:02', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (170, 'storefront_two_column_banners_2_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:43:02', '2020-07-21 21:43:02');
INSERT INTO `settings` VALUES (171, 'storefront_product_grid_section_enabled', 0, 's:1:\"1\";', '2020-07-21 21:43:02', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (172, 'storefront_product_grid_section_tab_1_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:02', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (173, 'storefront_product_grid_section_tab_1_category_id', 0, 's:1:\"1\";', '2020-07-21 21:43:02', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (174, 'storefront_product_grid_section_tab_1_products_limit', 0, 'N;', '2020-07-21 21:43:02', '2020-07-21 21:43:02');
INSERT INTO `settings` VALUES (175, 'storefront_product_grid_section_tab_2_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:02', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (176, 'storefront_product_grid_section_tab_2_category_id', 0, 's:1:\"2\";', '2020-07-21 21:43:02', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (177, 'storefront_product_grid_section_tab_2_products_limit', 0, 'N;', '2020-07-21 21:43:02', '2020-07-21 21:43:02');
INSERT INTO `settings` VALUES (178, 'storefront_product_grid_section_tab_3_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:02', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (179, 'storefront_product_grid_section_tab_3_category_id', 0, 's:1:\"3\";', '2020-07-21 21:43:02', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (180, 'storefront_product_grid_section_tab_3_products_limit', 0, 'N;', '2020-07-21 21:43:02', '2020-07-21 21:43:02');
INSERT INTO `settings` VALUES (181, 'storefront_product_grid_section_tab_4_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (182, 'storefront_product_grid_section_tab_4_category_id', 0, 's:1:\"4\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (183, 'storefront_product_grid_section_tab_4_products_limit', 0, 'N;', '2020-07-21 21:43:03', '2020-07-21 21:43:03');
INSERT INTO `settings` VALUES (184, 'storefront_three_column_banners_enabled', 0, 's:1:\"1\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (185, 'storefront_three_column_banners_1_call_to_action_url', 0, 's:1:\"#\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (186, 'storefront_three_column_banners_1_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:43:03', '2020-07-21 21:43:03');
INSERT INTO `settings` VALUES (187, 'storefront_three_column_banners_2_call_to_action_url', 0, 's:1:\"#\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (188, 'storefront_three_column_banners_2_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:43:03', '2020-07-21 21:43:03');
INSERT INTO `settings` VALUES (189, 'storefront_three_column_banners_3_call_to_action_url', 0, 's:1:\"#\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (190, 'storefront_three_column_banners_3_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:43:03', '2020-07-21 21:43:03');
INSERT INTO `settings` VALUES (191, 'storefront_product_tabs_2_section_enabled', 0, 's:1:\"1\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (192, 'storefront_product_tabs_2_section_tab_1_product_type', 0, 's:15:\"latest_products\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (193, 'storefront_product_tabs_2_section_tab_1_category_id', 0, 'N;', '2020-07-21 21:43:03', '2020-07-21 21:43:03');
INSERT INTO `settings` VALUES (194, 'storefront_product_tabs_2_section_tab_1_products_limit', 0, 's:2:\"10\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (195, 'storefront_product_tabs_2_section_tab_2_product_type', 0, 's:24:\"recently_viewed_products\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (196, 'storefront_product_tabs_2_section_tab_2_category_id', 0, 'N;', '2020-07-21 21:43:03', '2020-07-21 21:43:03');
INSERT INTO `settings` VALUES (197, 'storefront_product_tabs_2_section_tab_2_products_limit', 0, 's:2:\"10\";', '2020-07-21 21:43:03', '2020-07-21 21:52:24');
INSERT INTO `settings` VALUES (198, 'storefront_product_tabs_2_section_tab_3_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:03', '2020-07-21 21:52:25');
INSERT INTO `settings` VALUES (199, 'storefront_product_tabs_2_section_tab_3_category_id', 0, 's:1:\"1\";', '2020-07-21 21:43:04', '2020-07-21 21:52:25');
INSERT INTO `settings` VALUES (200, 'storefront_product_tabs_2_section_tab_3_products_limit', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (201, 'storefront_product_tabs_2_section_tab_4_product_type', 0, 's:17:\"category_products\";', '2020-07-21 21:43:04', '2020-07-21 21:52:25');
INSERT INTO `settings` VALUES (202, 'storefront_product_tabs_2_section_tab_4_category_id', 0, 's:1:\"4\";', '2020-07-21 21:43:04', '2020-07-21 21:52:25');
INSERT INTO `settings` VALUES (203, 'storefront_product_tabs_2_section_tab_4_products_limit', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (204, 'storefront_one_column_banner_enabled', 0, 's:1:\"1\";', '2020-07-21 21:43:04', '2020-07-21 21:52:25');
INSERT INTO `settings` VALUES (205, 'storefront_one_column_banner_call_to_action_url', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (206, 'storefront_one_column_banner_open_in_new_window', 0, 's:1:\"0\";', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (207, 'storefront_footer_tags', 0, 'a:8:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";}', '2020-07-21 21:43:04', '2020-07-21 18:14:06');
INSERT INTO `settings` VALUES (208, 'storefront_featured_categories_section_category_1_products', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (209, 'storefront_featured_categories_section_category_2_products', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (210, 'storefront_featured_categories_section_category_3_products', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (211, 'storefront_featured_categories_section_category_4_products', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (212, 'storefront_featured_categories_section_category_5_products', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (213, 'storefront_featured_categories_section_category_6_products', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (214, 'storefront_product_tabs_1_section_tab_1_products', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (215, 'storefront_product_tabs_1_section_tab_2_products', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (216, 'storefront_product_tabs_1_section_tab_3_products', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (217, 'storefront_product_tabs_1_section_tab_4_products', 0, 'N;', '2020-07-21 21:43:04', '2020-07-21 21:43:04');
INSERT INTO `settings` VALUES (218, 'storefront_top_brands', 0, 'a:1:{i:0;s:1:\"1\";}', '2020-07-21 21:43:05', '2020-07-21 21:47:36');
INSERT INTO `settings` VALUES (219, 'storefront_vertical_products_1_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (220, 'storefront_vertical_products_2_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (221, 'storefront_vertical_products_3_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (222, 'storefront_product_grid_section_tab_1_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (223, 'storefront_product_grid_section_tab_2_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (224, 'storefront_product_grid_section_tab_3_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (225, 'storefront_product_grid_section_tab_4_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (226, 'storefront_product_tabs_2_section_tab_1_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (227, 'storefront_product_tabs_2_section_tab_2_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (228, 'storefront_product_tabs_2_section_tab_3_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (229, 'storefront_product_tabs_2_section_tab_4_products', 0, 'N;', '2020-07-21 21:43:05', '2020-07-21 21:43:05');
INSERT INTO `settings` VALUES (230, 'storefront_three_column_full_width_banners_background_file_id', 0, 's:2:\"22\";', '2020-07-21 21:45:46', '2020-07-21 21:45:46');
INSERT INTO `settings` VALUES (231, 'welcome_email', 0, 's:1:\"1\";', '2020-07-21 22:15:37', '2020-07-21 17:32:08');
INSERT INTO `settings` VALUES (232, 'admin_order_email', 0, 's:1:\"1\";', '2020-07-21 22:15:37', '2020-07-21 17:32:08');
INSERT INTO `settings` VALUES (233, 'order_status_email', 0, 's:1:\"1\";', '2020-07-21 22:15:37', '2020-07-21 17:32:08');
INSERT INTO `settings` VALUES (234, 'invoice_email', 0, 's:1:\"1\";', '2020-07-21 22:15:37', '2020-07-21 17:32:08');
INSERT INTO `settings` VALUES (235, 'maintenance_mode', 0, 's:1:\"0\";', '2020-07-21 22:15:37', '2020-07-21 22:15:37');
INSERT INTO `settings` VALUES (236, 'allowed_ips', 0, 'N;', '2020-07-21 22:15:37', '2020-07-21 22:15:37');
INSERT INTO `settings` VALUES (237, 'store_tagline', 1, NULL, '2020-07-21 22:15:37', '2020-07-21 22:15:37');
INSERT INTO `settings` VALUES (238, 'bank_transfer_instructions', 1, NULL, '2020-07-21 22:15:38', '2020-07-21 22:15:38');
INSERT INTO `settings` VALUES (239, 'check_payment_instructions', 1, NULL, '2020-07-21 22:15:38', '2020-07-21 22:15:38');
INSERT INTO `settings` VALUES (240, 'store_phone', 0, 's:15:\"+1-305-425-1010\";', '2020-07-21 22:15:38', '2020-07-21 16:19:50');
INSERT INTO `settings` VALUES (241, 'store_address_1', 0, 's:18:\"Managua, Nicaragua\";', '2020-07-21 22:15:38', '2020-07-21 16:19:50');
INSERT INTO `settings` VALUES (242, 'store_address_2', 0, 'N;', '2020-07-21 22:15:38', '2020-07-21 16:19:50');
INSERT INTO `settings` VALUES (243, 'store_city', 0, 's:12:\"EE UU, Miami\";', '2020-07-21 22:15:38', '2020-07-21 16:19:50');
INSERT INTO `settings` VALUES (244, 'store_country', 0, 's:2:\"US\";', '2020-07-21 22:15:38', '2020-07-21 22:15:38');
INSERT INTO `settings` VALUES (245, 'store_state', 0, 's:2:\"ME\";', '2020-07-21 22:15:38', '2020-07-21 16:19:51');
INSERT INTO `settings` VALUES (246, 'store_zip', 0, 's:5:\"03579\";', '2020-07-21 22:15:38', '2020-07-21 16:19:51');
INSERT INTO `settings` VALUES (247, 'currency_rate_exchange_service', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (248, 'fixer_access_key', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (249, 'forge_api_key', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (250, 'currency_data_feed_api_key', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (251, 'auto_refresh_currency_rates', 0, 's:1:\"0\";', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (252, 'auto_refresh_currency_rate_frequency', 0, 's:5:\"daily\";', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (253, 'mail_from_address', 0, 's:39:\"customerservice@fleetcart.envaysoft.com\";', '2020-07-21 22:15:39', '2020-07-21 17:31:42');
INSERT INTO `settings` VALUES (254, 'mail_from_name', 0, 's:16:\"Customer Service\";', '2020-07-21 22:15:39', '2020-07-21 17:31:42');
INSERT INTO `settings` VALUES (255, 'mail_host', 0, 's:16:\"smtp.mailtrap.io\";', '2020-07-21 22:15:39', '2020-07-21 17:31:43');
INSERT INTO `settings` VALUES (256, 'mail_port', 0, 's:4:\"2525\";', '2020-07-21 22:15:39', '2020-07-21 17:31:43');
INSERT INTO `settings` VALUES (257, 'mail_username', 0, 's:14:\"ec71012ace256e\";', '2020-07-21 22:15:39', '2020-07-21 17:31:43');
INSERT INTO `settings` VALUES (258, 'mail_password', 0, 's:14:\"5be1463a2de19d\";', '2020-07-21 22:15:39', '2020-07-21 17:31:43');
INSERT INTO `settings` VALUES (259, 'mail_encryption', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (260, 'mailchimp_api_key', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (261, 'mailchimp_list_id', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (262, 'custom_header_assets', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (263, 'custom_footer_assets', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (264, 'facebook_login_enabled', 0, 's:1:\"0\";', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (265, 'facebook_login_app_id', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (266, 'facebook_login_app_secret', 0, 'N;', '2020-07-21 22:15:39', '2020-07-21 22:15:39');
INSERT INTO `settings` VALUES (267, 'google_login_enabled', 0, 's:1:\"0\";', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (268, 'google_login_client_id', 0, 'N;', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (269, 'google_login_client_secret', 0, 'N;', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (270, 'free_shipping_enabled', 0, 's:1:\"1\";', '2020-07-21 22:15:40', '2020-07-21 16:30:05');
INSERT INTO `settings` VALUES (271, 'free_shipping_min_amount', 0, 'N;', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (272, 'local_pickup_enabled', 0, 's:1:\"0\";', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (273, 'flat_rate_enabled', 0, 's:1:\"0\";', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (274, 'paypal_enabled', 0, 's:1:\"0\";', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (275, 'paypal_test_mode', 0, 's:1:\"0\";', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (276, 'paypal_client_id', 0, 's:80:\"AYQ20ue1-_QonQDJxFW6z0jvLHAOjZTo-Zlc_ubVYMLLNADxN67K6RyDx-U37FP_TW8XTEcPTbRz4fK8\";', '2020-07-21 22:15:40', '2020-07-21 16:28:50');
INSERT INTO `settings` VALUES (277, 'paypal_secret', 0, 'N;', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (278, 'stripe_enabled', 0, 's:1:\"0\";', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (279, 'stripe_publishable_key', 0, 'N;', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (280, 'stripe_secret_key', 0, 'N;', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (281, 'razorpay_enabled', 0, 's:1:\"0\";', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (282, 'razorpay_key_id', 0, 'N;', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (283, 'razorpay_key_secret', 0, 'N;', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (284, 'instamojo_enabled', 0, 's:1:\"0\";', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (285, 'instamojo_test_mode', 0, 's:1:\"0\";', '2020-07-21 22:15:40', '2020-07-21 22:15:40');
INSERT INTO `settings` VALUES (286, 'instamojo_api_key', 0, 'N;', '2020-07-21 22:15:41', '2020-07-21 22:15:41');
INSERT INTO `settings` VALUES (287, 'instamojo_auth_token', 0, 'N;', '2020-07-21 22:15:41', '2020-07-21 22:15:41');
INSERT INTO `settings` VALUES (288, 'cod_enabled', 0, 's:1:\"1\";', '2020-07-21 22:15:41', '2020-07-21 18:30:35');
INSERT INTO `settings` VALUES (289, 'bank_transfer_enabled', 0, 's:1:\"0\";', '2020-07-21 22:15:41', '2020-07-21 22:15:41');
INSERT INTO `settings` VALUES (290, 'check_payment_enabled', 0, 's:1:\"0\";', '2020-07-21 22:15:41', '2020-07-21 22:15:41');
INSERT INTO `settings` VALUES (291, 'storefront_mail_logo', 1, NULL, '2020-07-21 18:03:13', '2020-07-21 18:03:13');
INSERT INTO `settings` VALUES (292, 'storefront_accepted_payment_methods_image', 0, 's:2:\"32\";', '2020-07-21 18:03:13', '2020-07-21 18:03:13');

-- ----------------------------
-- Table structure for slider_slide_translations
-- ----------------------------
DROP TABLE IF EXISTS `slider_slide_translations`;
CREATE TABLE `slider_slide_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slider_slide_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `caption_1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `caption_2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `call_to_action_text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `direction` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slider_slide_translations_slider_slide_id_locale_unique`(`slider_slide_id`, `locale`) USING BTREE,
  CONSTRAINT `slider_slide_translations_slider_slide_id_foreign` FOREIGN KEY (`slider_slide_id`) REFERENCES `slider_slides` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slider_slide_translations
-- ----------------------------
INSERT INTO `slider_slide_translations` VALUES (1, 1, 'en', 15, '<b>XIAOMI</b> SPEAKER', 'There are a upgrade for the quality and control in the home', 'SHOP NOW', 'right');
INSERT INTO `slider_slide_translations` VALUES (2, 2, 'en', 16, '<b>3D</b> Virtual Reality', 'VR 3D glasses with remote control gamepad at best price', 'BUY NOW', 'left');
INSERT INTO `slider_slide_translations` VALUES (3, 3, 'en', 17, '<b>DJI</b> MAVIC PRO', 'The creative\'s shop for flying cameras and flight controllers', 'ORDER NOW', 'left');

-- ----------------------------
-- Table structure for slider_slides
-- ----------------------------
DROP TABLE IF EXISTS `slider_slides`;
CREATE TABLE `slider_slides`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) UNSIGNED NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `call_to_action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `open_in_new_window` tinyint(1) NULL DEFAULT NULL,
  `position` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `slider_slides_slider_id_foreign`(`slider_id`) USING BTREE,
  CONSTRAINT `slider_slides_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slider_slides
-- ----------------------------
INSERT INTO `slider_slides` VALUES (1, 1, '{\"caption_1\":{\"delay\":null,\"effect\":\"fadeInUp\"},\"caption_2\":{\"delay\":null,\"effect\":\"fadeInUp\"},\"call_to_action\":{\"delay\":null,\"effect\":\"fadeInUp\"}}', '#', 1, 0, '2020-07-21 21:40:43', '2020-07-21 21:40:43');
INSERT INTO `slider_slides` VALUES (2, 1, '{\"caption_1\":{\"delay\":null,\"effect\":\"fadeInUp\"},\"caption_2\":{\"delay\":null,\"effect\":\"fadeInUp\"},\"call_to_action\":{\"delay\":null,\"effect\":\"fadeInUp\"}}', '#', 0, 1, '2020-07-21 21:40:43', '2020-07-21 21:40:43');
INSERT INTO `slider_slides` VALUES (3, 1, '{\"caption_1\":{\"delay\":null,\"effect\":\"fadeInUp\"},\"caption_2\":{\"delay\":null,\"effect\":\"fadeInUp\"},\"call_to_action\":{\"delay\":null,\"effect\":\"fadeInUp\"}}', '#', 0, 2, '2020-07-21 21:40:43', '2020-07-21 21:40:43');

-- ----------------------------
-- Table structure for slider_translations
-- ----------------------------
DROP TABLE IF EXISTS `slider_translations`;
CREATE TABLE `slider_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slider_translations_slider_id_locale_unique`(`slider_id`, `locale`) USING BTREE,
  CONSTRAINT `slider_translations_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slider_translations
-- ----------------------------
INSERT INTO `slider_translations` VALUES (1, 1, 'en', 'Main Slider');

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `speed` int(11) NULL DEFAULT NULL,
  `autoplay` tinyint(1) NULL DEFAULT NULL,
  `autoplay_speed` int(11) NULL DEFAULT NULL,
  `fade` tinyint(1) NOT NULL DEFAULT 0,
  `dots` tinyint(1) NULL DEFAULT NULL,
  `arrows` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sliders
-- ----------------------------
INSERT INTO `sliders` VALUES (1, 1000, 1, 5000, 0, 1, 1, '2020-07-21 21:40:43', '2020-07-21 21:40:43');

-- ----------------------------
-- Table structure for tag_translations
-- ----------------------------
DROP TABLE IF EXISTS `tag_translations`;
CREATE TABLE `tag_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tag_translations_tag_id_locale_unique`(`tag_id`, `locale`) USING BTREE,
  CONSTRAINT `tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_translations
-- ----------------------------
INSERT INTO `tag_translations` VALUES (1, 1, 'en', 'ANTIANEMIC');
INSERT INTO `tag_translations` VALUES (2, 2, 'en', 'ANTIBIOTIC');
INSERT INTO `tag_translations` VALUES (3, 3, 'en', 'ANTIVERTIGINOUS');
INSERT INTO `tag_translations` VALUES (4, 4, 'en', 'CARDIOVASCULAR');
INSERT INTO `tag_translations` VALUES (5, 5, 'en', 'GASTROINTESTINAL');
INSERT INTO `tag_translations` VALUES (6, 6, 'en', 'INMUNOSUPRESSOR');
INSERT INTO `tag_translations` VALUES (7, 7, 'en', 'PAIN AND ANTIESPASMODICS');
INSERT INTO `tag_translations` VALUES (8, 8, 'en', 'RESPIRATORY');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tags_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (1, 'antianemic', '2020-07-21 18:07:27', '2020-07-21 18:07:27');
INSERT INTO `tags` VALUES (2, 'antibiotic', '2020-07-21 18:07:55', '2020-07-21 18:07:55');
INSERT INTO `tags` VALUES (3, 'antivertiginous', '2020-07-21 18:08:03', '2020-07-21 18:08:03');
INSERT INTO `tags` VALUES (4, 'cardiovascular', '2020-07-21 18:08:11', '2020-07-21 18:08:11');
INSERT INTO `tags` VALUES (5, 'gastrointestinal', '2020-07-21 18:08:18', '2020-07-21 18:08:18');
INSERT INTO `tags` VALUES (6, 'inmunosupressor', '2020-07-21 18:08:27', '2020-07-21 18:08:27');
INSERT INTO `tags` VALUES (7, 'pain-and-antiespasmodics', '2020-07-21 18:08:34', '2020-07-21 18:08:34');
INSERT INTO `tags` VALUES (8, 'respiratory', '2020-07-21 18:08:43', '2020-07-21 18:08:43');

-- ----------------------------
-- Table structure for tax_class_translations
-- ----------------------------
DROP TABLE IF EXISTS `tax_class_translations`;
CREATE TABLE `tax_class_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tax_class_translations_tax_class_id_locale_unique`(`tax_class_id`, `locale`) USING BTREE,
  CONSTRAINT `tax_class_translations_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tax_classes
-- ----------------------------
DROP TABLE IF EXISTS `tax_classes`;
CREATE TABLE `tax_classes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `based_on` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tax_rate_translations
-- ----------------------------
DROP TABLE IF EXISTS `tax_rate_translations`;
CREATE TABLE `tax_rate_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tax_rate_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tax_rate_translations_tax_rate_id_locale_unique`(`tax_rate_id`, `locale`) USING BTREE,
  CONSTRAINT `tax_rate_translations_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE `tax_rates`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8, 4) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tax_rates_tax_class_id_index`(`tax_class_id`) USING BTREE,
  CONSTRAINT `tax_rates_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for throttle
-- ----------------------------
DROP TABLE IF EXISTS `throttle`;
CREATE TABLE `throttle`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `throttle_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `throttle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of throttle
-- ----------------------------
INSERT INTO `throttle` VALUES (1, NULL, 'global', NULL, '2020-07-21 20:47:32', '2020-07-21 20:47:32');
INSERT INTO `throttle` VALUES (2, NULL, 'ip', '127.0.0.1', '2020-07-21 20:47:32', '2020-07-21 20:47:32');
INSERT INTO `throttle` VALUES (3, 1, 'user', NULL, '2020-07-21 20:47:32', '2020-07-21 20:47:32');

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `transactions_order_id_unique`(`order_id`) USING BTREE,
  CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for translation_translations
-- ----------------------------
DROP TABLE IF EXISTS `translation_translations`;
CREATE TABLE `translation_translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `translation_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `translation_translations_translation_id_locale_unique`(`translation_id`, `locale`) USING BTREE,
  CONSTRAINT `translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `translations_key_index`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for up_sell_products
-- ----------------------------
DROP TABLE IF EXISTS `up_sell_products`;
CREATE TABLE `up_sell_products`  (
  `product_id` int(10) UNSIGNED NOT NULL,
  `up_sell_product_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`, `up_sell_product_id`) USING BTREE,
  INDEX `up_sell_products_up_sell_product_id_foreign`(`up_sell_product_id`) USING BTREE,
  CONSTRAINT `up_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `up_sell_products_up_sell_product_id_foreign` FOREIGN KEY (`up_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for updater_scripts
-- ----------------------------
DROP TABLE IF EXISTS `updater_scripts`;
CREATE TABLE `updater_scripts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `script` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of updater_scripts
-- ----------------------------
INSERT INTO `updater_scripts` VALUES (1, 'V2_0_0');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `user_roles_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (1, 1, '2020-07-21 14:44:51', '2020-07-21 14:44:51');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_login` datetime(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Maryan Adan', 'Barrera', 'endscom@gmail.com', '$2y$10$LS5sP4.cFPrEj1w.ZkBUaeec9oCwfYXE5tSprsm1/tyKzKZNHYBXO', NULL, '2020-07-21 20:47:38', '2020-07-21 14:44:50', '2020-07-21 20:47:38');

-- ----------------------------
-- Table structure for wish_lists
-- ----------------------------
DROP TABLE IF EXISTS `wish_lists`;
CREATE TABLE `wish_lists`  (
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `product_id`) USING BTREE,
  INDEX `wish_lists_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `wish_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wish_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
