-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 14, 2022 lúc 05:14 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `little-little_pj`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ae4x1q5qUb0XLDBw0J4OvBJ8gQshORk6', 1, '2022-03-10 04:19:39', '2022-03-10 04:19:39', '2022-03-10 04:19:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog__categories`
--

CREATE TABLE `blog__categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog__category_translations`
--

CREATE TABLE `blog__category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog__posts`
--

CREATE TABLE `blog__posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blog__posts`
--

INSERT INTO `blog__posts` (`id`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 2, '2022-03-11 06:19:05', '2022-03-13 04:12:29'),
(2, 0, 2, '2022-03-13 07:52:34', '2022-03-13 07:52:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog__post_translations`
--

CREATE TABLE `blog__post_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blog__post_translations`
--

INSERT INTO `blog__post_translations` (`id`, `post_id`, `locale`, `title`, `slug`, `content`) VALUES
(1, 1, 'en', 'Sự kiện 1', 'su-kien-1', '<p class=\"img-wrapper\"><img alt=\"\" class=\"d-block w-100\" src=\"http://localhost/assets/media/sukien.png\" /></p>\r\n\r\n<div class=\"card-body\">\r\n<h5 class=\"card-title m-0\">Sự ki&ecirc;̣n 1</h5>\r\n\r\n<p class=\"text-muted\">Đ&acirc;̀m sen Park</p>\r\n<small>30/05/2021 - 01/06/2021</small>\r\n\r\n<h5 class=\"price\">25.000 VNĐ</h5>\r\n</div>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic sdsd typesetting, remaining cssa essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, of Lorem Ipsum.</p>'),
(2, 2, 'en', 'abc', 'abc', '<p>abcasdsadsa</p>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dashboard__widgets`
--

CREATE TABLE `dashboard__widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widgets` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event__events`
--

CREATE TABLE `event__events` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `event__events`
--

INSERT INTO `event__events` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, '2022-03-13 09:05:02', '2022-03-13 09:05:02'),
(2, 2, '2022-03-13 10:02:59', '2022-03-13 10:02:59'),
(3, 2, '2022-03-13 10:02:59', '2022-03-13 10:02:59'),
(4, 2, '2022-03-13 10:02:59', '2022-03-13 10:02:59'),
(5, 2, '2022-03-13 10:02:59', '2022-03-13 10:02:59'),
(13, 1, '2022-03-13 07:16:42', '2022-03-13 07:16:42'),
(14, 1, '2022-03-13 07:53:50', '2022-03-13 08:22:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event__event_translations`
--

CREATE TABLE `event__event_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `images` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `fromDate` date NOT NULL,
  `toDate` date NOT NULL,
  `price` int(11) NOT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `event__event_translations`
--

INSERT INTO `event__event_translations` (`id`, `event_id`, `locale`, `title`, `slug`, `images`, `location`, `fromDate`, `toDate`, `price`, `content`) VALUES
(1, 1, 'en', 'Sự kiện 1', 'su-kien-1', 'sukien.png', 'Đầm sen Park', '2021-05-30', '2021-06-01', 25000, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic sdsd typesetting, remaining cssa essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, of Lorem Ipsum.</p>\r\n\r\n<img src=\"/assets/media/sukien.png\" alt=\"Sự kiện 1\">\r\n\r\n<p>Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, </p>\r\n\r\n<img src=\"/assets/media/sukien.png\" alt=\"Sự kiện 1\">'),
(2, 2, 'en', 'Sự kiện 2', 'su-kien-2', 'sukien.png', 'Đầm sen Park', '2021-05-30', '2021-06-01', 25000, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic sdsd typesetting, remaining cssa essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, of Lorem Ipsum.</p>\r\n\r\n<img src=\"/assets/media/sukien.png\" alt=\"Sự kiện 2\">\r\n\r\n<p>Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, </p>\r\n\r\n<img src=\"/assets/media/sukien.png\" alt=\"Sự kiện 2\">'),
(3, 3, 'en', 'Sự kiện 3', 'su-kien-3', 'sukien.png', 'Đầm sen Park', '2021-05-30', '2021-06-01', 50000, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic sdsd typesetting, remaining cssa essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, of Lorem Ipsum.</p>  <img src=\"/assets/media/sukien.png\" alt=\"Sự kiện 3\">  <p>Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, </p>  <img src=\"/assets/media/sukien.png\" alt=\"Sự kiện 3\">'),
(4, 4, 'en', 'Sự kiện 4', 'su-kien-4', 'sukien.png', 'Đầm sen Park', '2021-05-30', '2021-06-01', 55000, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic sdsd typesetting, remaining cssa essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, of Lorem Ipsum.</p>  <img src=\"/assets/media/sukien.png\" alt=\"Sự kiện 4\">  <p>Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, </p>  <img src=\"/assets/media/sukien.png\" alt=\"Sự kiện 4\">'),
(5, 5, 'en', 'Sự kiện 5', 'su-kien-5', 'sukien.png', 'Đầm sen Park', '2021-05-30', '2021-06-01', 100000, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic sdsd typesetting, remaining cssa essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, of Lorem Ipsum.</p>  <img src=\"/assets/media/sukien.png\" alt=\"Sự kiện 5\">  <p>Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, </p>  <img src=\"/assets/media/sukien.png\" alt=\"Sự kiện 5\">'),
(8, 13, 'en', 'Sự kiện 6', 'su-kien-6', 'sukien.png', 'Đầm sen', '2022-05-15', '2022-07-16', 0, NULL),
(9, 14, 'en', 'Sự kiện 7', 'su-kien-7', 'sukien.png', 'abcxyz', '2022-10-21', '2022-12-21', 123456, '<p>vc</p>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `media__files`
--

CREATE TABLE `media__files` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_folder` tinyint(1) NOT NULL DEFAULT 0,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mimetype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `media__files`
--

INSERT INTO `media__files` (`id`, `is_folder`, `filename`, `path`, `extension`, `mimetype`, `filesize`, `folder_id`, `created_at`, `updated_at`) VALUES
(1, 0, 'email.png', '/assets/media/email.png', 'png', 'image/png', '10398', '0', '2022-03-10 18:30:52', '2022-03-10 18:30:52'),
(2, 0, 'map-marker.png', '/assets/media/map-marker.png', 'png', 'image/png', '5636', '0', '2022-03-10 18:30:53', '2022-03-10 18:30:53'),
(4, 0, 'damsenpark.png', '/assets/media/damsenpark.png', 'png', 'image/png', '91391', '0', '2022-03-10 18:30:53', '2022-03-10 18:30:53'),
(5, 0, 'sad-emoji.png', '/assets/media/sad-emoji.png', 'png', 'image/png', '52882', '0', '2022-03-10 18:30:53', '2022-03-10 18:30:53'),
(6, 0, 'phone-white.png', '/assets/media/phone-white.png', 'png', 'image/png', '75964', '0', '2022-03-10 18:30:54', '2022-03-10 18:30:54'),
(7, 0, 'redphone.png', '/assets/media/redphone.png', 'png', 'image/png', '71463', '0', '2022-03-10 18:30:54', '2022-03-10 18:30:54'),
(8, 0, 'sukien.png', '/assets/media/sukien.png', 'png', 'image/png', '827613', '0', '2022-03-10 18:30:56', '2022-03-10 18:30:56'),
(9, 0, 'logo.png', '/assets/media/logo.png', 'png', 'image/png', '34588', '0', '2022-03-10 20:26:25', '2022-03-10 20:26:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `media__file_translations`
--

CREATE TABLE `media__file_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_attribute` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `media__imageables`
--

CREATE TABLE `media__imageables` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(11) NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu__menuitems`
--

CREATE TABLE `menu__menuitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `target` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'page',
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu__menuitems`
--

INSERT INTO `menu__menuitems` (`id`, `menu_id`, `page_id`, `position`, `target`, `link_type`, `class`, `module_name`, `parent_id`, `lft`, `rgt`, `depth`, `created_at`, `updated_at`, `is_root`, `icon`) VALUES
(10, 3, NULL, 0, NULL, 'page', '', NULL, NULL, NULL, NULL, NULL, '2022-03-10 23:57:06', '2022-03-10 23:57:06', 1, NULL),
(11, 3, 5, 0, '_self', 'page', NULL, NULL, 10, NULL, NULL, NULL, '2022-03-10 23:57:16', '2022-03-10 23:57:16', 0, NULL),
(12, 3, 7, 1, '_self', 'page', NULL, NULL, 10, NULL, NULL, NULL, '2022-03-10 23:57:24', '2022-03-10 23:58:34', 0, NULL),
(13, 3, 8, 2, '_self', 'page', NULL, NULL, 10, NULL, NULL, NULL, '2022-03-10 23:57:32', '2022-03-10 23:58:34', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu__menuitem_translations`
--

CREATE TABLE `menu__menuitem_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `menuitem_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu__menuitem_translations`
--

INSERT INTO `menu__menuitem_translations` (`id`, `menuitem_id`, `locale`, `status`, `title`, `url`, `uri`, `created_at`, `updated_at`) VALUES
(10, 10, 'en', 0, 'root', NULL, NULL, '2022-03-10 23:57:06', '2022-03-10 23:57:06'),
(11, 11, 'en', 1, 'Trang chủ', NULL, 'trang-chu', '2022-03-10 23:57:16', '2022-03-10 23:57:16'),
(12, 12, 'en', 1, 'Sự kiện', NULL, 'sukien', '2022-03-10 23:57:24', '2022-03-10 23:57:24'),
(13, 13, 'en', 1, 'Liên hệ', NULL, 'lien-he', '2022-03-10 23:57:32', '2022-03-10 23:57:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu__menus`
--

CREATE TABLE `menu__menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu__menus`
--

INSERT INTO `menu__menus` (`id`, `name`, `primary`, `created_at`, `updated_at`) VALUES
(3, 'nav', 0, '2022-03-10 23:57:06', '2022-03-10 23:57:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu__menu_translations`
--

CREATE TABLE `menu__menu_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu__menu_translations`
--

INSERT INTO `menu__menu_translations` (`id`, `menu_id`, `locale`, `status`, `title`, `created_at`, `updated_at`) VALUES
(3, 3, 'en', 1, 'main nav', '2022-03-10 23:57:06', '2022-03-10 23:57:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
(2, '2016_06_24_193447_create_user_tokens_table', 1),
(3, '2014_10_14_200250_create_settings_table', 2),
(4, '2014_10_15_191204_create_setting_translations_table', 2),
(5, '2015_06_18_170048_make_settings_value_text_field', 2),
(6, '2015_10_22_130947_make_settings_name_unique', 2),
(7, '2017_09_17_164631_make_setting_value_nullable', 2),
(8, '2014_11_03_160015_create_menus_table', 3),
(9, '2014_11_03_160138_create_menu-translations_table', 3),
(10, '2014_11_03_160753_create_menuitems_table', 3),
(11, '2014_11_03_160804_create_menuitem_translation_table', 3),
(12, '2014_12_17_185301_add_root_column_to_menus_table', 3),
(13, '2015_09_05_100142_add_icon_column_to_menuitems_table', 3),
(14, '2016_01_26_102307_update_icon_column_on_menuitems_table', 3),
(15, '2016_08_01_142345_add_link_type_colymn_to_menuitems_table', 3),
(16, '2016_08_01_143130_add_class_column_to_menuitems_table', 3),
(17, '2017_09_18_192639_make_title_field_nullable_menu_table', 3),
(18, '2014_10_26_162751_create_files_table', 4),
(19, '2014_10_26_162811_create_file_translations_table', 4),
(20, '2015_02_27_105241_create_image_links_table', 4),
(21, '2015_12_19_143643_add_sortable', 4),
(22, '2017_09_20_144631_add_folders_columns_on_files_table', 4),
(23, '2014_11_30_191858_create_pages_tables', 5),
(24, '2017_10_13_103344_make_status_field_nullable_on_page_translations_table', 5),
(25, '2018_05_23_145242_edit_body_column_nullable', 5),
(26, '2015_04_02_184200_create_widgets_table', 6),
(27, '2013_04_09_062329_create_revisions_table', 7),
(28, '2015_11_20_184604486385_create_translation_translations_table', 7),
(29, '2015_11_20_184604743083_create_translation_translation_translations_table', 7),
(30, '2015_12_01_094031_update_translation_translations_table_with_index', 7),
(31, '2016_07_12_181155032011_create_tag_tags_table', 8),
(32, '2016_07_12_181155289444_create_tag_tag_translations_table', 8),
(33, '2014_09_27_170107_create_posts_table', 9),
(34, '2014_09_27_175411_create_post_translations_table', 9),
(35, '2014_09_27_175736_create_categories_table', 9),
(36, '2014_09_27_175804_create_category_translations_table', 9),
(37, '2015_05_29_180714_add_status_column_to_post_table', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page__pages`
--

CREATE TABLE `page__pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT 0,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page__pages`
--

INSERT INTO `page__pages` (`id`, `is_home`, `template`, `created_at`, `updated_at`) VALUES
(5, 1, 'index', '2022-03-10 23:43:38', '2022-03-13 20:16:52'),
(7, 0, 'sukien', '2022-03-10 23:52:07', '2022-03-13 04:50:20'),
(8, 0, 'lienhe', '2022-03-10 23:56:58', '2022-03-10 23:56:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page__page_translations`
--

CREATE TABLE `page__page_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page__page_translations`
--

INSERT INTO `page__page_translations` (`id`, `page_id`, `locale`, `title`, `slug`, `status`, `body`, `meta_title`, `meta_description`, `og_title`, `og_description`, `og_image`, `og_type`, `created_at`, `updated_at`) VALUES
(5, 5, 'en', 'Trang chủ', 'trang-chu', '1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ac mollis justo. Etiam volutpat tellus quis risus volutpat, ut posuere ex facilisis.</p>\n\n<p>Suspendisse iaculis libero lobortis condimentum gravida. Aenean auctor iaculis risus, lobortis molestie lectus consequat a.</p>\n\n<ul>\n	<li style=\"padding: 0px; margin: 0px; box-sizing: border-box;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n	<li style=\"padding: 0px; margin: 0px; box-sizing: border-box;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n	<li style=\"padding: 0px; margin: 0px; box-sizing: border-box;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n	<li style=\"padding: 0px; margin: 0px; box-sizing: border-box;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n</ul>', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-10 23:43:38', '2022-03-10 23:44:22'),
(7, 7, 'en', 'Sự kiện', 'sukien', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-10 23:52:07', '2022-03-10 23:52:23'),
(8, 8, 'en', 'Liên hệ', 'lien-he', '1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ac mollis justo. Etiam volutpat tellus quis risus volutpat, ut posuere ex facilisis.</p>', NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-10 23:56:58', '2022-03-11 00:06:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int(20) NOT NULL,
  `vnp_TxnRef` varchar(50) DEFAULT NULL COMMENT 'Mã đơn hàng',
  `giatien` double(8,2) DEFAULT NULL,
  `soluong` int(10) DEFAULT NULL,
  `ngaysudung` date DEFAULT NULL,
  `hoten` varchar(100) DEFAULT NULL,
  `dienthoai` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sothe` varchar(50) DEFAULT NULL,
  `hotenchuthe` varchar(100) DEFAULT NULL,
  `ngayhethan` varchar(20) NOT NULL,
  `cvvcvc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `vnp_TxnRef`, `giatien`, `soluong`, `ngaysudung`, `hoten`, `dienthoai`, `email`, `sothe`, `hotenchuthe`, `ngayhethan`, `cvvcvc`) VALUES
(1, 'T85zgX2RYKW2Bay', 900000.00, 10, '2022-03-29', 'Tai Nguyen', '0366546011', 'taintpps14538@Fpt.edu.vn', '9704198526191432198', 'NGUYEN VAN A', '07/15', 123),
(2, 'nbFQcnQstfZtxAt', 900000.00, 10, '2022-03-27', 'TAi Nguyen', '0366546011', 'tainguyen@gmail.com', '9704198526191432198', 'NGUYEN VAN A', '07/15', 123),
(3, NULL, 720000.00, 8, '2022-03-22', 'dsadasdsadsa', '21414214214', 'dsadasdsads@gmail.com', '421421421421', 'adsdsadasddsad', '10/21', 123),
(4, NULL, 999999.99, 78, '2022-03-30', '21421421asddsadsa', '214214214214', 'dsadsadas@gmail.com', '82374892174892179', 'dhuidsaduisahduishi', '10/21', 123),
(5, NULL, 720000.00, 8, '2022-03-21', 'sadsadsadsadsa', '4124214214', 'dsadasdas@gmail.com', '947129421948', 'jfsanfnsafnsun', '10/21', 123),
(6, 'C8jHc9DSnuo3N3x', 720000.00, 8, '2022-03-29', 'dsadasdsadsad', '421421421', 'fasfisafosai@gmail.com', '9214712472817', 'nfjsanfjkasnfjsan', '10/21', 123),
(7, 'LJNA0XApNi8OtVy', 630000.00, 7, '2022-03-21', 'dasdsadsadsadsa', '4217421874812', 'fuaisnfsaufnsa@gmail.com', '21478217482178', 'njfasnfjsanjn', '10/21', 123),
(8, 'flJlteppcIwsxq0', 630000.00, 7, '2022-03-22', 'dsadsadsadsa', '42142714', 'nsafsuanfsua@gmail.com', '57218758215782', 'sfnsajfnjsafnsjanj', '10/21', 123),
(9, 'wJAtpdvWbt5FX43', 630000.00, 7, '2022-03-29', 'dsadasdsadsa', '42121421412', 'dsasadsadsads@gmail.com', '4243141414', 'fafasfsafsa', '10/21', 123),
(10, 'MXbCyITfrHvuk7H', 720000.00, 8, '2022-03-21', 'fdsuifnsbfisbi', '94812942184921', 'fsnafnsuoanfas@gmail.com', '842149812', 'fjsanfsaniofn', '10/21', 999),
(11, 'divVDjkYbEFl5lF', 540000.00, 6, '2022-03-16', 'dsadsauifhsaiufhiu', '89219028190428', 'osnofinsaoifsani@gmail.com', '2147217482178', 'asfsnaofsanoifsa', '10/21', 123),
(12, 'bXSHc6a3mpD1ofb', 630000.00, 7, '2022-03-22', 'oashfosafnosanio', '99184921849', 'fansfiosanfiosan@gmail.com', '1482194712947912', 'ofsnafiosanoifasni', '10/21', 123),
(13, 'NLmJTvcIhPwgaza', 630000.00, 7, '2022-03-24', 'dasdsadsadsad', '0366546011', 'nfosanfoisan@gmail.com', '123023921012', 'jsanfsanfoisanoi', '10/21', 123),
(14, 'BbWAWm5NYdM3i6W', 630000.00, 7, '2022-03-22', 'dsadsadsa', '421421412', 'foanosanisa@gmail.com', '2414214214', 'safsafsafsafsaf', '10/21', 123),
(15, 'KIK1BDEITkVLmAu', 630000.00, 7, '2022-03-30', 'Tai Nguyen', '0366546011', 'taintpps14538@fpt.edu.vn', '9704198526191432198', 'NGUYEN VAN A', '07/15', 123);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, 'NgOTqLRiFtynUmmjB5t4HlNgUUnI5Gs9', '2022-03-10 04:20:19', '2022-03-10 04:20:19'),
(2, 1, 'YT2EACWun5OvRePTHhpGaXRj92M05gel', '2022-03-10 04:20:29', '2022-03-10 04:20:29'),
(3, 1, 'zefZjq7RVM23PvM6esNt4mcdc9glQ79C', '2022-03-10 04:20:32', '2022-03-10 04:20:32'),
(4, 1, '2a0ByzmMYENyvSreMefinykvTxeCyBtF', '2022-03-10 04:20:38', '2022-03-10 04:20:38'),
(5, 1, 'tQVxRRfZj7MutIH4Y3IyD5QjJYuIDBMj', '2022-03-10 04:20:40', '2022-03-10 04:20:40'),
(6, 1, 'ZjAGVxP2LfjbJyEdhkdWU4BDAUrF4vQ1', '2022-03-10 04:20:40', '2022-03-10 04:20:40'),
(7, 1, 'g0qpiYeS6aM0rolONxYuL2AieOH5eRav', '2022-03-10 04:20:40', '2022-03-10 04:20:40'),
(8, 1, 'KQ36aDHwPyJQauWP1szAy05fcUGbuJql', '2022-03-10 04:22:00', '2022-03-10 04:22:00'),
(9, 1, 'yWyujgh6pqKOHb8ZG0pHRfFXwBEFxAuA', '2022-03-10 04:22:00', '2022-03-10 04:22:00'),
(10, 1, 'P0MI1WJV310jrBSVp2BkLzo4M3CuaG8b', '2022-03-10 04:22:02', '2022-03-10 04:22:02'),
(11, 1, 'DdIM9ifTYsu6NrKYrNaCPQG4FmkbJDcV', '2022-03-10 04:22:12', '2022-03-10 04:22:12'),
(12, 1, 'Y6Bm3oFWm6OzColPYbGfCJjxWKaiox6j', '2022-03-10 04:22:12', '2022-03-10 04:22:12'),
(13, 1, 'ZO5KuLMRzmkqimiHgOqHqCkg7olx4l2Y', '2022-03-10 04:22:13', '2022-03-10 04:22:13'),
(14, 1, '6ZImjiv1KJRhfrG6rIeSbHUSYxjLhx1A', '2022-03-10 04:22:18', '2022-03-10 04:22:18'),
(15, 1, 'Mhn94y2HZc5mN5Gx3BV8ybxEQF7VlyB9', '2022-03-10 04:22:18', '2022-03-10 04:22:18'),
(16, 1, 'ydAaZ44HSBj1u4V1uFdGNrJMArO8D3BB', '2022-03-10 04:23:25', '2022-03-10 04:23:25'),
(17, 1, 'dV8LXiQUHjTQjF8d4q4EQxgahUnJDMKV', '2022-03-10 04:23:30', '2022-03-10 04:23:30'),
(18, 1, 'P5vW990Nyb6OEkssdOFDjO7PxkSkzzJQ', '2022-03-10 04:23:32', '2022-03-10 04:23:32'),
(19, 1, 'sQjxCIe02Lb3z5r6D7ip90bzJ4nZpzBq', '2022-03-10 04:23:33', '2022-03-10 04:23:33'),
(20, 1, '3e3O6BhDBFfUijae0eYEQAWYEl7Gzj97', '2022-03-10 04:23:47', '2022-03-10 04:23:47'),
(21, 1, 'BMTOT3AzvNSSq0Sbd64wAx7rSGWULBVu', '2022-03-10 04:23:50', '2022-03-10 04:23:50'),
(22, 1, 'jdNs6MvtCxHLzk3cxPGRlHmxCUArPpbP', '2022-03-10 04:23:56', '2022-03-10 04:23:56'),
(23, 1, 'aaC79TzjUwTwA4YUVjt4PK3N0UrV9OVB', '2022-03-10 04:24:00', '2022-03-10 04:24:00'),
(24, 1, 'QqOhWKpiB3HUTIUOzvMfLjrPT2seZQoK', '2022-03-10 04:24:01', '2022-03-10 04:24:01'),
(25, 1, 'Bj8aHCPAWHmQL2ZLvw0116X1J7eSBsDt', '2022-03-10 04:24:01', '2022-03-10 04:24:01'),
(26, 1, 'KoPbv6Fu80tyxtGlGvq3A8mchp63p4vL', '2022-03-10 04:24:12', '2022-03-10 04:24:12'),
(27, 1, 'ZiwDmf3NXohc1Xi3a5jtk37k2Mj7OX78', '2022-03-10 04:24:16', '2022-03-10 04:24:16'),
(28, 1, 'TqrxQZcowhTQHoHKWOUMCcR70Txk8a8G', '2022-03-10 04:24:21', '2022-03-10 04:24:21'),
(29, 1, 'A52t5jmRqlShLWqEurrh32Z4KI0vtKMQ', '2022-03-10 04:24:22', '2022-03-10 04:24:22'),
(30, 1, 'exRMvOSSc9M0R8QAT9i2gxziPEvpBEMp', '2022-03-10 04:24:24', '2022-03-10 04:24:24'),
(31, 1, 'U5VhFxzixa4k9d3NDEBfs670X9XC8jqi', '2022-03-10 04:24:31', '2022-03-10 04:24:31'),
(32, 1, 'E2RruYHlpMUlxDc4ys3HeXkbQMqELzZM', '2022-03-10 04:24:32', '2022-03-10 04:24:32'),
(33, 1, 'mI5FEXBWR0QPFVSAo3YGi7OMK19McFuW', '2022-03-10 04:24:33', '2022-03-10 04:24:33'),
(34, 1, 'OFdChzk3EWTg7215lcJW0YqPKk8psY6J', '2022-03-10 04:24:34', '2022-03-10 04:24:34'),
(35, 1, 'M1Ytj34KhAECUKIeTA5C4tqkHJTS5WF8', '2022-03-10 04:24:37', '2022-03-10 04:24:37'),
(36, 1, '9gKLft0U7CGPcAhUJyngvvPEAQDCmXFj', '2022-03-10 04:24:39', '2022-03-10 04:24:39'),
(37, 1, 'nUCV3xEG86IjSt1ZVVVkN26s3EOaCjO6', '2022-03-10 04:24:40', '2022-03-10 04:24:40'),
(38, 1, 'TpWXOLDNGaNuy5DfLx6unwtwgY3mfL5g', '2022-03-10 04:24:42', '2022-03-10 04:24:42'),
(39, 1, 'ifGnOpTYW5a9yGMjbvsoCJB9Th7p1sQ1', '2022-03-10 04:24:43', '2022-03-10 04:24:43'),
(40, 1, 'mk1qF3t3BFgOXlvDyQDOWnbWPCZNjWWH', '2022-03-10 04:25:00', '2022-03-10 04:25:00'),
(41, 1, 'kX8iQgaugQbgjvefMRaljXWVO5VI3G3y', '2022-03-10 04:25:07', '2022-03-10 04:25:07'),
(42, 1, 'Ty1l7oPLEp2WgAyZ4z5HOnRZzhPPG66U', '2022-03-10 04:25:08', '2022-03-10 04:25:08'),
(43, 1, 'rvMzJrNkqPEkZ1yjPTZuEMzmCKuDNTeL', '2022-03-10 04:25:19', '2022-03-10 04:25:19'),
(44, 1, 'BebjNvO9rZx61BJ5evHKHvvkjMszMjxJ', '2022-03-10 04:25:39', '2022-03-10 04:25:39'),
(45, 1, 'N3KhFpx6kXuAU68zzKl8Pf3tZquhJYek', '2022-03-10 04:28:10', '2022-03-10 04:28:10'),
(46, 1, 'tdmzuYFlR5MAuHmtEx8EltAjNlqLW20P', '2022-03-10 04:28:14', '2022-03-10 04:28:14'),
(47, 1, 'bXiyZL1digoIZKkq3djurRbW23K7eBHT', '2022-03-10 04:28:16', '2022-03-10 04:28:16'),
(48, 1, 'EeB4F55cxHnBctvzcE1eyB9XOISAq48G', '2022-03-10 04:28:25', '2022-03-10 04:28:25'),
(49, 1, 'yn95ZQZQ5t7sAN8IY1d6Pg1S9TcjCia0', '2022-03-10 04:28:26', '2022-03-10 04:28:26'),
(50, 1, 'h6IjuywTFKlv61rPAMZaePP6Wmxac66f', '2022-03-10 04:28:31', '2022-03-10 04:28:31'),
(51, 1, 'PZVvJfbvIK0M9VSsWlrcf27Pt8xDFWGB', '2022-03-10 04:41:27', '2022-03-10 04:41:27'),
(52, 1, 'rnCIRhpp3n7NtBpbfEfeQAtQnWAPB5tR', '2022-03-10 04:41:29', '2022-03-10 04:41:29'),
(53, 1, 'Z3LTD9z236lNDgtK7bf7oGRV8REHmaMV', '2022-03-10 04:41:36', '2022-03-10 04:41:36'),
(54, 1, 'oen9JINmaKwRzC41vaUp5xnRFyHzm6Zj', '2022-03-10 04:41:38', '2022-03-10 04:41:38'),
(55, 1, 'QsiTVJrm9yPh3HiuCp3IOq7XvBMacOig', '2022-03-10 04:41:38', '2022-03-10 04:41:38'),
(56, 1, 'WSS4vtqByWAq0LLQnGDa9bv4cjdtbbhb', '2022-03-10 04:41:38', '2022-03-10 04:41:38'),
(57, 1, '4CRUUoEdhGdKc8gntfd2ekqq3jDGJEgp', '2022-03-10 04:41:59', '2022-03-10 04:41:59'),
(58, 1, 'hoOj8BKFe6POcUeBKHYp63UvlUFUssSc', '2022-03-10 04:42:19', '2022-03-10 04:42:19'),
(59, 1, 'fiVOxdx1FX9mzlRzXlOmTIAH88T9r6ec', '2022-03-10 04:42:35', '2022-03-10 04:42:35'),
(60, 1, 'eE6H5leEF8Mb67BKsqdmuYe930FW3ZjI', '2022-03-10 06:49:38', '2022-03-10 06:49:38'),
(61, 1, 'AKzgi6DGnres0iQahedmlgq2ec3OpeRt', '2022-03-10 06:49:39', '2022-03-10 06:49:39'),
(62, 1, 'TRXwHDwlU1Zfwl1OaQE1RgTF4jNSfkPx', '2022-03-10 06:49:39', '2022-03-10 06:49:39'),
(63, 1, '7XvDyjiLKtSjnXGvK3q0Reu20UKqJGXS', '2022-03-10 06:50:44', '2022-03-10 06:50:44'),
(64, 1, 'dCDVzX6piM1BeKC1ke2t7eTtmCNI5hNO', '2022-03-10 06:50:46', '2022-03-10 06:50:46'),
(65, 1, 'sGXzyz6G8dDrPtJlCpMn0pOqUx0Scgo8', '2022-03-10 06:50:46', '2022-03-10 06:50:46'),
(66, 1, 'E61GDesVVwbb6TLKGAtpt7JiTxFAtnrz', '2022-03-10 06:50:46', '2022-03-10 06:50:46'),
(67, 1, '9p9501dXCxJWZOCh2S32MYmtFvbVnBYM', '2022-03-10 06:50:55', '2022-03-10 06:50:55'),
(68, 1, 'RUF8Vm14kBx0fzY7vXH36PevHj9ArEuT', '2022-03-10 06:50:55', '2022-03-10 06:50:55'),
(69, 1, '838IcN1FmZwqbeIgmK85UCNWHXvWUaPG', '2022-03-10 06:51:18', '2022-03-10 06:51:18'),
(70, 1, 'Strfl4BxwxWxlxt384PS3UBijI6jEDZh', '2022-03-10 06:51:18', '2022-03-10 06:51:18'),
(71, 1, 'tXKPmG2wmTn5crpE67GTWxiY5DoOWAdB', '2022-03-10 06:51:19', '2022-03-10 06:51:19'),
(72, 1, '2ZC5qSBjhtFD6cpMW5yKX4m8sGONnSp5', '2022-03-10 06:51:24', '2022-03-10 06:51:24'),
(73, 1, 'kwuPQlZvlJlFkYtsWAR3DPCg8GIaWRek', '2022-03-10 06:51:24', '2022-03-10 06:51:24'),
(74, 1, 'wQc49BFPzw4n8et6XyFDyp9GvTHO8USI', '2022-03-10 18:29:07', '2022-03-10 18:29:07'),
(75, 1, 'B8Ai2kELl92JrbsBFKPBFVAEsaNbXLNY', '2022-03-10 18:29:19', '2022-03-10 18:29:19'),
(76, 1, '3o7fsVyleBeNSqC3zsymnTVd5dxudEAW', '2022-03-10 18:29:22', '2022-03-10 18:29:22'),
(77, 1, 'V04KN4DSV1sDRavT7S7N1T1b2AT78B2S', '2022-03-10 18:29:22', '2022-03-10 18:29:22'),
(78, 1, 'zYDeq2F6RuRWVw7Om6OcqbVP0H7xSa9w', '2022-03-10 18:29:22', '2022-03-10 18:29:22'),
(79, 1, 'ATxKVsUklQoOuh5vRouSHl2Cc4aAadeu', '2022-03-10 18:30:35', '2022-03-10 18:30:35'),
(80, 1, 'aMBuymXiWCs09fmLr3Ihi3Tou9yqhICH', '2022-03-10 18:30:52', '2022-03-10 18:30:52'),
(81, 1, 'Yxte4jkkOtpvpNEUjCxrFr85LNPAbwsO', '2022-03-10 18:30:53', '2022-03-10 18:30:53'),
(82, 1, 'qrxPPexvRkS065u3f3gIYO8w03GuKCo4', '2022-03-10 18:30:53', '2022-03-10 18:30:53'),
(83, 1, 'UGaaCaOOpHuA0AC4zcRD6BZTuO8oPSR0', '2022-03-10 18:30:53', '2022-03-10 18:30:53'),
(84, 1, 'fJiocuTJB58KRbtxJZ0fAsgvOB6OFes8', '2022-03-10 18:30:53', '2022-03-10 18:30:53'),
(85, 1, 'QlvYK9EbN2xGWEC1oPOalKVAaL4tiU5P', '2022-03-10 18:30:54', '2022-03-10 18:30:54'),
(86, 1, 'UULlrNkPZVT82zEBl6Qc2cYvtws3Y9BC', '2022-03-10 18:30:54', '2022-03-10 18:30:54'),
(87, 1, 'HRhVCvZ8LvFHUXxpsHjWFsxSvFRs08jA', '2022-03-10 18:30:54', '2022-03-10 18:30:54'),
(88, 1, 'dm3ejjMIgsbN8D6avlLwiiyzeTbRy2RO', '2022-03-10 18:30:55', '2022-03-10 18:30:55'),
(89, 1, 'NgVY2NOHSS2bsXwB6YLFk2iuksoybCa3', '2022-03-10 18:30:55', '2022-03-10 18:30:55'),
(90, 1, 'eKDvhFpPoUyl48tP4wTXDBOwXzPuOEBD', '2022-03-10 18:30:55', '2022-03-10 18:30:55'),
(91, 1, 'FpPwrNry35lozEpFOzpXotvMZuCqv8ca', '2022-03-10 18:30:55', '2022-03-10 18:30:55'),
(92, 1, 'WgEwmaO4XTMd7BAC4GiW5yE1gATHCSgK', '2022-03-10 18:30:55', '2022-03-10 18:30:55'),
(93, 1, 'PYdbLJnjRXXvjex3nmHCpmRoQvoEXynC', '2022-03-10 18:30:55', '2022-03-10 18:30:55'),
(94, 1, 'ZY5fNJvc70QkYGa6vK2QjctdG2bLUPSP', '2022-03-10 18:30:56', '2022-03-10 18:30:56'),
(95, 1, 'y3tJywCUDJVe2q9Am1cOTdBGdbdIfFMw', '2022-03-10 18:30:56', '2022-03-10 18:30:56'),
(96, 1, '5sBlToEivRbBtFYzx9Q0mGZohmkCePXX', '2022-03-10 18:42:39', '2022-03-10 18:42:39'),
(97, 1, 'w50tGEwGb48ws8g3AkRDX30vHi8jcQxX', '2022-03-10 18:42:42', '2022-03-10 18:42:42'),
(98, 1, 'pC8FVvzCDM7RZSSfYxkqCi0cK481ueUl', '2022-03-10 18:42:42', '2022-03-10 18:42:42'),
(99, 1, 'ZbtZdT2ofEVQdWXEVKb7RB3jMb30uwkP', '2022-03-10 18:42:42', '2022-03-10 18:42:42'),
(100, 1, 'uaRyYIupx6vINYEfrBBeJsNVeL8s1nDr', '2022-03-10 18:53:12', '2022-03-10 18:53:12'),
(101, 1, 'XnQnSv5IsbXovDa9TjRVMrLNtW4NAPPS', '2022-03-10 18:53:12', '2022-03-10 18:53:12'),
(102, 1, 'b4BME6ZsKXlSMKUeNZy3tXdBv9KQQdQy', '2022-03-10 18:53:14', '2022-03-10 18:53:14'),
(103, 1, '8dz9GE7yDPrIgnKz1OVDL1rk1DdMF2kr', '2022-03-10 18:53:14', '2022-03-10 18:53:14'),
(104, 1, 'XMH51SofuqfENoKJtCUVHBM7hS2k1ukU', '2022-03-10 18:53:14', '2022-03-10 18:53:14'),
(105, 1, 'gzMyy2thOjKxYEm108xWRlidOJHDp6kj', '2022-03-10 18:58:47', '2022-03-10 18:58:47'),
(106, 1, 'WAAox10dyX1PaGDToNsgECw4txYrmYBE', '2022-03-10 18:58:47', '2022-03-10 18:58:47'),
(107, 1, 'kRxReijnp8ZRgnNu2UZLzfXXIcvSx0AY', '2022-03-10 18:58:56', '2022-03-10 18:58:56'),
(108, 1, 'bTBVMKkppB0xpP1lno5cMdZjUbKmlYyD', '2022-03-10 18:58:56', '2022-03-10 18:58:56'),
(109, 1, 'ZTox4XS7SQkhr0GedHlxv1ojNXsN16vK', '2022-03-10 18:58:57', '2022-03-10 18:58:57'),
(110, 1, 'fRutTTKzCFHlEzuTYZCtPLwWxg7AnkfR', '2022-03-10 18:59:31', '2022-03-10 18:59:31'),
(111, 1, '5DODMhoNlyoZrIvfxk3YShV70J26WI97', '2022-03-10 18:59:31', '2022-03-10 18:59:31'),
(112, 1, 'ZPeKXws4btxQBxzFpFiwF677K5nzSraV', '2022-03-10 19:12:50', '2022-03-10 19:12:50'),
(113, 1, 'L62gAsOMWh9N6rJGinSBznwZTrgWZ3Ri', '2022-03-10 19:12:50', '2022-03-10 19:12:50'),
(114, 1, 'xMLv2xx94VgUvVT7DaxaqyD3ArvzowS3', '2022-03-10 19:12:50', '2022-03-10 19:12:50'),
(115, 1, 'Eo82QZUEqDIBruPwLJuWO3J9p0H2gwKI', '2022-03-10 19:13:00', '2022-03-10 19:13:00'),
(116, 1, 'BwCjSPbC0BBnsvdxQxEL81aSgdufWZpk', '2022-03-10 19:13:00', '2022-03-10 19:13:00'),
(117, 1, 'Or6VCRl1gyO4bUy2tAFuG7kQiSn00ZxW', '2022-03-10 19:13:01', '2022-03-10 19:13:01'),
(118, 1, 'lih1RB3I4iBBWsnhXVJAlxG1xaDbmYsS', '2022-03-10 19:14:15', '2022-03-10 19:14:15'),
(119, 1, 'j7l92Pdtk7YkEpSHO4wUtTA3jyHEKnxa', '2022-03-10 19:14:15', '2022-03-10 19:14:15'),
(120, 1, '05dAJFPmdjD1GDqXBKshcubOZUGAxTI4', '2022-03-10 19:14:15', '2022-03-10 19:14:15'),
(121, 1, 'DrMtww1aXxLzw8mzSpkAHAkygXuB9qkF', '2022-03-10 19:14:20', '2022-03-10 19:14:20'),
(122, 1, 'oJ36snDYdgeQo5RDuyKzYZDUm8Rdfzpu', '2022-03-10 19:14:21', '2022-03-10 19:14:21'),
(123, 1, 'tFfDC21JXzyAMvgw79nxjIHRsdCcfJqK', '2022-03-10 19:14:38', '2022-03-10 19:14:38'),
(124, 1, 'oKuLms82opi9FtSn4pDbHDr7MUFwYfai', '2022-03-10 19:15:33', '2022-03-10 19:15:33'),
(125, 1, '1WiKHe67lWe9tdxkqM2O4HBHjXOSjfwl', '2022-03-10 19:15:33', '2022-03-10 19:15:33'),
(126, 1, 'fYPTFMzfJlQ5a6UOPGCqxxcbQCjvEcO3', '2022-03-10 19:15:34', '2022-03-10 19:15:34'),
(127, 1, 'TsorxbEXwtZ73aF5mGODoE1dthQwy1pm', '2022-03-10 19:15:37', '2022-03-10 19:15:37'),
(128, 1, 'x7XTsqoY4He4QeQ9vB5BwleN0ZiM0vI5', '2022-03-10 19:15:37', '2022-03-10 19:15:37'),
(129, 1, 'HIrEBxQE2D2x8mN8u5BPczD4gSTJ7YSW', '2022-03-10 20:18:43', '2022-03-10 20:18:43'),
(130, 1, 'UFGOtLXZei3uy8l5Tw0ErUpy8wflEKIP', '2022-03-10 20:18:46', '2022-03-10 20:18:46'),
(131, 1, '9sYlyzmmSqug3moLRkwSzY5e4AvuLG8N', '2022-03-10 20:18:46', '2022-03-10 20:18:46'),
(132, 1, 'GhL5yQvsg5XPhPyAHLiqJp32G2QbOQRG', '2022-03-10 20:18:46', '2022-03-10 20:18:46'),
(133, 1, 'VP1RN8eCbXbmzsBsqG1EeMdiCZ1WeyQu', '2022-03-10 20:19:08', '2022-03-10 20:19:08'),
(134, 1, 'zwehZPzVhfm1Usx2hc34EUfTfNbbmnzM', '2022-03-10 20:19:39', '2022-03-10 20:19:39'),
(135, 1, 'z8gmQ1T8mpJAfme9MJOZMUhZA3a6xW3w', '2022-03-10 20:19:45', '2022-03-10 20:19:45'),
(136, 1, 'ChxPWw8DfKH6HkcBTIc8HwtHEJTDBTzm', '2022-03-10 20:26:22', '2022-03-10 20:26:22'),
(137, 1, 'uMlJ9esoo7Vfj5lnQZgBRd4CHJdA8tX0', '2022-03-10 20:26:25', '2022-03-10 20:26:25'),
(138, 1, 'VgJcJ8UPSgYJwWJEYR7hTrv2Mw0xag72', '2022-03-10 20:26:25', '2022-03-10 20:26:25'),
(139, 1, 'XdokaSQRbEIuUs7E8zWyGubUvQiiWVH8', '2022-03-10 20:26:39', '2022-03-10 20:26:39'),
(140, 1, '531Xl7EJr0HVlFFyXQrOgiFyUceR4MVn', '2022-03-10 20:26:47', '2022-03-10 20:26:47'),
(141, 1, 'HQG8n1C05dyG6tz2Sn1B8ktf64saKtBI', '2022-03-10 21:41:13', '2022-03-10 21:41:13'),
(142, 1, 'esHvy3851SpTq5xfkYxXxBzgdt0oP0mb', '2022-03-10 21:41:16', '2022-03-10 21:41:16'),
(143, 1, 'alCWmdOtjos1FON38z09KYnhwPp0Izmz', '2022-03-10 21:41:23', '2022-03-10 21:41:23'),
(144, 1, 'aGtgXa9IHHrnLDkvUOHV0S3BagHIsPBh', '2022-03-10 21:42:27', '2022-03-10 21:42:27'),
(145, 1, 'H7mieNfGwOXzrs6JNKk8bffRJUzoLvox', '2022-03-10 21:43:54', '2022-03-10 21:43:54'),
(146, 1, 'V2bHhppHKMHn79dI2Li61kyRskG1Tq8v', '2022-03-10 21:44:01', '2022-03-10 21:44:01'),
(147, 1, 'cX8QsG2fbwnQHsW7SzgT1nkXjIoxrAWd', '2022-03-10 21:44:04', '2022-03-10 21:44:04'),
(148, 1, 'nGLbtniMVOp99Vc8lL6srPQLqEX3sVVx', '2022-03-10 21:46:16', '2022-03-10 21:46:16'),
(149, 1, 'p9B7xJQNzwK9jgeWpVodJ1wxdYOLjDVm', '2022-03-10 21:46:17', '2022-03-10 21:46:17'),
(150, 1, 'tJ09CU5GIfygeRLpYEmo20x9eALdiIwB', '2022-03-10 23:03:46', '2022-03-10 23:03:46'),
(151, 1, 'FmS05D6T90DCZS47wKTXOEyAUlRbdLsD', '2022-03-10 23:03:59', '2022-03-10 23:03:59'),
(152, 1, 'OBB6iRgOMdtKp2h551Ghj1WiuorVbeQc', '2022-03-10 23:04:00', '2022-03-10 23:04:00'),
(153, 1, 'EVcG35gKYC6WY5tw47YMXzofkTy4OMLk', '2022-03-10 23:04:01', '2022-03-10 23:04:01'),
(154, 1, 'Rucxk0oiUQPT1v6Rsp6pc6wrRhBHciF9', '2022-03-10 23:04:01', '2022-03-10 23:04:01'),
(155, 1, '5wLuNnrYDA9JF0M1eLOYRRsOqidl5sET', '2022-03-10 23:05:22', '2022-03-10 23:05:22'),
(156, 1, 'm4PAAUWGa3CCYuKbasfJK47Qjs1VzA7U', '2022-03-10 23:05:23', '2022-03-10 23:05:23'),
(157, 1, '1aJxUdr0iHV3O8KshgnyRhs12TO8GoDy', '2022-03-10 23:05:25', '2022-03-10 23:05:25'),
(158, 1, 'rKYmARhm3VmBRp9kWFtzJilDXX1qEbTg', '2022-03-10 23:05:25', '2022-03-10 23:05:25'),
(159, 1, 'BWayXqsIFwu9lcWo6mXZWd31GVMJVE2S', '2022-03-10 23:05:25', '2022-03-10 23:05:25'),
(160, 1, '0lGa3T1UsjJ8RzMo5NRvytUJbL3LC41V', '2022-03-10 23:06:08', '2022-03-10 23:06:08'),
(161, 1, 'Gd8REnz64MZXIWX85h7MMAo7YqTODF49', '2022-03-10 23:06:08', '2022-03-10 23:06:08'),
(162, 1, 'F7qH9yl1oUQR3dKExwTdljMzD8BKlYYU', '2022-03-10 23:06:12', '2022-03-10 23:06:12'),
(163, 1, 'iUQAP9W78WIMK2nII1CLFilcckkxuasK', '2022-03-10 23:06:12', '2022-03-10 23:06:12'),
(164, 1, 'WQ4Za6dYtT9PxGBZMRk8nkGVVc19Mo8Y', '2022-03-10 23:06:12', '2022-03-10 23:06:12'),
(165, 1, 'mwTaCKOu8ByNQdtaNNYoZq1PzKQE8hlv', '2022-03-10 23:06:14', '2022-03-10 23:06:14'),
(166, 1, 'j3Osj9cTIaLM6hUkGvrbuwM2Iljh0MSy', '2022-03-10 23:06:15', '2022-03-10 23:06:15'),
(167, 1, 'IyzVXvr1LLVl3OG6hSrgDCGnfDLLFQht', '2022-03-10 23:06:20', '2022-03-10 23:06:20'),
(168, 1, 'ZI6nrEphm48uJEoKDTWU5Kb4UNf1XxKU', '2022-03-10 23:06:20', '2022-03-10 23:06:20'),
(169, 1, 'njYQEHOFoHKCTd5zA3BsfbYjIYIhM5hk', '2022-03-10 23:06:20', '2022-03-10 23:06:20'),
(170, 1, '8lbsjfqRJycn0y97msodjVxBinyNf6as', '2022-03-10 23:07:10', '2022-03-10 23:07:10'),
(171, 1, 'mZxk1Vud3rvKvwQGgceChOXdyB27xcnQ', '2022-03-10 23:07:10', '2022-03-10 23:07:10'),
(172, 1, 'HsoAespmHKb54b4zd4HkB2V6gZEoersd', '2022-03-10 23:20:50', '2022-03-10 23:20:50'),
(173, 1, 'Q8l0zwiZUBZislGMYey5gmPLT8HtLH2d', '2022-03-10 23:20:50', '2022-03-10 23:20:50'),
(174, 1, 'ZXmcwdmHWhhgy5e9gzL3zUZhsYUfwK74', '2022-03-10 23:20:51', '2022-03-10 23:20:51'),
(175, 1, 'CBJC0BFAPbw2qUDYpioEHcwQm1oyi2Ut', '2022-03-10 23:21:24', '2022-03-10 23:21:24'),
(176, 1, 'SEsp8CvG5uHMRrtI8kBBStpBe1hTmMJD', '2022-03-10 23:21:49', '2022-03-10 23:21:49'),
(177, 1, 'O9Ui2Izc9tKMimivGRps8TFMnCTEPJ41', '2022-03-10 23:29:15', '2022-03-10 23:29:15'),
(178, 1, 'dDpIFAKAcEVe40uWvEgOV4QuUITrWz9A', '2022-03-10 23:29:16', '2022-03-10 23:29:16'),
(179, 1, 'd79fT1titPo07eQbo6oc7QG0YklgcBpD', '2022-03-10 23:29:16', '2022-03-10 23:29:16'),
(180, 1, 'Nekss0VhHykSq1KCegCodsOGv2fhKdtR', '2022-03-10 23:29:17', '2022-03-10 23:29:17'),
(181, 1, 'IgsbYX1whTTpQIDP5SCPzDL1qDeOYIZf', '2022-03-10 23:29:20', '2022-03-10 23:29:20'),
(182, 1, 'PgvqEpN24WzdgNaR4O8wK4NwzZSBydZO', '2022-03-10 23:29:20', '2022-03-10 23:29:20'),
(183, 1, 'JfbTF26J6StPYYYdT9W2FKeggqPIOjP2', '2022-03-10 23:29:29', '2022-03-10 23:29:29'),
(184, 1, 'w9LgkHKQN9sy8Ucay0ZXYnHVvTzkbYte', '2022-03-10 23:29:29', '2022-03-10 23:29:29'),
(185, 1, 'P0tTZgDCfqUVIdEVM6ziPqFuhLmnRQQF', '2022-03-10 23:29:29', '2022-03-10 23:29:29'),
(186, 1, 'eMcXnsdl6TvTQSAmVnv1ZjCJr4GgehIs', '2022-03-10 23:29:33', '2022-03-10 23:29:33'),
(187, 1, 'HzfDA6KZJFPFZCQUIqer6tnZ2Hl5Bq29', '2022-03-10 23:29:36', '2022-03-10 23:29:36'),
(188, 1, 'VYVoQ4jI5k8uqNPKtKXsG2MiWs6CZoWl', '2022-03-10 23:29:36', '2022-03-10 23:29:36'),
(189, 1, 'q5or4e5abgIee27nmaCQFJSCBysw702G', '2022-03-10 23:29:48', '2022-03-10 23:29:48'),
(190, 1, 'tsTQY45WdLv8Dcige1EQZcSpJaM61pWR', '2022-03-10 23:29:48', '2022-03-10 23:29:48'),
(191, 1, 'oxHvx7C9dvcbxX5TNhjcL3t7Seyj6gnq', '2022-03-10 23:29:48', '2022-03-10 23:29:48'),
(192, 1, 'VpQrF6d2dKZF5gEgV4w65pZvDGgkG2vC', '2022-03-10 23:30:00', '2022-03-10 23:30:00'),
(193, 1, 'V5B61ShGliV79jCwc3ohLXbbddNzfPnY', '2022-03-10 23:30:00', '2022-03-10 23:30:00'),
(194, 1, 'QGKuSdvmguZulhtHsDX3vEXAWpuK33DK', '2022-03-10 23:30:08', '2022-03-10 23:30:08'),
(195, 1, 'JqZv52wb7FlA1ZVzczcZkVjiHQY5LRS5', '2022-03-10 23:30:08', '2022-03-10 23:30:08'),
(196, 1, 'DVqeAiH0qw998DBz4GH2Rxn4BWbfv3DF', '2022-03-10 23:30:09', '2022-03-10 23:30:09'),
(197, 1, 'PlY6Pft2OpwaEX8jbjt6gM2JkakGJwJW', '2022-03-10 23:30:20', '2022-03-10 23:30:20'),
(198, 1, 'Zzxpgpj0EsZUdu0gAVnw9s8X5F59yfWo', '2022-03-10 23:30:21', '2022-03-10 23:30:21'),
(199, 1, 'D0WK7CjqbKax8yAlCNnswCCAbl2fcys7', '2022-03-10 23:30:29', '2022-03-10 23:30:29'),
(200, 1, 'JOjU1OZe4apKIVZbEuHqNVS9Gf5dLUxf', '2022-03-10 23:30:29', '2022-03-10 23:30:29'),
(201, 1, 'RPX24YsdLXiSVgCohdux7zrib7ilY5y8', '2022-03-10 23:30:30', '2022-03-10 23:30:30'),
(202, 1, 'mB7Ii0eqzG94raqyfKtu2UOc5aQy0JbC', '2022-03-10 23:30:45', '2022-03-10 23:30:45'),
(203, 1, 'WAEInA68a0BFPGsmfb3lGNHGCCu1gqD2', '2022-03-10 23:30:46', '2022-03-10 23:30:46'),
(204, 1, 'Cl7gFso5QjqhpDGxzhO68CknUSHdMP8l', '2022-03-10 23:30:57', '2022-03-10 23:30:57'),
(205, 1, 'LQbRdmBSnVXgNDJE2MU1KIdznkYIEwcP', '2022-03-10 23:30:57', '2022-03-10 23:30:57'),
(206, 1, 'VIAC4jvdl22bXjBFu91KdFaVyMKPERrc', '2022-03-10 23:30:58', '2022-03-10 23:30:58'),
(207, 1, 'H4H03iPLWdE3EeJ5Uw7VmhclAXHpButv', '2022-03-10 23:31:01', '2022-03-10 23:31:01'),
(208, 1, 'smivZx4FN66DTF8GjEFY2fiX2OZr3VoT', '2022-03-10 23:31:01', '2022-03-10 23:31:01'),
(209, 1, 'iCJKUhfF5lrh35HkBTMx5bB21fgbf4cF', '2022-03-10 23:31:14', '2022-03-10 23:31:14'),
(210, 1, 'BXR6MLiQYsOEW9S0eWbP5ZzB4xb8WZ30', '2022-03-10 23:31:14', '2022-03-10 23:31:14'),
(211, 1, 'aFSIo9qYOC4XADNP3V30NoLlU8zXFbxP', '2022-03-10 23:31:14', '2022-03-10 23:31:14'),
(212, 1, 'ZBUd8irpLrTDbdBSqXWFYCFBFnU3h0F3', '2022-03-10 23:31:18', '2022-03-10 23:31:18'),
(213, 1, 'q1sPbbx1Jl87JNwTYUU80PsYHcROplJx', '2022-03-10 23:31:18', '2022-03-10 23:31:18'),
(214, 1, 'RsjqfAgDYBbHnwCU2IHyQpSKBVtaAEtG', '2022-03-10 23:31:21', '2022-03-10 23:31:21'),
(215, 1, 'erTVvLDwWxd75iUpK236CA84Pk8j8a3q', '2022-03-10 23:31:23', '2022-03-10 23:31:23'),
(216, 1, '71cfg9J8EJ7Ld9DRjiVdODrSp7hQ0VxH', '2022-03-10 23:31:48', '2022-03-10 23:31:48'),
(217, 1, 'ZlISzcajOOnQEKGPVzjzDPcvxEQNyJZA', '2022-03-10 23:32:19', '2022-03-10 23:32:19'),
(218, 1, 'yTvAlXsw9p1JC0njBHXlsGDGLG5gjv8I', '2022-03-10 23:32:20', '2022-03-10 23:32:20'),
(219, 1, 'anbF6NtVnu92dIzZbtlKa33NdtZ1Vsce', '2022-03-10 23:32:21', '2022-03-10 23:32:21'),
(220, 1, 'hcXTdYYMmxUX21ClnQGEAnr14v8NyTZJ', '2022-03-10 23:32:21', '2022-03-10 23:32:21'),
(221, 1, 'urASe3EoeF3wqSrz9wW4J0otOlVOc9Dn', '2022-03-10 23:32:47', '2022-03-10 23:32:47'),
(222, 1, '7QSHT92SQ2HFimACVdZXMIYwTkF8ggW4', '2022-03-10 23:32:47', '2022-03-10 23:32:47'),
(223, 1, 'tn2L1CAN5ihiBdghw9TRDoV2acHefs1Y', '2022-03-10 23:32:54', '2022-03-10 23:32:54'),
(224, 1, 'YCl2dE6BZujtze05fZTCUYKIRjiqFbvR', '2022-03-10 23:32:54', '2022-03-10 23:32:54'),
(225, 1, 'MO4o901tMdHyThWQaQM8XIPHm7sVwncP', '2022-03-10 23:32:55', '2022-03-10 23:32:55'),
(226, 1, 'Qkh5i62ewIY0Fvr21NiouXLAwPizJ467', '2022-03-10 23:32:58', '2022-03-10 23:32:58'),
(227, 1, 'OKWJB7FKXYjRh6fwKGJ8QEvA2OXfgNa5', '2022-03-10 23:32:58', '2022-03-10 23:32:58'),
(228, 1, 'Z7HGXHgbQHkn0NlGlzczwsIBtnMxHT9c', '2022-03-10 23:33:03', '2022-03-10 23:33:03'),
(229, 1, 'bSb9XhYQpEvz9yZZoxKC3S8Avsc8BgjA', '2022-03-10 23:33:03', '2022-03-10 23:33:03'),
(230, 1, 'lOEqR38vWc8wjmy0Z3SwYbOZr11iks6I', '2022-03-10 23:33:04', '2022-03-10 23:33:04'),
(231, 1, 'EwcKcRKSk0JJNxbFMobw9c8b6HJSyQK6', '2022-03-10 23:33:06', '2022-03-10 23:33:06'),
(232, 1, 'Fq8rpfVqdCSeYw8LvfQwVhia1O1PdRAJ', '2022-03-10 23:33:07', '2022-03-10 23:33:07'),
(233, 1, 'T5NfEFk70lnyJKRCC5SgJe7b4LyNhM9h', '2022-03-10 23:33:20', '2022-03-10 23:33:20'),
(234, 1, 'gbHRlyB23JyO5Jdp7V6JxavzElOlsGhH', '2022-03-10 23:33:37', '2022-03-10 23:33:37'),
(235, 1, '008hrCeMNbksEDcrxuLk0YkrebRMNUca', '2022-03-10 23:33:45', '2022-03-10 23:33:45'),
(236, 1, 'V688sZo7agpbOa703IpJGF2jh34LKaxK', '2022-03-10 23:34:04', '2022-03-10 23:34:04'),
(237, 1, 'qx3Romb8n7OBZaj5LIFc76phn7mbWHhu', '2022-03-10 23:34:04', '2022-03-10 23:34:04'),
(238, 1, 'ZspmF3Ny9SDzeLYKuOyN3BNbJy30V7K7', '2022-03-10 23:36:01', '2022-03-10 23:36:01'),
(239, 1, 'RbRJl1ld3I4lvIM4ljtMBpUtGUIjmKL9', '2022-03-10 23:36:15', '2022-03-10 23:36:15'),
(240, 1, 'MQuTWiWAO5XVC4L5iJbDZ3MUade6PMe5', '2022-03-10 23:36:15', '2022-03-10 23:36:15'),
(241, 1, '0RyU3TTfP03SBdKyEOpW7eSScFYQ3QU5', '2022-03-10 23:36:15', '2022-03-10 23:36:15'),
(242, 1, 'chlkAO7sc61mC5dJuAHuaeldHVMTH3YC', '2022-03-10 23:39:41', '2022-03-10 23:39:41'),
(243, 1, 'rwQMFawn2sapwJtg2Bi7GTEPZ3fiWubK', '2022-03-10 23:39:42', '2022-03-10 23:39:42'),
(244, 1, 'uWRWkP8HnqlbG5QsPFMwUbAR83kJA49C', '2022-03-10 23:39:42', '2022-03-10 23:39:42'),
(245, 1, 'QIKRsFSgxCdnc0r639tKfTTi9BHA2qTC', '2022-03-10 23:40:51', '2022-03-10 23:40:51'),
(246, 1, 'aLwdO49xACIowG4bHqW3QSIvyIS1UTY3', '2022-03-10 23:40:53', '2022-03-10 23:40:53'),
(247, 1, 'YTNkfvIKjwGUrbfO8fmQpMcDAGKq3Hun', '2022-03-10 23:40:53', '2022-03-10 23:40:53'),
(248, 1, 'NDXL6x9gmb3VMNjtZ4mKSpcx8NtG6Kx9', '2022-03-10 23:40:54', '2022-03-10 23:40:54'),
(249, 1, '4ode9haOufDqtspGeKuYHVvYaurZfvY5', '2022-03-10 23:41:52', '2022-03-10 23:41:52'),
(250, 1, 'FetpeaK5FBX2nUhAOzupplgxTxxVyhpy', '2022-03-10 23:41:54', '2022-03-10 23:41:54'),
(251, 1, '2FCdtT9gaUya3E3E47XRnb9BT57ecYK0', '2022-03-10 23:42:08', '2022-03-10 23:42:08'),
(252, 1, 'EpHHG2jkqtmnyPEcOlH7p8phVgbOzEwp', '2022-03-10 23:42:08', '2022-03-10 23:42:08'),
(253, 1, 'KC4lE7zJKUzjhSdUOK5dsJOC1U4F585X', '2022-03-10 23:42:08', '2022-03-10 23:42:08'),
(254, 1, 'o8D81GVq0EkWmOgdeFEbHw0K1iIThiDe', '2022-03-10 23:42:15', '2022-03-10 23:42:15'),
(255, 1, 'TByvzPcrVOEaqluzsLJWpH1VepkLfDUC', '2022-03-10 23:42:15', '2022-03-10 23:42:15'),
(256, 1, 'LLetWrhte2PtlA1AAjnibbemuyEiKN6o', '2022-03-10 23:43:02', '2022-03-10 23:43:02'),
(257, 1, 'QRkGcVaRl1p2a7j9Knvync3IRUDE5HWr', '2022-03-10 23:43:04', '2022-03-10 23:43:04'),
(258, 1, 'WfIorImaOOOmvIFN3irKGQT9whOFzgfc', '2022-03-10 23:43:05', '2022-03-10 23:43:05'),
(259, 1, 'S8iPDrxMSXF9bdIUEi7RPvcvQIijlfg8', '2022-03-10 23:43:11', '2022-03-10 23:43:11'),
(260, 1, 'Od6EXfG3HvRapns7dwZbgx38OjgAg2gE', '2022-03-10 23:43:12', '2022-03-10 23:43:12'),
(261, 1, 'dJxqDN9o2TfmRlblgYcoNyWizKspjHyG', '2022-03-10 23:43:18', '2022-03-10 23:43:18'),
(262, 1, 'iqiPoTCCE1harvLhUeiFuJyC58O2Q3Bh', '2022-03-10 23:43:26', '2022-03-10 23:43:26'),
(263, 1, 'Dpy2JrU0VLaJpLQZDmiki3rt0w7Yawxf', '2022-03-10 23:43:38', '2022-03-10 23:43:38'),
(264, 1, 'Et4SgIWVLTN4GtkLbLi39lajGXEVyMkL', '2022-03-10 23:43:39', '2022-03-10 23:43:39'),
(265, 1, 'c18dW78rYXk1AD3KHbQ4cXwHJcHkDEeF', '2022-03-10 23:43:44', '2022-03-10 23:43:44'),
(266, 1, 'zosk3ZSdPVbqaFmYVRLcBBfmRqstJDZN', '2022-03-10 23:43:44', '2022-03-10 23:43:44'),
(267, 1, 'cdnD8JHh9VQTfDPTZmFIV4bHttaV8oc7', '2022-03-10 23:43:45', '2022-03-10 23:43:45'),
(268, 1, 'C5cNz5PPb7bl7NOmjcK1dayj7PE1XJTU', '2022-03-10 23:44:22', '2022-03-10 23:44:22'),
(269, 1, 'sRn310mbunXWpkD1WGrzibjSZSjl9oMq', '2022-03-10 23:44:22', '2022-03-10 23:44:22'),
(270, 1, '3QviryCrZyI5QTwG0iFQXdULJdL7mQky', '2022-03-10 23:45:22', '2022-03-10 23:45:22'),
(271, 1, '8B3NJQHkUDi4XlkJQL4zqG9loLeNcqmm', '2022-03-10 23:45:31', '2022-03-10 23:45:31'),
(272, 1, 'ntdK7I3ggWM1vTh5gTOOKf5pH37TpzGz', '2022-03-10 23:49:08', '2022-03-10 23:49:08'),
(273, 1, 'jnzh6n5YrWhawiYbIUvoPcPQbjNfRkOg', '2022-03-10 23:49:08', '2022-03-10 23:49:08'),
(274, 1, 'PeBn0ZHWl2McgALDVbWyrGUS2nE2yiXd', '2022-03-10 23:50:42', '2022-03-10 23:50:42'),
(275, 1, 'Lb3i1TR6lxMUPeGRkEb2HYzcz3PunhaN', '2022-03-10 23:50:42', '2022-03-10 23:50:42'),
(276, 1, 'OllnM4jVHnQs5H4ItcheBqmEw9rEtgQi', '2022-03-10 23:50:43', '2022-03-10 23:50:43'),
(277, 1, 'HcdgPrhEhE9hh59BnIfmDo7duHqeGlM3', '2022-03-10 23:50:45', '2022-03-10 23:50:45'),
(278, 1, 'GwqmqBkRcBVjrI0T08sIdi05TPNfrqRK', '2022-03-10 23:50:45', '2022-03-10 23:50:45'),
(279, 1, '5sDj2mpVZQ3oLAfyoCO7mCvvdnIZLmte', '2022-03-10 23:50:56', '2022-03-10 23:50:56'),
(280, 1, 'Q1Df5lmHWbrOiNIZdlxDqQCArfMAa7DU', '2022-03-10 23:50:58', '2022-03-10 23:50:58'),
(281, 1, 'nv6UcydN0HTneY73RspNQw3DmqmWOZ9U', '2022-03-10 23:50:59', '2022-03-10 23:50:59'),
(282, 1, '04br4iU2L8eDUDOZjGYvf1Uy2j0DfNdW', '2022-03-10 23:50:59', '2022-03-10 23:50:59'),
(283, 1, '3YJVKTJ7cYL2O5kpRwm3dmmJS0uWm4Kv', '2022-03-10 23:51:50', '2022-03-10 23:51:50'),
(284, 1, 'iDOQYufRCPDfr4Y7LQP30bcY14GDr89V', '2022-03-10 23:51:52', '2022-03-10 23:51:52'),
(285, 1, 'xqdBi8q9hByEbSCXFbW9eRAI99g0piun', '2022-03-10 23:52:07', '2022-03-10 23:52:07'),
(286, 1, 'gAh2fZc0eVGhPYHVBszeUrbIUQN5XR8o', '2022-03-10 23:52:07', '2022-03-10 23:52:07'),
(287, 1, '8z82purURMEhloSnjDlKvSuy12G4HpXA', '2022-03-10 23:52:19', '2022-03-10 23:52:19'),
(288, 1, '2s93pQclJm45grGRMrwvXv2BDe7SIxI6', '2022-03-10 23:52:19', '2022-03-10 23:52:19'),
(289, 1, 'p7pNXcRnykRx2s1rxuCenfhfn3tmFHWH', '2022-03-10 23:52:20', '2022-03-10 23:52:20'),
(290, 1, 'zeHjZLSaoELP2W9ZjwfLKH02ebMB0NQ8', '2022-03-10 23:52:23', '2022-03-10 23:52:23'),
(291, 1, 'lrI4j5K8eJ28qMGkccTy4tys5D8TFMdK', '2022-03-10 23:52:23', '2022-03-10 23:52:23'),
(292, 1, 'qnpSJXlMZzJPBmc0T1Cy9wniKbO8QkAB', '2022-03-10 23:52:36', '2022-03-10 23:52:36'),
(293, 1, '2iq8BaQsBd151EIkcOYa7ExtHbsvOZ9b', '2022-03-10 23:52:36', '2022-03-10 23:52:36'),
(294, 1, 'nyI0lhsZe0RfTbf7Re9zULgmpKy8Q1DY', '2022-03-10 23:52:36', '2022-03-10 23:52:36'),
(295, 1, 'ZVz5tFbHDIzM02PIKTbyY37WuNpsq79h', '2022-03-10 23:56:47', '2022-03-10 23:56:47'),
(296, 1, 'hUEkpLVfZnr51qd4yY6jlXwQFnaTqwuo', '2022-03-10 23:56:48', '2022-03-10 23:56:48'),
(297, 1, 'nOLXNVii5Xeq40BLbUhlU8xkW9MJ9KWx', '2022-03-10 23:56:58', '2022-03-10 23:56:58'),
(298, 1, 'e0zElz1OUZwtv8mxywbRA9Vwym9Nw3WZ', '2022-03-10 23:56:58', '2022-03-10 23:56:58'),
(299, 1, 'TtMevtUy0XsrQQeLEnuHhojd7GyGwUIm', '2022-03-10 23:57:54', '2022-03-10 23:57:54'),
(300, 1, 'W1fgeDzIPlwjz4AkwGAqzzptf9aL4LmR', '2022-03-10 23:58:21', '2022-03-10 23:58:21'),
(301, 1, 'aQbPL8S1xmEZJQB5mRNUAuy7pD4DKiFF', '2022-03-10 23:58:34', '2022-03-10 23:58:34'),
(302, 1, '5egpNzcV6JbjbLtIqlvkVE779aBhw41b', '2022-03-11 00:06:14', '2022-03-11 00:06:14'),
(303, 1, 'kKatSLKg8Q6v5DFWiyGrhdM5FtWJi1Be', '2022-03-11 00:06:16', '2022-03-11 00:06:16'),
(304, 1, 'FSnBqA8wSKOocZBIJR8UgUirA9YHYnJL', '2022-03-11 00:06:16', '2022-03-11 00:06:16'),
(305, 1, '92TbkRbyi5qrfhLBgslvGnPx5G0iZAhC', '2022-03-11 00:06:17', '2022-03-11 00:06:17'),
(306, 1, 'rKPm1SAEWOKwcQNudn6btIvZsstYgIuA', '2022-03-11 00:06:21', '2022-03-11 00:06:21'),
(307, 1, 'rVevR4y6X0wLdbt4K8R2C1WY8WIUxbsz', '2022-03-11 00:06:22', '2022-03-11 00:06:22'),
(308, 1, 'SX7T7QxqItaMK1LIBmT0aQtxDn6xJX0r', '2022-03-11 02:48:04', '2022-03-11 02:48:04'),
(309, 1, 'Sav10RJT3uUjjslK2A1g9ZOOAwqshneK', '2022-03-11 02:48:04', '2022-03-11 02:48:04'),
(310, 1, 'xUMO4f4DZ59cMySoHooqCz8CeK4OBFMq', '2022-03-11 02:48:05', '2022-03-11 02:48:05'),
(311, 1, 'OmeKtngt622dW7l4mULK9qik7e57VLHP', '2022-03-11 05:35:58', '2022-03-11 05:35:58'),
(312, 1, 'm1oQMWBVyRhPcKUH4yt14vzLc5YNoXBI', '2022-03-11 05:36:00', '2022-03-11 05:36:00'),
(313, 1, 'Nxfw2b0jgpCh4gEKCbFGoypB9kriolYL', '2022-03-11 05:36:20', '2022-03-11 05:36:20'),
(314, 1, 'n7zyCQevS0137ngpYdOZhwe81k3Lfw7o', '2022-03-11 05:36:21', '2022-03-11 05:36:21'),
(315, 1, 'rejDjVJgfSEgbo8lIDwgbotryNdkObTx', '2022-03-11 05:36:26', '2022-03-11 05:36:26'),
(316, 1, 'Mll5Vn9bgHOs5NV9BHtcpdVT50mAjZ5S', '2022-03-11 05:36:30', '2022-03-11 05:36:30'),
(317, 1, 'lqdh5nkSLiQ0WvKylHLLEEUpalX9FVIN', '2022-03-11 05:50:44', '2022-03-11 05:50:44'),
(318, 1, 'X1biP6qNnP7m467RdJKChUcAlrkSmRox', '2022-03-11 05:54:49', '2022-03-11 05:54:49'),
(319, 1, 'WM0IP2GzBoWhWMEsvGXpb2QSB4ZI3jAW', '2022-03-11 05:54:51', '2022-03-11 05:54:51'),
(320, 1, 'Q6sYGteNFHgVdTcYmbglaabxZhCecfAe', '2022-03-11 05:54:55', '2022-03-11 05:54:55'),
(321, 1, 'LgiJWoTY3s2VpdL35w5Axzg80UIq1jiY', '2022-03-11 05:55:15', '2022-03-11 05:55:15'),
(322, 1, 'CJm4oMiIhBBJ1w6eCEkKMVWOnOHtccHS', '2022-03-11 05:55:16', '2022-03-11 05:55:16'),
(323, 1, 'Ltmi6DtnhAP35KphEIzaytIm4BCde9qn', '2022-03-11 05:58:23', '2022-03-11 05:58:23'),
(324, 1, '9ffJHiD0gqZVMXXzkNVk8EPvkTTB0QDT', '2022-03-11 05:58:25', '2022-03-11 05:58:25'),
(325, 1, 'L58oO6qlrFaG274gJ0umCZiICec2rKM7', '2022-03-11 05:58:25', '2022-03-11 05:58:25'),
(326, 1, '0Y18hZdMnzufU5iLLQIlNKtJxMZeJZYG', '2022-03-11 05:58:26', '2022-03-11 05:58:26'),
(327, 1, 'K77Z7s0cMEu38nDPinCByU2EuBsCUiwU', '2022-03-11 05:58:34', '2022-03-11 05:58:34'),
(328, 1, 'aUejkxvsn0o6BJaRHke04szDMxX638AC', '2022-03-11 05:58:58', '2022-03-11 05:58:58'),
(329, 1, 'RGMpzOGXzV2jNmxAMMP2DDBF2BXebqrn', '2022-03-11 06:00:56', '2022-03-11 06:00:56'),
(330, 1, '1Cg9gar1QKf4m1XEsDHa4fnukkEFOHb9', '2022-03-11 06:00:59', '2022-03-11 06:00:59'),
(331, 1, 'VWiYcdGlqhDz2ydvrkITc9FdsRE18jZS', '2022-03-11 06:01:06', '2022-03-11 06:01:06'),
(332, 1, '7vVGLulBTEwMdLi41n6sFYeO2U8dXNxM', '2022-03-11 06:01:07', '2022-03-11 06:01:07'),
(333, 1, 'URviXQnWQl76zFn84H0ydWNuSuWWBq5e', '2022-03-11 06:02:08', '2022-03-11 06:02:08'),
(334, 1, 'MXNaVQD2sllI80fEkgTnGE64XNurtPyI', '2022-03-11 06:02:11', '2022-03-11 06:02:11'),
(335, 1, '73D9KXvbViHdWg5SM4dy2RjSoOMNLuAw', '2022-03-11 06:02:11', '2022-03-11 06:02:11'),
(336, 1, 'RTuOVpe9WS6l0IDO1BDJs8RqvI1ochye', '2022-03-11 06:02:11', '2022-03-11 06:02:11'),
(337, 1, 'EsLJFdEPeiSzKBCC3tm6fIDo7J453DwW', '2022-03-11 06:02:15', '2022-03-11 06:02:15'),
(338, 1, '81wtd8EsP34ApC1AuwPZAo5AZJaihjPC', '2022-03-11 06:02:15', '2022-03-11 06:02:15'),
(339, 1, '6co0H6qWDmFh81j5OQ7kLkiiW1BmNcTw', '2022-03-11 06:04:39', '2022-03-11 06:04:39'),
(340, 1, '3DAoIJKEUzD2W8LpAFXJBcFl6erxIi1q', '2022-03-11 06:04:44', '2022-03-11 06:04:44'),
(341, 1, '82olsSOTk65qFKgu57D3Mq7cgnaNGV4r', '2022-03-11 06:04:50', '2022-03-11 06:04:50'),
(342, 1, '7nGkT66ene6YS4XNbbuwBPe5gV7ounH7', '2022-03-11 06:07:21', '2022-03-11 06:07:21'),
(343, 1, 'QAdTskF2wQ6JwTpwv7UbIQtVWvVqpFnS', '2022-03-11 06:07:24', '2022-03-11 06:07:24'),
(344, 1, 'LN65D9KvWTcFHLUNnlEGpBHwM61hy8x6', '2022-03-11 06:07:37', '2022-03-11 06:07:37'),
(345, 1, 'PLe7tbfc9uK7P2ignaKPP8gYlHuFLJ70', '2022-03-11 06:07:40', '2022-03-11 06:07:40'),
(346, 1, '8LoCwlC1OJBV2a6w804SZbBGtpUEZ4sr', '2022-03-11 06:07:40', '2022-03-11 06:07:40'),
(347, 1, 'SD4nUvIoQ5QIosMaArl3pnbSyGv5Gize', '2022-03-11 06:07:40', '2022-03-11 06:07:40'),
(348, 1, 'g5b34VevIQeQ33EsqhewEuG1YjUleknP', '2022-03-11 06:08:08', '2022-03-11 06:08:08'),
(349, 1, 'ASidxo0YVn8nxo7Sy0sseB4Y17EczoGQ', '2022-03-11 06:08:14', '2022-03-11 06:08:14'),
(350, 1, 'jUZZ0IjgiwCQwkMLM0VgzfUMmnULtbjQ', '2022-03-11 06:08:14', '2022-03-11 06:08:14'),
(351, 1, '0GX94eu6aOqdNLIglZWUqc5BSk8BC4JD', '2022-03-11 06:08:14', '2022-03-11 06:08:14'),
(352, 1, 'XxkDWME6ND0HSGYzGXaGGWkeNqRxfp1t', '2022-03-11 06:08:20', '2022-03-11 06:08:20'),
(353, 1, 'BNU2Snnqf1VaPHhg7acMaLKFPHL1B3Zn', '2022-03-11 06:08:29', '2022-03-11 06:08:29'),
(354, 1, 'cQSICsvEzvhGOjBSX1jq4SihLOEFPV6M', '2022-03-11 06:08:36', '2022-03-11 06:08:36'),
(355, 1, 'e2OVVNBvJ4ftgemZcqKpkcroYrK1R0XV', '2022-03-11 06:08:41', '2022-03-11 06:08:41'),
(356, 1, '9zShvbvYmFolULjSCBuxRBF5az685I27', '2022-03-11 06:08:44', '2022-03-11 06:08:44'),
(357, 1, 'b4kpPL5U4gQnydS0N5sqjpKfbhMiKqLZ', '2022-03-11 06:08:47', '2022-03-11 06:08:47'),
(358, 1, 'VoKmNRgrRZi8GzdOVuOyn878UxUNVlwi', '2022-03-11 06:08:47', '2022-03-11 06:08:47'),
(359, 1, 'vyyOMIc5bc3bfYbQcO9kj64hbz7UtVay', '2022-03-11 06:08:54', '2022-03-11 06:08:54'),
(360, 1, 'IqGNSPdWnRsDXBhR7b7NiaFbbkfW7BRy', '2022-03-11 06:08:54', '2022-03-11 06:08:54'),
(361, 1, 'dPBghd3ZLQvXAHR7vKLGL4YkWS8JDRM6', '2022-03-11 06:09:00', '2022-03-11 06:09:00'),
(362, 1, '24qDnkLg0mYuEzTHuFesXzTgLV4ycRzA', '2022-03-11 06:09:01', '2022-03-11 06:09:01'),
(363, 1, 'CSiqWZTmaaUnKBAZhkQmP104WEyPQCzj', '2022-03-11 06:09:04', '2022-03-11 06:09:04'),
(364, 1, 'WMn12mFdmdWciPgaMMzmmtllKmldMrDf', '2022-03-11 06:09:23', '2022-03-11 06:09:23'),
(365, 1, 'VblkgFZurMUw4i1n9IsV2hEe3WQcbkzb', '2022-03-11 06:09:25', '2022-03-11 06:09:25'),
(366, 1, 'xGCTGF0cuFItnbbKOqIXNgrXqV2RZhR6', '2022-03-11 06:09:25', '2022-03-11 06:09:25'),
(367, 1, 'rhMv0S7xaSUN7iiO0h8iubjYf8sz95qn', '2022-03-11 06:09:25', '2022-03-11 06:09:25'),
(368, 1, 'HgZEmtCQWsn42fY31RvJZuNRBqUhpVhg', '2022-03-11 06:09:32', '2022-03-11 06:09:32'),
(369, 1, '4mwg2coNUVUqzuBtbGwkwX89VEKQ1mrK', '2022-03-11 06:09:40', '2022-03-11 06:09:40'),
(370, 1, 'y0SOkukNr6tzxIlVVPX5R0lhrtS53EKA', '2022-03-11 06:12:00', '2022-03-11 06:12:00'),
(371, 1, '336OZNiPVoA1qIUzqfVzsKZFXHXWnBUX', '2022-03-11 06:14:24', '2022-03-11 06:14:24'),
(372, 1, 'nQeykwGVV9IwXALlfsegwgq7o5dPll9r', '2022-03-11 06:14:27', '2022-03-11 06:14:27'),
(373, 1, 'nNBbEU8IlrotLT3Q77i9baQ2iCTYs1Wy', '2022-03-11 06:14:30', '2022-03-11 06:14:30'),
(374, 1, '0regntBaI78ZfvTp1X7qgnXDNdLVI3hB', '2022-03-11 06:14:31', '2022-03-11 06:14:31'),
(375, 1, '7JachkC33oeYJk0NEm2iCCzURaVU7oKA', '2022-03-11 06:19:19', '2022-03-11 06:19:19'),
(376, 1, 'HyvOcDRBAQtnwWy15CULnHBzSxbXrDFt', '2022-03-11 06:57:23', '2022-03-11 06:57:23'),
(377, 1, 'H6tlEpLBdJRjvOdJ0jZ3ydWilbXCMMWi', '2022-03-11 06:57:25', '2022-03-11 06:57:25'),
(378, 1, '50l2ep5C1hkDa6m2YR7Q6IXkUxXnFBFF', '2022-03-11 06:57:26', '2022-03-11 06:57:26'),
(379, 1, 'R0t4vhqI2ED5eqaRPRHFD7bJmqSC2Gk3', '2022-03-11 06:57:45', '2022-03-11 06:57:45'),
(380, 1, 'FfcSC0ixkgxEr2lUHVGsT0rSyQjOJRCo', '2022-03-11 06:57:45', '2022-03-11 06:57:45'),
(381, 1, 'ClxiTgTVtS5n0uD9CTKZgCS9rRnuJw9N', '2022-03-11 06:57:46', '2022-03-11 06:57:46'),
(382, 1, 'r6HUy5e5fPQcenSoGnPIFUgkjMGsUzyL', '2022-03-13 01:14:37', '2022-03-13 01:14:37'),
(383, 1, 'obmlVoaJ8Qnzaur3h2nlZOQidTHw8LwA', '2022-03-13 01:15:24', '2022-03-13 01:15:24'),
(384, 1, '236DudFeyS8J5iQDMm9CUwn0zHTKHNcD', '2022-03-13 01:15:29', '2022-03-13 01:15:29'),
(385, 1, 'QYTBxWF6FcKmCd3FTjHv0kO0ljYAoyra', '2022-03-13 01:15:34', '2022-03-13 01:15:34'),
(386, 1, 'OIA0aTMu0y2FeNPFjG82l3f7KBw53DNU', '2022-03-13 01:15:49', '2022-03-13 01:15:49'),
(387, 1, '7pn9SRl50AFB9oms85da9YwRvNLfpquZ', '2022-03-13 01:15:56', '2022-03-13 01:15:56'),
(388, 1, 'R7SwBYM9fohMIVJhCI9B4PYgcNLov8bd', '2022-03-13 01:16:04', '2022-03-13 01:16:04'),
(389, 1, '4CvrLs9kE5aIEDhmZsfHJ8WJwdffFaEe', '2022-03-13 01:16:12', '2022-03-13 01:16:12'),
(390, 1, 'JByBjsH87KEcuzmMUPUg3mypLtxKNBTq', '2022-03-13 01:21:56', '2022-03-13 01:21:56'),
(391, 1, 'xeZ77sPqNMktPKasaZp9MfO77EKCD7zr', '2022-03-13 02:44:13', '2022-03-13 02:44:13'),
(392, 1, 'JGnMtgKrpG9xmlBkS4XrAjmNhbvz0D0p', '2022-03-13 04:45:10', '2022-03-13 04:45:10'),
(393, 1, 'AFr0zEhBaTJICTnzF3DEVkij0pkwLAfk', '2022-03-13 04:45:12', '2022-03-13 04:45:12'),
(394, 1, 'lNbeJsjepxqgO4LYLXKtPrmEgM98NS71', '2022-03-13 04:45:12', '2022-03-13 04:45:12'),
(395, 1, '6nyfet0lFsIkxIQPwrQWo1ByGIiA3XWG', '2022-03-13 04:45:12', '2022-03-13 04:45:12'),
(396, 1, '42WepzIfNItWg9ZMp2kJB3CCPnKPWP6U', '2022-03-13 04:45:18', '2022-03-13 04:45:18'),
(397, 1, 'lJpAFDfnOwxtz7RMfPaPTdAzt7h09A2n', '2022-03-13 04:45:19', '2022-03-13 04:45:19'),
(398, 1, 'HQgh4ZxIPa3dkK5YaV1h3MEdCVoWuLpk', '2022-03-13 04:50:13', '2022-03-13 04:50:13'),
(399, 1, 'D1NQzf97W9UxWELxGDGbsFaHA0pDb4W2', '2022-03-13 04:50:13', '2022-03-13 04:50:13'),
(400, 1, 'gq8Jc9ll8Y69nkjigSFESiQjImGUzWjx', '2022-03-13 04:50:13', '2022-03-13 04:50:13'),
(401, 1, 't9wrfh3MeXxgCzMxGac7eWO832h8ljsd', '2022-03-13 04:50:20', '2022-03-13 04:50:20'),
(402, 1, 'xkbYAamAsKp32AmHNpzJcLDelDnuUOcY', '2022-03-13 04:50:20', '2022-03-13 04:50:20'),
(403, 1, '3bD7piqUscZ2JPgrfUCC797q4iKoAhni', '2022-03-13 05:13:34', '2022-03-13 05:13:34'),
(404, 1, 'o8Jwo2WzBADzEEo2FJAAvFWZGultb651', '2022-03-13 05:16:21', '2022-03-13 05:16:21'),
(405, 1, 'A9tUFiX3AhubDCgtegE7dYKZAfi461jj', '2022-03-13 07:19:59', '2022-03-13 07:19:59'),
(406, 1, 'ynqhpomIIBiqBJEsofK9aM9uevKjNtsv', '2022-03-13 07:42:30', '2022-03-13 07:42:30'),
(407, 1, 'Aq4Wljpb1NN7GbGFPQxPeHrKv50KTM9k', '2022-03-13 07:42:30', '2022-03-13 07:42:30'),
(408, 1, 'iyhH7lbog4EHXE4OmCkWmLuAB9MT4n24', '2022-03-13 07:42:42', '2022-03-13 07:42:42'),
(409, 1, 'MD9zGW0u9CDQFJHC03y4NqngTm46vVyE', '2022-03-13 07:42:42', '2022-03-13 07:42:42'),
(410, 1, 'usnZzyXIrjTfLvfD88cuexl46NIQFtKA', '2022-03-13 07:42:48', '2022-03-13 07:42:48'),
(411, 1, 'iiuDLGpliybLZFApCzihY41NC6JGrtZG', '2022-03-13 07:42:48', '2022-03-13 07:42:48'),
(412, 1, 'dJipKYR1U72BOyshikqJEkizWMmVU3tY', '2022-03-13 07:42:53', '2022-03-13 07:42:53'),
(413, 1, 'SfCEb5N0p8MLVwJFBkUrfj7nYm7p3Zc8', '2022-03-13 07:42:53', '2022-03-13 07:42:53'),
(414, 1, 'v1NBYjZyYONmNQn4o1s0AS8siXwgyWTc', '2022-03-13 07:42:59', '2022-03-13 07:42:59'),
(415, 1, '0u4jQBH6iaQBPNBfgO7kxbOmp55PmNzJ', '2022-03-13 07:42:59', '2022-03-13 07:42:59'),
(416, 1, '6axVzX06swyVEsW0zG8KCLsojvNt9fnO', '2022-03-13 07:43:09', '2022-03-13 07:43:09'),
(417, 1, 'j0rf2GbL4wiU0QA9CkI7ZbBE9CjRdrHR', '2022-03-13 07:43:09', '2022-03-13 07:43:09'),
(418, 1, 'dnKIId8nW1DBW6oVXG81GMWYlzbWJWF4', '2022-03-13 07:43:14', '2022-03-13 07:43:14'),
(419, 1, '6TWLub4RZX4o6eHgQqrtp7byWK3TDl0q', '2022-03-13 07:43:14', '2022-03-13 07:43:14'),
(420, 1, '3CtGP8Rc0Tn2c1frwD3jWMLRoO2kWHIr', '2022-03-13 08:23:36', '2022-03-13 08:23:36'),
(421, 1, 'zJ6mkoOH0t4cV0EFtsTNgLUS4z1vVIrm', '2022-03-13 08:23:37', '2022-03-13 08:23:37'),
(422, 1, 'azW5QTXtI62QLj9kYUqLgAxuWHKXmsR0', '2022-03-13 08:23:39', '2022-03-13 08:23:39'),
(423, 1, 'Ji9Y5M3SjQ3d5D88ZGNzLuYAJXvSEae2', '2022-03-13 08:23:39', '2022-03-13 08:23:39'),
(424, 1, 'dKaT4PxzoZwmCyr9QWVEiZXqBq8eZP5F', '2022-03-13 08:24:13', '2022-03-13 08:24:13'),
(425, 1, 'm05XLZN7UmfEAGDhrVIG8iqtIEA0erbi', '2022-03-13 08:24:14', '2022-03-13 08:24:14'),
(426, 1, '0ZZqKFO5NwJZVCd4yUdESCZXNkGYJBXk', '2022-03-13 08:27:56', '2022-03-13 08:27:56'),
(427, 1, 'WQUXFjBxHh4ny0i00EdGhucZjjIgiTuj', '2022-03-13 08:27:58', '2022-03-13 08:27:58'),
(428, 1, 'ntGJqmfLyM8TwRbM5cBPmqSSa0PfbiNC', '2022-03-13 08:28:04', '2022-03-13 08:28:04'),
(429, 1, 'DQcJlZ9QeeSw7G7lPb0R9AzuFOCTexm1', '2022-03-13 08:28:18', '2022-03-13 08:28:18'),
(430, 1, 'VqHiCpjGFF692a98oVvdJ1Its6OHoPeT', '2022-03-13 08:28:20', '2022-03-13 08:28:20'),
(431, 1, 'vI8xWdsMhk9lGGQdUyIAQlTexftag4KK', '2022-03-13 08:30:32', '2022-03-13 08:30:32'),
(432, 1, 'oNDHUHJdIEIcmHbfSJg11otwgTQq2nfl', '2022-03-13 08:30:33', '2022-03-13 08:30:33'),
(433, 1, 'RlXvEduvSOXgyN59b6hEV2c8aVeh0E1c', '2022-03-13 08:30:33', '2022-03-13 08:30:33'),
(434, 1, 'bIZOPEcFdUI8aZw80yRcfhp0ZHxCodPi', '2022-03-13 08:30:43', '2022-03-13 08:30:43'),
(435, 1, 'oBwqh2gM1o32F6o5I28w36UAeFfXiuZM', '2022-03-13 08:30:43', '2022-03-13 08:30:43'),
(436, 1, 'gUVhQA1G2Mc4yKntTi43Lm6UaejDx2R5', '2022-03-13 08:30:45', '2022-03-13 08:30:45'),
(437, 1, 'OJASUKhbkKJRqzb8H1ZX4GVFke8TAdBS', '2022-03-13 08:30:48', '2022-03-13 08:30:48'),
(438, 1, 'fkB1sZ8cSiwHwFkqqneWMR4JFEJFj7zI', '2022-03-13 08:30:49', '2022-03-13 08:30:49'),
(439, 1, 'DNtL1NVmsDpuaLIE5vBANWYQKKsCDEoM', '2022-03-13 08:30:53', '2022-03-13 08:30:53'),
(440, 1, 'wHqUZEe0vsqUFMcJXnA1jGjgTlkJbU5D', '2022-03-13 08:30:53', '2022-03-13 08:30:53'),
(441, 1, 'I3mfwP0B1WgC4FJtItsdkR5l58pECcFw', '2022-03-13 08:30:56', '2022-03-13 08:30:56'),
(442, 1, 'mMBXjw6qO4pxy03YbkZeC7ZIWHbuo81h', '2022-03-13 08:30:58', '2022-03-13 08:30:58'),
(443, 1, 'dlW0ziLzM3OeXth515HVZNKMf33yAILy', '2022-03-13 08:30:58', '2022-03-13 08:30:58'),
(444, 1, '4aRND13cdKgHwgabU1JmjYuNsvPIAE4B', '2022-03-13 08:31:12', '2022-03-13 08:31:12'),
(445, 1, 'KxrziX6vjVLhwEUFDmU1k5q1VmCIzSzy', '2022-03-13 08:31:12', '2022-03-13 08:31:12'),
(446, 1, 'ab6rhYS93lsGbNieVVHs8IxHZuCyO6i7', '2022-03-13 08:31:18', '2022-03-13 08:31:18'),
(447, 1, 'WE5Ngyr2zBWLKuRZUEg4x6L40Po9oa3u', '2022-03-13 08:31:24', '2022-03-13 08:31:24'),
(448, 1, '8CdyjnDW6rXfaynOrFNmai80lNCIwJBb', '2022-03-13 08:31:30', '2022-03-13 08:31:30'),
(449, 1, 'E9vKunE0o428giIWAOmyHlGXdRKU69ge', '2022-03-13 08:31:30', '2022-03-13 08:31:30'),
(450, 1, 'aatSOJgYJs0bLyD5jry3SXWzFct19zHp', '2022-03-13 08:31:43', '2022-03-13 08:31:43'),
(451, 1, 'lG8rUFhOWumUupevVY8FlZnJbc55VGSN', '2022-03-13 08:31:44', '2022-03-13 08:31:44'),
(452, 1, 'bIIWR9B1yHq4ysa5nNWy9BbJtmCdnDiq', '2022-03-13 08:31:45', '2022-03-13 08:31:45'),
(453, 1, 'eTdCxodiJYyttxJz5ZaGCnRGq7iP2xcc', '2022-03-13 08:31:49', '2022-03-13 08:31:49'),
(454, 1, '4TwEO8R40fzt9LUP7emPVkJV3c3ykPex', '2022-03-13 08:31:51', '2022-03-13 08:31:51'),
(455, 1, 'piv3OmaxnG5B6l2KuKn4ZamgDRuphu6B', '2022-03-13 08:31:51', '2022-03-13 08:31:51'),
(456, 1, '77FlyBHoZepiS4HwVHAtJgNjAd5zgHaa', '2022-03-13 08:32:13', '2022-03-13 08:32:13'),
(457, 1, 'xGThPIHEnMOuXJhXsRMGGmrD3YeUOHOl', '2022-03-13 08:32:13', '2022-03-13 08:32:13'),
(458, 1, 'fFShYP0sDE56i4V8bEnec5fPyoGHCgGq', '2022-03-13 08:32:26', '2022-03-13 08:32:26'),
(459, 1, 'SnlTq18OBYzmARgVVebJVXJs0WiSQNTj', '2022-03-13 08:35:11', '2022-03-13 08:35:11'),
(460, 1, 'K6tEQTtP2koLHKa5cHBrQLwCWs7Zcvot', '2022-03-13 08:35:13', '2022-03-13 08:35:13'),
(461, 1, '4jG3q3zgBxwDSFaWLn6TNQ0qRvnBBUPH', '2022-03-13 08:35:14', '2022-03-13 08:35:14'),
(462, 1, '6mDRFF8jD14KAB2GE0MaIPbPjVOHUrdW', '2022-03-13 08:35:14', '2022-03-13 08:35:14'),
(463, 1, 'tDvQlsbpyPSowz7IdetPalOrlk0swYJf', '2022-03-13 08:35:45', '2022-03-13 08:35:45'),
(464, 1, 'zdHvM9Hv9aoqbh53nciWKr9pYHdf1nkc', '2022-03-13 08:35:45', '2022-03-13 08:35:45'),
(465, 1, 'Hp2o485A2lVixDlkOWBoYBDhNnHprMNj', '2022-03-13 08:37:38', '2022-03-13 08:37:38'),
(466, 1, '45qXXYw423rB29RhDRwTvzhsPTlLbbeP', '2022-03-13 08:37:38', '2022-03-13 08:37:38'),
(467, 1, 'N4Zk8svX8PK2pSmjKGJKtJY2RnnSMdIt', '2022-03-13 08:37:52', '2022-03-13 08:37:52'),
(468, 1, 'yltJk9MB3x8VpHOgex5Gdf2baDaCKynK', '2022-03-13 08:37:53', '2022-03-13 08:37:53'),
(469, 1, 'bdZAfcUc46Pd2M0wFSFlIEc0sMIZHbhv', '2022-03-13 08:37:57', '2022-03-13 08:37:57'),
(470, 1, 'BpMhA70YBN5c0EZOtid6XKuUiVv1W5Er', '2022-03-13 20:13:57', '2022-03-13 20:13:57'),
(471, 1, 'J3bFVrksVaEPbUn9HSO4vSNnZAqcB230', '2022-03-13 20:14:00', '2022-03-13 20:14:00'),
(472, 1, 'YpDRCePVnZ23xj0g0sNAqWLyvz7o1nxG', '2022-03-13 20:14:00', '2022-03-13 20:14:00'),
(473, 1, 'sFSbuJ6yBBKkZWLLGp2ss6MBdO82EV7q', '2022-03-13 20:14:00', '2022-03-13 20:14:00'),
(474, 1, 'MSUs1FtI5AvTr2zkMQh1QZtTF2cObd6O', '2022-03-13 20:14:04', '2022-03-13 20:14:04'),
(475, 1, 'yHhLXyF227xcA9UL54yOL6QkOuFkF23Y', '2022-03-13 20:14:32', '2022-03-13 20:14:32'),
(476, 1, 'S98TxEGM99gSUMCL5VRuRPMFvqg4zWT4', '2022-03-13 20:14:32', '2022-03-13 20:14:32'),
(477, 1, 'qGsAbx5tVSkP8KTfbfgugl7GAB1G8ZcZ', '2022-03-13 20:14:33', '2022-03-13 20:14:33'),
(478, 1, 'HVFOaF2Yg75sYAnIKTtp1mTgqVygLQv4', '2022-03-13 20:14:42', '2022-03-13 20:14:42'),
(479, 1, '6ZsU9jcY6iKLZ8YZglcVa0MmbgrlIq4c', '2022-03-13 20:14:42', '2022-03-13 20:14:42'),
(480, 1, 'KqqChXkAs7dyhM9A3jMWraoCzisNRkBh', '2022-03-13 20:14:42', '2022-03-13 20:14:42'),
(481, 1, 'YDtdkJzqkJRCFbQWIlXfoo7gTF9zUiB1', '2022-03-13 20:15:48', '2022-03-13 20:15:48'),
(482, 1, 'QjmozBmO4uaRw2sw7on5OHX0NzwVShDI', '2022-03-13 20:15:48', '2022-03-13 20:15:48'),
(483, 1, 'kEMVLTmgIgwl8KMTtsZbddgGfx9l2LFg', '2022-03-13 20:15:48', '2022-03-13 20:15:48'),
(484, 1, 'MaEmbWStDGB88gq6v3sXyTd208WbEgHu', '2022-03-13 20:16:05', '2022-03-13 20:16:05'),
(485, 1, 'zKfwApJeDT8BZYvoNBWRSr2DSFWNApGE', '2022-03-13 20:16:07', '2022-03-13 20:16:07'),
(486, 1, 'swWMTjODaqXLJ05woD4tIBIDlcdMMLkz', '2022-03-13 20:16:07', '2022-03-13 20:16:07'),
(487, 1, 'zzxAC1hSSO24bdNHHKkkVKgKFREip5qN', '2022-03-13 20:16:07', '2022-03-13 20:16:07'),
(488, 1, 'fUCgIct8VqOMdw42qN5uBmBiNU9tQvaZ', '2022-03-13 20:16:11', '2022-03-13 20:16:11'),
(489, 1, 'FB6RrIsox9d9c7EsyUmRLQtRv5gWw6gU', '2022-03-13 20:16:37', '2022-03-13 20:16:37'),
(490, 1, 'ICTPDuSqMX8gObCz37DbGLQz4ucfnDwS', '2022-03-13 20:16:37', '2022-03-13 20:16:37'),
(491, 1, 'JsP4uflHHeo68ixqIFYRwlAS4lyEM6CE', '2022-03-13 20:16:44', '2022-03-13 20:16:44'),
(492, 1, 'rwwOBlr6hbyHz87QQcUPUzR634jbuw7f', '2022-03-13 20:16:44', '2022-03-13 20:16:44'),
(493, 1, '8HhmbesLi2Qe3QE32W3iTzsBKY4NIE0H', '2022-03-13 20:16:44', '2022-03-13 20:16:44'),
(494, 1, 'GqxyrztExgn7PX2IBO5FrgSSwKfqWAeT', '2022-03-13 20:16:48', '2022-03-13 20:16:48'),
(495, 1, 'FPQ5ymA1q8XCZQ6RBAcq6Ff2rpmWuKtO', '2022-03-13 20:16:51', '2022-03-13 20:16:51'),
(496, 1, 'ZkWTPkMAqeCpMnzAdiBDgI9e374Vt8ED', '2022-03-13 20:16:52', '2022-03-13 20:16:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `revisions`
--

CREATE TABLE `revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `revisions`
--

INSERT INTO `revisions` (`id`, `revisionable_type`, `revisionable_id`, `user_id`, `key`, `old_value`, `new_value`, `created_at`, `updated_at`) VALUES
(1, 'Modules\\Translation\\Entities\\TranslationTranslation', 1, 1, 'created_at', NULL, NULL, '2022-03-13 07:42:31', '2022-03-13 07:42:31'),
(2, 'Modules\\Translation\\Entities\\TranslationTranslation', 2, 1, 'created_at', NULL, NULL, '2022-03-13 07:42:42', '2022-03-13 07:42:42'),
(3, 'Modules\\Translation\\Entities\\TranslationTranslation', 3, 1, 'created_at', NULL, NULL, '2022-03-13 07:42:48', '2022-03-13 07:42:48'),
(4, 'Modules\\Translation\\Entities\\TranslationTranslation', 4, 1, 'created_at', NULL, NULL, '2022-03-13 07:42:53', '2022-03-13 07:42:53'),
(5, 'Modules\\Translation\\Entities\\TranslationTranslation', 5, 1, 'created_at', NULL, NULL, '2022-03-13 07:42:59', '2022-03-13 07:42:59'),
(6, 'Modules\\Translation\\Entities\\TranslationTranslation', 6, 1, 'created_at', NULL, NULL, '2022-03-13 07:43:09', '2022-03-13 07:43:09'),
(7, 'Modules\\Translation\\Entities\\TranslationTranslation', 7, 1, 'created_at', NULL, NULL, '2022-03-13 07:43:14', '2022-03-13 07:43:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"blog.posts.index\":false,\"blog.posts.create\":false,\"blog.posts.edit\":false,\"blog.posts.destroy\":false,\"blog.categories.index\":false,\"blog.categories.create\":false,\"blog.categories.edit\":false,\"blog.categories.destroy\":false,\"core.sidebar.group\":true,\"dashboard.index\":true,\"dashboard.update\":true,\"dashboard.reset\":true,\"event.events.index\":true,\"event.events.create\":true,\"event.events.edit\":true,\"event.events.destroy\":true,\"media.medias.index\":true,\"media.medias.create\":true,\"media.medias.edit\":true,\"media.medias.destroy\":true,\"media.folders.index\":true,\"media.folders.create\":true,\"media.folders.edit\":true,\"media.folders.destroy\":true,\"menu.menus.index\":true,\"menu.menus.create\":true,\"menu.menus.edit\":true,\"menu.menus.destroy\":true,\"menu.menuitems.index\":true,\"menu.menuitems.create\":true,\"menu.menuitems.edit\":true,\"menu.menuitems.destroy\":true,\"page.pages.index\":true,\"page.pages.create\":true,\"page.pages.edit\":true,\"page.pages.destroy\":true,\"payments.payments.index\":true,\"payments.payments.create\":false,\"payments.payments.edit\":false,\"payments.payments.destroy\":false,\"setting.settings.index\":true,\"setting.settings.edit\":true,\"tag.tags.index\":false,\"tag.tags.create\":false,\"tag.tags.edit\":false,\"tag.tags.destroy\":false,\"translation.translations.index\":false,\"translation.translations.edit\":false,\"translation.translations.import\":false,\"translation.translations.export\":false,\"user.users.index\":true,\"user.users.create\":true,\"user.users.edit\":true,\"user.users.destroy\":true,\"user.roles.index\":true,\"user.roles.create\":true,\"user.roles.edit\":true,\"user.roles.destroy\":true,\"account.api-keys.index\":true,\"account.api-keys.create\":true,\"account.api-keys.destroy\":true,\"workshop.sidebar.group\":true,\"workshop.modules.index\":true,\"workshop.modules.show\":true,\"workshop.modules.update\":true,\"workshop.modules.disable\":true,\"workshop.modules.enable\":true,\"workshop.modules.publish\":true,\"workshop.themes.index\":true,\"workshop.themes.show\":true,\"workshop.themes.publish\":true}', '2022-03-10 04:19:31', '2022-03-13 08:37:53'),
(2, 'user', 'User', NULL, '2022-03-10 04:19:31', '2022-03-10 04:19:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-03-10 04:19:39', '2022-03-10 04:19:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `setting__settings`
--

CREATE TABLE `setting__settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plainValue` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isTranslatable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `setting__settings`
--

INSERT INTO `setting__settings` (`id`, `name`, `plainValue`, `isTranslatable`, `created_at`, `updated_at`) VALUES
(1, 'core::template', 'Flatly', 0, '2022-03-10 04:19:41', '2022-03-10 04:19:41'),
(2, 'core::locales', '[\"en\"]', 0, '2022-03-10 04:19:41', '2022-03-10 04:19:41'),
(3, 'core::site-name', NULL, 1, '2022-03-10 04:25:30', '2022-03-10 04:25:30'),
(4, 'core::site-name-mini', NULL, 1, '2022-03-10 04:25:30', '2022-03-10 04:25:30'),
(5, 'core::site-description', NULL, 1, '2022-03-10 04:25:30', '2022-03-10 04:25:30'),
(6, 'core::analytics-script', NULL, 0, '2022-03-10 04:25:30', '2022-03-10 04:25:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `setting__setting_translations`
--

CREATE TABLE `setting__setting_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `setting__setting_translations`
--

INSERT INTO `setting__setting_translations` (`id`, `setting_id`, `locale`, `value`, `description`) VALUES
(1, 3, 'en', 'Little & Little', NULL),
(2, 4, 'en', NULL, NULL),
(3, 5, 'en', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag__tagged`
--

CREATE TABLE `tag__tagged` (
  `id` int(10) UNSIGNED NOT NULL,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag__tags`
--

CREATE TABLE `tag__tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tag__tag_translations`
--

CREATE TABLE `tag__tag_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `throttle`
--

INSERT INTO `throttle` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES
(1, NULL, 'global', NULL, '2022-03-10 23:03:41', '2022-03-10 23:03:41'),
(2, NULL, 'ip', '127.0.0.1', '2022-03-10 23:03:41', '2022-03-10 23:03:41'),
(3, 1, 'user', NULL, '2022-03-10 23:03:41', '2022-03-10 23:03:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `translation__translations`
--

CREATE TABLE `translation__translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `translation__translations`
--

INSERT INTO `translation__translations` (`id`, `key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'auth.failed', '2022-03-10 04:25:00', '2022-03-10 04:25:00', NULL),
(2, 'event::events.title.events', '2022-03-13 05:16:21', '2022-03-13 05:16:21', NULL),
(3, 'event::events.form.events', '2022-03-13 05:28:59', '2022-03-13 05:28:59', NULL),
(4, 'passwords.password', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(5, 'validation.custom.attribute-name.rule-name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(6, 'core::core.modal.title', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(7, 'core::core.table.actions', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(8, 'core::core.table.thumbnail', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(9, 'core::core.tab.english', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(10, 'core::core.tab.french', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(11, 'core::core.tab.dutch', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(12, 'core::core.tab.italian', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(13, 'core::core.tab.greek', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(14, 'core::core.tab.spanish', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(15, 'core::core.tab.polish', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(16, 'core::core.tab.portuguese', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(17, 'core::core.tab.arabic', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(18, 'core::core.tab.macedonian', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(19, 'core::core.tab.turkish', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(20, 'core::core.tab.czech', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(21, 'core::core.tab.swedish', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(22, 'core::core.tab.korean', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(23, 'core::core.tab.hungarian', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(24, 'core::core.button.cancel', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(25, 'core::core.button.create', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(26, 'core::core.button.update', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(27, 'core::core.button.delete', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(28, 'core::core.button.reset', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(29, 'core::core.button.see', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(30, 'core::core.button.visualize', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(31, 'core::core.save', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(32, 'core::core.confirm', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(33, 'core::core.move', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(34, 'core::core.widget', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(35, 'core::core.widgets', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(36, 'core::core.breadcrumb.home', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(37, 'core::core.general.profile', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(38, 'core::core.back', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(39, 'core::core.error 404', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(40, 'core::core.error 500', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(41, 'core::core.unauthorized', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(42, 'core::sidebar.content', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(43, 'blog::blog.title', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(44, 'blog::category.title.category', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(45, 'blog::category.table.name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(46, 'blog::category.table.slug', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(47, 'blog::category.form.name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(48, 'blog::category.form.slug', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(49, 'blog::post.title.post', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(50, 'blog::post.table.title', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(51, 'blog::post.table.slug', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(52, 'blog::post.table.status', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(53, 'blog::post.form.title', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(54, 'blog::post.form.slug', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(55, 'blog::post.form.content', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(56, 'blog::status.draft', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(57, 'blog::status.published', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(58, 'blog::status.unpublished', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(59, 'blog::tag.title.tag', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(60, 'blog::tag.table.name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(61, 'blog::tag.table.slug', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(62, 'blog::tag.form.name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(63, 'blog::tag.form.slug', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(64, 'dashboard::dashboard.name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(65, 'media::media.title.media', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(66, 'media::media.breadcrumb.media', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(67, 'media::media.table.filename', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(68, 'media::media.table.width', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(69, 'media::media.table.height', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(70, 'media::media.form.description', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(71, 'media::media.form.keywords', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(72, 'media::media.file-sizes.B', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(73, 'media::media.file-sizes.KB', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(74, 'media::media.file-sizes.MB', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(75, 'media::media.file-sizes.GB', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(76, 'media::media.file-sizes.TB', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(77, 'menu::menu-items.form.page', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(78, 'menu::menu-items.form.module', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(79, 'menu::menu-items.form.target', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(80, 'menu::menu-items.form.icon', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(81, 'menu::menu-items.link-type.link type', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(82, 'menu::menu-items.link-type.page', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(83, 'menu::menu-items.link-type.internal', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(84, 'menu::menu-items.link-type.external', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(85, 'menu::menu.title', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(86, 'menu::menu.table.name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(87, 'menu::menu.table.title', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(88, 'menu::menu.form.title', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(89, 'menu::menu.form.name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(90, 'menu::menu.form.status', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(91, 'menu::menu.form.uri', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(92, 'menu::menu.form.url', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(93, 'setting::settings.title.settings', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(94, 'setting::settings.breadcrumb.settings', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(95, 'tag::tags.tags', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(96, 'tag::tags.tag', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(97, 'tag::tags.name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(98, 'tag::tags.slug', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(99, 'tag::tags.namespace', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(100, 'user::auth.email', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(101, 'user::auth.password', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(102, 'user::auth.register me', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(103, 'user::auth.welcome title', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(104, 'user::button.cancel', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(105, 'user::button.delete', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(106, 'user::button.create', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(107, 'user::button.update', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(108, 'user::messages.welcome', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(109, 'user::roles.title.roles', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(110, 'user::roles.breadcrumb.roles', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(111, 'user::roles.breadcrumb.new', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(112, 'user::roles.table.name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(113, 'user::roles.table.slug', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(114, 'user::roles.tabs.data', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(115, 'user::roles.tabs.permissions', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(116, 'user::roles.swap', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(117, 'user::roles.allow', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(118, 'user::roles.deny', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(119, 'user::users.title.users', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(120, 'user::users.breadcrumb.home', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(121, 'user::users.breadcrumb.users', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(122, 'user::users.breadcrumb.new', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(123, 'user::users.tabs.data', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(124, 'user::users.tabs.roles', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(125, 'user::users.tabs.permissions', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(126, 'user::users.form.email', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(127, 'user::users.form.status', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(128, 'user::users.form.password', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(129, 'user::users.form.is activated', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(130, 'user::users.table.email', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(131, 'user::users.table.actions', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(132, 'user::users.profile', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(133, 'workshop::modules.breadcrumb.modules', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(134, 'workshop::modules.table.vendor', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(135, 'workshop::modules.table.name', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(136, 'workshop::modules.table.enabled', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(137, 'workshop::modules.table.version', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(138, 'workshop::modules.enabled', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(139, 'workshop::modules.enable', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(140, 'workshop::modules.disabled', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(141, 'workshop::modules.disable', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(142, 'workshop::modules.module', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(143, 'workshop::modules.changelog', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(144, 'workshop::modules.added', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(145, 'workshop::modules.changed', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(146, 'workshop::modules.removed', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(147, 'workshop::themes.breadcrumb.themes', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(148, 'workshop::themes.theme', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(149, 'workshop::themes.type', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(150, 'workshop::workbench.tab.generators', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(151, 'workshop::workbench.tab.migrations', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(152, 'workshop::workbench.tab.seeds', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(153, 'workshop::workbench.button.migrate', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(154, 'workshop::workbench.button.seed', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(155, 'workshop::workshop.title', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(156, 'workshop::workshop.modules', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(157, 'workshop::workshop.themes', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(158, 'translation::translations.title.translations', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(159, 'translation::translations.Export', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(160, 'translation::translations.Import', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(161, 'translation::translations.time', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(162, 'translation::translations.author', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(163, 'translation::translations.history', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(164, 'translation::translations.event', '2022-03-13 05:34:25', '2022-03-13 05:34:25', NULL),
(165, 'translation::translations.created', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(166, 'translation::translations.edited', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(167, 'page::pages.pages', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(168, 'page::pages.name', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(169, 'page::pages.slug', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(170, 'page::pages.title', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(171, 'page::pages.body', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(172, 'page::pages.status', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(173, 'page::pages.validation.attributes.title', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(174, 'page::pages.validation.attributes.body', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(175, 'page::pages.facebook-types.website', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(176, 'page::pages.facebook-types.product', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(177, 'page::pages.facebook-types.article', '2022-03-13 05:34:26', '2022-03-13 05:34:26', NULL),
(178, 'event::events.button.create event', '2022-03-13 07:42:31', '2022-03-13 07:42:31', NULL),
(179, 'event::events.create resource', '2022-03-13 07:42:42', '2022-03-13 07:42:42', NULL),
(180, 'event::events.destroy resource', '2022-03-13 07:42:48', '2022-03-13 07:42:48', NULL),
(181, 'event::events.edit resource', '2022-03-13 07:42:53', '2022-03-13 07:42:53', NULL),
(182, 'event::events.list resource', '2022-03-13 07:42:59', '2022-03-13 07:42:59', NULL),
(183, 'event::events.title.create event', '2022-03-13 07:43:09', '2022-03-13 07:43:09', NULL),
(184, 'event::events.title.edit event', '2022-03-13 07:43:14', '2022-03-13 07:43:14', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `translation__translation_translations`
--

CREATE TABLE `translation__translation_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translation_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `translation__translation_translations`
--

INSERT INTO `translation__translation_translations` (`id`, `value`, `translation_id`, `locale`) VALUES
(1, 'Thêm mới event', 178, 'en'),
(2, 'Thêm event', 179, 'en'),
(3, 'Xoá event', 180, 'en'),
(4, 'Chỉnh sửa event', 181, 'en'),
(5, 'Danh sách event', 182, 'en'),
(6, 'Thêm mới event', 183, 'en'),
(7, 'Chỉnh sửa event', 184, 'en');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `permissions`, `last_login`, `first_name`, `last_name`, `created_at`, `updated_at`) VALUES
(1, 'taintp21@gmail.com', '$2y$10$3HbIM7YPHrE.Ftl.MedmZO0U9XHr0jmY13eQxEO.U0DuR3PHF0TFm', NULL, '2022-03-13 20:16:52', 'tai', 'nguyen', '2022-03-10 04:19:39', '2022-03-13 20:16:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `access_token`, `created_at`, `updated_at`) VALUES
(1, 1, '86b4de9b-75d0-45ab-b604-0bad1e702c1f', '2022-03-10 04:19:39', '2022-03-10 04:19:39');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog__categories`
--
ALTER TABLE `blog__categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog__category_translations`
--
ALTER TABLE `blog__category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog__category_translations_category_id_locale_unique` (`category_id`,`locale`),
  ADD KEY `blog__category_translations_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `blog__posts`
--
ALTER TABLE `blog__posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog__posts_category_id_index` (`category_id`);

--
-- Chỉ mục cho bảng `blog__post_translations`
--
ALTER TABLE `blog__post_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog__post_translations_post_id_locale_unique` (`post_id`,`locale`),
  ADD KEY `blog__post_translations_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `dashboard__widgets`
--
ALTER TABLE `dashboard__widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard__widgets_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `event__events`
--
ALTER TABLE `event__events`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `event__event_translations`
--
ALTER TABLE `event__event_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event__event_translations_event_id_locale_unique` (`event_id`,`locale`) USING BTREE,
  ADD KEY `event__event_translations_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `media__files`
--
ALTER TABLE `media__files`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `media__file_translations`
--
ALTER TABLE `media__file_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media__file_translations_file_id_locale_unique` (`file_id`,`locale`),
  ADD KEY `media__file_translations_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `media__imageables`
--
ALTER TABLE `media__imageables`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu__menuitems`
--
ALTER TABLE `menu__menuitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu__menuitems_menu_id_foreign` (`menu_id`);

--
-- Chỉ mục cho bảng `menu__menuitem_translations`
--
ALTER TABLE `menu__menuitem_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu__menuitem_translations_menuitem_id_locale_unique` (`menuitem_id`,`locale`),
  ADD KEY `menu__menuitem_translations_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `menu__menus`
--
ALTER TABLE `menu__menus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu__menu_translations`
--
ALTER TABLE `menu__menu_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu__menu_translations_menu_id_locale_unique` (`menu_id`,`locale`),
  ADD KEY `menu__menu_translations_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `page__pages`
--
ALTER TABLE `page__pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `page__page_translations`
--
ALTER TABLE `page__page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page__page_translations_page_id_locale_unique` (`page_id`,`locale`),
  ADD KEY `page__page_translations_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Chỉ mục cho bảng `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Chỉ mục cho bảng `setting__settings`
--
ALTER TABLE `setting__settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting__settings_name_unique` (`name`),
  ADD KEY `setting__settings_name_index` (`name`);

--
-- Chỉ mục cho bảng `setting__setting_translations`
--
ALTER TABLE `setting__setting_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting__setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  ADD KEY `setting__setting_translations_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `tag__tagged`
--
ALTER TABLE `tag__tagged`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag__tagged_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`);

--
-- Chỉ mục cho bảng `tag__tags`
--
ALTER TABLE `tag__tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tag__tag_translations`
--
ALTER TABLE `tag__tag_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag__tag_translations_tag_id_locale_unique` (`tag_id`,`locale`),
  ADD KEY `tag__tag_translations_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `translation__translations`
--
ALTER TABLE `translation__translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation__translations_key_index` (`key`);

--
-- Chỉ mục cho bảng `translation__translation_translations`
--
ALTER TABLE `translation__translation_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_trans_id_locale_unique` (`translation_id`,`locale`),
  ADD KEY `translation__translation_translations_locale_index` (`locale`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_tokens_access_token_unique` (`access_token`),
  ADD KEY `user_tokens_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `blog__categories`
--
ALTER TABLE `blog__categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blog__category_translations`
--
ALTER TABLE `blog__category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blog__posts`
--
ALTER TABLE `blog__posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `blog__post_translations`
--
ALTER TABLE `blog__post_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `dashboard__widgets`
--
ALTER TABLE `dashboard__widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `event__events`
--
ALTER TABLE `event__events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `event__event_translations`
--
ALTER TABLE `event__event_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `media__files`
--
ALTER TABLE `media__files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `media__file_translations`
--
ALTER TABLE `media__file_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `media__imageables`
--
ALTER TABLE `media__imageables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `menu__menuitems`
--
ALTER TABLE `menu__menuitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `menu__menuitem_translations`
--
ALTER TABLE `menu__menuitem_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `menu__menus`
--
ALTER TABLE `menu__menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `menu__menu_translations`
--
ALTER TABLE `menu__menu_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `page__pages`
--
ALTER TABLE `page__pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `page__page_translations`
--
ALTER TABLE `page__page_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=497;

--
-- AUTO_INCREMENT cho bảng `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `setting__settings`
--
ALTER TABLE `setting__settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `setting__setting_translations`
--
ALTER TABLE `setting__setting_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tag__tagged`
--
ALTER TABLE `tag__tagged`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tag__tags`
--
ALTER TABLE `tag__tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tag__tag_translations`
--
ALTER TABLE `tag__tag_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `translation__translations`
--
ALTER TABLE `translation__translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT cho bảng `translation__translation_translations`
--
ALTER TABLE `translation__translation_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `blog__category_translations`
--
ALTER TABLE `blog__category_translations`
  ADD CONSTRAINT `blog__category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog__categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `blog__post_translations`
--
ALTER TABLE `blog__post_translations`
  ADD CONSTRAINT `blog__post_translations_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `blog__posts` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `dashboard__widgets`
--
ALTER TABLE `dashboard__widgets`
  ADD CONSTRAINT `dashboard__widgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `media__file_translations`
--
ALTER TABLE `media__file_translations`
  ADD CONSTRAINT `media__file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `media__files` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `menu__menuitems`
--
ALTER TABLE `menu__menuitems`
  ADD CONSTRAINT `menu__menuitems_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu__menus` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `menu__menuitem_translations`
--
ALTER TABLE `menu__menuitem_translations`
  ADD CONSTRAINT `menu__menuitem_translations_menuitem_id_foreign` FOREIGN KEY (`menuitem_id`) REFERENCES `menu__menuitems` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `menu__menu_translations`
--
ALTER TABLE `menu__menu_translations`
  ADD CONSTRAINT `menu__menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu__menus` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `page__page_translations`
--
ALTER TABLE `page__page_translations`
  ADD CONSTRAINT `page__page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `page__pages` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `setting__setting_translations`
--
ALTER TABLE `setting__setting_translations`
  ADD CONSTRAINT `setting__setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `setting__settings` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `tag__tag_translations`
--
ALTER TABLE `tag__tag_translations`
  ADD CONSTRAINT `tag__tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tag__tags` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `translation__translation_translations`
--
ALTER TABLE `translation__translation_translations`
  ADD CONSTRAINT `translation__translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translation__translations` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
