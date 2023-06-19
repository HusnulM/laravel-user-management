-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jun 2023 pada 10.27
-- Versi server: 8.0.29
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_user_management`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `menugroups`
--

CREATE TABLE `menugroups` (
  `id` bigint UNSIGNED NOT NULL,
  `menugroup` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupicon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_index` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `createdby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menugroups`
--

INSERT INTO `menugroups` (`id`, `menugroup`, `groupicon`, `_index`, `created_at`, `updated_at`, `createdby`, `updatedby`) VALUES
(1, 'MASTER', 'fa fa-database', 1, '2022-07-26 02:12:00', NULL, 'sys-admin', ''),
(2, 'SETTINGS', 'fa fa-gear', 7, '2022-07-26 02:12:09', NULL, 'sys-admin', 'husnulmub@gmail.com'),
(3, 'PROCUREMENT', 'fa fa-cart-shopping', 2, '2022-07-26 02:12:09', NULL, 'sys-admin', 'husnulmub@gmail.com'),
(5, 'REPORTS', NULL, 4, '2022-07-26 23:07:03', NULL, 'husnulmub@gmail.com', 'husnulmub@gmail.com'),
(6, 'LOGISTICS', 'fa fa-truck', 3, '2022-08-26 06:08:52', NULL, 'husnulmub@gmail.com', 'husnulmub@gmail.com'),
(7, 'APPROVAL', 'fa fa-circle-check', 5, '2022-10-04 00:10:39', NULL, 'husnulmub@gmail.com', 'husnulmub@gmail.com'),
(8, 'BUDGETING', 'fa fa-money-check-dollar', 5, '2022-10-10 00:10:44', NULL, 'husnulmub@gmail.com', 'husnulmub@gmail.com'),
(9, 'REPORTS', 'fa fa-list', 6, '2022-10-15 19:10:42', NULL, 'husnulmub@gmail.com', NULL),
(10, 'PRINT DOCUMENT', 'fa fa-print', 5, '2022-11-07 23:11:16', NULL, 'husnulmub@gmail.com', NULL),
(11, 'PBJ', 'fa fa-list', 3, '2023-06-09 19:06:02', NULL, 'husnulmub@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menuroles`
--

CREATE TABLE `menuroles` (
  `menuid` int NOT NULL,
  `roleid` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `createdby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menuroles`
--

INSERT INTO `menuroles` (`menuid`, `roleid`, `created_at`, `updated_at`, `createdby`, `updatedby`) VALUES
(1, 1, '2022-07-26 02:20:34', NULL, 'sys-admin', ''),
(1, 2, '2022-07-26 03:07:15', NULL, 'husnulmub@gmail.com', NULL),
(1, 4, '2023-06-19 01:06:27', NULL, 'husnulmub@gmail.com', NULL),
(4, 1, '2022-10-01 08:10:43', NULL, 'husnulmub@gmail.com', NULL),
(4, 4, '2023-06-19 01:06:27', NULL, 'husnulmub@gmail.com', NULL),
(5, 1, '2022-07-26 02:21:32', NULL, 'sys-admin', ''),
(5, 4, '2023-06-19 01:06:27', NULL, 'husnulmub@gmail.com', NULL),
(7, 1, '2022-07-26 18:07:53', NULL, 'husnulmub@gmail.com', NULL),
(20, 1, '2022-08-17 14:08:34', NULL, 'husnulmub@gmail.com', NULL),
(26, 1, '2022-09-20 06:09:12', NULL, 'husnulmub@gmail.com', NULL),
(74, 1, '2022-08-17 14:08:34', NULL, 'husnulmub@gmail.com', NULL),
(75, 1, '2022-09-20 06:09:12', NULL, 'husnulmub@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menugroup` int DEFAULT NULL,
  `menu_idx` int DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `createdby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `name`, `route`, `menugroup`, `menu_idx`, `icon`, `created_at`, `updated_at`, `createdby`, `updatedby`) VALUES
(1, 'Approval Workflow', 'config/workflow', 2, 4, 'workflow.png', '2022-07-26 02:12:52', NULL, 'sys-admin', 'husnulmub@gmail.com'),
(4, 'Users', 'setting/users', 2, 1, 'UM01.png', '2022-07-26 02:12:52', NULL, 'sys-admin', ''),
(5, 'Roles', 'setting/roles', 2, 3, 'MF06.png', '2022-07-26 02:12:52', NULL, 'sys-admin', ''),
(7, 'Menus', 'setting/menus', 2, 2, 'CMDOPT.png', '2022-07-26 02:12:52', NULL, 'sys-admin', 'husnulmub@gmail.com'),
(20, 'General Setting', 'general/setting', 2, 5, 'setting.png', '2022-08-17 14:08:21', NULL, 'husnulmub@gmail.com', NULL),
(26, 'Object Authorization', 'setting/objectauth', 2, 6, 'CMDOPT.png', '2022-09-20 06:09:00', NULL, 'husnulmub@gmail.com', 'husnulmub@gmail.com'),
(74, 'Menu Roles', 'setting/menuroles', 2, 7, NULL, '2023-06-19 01:06:21', NULL, 'husnulmub@gmail.com', NULL),
(75, 'User Roles', 'setting/userroles', 2, 8, NULL, '2023-06-19 01:06:38', NULL, 'husnulmub@gmail.com', NULL);

--
-- Trigger `menus`
--
DELIMITER $$
CREATE TRIGGER `deleteMenuAssignment` AFTER DELETE ON `menus` FOR EACH ROW DELETE FROM menuroles WHERE menuid = OLD.id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `setMenuDisIndex` BEFORE INSERT ON `menus` FOR EACH ROW set NEW.menu_idx = (SELECT count(menugroup)+1 from menus WHERE menugroup = NEW.menugroup)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `rolename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rolestatus` int NOT NULL,
  `createdby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `rolename`, `rolestatus`, `createdby`, `updatedby`, `created_at`, `updated_at`) VALUES
(1, 'SYS-ADMIN', 1, 'sys-admin', '', '2022-01-26 02:45:03', NULL),
(4, 'LOGISTIK', 1, 'husnulmub@gmail.com', NULL, '2022-10-04 00:10:00', NULL),
(5, 'PURCHASING', 1, 'husnulmub@gmail.com', NULL, '2022-10-04 00:10:10', NULL),
(6, 'PO_APPROVAL', 1, 'husnulmub@gmail.com', NULL, '2022-10-04 00:10:46', NULL),
(7, 'PR_APPROVAL', 1, 'husnulmub@gmail.com', NULL, '2022-10-04 00:10:55', NULL),
(8, 'PBJ_APPROVAL', 1, 'husnulmub@gmail.com', NULL, '2022-10-04 00:10:28', NULL),
(9, 'SPK_APPROVAL', 1, 'husnulmub@gmail.com', NULL, '2022-10-04 00:10:42', NULL),
(10, 'BUDGET_APPROVAL', 1, 'husnulmub@gmail.com', NULL, '2022-10-15 18:10:27', NULL),
(11, 'ROLE_REPORT1', 1, 'husnulmub@gmail.com', NULL, '2023-03-28 10:03:10', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `userroles`
--

CREATE TABLE `userroles` (
  `userid` int NOT NULL,
  `roleid` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `createdby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `userroles`
--

INSERT INTO `userroles` (`userid`, `roleid`, `created_at`, `updated_at`, `createdby`, `updatedby`) VALUES
(1, 1, '2022-07-26 02:19:44', NULL, 'sys-admin', ''),
(2, 3, '2022-08-05 01:08:02', NULL, 'husnulmub@gmail.com', NULL),
(3, 2, '2022-07-26 03:07:14', NULL, 'husnulmub@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_signfile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deptid` int DEFAULT NULL,
  `jabatanid` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `createdby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `s_signfile`, `deptid`, `jabatanid`, `created_at`, `updated_at`, `createdby`, `updatedby`) VALUES
(1, 'Administrator', 'husnulmub@gmail.com', 'sys-admin', NULL, '$2y$12$PSL31tVJTgNX4GyT8w/QCey2ZPD6DfcamWpZ3hy/WHhOxcWQSNjDi', NULL, 'storage/files/e_signature/esign3.png', 1, 3, '2022-07-26 07:36:29', NULL, '', ''),
(9, 'Kepala SHE', 'she1@mail.com', 'SHE1', NULL, '$2y$12$WC2lsal7IcnuLUOmfAY5B.gmxWQUoKuce8NyEApgHoz1/nxwatlvW', NULL, 'storage/files/e_signature/esign1.png', 5, 5, '2022-10-13 23:10:49', NULL, 'husnulmub@gmail.com', NULL),
(10, 'Admin SHE', 'she2@gmail.com', 'SHE2', NULL, '$2y$12$XooRzaUE8h0f4BFvlZJH8OGEqqgKD.NMwIO9HgcnrfMBAhvhEujLG', NULL, 'storage/files/e_signature/esign3.png', 5, 6, '2022-10-13 23:10:42', NULL, 'husnulmub@gmail.com', NULL),
(11, 'Kepala Plant', 'plant1@mail.com', 'plant1', NULL, '$2y$12$vcrKri7dupUFcinx2RIaz..n347Xrj4osZOuRdhRmkIYFYDrv.WYW', NULL, 'storage/files/e_signature/esign2.png', 6, 14, '2022-10-13 23:10:06', NULL, 'husnulmub@gmail.com', NULL),
(12, 'Admin Plant', 'plant2@mail.com', 'plant2', NULL, '$2y$12$G0NTRnzqmAPLKYxhoFmvL.KqpLlIP.sSJ/8s.W7KPOA9iBtYJqAOC', NULL, 'storage/files/e_signature/esign2.png', 6, 15, '2022-10-13 23:10:48', NULL, 'husnulmub@gmail.com', NULL),
(13, 'Kepala GA', 'ga1@mail.com', 'ga1', NULL, '$2y$12$68lj21lQ2YCcJseCcunKCuObYMbsZuPORp.1DC0MLMFQQx1Pq9fyi', NULL, 'storage/files/e_signature/esign1.png', 7, 7, '2022-10-13 23:10:34', NULL, 'husnulmub@gmail.com', NULL),
(14, 'Admin GA', 'ga2@mail.com', 'ga2', NULL, '$2y$12$kQ0Cu3yYhoEKBFXmWFGTC.6zqcgy0UJFVL08gCYrl3ym3R1FTNBRS', NULL, NULL, 7, 8, '2022-10-13 23:10:01', NULL, 'husnulmub@gmail.com', NULL),
(15, 'Kepala Logisitic', 'logistic1@mail.com', 'logistic1', NULL, '$2y$12$DXATkaE9stz3JpvGplGdfOfehTVETFtCugkywru05hVcc0sn9I7NO', NULL, 'storage/files/e_signature/esign2.png', 3, 9, '2022-10-13 23:10:38', NULL, 'husnulmub@gmail.com', NULL),
(16, 'Admin Logistic', 'logistic2@mail.com', 'logistic2', NULL, '$2y$12$miIaRSZtNTpT7xOq4zKIquHqNFzCIxO5DQvipuQqXcfp/yp8qbZue', NULL, NULL, 3, 10, '2022-10-13 23:10:14', NULL, 'husnulmub@gmail.com', NULL),
(17, 'Kepala Purchasing', 'purch1@mail.com', 'purch1', NULL, '$2y$12$y6XwIPFdn21EsVEdr6an1O2sb6zJzMPD8mf09YQIN1oS5Ls3H1Qlm', NULL, 'storage/files/e_signature/esign2.png', 2, 16, '2022-10-13 23:10:19', NULL, 'husnulmub@gmail.com', NULL),
(18, 'Admin Purchasing', 'purch2@mail.com', 'purch2', NULL, '$2y$12$xkROgmrQXMeqn98xmhpPXeSbfLQvkUEZz5wbGpAu89cnbF40wzVTe', NULL, NULL, 2, 17, '2022-10-13 23:10:32', NULL, 'husnulmub@gmail.com', NULL),
(19, 'Finance Manager', 'finance1@mail.com', 'finance1', NULL, '$2y$12$XLsKgYLJ2NpF14hHmwC.beXYw/u1/OJTEEubi0gsXQa3HSL33/3IO', NULL, 'storage/files/e_signature/esign2.png', 2, 3, '2022-10-15 17:10:01', NULL, 'husnulmub@gmail.com', NULL),
(20, 'Direktur', 'direktur@mail.com', 'direktur', NULL, '$2y$12$kUA80.KSXfZqNzHwChlS7OLGDOo9DE.mWjbAR8/tjV.VDyvo5nmPi', NULL, 'storage/files/e_signature/esign1.png', NULL, 1, '2022-10-15 17:10:14', NULL, 'husnulmub@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_object_auth`
--

CREATE TABLE `user_object_auth` (
  `userid` int NOT NULL,
  `object_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_val` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdon` date NOT NULL,
  `createdby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_object_auth`
--

INSERT INTO `user_object_auth` (`userid`, `object_name`, `object_val`, `createdon`, `createdby`) VALUES
(1, 'ALLOW_CHANGE_DOC', 'N', '2022-08-15', 'sys-admin'),
(1, 'ALLOW_DISPLAY_ALL_DOC', 'Y', '2022-08-19', 'sys-admin'),
(1, 'ALLOW_DOWNLOAD_DOC', 'Y', '2022-09-19', 'sys-admin'),
(1, 'ALLOW_DOWNLOAD_ORIGINAL_DOC', 'Y', '2022-09-19', 'sys-admin'),
(1, 'ALLOW_UPLOAD_ORIGINAL_DOC', 'Y', '2022-09-19', 'sys-admin'),
(5, 'ALLOW_CHANGE_DOC', 'Y', '2022-08-15', 'sys-admin'),
(5, 'ALLOW_DOWNLOAD_DOC', 'N', '2022-08-15', 'sys-admin'),
(7, 'ALLOW_DISPLAY_OBS_DOC', 'Y', '2022-08-22', 'sys-admin');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_menuroles`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_menuroles` (
`group` varchar(50)
,`menugroup` int
,`menuid` int
,`name` varchar(100)
,`roleid` int
,`rolename` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_menus`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_menus` (
`created_at` timestamp
,`createdby` varchar(50)
,`groupname` varchar(50)
,`icon` varchar(255)
,`id` bigint unsigned
,`menu_idx` int
,`menugroup` int
,`name` varchar(100)
,`route` varchar(100)
,`updated_at` timestamp
,`updatedby` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_usermenus`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_usermenus` (
`email` varchar(100)
,`group_idx` int
,`groupicon` varchar(50)
,`groupname` varchar(50)
,`icon` varchar(255)
,`id` bigint unsigned
,`menu_idx` int
,`menugroup` int
,`menuname` varchar(100)
,`name_of_user` varchar(100)
,`roleid` int
,`rolename` varchar(50)
,`route` varchar(100)
,`userid` int
,`username` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_userroles`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_userroles` (
`email` varchar(100)
,`name` varchar(100)
,`roleid` int
,`rolename` varchar(50)
,`userid` int
,`username` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_menuroles`
--
DROP TABLE IF EXISTS `v_menuroles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_menuroles`  AS SELECT `a`.`menuid` AS `menuid`, `a`.`roleid` AS `roleid`, `c`.`rolename` AS `rolename`, `b`.`name` AS `name`, `b`.`menugroup` AS `menugroup`, `d`.`menugroup` AS `group` FROM (((`menuroles` `a` join `menus` `b` on((`a`.`menuid` = `b`.`id`))) join `roles` `c` on((`a`.`roleid` = `c`.`id`))) left join `menugroups` `d` on((`b`.`menugroup` = `d`.`id`))) ORDER BY `a`.`menuid` ASC ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_menus`
--
DROP TABLE IF EXISTS `v_menus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_menus`  AS SELECT `a`.`id` AS `id`, `a`.`name` AS `name`, `a`.`route` AS `route`, `a`.`menugroup` AS `menugroup`, `a`.`menu_idx` AS `menu_idx`, `a`.`icon` AS `icon`, `a`.`created_at` AS `created_at`, `a`.`updated_at` AS `updated_at`, `a`.`createdby` AS `createdby`, `a`.`updatedby` AS `updatedby`, `b`.`menugroup` AS `groupname` FROM (`menus` `a` join `menugroups` `b` on((`a`.`menugroup` = `b`.`id`))) ORDER BY `a`.`menugroup` ASC, `a`.`menu_idx` ASC ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_usermenus`
--
DROP TABLE IF EXISTS `v_usermenus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usermenus`  AS SELECT `a`.`id` AS `id`, `a`.`name` AS `menuname`, `a`.`route` AS `route`, `a`.`menugroup` AS `menugroup`, `a`.`menu_idx` AS `menu_idx`, `g`.`menugroup` AS `groupname`, `g`.`groupicon` AS `groupicon`, `g`.`_index` AS `group_idx`, `b`.`roleid` AS `roleid`, `c`.`rolename` AS `rolename`, `d`.`userid` AS `userid`, `f`.`name` AS `name_of_user`, `f`.`email` AS `email`, `f`.`username` AS `username`, `a`.`icon` AS `icon` FROM (((((`menus` `a` join `menuroles` `b` on((`a`.`id` = `b`.`menuid`))) join `roles` `c` on((`b`.`roleid` = `c`.`id`))) join `userroles` `d` on((`b`.`roleid` = `d`.`roleid`))) join `users` `f` on((`d`.`userid` = `f`.`id`))) left join `menugroups` `g` on((`a`.`menugroup` = `g`.`id`))) ORDER BY `a`.`menu_idx` ASC, `g`.`_index` ASC ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_userroles`
--
DROP TABLE IF EXISTS `v_userroles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_userroles`  AS SELECT `a`.`roleid` AS `roleid`, `c`.`rolename` AS `rolename`, `a`.`userid` AS `userid`, `b`.`name` AS `name`, `b`.`email` AS `email`, `b`.`username` AS `username` FROM ((`userroles` `a` join `users` `b` on((`a`.`userid` = `b`.`id`))) join `roles` `c` on((`a`.`roleid` = `c`.`id`))) ORDER BY `c`.`id` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menugroups`
--
ALTER TABLE `menugroups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menuroles`
--
ALTER TABLE `menuroles`
  ADD PRIMARY KEY (`menuid`,`roleid`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`userid`,`roleid`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indeks untuk tabel `user_object_auth`
--
ALTER TABLE `user_object_auth`
  ADD PRIMARY KEY (`userid`,`object_name`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menugroups`
--
ALTER TABLE `menugroups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
