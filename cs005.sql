-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2022 at 10:12 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs005`
--

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `msgr_name` varchar(250) NOT NULL,
  `msgr_email` varchar(250) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usersId` int(11) NOT NULL,
  `usersFirstName` varchar(128) NOT NULL,
  `usersLastName` varchar(128) NOT NULL,
  `usersEmail` varchar(128) NOT NULL,
  `usersUid` varchar(20) NOT NULL,
  `usersPassword` varchar(128) NOT NULL,
  `usersPwdDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usersId`, `usersFirstName`, `usersLastName`, `usersEmail`, `usersUid`, `usersPassword`, `usersPwdDate`) VALUES
(33, 'Rosalyn', 'Quenca', 'rose@gmail.com', 'Rosal_08', '$2y$10$Yqgb3n8TfndiftCh34ZN5ewwE4M0sjiwJVw/0lmviI6FW5DqqmocG', '2021-02-03'),
(34, 'Bob', 'Smith', 'bobsmith002@gmail.com', 'bobby001', '$2y$10$vACC22RWSokYHC7d8pEHSetwPri.FcjtlSImhK8756lkaiTk72FUC', '2022-02-20'),
(35, 'Anne', 'Watson', 'appleanne@gmail.com', 'anne008', '$2y$10$Lvp0PSvl7DnVk8uG7C8jYeu9AjN0399CjZEskWPYebfLIEiCIQoo2', '2022-02-14'),
(36, 'new', 'sample', 'sample@gmail.com', 'newuser', '$2y$10$TdxMN.hOuqK0yqxvnqnZaON0utXILlXj89dgsR1xFWrKpb294UIWK', '2022-02-14'),
(37, 'justine', 'zuniga', 'justinezuniga@gmail.com', 'justine_i0', '$2y$10$lF4yFKScBR92idjoB.M/.uxnDHMe0ZdtqGhQzJsNnRnKStVbt95kC', '2022-02-16'),
(38, 'Andrea', 'Austin', 'andrea.austin@gmail.com', 'andrea', '$2y$10$z3HtPpUTvc/ETsUPTZL7zuFonapz56VHQcm3GT8cNZ6fnE2D7oeJy', '2022-02-22'),
(40, 'Juan', 'Dela Cruz', 'JuanDCruz@gmail.com', 'JuanDC08', '$2y$10$Avo37f7Qbs/dGNDko9ZSpO11E0KgvKi0huGtXshY.mhDAYcJala0S', '2022-02-26');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `trigger_new_child` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO user_history (pwdUserId, pwdPassword, pwdUpdateDt) 
SELECT usersId, usersPassword, usersPwdDate 
FROM users WHERE usersId = (SELECT MAX(usersId) FROM users)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_education`
--

CREATE TABLE `users_education` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `degree` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `year` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_experience`
--

CREATE TABLE `users_experience` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `job` varchar(250) NOT NULL,
  `year` varchar(250) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_info`
--

CREATE TABLE `users_info` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `experience` int(11) NOT NULL,
  `website` varchar(250) NOT NULL,
  `freelance` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_service`
--

CREATE TABLE `users_service` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `service` varchar(250) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_skill`
--

CREATE TABLE `users_skill` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `skill` varchar(250) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_work`
--

CREATE TABLE `users_work` (
  `workid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `pwdId` int(11) NOT NULL,
  `pwdUserId` int(11) NOT NULL,
  `pwdPassword` varchar(128) NOT NULL,
  `pwdUpdateDt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_history`
--

INSERT INTO `user_history` (`pwdId`, `pwdUserId`, `pwdPassword`, `pwdUpdateDt`) VALUES
(8, 33, '$2y$10$xAFILPIlOi5YSiEppSoCFu8044G7fV3ta0OwSV8Hwb41CDD8t2z1S', '2022-02-12'),
(9, 34, '$2y$10$Fjqw/nZgf8SRE1xqwHlaOOXnKBEzC0gecxdhR9ZZ2ufYTH5274nki', '2022-02-12'),
(10, 35, '$2y$10$djZeUN1h3umdG3aF/misbOi8VSeV4zLTOFaqerpHZ7TBrTLpdjAje', '2022-02-12'),
(23, 33, '$2y$10$Yqgb3n8TfndiftCh34ZN5ewwE4M0sjiwJVw/0lmviI6FW5DqqmocG', '2022-02-12'),
(24, 34, '$2y$10$90UQIYjfior/wslcjeAe3OlWzBK.KCHEoCDGyU3WTx18rVB1umyBG', '2022-02-12'),
(25, 36, '$2y$10$TdxMN.hOuqK0yqxvnqnZaON0utXILlXj89dgsR1xFWrKpb294UIWK', '2022-02-14'),
(26, 35, '$2y$10$Lvp0PSvl7DnVk8uG7C8jYeu9AjN0399CjZEskWPYebfLIEiCIQoo2', '2022-02-14'),
(27, 37, '$2y$10$/DRr9Fe3pkorZkZPbGWraeVAhSXy/bkeOLU1TVvmFCp9MZnl/tYxa', '2022-02-14'),
(28, 37, '$2y$10$Mg5iP8/Zkk7gehD09oMkA./Ez1kiODZDNrW7qal9m3/unZJYFZIYG', '2022-02-14'),
(29, 37, '$2y$10$ui4MK6k5bNImT5HcmRUKVuv66yjYFIR3nLZfyp8ymGc5uMd.KRaOS', '2022-02-14'),
(30, 37, '$2y$10$T36TTVGasOk5r8EN5Jgmnep7X9P6aaloIwruK359IZErVfyQzMQcG', '2022-02-14'),
(31, 37, '$2y$10$HASeb6srOv3YoRWttBU1DOBd1yXtiMPu.McOZ3s3EZGI6QqO94HC.', '2022-02-14'),
(32, 37, '$2y$10$c2NiKmqaDtVY6pZfPYcR9OMeKIa6Y7lCoiBqqV/I3MqD4UXl3m8zG', '2022-02-16'),
(33, 37, '$2y$10$lF4yFKScBR92idjoB.M/.uxnDHMe0ZdtqGhQzJsNnRnKStVbt95kC', '2022-02-16'),
(34, 34, '$2y$10$vACC22RWSokYHC7d8pEHSetwPri.FcjtlSImhK8756lkaiTk72FUC', '2022-02-20'),
(35, 38, '$2y$10$jzB4qAkdCL2NkMLwlqnqveqRjPiGXE93FaDONRNkSRC5hivVPZUfS', '2022-02-21'),
(36, 38, '$2y$10$GMKUCelHeCs3huZdP7K6xeuUV/CJsAHCWw0uYiYw1YW3g7h9WpaHu', '2022-02-21'),
(37, 38, '$2y$10$UhfJCxBywPsyOZ3ta5r5TuhAXX/vkMJW9ISEURVFTNDIUPAfvlCD6', '2022-02-21'),
(38, 38, '$2y$10$atEU73zaL7jKqq/LqSwj0uHz5olf4.KQh3/OzGRNqGynXto9GRyhu', '2022-02-21'),
(39, 38, '$2y$10$z3HtPpUTvc/ETsUPTZL7zuFonapz56VHQcm3GT8cNZ6fnE2D7oeJy', '2022-02-22'),
(41, 40, '$2y$10$Avo37f7Qbs/dGNDko9ZSpO11E0KgvKi0huGtXshY.mhDAYcJala0S', '2022-02-26');

-- --------------------------------------------------------

--
-- Table structure for table `work_information`
--

CREATE TABLE `work_information` (
  `id` int(11) NOT NULL,
  `workid` int(11) NOT NULL,
  `catergory` varchar(50) NOT NULL,
  `client` varchar(250) NOT NULL,
  `project_date` date NOT NULL,
  `project_url` varchar(250) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usersId`),
  ADD UNIQUE KEY `username` (`usersUid`),
  ADD UNIQUE KEY `email` (`usersEmail`);

--
-- Indexes for table `users_education`
--
ALTER TABLE `users_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid_education` (`userid`);

--
-- Indexes for table `users_experience`
--
ALTER TABLE `users_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid_experience` (`userid`);

--
-- Indexes for table `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid_info` (`userid`);

--
-- Indexes for table `users_service`
--
ALTER TABLE `users_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid_servicec` (`userid`);

--
-- Indexes for table `users_skill`
--
ALTER TABLE `users_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid_skill` (`userid`);

--
-- Indexes for table `users_work`
--
ALTER TABLE `users_work`
  ADD PRIMARY KEY (`workid`),
  ADD KEY `userid_work` (`userid`);

--
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`pwdId`),
  ADD KEY `userid_history_fk` (`pwdUserId`);

--
-- Indexes for table `work_information`
--
ALTER TABLE `work_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workid_information` (`workid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users_education`
--
ALTER TABLE `users_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_experience`
--
ALTER TABLE `users_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_info`
--
ALTER TABLE `users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_service`
--
ALTER TABLE `users_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_skill`
--
ALTER TABLE `users_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_work`
--
ALTER TABLE `users_work`
  MODIFY `workid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `pwdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `work_information`
--
ALTER TABLE `work_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_education`
--
ALTER TABLE `users_education`
  ADD CONSTRAINT `userid_education` FOREIGN KEY (`userid`) REFERENCES `users` (`usersId`);

--
-- Constraints for table `users_experience`
--
ALTER TABLE `users_experience`
  ADD CONSTRAINT `userid_experience` FOREIGN KEY (`userid`) REFERENCES `users` (`usersId`);

--
-- Constraints for table `users_info`
--
ALTER TABLE `users_info`
  ADD CONSTRAINT `userid_info` FOREIGN KEY (`userid`) REFERENCES `users` (`usersId`);

--
-- Constraints for table `users_service`
--
ALTER TABLE `users_service`
  ADD CONSTRAINT `userid_servicec` FOREIGN KEY (`userid`) REFERENCES `users` (`usersId`);

--
-- Constraints for table `users_skill`
--
ALTER TABLE `users_skill`
  ADD CONSTRAINT `userid_skill` FOREIGN KEY (`userid`) REFERENCES `users` (`usersId`);

--
-- Constraints for table `users_work`
--
ALTER TABLE `users_work`
  ADD CONSTRAINT `userid_work` FOREIGN KEY (`userid`) REFERENCES `users` (`usersId`);

--
-- Constraints for table `user_history`
--
ALTER TABLE `user_history`
  ADD CONSTRAINT `userid_history_fk` FOREIGN KEY (`pwdUserId`) REFERENCES `users` (`usersId`) ON DELETE CASCADE;

--
-- Constraints for table `work_information`
--
ALTER TABLE `work_information`
  ADD CONSTRAINT `workid_information` FOREIGN KEY (`workid`) REFERENCES `users_work` (`workid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
