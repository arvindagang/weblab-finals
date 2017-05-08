-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2017 at 06:12 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homeservice`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `provider`, `description`, `category`) VALUES
(1, 'Juan', 2, 'Good in doing handyman work', 'handyman');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider`
--

INSERT INTO `service_provider` (`id`, `name`, `contact`, `address`, `description`) VALUES
(1, 'SP1', '09054621485', 'Address', 'Plumbing'),
(2, 'SP2', '09261574862', 'Address', 'Electical');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`customer_id`, `username`, `password`, `first_name`, `last_name`, `user_status`, `contact`, `email_address`) VALUES
(1, 'user1', 'password', 'user', 'one', 'Pending', '09121231234', 'user1@gmail.com'),
(2, 'user2', 'password', 'user', 'two', 'Pending', '09121234321', 'user2@gmail.com'),
(3, 'user3', 'password', 'user', 'three', 'Pending', '09121234786', 'user3@gmail.com');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
