-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2015 at 05:47 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vpan`
--

-- --------------------------------------------------------

--
-- Table structure for table `vp_advertisement_advs`
--

CREATE TABLE IF NOT EXISTS `vp_advertisement_advs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `advs_name` varchar(255) NOT NULL,
  `advs_image` varchar(255) NOT NULL,
  `advs_link` varchar(255) NOT NULL,
  `advs_description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vp_advertisement_advs`
--

INSERT INTO `vp_advertisement_advs` (`id`, `asset_id`, `ordering`, `created_by`, `advs_name`, `advs_image`, `advs_link`, `advs_description`) VALUES
(1, 142, 1, 471, 'Quảng cáo 1', 'images/advs/11.jpg', '', ''),
(2, 143, 2, 471, 'Quảng cáo 2', 'images/advs/12.jpg', '', ''),
(3, 144, 3, 471, 'Quảng cáo 3', 'images/advs/13.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `vp_assets`
--

CREATE TABLE IF NOT EXISTS `vp_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=190 ;

--
-- Dumping data for table `vp_assets`
--

INSERT INTO `vp_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 319, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 10, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 11, 12, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 13, 14, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 15, 16, 1, 'com_config', 'com_config', '{}'),
(7, 1, 17, 20, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 21, 140, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.options":[],"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 141, 142, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 143, 144, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 145, 146, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 147, 148, 1, 'com_login', 'com_login', '{}'),
(13, 1, 149, 150, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 151, 152, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 153, 154, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 155, 156, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 157, 158, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 159, 250, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 251, 254, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 255, 256, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 257, 258, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 259, 260, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 261, 262, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 263, 266, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 267, 268, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 22, 23, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 18, 19, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 252, 253, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 264, 265, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 269, 270, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 271, 272, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 273, 274, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 275, 276, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 277, 278, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 279, 280, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 160, 161, 2, 'com_modules.module.1', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(40, 18, 162, 163, 2, 'com_modules.module.2', 'Login', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 18, 164, 165, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 18, 166, 167, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 18, 168, 169, 2, 'com_modules.module.8', 'Toolbar', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 18, 170, 171, 2, 'com_modules.module.9', 'Quick Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 18, 172, 173, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 18, 174, 175, 2, 'com_modules.module.12', 'Admin Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 18, 176, 177, 2, 'com_modules.module.13', 'Admin Submenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 18, 178, 179, 2, 'com_modules.module.14', 'User Status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 18, 180, 181, 2, 'com_modules.module.15', 'Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 18, 182, 183, 2, 'com_modules.module.16', 'Login Form', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 18, 184, 185, 2, 'com_modules.module.17', 'Breadcrumbs', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(52, 18, 186, 187, 2, 'com_modules.module.79', 'Multilanguage status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 18, 188, 189, 2, 'com_modules.module.86', 'Joomla Version', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 8, 24, 113, 2, 'com_content.category.8', 'English Category', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(55, 8, 114, 139, 2, 'com_content.category.9', 'Tiếng Việt Danh mục', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(56, 54, 25, 58, 3, 'com_content.category.10', 'Products and Services', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(57, 55, 115, 128, 3, 'com_content.category.11', 'Sản phẩm và Dịch vụ', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(58, 163, 37, 38, 5, 'com_content.article.1', 'Product 01', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(59, 57, 116, 117, 4, 'com_content.article.2', 'Sản phẩm 01', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(60, 18, 190, 191, 2, 'com_modules.module.87', 'Menu English Module', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(61, 18, 192, 193, 2, 'com_modules.module.88', 'Menu Tiếng Việt Module', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(62, 18, 194, 195, 2, 'com_modules.module.89', 'BLS - Backend Language Switcher', ''),
(63, 18, 196, 197, 2, 'com_modules.module.90', 'Language', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(64, 55, 129, 130, 3, 'com_content.category.12', 'Dự án', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(65, 55, 131, 132, 3, 'com_content.category.13', 'Thư viện hình ảnh', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(66, 55, 133, 134, 3, 'com_content.category.14', 'Liên hệ', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(67, 55, 135, 138, 3, 'com_content.category.15', 'Giới thiệu', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(68, 54, 59, 104, 3, 'com_content.category.16', 'Products reference', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(69, 54, 105, 106, 3, 'com_content.category.17', 'Pictures', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(70, 54, 107, 108, 3, 'com_content.category.18', 'Contact us', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(71, 54, 109, 112, 3, 'com_content.category.19', 'About us', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(72, 57, 118, 119, 4, 'com_content.category.20', 'Thiết bị Công nghệ', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(73, 57, 120, 121, 4, 'com_content.category.21', 'Hệ thống Ống rác', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(74, 57, 122, 123, 4, 'com_content.category.22', 'Các thiết bị khác', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(75, 56, 26, 27, 4, 'com_content.category.23', 'Technological equipment', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(76, 56, 28, 29, 4, 'com_content.category.24', 'Garbage duct system', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(77, 56, 30, 31, 4, 'com_content.category.25', 'Other products', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(78, 18, 198, 199, 2, 'com_modules.module.91', 'Search', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(79, 18, 200, 201, 2, 'com_modules.module.92', 'Slider homepage', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(80, 18, 202, 203, 2, 'com_modules.module.93', 'Footer', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(81, 67, 136, 137, 4, 'com_content.article.3', 'Giới thiệu', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(82, 71, 110, 111, 4, 'com_content.article.4', 'About us', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(83, 18, 204, 205, 2, 'com_modules.module.94', 'Banner category', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(84, 1, 281, 282, 1, 'com_attachments', 'com_attachments', '{}'),
(85, 18, 206, 207, 2, 'com_modules.module.95', 'JoomGallery News', ''),
(113, 1, 283, 284, 1, 'com_phocagallery', 'com_phocagallery', '{}'),
(114, 18, 208, 209, 2, 'com_modules.module.102', 'MyLiveChat', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(115, 3, 6, 7, 2, 'com_banners.category.26', 'Category pro 1', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(116, 3, 8, 9, 2, 'com_banners.category.27', 'Category pro 2', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(117, 18, 210, 211, 2, 'com_modules.module.103', 'List banner', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(118, 18, 212, 213, 2, 'com_modules.module.104', 'Left 1 - List category', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(119, 18, 214, 215, 2, 'com_modules.module.105', 'Left 2 - List hợp tác', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(120, 18, 216, 217, 2, 'com_modules.module.106', 'Left 3 - Thống kê', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(121, 18, 218, 219, 2, 'com_modules.module.107', 'R2- Hỗ trợ trực tuyến', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(122, 18, 220, 221, 2, 'com_modules.module.108', 'Right 2 - Sản phẩm nổi bật', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(123, 18, 222, 223, 2, 'com_modules.module.109', 'Right 3 - Quảng cáo', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(124, 18, 224, 225, 2, 'com_modules.module.110', 'L1- Thống kê', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(125, 1, 285, 294, 1, 'com_product', 'com_product', '{}'),
(126, 125, 286, 287, 2, 'com_product.category.28', 'Cate 1', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(127, 125, 288, 289, 2, 'com_product.category.29', 'Cate 2', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(128, 125, 290, 291, 2, 'com_product.product.1', 'com_product.product.1', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(129, 125, 292, 293, 2, 'com_product.product.2', 'com_product.product.2', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(130, 68, 66, 71, 4, 'com_content.category.30', 'Industrial Flooring & Acid Proof', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(131, 130, 67, 68, 5, 'com_content.article.5', 'Prodcut 1', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(132, 68, 60, 65, 4, 'com_content.category.31', 'Sanishute Diposal System', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(133, 132, 61, 62, 5, 'com_content.article.6', 'Producct 2', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(134, 132, 63, 64, 5, 'com_content.article.7', 'Prodcut 3', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(135, 1, 295, 308, 1, 'com_partner', 'com_partner', '{}'),
(136, 135, 296, 297, 2, 'com_partner.partner.1', 'com_partner.partner.1', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(137, 135, 298, 299, 2, 'com_partner.partner.2', 'com_partner.partner.2', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(138, 135, 300, 301, 2, 'com_partner.partner.3', 'com_partner.partner.3', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(139, 135, 302, 303, 2, 'com_partner.partner.4', 'com_partner.partner.4', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(140, 18, 226, 227, 2, 'com_modules.module.111', 'Đối tác', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(141, 1, 309, 316, 1, 'com_advertisement', 'com_advertisement', '{}'),
(142, 141, 310, 311, 2, 'com_advertisement.advertisement.1', 'com_advertisement.advertisement.1', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(143, 141, 312, 313, 2, 'com_advertisement.advertisement.2', 'com_advertisement.advertisement.2', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(144, 141, 314, 315, 2, 'com_advertisement.advertisement.3', 'com_advertisement.advertisement.3', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(145, 18, 228, 229, 2, 'com_modules.module.112', 'R3 - Advertisement', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(146, 68, 72, 75, 4, 'com_content.category.32', 'Entrance Carpet', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(147, 68, 76, 79, 4, 'com_content.category.33', 'Acrovyn Handrail and Wallguard', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(148, 68, 80, 83, 4, 'com_content.category.34', 'Expansion Joint Cover', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(149, 68, 84, 87, 4, 'com_content.category.35', 'Performance Louver', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(150, 68, 88, 91, 4, 'com_content.category.36', 'Explovent', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(151, 68, 92, 95, 4, 'com_content.category.37', 'Metal Roof & Wall Cladding', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(152, 68, 96, 99, 4, 'com_content.category.38', 'Toilet Partition', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(153, 68, 100, 103, 4, 'com_content.category.39', 'Drywall and Ceiling', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(154, 130, 69, 70, 5, 'com_content.article.8', 'Prodcut 4', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(155, 146, 73, 74, 5, 'com_content.article.9', 'Prodcut a', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(156, 147, 77, 78, 5, 'com_content.article.10', 'Prodcut b', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(157, 148, 81, 82, 5, 'com_content.article.11', 'Prodcut c', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(158, 149, 85, 86, 5, 'com_content.article.12', 'Prodcut d', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(159, 150, 89, 90, 5, 'com_content.article.13', 'Prodcut e', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(160, 151, 93, 94, 5, 'com_content.article.14', 'Prodcut ff', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(161, 152, 97, 98, 5, 'com_content.article.15', 'Prodcut gg', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(162, 153, 101, 102, 5, 'com_content.article.16', 'Prodcut hh', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(163, 56, 32, 41, 4, 'com_content.category.40', 'METZ industrial flooring & acid proof system: wide application', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(164, 56, 42, 45, 4, 'com_content.category.41', 'JAMES HARDIE’s garbage chute, drywall, ceiling and toilet partition', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(165, 56, 46, 49, 4, 'com_content.category.42', 'Specialized products: EJC, Performance Louvers, Entrance Carpet, Acrovyn Handrail and Wallguard, Exp', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(166, 56, 50, 53, 4, 'com_content.category.43', 'CENTRIA’s metal claddings both architectural and industrial claddings : highrises and power station ', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(167, 56, 54, 57, 4, 'com_content.category.44', 'Trade services : BMJ special paper and INDOPOLY’s BOPP', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(168, 163, 33, 34, 5, 'com_content.article.17', 'Product 001', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(169, 163, 35, 36, 5, 'com_content.article.18', 'Product 002', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(170, 164, 43, 44, 5, 'com_content.article.19', 'Product 003', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(171, 165, 47, 48, 5, 'com_content.article.20', 'Product 004', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(172, 166, 51, 52, 5, 'com_content.article.21', 'Product 005', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(173, 167, 55, 56, 5, 'com_content.article.22', 'Product 006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(174, 163, 39, 40, 5, 'com_content.article.23', 'Product tttt', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(175, 18, 230, 231, 2, 'com_modules.module.113', 'R1 - Sản phẩm nổi bật', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(176, 135, 304, 305, 2, 'com_partner.partner.5', 'com_partner.partner.5', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(177, 135, 306, 307, 2, 'com_partner.partner.6', 'com_partner.partner.6', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(178, 18, 232, 233, 2, 'com_modules.module.114', 'Sản phẩm mới', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(179, 57, 124, 127, 4, 'com_content.category.45', 'Hệ thống nền công nghiệp và chống hóa chất METZ: được sử dụng rộng rãi ở nhiều khu vực', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(180, 179, 125, 126, 5, 'com_content.article.24', 'Hệ thống sàn công nghiệp và chống ăn mòn', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(181, 1, 317, 318, 1, 'com_djcatalog2', 'com_djcatalog2', '{"djcatalog2.filedownload":{"1":1,"9":1,"6":1,"7":1,"2":1,"3":1,"4":1,"5":1},"core.admin":[],"core.manage":[],"core.create":[],"core.delete":[],"core.delete.own":[],"core.edit":[],"core.edit.own":[],"core.edit.state":[],"core.edit.state.own":[]}'),
(182, 18, 234, 235, 2, 'com_modules.module.115', 'DJ-Catalog2 Categories', ''),
(183, 18, 236, 237, 2, 'com_modules.module.116', 'DJ-Catalog2 Frontpage', ''),
(184, 18, 238, 239, 2, 'com_modules.module.117', 'DJ-Catalog2 Items', ''),
(185, 18, 240, 241, 2, 'com_modules.module.118', 'DJ-Catalog2 Related Items', ''),
(186, 18, 242, 243, 2, 'com_modules.module.119', 'DJ-Catalog2 Filters Module', ''),
(187, 18, 244, 245, 2, 'com_modules.module.120', 'DJ-Catalog2 Producers', ''),
(188, 18, 246, 247, 2, 'com_modules.module.121', 'DJ-Catalog2 Search Module', ''),
(189, 18, 248, 249, 2, 'com_modules.module.122', 'Projects category', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `vp_associations`
--

CREATE TABLE IF NOT EXISTS `vp_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vp_associations`
--

INSERT INTO `vp_associations` (`id`, `context`, `key`) VALUES
(20, 'com_categories.item', '1a347fc2bbced6a3e00e0608e1499830'),
(1, 'com_content.item', '25a9473d58df6672d7f59e01def396c9'),
(1, 'com_contact.item', '293c04c4704960f9033daee74bacdac7'),
(11, 'com_categories.item', '2a6e70de0c2c1cbb753fb574e816e933'),
(12, 'com_categories.item', '5ceddd3262ecf37d430ad9fddb100078'),
(8, 'com_categories.item', '5d67e702c8540ba1944567c66776632c'),
(3, 'com_content.item', '5ee705345286ead7645c2e68dda5a99b'),
(2, 'com_contact.item', '6e2e1575dcac0e67d78b838170a36037'),
(15, 'com_categories.item', '6f65d652bfa5d31da76c5ac37e708593'),
(40, 'com_categories.item', '8ca1cedc85d04532561496e20cb77ba6'),
(21, 'com_categories.item', '922c2d37e4fd50a0c0359aaedfd6d503'),
(17, 'com_content.item', '92e5b75f945f675000a704bd2afec7aa'),
(19, 'com_categories.item', '970a2c4b0d40ecdd076329f68c480724'),
(23, 'com_categories.item', '9f97d25ab0971a6f707145bc1b5d7387'),
(25, 'com_categories.item', 'a11539d982bfc1e65a66c720f6611ade'),
(45, 'com_categories.item', 'afa64439f3566cd98bf8b9308f6d3202'),
(22, 'com_categories.item', 'b98c064405abfcdc4b86f0d2c685b85d'),
(10, 'com_categories.item', 'bab5def9d5a878f977679b48ea6fa927'),
(24, 'com_content.item', 'bde2cc4bbf156cb5b39cf501ce0b7b82'),
(14, 'com_categories.item', 'd907759d51efd62e390e2a82b62ddf61'),
(18, 'com_categories.item', 'e2948e58f4dc223ed5fd054e88f67623'),
(2, 'com_content.item', 'e888a09717dbee25901ae9f52ee53a9c'),
(17, 'com_categories.item', 'e8b86d83856c87ae8bf08c3d6ec80a6c'),
(24, 'com_categories.item', 'eca511d253defdc5c6799c6b472ecfcb'),
(13, 'com_categories.item', 'f48cea94d6d258453bc5eb0bef6fb145'),
(4, 'com_content.item', 'f4a1c82e1c9e05c16842ca3b54dd0fb4'),
(16, 'com_categories.item', 'fe59bf6754f6185fab8e23f43359434b'),
(9, 'com_categories.item', 'febbbf7455fbe4b9cec3ce2e72f96bc6');

-- --------------------------------------------------------

--
-- Table structure for table `vp_attachments`
--

CREATE TABLE IF NOT EXISTS `vp_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(256) NOT NULL,
  `filename_sys` varchar(512) NOT NULL,
  `file_type` varchar(128) NOT NULL,
  `file_size` int(11) unsigned NOT NULL,
  `url` varchar(1024) NOT NULL DEFAULT '',
  `uri_type` enum('file','url') DEFAULT 'file',
  `url_valid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url_relative` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url_verify` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `display_name` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `icon_filename` varchar(20) NOT NULL,
  `access` int(11) NOT NULL DEFAULT '1',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_field_1` varchar(255) NOT NULL DEFAULT '',
  `user_field_2` varchar(255) NOT NULL DEFAULT '',
  `user_field_3` varchar(255) NOT NULL DEFAULT '',
  `parent_type` varchar(100) NOT NULL DEFAULT 'com_content',
  `parent_entity` varchar(100) NOT NULL DEFAULT 'article',
  `parent_id` int(11) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `download_count` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vp_attachments`
--

INSERT INTO `vp_attachments` (`id`, `filename`, `filename_sys`, `file_type`, `file_size`, `url`, `uri_type`, `url_valid`, `url_relative`, `url_verify`, `display_name`, `description`, `icon_filename`, `access`, `state`, `user_field_1`, `user_field_2`, `user_field_3`, `parent_type`, `parent_entity`, `parent_id`, `created`, `created_by`, `modified`, `modified_by`, `download_count`) VALUES
(2, 'Bao gia lan can logia.pdf', 'E:\\DATA\\WEB\\Run\\htdocs\\vpan\\attachments\\article\\4\\Bao gia lan can logia.pdf', 'application/pdf', 127585, 'attachments/article/4/Bao gia lan can logia.pdf', 'file', 0, 0, 0, '', '', 'pdf.gif', 1, 1, '', '', '', 'com_content', 'article', 4, '2015-05-31 10:34:34', 471, '2015-05-31 10:34:34', 471, 0),
(3, 'Bao_Gia.pdf', 'E:\\DATA\\WEB\\Run\\htdocs\\vpan\\attachments\\article\\17\\Bao_Gia.pdf', 'application/pdf', 127585, 'attachments/article/17/Bao_Gia.pdf', 'file', 0, 0, 0, '', '', 'pdf.gif', 1, 1, '', '', '', 'com_content', 'article', 17, '2015-06-06 15:25:22', 471, '2015-06-06 15:25:22', 471, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vp_banners`
--

CREATE TABLE IF NOT EXISTS `vp_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vp_banners`
--

INSERT INTO `vp_banners` (`id`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `clickurl`, `state`, `catid`, `description`, `custombannercode`, `sticky`, `ordering`, `metakey`, `params`, `own_prefix`, `metakey_prefix`, `purchase_type`, `track_clicks`, `track_impressions`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `reset`, `created`, `language`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `version`) VALUES
(1, 0, 0, 'Product 1 - pro 1', 'product-1-pro-1', 0, 2, 0, '', -2, 26, '', '', 0, 1, '', '{"imageurl":"images\\/sampledata\\/parks\\/animals\\/180px_koala_ag1.jpg","width":"","height":"","alt":""}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-06-01 15:24:11', '*', 0, '', '0000-00-00 00:00:00', 0, 1),
(2, 0, 0, 'Product 2 - pro 1', 'product-2-pro-1', 0, 2, 0, '', -2, 26, '', '', 0, 2, '', '{"imageurl":"images\\/sampledata\\/parks\\/animals\\/200px_phyllopteryx_taeniolatus1.jpg","width":"","height":"","alt":""}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-06-01 15:24:40', '*', 0, '', '0000-00-00 00:00:00', 0, 1),
(3, 0, 0, 'Product 1 - pro 2', 'product-1-pro-2', 0, 2, 0, '', -2, 27, '', '', 0, 3, '', '{"imageurl":"images\\/sampledata\\/parks\\/animals\\/800px_phyllopteryx_taeniolatus1.jpg","width":"","height":"","alt":""}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-06-01 15:25:03', '*', 0, '', '0000-00-00 00:00:00', 0, 1),
(4, 0, 0, 'Product 2 - pro 2', 'product-2-pro-2', 0, 2, 0, '', -2, 27, '', '', 0, 4, '', '{"imageurl":"images\\/sampledata\\/parks\\/animals\\/789px_spottedquoll_2005_seanmcclean.jpg","width":"","height":"","alt":""}', 0, '', -1, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2015-06-01 15:25:27', '*', 0, '', '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vp_banner_clients`
--

CREATE TABLE IF NOT EXISTS `vp_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `vp_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_categories`
--

CREATE TABLE IF NOT EXISTS `vp_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `vp_categories`
--

INSERT INTO `vp_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 87, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 54, 1, 11, 58, 1, 'english-category', 'com_content', 'English Category', 'english-category', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-30 17:11:53', 0, '2015-05-30 17:11:53', 0, 'en-GB', 1),
(9, 55, 1, 59, 78, 1, 'ti-ng-vi-t-danh-m-c', 'com_content', 'Tiếng Việt Danh mục', 'ti-ng-vi-t-danh-m-c', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-30 17:12:13', 0, '2015-05-30 17:12:13', 0, 'vi-VN', 1),
(10, 56, 8, 12, 29, 2, 'english-category/products', 'com_content', 'Products and Services', 'products', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-30 17:12:54', 471, '2015-05-31 03:53:44', 0, 'en-GB', 1),
(11, 57, 9, 60, 69, 2, 'ti-ng-vi-t-danh-m-c/s-n-ph-m', 'com_content', 'Sản phẩm và Dịch vụ', 's-n-ph-m', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-30 17:15:00', 471, '2015-05-31 03:51:29', 0, 'vi-VN', 1),
(12, 64, 9, 70, 71, 2, 'ti-ng-vi-t-danh-m-c/d-an', 'com_content', 'Dự án', 'd-an', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 03:51:55', 0, '2015-05-31 03:51:55', 0, 'vi-VN', 1),
(13, 65, 9, 72, 73, 2, 'ti-ng-vi-t-danh-m-c/thu-vi-n-hinh-nh', 'com_content', 'Thư viện hình ảnh', 'thu-vi-n-hinh-nh', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 03:52:12', 0, '2015-05-31 03:52:12', 0, 'vi-VN', 1),
(14, 66, 9, 74, 75, 2, 'ti-ng-vi-t-danh-m-c/lien-h', 'com_content', 'Liên hệ', 'lien-h', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 03:52:31', 0, '2015-05-31 03:52:31', 0, 'vi-VN', 1),
(15, 67, 9, 76, 77, 2, 'ti-ng-vi-t-danh-m-c/gi-i-thi-u', 'com_content', 'Giới thiệu', 'gi-i-thi-u', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 03:53:16', 0, '2015-05-31 03:53:16', 0, 'vi-VN', 1),
(16, 68, 8, 30, 51, 2, 'english-category/products-reference', 'com_content', 'Products reference', 'products-reference', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 03:54:23', 0, '2015-05-31 03:54:23', 0, 'en-GB', 1),
(17, 69, 8, 52, 53, 2, 'english-category/pictures', 'com_content', 'Pictures', 'pictures', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 03:54:40', 0, '2015-05-31 03:54:40', 0, 'en-GB', 1),
(18, 70, 8, 54, 55, 2, 'english-category/contact-us', 'com_content', 'Contact us', 'contact-us', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 03:54:55', 0, '2015-05-31 03:54:55', 0, 'en-GB', 1),
(19, 71, 8, 56, 57, 2, 'english-category/about-us', 'com_content', 'About us', 'about-us', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 03:55:11', 0, '2015-05-31 03:55:11', 0, 'en-GB', 1),
(20, 72, 11, 61, 62, 3, 'ti-ng-vi-t-danh-m-c/s-n-ph-m/thi-t-b-cong-ngh', 'com_content', 'Thiết bị Công nghệ', 'thi-t-b-cong-ngh', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 04:08:36', 0, '2015-05-31 04:08:36', 0, 'vi-VN', 1),
(21, 73, 11, 63, 64, 3, 'ti-ng-vi-t-danh-m-c/s-n-ph-m/h-th-ng-ng-rac', 'com_content', 'Hệ thống Ống rác', 'h-th-ng-ng-rac', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 04:08:59', 0, '2015-05-31 04:08:59', 0, 'vi-VN', 1),
(22, 74, 11, 65, 66, 3, 'ti-ng-vi-t-danh-m-c/s-n-ph-m/cac-thi-t-b-khac', 'com_content', 'Các thiết bị khác', 'cac-thi-t-b-khac', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 04:09:19', 0, '2015-05-31 04:09:19', 0, 'vi-VN', 1),
(23, 75, 10, 13, 14, 3, 'english-category/products/technological-equipment', 'com_content', 'Technological equipment', 'technological-equipment', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 04:09:58', 0, '2015-05-31 04:09:58', 0, 'en-GB', 1),
(24, 76, 10, 15, 16, 3, 'english-category/products/garbage-duct-system', 'com_content', 'Garbage duct system', 'garbage-duct-system', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 04:10:33', 0, '2015-05-31 04:10:33', 0, 'en-GB', 1),
(25, 77, 10, 17, 18, 3, 'english-category/products/other-products', 'com_content', 'Other products', 'other-products', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-05-31 04:10:55', 0, '2015-05-31 04:10:55', 0, 'en-GB', 1),
(26, 115, 1, 79, 80, 1, 'category-pro-1', 'com_banners', 'Category pro 1', 'category-pro-1', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"images\\/banners\\/osmbanner1.png","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-01 15:22:26', 0, '2015-06-01 15:22:26', 0, '*', 1),
(27, 116, 1, 81, 82, 1, 'category-pro-2', 'com_banners', 'Category pro 2', 'category-pro-2', '', '', -2, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"images\\/banners\\/shop-ad-books.jpg","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-01 15:22:54', 0, '2015-06-01 15:22:54', 0, '*', 1),
(28, 126, 1, 83, 84, 1, 'cate-1', 'com_product', 'Cate 1', 'cate-1', '', '<p>Category 1</p>', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-02 16:27:12', 0, '2015-06-02 16:27:12', 0, '*', 1),
(29, 127, 1, 85, 86, 1, 'cate-2', 'com_product', 'Cate 2', 'cate-2', '', '<p><span style="font-size: 12.1599998474121px; line-height: 15.8079996109009px;">Category 2</span></p>', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-02 16:27:23', 0, '2015-06-02 16:27:23', 0, '*', 1),
(30, 130, 16, 33, 34, 3, 'english-category/products-reference/category-product-1', 'com_content', 'Industrial Flooring & Acid Proof', 'category-product-1', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-02 16:57:05', 471, '2015-06-05 14:50:33', 0, '*', 1),
(31, 132, 16, 31, 32, 3, 'english-category/products-reference/category-product-2', 'com_content', 'Sanishute Diposal System', 'category-product-2', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-02 16:59:03', 471, '2015-06-05 14:50:16', 0, '*', 1),
(32, 146, 16, 35, 36, 3, 'english-category/products-reference/entrance-carpet', 'com_content', 'Entrance Carpet', 'entrance-carpet', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-05 14:47:11', 471, '2015-06-05 14:51:50', 0, '*', 1),
(33, 147, 16, 37, 38, 3, 'english-category/products-reference/acrovyn-handrail-and-wallguard', 'com_content', 'Acrovyn Handrail and Wallguard', 'acrovyn-handrail-and-wallguard', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-05 14:47:19', 471, '2015-06-05 15:11:52', 0, '*', 1),
(34, 148, 16, 39, 40, 3, 'english-category/products-reference/expansion-joint-cover', 'com_content', 'Expansion Joint Cover', 'expansion-joint-cover', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-05 14:47:26', 471, '2015-06-05 14:52:27', 0, '*', 1),
(35, 149, 16, 41, 42, 3, 'english-category/products-reference/performance-louver', 'com_content', 'Performance Louver', 'performance-louver', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-05 14:47:33', 471, '2015-06-05 14:52:46', 0, '*', 1),
(36, 150, 16, 43, 44, 3, 'english-category/products-reference/explovent', 'com_content', 'Explovent', 'explovent', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-05 14:47:40', 471, '2015-06-05 14:53:06', 0, '*', 1),
(37, 151, 16, 45, 46, 3, 'english-category/products-reference/metal-roof-wall-cladding', 'com_content', 'Metal Roof & Wall Cladding', 'metal-roof-wall-cladding', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-05 14:47:46', 471, '2015-06-05 14:53:23', 0, '*', 1),
(38, 152, 16, 47, 48, 3, 'english-category/products-reference/toilet-partition', 'com_content', 'Toilet Partition', 'toilet-partition', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-05 14:47:53', 471, '2015-06-05 14:53:40', 0, '*', 1),
(39, 153, 16, 49, 50, 3, 'english-category/products-reference/drywall-and-ceiling', 'com_content', 'Drywall and Ceiling', 'drywall-and-ceiling', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-05 14:48:01', 471, '2015-06-05 14:53:57', 0, '*', 1),
(40, 163, 10, 19, 20, 3, 'english-category/products/metz-industrial-flooring-acid-proof-system-wide-application', 'com_content', 'METZ industrial flooring & acid proof system: wide application', 'metz-industrial-flooring-acid-proof-system-wide-application', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-06 14:20:01', 471, '2015-06-07 11:10:03', 0, 'en-GB', 1),
(41, 164, 10, 21, 22, 3, 'english-category/products/james-hardie-s-garbage-chute-drywall-ceiling-and-toilet-partition', 'com_content', 'JAMES HARDIE’s garbage chute, drywall, ceiling and toilet partition', 'james-hardie-s-garbage-chute-drywall-ceiling-and-toilet-partition', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-06 14:20:16', 0, '2015-06-06 14:20:16', 0, '*', 1),
(42, 165, 10, 23, 24, 3, 'english-category/products/specialized-products-ejc-performance-louvers-entrance-carpet-acrovyn-handrail-and-wallguard-explovent', 'com_content', 'Specialized products: EJC, Performance Louvers, Entrance Carpet, Acrovyn Handrail and Wallguard, Explovent.', 'specialized-products-ejc-performance-louvers-entrance-carpet-acrovyn-handrail-and-wallguard-explovent', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-06 14:20:37', 0, '2015-06-06 14:20:37', 0, '*', 1),
(43, 166, 10, 25, 26, 3, 'english-category/products/centria-s-metal-claddings-both-architectural-and-industrial-claddings-highrises-and-power-station-industrial-projects', 'com_content', 'CENTRIA’s metal claddings both architectural and industrial claddings : highrises and power station /industrial projects', 'centria-s-metal-claddings-both-architectural-and-industrial-claddings-highrises-and-power-station-industrial-projects', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-06 14:20:46', 0, '2015-06-06 14:20:46', 0, '*', 1),
(44, 167, 10, 27, 28, 3, 'english-category/products/trade-services-bmj-special-paper-and-indopoly-s-bopp', 'com_content', 'Trade services : BMJ special paper and INDOPOLY’s BOPP', 'trade-services-bmj-special-paper-and-indopoly-s-bopp', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-06 14:20:57', 0, '2015-06-06 14:20:57', 0, '*', 1),
(45, 179, 11, 67, 68, 3, 'ti-ng-vi-t-danh-m-c/s-n-ph-m/james-hardie-s-garbage-chute-drywall-ceiling-and-toilet-partition-2', 'com_content', 'Hệ thống nền công nghiệp và chống hóa chất METZ: được sử dụng rộng rãi ở nhiều khu vực', 'james-hardie-s-garbage-chute-drywall-ceiling-and-toilet-partition-2', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 471, '2015-06-07 11:09:26', 471, '2015-06-07 11:09:51', 0, 'vi-VN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vp_contact_details`
--

CREATE TABLE IF NOT EXISTS `vp_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vp_contact_details`
--

INSERT INTO `vp_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `sortname1`, `sortname2`, `sortname3`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`, `version`, `hits`) VALUES
(1, 'Liên hệ', 'lien-he', '', 'P12A12, nhà 17T10, Trung Hòa - Nhân Chính, Cầu Giấy, Hà Nội', '', '', '', '', '04.22115515', '04.62512000', '', '', 'vunguyenvipa@gmail.com', 0, 1, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_tags":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":false,"linkb_name":"","linkb":false,"linkc_name":"","linkc":false,"linkd_name":"","linkd":false,"linke_name":"","linke":false,"contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 471, 4, 1, '', '', '', '', '', 'vi-VN', '2015-05-31 10:09:48', 471, '', '2015-05-31 10:10:02', 471, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 32),
(2, 'Contact us', 'contact-us', '', 'P12A12, nhà 17T10, Trung Hòa - Nhân Chính, Cầu Giấy, Hà Nội', '', '', '', '', '04.22115515', '04.62512000', '', '', 'vunguyenvipa@gmail.com', 0, 1, 0, '0000-00-00 00:00:00', 2, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_tags":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":false,"linkb_name":"","linkb":false,"linkc_name":"","linkc":false,"linkd_name":"","linkd":false,"linke_name":"","linke":false,"contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 471, 4, 1, '', '', '', '', '', 'en-GB', '2015-05-31 10:11:45', 471, '', '2015-05-31 10:11:45', 0, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 45);

-- --------------------------------------------------------

--
-- Table structure for table `vp_content`
--

CREATE TABLE IF NOT EXISTS `vp_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `vp_content`
--

INSERT INTO `vp_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 58, 'Product 01', 'product-01', '<p>Product 1 description</p>', '', 1, 40, '2015-05-30 17:21:08', 471, '', '2015-06-06 14:35:52', 471, 0, '0000-00-00 00:00:00', '2015-05-30 17:21:08', '0000-00-00 00:00:00', '{"image_intro":"images\\/project\\/156_Shute.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 1, '', '', 1, 8, '{"robots":"","author":"","rights":"","xreference":""}', 0, 'en-GB', ''),
(2, 59, 'Sản phẩm 01', 's-n-ph-m-01', '<p>Mô tả sản phẩm 01</p>', '', 1, 11, '2015-05-30 17:21:23', 471, '', '2015-05-30 17:22:37', 471, 0, '0000-00-00 00:00:00', '2015-05-30 17:21:23', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, 'vi-VN', ''),
(3, 81, 'Giới thiệu', 'gioi-thieu', '<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: center; line-height: 130%;" align="center"><b><span lang="ES" style="font-size: 20.0pt; mso-bidi-font-size: 12.0pt; line-height: 130%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">THƯ NGỎ</span></b></p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: center; line-height: 130%;" align="center"><b><span lang="ES" style="font-size: 9.0pt; mso-bidi-font-size: 12.0pt; line-height: 130%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;"> </span></b></p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: justify; text-indent: .5in; line-height: 150%;"><b><i><span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">Quý khách hàng thân mến!</span></i></b></p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: justify; text-indent: .5in; line-height: 150%;"><b><i><span lang="ES" style="font-size: 1.0pt; mso-bidi-font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;"> </span></i></b></p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: justify; text-indent: .5in; line-height: 150%;"><span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;"> Trước tiên VIET PAN., JSC</span> <span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">xin gửi tới Quý khách hàng lời chúc tốt đẹp nhất, chúc hoạt động kinh doanh của Quý khách hàng ngày càng phát triển bền vững.</span></p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: justify; line-height: 150%;"><span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">        VIET PAN., JSC</span> <span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">là Công ty chuyên kinh doanh các mặt hàng như: Máy móc thiết bị công nghiệp, hạ tầng công nghệ thông tin (Bộ lưu điện UPS, Rack, PDU,…), nguyên vật liệu trong nghành công nghiệp sản xuất vật liệu Composite, gia công chế tạo các sản phẩm cơ khí chính xác, cơ khí công trình, thi công các công trình xây dựng dân dụng và công nghiệp ...</span></p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: justify; line-height: 150%;"><span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">          Với đội ngũ nhân viên chuyên nghiệp được đào tạo bài bản tại các trường Đại học, trường nghề trong và ngoài nước, các công ty chính hãng tại nước ngoài. Chúng tôi tin tưởng sẽ mang đến cho Quý khách hàng những sản phẩm và dịch vụ tốt nhất.</span></p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: justify; line-height: 150%;"><span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">          Phương châm hoạt động của Công ty: <b><i>“Luôn làm hài lòng khách hàng bằng chất lượng, thẩm mỹ, giá cả hợp lý, dịch vụ hoàn hảo sau bán hàng”</i></b></span></p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: justify; line-height: 150%;"><span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">           Với sản phẩm chất lượng cao, kết hợp với đội ngũ thiết kế chuyên nghiệp, nhân viên tư vấn, thiết kế có trình độ, nhiệt tình ... sẽ mang đến cho khách hàng những giải pháp tốt nhất, với chính sách tốt nhất.</span></p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: justify; line-height: 150%;"><span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">          Chúng tôi mong muốn với mỗi sản phẩm hay dịch vụ được cung cấp bởi </span><span lang="ES" style="font-size: 13.0pt; mso-bidi-font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">VIET PAN</span><span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;"> dù ở bất kỳ nơi nào trên lãnh thổ Việt Nam đều có chất lượng và dịch vụ hậu mãi hoàn hảo giống nhau.</span></p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: justify; line-height: 150%;"><span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">           Chúng tôi sẵn sàng cung cấp các sản phẩm, dịch vụ theo hình thức đấu thầu cạnh tranh.</span></p>\r\n<p> </p>\r\n<p class="MsoNormal" style="margin-bottom: .0001pt; text-align: justify; line-height: 150%;"><b><i><span lang="ES" style="font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;">           Trân trọng!</span></i></b></p>', '', 1, 15, '2015-05-31 09:41:08', 471, '', '2015-06-15 14:48:23', 471, 0, '0000-00-00 00:00:00', '2015-05-31 09:41:08', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 0, '', '', 1, 40, '{"robots":"","author":"","rights":"","xreference":""}', 0, 'vi-VN', ''),
(4, 82, 'About us', 'about-us', '<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b>THƯ NGỎ</b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b> </b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b>Quý khách hàng thân mến!</b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b> </b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b>Trước tiên VIET PAN., JSC xin gửi tới Quý khách hàng lời chúc tốt đẹp nhất, chúc hoạt động kinh doanh của Quý khách hàng ngày càng phát triển bền vững.</b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b> VIET PAN., JSC là Công ty chuyên kinh doanh các mặt hàng như: Máy móc thiết bị công nghiệp, hạ tầng công nghệ thông tin (Bộ lưu điện UPS, Rack, PDU,...), nguyên vật liệu trong nghành công nghiệp sản xuất vật liệu Composite, gia công chế tạo các sản phẩm cơ khí chính xác, cơ khí công trình, thi công các công trình xây dựng dân dụng và công nghiệp ...</b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b> Với đội ngũ nhân viên chuyên nghiệp được đào tạo bài bản tại các trường Đại học, trường nghề trong và ngoài nước, các công ty chính hãng tại nước ngoài. Chúng tôi tin tưởng sẽ mang đến cho Quý khách hàng những sản phẩm và dịch vụ tốt nhất.</b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b> Phương châm hoạt động của Công ty: “Luôn làm hài lòng khách hàng bằng chất lượng, thẩm mỹ, giá cả hợp lý, dịch vụ hoàn hảo sau bán hàng”</b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b> Với sản phẩm chất lượng cao, kết hợp với đội ngũ thiết kế chuyên nghiệp, nhân viên tư vấn, thiết kế có trình độ, nhiệt tình ... sẽ mang đến cho khách hàng những giải pháp tốt nhất, với chính sách tốt nhất.</b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b> Chúng tôi mong muốn với mỗi sản phẩm hay dịch vụ được cung cấp bởi VIET PAN dù ở bất kỳ nơi nào trên lãnh thổ Việt Nam đều có chất lượng và dịch vụ hậu mãi hoàn hảo giống nhau.</b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b> Chúng tôi sẵn sàng cung cấp các sản phẩm, dịch vụ theo hình thức đấu thầu cạnh tranh.</b></span></p>\r\n<p class="MsoHeader" style="text-align: center;" align="center"><span style="font-size: 26.6666660308838px; line-height: 34.6666641235352px;"><b> Trân trọng!</b></span></p>\r\n<p class="MsoHeader" style="text-align: center; line-height: 130%; tab-stops: .5in;" align="center"> </p>', '', 1, 19, '2015-05-31 09:45:33', 471, '', '2015-06-13 04:57:34', 471, 471, '2015-06-13 04:57:34', '2015-05-31 09:45:33', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, '', '', 1, 28, '{"robots":"","author":"","rights":"","xreference":""}', 0, 'en-GB', ''),
(5, 131, 'Prodcut 1', 'prodcut-1-1-1', '<p>Content here</p>', '', 1, 30, '2015-06-02 16:58:03', 471, '', '2015-06-05 15:46:33', 471, 0, '0000-00-00 00:00:00', '2015-06-02 16:58:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 1, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 133, 'Producct 2', 'producct-2-2-2', '<p><span style="font-size: 12.1599998474121px; line-height: 15.8079996109009px;">Content here</span></p>', '', 1, 31, '2015-06-02 17:00:00', 471, '', '2015-06-05 15:46:48', 471, 0, '0000-00-00 00:00:00', '2015-06-02 17:00:00', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 1, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(7, 134, 'Prodcut 3', 'prodcut-333', '<p><span style="font-size: 12.1599998474121px; line-height: 15.8079996109009px;">Content here</span></p>', '', -2, 31, '2015-06-02 17:01:26', 471, '', '2015-06-05 15:47:02', 471, 0, '0000-00-00 00:00:00', '2015-06-02 17:01:26', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(8, 154, 'Prodcut 4', 'prodcut-1-1-2', '<p><span style="font-size: 12.1599998474121px; line-height: 15.8079996109009px;">Content here</span></p>', '', -2, 30, '2015-06-02 16:58:03', 471, '', '2015-06-05 15:47:18', 471, 0, '0000-00-00 00:00:00', '2015-06-02 16:58:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(9, 155, 'Prodcut a', 'prodcut-a', '', '', 1, 32, '2015-06-02 16:58:03', 471, '', '2015-06-05 15:08:16', 0, 0, '0000-00-00 00:00:00', '2015-06-02 16:58:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(10, 156, 'Prodcut b', 'prodcut-b', '', '', 1, 33, '2015-06-02 16:58:03', 471, '', '2015-06-05 15:08:31', 0, 0, '0000-00-00 00:00:00', '2015-06-02 16:58:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(11, 157, 'Prodcut c', 'prodcut-c', '', '', 1, 34, '2015-06-02 16:58:03', 471, '', '2015-06-05 15:08:50', 0, 0, '0000-00-00 00:00:00', '2015-06-02 16:58:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(12, 158, 'Prodcut d', 'prodcut-d', '', '', 1, 35, '2015-06-02 16:58:03', 471, '', '2015-06-05 15:09:21', 0, 0, '0000-00-00 00:00:00', '2015-06-02 16:58:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(13, 159, 'Prodcut e', 'prodcut-e', '', '', 1, 36, '2015-06-02 16:58:03', 471, '', '2015-06-05 15:09:39', 0, 0, '0000-00-00 00:00:00', '2015-06-02 16:58:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(14, 160, 'Prodcut ff', 'prodcut-ff', '', '', 1, 37, '2015-06-02 16:58:03', 471, '', '2015-06-05 15:09:56', 0, 0, '0000-00-00 00:00:00', '2015-06-02 16:58:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(15, 161, 'Prodcut gg', 'prodcut-gg', '', '', 1, 38, '2015-06-02 16:58:03', 471, '', '2015-06-05 15:10:16', 0, 0, '0000-00-00 00:00:00', '2015-06-02 16:58:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(16, 162, 'Prodcut hh', 'prodcut-hh', '', '', 1, 39, '2015-06-02 16:58:03', 471, '', '2015-06-05 15:10:30', 0, 0, '0000-00-00 00:00:00', '2015-06-02 16:58:03', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(17, 168, 'Product 001', 'product-001', '<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"><span style="font-size: 16px;">Hệ thống ống thải rác SaniShute kết hợp giữa những thiết kế tiên tiến và chất liệu bền bỉ tạo nên hệ thống ống thải rác và ống thải đồ dơ hàng đầu thế giới . Hệ thống ống thải Sanishute là hệ thống hoàn chỉnh , thiết kế dựa theo nguyên lý trọng lực , đáp ứng các nhu cầu cho hệ thống nhà cao tầng</span></p>\r\n<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"><span style="font-size: 16px;">CÁCH ÂM : Hệ thống tường đặc của Sanishute giúp giảm thiểu tiếng ồng đáng kể từ các vật di chuyển trong ống so với các hệ thống ống mỏng khác . Khối lượng của hệ thống ống Sanishute làm giảm thiểu khả năng âm thanh có thể truyền qua  ống.</span></p>\r\n<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"><span style="font-size: 16px;">KHÔNG CÓ CHẤT ĐỘC HẠI : Hệ thống ống thải Sanishute làm từ hệ thống ống được gia cố của James Hardie với chất liệu làm từ xi măng pha sợi xenlulo được sản xuất với độ bền cao . Những hệ thống khác thường được làm từ thép và có thể bị ăn mòn theo thời gian</span></p>\r\n<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"><span style="font-size: 16px;">ĐỘ BỀN :  Hệ thống ống của Sanishute được làm từ bê tông gia cố và sợi xenlulo là cực kì bền bỉ .  Những ống này đã được thiết kế đặc biệt để chống lại lực va chạm từ các vật rơi và không bị mẻ hay vỡ trong quá trình sử dụng . Ngoài ra , hệ thống ống này còn giảm thiểu số lượng mối nối ,tạo nên bề mặt bằng phẳng bên trong để đảm bảo bề mặt bằng phẳng và không có lỗ hở.</span></p>\r\n<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"> </p>', '', 1, 40, '2015-06-06 14:23:52', 471, '', '2015-06-07 11:11:31', 471, 0, '0000-00-00 00:00:00', '2015-06-06 14:23:52', '0000-00-00 00:00:00', '{"image_intro":"images\\/project\\/156_Tam.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 4, '', '', 1, 25, '{"robots":"","author":"","rights":"","xreference":""}', 0, 'en-GB', ''),
(18, 169, 'Product 002', 'product-002', '<p><span style="font-size: 12.1599998474121px; line-height: 15.8079996109009px;">Product 002</span></p>', '', 1, 40, '2015-06-06 14:24:12', 471, '', '2015-06-06 14:36:38', 471, 0, '0000-00-00 00:00:00', '2015-06-06 14:24:12', '0000-00-00 00:00:00', '{"image_intro":"images\\/project\\/156_WC_pasteur_copy.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 2, '', '', 1, 6, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(19, 170, 'Product 003', 'product-003', '<p><span style="font-size: 12.1599998474121px; line-height: 15.8079996109009px;">Product 003</span></p>', '', 1, 41, '2015-06-06 14:24:38', 471, '', '2015-06-06 14:24:38', 0, 0, '0000-00-00 00:00:00', '2015-06-06 14:24:38', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(20, 171, 'Product 004', 'product-004', '<p><span style="font-size: 12.1599998474121px; line-height: 15.8079996109009px;">Product 004</span></p>', '', 1, 42, '2015-06-06 14:24:57', 471, '', '2015-06-06 14:24:57', 0, 0, '0000-00-00 00:00:00', '2015-06-06 14:24:57', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(21, 172, 'Product 005', 'product-005', '<p><span style="font-size: 12.1599998474121px; line-height: 15.8079996109009px;">Product 005</span></p>', '', 1, 43, '2015-06-06 14:25:14', 471, '', '2015-06-06 14:25:14', 0, 0, '0000-00-00 00:00:00', '2015-06-06 14:25:14', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(22, 173, 'Product 006', 'product-006', '<p><span style="font-size: 12.1599998474121px; line-height: 15.8079996109009px;">Product 006</span></p>', '', 1, 44, '2015-06-06 14:25:30', 471, '', '2015-06-06 14:25:30', 0, 0, '0000-00-00 00:00:00', '2015-06-06 14:25:30', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(23, 174, 'Product tttt', 't', '<p><span style="font-size: 12.1599998474121px; line-height: 15.8079996109009px;">Product 006ttttt</span></p>', '', 1, 40, '2015-06-06 14:25:30', 471, '', '2015-06-06 15:10:52', 471, 0, '0000-00-00 00:00:00', '2015-06-06 14:25:30', '0000-00-00 00:00:00', '{"image_intro":"images\\/advs\\/13.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 3, '', '', 1, 7, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(24, 180, 'Hệ thống sàn công nghiệp và chống ăn mòn', 'product-001-english', '<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"><span style="font-size: 16px;">Hệ thống ống thải rác SaniShute kết hợp giữa những thiết kế tiên tiến và chất liệu bền bỉ tạo nên hệ thống ống thải rác và ống thải đồ dơ hàng đầu thế giới . Hệ thống ống thải Sanishute là hệ thống hoàn chỉnh , thiết kế dựa theo nguyên lý trọng lực , đáp ứng các nhu cầu cho hệ thống nhà cao tầng</span></p>\r\n<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"><span style="font-size: 16px;">CÁCH ÂM : Hệ thống tường đặc của Sanishute giúp giảm thiểu tiếng ồng đáng kể từ các vật di chuyển trong ống so với các hệ thống ống mỏng khác . Khối lượng của hệ thống ống Sanishute làm giảm thiểu khả năng âm thanh có thể truyền qua  ống.</span></p>\r\n<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"><span style="font-size: 16px;">KHÔNG CÓ CHẤT ĐỘC HẠI : Hệ thống ống thải Sanishute làm từ hệ thống ống được gia cố của James Hardie với chất liệu làm từ xi măng pha sợi xenlulo được sản xuất với độ bền cao . Những hệ thống khác thường được làm từ thép và có thể bị ăn mòn theo thời gian</span></p>\r\n<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"><span style="font-size: 16px;">ĐỘ BỀN :  Hệ thống ống của Sanishute được làm từ bê tông gia cố và sợi xenlulo là cực kì bền bỉ .  Những ống này đã được thiết kế đặc biệt để chống lại lực va chạm từ các vật rơi và không bị mẻ hay vỡ trong quá trình sử dụng . Ngoài ra , hệ thống ống này còn giảm thiểu số lượng mối nối ,tạo nên bề mặt bằng phẳng bên trong để đảm bảo bề mặt bằng phẳng và không có lỗ hở.</span></p>\r\n<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"> </p>\r\n<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;">Tieng viet</p>', '', 1, 45, '2015-06-06 14:23:52', 471, '', '2015-06-07 11:11:15', 471, 0, '0000-00-00 00:00:00', '2015-06-06 14:23:52', '0000-00-00 00:00:00', '{"image_intro":"images\\/project\\/156_Tam.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, 'vi-VN', '');

-- --------------------------------------------------------

--
-- Table structure for table `vp_contentitem_tag_map`
--

CREATE TABLE IF NOT EXISTS `vp_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Table structure for table `vp_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `vp_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_content_rating`
--

CREATE TABLE IF NOT EXISTS `vp_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_content_types`
--

CREATE TABLE IF NOT EXISTS `vp_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `vp_content_types`
--

INSERT INTO `vp_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `vp_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `vp_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_categories`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` mediumtext,
  `parent_id` int(11) NOT NULL,
  `metatitle` varchar(255) DEFAULT NULL,
  `metakey` text,
  `metadesc` text,
  `published` int(11) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL,
  `params` text,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `vp_djc2_categories`
--

INSERT INTO `vp_djc2_categories` (`id`, `name`, `alias`, `description`, `parent_id`, `metatitle`, `metakey`, `metadesc`, `published`, `ordering`, `params`, `checked_out`, `checked_out_time`, `created`, `created_by`) VALUES
(1, 'Nguyên liệu Composite (FRP)', 'nguyen-lieu-composite-frp', '<p><span style="color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 20.7999992370605px;">Thông qua hệ thống phân phối toàn cầu , chúng tôi đảm bảo có thể cung cấp cho khách hàng tại bất kì thời điểm nào liên quan đến việc bảo hành – điều mà tạo nên sự khác biệt giữa Metz và các đối thủ cạnh tranh khác</span></p>', 0, '', '', '', 1, 1, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":""}', 0, '0000-00-00 00:00:00', '2015-06-13 02:00:09', 471),
(2, 'Hệ thống Ống thải rác', 'he-thong-ong-thai-rac', '<p><span style="color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 20.7999992370605px;">Thông qua hệ thống phân phối toàn cầu , chúng tôi đảm bảo có thể cung cấp cho khách hàng tại bất kì thời điểm nào liên quan đến việc bảo hành – điều mà tạo nên sự khác biệt giữa Metz và các đối thủ cạnh tranh khác</span></p>', 0, '', '', '', 1, 1, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":""}', 0, '0000-00-00 00:00:00', '2015-06-13 02:00:52', 471),
(3, 'Sợi thủy tinh', 'soi-thuy-tinh', '<p><span style="color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 20.7999992370605px;">Thông qua hệ thống phân phối toàn cầu , chúng tôi đảm bảo có thể cung cấp cho khách hàng tại bất kì thời điểm nào liên quan đến việc bảo hành – điều mà tạo nên sự khác biệt giữa Metz và các đối thủ cạnh tranh khác</span></p>', 1, '', '', '', 1, 2, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":""}', 0, '0000-00-00 00:00:00', '2015-06-13 02:01:31', 471),
(4, 'Nhựa Polyester', 'nhua-polyester', '<p><span style="color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 20.7999992370605px;">Thông qua hệ thống phân phối toàn cầu , chúng tôi đảm bảo có thể cung cấp cho khách hàng tại bất kì thời điểm nào liên quan đến việc bảo hành – điều mà tạo nên sự khác biệt giữa Metz và các đối thủ cạnh tranh khác</span></p>', 1, '', '', '', 1, 3, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":""}', 0, '0000-00-00 00:00:00', '2015-06-13 02:02:37', 471),
(5, 'Phụ gia khác', 'phu-gia-khac', '<p><span style="color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 20.7999992370605px;">Thông qua hệ thống phân phối toàn cầu</span></p>', 1, '', '', '', 1, 4, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":""}', 0, '0000-00-00 00:00:00', '2015-06-13 02:04:18', 471),
(6, 'Thiết bị Công nghiệp', 'thiet-bi-cong-nghiep', '<p><span style="color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 20.7999992370605px;">Thông qua hệ thống phân phối toàn cầu , chúng tôi đảm bảo có thể cung cấp cho khách hàng tại bất kì thời điểm nào liên quan đến việc bảo hành – điều mà tạo nên sự khác biệt giữa Metz và các đối thủ cạnh tranh khác</span></p>', 0, '', '', '', 1, 2, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":""}', 0, '0000-00-00 00:00:00', '2015-06-15 15:02:23', 471),
(7, 'Hạ tầng Công nghệ Thông tin', 'ha-tang-cong-nghe-thong-tin', '<p><span style="color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 20.7999992370605px;">Thông qua hệ thống phân phối toàn cầu , chúng tôi đảm bảo có thể cung cấp cho khách hàng tại bất kì thời điểm nào liên quan đến việc bảo hành – điều mà tạo nên sự khác biệt giữa Metz và các đối thủ cạnh tranh khác</span></p>', 0, '', '', '', 1, 3, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":""}', 0, '0000-00-00 00:00:00', '2015-06-15 15:02:46', 471),
(8, 'Phần mềm quản lý', 'phan-mem-quan-ly', '<p><span style="color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 20.7999992370605px;">Thông qua hệ thống phân phối toàn cầu , chúng tôi đảm bảo có thể cung cấp cho khách hàng tại bất kì thời điểm nào liên quan đến việc bảo hành – điều mà tạo nên sự khác biệt giữa Metz và các đối thủ cạnh tranh khác</span></p>', 0, '', '', '', 1, 4, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":""}', 0, '0000-00-00 00:00:00', '2015-06-15 15:03:03', 471);

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_files`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ext` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `fullpath` varchar(255) DEFAULT NULL,
  `caption` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_item` (`type`,`item_id`),
  KEY `item_type` (`item_id`,`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vp_djc2_files`
--

INSERT INTO `vp_djc2_files` (`id`, `item_id`, `type`, `fullname`, `name`, `ext`, `path`, `fullpath`, `caption`, `ordering`, `hits`) VALUES
(2, 2, 'item', 'thi-t-b-02.pdf', 'thi-t-b-02', 'pdf', 'item/0', 'item/0/thi-t-b-02.pdf', 'thi-t-b-02', 1, 2),
(3, 2, 'item', 'thi-t-b-02.1.pdf', 'thi-t-b-02.1', 'pdf', 'item/0', 'item/0/thi-t-b-02.1.pdf', 'thi-t-b-02.1', 2, 2),
(4, 1, 'item', 's-i-th-y-tinh-1.pdf', 's-i-th-y-tinh-1', 'pdf', 'item/0', 'item/0/s-i-th-y-tinh-1.pdf', 's-i-th-y-tinh-1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_images`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ext` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `fullpath` varchar(255) DEFAULT NULL,
  `caption` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_item` (`type`,`item_id`),
  KEY `item_type` (`item_id`,`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `vp_djc2_images`
--

INSERT INTO `vp_djc2_images` (`id`, `item_id`, `type`, `fullname`, `name`, `ext`, `path`, `fullpath`, `caption`, `ordering`) VALUES
(1, 1, 'category', 'thi-t-b-va-cong-ngh.jpg', 'thi-t-b-va-cong-ngh', 'jpg', 'category/0', 'category/0/thi-t-b-va-cong-ngh.jpg', 'thi-t-b-va-cong-ngh', 1),
(2, 2, 'category', 'thi-t-b.jpg', 'thi-t-b', 'jpg', 'category/0', 'category/0/thi-t-b.jpg', 'thi-t-b', 1),
(3, 3, 'category', 'h-th-ng-ng-rac.jpg', 'h-th-ng-ng-rac', 'jpg', 'category/0', 'category/0/h-th-ng-ng-rac.jpg', 'h-th-ng-ng-rac', 1),
(4, 4, 'category', 'ng-d-ng-ph-n-m-m.jpg', 'ng-d-ng-ph-n-m-m', 'jpg', 'category/0', 'category/0/ng-d-ng-ph-n-m-m.jpg', 'ng-d-ng-ph-n-m-m', 1),
(5, 5, 'category', 'cac-thi-t-b-khac.jpg', 'cac-thi-t-b-khac', 'jpg', 'category/0', 'category/0/cac-thi-t-b-khac.jpg', 'cac-thi-t-b-khac', 1),
(6, 1, 'item', 'thi-t-b-01.jpg', 'thi-t-b-01', 'jpg', 'item/0', 'item/0/thi-t-b-01.jpg', '', 1),
(7, 1, 'item', 'thi-t-b-01.1.jpg', 'thi-t-b-01.1', 'jpg', 'item/0', 'item/0/thi-t-b-01.1.jpg', '', 2),
(8, 1, 'item', 'thi-t-b-01.2.jpg', 'thi-t-b-01.2', 'jpg', 'item/0', 'item/0/thi-t-b-01.2.jpg', '', 3),
(9, 2, 'item', 'thi-t-b-02.jpg', 'thi-t-b-02', 'jpg', 'item/0', 'item/0/thi-t-b-02.jpg', 'thi-t-b-02', 1),
(10, 2, 'item', 'thi-t-b-02.1.jpg', 'thi-t-b-02.1', 'jpg', 'item/0', 'item/0/thi-t-b-02.1.jpg', 'thi-t-b-02.1', 2),
(11, 2, 'item', 'thi-t-b-02.2.jpg', 'thi-t-b-02.2', 'jpg', 'item/0', 'item/0/thi-t-b-02.2.jpg', 'thi-t-b-02.2', 3),
(12, 2, 'item', 'thi-t-b-02.3.jpg', 'thi-t-b-02.3', 'jpg', 'item/0', 'item/0/thi-t-b-02.3.jpg', 'thi-t-b-02.3', 4),
(13, 2, 'item', 'thi-t-b-02.4.jpg', 'thi-t-b-02.4', 'jpg', 'item/0', 'item/0/thi-t-b-02.4.jpg', 'thi-t-b-02.4', 5),
(14, 6, 'category', 'thi-t-b-cong-nghi-p.jpg', 'thi-t-b-cong-nghi-p', 'jpg', 'category/0', 'category/0/thi-t-b-cong-nghi-p.jpg', 'thi-t-b-cong-nghi-p', 1),
(15, 7, 'category', 'h-t-ng-cong-ngh-thong-tin.jpg', 'h-t-ng-cong-ngh-thong-tin', 'jpg', 'category/0', 'category/0/h-t-ng-cong-ngh-thong-tin.jpg', 'h-t-ng-cong-ngh-thong-tin', 1),
(16, 8, 'category', 'ph-n-m-m-qu-n-ly.jpg', 'ph-n-m-m-qu-n-ly', 'jpg', 'category/0', 'category/0/ph-n-m-m-qu-n-ly.jpg', 'ph-n-m-m-qu-n-ly', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_items`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `producer_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` mediumtext,
  `intro_desc` text,
  `price` decimal(12,2) DEFAULT NULL,
  `special_price` decimal(12,2) DEFAULT NULL,
  `metatitle` varchar(255) DEFAULT NULL,
  `metakey` text,
  `metadesc` text,
  `published` int(11) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `featured` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vp_djc2_items`
--

INSERT INTO `vp_djc2_items` (`id`, `group_id`, `cat_id`, `producer_id`, `name`, `alias`, `description`, `intro_desc`, `price`, `special_price`, `metatitle`, `metakey`, `metadesc`, `published`, `ordering`, `featured`, `params`, `checked_out`, `checked_out_time`, `created`, `created_by`) VALUES
(1, 0, 3, 0, 'Sợi thủy tinh 1', 's-i-th-y-tinh-1', '<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"><span style="font-size: 16px;">Hệ thống tấm ốp tường trong đem lại nền mống vững chắc đem lại bề mặt hoàn thiện chắc chắn , chống va đập và chống ẩm . Tấm ốp có thể hoàn thiện bằng sơn , giấy gián tường hoặc thậm chí bằng gạch để có thể phối hợp tạo nên nhiều hình dạng khác nhau.</span></p>\r\n<p style="margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;"><span style="font-size: 16px;">Với độ chống va đập cao, sản phẩm có thể phù hợp với những khu vực có mật độ người di chuyển cao như những dự án dân dụng hay thương mại .  Với khả năng chống ẩm cao , sản phẩm còn có thể ứng dựng cho khu vực nhà tắm , phòng giặt hay bếp.</span></p>', '<p><span style="color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 20.7999992370605px;">Để đạt được hiệu quả tối ưu , hệ thống vách ngăn của James Hardie đã thiết kế đặc biệt sử dụng tấm fibrecement 18mm chuyên dụng . Hệ thống vách ngăn nhà vệ sinh được thiết kế đặc biệt để đáp ứng được những yêu cầu cao nhất trong môi trường ẩm ướt cao . Đó cũng là lý do chính mà hệ thống vách ngăn nhà vệ sinh là lựa chọn số 1 đối với các nhà đầu tư , ứng dụng đa dạng cho nhiều công trình như trung tâm thương mại , bệnh viện , trung tâm thể dục thể thao,…..</span></p>', 0.00, 0.00, '', '', '', 1, 1, 0, '{"show_contact_form":"","comments":"","price_restrict":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":""}', 0, '0000-00-00 00:00:00', '2015-06-13 02:08:18', 471),
(2, 0, 2, 0, 'Thiết bị 02', 'thi-t-b-02', '<p>Thiết bị 02 chi tiết</p>', '<p>Thiết bị 02 mô tả</p>', 0.00, 0.00, '', '', '', 1, 2, 0, '{"show_contact_form":"","comments":"","price_restrict":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":""}', 0, '0000-00-00 00:00:00', '2015-06-13 02:12:20', 471);

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_items_categories`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_items_categories` (
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`item_id`),
  UNIQUE KEY `item_category` (`item_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vp_djc2_items_categories`
--

INSERT INTO `vp_djc2_items_categories` (`item_id`, `category_id`) VALUES
(2, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_items_extra_fields`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_items_extra_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `imagelabel` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL,
  `filterable` int(11) NOT NULL,
  `searchable` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `required` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_items_extra_fields_groups`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_items_extra_fields_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_items_extra_fields_options`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_items_extra_fields_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_items_extra_fields_values_date`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_items_extra_fields_values_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_field` (`item_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_items_extra_fields_values_int`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_items_extra_fields_values_int` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_field` (`item_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_items_extra_fields_values_text`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_items_extra_fields_values_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_field` (`item_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_items_related`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_items_related` (
  `item_id` int(11) NOT NULL,
  `related_item` int(11) NOT NULL,
  PRIMARY KEY (`related_item`,`item_id`),
  UNIQUE KEY `item_related` (`item_id`,`related_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_djc2_producers`
--

CREATE TABLE IF NOT EXISTS `vp_djc2_producers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` mediumtext,
  `metatitle` varchar(255) DEFAULT NULL,
  `metakey` text,
  `metadesc` text,
  `published` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_extensions`
--

CREATE TABLE IF NOT EXISTS `vp_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46106 ;

--
-- Dumping data for table `vp_extensions`
--

INSERT INTO `vp_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1","upload_limit":"8","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","info_block_position":"0","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_tags":"1","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","urls_position":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"none","category_layout":"_:blog","show_category_heading_title_text":"1","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"0","num_intro_articles":"4","num_columns":"4","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_featured":"show","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 0, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":"","filename":"simplepie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"7ff8e5afccb4f51908045ccfe7f2d353"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"IDNA Convert","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-03-11 11:59:00","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.2","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'PHPass', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"PHPass","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2014","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com","version":"4.1.7","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"mode":"1","skin":"0","mobile":"0","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","html_height":"550","html_width":"750","resizing":"1","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","colors":"1","table":"1","smilies":"1","hr":"1","link":"1","media":"1","print":"1","directionality":"1","fullscreen":"1","alignment":"1","visualchars":"1","visualblocks":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0);
INSERT INTO `vp_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 1, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.1","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.1","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"March 2015","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.1","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'Vietnamese-VN', 'language', 'vi-VN', '', 0, 1, 0, 0, '{"name":"Vietnamese-VN","type":"language","creationDate":"December 2013","author":"Vietnamese Translation Team Translation Team","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"info@joomlaviet.info","authorUrl":"http:\\/\\/joomlaviet.info","version":"3.2.1.1","description":"Vietnamese language pack for Joomla! 3.2","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'Vietnamese-VN', 'language', 'vi-VN', '', 1, 1, 0, 0, '{"name":"Vietnamese-VN","type":"language","creationDate":"December 2013","author":"Vietnamese Translation Team","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"info@joomlaviet.info","authorUrl":"http:\\/\\/joomlaviet.info","version":"3.2.1.1","description":"Vietnamese administration language for Joomla! 3.2","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'Vietnamese Language Pack', 'package', 'pkg_vi-VN', '', 0, 1, 1, 0, '{"name":"Vietnamese Language Pack","type":"package","creationDate":"December 2013","author":"Vietnamese Translation Team","copyright":"Copyright (C) 2013 joomlaviet.info and Open Source Matters. All rights reserved.","authorEmail":"info@joomlaviet.info","authorUrl":"http:\\/\\/joomlaviet.info","version":"3.2.1.1","description":"3.2.1.1 Joomla Vietnamese Language Package","group":"","filename":"pkg_vi-VN"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'MOD_BACKENDLANGUAGESWITCHER', 'module', 'mod_backendlanguageswitcher', '', 1, 1, 2, 0, '{"name":"MOD_BACKENDLANGUAGESWITCHER","type":"module","creationDate":"2015-02-02","author":"Viktor Vogel","copyright":"Copyright 2015 Viktor Vogel. All rights reserved.","authorEmail":"admin@kubik-rubik.de","authorUrl":"https:\\/\\/joomla-extensions.kubik-rubik.de\\/","version":"3-3","description":"MOD_BACKENDLANGUAGESWITCHER_XML_DESCRIPTION","group":"","filename":"mod_backendlanguageswitcher"}', '{"donation_code":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'T3 Framework', 'plugin', 't3', 'system', 0, 1, 1, 0, '{"name":"T3 Framework","type":"plugin","creationDate":"April 3, 2015","author":"JoomlArt.com","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"info@joomlart.com","authorUrl":"http:\\/\\/www.t3-framework.org","version":"2.4.8","description":"\\n\\t\\n\\t<div align=\\"center\\">\\n\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<a href=\\"http:\\/\\/t3-framework.org\\/\\"><img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/jat3v3-documents\\/message-installation\\/logo.png\\" alt=\\"some_text\\" width=\\"300\\" height=\\"99\\"><\\/a>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/t3-framework.org\\/\\" title=\\"\\">Home<\\/a> | <a href=\\"http:\\/\\/demo.t3-framework.org\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/t3-framework.org\\/documentation\\" title=\\"\\">Document<\\/a> | <a href=\\"https:\\/\\/github.com\\/t3framework\\/t3\\/blob\\/master\\/CHANGELOG.md\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t<p> <\\/p>\\n\\t\\t<p>Copyright 2004 - 2015 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n     <style>table.adminform{width: 100%;}<\\/style>\\n\\t <\\/div>\\n\\t\\t\\n\\t","group":"","filename":"t3"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 'FavSlider Responsive Slideshow', 'module', 'mod_favslider', '', 0, 1, 0, 0, '{"name":"FavSlider Responsive Slideshow","type":"module","creationDate":"2013","author":"FavThemes","copyright":"Copyright (C) FavThemes. All rights reserved.","authorEmail":"","authorUrl":"http:\\/\\/www.favthemes.com","version":"1.7","description":"\\n\\t\\n\\n<a href=\\"http:\\/\\/extensions.favthemes.com\\/favslider\\" target=\\"_blank\\"><strong>FavSlider<\\/strong><\\/a> is a free responsive Joomla! module that let''s you use images and video to create a slideshow with 4 default layouts and customize each slide with 100+ module parameters.\\n\\nFor more info, please see the <a href=\\"http:\\/\\/extensions.favthemes.com\\/favslider\\" target=\\"_blank\\" style=\\"font-weight: bold;\\">demo and documentation<\\/a> for the FavSlider module.\\n<br\\/><br\\/>\\n\\n<a href=\\"http:\\/\\/extensions.favthemes.com\\/favslider\\" target=\\"_blank\\">\\n\\t<img src=\\"..\\/modules\\/mod_favslider\\/theme\\/img\\/favslider.jpg\\" alt=\\"FavSlider Reponsive Slideshow\\">\\n<\\/a>\\n\\n<br\\/><br\\/>\\nCopyright &#169; 2012-2015 <a href=\\"http:\\/\\/www.favthemes.com\\" target=\\"_blank\\" style=\\"font-weight: bold;\\">FavThemes<\\/a>.\\n<br\\/><br\\/>\\n\\n<link rel=\\"stylesheet\\" href=\\"..\\/modules\\/mod_favslider\\/theme\\/css\\/admin.css\\" type=\\"text\\/css\\" \\/>\\n<script src=\\"..\\/modules\\/mod_favslider\\/theme\\/js\\/jscolor\\/jscolor.js\\" type=\\"text\\/javascript\\"><\\/script>\\n\\n\\t","group":"","filename":"mod_favslider"}', '{"sliderType":"slidernav","jqueryLoad":"1","animationEffect":"slide","slideHeight":"","thumbHeight":"","linkTarget":"self","arrowNav":"1","arrowNavStyle":"dark-arrows","controlNav":"1","slideshow":"0","randomize":"0","animationLoop":"1","pauseOnHover":"1","keyboardNav":"1","mousewheel":"0","slideshowSpeed":"7000","captionHide":"visible","layoutEffect":"layout-effect1","captionTextAlign":"favalign-left","captionStyle":"favstyle-default","captionBgStyle":"favstyle-bg-dark","captionWidth":"","captionHeight":"","captionTitleGoogleFont":"Open Sans","captionTitleFontSize":"","captionTitleTextTransform":"uppercase","captionTitlePadding":"","captionTitleMargin":"","captionDescriptionGoogleFont":"Open Sans","captionDescriptionFontSize":"","captionReadMoreColor":"","captionReadMoreBgColor":"","captionReadMoreGoogleFont":"Open Sans","captionReadMorePadding":"","captionReadMoreMargin":"","file1active":"1","file1type":"image","file1":"media\\/favslider\\/demo\\/slide1.jpg","file1link":"","file1favtitle":"","file1favdescription":"","file2active":"1","file2type":"image","file2":"media\\/favslider\\/demo\\/slide2.jpg","file3active":"1","file3type":"image","file3":"media\\/favslider\\/demo\\/slide3.jpg","file4active":"1","file4type":"image","file4":"media\\/favslider\\/demo\\/slide4.jpg","file5active":"1","file5type":"image","file5":"media\\/favslider\\/demo\\/slide5.jpg","file6active":"0","file6type":"image","file6":"","file7active":"0","file7type":"image","file7":"","file8active":"0","file8type":"image","file8":"","file9active":"0","file9type":"image","file9":"","file10active":"0","file10type":"image","file10":"","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 'plg_system_sl_scrolltotop', 'plugin', 'sl_scrolltotop', 'system', 0, 1, 1, 0, '{"name":"plg_system_sl_scrolltotop","type":"plugin","creationDate":"January 2012","author":"Pham Minh Tuan","copyright":"Copyright (c) 2013 Skyline. All rights reserved.","authorEmail":"admin@extstore.com","authorUrl":"http:\\/\\/extstore.com","version":"2.0.0","description":"\\n\\t\\n\\t\\tSkyline Scroll To Top Plugin For Joomla 1.7+<br \\/><br \\/>Developed by Skyline Software (<a target=\\"_blank\\" href=\\"http:\\/\\/extstore.com\\">http:\\/\\/extstore.com<\\/a>).\\n\\t\\n\\t","group":"","filename":"sl_scrolltotop"}', '{"admin_enable":"1","engine":"mootools","image":"images\\/tumblr_l60v2kmTYF1qzn9g8o1_500.png","text":"","title":"","background_color":"#ffffff","color":"#ffffff","hover_background_color":"#ffffff","hover_color":"#ffffff","position":"bottom_right","border_radius":"8","offset_x":"20","offset_y":"20","padding_x":"0","padding_y":"0","duration":"500","transition":"Fx.Transitions.linear","custom_css":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10010, 'Simple Responsive Slideshow', 'module', 'mod_simple_responsive_slideshow', '', 0, 1, 0, 0, '{"name":"Simple Responsive Slideshow","type":"module","creationDate":"2013","author":"FavThemes","copyright":"Copyright (C) FavThemes. All rights reserved.","authorEmail":"","authorUrl":"http:\\/\\/www.favthemes.com","version":"2.4","description":"\\n\\t\\n\\n<a href=\\"http:\\/\\/extensions.favthemes.com\\/simple-responsive-slideshow\\" target=\\"_blank\\"><strong>Simple Responsive Slideshow<\\/strong><\\/a> is a free responsive Joomla! module that let''s you upload up to 10 images to create a slideshow and customize each slide.\\n<br\\/>\\nFor more info, please see the <a href=\\"http:\\/\\/extensions.favthemes.com\\/simple-responsive-slideshow\\" target=\\"_blank\\" style=\\"font-weight: bold;\\">demo and documentation<\\/a> for the Simple Responsive Slideshow module.\\n<br\\/><br\\/>\\n\\n<a href=\\"http:\\/\\/extensions.favthemes.com\\/simple-responsive-slideshow\\" target=\\"_blank\\">\\n\\t<img src=\\"..\\/modules\\/mod_simple_responsive_slideshow\\/theme\\/img\\/simple-responsive-slideshow.jpg\\" alt=\\"Simple Reponsive Slideshow\\">\\n<\\/a>\\n\\n<br\\/><br\\/>\\nCopyright &#169; 2012-2015 <a href=\\"http:\\/\\/www.favthemes.com\\" target=\\"_blank\\" style=\\"font-weight: bold;\\">FavThemes<\\/a>.\\n<br\\/><br\\/>\\n\\n<link rel=\\"stylesheet\\" href=\\"..\\/modules\\/mod_simple_responsive_slideshow\\/theme\\/css\\/admin.css\\" type=\\"text\\/css\\" \\/>\\n<script src=\\"..\\/modules\\/mod_simple_responsive_slideshow\\/theme\\/js\\/jscolor\\/jscolor.js\\" type=\\"text\\/javascript\\"><\\/script>\\n\\n\\t","group":"","filename":"mod_simple_responsive_slideshow"}', '{"jqueryLoad":"1","animation":"fade","slideDirection":"horizontal","slideshowSpeed":"7000","animationDuration":"600","flexsliderBgColor":"#ffffff","directionNav":"1","controlNav":"1","slideshow":"1","randomize":"0","animationLoop":"1","pauseOnAction":"1","pauseOnHover":"1","keyboardNav":"1","mousewheel":"0","file1active":"1","file1":"media\\/simple-responsive-slideshow\\/demo\\/slide1.jpg","file2active":"1","file2":"media\\/simple-responsive-slideshow\\/demo\\/slide2.jpg","file3active":"1","file3":"media\\/simple-responsive-slideshow\\/demo\\/slide3.jpg","file4active":"1","file4":"media\\/simple-responsive-slideshow\\/demo\\/slide4.jpg","file5active":"1","file5":"media\\/simple-responsive-slideshow\\/demo\\/slide5.jpg","file6active":"0","file7active":"0","file8active":"0","file9active":"0","file10active":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10011, 'plg_content_attachments', 'plugin', 'attachments', 'content', 0, 1, 1, 0, '{"name":"plg_content_attachments","type":"plugin","creationDate":"March 20, 2015","author":"Jonathan M. Cameron","copyright":"(C) 2007-2015 Jonathan M. Cameron. All rights reserved.","authorEmail":"jmcameron@jmcameron.net","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/attachments\\/","version":"3.2.3","description":"ATTACH_ATTACHMENTS_PLUGIN_DESCRIPTION","group":"","filename":"attachments"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10012, 'plg_search_attachments', 'plugin', 'attachments', 'search', 0, 1, 1, 0, '{"name":"plg_search_attachments","type":"plugin","creationDate":"March 20, 2015","author":"Jonathan M. Cameron","copyright":"(C) 2007-2015 Jonathan M. Cameron. All rights reserved.","authorEmail":"jmcameron@jmcameron.net","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/attachments\\/","version":"3.2.3","description":"ATTACH_ATTACHMENTS_SEARCH_PLUGIN_DESCRIPTION","group":"","filename":"attachments"}', '{"search_limit":"50"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10013, 'plg_attachments_plugin_framework', 'plugin', 'attachments_plugin_framework', 'attachments', 0, 1, 1, 0, '{"name":"plg_attachments_plugin_framework","type":"plugin","creationDate":"March 20, 2015","author":"Jonathan M. Cameron","copyright":"(C) 2009-2015 Jonathan M. Cameron. All rights reserved.","authorEmail":"jmcameron@jmcameron.net","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/attachments\\/","version":"3.2.3","description":"ATTACH_ATTACHMENTS_FOR_COMPONENTS_PLUGIN_FRAMEWORK_DESCRIPTION","group":"","filename":"attachments_plugin_framework"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10014, 'plg_attachments_for_content', 'plugin', 'attachments_for_content', 'attachments', 0, 1, 1, 0, '{"name":"plg_attachments_for_content","type":"plugin","creationDate":"March 20, 2015","author":"Jonathan M. Cameron","copyright":"(C) 2009-2015 Jonathan M. Cameron. All rights reserved.","authorEmail":"jmcameron@jmcameron.net","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/attachments\\/","version":"3.2.3","description":"ATTACH_ATTACHMENTS_FOR_CONTENT_PLUGIN_DESCRIPTION","group":"","filename":"attachments_for_content"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10015, 'plg_system_show_attachments_in_editor', 'plugin', 'show_attachments', 'system', 0, 1, 1, 0, '{"name":"plg_system_show_attachments_in_editor","type":"plugin","creationDate":"March 20, 2015","author":"Jonathan M. Cameron","copyright":"(C) 2011-2015 Jonathan M. Cameron. All rights reserved.","authorEmail":"jmcameron@jmcameron.net","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/attachments\\/","version":"3.2.3","description":"ATTACH_SHOW_ATTACHMENTS_IN_EDITOR_PLUGIN_DESCRIPTION","group":"","filename":"show_attachments"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10016, 'plg_editors-xtd_add_attachment_btn', 'plugin', 'add_attachment', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_add_attachment_btn","type":"plugin","creationDate":"March 20, 2015","author":"Jonathan M. Cameron","copyright":"(C) 2007-2015 Jonathan M. Cameron. All rights reserved.","authorEmail":"jmcameron@jmcameron.net","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/attachments\\/","version":"3.2.3","description":"ATTACH_ADD_ATTACHMENT_BUTTON_PLUGIN_DESCRIPTION","group":"","filename":"add_attachment"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10017, 'plg_editors-xtd_insert_attachments_token_btn', 'plugin', 'insert_attachments_token', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_insert_attachments_token_btn","type":"plugin","creationDate":"March 20, 2015","author":"Jonathan M. Cameron","copyright":"(C) 2007-2015 Jonathan M. Cameron. All rights reserved.","authorEmail":"jmcameron@jmcameron.net","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/attachments\\/","version":"3.2.3","description":"ATTACH_INSERT_ATTACHMENTS_TOKEN_BUTTON_PLUGIN_DESCRIPTION","group":"","filename":"insert_attachments_token"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10018, 'plg_quickicon_attachments', 'plugin', 'attachments', 'quickicon', 0, 1, 1, 0, '{"name":"plg_quickicon_attachments","type":"plugin","creationDate":"March 20, 2015","author":"Jonathan M. Cameron","copyright":"(C) 2007-2015 Jonathan M. Cameron. All rights reserved.","authorEmail":"jmcameron@jmcameron.net","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/attachments\\/","version":"3.2.3","description":"PLG_QUICKICON_ATTACHMENTS_XML_DESCRIPTION","group":"","filename":"attachments"}', '{"context":"mod_quickicon"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10019, 'com_attachments', 'component', 'com_attachments', '', 1, 1, 0, 0, '{"name":"com_attachments","type":"component","creationDate":"March 20, 2015","author":"Jonathan M. Cameron","copyright":"(C) 2007-2015 Jonathan M. Cameron. All rights reserved.","authorEmail":"jmcameron@jmcameron.net","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/attachments3\\/","version":"3.2.3","description":"ATTACH_ATTACHMENTS_COMPONENT_DESCRIPTION","group":"","filename":"attachments"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10020, 'pkg_attachments', 'package', 'pkg_attachments', '', 0, 1, 1, 0, '{"name":"pkg_attachments","type":"package","creationDate":"March 20, 2015","author":"Jonathan M. Cameron","copyright":"(C) 2007-2015 Jonathan M. Cameron. All rights reserved.","authorEmail":"jmcameron@jmcameron.net","authorUrl":"http:\\/\\/joomlacode.org\\/gf\\/project\\/attachments\\/","version":"3.2.3","description":"ATTACH_PACKAGE_ATTACHMENTS_FOR_JOOMLA_16PLUS","group":"","filename":"pkg_attachments"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10030, 'plg_search_joomgallery', 'plugin', 'joomgallery', 'search', 0, 1, 1, 0, '{"name":"plg_search_joomgallery","type":"plugin","creationDate":"25.06.2013","author":"JoomGallery::Project Team","copyright":"(C) 2009 - 2013 JoomGallery::Project Team","authorEmail":"team@joomgallery.net","authorUrl":"www.joomgallery.net","version":"3.1 BETA","description":"PLG_SEARCH_JOOMGALLERY_DESC","group":"","filename":"joomgallery"}', '{"search_limit":"0","search_itemid":"","search_mode":"0","search_hidden":"0","search_tmpl_overwrite":"0","search_img_description":"1","search_img_comment":"0","search_img_author":"0","search_img_owner":"0","search_cat_description":"0","search_cat_owner":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10033, 'PLG_JOOMAUTOCAT', 'plugin', 'joomautocat', 'user', 0, 1, 1, 0, '{"name":"PLG_JOOMAUTOCAT","type":"plugin","creationDate":"11.03.2013","author":"Patrick (aka Chraneco)","copyright":"Copyright (C) 2009 - 2013 Open Source Matters. All rights reserved.","authorEmail":"chraneco@joomgallery.net","authorUrl":"www.joomgallery.net","version":"3.0","description":"PLG_JOOMAUTOCAT_DESC","group":"","filename":"joomautocat"}', '{"parent":"","published":"1","access":"1","onlogin":"1","categoryname":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10034, 'Migration Script from JoomGallery 1.5.7 to JoomGallery 3 JUX', 'file', 'MigrationScriptfromJoomGallery1.5.7toJoomGallery3JUX', '', 0, 1, 0, 0, '{"name":"Migration Script from JoomGallery 1.5.7 to JoomGallery 3 JUX","type":"file","creationDate":"2013\\/05\\/14","author":"JoomGallery::ProjectTeam","copyright":"This component is released under the GNU\\/GPL License","authorEmail":"team@joomgallery.net","authorUrl":"http:\\/\\/www.joomgallery.net","version":"3.0","description":"This script is able to migrate JoomGallery 1.5.7 to JoomGallery 3 JUX.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10052, 'com_phocagallery', 'component', 'com_phocagallery', '', 1, 1, 0, 0, '{"name":"com_phocagallery","type":"component","creationDate":"21\\/10\\/2014","author":"Jan Pavelka (www.phoca.cz)","copyright":"Jan Pavelka","authorEmail":"","authorUrl":"www.phoca.cz","version":"4.1.2","description":"Phoca Gallery","group":"","filename":"phocagallery"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10053, 'MyLiveChat', 'module', 'mod_mylivechat', '', 0, 1, 0, 0, '{"name":"MyLiveChat","type":"module","creationDate":"July 9, 2013","author":"MyLiveChat.com","copyright":"Copyright (C) 2013 MyLiveChat.com","authorEmail":"info@mylivechat.com","authorUrl":"www.mylivechat.com","version":"2.0.0","description":"\\n    My LiveChat is a fast, high performance and most user-friendly live chat solution. It allows you to live chat with website visitors, monitor site traffic, and analyze visitors web activities, including their search engine and keyword usage.\\n  ","group":"","filename":"mod_mylivechat"}', '{"mylivechat_id":"0","@spacer":"","mylivechat_displaytype":"inline","@spacer2":"","mylivechat_membership":"no","mylivechat_encrymode":"none","mylivechat_encrykey":"","@spacer3":"","@spacer4":"","@spacer5":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10054, 'Visitors Counter', 'module', 'mod_vvisit_counter', '', 0, 1, 0, 0, '{"name":"Visitors Counter","type":"module","creationDate":"2014-11-01","author":"Majunke Michael","copyright":"Copyright (C) 2014 Majunke Michael. All rights reserved.","authorEmail":"majunke@mmajunke.de","authorUrl":"http:\\/\\/www.mmajunke.de\\/","version":"2.0.4","description":"\\n\\t\\t<h3>Visitors Counter - by Majunke Michael<\\/h3>\\n\\t\\t<h3>Version for Joomla 3<\\/h3>\\n\\t\\t<p>Release date: <b>2014-11-01<\\/b><\\/p>\\n\\t\\t<p>Homepage: <b><a href=\\"http:\\/\\/www.mmajunke.de\\" title=\\"www.mmajunke.de\\" target=\\"_blank\\">http:\\/\\/www.mmajunke.de\\/<\\/a><\\/b><\\/p>\\n\\t\\t<p>This module shows you the Visitors of your site and much more :)<\\/p>\\n\\t\\t<p>\\n\\t    License Information Since 1.9.3 :<br\\/>\\n\\t       If you would use the IP-Flags\\/IP-Country Features, read license information\\n           from http:\\/\\/ip-to-country.webhosting.info !\\n\\t\\t<\\/p>\\n\\t\\t<p>\\n\\t\\t  If you had some fun around the counter or perhaps even used my counter\\n          for your own projects - <b>PLEASE<\\/b> take a minute to think about\\n          <a href=\\"http:\\/\\/www.mmajunke.de\\/jn\\/index.php\\/technik\\/entwicklunglk\\/modvvisitcounterdl.html#Spende\\">Donating<\\/a>.\\n          <br\\/>\\n          <b>Thanks.<\\/b>\\n\\t\\t<\\/p>\\n\\t","group":"","filename":"mod_vvisit_counter"}', '{"moduleclass_sfx":"","cssfile":"mvc.css","s_countUserAsNewType":"0","locktime":"15","initialvalue":"0","records":"100000","recordDays":"-1","s_trycreatetable":"1","s_createtableName":"vvisitcounter","read_only_counter":"0","s_useCookies":"1","s_firstCheckForwarderIP":"0","s_ipAlsoInRaw":"0","s_ip":"0","ip":"","ip_type":"text","filterIPs":"","s_trycreateIPCtable":"0","s_ipCcode":"0","s_ipCountry":"0","s_ipCflag":"0","s_ipCflag_width":"20","s_ipCflag_height":"13","s_ipCLic":"1","IP2C LicenseText":"<p style=\\"font-size:25%\\">This page uses the IP-to-Country Database provided by WebHosting.Info (http:\\/\\/www.webhosting.info), available from http:\\/\\/ip-to-country.webhosting.info<\\/p>","s_autoFilterRobots":"0","filterUserAgents":"","saveUserAgents":"0","filterUsers":"0","the_order":"1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16","linkonviewView":"","linkonviewLink":"","linkonviewTarget":"","s_translate_table_texts":"0","s_today":"1","today":"Today","s_yesterday":"1","yesterday":"Yesterday","s_week":"1","s_week_startday":"1","week":"This_Week","s_month":"1","month":"This_Month","s_all":"1","all":"All_Days","show_UsageImgs":"peoples","s_highestVisitsDay":"0","highestVisitsDayText":"Highest","highestVisitsDayTrenner":" ","highestVisitsDayUpdInt":"43200","highestVisitsDayTValue":" $d : $v","s_digit":"1","s_digits_min":"6","s_digits_max":"6","s_digits_warnimg":"","disp_type":"text","widthtable":"90","image_create":"0","image_showDays":"0","image_path":"\\/tmp\\/imagemvc.png","image_newerAsHours":"6","image_sizeX":"160","image_sizeY":"90","image_lineColor":"#000000","image_dia_MainbgColor":"#FFFFFF","image_dia_bgColor":"#DDDDDD","image_dia_RandColor":"#FF0000","s_loggedinUserCount":"0","loggedinUserCountText":"Logged In Users","s_guestsCount":"0","guestsText":"Guests","s_registeredUserCount":"0","registeredUserCountText":"Registered Users","s_registeredUserCountToday":"0","registeredUserCountTodayText":"Registered Today","userCountTrenner":" ","s_loggedinUserNamens":"0","loggedinUserNamensText":"Now Online","s_registeredUserTodayNames":"0","registeredUserTodayNamensText":"Registered Today","s_userNamensOut":"1","userNamensLink":"","userNamensLinkLogged":"0","s_onlyGroupsN_Flag":"0","s_onlyGroupsN":"","s_onlyFrontEndCount":"1","s_guestInactivTime":"300","s_userInactivTime":"0","pretext":"","posttext":"","mail_sending":"0","mail_rate":"1000","mail_userIds":"","mail_body":"$a","mail_datetime_fmt":"d.m.Y","trigger_script":"0","trigger_script_rate":"1000","trigger_script_name":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10055, 'com_product', 'component', 'com_product', '', 1, 1, 0, 0, '{"name":"com_product","type":"component","creationDate":"2015-06-02","author":"toanle","copyright":"toanktv.it@gmail.com","authorEmail":"gep2a76@gmail.com","authorUrl":"http:\\/\\/","version":"1.0.0","description":"","group":"","filename":"product"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10056, 'com_partner', 'component', 'com_partner', '', 1, 1, 0, 0, '{"name":"com_partner","type":"component","creationDate":"2015-06-04","author":"Toanlm","copyright":"Toanlm","authorEmail":"gep2a76@gmail.com","authorUrl":"http:\\/\\/","version":"1.0.0","description":"","group":"","filename":"partner"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10057, 'mod_partner', 'module', 'mod_partner', '', 0, 1, 0, 0, '{"name":"mod_partner","type":"module","creationDate":"July 2004","author":"ToanLM","copyright":"Toanlm.","authorEmail":"toanktv.it@gmail.com","authorUrl":"www.joomla.org","version":"3.0.0","description":"","group":"","filename":"mod_partner"}', '{"showmode":"0","cache":"0","filter_groups":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10058, 'com_advertisement', 'component', 'com_advertisement', '', 1, 1, 0, 0, '{"name":"com_advertisement","type":"component","creationDate":"2015-06-04","author":"Toanlm","copyright":"Toanlm","authorEmail":"gep2a76@gmail.com","authorUrl":"http:\\/\\/","version":"1.0.0","description":"","group":"","filename":"advertisement"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10059, 'mod_advertisement', 'module', 'mod_advertisement', '', 0, 1, 0, 0, '{"name":"mod_advertisement","type":"module","creationDate":"July 2004","author":"ToanLM","copyright":"Toanlm.","authorEmail":"toanktv.it@gmail.com","authorUrl":"www.joomla.org","version":"3.0.0","description":"","group":"","filename":"mod_advertisement"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10060, 'mod_feature', 'module', 'mod_feature', '', 0, 1, 0, 0, '{"name":"mod_feature","type":"module","creationDate":"July 2004","author":"ToanLM","copyright":"Toanlm.","authorEmail":"toanktv.it@gmail.com","authorUrl":"www.joomla.org","version":"3.0.0","description":"","group":"","filename":"mod_feature"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `vp_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(10061, 'com_djcatalog2', 'component', 'com_djcatalog2', '', 1, 1, 0, 0, '{"name":"com_djcatalog2","type":"component","creationDate":"January 2013","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.3.1","description":"","group":"","filename":"djcatalog2"}', '{"theme":"default","theme_responsive":"1","allowed_image_types":"jpg,png,gif","allowed_attachment_types":"jpg,png,bmp,gif,pdf,tif,tiff,txt,csv,doc,docx,xls,xlsx,xlt,pps,ppt,pptx,ods,odp,odt,rar,zip,tar,bz2,gz2,7z","show_contact_form":"1","contact_list":"","contact_company_name_field":"0","contact_street_field":"0","contact_city_field":"0","contact_zip_field":"0","contact_country_field":"0","contact_phone_field":"0","price_restrict":"0","price_unit":"$","thousand_separator":"0","decimal_separator":"0","decimals":"2","unit_side":"1","social_code":"","social_code_position":"bottom","comments":"0","facebook-sdk":"0","disqus_shortname":"","show_footer":"0","product_catalogue":"1","showcatdesc":"0","showcatimg":"0","showsubcategories":"1","showsubcategories_label":"0","category_columns":"1","category_show_intro":"1","category_intro_trunc":"0","category_intro_length":"0","image_link_subcategory":"0","showreadmore_subcategory":"0","subcategory_showchildren":"0","limit_items_show":"8","list_layout":"items","show_layout_switch":"0","items_columns":"2","items_default_order":"i.ordering","items_default_order_dir":"asc","featured_only":"0","featured_first":"0","show_category_filter":"1","category_filter_type":"0","show_producer_filter":"0","show_search":"1","show_atoz_filter":"1","atoz_letters":"a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z","atoz_check_available":"0","show_category_orderby":"1","show_producer_orderby":"0","show_name_orderby":"1","show_price_orderby":"0","show_date_orderby":"1","show_item_name":"1","show_category_name":"1","show_producer_name":"3","show_producers_items":"0","show_price":"1","show_old_price":"1","items_show_attributes":"1","items_show_intro":"1","items_intro_trunc":"0","items_intro_length":"0","image_link_item":"0","showreadmore_item":"0","rss_enabled":"0","rss_feed_icon":"0","rss_limit_items_show":"8","rss_items_default_order":"i.created","rss_items_default_order_dir":"desc","rss_description_type":"1","rss_image_link_item":"1","rss_showreadmore_item":"1","show_image_item":"1","show_category_name_item":"0","show_producer_name_item":"3","show_producers_items_item":"0","show_price_item":"1","show_old_price_item":"1","show_navigation":"0","related_items_columns":"2","related_items_count":"2","lightbox_type":"slimbox","resize":"0","crop_alignment_h":"m","crop_alignment_v":"m","width":"300","height":"300","th_width":"120","th_height":"120","smallth_width":"92","smallth_height":"92","smallth_spacing_v":"4","smallth_spacing_h":"4","smallth_padding_h":"4","category_resize":"","category_width":"","category_height":"","category_th_width":"","category_th_height":"","category_smallth_width":"","category_smallth_height":"","category_smallth_spacing_v":"","category_smallth_spacing_h":"","category_smallth_padding_h":"","producer_resize":"","producer_width":"","producer_height":"","producer_th_width":"","producer_th_height":"","producer_smallth_width":"","producer_smallth_height":"","producer_smallth_spacing_v":"","producer_smallth_spacing_h":"","producer_smallth_padding_h":"","seo_items_view":"items","seo_item_view":"item","seo_producer_view":"producer","seo_producers_view":"producers","seo_myitems_view":"myitems","seo_itemform_view":"itemform","seo_alias_separator":"0","seo_id_position":"1","fed_edit_button":"0","fed_max_products":"0","fed_multiple_categories":"0","fed_multiple_categories_limit":"3","fed_default_state":"0","fed_producer":"0","fed_producer_restrict":"0","fed_price":"0","fed_featured":"0","fed_group":"0","fed_intro_description":"1","fed_intro_description_editor":"codemirror","fed_description":"1","fed_description_editor":"codemirror","fed_meta":"0","fed_contact":"0","fed_max_images":"6","fed_max_image_size":"2048","fed_max_files":"6","fed_max_file_size":"2048","fed_notify":"1","fed_notify_list":"","fed_myitems_list":"0","fed_show_category_name":"1","fed_show_producer_name":"3","fed_show_price":"2"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10062, 'mod_djc2categories', 'module', 'mod_djc2categories', '', 0, 1, 0, 0, '{"name":"mod_djc2categories","type":"module","creationDate":"January 2011","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.3","description":"MOD_DJC2CATEGORIES_DESC","group":"","filename":"mod_djc2categories"}', '{"moduleclass_sfx":"","expand":"0","parent_category":"0","cache":"1","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10063, 'mod_djc2frontpage', 'module', 'mod_djc2frontpage', '', 0, 1, 0, 0, '{"name":"mod_djc2frontpage","type":"module","creationDate":"August 2012","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.2","description":"MOD_DJC2FRONTPAGE_MODULE_DESCRIPTION","group":"","filename":"mod_djc2frontpage"}', '{"moduleclass_sfx":"","css":"0","responsive_width":"","showtitle":"1","linktitle":"1","showcattitle":"1","showpagination":"1","orderby":"0","orderbydir":"0","featured_only":"0","featured_first":"0","@spacer":"","catsw":"0","catid":"0","cols":"1","rows":"3","largeprocess":"1","largewidth":"400","largeheight":"240","smallprocess":"1","smallwidth":"90","smallheight":"70","trunc":"0","trunclimit":"0","showreadmore":"1","readmoretext":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10064, 'mod_djc2items', 'module', 'mod_djc2items', '', 0, 1, 0, 0, '{"name":"mod_djc2items","type":"module","creationDate":"November 2011","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.5","description":"MOD_DJC2ITEMS_DESC","group":"","filename":"mod_djc2items"}', '{"moduleclass_sfx":"","featured_only":"0","featured_first":"0","orderby":"0","orderdir":"0","catid":"0","item_ids":"","items_limit":"0","showtitle":"1","showimage":"1","show_category_name":"1","show_producer_name":"3","show_price":"1","items_show_intro":"1","items_intro_trunc":"0","items_intro_length":"0","showreadmore_item":"1","imageprocess":"1","imagewidth":"120","imageheight":"120","module_float":"","module_width":"","module_height":"","module_text_align":"","cache":"1","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10065, 'mod_djc2relateditems', 'module', 'mod_djc2relateditems', '', 0, 1, 0, 0, '{"name":"mod_djc2relateditems","type":"module","creationDate":"October 2011","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.5","description":"MOD_DJC2RELATEDITEMS_DESC","group":"","filename":"mod_djc2relateditems"}', '{"moduleclass_sfx":"","featured_only":"0","featured_first":"0","orderby":"0","orderdir":"0","items_limit":"0","showimage":"1","show_category_name":"1","show_producer_name":"3","show_price":"1","items_show_intro":"1","items_intro_trunc":"0","items_intro_length":"0","showreadmore_item":"1","imageprocess":"1","imagewidth":"120","imageheight":"120","module_float":"","module_width":"","module_height":"","module_text_align":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10066, 'mod_djc2filters', 'module', 'mod_djc2filters', '', 0, 1, 0, 0, '{"name":"mod_djc2filters","type":"module","creationDate":"September 2012","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.6","description":"MOD_DJC2FILTERS_DESC","group":"","filename":"mod_djc2filters"}', '{"moduleclass_sfx":"","visibility":"","group_title":"1","categories":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10067, 'mod_djc2producers', 'module', 'mod_djc2producers', '', 0, 1, 0, 0, '{"name":"mod_djc2producers","type":"module","creationDate":"January 2011","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.3","description":"MOD_DJC2PRODUCERS_DESC","group":"","filename":"mod_djc2producers"}', '{"filter":"1","type":"0","cache":"1","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10068, 'mod_djc2search', 'module', 'mod_djc2search', '', 0, 1, 0, 0, '{"name":"mod_djc2search","type":"module","creationDate":"January 2011","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"1.4","description":"MOD_DJC2SEARCH","group":"","filename":"mod_djc2search"}', '{"moduleclass_sfx":"","filter":"1","show_label":"1","show_button":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10069, 'plg_djcatalog2_pagebreak', 'plugin', 'pagebreak', 'djcatalog2', 0, 0, 1, 0, '{"name":"plg_djcatalog2_pagebreak","type":"plugin","creationDate":"January 2011","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.1","description":"PLG_DJCATALOG2_PAGEBREAK_DJCATALOGPAGEBREAK","group":"","filename":"pagebreak"}', '{"enabled":"1","accordion":"2"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10070, 'plg_search_djcatalog2', 'plugin', 'djcatalog2', 'search', 0, 0, 1, 0, '{"name":"plg_search_djcatalog2","type":"plugin","creationDate":"January 2011","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"2.4","description":"PLG_SEARCH_DJCATALOG2_DJPLGSEARCHDESC","group":"","filename":"djcatalog2"}', '{"search_limit":"50"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10071, 'plg_xmap_com_djcatalog2', 'plugin', 'com_djcatalog2', 'xmap', 0, 0, 1, 0, '{"name":"plg_xmap_com_djcatalog2","type":"plugin","creationDate":"January 2012","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"1.4","description":"PLG_XMAP_COM_DJCATALOG2_DESC","group":"","filename":"com_djcatalog2"}', '{"include_products":"1","cat_priority":"0.5","cat_changefreq":"weekly","link_priority":"0.5","link_changefreq":"weekly"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10072, 'plg_quickicon_djcatalog', 'plugin', 'djcatalog2', 'quickicon', 0, 0, 1, 0, '{"name":"plg_quickicon_djcatalog","type":"plugin","creationDate":"August 2012","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"1.0","description":"PLG_QUICKICON_DJCATALOG2_DESCRIPTION","group":"","filename":"djcatalog2"}', '{"context":"mod_quickicon"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10073, 'DJ-Catalog2 Package', 'package', 'pkg_dj-catalog2', '', 0, 1, 1, 0, '{"name":"DJ-Catalog2 Package","type":"package","creationDate":"August 2011","author":"DJ-Extensions.com LTD","copyright":"Copyright (C) 2010-2012 DJ-Extensions.com LTD, All rights reserved.","authorEmail":"contact@dj-extensions.com","authorUrl":"http:\\/\\/dj-extensions.com","version":"3.3.1","description":"DJ-Catalog2 All-in-one Package","group":"","filename":"pkg_dj-catalog2"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(46105, 'System - Section', 'plugin', 'section', 'system', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_filters`
--

CREATE TABLE IF NOT EXISTS `vp_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `vp_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `vp_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vp_finder_taxonomy`
--

INSERT INTO `vp_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `vp_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_terms`
--

CREATE TABLE IF NOT EXISTS `vp_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `vp_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vp_finder_terms_common`
--

INSERT INTO `vp_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `vp_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `vp_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_finder_types`
--

CREATE TABLE IF NOT EXISTS `vp_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_joomgallery_catg`
--

CREATE TABLE IF NOT EXISTS `vp_joomgallery_catg` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(2048) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(1) unsigned NOT NULL DEFAULT '0',
  `description` text,
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `in_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) NOT NULL DEFAULT '',
  `owner` int(11) DEFAULT '0',
  `thumbnail` int(11) DEFAULT NULL,
  `img_position` int(10) DEFAULT '0',
  `catpath` varchar(2048) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `exclude_toplists` int(1) NOT NULL,
  `exclude_search` int(1) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vp_joomgallery_catg`
--

INSERT INTO `vp_joomgallery_catg` (`cid`, `asset_id`, `name`, `alias`, `parent_id`, `lft`, `rgt`, `level`, `description`, `access`, `published`, `hidden`, `in_hidden`, `password`, `owner`, `thumbnail`, `img_position`, `catpath`, `params`, `metakey`, `metadesc`, `exclude_toplists`, `exclude_search`) VALUES
(1, 0, 'ROOT', 'root', 0, 0, 8, 0, NULL, 1, 1, 0, 0, '', 0, NULL, 0, '', '', '', '', 0, 0),
(2, 88, 'Image category 1', 'image-category-1', 1, 5, 6, 1, '<p>Image category 1 description</p>', 1, 1, 0, 0, '', 0, 0, -1, 'image_category_1_2', '', '', '', 0, 0),
(3, 89, 'Image category 2', 'image-category-2', 1, 3, 4, 1, '<p>Image category  description</p>', 1, 1, 0, 0, '', 0, 0, -1, 'image_category_2_3', '', '', '', 0, 0),
(4, 90, 'Image category 3', 'image-category-3', 1, 1, 2, 1, '<p>Image category 3 description</p>', 1, 1, 0, 0, '', 0, 0, -1, 'image_category_3_4', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vp_languages`
--

CREATE TABLE IF NOT EXISTS `vp_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vp_languages`
--

INSERT INTO `vp_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 1, 1),
(2, 'vi-VN', 'Tiếng Việt (VN)', 'Vietnamese', 'vi', 'vi_vn', 'Tiếng Việt', '', '', '', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vp_menu`
--

CREATE TABLE IF NOT EXISTS `vp_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=172 ;

--
-- Dumping data for table `vp_menu`
--

INSERT INTO `vp_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 155, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 69, 74, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 70, 71, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 72, 73, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 75, 80, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 76, 77, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 78, 79, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 81, 86, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 82, 83, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 84, 85, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 87, 88, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 89, 90, 0, '*', 1),
(18, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 91, 92, 0, '*', 1),
(19, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 93, 94, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 95, 96, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 97, 98, 0, '*', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","multi_column_order":"1","orderby_pri":"","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 99, 100, 1, '*', 0),
(102, 'englishmenu', 'Products and Services', 'products', '', 'products', 'index.php?option=com_content&view=category&id=10', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_category_heading_title":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_featured":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 53, 62, 0, 'en-GB', 0),
(103, 'tiengvietmenu', 'Sản phẩm và Dịch vụ', 'san-pham', '', 'san-pham', 'index.php?option=com_content&view=category&id=11', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_category_heading_title":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"alpha","order_date":"created","show_pagination":"","show_pagination_results":"","display_num":"5","show_featured":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 39, 46, 0, 'vi-VN', 0),
(104, 'tiengvietmenu', 'Giới thiệu', 'gioi-thieu', '', 'gioi-thieu', 'index.php?option=com_content&view=article&id=3', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 13, 14, 0, 'vi-VN', 0),
(105, 'tiengvietmenu', 'Dự án', 'du-an', '', 'du-an', 'index.php?option=com_content&view=category&layout=blog&id=12', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 35, 36, 0, 'vi-VN', 0),
(106, 'tiengvietmenu', 'Thư viện hình ảnh', 'thu-vien-hinh-anh', '', 'thu-vien-hinh-anh', 'index.php?option=com_phocagallery&view=categories', 'component', -2, 1, 1, 10052, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_pagination_categories":"0","show_pagination_category":"1","show_pagination_limit_categories":"0","show_pagination_limit_category":"1","show_ordering_categories":"0","show_ordering_images":"1","display_cat_name_title":"1","display_cat_name_breadcrumbs":"0","show_parent_categories":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 47, 48, 0, 'vi-VN', 0),
(107, 'tiengvietmenu', 'Liên hệ', 'lien-he', '', 'lien-he', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"presentation_style":"","show_contact_category":"","show_contact_list":"","show_tags":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 37, 38, 0, 'vi-VN', 0),
(108, 'englishmenu', 'Pictures', 'pictures', '', 'pictures', 'index.php?option=com_phocagallery&view=categories', 'component', 0, 1, 1, 10052, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_pagination_categories":"0","show_pagination_category":"1","show_pagination_limit_categories":"0","show_pagination_limit_category":"1","show_ordering_categories":"0","show_ordering_images":"1","display_cat_name_title":"1","display_cat_name_breadcrumbs":"0","show_parent_categories":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 65, 66, 0, 'en-GB', 0),
(109, 'englishmenu', 'About us', 'about-us', '', 'about-us', 'index.php?option=com_content&view=article&id=4', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 51, 52, 0, 'en-GB', 0),
(110, 'englishmenu', 'Contact us', 'contact-us', '', 'contact-us', 'index.php?option=com_contact&view=contact&id=2', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"presentation_style":"","show_contact_category":"","show_contact_list":"","show_tags":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 67, 68, 0, 'en-GB', 0),
(111, 'englishmenu', 'Products reference', 'products-reference', '', 'products-reference', 'index.php?option=com_content&view=category&id=16', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_category_heading_title":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_featured":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 63, 64, 0, 'en-GB', 0),
(112, 'tiengvietmenu', 'Trang chủ', 'trang-chu', '', 'trang-chu', 'index.php?option=com_content&view=category&layout=blog&id=9', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 11, 12, 1, 'vi-VN', 0),
(113, 'englishmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=category&layout=blog&id=8', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 49, 50, 1, 'en-GB', 0),
(114, 'tiengvietmenu', 'Thiết bị Công nghệ', 'thiet-bi-cong-nghe', '', 'san-pham/thiet-bi-cong-nghe', 'index.php?option=com_content&view=category&id=11', 'component', -2, 103, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_category_heading_title":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_featured":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 40, 41, 0, 'vi-VN', 0),
(115, 'tiengvietmenu', 'Hệ thống Ống rác', 'he-thong-ong-rac', '', 'san-pham/he-thong-ong-rac', 'index.php?option=com_content&view=category&layout=blog&id=21', 'component', -2, 103, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 42, 43, 0, 'vi-VN', 0),
(116, 'tiengvietmenu', 'Các thiết bị khác', 'cac-thiet-bi-khac', '', 'san-pham/cac-thiet-bi-khac', 'index.php?option=com_content&view=category&layout=blog&id=22', 'component', -2, 103, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 44, 45, 0, 'vi-VN', 0),
(117, 'tiengvietmenu', 'Other products', 'other-products', '', 'other-products', 'index.php?option=com_content&view=category&layout=blog&id=25', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 101, 102, 0, 'en-GB', 0),
(118, 'englishmenu', 'Garbage duct system', 'garbage-duct-system', '', 'products/garbage-duct-system', 'index.php?option=com_content&view=category&layout=blog&id=24', 'component', -2, 102, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 56, 57, 0, 'en-GB', 0),
(119, 'englishmenu', 'Technological equipment', 'technological-equipment', '', 'products/technological-equipment', 'index.php?option=com_content&view=category&layout=blog&id=23', 'component', -2, 102, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 54, 55, 0, 'en-GB', 0),
(120, 'englishmenu', 'Other products', 'other-products', '', 'products/other-products', 'index.php?option=com_content&view=category&layout=blog&id=25', 'component', -2, 102, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 58, 59, 0, 'en-GB', 0),
(121, 'main', 'ATTACH_ATTACHMENTS', 'attach-attachments', '', 'attach-attachments', 'index.php?option=com_attachments', 'component', 0, 1, 1, 10019, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_attachments/images/attachments.png', 0, '', 103, 108, 0, '', 1),
(122, 'main', 'ATTACH_ADD_NEW_ATTACHMENT', 'attach-add-new-attachment', '', 'attach-attachments/attach-add-new-attachment', 'index.php?option=com_attachments&task=attachment.add', 'component', 0, 121, 2, 10019, 0, '0000-00-00 00:00:00', 0, 1, 'class:newarticle', 0, '', 104, 105, 0, '', 1),
(123, 'main', 'JTOOLBAR_OPTIONS', 'jtoolbar-options', '', 'attach-attachments/jtoolbar-options', 'index.php?option=com_attachments&task=params.edit', 'component', 0, 121, 2, 10019, 0, '0000-00-00 00:00:00', 0, 1, 'class:config', 0, '', 106, 107, 0, '', 1),
(138, 'main', 'COM_PHOCAGALLERY', 'com-phocagallery', '', 'com-phocagallery', 'index.php?option=com_phocagallery', 'component', 0, 1, 1, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu.png', 0, '', 109, 136, 0, '', 1),
(139, 'main', 'COM_PHOCAGALLERY_CONTROLPANEL', 'com-phocagallery-controlpanel', '', 'com-phocagallery/com-phocagallery-controlpanel', 'index.php?option=com_phocagallery', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-control-panel.png', 0, '', 110, 111, 0, '', 1),
(140, 'main', 'COM_PHOCAGALLERY_IMAGES', 'com-phocagallery-images', '', 'com-phocagallery/com-phocagallery-images', 'index.php?option=com_phocagallery&view=phocagalleryimgs', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-gal.png', 0, '', 112, 113, 0, '', 1),
(141, 'main', 'COM_PHOCAGALLERY_CATEGORIES', 'com-phocagallery-categories', '', 'com-phocagallery/com-phocagallery-categories', 'index.php?option=com_phocagallery&view=phocagallerycs', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-cat.png', 0, '', 114, 115, 0, '', 1),
(142, 'main', 'COM_PHOCAGALLERY_THEMES', 'com-phocagallery-themes', '', 'com-phocagallery/com-phocagallery-themes', 'index.php?option=com_phocagallery&view=phocagalleryt', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-theme.png', 0, '', 116, 117, 0, '', 1),
(143, 'main', 'COM_PHOCAGALLERY_CATEGORYRATING', 'com-phocagallery-categoryrating', '', 'com-phocagallery/com-phocagallery-categoryrating', 'index.php?option=com_phocagallery&view=phocagalleryra', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-vote.png', 0, '', 118, 119, 0, '', 1),
(144, 'main', 'COM_PHOCAGALLERY_IMAGERATING', 'com-phocagallery-imagerating', '', 'com-phocagallery/com-phocagallery-imagerating', 'index.php?option=com_phocagallery&view=phocagalleryraimg', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-vote-img.png', 0, '', 120, 121, 0, '', 1),
(145, 'main', 'COM_PHOCAGALLERY_CATEGORYCOMMENTS', 'com-phocagallery-categorycomments', '', 'com-phocagallery/com-phocagallery-categorycomments', 'index.php?option=com_phocagallery&view=phocagallerycos', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-comment.png', 0, '', 122, 123, 0, '', 1),
(146, 'main', 'COM_PHOCAGALLERY_IMAGECOMMENTS', 'com-phocagallery-imagecomments', '', 'com-phocagallery/com-phocagallery-imagecomments', 'index.php?option=com_phocagallery&view=phocagallerycoimgs', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-comment-img.png', 0, '', 124, 125, 0, '', 1),
(147, 'main', 'COM_PHOCAGALLERY_USERS', 'com-phocagallery-users', '', 'com-phocagallery/com-phocagallery-users', 'index.php?option=com_phocagallery&view=phocagalleryusers', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-users.png', 0, '', 126, 127, 0, '', 1),
(148, 'main', 'COM_PHOCAGALLERY_FB', 'com-phocagallery-fb', '', 'com-phocagallery/com-phocagallery-fb', 'index.php?option=com_phocagallery&view=phocagalleryfbs', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-fb.png', 0, '', 128, 129, 0, '', 1),
(149, 'main', 'COM_PHOCAGALLERY_TAGS', 'com-phocagallery-tags', '', 'com-phocagallery/com-phocagallery-tags', 'index.php?option=com_phocagallery&view=phocagallerytags', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-tags.png', 0, '', 130, 131, 0, '', 1),
(150, 'main', 'COM_PHOCAGALLERY_STYLES', 'com-phocagallery-styles', '', 'com-phocagallery/com-phocagallery-styles', 'index.php?option=com_phocagallery&view=phocagalleryefs', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-styles.png', 0, '', 132, 133, 0, '', 1),
(151, 'main', 'COM_PHOCAGALLERY_INFO', 'com-phocagallery-info', '', 'com-phocagallery/com-phocagallery-info', 'index.php?option=com_phocagallery&view=phocagalleryin', 'component', 0, 138, 2, 10052, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_phocagallery/images/administrator/icon-16-pg-menu-info.png', 0, '', 134, 135, 0, '', 1),
(152, 'main', 'COM_PRODUCT', 'com-product', '', 'com-product', 'index.php?option=com_product', 'component', 0, 1, 1, 10055, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_product/assets/images/s_com_product.png', 0, '', 137, 142, 0, '', 1),
(153, 'main', 'COM_PRODUCT_TITLE_PRODUCTS', 'com-product-title-products', '', 'com-product/com-product-title-products', 'index.php?option=com_product&view=products', 'component', 0, 152, 2, 10055, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_product/assets/images/s_products.png', 0, '', 138, 139, 0, '', 1),
(154, 'main', 'COM_PRODUCT_PRODUCTS_CATEGORY_ID', 'com-product-products-category-id', '', 'com-product/com-product-products-category-id', 'index.php?option=com_categories&extension=com_product', 'component', 0, 152, 2, 10055, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_product/assets/images/s_products.png', 0, '', 140, 141, 0, '', 1),
(155, 'main', 'COM_PARTNER', 'com-partner', '', 'com-partner', 'index.php?option=com_partner', 'component', 0, 1, 1, 10056, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_partner/assets/images/s_com_partner.png', 0, '', 143, 146, 0, '', 1),
(156, 'main', 'COM_PARTNER_TITLE_PARTNERS', 'com-partner-title-partners', '', 'com-partner/com-partner-title-partners', 'index.php?option=com_partner&view=partners', 'component', 0, 155, 2, 10056, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_partner/assets/images/s_partners.png', 0, '', 144, 145, 0, '', 1),
(157, 'main', 'COM_ADVERTISEMENT', 'com-advertisement', '', 'com-advertisement', 'index.php?option=com_advertisement', 'component', 0, 1, 1, 10058, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_advertisement/assets/images/s_com_advertisement.png', 0, '', 147, 150, 0, '', 1),
(158, 'main', 'COM_ADVERTISEMENT_TITLE_ADVERTISEMENTS', 'com-advertisement-title-advertisements', '', 'com-advertisement/com-advertisement-title-advertisements', 'index.php?option=com_advertisement&view=advertisements', 'component', 0, 157, 2, 10058, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_advertisement/assets/images/s_advertisements.png', 0, '', 148, 149, 0, '', 1),
(159, 'main', 'COM_DJCATALOG2', 'com-djcatalog2', '', 'com-djcatalog2', 'index.php?option=com_djcatalog2', 'component', 0, 1, 1, 10061, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_djcatalog2/assets/images/icon-16-djcatalog.png', 0, '', 151, 152, 0, '', 1),
(160, 'englishmenu', 'Projects', 'projects', '', 'projects', 'index.php?option=com_djcatalog2&view=items&cid=0', 'component', 1, 1, 1, 10061, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 153, 154, 0, 'en-GB', 0),
(161, 'tiengvietmenu', 'Sản phẩm và Dịch vụ', 'san-pham-dich-vu', '', 'san-pham-dich-vu', 'index.php?option=com_djcatalog2&view=items&cid=0', 'component', 1, 1, 1, 10061, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 15, 34, 0, 'vi-VN', 0),
(162, 'englishmenu', 'sub 1', 'sub-1', '', 'products/sub-1', 'index.php?option=com_content&view=category&id=40', 'component', 1, 102, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_category_heading_title":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_featured":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 60, 61, 0, '*', 0),
(163, 'tiengvietmenu', 'Nguyên liệu Composite (FRP)', 'nguyen-lieu-composite-frp', '', 'san-pham-dich-vu/nguyen-lieu-composite-frp', 'index.php?option=com_djcatalog2&view=items&cid=1', 'component', 1, 161, 2, 10061, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 16, 23, 0, '*', 0),
(164, 'tiengvietmenu', 'Hệ thống Ống thải rác', 'he-thong-ong-thai-rac', '', 'san-pham-dich-vu/he-thong-ong-thai-rac', 'index.php?option=com_djcatalog2&view=items&cid=2', 'component', 1, 161, 2, 10061, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 24, 25, 0, '*', 0);
INSERT INTO `vp_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(165, 'tiengvietmenu', 'Thiết bị Công nghiệp', 'thiet-bi-cong-nghiep', '', 'san-pham-dich-vu/thiet-bi-cong-nghiep', 'index.php?option=com_djcatalog2&view=items&cid=6', 'component', 1, 161, 2, 10061, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 26, 27, 0, '*', 0),
(166, 'tiengvietmenu', 'Hạ tầng Công nghệ Thông tin', 'ha-tang-cong-nghe-thong-tin', '', 'san-pham-dich-vu/ha-tang-cong-nghe-thong-tin', 'index.php?option=com_djcatalog2&view=items&cid=7', 'component', 1, 161, 2, 10061, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 28, 29, 0, '*', 0),
(167, 'tiengvietmenu', 'Phần mềm quản lý', 'phan-mem-quan-ly', '', 'san-pham-dich-vu/phan-mem-quan-ly', 'index.php?option=com_djcatalog2&view=items&cid=8', 'component', 1, 161, 2, 10061, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 30, 31, 0, '*', 0),
(168, 'tiengvietmenu', 'Sợi thủy tinh', 'soi-thuy-tinh', '', 'san-pham-dich-vu/nguyen-lieu-composite-frp/soi-thuy-tinh', 'index.php?option=com_djcatalog2&view=items&cid=3', 'component', 1, 163, 3, 10061, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 17, 18, 0, '*', 0),
(169, 'tiengvietmenu', 'Nhựa Polyester', 'nhua-polyester', '', 'san-pham-dich-vu/nguyen-lieu-composite-frp/nhua-polyester', 'index.php?option=com_djcatalog2&view=items&cid=4', 'component', 1, 163, 3, 10061, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 19, 20, 0, '*', 0),
(170, 'tiengvietmenu', 'Phụ gia khác', 'phu-gia-khac', '', 'san-pham-dich-vu/nguyen-lieu-composite-frp/phu-gia-khac', 'index.php?option=com_djcatalog2&view=items&cid=5', 'component', 1, 163, 3, 10061, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"theme":"","theme_responsive":"","show_contact_form":"","contact_list":"","price_restrict":"","price_unit":"","thousand_separator":"","decimal_separator":"","decimals":"","unit_side":"","product_catalogue":"","showcatdesc":"","showcatimg":"","showsubcategories":"","showsubcategories_label":"","category_columns":"","category_show_intro":"","category_intro_trunc":"","category_intro_length":"","image_link_subcategory":"","showreadmore_subcategory":"","subcategory_showchildren":"","limit_items_show":"","list_layout":"","show_layout_switch":"","items_columns":"","items_default_order":"","items_default_order_dir":"","featured_only":"","featured_first":"","show_category_filter":"","category_filter_type":"","show_producer_filter":"","show_search":"","show_atoz_filter":"","atoz_letters":"","atoz_check_available":"","show_category_orderby":"","show_producer_orderby":"","show_name_orderby":"","show_price_orderby":"","show_date_orderby":"","show_item_name":"","show_category_name":"","show_producer_name":"","show_price":"","show_old_price":"","items_show_attributes":"","items_show_intro":"","items_intro_trunc":"","items_intro_length":"","image_link_item":"","showreadmore_item":"","rss_enabled":"","rss_feed_icon":"","rss_limit_items_show":"","rss_items_default_order":"","rss_items_default_order_dir":"","rss_description_type":"","rss_image_link_item":"","rss_showreadmore_item":"","show_image_item":"","show_category_name_item":"","show_producer_name_item":"","show_price_item":"","show_old_price_item":"","show_navigation":"","related_items_columns":"","related_items_count":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 21, 22, 0, '*', 0),
(171, 'tiengvietmenu', 'Vách kính - Cửa kính thủy lực', '2015-06-13-04-24-48', '', 'san-pham-dich-vu/2015-06-13-04-24-48', 'http://eurodoors.com.vn/', 'url', 1, 161, 2, 0, 0, '0000-00-00 00:00:00', 1, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 32, 33, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vp_menu_types`
--

CREATE TABLE IF NOT EXISTS `vp_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vp_menu_types`
--

INSERT INTO `vp_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'englishmenu', 'English Menu', ''),
(3, 'tiengvietmenu', 'Tiếng Việt Menu', '');

-- --------------------------------------------------------

--
-- Table structure for table `vp_messages`
--

CREATE TABLE IF NOT EXISTS `vp_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `vp_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_modules`
--

CREATE TABLE IF NOT EXISTS `vp_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=123 ;

--
-- Dumping data for table `vp_modules`
--

INSERT INTO `vp_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 1, 'language', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"showHere":"0","showHome":"1","homeText":"","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 60, 'Menu English Module', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"englishmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":" nav-pills","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'en-GB'),
(88, 61, 'Menu Tiếng Việt Module', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"tiengvietmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":" nav-pills","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'vi-VN'),
(89, 62, 'BLS - Backend Language Switcher', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_backendlanguageswitcher', 1, 1, '', 1, '*'),
(90, 63, 'Language', '', '', 1, 'language', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_languages', 1, 1, '{"header_text":"","footer_text":"","dropdown":"0","image":"1","inline":"1","show_active":"1","full_name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(91, 78, 'Search', '', '', 1, 'position-0', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 0, '{"label":"","width":"20","text":"","button":"0","button_pos":"left","imagebutton":"0","button_text":"","opensearch":"1","opensearch_title":"","set_itemid":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(92, 79, 'Slider homepage', '', '', 1, 'banner', 471, '2015-06-15 15:41:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_favslider', 1, 0, '{"sliderType":"slidernav","jqueryLoad":"1","animationEffect":"slide","slideHeight":"","thumbHeight":"","linkTarget":"self","arrowNav":"1","arrowNavStyle":"dark-arrows","controlNav":"1","slideshow":"1","randomize":"0","animationLoop":"1","pauseOnHover":"1","keyboardNav":"1","mousewheel":"0","slideshowSpeed":"3000","captionHide":"visible","layoutEffect":"layout-effect1","captionTextAlign":"favalign-left","captionStyle":"favstyle-default","captionBgStyle":"favstyle-bg-dark","captionWidth":"","captionHeight":"","captionTitleGoogleFont":"Open Sans","captionTitleFontSize":"","captionTitleTextTransform":"uppercase","captionTitlePadding":"","captionTitleMargin":"","captionDescriptionGoogleFont":"Open Sans","captionDescriptionFontSize":"","captionReadMoreColor":"","captionReadMoreBgColor":"","captionReadMoreGoogleFont":"Open Sans","captionReadMorePadding":"","captionReadMoreMargin":"","file1active":"1","file1type":"image","file1":"media\\/favslider\\/demo\\/slide1.jpg","file1alt":"","file1link":"","file1favtitle":"","file1favdescription":"","file1favreadmore":"","file2active":"1","file2type":"image","file2":"media\\/favslider\\/demo\\/slide2.jpg","file2alt":"","file2link":"","file2favtitle":"","file2favdescription":"","file2favreadmore":"","file3active":"1","file3type":"image","file3":"media\\/favslider\\/demo\\/slide3.jpg","file3alt":"","file3link":"","file3favtitle":"","file3favdescription":"","file3favreadmore":"","file4active":"1","file4type":"image","file4":"media\\/favslider\\/demo\\/slide4.jpg","file4alt":"","file4link":"","file4favtitle":"","file4favdescription":"","file4favreadmore":"","file5active":"1","file5type":"image","file5":"media\\/favslider\\/demo\\/slide5.jpg","file5alt":"","file5link":"","file5favtitle":"","file5favdescription":"","file5favreadmore":"","file6active":"0","file6type":"image","file6":"","file6alt":"","file6link":"","file6favtitle":"","file6favdescription":"","file6favreadmore":"","file7active":"0","file7type":"image","file7":"","file7alt":"","file7link":"","file7favtitle":"","file7favdescription":"","file7favreadmore":"","file8active":"0","file8type":"image","file8":"","file8alt":"","file8link":"","file8favtitle":"","file8favdescription":"","file8favreadmore":"","file9active":"0","file9type":"image","file9":"","file9alt":"","file9link":"","file9favtitle":"","file9favdescription":"","file9favreadmore":"","file10active":"0","file10type":"image","file10":"","file10alt":"","file10link":"","file10favtitle":"","file10favdescription":"","file10favreadmore":"","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(93, 80, 'Footer', '', '<table border="0" width="80%" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="top" width="100%">\r\n<p><strong><span style="font-size: 16px;"><span style="font-family: Arial,Helvetica,sans-serif;"><img src="images/logo-footer.png" alt="Việt Pan" width="165" height="60" /><br /></span></span></strong></p>\r\n<p style="margin-left: 15px;">Văn phòng: P12A12, nhà 17T10, Trung Hòa - Nhân Chính, Cầu Giấy, Hà Nội.</p>\r\n<p style="margin-left: 15px;">Tel: 04.22115515 - Fax: 04.62512000 - Email: vunguyenvipa@gmail.com.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(94, 83, 'Banner category', '', '', 1, 'banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_simple_responsive_slideshow', 1, 0, '{"jqueryLoad":"1","animation":"fade","slideDirection":"horizontal","slideshowSpeed":"5000","animationDuration":"600","flexsliderBgColor":"FFFFFF","directionNav":"1","controlNav":"0","slideshow":"1","randomize":"0","animationLoop":"1","pauseOnAction":"1","pauseOnHover":"1","keyboardNav":"1","mousewheel":"0","file1active":"1","file1":"media\\/simple-responsive-slideshow\\/demo\\/slide1.jpg","file1link":"","file1caption":"","file1alt":"","file2active":"1","file2":"media\\/simple-responsive-slideshow\\/demo\\/slide2.jpg","file2link":"","file2caption":"","file2alt":"","file3active":"1","file3":"media\\/simple-responsive-slideshow\\/demo\\/slide3.jpg","file3link":"","file3caption":"","file3alt":"","file4active":"0","file4":"media\\/simple-responsive-slideshow\\/demo\\/slide4.jpg","file4link":"","file4caption":"","file4alt":"","file5active":"0","file5":"media\\/simple-responsive-slideshow\\/demo\\/slide5.jpg","file5link":"","file5caption":"","file5alt":"","file6active":"0","file6":"","file6link":"","file6caption":"","file6alt":"","file7active":"0","file7":"","file7link":"","file7caption":"","file7alt":"","file8active":"0","file8":"","file8link":"","file8caption":"","file8alt":"","file9active":"0","file9":"","file9link":"","file9caption":"","file9alt":"","file10active":"0","file10":"","file10link":"","file10caption":"","file10alt":"","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(102, 114, 'MyLiveChat', '', '', 1, 'debug', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_mylivechat', 1, 1, '{"mylivechat_id":"97376692","mylivechat_displaytype":"inline","mylivechat_membership":"no","mylivechat_encrymode":"none","mylivechat_encrykey":"","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(103, 117, 'List banner', '', '', 0, 'position-8', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_banners', 1, 1, '{"target":"1","count":5,"cid":"0","catid":[""],"tag_search":"0","ordering":"0","header_text":"","footer_text":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(104, 118, 'Left 1 - List category', '', '<p>List category</p>', 0, 'position-8', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(105, 119, 'Left 2 - List hợp tác', '', '<p>Left 2 - List hợp tác here</p>', 1, 'position-8', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(106, 120, 'Left 3 - Thống kê', '', '', 0, 'position-8', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(107, 121, 'R2- Hỗ trợ trực tuyến', '', '<div id="DisplayCommonOnlineSupport">\r\n<div class="TopBar"><a href="ymsgr:sendim?manhtoan_0510"><img src="http://thungracnhua.vn/cms/display/CommonControls/cs/DisplayCommonOnlineSupport/YahooOff.jpg" alt="" border="0" /></a></div>\r\n<div class="TopBar"> </div>\r\n<div class="TopBar">Ông Nguyễn Vũ</div>\r\n<div>  </div>\r\n<div>Điện thoại : <span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 13px; line-height: 18px;">04.22115515</span></div>\r\n<div>Email : <a class="email" href="mailto:vunguyenvipa@gmail.com">vunguyenvipa@gmail.com</a></div>\r\n</div>', 2, 'position-7', 471, '2015-06-07 05:04:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(108, 122, 'Right 2 - Sản phẩm nổi bật', '', '', 0, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(109, 123, 'Right 3 - Quảng cáo', '', '', 0, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(110, 124, 'L1- Thống kê', '', '', 1, 'count-visit', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_vvisit_counter', 1, 0, '{"moduleclass_sfx":"","cssfile":"mvc.css","s_countUserAsNewType":"0","locktime":"15","initialvalue":"0","records":"100000","recordDays":"-1","s_trycreatetable":"1","s_createtableName":"vvisitcounter","read_only_counter":"0","s_useCookies":"1","s_firstCheckForwarderIP":"0","s_ipAlsoInRaw":"0","s_ip":"0","ip":"","ip_type":"text","filterIPs":"","s_trycreateIPCtable":"0","s_ipCcode":"0","s_ipCountry":"0","s_ipCflag":"0","s_ipCflag_width":"20","s_ipCflag_height":"13","s_ipCLic":"1","IP2C LicenseText":"<p style=\\"font-size:25%\\">This page uses the IP-to-Country Database provided by WebHosting.Info (http:\\/\\/www.webhosting.info), available from http:\\/\\/ip-to-country.webhosting.info<\\/p>","s_autoFilterRobots":"0","filterUserAgents":"","filterUserAgentsFile":"-1","saveUserAgents":"0","filterUsers":"0","the_order":"1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16","linkonviewView":"","linkonviewLink":"","linkonviewTarget":"","s_translate_table_texts":"0","s_today":"1","today":"Today","s_yesterday":"1","yesterday":"Yesterday","s_week":"1","s_week_startday":"1","week":"This_Week","s_month":"1","month":"This_Month","s_all":"1","all":"All_Days","show_UsageImgs":"peoples","s_highestVisitsDay":"0","highestVisitsDayText":"Highest","highestVisitsDayTrenner":" ","highestVisitsDayUpdInt":"43200","highestVisitsDayTValue":" $d : $v","s_digit":"1","s_digits_min":"6","s_digits_max":"6","s_digits_warnimg":"","disp_type":"text","widthtable":"90","image_create":"0","image_showDays":"0","image_path":"\\/tmp\\/imagemvc.png","image_newerAsHours":"6","image_sizeX":"160","image_sizeY":"90","image_lineColor":"#000000","image_dia_MainbgColor":"#FFFFFF","image_dia_bgColor":"#DDDDDD","image_dia_RandColor":"#FF0000","s_loggedinUserCount":"0","loggedinUserCountText":"Logged In Users","s_guestsCount":"0","guestsText":"Guests","s_registeredUserCount":"0","registeredUserCountText":"Registered Users","s_registeredUserCountToday":"0","registeredUserCountTodayText":"Registered Today","userCountTrenner":" ","s_loggedinUserNamens":"0","loggedinUserNamensText":"Now Online","s_registeredUserTodayNames":"0","registeredUserTodayNamensText":"Registered Today","s_userNamensOut":"1","userNamensLink":"","userNamensLinkLogged":"0","s_onlyGroupsN_Flag":"0","s_onlyFrontEndCount":"1","s_guestInactivTime":"300","s_userInactivTime":"0","pretext":"","posttext":"","mail_sending":"0","mail_rate":"1000","mail_userIds":"","mail_body":"$a","mail_datetime_fmt":"d.m.Y","trigger_script":"0","trigger_script_rate":"1000","trigger_script_name":"","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(111, 140, 'Đối tác', '', '', 1, 'position-partner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_partner', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(112, 145, 'R3 - Advertisement', '', '', 3, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_advertisement', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(113, 175, 'R1 - Sản phẩm nổi bật', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_latest', 1, 1, '{"catid":["40","41","42","43","44"],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(114, 178, 'Sản phẩm mới', '', '', 1, 'position-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_feature', 1, 0, '{"layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(115, 182, 'DJ-Catalog2 Categories', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_djc2categories', 1, 1, '', 0, '*'),
(116, 183, 'DJ-Catalog2 Frontpage', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_djc2frontpage', 1, 1, '', 0, '*'),
(117, 184, 'DJ-Catalog2 Items', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_djc2items', 1, 1, '', 0, '*'),
(118, 185, 'DJ-Catalog2 Related Items', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_djc2relateditems', 1, 1, '', 0, '*'),
(119, 186, 'DJ-Catalog2 Filters Module', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_djc2filters', 1, 1, '', 0, '*'),
(120, 187, 'DJ-Catalog2 Producers', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_djc2producers', 1, 1, '', 0, '*'),
(121, 188, 'DJ-Catalog2 Search Module', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_djc2search', 1, 1, '', 0, '*'),
(122, 189, 'Projects category', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_djc2categories', 1, 1, '{"moduleclass_sfx":"","expand":"1","parent_category":"0","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `vp_modules_menu`
--

CREATE TABLE IF NOT EXISTS `vp_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vp_modules_menu`
--

INSERT INTO `vp_modules_menu` (`moduleid`, `menuid`) VALUES
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 101),
(17, 102),
(17, 103),
(17, 104),
(17, 105),
(17, 106),
(17, 107),
(17, 108),
(17, 109),
(17, 110),
(17, 111),
(17, 160),
(17, 161),
(17, 162),
(17, 163),
(17, 164),
(17, 165),
(17, 166),
(17, 167),
(17, 168),
(17, 169),
(17, 170),
(17, 171),
(79, 0),
(86, 0),
(87, 0),
(88, 0),
(90, 0),
(91, 0),
(92, 112),
(92, 113),
(93, 0),
(94, 102),
(94, 104),
(94, 105),
(94, 107),
(94, 108),
(94, 109),
(94, 110),
(94, 111),
(102, 0),
(103, 0),
(104, 0),
(105, 101),
(105, 102),
(105, 103),
(105, 104),
(105, 106),
(105, 107),
(105, 108),
(105, 109),
(105, 110),
(105, 112),
(105, 113),
(105, 114),
(105, 115),
(105, 116),
(105, 118),
(105, 119),
(105, 120),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 101),
(112, 102),
(112, 103),
(112, 104),
(112, 105),
(112, 106),
(112, 107),
(112, 108),
(112, 109),
(112, 110),
(112, 111),
(112, 112),
(112, 113),
(113, 101),
(113, 102),
(113, 103),
(113, 104),
(113, 105),
(113, 109),
(113, 111),
(113, 160),
(113, 161),
(113, 163),
(113, 164),
(113, 165),
(113, 166),
(113, 167),
(113, 168),
(113, 169),
(113, 170),
(113, 171),
(114, 101),
(114, 112),
(114, 113),
(122, 104),
(122, 109),
(122, 160),
(122, 161);

-- --------------------------------------------------------

--
-- Table structure for table `vp_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `vp_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_overrider`
--

CREATE TABLE IF NOT EXISTS `vp_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_partner_partner`
--

CREATE TABLE IF NOT EXISTS `vp_partner_partner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `partner_name` varchar(255) NOT NULL,
  `partner_image` varchar(255) NOT NULL,
  `partner_link` varchar(255) NOT NULL,
  `partner_description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vp_partner_partner`
--

INSERT INTO `vp_partner_partner` (`id`, `asset_id`, `ordering`, `created_by`, `partner_name`, `partner_image`, `partner_link`, `partner_description`) VALUES
(1, 136, 1, 471, 'Đối tác 1', 'images/partner/1.jpg', '', ''),
(2, 137, 2, 471, 'Đối tác 2', 'images/partner/2.jpg', '', ''),
(3, 138, 3, 471, 'Đối tác 3', 'images/partner/3.jpg', '', ''),
(4, 139, 4, 471, 'Đối tác 4', 'images/partner/4.jpg', '', ''),
(5, 176, 5, 471, 'Đối tác 6', 'images/partner/1.jpg', '', ''),
(6, 177, 6, 471, 'Đối tác 5', 'images/partner/4.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `format` tinyint(1) NOT NULL DEFAULT '0',
  `description` text,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT '',
  `zoom` int(3) NOT NULL DEFAULT '0',
  `geotitle` varchar(255) NOT NULL DEFAULT '',
  `userid` int(11) NOT NULL DEFAULT '0',
  `videocode` text,
  `vmproductid` int(11) NOT NULL DEFAULT '0',
  `imgorigsize` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `metakey` text,
  `metadesc` text,
  `metadata` text,
  `extlink1` text,
  `extlink2` text,
  `extid` varchar(255) NOT NULL DEFAULT '',
  `exttype` tinyint(1) NOT NULL DEFAULT '0',
  `extl` varchar(255) NOT NULL DEFAULT '',
  `extm` varchar(255) NOT NULL DEFAULT '',
  `exts` varchar(255) NOT NULL DEFAULT '',
  `exto` varchar(255) NOT NULL DEFAULT '',
  `extw` varchar(255) NOT NULL DEFAULT '',
  `exth` varchar(255) NOT NULL DEFAULT '',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `vp_phocagallery`
--

INSERT INTO `vp_phocagallery` (`id`, `catid`, `sid`, `title`, `alias`, `filename`, `format`, `description`, `date`, `hits`, `latitude`, `longitude`, `zoom`, `geotitle`, `userid`, `videocode`, `vmproductid`, `imgorigsize`, `published`, `approved`, `checked_out`, `checked_out_time`, `ordering`, `params`, `metakey`, `metadesc`, `metadata`, `extlink1`, `extlink2`, `extid`, `exttype`, `extl`, `extm`, `exts`, `exto`, `extw`, `exth`, `language`) VALUES
(55, 1, 0, 'anh dep', 'anh-dep', 'anh dep.gif', 1, NULL, '2015-06-01 14:57:20', 6, '0', '0', 0, '', 0, NULL, 0, 23426, 1, 1, 0, '0000-00-00 00:00:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*'),
(56, 1, 0, 'anh dep', 'anh-dep', 'anh dep.jpeg', 1, NULL, '2015-06-01 14:57:20', 3, '0', '0', 0, '', 0, NULL, 0, 4586, 1, 1, 0, '0000-00-00 00:00:00', 2, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*'),
(57, 1, 0, 'anh song', 'anh-song', 'anh song.jpg', 1, NULL, '2015-06-01 14:57:20', 2, '', '', 0, '', 0, NULL, 0, 253996, 1, 1, 0, '0000-00-00 00:00:00', 3, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*'),
(58, 1, 0, 'hinh nen', 'hinh-nen', 'hinh nen.jpg', 1, NULL, '2015-06-01 14:57:20', 1, '', '', 0, '', 0, NULL, 0, 1516702, 1, 1, 0, '0000-00-00 00:00:00', 4, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*'),
(59, 1, 0, 'jloveyou', 'jloveyou', 'jloveyou.gif', 1, NULL, '2015-06-01 14:57:20', 1, '0', '0', 0, '', 0, NULL, 0, 12667, 1, 1, 0, '0000-00-00 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*'),
(60, 1, 0, 'yeu em bang ca trai tim 1', 'yeu-em-bang-ca-trai-tim-1', 'yeu em bang ca trai tim 1.jpg', 2, NULL, '2015-06-01 14:57:20', 0, '', '', 0, '', 0, NULL, 0, 8531, 1, 1, 0, '0000-00-00 00:00:00', 6, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*'),
(61, 2, 0, '3jg13zp3', '3jg13zp3', 'album1/3jg13zp3.gif', 2, NULL, '2015-06-01 15:01:55', 2, '0', '0', 0, '', 0, NULL, 0, 72883, 1, 1, 0, '0000-00-00 00:00:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*'),
(62, 2, 0, '34cr11f8', '34cr11f8', 'album1/34cr11f8.gif', 2, NULL, '2015-06-01 15:01:55', 2, '0', '0', 0, '', 0, NULL, 0, 594015, 1, 1, 0, '0000-00-00 00:00:00', 2, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*'),
(63, 2, 0, 'e9z0hb09', 'e9z0hb09', 'album1/e9z0hb09.gif', 2, NULL, '2015-06-01 15:01:55', 1, '0', '0', 0, '', 0, NULL, 0, 322008, 1, 1, 0, '0000-00-00 00:00:00', 3, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*'),
(64, 2, 0, 'gmto5sca0f8nxgcaixcjvscazzbe2jcaar1vk2cah1oi1ecawt92odca243gb9caxkknkncakox315cau9363ncag1grpyca09egalcabkqropcahy4uejcaaj2vfzcah0yhljcawx2055carxnv8ica6z1kjq', 'gmto5sca0f8nxgcaixcjvscazzbe2jcaar1vk2cah1oi1ecawt92odca243gb9caxkknkncakox315cau9363ncag1grpyca09egalcabkqropcahy4uejcaaj2vfzcah0yhljcawx2055carxnv8ica6z1kjq', 'album1/gmto5sca0f8nxgcaixcjvscazzbe2jcaar1vk2cah1oi1ecawt92odca243gb9caxkknkncakox315cau9363ncag1grpyca09egalcabkqropcahy4uejcaaj2vfzcah0yhljcawx2055carxnv8ica6z1kjq.jpg', 1, NULL, '2015-06-01 15:01:55', 1, '', '', 0, '', 0, NULL, 0, 6979, 1, 1, 0, '0000-00-00 00:00:00', 4, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*'),
(65, 2, 0, 'i28mmn46', 'i28mmn46', 'album1/i28mmn46.gif', 2, NULL, '2015-06-01 15:01:55', 0, '0', '0', 0, '', 0, NULL, 0, 77621, 1, 1, 0, '0000-00-00 00:00:00', 5, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', '', '', '', '', '', '*');

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_categories`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `accessuserid` text,
  `uploaduserid` text,
  `deleteuserid` text,
  `userfolder` text,
  `latitude` varchar(20) NOT NULL DEFAULT '',
  `longitude` varchar(20) NOT NULL DEFAULT '',
  `zoom` int(3) NOT NULL DEFAULT '0',
  `geotitle` varchar(255) NOT NULL DEFAULT '',
  `extid` varchar(255) NOT NULL DEFAULT '',
  `exta` varchar(255) NOT NULL DEFAULT '',
  `extu` varchar(255) NOT NULL DEFAULT '',
  `extauth` varchar(255) NOT NULL DEFAULT '',
  `extfbuid` int(11) NOT NULL DEFAULT '0',
  `extfbcatid` varchar(255) NOT NULL DEFAULT '',
  `params` text,
  `metakey` text,
  `metadesc` text,
  `metadata` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vp_phocagallery_categories`
--

INSERT INTO `vp_phocagallery_categories` (`id`, `parent_id`, `owner_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `date`, `published`, `approved`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `hits`, `accessuserid`, `uploaduserid`, `deleteuserid`, `userfolder`, `latitude`, `longitude`, `zoom`, `geotitle`, `extid`, `exta`, `extu`, `extauth`, `extfbuid`, `extfbcatid`, `params`, `metakey`, `metadesc`, `metadata`, `language`) VALUES
(1, 0, 0, 'Album số 1', '', 'list-1', '', '', '', '', '2015-05-31 00:00:00', 1, 1, 0, '0000-00-00 00:00:00', NULL, 1, 1, 0, 13, '0', '0', '0', '', '', '', 0, '', '', '', '', '', 0, '', NULL, '', '', NULL, '*'),
(2, 0, 0, 'Album số 2', '', 'list-2', '', '', '', '', '2015-05-31 00:00:00', 1, 1, 0, '0000-00-00 00:00:00', NULL, 2, 1, 0, 13, '0', '0', '0', '', '', '', 0, '', '', '', '', '', 0, '', NULL, '', '', NULL, '*');

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_comments`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_fb_users`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_fb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) NOT NULL DEFAULT '',
  `appsid` varchar(255) NOT NULL DEFAULT '',
  `uid` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `secret` varchar(255) NOT NULL DEFAULT '',
  `base_domain` varchar(255) NOT NULL DEFAULT '',
  `expires` varchar(100) NOT NULL DEFAULT '',
  `session_key` text,
  `access_token` text,
  `sig` text,
  `fanpageid` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `comments` text,
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_img_comments`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_img_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `comment` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_img_votes`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_img_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_img_votes_statistics`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_img_votes_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `average` float(8,6) NOT NULL DEFAULT '0.000000',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_styles`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `menulink` text,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vp_phocagallery_styles`
--

INSERT INTO `vp_phocagallery_styles` (`id`, `title`, `alias`, `filename`, `menulink`, `type`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `language`) VALUES
(1, 'Phocagallery', 'phocagallery', 'phocagallery.css', '', 1, 1, 0, '0000-00-00 00:00:00', 1, NULL, '*'),
(2, 'Rating', '', 'rating.css', NULL, 1, 1, 0, '0000-00-00 00:00:00', 2, NULL, '*'),
(3, 'Default', '', 'default.css', NULL, 2, 1, 0, '0000-00-00 00:00:00', 3, NULL, '*'),
(4, 'Bootstrap', '', 'bootstrap.min.css', NULL, 1, 0, 0, '0000-00-00 00:00:00', 4, NULL, '*');

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_tags`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link_cat` int(11) NOT NULL DEFAULT '0',
  `link_ext` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_tags_ref`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_tags_ref` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imgid` int(11) NOT NULL DEFAULT '0',
  `tagid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `i_imgid` (`imgid`,`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_user`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(40) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_votes`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_phocagallery_votes_statistics`
--

CREATE TABLE IF NOT EXISTS `vp_phocagallery_votes_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `average` float(8,6) NOT NULL DEFAULT '0.000000',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_postinstall_messages`
--

CREATE TABLE IF NOT EXISTS `vp_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vp_postinstall_messages`
--

INSERT INTO `vp_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vp_product`
--

CREATE TABLE IF NOT EXISTS `vp_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vp_product`
--

INSERT INTO `vp_product` (`id`, `asset_id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created_by`, `name`, `image`, `price`, `short_description`, `description`, `category_id`) VALUES
(1, 128, 1, 1, 0, '0000-00-00 00:00:00', 471, 'Product 1 1', 'images/powered_by.png', '123', 'Category 1', 'Category 1 Category 1 Category 1', 28),
(2, 129, 2, 1, 0, '0000-00-00 00:00:00', 471, 'Product 2 2', 'images/joomla_black.gif', '333', 'Category 2', 'Category 2 Category 2', 29);

-- --------------------------------------------------------

--
-- Table structure for table `vp_redirect_links`
--

CREATE TABLE IF NOT EXISTS `vp_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) DEFAULT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_schemas`
--

CREATE TABLE IF NOT EXISTS `vp_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vp_schemas`
--

INSERT INTO `vp_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.4.0-2015-02-26'),
(10019, '3.1-2013-04-29'),
(10061, '3.3');

-- --------------------------------------------------------

--
-- Table structure for table `vp_session`
--

CREATE TABLE IF NOT EXISTS `vp_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vp_session`
--

INSERT INTO `vp_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('cgladk34j9rrr0jt303tfqn4g4', 0, 1, '1434469626', '__default|a:8:{s:15:"session.counter";i:99;s:19:"session.timer.start";i:1434463902;s:18:"session.timer.last";i:1434469615;s:17:"session.timer.now";i:1434469624;s:22:"session.client.browser";s:109:"Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36";s:8:"registry";O:24:"Joomla\\Registry\\Registry":2:{s:7:"\\0\\0\\0data";O:8:"stdClass":1:{s:15:"com_attachments";O:8:"stdClass":1:{s:11:"current_url";s:76:"&return=aHR0cDovL2xvY2FsaG9zdC92cGFuL2luZGV4LnBocC92aS9naW9pLXRoaWV1Pw%3D%3D";}}s:9:"separator";s:1:".";}s:4:"user";O:5:"JUser":26:{s:9:"\\0\\0\\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:1:{i:0;s:1:"9";}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:12:"requireReset";N;s:10:"\\0\\0\\0_params";O:24:"Joomla\\Registry\\Registry":2:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}s:9:"separator";s:1:".";}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:9;}s:14:"\\0\\0\\0_authLevels";a:3:{i:0;i:1;i:1;i:1;i:2;i:5;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:13:"\\0\\0\\0userHelper";O:18:"JUserWrapperHelper":0:{}s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"4d690eb1101f6ef8bccb398b32a49577";}', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `vp_tags`
--

CREATE TABLE IF NOT EXISTS `vp_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vp_tags`
--

INSERT INTO `vp_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 0, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vp_template_styles`
--

CREATE TABLE IF NOT EXISTS `vp_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `vp_template_styles`
--

INSERT INTO `vp_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '1', 'VietPan - Thiết bị và Công nghệ', '{"templateColor":"#00a0af","templateBackgroundColor":"#ffffff","logoFile":"images\\/logo.png","sitetitle":"","sitedescription":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}');

-- --------------------------------------------------------

--
-- Table structure for table `vp_ucm_base`
--

CREATE TABLE IF NOT EXISTS `vp_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vp_ucm_content`
--

CREATE TABLE IF NOT EXISTS `vp_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_ucm_history`
--

CREATE TABLE IF NOT EXISTS `vp_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `vp_ucm_history`
--

INSERT INTO `vp_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 8, 5, '', '2015-05-30 17:11:53', 471, 573, '144462e5d139e58568e1f6161c7b26539e17348b', '{"id":8,"asset_id":54,"parent_id":"1","lft":"11","rgt":12,"level":1,"path":null,"extension":"com_content","title":"English Category","alias":"english-category","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-30 17:11:53","modified_user_id":null,"modified_time":"2015-05-30 17:11:53","hits":"0","language":"en-GB","version":null}', 0),
(2, 9, 5, '', '2015-05-30 17:12:13', 471, 594, 'dba5e55660657bcd223abaad70bc4f7679adad05', '{"id":9,"asset_id":55,"parent_id":"1","lft":"13","rgt":14,"level":1,"path":null,"extension":"com_content","title":"Ti\\u1ebfng Vi\\u1ec7t Danh m\\u1ee5c","alias":"ti-ng-vi-t-danh-m-c","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-30 17:12:13","modified_user_id":null,"modified_time":"2015-05-30 17:12:13","hits":"0","language":"vi-VN","version":null}', 0),
(3, 10, 5, '', '2015-05-30 17:12:54', 471, 558, 'fabb5f0fe619e035c1e9b412a7dce290edc0d5cd', '{"id":10,"asset_id":56,"parent_id":"8","lft":"12","rgt":13,"level":2,"path":null,"extension":"com_content","title":"Products","alias":"products","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-30 17:12:54","modified_user_id":null,"modified_time":"2015-05-30 17:12:54","hits":"0","language":"en-GB","version":null}', 0),
(4, 11, 5, '', '2015-05-30 17:15:00', 471, 568, '6c7a6fdf7e5abf19a68a6e23932cc630bb6611b7', '{"id":11,"asset_id":57,"parent_id":"9","lft":"16","rgt":17,"level":2,"path":null,"extension":"com_content","title":"S\\u1ea3n ph\\u1ea9m","alias":"s-n-ph-m","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-30 17:15:00","modified_user_id":null,"modified_time":"2015-05-30 17:15:00","hits":"0","language":"vi-VN","version":null}', 0),
(5, 1, 1, '', '2015-05-30 17:21:08', 471, 1694, '1f17dbe8c5f9a22b545657781e7cbd3b132e5248', '{"id":1,"asset_id":58,"title":"Product 01","alias":"product-01","introtext":"<p>Product 1 description<\\/p>","fulltext":"","state":1,"catid":"10","created":"2015-05-30 17:21:08","created_by":"471","created_by_alias":"","modified":"2015-05-30 17:21:08","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-05-30 17:21:08","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"vi-VN","xreference":""}', 0),
(6, 2, 1, '', '2015-05-30 17:21:23', 471, 1677, '15463cda900fa12370889970b62cdf2a556f9d28', '{"id":2,"asset_id":59,"title":"S\\u1ea3n ph\\u1ea9m 01","alias":"s-n-ph-m-01","introtext":"","fulltext":"","state":1,"catid":"11","created":"2015-05-30 17:21:23","created_by":"471","created_by_alias":"","modified":"2015-05-30 17:21:23","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-05-30 17:21:23","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"vi-VN","xreference":""}', 0),
(7, 2, 1, '', '2015-05-30 17:22:37', 471, 1741, '6157d723647a8532c2a844cae5662c3a5385025b', '{"id":2,"asset_id":"59","title":"S\\u1ea3n ph\\u1ea9m 01","alias":"s-n-ph-m-01","introtext":"<p>M\\u00f4 t\\u1ea3 s\\u1ea3n ph\\u1ea9m 01<\\/p>","fulltext":"","state":1,"catid":"11","created":"2015-05-30 17:21:23","created_by":"471","created_by_alias":"","modified":"2015-05-30 17:22:37","modified_by":"471","checked_out":"471","checked_out_time":"2015-05-30 17:22:23","publish_up":"2015-05-30 17:21:23","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"vi-VN","xreference":""}', 0),
(8, 1, 1, '', '2015-05-30 17:37:48', 471, 1713, 'a697ea0497806bdd0fe204c7372075d25e5a2995', '{"id":1,"asset_id":"58","title":"Product 01","alias":"product-01","introtext":"<p>Product 1 description<\\/p>","fulltext":"","state":1,"catid":"10","created":"2015-05-30 17:21:08","created_by":"471","created_by_alias":"","modified":"2015-05-30 17:37:48","modified_by":"471","checked_out":"471","checked_out_time":"2015-05-30 17:37:38","publish_up":"2015-05-30 17:21:08","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"en-GB","xreference":""}', 0),
(9, 11, 5, '', '2015-05-31 03:51:29', 471, 645, '89980b57a59f9eae500844971765ecfdb1e075f8', '{"id":11,"asset_id":"57","parent_id":"9","lft":"16","rgt":"17","level":"2","path":"ti-ng-vi-t-danh-m-c\\/s-n-ph-m","extension":"com_content","title":"S\\u1ea3n ph\\u1ea9m v\\u00e0 D\\u1ecbch v\\u1ee5","alias":"s-n-ph-m","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-05-31 03:51:20","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-30 17:15:00","modified_user_id":"471","modified_time":"2015-05-31 03:51:29","hits":"0","language":"vi-VN","version":"1"}', 0),
(10, 12, 5, '', '2015-05-31 03:51:55', 471, 561, '7371f502d7515add9be08d0f94d92be6dc9d06f3', '{"id":12,"asset_id":64,"parent_id":"9","lft":"18","rgt":19,"level":2,"path":null,"extension":"com_content","title":"D\\u1ef1 \\u00e1n","alias":"d-an","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 03:51:55","modified_user_id":null,"modified_time":"2015-05-31 03:51:55","hits":"0","language":"vi-VN","version":null}', 0),
(11, 13, 5, '', '2015-05-31 03:52:12', 471, 595, 'eef421217c207a9639fdbd2a7627f0634db41f27', '{"id":13,"asset_id":65,"parent_id":"9","lft":"20","rgt":21,"level":2,"path":null,"extension":"com_content","title":"Th\\u01b0 vi\\u1ec7n h\\u00ecnh \\u1ea3nh","alias":"thu-vi-n-hinh-nh","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 03:52:12","modified_user_id":null,"modified_time":"2015-05-31 03:52:12","hits":"0","language":"vi-VN","version":null}', 0),
(12, 14, 5, '', '2015-05-31 03:52:31', 471, 565, 'fc0a21b96b317ce938d734cde198b186eeccfd1b', '{"id":14,"asset_id":66,"parent_id":"9","lft":"22","rgt":23,"level":2,"path":null,"extension":"com_content","title":"Li\\u00ean h\\u1ec7","alias":"lien-h","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 03:52:31","modified_user_id":null,"modified_time":"2015-05-31 03:52:31","hits":"0","language":"vi-VN","version":null}', 0),
(13, 15, 5, '', '2015-05-31 03:53:16', 471, 572, '7273ab2b4ba4aceed9b9f12017fe9eaab6a86802', '{"id":15,"asset_id":67,"parent_id":"9","lft":"24","rgt":25,"level":2,"path":null,"extension":"com_content","title":"Gi\\u1edbi thi\\u1ec7u","alias":"gi-i-thi-u","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 03:53:16","modified_user_id":null,"modified_time":"2015-05-31 03:53:16","hits":"0","language":"vi-VN","version":null}', 0),
(14, 10, 5, '', '2015-05-31 03:53:44', 471, 619, '6e22deaf4707b1b3046123ef4d788a9743fa18cb', '{"id":10,"asset_id":"56","parent_id":"8","lft":"12","rgt":"13","level":"2","path":"english-category\\/products","extension":"com_content","title":"Products and Services","alias":"products","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-05-31 03:53:30","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-30 17:12:54","modified_user_id":"471","modified_time":"2015-05-31 03:53:44","hits":"0","language":"en-GB","version":"1"}', 0),
(15, 16, 5, '', '2015-05-31 03:54:23', 471, 578, '0319015874c25e0f9194640afcc54f2b149eebeb', '{"id":16,"asset_id":68,"parent_id":"8","lft":"14","rgt":15,"level":2,"path":null,"extension":"com_content","title":"Products reference","alias":"products-reference","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 03:54:23","modified_user_id":null,"modified_time":"2015-05-31 03:54:23","hits":"0","language":"en-GB","version":null}', 0),
(16, 17, 5, '', '2015-05-31 03:54:40', 471, 558, '7ba315590f3af1c761e11b06a28584e38468997f', '{"id":17,"asset_id":69,"parent_id":"8","lft":"16","rgt":17,"level":2,"path":null,"extension":"com_content","title":"Pictures","alias":"pictures","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 03:54:40","modified_user_id":null,"modified_time":"2015-05-31 03:54:40","hits":"0","language":"en-GB","version":null}', 0),
(17, 18, 5, '', '2015-05-31 03:54:55', 471, 562, '8b20b479893b0adf8cbc1d23ef21a774c6c9a01a', '{"id":18,"asset_id":70,"parent_id":"8","lft":"18","rgt":19,"level":2,"path":null,"extension":"com_content","title":"Contact us","alias":"contact-us","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 03:54:55","modified_user_id":null,"modified_time":"2015-05-31 03:54:55","hits":"0","language":"en-GB","version":null}', 0),
(18, 19, 5, '', '2015-05-31 03:55:11', 471, 558, '3240830434ee4a6372cc3ada245ead1f7d342cec', '{"id":19,"asset_id":71,"parent_id":"8","lft":"20","rgt":21,"level":2,"path":null,"extension":"com_content","title":"About us","alias":"about-us","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 03:55:11","modified_user_id":null,"modified_time":"2015-05-31 03:55:11","hits":"0","language":"en-GB","version":null}', 0),
(19, 20, 5, '', '2015-05-31 04:08:36', 471, 597, '88aa1b7f65d51cf311353f81c59ef7ca4a40ea95', '{"id":20,"asset_id":72,"parent_id":"11","lft":"25","rgt":26,"level":3,"path":null,"extension":"com_content","title":"Thi\\u1ebft b\\u1ecb C\\u00f4ng ngh\\u1ec7","alias":"thi-t-b-cong-ngh","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 04:08:36","modified_user_id":null,"modified_time":"2015-05-31 04:08:36","hits":"0","language":"vi-VN","version":null}', 0),
(20, 21, 5, '', '2015-05-31 04:08:59', 471, 593, 'b17e3639f8185ba19925db626360175b8ee72b5a', '{"id":21,"asset_id":73,"parent_id":"11","lft":"27","rgt":28,"level":3,"path":null,"extension":"com_content","title":"H\\u1ec7 th\\u1ed1ng \\u1ed0ng r\\u00e1c","alias":"h-th-ng-ng-rac","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 04:08:59","modified_user_id":null,"modified_time":"2015-05-31 04:08:59","hits":"0","language":"vi-VN","version":null}', 0),
(21, 22, 5, '', '2015-05-31 04:09:19', 471, 596, 'a5368837fc19708e8f8cbcde3e70092aeabf6635', '{"id":22,"asset_id":74,"parent_id":"11","lft":"29","rgt":30,"level":3,"path":null,"extension":"com_content","title":"C\\u00e1c thi\\u1ebft b\\u1ecb kh\\u00e1c","alias":"cac-thi-t-b-khac","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 04:09:19","modified_user_id":null,"modified_time":"2015-05-31 04:09:19","hits":"0","language":"vi-VN","version":null}', 0),
(22, 23, 5, '', '2015-05-31 04:09:58', 471, 589, 'f6956c1faf82fe3d5606e456de89a673ae62cf64', '{"id":23,"asset_id":75,"parent_id":"10","lft":"13","rgt":14,"level":3,"path":null,"extension":"com_content","title":"Technological equipment","alias":"technological-equipment","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 04:09:58","modified_user_id":null,"modified_time":"2015-05-31 04:09:58","hits":"0","language":"en-GB","version":null}', 0),
(23, 24, 5, '', '2015-05-31 04:10:33', 471, 581, '78eeb7d5b4aeb6e428a8c3bdb69534f85a3cc9ca', '{"id":24,"asset_id":76,"parent_id":"10","lft":"15","rgt":16,"level":3,"path":null,"extension":"com_content","title":"Garbage duct system","alias":"garbage-duct-system","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 04:10:33","modified_user_id":null,"modified_time":"2015-05-31 04:10:33","hits":"0","language":"en-GB","version":null}', 0),
(24, 25, 5, '', '2015-05-31 04:10:55', 471, 571, '497f56d8ad5d89f95d82a8ec146e80bc144d1e2a', '{"id":25,"asset_id":77,"parent_id":"10","lft":"17","rgt":18,"level":3,"path":null,"extension":"com_content","title":"Other products","alias":"other-products","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-05-31 04:10:55","modified_user_id":null,"modified_time":"2015-05-31 04:10:55","hits":"0","language":"en-GB","version":null}', 0),
(25, 3, 1, '', '2015-05-31 09:41:08', 471, 10662, '8bc9a72e0194803bd4a01aa89a0f6cda40048c91', '{"id":3,"asset_id":81,"title":"Gi\\u1edbi thi\\u1ec7u","alias":"gi-i-thi-u","introtext":"<table style=\\"width: 100%; margin-bottom: 100px;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td class=\\"chutext_boton\\" colspan=\\"3\\" align=\\"center\\">\\r\\n<h3 style=\\"color: red;\\"><span style=\\"font-size: 36px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">C\\u00f4ng Ty Thi\\u1ebft b\\u1ecb v\\u00e0 C\\u00f4ng ngh\\u1ec7 Vi\\u1ec7t Pan<\\/span><\\/span><\\/h3>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"center\\"><span style=\\"font-size: 18px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><span style=\\"color: #333333;\\">VP Supply &amp; Tech.Service Co. Ltd \\u00a0\\u00a0\\u00a0 <\\/span><\\/strong><\\/span><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td valign=\\"top\\" width=\\"351px\\">\\r\\n<table style=\\"width: 100%;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td class=\\"mauhinhnen_khac\\">\\r\\n<table style=\\"width: 100%;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td valign=\\"top\\" width=\\"50\\"><img src=\\"images\\/article\\/nhay_about.png\\" alt=\\"\\" width=\\"50\\" height=\\"40\\" \\/><\\/td>\\r\\n<td style=\\"text-align: justify;\\" width=\\"20\\">\\u00a0<\\/td>\\r\\n<td valign=\\"top\\">\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><strong style=\\"font-size: 12px;\\">VP Supply &amp; Tech.Service Co. Ltd\\u00a0<\\/strong>(Trading name as\\u00a0<strong style=\\"font-size: 12px;\\">HTD<\\/strong>) formally established as\\u00a0<strong style=\\"font-size: 12px;\\">Cty TNHH Hoang Hung H.T.D<\\/strong>\\u00a0from Hoang Hung Pte on 30th November 1996.\\u00a0<\\/strong><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\"text-align: justify;\\" colspan=\\"3\\">\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong style=\\"font-size: 12px; text-align: start;\\">HTD\\u2019s<\\/strong><strong><span style=\\"text-align: start;\\">\\u00a0<\\/span><span style=\\"text-align: start;\\">combined the experience of local trade and services, installation skills and the world class quality products\\/ systems which are the main factors for the successes in the mid to high\\u2013end building material and specialized construction field in Viet Nam over last 18 years.\\u00a0<\\/span><\\/strong><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><span style=\\"text-align: start;\\">With its long-term associations,<\\/span><strong style=\\"text-align: start;\\">HTD<\\/strong><span style=\\"text-align: start;\\">\\u00a0imports the products and systems directly from the world leading manufacturers James Hardie, Metz, Centria, BMJ,.\\u2026 on the long-term basis of Vietnam authorised distributor\\/ agent arrangements to make the best use of regularly technical support services and products\\/ system installation trainings from those first class manufacturers with the latest international technologies and we commit our single responsibility to our local clients with world class services at national wide.<\\/span><\\/strong><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><span style=\\"color: #333333;\\">C\\u00f4ng ty TNHH Ho\\u00e0ng H\\u01b0ng H.T.D<\\/span><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><span style=\\"color: #333333;\\">HH Supply &amp; Tech.Service Co. Ltd<\\/span><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<img src=\\"images\\/article\\/CTY_HTD.jpg\\" alt=\\"\\" width=\\"357\\" height=\\"487\\" \\/><\\/td>\\r\\n<td style=\\"text-align: justify;\\" width=\\"25px\\">\\u00a0<\\/td>\\r\\n<td valign=\\"top\\">\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">Our specialized products\\/systems are installed through out Vietnam either to the prestigious contractors: Coteccons,\\u00a0 Hoa Binh, Cofico, CC1, Lilama, Vinaconex, Unicons,\\u00a0 Kumho, Obayashi, Shimizu, Marubeni, B.P, Leighton,\\u2026. Or directly to the project owners: Vietnam Brewery Limited, Vinamilk, URC, Pepsi Cola, Dutch Lady, Unilever, Sabeco, Vinasoy, Petro Vietnam, EVN, Siemens,\\u2026.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><img src=\\"images\\/article\\/Hinh_Cty_.jpg\\" alt=\\"\\" width=\\"684\\" height=\\"492\\" \\/><\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u00a0<\\/strong>also provides a very cost effective and technical solutions to design for the installed products and systems: special lining areas: anti acid corrosion, wet areas ,\\u2026.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u00a0<\\/strong>also has our own skillful workmen, overseas trained supervisors and installation teams for most projects either it\\u2019s industrial corrosion resistance flooring systems, ceiling, drywall, toilet partition, Sanishutes for high rises, vacuum\\u2026 or metal claddings,\\u2026<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD <\\/strong>provides import trade services and locally value added processing\\/ fabricating for local market e.g. stock services, duty free imports, market research, marketing &amp; promotion and development new markets for new products: special packaging materials, security cigarette papers\\u2026<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u2019<\\/strong>s management with its staff are well trained and highly motivated to grow stronger in the specialized construction and trade services with the young and capable generation to serve better growing market for the world class products &amp; systems in Vietnam in the years to come.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong style=\\"font-size: 12px;\\">HTD\\u00a0<\\/strong>is the official member of Viet Nam Chamber of Commerce and Industry <strong style=\\"font-size: 12px;\\">(VCCI)<\\/strong> and Australian Chamber of Commerce <strong style=\\"font-size: 12px;\\">(Auscham), <\\/strong>Viet Nam Tobacco Association <strong style=\\"font-size: 12px;\\">(VTA).<\\/strong>\\u00a0<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">General Manager:\\u00a0<strong style=\\"font-size: 12px;\\">Mr. Lai Hoang Huy (Paul) \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>\\u00a0HTD\\u2019S CURRENTLY THE AUTHORISED DISTRIBUTOR VIET NAM:<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Metz\\u00a0industrial floorings and acid proof system: wide application<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 C\\/S Special construction products: EJC, Louver, Acrovyn wallgard...<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 James Hardie \\u00a0:\\u00a0garbage chute, toilet partition, drywall, ceiling<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Centria\\u2019s metal cladding both architectural and industrial claddings: highrise and power station\\/ industrial project<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Trade Service: BMJ\\u2019s and Undopoly special paper services.<\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>","fulltext":"","state":1,"catid":"15","created":"2015-05-31 09:41:08","created_by":"471","created_by_alias":"","modified":"2015-05-31 09:41:08","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-05-31 09:41:08","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(26, 3, 1, '', '2015-05-31 09:41:51', 471, 10681, '9b0a1cd0f1401dba9da0201823f8c4d66eda5a3f', '{"id":3,"asset_id":"81","title":"Gi\\u1edbi thi\\u1ec7u","alias":"gioi-thieu","introtext":"<table style=\\"width: 100%; margin-bottom: 100px;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td class=\\"chutext_boton\\" colspan=\\"3\\" align=\\"center\\">\\r\\n<h3 style=\\"color: red;\\"><span style=\\"font-size: 36px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">C\\u00f4ng Ty Thi\\u1ebft b\\u1ecb v\\u00e0 C\\u00f4ng ngh\\u1ec7 Vi\\u1ec7t Pan<\\/span><\\/span><\\/h3>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"center\\"><span style=\\"font-size: 18px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><span style=\\"color: #333333;\\">VP Supply &amp; Tech.Service Co. Ltd \\u00a0\\u00a0\\u00a0 <\\/span><\\/strong><\\/span><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td valign=\\"top\\" width=\\"351px\\">\\r\\n<table style=\\"width: 100%;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td class=\\"mauhinhnen_khac\\">\\r\\n<table style=\\"width: 100%;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td valign=\\"top\\" width=\\"50\\"><img src=\\"images\\/article\\/nhay_about.png\\" alt=\\"\\" width=\\"50\\" height=\\"40\\" \\/><\\/td>\\r\\n<td style=\\"text-align: justify;\\" width=\\"20\\">\\u00a0<\\/td>\\r\\n<td valign=\\"top\\">\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><strong style=\\"font-size: 12px;\\">VP Supply &amp; Tech.Service Co. Ltd\\u00a0<\\/strong>(Trading name as\\u00a0<strong style=\\"font-size: 12px;\\">HTD<\\/strong>) formally established as\\u00a0<strong style=\\"font-size: 12px;\\">Cty TNHH Hoang Hung H.T.D<\\/strong>\\u00a0from Hoang Hung Pte on 30th November 1996.\\u00a0<\\/strong><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\"text-align: justify;\\" colspan=\\"3\\">\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong style=\\"font-size: 12px; text-align: start;\\">HTD\\u2019s<\\/strong><strong><span style=\\"text-align: start;\\">\\u00a0<\\/span><span style=\\"text-align: start;\\">combined the experience of local trade and services, installation skills and the world class quality products\\/ systems which are the main factors for the successes in the mid to high\\u2013end building material and specialized construction field in Viet Nam over last 18 years.\\u00a0<\\/span><\\/strong><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><span style=\\"text-align: start;\\">With its long-term associations,<\\/span><strong style=\\"text-align: start;\\">HTD<\\/strong><span style=\\"text-align: start;\\">\\u00a0imports the products and systems directly from the world leading manufacturers James Hardie, Metz, Centria, BMJ,.\\u2026 on the long-term basis of Vietnam authorised distributor\\/ agent arrangements to make the best use of regularly technical support services and products\\/ system installation trainings from those first class manufacturers with the latest international technologies and we commit our single responsibility to our local clients with world class services at national wide.<\\/span><\\/strong><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><span style=\\"color: #333333;\\">C\\u00f4ng ty TNHH Ho\\u00e0ng H\\u01b0ng H.T.D<\\/span><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><span style=\\"color: #333333;\\">HH Supply &amp; Tech.Service Co. Ltd<\\/span><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<img src=\\"images\\/article\\/CTY_HTD.jpg\\" alt=\\"\\" width=\\"357\\" height=\\"487\\" \\/><\\/td>\\r\\n<td style=\\"text-align: justify;\\" width=\\"25px\\">\\u00a0<\\/td>\\r\\n<td valign=\\"top\\">\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">Our specialized products\\/systems are installed through out Vietnam either to the prestigious contractors: Coteccons,\\u00a0 Hoa Binh, Cofico, CC1, Lilama, Vinaconex, Unicons,\\u00a0 Kumho, Obayashi, Shimizu, Marubeni, B.P, Leighton,\\u2026. Or directly to the project owners: Vietnam Brewery Limited, Vinamilk, URC, Pepsi Cola, Dutch Lady, Unilever, Sabeco, Vinasoy, Petro Vietnam, EVN, Siemens,\\u2026.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><img src=\\"images\\/article\\/Hinh_Cty_.jpg\\" alt=\\"\\" width=\\"684\\" height=\\"492\\" \\/><\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u00a0<\\/strong>also provides a very cost effective and technical solutions to design for the installed products and systems: special lining areas: anti acid corrosion, wet areas ,\\u2026.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u00a0<\\/strong>also has our own skillful workmen, overseas trained supervisors and installation teams for most projects either it\\u2019s industrial corrosion resistance flooring systems, ceiling, drywall, toilet partition, Sanishutes for high rises, vacuum\\u2026 or metal claddings,\\u2026<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD <\\/strong>provides import trade services and locally value added processing\\/ fabricating for local market e.g. stock services, duty free imports, market research, marketing &amp; promotion and development new markets for new products: special packaging materials, security cigarette papers\\u2026<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u2019<\\/strong>s management with its staff are well trained and highly motivated to grow stronger in the specialized construction and trade services with the young and capable generation to serve better growing market for the world class products &amp; systems in Vietnam in the years to come.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong style=\\"font-size: 12px;\\">HTD\\u00a0<\\/strong>is the official member of Viet Nam Chamber of Commerce and Industry <strong style=\\"font-size: 12px;\\">(VCCI)<\\/strong> and Australian Chamber of Commerce <strong style=\\"font-size: 12px;\\">(Auscham), <\\/strong>Viet Nam Tobacco Association <strong style=\\"font-size: 12px;\\">(VTA).<\\/strong>\\u00a0<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">General Manager:\\u00a0<strong style=\\"font-size: 12px;\\">Mr. Lai Hoang Huy (Paul) \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>\\u00a0HTD\\u2019S CURRENTLY THE AUTHORISED DISTRIBUTOR VIET NAM:<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Metz\\u00a0industrial floorings and acid proof system: wide application<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 C\\/S Special construction products: EJC, Louver, Acrovyn wallgard...<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 James Hardie \\u00a0:\\u00a0garbage chute, toilet partition, drywall, ceiling<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Centria\\u2019s metal cladding both architectural and industrial claddings: highrise and power station\\/ industrial project<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Trade Service: BMJ\\u2019s and Undopoly special paper services.<\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>","fulltext":"","state":1,"catid":"15","created":"2015-05-31 09:41:08","created_by":"471","created_by_alias":"","modified":"2015-05-31 09:41:51","modified_by":"471","checked_out":"471","checked_out_time":"2015-05-31 09:41:41","publish_up":"2015-05-31 09:41:08","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);
INSERT INTO `vp_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(27, 3, 1, '', '2015-05-31 09:44:44', 471, 10685, '979c2cfffb07931fea906e6fd4f503068e33eb6e', '{"id":3,"asset_id":"81","title":"Gi\\u1edbi thi\\u1ec7u","alias":"gioi-thieu","introtext":"<table style=\\"width: 100%; margin-bottom: 100px;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td class=\\"chutext_boton\\" colspan=\\"3\\" align=\\"center\\">\\r\\n<h3 style=\\"color: red;\\"><span style=\\"font-size: 36px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">C\\u00f4ng Ty Thi\\u1ebft b\\u1ecb v\\u00e0 C\\u00f4ng ngh\\u1ec7 Vi\\u1ec7t Pan<\\/span><\\/span><\\/h3>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"center\\"><span style=\\"font-size: 18px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><span style=\\"color: #333333;\\">VP Supply &amp; Tech.Service Co. Ltd \\u00a0\\u00a0\\u00a0 <\\/span><\\/strong><\\/span><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td valign=\\"top\\" width=\\"351px\\">\\r\\n<table style=\\"width: 100%;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td class=\\"mauhinhnen_khac\\">\\r\\n<table style=\\"width: 100%;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td valign=\\"top\\" width=\\"50\\"><img src=\\"images\\/article\\/nhay_about.png\\" alt=\\"\\" width=\\"50\\" height=\\"40\\" \\/><\\/td>\\r\\n<td style=\\"text-align: justify;\\" width=\\"20\\">\\u00a0<\\/td>\\r\\n<td valign=\\"top\\">\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><strong style=\\"font-size: 12px;\\">VP Supply &amp; Tech.Service Co. Ltd\\u00a0<\\/strong>(Trading name as\\u00a0<strong style=\\"font-size: 12px;\\">HTD<\\/strong>) formally established as\\u00a0<strong style=\\"font-size: 12px;\\">Cty TNHH Hoang Hung H.T.D<\\/strong>\\u00a0from Hoang Hung Pte on 30th November 1996.\\u00a0<\\/strong><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\"text-align: justify;\\" colspan=\\"3\\">\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong style=\\"font-size: 12px; text-align: start;\\">HTD\\u2019s<\\/strong><strong><span style=\\"text-align: start;\\">\\u00a0<\\/span><span style=\\"text-align: start;\\">combined the experience of local trade and services, installation skills and the world class quality products\\/ systems which are the main factors for the successes in the mid to high\\u2013end building material and specialized construction field in Viet Nam over last 18 years.\\u00a0<\\/span><\\/strong><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><span style=\\"text-align: start;\\">With its long-term associations,<\\/span><strong style=\\"text-align: start;\\">HTD<\\/strong><span style=\\"text-align: start;\\">\\u00a0imports the products and systems directly from the world leading manufacturers James Hardie, Metz, Centria, BMJ,.\\u2026 on the long-term basis of Vietnam authorised distributor\\/ agent arrangements to make the best use of regularly technical support services and products\\/ system installation trainings from those first class manufacturers with the latest international technologies and we commit our single responsibility to our local clients with world class services at national wide.<\\/span><\\/strong><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><span style=\\"color: #333333;\\">C\\u00f4ng ty TNHH Ho\\u00e0ng H\\u01b0ng H.T.D<\\/span><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><span style=\\"color: #333333;\\">HH Supply &amp; Tech.Service Co. Ltd<\\/span><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<img src=\\"images\\/article\\/CTY_HTD.jpg\\" alt=\\"\\" width=\\"357\\" height=\\"487\\" \\/><\\/td>\\r\\n<td style=\\"text-align: justify;\\" width=\\"25px\\">\\u00a0<\\/td>\\r\\n<td valign=\\"top\\">\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">Our specialized products\\/systems are installed through out Vietnam either to the prestigious contractors: Coteccons,\\u00a0 Hoa Binh, Cofico, CC1, Lilama, Vinaconex, Unicons,\\u00a0 Kumho, Obayashi, Shimizu, Marubeni, B.P, Leighton,\\u2026. Or directly to the project owners: Vietnam Brewery Limited, Vinamilk, URC, Pepsi Cola, Dutch Lady, Unilever, Sabeco, Vinasoy, Petro Vietnam, EVN, Siemens,\\u2026.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><img src=\\"images\\/article\\/Hinh_Cty_.jpg\\" alt=\\"\\" width=\\"684\\" height=\\"492\\" \\/><\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u00a0<\\/strong>also provides a very cost effective and technical solutions to design for the installed products and systems: special lining areas: anti acid corrosion, wet areas ,\\u2026.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u00a0<\\/strong>also has our own skillful workmen, overseas trained supervisors and installation teams for most projects either it\\u2019s industrial corrosion resistance flooring systems, ceiling, drywall, toilet partition, Sanishutes for high rises, vacuum\\u2026 or metal claddings,\\u2026<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD <\\/strong>provides import trade services and locally value added processing\\/ fabricating for local market e.g. stock services, duty free imports, market research, marketing &amp; promotion and development new markets for new products: special packaging materials, security cigarette papers\\u2026<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u2019<\\/strong>s management with its staff are well trained and highly motivated to grow stronger in the specialized construction and trade services with the young and capable generation to serve better growing market for the world class products &amp; systems in Vietnam in the years to come.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong style=\\"font-size: 12px;\\">HTD\\u00a0<\\/strong>is the official member of Viet Nam Chamber of Commerce and Industry <strong style=\\"font-size: 12px;\\">(VCCI)<\\/strong> and Australian Chamber of Commerce <strong style=\\"font-size: 12px;\\">(Auscham), <\\/strong>Viet Nam Tobacco Association <strong style=\\"font-size: 12px;\\">(VTA).<\\/strong>\\u00a0<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">General Manager:\\u00a0<strong style=\\"font-size: 12px;\\">Mr. Lai Hoang Huy (Paul) \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>\\u00a0HTD\\u2019S CURRENTLY THE AUTHORISED DISTRIBUTOR VIET NAM:<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Metz\\u00a0industrial floorings and acid proof system: wide application<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 C\\/S Special construction products: EJC, Louver, Acrovyn wallgard...<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 James Hardie \\u00a0:\\u00a0garbage chute, toilet partition, drywall, ceiling<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Centria\\u2019s metal cladding both architectural and industrial claddings: highrise and power station\\/ industrial project<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Trade Service: BMJ\\u2019s and Undopoly special paper services.<\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>","fulltext":"","state":1,"catid":"15","created":"2015-05-31 09:41:08","created_by":"471","created_by_alias":"","modified":"2015-05-31 09:44:44","modified_by":"471","checked_out":"471","checked_out_time":"2015-05-31 09:44:23","publish_up":"2015-05-31 09:41:08","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"1","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"vi-VN","xreference":""}', 0),
(28, 4, 1, '', '2015-05-31 09:45:33', 471, 10638, '98ab6d151c58f9897faa887efd0985a386346591', '{"id":4,"asset_id":82,"title":"About us","alias":"about-us","introtext":"<table style=\\"width: 100%; margin-bottom: 100px;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td class=\\"chutext_boton\\" colspan=\\"3\\" align=\\"center\\">\\r\\n<h3 style=\\"color: red;\\"><span style=\\"font-size: 36px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">C\\u00f4ng Ty Thi\\u1ebft b\\u1ecb v\\u00e0 C\\u00f4ng ngh\\u1ec7 Vi\\u1ec7t Pan En<\\/span><\\/span><\\/h3>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"center\\"><span style=\\"font-size: 18px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><span style=\\"color: #333333;\\">VP Supply &amp; Tech.Service Co. Ltd En<\\/span><\\/strong><\\/span><\\/span><\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td valign=\\"top\\" width=\\"351px\\">\\r\\n<table style=\\"width: 100%;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td class=\\"mauhinhnen_khac\\">\\r\\n<table style=\\"width: 100%;\\" border=\\"0\\" cellspacing=\\"0\\" cellpadding=\\"0\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td valign=\\"top\\" width=\\"50\\"><img src=\\"images\\/article\\/nhay_about.png\\" alt=\\"\\" width=\\"50\\" height=\\"40\\" \\/><\\/td>\\r\\n<td style=\\"text-align: justify;\\" width=\\"20\\">\\u00a0<\\/td>\\r\\n<td valign=\\"top\\">\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><strong style=\\"font-size: 12px;\\">VP Supply &amp; Tech.Service Co. Ltd\\u00a0<\\/strong>(Trading name as\\u00a0<strong style=\\"font-size: 12px;\\">HTD<\\/strong>) formally established as\\u00a0<strong style=\\"font-size: 12px;\\">Cty TNHH Hoang Hung H.T.D<\\/strong>\\u00a0from Hoang Hung Pte on 30th November 1996.\\u00a0<\\/strong><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td style=\\"text-align: justify;\\" colspan=\\"3\\">\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong style=\\"font-size: 12px; text-align: start;\\">HTD\\u2019s<\\/strong><strong><span style=\\"text-align: start;\\">\\u00a0<\\/span><span style=\\"text-align: start;\\">combined the experience of local trade and services, installation skills and the world class quality products\\/ systems which are the main factors for the successes in the mid to high\\u2013end building material and specialized construction field in Viet Nam over last 18 years.\\u00a0<\\/span><\\/strong><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong><span style=\\"text-align: start;\\">With its long-term associations,<\\/span><strong style=\\"text-align: start;\\">HTD<\\/strong><span style=\\"text-align: start;\\">\\u00a0imports the products and systems directly from the world leading manufacturers James Hardie, Metz, Centria, BMJ,.\\u2026 on the long-term basis of Vietnam authorised distributor\\/ agent arrangements to make the best use of regularly technical support services and products\\/ system installation trainings from those first class manufacturers with the latest international technologies and we commit our single responsibility to our local clients with world class services at national wide.<\\/span><\\/strong><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td colspan=\\"3\\" align=\\"right\\">\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><span style=\\"color: #333333;\\">C\\u00f4ng ty TNHH Ho\\u00e0ng H\\u01b0ng H.T.D<\\/span><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><span style=\\"color: #333333;\\">HH Supply &amp; Tech.Service Co. Ltd<\\/span><\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\u00a0<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<img src=\\"images\\/article\\/CTY_HTD.jpg\\" alt=\\"\\" width=\\"357\\" height=\\"487\\" \\/><\\/td>\\r\\n<td style=\\"text-align: justify;\\" width=\\"25px\\">\\u00a0<\\/td>\\r\\n<td valign=\\"top\\">\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">Our specialized products\\/systems are installed through out Vietnam either to the prestigious contractors: Coteccons,\\u00a0 Hoa Binh, Cofico, CC1, Lilama, Vinaconex, Unicons,\\u00a0 Kumho, Obayashi, Shimizu, Marubeni, B.P, Leighton,\\u2026. Or directly to the project owners: Vietnam Brewery Limited, Vinamilk, URC, Pepsi Cola, Dutch Lady, Unilever, Sabeco, Vinasoy, Petro Vietnam, EVN, Siemens,\\u2026.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><img src=\\"images\\/article\\/Hinh_Cty_.jpg\\" alt=\\"\\" width=\\"684\\" height=\\"492\\" \\/><\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u00a0<\\/strong>also provides a very cost effective and technical solutions to design for the installed products and systems: special lining areas: anti acid corrosion, wet areas ,\\u2026.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u00a0<\\/strong>also has our own skillful workmen, overseas trained supervisors and installation teams for most projects either it\\u2019s industrial corrosion resistance flooring systems, ceiling, drywall, toilet partition, Sanishutes for high rises, vacuum\\u2026 or metal claddings,\\u2026<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD <\\/strong>provides import trade services and locally value added processing\\/ fabricating for local market e.g. stock services, duty free imports, market research, marketing &amp; promotion and development new markets for new products: special packaging materials, security cigarette papers\\u2026<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>HTD\\u2019<\\/strong>s management with its staff are well trained and highly motivated to grow stronger in the specialized construction and trade services with the young and capable generation to serve better growing market for the world class products &amp; systems in Vietnam in the years to come.<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong style=\\"font-size: 12px;\\">HTD\\u00a0<\\/strong>is the official member of Viet Nam Chamber of Commerce and Industry <strong style=\\"font-size: 12px;\\">(VCCI)<\\/strong> and Australian Chamber of Commerce <strong style=\\"font-size: 12px;\\">(Auscham), <\\/strong>Viet Nam Tobacco Association <strong style=\\"font-size: 12px;\\">(VTA).<\\/strong>\\u00a0<\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">General Manager:\\u00a0<strong style=\\"font-size: 12px;\\">Mr. Lai Hoang Huy (Paul) \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p style=\\"text-align: justify;\\"><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\"><strong>\\u00a0HTD\\u2019S CURRENTLY THE AUTHORISED DISTRIBUTOR VIET NAM:<\\/strong><\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Metz\\u00a0industrial floorings and acid proof system: wide application<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 C\\/S Special construction products: EJC, Louver, Acrovyn wallgard...<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 James Hardie \\u00a0:\\u00a0garbage chute, toilet partition, drywall, ceiling<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Centria\\u2019s metal cladding both architectural and industrial claddings: highrise and power station\\/ industrial project<\\/span><\\/span><\\/p>\\r\\n<p><span style=\\"font-size: 12px;\\"><span style=\\"font-family: Arial, Helvetica, sans-serif;\\">- \\u00a0 Trade Service: BMJ\\u2019s and Undopoly special paper services.<\\/span><\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>","fulltext":"","state":1,"catid":"19","created":"2015-05-31 09:45:33","created_by":"471","created_by_alias":"","modified":"2015-05-31 09:45:33","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-05-31 09:45:33","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"en-GB","xreference":""}', 0),
(29, 1, 2, '', '2015-05-31 10:09:48', 471, 1774, '0d19d93d4c3145f490e74fcda75f6a007405b528', '{"id":1,"name":"Li\\u00ean h\\u1ec7","alias":"lien-h","con_position":"","address":"P12A12, nh\\u00e0 17T10, Trung H\\u00f2a - Nh\\u00e2n Ch\\u00ednh, C\\u1ea7u Gi\\u1ea5y, H\\u00e0 N\\u1ed9i","suburb":"","state":"","country":"","postcode":"","telephone":"04.22115515","fax":"04.62512000","misc":"","image":"","email_to":"vunguyenvipa@gmail.com","default_con":0,"published":"1","checked_out":null,"checked_out_time":null,"ordering":1,"params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_misc\\":\\"\\",\\"show_image\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":"471","catid":"4","access":"1","mobile":"","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"vi-VN","created":"2015-05-31 10:09:48","created_by":"471","created_by_alias":"","modified":"2015-05-31 10:09:48","modified_by":null,"metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":1,"hits":null}', 0),
(30, 1, 2, '', '2015-05-31 10:10:02', 471, 1795, 'db0ddd2e5417b451affc65e4c4ed2dacac376791', '{"id":1,"name":"Li\\u00ean h\\u1ec7","alias":"lien-he","con_position":"","address":"P12A12, nh\\u00e0 17T10, Trung H\\u00f2a - Nh\\u00e2n Ch\\u00ednh, C\\u1ea7u Gi\\u1ea5y, H\\u00e0 N\\u1ed9i","suburb":"","state":"","country":"","postcode":"","telephone":"04.22115515","fax":"04.62512000","misc":"","image":"","email_to":"vunguyenvipa@gmail.com","default_con":0,"published":"1","checked_out":"471","checked_out_time":"2015-05-31 10:09:55","ordering":"1","params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_misc\\":\\"\\",\\"show_image\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":"471","catid":"4","access":"1","mobile":"","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"vi-VN","created":"2015-05-31 10:09:48","created_by":"471","created_by_alias":"","modified":"2015-05-31 10:10:02","modified_by":"471","metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":2,"hits":"0"}', 0),
(31, 2, 2, '', '2015-05-31 10:11:45', 471, 1771, 'e4c4be20b6f8f1fd17f004a4ba0885ef920dd4d9', '{"id":2,"name":"Contact us","alias":"contact-us","con_position":"","address":"P12A12, nh\\u00e0 17T10, Trung H\\u00f2a - Nh\\u00e2n Ch\\u00ednh, C\\u1ea7u Gi\\u1ea5y, H\\u00e0 N\\u1ed9i","suburb":"","state":"","country":"","postcode":"","telephone":"04.22115515","fax":"04.62512000","misc":"","image":"","email_to":"vunguyenvipa@gmail.com","default_con":0,"published":"1","checked_out":null,"checked_out_time":null,"ordering":2,"params":"{\\"show_contact_category\\":\\"\\",\\"show_contact_list\\":\\"\\",\\"presentation_style\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_name\\":\\"\\",\\"show_position\\":\\"\\",\\"show_email\\":\\"\\",\\"show_street_address\\":\\"\\",\\"show_suburb\\":\\"\\",\\"show_state\\":\\"\\",\\"show_postcode\\":\\"\\",\\"show_country\\":\\"\\",\\"show_telephone\\":\\"\\",\\"show_mobile\\":\\"\\",\\"show_fax\\":\\"\\",\\"show_webpage\\":\\"\\",\\"show_misc\\":\\"\\",\\"show_image\\":\\"\\",\\"allow_vcard\\":\\"\\",\\"show_articles\\":\\"\\",\\"show_profile\\":\\"\\",\\"show_links\\":\\"\\",\\"linka_name\\":\\"\\",\\"linka\\":false,\\"linkb_name\\":\\"\\",\\"linkb\\":false,\\"linkc_name\\":\\"\\",\\"linkc\\":false,\\"linkd_name\\":\\"\\",\\"linkd\\":false,\\"linke_name\\":\\"\\",\\"linke\\":false,\\"contact_layout\\":\\"\\",\\"show_email_form\\":\\"\\",\\"show_email_copy\\":\\"\\",\\"banned_email\\":\\"\\",\\"banned_subject\\":\\"\\",\\"banned_text\\":\\"\\",\\"validate_session\\":\\"\\",\\"custom_reply\\":\\"\\",\\"redirect\\":\\"\\"}","user_id":"471","catid":"4","access":"1","mobile":"","webpage":false,"sortname1":"","sortname2":"","sortname3":"","language":"en-GB","created":"2015-05-31 10:11:45","created_by":"471","created_by_alias":"","modified":"2015-05-31 10:11:45","modified_by":null,"metakey":"","metadesc":"","metadata":"{\\"robots\\":\\"\\",\\"rights\\":\\"\\"}","featured":"0","xreference":"","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00","version":1,"hits":null}', 0),
(32, 26, 10, '', '2015-06-01 15:22:26', 471, 602, '7cf0712ca98d3ca84a917b00e88ad92f83ff442b', '{"id":26,"asset_id":115,"parent_id":"1","lft":"47","rgt":48,"level":1,"path":null,"extension":"com_banners","title":"Category pro 1","alias":"category-pro-1","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"images\\\\\\/banners\\\\\\/osmbanner1.png\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-01 15:22:26","modified_user_id":null,"modified_time":"2015-06-01 15:22:26","hits":"0","language":"*","version":null}', 0),
(33, 27, 10, '', '2015-06-01 15:22:54', 471, 605, 'e43e220ad4f97eeb84c066d5c7a6bd7750da0106', '{"id":27,"asset_id":116,"parent_id":"1","lft":"49","rgt":50,"level":1,"path":null,"extension":"com_banners","title":"Category pro 2","alias":"category-pro-2","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"images\\\\\\/banners\\\\\\/shop-ad-books.jpg\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-01 15:22:54","modified_user_id":null,"modified_time":"2015-06-01 15:22:54","hits":"0","language":"*","version":null}', 0),
(34, 1, 9, '', '2015-06-01 15:24:11', 471, 720, '5e0b320989e5283a634114d88a7e1cfff573aa83', '{"id":1,"cid":"0","type":"0","name":"Product 1 - pro 1","alias":"product-1-pro-1","imptotal":0,"impmade":"0","clicks":"0","clickurl":false,"state":"1","catid":"26","description":"","custombannercode":"","sticky":"0","ordering":1,"metakey":"","params":"{\\"imageurl\\":\\"images\\\\\\/sampledata\\\\\\/parks\\\\\\/animals\\\\\\/180px_koala_ag1.jpg\\",\\"width\\":\\"\\",\\"height\\":\\"\\",\\"alt\\":\\"\\"}","own_prefix":"0","metakey_prefix":"","purchase_type":"-1","track_clicks":"0","track_impressions":"0","checked_out":null,"checked_out_time":null,"publish_up":"","publish_down":"","reset":"''2015-07-01 00:00:00''","created":"2015-06-01 15:24:11","language":"*","created_by":"","created_by_alias":"","modified":"","modified_by":null,"version":1}', 0),
(35, 2, 9, '', '2015-06-01 15:24:40', 471, 736, 'dcfa33be032db08c9b0de37b2ab5cdb083a7b499', '{"id":2,"cid":"0","type":"0","name":"Product 2 - pro 1","alias":"product-2-pro-1","imptotal":0,"impmade":"0","clicks":"0","clickurl":false,"state":"1","catid":"26","description":"","custombannercode":"","sticky":"0","ordering":2,"metakey":"","params":"{\\"imageurl\\":\\"images\\\\\\/sampledata\\\\\\/parks\\\\\\/animals\\\\\\/200px_phyllopteryx_taeniolatus1.jpg\\",\\"width\\":\\"\\",\\"height\\":\\"\\",\\"alt\\":\\"\\"}","own_prefix":"0","metakey_prefix":"","purchase_type":"-1","track_clicks":"0","track_impressions":"0","checked_out":null,"checked_out_time":null,"publish_up":"","publish_down":"","reset":"''2015-07-01 00:00:00''","created":"2015-06-01 15:24:40","language":"*","created_by":"","created_by_alias":"","modified":"","modified_by":null,"version":1}', 0),
(36, 3, 9, '', '2015-06-01 15:25:03', 471, 736, '50992297ab84fb3d351e6f326d189ed215b1c345', '{"id":3,"cid":"0","type":"0","name":"Product 1 - pro 2","alias":"product-1-pro-2","imptotal":0,"impmade":"0","clicks":"0","clickurl":false,"state":"1","catid":"27","description":"","custombannercode":"","sticky":"0","ordering":3,"metakey":"","params":"{\\"imageurl\\":\\"images\\\\\\/sampledata\\\\\\/parks\\\\\\/animals\\\\\\/800px_phyllopteryx_taeniolatus1.jpg\\",\\"width\\":\\"\\",\\"height\\":\\"\\",\\"alt\\":\\"\\"}","own_prefix":"0","metakey_prefix":"","purchase_type":"-1","track_clicks":"0","track_impressions":"0","checked_out":null,"checked_out_time":null,"publish_up":"","publish_down":"","reset":"''2015-07-01 00:00:00''","created":"2015-06-01 15:25:03","language":"*","created_by":"","created_by_alias":"","modified":"","modified_by":null,"version":1}', 0),
(37, 4, 9, '', '2015-06-01 15:25:27', 471, 740, '035653c7a5045837a74a5c31fdfa9f6a22c506f8', '{"id":4,"cid":"0","type":"0","name":"Product 2 - pro 2","alias":"product-2-pro-2","imptotal":0,"impmade":"0","clicks":"0","clickurl":false,"state":"1","catid":"27","description":"","custombannercode":"","sticky":"0","ordering":4,"metakey":"","params":"{\\"imageurl\\":\\"images\\\\\\/sampledata\\\\\\/parks\\\\\\/animals\\\\\\/789px_spottedquoll_2005_seanmcclean.jpg\\",\\"width\\":\\"\\",\\"height\\":\\"\\",\\"alt\\":\\"\\"}","own_prefix":"0","metakey_prefix":"","purchase_type":"-1","track_clicks":"0","track_impressions":"0","checked_out":null,"checked_out_time":null,"publish_up":"","publish_down":"","reset":"''2015-07-01 00:00:00''","created":"2015-06-01 15:25:27","language":"*","created_by":"","created_by_alias":"","modified":"","modified_by":null,"version":1}', 0),
(38, 30, 5, '', '2015-06-02 16:57:05', 471, 575, '2079e5a935e58e2ff425bc8a2b3227fe80d8ce1f', '{"id":30,"asset_id":130,"parent_id":"1","lft":"55","rgt":56,"level":1,"path":null,"extension":"com_content","title":"Category Product 1","alias":"category-product-1","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-02 16:57:05","modified_user_id":null,"modified_time":"2015-06-02 16:57:05","hits":"0","language":"*","version":null}', 0),
(39, 5, 1, '', '2015-06-02 16:58:03', 471, 1668, 'b74c6695720316765c8e234948b90fef7f1ee177', '{"id":5,"asset_id":131,"title":"Prodcut 1 1 1","alias":"prodcut-1-1-1","introtext":"","fulltext":"","state":1,"catid":"30","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-02 16:58:03","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 16:58:03","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(40, 31, 5, '', '2015-06-02 16:59:03', 471, 576, '5ed7ce0396e9788b4c1227b860b05788ef1c2fe8', '{"id":31,"asset_id":132,"parent_id":"16","lft":"21","rgt":22,"level":3,"path":null,"extension":"com_content","title":"Category Product 2","alias":"category-product-2","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-02 16:59:03","modified_user_id":null,"modified_time":"2015-06-02 16:59:03","hits":"0","language":"*","version":null}', 0),
(41, 30, 5, '', '2015-06-02 16:59:21', 471, 612, '8b9a571ad6fe4dddf6a9918456a16acc90b1d308', '{"id":30,"asset_id":"130","parent_id":"16","lft":"23","rgt":24,"level":3,"path":"category-product-1","extension":"com_content","title":"Category Product 1","alias":"category-product-1","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-02 16:59:10","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-02 16:57:05","modified_user_id":"471","modified_time":"2015-06-02 16:59:21","hits":"0","language":"*","version":"1"}', 0),
(42, 6, 1, '', '2015-06-02 17:00:00', 471, 1670, '118904e70d6b148c79e25e3beee7eb8264cb794e', '{"id":6,"asset_id":133,"title":"Producct 2 2 2","alias":"producct-2-2-2","introtext":"","fulltext":"","state":1,"catid":"31","created":"2015-06-02 17:00:00","created_by":"471","created_by_alias":"","modified":"2015-06-02 17:00:00","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 17:00:00","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(43, 7, 1, '', '2015-06-02 17:01:26', 471, 1664, 'ad7ba9b2339367fcd84e9d400e776a85dad86bb2', '{"id":7,"asset_id":134,"title":"Prodcut 333","alias":"prodcut-333","introtext":"","fulltext":"","state":1,"catid":"31","created":"2015-06-02 17:01:26","created_by":"471","created_by_alias":"","modified":"2015-06-02 17:01:26","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 17:01:26","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(44, 30, 5, '', '2015-06-05 14:46:24', 471, 949, 'adfc6a7bb23fcd6e8fa5d2dd2088c5fd872548b3', '{"id":30,"asset_id":"130","parent_id":"16","lft":"23","rgt":"24","level":"3","path":"english-category\\/products-reference\\/category-product-1","extension":"com_content","title":"Industrial Flooring & Acid Proof","alias":"category-product-1","note":"","description":"<p><a style=\\"color: #1d4a34; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/acid-resistant-flooring-1.html\\">Industrial Flooring &amp; Acid Proof<\\/a><\\/p>","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:46:14","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-02 16:57:05","modified_user_id":"471","modified_time":"2015-06-05 14:46:24","hits":"0","language":"*","version":"1"}', 0),
(45, 31, 5, '', '2015-06-05 14:46:37', 471, 660, 'c991b5d45a54bdf837a794de1feba4f1b712460f', '{"id":31,"asset_id":"132","parent_id":"16","lft":"21","rgt":"22","level":"3","path":"english-category\\/products-reference\\/category-product-2","extension":"com_content","title":"Sanishute Diposal System","alias":"category-product-2","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:46:30","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-02 16:59:03","modified_user_id":"471","modified_time":"2015-06-05 14:46:37","hits":"0","language":"*","version":"1"}', 0),
(46, 31, 5, '', '2015-06-05 14:47:02', 471, 923, '5f10bc533686dfc539c73a4efb9552e745ce9f8e', '{"id":31,"asset_id":"132","parent_id":"16","lft":"21","rgt":"22","level":"3","path":"english-category\\/products-reference\\/category-product-2","extension":"com_content","title":"Sanishute Diposal System","alias":"category-product-2","note":"","description":"<p><a style=\\"color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/sanishute-diposal-2.html\\">Sanishute Diposal System<\\/a><\\/p>","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:46:52","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-02 16:59:03","modified_user_id":"471","modified_time":"2015-06-05 14:47:02","hits":"0","language":"*","version":"1"}', 0),
(47, 32, 5, '', '2015-06-05 14:47:11', 471, 821, 'faf6cf90d0b30fa421fb0e12ba8f181b4af82a79', '{"id":32,"asset_id":146,"parent_id":"1","lft":"59","rgt":60,"level":1,"path":null,"extension":"com_content","title":"Entrance Carpet","alias":"entrance-carpet","note":"","description":"<p><a style=\\"color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/entrance-carpet-7.html\\">Entrance Carpet<\\/a><\\/p>","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:11","modified_user_id":null,"modified_time":"2015-06-05 14:47:11","hits":"0","language":"*","version":null}', 0),
(48, 33, 5, '', '2015-06-05 14:47:19', 471, 881, '0a5d2c5ba49d1dd6ed7d29fc38fc0b860eb32bdf', '{"id":33,"asset_id":147,"parent_id":"1","lft":"61","rgt":62,"level":1,"path":null,"extension":"com_content","title":"Acrovyn Handrail and Wallguard","alias":"acrovyn-handrail-and-wallguard","note":"","description":"<p><a style=\\"color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/acrovyn-handrail-and-wallguard-9.html\\">Acrovyn Handrail and Wallguard<\\/a><\\/p>","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:19","modified_user_id":null,"modified_time":"2015-06-05 14:47:19","hits":"0","language":"*","version":null}', 0),
(49, 34, 5, '', '2015-06-05 14:47:26', 471, 846, '2dbffdc7e18e9bfe3b395bbf3338b54318ced7b7', '{"id":34,"asset_id":148,"parent_id":"1","lft":"63","rgt":64,"level":1,"path":null,"extension":"com_content","title":"Expansion Joint Cover","alias":"expansion-joint-cover","note":"","description":"<p><a style=\\"color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/expansion-joint-cover-10.html\\">Expansion Joint Cover<\\/a><\\/p>","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:26","modified_user_id":null,"modified_time":"2015-06-05 14:47:26","hits":"0","language":"*","version":null}', 0),
(50, 35, 5, '', '2015-06-05 14:47:33', 471, 834, 'ae2a4a4dba83f847f0f9560129ee706c84bc92de', '{"id":35,"asset_id":149,"parent_id":"1","lft":"65","rgt":66,"level":1,"path":null,"extension":"com_content","title":"Performance Louver","alias":"performance-louver","note":"","description":"<p><a style=\\"color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/performance-louver-11.html\\">Performance Louver<\\/a><\\/p>","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:33","modified_user_id":null,"modified_time":"2015-06-05 14:47:33","hits":"0","language":"*","version":null}', 0);
INSERT INTO `vp_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(51, 36, 5, '', '2015-06-05 14:47:40', 471, 799, '44af7348ee6409da79dcf4fb48502c0ce0aac760', '{"id":36,"asset_id":150,"parent_id":"1","lft":"67","rgt":68,"level":1,"path":null,"extension":"com_content","title":"Explovent","alias":"explovent","note":"","description":"<p><a style=\\"color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/explovent-110.html\\">Explovent<\\/a><\\/p>","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:40","modified_user_id":null,"modified_time":"2015-06-05 14:47:40","hits":"0","language":"*","version":null}', 0),
(52, 37, 5, '', '2015-06-05 14:47:46', 471, 867, '842ac6be47975d4cea105d44fb81033b38bee523', '{"id":37,"asset_id":151,"parent_id":"1","lft":"69","rgt":70,"level":1,"path":null,"extension":"com_content","title":"Metal Roof & Wall Cladding","alias":"metal-roof-wall-cladding","note":"","description":"<p><a style=\\"color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/metalroof-amp-wallcladding-3.html\\">Metal Roof &amp; Wall Cladding<\\/a><\\/p>","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:46","modified_user_id":null,"modified_time":"2015-06-05 14:47:46","hits":"0","language":"*","version":null}', 0),
(53, 38, 5, '', '2015-06-05 14:47:53', 471, 848, 'b8a75695b497dbca60fd0e05a28008538d72db8a', '{"id":38,"asset_id":152,"parent_id":"1","lft":"71","rgt":72,"level":1,"path":null,"extension":"com_content","title":"Toilet Partition","alias":"toilet-partition","note":"","description":"<p><a style=\\"color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/toilet-partition;%20compressed%20Sheet-14.html\\">Toilet Partition<\\/a><\\/p>","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:53","modified_user_id":null,"modified_time":"2015-06-05 14:47:53","hits":"0","language":"*","version":null}', 0),
(54, 39, 5, '', '2015-06-05 14:48:01', 471, 860, '55455faf3837bf77e1de3626e815cc7d1f528abc', '{"id":39,"asset_id":153,"parent_id":"1","lft":"73","rgt":74,"level":1,"path":null,"extension":"com_content","title":"Drywall and Ceiling","alias":"drywall-and-ceiling","note":"","description":"<p><a style=\\"color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/drywall-and-ceiling;%20tran;%20tuong%20kho-5.html\\">Drywall and Ceiling<\\/a><\\/p>","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:48:01","modified_user_id":null,"modified_time":"2015-06-05 14:48:01","hits":"0","language":"*","version":null}', 0),
(55, 30, 5, '', '2015-06-05 14:50:33', 471, 668, '68fc31dd64ed9cd3e49bf4fc519cd00907ae0069', '{"id":30,"asset_id":"130","parent_id":"16","lft":"23","rgt":"24","level":"3","path":"english-category\\/products-reference\\/category-product-1","extension":"com_content","title":"Industrial Flooring & Acid Proof","alias":"category-product-1","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:50:21","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-02 16:57:05","modified_user_id":"471","modified_time":"2015-06-05 14:50:33","hits":"0","language":"*","version":"1"}', 0),
(56, 32, 5, '', '2015-06-05 14:51:50', 471, 603, 'a6ca016ae9399a6e8059a6d8b52c1a679c3029c1', '{"id":32,"asset_id":"146","parent_id":"16","lft":"25","rgt":26,"level":3,"path":"entrance-carpet","extension":"com_content","title":"Entrance Carpet","alias":"entrance-carpet","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:51:39","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:11","modified_user_id":"471","modified_time":"2015-06-05 14:51:50","hits":"0","language":"*","version":"1"}', 0),
(57, 33, 5, '', '2015-06-05 14:52:08', 471, 930, '5cd947110f61462cc12682a994f8cc8fe64e81b0', '{"id":33,"asset_id":"147","parent_id":"16","lft":"27","rgt":28,"level":3,"path":"acrovyn-handrail-and-wallguard","extension":"com_content","title":"Acrovyn Handrail and Wallguard","alias":"acrovyn-handrail-and-wallguard","note":"","description":"<p><a style=\\"color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; line-height: 18px; background-color: #f2f2f2;\\" href=\\"http:\\/\\/www.htd-vn.com\\/en\\/project\\/acrovyn-handrail-and-wallguard-9.html\\">Acrovyn Handrail and Wallguard<\\/a><\\/p>","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:51:58","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:19","modified_user_id":"471","modified_time":"2015-06-05 14:52:08","hits":"0","language":"*","version":"1"}', 0),
(58, 34, 5, '', '2015-06-05 14:52:27', 471, 621, '52e5feca13b3d8143c733f1411d23353b2ae7546', '{"id":34,"asset_id":"148","parent_id":"16","lft":"29","rgt":30,"level":3,"path":"expansion-joint-cover","extension":"com_content","title":"Expansion Joint Cover","alias":"expansion-joint-cover","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:52:15","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:26","modified_user_id":"471","modified_time":"2015-06-05 14:52:27","hits":"0","language":"*","version":"1"}', 0),
(59, 35, 5, '', '2015-06-05 14:52:46', 471, 612, 'c544250eceb14fb65f0d12a2d16780ec5dd483d9', '{"id":35,"asset_id":"149","parent_id":"16","lft":"31","rgt":32,"level":3,"path":"performance-louver","extension":"com_content","title":"Performance Louver","alias":"performance-louver","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:52:35","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:33","modified_user_id":"471","modified_time":"2015-06-05 14:52:46","hits":"0","language":"*","version":"1"}', 0),
(60, 36, 5, '', '2015-06-05 14:53:06', 471, 585, '90b296e795b90e8309c3d5e5f236550006ca1bc7', '{"id":36,"asset_id":"150","parent_id":"16","lft":"33","rgt":34,"level":3,"path":"explovent","extension":"com_content","title":"Explovent","alias":"explovent","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:52:56","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:40","modified_user_id":"471","modified_time":"2015-06-05 14:53:06","hits":"0","language":"*","version":"1"}', 0),
(61, 37, 5, '', '2015-06-05 14:53:23', 471, 632, '76a86c4c45f0c4cbdec03b5bb0b4059cc4a0532f', '{"id":37,"asset_id":"151","parent_id":"16","lft":"35","rgt":36,"level":3,"path":"metal-roof-wall-cladding","extension":"com_content","title":"Metal Roof & Wall Cladding","alias":"metal-roof-wall-cladding","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:53:13","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:46","modified_user_id":"471","modified_time":"2015-06-05 14:53:23","hits":"0","language":"*","version":"1"}', 0),
(62, 38, 5, '', '2015-06-05 14:53:40', 471, 606, '62ee4855d13354bbc6419b3c9f9ecd20f4d343f0', '{"id":38,"asset_id":"152","parent_id":"16","lft":"37","rgt":38,"level":3,"path":"toilet-partition","extension":"com_content","title":"Toilet Partition","alias":"toilet-partition","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:53:30","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:53","modified_user_id":"471","modified_time":"2015-06-05 14:53:40","hits":"0","language":"*","version":"1"}', 0),
(63, 39, 5, '', '2015-06-05 14:53:57', 471, 615, '6b4efba403498b9a9c718e1d884dc439076f651f', '{"id":39,"asset_id":"153","parent_id":"16","lft":"39","rgt":40,"level":3,"path":"drywall-and-ceiling","extension":"com_content","title":"Drywall and Ceiling","alias":"drywall-and-ceiling","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-05 14:53:47","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:48:01","modified_user_id":"471","modified_time":"2015-06-05 14:53:57","hits":"0","language":"*","version":"1"}', 0),
(64, 8, 1, '', '2015-06-05 15:07:55', 471, 1653, '415516e08f79b09ac57b9188dfccdb0d2424b331', '{"id":8,"asset_id":154,"title":"Prodcut 1 1 1 (2)","alias":"prodcut-1-1-2","introtext":"","fulltext":"","state":0,"catid":"30","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:07:55","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 16:58:03","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(65, 9, 1, '', '2015-06-05 15:08:16', 471, 1641, 'dcdee9aa81c6508dc7d30159a665580ff88a0c14', '{"id":9,"asset_id":155,"title":"Prodcut a","alias":"prodcut-a","introtext":"","fulltext":"","state":0,"catid":"32","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:08:16","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 16:58:03","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(66, 10, 1, '', '2015-06-05 15:08:31', 471, 1642, 'b43d3effabed45ee3aea787d17c9d0358d173ebd', '{"id":10,"asset_id":156,"title":"Prodcut b","alias":"prodcut-b","introtext":"","fulltext":"","state":0,"catid":"33","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:08:31","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 16:58:03","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(67, 11, 1, '', '2015-06-05 15:08:50', 471, 1642, 'f6d68c57957b27417c655ff4e5968a3d01e0f44c', '{"id":11,"asset_id":157,"title":"Prodcut c","alias":"prodcut-c","introtext":"","fulltext":"","state":0,"catid":"34","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:08:50","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 16:58:03","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(68, 12, 1, '', '2015-06-05 15:09:21', 471, 1642, 'd2cd12ae1304e6fae4297ec9ec3649adf0202bfc', '{"id":12,"asset_id":158,"title":"Prodcut d","alias":"prodcut-d","introtext":"","fulltext":"","state":0,"catid":"35","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:09:21","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 16:58:03","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(69, 13, 1, '', '2015-06-05 15:09:39', 471, 1642, 'a5147507937e77c166ad75b414cd88fc612c077e', '{"id":13,"asset_id":159,"title":"Prodcut e","alias":"prodcut-e","introtext":"","fulltext":"","state":0,"catid":"36","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:09:39","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 16:58:03","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(70, 14, 1, '', '2015-06-05 15:09:56', 471, 1644, '80edd28e80df00055154de89120ab67c9a2b1b93', '{"id":14,"asset_id":160,"title":"Prodcut ff","alias":"prodcut-ff","introtext":"","fulltext":"","state":0,"catid":"37","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:09:56","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 16:58:03","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(71, 15, 1, '', '2015-06-05 15:10:16', 471, 1644, 'f6add12fb21ffd5e411e7bb5cecada1b2f57a750', '{"id":15,"asset_id":161,"title":"Prodcut gg","alias":"prodcut-gg","introtext":"","fulltext":"","state":0,"catid":"38","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:10:16","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 16:58:03","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(72, 16, 1, '', '2015-06-05 15:10:30', 471, 1644, '266f89dbfc9af69cf15f68b9a55c752088eaf7fe', '{"id":16,"asset_id":162,"title":"Prodcut hh","alias":"prodcut-hh","introtext":"","fulltext":"","state":0,"catid":"39","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:10:30","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-02 16:58:03","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(73, 33, 5, '', '2015-06-05 15:11:52', 471, 690, '4c00a563497ffbae4c4021506821d2f8709c180c', '{"id":33,"asset_id":"147","parent_id":"16","lft":"27","rgt":"28","level":"3","path":"english-category\\/products-reference\\/acrovyn-handrail-and-wallguard","extension":"com_content","title":"Acrovyn Handrail and Wallguard","alias":"acrovyn-handrail-and-wallguard","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-05 15:11:41","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-05 14:47:19","modified_user_id":"471","modified_time":"2015-06-05 15:11:52","hits":"0","language":"*","version":"1"}', 0),
(74, 5, 1, '', '2015-06-05 15:46:33', 471, 1703, '5ec67f0dd4737f0a0a96bd906aac9cf6e2dab04f', '{"id":5,"asset_id":"131","title":"Prodcut 1","alias":"prodcut-1-1-1","introtext":"<p>Content here<\\/p>","fulltext":"","state":1,"catid":"30","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:46:33","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-05 15:46:06","publish_up":"2015-06-02 16:58:03","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"1","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(75, 6, 1, '', '2015-06-05 15:46:48', 471, 1793, '0446b6579c8bf814edc7b86dd1f9744a39c262f0', '{"id":6,"asset_id":"133","title":"Producct 2","alias":"producct-2-2-2","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Content here<\\/span><\\/p>","fulltext":"","state":1,"catid":"31","created":"2015-06-02 17:00:00","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:46:48","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-05 15:46:39","publish_up":"2015-06-02 17:00:00","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"1","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(76, 7, 1, '', '2015-06-05 15:47:02', 471, 1789, '06eb93a9ac0c9ba72ef07b03a3837e0ed846b9e7', '{"id":7,"asset_id":"134","title":"Prodcut 3","alias":"prodcut-333","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Content here<\\/span><\\/p>","fulltext":"","state":1,"catid":"31","created":"2015-06-02 17:01:26","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:47:02","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-05 15:46:53","publish_up":"2015-06-02 17:01:26","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(77, 8, 1, '', '2015-06-05 15:47:18', 471, 1791, '7eebc91d2efeb0af0637438e29f01987d47b31a9', '{"id":8,"asset_id":"154","title":"Prodcut 4","alias":"prodcut-1-1-2","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Content here<\\/span><\\/p>","fulltext":"","state":1,"catid":"30","created":"2015-06-02 16:58:03","created_by":"471","created_by_alias":"","modified":"2015-06-05 15:47:18","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-05 15:47:09","publish_up":"2015-06-02 16:58:03","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(78, 40, 5, '', '2015-06-06 14:20:01', 471, 661, 'c54ebe9587d00e62b0713a4626799494ffb10435', '{"id":40,"asset_id":163,"parent_id":"10","lft":"19","rgt":20,"level":3,"path":null,"extension":"com_content","title":"METZ industrial flooring & acid proof system: wide application","alias":"metz-industrial-flooring-acid-proof-system-wide-application","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-06 14:20:01","modified_user_id":null,"modified_time":"2015-06-06 14:20:01","hits":"0","language":"*","version":null}', 0),
(79, 41, 5, '', '2015-06-06 14:20:16', 471, 677, '4c7a8f2271d656069c8d90e57fcbd495dc3f3f93', '{"id":41,"asset_id":164,"parent_id":"10","lft":"21","rgt":22,"level":3,"path":null,"extension":"com_content","title":"JAMES HARDIE\\u2019s garbage chute, drywall, ceiling and toilet partition","alias":"james-hardie-s-garbage-chute-drywall-ceiling-and-toilet-partition","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-06 14:20:16","modified_user_id":null,"modified_time":"2015-06-06 14:20:16","hits":"0","language":"*","version":null}', 0),
(80, 42, 5, '', '2015-06-06 14:20:37', 471, 748, 'ca136e037db90c3149289d2e8b4056fa29fc3806', '{"id":42,"asset_id":165,"parent_id":"10","lft":"23","rgt":24,"level":3,"path":null,"extension":"com_content","title":"Specialized products: EJC, Performance Louvers, Entrance Carpet, Acrovyn Handrail and Wallguard, Explovent.","alias":"specialized-products-ejc-performance-louvers-entrance-carpet-acrovyn-handrail-and-wallguard-explovent","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-06 14:20:37","modified_user_id":null,"modified_time":"2015-06-06 14:20:37","hits":"0","language":"*","version":null}', 0),
(81, 43, 5, '', '2015-06-06 14:20:46', 471, 783, 'ab2babd662d2203377a27c93b31f2d9d8ea82f15', '{"id":43,"asset_id":166,"parent_id":"10","lft":"25","rgt":26,"level":3,"path":null,"extension":"com_content","title":"CENTRIA\\u2019s metal claddings both architectural and industrial claddings : highrises and power station \\/industrial projects","alias":"centria-s-metal-claddings-both-architectural-and-industrial-claddings-highrises-and-power-station-industrial-projects","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-06 14:20:46","modified_user_id":null,"modified_time":"2015-06-06 14:20:46","hits":"0","language":"*","version":null}', 0),
(82, 44, 5, '', '2015-06-06 14:20:57', 471, 651, '9f1e28060dfb169d6334594d3b2a75ae163c6c27', '{"id":44,"asset_id":167,"parent_id":"10","lft":"27","rgt":28,"level":3,"path":null,"extension":"com_content","title":"Trade services : BMJ special paper and INDOPOLY\\u2019s BOPP","alias":"trade-services-bmj-special-paper-and-indopoly-s-bopp","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-06 14:20:57","modified_user_id":null,"modified_time":"2015-06-06 14:20:57","hits":"0","language":"*","version":null}', 0),
(83, 17, 1, '', '2015-06-06 14:23:52', 471, 1684, '4ef89e6bdcaa94d4bb4274157a85bd42b889eafa', '{"id":17,"asset_id":168,"title":"Product 001","alias":"product-001","introtext":"<p>Product 001<\\/p>","fulltext":"","state":1,"catid":"40","created":"2015-06-06 14:23:52","created_by":"471","created_by_alias":"","modified":"2015-06-06 14:23:52","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-06 14:23:52","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(84, 18, 1, '', '2015-06-06 14:24:12', 471, 1772, '367df16ca46d66277eb6aae043509c464bbc5095', '{"id":18,"asset_id":169,"title":"Product 002","alias":"product-002","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Product 002<\\/span><\\/p>","fulltext":"","state":1,"catid":"40","created":"2015-06-06 14:24:12","created_by":"471","created_by_alias":"","modified":"2015-06-06 14:24:12","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-06 14:24:12","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(85, 19, 1, '', '2015-06-06 14:24:38', 471, 1772, '6a1ce2b94eca4d648d7e4d993f30523b0c487010', '{"id":19,"asset_id":170,"title":"Product 003","alias":"product-003","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Product 003<\\/span><\\/p>","fulltext":"","state":1,"catid":"41","created":"2015-06-06 14:24:38","created_by":"471","created_by_alias":"","modified":"2015-06-06 14:24:38","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-06 14:24:38","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(86, 20, 1, '', '2015-06-06 14:24:57', 471, 1772, '3accf53501a44ff3f6b407f095e032bc16e86e74', '{"id":20,"asset_id":171,"title":"Product 004","alias":"product-004","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Product 004<\\/span><\\/p>","fulltext":"","state":1,"catid":"42","created":"2015-06-06 14:24:57","created_by":"471","created_by_alias":"","modified":"2015-06-06 14:24:57","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-06 14:24:57","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);
INSERT INTO `vp_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(87, 21, 1, '', '2015-06-06 14:25:14', 471, 1772, '40f4ba89c14d0039ac38424f6aee5e065174a34d', '{"id":21,"asset_id":172,"title":"Product 005","alias":"product-005","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Product 005<\\/span><\\/p>","fulltext":"","state":1,"catid":"43","created":"2015-06-06 14:25:14","created_by":"471","created_by_alias":"","modified":"2015-06-06 14:25:14","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-06 14:25:14","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(88, 22, 1, '', '2015-06-06 14:25:30', 471, 1772, '28fb7cc7f2f270b11822913edea4ac1ec2a3565d', '{"id":22,"asset_id":173,"title":"Product 006","alias":"product-006","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Product 006<\\/span><\\/p>","fulltext":"","state":1,"catid":"44","created":"2015-06-06 14:25:30","created_by":"471","created_by_alias":"","modified":"2015-06-06 14:25:30","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-06 14:25:30","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(89, 1, 1, '', '2015-06-06 14:27:14', 471, 1713, '7375b1cdec681fccbc4fe3cf73fc7bcd5b4a949f', '{"id":1,"asset_id":"58","title":"Product 01","alias":"product-01","introtext":"<p>Product 1 description<\\/p>","fulltext":"","state":1,"catid":"41","created":"2015-05-30 17:21:08","created_by":"471","created_by_alias":"","modified":"2015-06-06 14:27:14","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-06 14:27:05","publish_up":"2015-05-30 17:21:08","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"4","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"en-GB","xreference":""}', 0),
(90, 1, 1, '', '2015-06-06 14:35:52', 471, 1747, '68cfd836728ff4f5334f2b55e22397cb3836d35e', '{"id":1,"asset_id":"58","title":"Product 01","alias":"product-01","introtext":"<p>Product 1 description<\\/p>","fulltext":"","state":1,"catid":"40","created":"2015-05-30 17:21:08","created_by":"471","created_by_alias":"","modified":"2015-06-06 14:35:52","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-06 14:34:20","publish_up":"2015-05-30 17:21:08","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/project\\\\\\/156_Shute.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":4,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"4","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"en-GB","xreference":""}', 0),
(91, 17, 1, '', '2015-06-06 14:36:25', 471, 1735, '85faf6b90fadeea1684e47e48732a70cf6bd9b36', '{"id":17,"asset_id":"168","title":"Product 001","alias":"product-001","introtext":"<p>Product 001<\\/p>","fulltext":"","state":1,"catid":"40","created":"2015-06-06 14:23:52","created_by":"471","created_by_alias":"","modified":"2015-06-06 14:36:25","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-06 14:36:06","publish_up":"2015-06-06 14:23:52","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/project\\\\\\/156_Tam.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(92, 18, 1, '', '2015-06-06 14:36:38', 471, 1835, '707bc5e5ac0eb0176d8085853482aad5ca21cef0', '{"id":18,"asset_id":"169","title":"Product 002","alias":"product-002","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Product 002<\\/span><\\/p>","fulltext":"","state":1,"catid":"40","created":"2015-06-06 14:24:12","created_by":"471","created_by_alias":"","modified":"2015-06-06 14:36:38","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-06 14:36:07","publish_up":"2015-06-06 14:24:12","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/project\\\\\\/156_WC_pasteur_copy.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(93, 23, 1, '', '2015-06-06 15:10:12', 471, 1755, '7e72fcf7aedcad3fed30fa9ad4d992b9fa7b2ee9', '{"id":23,"asset_id":174,"title":"Product 006 (2)","alias":"product-7","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Product 006<\\/span><\\/p>","fulltext":"","state":0,"catid":"44","created":"2015-06-06 14:25:30","created_by":"471","created_by_alias":"","modified":"2015-06-06 15:10:12","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-06 14:25:30","publish_down":"","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(94, 23, 1, '', '2015-06-06 15:10:30', 471, 1787, '4be11dfa26d12c9dcefd716af2521287aaf621a7', '{"id":23,"asset_id":"174","title":"Product tttt","alias":"t","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Product 006ttttt<\\/span><\\/p>","fulltext":"","state":1,"catid":"40","created":"2015-06-06 14:25:30","created_by":"471","created_by_alias":"","modified":"2015-06-06 15:10:30","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-06 15:10:12","publish_up":"2015-06-06 14:25:30","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(95, 23, 1, '', '2015-06-06 15:10:52', 471, 1811, 'e3adabc281cde41ca29fe150634e363b2b49e50b', '{"id":23,"asset_id":"174","title":"Product tttt","alias":"t","introtext":"<p><span style=\\"font-size: 12.1599998474121px; line-height: 15.8079996109009px;\\">Product 006ttttt<\\/span><\\/p>","fulltext":"","state":1,"catid":"40","created":"2015-06-06 14:25:30","created_by":"471","created_by_alias":"","modified":"2015-06-06 15:10:52","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-06 15:10:30","publish_up":"2015-06-06 14:25:30","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/advs\\\\\\/13.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(96, 17, 1, '', '2015-06-06 15:22:53', 471, 5097, '96b5d56b74a287943aaf86a731fda654d3bd608e', '{"id":17,"asset_id":"168","title":"Product 001","alias":"product-001","introtext":"<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i r\\u00e1c SaniShute k\\u1ebft h\\u1ee3p gi\\u1eefa nh\\u1eefng thi\\u1ebft k\\u1ebf ti\\u00ean ti\\u1ebfn v\\u00e0 ch\\u1ea5t li\\u1ec7u b\\u1ec1n b\\u1ec9 t\\u1ea1o n\\u00ean h\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i r\\u00e1c v\\u00e0 \\u1ed1ng th\\u1ea3i \\u0111\\u1ed3 d\\u01a1 h\\u00e0ng \\u0111\\u1ea7u th\\u1ebf gi\\u1edbi . H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i Sanishute l\\u00e0 h\\u1ec7 th\\u1ed1ng ho\\u00e0n ch\\u1ec9nh , thi\\u1ebft k\\u1ebf d\\u1ef1a theo nguy\\u00ean l\\u00fd tr\\u1ecdng l\\u1ef1c , \\u0111\\u00e1p \\u1ee9ng c\\u00e1c nhu c\\u1ea7u cho h\\u1ec7 th\\u1ed1ng nh\\u00e0 cao t\\u1ea7ng<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">C\\u00c1CH \\u00c2M : H\\u1ec7 th\\u1ed1ng t\\u01b0\\u1eddng \\u0111\\u1eb7c c\\u1ee7a Sanishute gi\\u00fap gi\\u1ea3m thi\\u1ec3u ti\\u1ebfng \\u1ed3ng \\u0111\\u00e1ng k\\u1ec3 t\\u1eeb c\\u00e1c v\\u1eadt di chuy\\u1ec3n trong \\u1ed1ng so v\\u1edbi c\\u00e1c h\\u1ec7 th\\u1ed1ng \\u1ed1ng m\\u1ecfng kh\\u00e1c . Kh\\u1ed1i l\\u01b0\\u1ee3ng c\\u1ee7a h\\u1ec7 th\\u1ed1ng \\u1ed1ng Sanishute l\\u00e0m gi\\u1ea3m thi\\u1ec3u kh\\u1ea3 n\\u0103ng \\u00e2m thanh c\\u00f3 th\\u1ec3 truy\\u1ec1n qua\\u00a0 \\u1ed1ng.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">KH\\u00d4NG C\\u00d3 CH\\u1ea4T \\u0110\\u1ed8C H\\u1ea0I : H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i Sanishute l\\u00e0m t\\u1eeb h\\u1ec7 th\\u1ed1ng \\u1ed1ng \\u0111\\u01b0\\u1ee3c gia c\\u1ed1 c\\u1ee7a James Hardie v\\u1edbi ch\\u1ea5t li\\u1ec7u l\\u00e0m t\\u1eeb xi m\\u0103ng pha s\\u1ee3i xenlulo \\u0111\\u01b0\\u1ee3c s\\u1ea3n xu\\u1ea5t v\\u1edbi \\u0111\\u1ed9 b\\u1ec1n cao . Nh\\u1eefng h\\u1ec7 th\\u1ed1ng kh\\u00e1c th\\u01b0\\u1eddng \\u0111\\u01b0\\u1ee3c l\\u00e0m t\\u1eeb th\\u00e9p v\\u00e0 c\\u00f3 th\\u1ec3 b\\u1ecb \\u0103n m\\u00f2n theo th\\u1eddi gian<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">\\u0110\\u1ed8 B\\u1ec0N :\\u00a0 H\\u1ec7 th\\u1ed1ng \\u1ed1ng c\\u1ee7a Sanishute \\u0111\\u01b0\\u1ee3c l\\u00e0m t\\u1eeb b\\u00ea t\\u00f4ng gia c\\u1ed1 v\\u00e0 s\\u1ee3i xenlulo l\\u00e0 c\\u1ef1c k\\u00ec b\\u1ec1n b\\u1ec9 .\\u00a0 Nh\\u1eefng \\u1ed1ng n\\u00e0y \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c thi\\u1ebft k\\u1ebf \\u0111\\u1eb7c bi\\u1ec7t \\u0111\\u1ec3 ch\\u1ed1ng l\\u1ea1i l\\u1ef1c va ch\\u1ea1m t\\u1eeb c\\u00e1c v\\u1eadt r\\u01a1i v\\u00e0 kh\\u00f4ng b\\u1ecb m\\u1ebb hay v\\u1ee1 trong qu\\u00e1 tr\\u00ecnh s\\u1eed d\\u1ee5ng . Ngo\\u00e0i ra , h\\u1ec7 th\\u1ed1ng \\u1ed1ng n\\u00e0y c\\u00f2n gi\\u1ea3m thi\\u1ec3u s\\u1ed1 l\\u01b0\\u1ee3ng m\\u1ed1i n\\u1ed1i ,t\\u1ea1o n\\u00ean b\\u1ec1 m\\u1eb7t b\\u1eb1ng ph\\u1eb3ng b\\u00ean trong \\u0111\\u1ec3 \\u0111\\u1ea3m b\\u1ea3o b\\u1ec1 m\\u1eb7t b\\u1eb1ng ph\\u1eb3ng v\\u00e0 kh\\u00f4ng c\\u00f3 l\\u1ed7 h\\u1edf.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\">\\u00a0<\\/p>","fulltext":"","state":1,"catid":"40","created":"2015-06-06 14:23:52","created_by":"471","created_by_alias":"","modified":"2015-06-06 15:22:53","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-06 15:22:27","publish_up":"2015-06-06 14:23:52","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/project\\\\\\/156_Tam.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"4","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(97, 45, 5, '', '2015-06-07 11:09:26', 471, 681, 'a1593831f5480b119cc076c15a69139dd1f6f4e6', '{"id":45,"asset_id":179,"parent_id":"10","lft":"29","rgt":30,"level":3,"path":null,"extension":"com_content","title":"JAMES HARDIE\\u2019s garbage chute, drywall, ceiling and toilet partition (2)","alias":"james-hardie-s-garbage-chute-drywall-ceiling-and-toilet-partition-2","note":"","description":"","published":0,"checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-07 11:09:26","modified_user_id":null,"modified_time":"2015-06-07 11:09:26","hits":"0","language":"*","version":null}', 0),
(98, 45, 5, '', '2015-06-07 11:09:51', 471, 905, '8873ce06394d273b60d4ad991910290ed84b8c76', '{"id":45,"asset_id":"179","parent_id":"11","lft":"67","rgt":68,"level":3,"path":"english-category\\/products\\/james-hardie-s-garbage-chute-drywall-ceiling-and-toilet-partition-2","extension":"com_content","title":"H\\u1ec7 th\\u1ed1ng n\\u1ec1n c\\u00f4ng nghi\\u1ec7p v\\u00e0 ch\\u1ed1ng h\\u00f3a ch\\u1ea5t METZ: \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng r\\u1ed9ng r\\u00e3i \\u1edf nhi\\u1ec1u khu v\\u1ef1c","alias":"james-hardie-s-garbage-chute-drywall-ceiling-and-toilet-partition-2","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-07 11:09:26","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-07 11:09:26","modified_user_id":"471","modified_time":"2015-06-07 11:09:51","hits":"0","language":"vi-VN","version":"1"}', 0),
(99, 40, 5, '', '2015-06-07 11:10:03', 471, 774, '9eedd458db281cc654e748bf90cf262bf27a6884', '{"id":40,"asset_id":"163","parent_id":"10","lft":"19","rgt":"20","level":"3","path":"english-category\\/products\\/metz-industrial-flooring-acid-proof-system-wide-application","extension":"com_content","title":"METZ industrial flooring & acid proof system: wide application","alias":"metz-industrial-flooring-acid-proof-system-wide-application","note":"","description":"","published":"1","checked_out":"471","checked_out_time":"2015-06-07 11:09:57","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"471","created_time":"2015-06-06 14:20:01","modified_user_id":"471","modified_time":"2015-06-07 11:10:03","hits":"0","language":"en-GB","version":"1"}', 0),
(100, 24, 1, '', '2015-06-07 11:10:51', 471, 5445, '3790ced91df61f7160e5968dad5b813e1f0dc253', '{"id":24,"asset_id":180,"title":"Product 001 english","alias":"product-001-english","introtext":"<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i r\\u00e1c SaniShute k\\u1ebft h\\u1ee3p gi\\u1eefa nh\\u1eefng thi\\u1ebft k\\u1ebf ti\\u00ean ti\\u1ebfn v\\u00e0 ch\\u1ea5t li\\u1ec7u b\\u1ec1n b\\u1ec9 t\\u1ea1o n\\u00ean h\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i r\\u00e1c v\\u00e0 \\u1ed1ng th\\u1ea3i \\u0111\\u1ed3 d\\u01a1 h\\u00e0ng \\u0111\\u1ea7u th\\u1ebf gi\\u1edbi . H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i Sanishute l\\u00e0 h\\u1ec7 th\\u1ed1ng ho\\u00e0n ch\\u1ec9nh , thi\\u1ebft k\\u1ebf d\\u1ef1a theo nguy\\u00ean l\\u00fd tr\\u1ecdng l\\u1ef1c , \\u0111\\u00e1p \\u1ee9ng c\\u00e1c nhu c\\u1ea7u cho h\\u1ec7 th\\u1ed1ng nh\\u00e0 cao t\\u1ea7ng<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">C\\u00c1CH \\u00c2M : H\\u1ec7 th\\u1ed1ng t\\u01b0\\u1eddng \\u0111\\u1eb7c c\\u1ee7a Sanishute gi\\u00fap gi\\u1ea3m thi\\u1ec3u ti\\u1ebfng \\u1ed3ng \\u0111\\u00e1ng k\\u1ec3 t\\u1eeb c\\u00e1c v\\u1eadt di chuy\\u1ec3n trong \\u1ed1ng so v\\u1edbi c\\u00e1c h\\u1ec7 th\\u1ed1ng \\u1ed1ng m\\u1ecfng kh\\u00e1c . Kh\\u1ed1i l\\u01b0\\u1ee3ng c\\u1ee7a h\\u1ec7 th\\u1ed1ng \\u1ed1ng Sanishute l\\u00e0m gi\\u1ea3m thi\\u1ec3u kh\\u1ea3 n\\u0103ng \\u00e2m thanh c\\u00f3 th\\u1ec3 truy\\u1ec1n qua\\u00a0 \\u1ed1ng.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">KH\\u00d4NG C\\u00d3 CH\\u1ea4T \\u0110\\u1ed8C H\\u1ea0I : H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i Sanishute l\\u00e0m t\\u1eeb h\\u1ec7 th\\u1ed1ng \\u1ed1ng \\u0111\\u01b0\\u1ee3c gia c\\u1ed1 c\\u1ee7a James Hardie v\\u1edbi ch\\u1ea5t li\\u1ec7u l\\u00e0m t\\u1eeb xi m\\u0103ng pha s\\u1ee3i xenlulo \\u0111\\u01b0\\u1ee3c s\\u1ea3n xu\\u1ea5t v\\u1edbi \\u0111\\u1ed9 b\\u1ec1n cao . Nh\\u1eefng h\\u1ec7 th\\u1ed1ng kh\\u00e1c th\\u01b0\\u1eddng \\u0111\\u01b0\\u1ee3c l\\u00e0m t\\u1eeb th\\u00e9p v\\u00e0 c\\u00f3 th\\u1ec3 b\\u1ecb \\u0103n m\\u00f2n theo th\\u1eddi gian<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">\\u0110\\u1ed8 B\\u1ec0N :\\u00a0 H\\u1ec7 th\\u1ed1ng \\u1ed1ng c\\u1ee7a Sanishute \\u0111\\u01b0\\u1ee3c l\\u00e0m t\\u1eeb b\\u00ea t\\u00f4ng gia c\\u1ed1 v\\u00e0 s\\u1ee3i xenlulo l\\u00e0 c\\u1ef1c k\\u00ec b\\u1ec1n b\\u1ec9 .\\u00a0 Nh\\u1eefng \\u1ed1ng n\\u00e0y \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c thi\\u1ebft k\\u1ebf \\u0111\\u1eb7c bi\\u1ec7t \\u0111\\u1ec3 ch\\u1ed1ng l\\u1ea1i l\\u1ef1c va ch\\u1ea1m t\\u1eeb c\\u00e1c v\\u1eadt r\\u01a1i v\\u00e0 kh\\u00f4ng b\\u1ecb m\\u1ebb hay v\\u1ee1 trong qu\\u00e1 tr\\u00ecnh s\\u1eed d\\u1ee5ng . Ngo\\u00e0i ra , h\\u1ec7 th\\u1ed1ng \\u1ed1ng n\\u00e0y c\\u00f2n gi\\u1ea3m thi\\u1ec3u s\\u1ed1 l\\u01b0\\u1ee3ng m\\u1ed1i n\\u1ed1i ,t\\u1ea1o n\\u00ean b\\u1ec1 m\\u1eb7t b\\u1eb1ng ph\\u1eb3ng b\\u00ean trong \\u0111\\u1ec3 \\u0111\\u1ea3m b\\u1ea3o b\\u1ec1 m\\u1eb7t b\\u1eb1ng ph\\u1eb3ng v\\u00e0 kh\\u00f4ng c\\u00f3 l\\u1ed7 h\\u1edf.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\">\\u00a0<\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">English<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\">\\u00a0<\\/p>","fulltext":"","state":0,"catid":"40","created":"2015-06-06 14:23:52","created_by":"471","created_by_alias":"","modified":"2015-06-07 11:10:51","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-06-06 14:23:52","publish_down":"","images":"{\\"image_intro\\":\\"images\\\\\\/project\\\\\\/156_Tam.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(101, 24, 1, '', '2015-06-07 11:11:15', 471, 5351, '7efd48baba76c121511346c1dc1c0d27d4a8a1dc', '{"id":24,"asset_id":"180","title":"H\\u1ec7 th\\u1ed1ng s\\u00e0n c\\u00f4ng nghi\\u1ec7p v\\u00e0 ch\\u1ed1ng \\u0103n m\\u00f2n","alias":"product-001-english","introtext":"<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i r\\u00e1c SaniShute k\\u1ebft h\\u1ee3p gi\\u1eefa nh\\u1eefng thi\\u1ebft k\\u1ebf ti\\u00ean ti\\u1ebfn v\\u00e0 ch\\u1ea5t li\\u1ec7u b\\u1ec1n b\\u1ec9 t\\u1ea1o n\\u00ean h\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i r\\u00e1c v\\u00e0 \\u1ed1ng th\\u1ea3i \\u0111\\u1ed3 d\\u01a1 h\\u00e0ng \\u0111\\u1ea7u th\\u1ebf gi\\u1edbi . H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i Sanishute l\\u00e0 h\\u1ec7 th\\u1ed1ng ho\\u00e0n ch\\u1ec9nh , thi\\u1ebft k\\u1ebf d\\u1ef1a theo nguy\\u00ean l\\u00fd tr\\u1ecdng l\\u1ef1c , \\u0111\\u00e1p \\u1ee9ng c\\u00e1c nhu c\\u1ea7u cho h\\u1ec7 th\\u1ed1ng nh\\u00e0 cao t\\u1ea7ng<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">C\\u00c1CH \\u00c2M : H\\u1ec7 th\\u1ed1ng t\\u01b0\\u1eddng \\u0111\\u1eb7c c\\u1ee7a Sanishute gi\\u00fap gi\\u1ea3m thi\\u1ec3u ti\\u1ebfng \\u1ed3ng \\u0111\\u00e1ng k\\u1ec3 t\\u1eeb c\\u00e1c v\\u1eadt di chuy\\u1ec3n trong \\u1ed1ng so v\\u1edbi c\\u00e1c h\\u1ec7 th\\u1ed1ng \\u1ed1ng m\\u1ecfng kh\\u00e1c . Kh\\u1ed1i l\\u01b0\\u1ee3ng c\\u1ee7a h\\u1ec7 th\\u1ed1ng \\u1ed1ng Sanishute l\\u00e0m gi\\u1ea3m thi\\u1ec3u kh\\u1ea3 n\\u0103ng \\u00e2m thanh c\\u00f3 th\\u1ec3 truy\\u1ec1n qua\\u00a0 \\u1ed1ng.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">KH\\u00d4NG C\\u00d3 CH\\u1ea4T \\u0110\\u1ed8C H\\u1ea0I : H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i Sanishute l\\u00e0m t\\u1eeb h\\u1ec7 th\\u1ed1ng \\u1ed1ng \\u0111\\u01b0\\u1ee3c gia c\\u1ed1 c\\u1ee7a James Hardie v\\u1edbi ch\\u1ea5t li\\u1ec7u l\\u00e0m t\\u1eeb xi m\\u0103ng pha s\\u1ee3i xenlulo \\u0111\\u01b0\\u1ee3c s\\u1ea3n xu\\u1ea5t v\\u1edbi \\u0111\\u1ed9 b\\u1ec1n cao . Nh\\u1eefng h\\u1ec7 th\\u1ed1ng kh\\u00e1c th\\u01b0\\u1eddng \\u0111\\u01b0\\u1ee3c l\\u00e0m t\\u1eeb th\\u00e9p v\\u00e0 c\\u00f3 th\\u1ec3 b\\u1ecb \\u0103n m\\u00f2n theo th\\u1eddi gian<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">\\u0110\\u1ed8 B\\u1ec0N :\\u00a0 H\\u1ec7 th\\u1ed1ng \\u1ed1ng c\\u1ee7a Sanishute \\u0111\\u01b0\\u1ee3c l\\u00e0m t\\u1eeb b\\u00ea t\\u00f4ng gia c\\u1ed1 v\\u00e0 s\\u1ee3i xenlulo l\\u00e0 c\\u1ef1c k\\u00ec b\\u1ec1n b\\u1ec9 .\\u00a0 Nh\\u1eefng \\u1ed1ng n\\u00e0y \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c thi\\u1ebft k\\u1ebf \\u0111\\u1eb7c bi\\u1ec7t \\u0111\\u1ec3 ch\\u1ed1ng l\\u1ea1i l\\u1ef1c va ch\\u1ea1m t\\u1eeb c\\u00e1c v\\u1eadt r\\u01a1i v\\u00e0 kh\\u00f4ng b\\u1ecb m\\u1ebb hay v\\u1ee1 trong qu\\u00e1 tr\\u00ecnh s\\u1eed d\\u1ee5ng . Ngo\\u00e0i ra , h\\u1ec7 th\\u1ed1ng \\u1ed1ng n\\u00e0y c\\u00f2n gi\\u1ea3m thi\\u1ec3u s\\u1ed1 l\\u01b0\\u1ee3ng m\\u1ed1i n\\u1ed1i ,t\\u1ea1o n\\u00ean b\\u1ec1 m\\u1eb7t b\\u1eb1ng ph\\u1eb3ng b\\u00ean trong \\u0111\\u1ec3 \\u0111\\u1ea3m b\\u1ea3o b\\u1ec1 m\\u1eb7t b\\u1eb1ng ph\\u1eb3ng v\\u00e0 kh\\u00f4ng c\\u00f3 l\\u1ed7 h\\u1edf.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\">\\u00a0<\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\">Tieng viet<\\/p>","fulltext":"","state":1,"catid":"45","created":"2015-06-06 14:23:52","created_by":"471","created_by_alias":"","modified":"2015-06-07 11:11:15","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-07 11:10:51","publish_up":"2015-06-06 14:23:52","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/project\\\\\\/156_Tam.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"vi-VN","xreference":""}', 0),
(102, 17, 1, '', '2015-06-07 11:11:31', 471, 5102, '9960c66ec081170b7d9225e7601cd3d6c2b04f4e', '{"id":17,"asset_id":"168","title":"Product 001","alias":"product-001","introtext":"<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i r\\u00e1c SaniShute k\\u1ebft h\\u1ee3p gi\\u1eefa nh\\u1eefng thi\\u1ebft k\\u1ebf ti\\u00ean ti\\u1ebfn v\\u00e0 ch\\u1ea5t li\\u1ec7u b\\u1ec1n b\\u1ec9 t\\u1ea1o n\\u00ean h\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i r\\u00e1c v\\u00e0 \\u1ed1ng th\\u1ea3i \\u0111\\u1ed3 d\\u01a1 h\\u00e0ng \\u0111\\u1ea7u th\\u1ebf gi\\u1edbi . H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i Sanishute l\\u00e0 h\\u1ec7 th\\u1ed1ng ho\\u00e0n ch\\u1ec9nh , thi\\u1ebft k\\u1ebf d\\u1ef1a theo nguy\\u00ean l\\u00fd tr\\u1ecdng l\\u1ef1c , \\u0111\\u00e1p \\u1ee9ng c\\u00e1c nhu c\\u1ea7u cho h\\u1ec7 th\\u1ed1ng nh\\u00e0 cao t\\u1ea7ng<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">C\\u00c1CH \\u00c2M : H\\u1ec7 th\\u1ed1ng t\\u01b0\\u1eddng \\u0111\\u1eb7c c\\u1ee7a Sanishute gi\\u00fap gi\\u1ea3m thi\\u1ec3u ti\\u1ebfng \\u1ed3ng \\u0111\\u00e1ng k\\u1ec3 t\\u1eeb c\\u00e1c v\\u1eadt di chuy\\u1ec3n trong \\u1ed1ng so v\\u1edbi c\\u00e1c h\\u1ec7 th\\u1ed1ng \\u1ed1ng m\\u1ecfng kh\\u00e1c . Kh\\u1ed1i l\\u01b0\\u1ee3ng c\\u1ee7a h\\u1ec7 th\\u1ed1ng \\u1ed1ng Sanishute l\\u00e0m gi\\u1ea3m thi\\u1ec3u kh\\u1ea3 n\\u0103ng \\u00e2m thanh c\\u00f3 th\\u1ec3 truy\\u1ec1n qua\\u00a0 \\u1ed1ng.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">KH\\u00d4NG C\\u00d3 CH\\u1ea4T \\u0110\\u1ed8C H\\u1ea0I : H\\u1ec7 th\\u1ed1ng \\u1ed1ng th\\u1ea3i Sanishute l\\u00e0m t\\u1eeb h\\u1ec7 th\\u1ed1ng \\u1ed1ng \\u0111\\u01b0\\u1ee3c gia c\\u1ed1 c\\u1ee7a James Hardie v\\u1edbi ch\\u1ea5t li\\u1ec7u l\\u00e0m t\\u1eeb xi m\\u0103ng pha s\\u1ee3i xenlulo \\u0111\\u01b0\\u1ee3c s\\u1ea3n xu\\u1ea5t v\\u1edbi \\u0111\\u1ed9 b\\u1ec1n cao . Nh\\u1eefng h\\u1ec7 th\\u1ed1ng kh\\u00e1c th\\u01b0\\u1eddng \\u0111\\u01b0\\u1ee3c l\\u00e0m t\\u1eeb th\\u00e9p v\\u00e0 c\\u00f3 th\\u1ec3 b\\u1ecb \\u0103n m\\u00f2n theo th\\u1eddi gian<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\"><span style=\\"font-size: 16px;\\">\\u0110\\u1ed8 B\\u1ec0N :\\u00a0 H\\u1ec7 th\\u1ed1ng \\u1ed1ng c\\u1ee7a Sanishute \\u0111\\u01b0\\u1ee3c l\\u00e0m t\\u1eeb b\\u00ea t\\u00f4ng gia c\\u1ed1 v\\u00e0 s\\u1ee3i xenlulo l\\u00e0 c\\u1ef1c k\\u00ec b\\u1ec1n b\\u1ec9 .\\u00a0 Nh\\u1eefng \\u1ed1ng n\\u00e0y \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c thi\\u1ebft k\\u1ebf \\u0111\\u1eb7c bi\\u1ec7t \\u0111\\u1ec3 ch\\u1ed1ng l\\u1ea1i l\\u1ef1c va ch\\u1ea1m t\\u1eeb c\\u00e1c v\\u1eadt r\\u01a1i v\\u00e0 kh\\u00f4ng b\\u1ecb m\\u1ebb hay v\\u1ee1 trong qu\\u00e1 tr\\u00ecnh s\\u1eed d\\u1ee5ng . Ngo\\u00e0i ra , h\\u1ec7 th\\u1ed1ng \\u1ed1ng n\\u00e0y c\\u00f2n gi\\u1ea3m thi\\u1ec3u s\\u1ed1 l\\u01b0\\u1ee3ng m\\u1ed1i n\\u1ed1i ,t\\u1ea1o n\\u00ean b\\u1ec1 m\\u1eb7t b\\u1eb1ng ph\\u1eb3ng b\\u00ean trong \\u0111\\u1ec3 \\u0111\\u1ea3m b\\u1ea3o b\\u1ec1 m\\u1eb7t b\\u1eb1ng ph\\u1eb3ng v\\u00e0 kh\\u00f4ng c\\u00f3 l\\u1ed7 h\\u1edf.<\\/span><\\/p>\\r\\n<p style=\\"margin: 0px; padding: 0px; color: #555555; font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 15.6000003814697px;\\">\\u00a0<\\/p>","fulltext":"","state":1,"catid":"40","created":"2015-06-06 14:23:52","created_by":"471","created_by_alias":"","modified":"2015-06-07 11:11:31","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-07 11:11:23","publish_up":"2015-06-06 14:23:52","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"images\\\\\\/project\\\\\\/156_Tam.jpg\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":4,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"19","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"en-GB","xreference":""}', 0),
(103, 4, 1, '', '2015-06-13 04:48:43', 471, 1746, '7d8308baa01dab13a5a33e550b586367b49e1f3d', '{"id":4,"asset_id":"82","title":"About us","alias":"about-us","introtext":"<p>C\\u00f4ng ty Vi\\u1ec7t Pan - gi\\u1edbi thi\\u1ec7u (LATER)<\\/p>","fulltext":"","state":1,"catid":"19","created":"2015-05-31 09:45:33","created_by":"471","created_by_alias":"","modified":"2015-06-13 04:48:43","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-13 04:48:16","publish_up":"2015-05-31 09:45:33","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"26","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"en-GB","xreference":""}', 0);
INSERT INTO `vp_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(104, 4, 1, '', '2015-06-13 04:57:34', 471, 6697, '385bdf6a654f0d01f60d8735ec5234eea66dd428', '{"id":4,"asset_id":"82","title":"About us","alias":"about-us","introtext":"<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b>TH\\u01af NG\\u1ece<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b>\\u00a0<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b>Qu\\u00fd kh\\u00e1ch h\\u00e0ng th\\u00e2n m\\u1ebfn!<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b>\\u00a0<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b>Tr\\u01b0\\u1edbc ti\\u00ean VIET PAN., JSC xin g\\u1eedi t\\u1edbi Qu\\u00fd kh\\u00e1ch h\\u00e0ng l\\u1eddi ch\\u00fac t\\u1ed1t \\u0111\\u1eb9p nh\\u1ea5t, ch\\u00fac ho\\u1ea1t \\u0111\\u1ed9ng kinh doanh c\\u1ee7a Qu\\u00fd kh\\u00e1ch h\\u00e0ng ng\\u00e0y c\\u00e0ng ph\\u00e1t tri\\u1ec3n b\\u1ec1n v\\u1eefng.<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b> VIET PAN., JSC l\\u00e0 C\\u00f4ng ty chuy\\u00ean kinh doanh c\\u00e1c m\\u1eb7t h\\u00e0ng nh\\u01b0: M\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb c\\u00f4ng nghi\\u1ec7p, h\\u1ea1 t\\u1ea7ng c\\u00f4ng ngh\\u1ec7 th\\u00f4ng tin (B\\u1ed9 l\\u01b0u \\u0111i\\u1ec7n UPS, Rack, PDU,...), nguy\\u00ean v\\u1eadt li\\u1ec7u trong ngh\\u00e0nh c\\u00f4ng nghi\\u1ec7p s\\u1ea3n xu\\u1ea5t v\\u1eadt li\\u1ec7u Composite, gia c\\u00f4ng ch\\u1ebf t\\u1ea1o c\\u00e1c s\\u1ea3n ph\\u1ea9m c\\u01a1 kh\\u00ed ch\\u00ednh x\\u00e1c, c\\u01a1 kh\\u00ed c\\u00f4ng tr\\u00ecnh, thi c\\u00f4ng c\\u00e1c c\\u00f4ng tr\\u00ecnh x\\u00e2y d\\u1ef1ng d\\u00e2n d\\u1ee5ng v\\u00e0 c\\u00f4ng nghi\\u1ec7p ...<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b> V\\u1edbi \\u0111\\u1ed9i ng\\u0169 nh\\u00e2n vi\\u00ean chuy\\u00ean nghi\\u1ec7p \\u0111\\u01b0\\u1ee3c \\u0111\\u00e0o t\\u1ea1o b\\u00e0i b\\u1ea3n t\\u1ea1i c\\u00e1c tr\\u01b0\\u1eddng \\u0110\\u1ea1i h\\u1ecdc, tr\\u01b0\\u1eddng ngh\\u1ec1 trong v\\u00e0 ngo\\u00e0i n\\u01b0\\u1edbc, c\\u00e1c c\\u00f4ng ty ch\\u00ednh h\\u00e3ng t\\u1ea1i n\\u01b0\\u1edbc ngo\\u00e0i. Ch\\u00fang t\\u00f4i tin t\\u01b0\\u1edfng s\\u1ebd mang \\u0111\\u1ebfn cho Qu\\u00fd kh\\u00e1ch h\\u00e0ng nh\\u1eefng s\\u1ea3n ph\\u1ea9m v\\u00e0 d\\u1ecbch v\\u1ee5 t\\u1ed1t nh\\u1ea5t.<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b> Ph\\u01b0\\u01a1ng ch\\u00e2m ho\\u1ea1t \\u0111\\u1ed9ng c\\u1ee7a C\\u00f4ng ty: \\u201cLu\\u00f4n l\\u00e0m h\\u00e0i l\\u00f2ng kh\\u00e1ch h\\u00e0ng b\\u1eb1ng ch\\u1ea5t l\\u01b0\\u1ee3ng, th\\u1ea9m m\\u1ef9, gi\\u00e1 c\\u1ea3 h\\u1ee3p l\\u00fd, d\\u1ecbch v\\u1ee5 ho\\u00e0n h\\u1ea3o sau b\\u00e1n h\\u00e0ng\\u201d<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b> V\\u1edbi s\\u1ea3n ph\\u1ea9m ch\\u1ea5t l\\u01b0\\u1ee3ng cao, k\\u1ebft h\\u1ee3p v\\u1edbi \\u0111\\u1ed9i ng\\u0169 thi\\u1ebft k\\u1ebf chuy\\u00ean nghi\\u1ec7p, nh\\u00e2n vi\\u00ean t\\u01b0 v\\u1ea5n, thi\\u1ebft k\\u1ebf c\\u00f3 tr\\u00ecnh \\u0111\\u1ed9, nhi\\u1ec7t t\\u00ecnh ... s\\u1ebd mang \\u0111\\u1ebfn cho kh\\u00e1ch h\\u00e0ng nh\\u1eefng gi\\u1ea3i ph\\u00e1p t\\u1ed1t nh\\u1ea5t, v\\u1edbi ch\\u00ednh s\\u00e1ch t\\u1ed1t nh\\u1ea5t.<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b> Ch\\u00fang t\\u00f4i mong mu\\u1ed1n v\\u1edbi m\\u1ed7i s\\u1ea3n ph\\u1ea9m hay d\\u1ecbch v\\u1ee5 \\u0111\\u01b0\\u1ee3c cung c\\u1ea5p b\\u1edfi VIET PAN d\\u00f9 \\u1edf b\\u1ea5t k\\u1ef3 n\\u01a1i n\\u00e0o tr\\u00ean l\\u00e3nh th\\u1ed5 Vi\\u1ec7t Nam \\u0111\\u1ec1u c\\u00f3 ch\\u1ea5t l\\u01b0\\u1ee3ng v\\u00e0 d\\u1ecbch v\\u1ee5 h\\u1eadu m\\u00e3i ho\\u00e0n h\\u1ea3o gi\\u1ed1ng nhau.<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b> Ch\\u00fang t\\u00f4i s\\u1eb5n s\\u00e0ng cung c\\u1ea5p c\\u00e1c s\\u1ea3n ph\\u1ea9m, d\\u1ecbch v\\u1ee5 theo h\\u00ecnh th\\u1ee9c \\u0111\\u1ea5u th\\u1ea7u c\\u1ea1nh tranh.<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center;\\" align=\\"center\\"><span style=\\"font-size: 26.6666660308838px; line-height: 34.6666641235352px;\\"><b> Tr\\u00e2n tr\\u1ecdng!<\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoHeader\\" style=\\"text-align: center; line-height: 130%; tab-stops: .5in;\\" align=\\"center\\">\\u00a0<\\/p>","fulltext":"","state":1,"catid":"19","created":"2015-05-31 09:45:33","created_by":"471","created_by_alias":"","modified":"2015-06-13 04:57:34","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-13 04:56:21","publish_up":"2015-05-31 09:45:33","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"27","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"en-GB","xreference":""}', 0),
(105, 3, 1, '', '2015-06-15 14:47:15', 471, 8696, 'c1e7fb70825ac8518894162568f51190193431fc', '{"id":3,"asset_id":"81","title":"Gi\\u1edbi thi\\u1ec7u","alias":"gioi-thieu","introtext":"<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: center; line-height: 130%;\\" align=\\"center\\"><b><span lang=\\"ES\\" style=\\"font-size: 20.0pt; mso-bidi-font-size: 12.0pt; line-height: 130%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">TH\\u01af NG\\u1ece<\\/span><\\/b><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: center; line-height: 130%;\\" align=\\"center\\"><b><span lang=\\"ES\\" style=\\"font-size: 9.0pt; mso-bidi-font-size: 12.0pt; line-height: 130%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0<\\/span><\\/b><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; text-indent: .5in; line-height: 150%;\\"><b><i><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">Qu\\u00fd kh\\u00e1ch h\\u00e0ng th\\u00e2n m\\u1ebfn!<\\/span><\\/i><\\/b><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; text-indent: .5in; line-height: 150%;\\"><b><i><span lang=\\"ES\\" style=\\"font-size: 1.0pt; mso-bidi-font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0<\\/span><\\/i><\\/b><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; text-indent: .5in; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">Tr\\u01b0\\u1edbc ti\\u00ean VIET PAN., JSC<\\/span> <span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">xin g\\u1eedi t\\u1edbi Qu\\u00fd kh\\u00e1ch h\\u00e0ng l\\u1eddi ch\\u00fac t\\u1ed1t \\u0111\\u1eb9p nh\\u1ea5t, ch\\u00fac ho\\u1ea1t \\u0111\\u1ed9ng kinh doanh c\\u1ee7a Qu\\u00fd kh\\u00e1ch h\\u00e0ng ng\\u00e0y c\\u00e0ng ph\\u00e1t tri\\u1ec3n b\\u1ec1n v\\u1eefng.<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 VIET PAN., JSC<\\/span> <span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">l\\u00e0 C\\u00f4ng ty chuy\\u00ean kinh doanh c\\u00e1c m\\u1eb7t h\\u00e0ng nh\\u01b0: M\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb c\\u00f4ng nghi\\u1ec7p, h\\u1ea1 t\\u1ea7ng c\\u00f4ng ngh\\u1ec7 th\\u00f4ng tin (B\\u1ed9 l\\u01b0u \\u0111i\\u1ec7n UPS, Rack, PDU,\\u2026), nguy\\u00ean v\\u1eadt li\\u1ec7u trong ngh\\u00e0nh c\\u00f4ng nghi\\u1ec7p s\\u1ea3n xu\\u1ea5t v\\u1eadt li\\u1ec7u Composite, gia c\\u00f4ng ch\\u1ebf t\\u1ea1o c\\u00e1c s\\u1ea3n ph\\u1ea9m c\\u01a1 kh\\u00ed ch\\u00ednh x\\u00e1c, c\\u01a1 kh\\u00ed c\\u00f4ng tr\\u00ecnh, thi c\\u00f4ng c\\u00e1c c\\u00f4ng tr\\u00ecnh x\\u00e2y d\\u1ef1ng d\\u00e2n d\\u1ee5ng v\\u00e0 c\\u00f4ng nghi\\u1ec7p ...<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 V\\u1edbi \\u0111\\u1ed9i ng\\u0169 nh\\u00e2n vi\\u00ean chuy\\u00ean nghi\\u1ec7p \\u0111\\u01b0\\u1ee3c \\u0111\\u00e0o t\\u1ea1o b\\u00e0i b\\u1ea3n t\\u1ea1i c\\u00e1c tr\\u01b0\\u1eddng \\u0110\\u1ea1i h\\u1ecdc, tr\\u01b0\\u1eddng ngh\\u1ec1 trong v\\u00e0 ngo\\u00e0i n\\u01b0\\u1edbc, c\\u00e1c c\\u00f4ng ty ch\\u00ednh h\\u00e3ng t\\u1ea1i n\\u01b0\\u1edbc ngo\\u00e0i. Ch\\u00fang t\\u00f4i tin t\\u01b0\\u1edfng s\\u1ebd mang \\u0111\\u1ebfn cho Qu\\u00fd kh\\u00e1ch h\\u00e0ng nh\\u1eefng s\\u1ea3n ph\\u1ea9m v\\u00e0 d\\u1ecbch v\\u1ee5 t\\u1ed1t nh\\u1ea5t.<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 Ph\\u01b0\\u01a1ng ch\\u00e2m ho\\u1ea1t \\u0111\\u1ed9ng c\\u1ee7a C\\u00f4ng ty: <b><i>\\u201cLu\\u00f4n l\\u00e0m h\\u00e0i l\\u00f2ng kh\\u00e1ch h\\u00e0ng b\\u1eb1ng ch\\u1ea5t l\\u01b0\\u1ee3ng, th\\u1ea9m m\\u1ef9, gi\\u00e1 c\\u1ea3 h\\u1ee3p l\\u00fd, d\\u1ecbch v\\u1ee5 ho\\u00e0n h\\u1ea3o sau b\\u00e1n h\\u00e0ng\\u201d<\\/i><\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 V\\u1edbi s\\u1ea3n ph\\u1ea9m ch\\u1ea5t l\\u01b0\\u1ee3ng cao, k\\u1ebft h\\u1ee3p v\\u1edbi \\u0111\\u1ed9i ng\\u0169 thi\\u1ebft k\\u1ebf chuy\\u00ean nghi\\u1ec7p, nh\\u00e2n vi\\u00ean t\\u01b0 v\\u1ea5n, thi\\u1ebft k\\u1ebf c\\u00f3 tr\\u00ecnh \\u0111\\u1ed9, nhi\\u1ec7t t\\u00ecnh ... s\\u1ebd mang \\u0111\\u1ebfn cho kh\\u00e1ch h\\u00e0ng nh\\u1eefng gi\\u1ea3i ph\\u00e1p t\\u1ed1t nh\\u1ea5t, v\\u1edbi ch\\u00ednh s\\u00e1ch t\\u1ed1t nh\\u1ea5t.<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 Ch\\u00fang t\\u00f4i mong mu\\u1ed1n v\\u1edbi m\\u1ed7i s\\u1ea3n ph\\u1ea9m hay d\\u1ecbch v\\u1ee5 \\u0111\\u01b0\\u1ee3c cung c\\u1ea5p b\\u1edfi <\\/span><span lang=\\"ES\\" style=\\"font-size: 13.0pt; mso-bidi-font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">VIET PAN<\\/span><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\"> d\\u00f9 \\u1edf b\\u1ea5t k\\u1ef3 n\\u01a1i n\\u00e0o tr\\u00ean l\\u00e3nh th\\u1ed5 Vi\\u1ec7t Nam \\u0111\\u1ec1u c\\u00f3 ch\\u1ea5t l\\u01b0\\u1ee3ng v\\u00e0 d\\u1ecbch v\\u1ee5 h\\u1eadu m\\u00e3i ho\\u00e0n h\\u1ea3o gi\\u1ed1ng nhau.<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 Ch\\u00fang t\\u00f4i s\\u1eb5n s\\u00e0ng cung c\\u1ea5p c\\u00e1c s\\u1ea3n ph\\u1ea9m, d\\u1ecbch v\\u1ee5 theo h\\u00ecnh th\\u1ee9c \\u0111\\u1ea5u th\\u1ea7u c\\u1ea1nh tranh.<\\/span><\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><b><i><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 Tr\\u00e2n tr\\u1ecdng!<\\/span><\\/i><\\/b><\\/p>","fulltext":"","state":1,"catid":"15","created":"2015-05-31 09:41:08","created_by":"471","created_by_alias":"","modified":"2015-06-15 14:47:15","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-15 14:44:20","publish_up":"2015-05-31 09:41:08","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":4,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"25","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"vi-VN","xreference":""}', 0),
(106, 3, 1, '', '2015-06-15 14:48:23', 471, 8613, '7b9a7de0d6188c223c3b094bc4ddcc4ff4b1d6e5', '{"id":3,"asset_id":"81","title":"Gi\\u1edbi thi\\u1ec7u","alias":"gioi-thieu","introtext":"<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: center; line-height: 130%;\\" align=\\"center\\"><b><span lang=\\"ES\\" style=\\"font-size: 20.0pt; mso-bidi-font-size: 12.0pt; line-height: 130%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">TH\\u01af NG\\u1ece<\\/span><\\/b><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: center; line-height: 130%;\\" align=\\"center\\"><b><span lang=\\"ES\\" style=\\"font-size: 9.0pt; mso-bidi-font-size: 12.0pt; line-height: 130%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0<\\/span><\\/b><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; text-indent: .5in; line-height: 150%;\\"><b><i><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">Qu\\u00fd kh\\u00e1ch h\\u00e0ng th\\u00e2n m\\u1ebfn!<\\/span><\\/i><\\/b><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; text-indent: .5in; line-height: 150%;\\"><b><i><span lang=\\"ES\\" style=\\"font-size: 1.0pt; mso-bidi-font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0<\\/span><\\/i><\\/b><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; text-indent: .5in; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0Tr\\u01b0\\u1edbc ti\\u00ean VIET PAN., JSC<\\/span> <span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">xin g\\u1eedi t\\u1edbi Qu\\u00fd kh\\u00e1ch h\\u00e0ng l\\u1eddi ch\\u00fac t\\u1ed1t \\u0111\\u1eb9p nh\\u1ea5t, ch\\u00fac ho\\u1ea1t \\u0111\\u1ed9ng kinh doanh c\\u1ee7a Qu\\u00fd kh\\u00e1ch h\\u00e0ng ng\\u00e0y c\\u00e0ng ph\\u00e1t tri\\u1ec3n b\\u1ec1n v\\u1eefng.<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0 \\u00a0 \\u00a0 \\u00a0 VIET PAN., JSC<\\/span> <span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">l\\u00e0 C\\u00f4ng ty chuy\\u00ean kinh doanh c\\u00e1c m\\u1eb7t h\\u00e0ng nh\\u01b0: M\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb c\\u00f4ng nghi\\u1ec7p, h\\u1ea1 t\\u1ea7ng c\\u00f4ng ngh\\u1ec7 th\\u00f4ng tin (B\\u1ed9 l\\u01b0u \\u0111i\\u1ec7n UPS, Rack, PDU,\\u2026), nguy\\u00ean v\\u1eadt li\\u1ec7u trong ngh\\u00e0nh c\\u00f4ng nghi\\u1ec7p s\\u1ea3n xu\\u1ea5t v\\u1eadt li\\u1ec7u Composite, gia c\\u00f4ng ch\\u1ebf t\\u1ea1o c\\u00e1c s\\u1ea3n ph\\u1ea9m c\\u01a1 kh\\u00ed ch\\u00ednh x\\u00e1c, c\\u01a1 kh\\u00ed c\\u00f4ng tr\\u00ecnh, thi c\\u00f4ng c\\u00e1c c\\u00f4ng tr\\u00ecnh x\\u00e2y d\\u1ef1ng d\\u00e2n d\\u1ee5ng v\\u00e0 c\\u00f4ng nghi\\u1ec7p ...<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 V\\u1edbi \\u0111\\u1ed9i ng\\u0169 nh\\u00e2n vi\\u00ean chuy\\u00ean nghi\\u1ec7p \\u0111\\u01b0\\u1ee3c \\u0111\\u00e0o t\\u1ea1o b\\u00e0i b\\u1ea3n t\\u1ea1i c\\u00e1c tr\\u01b0\\u1eddng \\u0110\\u1ea1i h\\u1ecdc, tr\\u01b0\\u1eddng ngh\\u1ec1 trong v\\u00e0 ngo\\u00e0i n\\u01b0\\u1edbc, c\\u00e1c c\\u00f4ng ty ch\\u00ednh h\\u00e3ng t\\u1ea1i n\\u01b0\\u1edbc ngo\\u00e0i. Ch\\u00fang t\\u00f4i tin t\\u01b0\\u1edfng s\\u1ebd mang \\u0111\\u1ebfn cho Qu\\u00fd kh\\u00e1ch h\\u00e0ng nh\\u1eefng s\\u1ea3n ph\\u1ea9m v\\u00e0 d\\u1ecbch v\\u1ee5 t\\u1ed1t nh\\u1ea5t.<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0\\u00a0 Ph\\u01b0\\u01a1ng ch\\u00e2m ho\\u1ea1t \\u0111\\u1ed9ng c\\u1ee7a C\\u00f4ng ty: <b><i>\\u201cLu\\u00f4n l\\u00e0m h\\u00e0i l\\u00f2ng kh\\u00e1ch h\\u00e0ng b\\u1eb1ng ch\\u1ea5t l\\u01b0\\u1ee3ng, th\\u1ea9m m\\u1ef9, gi\\u00e1 c\\u1ea3 h\\u1ee3p l\\u00fd, d\\u1ecbch v\\u1ee5 ho\\u00e0n h\\u1ea3o sau b\\u00e1n h\\u00e0ng\\u201d<\\/i><\\/b><\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0V\\u1edbi s\\u1ea3n ph\\u1ea9m ch\\u1ea5t l\\u01b0\\u1ee3ng cao, k\\u1ebft h\\u1ee3p v\\u1edbi \\u0111\\u1ed9i ng\\u0169 thi\\u1ebft k\\u1ebf chuy\\u00ean nghi\\u1ec7p, nh\\u00e2n vi\\u00ean t\\u01b0 v\\u1ea5n, thi\\u1ebft k\\u1ebf c\\u00f3 tr\\u00ecnh \\u0111\\u1ed9, nhi\\u1ec7t t\\u00ecnh ... s\\u1ebd mang \\u0111\\u1ebfn cho kh\\u00e1ch h\\u00e0ng nh\\u1eefng gi\\u1ea3i ph\\u00e1p t\\u1ed1t nh\\u1ea5t, v\\u1edbi ch\\u00ednh s\\u00e1ch t\\u1ed1t nh\\u1ea5t.<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 Ch\\u00fang t\\u00f4i mong mu\\u1ed1n v\\u1edbi m\\u1ed7i s\\u1ea3n ph\\u1ea9m hay d\\u1ecbch v\\u1ee5 \\u0111\\u01b0\\u1ee3c cung c\\u1ea5p b\\u1edfi <\\/span><span lang=\\"ES\\" style=\\"font-size: 13.0pt; mso-bidi-font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">VIET PAN<\\/span><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\"> d\\u00f9 \\u1edf b\\u1ea5t k\\u1ef3 n\\u01a1i n\\u00e0o tr\\u00ean l\\u00e3nh th\\u1ed5 Vi\\u1ec7t Nam \\u0111\\u1ec1u c\\u00f3 ch\\u1ea5t l\\u01b0\\u1ee3ng v\\u00e0 d\\u1ecbch v\\u1ee5 h\\u1eadu m\\u00e3i ho\\u00e0n h\\u1ea3o gi\\u1ed1ng nhau.<\\/span><\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Ch\\u00fang t\\u00f4i s\\u1eb5n s\\u00e0ng cung c\\u1ea5p c\\u00e1c s\\u1ea3n ph\\u1ea9m, d\\u1ecbch v\\u1ee5 theo h\\u00ecnh th\\u1ee9c \\u0111\\u1ea5u th\\u1ea7u c\\u1ea1nh tranh.<\\/span><\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p class=\\"MsoNormal\\" style=\\"margin-bottom: .0001pt; text-align: justify; line-height: 150%;\\"><b><i><span lang=\\"ES\\" style=\\"font-size: 14.0pt; line-height: 150%; mso-fareast-font-family: ''Times New Roman''; mso-ansi-language: ES;\\">\\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0 \\u00a0Tr\\u00e2n tr\\u1ecdng!<\\/span><\\/i><\\/b><\\/p>","fulltext":"","state":1,"catid":"15","created":"2015-05-31 09:41:08","created_by":"471","created_by_alias":"","modified":"2015-06-15 14:48:23","modified_by":"471","checked_out":"471","checked_out_time":"2015-06-15 14:47:15","publish_up":"2015-05-31 09:41:08","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":5,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"26","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"vi-VN","xreference":""}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vp_updates`
--

CREATE TABLE IF NOT EXISTS `vp_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=353 ;

--
-- Dumping data for table `vp_updates`
--

INSERT INTO `vp_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 3, 0, 'Armenian', '', 'pkg_hy-AM', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/hy-AM_details.xml', '', ''),
(2, 3, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '3.4.1.2', '', 'http://update.joomla.org/language/details3/ms-MY_details.xml', '', ''),
(3, 3, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/ro-RO_details.xml', '', ''),
(4, 3, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/nl-BE_details.xml', '', ''),
(5, 3, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/zh-TW_details.xml', '', ''),
(6, 3, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.4.1.2', '', 'http://update.joomla.org/language/details3/fr-FR_details.xml', '', ''),
(7, 3, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '3.3.1.2', '', 'http://update.joomla.org/language/details3/gl-ES_details.xml', '', ''),
(8, 3, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/de-DE_details.xml', '', ''),
(9, 3, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '3.4.2.1', '', 'http://update.joomla.org/language/details3/el-GR_details.xml', '', ''),
(10, 3, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/ja-JP_details.xml', '', ''),
(11, 3, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/he-IL_details.xml', '', ''),
(12, 3, 0, 'EnglishAU', '', 'pkg_en-AU', 'package', '', 0, '3.3.1.1', '', 'http://update.joomla.org/language/details3/en-AU_details.xml', '', ''),
(13, 3, 0, 'EnglishUS', '', 'pkg_en-US', 'package', '', 0, '3.3.1.1', '', 'http://update.joomla.org/language/details3/en-US_details.xml', '', ''),
(14, 3, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/hu-HU_details.xml', '', ''),
(15, 3, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '3.2.0.2', '', 'http://update.joomla.org/language/details3/af-ZA_details.xml', '', ''),
(16, 3, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/ar-AA_details.xml', '', ''),
(17, 3, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/be-BY_details.xml', '', ''),
(18, 3, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/bg-BG_details.xml', '', ''),
(19, 3, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/ca-ES_details.xml', '', ''),
(20, 3, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/zh-CN_details.xml', '', ''),
(21, 3, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/hr-HR_details.xml', '', ''),
(22, 3, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/cs-CZ_details.xml', '', ''),
(23, 3, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/da-DK_details.xml', '', ''),
(24, 3, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/nl-NL_details.xml', '', ''),
(25, 3, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/et-EE_details.xml', '', ''),
(26, 3, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/it-IT_details.xml', '', ''),
(27, 3, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/ko-KR_details.xml', '', ''),
(28, 3, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/lv-LV_details.xml', '', ''),
(29, 3, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/mk-MK_details.xml', '', ''),
(30, 3, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/nb-NO_details.xml', '', ''),
(31, 3, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/nn-NO_details.xml', '', ''),
(32, 3, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.4.1.2', '', 'http://update.joomla.org/language/details3/fa-IR_details.xml', '', ''),
(33, 3, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.4.1.3', '', 'http://update.joomla.org/language/details3/pl-PL_details.xml', '', ''),
(34, 3, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/pt-PT_details.xml', '', ''),
(35, 3, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '3.4.1.3', '', 'http://update.joomla.org/language/details3/ru-RU_details.xml', '', ''),
(36, 3, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.4.1.2', '', 'http://update.joomla.org/language/details3/sk-SK_details.xml', '', ''),
(37, 3, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.4.1.3', '', 'http://update.joomla.org/language/details3/sv-SE_details.xml', '', ''),
(38, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/sy-IQ_details.xml', '', ''),
(39, 3, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/ta-IN_details.xml', '', ''),
(40, 3, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/th-TH_details.xml', '', ''),
(41, 3, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.4.1.3', '', 'http://update.joomla.org/language/details3/tr-TR_details.xml', '', ''),
(42, 3, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.3.3.15', '', 'http://update.joomla.org/language/details3/uk-UA_details.xml', '', ''),
(43, 3, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/ug-CN_details.xml', '', ''),
(44, 3, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/sq-AL_details.xml', '', ''),
(45, 3, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '3.3.6.1', '', 'http://update.joomla.org/language/details3/hi-IN_details.xml', '', ''),
(46, 3, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.4.1.3', '', 'http://update.joomla.org/language/details3/pt-BR_details.xml', '', ''),
(47, 3, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/sr-YU_details.xml', '', ''),
(48, 3, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.4.1.2', '', 'http://update.joomla.org/language/details3/es-ES_details.xml', '', ''),
(49, 3, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/bs-BA_details.xml', '', ''),
(50, 3, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/sr-RS_details.xml', '', ''),
(51, 3, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.3.0.2', '', 'http://update.joomla.org/language/details3/id-ID_details.xml', '', ''),
(52, 3, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/fi-FI_details.xml', '', ''),
(53, 3, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.4.1.1', '', 'http://update.joomla.org/language/details3/sw-KE_details.xml', '', ''),
(54, 3, 0, 'Montenegrin', '', 'pkg_srp-ME', 'package', '', 0, '3.3.1.1', '', 'http://update.joomla.org/language/details3/srp-ME_details.xml', '', ''),
(55, 3, 0, 'EnglishCA', '', 'pkg_en-CA', 'package', '', 0, '3.3.6.1', '', 'http://update.joomla.org/language/details3/en-CA_details.xml', '', ''),
(56, 3, 0, 'FrenchCA', '', 'pkg_fr-CA', 'package', '', 0, '3.3.6.1', '', 'http://update.joomla.org/language/details3/fr-CA_details.xml', '', ''),
(57, 3, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/cy-GB_details.xml', '', ''),
(58, 3, 0, 'Sinhala', '', 'pkg_si-LK', 'package', '', 0, '3.3.1.1', '', 'http://update.joomla.org/language/details3/si-LK_details.xml', '', ''),
(59, 7, 0, 'JA Amazon S3 for joomla 16', '', 'com_com_jaamazons3', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaamazons3.xml', '', ''),
(60, 7, 0, 'JA Extenstion Manager Component j16', '', 'com_com_jaextmanager', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaextmanager.xml', '', ''),
(61, 7, 0, 'JA Amazon S3 for joomla 2.5 & 3.x', '', 'com_jaamazons3', 'component', '', 1, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/com_jaamazons3.xml', '', ''),
(62, 7, 0, 'JA Comment Package for Joomla 2.5 & 3.3', '', 'com_jacomment', 'component', '', 1, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/com_jacomment.xml', '', ''),
(63, 7, 0, 'JA Extenstion Manager Component for J25 & J3', '', 'com_jaextmanager', 'component', '', 1, '2.6.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jaextmanager.xml', '', ''),
(64, 7, 0, 'JA Google Storage Package for J2.5 & J3.0', '', 'com_jagooglestorage', 'component', '', 1, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jagooglestorage.xml', '', ''),
(65, 7, 0, 'JA Job Board Package For J25', '', 'com_jajobboard', 'component', '', 1, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/com_jajobboard.xml', '', ''),
(66, 7, 0, 'JA K2 Filter Package for J25 & J3.4', '', 'com_jak2filter', 'component', '', 1, '1.1.9', '', 'http://update.joomlart.com/service/tracking/j16/com_jak2filter.xml', '', ''),
(67, 7, 0, 'JA K2 Filter Package for J25 & J30', '', 'com_jak2fiter', 'component', '', 1, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/com_jak2fiter.xml', '', ''),
(68, 7, 0, 'JA Showcase component for Joomla 1.7', '', 'com_jashowcase', 'component', '', 1, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jashowcase.xml', '', ''),
(69, 7, 0, 'JA Voice Package for Joomla 2.5 & 3.x', '', 'com_javoice', 'component', '', 1, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/com_javoice.xml', '', ''),
(70, 7, 0, 'JA Appolio Theme for EasyBlog', '', 'easyblog_theme_appolio', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_appolio.xml', '', ''),
(71, 7, 0, 'JA Biz Theme for EasyBlog', '', 'easyblog_theme_biz', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_biz.xml', '', ''),
(72, 7, 0, 'JA Bookshop Theme for EasyBlog', '', 'easyblog_theme_bookshop', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_bookshop.xml', '', ''),
(73, 7, 0, 'JA Decor Theme for EasyBlog', '', 'easyblog_theme_decor', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_decor.xml', '', ''),
(74, 7, 0, 'Theme Fixel for Easyblog J25 & J34', '', 'easyblog_theme_fixel', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_fixel.xml', '', ''),
(75, 7, 0, 'Theme Magz for Easyblog J25 & J34', '', 'easyblog_theme_magz', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_magz.xml', '', ''),
(76, 7, 0, 'JA Muzic Theme for EasyBlog', '', 'easyblog_theme_muzic', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_muzic.xml', '', ''),
(77, 7, 0, 'JA Obelisk Theme for EasyBlog', '', 'easyblog_theme_obelisk', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_obelisk.xml', '', ''),
(78, 7, 0, 'JA Sugite Theme for EasyBlog', '', 'easyblog_theme_sugite', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_sugite.xml', '', ''),
(79, 7, 0, 'JA Anion template for Joomla 2.5', '', 'ja_anion', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_anion.xml', '', ''),
(80, 7, 0, 'JA Appolio Template', '', 'ja_appolio', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_appolio.xml', '', ''),
(81, 7, 0, 'JA Argo Template for J3x', '', 'ja_argo', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_argo.xml', '', ''),
(82, 7, 0, 'JA Beranis Template', '', 'ja_beranis', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_beranis.xml', '', ''),
(83, 7, 0, 'JA Bistro Template for Joomla 2.5', '', 'ja_bistro', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_bistro.xml', '', ''),
(84, 7, 0, 'JA Blazes Template for J25 & J31', '', 'ja_blazes', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_blazes.xml', '', ''),
(85, 7, 0, 'JA Bookshop Template', '', 'ja_bookshop', 'template', '', 0, '1.1.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_bookshop.xml', '', ''),
(86, 7, 0, 'JA Brisk Template for J25 & J33', '', 'ja_brisk', 'template', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_brisk.xml', '', ''),
(87, 7, 0, 'JA Business Template for Joomla 2.5', '', 'ja_business', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_business.xml', '', ''),
(88, 7, 0, 'JA Cloris Template for Joomla 2.5.x', '', 'ja_cloris', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_cloris.xml', '', ''),
(89, 7, 0, 'JA Community PLus Template for Joomla 2.5', '', 'ja_community_plus', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_community_plus.xml', '', ''),
(90, 7, 0, 'JA Decor Template', '', 'ja_decor', 'template', '', 0, '1.1.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_decor.xml', '', ''),
(91, 7, 0, 'JA Droid Template for Joomla 2.5', '', 'ja_droid', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_droid.xml', '', ''),
(92, 7, 0, 'JA Edenite Template for J25 & J30', '', 'ja_edenite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_edenite.xml', '', ''),
(93, 7, 0, 'JA Elastica Template for J25 & J32', '', 'ja_elastica', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_elastica.xml', '', ''),
(94, 7, 0, 'JA Erio Template for Joomla 2.5 & 3.1', '', 'ja_erio', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_erio.xml', '', ''),
(95, 7, 0, 'Ja Events Template for Joomla 2.5', '', 'ja_events', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_events.xml', '', ''),
(96, 7, 0, 'JA Fubix Template for J25 & J33', '', 'ja_fubix', 'template', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_fubix.xml', '', ''),
(97, 7, 0, 'JA Graphite Template for Joomla 2.5', '', 'ja_graphite', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_graphite.xml', '', ''),
(98, 7, 0, 'JA Hawkstore Template', '', 'ja_hawkstore', 'template', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_hawkstore.xml', '', ''),
(99, 7, 0, 'JA Ironis Template for Joomla 2.5 & 3.1', '', 'ja_ironis', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_ironis.xml', '', ''),
(100, 7, 0, 'JA Jason template', '', 'ja_jason', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_jason.xml', '', ''),
(101, 7, 0, 'JA Kranos Template for J25 & J30', '', 'ja_kranos', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_kranos.xml', '', ''),
(102, 7, 0, 'JA Lens Template for Joomla 2.5 & 3.1', '', 'ja_lens', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_lens.xml', '', ''),
(103, 7, 0, 'Ja Lime Template for Joomla 2.5 & J31', '', 'ja_lime', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_lime.xml', '', ''),
(104, 7, 0, 'JA Magz Template for J25 & J34', '', 'ja_magz', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_magz.xml', '', ''),
(105, 7, 0, 'JA Medicare Template', '', 'ja_medicare', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_medicare.xml', '', ''),
(106, 7, 0, 'JA Mendozite Template for J25 & J32', '', 'ja_mendozite', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_mendozite.xml', '', ''),
(107, 7, 0, 'JA Mero Template for J25 & J3x', '', 'ja_mero', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_mero.xml', '', ''),
(108, 7, 0, 'JA Mers Template for J25 & J32', '', 'ja_mers', 'template', '', 0, '1.0.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_mers.xml', '', ''),
(109, 7, 0, 'JA Methys Template for Joomla 2.5', '', 'ja_methys', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_methys.xml', '', ''),
(110, 7, 0, 'Ja Minisite Template for Joomla 2.5', '', 'ja_minisite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_minisite.xml', '', ''),
(111, 7, 0, 'JA Mitius Template', '', 'ja_mitius', 'template', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_mitius.xml', '', ''),
(112, 7, 0, 'JA Mixmaz Template', '', 'ja_mixmaz', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_mixmaz.xml', '', ''),
(113, 7, 0, 'JA Nex Template for J25 & J30', '', 'ja_nex', 'template', '', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/ja_nex.xml', '', ''),
(114, 7, 0, 'JA Nex T3 Template', '', 'ja_nex_t3', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_nex_t3.xml', '', ''),
(115, 7, 0, 'JA Norite Template for J2.5 & J31', '', 'ja_norite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_norite.xml', '', ''),
(116, 7, 0, 'JA Nuevo template', '', 'ja_nuevo', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_nuevo.xml', '', ''),
(117, 7, 0, 'JA Obelisk Template', '', 'ja_obelisk', 'template', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_obelisk.xml', '', ''),
(118, 7, 0, 'JA Onepage Template', '', 'ja_onepage', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_onepage.xml', '', ''),
(119, 7, 0, 'JA ores template for Joomla 2.5 & 3.1', '', 'ja_ores', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_ores.xml', '', ''),
(120, 7, 0, 'JA Orisite Template  for J25 & J32', '', 'ja_orisite', 'template', '', 0, '1.1.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_orisite.xml', '', ''),
(121, 7, 0, 'JA Playmag Template', '', 'ja_playmag', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_playmag.xml', '', ''),
(122, 7, 0, 'JA Portfolio Real Estate template for Joomla 1.6.x', '', 'ja_portfolio', 'file', '', 0, '1.0.0 beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_portfolio.xml', '', ''),
(123, 7, 0, 'JA Portfolio Template for Joomla 2.5', '', 'ja_portfolio_real_estate', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_portfolio_real_estate.xml', '', ''),
(124, 7, 0, 'JA Puresite Template for J25 & J31', '', 'ja_puresite', 'template', '', 0, '1.0.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_puresite.xml', '', ''),
(125, 7, 0, 'JA Purity II template for Joomla 2.5 & 3.2', '', 'ja_purity_ii', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_purity_ii.xml', '', ''),
(126, 7, 0, 'JA Pyro Template for Joomla 2.5', '', 'ja_pyro', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_pyro.xml', '', ''),
(127, 7, 0, 'JA Rasite Template for J2.5 & J31', '', 'ja_rasite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_rasite.xml', '', ''),
(128, 7, 0, 'JA Rave Template for Joomla 2.5', '', 'ja_rave', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_rave.xml', '', ''),
(129, 7, 0, 'JA Smashboard Template', '', 'ja_smashboard', 'template', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_smashboard.xml', '', ''),
(130, 7, 0, 'JA Social Template for Joomla 2.5', '', 'ja_social', 'template', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_social.xml', '', ''),
(131, 7, 0, 'JA Social T3 Template for J25 & J33', '', 'ja_social_ii', 'template', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_social_ii.xml', '', ''),
(132, 7, 0, 'JA Sugite Template', '', 'ja_sugite', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_sugite.xml', '', ''),
(133, 7, 0, 'JA System Pager Plugin for J25 & J30', '', 'ja_system_japager', 'plugin', 'ja_system_japager', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_system_japager.xml', '', ''),
(134, 7, 0, 'JA T3V2 Blank Template', '', 'ja_t3_blank', 'template', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3_blank.xml', '', ''),
(135, 7, 0, 'JA T3 Blank template for joomla 1.6', '', 'ja_t3_blank_j16', 'template', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3_blank_j16.xml', '', ''),
(136, 7, 0, 'JA Blank Template for T3v3', '', 'ja_t3v3_blank', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3v3_blank.xml', '', ''),
(137, 7, 0, 'JA Teline III  Template for Joomla 1.6', '', 'ja_teline_iii', 'file', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iii.xml', '', ''),
(138, 7, 0, 'JA Teline IV Template for J2.5 and J3.2', '', 'ja_teline_iv', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iv.xml', '', ''),
(139, 7, 0, 'JA Teline IV T3 Template', '', 'ja_teline_iv_t3', 'template', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iv_t3.xml', '', ''),
(140, 7, 0, 'JA Tiris Template for J25 & J3x', '', 'ja_tiris', 'template', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_tiris.xml', '', ''),
(141, 7, 0, 'JA Travel Template for Joomla 2.5 & 3.0', '', 'ja_travel', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_travel.xml', '', ''),
(142, 7, 0, 'JA University Template for J25 & J32', '', 'ja_university', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_university.xml', '', ''),
(143, 7, 0, 'JA University T3 template', '', 'ja_university_t3', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/ja_university_t3.xml', '', ''),
(144, 7, 0, 'JA Vintas Template for J25 & J31', '', 'ja_vintas', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_vintas.xml', '', ''),
(145, 7, 0, 'JA Wall Template for J25 & J33', '', 'ja_wall', 'template', '', 0, '1.2.0', '', 'http://update.joomlart.com/service/tracking/j16/ja_wall.xml', '', ''),
(146, 7, 0, 'JA ZiteTemplate', '', 'ja_zite', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_zite.xml', '', ''),
(147, 7, 0, 'JA Bookmark plugin for Joomla 1.6.x', '', 'jabookmark', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jabookmark.xml', '', ''),
(148, 7, 0, 'JA Comment plugin for Joomla 1.6.x', '', 'jacomment', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jacomment.xml', '', ''),
(149, 7, 0, 'JA Comment Off Plugin for Joomla 1.6', '', 'jacommentoff', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jacommentoff.xml', '', ''),
(150, 7, 0, 'JA Comment On Plugin for Joomla 1.6', '', 'jacommenton', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jacommenton.xml', '', ''),
(151, 7, 0, 'JA Content Extra Fields for Joomla 1.6', '', 'jacontentextrafields', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jacontentextrafields.xml', '', ''),
(152, 7, 0, 'JA Disqus Debate Echo plugin for Joomla 1.6.x', '', 'jadisqus_debate_echo', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jadisqus_debate_echo.xml', '', ''),
(153, 7, 0, 'JA System Google Map plugin for Joomla 1.6.x', '', 'jagooglemap', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jagooglemap.xml', '', ''),
(154, 7, 0, 'JA Google Translate plugin for Joomla 1.6.x', '', 'jagoogletranslate', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jagoogletranslate.xml', '', ''),
(155, 7, 0, 'JA Highslide plugin for Joomla 1.6.x', '', 'jahighslide', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jahighslide.xml', '', ''),
(156, 7, 0, 'JA K2 Search Plugin for Joomla 2.5', '', 'jak2_filter', 'plugin', '', 0, '1.0.0 Alpha', '', 'http://update.joomlart.com/service/tracking/j16/jak2_filter.xml', '', ''),
(157, 7, 0, 'JA K2 Extra Fields Plugin for Joomla 2.5', '', 'jak2_indexing', 'plugin', '', 0, '1.0.0 Alpha', '', 'http://update.joomlart.com/service/tracking/j16/jak2_indexing.xml', '', ''),
(158, 7, 0, 'JA Load module Plugin for Joomla 2.5', '', 'jaloadmodule', 'plugin', 'jaloadmodule', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/jaloadmodule.xml', '', ''),
(159, 7, 0, 'JA System Nrain plugin for Joomla 1.6.x', '', 'janrain', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/janrain.xml', '', ''),
(160, 7, 0, 'JA Popup plugin for Joomla 1.6', '', 'japopup', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/japopup.xml', '', ''),
(161, 7, 0, 'JA System Social plugin for Joomla 1.7', '', 'jasocial', 'file', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/jasocial.xml', '', ''),
(162, 7, 0, 'JA T3 System plugin for Joomla 1.6', '', 'jat3', 'plugin', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/jat3.xml', '', ''),
(163, 7, 0, 'JA Tabs plugin for Joomla 1.6.x', '', 'jatabs', 'plugin', 'jatabs', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/jatabs.xml', '', ''),
(164, 7, 0, 'JA Typo plugin For Joomla 1.6', '', 'jatypo', 'plugin', 'jatypo', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jatypo.xml', '', ''),
(165, 7, 0, 'Jomsocial Theme 3.x for JA Social', '', 'jomsocial_theme_social', 'custom', '', 0, '3.2.x', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social.xml', '', ''),
(166, 7, 0, 'JA Jomsocial theme for Joomla 2.5', '', 'jomsocial_theme_social_j16', 'file', '', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16.xml', '', ''),
(167, 7, 0, 'JA Jomsocial theme for Joomla 2.5', '', 'jomsocial_theme_social_j16_26', 'custom', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16_26.xml', '', ''),
(168, 7, 0, 'JShopping Template for Ja Orisite', '', 'jshopping_theme_orisite', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_orisite.xml', '', ''),
(169, 7, 0, 'JA Tiris Jshopping theme for J25 & J3x', '', 'jshopping_theme_tiris', 'custom', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris.xml', '', ''),
(170, 7, 0, 'Theme for Jshopping j17', '', 'jshopping_theme_tiris_j17', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris_j17.xml', '', ''),
(171, 7, 0, 'JA Kranos kunena theme for Joomla 2.5', '', 'kunena_theme_kranos_j17', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_kranos_j17.xml', '', ''),
(172, 7, 0, 'Kunena Template for JA Mendozite', '', 'kunena_theme_mendozite', 'custom', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_mendozite.xml', '', ''),
(173, 7, 0, 'JA Mitius Kunena Theme for Joomla 25 ', '', 'kunena_theme_mitius', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_mitius.xml', '', ''),
(174, 7, 0, 'Kunena theme for JA Nex J2.5', '', 'kunena_theme_nex_j17', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_j17.xml', '', ''),
(175, 7, 0, 'Kunena theme for JA Nex T3', '', 'kunena_theme_nex_t3', 'custom', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_t3.xml', '', ''),
(176, 7, 0, 'Kunena Template for Ja Orisite', '', 'kunena_theme_orisite', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_orisite.xml', '', ''),
(177, 7, 0, 'Kunena theme for ja PlayMag', '', 'kunena_theme_playmag', 'custom', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_playmag.xml', '', ''),
(178, 7, 0, 'Kunena theme for JA Social T3', '', 'kunena_theme_social', 'custom', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_social.xml', '', ''),
(179, 7, 0, 'Kunena theme for Joomla 2.5', '', 'kunena_theme_social_j16', 'custom', '', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_social_j16.xml', '', ''),
(180, 7, 0, 'JA Tiris kunena theme for Joomla 2.5', '', 'kunena_theme_tiris_j16', 'custom', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_tiris_j16.xml', '', ''),
(181, 7, 0, 'JA Bookshop Theme for Mijoshop V2', '', 'mijoshop_theme_bookshop', 'custom', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mijoshop_theme_bookshop.xml', '', ''),
(182, 7, 0, 'JA Decor Theme for Mijoshop', '', 'mijoshop_theme_decor', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mijoshop_theme_decor.xml', '', ''),
(183, 7, 0, 'JA Decor Theme for Mijoshop V3', '', 'mijoshop_theme_decor_v3', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mijoshop_theme_decor_v3.xml', '', ''),
(184, 7, 0, 'JA ACM Module', '', 'mod_ja_acm', 'module', '', 0, '2.0.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_ja_acm.xml', '', ''),
(185, 7, 0, 'JA Jobs Tags module for Joomla 2.5', '', 'mod_ja_jobs_tags', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_ja_jobs_tags.xml', '', ''),
(186, 7, 0, 'JA Accordion Module for J25 & J34', '', 'mod_jaaccordion', 'module', '', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaaccordion.xml', '', ''),
(187, 7, 0, 'JA Animation module for Joomla 2.5 & 3.2', '', 'mod_jaanimation', 'module', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaanimation.xml', '', ''),
(188, 7, 0, 'JA Bulletin Module for J25 & J3', '', 'mod_jabulletin', 'module', '', 0, '2.6.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jabulletin.xml', '', ''),
(189, 7, 0, 'JA Latest Comment Module for Joomla 2.5 & 3.3', '', 'mod_jaclatest_comments', 'module', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaclatest_comments.xml', '', ''),
(190, 7, 0, 'JA Content Popup Module for J25 & J34', '', 'mod_jacontentpopup', 'module', '', 0, '1.1.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentpopup.xml', '', ''),
(191, 7, 0, 'JA Content Scroll module for Joomla 1.6', '', 'mod_jacontentscroll', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentscroll.xml', '', ''),
(192, 7, 0, 'JA Contenslider module for Joomla 1.6', '', 'mod_jacontentslide', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentslide.xml', '', ''),
(193, 7, 0, 'JA Content Slider Module for J25 & J34', '', 'mod_jacontentslider', 'module', '', 0, '2.7.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentslider.xml', '', ''),
(194, 7, 0, 'JA CountDown Module for Joomla 2.5 & 3.4', '', 'mod_jacountdown', 'module', '', 0, '1.0.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacountdown.xml', '', ''),
(195, 7, 0, 'JA Facebook Activity Module for J25 & J30', '', 'mod_jafacebookactivity', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafacebookactivity.xml', '', ''),
(196, 7, 0, 'JA Facebook Like Box Module for J25 & J30', '', 'mod_jafacebooklikebox', 'module', '', 0, '2.6.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafacebooklikebox.xml', '', ''),
(197, 7, 0, 'JA Featured Employer module for Joomla 2.5', '', 'mod_jafeatured_employer', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafeatured_employer.xml', '', ''),
(198, 7, 0, 'JA Filter Jobs module for Joomla 2.5', '', 'mod_jafilter_jobs', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafilter_jobs.xml', '', ''),
(199, 7, 0, 'JA flowlist module for Joomla 2.5 & 3.0', '', 'mod_jaflowlist', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaflowlist.xml', '', ''),
(200, 7, 0, 'JAEC Halloween Module for Joomla 2.5 & 3', '', 'mod_jahalloween', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jahalloween.xml', '', ''),
(201, 7, 0, 'JA Image Hotspot Module for Joomla 2.5 & 3.4', '', 'mod_jaimagehotspot', 'module', '', 0, '1.0.8', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaimagehotspot.xml', '', ''),
(202, 7, 0, 'JA static module for Joomla 2.5', '', 'mod_jajb_statistic', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajb_statistic.xml', '', ''),
(203, 7, 0, 'JA Jobboard Menu module for Joomla 2.5', '', 'mod_jajobboard_menu', 'module', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobboard_menu.xml', '', ''),
(204, 7, 0, 'JA Jobs Counter module for Joomla 2.5', '', 'mod_jajobs_counter', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobs_counter.xml', '', ''),
(205, 7, 0, 'JA Jobs Map module for Joomla 2.5', '', 'mod_jajobs_map', 'module', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobs_map.xml', '', ''),
(206, 7, 0, 'JA K2 Fillter Module for Joomla 2.5', '', 'mod_jak2_filter', 'module', '', 0, '1.0.0 Alpha', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2_filter.xml', '', ''),
(207, 7, 0, 'JA K2 Filter Module for J25 & J3.4', '', 'mod_jak2filter', 'module', '', 0, '1.1.9', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2filter.xml', '', ''),
(208, 7, 0, 'JA K2 Timeline', '', 'mod_jak2timeline', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2timeline.xml', '', ''),
(209, 7, 0, 'JA Latest Resumes module for Joomla 2.5', '', 'mod_jalatest_resumes', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalatest_resumes.xml', '', ''),
(210, 7, 0, 'JA List Employer module for Joomla 2.5', '', 'mod_jalist_employers', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_employers.xml', '', ''),
(211, 7, 0, 'JA List Jobs module for Joomla 2.5', '', 'mod_jalist_jobs', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_jobs.xml', '', ''),
(212, 7, 0, 'JA List Resumes module for Joomla 2.5', '', 'mod_jalist_resumes', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_resumes.xml', '', ''),
(213, 7, 0, 'JA Login module for J25 & J3x', '', 'mod_jalogin', 'module', '', 0, '2.6.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalogin.xml', '', ''),
(214, 7, 0, 'JA Masshead Module for J25 & J34', '', 'mod_jamasshead', 'module', '', 0, '2.6.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jamasshead.xml', '', ''),
(215, 7, 0, 'JA News Featured Module for J25 & J34', '', 'mod_janews_featured', 'module', '', 0, '2.6.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_janews_featured.xml', '', ''),
(216, 7, 0, 'JA Newsflash module for Joomla 1.6.x', '', 'mod_janewsflash', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsflash.xml', '', ''),
(217, 7, 0, 'JA Newsmoo module for Joomla 1.6.x', '', 'mod_janewsmoo', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsmoo.xml', '', ''),
(218, 7, 0, 'JA News Pro Module for J25 & J3x', '', 'mod_janewspro', 'module', '', 0, '2.6.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewspro.xml', '', ''),
(219, 7, 0, 'JA Newsticker Module for J3x', '', 'mod_janewsticker', 'module', '', 0, '2.6.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsticker.xml', '', ''),
(220, 7, 0, 'JA Quick Contact Module for J25 & J34', '', 'mod_jaquickcontact', 'module', '', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaquickcontact.xml', '', ''),
(221, 7, 0, 'JA Recent Viewed Jobs module for Joomla 2.5', '', 'mod_jarecent_viewed_jobs', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jarecent_viewed_jobs.xml', '', ''),
(222, 7, 0, 'JA SideNews Module for J25 & J34', '', 'mod_jasidenews', 'module', '', 0, '2.6.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasidenews.xml', '', ''),
(223, 7, 0, 'JA Slideshow Module for Joomla 2.5 & 3.4', '', 'mod_jaslideshow', 'module', '', 0, '2.7.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaslideshow.xml', '', ''),
(224, 7, 0, 'JA Slideshow Lite Module for J25 & J3.4', '', 'mod_jaslideshowlite', 'module', '', 0, '1.2.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaslideshowlite.xml', '', ''),
(225, 7, 0, 'JA Soccerway Module for J25 & J33', '', 'mod_jasoccerway', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasoccerway.xml', '', ''),
(226, 7, 0, 'JA Social Locker module', '', 'mod_jasocial_locker', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasocial_locker.xml', '', ''),
(227, 7, 0, 'JA Tab module for Joomla 2.5', '', 'mod_jatabs', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatabs.xml', '', ''),
(228, 7, 0, 'JA Toppanel Module for Joomla 2.5 & Joomla 3.3', '', 'mod_jatoppanel', 'module', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatoppanel.xml', '', ''),
(229, 7, 0, 'JA Twitter Module for J25 & J3.4', '', 'mod_jatwitter', 'module', '', 0, '2.6.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatwitter.xml', '', ''),
(230, 7, 0, 'JA List of Voices Module for J2.5 & J3.x', '', 'mod_javlist_voices', 'module', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_javlist_voices.xml', '', ''),
(231, 7, 0, 'JA VMProducts Module', '', 'mod_javmproducts', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_javmproducts.xml', '', ''),
(232, 7, 0, 'JA Voice  Work Flow Module for J2.5 & J3.x', '', 'mod_javwork_flow', 'module', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_javwork_flow.xml', '', ''),
(233, 7, 0, 'JA Amazon S3 Button Plugin for joomla 2.5 & 3.1', '', 'jaamazons3', 'plugin', 'button', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jaamazons3.xml', '', ''),
(234, 7, 0, 'JA AVTracklist Button plugin for J2.5 & J3.3', '', 'jaavtracklist', 'plugin', 'button', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jaavtracklist.xml', '', ''),
(235, 7, 0, 'JA Comment Off Plugin for Joomla 2.5 & 3.3', '', 'jacommentoff', 'plugin', 'button', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommentoff.xml', '', ''),
(236, 7, 0, 'JA Comment On Plugin for Joomla 2.5 & 3.3', '', 'jacommenton', 'plugin', 'button', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommenton.xml', '', ''),
(237, 7, 0, 'JA Amazon S3 System plugin for joomla 2.5 & 3.1', '', 'plg_jaamazons3', 'plugin', 'plg_jaamazons3', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_jaamazons3.xml', '', ''),
(238, 7, 0, 'JA AVTracklist plugin for J2.5 & J3.3', '', 'plg_jaavtracklist', 'plugin', 'plg_jaavtracklist', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_jaavtracklist.xml', '', ''),
(239, 7, 0, 'JA Bookmark plugin for J3.x', '', 'plg_jabookmark', 'plugin', 'plg_jabookmark', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/plg_jabookmark.xml', '', ''),
(240, 7, 0, 'JA Comment Plugin for Joomla 2.5 & 3.3', '', 'plg_jacomment', 'plugin', 'plg_jacomment', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/plg_jacomment.xml', '', ''),
(241, 7, 0, 'JA Disqus Debate Echo plugin for J3x', '', 'debate_echo', 'plugin', 'jadisqus', 0, '2.6.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_jadisqus_debate_echo.xml', '', ''),
(242, 7, 0, 'JA Google Storage Plugin for j25 & j30', '', 'plg_jagooglestorage', 'plugin', 'plg_jagooglestorage', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jagooglestorage.xml', '', ''),
(243, 7, 0, 'JA Translate plugin for Joomla 1.6.x', '', 'plg_jagoogletranslate', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jagoogletranslate.xml', '', ''),
(244, 7, 0, 'JA Thumbnail Plugin for J25 & J3', '', 'plg_jathumbnail', 'plugin', 'plg_jathumbnail', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/plg_jathumbnail.xml', '', ''),
(245, 7, 0, 'JA Tooltips plugin for Joomla 1.6.x', '', 'plg_jatooltips', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jatooltips.xml', '', ''),
(246, 7, 0, 'JA Typo Button Plugin for J25 & J3x', '', 'plg_jatypobutton', 'plugin', 'plg_jatypobutton', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/plg_jatypobutton.xml', '', ''),
(247, 7, 0, 'JA K2 Filter Plg for J25 & J3.4', '', 'jak2filter', 'plugin', 'k2', 0, '1.1.9', '', 'http://update.joomlart.com/service/tracking/j16/plg_k2_jak2filter.xml', '', ''),
(248, 7, 0, 'JA K2 Timeline Plugin', '', 'jak2timeline', 'plugin', 'k2', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_k2_jak2timeline.xml', '', ''),
(249, 7, 0, 'Multi Capcha Engine Plugin for J25 & J32', '', 'captcha_engine', 'plugin', 'multiple', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_multiple_captcha_engine.xml', '', ''),
(250, 7, 0, 'JA JobBoard Payment Plugin Authorize for Joomla 2.5', '', 'plg_payment_jajb_authorize_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_authorize_25.xml', '', ''),
(251, 7, 0, 'JA JobBoard Payment Plugin MoneyBooker for Joomla 2.5', '', 'plg_payment_jajb_moneybooker_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_moneybooker_25.xml', '', ''),
(252, 7, 0, 'JA JobBoard Payment Plugin Paypal for Joomla 2.5', '', 'plg_payment_jajb_paypal_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_paypal_25.xml', '', ''),
(253, 7, 0, 'JA JobBoard Payment Plugin BankWire for Joomla 2.5', '', 'plg_payment_jajb_wirebank_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_wirebank_25.xml', '', ''),
(254, 7, 0, 'JA Search Comment Plugin for Joomla J2.5 & 3.0', '', 'jacomment', 'plugin', 'search', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_search_jacomment.xml', '', ''),
(255, 7, 0, 'JA Search Jobs plugin for Joomla 2.5', '', 'jajob', 'plugin', 'search', 0, '1.0.0 stable', '', 'http://update.joomlart.com/service/tracking/j16/plg_search_jajob.xml', '', ''),
(256, 7, 0, 'JA System Comment Plugin for Joomla 2.5 & 3.3', '', 'jacomment', 'plugin', 'system', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jacomment.xml', '', ''),
(257, 7, 0, 'JA Content Extra Fields for Joomla 2.5', '', 'jacontentextrafields', 'plugin', 'system', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jacontentextrafields.xml', '', ''),
(258, 7, 0, 'JA System Google Map plugin for Joomla 2.5 & J3.4', '', 'jagooglemap', 'plugin', 'system', 0, '2.6.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jagooglemap.xml', '', ''),
(259, 7, 0, 'JAEC PLG System Jobboad Jomsocial Synchonization', '', 'jajb_jomsocial', 'plugin', 'system', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jajb_jomsocial.xml', '', ''),
(260, 7, 0, 'JA System Lazyload Plugin for J25 & J3x', '', 'jalazyload', 'plugin', 'system', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jalazyload.xml', '', ''),
(261, 7, 0, 'JA System Nrain Plugin for Joomla 2.5 & 3.3', '', 'janrain', 'plugin', 'system', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_janrain.xml', '', ''),
(262, 7, 0, 'JA Popup Plugin for J25 & J34', '', 'japopup', 'plugin', 'system', 0, '2.6.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_japopup.xml', '', ''),
(263, 7, 0, 'JA System Social Plugin for Joomla 2.5 & 3.0', '', 'jasocial', 'plugin', 'system', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jasocial.xml', '', ''),
(264, 7, 0, 'JA System Social Feed Plugin for Joomla 2.5 & 3.4', '', 'jasocial_feed', 'plugin', 'system', 0, '1.2.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jasocial_feed.xml', '', ''),
(265, 7, 0, 'JA T3v2 System Plugin for J25 & J3x', '', 'jat3', 'plugin', 'system', 0, '2.7.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jat3.xml', '', ''),
(266, 7, 0, 'JA T3v3 System Plugin', '', 'jat3v3', 'plugin', 'system', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jat3v3.xml', '', ''),
(267, 7, 0, 'JA Tabs Plugin for J25 & J3.4', '', 'jatabs', 'plugin', 'system', 0, '2.6.6', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jatabs.xml', '', ''),
(268, 7, 0, 'JA Typo Plugin for J25 & J32', '', 'jatypo', 'plugin', 'system', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jatypo.xml', '', ''),
(269, 7, 0, 'T3 Blank Template', '', 't3_blank', 'template', '', 0, '2.1.9', '', 'http://update.joomlart.com/service/tracking/j16/t3_blank.xml', '', ''),
(270, 7, 0, 'T3 B3 Blank Template', '', 't3_bs3_blank', 'template', '', 0, '2.1.4', '', 'http://update.joomlart.com/service/tracking/j16/t3_bs3_blank.xml', '', ''),
(271, 7, 0, 'JA Teline III Template for Joomla 2.5', '', 'teline_iii', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/teline_iii.xml', '', ''),
(272, 7, 0, 'Thirdparty Extensions Compatibility Bundle', '', 'thirdparty_exts_compatibility', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/thirdparty_exts_compatibility.xml', '', ''),
(273, 7, 0, 'Uber Template', '', 'uber', 'template', '', 0, '2.1.1', '', 'http://update.joomlart.com/service/tracking/j16/uber.xml', '', ''),
(274, 7, 0, 'T3 B3 Blank Template', '', 't3_bs3_blank', 'template', '', 0, '2.1.9', '', 'http://update.joomlart.com/service/tracking/j30/t3_bs3_blank.xml', '', ''),
(275, 7, 0, 'JA K2 v3 Filter package for J33', '', 'com_jak2v3filter', 'component', '', 1, '3.0.0 preview ', '', 'http://update.joomlart.com/service/tracking/j31/com_jak2v3filter.xml', '', ''),
(276, 7, 0, 'JA Multilingual Component for Joomla 2.5 & 3.4', '', 'com_jalang', 'component', '', 1, '1.0.7', '', 'http://update.joomlart.com/service/tracking/j31/com_jalang.xml', '', ''),
(277, 7, 0, 'JA Sugite Theme for EasyBlog', '', 'easyblog_theme_sugite', 'custom', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j31/easyblog_theme_sugite.xml', '', ''),
(278, 7, 0, 'JA Biz Template', '', 'ja_biz', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j31/ja_biz.xml', '', ''),
(279, 7, 0, 'JA Cago template', '', 'ja_cago', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/ja_cago.xml', '', ''),
(280, 7, 0, 'JA Cagox template', '', 'ja_cagox', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/ja_cagox.xml', '', ''),
(281, 7, 0, 'JA Charity template', '', 'ja_charity', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/ja_charity.xml', '', ''),
(282, 7, 0, 'JA Directory Template', '', 'ja_directory', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/ja_directory.xml', '', ''),
(283, 7, 0, 'JA Fixel Template', '', 'ja_fixel', 'template', '', 0, '1.1.3', '', 'http://update.joomlart.com/service/tracking/j31/ja_fixel.xml', '', ''),
(284, 7, 0, 'JA Hotel Template', '', 'ja_hotel', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/ja_hotel.xml', '', ''),
(285, 7, 0, 'JA Muzic Template for J25 & J33', '', 'ja_muzic', 'template', '', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j31/ja_muzic.xml', '', ''),
(286, 7, 0, 'JA Teline V Template', '', 'ja_teline_v', 'template', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j31/ja_teline_v.xml', '', ''),
(287, 7, 0, 'JA Wall Template for J25 & J34', '', 'ja_wall', 'template', '', 0, '1.2.1', '', 'http://update.joomlart.com/service/tracking/j31/ja_wall.xml', '', '');
INSERT INTO `vp_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(288, 7, 0, 'Theme Fixel for JShopping J25 & J30', '', 'jshopping_theme_fixel', 'custom', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j31/jshopping_theme_fixel.xml', '', ''),
(289, 7, 0, 'JA Tiris Kunena Theme for Joomla 3x', '', 'kunena_theme_mitius_j31', 'custom', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j31/kunena_theme_mitius_j31.xml', '', ''),
(290, 7, 0, 'Mijoshop Modules Accordion', '', 'mijoshop_mod_accordion', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/mijoshop_mod_accordion.xml', '', ''),
(291, 7, 0, 'Mijoshop V3 Modules Accordion', '', 'mijoshop_mod_accordion_v3', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/mijoshop_mod_accordion_v3.xml', '', ''),
(292, 7, 0, 'Mijoshop Modules Slider', '', 'mijoshop_mod_slider', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j31/mijoshop_mod_slider.xml', '', ''),
(293, 7, 0, 'Mijoshop V3 Modules Slider', '', 'mijoshop_mod_slider_v3', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/mijoshop_mod_slider_v3.xml', '', ''),
(294, 7, 0, 'JA Bookshop Theme for Mijoshop V3', '', 'mijoshop_theme_bookshop_v3', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/mijoshop_theme_bookshop_v3.xml', '', ''),
(295, 7, 0, 'JA Google Chart Module', '', 'mod_jagooglechart', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/mod_jagooglechart.xml', '', ''),
(296, 7, 0, 'JA K2 v3 Filter Module for J33', '', 'mod_jak2v3filter', 'module', '', 0, '3.0.0 preview ', '', 'http://update.joomlart.com/service/tracking/j31/mod_jak2v3filter.xml', '', ''),
(297, 7, 0, 'JA Promo Bar module', '', 'mod_japromobar', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/mod_japromobar.xml', '', ''),
(298, 7, 0, 'Ja Yahoo Finance', '', 'mod_jayahoo_finance', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/mod_jayahoo_finance.xml', '', ''),
(299, 7, 0, 'Ja Yahoo Weather', '', 'mod_jayahoo_weather', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j31/mod_jayahoo_weather.xml', '', ''),
(300, 7, 0, 'Plugin Ajax JA Content Type', '', 'jacontenttype', 'plugin', 'ajax', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/plg_ajax_jacontenttype.xml', '', ''),
(301, 7, 0, 'Plgin JA K2 import to Joomla Content', '', 'plg_jak2tocontent', 'plugin', 'plg_jak2tocontent', 0, '1.0.0 beta', '', 'http://update.joomlart.com/service/tracking/j31/plg_jak2tocontent.xml', '', ''),
(302, 7, 0, 'JA K2 Extrafields', '', 'jak2extrafields', 'plugin', 'k2', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j31/plg_k2_jak2extrafields.xml', '', ''),
(303, 7, 0, 'JA K2 v3 Filter Plugin for J33', '', 'jak2v3filter', 'plugin', 'k2', 0, '3.0.0 preview ', '', 'http://update.joomlart.com/service/tracking/j31/plg_k2_jak2v3filter.xml', '', ''),
(304, 7, 0, 'Plugin JA Content Type', '', 'jacontenttype', 'plugin', 'system', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j31/plg_system_jacontenttype.xml', '', ''),
(305, 7, 0, 'Purity III Template', '', 'purity_iii', 'template', '', 0, '1.1.4', '', 'http://update.joomlart.com/service/tracking/j31/purity_iii.xml', '', ''),
(306, 7, 0, 'Sample package for Uber App', '', 'uber_app', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_app.xml', '', ''),
(307, 7, 0, 'Sample package for Uber Bookstore', '', 'uber_bookstore', 'sample_package', '', 0, '2.1.1', '', 'http://update.joomlart.com/service/tracking/j31/uber_bookstore.xml', '', ''),
(308, 7, 0, 'Sample package for Uber Business', '', 'uber_business', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_business.xml', '', ''),
(309, 7, 0, 'Sample package for Uber Charity', '', 'uber_charity', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_charity.xml', '', ''),
(310, 7, 0, 'Sample package for Uber Church', '', 'uber_church', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_church.xml', '', ''),
(311, 7, 0, 'Sample package for Uber Construction', '', 'uber_construction', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_construction.xml', '', ''),
(312, 7, 0, 'Sample package for Uber Corporate', '', 'uber_corporate', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_corporate.xml', '', ''),
(313, 7, 0, 'Sample package for Uber Gym', '', 'uber_gym', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_gym.xml', '', ''),
(314, 7, 0, 'Sample package for Uber Home', '', 'uber_home', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_home.xml', '', ''),
(315, 7, 0, 'Sample package for Landing page', '', 'uber_landing', 'sample_package', '', 0, '2.1.0', '', 'http://update.joomlart.com/service/tracking/j31/uber_landing.xml', '', ''),
(316, 7, 0, 'Sample package for Uber Lawyer', '', 'uber_lawyer', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_lawyer.xml', '', ''),
(317, 7, 0, 'Sample package for Uber Medicare', '', 'uber_medicare', 'sample_package', '', 0, '2.1.0', '', 'http://update.joomlart.com/service/tracking/j31/uber_medicare.xml', '', ''),
(318, 7, 0, 'Sample package for Uber Music', '', 'uber_music', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_music.xml', '', ''),
(319, 7, 0, 'Sample package for Uber Restaurant', '', 'uber_restaurant', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_restaurant.xml', '', ''),
(320, 7, 0, 'Sample package for Uber Spa', '', 'uber_spa', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_spa.xml', '', ''),
(321, 7, 0, 'Sample package for Uber University', '', 'uber_university', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_university.xml', '', ''),
(322, 7, 0, 'Sample package for Uber Wedding', '', 'uber_wedding', 'sample_package', '', 0, '2.0.2', '', 'http://update.joomlart.com/service/tracking/j31/uber_wedding.xml', '', ''),
(323, 9, 0, 'JoomGallery', '', 'com_joomgallery', 'component', '', 1, '3.2.1', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomgallery.xml', '', ''),
(324, 9, 0, 'JoomPlu', '', 'joomplu', 'plugin', 'content', 0, '3.1', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomplu.xml', '', ''),
(325, 9, 0, 'JoomBu', '', 'joombu', 'plugin', 'editors-xtd', 0, '3.2', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joombu.xml', '', ''),
(326, 9, 0, 'JoomFancybox', '', 'joomfancybox', 'plugin', 'joomgallery', 0, '1.1', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomfancybox.xml', '', ''),
(327, 9, 0, 'JoomLightbox2', '', 'joomlightbox2', 'plugin', 'joomgallery', 0, '1.0', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomlightbox2.xml', '', ''),
(328, 9, 0, 'JoomColorbox', '', 'joomcolorbox', 'plugin', 'joomgallery', 0, '3.0 BETA', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomcolorbox.xml', '', ''),
(329, 9, 0, 'JoomLytebox', '', 'joomlytebox', 'plugin', 'joomgallery', 0, '3.0 BETA2', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomlytebox.xml', '', ''),
(330, 9, 0, 'JoomQuickicon', '', 'joomgallery', 'plugin', 'quickicon', 0, '3.0 BETA', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomquickicon.xml', '', ''),
(331, 9, 0, 'JoomTreeview', '', 'mod_jgreeview', 'module', '', 0, '3.1 BETA', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomtreeview.xml', '', ''),
(332, 9, 0, 'JoomStats', '', 'mod_joomstats', 'module', '', 0, '3.0 BETA', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomstats.xml', '', ''),
(333, 9, 0, 'JoomSearchModule', '', 'mod_joomsearch', 'module', '', 0, '3.0 BETA', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomsearchmodule.xml', '', ''),
(334, 9, 0, 'JoomCategories', '', 'mod_joomcat', 'module', '', 0, '3.0 BETA2', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomcategories.xml', '', ''),
(335, 9, 0, 'JoomImages', '', 'mod_joomimg', 'module', '', 0, '3.2.1', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomimages.xml', '', ''),
(336, 9, 0, 'XmapPlugin', '', 'com_joomgallery', 'plugin', 'xmap', 0, '2.0', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/xmapplugin.xml', '', ''),
(337, 9, 0, 'JoomAdditionalImageFields', '', 'joomadditionalimagefields', 'plugin', 'joomgallery', 0, '1.1', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomadditionalimagefields.xml', '', ''),
(338, 9, 0, 'JoomAdditionalCategoryFields', '', 'joomadditionalcategoryfields', 'plugin', 'joomgallery', 0, '1.1', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomadditionalcategoryfields.xml', '', ''),
(339, 9, 0, 'JoomreCaptcha', '', 'joomrecaptcha', 'plugin', 'joomgallery', 0, '2.0', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomrecaptcha.xml', '', ''),
(340, 9, 0, 'JoomShadowbox', '', 'joomshadowbox', 'plugin', 'joomgallery', 0, '3.0', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomshadowbox.xml', '', ''),
(341, 9, 0, 'JoomHighslide', '', 'joomhighslide', 'plugin', 'joomgallery', 0, '3.0', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomhighslide.xml', '', ''),
(342, 9, 0, 'JoomRokBox', '', 'joomrokbox', 'plugin', 'joomgallery', 0, '3.0', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomrokbox.xml', '', ''),
(343, 9, 0, 'JoomprettyPhoto', '', 'joomprettyphoto', 'plugin', 'joomgallery', 0, '1.0', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomprettyphoto.xml', '', ''),
(344, 9, 0, 'JoomPhotoswipe', '', 'joomphotoswipe', 'plugin', 'joomgallery', 0, '3.0 BETA', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomphotoswipe.xml', '', ''),
(345, 9, 0, 'MigrateMVC2JUX', '', 'joomgallery_migratemvc2jux', 'file', '', 0, '3.0', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/migratemvc2jux.xml', '', ''),
(346, 9, 0, 'Migrate4Images2Joom', '', 'joomgallery_migrate4images2joo', 'file', '', 0, '3.0 Beta', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/migrate4images2joom.xml', '', ''),
(347, 9, 0, 'MigratePhoca2Joom', '', 'joomgallery_migratephoca2joom', 'file', '', 0, '3.0', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/migratephoca2joom.xml', '', ''),
(348, 9, 0, 'JoomMarketLink', '', 'joommarketlink', 'plugin', 'joomgallery', 0, '3.1', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joommarketlink.xml', '', ''),
(349, 9, 0, 'JoomDisplayCBname', '', 'joomdisplaycbname', 'plugin', 'joomgallery', 0, '3.1', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/joomdisplaycbname.xml', '', ''),
(350, 9, 0, 'MigrateACL2JUX', '', 'joomgallery_migrateacl2jux', 'file', '', 0, '3.0', '', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3/migrateacl2jux.xml', '', ''),
(351, 10, 0, 'JoomGallery', '', 'com_joomgallery', 'component', '', 0, '3.2.1', '', 'http://www.joomgallery.net/components/com_newversion/xml/extensions3/joomgallery.xml', '', ''),
(352, 10, 0, 'JoomTreeview', '', 'mod_jgtreeview', 'module', '', 0, '3.1 BETA', '', 'http://www.joomgallery.net/components/com_newversion/xml/extensions3/joomtreeview.xml', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `vp_update_sites`
--

CREATE TABLE IF NOT EXISTS `vp_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `vp_update_sites`
--

INSERT INTO `vp_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1434463919, ''),
(2, 'Joomla! Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1434463921, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 1434463919, ''),
(4, 'Joomla! Update Component Update Site', 'extension', 'http://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1434463919, ''),
(5, 'MOD_BACKENDLANGUAGESWITCHER', 'extension', 'https://joomla-extensions.kubik-rubik.de/scripts/update-servers/backendlanguageswitcher.xml', 1, 1434463919, ''),
(7, '', 'collection', 'http://update.joomlart.com/service/tracking/list.xml', 1, 1434463919, ''),
(8, 'Attachments Updates', 'extension', 'http://jmcameron.net/attachments/updates/updates.xml', 1, 1434463919, ''),
(9, 'JoomGallery Update Service', 'collection', 'http://www.en.joomgallery.net/components/com_newversion/xml/extensions3.xml', 1, 1434463919, ''),
(10, 'JoomGallery Update Service', 'collection', 'http://www.joomgallery.net/components/com_newversion/xml/extensions3.xml', 1, 1434463919, ''),
(12, 'JoomGallery Update Service', 'extension', 'http://en.joomgallery.net/components/com_newversion/xml/extensions3.xml', 1, 1434463919, ''),
(13, 'Mod_VVisit_Counter Update Site', 'extension', 'http://www.mmajunke.de/update/joomla/modvvisitcounter-update.xml', 1, 1434463919, '');

-- --------------------------------------------------------

--
-- Table structure for table `vp_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `vp_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `vp_update_sites_extensions`
--

INSERT INTO `vp_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(3, 10002),
(4, 28),
(5, 10003),
(7, 10007),
(8, 10020),
(9, 10033),
(10, 10030),
(12, 10034),
(13, 10054);

-- --------------------------------------------------------

--
-- Table structure for table `vp_usergroups`
--

CREATE TABLE IF NOT EXISTS `vp_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `vp_usergroups`
--

INSERT INTO `vp_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `vp_users`
--

CREATE TABLE IF NOT EXISTS `vp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=472 ;

--
-- Dumping data for table `vp_users`
--

INSERT INTO `vp_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(471, 'Super User', 'vietpan', 'toanktv.it@gmail.com', '$2y$10$tsw/57kJy8stPr0s0F7q1O1XtHIAQEG56MwAg6mov63uvuA3dcTgK', 0, 1, '2015-05-30 17:04:05', '2015-06-16 14:50:44', '0', '', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vp_user_keys`
--

CREATE TABLE IF NOT EXISTS `vp_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_user_notes`
--

CREATE TABLE IF NOT EXISTS `vp_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vp_user_profiles`
--

CREATE TABLE IF NOT EXISTS `vp_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `vp_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `vp_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vp_user_usergroup_map`
--

INSERT INTO `vp_user_usergroup_map` (`user_id`, `group_id`) VALUES
(471, 8);

-- --------------------------------------------------------

--
-- Table structure for table `vp_viewlevels`
--

CREATE TABLE IF NOT EXISTS `vp_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `vp_viewlevels`
--

INSERT INTO `vp_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

-- --------------------------------------------------------

--
-- Table structure for table `vp_vvisitcounter`
--

CREATE TABLE IF NOT EXISTS `vp_vvisitcounter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tm` int(11) NOT NULL,
  `ip` binary(20) NOT NULL,
  `ipraw` varchar(40) DEFAULT NULL,
  `userAgent` varchar(1024) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `tm` (`tm`),
  KEY `ip` (`ip`),
  KEY `iptm` (`ip`,`tm`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `vp_vvisitcounter`
--

INSERT INTO `vp_vvisitcounter` (`id`, `tm`, `ip`, `ipraw`, `userAgent`, `data`) VALUES
(1, 1433177422, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(2, 1433261826, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(3, 1433262800, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(4, 1433264404, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(5, 1433265313, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(6, 1433390178, 'K��[�n�yaRIZ#E���G�', NULL, NULL, NULL),
(7, 1433396264, 'K��[�n�yaRIZ#E���G�', NULL, NULL, NULL),
(8, 1433397435, 'K��[�n�yaRIZ#E���G�', NULL, NULL, NULL),
(9, 1433399377, 'K��[�n�yaRIZ#E���G�', NULL, NULL, NULL),
(10, 1433515449, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(11, 1433516440, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(12, 1433517352, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(13, 1433518438, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(14, 1433519349, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(15, 1433599700, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(16, 1433601052, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(17, 1433602790, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(18, 1433603944, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(19, 1433604922, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(20, 1433650044, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(21, 1433650962, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(22, 1433651972, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(23, 1433653275, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(24, 1433654291, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(25, 1433656020, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(26, 1433657522, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(27, 1433659593, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(28, 1433662603, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(29, 1433663948, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(30, 1433665068, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(31, 1433665979, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(32, 1433667651, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(33, 1433668746, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(34, 1433675119, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(35, 1433908459, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(36, 1434160249, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(37, 1434161301, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(38, 1434162222, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(39, 1434163129, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(40, 1434164043, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(41, 1434166829, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(42, 1434167911, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(43, 1434169010, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(44, 1434169964, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(45, 1434170926, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(46, 1434379167, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(47, 1434380217, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(48, 1434381293, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(49, 1434382305, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(50, 1434463908, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(51, 1434464867, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(52, 1434465854, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(53, 1434466904, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(54, 1434467840, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL),
(55, 1434468873, '6;��ˢ��mzUo�Yn0�c3', NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
