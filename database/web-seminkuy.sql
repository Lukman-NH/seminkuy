-- Adminer 4.8.1 MySQL 5.7.33 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `events_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1,	'Design',	'design',	'2022-06-19 04:03:25',	NULL,	'2022-06-19 04:03:39'),
(2,	'Health',	'health',	'2022-06-22 12:53:21',	NULL,	'2022-06-22 12:57:15');

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pembicara` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `events` (`id`, `categories_id`, `name`, `pembicara`, `harga`, `deskripsi`, `deleted_at`, `created_at`, `updated_at`, `slug`) VALUES
(1,	1,	'UI/UX Design',	'Ahmad Fauzi',	25000,	'<p>Kegiatan Webinar Desain Grafis dengan tema &ldquo;UI/UX Designl&rdquo; telah diselenggarakan oleh Seninkuy. Kegiatan Webinar Desain Grafis ini dilaksanakan pada hari Sabtu, 30&nbsp;Februaru 1512&nbsp;melalui media Zoom dan YouTube.</p>',	NULL,	'2022-06-19 04:04:41',	'2022-06-22 11:15:19',	'uiux-design'),
(2,	2,	'Mental Health',	'Yusuf Cahyaho',	30000,	'<p>deskripsi</p>',	NULL,	'2022-06-22 12:53:53',	'2022-06-22 12:57:32',	'mental-health');

DROP TABLE IF EXISTS `event_galleries`;
CREATE TABLE `event_galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `photos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `events_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `event_galleries` (`id`, `photos`, `events_id`, `created_at`, `updated_at`) VALUES
(1,	'assets/event/ue98r2EsYuobjbtvWB1jHykfmqZv36wOiXtT3Bhd.png',	1,	'2022-06-19 04:23:27',	'2022-06-19 04:23:27'),
(3,	'assets/event/PTjoFnAaBk1fWN984QJQtHc0fekXWoW3KTmrwPpO.png',	2,	'2022-06-22 12:54:59',	'2022-06-22 12:54:59');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2019_08_19_000000_create_failed_jobs_table',	1),
(4,	'2021_11_12_130449_create_event_table',	1),
(5,	'2021_11_12_131941_create_cart_table',	2),
(6,	'2021_11_12_134217_create_transactions_table',	2),
(7,	'2021_11_12_134236_create_transaction_details_table',	2),
(8,	'2021_11_12_145726_add_kode_to_transactions_table',	2),
(9,	'2021_11_12_145930_add_kode_to_transaction_details_table',	2),
(10,	'2021_11_12_150324_add_slug_to_event_table',	3),
(11,	'2021_11_12_151100_add_roles_field_to_users_table',	3),
(12,	'2022_06_19_103638_create_event_galleries_table',	4),
(13,	'2022_06_22_160724_create_ratings_table',	5);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `events_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ratings` (`id`, `users_id`, `events_id`, `rating`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	4,	'2022-06-24 01:17:13',	'2022-06-24 01:33:55'),
(2,	2,	1,	5,	'2022-06-24 02:23:13',	'2022-06-24 02:33:58');

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transactions` (`id`, `users_id`, `total_harga`, `status`, `deleted_at`, `created_at`, `updated_at`, `kode`) VALUES
(1,	1,	25000,	'PENDING',	NULL,	'2022-06-24 01:08:15',	'2022-06-24 01:08:15',	'SEMINKUY-61'),
(2,	2,	25000,	'PENDING',	NULL,	'2022-06-24 02:22:56',	'2022-06-24 02:22:56',	'SEMINKUY-364');

DROP TABLE IF EXISTS `transaction_details`;
CREATE TABLE `transaction_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transactions_id` int(11) NOT NULL,
  `events_id` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transaction_details` (`id`, `transactions_id`, `events_id`, `harga`, `created_at`, `updated_at`, `kode`) VALUES
(1,	1,	1,	25000,	'2022-06-24 01:08:15',	'2022-06-24 01:08:15',	'TRX-9161'),
(2,	2,	1,	25000,	'2022-06-24 02:22:56',	'2022-06-24 02:22:56',	'TRX-1545');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `deleted_at`, `remember_token`, `created_at`, `updated_at`, `roles`) VALUES
(1,	'adminseminkuy',	'adminseminkuy@gmail.com',	NULL,	'$2y$10$TPJ9TAG5LmwpAFyCcn/FnOea.ocAcU4etWHGPMKpyk4.2QKm7Fdua',	'087748333522',	NULL,	NULL,	'2022-06-19 03:54:27',	'2022-06-19 04:00:18',	'ADMIN'),
(2,	'Ahmad Alamsyah',	'alamsyah@gmail.com',	NULL,	'$2y$10$5Xs2QlEFtLtVb.k.7UqQ5OjPPAFc2S63zJ2qI4T7SrxbafNMjWcmm',	'081234567891',	NULL,	NULL,	'2022-06-22 12:42:57',	'2022-06-22 12:43:59',	'USER');

-- 2022-06-24 11:47:40
