-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addon_product`
--

DROP TABLE IF EXISTS `addon_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_product` (
  `product_id` bigint unsigned NOT NULL,
  `addon_id` bigint unsigned NOT NULL,
  `price` decimal(8,2) NOT NULL,
  KEY `addon_product_product_id_foreign` (`product_id`),
  KEY `addon_product_addon_id_foreign` (`addon_id`),
  CONSTRAINT `addon_product_addon_id_foreign` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `addon_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_product`
--

LOCK TABLES `addon_product` WRITE;
/*!40000 ALTER TABLE `addon_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` bigint unsigned NOT NULL,
  `parent_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addons_shop_id_foreign` (`shop_id`),
  CONSTRAINT `addons_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_wallets`
--

DROP TABLE IF EXISTS `admin_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int NOT NULL,
  `transaction_alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` int DEFAULT NULL COMMENT '1-commission,2-user-recharge,3-order-debit,4-shop-recharge,5-shop-settle,6-partner-recharge,7-partner-commission,8-partner-settle,9-tax-credit,10-discount-debit,11-discount-recharge,12-user-referral,13-shop-referral,14-peak-commission,15-waiting-commission,16-user-dispute,17-shop-dispute,18-partner-dispute',
  `type` enum('C','D') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,8) NOT NULL DEFAULT '0.00000000',
  `open_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `close_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `payment_mode` enum('CARD','STRIPE','PAYPAL','PAYUMONEY','PAYTM') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_wallets`
--

LOCK TABLES `admin_wallets` WRITE;
/*!40000 ALTER TABLE `admin_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` int DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `redirect_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_at` timestamp NULL DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `last_four` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` int NOT NULL DEFAULT '0',
  `cardable_id` bigint unsigned NOT NULL,
  `cardable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_cardable_id_index` (`cardable_id`),
  KEY `cards_cardable_type_index` (`cardable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_addons`
--

DROP TABLE IF EXISTS `cart_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_addons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cart_product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `addon_product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_addons_cart_product_id_foreign` (`cart_product_id`),
  KEY `cart_addons_addon_product_id_foreign` (`addon_product_id`),
  CONSTRAINT `cart_addons_addon_product_id_foreign` FOREIGN KEY (`addon_product_id`) REFERENCES `addon_product` (`addon_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_addons_cart_product_id_foreign` FOREIGN KEY (`cart_product_id`) REFERENCES `cart_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_addons`
--

LOCK TABLES `cart_addons` WRITE;
/*!40000 ALTER TABLE `cart_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned NOT NULL,
  `product_price_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `total_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `addon_price` decimal(8,2) DEFAULT '0.00',
  `quantity` int NOT NULL DEFAULT '1',
  `save_for_later` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_products_cart_id_foreign` (`cart_id`),
  KEY `cart_products_product_variant_id_foreign` (`product_variant_id`),
  KEY `cart_products_product_price_id_foreign` (`product_price_id`),
  KEY `cart_products_product_id_foreign` (`product_id`),
  CONSTRAINT `cart_products_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_products_product_price_id_foreign` FOREIGN KEY (`product_price_id`) REFERENCES `product_prices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_products_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_products`
--

LOCK TABLES `cart_products` WRITE;
/*!40000 ALTER TABLE `cart_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `shop_id` bigint unsigned NOT NULL,
  `user_address_id` bigint unsigned DEFAULT NULL,
  `promocode_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_shop_id_foreign` (`shop_id`),
  KEY `carts_user_address_id_foreign` (`user_address_id`),
  KEY `carts_promocode_id_foreign` (`promocode_id`),
  KEY `carts_order_id_foreign` (`order_id`),
  CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carts_promocode_id_foreign` FOREIGN KEY (`promocode_id`) REFERENCES `promocodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carts_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carts_user_address_id_foreign` FOREIGN KEY (`user_address_id`) REFERENCES `user_addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_shop`
--

DROP TABLE IF EXISTS `category_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_shop` (
  `category_id` bigint unsigned NOT NULL,
  `shop_id` bigint unsigned NOT NULL,
  KEY `category_shop_category_id_foreign` (`category_id`),
  KEY `category_shop_shop_id_foreign` (`shop_id`),
  CONSTRAINT `category_shop_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `category_shop_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_shop`
--

LOCK TABLES `category_shop` WRITE;
/*!40000 ALTER TABLE `category_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `deviceable_id` bigint unsigned NOT NULL,
  `deviceable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('web','android','ios') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(10,8) DEFAULT NULL,
  `longitude` double(11,8) DEFAULT NULL,
  `device_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `os_player_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_deviceable_id_index` (`deviceable_id`),
  KEY `devices_deviceable_type_index` (`deviceable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentables`
--

DROP TABLE IF EXISTS `documentables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentables` (
  `document_id` bigint unsigned NOT NULL,
  `documentable_id` bigint unsigned NOT NULL,
  `documentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_at` timestamp NOT NULL,
  `status` enum('assessing','active','expired') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assessing',
  KEY `documentables_documentable_id_index` (`documentable_id`),
  KEY `documentables_documentable_type_index` (`documentable_type`),
  KEY `documentables_document_id_foreign` (`document_id`),
  CONSTRAINT `documentables_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentables`
--

LOCK TABLES `documentables` WRITE;
/*!40000 ALTER TABLE `documentables` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `for` enum('partner','shop') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'partner',
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favouriteables`
--

DROP TABLE IF EXISTS `favouriteables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favouriteables` (
  `user_id` bigint unsigned NOT NULL,
  `favouriteable_id` bigint unsigned NOT NULL,
  `favouriteable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `favouriteables_favouriteable_id_index` (`favouriteable_id`),
  KEY `favouriteables_favouriteable_type_index` (`favouriteable_type`),
  KEY `favouriteables_user_id_foreign` (`user_id`),
  CONSTRAINT `favouriteables_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favouriteables`
--

LOCK TABLES `favouriteables` WRITE;
/*!40000 ALTER TABLE `favouriteables` DISABLE KEYS */;
/*!40000 ALTER TABLE `favouriteables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `imageable_id` bigint unsigned NOT NULL,
  `imageable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `position` int NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_imageable_id_index` (`imageable_id`),
  KEY `images_imageable_type_index` (`imageable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inqueries`
--

DROP TABLE IF EXISTS `inqueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inqueries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `for` enum('partner','shop','promotional') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'partner',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inqueries`
--

LOCK TABLES `inqueries` WRITE;
/*!40000 ALTER TABLE `inqueries` DISABLE KEYS */;
/*!40000 ALTER TABLE `inqueries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,NULL,'en','2022-07-07 17:17:10','2022-07-07 17:17:10');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liked_shops`
--

DROP TABLE IF EXISTS `liked_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liked_shops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `shop_info_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liked_shops`
--

LOCK TABLES `liked_shops` WRITE;
/*!40000 ALTER TABLE `liked_shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `liked_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0000_00_00_000000_create_websockets_statistics_entries_table',1),(2,'2014_10_12_000000_create_users_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2018_08_08_100000_create_telescope_entries_table',1),(5,'2018_08_29_200844_create_languages_table',1),(6,'2018_08_29_205156_create_translations_table',1),(7,'2019_08_19_000000_create_failed_jobs_table',1),(8,'2019_12_14_000001_create_personal_access_tokens_table',1),(9,'2021_09_20_232730_create_permission_tables',1),(10,'2021_09_21_000001_create_categories_table',1),(11,'2021_09_21_000002_create_shop_categories_table',1),(12,'2021_09_21_000003_create_category_shop_table',1),(13,'2021_09_21_000004_create_notice_boards_table',1),(14,'2021_09_21_000005_create_addon_product_table',1),(15,'2021_09_21_000006_create_variants_table',1),(16,'2021_09_21_000007_create_shop_infos_table',1),(17,'2021_09_21_000008_create_product_variants_table',1),(18,'2021_09_21_000009_create_product_prices_table',1),(19,'2021_09_21_000010_create_user_addresses_table',1),(20,'2021_09_21_000011_create_admins_table',1),(21,'2021_09_21_000012_create_documentables_table',1),(22,'2021_09_21_000013_create_documents_table',1),(23,'2021_09_21_000014_create_inqueries_table',1),(24,'2021_09_21_000015_create_promocodes_table',1),(25,'2021_09_21_000016_create_favouriteables_table',1),(26,'2021_09_21_000017_create_products_table',1),(27,'2021_09_21_000018_create_addons_table',1),(28,'2021_09_21_000019_create_cart_products_table',1),(29,'2021_09_21_000020_create_cart_addons_table',1),(30,'2021_09_21_000021_create_partner_vehicles_table',1),(31,'2021_09_21_000022_create_orders_table',1),(32,'2021_09_21_000023_create_order_invoices_table',1),(33,'2021_09_21_000024_create_order_ratings_table',1),(34,'2021_09_21_000025_create_carts_table',1),(35,'2021_09_21_000026_create_order_disputes_table',1),(36,'2021_09_21_000027_create_reasons_table',1),(37,'2021_09_21_000028_create_order_dispute_comments_table',1),(38,'2021_09_21_000029_create_promocodeables_table',1),(39,'2021_09_21_000030_create_devices_table',1),(40,'2021_09_21_000031_create_images_table',1),(41,'2021_09_21_000032_create_shops_table',1),(42,'2021_09_21_000033_create_partners_table',1),(43,'2021_09_21_000034_create_shop_timings_table',1),(44,'2021_09_21_000035_create_order_dispute_messages_table',1),(45,'2021_09_21_000036_create_shifts_table',1),(46,'2021_09_21_000037_create_shift_timings_table',1),(47,'2021_09_21_000038_create_social_accounts_table',1),(48,'2021_09_21_009001_add_foreigns_to_categories_table',1),(49,'2021_09_21_009002_add_foreigns_to_shop_categories_table',1),(50,'2021_09_21_009003_add_foreigns_to_category_shop_table',1),(51,'2021_09_21_009004_add_foreigns_to_addon_product_table',1),(52,'2021_09_21_009005_add_foreigns_to_variants_table',1),(53,'2021_09_21_009006_add_foreigns_to_shop_infos_table',1),(54,'2021_09_21_009007_add_foreigns_to_product_variants_table',1),(55,'2021_09_21_009008_add_foreigns_to_product_prices_table',1),(56,'2021_09_21_009009_add_foreigns_to_user_addresses_table',1),(57,'2021_09_21_009010_add_foreigns_to_documentables_table',1),(58,'2021_09_21_009011_add_foreigns_to_favouriteables_table',1),(59,'2021_09_21_009012_add_foreigns_to_products_table',1),(60,'2021_09_21_009013_add_foreigns_to_addons_table',1),(61,'2021_09_21_009014_add_foreigns_to_cart_products_table',1),(62,'2021_09_21_009015_add_foreigns_to_cart_addons_table',1),(63,'2021_09_21_009016_add_foreigns_to_partner_vehicles_table',1),(64,'2021_09_21_009017_add_foreigns_to_orders_table',1),(65,'2021_09_21_009018_add_foreigns_to_order_invoices_table',1),(66,'2021_09_21_009019_add_foreigns_to_order_ratings_table',1),(67,'2021_09_21_009020_add_foreigns_to_carts_table',1),(68,'2021_09_21_009021_add_foreigns_to_order_disputes_table',1),(69,'2021_09_21_009022_add_foreigns_to_order_dispute_comments_table',1),(70,'2021_09_21_009023_add_foreigns_to_promocodeables_table',1),(71,'2021_09_21_009024_add_foreigns_to_shop_timings_table',1),(72,'2021_09_21_009025_add_foreigns_to_order_dispute_messages_table',1),(73,'2021_09_21_009026_add_foreigns_to_shifts_table',1),(74,'2021_09_21_009027_add_foreigns_to_shift_timings_table',1),(75,'2021_09_23_000635_create_settings_table',1),(76,'2021_10_04_062747_create_liked_shops_table',1),(77,'2021_10_14_111317_create_notifications_table',1),(78,'2021_10_16_210018_create_order_filters_table',1),(79,'2021_10_16_214003_create_jobs_table',1),(80,'2021_11_04_163938_create_payment_logs_table',1),(81,'2021_11_04_163946_create_cards_table',1),(82,'2021_11_04_164939_create_user_wallets_table',1),(83,'2021_11_04_164955_create_admin_wallets_table',1),(84,'2021_11_04_165022_create_shop_wallets_table',1),(85,'2021_11_04_165103_create_partner_wallets_table',1),(86,'2021_11_07_172122_create_banners_table',1),(87,'2021_12_01_111826_create_wallet_requests_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_boards`
--

DROP TABLE IF EXISTS `notice_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_boards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notice_boardable_id` bigint unsigned NOT NULL,
  `notice_boardable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice` text COLLATE utf8mb4_unicode_ci,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notice_boards_notice_boardable_id_index` (`notice_boardable_id`),
  KEY `notice_boards_notice_boardable_type_index` (`notice_boardable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_boards`
--

LOCK TABLES `notice_boards` WRITE;
/*!40000 ALTER TABLE `notice_boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_dispute_comments`
--

DROP TABLE IF EXISTS `order_dispute_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_dispute_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned NOT NULL,
  `order_dispute_id` bigint unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_dispute_comments_admin_id_foreign` (`admin_id`),
  KEY `order_dispute_comments_order_dispute_id_foreign` (`order_dispute_id`),
  CONSTRAINT `order_dispute_comments_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_dispute_comments_order_dispute_id_foreign` FOREIGN KEY (`order_dispute_id`) REFERENCES `order_disputes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_dispute_comments`
--

LOCK TABLES `order_dispute_comments` WRITE;
/*!40000 ALTER TABLE `order_dispute_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_dispute_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_dispute_messages`
--

DROP TABLE IF EXISTS `order_dispute_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_dispute_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('text','image') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `seen` tinyint(1) NOT NULL,
  `order_dispute_messageable_id` bigint unsigned NOT NULL,
  `order_dispute_messageable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_dispute_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_dispute_messages_order_dispute_messageable_id_index` (`order_dispute_messageable_id`),
  KEY `order_dispute_messages_order_dispute_messageable_type_index` (`order_dispute_messageable_type`),
  KEY `order_dispute_messages_order_dispute_id_foreign` (`order_dispute_id`),
  CONSTRAINT `order_dispute_messages_order_dispute_id_foreign` FOREIGN KEY (`order_dispute_id`) REFERENCES `order_disputes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_dispute_messages`
--

LOCK TABLES `order_dispute_messages` WRITE;
/*!40000 ALTER TABLE `order_dispute_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_dispute_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_disputes`
--

DROP TABLE IF EXISTS `order_disputes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_disputes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reason_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` enum('user','shop','partner') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `created_to` enum('user','shop','partner','dispatcher') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `status` enum('assessing','refund','resolve','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assessing',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `refund` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_disputes_reason_id_foreign` (`reason_id`),
  KEY `order_disputes_order_id_foreign` (`order_id`),
  CONSTRAINT `order_disputes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_disputes_reason_id_foreign` FOREIGN KEY (`reason_id`) REFERENCES `reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_disputes`
--

LOCK TABLES `order_disputes` WRITE;
/*!40000 ALTER TABLE `order_disputes` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_disputes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_filters`
--

DROP TABLE IF EXISTS `order_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_filters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `partner_id` bigint unsigned NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_filters_partner_id_foreign` (`partner_id`),
  KEY `order_filters_order_id_foreign` (`order_id`),
  CONSTRAINT `order_filters_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_filters_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_filters`
--

LOCK TABLES `order_filters` WRITE;
/*!40000 ALTER TABLE `order_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_invoices`
--

DROP TABLE IF EXISTS `order_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `gross` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `payable` decimal(8,2) NOT NULL DEFAULT '0.00',
  `commission` decimal(8,2) NOT NULL DEFAULT '0.00',
  `commission_per` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax_percent` decimal(8,2) NOT NULL DEFAULT '0.00',
  `net` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_pay` decimal(8,2) NOT NULL DEFAULT '0.00',
  `is_partial` tinyint(1) NOT NULL DEFAULT '0',
  `wallet` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tips` decimal(8,2) NOT NULL DEFAULT '0.00',
  `payment_mode` enum('CASH','CARD','PAYPAL','PAYTM') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CASH',
  `DestinationTag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','failed','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_invoices_order_id_foreign` (`order_id`),
  CONSTRAINT `order_invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_invoices`
--

LOCK TABLES `order_invoices` WRITE;
/*!40000 ALTER TABLE `order_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_ratings`
--

DROP TABLE IF EXISTS `order_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_ratings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `user_rating` int DEFAULT NULL,
  `user_comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partner_id` bigint unsigned DEFAULT NULL,
  `partner_rating` int DEFAULT NULL,
  `partner_comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` bigint unsigned DEFAULT NULL,
  `shop_rating` int DEFAULT NULL,
  `shop_comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_ratings_order_id_foreign` (`order_id`),
  KEY `order_ratings_user_id_foreign` (`user_id`),
  KEY `order_ratings_partner_id_foreign` (`partner_id`),
  KEY `order_ratings_shop_id_foreign` (`shop_id`),
  CONSTRAINT `order_ratings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ratings_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ratings_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_ratings`
--

LOCK TABLES `order_ratings` WRITE;
/*!40000 ALTER TABLE `order_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `user_address_id` bigint unsigned NOT NULL,
  `shop_id` bigint unsigned DEFAULT NULL,
  `partner_id` bigint unsigned DEFAULT NULL,
  `partner_vehicle_id` bigint unsigned DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_key` text COLLATE utf8mb4_unicode_ci,
  `order_type` enum('DINEIN','DELIVERY','TAKEAWAY') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DELIVERY',
  `dispute` enum('NODISPUTE','CREATED','RESOLVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NODISPUTE',
  `cancel_by` enum('USER','SHOP','PARTNER') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` timestamp NOT NULL,
  `order_otp` int NOT NULL,
  `order_ready_time` int DEFAULT NULL,
  `order_ready_status` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('ORDERED','RECEIVED','CANCELLED','ASSIGNED','PROCESSING','READY','SEARCHING','ARRIVED','PICKEDUP','REACHED','COMPLETED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ORDERED',
  `schedule_status` tinyint(1) DEFAULT '0',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_user_address_id_foreign` (`user_address_id`),
  KEY `orders_shop_id_foreign` (`shop_id`),
  KEY `orders_partner_id_foreign` (`partner_id`),
  KEY `orders_partner_vehicle_id_foreign` (`partner_vehicle_id`),
  CONSTRAINT `orders_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_partner_vehicle_id_foreign` FOREIGN KEY (`partner_vehicle_id`) REFERENCES `partner_vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_user_address_id_foreign` FOREIGN KEY (`user_address_id`) REFERENCES `user_addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_vehicles`
--

DROP TABLE IF EXISTS `partner_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_vehicles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` bigint unsigned NOT NULL,
  `vehicle_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_vehicles_partner_id_foreign` (`partner_id`),
  CONSTRAINT `partner_vehicles_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_vehicles`
--

LOCK TABLES `partner_vehicles` WRITE;
/*!40000 ALTER TABLE `partner_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_wallets`
--

DROP TABLE IF EXISTS `partner_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` bigint unsigned NOT NULL,
  `transaction_id` int NOT NULL,
  `transaction_alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('C','D') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,8) NOT NULL DEFAULT '0.00000000',
  `open_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `close_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `payment_mode` enum('CARD','STRIPE','PAYPAL','PAYUMONEY','PAYTM') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_wallets_partner_id_foreign` (`partner_id`),
  CONSTRAINT `partner_wallets_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_wallets`
--

LOCK TABLES `partner_wallets` WRITE;
/*!40000 ALTER TABLE `partner_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` int DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('assessing','banned','online','offline','riding','unsettled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assessing',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partners_email_unique` (`email`),
  UNIQUE KEY `partners_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `is_wallet` int NOT NULL DEFAULT '0',
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'user or transporter or shop',
  `payment_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL COMMENT 'user id or transporter id or shop id',
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `stripe_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'code generated during stripe payment',
  `transaction_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Random code generated during payment',
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Foreign key of the user request or wallet table',
  `response` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_prices`
--

DROP TABLE IF EXISTS `product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_variant_id` bigint unsigned DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `orignal_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_type` enum('percentage','amount') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_prices_product_variant_id_foreign` (`product_variant_id`),
  CONSTRAINT `product_prices_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_prices`
--

LOCK TABLES `product_prices` WRITE;
/*!40000 ALTER TABLE `product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `variant_id` bigint unsigned NOT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variants_product_id_foreign` (`product_id`),
  KEY `product_variants_variant_id_foreign` (`variant_id`),
  CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_variants_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shop_category_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` bigint unsigned NOT NULL,
  `position` int DEFAULT NULL,
  `serving` int DEFAULT NULL,
  `food_type` enum('veg','non-veg') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'veg',
  `avalability` int NOT NULL,
  `max_quantity` int NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `addon_status` tinyint(1) NOT NULL DEFAULT '0',
  `variant_status` tinyint(1) NOT NULL DEFAULT '0',
  `out_of_stock` enum('no','yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_shop_category_id_foreign` (`shop_category_id`),
  KEY `products_shop_id_foreign` (`shop_id`),
  CONSTRAINT `products_shop_category_id_foreign` FOREIGN KEY (`shop_category_id`) REFERENCES `shop_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocodeables`
--

DROP TABLE IF EXISTS `promocodeables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocodeables` (
  `promocode_id` bigint unsigned NOT NULL,
  `promocodeable_id` bigint unsigned NOT NULL,
  `promocodeable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ADDED',
  KEY `promocodeables_promocodeable_id_index` (`promocodeable_id`),
  KEY `promocodeables_promocodeable_type_index` (`promocodeable_type`),
  KEY `promocodeables_promocode_id_foreign` (`promocode_id`),
  CONSTRAINT `promocodeables_promocode_id_foreign` FOREIGN KEY (`promocode_id`) REFERENCES `promocodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocodeables`
--

LOCK TABLES `promocodeables` WRITE;
/*!40000 ALTER TABLE `promocodeables` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocodeables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocodes`
--

DROP TABLE IF EXISTS `promocodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `promo_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` decimal(8,2) NOT NULL,
  `max_amount` decimal(8,2) NOT NULL,
  `expire_at` timestamp NULL DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocodes`
--

LOCK TABLES `promocodes` WRITE;
/*!40000 ALTER TABLE `promocodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reasons`
--

DROP TABLE IF EXISTS `reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `for` enum('order','partner','dispute') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'order',
  `type` enum('CANCELLED','COMPLAINED','REFUND','REASSIGN') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CANCELLED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reasons`
--

LOCK TABLES `reasons` WRITE;
/*!40000 ALTER TABLE `reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_timings`
--

DROP TABLE IF EXISTS `shift_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_timings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shift_id` bigint unsigned NOT NULL,
  `order_count` int NOT NULL DEFAULT '0',
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shift_timings_shift_id_foreign` (`shift_id`),
  CONSTRAINT `shift_timings_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_timings`
--

LOCK TABLES `shift_timings` WRITE;
/*!40000 ALTER TABLE `shift_timings` DISABLE KEYS */;
/*!40000 ALTER TABLE `shift_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start_at` timestamp NOT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `total_order` int NOT NULL DEFAULT '0',
  `partner_id` bigint unsigned NOT NULL,
  `partner_vehicle_id` bigint unsigned NOT NULL,
  `due` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shifts_partner_id_foreign` (`partner_id`),
  KEY `shifts_partner_vehicle_id_foreign` (`partner_vehicle_id`),
  CONSTRAINT `shifts_partner_id_foreign` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shifts_partner_vehicle_id_foreign` FOREIGN KEY (`partner_vehicle_id`) REFERENCES `partner_vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_categories`
--

DROP TABLE IF EXISTS `shop_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `shop_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_categories_shop_id_foreign` (`shop_id`),
  CONSTRAINT `shop_categories_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_categories`
--

LOCK TABLES `shop_categories` WRITE;
/*!40000 ALTER TABLE `shop_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_infos`
--

DROP TABLE IF EXISTS `shop_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint unsigned NOT NULL,
  `shop_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer_min_amount` decimal(8,2) DEFAULT NULL,
  `offer_percent` decimal(8,2) DEFAULT NULL,
  `commission` decimal(8,2) DEFAULT NULL,
  `estimated_delivery_charge` decimal(8,2) DEFAULT NULL,
  `estimated_delivery_time` int DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double(10,8) DEFAULT NULL,
  `longitude` double(11,8) DEFAULT NULL,
  `maps_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pure_veg` tinyint(1) NOT NULL,
  `popular` tinyint(1) NOT NULL,
  `status` enum('active','holiday','close','banned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'close',
  `rating_status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_infos_shop_id_unique` (`shop_id`),
  CONSTRAINT `shop_infos_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_infos`
--

LOCK TABLES `shop_infos` WRITE;
/*!40000 ALTER TABLE `shop_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_timings`
--

DROP TABLE IF EXISTS `shop_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_timings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint unsigned NOT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` enum('ALL','SUN','MON','TUE','WED','THU','FRI','SAT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ALL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_timings_shop_id_foreign` (`shop_id`),
  CONSTRAINT `shop_timings_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_timings`
--

LOCK TABLES `shop_timings` WRITE;
/*!40000 ALTER TABLE `shop_timings` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_wallets`
--

DROP TABLE IF EXISTS `shop_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint unsigned NOT NULL,
  `transaction_id` int NOT NULL,
  `transaction_alias` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('C','D') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,8) NOT NULL DEFAULT '0.00000000',
  `open_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `close_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `payment_mode` enum('CARD','STRIPE','PAYPAL','PAYUMONEY','PAYTM') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_wallets_shop_id_foreign` (`shop_id`),
  CONSTRAINT `shop_wallets_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_wallets`
--

LOCK TABLES `shop_wallets` WRITE;
/*!40000 ALTER TABLE `shop_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` int DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `social_accountable_id` bigint unsigned NOT NULL,
  `social_accountable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_accounts_provider_id_unique` (`provider_id`),
  KEY `social_accounts_social_accountable_id_index` (`social_accountable_id`),
  KEY `social_accounts_social_accountable_type_index` (`social_accountable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries`
--

DROP TABLE IF EXISTS `telescope_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries` (
  `sequence` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries`
--

LOCK TABLES `telescope_entries` WRITE;
/*!40000 ALTER TABLE `telescope_entries` DISABLE KEYS */;
INSERT INTO `telescope_entries` VALUES (1,'96b9068c-3655-467f-b4ff-ab4c3e248cc6','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'laravel\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'\",\"time\":\"30.76\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:09'),(2,'96b9068c-454d-49c3-921a-cdf6c1562792','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `migrations` (`id` int unsigned not null auto_increment primary key, `migration` varchar(191) not null, `batch` int not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"26.17\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"dca3ddae9e8bbcd341293787e8610ea0\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:09'),(3,'96b9068c-483e-4ff0-a479-8ea7db0b5093','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'laravel\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'\",\"time\":\"6.12\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:09'),(4,'96b9068c-50a9-46a8-abd7-e30fbec01a4d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"20.02\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:09'),(5,'96b9068c-52d9-45ae-8147-fb05efc1d365','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"1.69\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:09'),(6,'96b9068c-68bc-4644-9530-d009cc431c2b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`batch`) as aggregate from `migrations`\",\"time\":\"1.54\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"06e60d7b3d1a0c2de504de4e6f27735e\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:09'),(7,'96b9068c-7b27-454c-be44-075853e883e5','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `websockets_statistics_entries` (`id` int unsigned not null auto_increment primary key, `app_id` varchar(191) not null, `peak_connection_count` int not null, `websocket_message_count` int not null, `api_message_count` int not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"42.70\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/0000_00_00_000000_create_websockets_statistics_entries_table.php\",\"line\":23,\"hash\":\"50bb91b0ad6ec4ea59fab5d1d7822fdc\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:09'),(8,'96b9068c-7d57-4090-b66e-2243d8c27e34','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'0000_00_00_000000_create_websockets_statistics_entries_table\', 1)\",\"time\":\"3.56\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:09'),(9,'96b9068c-8e16-481d-8978-f3c33391004c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `users` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `email` varchar(191) not null, `email_verified_at` timestamp null, `password` varchar(191) not null, `remember_token` varchar(100) null, `stripe_cust_id` varchar(50) null, `phone` varchar(191) not null, `otp` int null, `status` enum(\'enable\', \'disable\') not null default \'enable\', `image` varchar(191) null, `wallet_balance` decimal(8, 2) not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"35.83\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2014_10_12_000000_create_users_table.php\",\"line\":31,\"hash\":\"408ab9ac9dbbbb501945178a78d03afd\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:09'),(10,'96b9068c-b2cd-4d00-81f8-f7946066afb5','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_email_unique`(`email`)\",\"time\":\"93.29\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2014_10_12_000000_create_users_table.php\",\"line\":31,\"hash\":\"0648806a3d18c0f5b81e2257de64675e\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(11,'96b9068c-c65b-4a83-90ce-b1300b515000','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_phone_unique`(`phone`)\",\"time\":\"49.36\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2014_10_12_000000_create_users_table.php\",\"line\":31,\"hash\":\"cbb880065c57552e89f6ee6d252658b1\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(12,'96b9068c-ccf1-47ac-8386-0e3b89a521de','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2014_10_12_000000_create_users_table\', 1)\",\"time\":\"15.79\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(13,'96b9068c-df90-4013-9cf9-6eb47360823a','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `password_resets` (`email` varchar(191) not null, `token` varchar(191) not null, `created_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"45.60\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2014_10_12_100000_create_password_resets_table.php\",\"line\":20,\"hash\":\"68731db34acd59ac6f47053016159dcb\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(14,'96b9068c-ec8b-4ce6-a344-dbd2dd2e3038','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `password_resets` add index `password_resets_email_index`(`email`)\",\"time\":\"32.19\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2014_10_12_100000_create_password_resets_table.php\",\"line\":20,\"hash\":\"e47bfd004ad9142afc1b2460960fbe08\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(15,'96b9068c-ee10-4029-b72b-68026b873837','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2014_10_12_100000_create_password_resets_table\', 1)\",\"time\":\"3.03\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(16,'96b9068d-0063-4430-b8c9-efe2b540b00d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries` (`sequence` bigint unsigned not null auto_increment primary key, `uuid` char(36) not null, `batch_id` char(36) not null, `family_hash` varchar(191) null, `should_display_on_index` tinyint(1) not null default \'1\', `type` varchar(20) not null, `content` longtext not null, `created_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"43.38\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"8d1ffbefc0996658c0af05e275ad250b\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(17,'96b9068d-0cfb-4c4b-9726-8ed1b5c551c7','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add unique `telescope_entries_uuid_unique`(`uuid`)\",\"time\":\"31.26\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"9fb859ae1faff74c6b9e0b70dfd8eea9\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(18,'96b9068d-1689-424e-865c-bcce6d328a12','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_batch_id_index`(`batch_id`)\",\"time\":\"23.66\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"2b075509a9242d6e3f622536c5ccca07\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(19,'96b9068d-23dc-4196-b9d9-495da8fa1595','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_family_hash_index`(`family_hash`)\",\"time\":\"33.30\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"3d25a2a244bd2028dfa0326d3dbf7f4c\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(20,'96b9068d-2d1d-430c-8acc-736bdfaf4f4b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_created_at_index`(`created_at`)\",\"time\":\"22.79\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"7352e7f84460fb7ffc450e7ea4de9dc7\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(21,'96b9068d-3849-43e4-928f-8c06172529fe','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`)\",\"time\":\"27.79\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"7317a4cad2dfa1a5167548a6acd0b6a5\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(22,'96b9068d-4209-4e20-8987-bae5bc71cf87','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries_tags` (`entry_uuid` char(36) not null, `tag` varchar(191) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"23.40\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"49a385485c9ea77ced1287c810e06704\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(23,'96b9068d-4d28-4d9d-a3ec-fb6c20a431e3','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`)\",\"time\":\"27.40\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"d77cdf5585b51f60954d40e76786e20f\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(24,'96b9068d-5554-4c16-ade0-507caae3b22c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_tag_index`(`tag`)\",\"time\":\"20.14\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"0bdb35d17e876d6225a7774a2c17647d\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(25,'96b9068d-75f0-48f4-a883-e6cdccf2064f','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add constraint `telescope_entries_tags_entry_uuid_foreign` foreign key (`entry_uuid`) references `telescope_entries` (`uuid`) on delete cascade\",\"time\":\"82.82\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"662a818f80a3a9ba2570081fd7a6af2f\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(26,'96b9068d-7e9a-49e7-a517-0dd0311afb21','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_monitoring` (`tag` varchar(191) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"21.22\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"88f0c31d036f95c144b2633daa82c5dd\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(27,'96b9068d-800d-45de-af4d-a26ecfa7c796','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_08_08_100000_create_telescope_entries_table\', 1)\",\"time\":\"2.84\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(28,'96b9068d-8dce-4783-89d1-f34344fb6224','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `languages` (`id` int unsigned not null auto_increment primary key, `name` varchar(191) null, `language` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"33.48\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"d90ba0f4d0e87867f436ebad62be8d45\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(29,'96b9068d-9489-448e-ade7-49075dae3110','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `languages` where (`language` = \'en\') limit 1\",\"time\":\"3.12\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"166af98fcd29ca07e5e173cff577d4e5\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(30,'96b9068d-96b9-4eda-b443-e43d41a99010','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `languages` (`language`, `updated_at`, `created_at`) values (\'en\', \'2022-07-07 17:17:10\', \'2022-07-07 17:17:10\')\",\"time\":\"2.77\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"c6520378112bf8cc4035545ad8b1fd89\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(31,'96b9068d-978c-4a9e-b2a7-707ee64bd196','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'model','{\"action\":\"created\",\"model\":\"JoeDixon\\\\Translation\\\\Language:1\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(32,'96b9068d-9967-4aef-98d8-0b2795be5eab','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_08_29_200844_create_languages_table\', 1)\",\"time\":\"3.18\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(33,'96b9068d-a995-4d4c-acc3-63420d54af82','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `translations` (`id` int unsigned not null auto_increment primary key, `language_id` int unsigned not null, `group` varchar(191) null, `key` text not null, `value` text null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"35.96\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"e71c3fbde761deebde3079465dad5e41\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(34,'96b9068d-bdd7-4fa8-8e50-8bef2fe3b840','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `translations` add constraint `translations_language_id_foreign` foreign key (`language_id`) references `languages` (`id`)\",\"time\":\"50.85\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"4297123f8d3a69fa0b9b5892f619dc42\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(35,'96b9068d-c082-4dbd-b857-a6b2c97495de','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_08_29_205156_create_translations_table\', 1)\",\"time\":\"5.39\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(36,'96b9068d-cdf5-49d1-bb75-9d39a152f95d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `failed_jobs` (`id` bigint unsigned not null auto_increment primary key, `uuid` varchar(191) not null, `connection` text not null, `queue` text not null, `payload` longtext not null, `exception` longtext not null, `failed_at` timestamp default CURRENT_TIMESTAMP not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"32.07\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2019_08_19_000000_create_failed_jobs_table.php\",\"line\":24,\"hash\":\"7f1d4016d372055f7fe1458e51a9836b\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(37,'96b9068d-d731-4457-a47d-ff301c0f7e1f','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `failed_jobs` add unique `failed_jobs_uuid_unique`(`uuid`)\",\"time\":\"22.80\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2019_08_19_000000_create_failed_jobs_table.php\",\"line\":24,\"hash\":\"f851653a45d1f2394473d70db5636fd3\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(38,'96b9068d-d8a9-4de4-a658-aaea25ab551c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2019_08_19_000000_create_failed_jobs_table\', 1)\",\"time\":\"2.46\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(39,'96b9068d-f922-4dd3-aef5-baa7e521bb76','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `personal_access_tokens` (`id` bigint unsigned not null auto_increment primary key, `tokenable_type` varchar(191) not null, `tokenable_id` bigint unsigned not null, `name` varchar(191) not null, `token` varchar(64) not null, `abilities` text null, `last_used_at` timestamp null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"80.96\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2019_12_14_000001_create_personal_access_tokens_table.php\",\"line\":24,\"hash\":\"907b72da0e86de4c80a09064db35e733\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(40,'96b9068e-03c0-408e-b393-a78009523dc9','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `personal_access_tokens` add index `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`)\",\"time\":\"26.10\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2019_12_14_000001_create_personal_access_tokens_table.php\",\"line\":24,\"hash\":\"23e16d13faedc7fd756b258a984d3cad\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(41,'96b9068e-0ed0-4d90-896d-50db59f5d68c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `personal_access_tokens` add unique `personal_access_tokens_token_unique`(`token`)\",\"time\":\"27.36\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2019_12_14_000001_create_personal_access_tokens_table.php\",\"line\":24,\"hash\":\"6d0025967d6eebfcb6fddf6dcb6ed14c\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(42,'96b9068e-1072-46b8-b530-24fc6b5eb21d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2019_12_14_000001_create_personal_access_tokens_table\', 1)\",\"time\":\"2.97\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(43,'96b9068e-298a-46d1-a055-56e6de009973','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `permissions` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `guard_name` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"61.75\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":28,\"hash\":\"943d0cba252f3c1eb856b525af7aa8c2\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:10'),(44,'96b9068e-3bb6-4cbd-aac4-fc9761df4125','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `roles` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `guard_name` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"44.59\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":35,\"hash\":\"7f53347312ebbe4f1fe0f45eb6c72d29\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(45,'96b9068e-42ae-4177-8e8b-926c9bd70350','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `model_has_permissions` (`permission_id` bigint unsigned not null, `model_type` varchar(191) not null, `model_id` bigint unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"16.00\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":51,\"hash\":\"109a9980cbdfab75641897282fe657f6\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(46,'96b9068e-4d26-4dc3-bdc5-e0df541d19d4','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_permissions` add index `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`)\",\"time\":\"25.79\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":51,\"hash\":\"799c3262f33663c6bf50078fe1c8ce02\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(47,'96b9068e-7725-414e-9981-848daa3549ef','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_permissions` add constraint `model_has_permissions_permission_id_foreign` foreign key (`permission_id`) references `permissions` (`id`) on delete cascade\",\"time\":\"106.82\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":51,\"hash\":\"2c922be382fed48d8023537e84ccdd66\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(48,'96b9068e-89c2-453b-96a3-12e16543c94b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_permissions` add primary key `model_has_permissions_permission_model_type_primary`(`permission_id`, `model_id`, `model_type`)\",\"time\":\"46.73\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":51,\"hash\":\"49037d8660ba17245bd921fd2a2cc676\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(49,'96b9068e-912a-4e79-b8a0-493747b44e42','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `model_has_roles` (`role_id` bigint unsigned not null, `model_type` varchar(191) not null, `model_id` bigint unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"17.35\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":67,\"hash\":\"9f4e3403d563a9303f83b365753c89de\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(50,'96b9068e-9996-43f1-8f6c-7cb5be538442','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_roles` add index `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`)\",\"time\":\"20.75\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":67,\"hash\":\"b5fc483eb06997eadd0a189cdb6820fd\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(51,'96b9068e-baca-4b96-a5b2-8f09d335d893','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_roles` add constraint `model_has_roles_role_id_foreign` foreign key (`role_id`) references `roles` (`id`) on delete cascade\",\"time\":\"84.37\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":67,\"hash\":\"13a9f5419fe9cfd65c84f44a9af8aebe\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(52,'96b9068e-cb79-4172-b675-004857b6b7e6','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `model_has_roles` add primary key `model_has_roles_role_model_type_primary`(`role_id`, `model_id`, `model_type`)\",\"time\":\"41.79\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":67,\"hash\":\"1f469fb7744bab9d57e2a117ea8e85e9\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(53,'96b9068e-d4ef-452b-b292-c65a47bcce7b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `role_has_permissions` (`permission_id` bigint unsigned not null, `role_id` bigint unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"22.12\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":84,\"hash\":\"6d68419d82530d4983920098d7b350e2\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(54,'96b9068e-f16f-4b1d-a5c1-b039c849b276','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `role_has_permissions` add constraint `role_has_permissions_permission_id_foreign` foreign key (`permission_id`) references `permissions` (`id`) on delete cascade\",\"time\":\"72.29\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":84,\"hash\":\"09327a2ff7df4421191b9fdf2a1cce9e\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(55,'96b9068f-0885-4892-8729-cd4813ea2057','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `role_has_permissions` add constraint `role_has_permissions_role_id_foreign` foreign key (`role_id`) references `roles` (`id`) on delete cascade\",\"time\":\"58.34\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":84,\"hash\":\"4ad12bf8366b7b214265d1ff60544e17\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(56,'96b9068f-1a0b-40de-878a-29b04d4633ce','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `role_has_permissions` add primary key `role_has_permissions_permission_id_role_id_primary`(`permission_id`, `role_id`)\",\"time\":\"43.81\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_20_232730_create_permission_tables.php\",\"line\":84,\"hash\":\"81edd4146b829a569e123fa43e8c9f01\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(57,'96b9068f-1c68-4a83-ba8e-d77470d46caf','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_20_232730_create_permission_tables\', 1)\",\"time\":\"3.90\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(58,'96b9068f-299b-49b9-ae2f-a98d75526487','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `categories` (`id` bigint unsigned not null auto_increment primary key, `parent_id` int null, `name` varchar(191) not null, `image` varchar(191) null, `status` enum(\'enable\', \'disable\') not null default \'enable\', `description` text not null, `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"31.89\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000001_create_categories_table.php\",\"line\":26,\"hash\":\"823241ef7042b4cb3a3dee3c3c437525\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(59,'96b9068f-2cc1-4623-943a-d8528c5c0306','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000001_create_categories_table\', 1)\",\"time\":\"5.71\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(60,'96b9068f-3f56-4d03-8fcb-cd42db934ebd','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `shop_categories` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `image` varchar(191) null, `status` enum(\'enable\', \'disable\') not null default \'enable\', `description` text not null, `parent_id` int null, `shop_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"39.33\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000002_create_shop_categories_table.php\",\"line\":26,\"hash\":\"579cb73f13caddb4db8e8089826d241c\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(61,'96b9068f-41d9-4a9a-8ec7-898847bd2942','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000002_create_shop_categories_table\', 1)\",\"time\":\"4.41\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(62,'96b9068f-4e4c-4c19-a27d-a782a22c0714','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `category_shop` (`category_id` bigint unsigned not null, `shop_id` bigint unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"26.04\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000003_create_category_shop_table.php\",\"line\":19,\"hash\":\"83a2fdec689a9c792eee3c23c0724c1f\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(63,'96b9068f-51a5-4a67-a7a7-898e2399f0e0','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000003_create_category_shop_table\', 1)\",\"time\":\"6.43\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(64,'96b9068f-74bd-4f52-8ba4-bf8d7a24ca50','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `notice_boards` (`id` bigint unsigned not null auto_increment primary key, `notice_boardable_id` bigint unsigned not null, `notice_boardable_type` varchar(191) not null, `title` varchar(191) null, `notice` text null, `note` varchar(191) null, `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"87.34\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000004_create_notice_boards_table.php\",\"line\":29,\"hash\":\"620fe434b0e2ed2c4f4439f4583607c4\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(65,'96b9068f-8254-4504-817b-01e524cbd9b8','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notice_boards` add index `notice_boards_notice_boardable_id_index`(`notice_boardable_id`)\",\"time\":\"33.87\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000004_create_notice_boards_table.php\",\"line\":29,\"hash\":\"6d861599451f7914a7ccc19f3e83712b\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(66,'96b9068f-90a6-4eaf-8bbb-01c6e2e2a6ad','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notice_boards` add index `notice_boards_notice_boardable_type_index`(`notice_boardable_type`)\",\"time\":\"35.59\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000004_create_notice_boards_table.php\",\"line\":29,\"hash\":\"5ab233a2afca775ea0b77c0e13ce1f53\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(67,'96b9068f-9386-462a-a1c8-27091cc09e7e','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000004_create_notice_boards_table\', 1)\",\"time\":\"6.18\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(68,'96b9068f-a1a4-47b9-8430-7f2dd6b859c1','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `addon_product` (`product_id` bigint unsigned not null, `addon_id` bigint unsigned not null, `price` decimal(8, 2) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"34.40\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000005_create_addon_product_table.php\",\"line\":20,\"hash\":\"03c1a963b61016fa9d4afdfcd3d54dbe\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(69,'96b9068f-a350-44a7-acbb-c8806707e6ef','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000005_create_addon_product_table\', 1)\",\"time\":\"3.28\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(70,'96b9068f-b11f-4070-b7df-f0ed81c462f8','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `variants` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `status` enum(\'enable\', \'disable\') not null default \'enable\', `shop_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"33.92\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000006_create_variants_table.php\",\"line\":23,\"hash\":\"0a1ab600b863663a236f02378740b4ef\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(71,'96b9068f-b421-4397-9fbb-b2d4b68f3e07','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000006_create_variants_table\', 1)\",\"time\":\"5.72\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:11'),(72,'96b9068f-c6c1-44e6-a685-d05235259f4b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `shop_infos` (`id` bigint unsigned not null auto_increment primary key, `shop_id` bigint unsigned not null, `shop_phone` varchar(191) not null, `shop_email` varchar(191) not null, `name` varchar(191) not null, `default_banner` varchar(191) null, `description` text not null, `offer_min_amount` decimal(8, 2) null, `offer_percent` decimal(8, 2) null, `commission` decimal(8, 2) null, `estimated_delivery_charge` decimal(8, 2) null, `estimated_delivery_time` int null, `address` varchar(191) not null, `position` varchar(191) null, `latitude` double(10, 8) null, `longitude` double(11, 8) null, `maps_address` text not null, `pure_veg` tinyint(1) not null, `popular` tinyint(1) not null, `status` enum(\'active\', \'holiday\', \'close\', \'banned\') not null default \'close\', `rating_status` tinyint(1) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"44.76\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000007_create_shop_infos_table.php\",\"line\":40,\"hash\":\"1b8befbc12cbf397de1fa81c735c6400\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(73,'96b9068f-d49d-4ff8-9051-06d18ca74918','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `shop_infos` add unique `shop_infos_shop_id_unique`(`shop_id`)\",\"time\":\"34.51\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000007_create_shop_infos_table.php\",\"line\":40,\"hash\":\"70a6bb8136711d9e2999b3712c8d2b25\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(74,'96b9068f-d6db-4782-9620-8a8114ba6a07','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000007_create_shop_infos_table\', 1)\",\"time\":\"4.53\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(75,'96b9068f-e875-49b9-bd79-aa07cf1b8d05','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `product_variants` (`id` bigint unsigned not null auto_increment primary key, `product_id` bigint unsigned not null, `type` varchar(191) not null default \'default\', `variant_id` bigint unsigned not null, `status` enum(\'enable\', \'disable\') not null default \'enable\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"42.70\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000008_create_product_variants_table.php\",\"line\":25,\"hash\":\"f17a635bb19dc713b17b1dc71236d00e\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(76,'96b9068f-ea5c-45ae-9357-9f8698578e2c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000008_create_product_variants_table\', 1)\",\"time\":\"3.79\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(77,'96b90690-0df3-4242-85b5-125c3f48eb9c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `product_prices` (`id` bigint unsigned not null auto_increment primary key, `product_variant_id` bigint unsigned null, `price` decimal(8, 2) not null default \'0\', `discount_price` decimal(8, 2) not null default \'0\', `orignal_price` decimal(8, 2) not null default \'0\', `currency` varchar(3) not null, `discount` tinyint(1) not null default \'0\', `discount_type` enum(\'percentage\', \'amount\') not null default \'percentage\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"86.46\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000009_create_product_prices_table.php\",\"line\":30,\"hash\":\"99f2cc710f87d5b6112c31919ffc693a\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(78,'96b90690-0fc1-47ca-9a90-dbad0e88198a','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000009_create_product_prices_table\', 1)\",\"time\":\"3.58\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(79,'96b90690-1bd4-4fcc-8176-3ae121a73bbc','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `user_addresses` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned not null, `position` varchar(191) null, `building` varchar(191) null, `city` varchar(191) null, `state` varchar(191) null, `country` varchar(191) null, `pincode` varchar(191) null, `landmark` varchar(191) null, `map_address` varchar(191) not null, `latitude` double(10, 8) null, `longitude` double(11, 8) null, `type` varchar(191) not null, `default` tinyint(1) not null default \'0\', `deleted_at` timestamp null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"28.25\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000010_create_user_addresses_table.php\",\"line\":34,\"hash\":\"bd6a7151817ea1640ddac198cf8ba4c2\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(80,'96b90690-1fa3-42ba-916d-bb76c6a26157','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000010_create_user_addresses_table\', 1)\",\"time\":\"7.66\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(81,'96b90690-3a53-4308-89b6-7e2b5f69450f','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `admins` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `email` varchar(191) not null, `password` varchar(191) not null, `remember_token` varchar(191) null, `status` enum(\'enable\', \'disable\') not null default \'enable\', `email_verified_at` timestamp null, `phone` varchar(191) null, `otp` int null, `image` varchar(191) null, `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"62.46\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000011_create_admins_table.php\",\"line\":30,\"hash\":\"6d455a8a8edc163fea94aa051f318445\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(82,'96b90690-49fa-4f33-842c-ab95cd09333f','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `admins` add unique `admins_email_unique`(`email`)\",\"time\":\"39.05\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000011_create_admins_table.php\",\"line\":30,\"hash\":\"7929408b0f07946ddca4910aaeefa82d\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(83,'96b90690-4bee-4959-92b5-e9a5bcf8a969','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000011_create_admins_table\', 1)\",\"time\":\"4.03\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(84,'96b90690-6113-42a4-a5b4-c74b30bf29e7','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `documentables` (`document_id` bigint unsigned not null, `documentable_id` bigint unsigned not null, `documentable_type` varchar(191) not null, `file` varchar(191) null, `expire_at` timestamp not null, `status` enum(\'assessing\', \'active\', \'expired\') not null default \'assessing\') default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"50.94\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000012_create_documentables_table.php\",\"line\":26,\"hash\":\"1690566f7f66c0d5411e533e56ea7f53\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(85,'96b90690-6b1e-43ab-8773-f3bcdd3de8bd','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `documentables` add index `documentables_documentable_id_index`(`documentable_id`)\",\"time\":\"24.23\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000012_create_documentables_table.php\",\"line\":26,\"hash\":\"0006022eda5e3576e254a8fb84c768fd\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(86,'96b90690-73fc-4c06-8848-a78caf22bfba','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `documentables` add index `documentables_documentable_type_index`(`documentable_type`)\",\"time\":\"21.67\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000012_create_documentables_table.php\",\"line\":26,\"hash\":\"8296ab91c34fc43b355ef3cd770f20ca\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(87,'96b90690-75a3-44a5-8daa-b9edbd7fa95b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000012_create_documentables_table\', 1)\",\"time\":\"2.84\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(88,'96b90690-83a6-4a3d-9f97-39a3858608f1','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `documents` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `for` enum(\'partner\', \'shop\') not null default \'partner\', `status` enum(\'enable\', \'disable\') not null default \'enable\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"32.46\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000013_create_documents_table.php\",\"line\":24,\"hash\":\"2eaeea06dc136c457025ccdde91810fb\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(89,'96b90690-86e8-4b84-969c-86628176b194','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000013_create_documents_table\', 1)\",\"time\":\"6.02\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(90,'96b90690-b034-47fe-968c-1d2ce9c4817a','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `inqueries` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `email` varchar(191) not null, `phone` varchar(191) not null, `for` enum(\'partner\', \'shop\', \'promotional\') not null default \'partner\', `message` text not null, `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"102.73\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000014_create_inqueries_table.php\",\"line\":28,\"hash\":\"c1366ba578bc5d26aa39d35e0a619c04\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(91,'96b90690-b230-4dad-8fdd-13e3c1cbaef1','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000014_create_inqueries_table\', 1)\",\"time\":\"4.13\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(92,'96b90690-ca10-416f-91da-c70746eda4d7','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `promocodes` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `description` text null, `promo_code` varchar(191) not null, `percentage` decimal(8, 2) not null, `max_amount` decimal(8, 2) not null, `expire_at` timestamp null, `status` enum(\'enable\', \'disable\') not null default \'enable\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"54.27\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000015_create_promocodes_table.php\",\"line\":28,\"hash\":\"200ec74f70bdf016b45628ff3c6c2be8\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(93,'96b90690-cc78-4a17-851a-d9cfbea96a74','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000015_create_promocodes_table\', 1)\",\"time\":\"4.81\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(94,'96b90690-de5a-4ed4-b7ad-83864aba2a01','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `favouriteables` (`user_id` bigint unsigned not null, `favouriteable_id` bigint unsigned not null, `favouriteable_type` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"41.74\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000016_create_favouriteables_table.php\",\"line\":25,\"hash\":\"80cfee8d57a826bffa249ca6e18d9447\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(95,'96b90690-e51b-4ba1-b810-d8e46f831881','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `favouriteables` add index `favouriteables_favouriteable_id_index`(`favouriteable_id`)\",\"time\":\"16.40\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000016_create_favouriteables_table.php\",\"line\":25,\"hash\":\"eb5acd7fee160130c060b0730e980927\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(96,'96b90690-eb52-491d-8b46-acc32361184e','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `favouriteables` add index `favouriteables_favouriteable_type_index`(`favouriteable_type`)\",\"time\":\"15.16\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000016_create_favouriteables_table.php\",\"line\":25,\"hash\":\"835100cb2a9211296324ece322288896\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(97,'96b90690-ecc1-4841-ad00-37ae2dedcf67','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000016_create_favouriteables_table\', 1)\",\"time\":\"2.51\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(98,'96b90691-0b95-4c08-9f10-be3a20e7e176','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `products` (`id` bigint unsigned not null auto_increment primary key, `shop_category_id` bigint unsigned not null, `name` varchar(191) not null, `description` text not null, `shop_id` bigint unsigned not null, `position` int null, `serving` int null, `food_type` enum(\'veg\', \'non-veg\') not null default \'veg\', `avalability` int not null, `max_quantity` int not null, `featured` tinyint(1) not null, `addon_status` tinyint(1) not null default \'0\', `variant_status` tinyint(1) not null default \'0\', `out_of_stock` enum(\'no\', \'yes\') not null default \'no\', `status` enum(\'enable\', \'disable\') not null default \'enable\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"75.20\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000017_create_products_table.php\",\"line\":35,\"hash\":\"02b2eca4d2d27e7d58f337a755fb6489\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(99,'96b90691-0d5d-42fd-86c3-680dab744af3','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000017_create_products_table\', 1)\",\"time\":\"3.16\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(100,'96b90691-1c6d-4ec0-a0cd-5d03c11730ae','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `addons` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `shop_id` bigint unsigned not null, `parent_id` int null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"36.15\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000018_create_addons_table.php\",\"line\":23,\"hash\":\"fc92127c6c70fe440140f6876bd63a71\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(101,'96b90691-1dad-4310-a4d5-dd9fdc34598c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000018_create_addons_table\', 1)\",\"time\":\"2.18\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(102,'96b90691-2e15-4621-ba04-a7041e3717e8','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `cart_products` (`id` bigint unsigned not null auto_increment primary key, `cart_id` bigint unsigned not null, `product_variant_id` bigint unsigned not null, `product_price_id` bigint unsigned not null, `product_id` bigint unsigned not null, `note` text null, `total_price` decimal(8, 2) not null default \'0\', `addon_price` decimal(8, 2) null default \'0\', `quantity` int not null default \'1\', `save_for_later` tinyint(1) not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"39.54\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000019_create_cart_products_table.php\",\"line\":29,\"hash\":\"3f335f82a8d353c144edf5bf4c02dd67\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(103,'96b90691-2fe1-4f98-9d99-123ae4a06720','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000019_create_cart_products_table\', 1)\",\"time\":\"3.51\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(104,'96b90691-3d88-4e22-b33f-6541389a1716','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `cart_addons` (`id` bigint unsigned not null auto_increment primary key, `cart_product_id` bigint unsigned not null, `quantity` int not null, `addon_product_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"33.07\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000020_create_cart_addons_table.php\",\"line\":23,\"hash\":\"940136c61ef7a590748410876382437e\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(105,'96b90691-3f2a-4a5d-a466-85df8af4d876','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000020_create_cart_addons_table\', 1)\",\"time\":\"2.97\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:12'),(106,'96b90691-4c54-41e4-a771-900548ec87f7','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `partner_vehicles` (`id` bigint unsigned not null auto_increment primary key, `partner_id` bigint unsigned not null, `vehicle_no` varchar(191) not null, `vehicle_type` varchar(191) not null, `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"31.47\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000021_create_partner_vehicles_table.php\",\"line\":24,\"hash\":\"faa8932a5a690f0e96fbc7c93e4c766c\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(107,'96b90691-4dfa-4bff-9aff-9ef21737dd97','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000021_create_partner_vehicles_table\', 1)\",\"time\":\"3.18\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(108,'96b90691-6083-4aed-b461-204e52b4cc89','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `orders` (`id` bigint unsigned not null auto_increment primary key, `invoice_id` varchar(191) null, `user_id` bigint unsigned not null, `user_address_id` bigint unsigned not null, `shop_id` bigint unsigned null, `partner_id` bigint unsigned null, `partner_vehicle_id` bigint unsigned null, `note` varchar(191) null, `route_key` text null, `order_type` enum(\'DINEIN\', \'DELIVERY\', \'TAKEAWAY\') not null default \'DELIVERY\', `dispute` enum(\'NODISPUTE\', \'CREATED\', \'RESOLVE\') not null default \'NODISPUTE\', `cancel_by` enum(\'USER\', \'SHOP\', \'PARTNER\') null, `cancel_note` varchar(191) null, `delivery_date` timestamp not null, `order_otp` int not null, `order_ready_time` int null, `order_ready_status` tinyint(1) not null default \'0\', `status` enum(\'ORDERED\', \'RECEIVED\', \'CANCELLED\', \'ASSIGNED\', \'PROCESSING\', \'READY\', \'SEARCHING\', \'ARRIVED\', \'PICKEDUP\', \'REACHED\', \'COMPLETED\') not null default \'ORDERED\', `schedule_status` tinyint(1) null default \'0\', `schedule_at` timestamp null, `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"44.10\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000022_create_orders_table.php\",\"line\":63,\"hash\":\"03512b38898db98ca1a95bbe0bc942d9\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(109,'96b90691-620c-410d-be52-b3962dc445f8','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000022_create_orders_table\', 1)\",\"time\":\"2.91\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(110,'96b90691-7d2f-4071-9246-9b4de5c45ee2','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `order_invoices` (`id` bigint unsigned not null auto_increment primary key, `order_id` bigint unsigned not null, `quantity` int not null, `paid` tinyint(1) not null default \'0\', `gross` decimal(8, 2) not null default \'0\', `discount` decimal(8, 2) not null default \'0\', `delivery_charge` decimal(8, 2) not null default \'0\', `payable` decimal(8, 2) not null default \'0\', `commission` decimal(8, 2) not null default \'0\', `commission_per` decimal(8, 2) not null default \'0\', `tax` decimal(8, 2) not null default \'0\', `tax_percent` decimal(8, 2) not null default \'0\', `net` decimal(8, 2) not null default \'0\', `total_pay` decimal(8, 2) not null default \'0\', `is_partial` tinyint(1) not null default \'0\', `wallet` decimal(8, 2) not null default \'0\', `tips` decimal(8, 2) not null default \'0\', `payment_mode` enum(\'CASH\', \'CARD\', \'PAYPAL\', \'PAYTM\') not null default \'CASH\', `DestinationTag` varchar(191) not null, `payment_id` varchar(191) null, `status` enum(\'pending\', \'processing\', \'failed\', \'success\') not null default \'pending\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"66.47\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000023_create_order_invoices_table.php\",\"line\":45,\"hash\":\"6bca9d0313b87aa075517e337d7f2236\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(111,'96b90691-7f16-4d6c-ab34-70b8b500e4ee','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000023_create_order_invoices_table\', 1)\",\"time\":\"3.63\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(112,'96b90691-9061-4cea-9003-56fcaaf1c466','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `order_ratings` (`id` bigint unsigned not null auto_increment primary key, `order_id` bigint unsigned not null, `user_id` bigint unsigned null, `user_rating` int null, `user_comment` varchar(191) null, `partner_id` bigint unsigned null, `partner_rating` int null, `partner_comment` varchar(191) null, `shop_id` bigint unsigned null, `shop_rating` int null, `shop_comment` varchar(191) null, `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"39.13\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000024_create_order_ratings_table.php\",\"line\":31,\"hash\":\"7d8395cb1380bdaa39b8f15b813e847e\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(113,'96b90691-92dc-4cad-b7cd-b51b7f7053aa','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000024_create_order_ratings_table\', 1)\",\"time\":\"4.89\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(114,'96b90691-a36b-4c14-874f-7cbc2d53c846','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `carts` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned not null, `shop_id` bigint unsigned not null, `user_address_id` bigint unsigned null, `promocode_id` bigint unsigned null, `order_id` bigint unsigned null, `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"35.33\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000025_create_carts_table.php\",\"line\":26,\"hash\":\"4345ede8599aa34c0d8f5858416e4156\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(115,'96b90691-a52b-4be7-82a9-eeff70216450','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000025_create_carts_table\', 1)\",\"time\":\"3.37\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(116,'96b90691-b42a-46cc-b336-358ecdb4dfc9','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `order_disputes` (`id` bigint unsigned not null auto_increment primary key, `reason_id` bigint unsigned not null, `order_id` bigint unsigned not null, `type` varchar(191) not null, `created_by` enum(\'user\', \'shop\', \'partner\') not null default \'user\', `created_to` enum(\'user\', \'shop\', \'partner\', \'dispatcher\') not null default \'user\', `status` enum(\'assessing\', \'refund\', \'resolve\', \'closed\') not null default \'assessing\', `description` text not null, `refund` decimal(8, 2) not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"31.12\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000026_create_order_disputes_table.php\",\"line\":32,\"hash\":\"b58efc68089628ed8a11b805aaf2f19d\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(117,'96b90691-b64a-4248-886c-c09209e76b02','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000026_create_order_disputes_table\', 1)\",\"time\":\"3.46\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(118,'96b90691-c569-4440-abc5-c84e8369fb57','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `reasons` (`id` bigint unsigned not null auto_increment primary key, `message` text not null, `for` enum(\'order\', \'partner\', \'dispute\') not null default \'order\', `type` enum(\'CANCELLED\', \'COMPLAINED\', \'REFUND\', \'REASSIGN\') not null default \'CANCELLED\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"31.75\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000027_create_reasons_table.php\",\"line\":33,\"hash\":\"b92eed66894b89e8b1aa6a744a8785e8\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(119,'96b90691-c6d1-4d99-b055-1f3a0d13d7d4','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000027_create_reasons_table\', 1)\",\"time\":\"2.59\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(120,'96b90691-d700-4b3c-ba83-0863c268b6af','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `order_dispute_comments` (`id` bigint unsigned not null auto_increment primary key, `admin_id` bigint unsigned not null, `order_dispute_id` bigint unsigned not null, `description` text not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"37.75\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000028_create_order_dispute_comments_table.php\",\"line\":23,\"hash\":\"6fd91a3ff5c9c1edd95156b91b83f020\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(121,'96b90691-d8b6-4517-ab91-605e7bd641eb','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000028_create_order_dispute_comments_table\', 1)\",\"time\":\"2.86\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(122,'96b90691-e276-4949-bfff-cb3482bf6a26','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `promocodeables` (`promocode_id` bigint unsigned not null, `promocodeable_id` bigint unsigned not null, `promocodeable_type` varchar(191) not null, `status` enum(\'ADDED\', \'USED\', \'EXPIRED\') not null default \'ADDED\') default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"21.87\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000029_create_promocodeables_table.php\",\"line\":26,\"hash\":\"2f91f9bc786562ba1c5c4ea466134240\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(123,'96b90691-fc6e-4204-acc1-a5ff1778a200','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `promocodeables` add index `promocodeables_promocodeable_id_index`(`promocodeable_id`)\",\"time\":\"65.72\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000029_create_promocodeables_table.php\",\"line\":26,\"hash\":\"09e0c7230ba5a291eda536682d0f815e\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(124,'96b90692-03bc-4d85-895e-66d2c6358b6b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `promocodeables` add index `promocodeables_promocodeable_type_index`(`promocodeable_type`)\",\"time\":\"17.75\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000029_create_promocodeables_table.php\",\"line\":26,\"hash\":\"afd876f59ec93fd12f2c2e176c822085\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(125,'96b90692-071f-4a04-ba7e-10abedb50001','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000029_create_promocodeables_table\', 1)\",\"time\":\"7.54\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(126,'96b90692-12d9-4052-9ec8-71a2eb5c9d1b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `devices` (`id` bigint unsigned not null auto_increment primary key, `deviceable_id` bigint unsigned not null, `deviceable_type` varchar(191) not null, `type` enum(\'web\', \'android\', \'ios\') not null default \'web\', `device_token` varchar(191) not null, `latitude` double(10, 8) null, `longitude` double(11, 8) null, `device_type` varchar(191) not null default \'0\', `os_player_id` varchar(191) null, `is_active` tinyint(1) not null default \'1\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"28.15\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000030_create_devices_table.php\",\"line\":31,\"hash\":\"46638f26e19230708b004fd0de6638fe\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(127,'96b90692-2579-40bb-acde-633085e61f1f','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `devices` add index `devices_deviceable_id_index`(`deviceable_id`)\",\"time\":\"46.81\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000030_create_devices_table.php\",\"line\":31,\"hash\":\"4eb4d3da782242285ddd9a6122a52922\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(128,'96b90692-3597-4915-810d-17a737b9ddb7','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `devices` add index `devices_deviceable_type_index`(`deviceable_type`)\",\"time\":\"40.12\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000030_create_devices_table.php\",\"line\":31,\"hash\":\"79b7e8973c2b56a877574c2c06b744f9\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(129,'96b90692-37fe-4e9d-b92c-bf9f746dcefb','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000030_create_devices_table\', 1)\",\"time\":\"4.32\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(130,'96b90692-4847-47ee-b5cb-e7230fc1adc0','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `images` (`id` bigint unsigned not null auto_increment primary key, `imageable_id` bigint unsigned not null, `imageable_type` varchar(191) not null, `image` varchar(191) null, `status` enum(\'enable\', \'disable\') not null default \'enable\', `position` int not null, `default` tinyint(1) not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"38.62\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000031_create_images_table.php\",\"line\":29,\"hash\":\"fa8d3cb811183fce0abf09bfc361e426\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(131,'96b90692-54c1-48bf-bfe3-15000e960971','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `images` add index `images_imageable_id_index`(`imageable_id`)\",\"time\":\"30.80\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000031_create_images_table.php\",\"line\":29,\"hash\":\"7cac020c8d467faff6fe28f083457c4d\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(132,'96b90692-5f1c-4f3d-af9c-ce9184505ada','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `images` add index `images_imageable_type_index`(`imageable_type`)\",\"time\":\"25.40\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000031_create_images_table.php\",\"line\":29,\"hash\":\"5c96a94df086a3fc8d13e0fb321a0843\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(133,'96b90692-60d5-4331-8564-572155abe0c9','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000031_create_images_table\', 1)\",\"time\":\"3.22\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(134,'96b90692-6aa5-4ab5-ab82-f014e2824cd5','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `shops` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `email` varchar(191) not null, `phone` varchar(191) not null, `otp` int null, `password` varchar(191) not null, `email_verified_at` timestamp null, `remember_token` varchar(191) null, `status` enum(\'enable\', \'disable\') not null default \'enable\', `image` varchar(191) null, `wallet_balance` decimal(8, 2) not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"21.12\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000032_create_shops_table.php\",\"line\":30,\"hash\":\"a569dddfac7edf4401d2e8bc76f04ec6\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(135,'96b90692-77b7-4f8f-9e6a-8f0524739347','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `shops` add unique `shops_email_unique`(`email`)\",\"time\":\"32.31\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000032_create_shops_table.php\",\"line\":30,\"hash\":\"3006141ab21f8768ac4cd1d6fdd6a7f3\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(136,'96b90692-793c-4646-a5a3-dcb7f4fe6543','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000032_create_shops_table\', 1)\",\"time\":\"2.59\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(137,'96b90692-a067-43b2-873e-6b9bd0efa7d7','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `partners` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `email` varchar(191) not null, `phone` varchar(191) not null, `otp` int null, `password` varchar(191) not null, `remember_token` varchar(191) not null, `status` enum(\'assessing\', \'banned\', \'online\', \'offline\', \'riding\', \'unsettled\') not null default \'assessing\', `email_verified_at` timestamp null, `image` varchar(191) null, `wallet_balance` decimal(8, 2) not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"96.82\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000033_create_partners_table.php\",\"line\":39,\"hash\":\"6af3d878ddf68e30529082a47a762c58\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(138,'96b90692-ae2d-4ebf-835c-ea67531d4cf0','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `partners` add unique `partners_email_unique`(`email`)\",\"time\":\"34.42\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000033_create_partners_table.php\",\"line\":39,\"hash\":\"e7f4ba52779220d51fe61851d71876fa\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(139,'96b90692-be15-434a-ba6a-1949761637d3','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `partners` add unique `partners_phone_unique`(`phone`)\",\"time\":\"37.63\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000033_create_partners_table.php\",\"line\":39,\"hash\":\"8ef1f967537c942443729789d097b1e8\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(140,'96b90692-c08a-4e0d-ba2c-34cb844dde5d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000033_create_partners_table\', 1)\",\"time\":\"4.48\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:13'),(141,'96b90692-d5ef-4aa0-9bbd-aaa1177a589d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `shop_timings` (`id` bigint unsigned not null auto_increment primary key, `shop_id` bigint unsigned not null, `start_time` varchar(191) not null, `end_time` varchar(191) not null, `day` enum(\'ALL\', \'SUN\', \'MON\', \'TUE\', \'WED\', \'THU\', \'FRI\', \'SAT\') not null default \'ALL\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"48.79\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000034_create_shop_timings_table.php\",\"line\":35,\"hash\":\"645e3f6c11cfd2625b45b4457977e460\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(142,'96b90692-d802-4d5d-964c-e6e20def3109','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000034_create_shop_timings_table\', 1)\",\"time\":\"3.91\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(143,'96b90692-ecdd-40c0-b7d6-f96c082320ca','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `order_dispute_messages` (`id` bigint unsigned not null auto_increment primary key, `text` text not null, `image` varchar(191) null, `type` enum(\'text\', \'image\') not null default \'text\', `seen` tinyint(1) not null, `order_dispute_messageable_id` bigint unsigned not null, `order_dispute_messageable_type` varchar(191) not null, `order_dispute_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"51.49\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000035_create_order_dispute_messages_table.php\",\"line\":30,\"hash\":\"0377f8031aaa42e1e8c39ac3c82b5186\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(144,'96b90692-fa86-48ae-9577-baa7d8f9b486','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_dispute_messages` add index `order_dispute_messages_order_dispute_messageable_id_index`(`order_dispute_messageable_id`)\",\"time\":\"34.21\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000035_create_order_dispute_messages_table.php\",\"line\":30,\"hash\":\"6295de9bf510d0c3e53f7c2545a0eeb4\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(145,'96b90693-0b7c-472d-9e0d-a4020cd2c3e9','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_dispute_messages` add index `order_dispute_messages_order_dispute_messageable_type_index`(`order_dispute_messageable_type`)\",\"time\":\"42.63\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000035_create_order_dispute_messages_table.php\",\"line\":30,\"hash\":\"37c56ebaf2cd18e45d23e39443842e77\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(146,'96b90693-0d02-4d0b-8858-b8dbcaf241d1','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000035_create_order_dispute_messages_table\', 1)\",\"time\":\"2.76\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(147,'96b90693-2539-4cf2-b2f7-6e200cbfa80a','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `shifts` (`id` bigint unsigned not null auto_increment primary key, `start_at` timestamp not null, `end_at` timestamp null, `total_order` int not null default \'0\', `partner_id` bigint unsigned not null, `partner_vehicle_id` bigint unsigned not null, `due` decimal(8, 2) not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"59.12\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000036_create_shifts_table.php\",\"line\":27,\"hash\":\"e0222948692c38df8574e4facc49f494\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(148,'96b90693-272c-4846-a642-fba93c894d92','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000036_create_shifts_table\', 1)\",\"time\":\"3.57\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(149,'96b90693-36cd-4ed4-8e24-8e121f331d1b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `shift_timings` (`id` bigint unsigned not null auto_increment primary key, `shift_id` bigint unsigned not null, `order_count` int not null default \'0\', `start_time` timestamp not null, `end_time` timestamp null, `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"35.10\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000037_create_shift_timings_table.php\",\"line\":25,\"hash\":\"0b6197bc5b305d15f9e338cfacc233e1\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(150,'96b90693-389f-4fc8-87c8-edd9570cdea0','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000037_create_shift_timings_table\', 1)\",\"time\":\"3.69\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(151,'96b90693-48e1-48a4-b7de-35f754dc1c2f','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `social_accounts` (`id` bigint unsigned not null auto_increment primary key, `social_accountable_id` bigint unsigned not null, `social_accountable_type` varchar(191) not null, `provider_name` varchar(191) null, `provider_id` varchar(191) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"38.19\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000038_create_social_accounts_table.php\",\"line\":30,\"hash\":\"96e2f6f6f9652942b6b5fc602741fabc\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(152,'96b90693-5335-41a9-b97c-b8c7b3a8ae65','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `social_accounts` add index `social_accounts_social_accountable_id_index`(`social_accountable_id`)\",\"time\":\"25.24\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000038_create_social_accounts_table.php\",\"line\":30,\"hash\":\"86300ad5a9418dcfcc38a120e10a318c\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(153,'96b90693-5cb4-45bd-91d4-4f73e790fe52','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `social_accounts` add index `social_accounts_social_accountable_type_index`(`social_accountable_type`)\",\"time\":\"23.26\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000038_create_social_accounts_table.php\",\"line\":30,\"hash\":\"c5427ba1b3cdecc97fee0b6b6202ebd2\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(154,'96b90693-68d2-4176-a973-c5305b121c51','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `social_accounts` add unique `social_accounts_provider_id_unique`(`provider_id`)\",\"time\":\"30.24\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_000038_create_social_accounts_table.php\",\"line\":30,\"hash\":\"cb884b38387f9ed3c9137337e7c58f93\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(155,'96b90693-6adc-4d9f-8ec0-8e5a948f54de','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_000038_create_social_accounts_table\', 1)\",\"time\":\"4.23\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(156,'96b90693-6d81-4add-bc47-36010b0ce0f3','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009001_add_foreigns_to_categories_table\', 1)\",\"time\":\"5.48\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(157,'96b90693-953f-4184-a74a-1310904c0341','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `shop_categories` add constraint `shop_categories_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"99.53\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009002_add_foreigns_to_shop_categories_table.php\",\"line\":30,\"hash\":\"c06d472e271631bcedd4e365c0de5955\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(158,'96b90693-96b5-4683-a223-417b5447f423','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009002_add_foreigns_to_shop_categories_table\', 1)\",\"time\":\"2.83\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(159,'96b90693-be08-459a-af2c-5a8f70faff40','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `category_shop` add constraint `category_shop_category_id_foreign` foreign key (`category_id`) references `categories` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"99.30\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009003_add_foreigns_to_category_shop_table.php\",\"line\":30,\"hash\":\"4a3bdbbd96ee4579c04486e6e493a5dd\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(160,'96b90693-d74c-4aee-88f9-965cbdd8369c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `category_shop` add constraint `category_shop_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"63.97\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009003_add_foreigns_to_category_shop_table.php\",\"line\":30,\"hash\":\"c1568a92c0d1e463678e2797617de68f\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(161,'96b90693-d8f9-4252-875d-cf3c16df064b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009003_add_foreigns_to_category_shop_table\', 1)\",\"time\":\"3.21\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(162,'96b90693-fa40-4469-acf1-a1529a0707a4','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `addon_product` add constraint `addon_product_product_id_foreign` foreign key (`product_id`) references `products` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"83.47\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009004_add_foreigns_to_addon_product_table.php\",\"line\":30,\"hash\":\"8ad1a42c6e7deb44d88bd0f26fad3a5a\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(163,'96b90694-16dc-4d9a-9f07-54c117dbc788','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `addon_product` add constraint `addon_product_addon_id_foreign` foreign key (`addon_id`) references `addons` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"71.84\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009004_add_foreigns_to_addon_product_table.php\",\"line\":30,\"hash\":\"9a9e2e9facaabfe367967325545c4a2e\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(164,'96b90694-1910-434d-89fe-97e6b5213722','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009004_add_foreigns_to_addon_product_table\', 1)\",\"time\":\"4.26\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(165,'96b90694-33d3-4dd3-b8f5-028802be52c9','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `variants` add constraint `variants_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"66.42\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009005_add_foreigns_to_variants_table.php\",\"line\":23,\"hash\":\"f23001300edaf901cda2c47edbcfa5c9\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(166,'96b90694-3599-48cd-9853-6448a83c56cc','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009005_add_foreigns_to_variants_table\', 1)\",\"time\":\"3.39\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:14'),(167,'96b90694-5f6c-4dec-97b1-0c890e15373e','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `shop_infos` add constraint `shop_infos_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"104.98\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009006_add_foreigns_to_shop_infos_table.php\",\"line\":23,\"hash\":\"283d42305a89dd7a2141d13d63a8b799\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(168,'96b90694-61a6-4fcc-a2c8-bd43e676308d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009006_add_foreigns_to_shop_infos_table\', 1)\",\"time\":\"4.01\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(169,'96b90694-8959-4439-bbc9-b5cd2a2eac74','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `product_variants` add constraint `product_variants_product_id_foreign` foreign key (`product_id`) references `products` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"95.48\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009007_add_foreigns_to_product_variants_table.php\",\"line\":30,\"hash\":\"469088151b74a5e74998d62126941797\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(170,'96b90694-a0c4-40a7-8b90-411d585e137d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `product_variants` add constraint `product_variants_variant_id_foreign` foreign key (`variant_id`) references `variants` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"58.68\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009007_add_foreigns_to_product_variants_table.php\",\"line\":30,\"hash\":\"d62e44ee6e446f9ac9a9f6f5c0f5331f\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(171,'96b90694-a3f3-44d2-b049-93fdf22f08b0','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009007_add_foreigns_to_product_variants_table\', 1)\",\"time\":\"6.59\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(172,'96b90694-cea5-4c69-a7f8-daf8a72b0d1b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `product_prices` add constraint `product_prices_product_variant_id_foreign` foreign key (`product_variant_id`) references `product_variants` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"107.72\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009008_add_foreigns_to_product_prices_table.php\",\"line\":23,\"hash\":\"3a596bd8ed64b8cb1dd816a0e1aa63c8\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(173,'96b90694-d061-4920-b91c-5303023744e8','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009008_add_foreigns_to_product_prices_table\', 1)\",\"time\":\"3.44\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(174,'96b90694-f1cb-4982-96b6-e22fe5282466','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_addresses` add constraint `user_addresses_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"80.96\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009009_add_foreigns_to_user_addresses_table.php\",\"line\":23,\"hash\":\"529d6c02ca603d346377185893bbafab\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(175,'96b90694-f3a7-44a5-8789-b3fc67906158','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009009_add_foreigns_to_user_addresses_table\', 1)\",\"time\":\"3.88\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(176,'96b90695-0c72-4cc6-a491-375e303f2c08','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `documentables` add constraint `documentables_document_id_foreign` foreign key (`document_id`) references `documents` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"61.46\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009010_add_foreigns_to_documentables_table.php\",\"line\":23,\"hash\":\"cbefadaae8d999fbf87ab8057166d308\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(177,'96b90695-0dfd-45d3-a36a-c926779d76f4','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009010_add_foreigns_to_documentables_table\', 1)\",\"time\":\"2.62\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(178,'96b90695-2c3d-42ea-b3da-2e4fe11bbe2e','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `favouriteables` add constraint `favouriteables_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"74.68\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009011_add_foreigns_to_favouriteables_table.php\",\"line\":23,\"hash\":\"584fae43f4bbc480177db91cff08bda0\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(179,'96b90695-2e0d-4234-a3cf-10fcf118474d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009011_add_foreigns_to_favouriteables_table\', 1)\",\"time\":\"3.72\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(180,'96b90695-5e40-4f0f-a02f-2650c7a361ee','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `products` add constraint `products_shop_category_id_foreign` foreign key (`shop_category_id`) references `shop_categories` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"121.61\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009012_add_foreigns_to_products_table.php\",\"line\":30,\"hash\":\"cd169f0b9d234a87889d253fcfdfd29d\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(181,'96b90695-868d-4a6e-b9d4-a9def52e5001','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `products` add constraint `products_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"102.05\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009012_add_foreigns_to_products_table.php\",\"line\":30,\"hash\":\"bbd73cc8bd3a3c2acd063fa9812714e1\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(182,'96b90695-8893-4fce-a336-a6f2ed105f11','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009012_add_foreigns_to_products_table\', 1)\",\"time\":\"4.20\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(183,'96b90695-ab48-4b09-94bd-9e665e2b6501','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `addons` add constraint `addons_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"86.87\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009013_add_foreigns_to_addons_table.php\",\"line\":30,\"hash\":\"62d512fd5ba981bb7fc31494a022a264\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(184,'96b90695-ad62-4e8b-985d-291c9e8475a5','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009013_add_foreigns_to_addons_table\', 1)\",\"time\":\"4.46\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:15'),(185,'96b90695-eaf4-41ed-b795-2549693a6a13','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `cart_products` add constraint `cart_products_cart_id_foreign` foreign key (`cart_id`) references `carts` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"155.45\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009014_add_foreigns_to_cart_products_table.php\",\"line\":44,\"hash\":\"39ee353b543f0f1b2aa234da788387e6\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(186,'96b90696-04db-49b7-8b3a-bc715fff048d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `cart_products` add constraint `cart_products_product_variant_id_foreign` foreign key (`product_variant_id`) references `product_variants` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"65.25\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009014_add_foreigns_to_cart_products_table.php\",\"line\":44,\"hash\":\"a8b7558b1bd77e148ab99ea8352e30cb\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(187,'96b90696-243d-4c35-96e2-4c8f6f54c059','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `cart_products` add constraint `cart_products_product_price_id_foreign` foreign key (`product_price_id`) references `product_prices` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"79.56\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009014_add_foreigns_to_cart_products_table.php\",\"line\":44,\"hash\":\"256e19e913d0462b7e263d68df47faf2\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(188,'96b90696-5c3a-49d9-ae32-0b00b8a9a456','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `cart_products` add constraint `cart_products_product_id_foreign` foreign key (`product_id`) references `products` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"142.18\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009014_add_foreigns_to_cart_products_table.php\",\"line\":44,\"hash\":\"14c289885de8e46311b635cdc9714ec6\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(189,'96b90696-5dad-463c-87e3-8855996b4bc2','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009014_add_foreigns_to_cart_products_table\', 1)\",\"time\":\"2.62\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(190,'96b90696-7d4d-49d3-a08c-c19781075452','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `cart_addons` add constraint `cart_addons_cart_product_id_foreign` foreign key (`cart_product_id`) references `cart_products` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"78.21\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009015_add_foreigns_to_cart_addons_table.php\",\"line\":30,\"hash\":\"5b6ccd622266c20e048d380b88b7b6d8\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(191,'96b90696-9690-4473-9183-0a711712a24e','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `cart_addons` add constraint `cart_addons_addon_product_id_foreign` foreign key (`addon_product_id`) references `addon_product` (`addon_id`) on delete CASCADE on update CASCADE\",\"time\":\"63.44\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009015_add_foreigns_to_cart_addons_table.php\",\"line\":30,\"hash\":\"ae33ea4c47cdd4fec5eddf84ec1a3d0f\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(192,'96b90696-9850-485c-9071-4a6a409d8333','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009015_add_foreigns_to_cart_addons_table\', 1)\",\"time\":\"3.08\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(193,'96b90696-b855-4a94-af00-168745486d9b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `partner_vehicles` add constraint `partner_vehicles_partner_id_foreign` foreign key (`partner_id`) references `partners` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"78.89\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009016_add_foreigns_to_partner_vehicles_table.php\",\"line\":23,\"hash\":\"c70a787ad6ab693db0b73ec62be7e9e0\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(194,'96b90696-ba88-4a31-b2f7-22a96033d107','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009016_add_foreigns_to_partner_vehicles_table\', 1)\",\"time\":\"4.47\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(195,'96b90696-f786-43c6-85c0-30a7d35e2037','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `orders` add constraint `orders_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"154.64\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009017_add_foreigns_to_orders_table.php\",\"line\":51,\"hash\":\"fb8facd21155c6116fd8c32196b53479\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(196,'96b90697-1733-4ab1-838a-966fd723da3d','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `orders` add constraint `orders_user_address_id_foreign` foreign key (`user_address_id`) references `user_addresses` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"80.46\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009017_add_foreigns_to_orders_table.php\",\"line\":51,\"hash\":\"f42d725252ca64ab74a26899cb23f033\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(197,'96b90697-38ad-4ccc-b3d4-10fdbd5ffa36','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `orders` add constraint `orders_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"84.72\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009017_add_foreigns_to_orders_table.php\",\"line\":51,\"hash\":\"09a789b256cc72d6e5cc617461d24c28\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:16'),(198,'96b90697-6787-42c7-bfc6-a0b0168b1108','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `orders` add constraint `orders_partner_id_foreign` foreign key (`partner_id`) references `partners` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"119.08\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009017_add_foreigns_to_orders_table.php\",\"line\":51,\"hash\":\"5759c6ea0dfa25470431088003a90429\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(199,'96b90697-92c2-4110-a4fc-aedf9480f904','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `orders` add constraint `orders_partner_vehicle_id_foreign` foreign key (`partner_vehicle_id`) references `partner_vehicles` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"109.63\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009017_add_foreigns_to_orders_table.php\",\"line\":51,\"hash\":\"02a5e56d846e83f16ef8a6a26cf9c6e7\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(200,'96b90697-94c1-4567-930c-0b983cf03766','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009017_add_foreigns_to_orders_table\', 1)\",\"time\":\"4.00\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(201,'96b90697-b1a8-49a8-acc9-6002a54f4593','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_invoices` add constraint `order_invoices_order_id_foreign` foreign key (`order_id`) references `orders` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"69.84\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009018_add_foreigns_to_order_invoices_table.php\",\"line\":23,\"hash\":\"a48b167cebc42db6474e99ecae33dfbc\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(202,'96b90697-b417-4e2f-8572-e6b2b6822543','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009018_add_foreigns_to_order_invoices_table\', 1)\",\"time\":\"5.17\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(203,'96b90697-eb80-4b3e-9669-dabaebd03def','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_ratings` add constraint `order_ratings_order_id_foreign` foreign key (`order_id`) references `orders` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"140.48\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009019_add_foreigns_to_order_ratings_table.php\",\"line\":44,\"hash\":\"f598a75b3c8e163cc7efadd9f30f6b03\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(204,'96b90698-0753-43a6-b627-ac2cd6c464ef','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_ratings` add constraint `order_ratings_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"70.35\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009019_add_foreigns_to_order_ratings_table.php\",\"line\":44,\"hash\":\"8dee00144762009e63e9a169d0d04617\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(205,'96b90698-3ac8-4bfd-9ebb-01614d790d2f','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_ratings` add constraint `order_ratings_partner_id_foreign` foreign key (`partner_id`) references `partners` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"130.91\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009019_add_foreigns_to_order_ratings_table.php\",\"line\":44,\"hash\":\"2c88085fb2117a69c8b9bf925402ddd2\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(206,'96b90698-6d31-4418-b3c4-855b8b2ea8c6','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_ratings` add constraint `order_ratings_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"128.00\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009019_add_foreigns_to_order_ratings_table.php\",\"line\":44,\"hash\":\"91e594238fd781f6dca5309b8db7f846\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(207,'96b90698-6f40-4453-b957-6588adab3e4c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009019_add_foreigns_to_order_ratings_table\', 1)\",\"time\":\"4.03\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(208,'96b90698-9527-45ab-bed3-be5e97ebe26c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `carts` add constraint `carts_user_id_foreign` foreign key (`user_id`) references `users` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"95.83\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009020_add_foreigns_to_carts_table.php\",\"line\":51,\"hash\":\"dfc54e760b8fce3f13fe3e2e156e0897\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(209,'96b90698-b581-4423-85e8-f5d68be8b290','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `carts` add constraint `carts_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"82.30\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009020_add_foreigns_to_carts_table.php\",\"line\":51,\"hash\":\"41b2d5c7c045ec66c7a27619dc832405\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:17'),(210,'96b90698-fbdf-48d6-8a66-698f6dbe2d4f','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `carts` add constraint `carts_user_address_id_foreign` foreign key (`user_address_id`) references `user_addresses` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"179.24\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009020_add_foreigns_to_carts_table.php\",\"line\":51,\"hash\":\"fdfbeb2a8cf353c0239a133249c59299\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(211,'96b90699-2027-434c-9406-e7cc9ec8a589','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `carts` add constraint `carts_promocode_id_foreign` foreign key (`promocode_id`) references `promocodes` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"91.95\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009020_add_foreigns_to_carts_table.php\",\"line\":51,\"hash\":\"4bc8f602be0407194552d318f19d84a5\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(212,'96b90699-6c2f-478f-8dda-3ab4ab1d13ca','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `carts` add constraint `carts_order_id_foreign` foreign key (`order_id`) references `orders` (`id`) on delete SET NULL on update CASCADE\",\"time\":\"193.83\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009020_add_foreigns_to_carts_table.php\",\"line\":51,\"hash\":\"286afa3a1339f6efb148066437d897d9\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(213,'96b90699-6f07-4237-b425-0037b2f43b22','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009020_add_foreigns_to_carts_table\', 1)\",\"time\":\"6.34\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(214,'96b90699-8e15-405b-8d2d-67f5261b1740','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_disputes` add constraint `order_disputes_reason_id_foreign` foreign key (`reason_id`) references `reasons` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"78.16\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009021_add_foreigns_to_order_disputes_table.php\",\"line\":30,\"hash\":\"73143e9a6319607e9ac84f63638b8759\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(215,'96b90699-acb8-4ab8-92a5-f5922f0b636f','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_disputes` add constraint `order_disputes_order_id_foreign` foreign key (`order_id`) references `orders` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"77.78\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009021_add_foreigns_to_order_disputes_table.php\",\"line\":30,\"hash\":\"947cb53ffc95825922f3deb753361554\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(216,'96b90699-afd8-43f8-a78a-dca5f110826b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009021_add_foreigns_to_order_disputes_table\', 1)\",\"time\":\"7.11\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(217,'96b90699-d0a9-4967-9a75-c3f3659bb548','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_dispute_comments` add constraint `order_dispute_comments_admin_id_foreign` foreign key (`admin_id`) references `admins` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"82.02\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009022_add_foreigns_to_order_dispute_comments_table.php\",\"line\":30,\"hash\":\"8757007b3723e323e8d7e07a0dcc6f6e\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(218,'96b9069a-0b72-4bcd-9c6d-e33a488e21c4','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_dispute_comments` add constraint `order_dispute_comments_order_dispute_id_foreign` foreign key (`order_dispute_id`) references `order_disputes` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"149.92\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009022_add_foreigns_to_order_dispute_comments_table.php\",\"line\":30,\"hash\":\"4811b7fda411822bfd0aa73f8d154e7f\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(219,'96b9069a-0d20-4d77-a312-ab6748e3f3b0','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009022_add_foreigns_to_order_dispute_comments_table\', 1)\",\"time\":\"3.44\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(220,'96b9069a-2bc9-476a-923a-a6cb3e8cdda1','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `promocodeables` add constraint `promocodeables_promocode_id_foreign` foreign key (`promocode_id`) references `promocodes` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"77.22\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009023_add_foreigns_to_promocodeables_table.php\",\"line\":23,\"hash\":\"d2eee864dd26c94d7ca732bff1ba235c\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(221,'96b9069a-2dab-4bde-a761-89e3afe26313','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009023_add_foreigns_to_promocodeables_table\', 1)\",\"time\":\"3.88\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(222,'96b9069a-44e1-4af1-8be2-f4e2a8e808b0','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `shop_timings` add constraint `shop_timings_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"58.23\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009024_add_foreigns_to_shop_timings_table.php\",\"line\":23,\"hash\":\"fc3cb82c4011863c92e6bd2f770d9a05\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(223,'96b9069a-4667-4dc6-8b66-11a2fe617a6c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009024_add_foreigns_to_shop_timings_table\', 1)\",\"time\":\"2.85\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:18'),(224,'96b9069a-8215-4ef2-afb1-299b8a7623e0','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_dispute_messages` add constraint `order_dispute_messages_order_dispute_id_foreign` foreign key (`order_dispute_id`) references `order_disputes` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"150.64\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009025_add_foreigns_to_order_dispute_messages_table.php\",\"line\":23,\"hash\":\"c3d1a2cb1114a689441aaea3369861e0\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(225,'96b9069a-8347-417f-9a91-89e8222690c3','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009025_add_foreigns_to_order_dispute_messages_table\', 1)\",\"time\":\"2.07\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(226,'96b9069a-9fc0-4706-84fd-a07c70e79a84','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `shifts` add constraint `shifts_partner_id_foreign` foreign key (`partner_id`) references `partners` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"71.74\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009026_add_foreigns_to_shifts_table.php\",\"line\":30,\"hash\":\"72ca79b6cf9cafcc5976eb85f90913f2\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(227,'96b9069a-bcc2-49d5-9cac-d11469055987','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `shifts` add constraint `shifts_partner_vehicle_id_foreign` foreign key (`partner_vehicle_id`) references `partner_vehicles` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"73.31\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009026_add_foreigns_to_shifts_table.php\",\"line\":30,\"hash\":\"e8d2231d2b3eae6569f46c0ae86d777a\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(228,'96b9069a-be8a-4fc4-b5c2-0f7c60f1a692','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009026_add_foreigns_to_shifts_table\', 1)\",\"time\":\"2.69\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(229,'96b9069a-fbc8-4340-a60e-aaa9e6f6ffa2','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `shift_timings` add constraint `shift_timings_shift_id_foreign` foreign key (`shift_id`) references `shifts` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"152.40\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_21_009027_add_foreigns_to_shift_timings_table.php\",\"line\":23,\"hash\":\"c7ed3ec52ebbf21dedf75a1a239a97d5\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(230,'96b9069a-fdab-4b75-9bde-6b604839f1bd','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_21_009027_add_foreigns_to_shift_timings_table\', 1)\",\"time\":\"3.65\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(231,'96b9069b-0c7c-4e09-9e5e-744ab1e379b9','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `settings` (`id` int unsigned not null auto_increment primary key, `key` varchar(191) not null, `value` text not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"33.33\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_23_000635_create_settings_table.php\",\"line\":35,\"hash\":\"cc30af23f94b2061d6a60413ecb6d764\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(232,'96b9069b-1bc9-42b2-9754-d2fd3a4420df','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `settings` add index `settings_key_index`(`key`)\",\"time\":\"38.19\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_09_23_000635_create_settings_table.php\",\"line\":35,\"hash\":\"742b403852f8b819354a1dcffe6671b9\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(233,'96b9069b-1e01-4afd-875f-856cf2f8097c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_09_23_000635_create_settings_table\', 1)\",\"time\":\"4.51\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(234,'96b9069b-2d3e-4357-8a32-1bb870161d3e','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `liked_shops` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned not null, `shop_info_id` bigint unsigned not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"34.00\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_10_04_062747_create_liked_shops_table.php\",\"line\":21,\"hash\":\"f6b58ddff49576a6bdb1b4b96681e39d\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(235,'96b9069b-2f9b-4ff4-b87a-d01625c7a4f1','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_10_04_062747_create_liked_shops_table\', 1)\",\"time\":\"4.70\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(236,'96b9069b-3f11-4cb0-afe8-6b1244244df1','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `notifications` (`id` char(36) not null, `type` varchar(191) not null, `notifiable_type` varchar(191) not null, `notifiable_id` bigint unsigned not null, `data` text not null, `read_at` timestamp null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"36.03\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_10_14_111317_create_notifications_table.php\",\"line\":23,\"hash\":\"5a45b1c9942b156400d4abc8036d8db0\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(237,'96b9069b-4890-431f-80d3-cb3074977fc7','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notifications` add index `notifications_notifiable_type_notifiable_id_index`(`notifiable_type`, `notifiable_id`)\",\"time\":\"23.51\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_10_14_111317_create_notifications_table.php\",\"line\":23,\"hash\":\"d1e52015ac59bba4fa86595b8177bbce\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(238,'96b9069b-55a4-4376-8251-463888995934','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `notifications` add primary key `notifications_id_primary`(`id`)\",\"time\":\"32.77\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_10_14_111317_create_notifications_table.php\",\"line\":23,\"hash\":\"3b9e76ea0873b31168a2980bf5831132\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(239,'96b9069b-59cf-47c0-af35-e8f370818b3b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_10_14_111317_create_notifications_table\', 1)\",\"time\":\"9.76\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(240,'96b9069b-66d9-467a-b685-145c4daf89c4','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `order_filters` (`id` bigint unsigned not null auto_increment primary key, `order_id` bigint unsigned not null, `partner_id` bigint unsigned not null, `status` int not null default \'0\', `created_at` timestamp null, `updated_at` timestamp null, `deleted_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"31.72\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_10_16_210018_create_order_filters_table.php\",\"line\":23,\"hash\":\"adddefb6a17b7b6e641c0521c51d96c6\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(241,'96b9069b-9097-4d57-be31-8d5eaba094a9','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_filters` add constraint `order_filters_partner_id_foreign` foreign key (`partner_id`) references `partners` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"105.20\",\"slow\":true,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_10_16_210018_create_order_filters_table.php\",\"line\":40,\"hash\":\"0eda3709cc11ac3c67b3c7ac86678466\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(242,'96b9069b-a7c2-45b2-840a-485d17516d27','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `order_filters` add constraint `order_filters_order_id_foreign` foreign key (`order_id`) references `orders` (`id`) on delete CASCADE on update CASCADE\",\"time\":\"58.41\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_10_16_210018_create_order_filters_table.php\",\"line\":40,\"hash\":\"23e11e3ecce3c0d006aea240919a0624\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(243,'96b9069b-a986-4d9b-9c8b-4d9961b90083','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_10_16_210018_create_order_filters_table\', 1)\",\"time\":\"3.45\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(244,'96b9069b-b608-44b3-8889-fd535badaa01','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `jobs` (`id` bigint unsigned not null auto_increment primary key, `queue` varchar(191) not null, `payload` longtext not null, `attempts` tinyint unsigned not null, `reserved_at` int unsigned null, `available_at` int unsigned not null, `created_at` int unsigned not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"29.68\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_10_16_214003_create_jobs_table.php\",\"line\":24,\"hash\":\"e979ba91e05e85b61b901876ce0321e7\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(245,'96b9069b-bf93-49a2-a2bb-cbe80e616f6b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `jobs` add index `jobs_queue_index`(`queue`)\",\"time\":\"23.43\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_10_16_214003_create_jobs_table.php\",\"line\":24,\"hash\":\"0cfaf07533bec3024be637314b74804b\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(246,'96b9069b-c15c-4aba-8ba7-6674e2195cb6','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_10_16_214003_create_jobs_table\', 1)\",\"time\":\"3.60\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(247,'96b9069b-d176-443d-91d8-44808eda3ace','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `payment_logs` (`id` bigint unsigned not null auto_increment primary key, `is_wallet` int not null default \'0\', `user_type` varchar(191) null comment \'user or transporter or shop\', `payment_mode` varchar(191) null, `user_id` int not null comment \'user id or transporter id or shop id\', `amount` double(8, 2) not null default \'0\', `stripe_code` varchar(191) null comment \'code generated during stripe payment\', `transaction_code` varchar(191) null comment \'Random code generated during payment\', `transaction_id` varchar(191) null comment \'Foreign key of the user request or wallet table\', `response` text null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"38.40\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_163938_create_payment_logs_table.php\",\"line\":28,\"hash\":\"b8d3179096d7c498d86f746425e6f8dd\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(248,'96b9069b-d44e-4801-b88f-76353ff1cd5e','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_11_04_163938_create_payment_logs_table\', 1)\",\"time\":\"5.82\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:19'),(249,'96b9069b-f9d8-4d82-898b-0274cf1c96d1','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `cards` (`id` bigint unsigned not null auto_increment primary key, `last_four` varchar(191) not null, `card_id` varchar(191) not null, `brand` varchar(191) null, `is_default` int not null default \'0\', `cardable_id` bigint unsigned not null, `cardable_type` varchar(191) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"94.00\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_163946_create_cards_table.php\",\"line\":27,\"hash\":\"5bf5c5603faa6481ba4fdf230d35adca\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(250,'96b9069c-044b-4a8d-a613-42455be57263','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `cards` add index `cards_cardable_id_index`(`cardable_id`)\",\"time\":\"25.85\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_163946_create_cards_table.php\",\"line\":27,\"hash\":\"52040ffc99643d76afe0df62104630fd\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(251,'96b9069c-0eb6-4f03-91c6-76d4697bf9f5','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `cards` add index `cards_cardable_type_index`(`cardable_type`)\",\"time\":\"25.95\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_163946_create_cards_table.php\",\"line\":27,\"hash\":\"385e234da83955332dd99e5da1aae821\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(252,'96b9069c-10c0-4b3a-aa18-3917f758da40','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_11_04_163946_create_cards_table\', 1)\",\"time\":\"4.03\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(253,'96b9069c-20c2-4f74-bf88-4d34033771ba','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `user_wallets` (`id` bigint unsigned not null auto_increment primary key, `user_id` bigint unsigned not null, `transaction_id` int not null, `transaction_alias` varchar(25) null, `transaction_desc` varchar(191) null, `type` enum(\'C\', \'D\') not null, `amount` double(15, 8) not null default \'0\', `open_balance` double(15, 8) not null default \'0\', `close_balance` double(15, 8) not null default \'0\', `payment_mode` enum(\'CARD\', \'STRIPE\', \'PAYPAL\', \'PAYUMONEY\', \'PAYTM\') not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"37.28\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_164939_create_user_wallets_table.php\",\"line\":40,\"hash\":\"472f3a985541ce1b3621ca51a8cf9b78\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(254,'96b9069c-3d8c-4968-80b0-f5328a48982b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `user_wallets` add constraint `user_wallets_user_id_foreign` foreign key (`user_id`) references `users` (`id`)\",\"time\":\"72.54\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_164939_create_user_wallets_table.php\",\"line\":40,\"hash\":\"edf72e9f321dd55dd0b6bcafaea2822f\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(255,'96b9069c-3fc1-42e5-bd64-76d7622ee9b4','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_11_04_164939_create_user_wallets_table\', 1)\",\"time\":\"4.37\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(256,'96b9069c-5239-4412-a9c1-1feddc338e90','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `admin_wallets` (`id` bigint unsigned not null auto_increment primary key, `transaction_id` int not null, `transaction_alias` varchar(191) null, `transaction_desc` varchar(191) null, `transaction_type` int null comment \'1-commission,2-user-recharge,3-order-debit,4-shop-recharge,5-shop-settle,6-partner-recharge,7-partner-commission,8-partner-settle,9-tax-credit,10-discount-debit,11-discount-recharge,12-user-referral,13-shop-referral,14-peak-commission,15-waiting-commission,16-user-dispute,17-shop-dispute,18-partner-dispute\', `type` enum(\'C\', \'D\') not null, `amount` double(15, 8) not null default \'0\', `open_balance` double(15, 8) not null default \'0\', `close_balance` double(15, 8) not null default \'0\', `payment_mode` enum(\'CARD\', \'STRIPE\', \'PAYPAL\', \'PAYUMONEY\', \'PAYTM\') not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"43.95\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_164955_create_admin_wallets_table.php\",\"line\":36,\"hash\":\"0bca7a990853359636020b2b83e4e275\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(257,'96b9069c-5456-4ed3-a90c-8d4a0b8eaec7','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_11_04_164955_create_admin_wallets_table\', 1)\",\"time\":\"3.90\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(258,'96b9069c-75af-4cbf-9ba0-95aaae0a6772','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `shop_wallets` (`id` bigint unsigned not null auto_increment primary key, `shop_id` bigint unsigned not null, `transaction_id` int not null, `transaction_alias` varchar(191) null, `transaction_desc` varchar(191) null, `type` enum(\'C\', \'D\') not null, `amount` double(15, 8) not null default \'0\', `open_balance` double(15, 8) not null default \'0\', `close_balance` double(15, 8) not null default \'0\', `payment_mode` enum(\'CARD\', \'STRIPE\', \'PAYPAL\', \'PAYUMONEY\', \'PAYTM\') not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"82.73\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_165022_create_shop_wallets_table.php\",\"line\":40,\"hash\":\"00a1107520764a5dd4a097432ea25c32\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(259,'96b9069c-9b53-41b6-b054-a4b230813ac0','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `shop_wallets` add constraint `shop_wallets_shop_id_foreign` foreign key (`shop_id`) references `shops` (`id`)\",\"time\":\"95.09\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_165022_create_shop_wallets_table.php\",\"line\":40,\"hash\":\"fad2e5e59eec7607183eed92f6ecf7e4\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(260,'96b9069c-9e4a-4e94-86f8-6dd7fcee848b','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_11_04_165022_create_shop_wallets_table\', 1)\",\"time\":\"6.21\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(261,'96b9069c-ae6f-437a-a947-d29acdac613c','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `partner_wallets` (`id` bigint unsigned not null auto_increment primary key, `partner_id` bigint unsigned not null, `transaction_id` int not null, `transaction_alias` varchar(191) null, `transaction_desc` varchar(191) null, `type` enum(\'C\', \'D\') not null, `amount` double(15, 8) not null default \'0\', `open_balance` double(15, 8) not null default \'0\', `close_balance` double(15, 8) not null default \'0\', `payment_mode` enum(\'CARD\', \'STRIPE\', \'PAYPAL\', \'PAYUMONEY\', \'PAYTM\') not null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"36.64\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_165103_create_partner_wallets_table.php\",\"line\":40,\"hash\":\"2474730a62d55b1f99f22c884ed9e203\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(262,'96b9069c-bf5e-4db8-979a-b02d64565ca5','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `partner_wallets` add constraint `partner_wallets_partner_id_foreign` foreign key (`partner_id`) references `partners` (`id`)\",\"time\":\"42.70\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_04_165103_create_partner_wallets_table.php\",\"line\":40,\"hash\":\"b341e888256585477217bad31e612ec7\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(263,'96b9069c-c096-47ea-ae34-06ad5ceeb22f','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_11_04_165103_create_partner_wallets_table\', 1)\",\"time\":\"2.28\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(264,'96b9069c-cd35-481c-805c-9641da759bc8','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `banners` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(191) not null, `description` text null, `redirect_link` varchar(191) null, `image` varchar(191) null, `expire_at` timestamp null, `status` enum(\'enable\', \'disable\') not null default \'enable\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"30.30\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_11_07_172122_create_banners_table.php\",\"line\":25,\"hash\":\"3d48c6a7a078a95fe46115063c061620\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(265,'96b9069c-ce5e-4fde-9001-5e6d069a9a3a','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_11_07_172122_create_banners_table\', 1)\",\"time\":\"2.16\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(266,'96b9069c-da62-41a1-b040-3b69e09522bb','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `wallet_requests` (`id` bigint unsigned not null auto_increment primary key, `alias_id` varchar(191) not null, `request_from` varchar(191) not null comment \'user,partner,shop\', `from_id` int not null, `from_desc` varchar(191) null, `type` enum(\'C\', \'D\') not null, `amount` double(15, 8) not null default \'0\', `send_by` varchar(191) null comment \'online,offline\', `send_desc` varchar(191) null, `status` tinyint not null default \'0\' comment \'0-Pendig,1-Approved,2-cancel\', `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"28.94\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/database\\/migrations\\/2021_12_01_111826_create_wallet_requests_table.php\",\"line\":28,\"hash\":\"82f07dfff692c10c7277f3d219c6568b\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(267,'96b9069c-db79-4355-b22f-b1f4cbbd03a3','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2021_12_01_111826_create_wallet_requests_table\', 1)\",\"time\":\"1.76\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(268,'96b9069c-dbfe-4d63-ab2e-47ed6e4687f9','96b9069c-dd05-48a4-9fbb-5a7566beff31',NULL,1,'command','{\"command\":\"migrate\",\"exit_code\":0,\"arguments\":{\"command\":\"migrate\"},\"options\":{\"database\":null,\"force\":false,\"path\":[],\"realpath\":false,\"schema-path\":null,\"pretend\":false,\"seed\":false,\"seeder\":null,\"step\":false,\"help\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":null,\"no-interaction\":false,\"env\":null},\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:20'),(269,'96b906d6-1c70-45a6-912b-dddca6c71f97','96b906d6-668b-4b44-852d-80916536b257',NULL,1,'view','{\"name\":\"app\",\"path\":\"\\/resources\\/views\\/app.blade.php\",\"data\":[\"page\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:58'),(270,'96b906d6-5948-4a46-b424-1d11e616ac41','96b906d6-668b-4b44-852d-80916536b257',NULL,1,'view','{\"name\":\"components.pwa\",\"path\":\"\\/resources\\/views\\/components\\/pwa.blade.php\",\"data\":[\"config\",\"user\",\"componentName\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:58'),(271,'96b906d6-5c71-4dd2-a240-e005d56e50da','96b906d6-668b-4b44-852d-80916536b257',NULL,1,'view','{\"name\":\"laravelpwa::meta\",\"path\":\"\\/resources\\/views\\/vendor\\/laravelpwa\\/meta.blade.php\",\"data\":[\"config\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:58'),(272,'96b906d6-5d37-4898-a0e4-82772addbe6a','96b906d6-668b-4b44-852d-80916536b257',NULL,1,'view','{\"name\":\"components.settings\",\"path\":\"\\/resources\\/views\\/components\\/settings.blade.php\",\"data\":[\"settings\",\"componentName\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:58'),(273,'96b906d6-5dac-4942-96a9-b59e30218648','96b906d6-668b-4b44-852d-80916536b257',NULL,1,'view','{\"name\":\"components.loader\",\"path\":\"\\/resources\\/views\\/components\\/loader.blade.php\",\"data\":[\"componentName\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:58'),(274,'96b906d6-5f23-4bd4-9078-b0b719f38927','96b906d6-668b-4b44-852d-80916536b257',NULL,1,'cache','{\"type\":\"hit\",\"key\":\"translations_en\",\"value\":{\"failed\":\"These credentials do not match our records.\",\"password\":\"The password is incorrect.\",\"throttle\":\"Too many login attempts. Please try again in :seconds seconds.\",\"common.actions\":\"Actions\",\"common.create\":\"Create\",\"common.edit\":\"Edit\",\"common.update\":\"Update\",\"common.new\":\"New\",\"common.cancel\":\"Cancel\",\"common.save\":\"Save\",\"common.delete\":\"Delete\",\"common.delete_selected\":\"Delete selected\",\"common.search\":\"Search...\",\"common.back\":\"Back to Index\",\"common.are_you_sure\":\"Are you sure?\",\"common.no_items_found\":\"No items found\",\"common.created\":\"Successfully created\",\"common.saved\":\"Saved successfully\",\"common.removed\":\"Successfully removed\",\"notice_boards.name\":\"Notice Boards\",\"notice_boards.index_title\":\"NoticeBoards List\",\"notice_boards.new_title\":\"New Notice board\",\"notice_boards.create_title\":\"Create NoticeBoard\",\"notice_boards.edit_title\":\"Edit NoticeBoard\",\"notice_boards.show_title\":\"Show NoticeBoard\",\"notice_boards.inputs.for\":\"For\",\"notice_boards.inputs.title\":\"Title\",\"notice_boards.inputs.notice\":\"Notice\",\"notice_boards.inputs.note\":\"Note\",\"users.name\":\"Users\",\"users.index_title\":\"Users List\",\"users.new_title\":\"New User\",\"users.create_title\":\"Create User\",\"users.edit_title\":\"Edit User\",\"users.show_title\":\"Show User\",\"users.inputs.name\":\"Name\",\"users.inputs.email\":\"Email\",\"users.inputs.password\":\"Password\",\"users.inputs.phone\":\"Phone\",\"users.inputs.otp\":\"Otp\",\"users.inputs.status\":\"Status\",\"users.inputs.image\":\"Image\",\"admins.name\":\"Admins\",\"admins.index_title\":\"Admins List\",\"admins.new_title\":\"New Admin\",\"admins.create_title\":\"Create Admin\",\"admins.edit_title\":\"Edit Admin\",\"admins.show_title\":\"Show Admin\",\"admins.inputs.name\":\"Name\",\"admins.inputs.email\":\"Email\",\"admins.inputs.password\":\"Password\",\"admins.inputs.remember_token\":\"Remember Token\",\"admins.inputs.status\":\"Status\",\"admins.inputs.email_verified_at\":\"Email Verified At\",\"admins.inputs.phone\":\"Phone\",\"admins.inputs.otp\":\"Otp\",\"admins.inputs.image\":\"Image\",\"partners.name\":\"Partners\",\"partners.index_title\":\"Partners List\",\"partners.new_title\":\"New Partner\",\"partners.create_title\":\"Create Partner\",\"partners.edit_title\":\"Edit Partner\",\"partners.show_title\":\"Show Partner\",\"partners.inputs.name\":\"Name\",\"partners.inputs.email\":\"Email\",\"partners.inputs.phone\":\"Phone\",\"partners.inputs.otp\":\"Otp\",\"partners.inputs.password\":\"Password\",\"partners.inputs.remember_token\":\"Remember Token\",\"partners.inputs.status\":\"Status\",\"partners.inputs.email_verified_at\":\"Email Verified At\",\"partners.inputs.image\":\"Image\",\"user_orders.name\":\"User Orders\",\"user_orders.index_title\":\"Orders List\",\"user_orders.new_title\":\"New Order\",\"user_orders.create_title\":\"Create Order\",\"user_orders.edit_title\":\"Edit Order\",\"user_orders.show_title\":\"Show Order\",\"user_orders.inputs.invoice_id\":\"Invoice Id\",\"user_orders.inputs.user_address_id\":\"User Address\",\"user_orders.inputs.shop_id\":\"Shop\",\"user_orders.inputs.partner_id\":\"Partner\",\"user_orders.inputs.partner_vehicle_id\":\"Partner Vehicle\",\"user_orders.inputs.note\":\"Note\",\"user_orders.inputs.route_key\":\"Route Key\",\"user_orders.inputs.dispute\":\"Dispute\",\"user_orders.inputs.delivery_date\":\"Delivery Date\",\"user_orders.inputs.order_otp\":\"Order Otp\",\"user_orders.inputs.order_ready_time\":\"Order Ready Time\",\"user_orders.inputs.order_ready_status\":\"Order Ready Status\",\"user_orders.inputs.status\":\"Status\",\"user_orders.inputs.schedule_status\":\"Schedule Status\",\"user_orders.inputs.schedule_at\":\"Schedule At\",\"user_order_ratings.name\":\"User Order Ratings\",\"user_order_ratings.index_title\":\"OrderRatings List\",\"user_order_ratings.new_title\":\"New Order rating\",\"user_order_ratings.create_title\":\"Create OrderRating\",\"user_order_ratings.edit_title\":\"Edit OrderRating\",\"user_order_ratings.show_title\":\"Show OrderRating\",\"user_order_ratings.inputs.order_id\":\"Order\",\"user_order_ratings.inputs.user_rating\":\"User Rating\",\"user_order_ratings.inputs.user_comment\":\"User Comment\",\"user_order_ratings.inputs.partner_id\":\"Partner\",\"user_order_ratings.inputs.partner_rating\":\"Partner Rating\",\"user_order_ratings.inputs.partner_comment\":\"Partner Comment\",\"user_order_ratings.inputs.shop_id\":\"Shop\",\"user_order_ratings.inputs.shop_rating\":\"Shop Rating\",\"user_order_ratings.inputs.shop_comment\":\"Shop Comment\",\"user_carts.name\":\"User Carts\",\"user_carts.index_title\":\"Carts List\",\"user_carts.new_title\":\"New Cart\",\"user_carts.create_title\":\"Create Cart\",\"user_carts.edit_title\":\"Edit Cart\",\"user_carts.show_title\":\"Show Cart\",\"user_carts.inputs.shop_id\":\"Shop\",\"user_carts.inputs.promocode_id\":\"Promocode\",\"user_carts.inputs.order_id\":\"Order\",\"partner_orders.name\":\"Partner Orders\",\"partner_orders.index_title\":\"Orders List\",\"partner_orders.new_title\":\"New Order\",\"partner_orders.create_title\":\"Create Order\",\"partner_orders.edit_title\":\"Edit Order\",\"partner_orders.show_title\":\"Show Order\",\"partner_orders.inputs.invoice_id\":\"Invoice Id\",\"partner_orders.inputs.user_id\":\"User\",\"partner_orders.inputs.user_address_id\":\"User Address\",\"partner_orders.inputs.shop_id\":\"Shop\",\"partner_orders.inputs.partner_vehicle_id\":\"Partner Vehicle\",\"partner_orders.inputs.note\":\"Note\",\"partner_orders.inputs.route_key\":\"Route Key\",\"partner_orders.inputs.dispute\":\"Dispute\",\"partner_orders.inputs.delivery_date\":\"Delivery Date\",\"partner_orders.inputs.order_otp\":\"Order Otp\",\"partner_orders.inputs.order_ready_time\":\"Order Ready Time\",\"partner_orders.inputs.order_ready_status\":\"Order Ready Status\",\"partner_orders.inputs.status\":\"Status\",\"partner_orders.inputs.schedule_status\":\"Schedule Status\",\"partner_orders.inputs.schedule_at\":\"Schedule At\",\"partner_partner_vehicles.name\":\"Partner Partner Vehicles\",\"partner_partner_vehicles.index_title\":\"PartnerVehicles List\",\"partner_partner_vehicles.new_title\":\"New Partner vehicle\",\"partner_partner_vehicles.create_title\":\"Create PartnerVehicle\",\"partner_partner_vehicles.edit_title\":\"Edit PartnerVehicle\",\"partner_partner_vehicles.show_title\":\"Show PartnerVehicle\",\"partner_partner_vehicles.inputs.vehicle_no\":\"Vehicle No\",\"partner_partner_vehicles.inputs.vehicle_type\":\"Vehicle Type\",\"partner_order_ratings.name\":\"Partner Order Ratings\",\"partner_order_ratings.index_title\":\"OrderRatings List\",\"partner_order_ratings.new_title\":\"New Order rating\",\"partner_order_ratings.create_title\":\"Create OrderRating\",\"partner_order_ratings.edit_title\":\"Edit OrderRating\",\"partner_order_ratings.show_title\":\"Show OrderRating\",\"partner_order_ratings.inputs.order_id\":\"Order\",\"partner_order_ratings.inputs.user_id\":\"User\",\"partner_order_ratings.inputs.user_rating\":\"User Rating\",\"partner_order_ratings.inputs.user_comment\":\"User Comment\",\"partner_order_ratings.inputs.partner_rating\":\"Partner Rating\",\"partner_order_ratings.inputs.partner_comment\":\"Partner Comment\",\"partner_order_ratings.inputs.shop_id\":\"Shop\",\"partner_order_ratings.inputs.shop_rating\":\"Shop Rating\",\"partner_order_ratings.inputs.shop_comment\":\"Shop Comment\",\"inqueries.name\":\"Inqueries\",\"inqueries.index_title\":\"Inqueries List\",\"inqueries.new_title\":\"New Inquery\",\"inqueries.create_title\":\"Create Inquery\",\"inqueries.edit_title\":\"Edit Inquery\",\"inqueries.show_title\":\"Show Inquery\",\"inqueries.inputs.name\":\"Name\",\"inqueries.inputs.email\":\"Email\",\"inqueries.inputs.phone\":\"Phone\",\"inqueries.inputs.for\":\"For\",\"inqueries.inputs.message\":\"Message\",\"promocodes.name\":\"Promocodes\",\"promocodes.index_title\":\"Promocodes List\",\"promocodes.new_title\":\"New Promocode\",\"promocodes.create_title\":\"Create Promocode\",\"promocodes.edit_title\":\"Edit Promocode\",\"promocodes.show_title\":\"Show Promocode\",\"promocodes.inputs.name\":\"Name\",\"promocodes.inputs.description\":\"Description\",\"promocodes.inputs.promo_code\":\"Promo Code\",\"promocodes.inputs.percentage\":\"Percentage\",\"promocodes.inputs.max_amount\":\"Max Amount\",\"promocodes.inputs.expire_at\":\"Expire At\",\"promocodes.inputs.status\":\"Status\",\"reasons.name\":\"Reasons\",\"reasons.index_title\":\"Reasons List\",\"reasons.new_title\":\"New Reason\",\"reasons.create_title\":\"Create Reason\",\"reasons.edit_title\":\"Edit Reason\",\"reasons.show_title\":\"Show Reason\",\"reasons.inputs.message\":\"Message\",\"reasons.inputs.for\":\"For\",\"reasons.inputs.type\":\"Type\",\"documents.name\":\"Documents\",\"documents.index_title\":\"Documents List\",\"documents.new_title\":\"New Document\",\"documents.create_title\":\"Create Document\",\"documents.edit_title\":\"Edit Document\",\"documents.show_title\":\"Show Document\",\"documents.inputs.name\":\"Name\",\"documents.inputs.for\":\"For\",\"documents.inputs.status\":\"Status\",\"images.name\":\"Images\",\"images.index_title\":\"Images List\",\"images.new_title\":\"New Image\",\"images.create_title\":\"Create Image\",\"images.edit_title\":\"Edit Image\",\"images.show_title\":\"Show Image\",\"images.inputs.imageable_id\":\"Imageable Id\",\"images.inputs.imageable_type\":\"Imageable Type\",\"images.inputs.image\":\"Image\",\"images.inputs.status\":\"Status\",\"images.inputs.position\":\"Position\",\"images.inputs.default\":\"Default\",\"orders.name\":\"Orders\",\"orders.index_title\":\"Orders List\",\"orders.new_title\":\"New Order\",\"orders.create_title\":\"Create Order\",\"orders.edit_title\":\"Edit Order\",\"orders.show_title\":\"Show Order\",\"orders.inputs.invoice_id\":\"Invoice Id\",\"orders.inputs.user_id\":\"User\",\"orders.inputs.user_address_id\":\"User Address\",\"orders.inputs.shop_id\":\"Shop\",\"orders.inputs.partner_id\":\"Partner\",\"orders.inputs.partner_vehicle_id\":\"Partner Vehicle\",\"orders.inputs.note\":\"Note\",\"orders.inputs.route_key\":\"Route Key\",\"orders.inputs.dispute\":\"Dispute\",\"orders.inputs.delivery_date\":\"Delivery Date\",\"orders.inputs.order_otp\":\"Order Otp\",\"orders.inputs.order_ready_time\":\"Order Ready Time\",\"orders.inputs.order_ready_status\":\"Order Ready Status\",\"orders.inputs.status\":\"Status\",\"orders.inputs.schedule_status\":\"Schedule Status\",\"orders.inputs.schedule_at\":\"Schedule At\",\"order_order_ratings.name\":\"Order Order Ratings\",\"order_order_ratings.index_title\":\"OrderRatings List\",\"order_order_ratings.new_title\":\"New Order rating\",\"order_order_ratings.create_title\":\"Create OrderRating\",\"order_order_ratings.edit_title\":\"Edit OrderRating\",\"order_order_ratings.show_title\":\"Show OrderRating\",\"order_order_ratings.inputs.user_id\":\"User\",\"order_order_ratings.inputs.user_rating\":\"User Rating\",\"order_order_ratings.inputs.user_comment\":\"User Comment\",\"order_order_ratings.inputs.partner_id\":\"Partner\",\"order_order_ratings.inputs.partner_rating\":\"Partner Rating\",\"order_order_ratings.inputs.partner_comment\":\"Partner Comment\",\"order_order_ratings.inputs.shop_id\":\"Shop\",\"order_order_ratings.inputs.shop_rating\":\"Shop Rating\",\"order_order_ratings.inputs.shop_comment\":\"Shop Comment\",\"order_order_invoices.name\":\"Order Order Invoices\",\"order_order_invoices.index_title\":\"OrderInvoices List\",\"order_order_invoices.new_title\":\"New Order invoice\",\"order_order_invoices.create_title\":\"Create OrderInvoice\",\"order_order_invoices.edit_title\":\"Edit OrderInvoice\",\"order_order_invoices.show_title\":\"Show OrderInvoice\",\"order_order_invoices.inputs.quantity\":\"Quantity\",\"order_order_invoices.inputs.paid\":\"Paid\",\"order_order_invoices.inputs.gross\":\"Gross\",\"order_order_invoices.inputs.discount\":\"Discount\",\"order_order_invoices.inputs.delivery_charge\":\"Delivery Charge\",\"order_order_invoices.inputs.payable\":\"Payable\",\"order_order_invoices.inputs.tax\":\"Tax\",\"order_order_invoices.inputs.tax_percent\":\"Tax Percent\",\"order_order_invoices.inputs.net\":\"Net\",\"order_order_invoices.inputs.payment_mode\":\"Payment Mode\",\"order_order_invoices.inputs.DestinationTag\":\"Destination Tag\",\"order_order_invoices.inputs.payment_id\":\"Payment Id\",\"order_order_invoices.inputs.status\":\"Status\",\"order_order_disputes.name\":\"Order Order Disputes\",\"order_order_disputes.index_title\":\"OrderDisputes List\",\"order_order_disputes.new_title\":\"New Order dispute\",\"order_order_disputes.create_title\":\"Create OrderDispute\",\"order_order_disputes.edit_title\":\"Edit OrderDispute\",\"order_order_disputes.show_title\":\"Show OrderDispute\",\"order_order_disputes.inputs.reason_id\":\"Reason\",\"order_order_disputes.inputs.type\":\"Type\",\"order_order_disputes.inputs.created_by\":\"Created By\",\"order_order_disputes.inputs.created_to\":\"Created To\",\"order_order_disputes.inputs.status\":\"Status\",\"order_order_disputes.inputs.description\":\"Description\",\"shops.name\":\"Shops\",\"shops.index_title\":\"Shops List\",\"shops.new_title\":\"New Shop\",\"shops.create_title\":\"Create Shop\",\"shops.edit_title\":\"Edit Shop\",\"shops.show_title\":\"Show Shop\",\"shops.inputs.name\":\"Name\",\"shops.inputs.email\":\"Email\",\"shops.inputs.phone\":\"Phone\",\"shops.inputs.otp\":\"Otp\",\"shops.inputs.password\":\"Password\",\"shops.inputs.email_verified_at\":\"Email Verified At\",\"shops.inputs.remember_token\":\"Remember Token\",\"shops.inputs.status\":\"Status\",\"shop_shop_categories.name\":\"Shop Shop Categories\",\"shop_shop_categories.index_title\":\"ShopCategories List\",\"shop_shop_categories.new_title\":\"New Shop category\",\"shop_shop_categories.create_title\":\"Create ShopCategory\",\"shop_shop_categories.edit_title\":\"Edit ShopCategory\",\"shop_shop_categories.show_title\":\"Show ShopCategory\",\"shop_shop_categories.inputs.name\":\"Name\",\"shop_shop_categories.inputs.image\":\"Image\",\"shop_shop_categories.inputs.status\":\"Status\",\"shop_shop_categories.inputs.description\":\"Description\",\"shop_shop_categories.inputs.parent_id\":\"Parent Shop Category\",\"categories.name\":\"Categories\",\"categories.index_title\":\"Categories List\",\"categories.new_title\":\"New Category\",\"categories.create_title\":\"Create Category\",\"categories.edit_title\":\"Edit Category\",\"categories.show_title\":\"Show Category\",\"categories.inputs.parent_id\":\"Parent Category\",\"categories.inputs.name\":\"Name\",\"categories.inputs.image\":\"Image\",\"categories.inputs.status\":\"Status\",\"categories.inputs.description\":\"Description\",\"shop_products.name\":\"Shop Products\",\"shop_products.index_title\":\"Products List\",\"shop_products.new_title\":\"New Product\",\"shop_products.create_title\":\"Create Product\",\"shop_products.edit_title\":\"Edit Product\",\"shop_products.show_title\":\"Show Product\",\"shop_products.inputs.shop_category_id\":\"Shop Category\",\"shop_products.inputs.name\":\"Name\",\"shop_products.inputs.description\":\"Description\",\"shop_products.inputs.position\":\"Position\",\"shop_products.inputs.food_type\":\"Food Type\",\"shop_products.inputs.avalability\":\"Avalability\",\"shop_products.inputs.max_quantity\":\"Max Quantity\",\"shop_products.inputs.featured\":\"Featured\",\"shop_products.inputs.addon_status\":\"Addon Status\",\"shop_products.inputs.variant_status\":\"Variant Status\",\"shop_products.inputs.out_of_stock\":\"Out Of Stock\",\"shop_products.inputs.status\":\"Status\",\"shop_addons.name\":\"Shop Addons\",\"shop_addons.index_title\":\"Addons List\",\"shop_addons.new_title\":\"New Addon\",\"shop_addons.create_title\":\"Create Addon\",\"shop_addons.edit_title\":\"Edit Addon\",\"shop_addons.show_title\":\"Show Addon\",\"shop_addons.inputs.name\":\"Name\",\"shop_addons.inputs.status\":\"Status\",\"products.name\":\"Products\",\"products.index_title\":\"Products List\",\"products.new_title\":\"New Product\",\"products.create_title\":\"Create Product\",\"products.edit_title\":\"Edit Product\",\"products.show_title\":\"Show Product\",\"products.inputs.shop_category_id\":\"Shop Category\",\"products.inputs.name\":\"Name\",\"products.inputs.description\":\"Description\",\"products.inputs.shop_id\":\"Shop\",\"products.inputs.position\":\"Position\",\"products.inputs.food_type\":\"Food Type\",\"products.inputs.avalability\":\"Avalability\",\"products.inputs.max_quantity\":\"Max Quantity\",\"products.inputs.featured\":\"Featured\",\"products.inputs.addon_status\":\"Addon Status\",\"products.inputs.variant_status\":\"Variant Status\",\"products.inputs.out_of_stock\":\"Out Of Stock\",\"products.inputs.status\":\"Status\",\"product_product_variants.name\":\"Product Product Variants\",\"product_product_variants.index_title\":\"ProductVariants List\",\"product_product_variants.new_title\":\"New Product variant\",\"product_product_variants.create_title\":\"Create ProductVariant\",\"product_product_variants.edit_title\":\"Edit ProductVariant\",\"product_product_variants.show_title\":\"Show ProductVariant\",\"product_product_variants.inputs.type\":\"Type\",\"product_product_variants.inputs.variant_id\":\"Variant\",\"product_product_variants.inputs.status\":\"Status\",\"shop_shop_timings.name\":\"Shop Shop Timings\",\"shop_shop_timings.index_title\":\"ShopTimings List\",\"shop_shop_timings.new_title\":\"New Shop timing\",\"shop_shop_timings.create_title\":\"Create ShopTiming\",\"shop_shop_timings.edit_title\":\"Edit ShopTiming\",\"shop_shop_timings.show_title\":\"Show ShopTiming\",\"shop_shop_timings.inputs.start_time\":\"Start Time\",\"shop_shop_timings.inputs.end_time\":\"End Time\",\"shop_shop_timings.inputs.day\":\"Day\",\"product_variant_product_prices.name\":\"ProductVariant Product Prices\",\"product_variant_product_prices.index_title\":\"ProductPrices List\",\"product_variant_product_prices.new_title\":\"New Product price\",\"product_variant_product_prices.create_title\":\"Create ProductPrice\",\"product_variant_product_prices.edit_title\":\"Edit ProductPrice\",\"product_variant_product_prices.show_title\":\"Show ProductPrice\",\"product_variant_product_prices.inputs.price\":\"Price\",\"product_variant_product_prices.inputs.orignal_price\":\"Orignal Price\",\"product_variant_product_prices.inputs.currency\":\"Currency\",\"product_variant_product_prices.inputs.discount\":\"Discount\",\"product_variant_product_prices.inputs.discount_type\":\"Discount Type\",\"variants.name\":\"Variants\",\"variants.index_title\":\"Variants List\",\"variants.new_title\":\"New Variant\",\"variants.create_title\":\"Create Variant\",\"variants.edit_title\":\"Edit Variant\",\"variants.show_title\":\"Show Variant\",\"variants.inputs.name\":\"Name\",\"variants.inputs.status\":\"Status\",\"variants.inputs.shop_id\":\"Shop\",\"addons.name\":\"Addons\",\"addons.index_title\":\"Addons List\",\"addons.new_title\":\"New Addon\",\"addons.create_title\":\"Create Addon\",\"addons.edit_title\":\"Edit Addon\",\"addons.show_title\":\"Show Addon\",\"addons.inputs.name\":\"Name\",\"addons.inputs.status\":\"Status\",\"addons.inputs.shop_id\":\"Shop\",\"shop_variants.name\":\"Shop Variants\",\"shop_variants.index_title\":\"Variants List\",\"shop_variants.new_title\":\"New Variant\",\"shop_variants.create_title\":\"Create Variant\",\"shop_variants.edit_title\":\"Edit Variant\",\"shop_variants.show_title\":\"Show Variant\",\"shop_variants.inputs.name\":\"Name\",\"shop_variants.inputs.status\":\"Status\",\"order_disputes.name\":\"Order Disputes\",\"order_disputes.index_title\":\"OrderDisputes List\",\"order_disputes.new_title\":\"New Order dispute\",\"order_disputes.create_title\":\"Create OrderDispute\",\"order_disputes.edit_title\":\"Edit OrderDispute\",\"order_disputes.show_title\":\"Show OrderDispute\",\"order_disputes.inputs.reason_id\":\"Reason\",\"order_disputes.inputs.order_id\":\"Order\",\"order_disputes.inputs.type\":\"Type\",\"order_disputes.inputs.created_by\":\"Created By\",\"order_disputes.inputs.created_to\":\"Created To\",\"order_disputes.inputs.status\":\"Status\",\"order_disputes.inputs.description\":\"Description\",\"order_dispute_order_dispute_comments.name\":\"OrderDispute Order Dispute Comments\",\"order_dispute_order_dispute_comments.index_title\":\"OrderDisputeComments List\",\"order_dispute_order_dispute_comments.new_title\":\"New Order dispute comment\",\"order_dispute_order_dispute_comments.create_title\":\"Create OrderDisputeComment\",\"order_dispute_order_dispute_comments.edit_title\":\"Edit OrderDisputeComment\",\"order_dispute_order_dispute_comments.show_title\":\"Show OrderDisputeComment\",\"order_dispute_order_dispute_comments.inputs.admin_id\":\"Admin\",\"order_dispute_order_dispute_comments.inputs.description\":\"Description\",\"roles.name\":\"Roles\",\"roles.index_title\":\"Roles List\",\"roles.create_title\":\"Create Role\",\"roles.edit_title\":\"Edit Role\",\"roles.show_title\":\"Show Role\",\"roles.inputs.name\":\"Name\",\"permissions.name\":\"Permissions\",\"permissions.index_title\":\"Permissions List\",\"permissions.create_title\":\"Create Permission\",\"permissions.edit_title\":\"Edit Permission\",\"permissions.show_title\":\"Show Permission\",\"permissions.inputs.name\":\"Name\",\"order_dispute_order_dispute_messages.name\":\"OrderDispute Order Dispute Messages\",\"order_dispute_order_dispute_messages.index_title\":\"OrderDisputeMessages List\",\"order_dispute_order_dispute_messages.new_title\":\"New Order dispute message\",\"order_dispute_order_dispute_messages.create_title\":\"Create OrderDisputeMessage\",\"order_dispute_order_dispute_messages.edit_title\":\"Edit OrderDisputeMessage\",\"order_dispute_order_dispute_messages.show_title\":\"Show OrderDisputeMessage\",\"order_dispute_order_dispute_messages.inputs.text\":\"Text\",\"order_dispute_order_dispute_messages.inputs.image\":\"Image\",\"order_dispute_order_dispute_messages.inputs.type\":\"Type\",\"order_dispute_order_dispute_messages.inputs.seen\":\"Seen\",\"order_dispute_order_dispute_messages.inputs.order_dispute_messageable_id\":\"Order Dispute Messageable Id\",\"order_dispute_order_dispute_messages.inputs.order_dispute_messageable_type\":\"Order Dispute Messageable Type\",\"shifts.name\":\"Shifts\",\"shifts.index_title\":\"Shifts List\",\"shifts.new_title\":\"New Shift\",\"shifts.create_title\":\"Create Shift\",\"shifts.edit_title\":\"Edit Shift\",\"shifts.show_title\":\"Show Shift\",\"shifts.inputs.start_at\":\"Start At\",\"shifts.inputs.end_at\":\"End At\",\"shifts.inputs.total_order\":\"Total Order\",\"shifts.inputs.partner_id\":\"Partner\",\"shifts.inputs.partner_vehicle_id\":\"Partner Vehicle\",\"shifts.inputs.due\":\"Due\",\"shift_shift_timings.name\":\"Shift Shift Timings\",\"shift_shift_timings.index_title\":\"ShiftTimings List\",\"shift_shift_timings.new_title\":\"New Shift timing\",\"shift_shift_timings.create_title\":\"Create ShiftTiming\",\"shift_shift_timings.edit_title\":\"Edit ShiftTiming\",\"shift_shift_timings.show_title\":\"Show ShiftTiming\",\"shift_shift_timings.inputs.order_count\":\"Order Count\",\"shift_shift_timings.inputs.start_time\":\"Start Time\",\"shift_shift_timings.inputs.end_time\":\"End Time\",\"admin.setting\":\"Setting\",\"admin.settings.Contact_Email\":\"Contact Email\",\"admin.settings.Contact_Number\":\"Contact Number\",\"admin.settings.Site_Icon\":\"Site Icon\",\"admin.settings.Site_Logo\":\"Site Logo\",\"admin.settings.Site_Name\":\"Site Name\",\"admin.settings.android_push_key\":\"Android Push Key\",\"admin.settings.android_sender_key\":\"Android Sender Key\",\"admin.settings.booking_id_prefix\":\"Booking ID Prefix\",\"admin.settings.booking_prefix\":\"Booking ID Prefix\",\"admin.settings.broadcast_request\":\"Broadcast Request\",\"admin.settings.cash_payment\":\"Cash Payment\",\"admin.settings.currency\":\"Application Currency\",\"admin.settings.demo_mode\":\"Demo Mode\",\"admin.settings.distance_map\":\"Distance Map\",\"admin.settings.facebook_link\":\"Facebook Link\",\"admin.settings.fb_app_version\":\"Facebook App Version\",\"admin.settings.fb_public_key\":\"Facebook Public Key\",\"admin.settings.fb_redirect_url\":\"Facebook Redirect URL\",\"admin.settings.fb_secret_key\":\"Facebook Secret Key\",\"admin.settings.frontend\":\"Frontend\",\"admin.settings.google_map_key\":\"Google Map frontend Key\",\"admin.settings.google_public_key\":\"Google Public Key\",\"admin.settings.google_redirect_url\":\"Google Redirect URL\",\"admin.settings.google_secret_key\":\"Google Secret Key\",\"admin.settings.google_server_map_key\":\"Google Map server ip Key\",\"admin.settings.instagram_link\":\"Instagram Link\",\"admin.settings.limit_message\":\"Limit Message\",\"admin.settings.mail_driver\":\"Mail Driver\",\"admin.settings.mail_encryption\":\"Mail Encryption\",\"admin.settings.mail_from_address\":\"Mail From Address\",\"admin.settings.mail_host\":\"Mail Host\",\"admin.settings.mail_password\":\"Mail Password\",\"admin.settings.mail_port\":\"Mail Port\",\"admin.settings.mail_username\":\"Mail Username\",\"admin.settings.manual_request\":\"Manual Assignment\",\"admin.settings.online_payment\":\"Online Payment\",\"admin.settings.other\":\"Other Settings\",\"admin.settings.otp_verification\":\"OTP Verification\",\"admin.settings.order_accept_timeout\":\"Order Accept Timeout\",\"admin.settings.provider_search_radius\":\" Search Radius\",\"admin.settings.referral\":\"Referral\",\"admin.settings.referral_amount\":\"Referral Amount\",\"admin.settings.referral_count\":\"Referral Count\",\"admin.settings.send_mail\":\"Send Mail\",\"admin.settings.social_login\":\"Social Login\",\"admin.settings.store_link_android_user\":\"Android App Link\",\"admin.settings.store_link_ios_user\":\"IOS App Link\",\"admin.settings.timezone\":\"Timezone\",\"admin.settings.track_distance\":\"Track Distance\",\"admin.settings.twitter_link\":\"Twitter Link\",\"admin.settings.version_android_user\":\"Android App Version\",\"admin.settings.version_ios_user\":\"IOS App Version\",\"order_created\":\"Your Order Created Successfully\",\"order_accept_shop\":\"Your order Successfully Accepted By restaurant\",\"order_cancel_shop\":\"Shop Created Dispute against Your Order\",\"order_assigned_deliveryboy_user\":\"Your Order Assigned To DeliveryBoy\",\"order_assigned_deliveryboy\":\"New order request\",\"order_accept_deliveryboy\":\"Your Order no :id Ready To Dispatched\",\"order_cancel_deliveryboy\":\"Waiting For delivery Boy \",\"order_deliveryboy_reached\":\"Delivery Boy Reached\",\"order_pickedup\":\"Picked Up Your Order Successfully\",\"order_arrived\":\"Your Order is Arrived your Location\",\"order_completed\":\"Your Order is successfully Completed\",\"order_user_cancel\":\"Successfully cancel your Order\",\"order_dispute\":\"Successfully Created Dispute\",\"order_status\":\"Your Order Id :id Status is :status\",\"created\":\"Your Order  Created Successfully\",\"order_can_not_update\":\"Unable to update, Please try again later\",\"not_paid\":\"Payment not complete\",\"address_out_of_range\":\"Address Out Of Range\",\"dispute_created\":\"Dispute created against order \",\"dispute_resolved\":\"Dispute Resolved Successfully\",\"order_settled_by_admin\":\"Settled Your amount Successfully\",\"invalid_order\":\"The selected order  is invalid\",\"order_otp\":\"Your order Delivery Otp is :otp\",\"order_otp_mismatch\":\"Please Check Your Otp\",\"incoming_request\":\"You Have One Incoming Request\",\"reorder_created\":\"For Reorder Cart Added Successfully Please Proceed.\",\"review.create_review\":\"Review Created Successfully\",\"no_delivary_boy\":\"No Delivery People Available!\",\"invalid\":\"Invalid Order!\",\"order_note\":\"Order!\",\"new_order_note\":\"New Order!\",\"order_shop_not_found\":\"Your order is not served at the moment! Please try later\",\"dispatcher.pending_title\":\"Pending Orders\",\"dispatcher.accept_title\":\"Accepted Orders\",\"dispatcher.ongoing_title\":\"Ongoing Orders\",\"dispatcher.cancel_title\":\"Cancelled Orders\",\"dispatcher.order_pending\":\"CUSTOMER PENDING LIST\",\"dispatcher.order_accept\":\"DELIVERY PEOPLE LIST\",\"dispatcher.order_ongoing\":\"ONGOING ORDERS\",\"dispatcher.order_cancel\":\"CANCELLED ORDERS\",\"dispatcher.order_not_found\":\"No Incoming Requests at the moment!\",\"dispatcher.assign\":\"Assign\",\"dispatcher.assigned\":\"Assigned\",\"dispatcher.incoming_request\":\"Incoming Request\",\"dispatcher.dispute\":\"Dispute\",\"dispatcher.packed\":\"Picked - Up\",\"dispatcher.reached\":\"Reached\",\"dispatcher.arrived\":\"Arrived\",\"dispatcher.waiting\":\"Waiting\",\"dispatcher.processing\":\"Started Towards Source\",\"dispatcher.order_live_tracking\":\"Live Tracking\",\"card.no_card_exist\":\"Card Not Exist!\",\"payment.added_to_your_wallet\":\"Added To Your Wallet\",\"payment.failed\":\"Payment Failed\",\"previous\":\"&laquo; Previous\",\"next\":\"Next &raquo;\",\"reset\":\"Your password has been reset!\",\"sent\":\"We have emailed your password reset link!\",\"throttled\":\"Please wait before retrying.\",\"token\":\"This password reset token is invalid.\",\"user\":\"We can\'t find a user with that email address.\",\"accepted\":\"The :attribute must be accepted.\",\"accepted_if\":\"The :attribute must be accepted when :other is :value.\",\"active_url\":\"The :attribute is not a valid URL.\",\"after\":\"The :attribute must be a date after :date.\",\"after_or_equal\":\"The :attribute must be a date after or equal to :date.\",\"alpha\":\"The :attribute must only contain letters.\",\"alpha_dash\":\"The :attribute must only contain letters, numbers, dashes and underscores.\",\"alpha_num\":\"The :attribute must only contain letters and numbers.\",\"array\":\"The :attribute must be an array.\",\"before\":\"The :attribute must be a date before :date.\",\"before_or_equal\":\"The :attribute must be a date before or equal to :date.\",\"between.numeric\":\"The :attribute must be between :min and :max.\",\"between.file\":\"The :attribute must be between :min and :max kilobytes.\",\"between.string\":\"The :attribute must be between :min and :max characters.\",\"between.array\":\"The :attribute must have between :min and :max items.\",\"boolean\":\"The :attribute field must be true or false.\",\"confirmed\":\"The :attribute confirmation does not match.\",\"current_password\":\"The password is incorrect.\",\"date\":\"The :attribute is not a valid date.\",\"date_equals\":\"The :attribute must be a date equal to :date.\",\"date_format\":\"The :attribute does not match the format :format.\",\"different\":\"The :attribute and :other must be different.\",\"digits\":\"The :attribute must be :digits digits.\",\"digits_between\":\"The :attribute must be between :min and :max digits.\",\"dimensions\":\"The :attribute has invalid image dimensions.\",\"distinct\":\"The :attribute field has a duplicate value.\",\"email\":\"The :attribute must be a valid email address.\",\"ends_with\":\"The :attribute must end with one of the following: :values.\",\"exists\":\"The selected :attribute is invalid.\",\"file\":\"The :attribute must be a file.\",\"filled\":\"The :attribute field must have a value.\",\"gt.numeric\":\"The :attribute must be greater than :value.\",\"gt.file\":\"The :attribute must be greater than :value kilobytes.\",\"gt.string\":\"The :attribute must be greater than :value characters.\",\"gt.array\":\"The :attribute must have more than :value items.\",\"gte.numeric\":\"The :attribute must be greater than or equal :value.\",\"gte.file\":\"The :attribute must be greater than or equal :value kilobytes.\",\"gte.string\":\"The :attribute must be greater than or equal :value characters.\",\"gte.array\":\"The :attribute must have :value items or more.\",\"image\":\"The :attribute must be an image.\",\"in\":\"The selected :attribute is invalid.\",\"in_array\":\"The :attribute field does not exist in :other.\",\"integer\":\"The :attribute must be an integer.\",\"ip\":\"The :attribute must be a valid IP address.\",\"ipv4\":\"The :attribute must be a valid IPv4 address.\",\"ipv6\":\"The :attribute must be a valid IPv6 address.\",\"json\":\"The :attribute must be a valid JSON string.\",\"lt.numeric\":\"The :attribute must be less than :value.\",\"lt.file\":\"The :attribute must be less than :value kilobytes.\",\"lt.string\":\"The :attribute must be less than :value characters.\",\"lt.array\":\"The :attribute must have less than :value items.\",\"lte.numeric\":\"The :attribute must be less than or equal :value.\",\"lte.file\":\"The :attribute must be less than or equal :value kilobytes.\",\"lte.string\":\"The :attribute must be less than or equal :value characters.\",\"lte.array\":\"The :attribute must not have more than :value items.\",\"max.numeric\":\"The :attribute must not be greater than :max.\",\"max.file\":\"The :attribute must not be greater than :max kilobytes.\",\"max.string\":\"The :attribute must not be greater than :max characters.\",\"max.array\":\"The :attribute must not have more than :max items.\",\"mimes\":\"The :attribute must be a file of type: :values.\",\"mimetypes\":\"The :attribute must be a file of type: :values.\",\"min.numeric\":\"The :attribute must be at least :min.\",\"min.file\":\"The :attribute must be at least :min kilobytes.\",\"min.string\":\"The :attribute must be at least :min characters.\",\"min.array\":\"The :attribute must have at least :min items.\",\"multiple_of\":\"The :attribute must be a multiple of :value.\",\"not_in\":\"The selected :attribute is invalid.\",\"not_regex\":\"The :attribute format is invalid.\",\"numeric\":\"The :attribute must be a number.\",\"present\":\"The :attribute field must be present.\",\"regex\":\"The :attribute format is invalid.\",\"required\":\"The :attribute field is required.\",\"required_if\":\"The :attribute field is required when :other is :value.\",\"required_unless\":\"The :attribute field is required unless :other is in :values.\",\"required_with\":\"The :attribute field is required when :values is present.\",\"required_with_all\":\"The :attribute field is required when :values are present.\",\"required_without\":\"The :attribute field is required when :values is not present.\",\"required_without_all\":\"The :attribute field is required when none of :values are present.\",\"prohibited\":\"The :attribute field is prohibited.\",\"prohibited_if\":\"The :attribute field is prohibited when :other is :value.\",\"prohibited_unless\":\"The :attribute field is prohibited unless :other is in :values.\",\"prohibits\":\"The :attribute field prohibits :other from being present.\",\"same\":\"The :attribute and :other must match.\",\"size.numeric\":\"The :attribute must be :size.\",\"size.file\":\"The :attribute must be :size kilobytes.\",\"size.string\":\"The :attribute must be :size characters.\",\"size.array\":\"The :attribute must contain :size items.\",\"starts_with\":\"The :attribute must start with one of the following: :values.\",\"string\":\"The :attribute must be a string.\",\"timezone\":\"The :attribute must be a valid timezone.\",\"unique\":\"The :attribute has already been taken.\",\"uploaded\":\"The :attribute failed to upload.\",\"url\":\"The :attribute must be a valid URL.\",\"uuid\":\"The :attribute must be a valid UUID.\",\"custom.attribute-name.rule-name\":\"custom-message\",\"attributes\":[],\"form.whoops\":\"Oops Something went wrong\"},\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:58'),(275,'96b906d6-5f67-4250-b416-37b3dcd7f2a5','96b906d6-668b-4b44-852d-80916536b257',NULL,1,'view','{\"name\":\"components.translations\",\"path\":\"\\/resources\\/views\\/components\\/translations.blade.php\",\"data\":[\"translations\",\"componentName\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:58'),(276,'96b906d6-5ffd-4443-af5e-252dfbf97cc4','96b906d6-668b-4b44-852d-80916536b257',NULL,1,'view','{\"name\":\"components.resp-helper\",\"path\":\"\\/resources\\/views\\/components\\/resp-helper.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:58'),(277,'96b906d6-6218-4814-afc6-04835b2bd514','96b906d6-668b-4b44-852d-80916536b257',NULL,1,'request','{\"ip_address\":\"10.0.2.2\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomeController@home\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost:8080\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\" Not;A Brand\\\";v=\\\"99\\\", \\\"Microsoft Edge\\\";v=\\\"103\\\", \\\"Chromium\\\";v=\\\"103\\\"\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"upgrade-insecure-requests\":\"1\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/103.0.5060.66 Safari\\/537.36 Edg\\/103.0.1264.44\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-dest\":\"empty\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-US,en;q=0.9\"},\"payload\":[],\"session\":{\"_token\":\"ol5w6V9kS0Hd6NE6Zknys6ca7HgRu9VXjbkjdHQB\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8080\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"view\":\"\\/var\\/www\\/html\\/thinkinfood\\/resources\\/views\\/app.blade.php\",\"data\":{\"page\":{\"component\":\"Splash\",\"props\":{\"errors\":[],\"auth\":{\"user\":null},\"cart\":{\"can\":false,\"cart_data\":null},\"order\":{\"can\":false,\"order_data\":null},\"type\":\"user\",\"session\":[],\"address\":null,\"latitude\":null,\"longitude\":null,\"isLogin\":false,\"notificationCount\":null,\"social_login\":false,\"canResetPassword\":true,\"status\":null,\"urlPrev\":\"empty\"},\"url\":\"\\/\",\"version\":\"cf78b40a09b28d5cfd37708617d3280f\"}}},\"duration\":1028,\"memory\":16,\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:58'),(278,'96b906d8-c334-435a-abee-603dd7656548','96b906d8-c415-40f8-963f-e9701d73ed41',NULL,1,'request','{\"ip_address\":\"10.0.2.2\",\"uri\":\"\\/manifest.json\",\"method\":\"GET\",\"controller_action\":\"LaravelPWA\\\\Http\\\\Controllers\\\\LaravelPWAController@manifestJson\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost:8080\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\" Not;A Brand\\\";v=\\\"99\\\", \\\"Microsoft Edge\\\";v=\\\"103\\\", \\\"Chromium\\\";v=\\\"103\\\"\",\"accept\":\"*\\/*\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/103.0.5060.66 Safari\\/537.36 Edg\\/103.0.1264.44\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/localhost:8080\\/\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-US,en;q=0.9\"},\"payload\":[],\"session\":{\"_token\":\"hUEtbItweYCjusNvQsPnzj2ZTGMveBfiWuxk89y0\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8080\\/manifest.json\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"name\":\"Food Chef\",\"short_name\":\"Food Chef\",\"start_url\":\"http:\\/\\/localhost:8080\\/\",\"display\":\"standalone\",\"theme_color\":\"#000000\",\"background_color\":\"#ffffff\",\"orientation\":\"portrait\",\"status_bar\":\"black\",\"splash\":{\"640x1136\":\"\\/images\\/icons\\/splash-640x1136.png\",\"750x1334\":\"\\/images\\/icons\\/splash-750x1334.png\",\"828x1792\":\"\\/images\\/icons\\/splash-828x1792.png\",\"1125x2436\":\"\\/images\\/icons\\/splash-1125x2436.png\",\"1242x2208\":\"\\/images\\/icons\\/splash-1242x2208.png\",\"1242x2688\":\"\\/images\\/icons\\/splash-1242x2688.png\",\"1536x2048\":\"\\/images\\/icons\\/splash-1536x2048.png\",\"1668x2224\":\"\\/images\\/icons\\/splash-1668x2224.png\",\"1668x2388\":\"\\/images\\/icons\\/splash-1668x2388.png\",\"2048x2732\":\"\\/images\\/icons\\/splash-2048x2732.png\"},\"icons\":[{\"src\":\"\\/images\\/icons\\/icon-72x72.png\",\"type\":\"image\\/png\",\"sizes\":\"72x72\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-96x96.png\",\"type\":\"image\\/png\",\"sizes\":\"96x96\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-128x128.png\",\"type\":\"image\\/png\",\"sizes\":\"128x128\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-144x144.png\",\"type\":\"image\\/png\",\"sizes\":\"144x144\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-152x152.png\",\"type\":\"image\\/png\",\"sizes\":\"152x152\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-192x192.png\",\"type\":\"image\\/png\",\"sizes\":\"192x192\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-384x384.png\",\"type\":\"image\\/png\",\"sizes\":\"384x384\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-512x512.png\",\"type\":\"image\\/png\",\"sizes\":\"512x512\",\"purpose\":\"any\"}],\"shortcuts\":[{\"name\":\"Search\",\"description\":\"Food Right now\",\"url\":\"\\/search\",\"icons\":[{\"src\":\"\\/images\\/icons\\/icon-72x72.png\",\"type\":\"image\\/png\",\"purpose\":\"any maskable\"}]},{\"name\":\"Shop\",\"description\":\"Login as Shop\",\"url\":\"\\/shop\\/login\",\"icons\":[{\"src\":\"\\/images\\/icons\\/shop\\/icon-72x72.png\",\"type\":\"image\\/png\",\"purpose\":\"any maskable\"}]},{\"name\":\"Partner\",\"description\":\"Login as Partner\",\"url\":\"\\/partner\\/login\",\"icons\":[{\"src\":\"\\/images\\/icons\\/partner\\/icon-72x72.png\",\"type\":\"image\\/png\",\"purpose\":\"any maskable\"}]}]},\"duration\":93,\"memory\":6,\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:17:59'),(279,'96b906e5-866c-4f08-8959-b3e19ece8f11','96b906e5-8c06-49b1-b026-05afa1153df3',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `banners`\",\"time\":\"8.71\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/app\\/Http\\/Controllers\\/HomeController.php\",\"line\":29,\"hash\":\"92879c999ec27583fee51ba202e6c59c\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:08'),(280,'96b906e5-89f7-43f3-94f5-b7bf6006ce4c','96b906e5-8c06-49b1-b026-05afa1153df3',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `categories` where `categories`.`deleted_at` is null\",\"time\":\"2.14\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/app\\/Http\\/Controllers\\/HomeController.php\",\"line\":30,\"hash\":\"682a4786ea6c57f0d0ebfa86cbc67ac1\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:08'),(281,'96b906e5-8b8a-4d7c-9ea4-81d6b90a624a','96b906e5-8c06-49b1-b026-05afa1153df3',NULL,1,'request','{\"ip_address\":\"10.0.2.2\",\"uri\":\"\\/home\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomeController@show\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost:8080\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\" Not;A Brand\\\";v=\\\"99\\\", \\\"Microsoft Edge\\\";v=\\\"103\\\", \\\"Chromium\\\";v=\\\"103\\\"\",\"x-xsrf-token\":\"eyJpdiI6ImkxYmZ4eFIwMmlUQy9sS2J6ekVoWVE9PSIsInZhbHVlIjoiNHRGRk9ZNmhUeVdyak5pNWZSR0doL05OdXFXMk84WHp2cmlSRVoyeE9yKzhBN1k1QTROV3YvaGpMNDB3ajNnREpYSWpERC9JNFVQdjR4UUJHNC8vQW15NVJPL1NzVHBuTSsySUVsQzRQR0xXdVhIQWorQ25QTjJBbDlJSGQ5a2QiLCJtYWMiOiI0ZjEyZjc2NTFkNzJlNTRjNTgyNDY4OGJiMGJiZGQ3ODMzNGI4ZjIyMmY0OTIxMjU0MWY4YzQyNjg4M2ZjMmY4IiwidGFnIjoiIn0=\",\"sec-ch-ua-mobile\":\"?0\",\"x-inertia\":\"true\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/103.0.5060.66 Safari\\/537.36 Edg\\/103.0.1264.44\",\"content-type\":\"application\\/json\",\"x-socket-id\":\"9605.4762375\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"cf78b40a09b28d5cfd37708617d3280f\",\"x-requested-with\":\"XMLHttpRequest\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/localhost:8080\\/\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6ImkxYmZ4eFIwMmlUQy9sS2J6ekVoWVE9PSIsInZhbHVlIjoiNHRGRk9ZNmhUeVdyak5pNWZSR0doL05OdXFXMk84WHp2cmlSRVoyeE9yKzhBN1k1QTROV3YvaGpMNDB3ajNnREpYSWpERC9JNFVQdjR4UUJHNC8vQW15NVJPL1NzVHBuTSsySUVsQzRQR0xXdVhIQWorQ25QTjJBbDlJSGQ5a2QiLCJtYWMiOiI0ZjEyZjc2NTFkNzJlNTRjNTgyNDY4OGJiMGJiZGQ3ODMzNGI4ZjIyMmY0OTIxMjU0MWY4YzQyNjg4M2ZjMmY4IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkswMkRtazlwcTBNM1ZFZ2dBbkwyWXc9PSIsInZhbHVlIjoibHdBbHFvNzBPWSsrbUxtc3JkMTdyS0E0NkhoUm1wQmhSNXMzemlhc0YyZ0RKMHdwN21JalRiQm9MWHVVTEdUc1FiWWhzRW9QOTVBaXQ4SW44cW9FNmc0eUJGNVA3NkZ4b0MyRk1oMjlNc0h3YWNzeUs2Q0Npam1BOElBRnYwYnIiLCJtYWMiOiI2YWE3ZDQ4MzQzYmNmNmJlMWZhNWM0ODMxMGFmMDJjYzE0OGYzMTkzZjQ3NDBhMmZjOTZjNzBjYzI5MDlkZmNiIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"ol5w6V9kS0Hd6NE6Zknys6ca7HgRu9VXjbkjdHQB\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8080\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"component\":\"Welcome\",\"props\":{\"errors\":[],\"auth\":{\"user\":null},\"cart\":{\"can\":false,\"cart_data\":null},\"order\":{\"can\":false,\"order_data\":null},\"type\":\"user\",\"session\":[],\"address\":null,\"latitude\":null,\"longitude\":null,\"isLogin\":false,\"notificationCount\":null,\"social_login\":false,\"canResetPassword\":true,\"status\":null,\"urlPrev\":\"http:\\/\\/localhost:8080\\/\",\"shops\":null,\"banner\":[],\"categories\":[]},\"url\":\"\\/home\",\"version\":\"cf78b40a09b28d5cfd37708617d3280f\"},\"duration\":139,\"memory\":8,\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:08'),(282,'96b90700-2273-42dd-81c1-76babd90c5c9','96b90700-83f4-4a41-9412-f5d24cd1bc10',NULL,1,'view','{\"name\":\"app\",\"path\":\"\\/resources\\/views\\/app.blade.php\",\"data\":[\"page\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:25'),(283,'96b90700-588e-4b3d-b8c2-eb02912a929b','96b90700-83f4-4a41-9412-f5d24cd1bc10',NULL,1,'view','{\"name\":\"components.pwa\",\"path\":\"\\/resources\\/views\\/components\\/pwa.blade.php\",\"data\":[\"config\",\"user\",\"componentName\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:25'),(284,'96b90700-5ae2-4950-9195-caedb83f2f84','96b90700-83f4-4a41-9412-f5d24cd1bc10',NULL,1,'view','{\"name\":\"laravelpwa::meta\",\"path\":\"\\/resources\\/views\\/vendor\\/laravelpwa\\/meta.blade.php\",\"data\":[\"config\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:25'),(285,'96b90700-5c92-48d5-b524-9c42712c4d2a','96b90700-83f4-4a41-9412-f5d24cd1bc10',NULL,1,'view','{\"name\":\"components.settings\",\"path\":\"\\/resources\\/views\\/components\\/settings.blade.php\",\"data\":[\"settings\",\"componentName\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:25'),(286,'96b90700-604b-4398-b9b8-0948529222bf','96b90700-83f4-4a41-9412-f5d24cd1bc10',NULL,1,'view','{\"name\":\"components.loader\",\"path\":\"\\/resources\\/views\\/components\\/loader.blade.php\",\"data\":[\"componentName\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:25'),(287,'96b90700-6537-4740-87f8-31987b606d68','96b90700-83f4-4a41-9412-f5d24cd1bc10',NULL,1,'cache','{\"type\":\"hit\",\"key\":\"translations_en\",\"value\":{\"failed\":\"These credentials do not match our records.\",\"password\":\"The password is incorrect.\",\"throttle\":\"Too many login attempts. Please try again in :seconds seconds.\",\"common.actions\":\"Actions\",\"common.create\":\"Create\",\"common.edit\":\"Edit\",\"common.update\":\"Update\",\"common.new\":\"New\",\"common.cancel\":\"Cancel\",\"common.save\":\"Save\",\"common.delete\":\"Delete\",\"common.delete_selected\":\"Delete selected\",\"common.search\":\"Search...\",\"common.back\":\"Back to Index\",\"common.are_you_sure\":\"Are you sure?\",\"common.no_items_found\":\"No items found\",\"common.created\":\"Successfully created\",\"common.saved\":\"Saved successfully\",\"common.removed\":\"Successfully removed\",\"notice_boards.name\":\"Notice Boards\",\"notice_boards.index_title\":\"NoticeBoards List\",\"notice_boards.new_title\":\"New Notice board\",\"notice_boards.create_title\":\"Create NoticeBoard\",\"notice_boards.edit_title\":\"Edit NoticeBoard\",\"notice_boards.show_title\":\"Show NoticeBoard\",\"notice_boards.inputs.for\":\"For\",\"notice_boards.inputs.title\":\"Title\",\"notice_boards.inputs.notice\":\"Notice\",\"notice_boards.inputs.note\":\"Note\",\"users.name\":\"Users\",\"users.index_title\":\"Users List\",\"users.new_title\":\"New User\",\"users.create_title\":\"Create User\",\"users.edit_title\":\"Edit User\",\"users.show_title\":\"Show User\",\"users.inputs.name\":\"Name\",\"users.inputs.email\":\"Email\",\"users.inputs.password\":\"Password\",\"users.inputs.phone\":\"Phone\",\"users.inputs.otp\":\"Otp\",\"users.inputs.status\":\"Status\",\"users.inputs.image\":\"Image\",\"admins.name\":\"Admins\",\"admins.index_title\":\"Admins List\",\"admins.new_title\":\"New Admin\",\"admins.create_title\":\"Create Admin\",\"admins.edit_title\":\"Edit Admin\",\"admins.show_title\":\"Show Admin\",\"admins.inputs.name\":\"Name\",\"admins.inputs.email\":\"Email\",\"admins.inputs.password\":\"Password\",\"admins.inputs.remember_token\":\"Remember Token\",\"admins.inputs.status\":\"Status\",\"admins.inputs.email_verified_at\":\"Email Verified At\",\"admins.inputs.phone\":\"Phone\",\"admins.inputs.otp\":\"Otp\",\"admins.inputs.image\":\"Image\",\"partners.name\":\"Partners\",\"partners.index_title\":\"Partners List\",\"partners.new_title\":\"New Partner\",\"partners.create_title\":\"Create Partner\",\"partners.edit_title\":\"Edit Partner\",\"partners.show_title\":\"Show Partner\",\"partners.inputs.name\":\"Name\",\"partners.inputs.email\":\"Email\",\"partners.inputs.phone\":\"Phone\",\"partners.inputs.otp\":\"Otp\",\"partners.inputs.password\":\"Password\",\"partners.inputs.remember_token\":\"Remember Token\",\"partners.inputs.status\":\"Status\",\"partners.inputs.email_verified_at\":\"Email Verified At\",\"partners.inputs.image\":\"Image\",\"user_orders.name\":\"User Orders\",\"user_orders.index_title\":\"Orders List\",\"user_orders.new_title\":\"New Order\",\"user_orders.create_title\":\"Create Order\",\"user_orders.edit_title\":\"Edit Order\",\"user_orders.show_title\":\"Show Order\",\"user_orders.inputs.invoice_id\":\"Invoice Id\",\"user_orders.inputs.user_address_id\":\"User Address\",\"user_orders.inputs.shop_id\":\"Shop\",\"user_orders.inputs.partner_id\":\"Partner\",\"user_orders.inputs.partner_vehicle_id\":\"Partner Vehicle\",\"user_orders.inputs.note\":\"Note\",\"user_orders.inputs.route_key\":\"Route Key\",\"user_orders.inputs.dispute\":\"Dispute\",\"user_orders.inputs.delivery_date\":\"Delivery Date\",\"user_orders.inputs.order_otp\":\"Order Otp\",\"user_orders.inputs.order_ready_time\":\"Order Ready Time\",\"user_orders.inputs.order_ready_status\":\"Order Ready Status\",\"user_orders.inputs.status\":\"Status\",\"user_orders.inputs.schedule_status\":\"Schedule Status\",\"user_orders.inputs.schedule_at\":\"Schedule At\",\"user_order_ratings.name\":\"User Order Ratings\",\"user_order_ratings.index_title\":\"OrderRatings List\",\"user_order_ratings.new_title\":\"New Order rating\",\"user_order_ratings.create_title\":\"Create OrderRating\",\"user_order_ratings.edit_title\":\"Edit OrderRating\",\"user_order_ratings.show_title\":\"Show OrderRating\",\"user_order_ratings.inputs.order_id\":\"Order\",\"user_order_ratings.inputs.user_rating\":\"User Rating\",\"user_order_ratings.inputs.user_comment\":\"User Comment\",\"user_order_ratings.inputs.partner_id\":\"Partner\",\"user_order_ratings.inputs.partner_rating\":\"Partner Rating\",\"user_order_ratings.inputs.partner_comment\":\"Partner Comment\",\"user_order_ratings.inputs.shop_id\":\"Shop\",\"user_order_ratings.inputs.shop_rating\":\"Shop Rating\",\"user_order_ratings.inputs.shop_comment\":\"Shop Comment\",\"user_carts.name\":\"User Carts\",\"user_carts.index_title\":\"Carts List\",\"user_carts.new_title\":\"New Cart\",\"user_carts.create_title\":\"Create Cart\",\"user_carts.edit_title\":\"Edit Cart\",\"user_carts.show_title\":\"Show Cart\",\"user_carts.inputs.shop_id\":\"Shop\",\"user_carts.inputs.promocode_id\":\"Promocode\",\"user_carts.inputs.order_id\":\"Order\",\"partner_orders.name\":\"Partner Orders\",\"partner_orders.index_title\":\"Orders List\",\"partner_orders.new_title\":\"New Order\",\"partner_orders.create_title\":\"Create Order\",\"partner_orders.edit_title\":\"Edit Order\",\"partner_orders.show_title\":\"Show Order\",\"partner_orders.inputs.invoice_id\":\"Invoice Id\",\"partner_orders.inputs.user_id\":\"User\",\"partner_orders.inputs.user_address_id\":\"User Address\",\"partner_orders.inputs.shop_id\":\"Shop\",\"partner_orders.inputs.partner_vehicle_id\":\"Partner Vehicle\",\"partner_orders.inputs.note\":\"Note\",\"partner_orders.inputs.route_key\":\"Route Key\",\"partner_orders.inputs.dispute\":\"Dispute\",\"partner_orders.inputs.delivery_date\":\"Delivery Date\",\"partner_orders.inputs.order_otp\":\"Order Otp\",\"partner_orders.inputs.order_ready_time\":\"Order Ready Time\",\"partner_orders.inputs.order_ready_status\":\"Order Ready Status\",\"partner_orders.inputs.status\":\"Status\",\"partner_orders.inputs.schedule_status\":\"Schedule Status\",\"partner_orders.inputs.schedule_at\":\"Schedule At\",\"partner_partner_vehicles.name\":\"Partner Partner Vehicles\",\"partner_partner_vehicles.index_title\":\"PartnerVehicles List\",\"partner_partner_vehicles.new_title\":\"New Partner vehicle\",\"partner_partner_vehicles.create_title\":\"Create PartnerVehicle\",\"partner_partner_vehicles.edit_title\":\"Edit PartnerVehicle\",\"partner_partner_vehicles.show_title\":\"Show PartnerVehicle\",\"partner_partner_vehicles.inputs.vehicle_no\":\"Vehicle No\",\"partner_partner_vehicles.inputs.vehicle_type\":\"Vehicle Type\",\"partner_order_ratings.name\":\"Partner Order Ratings\",\"partner_order_ratings.index_title\":\"OrderRatings List\",\"partner_order_ratings.new_title\":\"New Order rating\",\"partner_order_ratings.create_title\":\"Create OrderRating\",\"partner_order_ratings.edit_title\":\"Edit OrderRating\",\"partner_order_ratings.show_title\":\"Show OrderRating\",\"partner_order_ratings.inputs.order_id\":\"Order\",\"partner_order_ratings.inputs.user_id\":\"User\",\"partner_order_ratings.inputs.user_rating\":\"User Rating\",\"partner_order_ratings.inputs.user_comment\":\"User Comment\",\"partner_order_ratings.inputs.partner_rating\":\"Partner Rating\",\"partner_order_ratings.inputs.partner_comment\":\"Partner Comment\",\"partner_order_ratings.inputs.shop_id\":\"Shop\",\"partner_order_ratings.inputs.shop_rating\":\"Shop Rating\",\"partner_order_ratings.inputs.shop_comment\":\"Shop Comment\",\"inqueries.name\":\"Inqueries\",\"inqueries.index_title\":\"Inqueries List\",\"inqueries.new_title\":\"New Inquery\",\"inqueries.create_title\":\"Create Inquery\",\"inqueries.edit_title\":\"Edit Inquery\",\"inqueries.show_title\":\"Show Inquery\",\"inqueries.inputs.name\":\"Name\",\"inqueries.inputs.email\":\"Email\",\"inqueries.inputs.phone\":\"Phone\",\"inqueries.inputs.for\":\"For\",\"inqueries.inputs.message\":\"Message\",\"promocodes.name\":\"Promocodes\",\"promocodes.index_title\":\"Promocodes List\",\"promocodes.new_title\":\"New Promocode\",\"promocodes.create_title\":\"Create Promocode\",\"promocodes.edit_title\":\"Edit Promocode\",\"promocodes.show_title\":\"Show Promocode\",\"promocodes.inputs.name\":\"Name\",\"promocodes.inputs.description\":\"Description\",\"promocodes.inputs.promo_code\":\"Promo Code\",\"promocodes.inputs.percentage\":\"Percentage\",\"promocodes.inputs.max_amount\":\"Max Amount\",\"promocodes.inputs.expire_at\":\"Expire At\",\"promocodes.inputs.status\":\"Status\",\"reasons.name\":\"Reasons\",\"reasons.index_title\":\"Reasons List\",\"reasons.new_title\":\"New Reason\",\"reasons.create_title\":\"Create Reason\",\"reasons.edit_title\":\"Edit Reason\",\"reasons.show_title\":\"Show Reason\",\"reasons.inputs.message\":\"Message\",\"reasons.inputs.for\":\"For\",\"reasons.inputs.type\":\"Type\",\"documents.name\":\"Documents\",\"documents.index_title\":\"Documents List\",\"documents.new_title\":\"New Document\",\"documents.create_title\":\"Create Document\",\"documents.edit_title\":\"Edit Document\",\"documents.show_title\":\"Show Document\",\"documents.inputs.name\":\"Name\",\"documents.inputs.for\":\"For\",\"documents.inputs.status\":\"Status\",\"images.name\":\"Images\",\"images.index_title\":\"Images List\",\"images.new_title\":\"New Image\",\"images.create_title\":\"Create Image\",\"images.edit_title\":\"Edit Image\",\"images.show_title\":\"Show Image\",\"images.inputs.imageable_id\":\"Imageable Id\",\"images.inputs.imageable_type\":\"Imageable Type\",\"images.inputs.image\":\"Image\",\"images.inputs.status\":\"Status\",\"images.inputs.position\":\"Position\",\"images.inputs.default\":\"Default\",\"orders.name\":\"Orders\",\"orders.index_title\":\"Orders List\",\"orders.new_title\":\"New Order\",\"orders.create_title\":\"Create Order\",\"orders.edit_title\":\"Edit Order\",\"orders.show_title\":\"Show Order\",\"orders.inputs.invoice_id\":\"Invoice Id\",\"orders.inputs.user_id\":\"User\",\"orders.inputs.user_address_id\":\"User Address\",\"orders.inputs.shop_id\":\"Shop\",\"orders.inputs.partner_id\":\"Partner\",\"orders.inputs.partner_vehicle_id\":\"Partner Vehicle\",\"orders.inputs.note\":\"Note\",\"orders.inputs.route_key\":\"Route Key\",\"orders.inputs.dispute\":\"Dispute\",\"orders.inputs.delivery_date\":\"Delivery Date\",\"orders.inputs.order_otp\":\"Order Otp\",\"orders.inputs.order_ready_time\":\"Order Ready Time\",\"orders.inputs.order_ready_status\":\"Order Ready Status\",\"orders.inputs.status\":\"Status\",\"orders.inputs.schedule_status\":\"Schedule Status\",\"orders.inputs.schedule_at\":\"Schedule At\",\"order_order_ratings.name\":\"Order Order Ratings\",\"order_order_ratings.index_title\":\"OrderRatings List\",\"order_order_ratings.new_title\":\"New Order rating\",\"order_order_ratings.create_title\":\"Create OrderRating\",\"order_order_ratings.edit_title\":\"Edit OrderRating\",\"order_order_ratings.show_title\":\"Show OrderRating\",\"order_order_ratings.inputs.user_id\":\"User\",\"order_order_ratings.inputs.user_rating\":\"User Rating\",\"order_order_ratings.inputs.user_comment\":\"User Comment\",\"order_order_ratings.inputs.partner_id\":\"Partner\",\"order_order_ratings.inputs.partner_rating\":\"Partner Rating\",\"order_order_ratings.inputs.partner_comment\":\"Partner Comment\",\"order_order_ratings.inputs.shop_id\":\"Shop\",\"order_order_ratings.inputs.shop_rating\":\"Shop Rating\",\"order_order_ratings.inputs.shop_comment\":\"Shop Comment\",\"order_order_invoices.name\":\"Order Order Invoices\",\"order_order_invoices.index_title\":\"OrderInvoices List\",\"order_order_invoices.new_title\":\"New Order invoice\",\"order_order_invoices.create_title\":\"Create OrderInvoice\",\"order_order_invoices.edit_title\":\"Edit OrderInvoice\",\"order_order_invoices.show_title\":\"Show OrderInvoice\",\"order_order_invoices.inputs.quantity\":\"Quantity\",\"order_order_invoices.inputs.paid\":\"Paid\",\"order_order_invoices.inputs.gross\":\"Gross\",\"order_order_invoices.inputs.discount\":\"Discount\",\"order_order_invoices.inputs.delivery_charge\":\"Delivery Charge\",\"order_order_invoices.inputs.payable\":\"Payable\",\"order_order_invoices.inputs.tax\":\"Tax\",\"order_order_invoices.inputs.tax_percent\":\"Tax Percent\",\"order_order_invoices.inputs.net\":\"Net\",\"order_order_invoices.inputs.payment_mode\":\"Payment Mode\",\"order_order_invoices.inputs.DestinationTag\":\"Destination Tag\",\"order_order_invoices.inputs.payment_id\":\"Payment Id\",\"order_order_invoices.inputs.status\":\"Status\",\"order_order_disputes.name\":\"Order Order Disputes\",\"order_order_disputes.index_title\":\"OrderDisputes List\",\"order_order_disputes.new_title\":\"New Order dispute\",\"order_order_disputes.create_title\":\"Create OrderDispute\",\"order_order_disputes.edit_title\":\"Edit OrderDispute\",\"order_order_disputes.show_title\":\"Show OrderDispute\",\"order_order_disputes.inputs.reason_id\":\"Reason\",\"order_order_disputes.inputs.type\":\"Type\",\"order_order_disputes.inputs.created_by\":\"Created By\",\"order_order_disputes.inputs.created_to\":\"Created To\",\"order_order_disputes.inputs.status\":\"Status\",\"order_order_disputes.inputs.description\":\"Description\",\"shops.name\":\"Shops\",\"shops.index_title\":\"Shops List\",\"shops.new_title\":\"New Shop\",\"shops.create_title\":\"Create Shop\",\"shops.edit_title\":\"Edit Shop\",\"shops.show_title\":\"Show Shop\",\"shops.inputs.name\":\"Name\",\"shops.inputs.email\":\"Email\",\"shops.inputs.phone\":\"Phone\",\"shops.inputs.otp\":\"Otp\",\"shops.inputs.password\":\"Password\",\"shops.inputs.email_verified_at\":\"Email Verified At\",\"shops.inputs.remember_token\":\"Remember Token\",\"shops.inputs.status\":\"Status\",\"shop_shop_categories.name\":\"Shop Shop Categories\",\"shop_shop_categories.index_title\":\"ShopCategories List\",\"shop_shop_categories.new_title\":\"New Shop category\",\"shop_shop_categories.create_title\":\"Create ShopCategory\",\"shop_shop_categories.edit_title\":\"Edit ShopCategory\",\"shop_shop_categories.show_title\":\"Show ShopCategory\",\"shop_shop_categories.inputs.name\":\"Name\",\"shop_shop_categories.inputs.image\":\"Image\",\"shop_shop_categories.inputs.status\":\"Status\",\"shop_shop_categories.inputs.description\":\"Description\",\"shop_shop_categories.inputs.parent_id\":\"Parent Shop Category\",\"categories.name\":\"Categories\",\"categories.index_title\":\"Categories List\",\"categories.new_title\":\"New Category\",\"categories.create_title\":\"Create Category\",\"categories.edit_title\":\"Edit Category\",\"categories.show_title\":\"Show Category\",\"categories.inputs.parent_id\":\"Parent Category\",\"categories.inputs.name\":\"Name\",\"categories.inputs.image\":\"Image\",\"categories.inputs.status\":\"Status\",\"categories.inputs.description\":\"Description\",\"shop_products.name\":\"Shop Products\",\"shop_products.index_title\":\"Products List\",\"shop_products.new_title\":\"New Product\",\"shop_products.create_title\":\"Create Product\",\"shop_products.edit_title\":\"Edit Product\",\"shop_products.show_title\":\"Show Product\",\"shop_products.inputs.shop_category_id\":\"Shop Category\",\"shop_products.inputs.name\":\"Name\",\"shop_products.inputs.description\":\"Description\",\"shop_products.inputs.position\":\"Position\",\"shop_products.inputs.food_type\":\"Food Type\",\"shop_products.inputs.avalability\":\"Avalability\",\"shop_products.inputs.max_quantity\":\"Max Quantity\",\"shop_products.inputs.featured\":\"Featured\",\"shop_products.inputs.addon_status\":\"Addon Status\",\"shop_products.inputs.variant_status\":\"Variant Status\",\"shop_products.inputs.out_of_stock\":\"Out Of Stock\",\"shop_products.inputs.status\":\"Status\",\"shop_addons.name\":\"Shop Addons\",\"shop_addons.index_title\":\"Addons List\",\"shop_addons.new_title\":\"New Addon\",\"shop_addons.create_title\":\"Create Addon\",\"shop_addons.edit_title\":\"Edit Addon\",\"shop_addons.show_title\":\"Show Addon\",\"shop_addons.inputs.name\":\"Name\",\"shop_addons.inputs.status\":\"Status\",\"products.name\":\"Products\",\"products.index_title\":\"Products List\",\"products.new_title\":\"New Product\",\"products.create_title\":\"Create Product\",\"products.edit_title\":\"Edit Product\",\"products.show_title\":\"Show Product\",\"products.inputs.shop_category_id\":\"Shop Category\",\"products.inputs.name\":\"Name\",\"products.inputs.description\":\"Description\",\"products.inputs.shop_id\":\"Shop\",\"products.inputs.position\":\"Position\",\"products.inputs.food_type\":\"Food Type\",\"products.inputs.avalability\":\"Avalability\",\"products.inputs.max_quantity\":\"Max Quantity\",\"products.inputs.featured\":\"Featured\",\"products.inputs.addon_status\":\"Addon Status\",\"products.inputs.variant_status\":\"Variant Status\",\"products.inputs.out_of_stock\":\"Out Of Stock\",\"products.inputs.status\":\"Status\",\"product_product_variants.name\":\"Product Product Variants\",\"product_product_variants.index_title\":\"ProductVariants List\",\"product_product_variants.new_title\":\"New Product variant\",\"product_product_variants.create_title\":\"Create ProductVariant\",\"product_product_variants.edit_title\":\"Edit ProductVariant\",\"product_product_variants.show_title\":\"Show ProductVariant\",\"product_product_variants.inputs.type\":\"Type\",\"product_product_variants.inputs.variant_id\":\"Variant\",\"product_product_variants.inputs.status\":\"Status\",\"shop_shop_timings.name\":\"Shop Shop Timings\",\"shop_shop_timings.index_title\":\"ShopTimings List\",\"shop_shop_timings.new_title\":\"New Shop timing\",\"shop_shop_timings.create_title\":\"Create ShopTiming\",\"shop_shop_timings.edit_title\":\"Edit ShopTiming\",\"shop_shop_timings.show_title\":\"Show ShopTiming\",\"shop_shop_timings.inputs.start_time\":\"Start Time\",\"shop_shop_timings.inputs.end_time\":\"End Time\",\"shop_shop_timings.inputs.day\":\"Day\",\"product_variant_product_prices.name\":\"ProductVariant Product Prices\",\"product_variant_product_prices.index_title\":\"ProductPrices List\",\"product_variant_product_prices.new_title\":\"New Product price\",\"product_variant_product_prices.create_title\":\"Create ProductPrice\",\"product_variant_product_prices.edit_title\":\"Edit ProductPrice\",\"product_variant_product_prices.show_title\":\"Show ProductPrice\",\"product_variant_product_prices.inputs.price\":\"Price\",\"product_variant_product_prices.inputs.orignal_price\":\"Orignal Price\",\"product_variant_product_prices.inputs.currency\":\"Currency\",\"product_variant_product_prices.inputs.discount\":\"Discount\",\"product_variant_product_prices.inputs.discount_type\":\"Discount Type\",\"variants.name\":\"Variants\",\"variants.index_title\":\"Variants List\",\"variants.new_title\":\"New Variant\",\"variants.create_title\":\"Create Variant\",\"variants.edit_title\":\"Edit Variant\",\"variants.show_title\":\"Show Variant\",\"variants.inputs.name\":\"Name\",\"variants.inputs.status\":\"Status\",\"variants.inputs.shop_id\":\"Shop\",\"addons.name\":\"Addons\",\"addons.index_title\":\"Addons List\",\"addons.new_title\":\"New Addon\",\"addons.create_title\":\"Create Addon\",\"addons.edit_title\":\"Edit Addon\",\"addons.show_title\":\"Show Addon\",\"addons.inputs.name\":\"Name\",\"addons.inputs.status\":\"Status\",\"addons.inputs.shop_id\":\"Shop\",\"shop_variants.name\":\"Shop Variants\",\"shop_variants.index_title\":\"Variants List\",\"shop_variants.new_title\":\"New Variant\",\"shop_variants.create_title\":\"Create Variant\",\"shop_variants.edit_title\":\"Edit Variant\",\"shop_variants.show_title\":\"Show Variant\",\"shop_variants.inputs.name\":\"Name\",\"shop_variants.inputs.status\":\"Status\",\"order_disputes.name\":\"Order Disputes\",\"order_disputes.index_title\":\"OrderDisputes List\",\"order_disputes.new_title\":\"New Order dispute\",\"order_disputes.create_title\":\"Create OrderDispute\",\"order_disputes.edit_title\":\"Edit OrderDispute\",\"order_disputes.show_title\":\"Show OrderDispute\",\"order_disputes.inputs.reason_id\":\"Reason\",\"order_disputes.inputs.order_id\":\"Order\",\"order_disputes.inputs.type\":\"Type\",\"order_disputes.inputs.created_by\":\"Created By\",\"order_disputes.inputs.created_to\":\"Created To\",\"order_disputes.inputs.status\":\"Status\",\"order_disputes.inputs.description\":\"Description\",\"order_dispute_order_dispute_comments.name\":\"OrderDispute Order Dispute Comments\",\"order_dispute_order_dispute_comments.index_title\":\"OrderDisputeComments List\",\"order_dispute_order_dispute_comments.new_title\":\"New Order dispute comment\",\"order_dispute_order_dispute_comments.create_title\":\"Create OrderDisputeComment\",\"order_dispute_order_dispute_comments.edit_title\":\"Edit OrderDisputeComment\",\"order_dispute_order_dispute_comments.show_title\":\"Show OrderDisputeComment\",\"order_dispute_order_dispute_comments.inputs.admin_id\":\"Admin\",\"order_dispute_order_dispute_comments.inputs.description\":\"Description\",\"roles.name\":\"Roles\",\"roles.index_title\":\"Roles List\",\"roles.create_title\":\"Create Role\",\"roles.edit_title\":\"Edit Role\",\"roles.show_title\":\"Show Role\",\"roles.inputs.name\":\"Name\",\"permissions.name\":\"Permissions\",\"permissions.index_title\":\"Permissions List\",\"permissions.create_title\":\"Create Permission\",\"permissions.edit_title\":\"Edit Permission\",\"permissions.show_title\":\"Show Permission\",\"permissions.inputs.name\":\"Name\",\"order_dispute_order_dispute_messages.name\":\"OrderDispute Order Dispute Messages\",\"order_dispute_order_dispute_messages.index_title\":\"OrderDisputeMessages List\",\"order_dispute_order_dispute_messages.new_title\":\"New Order dispute message\",\"order_dispute_order_dispute_messages.create_title\":\"Create OrderDisputeMessage\",\"order_dispute_order_dispute_messages.edit_title\":\"Edit OrderDisputeMessage\",\"order_dispute_order_dispute_messages.show_title\":\"Show OrderDisputeMessage\",\"order_dispute_order_dispute_messages.inputs.text\":\"Text\",\"order_dispute_order_dispute_messages.inputs.image\":\"Image\",\"order_dispute_order_dispute_messages.inputs.type\":\"Type\",\"order_dispute_order_dispute_messages.inputs.seen\":\"Seen\",\"order_dispute_order_dispute_messages.inputs.order_dispute_messageable_id\":\"Order Dispute Messageable Id\",\"order_dispute_order_dispute_messages.inputs.order_dispute_messageable_type\":\"Order Dispute Messageable Type\",\"shifts.name\":\"Shifts\",\"shifts.index_title\":\"Shifts List\",\"shifts.new_title\":\"New Shift\",\"shifts.create_title\":\"Create Shift\",\"shifts.edit_title\":\"Edit Shift\",\"shifts.show_title\":\"Show Shift\",\"shifts.inputs.start_at\":\"Start At\",\"shifts.inputs.end_at\":\"End At\",\"shifts.inputs.total_order\":\"Total Order\",\"shifts.inputs.partner_id\":\"Partner\",\"shifts.inputs.partner_vehicle_id\":\"Partner Vehicle\",\"shifts.inputs.due\":\"Due\",\"shift_shift_timings.name\":\"Shift Shift Timings\",\"shift_shift_timings.index_title\":\"ShiftTimings List\",\"shift_shift_timings.new_title\":\"New Shift timing\",\"shift_shift_timings.create_title\":\"Create ShiftTiming\",\"shift_shift_timings.edit_title\":\"Edit ShiftTiming\",\"shift_shift_timings.show_title\":\"Show ShiftTiming\",\"shift_shift_timings.inputs.order_count\":\"Order Count\",\"shift_shift_timings.inputs.start_time\":\"Start Time\",\"shift_shift_timings.inputs.end_time\":\"End Time\",\"admin.setting\":\"Setting\",\"admin.settings.Contact_Email\":\"Contact Email\",\"admin.settings.Contact_Number\":\"Contact Number\",\"admin.settings.Site_Icon\":\"Site Icon\",\"admin.settings.Site_Logo\":\"Site Logo\",\"admin.settings.Site_Name\":\"Site Name\",\"admin.settings.android_push_key\":\"Android Push Key\",\"admin.settings.android_sender_key\":\"Android Sender Key\",\"admin.settings.booking_id_prefix\":\"Booking ID Prefix\",\"admin.settings.booking_prefix\":\"Booking ID Prefix\",\"admin.settings.broadcast_request\":\"Broadcast Request\",\"admin.settings.cash_payment\":\"Cash Payment\",\"admin.settings.currency\":\"Application Currency\",\"admin.settings.demo_mode\":\"Demo Mode\",\"admin.settings.distance_map\":\"Distance Map\",\"admin.settings.facebook_link\":\"Facebook Link\",\"admin.settings.fb_app_version\":\"Facebook App Version\",\"admin.settings.fb_public_key\":\"Facebook Public Key\",\"admin.settings.fb_redirect_url\":\"Facebook Redirect URL\",\"admin.settings.fb_secret_key\":\"Facebook Secret Key\",\"admin.settings.frontend\":\"Frontend\",\"admin.settings.google_map_key\":\"Google Map frontend Key\",\"admin.settings.google_public_key\":\"Google Public Key\",\"admin.settings.google_redirect_url\":\"Google Redirect URL\",\"admin.settings.google_secret_key\":\"Google Secret Key\",\"admin.settings.google_server_map_key\":\"Google Map server ip Key\",\"admin.settings.instagram_link\":\"Instagram Link\",\"admin.settings.limit_message\":\"Limit Message\",\"admin.settings.mail_driver\":\"Mail Driver\",\"admin.settings.mail_encryption\":\"Mail Encryption\",\"admin.settings.mail_from_address\":\"Mail From Address\",\"admin.settings.mail_host\":\"Mail Host\",\"admin.settings.mail_password\":\"Mail Password\",\"admin.settings.mail_port\":\"Mail Port\",\"admin.settings.mail_username\":\"Mail Username\",\"admin.settings.manual_request\":\"Manual Assignment\",\"admin.settings.online_payment\":\"Online Payment\",\"admin.settings.other\":\"Other Settings\",\"admin.settings.otp_verification\":\"OTP Verification\",\"admin.settings.order_accept_timeout\":\"Order Accept Timeout\",\"admin.settings.provider_search_radius\":\" Search Radius\",\"admin.settings.referral\":\"Referral\",\"admin.settings.referral_amount\":\"Referral Amount\",\"admin.settings.referral_count\":\"Referral Count\",\"admin.settings.send_mail\":\"Send Mail\",\"admin.settings.social_login\":\"Social Login\",\"admin.settings.store_link_android_user\":\"Android App Link\",\"admin.settings.store_link_ios_user\":\"IOS App Link\",\"admin.settings.timezone\":\"Timezone\",\"admin.settings.track_distance\":\"Track Distance\",\"admin.settings.twitter_link\":\"Twitter Link\",\"admin.settings.version_android_user\":\"Android App Version\",\"admin.settings.version_ios_user\":\"IOS App Version\",\"order_created\":\"Your Order Created Successfully\",\"order_accept_shop\":\"Your order Successfully Accepted By restaurant\",\"order_cancel_shop\":\"Shop Created Dispute against Your Order\",\"order_assigned_deliveryboy_user\":\"Your Order Assigned To DeliveryBoy\",\"order_assigned_deliveryboy\":\"New order request\",\"order_accept_deliveryboy\":\"Your Order no :id Ready To Dispatched\",\"order_cancel_deliveryboy\":\"Waiting For delivery Boy \",\"order_deliveryboy_reached\":\"Delivery Boy Reached\",\"order_pickedup\":\"Picked Up Your Order Successfully\",\"order_arrived\":\"Your Order is Arrived your Location\",\"order_completed\":\"Your Order is successfully Completed\",\"order_user_cancel\":\"Successfully cancel your Order\",\"order_dispute\":\"Successfully Created Dispute\",\"order_status\":\"Your Order Id :id Status is :status\",\"created\":\"Your Order  Created Successfully\",\"order_can_not_update\":\"Unable to update, Please try again later\",\"not_paid\":\"Payment not complete\",\"address_out_of_range\":\"Address Out Of Range\",\"dispute_created\":\"Dispute created against order \",\"dispute_resolved\":\"Dispute Resolved Successfully\",\"order_settled_by_admin\":\"Settled Your amount Successfully\",\"invalid_order\":\"The selected order  is invalid\",\"order_otp\":\"Your order Delivery Otp is :otp\",\"order_otp_mismatch\":\"Please Check Your Otp\",\"incoming_request\":\"You Have One Incoming Request\",\"reorder_created\":\"For Reorder Cart Added Successfully Please Proceed.\",\"review.create_review\":\"Review Created Successfully\",\"no_delivary_boy\":\"No Delivery People Available!\",\"invalid\":\"Invalid Order!\",\"order_note\":\"Order!\",\"new_order_note\":\"New Order!\",\"order_shop_not_found\":\"Your order is not served at the moment! Please try later\",\"dispatcher.pending_title\":\"Pending Orders\",\"dispatcher.accept_title\":\"Accepted Orders\",\"dispatcher.ongoing_title\":\"Ongoing Orders\",\"dispatcher.cancel_title\":\"Cancelled Orders\",\"dispatcher.order_pending\":\"CUSTOMER PENDING LIST\",\"dispatcher.order_accept\":\"DELIVERY PEOPLE LIST\",\"dispatcher.order_ongoing\":\"ONGOING ORDERS\",\"dispatcher.order_cancel\":\"CANCELLED ORDERS\",\"dispatcher.order_not_found\":\"No Incoming Requests at the moment!\",\"dispatcher.assign\":\"Assign\",\"dispatcher.assigned\":\"Assigned\",\"dispatcher.incoming_request\":\"Incoming Request\",\"dispatcher.dispute\":\"Dispute\",\"dispatcher.packed\":\"Picked - Up\",\"dispatcher.reached\":\"Reached\",\"dispatcher.arrived\":\"Arrived\",\"dispatcher.waiting\":\"Waiting\",\"dispatcher.processing\":\"Started Towards Source\",\"dispatcher.order_live_tracking\":\"Live Tracking\",\"card.no_card_exist\":\"Card Not Exist!\",\"payment.added_to_your_wallet\":\"Added To Your Wallet\",\"payment.failed\":\"Payment Failed\",\"previous\":\"&laquo; Previous\",\"next\":\"Next &raquo;\",\"reset\":\"Your password has been reset!\",\"sent\":\"We have emailed your password reset link!\",\"throttled\":\"Please wait before retrying.\",\"token\":\"This password reset token is invalid.\",\"user\":\"We can\'t find a user with that email address.\",\"accepted\":\"The :attribute must be accepted.\",\"accepted_if\":\"The :attribute must be accepted when :other is :value.\",\"active_url\":\"The :attribute is not a valid URL.\",\"after\":\"The :attribute must be a date after :date.\",\"after_or_equal\":\"The :attribute must be a date after or equal to :date.\",\"alpha\":\"The :attribute must only contain letters.\",\"alpha_dash\":\"The :attribute must only contain letters, numbers, dashes and underscores.\",\"alpha_num\":\"The :attribute must only contain letters and numbers.\",\"array\":\"The :attribute must be an array.\",\"before\":\"The :attribute must be a date before :date.\",\"before_or_equal\":\"The :attribute must be a date before or equal to :date.\",\"between.numeric\":\"The :attribute must be between :min and :max.\",\"between.file\":\"The :attribute must be between :min and :max kilobytes.\",\"between.string\":\"The :attribute must be between :min and :max characters.\",\"between.array\":\"The :attribute must have between :min and :max items.\",\"boolean\":\"The :attribute field must be true or false.\",\"confirmed\":\"The :attribute confirmation does not match.\",\"current_password\":\"The password is incorrect.\",\"date\":\"The :attribute is not a valid date.\",\"date_equals\":\"The :attribute must be a date equal to :date.\",\"date_format\":\"The :attribute does not match the format :format.\",\"different\":\"The :attribute and :other must be different.\",\"digits\":\"The :attribute must be :digits digits.\",\"digits_between\":\"The :attribute must be between :min and :max digits.\",\"dimensions\":\"The :attribute has invalid image dimensions.\",\"distinct\":\"The :attribute field has a duplicate value.\",\"email\":\"The :attribute must be a valid email address.\",\"ends_with\":\"The :attribute must end with one of the following: :values.\",\"exists\":\"The selected :attribute is invalid.\",\"file\":\"The :attribute must be a file.\",\"filled\":\"The :attribute field must have a value.\",\"gt.numeric\":\"The :attribute must be greater than :value.\",\"gt.file\":\"The :attribute must be greater than :value kilobytes.\",\"gt.string\":\"The :attribute must be greater than :value characters.\",\"gt.array\":\"The :attribute must have more than :value items.\",\"gte.numeric\":\"The :attribute must be greater than or equal :value.\",\"gte.file\":\"The :attribute must be greater than or equal :value kilobytes.\",\"gte.string\":\"The :attribute must be greater than or equal :value characters.\",\"gte.array\":\"The :attribute must have :value items or more.\",\"image\":\"The :attribute must be an image.\",\"in\":\"The selected :attribute is invalid.\",\"in_array\":\"The :attribute field does not exist in :other.\",\"integer\":\"The :attribute must be an integer.\",\"ip\":\"The :attribute must be a valid IP address.\",\"ipv4\":\"The :attribute must be a valid IPv4 address.\",\"ipv6\":\"The :attribute must be a valid IPv6 address.\",\"json\":\"The :attribute must be a valid JSON string.\",\"lt.numeric\":\"The :attribute must be less than :value.\",\"lt.file\":\"The :attribute must be less than :value kilobytes.\",\"lt.string\":\"The :attribute must be less than :value characters.\",\"lt.array\":\"The :attribute must have less than :value items.\",\"lte.numeric\":\"The :attribute must be less than or equal :value.\",\"lte.file\":\"The :attribute must be less than or equal :value kilobytes.\",\"lte.string\":\"The :attribute must be less than or equal :value characters.\",\"lte.array\":\"The :attribute must not have more than :value items.\",\"max.numeric\":\"The :attribute must not be greater than :max.\",\"max.file\":\"The :attribute must not be greater than :max kilobytes.\",\"max.string\":\"The :attribute must not be greater than :max characters.\",\"max.array\":\"The :attribute must not have more than :max items.\",\"mimes\":\"The :attribute must be a file of type: :values.\",\"mimetypes\":\"The :attribute must be a file of type: :values.\",\"min.numeric\":\"The :attribute must be at least :min.\",\"min.file\":\"The :attribute must be at least :min kilobytes.\",\"min.string\":\"The :attribute must be at least :min characters.\",\"min.array\":\"The :attribute must have at least :min items.\",\"multiple_of\":\"The :attribute must be a multiple of :value.\",\"not_in\":\"The selected :attribute is invalid.\",\"not_regex\":\"The :attribute format is invalid.\",\"numeric\":\"The :attribute must be a number.\",\"present\":\"The :attribute field must be present.\",\"regex\":\"The :attribute format is invalid.\",\"required\":\"The :attribute field is required.\",\"required_if\":\"The :attribute field is required when :other is :value.\",\"required_unless\":\"The :attribute field is required unless :other is in :values.\",\"required_with\":\"The :attribute field is required when :values is present.\",\"required_with_all\":\"The :attribute field is required when :values are present.\",\"required_without\":\"The :attribute field is required when :values is not present.\",\"required_without_all\":\"The :attribute field is required when none of :values are present.\",\"prohibited\":\"The :attribute field is prohibited.\",\"prohibited_if\":\"The :attribute field is prohibited when :other is :value.\",\"prohibited_unless\":\"The :attribute field is prohibited unless :other is in :values.\",\"prohibits\":\"The :attribute field prohibits :other from being present.\",\"same\":\"The :attribute and :other must match.\",\"size.numeric\":\"The :attribute must be :size.\",\"size.file\":\"The :attribute must be :size kilobytes.\",\"size.string\":\"The :attribute must be :size characters.\",\"size.array\":\"The :attribute must contain :size items.\",\"starts_with\":\"The :attribute must start with one of the following: :values.\",\"string\":\"The :attribute must be a string.\",\"timezone\":\"The :attribute must be a valid timezone.\",\"unique\":\"The :attribute has already been taken.\",\"uploaded\":\"The :attribute failed to upload.\",\"url\":\"The :attribute must be a valid URL.\",\"uuid\":\"The :attribute must be a valid UUID.\",\"custom.attribute-name.rule-name\":\"custom-message\",\"attributes\":[],\"form.whoops\":\"Oops Something went wrong\"},\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:25'),(288,'96b90700-664d-449a-9b95-d67d8359dcfd','96b90700-83f4-4a41-9412-f5d24cd1bc10',NULL,1,'view','{\"name\":\"components.translations\",\"path\":\"\\/resources\\/views\\/components\\/translations.blade.php\",\"data\":[\"translations\",\"componentName\",\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:25'),(289,'96b90700-6818-43e8-9773-a5c2e31f0e04','96b90700-83f4-4a41-9412-f5d24cd1bc10',NULL,1,'view','{\"name\":\"components.resp-helper\",\"path\":\"\\/resources\\/views\\/components\\/resp-helper.blade.php\",\"data\":[\"attributes\",\"slot\",\"__laravel_slots\"],\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:25'),(290,'96b90700-76dd-41c3-a86a-b1db8f5e7895','96b90700-83f4-4a41-9412-f5d24cd1bc10',NULL,1,'request','{\"ip_address\":\"10.0.2.2\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomeController@home\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost:8080\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\" Not;A Brand\\\";v=\\\"99\\\", \\\"Microsoft Edge\\\";v=\\\"103\\\", \\\"Chromium\\\";v=\\\"103\\\"\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"upgrade-insecure-requests\":\"1\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/103.0.5060.66 Safari\\/537.36 Edg\\/103.0.1264.44\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"navigate\",\"sec-fetch-dest\":\"empty\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"XSRF-TOKEN=eyJpdiI6InBGUWh6dGhtYlBpK1pla3pKaVlWOHc9PSIsInZhbHVlIjoiZEtjbStOcExLQ1lhZmVoYUcydFU2emxSMWVLYW56TnN2MWxSSlA3K0dNY1E1TUNQWmhVeWJhaFpvOTM4cE9ZdStxeTRNOFg1ZzNxQXA5T09uZTNVendKMkJic3pNcjJueVlYQldMRGUydTdReFdXTWJHQTJBZlBPTGg1MlNQUFkiLCJtYWMiOiI1YTNlM2Q4ZmMwZWU2MzliNWU2ZDJhM2Y3Y2ZmYzFhMGIyYmM5NGViZDNiODMyNDM0YTYxZjIwOWViMDk4MzllIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IklGaFJqMlI1V1BaRzhmWXROamdkNGc9PSIsInZhbHVlIjoiRzJuNVc2UWdMaHB5Q20xc08zazZVRHZpeHpEWlZCNkpDS3BrN09XTUpjOEE0Rys2cFRUZG11cEZMeEh4NHJldnJOU2M5dWZwL0JwYjdmeDlpaFplZ3lXN0JVbzlXUHoydjcvalJqMGxjWllKUTBoS3hyaHp2SXE0ajF3NmZUb2IiLCJtYWMiOiI1MTdiYTMxYTJiM2JkY2FjZmEzYTk4NzFkODI4MjVkZTM2MjRjZmEwOGI2ZmExMmRlNjVmYTJiNmJlM2Q3ZTRmIiwidGFnIjoiIn0%3D; _ga_N9PQRCYDZC=GS1.1.1657214305.1.0.1657214305.0; _ga=GA1.1.1672831555.1657214306\"},\"payload\":[],\"session\":{\"_token\":\"ol5w6V9kS0Hd6NE6Zknys6ca7HgRu9VXjbkjdHQB\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8080\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"view\":\"\\/var\\/www\\/html\\/thinkinfood\\/resources\\/views\\/app.blade.php\",\"data\":{\"page\":{\"component\":\"Splash\",\"props\":{\"errors\":[],\"auth\":{\"user\":null},\"cart\":{\"can\":false,\"cart_data\":null},\"order\":{\"can\":false,\"order_data\":null},\"type\":\"user\",\"session\":[],\"address\":null,\"latitude\":null,\"longitude\":null,\"isLogin\":false,\"notificationCount\":null,\"social_login\":false,\"canResetPassword\":true,\"status\":null,\"urlPrev\":\"empty\"},\"url\":\"\\/\",\"version\":\"cf78b40a09b28d5cfd37708617d3280f\"}}},\"duration\":763,\"memory\":12,\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:25'),(291,'96b90702-5861-4042-b0c0-458e414337a9','96b90702-590f-4efb-9fb1-dd662b3452ab',NULL,1,'request','{\"ip_address\":\"10.0.2.2\",\"uri\":\"\\/manifest.json\",\"method\":\"GET\",\"controller_action\":\"LaravelPWA\\\\Http\\\\Controllers\\\\LaravelPWAController@manifestJson\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost:8080\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\" Not;A Brand\\\";v=\\\"99\\\", \\\"Microsoft Edge\\\";v=\\\"103\\\", \\\"Chromium\\\";v=\\\"103\\\"\",\"accept\":\"*\\/*\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/103.0.5060.66 Safari\\/537.36 Edg\\/103.0.1264.44\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/localhost:8080\\/\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-US,en;q=0.9\"},\"payload\":[],\"session\":{\"_token\":\"d5GiXBa9AcrsRVNac2zTYEb67iMFZSJpMqsfvMHu\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8080\\/manifest.json\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"name\":\"Food Chef\",\"short_name\":\"Food Chef\",\"start_url\":\"http:\\/\\/localhost:8080\\/\",\"display\":\"standalone\",\"theme_color\":\"#000000\",\"background_color\":\"#ffffff\",\"orientation\":\"portrait\",\"status_bar\":\"black\",\"splash\":{\"640x1136\":\"\\/images\\/icons\\/splash-640x1136.png\",\"750x1334\":\"\\/images\\/icons\\/splash-750x1334.png\",\"828x1792\":\"\\/images\\/icons\\/splash-828x1792.png\",\"1125x2436\":\"\\/images\\/icons\\/splash-1125x2436.png\",\"1242x2208\":\"\\/images\\/icons\\/splash-1242x2208.png\",\"1242x2688\":\"\\/images\\/icons\\/splash-1242x2688.png\",\"1536x2048\":\"\\/images\\/icons\\/splash-1536x2048.png\",\"1668x2224\":\"\\/images\\/icons\\/splash-1668x2224.png\",\"1668x2388\":\"\\/images\\/icons\\/splash-1668x2388.png\",\"2048x2732\":\"\\/images\\/icons\\/splash-2048x2732.png\"},\"icons\":[{\"src\":\"\\/images\\/icons\\/icon-72x72.png\",\"type\":\"image\\/png\",\"sizes\":\"72x72\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-96x96.png\",\"type\":\"image\\/png\",\"sizes\":\"96x96\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-128x128.png\",\"type\":\"image\\/png\",\"sizes\":\"128x128\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-144x144.png\",\"type\":\"image\\/png\",\"sizes\":\"144x144\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-152x152.png\",\"type\":\"image\\/png\",\"sizes\":\"152x152\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-192x192.png\",\"type\":\"image\\/png\",\"sizes\":\"192x192\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-384x384.png\",\"type\":\"image\\/png\",\"sizes\":\"384x384\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-512x512.png\",\"type\":\"image\\/png\",\"sizes\":\"512x512\",\"purpose\":\"any\"}],\"shortcuts\":[{\"name\":\"Search\",\"description\":\"Food Right now\",\"url\":\"\\/search\",\"icons\":[{\"src\":\"\\/images\\/icons\\/icon-72x72.png\",\"type\":\"image\\/png\",\"purpose\":\"any maskable\"}]},{\"name\":\"Shop\",\"description\":\"Login as Shop\",\"url\":\"\\/shop\\/login\",\"icons\":[{\"src\":\"\\/images\\/icons\\/shop\\/icon-72x72.png\",\"type\":\"image\\/png\",\"purpose\":\"any maskable\"}]},{\"name\":\"Partner\",\"description\":\"Login as Partner\",\"url\":\"\\/partner\\/login\",\"icons\":[{\"src\":\"\\/images\\/icons\\/partner\\/icon-72x72.png\",\"type\":\"image\\/png\",\"purpose\":\"any maskable\"}]}]},\"duration\":268,\"memory\":6,\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:18:27'),(292,'96b90864-8cfd-4931-abfe-1474902be634','96b90864-8e56-41e1-bb25-954a3f4139a3',NULL,1,'request','{\"ip_address\":\"10.0.2.2\",\"uri\":\"\\/manifest.json\",\"method\":\"GET\",\"controller_action\":\"LaravelPWA\\\\Http\\\\Controllers\\\\LaravelPWAController@manifestJson\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost:8080\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\" Not;A Brand\\\";v=\\\"99\\\", \\\"Microsoft Edge\\\";v=\\\"103\\\", \\\"Chromium\\\";v=\\\"103\\\"\",\"accept\":\"*\\/*\",\"sec-ch-ua-mobile\":\"?0\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/103.0.5060.66 Safari\\/537.36 Edg\\/103.0.1264.44\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/localhost:8080\\/\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-US,en;q=0.9\"},\"payload\":[],\"session\":{\"_token\":\"doHgDHfT9SNzVzk0oSIaqDMKs7XgnAD10lCh02MI\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8080\\/manifest.json\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"name\":\"Food Chef\",\"short_name\":\"Food Chef\",\"start_url\":\"http:\\/\\/localhost:8080\\/\",\"display\":\"standalone\",\"theme_color\":\"#000000\",\"background_color\":\"#ffffff\",\"orientation\":\"portrait\",\"status_bar\":\"black\",\"splash\":{\"640x1136\":\"\\/images\\/icons\\/splash-640x1136.png\",\"750x1334\":\"\\/images\\/icons\\/splash-750x1334.png\",\"828x1792\":\"\\/images\\/icons\\/splash-828x1792.png\",\"1125x2436\":\"\\/images\\/icons\\/splash-1125x2436.png\",\"1242x2208\":\"\\/images\\/icons\\/splash-1242x2208.png\",\"1242x2688\":\"\\/images\\/icons\\/splash-1242x2688.png\",\"1536x2048\":\"\\/images\\/icons\\/splash-1536x2048.png\",\"1668x2224\":\"\\/images\\/icons\\/splash-1668x2224.png\",\"1668x2388\":\"\\/images\\/icons\\/splash-1668x2388.png\",\"2048x2732\":\"\\/images\\/icons\\/splash-2048x2732.png\"},\"icons\":[{\"src\":\"\\/images\\/icons\\/icon-72x72.png\",\"type\":\"image\\/png\",\"sizes\":\"72x72\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-96x96.png\",\"type\":\"image\\/png\",\"sizes\":\"96x96\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-128x128.png\",\"type\":\"image\\/png\",\"sizes\":\"128x128\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-144x144.png\",\"type\":\"image\\/png\",\"sizes\":\"144x144\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-152x152.png\",\"type\":\"image\\/png\",\"sizes\":\"152x152\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-192x192.png\",\"type\":\"image\\/png\",\"sizes\":\"192x192\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-384x384.png\",\"type\":\"image\\/png\",\"sizes\":\"384x384\",\"purpose\":\"any\"},{\"src\":\"\\/images\\/icons\\/icon-512x512.png\",\"type\":\"image\\/png\",\"sizes\":\"512x512\",\"purpose\":\"any\"}],\"shortcuts\":[{\"name\":\"Search\",\"description\":\"Food Right now\",\"url\":\"\\/search\",\"icons\":[{\"src\":\"\\/images\\/icons\\/icon-72x72.png\",\"type\":\"image\\/png\",\"purpose\":\"any maskable\"}]},{\"name\":\"Shop\",\"description\":\"Login as Shop\",\"url\":\"\\/shop\\/login\",\"icons\":[{\"src\":\"\\/images\\/icons\\/shop\\/icon-72x72.png\",\"type\":\"image\\/png\",\"purpose\":\"any maskable\"}]},{\"name\":\"Partner\",\"description\":\"Login as Partner\",\"url\":\"\\/partner\\/login\",\"icons\":[{\"src\":\"\\/images\\/icons\\/partner\\/icon-72x72.png\",\"type\":\"image\\/png\",\"purpose\":\"any maskable\"}]}]},\"duration\":95,\"memory\":6,\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:22:19'),(293,'96b90867-c73f-43ab-b324-a3ac8e3efc9e','96b90867-cc58-4c0e-9284-5650c5dfcf98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `banners`\",\"time\":\"3.47\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/app\\/Http\\/Controllers\\/HomeController.php\",\"line\":29,\"hash\":\"92879c999ec27583fee51ba202e6c59c\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:22:21'),(294,'96b90867-c897-46ac-9fb7-ce5a34dfbf00','96b90867-cc58-4c0e-9284-5650c5dfcf98',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `categories` where `categories`.`deleted_at` is null\",\"time\":\"0.79\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/app\\/Http\\/Controllers\\/HomeController.php\",\"line\":30,\"hash\":\"682a4786ea6c57f0d0ebfa86cbc67ac1\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:22:21'),(295,'96b90867-cbd6-4822-ad85-2ec7b83d8b87','96b90867-cc58-4c0e-9284-5650c5dfcf98',NULL,1,'request','{\"ip_address\":\"10.0.2.2\",\"uri\":\"\\/home\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomeController@show\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost:8080\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\" Not;A Brand\\\";v=\\\"99\\\", \\\"Microsoft Edge\\\";v=\\\"103\\\", \\\"Chromium\\\";v=\\\"103\\\"\",\"x-xsrf-token\":\"eyJpdiI6IldmRWFERGFiSGNobnZMek5XRy81Zmc9PSIsInZhbHVlIjoiUXhJSTIwVFpjbVFFZnVRL2I1czRnOXJBcTVWcm00L1JTYVg0blM3RDdkZldDU1Y2VnltTnRBR0JTZnlIdG5YdFkza2J5RGwwSVNaNUFnby9wcmhOM054ajdLVkJGd2F6UHF3cDlqbmwvTnBxOWliaXhXQ0E5QmNWQ0x4U3N2S2wiLCJtYWMiOiJjMzg3MmFmMGJiOTM2ZDc1NTg0NWE1YmQzMDc0YjE4ZTVlOTY0YzBlY2FmODYxMGYzOGI2YzY3ZTJhOTcyZjk2IiwidGFnIjoiIn0=\",\"sec-ch-ua-mobile\":\"?0\",\"x-inertia\":\"true\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/103.0.5060.66 Safari\\/537.36 Edg\\/103.0.1264.44\",\"content-type\":\"application\\/json\",\"x-socket-id\":\"9639.4763109\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"cf78b40a09b28d5cfd37708617d3280f\",\"x-requested-with\":\"XMLHttpRequest\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/localhost:8080\\/\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.1672831555.1657214306; XSRF-TOKEN=eyJpdiI6IldmRWFERGFiSGNobnZMek5XRy81Zmc9PSIsInZhbHVlIjoiUXhJSTIwVFpjbVFFZnVRL2I1czRnOXJBcTVWcm00L1JTYVg0blM3RDdkZldDU1Y2VnltTnRBR0JTZnlIdG5YdFkza2J5RGwwSVNaNUFnby9wcmhOM054ajdLVkJGd2F6UHF3cDlqbmwvTnBxOWliaXhXQ0E5QmNWQ0x4U3N2S2wiLCJtYWMiOiJjMzg3MmFmMGJiOTM2ZDc1NTg0NWE1YmQzMDc0YjE4ZTVlOTY0YzBlY2FmODYxMGYzOGI2YzY3ZTJhOTcyZjk2IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkpBUlBxYjdKbXRDN21vOFU1eThObnc9PSIsInZhbHVlIjoiQTZKekl6VXZYN1g4ZisrN21pdHJvYWluL2diTUU4dXVLWE1RbGFxdjlwQzdDUURLQzg4VDhzS3F2dDNyV0Q4YWlVMVRZakorM2hTTUw5L09PZForZzYyYVM1NlZqOWlrVkpRTjJGQmNMSFRuSVNkc1pmVnBOU1VBWENBb0FuUEMiLCJtYWMiOiIzMWRhNjM4Y2FhNjJiNWViMDE1Y2JiMTM3ZGMyY2RlNDk1NTMzODY3ZjhkNjEyMzVhNTFlNjExZDU1ODNkZDZkIiwidGFnIjoiIn0%3D; _ga_N9PQRCYDZC=GS1.1.1657214305.1.0.1657214313.0\"},\"payload\":[],\"session\":{\"_token\":\"ol5w6V9kS0Hd6NE6Zknys6ca7HgRu9VXjbkjdHQB\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8080\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"component\":\"Welcome\",\"props\":{\"errors\":[],\"auth\":{\"user\":null},\"cart\":{\"can\":false,\"cart_data\":null},\"order\":{\"can\":false,\"order_data\":null},\"type\":\"user\",\"session\":[],\"address\":null,\"latitude\":null,\"longitude\":null,\"isLogin\":false,\"notificationCount\":null,\"social_login\":false,\"canResetPassword\":true,\"status\":null,\"urlPrev\":\"http:\\/\\/localhost:8080\\/\",\"shops\":null,\"banner\":[],\"categories\":[]},\"url\":\"\\/home\",\"version\":\"cf78b40a09b28d5cfd37708617d3280f\"},\"duration\":151,\"memory\":8,\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:22:21'),(296,'96b9087d-b1b7-492b-b35a-6d73e940f022','96b9087d-ceeb-4bdc-b55f-4821ec94aace',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `banners`\",\"time\":\"3.90\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/app\\/Http\\/Controllers\\/HomeController.php\",\"line\":29,\"hash\":\"92879c999ec27583fee51ba202e6c59c\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:22:35'),(297,'96b9087d-b593-4a44-9572-1e2adec7cc32','96b9087d-ceeb-4bdc-b55f-4821ec94aace',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `categories` where `categories`.`deleted_at` is null\",\"time\":\"2.90\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/app\\/Http\\/Controllers\\/HomeController.php\",\"line\":30,\"hash\":\"682a4786ea6c57f0d0ebfa86cbc67ac1\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:22:35'),(298,'96b9087d-be2e-4566-ab79-8dd59a0f209d','96b9087d-ceeb-4bdc-b55f-4821ec94aace',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'laravel\' and table_name = \'shop_infos\'\",\"time\":\"12.56\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/app\\/Http\\/Controllers\\/HomeController.php\",\"line\":47,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:22:35'),(299,'96b9087d-c207-43ac-9f3f-f74355f99054','96b9087d-ceeb-4bdc-b55f-4821ec94aace',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select column_name as `column_name` from information_schema.columns where table_schema = \'laravel\' and table_name = \'shop_infos\'\",\"time\":\"8.59\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/app\\/Http\\/Controllers\\/HomeController.php\",\"line\":47,\"hash\":\"a191748092b529b62dfa35879193e5b1\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:22:35'),(300,'96b9087d-c419-468b-8087-1b416256ad3f','96b9087d-ceeb-4bdc-b55f-4821ec94aace',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `shop_infos` where             ST_Distance_Sphere(\\n                    point(shop_infos.longitude, shop_infos.latitude),\\n                    point(77.3910265, 28.5355161)\\n                ) * 0.000621371 < 1000\",\"time\":\"1.50\",\"slow\":false,\"file\":\"\\/var\\/www\\/html\\/thinkinfood\\/app\\/Http\\/Controllers\\/HomeController.php\",\"line\":47,\"hash\":\"aead7070de050029bac8cc7c4703746d\",\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:22:35'),(301,'96b9087d-cd87-4d37-9ee6-014993e458eb','96b9087d-ceeb-4bdc-b55f-4821ec94aace',NULL,1,'request','{\"ip_address\":\"10.0.2.2\",\"uri\":\"\\/home?address=Noida%2C%20Uttar%20Pradesh%2C%20India&latitude=28.5355161&loc_name=Gautam%20Buddh%20Nagar&longitude=77.3910265\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomeController@show\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost:8080\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\" Not;A Brand\\\";v=\\\"99\\\", \\\"Microsoft Edge\\\";v=\\\"103\\\", \\\"Chromium\\\";v=\\\"103\\\"\",\"x-xsrf-token\":\"eyJpdiI6ImRGNEM0cTVGUVMzMFdkSmZvN1A3bGc9PSIsInZhbHVlIjoiejczWmdqY3BidnBxMThlSnQ5QnZOOHJPYWJPRlNRUGJnR3hRS3ozYTdaV2RaSXFLbDVmS1lYdS84VUZLb3QwQVMyL3IrMU1veG15YTNCLzZaOVNLclFoMm5hWTIxZmtZS0V2Q3N4MmZEWmgwQUxsT1R1bmNTTTIwSldQZXUxWHEiLCJtYWMiOiI1ODc0YjI4YWMwYWExNjU5OGY1ZTNjNmRlNjc2MDQ2YjNkMDNhYjE3YjdmYWQ3MTU2Y2U2MjJjZDk1ZTlkYzZiIiwidGFnIjoiIn0=\",\"sec-ch-ua-mobile\":\"?0\",\"x-inertia\":\"true\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/103.0.5060.66 Safari\\/537.36 Edg\\/103.0.1264.44\",\"content-type\":\"application\\/json\",\"x-socket-id\":\"9639.4763109\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"cf78b40a09b28d5cfd37708617d3280f\",\"x-requested-with\":\"XMLHttpRequest\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/localhost:8080\\/home\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.1672831555.1657214306; XSRF-TOKEN=eyJpdiI6ImRGNEM0cTVGUVMzMFdkSmZvN1A3bGc9PSIsInZhbHVlIjoiejczWmdqY3BidnBxMThlSnQ5QnZOOHJPYWJPRlNRUGJnR3hRS3ozYTdaV2RaSXFLbDVmS1lYdS84VUZLb3QwQVMyL3IrMU1veG15YTNCLzZaOVNLclFoMm5hWTIxZmtZS0V2Q3N4MmZEWmgwQUxsT1R1bmNTTTIwSldQZXUxWHEiLCJtYWMiOiI1ODc0YjI4YWMwYWExNjU5OGY1ZTNjNmRlNjc2MDQ2YjNkMDNhYjE3YjdmYWQ3MTU2Y2U2MjJjZDk1ZTlkYzZiIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImNZTjBLQ3FTei95TkV0bXVUQXdXeFE9PSIsInZhbHVlIjoiNDdibWRGTlMveWNSM1Qwem0wRDVuUW1NajV0SVhTbVErQUMvSkQxSTliNmw3ZitHTkVzUU94dVZHTWhaTDZBcWZLWWJacGV2UDk1N3lFdW5ocUdXdm50MVZTb0RJSEh0QnJoK29vdis1WjJyclNtNTNvODZzZmN3bWc1T1NFS0wiLCJtYWMiOiI4YzY1MGUwODVjZGY0MjhhMmU0YTE5MTM1MzhkYmRlMmZjNGFhYTJkMTMyZTE1NTNiMmJiMDc3ZDBkYjFkYjQwIiwidGFnIjoiIn0%3D; _ga_N9PQRCYDZC=GS1.1.1657214305.1.1.1657214552.0\"},\"payload\":{\"loc_name\":\"Gautam Buddh Nagar\",\"address\":\"Noida, Uttar Pradesh, India\",\"latitude\":\"28.5355161\",\"longitude\":\"77.3910265\"},\"session\":{\"_token\":\"ol5w6V9kS0Hd6NE6Zknys6ca7HgRu9VXjbkjdHQB\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8080\"},\"_flash\":{\"old\":[],\"new\":[]},\"address\":\"Noida, Uttar Pradesh, India\",\"loc_name\":\"Gautam Buddh Nagar\",\"longitude\":\"77.3910265\",\"latitude\":\"28.5355161\"},\"response_status\":200,\"response\":{\"component\":\"Welcome\",\"props\":{\"errors\":[],\"auth\":{\"user\":null},\"cart\":{\"can\":false,\"cart_data\":null},\"order\":{\"can\":false,\"order_data\":null},\"type\":\"user\",\"session\":[],\"address\":\"Noida, Uttar Pradesh, India\",\"latitude\":\"28.5355161\",\"longitude\":\"77.3910265\",\"isLogin\":false,\"notificationCount\":null,\"social_login\":false,\"canResetPassword\":true,\"status\":null,\"urlPrev\":\"empty\",\"shops\":{\"data\":[],\"links\":{\"first\":\"http:\\/\\/localhost:8080\\/home?loc_name=Gautam%20Buddh%20Nagar&address=Noida%2C%20Uttar%20Pradesh%2C%20India&latitude=28.5355161&longitude=77.3910265&page=1\",\"last\":\"http:\\/\\/localhost:8080\\/home?loc_name=Gautam%20Buddh%20Nagar&address=Noida%2C%20Uttar%20Pradesh%2C%20India&latitude=28.5355161&longitude=77.3910265&page=1\",\"prev\":null,\"next\":null},\"meta\":{\"current_page\":1,\"from\":null,\"last_page\":1,\"links\":[{\"url\":null,\"label\":\"&laquo; Previous\",\"active\":false},{\"url\":\"http:\\/\\/localhost:8080\\/home?loc_name=Gautam%20Buddh%20Nagar&address=Noida%2C%20Uttar%20Pradesh%2C%20India&latitude=28.5355161&longitude=77.3910265&page=1\",\"label\":\"1\",\"active\":true},{\"url\":null,\"label\":\"Next &raquo;\",\"active\":false}],\"path\":\"http:\\/\\/localhost:8080\\/home\",\"per_page\":9,\"to\":null,\"total\":0}},\"banners\":[],\"loc_name\":\"Gautam Buddh Nagar\",\"categories\":[]},\"url\":\"\\/home?loc_name=Gautam%20Buddh%20Nagar&address=Noida%2C%20Uttar%20Pradesh%2C%20India&latitude=28.5355161&longitude=77.3910265\",\"version\":\"cf78b40a09b28d5cfd37708617d3280f\"},\"duration\":308,\"memory\":8,\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:22:35'),(302,'96b908e6-c730-47e3-aaf8-01dc92bf06f2','96b908e6-c91a-4f72-8958-08600459eb58',NULL,1,'request','{\"ip_address\":\"10.0.2.2\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\HomeController@home\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"localhost:8080\",\"connection\":\"keep-alive\",\"sec-ch-ua\":\"\\\" Not;A Brand\\\";v=\\\"99\\\", \\\"Microsoft Edge\\\";v=\\\"103\\\", \\\"Chromium\\\";v=\\\"103\\\"\",\"x-xsrf-token\":\"eyJpdiI6InVzajczaHFOT2dtYVZHVmdUdlRvckE9PSIsInZhbHVlIjoiVTBPekVWQmhxb3pxbTNQdytkSUN3ZThpVjRvUVRRWlo3WFU4T2R3ajZ0MWJkeGF2d3JiMDIzMXZGc2VwZm1rTGpIT29KY2NZamY0NWpUT3Y1OG42RnVEME9URGhRRWQzVmJMRkMzam0ya0tPalNENWI4S25DbVJDQTNRd0hNRFIiLCJtYWMiOiI5NjFhOGUwMDJhMzhkZDQxOGMxZTgwMzI3MGY1ZDEwZDE4NzA0MjJkMGMyYmI3NWZiNjAyZjk2NWE1MjAyYzgwIiwidGFnIjoiIn0=\",\"sec-ch-ua-mobile\":\"?0\",\"x-inertia\":\"true\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/103.0.5060.66 Safari\\/537.36 Edg\\/103.0.1264.44\",\"content-type\":\"application\\/json\",\"x-socket-id\":\"9639.4763109\",\"accept\":\"text\\/html, application\\/xhtml+xml\",\"x-inertia-version\":\"cf78b40a09b28d5cfd37708617d3280f\",\"x-requested-with\":\"XMLHttpRequest\",\"sec-ch-ua-platform\":\"\\\"Windows\\\"\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/localhost:8080\\/home?loc_name=Gautam%20Buddh%20Nagar&address=Noida%2C%20Uttar%20Pradesh%2C%20India&latitude=28.5355161&longitude=77.3910265\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"en-US,en;q=0.9\",\"cookie\":\"_ga=GA1.1.1672831555.1657214306; _ga_N9PQRCYDZC=GS1.1.1657214305.1.1.1657214552.0; XSRF-TOKEN=eyJpdiI6InVzajczaHFOT2dtYVZHVmdUdlRvckE9PSIsInZhbHVlIjoiVTBPekVWQmhxb3pxbTNQdytkSUN3ZThpVjRvUVRRWlo3WFU4T2R3ajZ0MWJkeGF2d3JiMDIzMXZGc2VwZm1rTGpIT29KY2NZamY0NWpUT3Y1OG42RnVEME9URGhRRWQzVmJMRkMzam0ya0tPalNENWI4S25DbVJDQTNRd0hNRFIiLCJtYWMiOiI5NjFhOGUwMDJhMzhkZDQxOGMxZTgwMzI3MGY1ZDEwZDE4NzA0MjJkMGMyYmI3NWZiNjAyZjk2NWE1MjAyYzgwIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IkdBSk9LQ081S2hoWmV3V3d1OEEzMGc9PSIsInZhbHVlIjoiaWU1NUkvdzdlTTRXSmp1NGIvNkVUSW4zWnllM2JKVWlIby9IVCtiQXRORnhrbENrb0RydGhJRTVWamR3UzB1YTVRbkdaUGJuRmM0ekkzVWZuQk1NQ0puQSt1ajdTbkk5RzU5bThDcVlDVGpqK1pMSUM1Y293WU95bmV5N1Z6MDQiLCJtYWMiOiJiZTZhMDEyZTk4MzUyNDA3MDNmMWIzM2U5NzIzMDQ0YzM2ZDVjNGJhZTFkYzhhMGI1NzQ3N2ViZGY2OGZmZjUxIiwidGFnIjoiIn0%3D\"},\"payload\":[],\"session\":{\"_token\":\"ol5w6V9kS0Hd6NE6Zknys6ca7HgRu9VXjbkjdHQB\",\"_previous\":{\"url\":\"http:\\/\\/localhost:8080\"},\"_flash\":{\"old\":[],\"new\":[]},\"address\":\"Noida, Uttar Pradesh, India\",\"loc_name\":\"Gautam Buddh Nagar\",\"longitude\":\"77.3910265\",\"latitude\":\"28.5355161\"},\"response_status\":200,\"response\":{\"component\":\"Splash\",\"props\":{\"errors\":[],\"auth\":{\"user\":null},\"cart\":{\"can\":false,\"cart_data\":null},\"order\":{\"can\":false,\"order_data\":null},\"type\":\"user\",\"session\":[],\"address\":\"Noida, Uttar Pradesh, India\",\"latitude\":\"28.5355161\",\"longitude\":\"77.3910265\",\"isLogin\":false,\"notificationCount\":null,\"social_login\":false,\"canResetPassword\":true,\"status\":null,\"urlPrev\":\"http:\\/\\/localhost:8080\\/home?loc_name=Gautam%20Buddh%20Nagar&address=Noida%2C%20Uttar%20Pradesh%2C%20India&latitude=28.5355161&longitude=77.3910265\"},\"url\":\"\\/\",\"version\":\"cf78b40a09b28d5cfd37708617d3280f\"},\"duration\":172,\"memory\":6,\"hostname\":\"ubuntu-focal\"}','2022-07-07 17:23:44');
/*!40000 ALTER TABLE `telescope_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries_tags`
--

DROP TABLE IF EXISTS `telescope_entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries_tags`
--

LOCK TABLES `telescope_entries_tags` WRITE;
/*!40000 ALTER TABLE `telescope_entries_tags` DISABLE KEYS */;
INSERT INTO `telescope_entries_tags` VALUES ('96b9068d-978c-4a9e-b2a7-707ee64bd196','JoeDixon\\Translation\\Language:1'),('96b9068e-7725-414e-9981-848daa3549ef','slow'),('96b90690-b034-47fe-968c-1d2ce9c4817a','slow'),('96b90694-5f6c-4dec-97b1-0c890e15373e','slow'),('96b90694-cea5-4c69-a7f8-daf8a72b0d1b','slow'),('96b90695-5e40-4f0f-a02f-2650c7a361ee','slow'),('96b90695-868d-4a6e-b9d4-a9def52e5001','slow'),('96b90695-eaf4-41ed-b795-2549693a6a13','slow'),('96b90696-5c3a-49d9-ae32-0b00b8a9a456','slow'),('96b90696-f786-43c6-85c0-30a7d35e2037','slow'),('96b90697-6787-42c7-bfc6-a0b0168b1108','slow'),('96b90697-92c2-4110-a4fc-aedf9480f904','slow'),('96b90697-eb80-4b3e-9669-dabaebd03def','slow'),('96b90698-3ac8-4bfd-9ebb-01614d790d2f','slow'),('96b90698-6d31-4418-b3c4-855b8b2ea8c6','slow'),('96b90698-fbdf-48d6-8a66-698f6dbe2d4f','slow'),('96b90699-6c2f-478f-8dda-3ab4ab1d13ca','slow'),('96b9069a-0b72-4bcd-9c6d-e33a488e21c4','slow'),('96b9069a-8215-4ef2-afb1-299b8a7623e0','slow'),('96b9069a-fbc8-4340-a60e-aaa9e6f6ffa2','slow'),('96b9069b-9097-4d57-be31-8d5eaba094a9','slow');
/*!40000 ALTER TABLE `telescope_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_monitoring`
--

DROP TABLE IF EXISTS `telescope_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_monitoring`
--

LOCK TABLES `telescope_monitoring` WRITE;
/*!40000 ALTER TABLE `telescope_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int unsigned NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_language_id_foreign` (`language_id`),
  CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `building` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(10,8) DEFAULT NULL,
  `longitude` double(11,8) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wallets`
--

DROP TABLE IF EXISTS `user_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `transaction_id` int NOT NULL,
  `transaction_alias` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('C','D') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,8) NOT NULL DEFAULT '0.00000000',
  `open_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `close_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `payment_mode` enum('CARD','STRIPE','PAYPAL','PAYUMONEY','PAYTM') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_wallets_user_id_foreign` (`user_id`),
  CONSTRAINT `user_wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wallets`
--

LOCK TABLES `user_wallets` WRITE;
/*!40000 ALTER TABLE `user_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_cust_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` int DEFAULT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('enable','disable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enable',
  `shop_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variants_shop_id_foreign` (`shop_id`),
  CONSTRAINT `variants_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_requests`
--

DROP TABLE IF EXISTS `wallet_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `alias_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user,partner,shop',
  `from_id` int NOT NULL,
  `from_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('C','D') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,8) NOT NULL DEFAULT '0.00000000',
  `send_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'online,offline',
  `send_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0-Pendig,1-Approved,2-cancel',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_requests`
--

LOCK TABLES `wallet_requests` WRITE;
/*!40000 ALTER TABLE `wallet_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websockets_statistics_entries`
--

DROP TABLE IF EXISTS `websockets_statistics_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `websockets_statistics_entries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int NOT NULL,
  `websocket_message_count` int NOT NULL,
  `api_message_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websockets_statistics_entries`
--

LOCK TABLES `websockets_statistics_entries` WRITE;
/*!40000 ALTER TABLE `websockets_statistics_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `websockets_statistics_entries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-07 17:32:03
