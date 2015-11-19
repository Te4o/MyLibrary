-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2015 at 07:21 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_library`
--
DROP DATABASE IF EXISTS my_library;
CREATE DATABASE my_library;
USE my_library;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `id_users` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `country`, `id_users`) VALUES
(17, 'Ivan  vazov', 'bulgaria', NULL),
(18, 'Peio Qvorov', 'bulgaria', NULL),
(19, 'Elin pelin', 'bulgaria', NULL),
(20, 'Mesho ', 'bulgaria', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `id_book` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `id_authors` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id_book`, `title`, `status`, `id_authors`) VALUES
(9, 'pod igoto', 'in stock', 17),
(10, 'Na brazdata', 'in stock', 18),
(11, 'dddddda', 'in stock', 19),
(12, 'Ide li', 'in stock', 20);

-- --------------------------------------------------------

-- RATING --
CREATE TABLE IF NOT EXISTS `book_ratings` (
`rating_id` BIGINT UNSIGNED NOT NULL,
`rating` BIGINT UNSIGNED NOT NULL,
`id_book` BIGINT UNSIGNED NOT NULL,
`id_user` BIGINT UNSIGNED NOT NULL

) ENGINE = InnoDB CHARACTER SET=utf8;





--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(11) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `id_books` int(11) DEFAULT NULL,
  `id_users` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment`, `id_books`, `id_users`) VALUES
(22, 'Mnogo hubava kniga', 9, 1),
(23, 'mnogo dobra kniga', 9, 1),
(24, 'Strahotna kniga', 10, 2),
(25, 'Unikalna kniga', 10, 2),
(26, 'az sum', 11, 1),
(27, 'Mnogo hubava kniga reporu4vam q', 12, 1),
(28, 'Dobra e', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `email`, `role`) VALUES
(1, 'admin', '$2a$10$gxKysYstCGubjNTV2zmdAOyZ1lCzM5mQVDBvkqqxkZWL5nxc6lU7e', 'admin@admin.bg', 'ADMIN'),
(2, 'vasil', '$2a$10$JYpYzsGxiOuOikzeSCvGGuBBt102wfSt4hL/Z8oqVKyvcXKhGhozS', 'vasil@abv.com', 'USER'),
(6, 'pesho', '$2a$10$jrmT3QKVae7hLBAolavi0OvWPIq3f356BhoK3hYGKPXQShcub6ALy', 'pesho@abv.bg', 'USER'),
(7, 'ivo', '$2a$10$NiSAtQwEUyYzymttq4tZROS3idlKW14s2c0D2mnFOyy9FumSeiKIu', 'ivo@abv.bg', 'USER'),
(8, 'ivo2', '$2a$10$cUSrYLoCNh.Jc0DgPnDbx.kaOQdKsk5zd35zZ9xL71jOJLulDMRXO', 'ivo@abv.bg', 'USER');

--
-- Indexes for dumped tables
--


--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_users` (`id_users`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `id_authors` (`id_authors`);
  
  
  ALTER TABLE `book_ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `id_book` (`id_books`),
  ADD KEY `id_users` (`id_users`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
  
  ALTER TABLE `book_ratings`
  MODIFY `rating_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_authors`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
  
  ALTER TABLE `book_ratings`
  ADD CONSTRAINT `book_ratings_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ratings_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_books`) REFERENCES `books` (`id_book`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
