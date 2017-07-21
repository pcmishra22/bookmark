-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 21, 2017 at 07:52 PM
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
  `url` varchar(2048) NOT NULL,
  `parenturlid` varchar(16) NOT NULL,
  `childrenids` varchar(2048) NOT NULL,
  `memberids` varchar(1024) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treeview`
--

INSERT INTO `treeview` (`urlid`, `title`, `url`, `parenturlid`, `childrenids`, `memberids`, `active`, `created_dt`, `updated_ts`, `updated_dt`, `created_ts`) VALUES
('1', 'bookmarklist1', '', '', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-18 19:36:28', '0000-00-00 00:00:00'),
('10', 'f10', '', '1', '', '', 1, '2017-07-18 19:28:56', '0000-00-00 00:00:00', '2017-07-18 19:28:56', '0000-00-00 00:00:00'),
('11', 'foldernode11', '', '1', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('12', 'bookmark12', 'bookmark', '2', '', '', 1, '2017-07-18 18:51:54', '0000-00-00 00:00:00', '2017-07-18 18:51:54', '0000-00-00 00:00:00'),
('13', 'bookmark13', 'bookmark', '1', '', '', 1, '2017-07-20 23:04:11', '0000-00-00 00:00:00', '2017-07-20 23:04:11', '0000-00-00 00:00:00'),
('14', 'bookmark14', 'sevenseven', '15', '', '', 1, '2017-07-16 15:36:02', '0000-00-00 00:00:00', '2017-07-16 15:36:02', '0000-00-00 00:00:00'),
('15', 'f15', '', '11', '', '', 1, '2017-07-16 15:36:14', '0000-00-00 00:00:00', '2017-07-21 15:30:05', '0000-00-00 00:00:00'),
('17', 'f17', '', '2', '', '', 1, '2017-07-18 19:36:07', '0000-00-00 00:00:00', '2017-07-18 19:36:07', '0000-00-00 00:00:00'),
('2', 'folderf2', '', '1', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('4', 'bookmark4', 'bookmark2', '11', '', '', 1, '2017-07-21 15:22:38', '0000-00-00 00:00:00', '2017-07-21 15:22:38', '0000-00-00 00:00:00'),
('7', 'folder7', '', '11', '', '', 1, '2017-07-21 15:22:17', '0000-00-00 00:00:00', '2017-07-21 15:22:17', '0000-00-00 00:00:00'),
('8', 'folder8', '', '11', '', '', 1, '2017-07-21 15:22:05', '0000-00-00 00:00:00', '2017-07-21 15:22:05', '0000-00-00 00:00:00'),
('9', 'bookmark9', 'bookmark', '1', '', '', 1, '2017-07-18 18:52:18', '0000-00-00 00:00:00', '2017-07-18 18:52:18', '0000-00-00 00:00:00');

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
