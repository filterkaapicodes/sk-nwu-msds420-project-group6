-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: retail_db
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand_dim`
--

DROP TABLE IF EXISTS `brand_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_dim` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(128) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_name` (`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `campaign_desc`
--

DROP TABLE IF EXISTS `campaign_desc`;
/*!50001 DROP VIEW IF EXISTS `campaign_desc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `campaign_desc` AS SELECT 
 1 AS `campaign`,
 1 AS `description`,
 1 AS `start_day`,
 1 AS `end_day`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `campaign_dim`
--

DROP TABLE IF EXISTS `campaign_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_dim` (
  `campaign_sk` int NOT NULL AUTO_INCREMENT,
  `campaign` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_day` int DEFAULT NULL,
  `end_day` int DEFAULT NULL,
  PRIMARY KEY (`campaign_sk`),
  UNIQUE KEY `campaign` (`campaign`),
  KEY `ix_cd_camp` (`campaign`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `campaign_table`
--

DROP TABLE IF EXISTS `campaign_table`;
/*!50001 DROP VIEW IF EXISTS `campaign_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `campaign_table` AS SELECT 
 1 AS `household_key`,
 1 AS `campaign`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category_dim`
--

DROP TABLE IF EXISTS `category_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_dim` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `department` varchar(128) NOT NULL,
  `commodity_desc` varchar(128) DEFAULT NULL,
  `sub_commodity_desc` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `department` (`department`,`commodity_desc`,`sub_commodity_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=3913 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `causal_data`
--

DROP TABLE IF EXISTS `causal_data`;
/*!50001 DROP VIEW IF EXISTS `causal_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `causal_data` AS SELECT 
 1 AS `product_id`,
 1 AS `store_id`,
 1 AS `week_no`,
 1 AS `display`,
 1 AS `mailer`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!50001 DROP VIEW IF EXISTS `coupon`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coupon` AS SELECT 
 1 AS `campaign`,
 1 AS `coupon_upc`,
 1 AS `product_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `coupon_map`
--

DROP TABLE IF EXISTS `coupon_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_map` (
  `campaign` int DEFAULT NULL,
  `coupon_upc` varchar(64) DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  KEY `idx_coupon_map_upc_camp` (`coupon_upc`,`campaign`),
  KEY `idx_coupon_map_pid` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `coupon_redempt`
--

DROP TABLE IF EXISTS `coupon_redempt`;
/*!50001 DROP VIEW IF EXISTS `coupon_redempt`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coupon_redempt` AS SELECT 
 1 AS `household_key`,
 1 AS `product_id`,
 1 AS `campaign`,
 1 AS `day`,
 1 AS `redeemed`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `coupon_redemption_fact`
--

DROP TABLE IF EXISTS `coupon_redemption_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_redemption_fact` (
  `redemption_sk` bigint NOT NULL AUTO_INCREMENT,
  `household_sk` int NOT NULL,
  `product_sk` int NOT NULL,
  `campaign_sk` int NOT NULL,
  `day` int NOT NULL,
  `redeemed` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`redemption_sk`),
  UNIQUE KEY `uq_once` (`household_sk`,`product_sk`,`campaign_sk`,`day`),
  KEY `fk_crf_product` (`product_sk`),
  KEY `fk_crf_campaign` (`campaign_sk`),
  CONSTRAINT `fk_crf_campaign` FOREIGN KEY (`campaign_sk`) REFERENCES `campaign_dim` (`campaign_sk`),
  CONSTRAINT `fk_crf_household` FOREIGN KEY (`household_sk`) REFERENCES `household_dim` (`household_sk`),
  CONSTRAINT `fk_crf_product` FOREIGN KEY (`product_sk`) REFERENCES `product_dim` (`product_sk`)
) ENGINE=InnoDB AUTO_INCREMENT=1834987 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `day_dim`
--

DROP TABLE IF EXISTS `day_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `day_dim` (
  `day_id` int NOT NULL,
  `date_value` date NOT NULL,
  `week_no` int NOT NULL,
  `month_num` tinyint DEFAULT NULL,
  `quarter_num` tinyint DEFAULT NULL,
  `year_num` smallint DEFAULT NULL,
  PRIMARY KEY (`day_id`),
  UNIQUE KEY `date_value` (`date_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hh_comp_dim`
--

DROP TABLE IF EXISTS `hh_comp_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hh_comp_dim` (
  `hh_comp_id` int NOT NULL AUTO_INCREMENT,
  `hh_comp_desc` varchar(64) NOT NULL,
  PRIMARY KEY (`hh_comp_id`),
  UNIQUE KEY `hh_comp_desc` (`hh_comp_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `hh_demographic`
--

DROP TABLE IF EXISTS `hh_demographic`;
/*!50001 DROP VIEW IF EXISTS `hh_demographic`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hh_demographic` AS SELECT 
 1 AS `household_key`,
 1 AS `age_desc`,
 1 AS `marital_status_code`,
 1 AS `income_desc`,
 1 AS `homeowner_desc`,
 1 AS `hh_comp_desc`,
 1 AS `kid_category_desc`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hh_size_dim`
--

DROP TABLE IF EXISTS `hh_size_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hh_size_dim` (
  `hh_size_id` int NOT NULL AUTO_INCREMENT,
  `household_size_desc` varchar(16) NOT NULL,
  PRIMARY KEY (`hh_size_id`),
  UNIQUE KEY `household_size_desc` (`household_size_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `homeowner_dim`
--

DROP TABLE IF EXISTS `homeowner_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homeowner_dim` (
  `homeowner_id` int NOT NULL AUTO_INCREMENT,
  `homeowner_desc` varchar(32) NOT NULL,
  PRIMARY KEY (`homeowner_id`),
  UNIQUE KEY `homeowner_desc` (`homeowner_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `household_campaign_bridge`
--

DROP TABLE IF EXISTS `household_campaign_bridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `household_campaign_bridge` (
  `household_sk` int NOT NULL,
  `campaign_sk` int NOT NULL,
  PRIMARY KEY (`household_sk`,`campaign_sk`),
  KEY `fk_hcb_campaign` (`campaign_sk`),
  CONSTRAINT `fk_hcb_campaign` FOREIGN KEY (`campaign_sk`) REFERENCES `campaign_dim` (`campaign_sk`),
  CONSTRAINT `fk_hcb_household` FOREIGN KEY (`household_sk`) REFERENCES `household_dim` (`household_sk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `household_dim`
--

DROP TABLE IF EXISTS `household_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `household_dim` (
  `household_sk` int NOT NULL AUTO_INCREMENT,
  `household_key` int NOT NULL,
  `age_desc` varchar(32) DEFAULT NULL,
  `marital_status_code` varchar(8) DEFAULT NULL,
  `income_desc` varchar(32) DEFAULT NULL,
  `homeowner_desc` varchar(32) DEFAULT NULL,
  `hh_comp_desc` varchar(64) DEFAULT NULL,
  `household_size_desc` varchar(16) DEFAULT NULL,
  `kid_category_desc` varchar(32) DEFAULT NULL,
  `marital_status_id` int DEFAULT NULL,
  `income_band_id` int DEFAULT NULL,
  `homeowner_id` int DEFAULT NULL,
  `hh_comp_id` int DEFAULT NULL,
  `hh_size_id` int DEFAULT NULL,
  `kid_category_id` int DEFAULT NULL,
  PRIMARY KEY (`household_sk`),
  UNIQUE KEY `household_key` (`household_key`),
  UNIQUE KEY `uk_hh` (`household_key`),
  KEY `ix_hh_key` (`household_key`),
  KEY `ix_hh_ms` (`marital_status_id`),
  KEY `ix_hh_inc` (`income_band_id`),
  KEY `ix_hh_own` (`homeowner_id`),
  KEY `ix_hh_comp` (`hh_comp_id`),
  KEY `ix_hh_size` (`hh_size_id`),
  KEY `ix_hh_kid` (`kid_category_id`),
  CONSTRAINT `fk_hh_comp` FOREIGN KEY (`hh_comp_id`) REFERENCES `hh_comp_dim` (`hh_comp_id`),
  CONSTRAINT `fk_hh_inc` FOREIGN KEY (`income_band_id`) REFERENCES `income_band_dim` (`income_band_id`),
  CONSTRAINT `fk_hh_kid` FOREIGN KEY (`kid_category_id`) REFERENCES `kid_category_dim` (`kid_category_id`),
  CONSTRAINT `fk_hh_ms` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_status_dim` (`marital_status_id`),
  CONSTRAINT `fk_hh_own` FOREIGN KEY (`homeowner_id`) REFERENCES `homeowner_dim` (`homeowner_id`),
  CONSTRAINT `fk_hh_size` FOREIGN KEY (`hh_size_id`) REFERENCES `hh_size_dim` (`hh_size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `income_band_dim`
--

DROP TABLE IF EXISTS `income_band_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income_band_dim` (
  `income_band_id` int NOT NULL AUTO_INCREMENT,
  `income_desc` varchar(32) NOT NULL,
  PRIMARY KEY (`income_band_id`),
  UNIQUE KEY `income_desc` (`income_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kid_category_dim`
--

DROP TABLE IF EXISTS `kid_category_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kid_category_dim` (
  `kid_category_id` int NOT NULL AUTO_INCREMENT,
  `kid_category_desc` varchar(32) NOT NULL,
  PRIMARY KEY (`kid_category_id`),
  UNIQUE KEY `kid_category_desc` (`kid_category_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manufacturer_dim`
--

DROP TABLE IF EXISTS `manufacturer_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer_dim` (
  `manufacturer_id` int NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(128) NOT NULL,
  PRIMARY KEY (`manufacturer_id`),
  UNIQUE KEY `manufacturer_name` (`manufacturer_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6477 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marital_status_dim`
--

DROP TABLE IF EXISTS `marital_status_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marital_status_dim` (
  `marital_status_id` int NOT NULL AUTO_INCREMENT,
  `marital_status_code` varchar(8) NOT NULL,
  PRIMARY KEY (`marital_status_id`),
  UNIQUE KEY `marital_status_code` (`marital_status_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `product`
--

DROP TABLE IF EXISTS `product`;
/*!50001 DROP VIEW IF EXISTS `product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product` AS SELECT 
 1 AS `product_id`,
 1 AS `department`,
 1 AS `commodity_desc`,
 1 AS `sub_commodity_desc`,
 1 AS `manufacturer`,
 1 AS `brand`,
 1 AS `curr_size_of_product`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product_dim`
--

DROP TABLE IF EXISTS `product_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_dim` (
  `product_sk` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `manufacturer` varchar(128) DEFAULT NULL,
  `department` varchar(128) DEFAULT NULL,
  `brand` varchar(128) DEFAULT NULL,
  `commodity_desc` varchar(128) DEFAULT NULL,
  `sub_commodity_desc` varchar(128) DEFAULT NULL,
  `curr_size_of_product` varchar(64) DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_sk`),
  UNIQUE KEY `product_id` (`product_id`),
  UNIQUE KEY `uk_prod` (`product_id`),
  KEY `ix_pd_id` (`product_id`),
  KEY `ix_product_brand` (`brand_id`),
  KEY `ix_product_manu` (`manufacturer_id`),
  KEY `ix_product_cat` (`category_id`),
  CONSTRAINT `fk_prod_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand_dim` (`brand_id`),
  CONSTRAINT `fk_prod_cat` FOREIGN KEY (`category_id`) REFERENCES `category_dim` (`category_id`),
  CONSTRAINT `fk_prod_manu` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer_dim` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=131071 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promo_fact`
--

DROP TABLE IF EXISTS `promo_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promo_fact` (
  `product_sk` int NOT NULL,
  `store_sk` int NOT NULL,
  `week_sk` int NOT NULL,
  `display` tinyint NOT NULL DEFAULT '0',
  `mailer` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_sk`,`store_sk`,`week_sk`),
  KEY `fk_pf_store` (`store_sk`),
  KEY `fk_pf_week` (`week_sk`),
  CONSTRAINT `fk_pf_product` FOREIGN KEY (`product_sk`) REFERENCES `product_dim` (`product_sk`),
  CONSTRAINT `fk_pf_store` FOREIGN KEY (`store_sk`) REFERENCES `store_dim` (`store_sk`),
  CONSTRAINT `fk_pf_week` FOREIGN KEY (`week_sk`) REFERENCES `week_dim` (`week_sk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_campaign_desc`
--

DROP TABLE IF EXISTS `stg_campaign_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_campaign_desc` (
  `campaign` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_day` int DEFAULT NULL,
  `end_day` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_campaign_desc_raw`
--

DROP TABLE IF EXISTS `stg_campaign_desc_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_campaign_desc_raw` (
  `col1` varchar(255) DEFAULT NULL,
  `col2` varchar(255) DEFAULT NULL,
  `col3` varchar(255) DEFAULT NULL,
  `col4` varchar(255) DEFAULT NULL,
  `col5` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_campaign_table`
--

DROP TABLE IF EXISTS `stg_campaign_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_campaign_table` (
  `household_key` varchar(32) DEFAULT NULL,
  `campaign` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_campaign_table_raw`
--

DROP TABLE IF EXISTS `stg_campaign_table_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_campaign_table_raw` (
  `col1` varchar(255) DEFAULT NULL,
  `col2` varchar(255) DEFAULT NULL,
  `col3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_causal_agg`
--

DROP TABLE IF EXISTS `stg_causal_agg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_causal_agg` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `week_no` int NOT NULL,
  `display` tinyint NOT NULL,
  `mailer` tinyint NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`,`week_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_causal_data`
--

DROP TABLE IF EXISTS `stg_causal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_causal_data` (
  `product_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `week_no` int DEFAULT NULL,
  `display` tinyint DEFAULT NULL,
  `mailer` tinyint DEFAULT NULL,
  KEY `ix_causal_prod` (`product_id`),
  KEY `ix_causal_week` (`week_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_causal_raw`
--

DROP TABLE IF EXISTS `stg_causal_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_causal_raw` (
  `col1` varchar(255) DEFAULT NULL,
  `col2` varchar(255) DEFAULT NULL,
  `col3` varchar(255) DEFAULT NULL,
  `col4` varchar(255) DEFAULT NULL,
  `col5` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_coupon`
--

DROP TABLE IF EXISTS `stg_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_coupon` (
  `campaign` varchar(32) DEFAULT NULL,
  `coupon_upc` varchar(32) DEFAULT NULL,
  `product_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_coupon_raw`
--

DROP TABLE IF EXISTS `stg_coupon_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_coupon_raw` (
  `col1` varchar(255) DEFAULT NULL,
  `col2` varchar(255) DEFAULT NULL,
  `col3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_coupon_redempt`
--

DROP TABLE IF EXISTS `stg_coupon_redempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_coupon_redempt` (
  `household_key` varchar(32) DEFAULT NULL,
  `day` int DEFAULT NULL,
  `coupon_upc` varchar(32) DEFAULT NULL,
  `campaign` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_coupon_redempt_raw`
--

DROP TABLE IF EXISTS `stg_coupon_redempt_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_coupon_redempt_raw` (
  `col1` varchar(255) DEFAULT NULL,
  `col2` varchar(255) DEFAULT NULL,
  `col3` varchar(255) DEFAULT NULL,
  `col4` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_hh_demographic`
--

DROP TABLE IF EXISTS `stg_hh_demographic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_hh_demographic` (
  `age_desc` varchar(32) DEFAULT NULL,
  `marital_status_code` varchar(8) DEFAULT NULL,
  `income_desc` varchar(32) DEFAULT NULL,
  `homeowner_desc` varchar(32) DEFAULT NULL,
  `hh_comp_desc` varchar(64) DEFAULT NULL,
  `household_size_desc` varchar(16) DEFAULT NULL,
  `kid_category_desc` varchar(32) DEFAULT NULL,
  `household_key` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_product`
--

DROP TABLE IF EXISTS `stg_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_product` (
  `product_id` varchar(32) DEFAULT NULL,
  `manufacturer` varchar(128) DEFAULT NULL,
  `department` varchar(128) DEFAULT NULL,
  `brand` varchar(128) DEFAULT NULL,
  `commodity_desc` varchar(128) DEFAULT NULL,
  `sub_commodity_desc` varchar(128) DEFAULT NULL,
  `size` varchar(64) DEFAULT NULL,
  `measure` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_transaction_data`
--

DROP TABLE IF EXISTS `stg_transaction_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_transaction_data` (
  `household_key` int DEFAULT NULL,
  `basket_id` bigint DEFAULT NULL,
  `day` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` decimal(10,3) DEFAULT NULL,
  `sales_value` decimal(12,2) DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `coupon_match_disc` decimal(12,2) DEFAULT NULL,
  `coupon_disc` decimal(12,2) DEFAULT NULL,
  `retail_disc` decimal(12,2) DEFAULT NULL,
  `trans_time` int DEFAULT NULL,
  `week_no` int DEFAULT NULL,
  KEY `ix_txn_hh` (`household_key`),
  KEY `ix_txn_prod` (`product_id`),
  KEY `ix_txn_store` (`store_id`),
  KEY `ix_txn_day` (`day`),
  KEY `ix_txn_week` (`week_no`),
  KEY `ix_stg_txn_hh` (`household_key`),
  KEY `ix_stg_txn_prod` (`product_id`),
  KEY `ix_stg_txn_store` (`store_id`),
  KEY `ix_stg_txn_week` (`week_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_transaction_raw`
--

DROP TABLE IF EXISTS `stg_transaction_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_transaction_raw` (
  `col1` varchar(255) DEFAULT NULL,
  `col2` varchar(255) DEFAULT NULL,
  `col3` varchar(255) DEFAULT NULL,
  `col4` varchar(255) DEFAULT NULL,
  `col5` varchar(255) DEFAULT NULL,
  `col6` varchar(255) DEFAULT NULL,
  `col7` varchar(255) DEFAULT NULL,
  `col8` varchar(255) DEFAULT NULL,
  `col9` varchar(255) DEFAULT NULL,
  `col10` varchar(255) DEFAULT NULL,
  `col11` varchar(255) DEFAULT NULL,
  `col12` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stg_transactions`
--

DROP TABLE IF EXISTS `stg_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stg_transactions` (
  `household_key` varchar(32) DEFAULT NULL,
  `basket_id` bigint DEFAULT NULL,
  `day` int DEFAULT NULL,
  `product_id` varchar(32) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `sales_value` decimal(12,2) DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `retail_disc` decimal(12,2) DEFAULT NULL,
  `coupon_disc` decimal(12,2) DEFAULT NULL,
  `coupon_match_disc` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_dim`
--

DROP TABLE IF EXISTS `store_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_dim` (
  `store_sk` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  PRIMARY KEY (`store_sk`),
  UNIQUE KEY `store_id` (`store_id`),
  UNIQUE KEY `uk_store` (`store_id`),
  KEY `ix_st_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `transaction_data`
--

DROP TABLE IF EXISTS `transaction_data`;
/*!50001 DROP VIEW IF EXISTS `transaction_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transaction_data` AS SELECT 
 1 AS `household_key`,
 1 AS `basket_id`,
 1 AS `day`,
 1 AS `product_id`,
 1 AS `quantity`,
 1 AS `sales_value`,
 1 AS `store_id`,
 1 AS `coupon_match_disc`,
 1 AS `coupon_disc`,
 1 AS `retail_disc`,
 1 AS `trans_time`,
 1 AS `week_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transactions_fact`
--

DROP TABLE IF EXISTS `transactions_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions_fact` (
  `txn_sk` bigint NOT NULL AUTO_INCREMENT,
  `household_sk` int NOT NULL,
  `product_sk` int NOT NULL,
  `store_sk` int NOT NULL,
  `week_sk` int NOT NULL,
  `basket_id` bigint DEFAULT NULL,
  `day` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `sales_value` decimal(12,2) DEFAULT NULL,
  `coupon_match_disc` decimal(12,2) DEFAULT NULL,
  `coupon_disc` decimal(12,2) DEFAULT NULL,
  `retail_disc` decimal(12,2) DEFAULT NULL,
  `trans_time` int DEFAULT NULL,
  PRIMARY KEY (`txn_sk`),
  KEY `ix_txn_hh` (`household_sk`),
  KEY `ix_txn_prod` (`product_sk`),
  KEY `ix_txn_store` (`store_sk`),
  KEY `ix_txn_week` (`week_sk`),
  CONSTRAINT `fk_txn_hh` FOREIGN KEY (`household_sk`) REFERENCES `household_dim` (`household_sk`),
  CONSTRAINT `fk_txn_prod` FOREIGN KEY (`product_sk`) REFERENCES `product_dim` (`product_sk`),
  CONSTRAINT `fk_txn_store` FOREIGN KEY (`store_sk`) REFERENCES `store_dim` (`store_sk`),
  CONSTRAINT `fk_txn_week` FOREIGN KEY (`week_sk`) REFERENCES `week_dim` (`week_sk`)
) ENGINE=InnoDB AUTO_INCREMENT=2890002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `week_dim`
--

DROP TABLE IF EXISTS `week_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `week_dim` (
  `week_sk` int NOT NULL AUTO_INCREMENT,
  `week_no` int NOT NULL,
  PRIMARY KEY (`week_sk`),
  UNIQUE KEY `week_no` (`week_no`),
  UNIQUE KEY `uk_week` (`week_no`),
  KEY `ix_wk_no` (`week_no`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `campaign_desc`
--

/*!50001 DROP VIEW IF EXISTS `campaign_desc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `campaign_desc` AS select `campaign_dim`.`campaign` AS `campaign`,`campaign_dim`.`description` AS `description`,`campaign_dim`.`start_day` AS `start_day`,`campaign_dim`.`end_day` AS `end_day` from `campaign_dim` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `campaign_table`
--

/*!50001 DROP VIEW IF EXISTS `campaign_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `campaign_table` AS select `h`.`household_key` AS `household_key`,`c`.`campaign` AS `campaign` from ((`household_campaign_bridge` `b` join `household_dim` `h` on((`h`.`household_sk` = `b`.`household_sk`))) join `campaign_dim` `c` on((`c`.`campaign_sk` = `b`.`campaign_sk`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `causal_data`
--

/*!50001 DROP VIEW IF EXISTS `causal_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `causal_data` AS select `p`.`product_id` AS `product_id`,`s`.`store_id` AS `store_id`,`w`.`week_no` AS `week_no`,`f`.`display` AS `display`,`f`.`mailer` AS `mailer` from (((`promo_fact` `f` join `product_dim` `p` on((`p`.`product_sk` = `f`.`product_sk`))) join `store_dim` `s` on((`s`.`store_sk` = `f`.`store_sk`))) join `week_dim` `w` on((`w`.`week_sk` = `f`.`week_sk`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coupon`
--

/*!50001 DROP VIEW IF EXISTS `coupon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `coupon` AS select `coupon_map`.`campaign` AS `campaign`,`coupon_map`.`coupon_upc` AS `coupon_upc`,`coupon_map`.`product_id` AS `product_id` from `coupon_map` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `coupon_redempt`
--

/*!50001 DROP VIEW IF EXISTS `coupon_redempt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `coupon_redempt` AS select `h`.`household_key` AS `household_key`,`p`.`product_id` AS `product_id`,`c`.`campaign` AS `campaign`,`r`.`day` AS `day`,`r`.`redeemed` AS `redeemed` from (((`coupon_redemption_fact` `r` join `household_dim` `h` on((`h`.`household_sk` = `r`.`household_sk`))) join `product_dim` `p` on((`p`.`product_sk` = `r`.`product_sk`))) join `campaign_dim` `c` on((`c`.`campaign_sk` = `r`.`campaign_sk`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hh_demographic`
--

/*!50001 DROP VIEW IF EXISTS `hh_demographic`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `hh_demographic` AS select `household_dim`.`household_key` AS `household_key`,`household_dim`.`age_desc` AS `age_desc`,`household_dim`.`marital_status_code` AS `marital_status_code`,`household_dim`.`income_desc` AS `income_desc`,`household_dim`.`homeowner_desc` AS `homeowner_desc`,`household_dim`.`hh_comp_desc` AS `hh_comp_desc`,`household_dim`.`kid_category_desc` AS `kid_category_desc` from `household_dim` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product`
--

/*!50001 DROP VIEW IF EXISTS `product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `product` AS select `product_dim`.`product_id` AS `product_id`,`product_dim`.`department` AS `department`,`product_dim`.`commodity_desc` AS `commodity_desc`,`product_dim`.`sub_commodity_desc` AS `sub_commodity_desc`,`product_dim`.`manufacturer` AS `manufacturer`,`product_dim`.`brand` AS `brand`,`product_dim`.`curr_size_of_product` AS `curr_size_of_product` from `product_dim` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transaction_data`
--

/*!50001 DROP VIEW IF EXISTS `transaction_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `transaction_data` AS select `h`.`household_key` AS `household_key`,`tf`.`basket_id` AS `basket_id`,`tf`.`day` AS `day`,`p`.`product_id` AS `product_id`,`tf`.`quantity` AS `quantity`,`tf`.`sales_value` AS `sales_value`,`s`.`store_id` AS `store_id`,`tf`.`coupon_match_disc` AS `coupon_match_disc`,`tf`.`coupon_disc` AS `coupon_disc`,`tf`.`retail_disc` AS `retail_disc`,`tf`.`trans_time` AS `trans_time`,`w`.`week_no` AS `week_no` from ((((`transactions_fact` `tf` join `household_dim` `h` on((`h`.`household_sk` = `tf`.`household_sk`))) join `product_dim` `p` on((`p`.`product_sk` = `tf`.`product_sk`))) join `store_dim` `s` on((`s`.`store_sk` = `tf`.`store_sk`))) join `week_dim` `w` on((`w`.`week_sk` = `tf`.`week_sk`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-28  8:49:33
