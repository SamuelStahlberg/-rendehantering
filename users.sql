-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 20 maj 2024 kl 11:09
-- Serverversion: 10.4.28-MariaDB
-- PHP-version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `erende`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('kund','admin') NOT NULL DEFAULT 'kund',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumpning av Data i tabell `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', 'admin', '2024-04-26 09:28:28'),
(4, 'samuel', 'samuels12345@gmail.com', '$2y$10$eOcbuToulpKKhqAs4rgMpe2Lo82tRduO9IbAMNJpEL4U6rONzYj3i', 'kund', '2024-04-29 10:59:07'),
(5, 'samuel', 'samuels12345@gmail.com', '$2y$10$XTHKkncCTxryY8eqpm.c0OCH8bELO/pwIghKHXcE6isor19NH8S9y', 'kund', '2024-04-30 09:49:28'),
(6, 'samuel', 'samuels12345@gmail.com', '$2y$10$Cr5bZ3/TgGTWOiFbo5UNv.209JOiV5SFVylgcCgVD9nw7itrFq27q', 'kund', '2024-04-30 09:50:23'),
(7, 'fred', 'fred@gmail.com', '$2y$10$UmBoOI0dzZrXh5FKx/Gk1uIsW1VdFd7zyTFDCFYiJLzBnYwYVTqsm', 'kund', '2024-04-30 09:55:18'),
(8, 'vig', 'vig@gmail.com', '$2y$10$tH5OxHzuTTRKl9uaMrvsjOZDKAsPfmADZg9VCIgWgGmNcIrZ3d6Le', 'kund', '2024-04-30 10:30:58'),
(9, 'samuel1', 'samuels12345@gmail.com', '$2y$10$lYnqu3eXKO61B.H.Sqyq4.S1Oe8uvWB9cjyt5h1Z0XcXzXCVeg0Em', 'kund', '2024-04-30 10:34:05'),
(10, 'a', 'a@gmail.com', '$2y$10$whey2CgcUygI5Cm4OvdMyuDSw0ka2fc754EAGj0sYA17MpKP7669m', 'kund', '2024-04-30 11:13:04'),
(11, 'axel', 'axel@gmail.com', '$2y$10$0GR/4geAJsADbLWRN.D1qeuo8fitPLwMM32XANKn4/L4ikud7hOAW', 'kund', '2024-05-03 08:10:02'),
(12, 'max', 'max@gmail.com', '$2y$10$Lt9MfR.Z40oL8sUMprSyT.ffXssEqHzsSpAKEV20XMJ/niTrcyAl6', 'kund', '2024-05-13 11:12:39'),
(13, 'viggo', 'vig@gmail.com', '$2y$10$W/Bm3sdcBRPBra2Mh7g87edVSCelsEeawbIpGfl.NtZPVJ/jVEUke', 'kund', '2024-05-17 08:17:04'),
(14, 'viktor', 'viktor@gmail.com', '$2y$10$EMttwc/xB2KbawyiDvhPZeprUUPrQS5WSR7oomcUs/DuF7vIj/AOO', 'kund', '2024-05-17 10:33:51');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
