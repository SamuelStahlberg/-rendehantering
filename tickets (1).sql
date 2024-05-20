-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 20 maj 2024 kl 11:08
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
-- Tabellstruktur `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'low',
  `status` enum('open','in_progress','closed') NOT NULL DEFAULT 'open',
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumpning av Data i tabell `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `user_id`, `subject`, `description`, `priority`, `status`, `assigned_to`, `created_at`) VALUES
(3, 9, 'fel', 'jvkgvvhvohvphvhvmnljvj', 'medium', 'closed', NULL, '2024-04-30 10:35:47'),
(4, 9, 'fel', 'jvkgvvhvohvphvhvmnljvj', 'medium', 'closed', NULL, '2024-04-30 10:39:11'),
(5, 9, 'fel', 'jvkgvvhvohvphvhvmnljvj', 'medium', 'closed', NULL, '2024-04-30 11:11:52'),
(6, 9, 'fel', 'jvkgvvhvohvphvhvmnljvj', 'medium', 'closed', NULL, '2024-04-30 11:11:57'),
(7, 9, 'fel', 'jvkgvvhvohvphvhvmnljvj', 'medium', 'closed', NULL, '2024-04-30 11:12:01'),
(8, 10, ', m', 'wnöljnäarblm', 'high', 'closed', NULL, '2024-05-03 08:09:25'),
(14, 10, 'Stor skada på dator', 'mycket stor skada på dator wallahi, ', 'high', 'closed', NULL, '2024-05-06 11:16:12'),
(15, 10, 'hvljvlhvhvwdqknb-vn', '.dnfqwhv ölthnhqöthuehwvgfwb', 'medium', 'closed', NULL, '2024-05-07 08:05:26'),
(16, 12, 'Max klagomål', 'lorem flipsum ipsud dipsum', 'low', 'closed', NULL, '2024-05-13 11:13:09'),
(17, 12, 'Albert', 'jag är ginger', 'high', 'closed', NULL, '2024-05-14 09:45:36'),
(18, 13, 'Jag har stora problem', 'de finns stora hål i vägen som skadar min bil 😥', 'medium', 'closed', NULL, '2024-05-17 08:18:02'),
(19, 14, 'bektor', 'bektor har tappat bort sin katt och letar efter den i djungeln', 'high', 'open', NULL, '2024-05-17 10:35:34'),
(20, 13, 'lkjbqerg2th', 'lkjhqerlkvb42thbvklerhwbfiöb23khberfkhb24ö', 'medium', 'closed', NULL, '2024-05-20 08:15:51');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_to` (`assigned_to`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
