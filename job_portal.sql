-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2024 at 09:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Accountant', 1, '2024-07-30 22:11:38', '2024-07-30 22:11:38'),
(2, 'Doctor', 1, '2024-07-30 22:11:38', '2024-07-30 22:11:38'),
(3, 'Information Technology', 1, '2024-07-30 22:11:38', '2024-07-30 22:11:38'),
(4, 'Engineer', 1, '2024-07-30 22:11:38', '2024-07-30 22:11:38'),
(5, 'pharmacist', 1, '2024-07-30 22:11:38', '2024-07-30 22:11:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `job_type_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `vacancy` int(11) NOT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `benefits` text DEFAULT NULL,
  `responsibility` text DEFAULT NULL,
  `qualifications` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `experiance` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_location` varchar(255) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `isFeatured` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `category_id`, `job_type_id`, `user_id`, `vacancy`, `salary`, `location`, `description`, `benefits`, `responsibility`, `qualifications`, `keywords`, `experiance`, `company_name`, `company_location`, `company_website`, `status`, `isFeatured`, `created_at`, `updated_at`) VALUES
(1, 'Web Developer Required', 3, 4, 1, 1, '30-50L/y', 'Noida, India', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.<p></p>\r\n                            <p>Variations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.</p>', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.</p>', '<ul>\r\n                                <li>The applicants should have experience in the following areas.</li>\r\n                                <li>Have sound knowledge of commercial activities.</li>\r\n                                <li>Leadership, analytical, and problem-solving abilities.</li>\r\n                                <li>Should have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.</li>\r\n                            </ul>', '<ul>\r\n                                <li>The applicants should have experience in the following areas.</li>\r\n                                <li>Have sound knowledge of commercial activities.</li>\r\n                                <li>Leadership, analytical, and problem-solving abilities.</li>\r\n                                <li>Should have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.</li>\r\n                            </ul>', 'php,laravel,html,css', '2', 'XYZ Company', NULL, 'http://www.xyz.com', 1, 0, '2024-08-03 01:26:03', '2024-08-05 07:56:40'),
(2, 'Hudson Heathcote', 5, 4, 2, 1, NULL, 'Glendafurt', 'Explicabo blanditiis repellat autem sint iusto qui et. Deserunt culpa et vero tempora. Rerum nisi omnis sed aliquid amet illum. Quis rerum quis impedit.', NULL, NULL, NULL, NULL, '5', 'Curtis Kuvalis', NULL, NULL, 1, 1, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(3, 'Johathan Swaniawski', 4, 5, 1, 3, NULL, 'Port Jayceeport', 'Necessitatibus nesciunt laudantium qui. Qui quo in consequatur omnis sit ut. Aut hic voluptas laborum et eveniet officiis. Sunt et corrupti at aut.', NULL, NULL, NULL, NULL, '2', 'Lisa Powlowski', NULL, NULL, 1, 1, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(4, 'Emie Mayer I', 3, 4, 2, 2, NULL, 'Joneschester', 'Dignissimos sit id veritatis voluptatum culpa reiciendis. Reprehenderit ipsa asperiores rerum est voluptate quo rerum. Dolor rerum blanditiis atque eius itaque vero.', NULL, NULL, NULL, NULL, '1', 'Dr. Fred Gerhold', NULL, NULL, 1, 1, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(6, 'Miss Josephine Wunsch', 3, 3, 1, 4, NULL, 'Schambergerside', 'Voluptate aut provident cumque exercitationem molestias dolorum voluptatem. Sed distinctio optio corporis fuga. Hic inventore ab eius consequuntur voluptatem facere et quo.', NULL, NULL, NULL, NULL, '4', 'Kitty Nicolas', NULL, NULL, 1, 1, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(11, 'Mr. Reagan Thompson I', 4, 1, 2, 5, NULL, 'West Kamron', 'Ratione laboriosam suscipit facilis minus quod tempore corrupti. Et recusandae molestiae quod libero vitae sit. Error consectetur ab ullam corrupti et ipsam labore nihil.', NULL, NULL, NULL, NULL, '4', 'Ms. Loren Schamberger III', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(12, 'Rebeca Walker', 1, 5, 1, 5, NULL, 'West Harrison', 'Dolorem magni rem fugiat impedit unde explicabo eum. Quae quis ut et in enim deleniti. Fuga excepturi labore quas voluptas asperiores in eum. Eos consequuntur perspiciatis quas et id asperiores quia.', NULL, NULL, NULL, NULL, '4', 'Cordia Skiles', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(13, 'Ms. Kariane Powlowski IV', 1, 3, 1, 3, NULL, 'Erichborough', 'Et veniam adipisci et accusamus quaerat et ad. Quia incidunt nobis ut nihil sit. Tenetur voluptas velit atque et possimus corrupti. Quaerat molestiae quia dolor iusto consequatur modi ipsum.', NULL, NULL, NULL, NULL, '5', 'Marilie Hudson', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(14, 'Alan Roob', 3, 5, 1, 5, NULL, 'New Felicia', 'Et amet repellendus doloribus magni esse quasi. Iusto in molestiae earum dignissimos ipsa error eos est. Quas explicabo non ipsum modi rem ipsam. Temporibus adipisci qui est aut.', NULL, NULL, NULL, NULL, '2', 'Zola Kilback', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(15, 'Buck DuBuque', 1, 1, 2, 3, NULL, 'Abshireview', 'Sint cumque voluptatum nam quidem. Rerum sapiente quam quasi ut dolor. Quas et quos tenetur inventore facere neque excepturi. Excepturi numquam dicta nemo aspernatur.', NULL, NULL, NULL, NULL, '5', 'Roberta Kunze', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(17, 'Fred Kshlerin', 5, 3, 1, 4, NULL, 'East Jaylinburgh', 'Nulla voluptates qui sunt ad est ea. Et aliquid nihil voluptas et eligendi qui. Est animi possimus amet omnis id. Et corrupti quam voluptatem error aspernatur.', NULL, NULL, NULL, NULL, '4', 'Nona Wilderman', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(18, 'Lorna Stracke Jr.', 5, 3, 2, 2, NULL, 'South Aureliaberg', 'Placeat iste hic voluptatem velit. Provident dolorum optio facilis quas quis. Rem occaecati quasi sit ratione voluptatibus dolores beatae. Eaque delectus eius et quo.', NULL, NULL, NULL, NULL, '2', 'Kailyn Denesik', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(19, 'Ayla Abshire', 2, 5, 2, 1, NULL, 'Mitchellville', 'Nesciunt nemo recusandae molestiae minus vel architecto possimus aut. Hic aut laboriosam cum dolorum. Et a optio sequi expedita.', NULL, NULL, NULL, NULL, '1', 'Mrs. Delia Hickle', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(20, 'Katelynn Boyer', 5, 5, 2, 4, NULL, 'Connport', 'Odio omnis odio sit perspiciatis et. Amet et reiciendis fuga ut unde. Et nostrum error saepe. Exercitationem qui aperiam quae est nemo ducimus. Aut et quam nostrum quia laborum minus.', NULL, NULL, NULL, NULL, '3', 'Freddie Purdy', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(21, 'Evalyn Stroman', 3, 1, 1, 1, NULL, 'Lake Sarai', 'Eum voluptatem et repudiandae. Eaque vel voluptates quos neque mollitia rerum. Doloremque mollitia ea nihil voluptates hic rerum quo molestiae.', NULL, NULL, NULL, NULL, '4', 'Prof. Tyrese Russel', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(23, 'Jessika Robel', 1, 4, 2, 2, NULL, 'Boyerborough', 'Et expedita ad et atque qui aut pariatur et. Sunt in dolor possimus suscipit optio ut culpa. Qui consequatur eos fuga possimus odit. Accusantium est laboriosam dolor minima nihil.', NULL, NULL, NULL, NULL, '2', 'Alisa Schultz', NULL, NULL, 1, 0, '2024-08-03 01:26:03', '2024-08-03 01:26:03'),
(26, 'Laravel Developer', 3, 3, 1, 3, '45K', 'lucknow', '<blockquote><strong>There are many variations of passages</strong><strong style=\"font-family: Mont-Regular; font-size: 16px;\"> of Lorem Ipsum available</strong><strong style=\"font-family: Mont-Regular; font-size: 16px;\">, but the majority have suffered alteration in some form</strong><span style=\"font-size: 16px;\">, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.</span></blockquote><ol><li><span style=\"font-size: 16px; color: var(--bs-body-color); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Variations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, </span><em style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">you need to be sure there isn\'t anything embarrassing.</em></li><li>bullet 1</li><li>bullet 2</li><li>bullet 3</li><li>bullet 4</li></ol>', '<blockquote><span style=\"font-weight: bolder;\">There are many variations of passages</span><span style=\"font-weight: bolder; font-size: 16px;\">&nbsp;of Lorem Ipsum available</span><span style=\"font-weight: bolder; font-size: 16px;\">, but the majority have suffered alteration in some form</span><span style=\"font-size: 16px;\">, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.</span></blockquote><ul><li><span style=\"font-size: 16px; color: var(--bs-body-color); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Variations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum,&nbsp;</span><em style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">you need to be sure there isn\'t anything embarrassing.</em></li><li>bullet&nbsp;</li><li>bullet&nbsp;</li><li>bullet&nbsp;</li><li style=\"outline: none !important;\">bullet&nbsp;</li></ul>', '<blockquote><span style=\"font-weight: bolder;\">There are many variations of passages</span><span style=\"font-weight: bolder; font-size: 16px;\">&nbsp;of Lorem Ipsum available</span><span style=\"font-weight: bolder; font-size: 16px;\">, but the majority have suffered alteration in some form</span><span style=\"font-size: 16px;\">, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.</span></blockquote><ol style=\"outline: none !important;\"><li><span style=\"font-size: 16px; color: var(--bs-body-color); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Variations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum,&nbsp;</span><em style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">you need to be sure there isn\'t anything embarrassing.</em></li><li>bullet 1</li><li>bullet 2</li><li>bullet 3</li><li style=\"outline: none !important;\">bullet 4</li></ol>', '<blockquote><span style=\"font-weight: bolder;\">There are many variations of passages</span><span style=\"font-weight: bolder; font-size: 16px;\">&nbsp;of Lorem Ipsum available</span><span style=\"font-weight: bolder; font-size: 16px;\">, but the majority have suffered alteration in some form</span><span style=\"font-size: 16px;\">, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.</span></blockquote><ol style=\"outline: none !important;\"><li><span style=\"font-size: 16px; color: var(--bs-body-color); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">Variations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum,&nbsp;</span><em style=\"color: var(--bs-body-color); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">you need to be sure there isn\'t anything embarrassing.</em></li><li>bullet 1</li><li>bullet 2</li><li>bullet 3</li><li style=\"outline: none !important;\">bullet 4</li></ol>', 'php,laravel', '1', 'abc company', NULL, NULL, 1, 1, '2024-08-04 23:17:36', '2024-08-05 07:55:44');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `employer_id` bigint(20) UNSIGNED NOT NULL,
  `applied_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `job_id`, `user_id`, `employer_id`, `applied_date`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 1, '2024-08-03 02:22:36', '2024-08-03 02:22:36', '2024-08-03 02:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `job_types`
--

CREATE TABLE `job_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_types`
--

INSERT INTO `job_types` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Full Time', 1, '2024-07-30 22:11:38', '2024-07-30 22:11:38'),
(2, 'Part Time', 1, '2024-07-30 22:11:38', '2024-07-30 22:11:38'),
(3, 'Freelance', 1, '2024-07-30 22:11:38', '2024-07-30 22:11:38'),
(4, 'Remote', 1, '2024-07-30 22:11:38', '2024-07-30 22:11:38'),
(5, 'Contract', 1, '2024-07-30 22:11:38', '2024-07-30 22:11:38');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_07_31_084200_create_categories_table', 1),
(6, '2024_07_31_084310_create_job_types_table', 1),
(7, '2024_07_31_084407_create_jobs_table', 1),
(8, '2024_08_01_051510_alter_jobs_table', 1),
(9, '2024_08_01_054458_alter_jobs_table', 1),
(10, '2024_08_02_092856_create_job_applications_table', 1),
(11, '2024_08_03_121916_create_saved_jobs_table', 2),
(12, '2024_08_05_051722_alter_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('user@gmail.com', '88tVpMkFaxrjvfBnW5gCAEVwTxX2H5Du2OBPwDj2rxJSXQbWk4QwRFJJnjMP', '2024-08-06 00:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_jobs`
--

CREATE TABLE `saved_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saved_jobs`
--

INSERT INTO `saved_jobs` (`id`, `job_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '2024-08-03 07:38:53', '2024-08-03 07:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `designation`, `mobile`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$cgSuejOxv5TdvYfaZ5wMSezd9XJ5TMHoeM/Taf9AFqLbbEnAuJLrC', NULL, 'Web Developer', '9876543444', 'admin', NULL, '2024-08-03 01:23:05', '2024-08-05 02:25:26'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$Slp9TdXVSpjxjroD2XxZzOzV5W1rgQNECbuwdPphFsTVE.ga7wxja', NULL, NULL, '8767890987', 'user', NULL, '2024-08-03 01:23:39', '2024-08-06 01:22:19'),
(6, 'Davin Auer', 'julia17@example.com', '2024-08-05 02:45:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', 'ZeoiznNynX', '2024-08-05 02:45:20', '2024-08-05 02:45:20'),
(7, 'Dortha Harvey', 'carol52@example.com', '2024-08-05 02:45:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', '9KMxBk2tbN', '2024-08-05 02:45:20', '2024-08-05 02:45:20'),
(8, 'Edgardo Gislason', 'stroman.kara@example.net', '2024-08-05 02:45:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', 'LeKTrplm6X', '2024-08-05 02:45:20', '2024-08-05 02:45:20'),
(9, 'Meggie Lockman', 'iroberts@example.org', '2024-08-05 02:45:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', '9Lm9rLAiGM', '2024-08-05 02:45:20', '2024-08-05 02:45:20'),
(10, 'Dr. Jerry Langworth', 'garnet60@example.net', '2024-08-05 02:45:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', 'gSKxGuJ68U', '2024-08-05 02:45:20', '2024-08-05 02:45:20'),
(11, 'Herminia Block', 'ehansen@example.com', '2024-08-05 02:45:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', 'r3DrIp1GXr', '2024-08-05 02:45:20', '2024-08-05 02:45:20'),
(12, 'Mrs. Gwen Pouros', 'nlesch@example.com', '2024-08-05 02:45:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', 'he9PyHImgi', '2024-08-05 02:45:20', '2024-08-05 02:45:20'),
(13, 'Bud Effertz', 'paucek.tanner@example.org', '2024-08-05 02:45:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', 'c7xvoxhDPX', '2024-08-05 02:45:20', '2024-08-05 02:45:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_category_id_foreign` (`category_id`),
  ADD KEY `jobs_job_type_id_foreign` (`job_type_id`),
  ADD KEY `jobs_user_id_foreign` (`user_id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_applications_job_id_foreign` (`job_id`),
  ADD KEY `job_applications_user_id_foreign` (`user_id`),
  ADD KEY `job_applications_employer_id_foreign` (`employer_id`);

--
-- Indexes for table `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_jobs_job_id_foreign` (`job_id`),
  ADD KEY `saved_jobs_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_job_type_id_foreign` FOREIGN KEY (`job_type_id`) REFERENCES `job_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_employer_id_foreign` FOREIGN KEY (`employer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_applications_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  ADD CONSTRAINT `saved_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_jobs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
