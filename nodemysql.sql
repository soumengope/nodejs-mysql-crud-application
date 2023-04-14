-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2023 at 05:21 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodemysql`
--

-- --------------------------------------------------------

--
-- Table structure for table `employeetable`
--

CREATE TABLE `employeetable` (
  `user_id` int(11) NOT NULL,
  `employee_fullName` varchar(25) NOT NULL,
  `job_title` varchar(20) NOT NULL,
  `phone_num` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(15) NOT NULL,
  `state` varchar(15) NOT NULL,
  `primEmergency_contactName` varchar(25) NOT NULL,
  `primEmergency_phoneNum` varchar(15) NOT NULL,
  `primEmergency_relation` varchar(20) NOT NULL,
  `secEmergency_contactName` varchar(25) NOT NULL,
  `secEmergency_phoneNum` varchar(15) NOT NULL,
  `secEmergency_relation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employeetable`
--

INSERT INTO `employeetable` (`user_id`, `employee_fullName`, `job_title`, `phone_num`, `email`, `address`, `city`, `state`, `primEmergency_contactName`, `primEmergency_phoneNum`, `primEmergency_relation`, `secEmergency_contactName`, `secEmergency_phoneNum`, `secEmergency_relation`) VALUES
(2, 'Robin Dey', 'software engineer', '+918787876565', 'robin12@gmail.com', 'kolkata,west bengal,india', 'kolkata', 'west bengal', 'dinu kar', '+918787876566', 'friend', 'rakesh Dey', '+918787876567', 'brother'),
(3, 'nabin reddy', 'grafix designer', '+918765457766', 'nabinreddy99@gmail.com', 'silchar,assam,india', 'silchar', 'assam', 'bipin reddy', '+91875456777', 'father', 'pallabi reddy', '+918765456788', 'sister'),
(4, 'bikash pal', 'web developer', '+918787656576', 'bikashpal@gmail.com', 'darjiling,west bengal,india', 'darjiling', 'west bengal', 'purnima pal', '+918787656577', 'mother', 'prakash pal', '+918787656578', 'father'),
(5, 'Raghab johal', 'Business Developer', '97654273456', 'raghab@gmail.com', 'benachiti,durgapur,west bengal,india', 'durgapur', 'west bengal', 'biplab pal', '98787465342', 'friend', 'bibhuti johal', '93467927353', 'father'),
(6, 'Rohit roy', 'software engineer', '+96345272343', 'rohit@gmail.com', 'newtown,kolkata,west bengal,india', 'kolkata', 'west bengal', 'dinusa kranti', '+9187854648543', 'friend', 'rohitDev', '+9187878342562', 'brother'),
(7, 'nitin roy', 'grafix designer', '+91876345563', 'nabinreddy99@gmail.com', 'ubera,assam,india', 'ubera', 'assam', 'bipin roy', '+91875456989', 'father', 'palashi das', '+918765456890', 'sister'),
(8, 'Bivuti pal', 'front-end developer', '+91878234354', 'bivutipal@gmail.com', 'kunti,jharkhand,india', 'kunti', 'jharkhand', 'putul pal', '+918787623423', 'mother', 'pijush pal', '+918787609822', 'father'),
(10, 'kamal johal', 'graphics designer', '9765427565', 'bimal342@gmail.com', 'kunda,durgapur,west bengal,india', 'kunda', 'west bengal', 'bipin pal', '987874221233', 'friend', 'biplab johal', '93467222211', 'father'),
(11, 'Robin Dey', 'software engineer', '+918787876565', 'robin12@gmail.com', 'kolkata,west bengal,india', 'kolkata', 'west bengal', 'dinu kar', '+918787876566', 'friend', 'rakesh Dey', '+918787876567', 'brother'),
(12, 'sangam das', 'content creator', '+918765232122', 'sangamdas@gmail.com', 'sahegang,west bengal,india', 'sahegang', 'west bengal', 'rohit das', '+918754567896', 'father', 'kamala das', '+918765452345', 'sister'),
(13, 'bikash pal', 'web developer', '+918787656576', 'bikashpal@gmail.com', 'darjiling,west bengal,india', 'darjiling', 'west bengal', 'purnima pal', '+918787656577', 'mother', 'prakash pal', '+918787656578', 'father'),
(15, 'Gobinda saha', 'social work', '+919809879876', 'gobindsaha56@gmail.com', 'kamalpur,bankura,west bengal,india', 'bankura', 'west bengal', 'goutam kar', '+9198098795467', 'sir', 'anupam saha', '+919809879234', 'brother'),
(16, 'prabhash sukla', 'graphics designer', '+918790987653', 'prabhash@gmail.com', 'goa,india', 'goa', 'west bengal', 'dinu das', '+9187909876098', 'friend', 'raghav roy', '+918790987600', 'friend');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employeetable`
--
ALTER TABLE `employeetable`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employeetable`
--
ALTER TABLE `employeetable`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
