-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2022 at 04:29 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_mgmt`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Sports'),
(2, 'Politics'),
(4, 'Health');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(1502) NOT NULL,
  `description` text NOT NULL,
  `feature_image` varchar(255) NOT NULL,
  `published_date` date NOT NULL DEFAULT current_timestamp(),
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_title`, `description`, `feature_image`, `published_date`, `category_id`) VALUES
(4, 'Karim Benzema becomes France’s highest-scoring footballer with 412 career goals', 'The Real Madrid striker converted a penalty in the second half at Son Moix to give Madrid a 2-0 lead, after Vinicius Junior had opened the scoring.\r\n\r\nBenzema’s historic feat comes after he scored a hat-trick against Paris Saint-Germain last week to make it 309 goals for Real Madrid, overtaking the great Alfredo Di Stefano in the club’s all-time scorers list.\r\n\r\nThe treble inspired Madrid to stage an incredible comeback as they beat PSG 3-1 and 3-2 on aggregate to reach the Champions League quarter-finals.\r\n\r\nAs well as his impressive haul for Real Madrid, Benzema has scored 66 goals for Lyon and 36 for the French national team, whom he returned to play for last summer after five years away.\r\n\r\n\r\n', 'uploadNews/OCCER-SPAIN-RCD-MAD-REPORT_1648533011.jpg', '2022-04-06', 1),
(5, 'Ukraine: A restart of history', '\r\nAfter the fall of the Berlin Wall, political scientist Francis Fukuyama famously proclaimed the \"end of history\" and of humankind’s ideological evolution. The combination of Western liberal democracy and capitalism were seen as the final, convergent form of global human organization — surpassing geopolitical considerations.\r\n\r\nAs Russia invades Ukraine, history seems to have restarted. This time the tension is not between capitalism and socialism, but between liberal capitalism and autocratic capitalism, between globalism and nativism, between a state subordinated to economic interests and economic interests subordinated to the state. Amidst this unfolding situation, Luigi and Bethany discuss how sanctions, SWIFT, the energy sector, digital platforms, new geopolitical blocks, and more are coming together to possibly reshape the course of history.', 'uploadNews/rtaImage (1)_1648533454.jfif', '2022-04-06', 2),
(6, 'Free eye camp benefits more than 200 people', 'Thirteen-year-old Abhishek Phombo of Aathrai Rural Municipality in Tehrathum lost his eyesight when he was just four. He was suffering from cataract, an eye ailment commonly found among old people.\r\n\r\nPhombo’s happiness knew no bounds when he underwent a surgey.', 'uploadNews/thumb (1)_1648533782.jfif', '2022-04-06', 4),
(9, 'test2', 'ewfwe', 'uploadNews/749897.jpg', '2022-04-06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(150) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `isAdmin` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `phone_number`, `api_key`, `created_at`, `isAdmin`) VALUES
(1, 'test', 'testing@gmail.com', '$2a$10$a62e36b1b95b563229121uGzQP1HwtjD4tyPQAlTzvZ/wZdgv/tZC', '9827158686', '189db4b72a4b06d5b792f51da01eae26', '2022-03-28', 0),
(2, 'test2', 'test2@gmail.com', '$2a$10$7ac7edfd7622d15277774uKKmU/.MkDTgacZQdz.TwbQiCRP/RFCu', '9823056473', '8bdd15deb9e870279b09e1614c632bad', '2022-03-28', 0),
(3, 'test3', 'test3@gmail.com', '$2a$10$ece33411c7a39e4e88c19uGNboFMLATj8LFtN.itz0ekpvnxPo5Gu', '9857460232', '452b93039fd2e2858475d81d48999b45', '2022-03-30', 0),
(4, 'Admin', 'admin@gmail.com', '$2a$10$fa074f87502ccf659b63augWwLEWC.5h9FxVIGYsLfcn9SfAODEg.', '9806753722', '1ca2c50e3c365cd0d4e81744b3f45bb8', '2022-04-06', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
