-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2019 at 04:54 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flaskapp2`
--

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

CREATE TABLE `home` (
  `Sno` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `No_of_per` int(11) NOT NULL,
  `Date_of_per` datetime NOT NULL,
  `Msg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `home`
--

INSERT INTO `home` (`Sno`, `Name`, `No_of_per`, `Date_of_per`, `Msg`) VALUES
(1, 'Moiz', 2, '2017-11-16 20:00:00', 'ok moiz'),
(2, 'Hussain', 2, '2019-11-16 20:00:00', 'ok sakku hussu'),
(3, 'Hussain', 4, '2017-11-16 20:00:00', 'we'),
(4, 'Bhai Bhabhi', 2, '2020-11-16 20:00:00', 'ok done hai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `home`
--
ALTER TABLE `home`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `home`
--
ALTER TABLE `home`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
