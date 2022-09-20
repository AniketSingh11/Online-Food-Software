-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 12, 2017 at 06:04 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adjustment_items`
--

CREATE TABLE `adjustment_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `adjustment` int(11) NOT NULL,
  `diff` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `updated_at`, `created_at`) VALUES
(1, 'Pizza edit', '2017-09-16 09:19:06', '2017-09-16 09:19:06'),
(2, 'Drinks', '2017-09-14 17:37:45', '2017-09-14 17:37:45'),
(3, 'Menu', '2017-09-21 16:33:21', '2017-09-21 16:33:21'),
(4, 'Dessert', '2017-09-25 17:16:23', '2017-09-25 17:16:23'),
(5, 'Arfan', '2017-09-27 17:40:59', '2017-09-27 17:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Arfan', 'arfan67@gmail.com', '3005095213', '3rd floor 86 cavalry ground', '2017-08-11 06:00:54', '2017-08-11 06:00:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `homepage`
--

CREATE TABLE `homepage` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `homepage`
--

INSERT INTO `homepage` (`id`, `key`, `type`, `label`, `value`, `created_at`, `updated_at`) VALUES
(1, 'story_title', 'text', 'Story Title', '<span>Discover</span>Our Story', NULL, '2017-09-20 16:13:04'),
(2, 'story_desc', 'textarea', 'Story Description', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.', NULL, '2017-09-20 16:13:04'),
(3, 'menu_title', 'text', 'Menu Title', '<span>Discover</span>Our Menu', NULL, '2017-09-20 16:13:04'),
(4, 'menu_desc', 'textarea', 'Menu Description', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.', NULL, '2017-09-20 16:13:04'),
(5, 'img_title1', 'text', 'Image Title 1', '<h2><span>We Are Sharing</span></h2>                    <h1>delicious treats</h1>', NULL, '2017-09-25 16:36:13'),
(6, 'img_title2', 'text', 'Image Title 2', '<h2><span>The Perfect</span></h2>                    <h1>Blend</h1>', NULL, '2017-09-25 16:36:13'),
(7, 'category', NULL, 'Home Categories', '1,2,3,4', NULL, '2017-09-25 17:16:32');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_trackings`
--

CREATE TABLE `inventory_trackings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `trackable_id` int(11) NOT NULL,
  `trackable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `menu_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `order_by` int(11) NOT NULL,
  `translate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menu_id`, `parent_id`, `link`, `title`, `active`, `order_by`, `translate`) VALUES
(1, 0, 'home', 'Home', 1, 1, 'Home'),
(2, 0, 'map-home', 'Map Home', 1, 2, 'MapHome'),
(3, 0, 'about-us', 'About Us', 1, 3, 'About'),
(4, 3, 'gallery', 'Gallery', 1, 1, 'Gallery'),
(5, 0, 'contact-us', 'Contact', 1, 5, 'Contact'),
(6, 3, 'services', 'Services', 1, 2, 'Services'),
(7, 3, 'listing?type=RENT', 'Rent', 1, 5, 'Rent'),
(8, 3, 'listing?type=SALE', 'Sale', 1, 3, 'Sale'),
(9, 0, 'faq', 'FAQ', 0, 2, 'Faq'),
(10, 3, 'blog', 'Blog', 1, 4, 'Blog'),
(12, 0, 'all-agent', 'Agents', 1, 4, 'Agents'),
(13, 0, 'admin', 'Submit Property', 1, 6, 'Submit_Property'),
(14, 0, 'loan-calculator', 'Calculator', 0, 3, 'Calculator');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `parent_id` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `image`, `body`, `parent_id`, `is_delete`) VALUES
(1, 'Terms & Condition', 'services', '574724_page.jpg', 'Pellentesque pellentesque eget tempor tellus. Fusce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus. Fusce lacinia tempor malesuada.\r\n\r\n                            <h2>H2 Heading</h2>\r\n                            <p>Pellentesque pellentesque usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus.  tellus eget tempor. Fusce lacinia tempor malesuada.</p>\r\n\r\n                            <h3>H3 Heading</h3>\r\n                            <p>Pellentesque tempor tellus eget pellentesque. usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus.  Fusce lacinia tempor malesuada.</p>\r\n\r\n                            <h4>H4 Heading</h4>\r\n                            <p>Pellentesque pellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus. </p>\r\n\r\n                            <h5>H5 Heading</h5><div>this is a test editing </div>\r\n                            <p>Pellentesque pellentesque tempor llentesque pellentesque tempor tellus eget libero llentesque pellentesque tempor tellus eget libero tellus ementellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellenellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellenum.</p>\r\n\r\n                            <h6>H6 Heading</h6>\r\n                            <p>Pellentesque pellentesque tempor tellus eget libero</p>', 0, 0),
(2, 'FAQ', 'faq', 'page2.jpg', 'Pellentesque pellentesque eget tempor tellus. Fusce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus. Fusce lacinia tempor malesuada.<h2 style="color: rgb(103, 106, 108);">H2 Heading</h2><p>Pellentesque pellentesque usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus. tellus eget tempor. Fusce lacinia tempor malesuada.</p><h3 style="color: rgb(103, 106, 108);">H3 Heading</h3><p>Pellentesque tempor tellus eget pellentesque. usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus. Fusce lacinia tempor malesuada.</p><h4 style="color: rgb(103, 106, 108);">H4 Heading</h4><p>Pellentesque pellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellentesque pelleinia tempor malesuada. Pellentesque pellentesque eget tempor tellus ellentesque pellentesque eget tempor tellus.</p><h5 style="color: rgb(103, 106, 108);">H5 Heading</h5><div>this is a test editing </div><p>Pellentesque pellentesque tempor llentesque pellentesque tempor tellus eget libero llentesque pellentesque tempor tellus eget libero tellus ementellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellenellentesque tempor tellus eget fermentum. usce lacllentesque eget tempor tellus ellenum.</p><h6 style="color: rgb(103, 106, 108);">H6 Heading</h6><p>Pellentesque pellentesque tempor tellus eget libero</p>', 0, 0),
(3, 'About Us', 'about-us', 'page3.jpg', '<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat. </p>\r\n\r\n\r\n<h2> Heading 1</h2>\r\n\r\n<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat. <span style="color: inherit;">Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat. </span><span style="color: inherit;"> </span><span style="color: inherit;">Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat.</span></p>', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `object`, `action`, `created_at`, `updated_at`) VALUES
(1, 'accesstoken', 'issuetoken', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(2, 'transienttoken', 'refresh', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(3, 'client', 'foruser', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(4, 'client', 'destroy', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(5, 'scope', 'all', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(6, 'personalaccesstoken', 'foruser', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(7, 'personalaccesstoken', 'destroy', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(8, 'home', 'index', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(9, 'customer', 'index', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(10, 'customer', 'create', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(11, 'customer', 'show', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(12, 'customer', 'edit', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(13, 'customer', 'destroy', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(14, 'supplier', 'index', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(15, 'supplier', 'create', '2017-08-09 23:13:55', '2017-08-09 23:13:55'),
(16, 'supplier', 'show', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(17, 'supplier', 'edit', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(18, 'supplier', 'destroy', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(19, 'product', 'index', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(20, 'product', 'create', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(21, 'product', 'show', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(22, 'product', 'edit', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(23, 'product', 'destroy', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(24, 'user', 'index', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(25, 'user', 'create', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(26, 'user', 'show', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(27, 'user', 'edit', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(28, 'user', 'destroy', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(29, 'sale', 'create', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(30, 'sale', 'receipt', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(31, 'receiving', 'index', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(32, 'receiving', 'create', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(33, 'receiving', 'show', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(34, 'adjustment', 'index', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(35, 'adjustment', 'create', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(36, 'adjustment', 'show', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(37, 'tracking', 'index', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(38, 'report', 'index', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(39, 'report', 'show', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(40, 'profile', 'edit', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(41, 'setting', 'edit', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(42, 'role', 'index', '2017-08-09 23:13:56', '2017-08-09 23:13:56'),
(43, 'role', 'create', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(44, 'role', 'show', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(45, 'role', 'edit', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(46, 'role', 'destroy', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(47, 'permission', 'index', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(48, 'permission', 'create', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(49, 'permission', 'show', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(50, 'permission', 'edit', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(51, 'permission', 'destroy', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(52, 'api\\customer', 'index', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(53, 'api\\product', 'index', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(54, 'api\\supplier', 'index', '2017-08-09 23:13:57', '2017-08-09 23:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(2, 1, 2, '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(3, 1, 3, '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(4, 1, 4, '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(5, 1, 5, '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(6, 1, 6, '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(7, 1, 7, '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(8, 1, 8, '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(9, 1, 9, '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(10, 1, 10, '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(11, 2, 29, '2017-08-21 04:27:20', '2017-08-21 04:27:20'),
(12, 2, 30, '2017-08-21 04:27:20', '2017-08-21 04:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `titles` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prices` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `barcode`, `name`, `description`, `titles`, `prices`, `quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 5, NULL, 'Fajita Pizza', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.', '["Small","Medium","Large","Family"]', '["250","500","750","1000"]', 0, '2017-08-14 04:04:36', '2017-10-12 21:39:49', NULL),
(7, 1, NULL, 'Spicy Fijita', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore \r\nveritatis et quasi architecto beatae vitae.', '["Small","Medium","Large"]', '["250","500","750"]', 0, '2017-08-14 04:10:49', '2017-08-30 10:02:04', NULL),
(8, 2, NULL, 'Once More', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore \r\nveritatis et quasi architecto beatae vitae.', '["Small","Medium","Large"]', '["250","500","750"]', 0, '2017-08-14 04:12:15', '2017-08-14 04:12:15', NULL),
(9, 1, NULL, 'burger', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore \r\nveritatis et quasi architecto beatae vitae.', '["Small","Medium","Large"]', '["250","500","750"]', 0, '2017-08-14 05:09:43', '2017-08-14 05:09:43', NULL),
(10, 5, NULL, 'Western Pizza', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.', '["Small","Medium","Large"]', '["250","500","750"]', 0, '2017-08-20 00:03:34', '2017-10-12 21:42:24', NULL),
(11, 5, NULL, 'Tikka Pizza', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.', '["Small","Medium","Large"]', '["250","500","750"]', 0, '2017-08-30 09:54:55', '2017-10-12 21:43:21', NULL),
(15, 5, NULL, 'Arfan', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.', '["Family"]', '["1000"]', 0, '2017-09-08 18:20:43', '2017-10-12 21:44:30', '2017-10-12 21:44:30');

-- --------------------------------------------------------

--
-- Table structure for table `receivings`
--

CREATE TABLE `receivings` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receiving_items`
--

CREATE TABLE `receiving_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `receiving_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Role for administrator', '2017-08-09 23:13:57', '2017-08-09 23:13:57'),
(2, 'Sales Manager', 'this is a description for sales manger', '2017-08-21 04:27:20', '2017-08-21 04:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT '0',
  `cashier_id` int(11) DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1:completed, 0 canceled',
  `discount` double(10,2) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `cashier_id`, `comments`, `created_at`, `updated_at`, `status`, `discount`, `name`, `email`, `phone`, `address`, `comment`, `type`) VALUES
(1, 1, 1, NULL, '2017-09-08 18:24:43', '2017-09-08 18:24:43', 1, 50.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(2, 1, 1, NULL, '2017-09-16 08:58:18', '2017-09-16 08:58:18', 1, 50.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(3, 1, 1, NULL, '2017-09-16 08:58:25', '2017-09-16 08:58:25', 1, 50.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(4, 1, 1, NULL, '2017-09-16 08:58:31', '2017-09-16 08:58:31', 1, 50.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(5, 1, 1, NULL, '2017-09-16 08:58:38', '2017-09-16 08:58:38', 1, 50.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(6, 1, 1, NULL, '2017-09-16 10:01:02', '2017-09-16 11:17:19', 0, 50.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(7, 0, NULL, NULL, '2017-09-21 19:20:18', '2017-10-12 20:07:29', 0, NULL, 'Arfan Ali', 'arfan67@gmail.com', '042-36622211', '3rd floor 86 cavalry ground', 'this is a test address', 'order'),
(8, 0, NULL, NULL, '2017-09-21 19:29:06', '2017-10-12 20:07:29', 1, NULL, 'Arfan', 'arfan@rich.pk', '+923005095213', '506 Selene St, St Peters, MO 63376, USA', 't', 'order'),
(9, 0, NULL, NULL, '2017-09-21 20:32:38', '2017-10-12 20:07:29', 2, NULL, 'Arfan', 'admin@admin.com', '+923005095213', '3rd floor 86 cavalry ground', 'this', 'order'),
(10, 1, 1, NULL, '2017-09-27 17:36:36', '2017-09-27 17:36:36', 1, 50.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(11, 0, NULL, NULL, '2017-09-28 18:15:56', '2017-10-12 20:07:29', 0, NULL, 'Arfan', 'arfan67@gmail.com', '03005095213', 'this is a test address for users', 'thsi is atest comment', 'order'),
(12, 0, NULL, NULL, '2017-09-28 18:20:01', '2017-10-12 20:07:29', 1, NULL, 'Arfan', 'admin@admin.com', '+923005095213', '3rd floor 86 cavalry ground', 'test', 'order'),
(13, 0, NULL, NULL, '2017-09-28 18:24:24', '2017-10-12 20:07:29', 1, NULL, 'Arfan', 'arfan@rich.pk', '32432423', '3rd floor 86 cavalry ground', 'tet', 'order'),
(14, 0, NULL, NULL, '2017-09-28 18:26:20', '2017-10-12 20:07:29', 1, NULL, 'Arfan', 'admin@admin.com', '+923005095213', '3rd floor 86 cavalry ground', 'tes', 'order'),
(15, 0, NULL, NULL, '2017-09-28 18:27:32', '2017-10-12 20:07:29', 2, NULL, 'Arfan', 'arfan@rich.pk', '+923005095213', '506 Selene St, St Peters, MO 63376, USA', NULL, 'order'),
(16, 0, NULL, NULL, '2017-09-28 19:04:07', '2017-10-12 20:07:29', 2, NULL, 'Arfan', 'arfan@rich.pk', '+923005095213', '172 Tufail Road, Cant MALL OF LAHORE', NULL, 'order'),
(17, 1, 1, NULL, '2017-09-30 15:01:09', '2017-09-30 15:01:09', 1, 50.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(18, 1, 1, NULL, '2017-10-03 16:51:08', '2017-10-03 16:51:08', 1, 100.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(19, 0, NULL, NULL, '2017-10-03 18:58:45', '2017-10-12 20:07:29', 2, NULL, 'arfan', 'arfan67@gmail.com', '+923005095213', 'tewtest', 'fstsetwe', 'order'),
(20, 1, 1, NULL, '2017-10-05 13:52:41', '2017-10-05 13:52:41', 1, 50.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(21, 1, 1, NULL, '2017-10-12 19:12:59', '2017-10-12 19:12:59', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'pos'),
(22, 1, 1, NULL, '2017-10-12 19:28:54', '2017-10-12 19:28:54', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'pos'),
(23, 1, 1, NULL, '2017-10-12 19:34:01', '2017-10-12 19:34:01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'pos'),
(24, 0, NULL, NULL, '2017-10-12 19:36:19', '2017-10-12 20:07:29', 2, NULL, 'Triki', 'ziedtriki013@gmail.com', '22882668', 'SPS', 'avec plus de hrissa', 'order'),
(25, 1, 2, NULL, '2017-10-12 19:53:44', '2017-10-12 19:53:44', 1, 10.00, NULL, NULL, NULL, NULL, NULL, 'pos'),
(26, 0, NULL, NULL, '2017-10-12 20:05:51', '2017-10-12 20:07:29', 2, NULL, 'guuyktjr', 'jsgler@gmail.com', '0611254209', 'HES', 'ekjtgrkw3e', 'order'),
(27, 1, 1, NULL, '2017-10-12 20:06:43', '2017-10-12 20:06:43', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'pos'),
(28, 1, 2, NULL, '2017-10-12 20:30:18', '2017-10-12 20:30:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'pos'),
(29, 1, 2, NULL, '2017-10-12 21:14:20', '2017-10-12 21:14:20', 1, 5.00, NULL, NULL, NULL, NULL, NULL, 'pos');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `p_qty` int(11) NOT NULL DEFAULT '0',
  `size` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `price`, `quantity`, `p_qty`, `size`, `created_at`, `updated_at`) VALUES
(1, 1, 15, '1000.00', 1, 1, 'Family', '2017-09-08 18:24:43', '2017-09-08 18:24:43'),
(2, 2, 8, '500.00', 1, 1, 'Medium', '2017-09-16 08:58:18', '2017-09-16 08:58:18'),
(3, 2, 7, '750.00', 1, 1, 'Large', '2017-09-16 08:58:18', '2017-09-16 08:58:18'),
(4, 3, 6, '750.00', 1, 1, 'Large', '2017-09-16 08:58:25', '2017-09-16 08:58:25'),
(5, 3, 10, '500.00', 1, 1, 'Medium', '2017-09-16 08:58:25', '2017-09-16 08:58:25'),
(6, 4, 6, '500.00', 2, 2, 'Medium', '2017-09-16 08:58:31', '2017-09-16 08:58:31'),
(7, 5, 8, '750.00', 1, 1, 'Large', '2017-09-16 08:58:38', '2017-09-16 08:58:38'),
(8, 5, 11, '500.00', 1, 1, 'Medium', '2017-09-16 08:58:38', '2017-09-16 08:58:38'),
(9, 6, 9, '250.00', 1, 1, 'Small', '2017-09-16 10:01:02', '2017-09-16 10:01:02'),
(10, 7, 6, '250.00', 1, 0, 'Small', '2017-09-21 19:20:18', '2017-09-21 19:20:18'),
(11, 7, 6, '500.00', 1, 0, 'Medium', '2017-09-21 19:20:18', '2017-09-21 19:20:18'),
(12, 8, 6, '250.00', 1, 0, 'Small', '2017-09-21 19:29:06', '2017-09-21 19:29:06'),
(13, 8, 6, '500.00', 1, 0, 'Medium', '2017-09-21 19:29:06', '2017-09-21 19:29:06'),
(14, 9, 9, '250.00', 1, 0, 'Small', '2017-09-21 20:32:38', '2017-09-21 20:32:38'),
(15, 9, 8, '250.00', 1, 0, 'Small', '2017-09-21 20:32:38', '2017-09-21 20:32:38'),
(16, 10, 7, '500.00', 1, 0, 'Medium', '2017-09-27 17:36:36', '2017-09-27 17:36:36'),
(17, 10, 7, '250.00', 1, 0, 'Small', '2017-09-27 17:36:36', '2017-09-27 17:36:36'),
(18, 11, 7, '500.00', 1, 0, 'Medium', '2017-09-28 18:15:56', '2017-09-28 18:15:56'),
(19, 11, 7, '750.00', 1, 0, 'Large', '2017-09-28 18:15:56', '2017-09-28 18:15:56'),
(20, 11, 10, '750.00', 1, 0, 'Large', '2017-09-28 18:15:56', '2017-09-28 18:15:56'),
(21, 11, 10, '500.00', 1, 0, 'Medium', '2017-09-28 18:15:56', '2017-09-28 18:15:56'),
(22, 12, 6, '250.00', 1, 0, 'Small', '2017-09-28 18:20:01', '2017-09-28 18:20:01'),
(23, 12, 6, '500.00', 1, 0, 'Medium', '2017-09-28 18:20:01', '2017-09-28 18:20:01'),
(24, 12, 6, '750.00', 1, 0, 'Large', '2017-09-28 18:20:01', '2017-09-28 18:20:01'),
(25, 13, 6, '250.00', 2, 0, 'Small', '2017-09-28 18:24:24', '2017-09-28 18:24:24'),
(26, 14, 6, '500.00', 1, 0, 'Medium', '2017-09-28 18:26:20', '2017-09-28 18:26:20'),
(27, 15, 7, '750.00', 1, 0, 'Large', '2017-09-28 18:27:32', '2017-09-28 18:27:32'),
(28, 15, 7, '500.00', 1, 0, 'Medium', '2017-09-28 18:27:32', '2017-09-28 18:27:32'),
(29, 16, 9, '250.00', 1, 0, 'Small', '2017-09-28 19:04:07', '2017-09-28 19:04:07'),
(30, 16, 7, '750.00', 1, 0, 'Large', '2017-09-28 19:04:07', '2017-09-28 19:04:07'),
(31, 17, 7, '500.00', 1, 0, 'Medium', '2017-09-30 15:01:09', '2017-09-30 15:01:09'),
(32, 17, 6, '1000.00', 1, 0, 'Family', '2017-09-30 15:01:09', '2017-09-30 15:01:09'),
(33, 17, 10, '750.00', 1, 0, 'Large', '2017-09-30 15:01:09', '2017-09-30 15:01:09'),
(34, 18, 9, '500.00', 1, 0, 'Medium', '2017-10-03 16:51:08', '2017-10-03 16:51:08'),
(35, 18, 9, '250.00', 1, 0, 'Small', '2017-10-03 16:51:08', '2017-10-03 16:51:08'),
(36, 19, 6, '500.00', 1, 0, 'Medium', '2017-10-03 18:58:45', '2017-10-03 18:58:45'),
(37, 19, 6, '750.00', 1, 0, 'Large', '2017-10-03 18:58:45', '2017-10-03 18:58:45'),
(38, 20, 9, '250.00', 1, 1, 'Small', '2017-10-05 13:52:41', '2017-10-05 13:52:41'),
(39, 20, 9, '500.00', 1, 1, 'Medium', '2017-10-05 13:52:41', '2017-10-05 13:52:41'),
(40, 21, 6, '500.00', 1, 0, 'Medium', '2017-10-12 19:12:59', '2017-10-12 19:12:59'),
(41, 21, 6, '750.00', 1, 0, 'Large', '2017-10-12 19:12:59', '2017-10-12 19:12:59'),
(42, 21, 6, '1000.00', 1, 0, 'Family', '2017-10-12 19:12:59', '2017-10-12 19:12:59'),
(43, 21, 7, '500.00', 3, 0, 'Medium', '2017-10-12 19:12:59', '2017-10-12 19:12:59'),
(44, 22, 6, '500.00', 1, 0, 'Medium', '2017-10-12 19:28:54', '2017-10-12 19:28:54'),
(45, 22, 6, '750.00', 1, 0, 'Large', '2017-10-12 19:28:54', '2017-10-12 19:28:54'),
(46, 22, 6, '1000.00', 1, 0, 'Family', '2017-10-12 19:28:54', '2017-10-12 19:28:54'),
(47, 23, 8, '500.00', 1, 0, 'Medium', '2017-10-12 19:34:01', '2017-10-12 19:34:01'),
(48, 23, 8, '750.00', 1, 0, 'Large', '2017-10-12 19:34:01', '2017-10-12 19:34:01'),
(49, 24, 6, '250.00', 1, 0, 'Small', '2017-10-12 19:36:19', '2017-10-12 19:36:19'),
(50, 24, 7, '250.00', 1, 0, 'Small', '2017-10-12 19:36:19', '2017-10-12 19:36:19'),
(51, 24, 9, '250.00', 1, 0, 'Small', '2017-10-12 19:36:19', '2017-10-12 19:36:19'),
(52, 24, 10, '250.00', 2, 0, 'Small', '2017-10-12 19:36:19', '2017-10-12 19:36:19'),
(53, 25, 6, '250.00', 1, 0, 'Small', '2017-10-12 19:53:44', '2017-10-12 19:53:44'),
(54, 25, 8, '500.00', 1, 0, 'Medium', '2017-10-12 19:53:44', '2017-10-12 19:53:44'),
(55, 26, 7, '750.00', 5, 0, 'Large', '2017-10-12 20:05:51', '2017-10-12 20:05:51'),
(56, 27, 6, '500.00', 1, 0, 'Medium', '2017-10-12 20:06:43', '2017-10-12 20:06:43'),
(57, 28, 6, '500.00', 1, 0, 'Medium', '2017-10-12 20:30:18', '2017-10-12 20:30:18'),
(58, 28, 7, '500.00', 1, 0, 'Medium', '2017-10-12 20:30:18', '2017-10-12 20:30:18'),
(59, 28, 8, '500.00', 1, 0, 'Medium', '2017-10-12 20:30:18', '2017-10-12 20:30:18'),
(60, 28, 9, '250.00', 1, 0, 'Small', '2017-10-12 20:30:18', '2017-10-12 20:30:18'),
(61, 29, 6, '500.00', 1, 0, 'Medium', '2017-10-12 21:14:20', '2017-10-12 21:14:20'),
(62, 29, 10, '250.00', 1, 0, 'Small', '2017-10-12 21:14:20', '2017-10-12 21:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `label`, `value`, `created_at`, `updated_at`) VALUES
(1, 'title', 'Site Title', 'Tez POS', NULL, '2017-10-12 19:44:35'),
(2, 'phone', 'Phone', '+92300509513', NULL, '2017-10-12 19:44:35'),
(3, 'email', 'Email', 'arfan67@gmail.com', NULL, '2017-09-06 22:08:34'),
(4, 'address', 'Address', '3rd Floor Street 6 Gali 5', NULL, '2017-08-16 03:53:13'),
(5, 'country', 'Country', 'UAE', NULL, '2017-10-12 19:44:35'),
(6, 'timing1', 'Monday To Saturday', '12PM to 12AM', NULL, '2017-09-18 18:19:33'),
(7, 'sunday', 'Sunday', 'Closed', NULL, '2017-09-18 18:19:34'),
(8, 'facebook', 'Facebook', '#', NULL, '2017-10-12 21:24:55'),
(9, 'twitter', 'Twitter', '#', NULL, '2017-10-12 21:24:55'),
(10, 'vat', 'VAT', '10', NULL, '2017-10-03 16:50:12'),
(11, 'delivery_cost', 'Delivery Cost', '1', NULL, '2017-10-03 15:35:48'),
(12, 'currency', 'Currency', '$', NULL, '2017-10-03 17:00:43'),
(13, 'lng', 'Longitude', '-73.9400', NULL, NULL),
(14, 'lat', 'Latitude', '40.6700', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(500) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(3, '<span>Welcome</span>To The Kada', '336025.jpg', '2017-01-24 09:58:37', '0000-00-00 00:00:00'),
(4, '<span>The Real</span>Spicy Masalas', '333296.jpg', '2017-01-24 09:58:58', '0000-00-00 00:00:00'),
(5, '<span>Delecious</span>Fresh Foods', '667528.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `company_name`, `email`, `phone`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'Test', 'test', 'test', 'test', '2017-08-11 06:00:36', '2017-08-11 06:00:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', '$2y$10$MdGRpRxhGx8mBQRQat9/ReWlAQ2IjTK9m9UErZskxo3T292TcxSFK', 1, 'tp18GZ3HS2AbTg1zwpnkyCmGHbUr7TJeYqdtFiBb4NesapvDd5Eg7t2rlhNX', '2017-08-09 23:13:58', '2017-08-09 23:13:58'),
(2, 'Sales Manager', 'sales@manager.com', '$2y$10$MdGRpRxhGx8mBQRQat9/ReWlAQ2IjTK9m9UErZskxo3T292TcxSFK', 2, '85St0WjCI6O5hd1Ca22LY6qu7sdLK2tIQbL32Y0zFoRSdsEo8u481lJcOMOs', '2017-08-21 04:27:57', '2017-08-21 04:27:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustment_items`
--
ALTER TABLE `adjustment_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `homepage`
--
ALTER TABLE `homepage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `inventory_trackings`
--
ALTER TABLE `inventory_trackings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receivings`
--
ALTER TABLE `receivings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receiving_items`
--
ALTER TABLE `receiving_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_email_unique` (`email`);

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
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `adjustment_items`
--
ALTER TABLE `adjustment_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `homepage`
--
ALTER TABLE `homepage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `inventory_trackings`
--
ALTER TABLE `inventory_trackings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `receivings`
--
ALTER TABLE `receivings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `receiving_items`
--
ALTER TABLE `receiving_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
