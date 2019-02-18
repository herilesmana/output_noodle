-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 18, 2019 at 06:37 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `output_noodle`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
CREATE TABLE IF NOT EXISTS `achievement` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `MID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` int(11) NOT NULL,
  `actual` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `achievement`
--

INSERT INTO `achievement` (`id`, `start_date`, `end_date`, `MID`, `target`, `actual`, `created_at`, `updated_at`) VALUES
(2, '2019-02-10', '2019-02-17', '100010', 1000, 0, '2019-02-17 09:33:24', '2019-02-17 09:33:24'),
(4, '2019-02-11', '2019-02-18', '100011', 10000, 0, '2019-02-17 10:17:45', '2019-02-17 10:17:45'),
(5, '2019-02-11', '2019-02-14', '100012', 10000, 0, '2019-02-17 10:19:42', '2019-02-17 10:19:42'),
(6, '2019-02-17', '2019-02-23', '100010', 10000, 0, '2019-02-17 10:27:52', '2019-02-17 10:27:52'),
(7, '2019-02-17', '2019-02-23', '100011', 10000, 0, '2019-02-17 10:28:03', '2019-02-17 10:28:03'),
(8, '2019-02-03', '2019-02-09', '100011', 20000, 0, '2019-02-17 14:10:25', '2019-02-17 14:10:25'),
(9, '2019-02-17', '2019-02-23', '20032', 1000, 0, '2019-02-17 22:56:29', '2019-02-17 22:56:29'),
(10, '2019-02-17', '2019-02-23', '20088', 1000, 0, '2019-02-17 22:57:25', '2019-02-17 22:57:25'),
(11, '2019-02-17', '2019-02-23', '20030', 1000, 0, '2019-02-17 22:58:37', '2019-02-17 22:58:37'),
(12, '2019-02-17', '2019-02-23', '20092', 1000, 0, '2019-02-17 22:59:59', '2019-02-17 22:59:59'),
(13, '2019-02-17', '2019-02-23', '20031', 1000, 0, '2019-02-17 23:00:48', '2019-02-17 23:00:48'),
(14, '2019-02-17', '2019-02-23', '20093', 1000, 0, '2019-02-17 23:01:33', '2019-02-17 23:01:33'),
(15, '2019-02-17', '2019-02-23', '17000004', 1000, 0, '2019-02-17 23:02:16', '2019-02-17 23:02:16');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2019_02_16_040213_create_table_variant', 1),
(7, '2019_02_17_161537_create_achievement_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mlog`
--

DROP TABLE IF EXISTS `mlog`;
CREATE TABLE IF NOT EXISTS `mlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namamesin` varchar(25) NOT NULL,
  `nobatch` int(11) NOT NULL,
  `tgljam` datetime(3) NOT NULL,
  `barcode` varchar(20) NOT NULL,
  `darireader` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mvariant`
--

DROP TABLE IF EXISTS `mvariant`;
CREATE TABLE IF NOT EXISTS `mvariant` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `MID` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mvariant`
--

INSERT INTO `mvariant` (`id`, `MID`, `name`, `barcode`, `status`, `created_at`, `updated_at`) VALUES
(4, '20030', 'SEDAAP MIE GORENG 91GR', '18998866200308', '1', NULL, NULL),
(5, '20031', 'SEDAAP MIE AYAM BAWANG 70GR', '18998866200315', '1', NULL, NULL),
(6, '20032', 'SEDAAP MIE SOTO 75GR', '18998866200322', '1', NULL, NULL),
(7, '20044', 'SEDAAP MIE SAMBAL GORENG 88GR', '18998866200445', '1', NULL, NULL),
(8, '20057', 'SEDAAP MIE KARI SPESIAL 76GR', '18998866200575', '1', NULL, NULL),
(9, '20088', 'NOODLE SUKSESS MIE GR AYAM KREMEES 133GR', '18998866200889', '1', NULL, NULL),
(10, '20089', 'NOODLE SUKSESS MIE AB 113GR @ 24PCS', '18998866200896', '1', NULL, NULL),
(11, '20091', 'NOODLE SUKSESS MIE KA 113GR @ 24PCS', '18998866200919', '1', NULL, NULL),
(12, '20092', 'SEDAAP MIE BASO SPESIAL 77 GR', '18998866200926', '1', NULL, NULL),
(13, '20093', 'SEDAAP MIE GORENG AYAM KRISPI 88GR', '18998866200933', '1', NULL, NULL),
(14, '20098', 'MIE EKO DUO (EM2)', '18998866200988', '1', NULL, NULL),
(15, '20134', 'SEDAAP MIE WHITE CURRY', '18998866201343', '1', NULL, NULL),
(16, '20156', 'NOODLE SEDAAP MIE AYAM BAWANG TELUR 73 G', '18998866201565', '1', NULL, NULL),
(17, '20166', 'NOODLE SUKSESS GORENG AYAM KECAP 129GR', '18998866201664', '1', NULL, NULL),
(18, '20192', 'MIESEDAAP GORENG RASA MIAYAM ISTIMEWA92G', '18998866201923', '1', NULL, NULL),
(19, '17000004', 'SEDAAP MIE GORENG MALAYSIA', '18998866804124', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `NIK` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`NIK`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`NIK`, `name`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
('040917-25749', 'Heri Lesmana', 'lezmanaherie@gmail.com', '$2y$10$/BiodDyb1j53GVgzZtkgkujRz4nYcRN2CeiO9dj1coE2TwCQxPxvS', '1', NULL, '2019-02-16 09:22:26', '2019-02-16 09:22:26');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
