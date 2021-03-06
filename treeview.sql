-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 31, 2017 at 11:23 AM
-- Server version: 5.6.16-1~exp1
-- PHP Version: 7.0.21-1~ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookmark`
--

-- --------------------------------------------------------

--
-- Table structure for table `treeview`
--

CREATE TABLE `treeview` (
  `urlid` varchar(16) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `url` varchar(2048) DEFAULT NULL,
  `parenturlid` varchar(16) DEFAULT NULL,
  `childrenids` varchar(2048) DEFAULT NULL,
  `memberids` varchar(1024) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_dt` datetime DEFAULT NULL,
  `updated_ts` timestamp NULL DEFAULT NULL,
  `updated_dt` datetime DEFAULT NULL,
  `created_ts` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treeview`
--

INSERT INTO `treeview` (`urlid`, `title`, `url`, `parenturlid`, `childrenids`, `memberids`, `active`, `created_dt`, `updated_ts`, `updated_dt`, `created_ts`) VALUES
('032ec6dc1d615681', 'bbbb', NULL, '641a308dfd796e4c', NULL, NULL, 1, '2017-07-23 09:02:11', NULL, NULL, '0000-00-00 00:00:00'),
('1', 'prakashtitle1', NULL, '', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-30 14:49:13', '0000-00-00 00:00:00'),
('10', 'f100', NULL, '1', '', '', 1, '2017-07-18 19:28:56', '0000-00-00 00:00:00', '2017-07-30 15:19:13', '0000-00-00 00:00:00'),
('11', 'foldernode11', '', '1', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-23 08:58:57', '0000-00-00 00:00:00'),
('12', 'bookmark12', 'bookmark', '1', '', '', 1, '2017-07-18 18:51:54', '0000-00-00 00:00:00', '2017-07-18 18:51:54', '0000-00-00 00:00:00'),
('13', 'bookmark13', 'bookmark', '17', '', '', 1, '2017-07-20 23:04:11', '0000-00-00 00:00:00', '2017-07-20 23:04:11', '0000-00-00 00:00:00'),
('14', 'bookmark14', 'sevenseven', '17', '', '', 1, '2017-07-16 15:36:02', '0000-00-00 00:00:00', '2017-07-16 15:36:02', '0000-00-00 00:00:00'),
('15', 'f15', '', '11', '', '', 1, '2017-07-16 15:36:14', '0000-00-00 00:00:00', '2017-07-23 08:59:06', '0000-00-00 00:00:00'),
('17', 'f17', '', '2', '', '', 1, '2017-07-18 19:36:07', '0000-00-00 00:00:00', '2017-07-18 19:36:07', '0000-00-00 00:00:00'),
('2', 'folderf2', '', '1', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('25b476a5e64a34a8', 'bbb', 'bbb', '032ec6dc1d615681', NULL, NULL, 1, '2017-07-23 09:02:21', NULL, NULL, '0000-00-00 00:00:00'),
('2c11be993474f6a1', 'ddd', 'ddd', 'ce10a216cfb2d1f2', NULL, NULL, 1, '2017-07-23 09:09:23', '0000-00-00 00:00:00', '2017-07-23 09:09:31', '0000-00-00 00:00:00'),
('3471c3a867881b4f', 'gggg', 'bbb', '641a308dfd796e4c', NULL, NULL, 1, '2017-07-23 09:02:02', NULL, NULL, '0000-00-00 00:00:00'),
('4', 'bookmark4', 'bookmark2', '8', '', '', 1, '2017-07-21 15:22:38', '0000-00-00 00:00:00', '2017-07-23 08:58:47', '0000-00-00 00:00:00'),
('55ea51e6b5b16a18', 'gggg', NULL, 'c67ea3274de63405', NULL, NULL, 1, '2017-07-23 09:01:37', NULL, NULL, '0000-00-00 00:00:00'),
('641a308dfd796e4c', 'bbb', NULL, '55ea51e6b5b16a18', NULL, NULL, 1, '2017-07-23 09:01:48', NULL, NULL, '0000-00-00 00:00:00'),
('7', 'folder7', '', '11', '', '', 1, '2017-07-21 15:22:17', '0000-00-00 00:00:00', '2017-07-21 15:22:17', '0000-00-00 00:00:00'),
('7e8d27d302369dd9', 'b1', 'v1', 'c8ff4a3512864f03', NULL, NULL, 1, '2017-07-23 08:59:36', NULL, NULL, '0000-00-00 00:00:00'),
('8', 'folder8', '', '11', '', '', 1, '2017-07-21 15:22:05', '0000-00-00 00:00:00', '2017-07-21 15:22:05', '0000-00-00 00:00:00'),
('9', 'bookmark99', 'bookmark', '1', '', '', 1, '2017-07-18 18:52:18', '0000-00-00 00:00:00', '2017-07-18 18:52:18', '0000-00-00 00:00:00'),
('900095123ae52c76', 'popbookmark22', 'popbookmark22', '1', NULL, NULL, 1, '2017-07-30 14:57:54', '0000-00-00 00:00:00', '2017-07-30 14:58:16', '0000-00-00 00:00:00'),
('c67ea3274de63405', 'fff', NULL, 'c8ff4a3512864f03', NULL, NULL, 1, '2017-07-23 09:01:30', NULL, NULL, '0000-00-00 00:00:00'),
('c8ff4a3512864f03', 'first', NULL, '15', NULL, NULL, 1, '2017-07-23 08:59:19', NULL, NULL, '0000-00-00 00:00:00'),
('ce10a216cfb2d1f2', 'wd1s', NULL, 'd896abce2ef68c3d', NULL, NULL, 1, '2017-07-31 11:20:27', NULL, NULL, '0000-00-00 00:00:00'),
('d62f6e82f6493842', 'gffg11', 'fgfg11', 'd896abce2ef68c3d', NULL, NULL, 1, '2017-07-23 09:02:31', '0000-00-00 00:00:00', '2017-07-31 11:20:16', '0000-00-00 00:00:00'),
('d896abce2ef68c3d', 'wd', NULL, '10', NULL, NULL, 1, '2017-07-23 09:09:14', NULL, NULL, '0000-00-00 00:00:00'),
('e30007a59a5f931c', 'popbookmark', 'popbookmark', '1', NULL, NULL, 1, '2017-07-30 14:57:37', NULL, NULL, '0000-00-00 00:00:00'),
('ecdd95ac533ccf5d', 'popfolder', NULL, '1', NULL, NULL, 1, '2017-07-30 14:57:22', NULL, NULL, '0000-00-00 00:00:00'),
('f3e01fba7c62a2b3', 'prakashfolder', NULL, '1', NULL, NULL, 1, '2017-07-30 14:53:02', NULL, NULL, '0000-00-00 00:00:00'),
('f7faf7a6dd5f9916', 'wd12', 'wd12', 'd896abce2ef68c3d', NULL, NULL, 1, '2017-07-31 11:20:43', NULL, NULL, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `treeview`
--
ALTER TABLE `treeview`
  ADD UNIQUE KEY `urlid` (`urlid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
