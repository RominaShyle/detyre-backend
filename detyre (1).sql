-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 23, 2021 at 01:37 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `detyre`
--

-- --------------------------------------------------------

--
-- Table structure for table `details_data`
--

DROP TABLE IF EXISTS `details_data`;
CREATE TABLE IF NOT EXISTS `details_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedi` varchar(10) NOT NULL,
  `child_weight_from` float NOT NULL DEFAULT '0',
  `child_weight_to` float NOT NULL DEFAULT '0',
  `color_code` varchar(11) DEFAULT NULL,
  `color_description` varchar(20) DEFAULT NULL,
  `country_images` tinyint(1) NOT NULL DEFAULT '0',
  `default_sku` tinyint(1) NOT NULL DEFAULT '0',
  `preferred_ean` varchar(20) NOT NULL,
  `sap_assortment_level` varchar(10) NOT NULL,
  `sap_price` float NOT NULL DEFAULT '0',
  `season` varchar(5) NOT NULL,
  `show_on_line_sku` tinyint(1) NOT NULL DEFAULT '0',
  `size_code` varchar(10) NOT NULL,
  `size_description` varchar(190) NOT NULL,
  `sku_id` varchar(60) NOT NULL,
  `sku_name` text NOT NULL,
  `state_of_article` tinyint(1) NOT NULL DEFAULT '0',
  `um_sa_pprice` varchar(1) NOT NULL DEFAULT '€',
  `volume` float NOT NULL DEFAULT '0',
  `weight` float NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `header_data`
--

DROP TABLE IF EXISTS `header_data`;
CREATE TABLE IF NOT EXISTS `header_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bleaching_description` text,
  `bag` tinyint(1) DEFAULT '0',
  `brand` varchar(20) DEFAULT NULL,
  `brand_code` int(11) DEFAULT NULL,
  `catalog` varchar(90) NOT NULL,
  `creation_date_in_database` datetime DEFAULT CURRENT_TIMESTAMP,
  `drink_holder` tinyint(1) DEFAULT '0',
  `dry_cleaning_description` text,
  `drying_description` text,
  `eshop_display_name` varchar(30) DEFAULT NULL,
  `eshop_display_description` text,
  `eshop_long_description` varchar(90) DEFAULT NULL,
  `ergonomic_seat` tinyint(1) DEFAULT '0',
  `fastening_type_description` varchar(90) DEFAULT '-',
  `fastening_type_textile` varchar(90) DEFAULT '-',
  `flat` tinyint(1) DEFAULT '0',
  `free_delivery` tinyint(1) DEFAULT '0',
  `gender` varchar(11) DEFAULT NULL,
  `indicator_of_it_has_to_be_assembled` tinyint(1) DEFAULT '0',
  `ironing_description` text,
  `last_date_changed` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_user_changed` varchar(30) DEFAULT NULL,
  `pullout_type` varchar(20) DEFAULT NULL,
  `pullout_description` text,
  `punnet` tinyint(1) DEFAULT '0',
  `sap_id` int(11) DEFAULT NULL,
  `show_online` tinyint(1) DEFAULT '0',
  `size_guide` varchar(10) DEFAULT NULL,
  `user_of_creation` varchar(20) DEFAULT NULL,
  `waistline_description` text,
  `washability` varchar(1) DEFAULT '0',
  `washability_description` text,
  `zip_stopper` tinyint(1) DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  `custom1` varchar(11) DEFAULT NULL,
  `custom2` varchar(11) DEFAULT NULL,
  `custom3` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sap_id` (`sap_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bleaching_code` int(11) DEFAULT NULL,
  `default_language` varchar(20) DEFAULT 'en_GB',
  `dry_cleaning_code` int(11) DEFAULT NULL,
  `fastening_type_code` int(11) DEFAULT NULL,
  `ironing_code` int(11) DEFAULT NULL,
  `product_id` int(30) DEFAULT NULL,
  `pullout_type_code` int(11) DEFAULT NULL,
  `sap_packet` int(11) DEFAULT NULL,
  `update_images` tinyint(4) DEFAULT '0',
  `waistline_code` int(11) DEFAULT NULL,
  `washability_code` int(11) DEFAULT NULL,
  `drying_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sap`
--

DROP TABLE IF EXISTS `sap`;
CREATE TABLE IF NOT EXISTS `sap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `division_id` int(11) NOT NULL,
  `division_name` varchar(30) NOT NULL,
  `family_description` text NOT NULL,
  `family_id` int(11) NOT NULL,
  `family_name` varchar(30) NOT NULL,
  `macrocategory_id` int(11) NOT NULL,
  `macrocategory_name` int(11) NOT NULL,
  `name` varchar(90) NOT NULL,
  `universe_id` int(11) NOT NULL,
  `universe_name` varchar(20) NOT NULL,
  `um_sa_pprice` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`),
  UNIQUE KEY `category_name` (`category_name`),
  UNIQUE KEY `division_id` (`division_id`),
  UNIQUE KEY `family_id` (`family_id`),
  UNIQUE KEY `family_name` (`family_name`),
  UNIQUE KEY `macrocategory_id` (`macrocategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `details_data`
--
ALTER TABLE `details_data`
  ADD CONSTRAINT `details_data_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `header_data`
--
ALTER TABLE `header_data`
  ADD CONSTRAINT `header_data_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
