-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2017 at 06:02 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homeservice3`
--

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `provider` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  `category` enum('plumbing','handyman','electrical','cleaning') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provider` (`provider`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `provider`, `description`, `category`) VALUES
(1, 'Ferdinand', 1, '', 'handyman'),
(2, 'Jeafred', 3, '', 'plumbing'),
(3, 'Roland', 1, '', 'electrical'),
(4, 'Jerik', 2, '', 'cleaning'),
(5, 'Neil', 6, '', 'electrical'),
(6, 'Darryl', 8, '', 'cleaning'),
(7, 'Arnaldo', 4, '', 'plumbing'),
(8, 'Kyrie', 6, '', 'handyman');

-- --------------------------------------------------------

--
-- Table structure for table `service_order`
--

DROP TABLE IF EXISTS `service_order`;
CREATE TABLE IF NOT EXISTS `service_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` int(11) NOT NULL,
  `provider` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` varchar(250) NOT NULL,
  `status` enum('Pending','Accepted','Cancelled','In Process','Done') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer` (`customer`),
  KEY `provider` (`provider`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_order`
--

INSERT INTO `service_order` (`id`, `customer`, `provider`, `timestamp`, `remarks`, `status`) VALUES
(1, 2, 7, '2017-05-11 05:55:03', '', 'Accepted'),
(2, 1, 3, '2017-05-11 05:55:38', '', 'In Process'),
(3, 3, 8, '2017-05-11 05:56:07', '', 'Done'),
(4, 5, 4, '2017-05-11 05:56:53', '', 'Pending'),
(5, 4, 1, '2017-05-11 05:58:41', '', 'Cancelled'),
(6, 6, 2, '2017-05-11 05:59:16', '', 'Accepted'),
(7, 7, 5, '2017-05-11 05:59:59', '', 'In Process'),
(8, 8, 6, '2017-05-11 06:00:32', '', 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `service_provider`
--

DROP TABLE IF EXISTS `service_provider`;
CREATE TABLE IF NOT EXISTS `service_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL,
  `status` enum('Pending','Active','Deactivated') NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider`
--

INSERT INTO `service_provider` (`id`, `name`, `contact`, `address`, `description`, `status`, `username`, `password`) VALUES
(1, 'Provider 1', '09345643265', 'baguio city, ph', 'we provide the best service', 'Pending', 'provider1', 'provider1'),
(2, 'Provider2', '09261574896', 'Trancoville, Baguio City', 'Best home service!', 'Pending', 'provider2', 'provider2'),
(3, 'Provider3', '09091547868', 'Aurora Hill, Ambiong Road, Baguio City', 'Best home service!', 'Pending', 'provider3', 'provider3'),
(4, 'Provider4', '09064578219', 'Dominican Hill, Baguio City', 'Best home service', 'Pending', 'provider4', 'provider4'),
(5, 'Provider5', '09245681456', 'Baguio City', 'Best home service!', 'Pending', 'provider5', 'provider5'),
(6, 'Provider6', '09095487621', 'Baguio City', '	\r\nBest home service!', 'Pending', 'provider6', 'provider6'),
(7, 'Provider7', '09061846975', 'Baguio City', '	\r\nBest home service!', 'Pending', 'provider7', 'provider7'),
(8, 'Provider8', '09267519764', 'Baguio City', '	\r\nBest home service!', 'Pending', 'provider8', 'provider8');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` varchar(250) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `order_id`, `datetime`, `remarks`) VALUES
(1, 1, '2017-05-11 06:01:35', ''),
(2, 2, '2017-05-11 06:01:46', ''),
(3, 3, '2017-05-11 06:01:51', ''),
(4, 4, '2017-05-11 06:01:56', ''),
(5, 5, '2017-05-11 06:02:07', ''),
(6, 6, '2017-05-11 06:02:12', ''),
(7, 7, '2017-05-11 06:02:17', ''),
(8, 8, '2017-05-11 06:02:21', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` char(45) NOT NULL,
  `last_name` char(45) NOT NULL,
  `user_status` enum('Pending','Active','Inactive') NOT NULL,
  `contact` varchar(12) NOT NULL,
  `email_address` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`customer_id`, `username`, `password`, `first_name`, `last_name`, `user_status`, `contact`, `email_address`) VALUES
(1, 'Kenneth', 'kenneth', 'Kenneth', 'Macalanda', 'Active', '09121231232', 'kenneth@gmail.com'),
(2, 'Arnaldo', 'arnaldo', 'Arnaldo', 'Gumpad', 'Active', '09121234321', 'arnaldo@gmail.com'),
(3, 'Mae', 'mae', 'Mae', 'Dela Cruz', 'Pending', '09268452197', 'mae@gmail.com'),
(4, 'Allonah', 'allonah', 'Allonah', 'Gacutan', 'Active', '09064895127', 'allonah@gmail.com'),
(5, 'Swira', 'swira', 'Swira', 'Cogasi', 'Pending', '09245976184', 'swira@gmail.com'),
(6, 'Diana', 'diana', 'Diana', 'Sabiano', 'Active', '09264857951', 'diana@gmail.com'),
(7, 'Adriana', 'Dela Pena', 'Adriana', 'Dela Pena', 'Inactive', '09091675984', 'Adriana@gmail.com'),
(8, 'Darryl', 'darryl', 'Darryl', 'Go', 'Pending', '09785416958', 'darryl@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_services_provider` FOREIGN KEY (`provider`) REFERENCES `service_provider` (`id`);

--
-- Constraints for table `service_order`
--
ALTER TABLE `service_order`
  ADD CONSTRAINT `fk_customer_order` FOREIGN KEY (`customer`) REFERENCES `users` (`customer_id`),
  ADD CONSTRAINT `fk_provider_order` FOREIGN KEY (`provider`) REFERENCES `service_provider` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `service_order` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
