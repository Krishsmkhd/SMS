-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2023 at 05:47 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `students`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `province` varchar(11) NOT NULL DEFAULT '0',
  `cityName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`province`, `cityName`) VALUES
('Bagmati', 'Kathmandu'),
('Bagmati', 'Lalitpur'),
('Bagmati', 'Bhaktapur'),
('Gandaki', 'Pokhara'),
('Gandaki', 'Mustang');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentId` int(11) NOT NULL,
  `spwd` varchar(255) DEFAULT NULL,
  `snikname` varchar(255) DEFAULT NULL,
  `semail` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `spwd`, `snikname`, `semail`, `sname`) VALUES
(1304240910, '202CB962AC59075B964B07152D234B70', 'Krisim', 'krishsmkhd@gmail.com', 'Krish Simkhada'),
(1304240911, 'E17C529AF52862130E8522D1B813ED8A', NULL, NULL, 'Sunit Shakya'),
(1304240912, 'A01886854CB9BDD41343463CD32A769B', NULL, NULL, 'Rizul Shrestha');

-- --------------------------------------------------------

--
-- Table structure for table `studentinfo`
--

CREATE TABLE `studentinfo` (
  `studentid` int(11) NOT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `favorite` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `oldname` varchar(255) DEFAULT NULL,
  `studentsf` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `sfrom` varchar(255) DEFAULT NULL,
  `contry` varchar(255) DEFAULT NULL,
  `ocity` varchar(255) DEFAULT NULL,
  `ncity` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `health` varchar(255) DEFAULT NULL,
  `red` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `studentinfo`
--

INSERT INTO `studentinfo` (`studentid`, `sname`, `gender`, `favorite`, `birth`, `oldname`, `studentsf`, `nation`, `sfrom`, `contry`, `ocity`, `ncity`, `school`, `height`, `from`, `health`, `red`, `weight`) VALUES
(1304240910, 'Krish Simkhada', 'male', 'Sing,Dance', '19 May', 'Krish', 'Group Member', 'Nepali', NULL, 'Nepal', 'Kathmandu', 'Kathmandu', 'Virinchi', '175', NULL, 'good', 'A', '90'),
(1304240911, 'Sunit Shakya', 'male', 'Fate', '21 June', 'SSV', 'Group Member', 'Nepali', NULL, 'Nepal', 'Lalitpur', 'Lalitpur', 'AVM', '180', NULL, 'good', 'B', '90'),
(1304240912, 'Rizul Shrestha', 'male', 'League', '14 Aug', 'Rix', 'Group Member', 'Nepali', NULL, 'Nepal', 'Lalitpur', 'Lalitpur', 'Gems', NULL, NULL, 'bad', 'O', '70');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teachernum` int(11) NOT NULL,
  `tpwd` varchar(255) DEFAULT NULL,
  `tnikname` varchar(255) DEFAULT NULL,
  `temail` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teachernum`, `tpwd`, `tnikname`, `temail`, `tname`) VALUES
(1001, '202CB962AC59075B964B07152D234B70', 'Sandy', 'sandip@gmail.com', 'Sandip');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentId`);

--
-- Indexes for table `studentinfo`
--
ALTER TABLE `studentinfo`
  ADD PRIMARY KEY (`studentid`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teachernum`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1304240916;

--
-- AUTO_INCREMENT for table `studentinfo`
--
ALTER TABLE `studentinfo`
  MODIFY `studentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1304240914;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teachernum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
