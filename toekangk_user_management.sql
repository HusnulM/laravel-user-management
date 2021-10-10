-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2021 at 04:03 PM
-- Server version: 10.3.31-MariaDB-cll-lve
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toekangk_user_management`
--

DELIMITER $$
--
-- Functions
--
$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menugroups`
--

CREATE TABLE `menugroups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icons` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_index` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menugroups`
--

INSERT INTO `menugroups` (`id`, `description`, `icons`, `_index`, `created_at`, `updated_at`) VALUES
(1, 'MASTER DATA', NULL, 1, '2021-09-11 17:00:00', '2021-09-11 17:00:00'),
(2, 'PROCUREMENT', NULL, 2, NULL, NULL),
(3, 'REPORTS', NULL, 4, NULL, NULL),
(4, 'SETTINGS', NULL, 99, NULL, NULL),
(5, 'SALES', NULL, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menuroles`
--

CREATE TABLE `menuroles` (
  `menuid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menuroles`
--

INSERT INTO `menuroles` (`menuid`, `roleid`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(2, 1, NULL, NULL),
(2, 2, NULL, NULL),
(2, 4, NULL, NULL),
(3, 1, NULL, NULL),
(3, 4, NULL, NULL),
(4, 1, NULL, NULL),
(4, 2, NULL, NULL),
(4, 4, NULL, NULL),
(5, 1, NULL, NULL),
(6, 1, NULL, NULL),
(7, 1, NULL, NULL),
(8, 1, NULL, NULL),
(9, 1, NULL, NULL),
(10, 1, NULL, NULL),
(11, 1, NULL, NULL),
(11, 2, NULL, NULL),
(11, 4, NULL, NULL),
(12, 1, NULL, NULL),
(13, 1, NULL, NULL),
(13, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menugroup` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `route`, `menugroup`, `created_at`, `updated_at`) VALUES
(1, 'Master Barang', 'master/barang', 1, NULL, NULL),
(2, 'Master Supplier', 'master/supplier', 1, NULL, NULL),
(3, 'Purchase Requisition', 'procurement/purchaserequest', 2, NULL, NULL),
(4, 'Purchase Order', 'procurement/purchaseorder', 2, NULL, NULL),
(5, 'Data User', 'setting/users', 4, NULL, NULL),
(6, 'Menu Groups', 'setting/menugroups', 4, NULL, NULL),
(7, 'Menus', 'setting/menus', 4, NULL, NULL),
(8, 'Roles', 'setting/roles', 4, NULL, NULL),
(9, 'Menu Roles', 'setting/menuroles', 4, NULL, NULL),
(10, 'User Roles', 'setting/userroles', 4, NULL, NULL),
(11, 'Purchase Order', 'reports/purchaseorder', 3, NULL, NULL),
(12, 'Penerimaan Barang', 'reports/penerimaan', 3, NULL, NULL),
(13, 'Outstanding PR', 'reports/outstandingpr', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, '2021_09_12_090939_create_roles_table', 1),
(6, '2021_09_12_090956_create_menus_table', 1),
(7, '2021_09_12_091012_create_menuroles_table', 1),
(8, '2021_09_12_091028_create_userroles_table', 1),
(9, '2021_09_12_100636_create_menugroups_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rolename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `rolename`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', NULL, NULL),
(2, 'Procurement', NULL, NULL),
(3, 'Logistik', NULL, NULL),
(4, 'Staff Procurement', NULL, NULL),
(5, 'Staff Logistik', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `nim` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleid` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`email`, `roleid`, `created_at`, `updated_at`) VALUES
('admin@test.com', 1, NULL, NULL),
('logistik@gmail.com', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Staff Logistik', 'logistik@gmail.com', NULL, '$2y$12$LGfZIyIWBs/SNFIERYFXk.aOiKpGTB7ZkUclIxo2biVzzC8SEYy0W', NULL, NULL, NULL),
(3, 'Admin', 'admin@test.com', NULL, '$2y$12$7ocjFGwx4XufjLvxOayMhO9bOlmgRgCcp6Lr6891E8pYv6jYAs9GS', NULL, NULL, NULL),
(4, 'User QA', 'qatest@mail.com', NULL, '$2y$12$EKHxkO16aFspnI.mQePy2OpiLkWnkclXFsdHrOK80RDNp7f85W3li', NULL, NULL, NULL),
(5, 'User Procurement', 'procurement@mail.com', NULL, '$2y$12$JzxZW9k9iPFEYo2SOL/QaupbrcX3VZJKAYAHWxAaBAvsuQdb8EyIy', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_menuroles`
-- (See below for the actual view)
--
CREATE TABLE `v_menuroles` (
`role` varchar(255)
,`roleid` int(11)
,`description` varchar(255)
,`menuid` int(11)
,`route` varchar(255)
,`menugroup` int(11)
,`groupname` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_menus`
-- (See below for the actual view)
--
CREATE TABLE `v_menus` (
`id` bigint(20) unsigned
,`description` varchar(255)
,`route` varchar(255)
,`menugroup` int(11)
,`groupname` varchar(50)
,`_index` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_usermenus`
-- (See below for the actual view)
--
CREATE TABLE `v_usermenus` (
`id` bigint(20) unsigned
,`name` varchar(50)
,`email` varchar(50)
,`roleid` int(11)
,`role` varchar(255)
,`rolename` varchar(255)
,`menuid` int(11)
,`menuname` varchar(255)
,`route` varchar(255)
,`menugroup` int(11)
,`groupname` varchar(50)
,`groupicon` varchar(50)
,`_index` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_userroles`
-- (See below for the actual view)
--
CREATE TABLE `v_userroles` (
`id` bigint(20) unsigned
,`name` varchar(50)
,`email` varchar(50)
,`roleid` int(11)
,`role` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `v_menuroles`
--
DROP TABLE IF EXISTS `v_menuroles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_menuroles`  AS SELECT `c`.`rolename` AS `role`, `b`.`roleid` AS `roleid`, `a`.`name` AS `description`, `b`.`menuid` AS `menuid`, `a`.`route` AS `route`, `a`.`menugroup` AS `menugroup`, `d`.`description` AS `groupname` FROM (((`menus` `a` join `menuroles` `b` on(`a`.`id` = `b`.`menuid`)) join `roles` `c` on(`b`.`roleid` = `c`.`id`)) join `menugroups` `d` on(`a`.`menugroup` = `d`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_menus`
--
DROP TABLE IF EXISTS `v_menus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_menus`  AS SELECT `a`.`id` AS `id`, `a`.`name` AS `description`, `a`.`route` AS `route`, `a`.`menugroup` AS `menugroup`, `b`.`description` AS `groupname`, `b`.`_index` AS `_index` FROM (`menus` `a` join `menugroups` `b` on(`a`.`menugroup` = `b`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_usermenus`
--
DROP TABLE IF EXISTS `v_usermenus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usermenus`  AS SELECT `a`.`id` AS `id`, `a`.`name` AS `name`, `a`.`email` AS `email`, `b`.`roleid` AS `roleid`, `c`.`rolename` AS `role`, `c`.`rolename` AS `rolename`, `d`.`menuid` AS `menuid`, `e`.`name` AS `menuname`, `e`.`route` AS `route`, `e`.`menugroup` AS `menugroup`, `f`.`description` AS `groupname`, `f`.`icons` AS `groupicon`, `f`.`_index` AS `_index` FROM (((((`users` `a` join `userroles` `b` on(`a`.`email` = `b`.`email`)) join `roles` `c` on(`b`.`roleid` = `c`.`id`)) join `menuroles` `d` on(`c`.`id` = `d`.`roleid`)) join `menus` `e` on(`d`.`menuid` = `e`.`id`)) join `menugroups` `f` on(`e`.`menugroup` = `f`.`id`)) ORDER BY `f`.`_index` ASC, `a`.`id` ASC, `b`.`roleid` ASC, `f`.`id` ASC, `d`.`menuid` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_userroles`
--
DROP TABLE IF EXISTS `v_userroles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_userroles`  AS SELECT `a`.`id` AS `id`, `a`.`name` AS `name`, `a`.`email` AS `email`, `b`.`roleid` AS `roleid`, `c`.`rolename` AS `role` FROM ((`users` `a` join `userroles` `b` on(`a`.`email` = `b`.`email`)) join `roles` `c` on(`b`.`roleid` = `c`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menugroups`
--
ALTER TABLE `menugroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menuroles`
--
ALTER TABLE `menuroles`
  ADD PRIMARY KEY (`menuid`,`roleid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
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
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`(191),`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`email`,`roleid`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menugroups`
--
ALTER TABLE `menugroups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
