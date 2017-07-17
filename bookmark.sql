-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 17, 2017 at 10:15 PM
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
('1', 'task1', 'one', '0', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('10', 'task87', 'ten', '5', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('11', 'task66', 'eleven', '3', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('12', 'oneone', 'oneone', '1', '', '', 1, '2017-07-16 15:35:05', '0000-00-00 00:00:00', '2017-07-16 15:35:05', '0000-00-00 00:00:00'),
('13', 'twotwo', 'twotwo', '2', '', '', 1, '2017-07-16 15:35:52', '0000-00-00 00:00:00', '2017-07-16 15:35:52', '0000-00-00 00:00:00'),
('14', 'sevenseven', 'sevenseven', '7', '', '', 1, '2017-07-16 15:36:02', '0000-00-00 00:00:00', '2017-07-16 15:36:02', '0000-00-00 00:00:00'),
('15', 'eighteight', 'eighteight', '8', '', '', 1, '2017-07-16 15:36:14', '0000-00-00 00:00:00', '2017-07-16 15:36:14', '0000-00-00 00:00:00'),
('2', 'task2', 'two', '1', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('3', 'task3', 'three', '1', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('4', 'task4', 'forth', '3', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('499bc847b14dc0ac', '11', '11', '1', '', '', 1, '2017-07-16 15:47:26', '0000-00-00 00:00:00', '2017-07-16 15:47:26', '0000-00-00 00:00:00'),
('5', 'task5', 'five', '3', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('5d2a478b9f95637c', '22', '22', '499bc847b14dc0ac', '', '', 1, '2017-07-16 15:47:32', '0000-00-00 00:00:00', '2017-07-16 15:47:32', '0000-00-00 00:00:00'),
('6', 'task5', 'six', '5', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('7', 'task42', 'seven', '2', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('8', 'task45', 'eight', '2', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('8139aef0ce45f4ac', '33', '33', '499bc847b14dc0ac', '', '', 1, '2017-07-16 15:47:40', '0000-00-00 00:00:00', '2017-07-16 15:47:40', '0000-00-00 00:00:00'),
('9', 'task56', 'nine', '2', '', '', 1, '2017-07-16 12:47:12', '0000-00-00 00:00:00', '2017-07-16 12:48:22', '0000-00-00 00:00:00'),
('a3da82621bcdc08a', '222', '222', '5d2a478b9f95637c', '', '', 1, '2017-07-16 15:47:47', '0000-00-00 00:00:00', '2017-07-16 15:47:47', '0000-00-00 00:00:00'),
('d617d5561fb43e01', '44', '44', '8139aef0ce45f4ac', '', '', 1, '2017-07-16 15:47:55', '0000-00-00 00:00:00', '2017-07-16 15:47:55', '0000-00-00 00:00:00'),
('d990251a9192627a', '88', '88', '8', '', '', 1, '2017-07-16 15:54:36', '0000-00-00 00:00:00', '2017-07-16 15:54:36', '0000-00-00 00:00:00'),
('3f5b3f5107d9a2e3', '8888', '8888', 'd990251a9192627a', '', '', 1, '2017-07-16 15:54:44', '0000-00-00 00:00:00', '2017-07-16 15:54:44', '0000-00-00 00:00:00'),
('88c4ebe453932153', '34', '34', '1', '', '', 1, '2017-07-16 16:10:52', '0000-00-00 00:00:00', '2017-07-16 16:10:52', '0000-00-00 00:00:00'),
('24f671b945b53d4c', '67', '67', '1', '', '', 1, '2017-07-16 16:19:46', '0000-00-00 00:00:00', '2017-07-16 16:19:46', '0000-00-00 00:00:00'),
('ac5c96ac7565b3b9', '87', '87', '1', '', '', 1, '2017-07-16 16:20:00', '0000-00-00 00:00:00', '2017-07-16 16:20:00', '0000-00-00 00:00:00'),
('caec9b51d711d6c4', '98', '98', '1', '', '', 1, '2017-07-16 16:20:43', '0000-00-00 00:00:00', '2017-07-16 16:20:43', '0000-00-00 00:00:00'),
('165a56ed42bd4bb7', '99', '99', '1', '', '', 1, '2017-07-16 17:01:21', '0000-00-00 00:00:00', '2017-07-16 17:01:21', '0000-00-00 00:00:00'),
('2036b471ce4c9e13', '12', '12', '1', '', '', 1, '2017-07-16 17:03:18', '0000-00-00 00:00:00', '2017-07-16 17:03:18', '0000-00-00 00:00:00'),
('4f87723475e0c378', '12', '12', '1', '', '', 1, '2017-07-16 17:04:11', '0000-00-00 00:00:00', '2017-07-16 17:04:11', '0000-00-00 00:00:00'),
('b2e67928915352e1', '341', '341', '88c4ebe453932153', '', '', 1, '2017-07-17 21:33:44', '0000-00-00 00:00:00', '2017-07-17 21:33:44', '0000-00-00 00:00:00'),
('aa1d758862f074fe', '671', '671', '24f671b945b53d4c', '', '', 1, '2017-07-17 21:33:55', '0000-00-00 00:00:00', '2017-07-17 21:33:55', '0000-00-00 00:00:00'),
('36a5edf8b3542a31', 'oneoneone111', 'oneoneone111', '12', '', '', 1, '2017-07-17 21:39:54', '0000-00-00 00:00:00', '2017-07-17 21:39:54', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;