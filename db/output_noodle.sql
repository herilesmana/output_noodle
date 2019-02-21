-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 21, 2019 at 10:56 AM
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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `achievement`
--

INSERT INTO `achievement` (`id`, `start_date`, `end_date`, `MID`, `target`, `actual`, `created_at`, `updated_at`) VALUES
(29, '2019-02-18', '2019-02-23', '20166', 20250, 0, '2019-02-20 20:39:35', '2019-02-20 20:39:35'),
(28, '2019-02-18', '2019-02-18', '20156', 4347, 0, '2019-02-20 20:39:02', '2019-02-20 20:39:02'),
(27, '2019-02-18', '2019-02-19', '20134', 10764, 0, '2019-02-20 20:38:26', '2019-02-20 20:38:26'),
(26, '2019-02-18', '2019-02-23', '20098', 12938, 0, '2019-02-20 20:37:45', '2019-02-20 20:37:45'),
(25, '2019-02-18', '2019-02-23', '20093', 7452, 0, '2019-02-20 20:37:23', '2019-02-20 20:37:23'),
(24, '2019-02-18', '2019-02-23', '20092', 37881, 0, '2019-02-20 20:36:54', '2019-02-20 20:36:54'),
(23, '2019-02-18', '2019-02-23', '20091', 7560, 0, '2019-02-20 20:36:19', '2019-02-20 20:36:19'),
(22, '2019-02-18', '2019-02-23', '20089', 27810, 0, '2019-02-20 20:35:43', '2019-02-20 20:35:43'),
(21, '2019-02-18', '2019-02-23', '20057', 67793, 0, '2019-02-20 20:35:14', '2019-02-20 20:35:14'),
(20, '2019-02-18', '2019-02-23', '20032', 190647, 0, '2019-02-20 20:34:44', '2019-02-20 20:34:44'),
(19, '2019-02-18', '2019-02-23', '20031', 158666, 0, '2019-02-20 20:33:59', '2019-02-20 20:33:59'),
(18, '2019-02-17', '2019-02-23', '20030', 139725, 0, '2019-02-20 20:33:22', '2019-02-20 20:33:22'),
(17, '2019-02-18', '2019-02-23', '20088', 55620, 0, '2019-02-20 19:35:18', '2019-02-20 19:35:18'),
(30, '2019-02-18', '2019-02-23', '17000004', 69863, 0, '2019-02-20 20:40:05', '2019-02-20 20:40:05');

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
