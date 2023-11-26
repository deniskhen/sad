-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 26 2023 г., 16:28
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `company_website_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `chatbot_messages`
--

CREATE TABLE `chatbot_messages` (
  `id` int NOT NULL,
  `client_id` varchar(250) NOT NULL,
  `message_type` text NOT NULL,
  `message_content` text NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `chatbot_messages`
--

INSERT INTO `chatbot_messages` (`id`, `client_id`, `message_type`, `message_content`, `date_time`) VALUES
(44, '8e138c01481ff03e6579da68016c95da', 'human', 'Привет! Я рад с тобой познакомиться', '2023-11-15 22:19:31');

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `company_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `file_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `company_name`, `description`, `file_path`, `date_created`, `date_updated`) VALUES
(2, 'Company 101', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; text-align:=&quot;&quot; justify;&quot;=&quot;&quot;&gt;Nam pulvinar tempus ante sit amet malesuada. Donec quis sem porttitor, varius dolor vel, eleifend enim. Pellentesque vitae elit elementum, tristique nisl vel, varius nisi. Integer massa libero, tincidunt in tincidunt vel, semper ac libero. Suspendisse potenti. Praesent vitae nibh nec nunc sagittis condimentum. Etiam feugiat, ipsum sit amet cursus viverra, purus lacus tincidunt metus, eget commodo enim nunc ac enim. Ut dolor libero, molestie ut lacus ac, imperdiet tempus ligula. Pellentesque suscipit blandit tellus id interdum. Sed vestibulum posuere nisl in condimentum.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; text-align:=&quot;&quot; justify;&quot;=&quot;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;h3 style=&quot;font-family: &amp;quot;Source Sans Pro&amp;quot;, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;; color: rgb(33, 37, 41);&quot;&gt;&lt;a href=&quot;https://licreativetechnologies.com/&quot; target=&quot;_blank&quot; style=&quot;color: rgb(0, 86, 179);&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;Sample link for the client&#039;s company website&lt;/span&gt;&lt;/a&gt;&lt;/h3&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; text-align:=&quot;&quot; justify;&quot;=&quot;&quot;&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/1699175100_gallery-img-01.jpg', '2021-08-12 11:33:38', '2023-11-05 12:10:09'),
(3, 'Company 102', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; text-align:=&quot;&quot; justify;&quot;=&quot;&quot;&gt;Nam pulvinar tempus ante sit amet malesuada. Donec quis sem porttitor, varius dolor vel, eleifend enim. Pellentesque vitae elit elementum, tristique nisl vel, varius nisi. Integer massa libero, tincidunt in tincidunt vel, semper ac libero. Suspendisse potenti. Praesent vitae nibh nec nunc sagittis condimentum. Etiam feugiat, ipsum sit amet cursus viverra, purus lacus tincidunt metus, eget commodo enim nunc ac enim. Ut dolor libero, molestie ut lacus ac, imperdiet tempus ligula. Pellentesque suscipit blandit tellus id interdum. Sed vestibulum posuere nisl in condimentum.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; text-align:=&quot;&quot; justify;&quot;=&quot;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;h3&gt;&lt;a href=&quot;https://itandcompany.ru/&quot; target=&quot;_blank&quot;&gt;Company 102 site&lt;/a&gt;&lt;br&gt;&lt;/h3&gt;&lt;p&gt;&lt;/p&gt;', 'uploads/1699175100_gallery-img-02.jpg', '2021-08-12 11:35:57', '2023-11-05 12:54:21'),
(5, 'Company 104', '&lt;p&gt;&lt;span open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; text-align:=&quot;&quot; justify;&quot;=&quot;&quot; style=&quot;color: rgb(0, 0, 0);&quot;&gt;Nam pulvinar tempus ante sit amet malesuada. Donec quis sem porttitor, varius dolor vel, eleifend enim. Pellentesque vitae elit elementum, tristique nisl vel, varius nisi. Integer massa libero, tincidunt in tincidunt vel, semper ac libero. Suspendisse potenti. Praesent vitae nibh nec nunc sagittis condimentum. Etiam feugiat, ipsum sit amet cursus viverra, purus lacus tincidunt metus, eget commodo enim nunc ac enim. Ut dolor libero, molestie ut lacus ac, imperdiet tempus ligula. Pellentesque suscipit blandit tellus id interdum. Sed vestibulum posuere nisl in condimentum.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; text-align:=&quot;&quot; justify;&quot;=&quot;&quot; style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;h3 source=&quot;&quot; sans=&quot;&quot; pro&quot;,=&quot;&quot; -apple-system,=&quot;&quot; blinkmacsystemfont,=&quot;&quot; &quot;segoe=&quot;&quot; ui&quot;,=&quot;&quot; roboto,=&quot;&quot; &quot;helvetica=&quot;&quot; neue&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif,=&quot;&quot; &quot;apple=&quot;&quot; color=&quot;&quot; emoji&quot;,=&quot;&quot; ui=&quot;&quot; symbol&quot;;=&quot;&quot; color:=&quot;&quot; rgb(33,=&quot;&quot; 37,=&quot;&quot; 41);&quot;=&quot;&quot; style=&quot;font-family: &quot;&gt;&lt;a href=&quot;https://offices.co/&quot; target=&quot;_blank&quot;&gt;Company 104 site&lt;/a&gt;&lt;br&gt;&lt;/h3&gt;', 'uploads/1699175160_gallery-img-04.jpg', '2023-10-28 15:03:16', '2023-11-05 12:56:19'),
(6, 'Company 103', '&lt;p&gt;&lt;span open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; text-align:=&quot;&quot; justify;&quot;=&quot;&quot; style=&quot;color: rgb(0, 0, 0);&quot;&gt;Nam pulvinar tempus ante sit amet malesuada. Donec quis sem porttitor, varius dolor vel, eleifend enim. Pellentesque vitae elit elementum, tristique nisl vel, varius nisi. Integer massa libero, tincidunt in tincidunt vel, semper ac libero. Suspendisse potenti. Praesent vitae nibh nec nunc sagittis condimentum. Etiam feugiat, ipsum sit amet cursus viverra, purus lacus tincidunt metus, eget commodo enim nunc ac enim. Ut dolor libero, molestie ut lacus ac, imperdiet tempus ligula. Pellentesque suscipit blandit tellus id interdum. Sed vestibulum posuere nisl in condimentum.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; text-align:=&quot;&quot; justify;&quot;=&quot;&quot; style=&quot;color: rgb(0, 0, 0);&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;h3 style=&quot;font-family: &quot; source=&quot;&quot; sans=&quot;&quot; pro&quot;,=&quot;&quot; -apple-system,=&quot;&quot; blinkmacsystemfont,=&quot;&quot; &quot;segoe=&quot;&quot; ui&quot;,=&quot;&quot; roboto,=&quot;&quot; &quot;helvetica=&quot;&quot; neue&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif,=&quot;&quot; &quot;apple=&quot;&quot; color=&quot;&quot; emoji&quot;,=&quot;&quot; ui=&quot;&quot; symbol&quot;;=&quot;&quot; color:=&quot;&quot; rgb(33,=&quot;&quot; 37,=&quot;&quot; 41);&quot;=&quot;&quot;&gt;&lt;a href=&quot;https://7versts.ru/&quot; target=&quot;_blank&quot;&gt;Company 103 site&lt;/a&gt;&lt;br&gt;&lt;/h3&gt;', 'uploads/1699175100_gallery-img-03.jpg', '2023-10-28 16:26:24', '2023-11-05 12:55:31');

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `meta_field` text,
  `meta_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`meta_field`, `meta_value`) VALUES
('mobile', '89065554433'),
('email', 'denis.khen79@mail.ru'),
('facebook', 'https://facebook.com'),
('linkin', 'https://linkedin.com'),
('address', 'Russia, Рязань');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `full_name` text NOT NULL,
  `subject` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `full_name`, `subject`, `contact`, `email`, `message`, `status`, `date_created`, `date_updated`) VALUES
(45, 'gdfg', 'tdft', '435345', 'gdfg@dsaa', 'tr', 0, '2023-11-19 00:51:14', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `created_at` date NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `created_at`, `price`) VALUES
(1, '2023-10-15', 585),
(2, '2022-01-01', 111),
(4, '2023-11-11', 357),
(5, '2021-01-01', 15),
(6, '2023-01-01', 205),
(7, '2022-02-02', 222),
(8, '2020-02-02', 333),
(9, '2023-02-02', 198),
(10, '2021-02-02', 15),
(11, '2023-06-07', 5),
(12, '2022-03-03', 333),
(13, '2020-03-03', 444),
(14, '2023-03-03', 567),
(15, '2021-03-03', 15),
(16, '2023-04-04', 454),
(17, '2022-04-04', 555),
(18, '2020-04-04', 555),
(19, '2023-05-05', 128),
(20, '2021-04-04', 15),
(21, '2023-07-07', 5),
(22, '2022-05-05', 444),
(23, '2020-05-05', 777),
(24, '2023-08-08', 789),
(25, '2021-05-05', 15),
(26, '2023-10-15', 5),
(27, '2022-06-06', 777),
(28, '2020-06-06', 3),
(29, '2023-11-11', 677),
(30, '2021-06-06', 15),
(31, '2023-10-15', 5),
(32, '2022-09-09', 555),
(33, '2020-07-07', 666),
(34, '2023-11-11', 999),
(35, '2021-07-07', 15),
(36, '2023-10-15', 434),
(37, '2022-07-07', 666),
(38, '2020-08-08', 999),
(39, '2023-11-11', 888),
(40, '2021-08-08', 15),
(41, '2023-10-15', 48),
(42, '2022-08-08', 888),
(43, '2020-09-09', 111),
(44, '2023-11-11', 777),
(45, '2021-09-09', 15),
(46, '2023-09-08', 999),
(47, '2022-11-23', 999),
(48, '2020-10-10', 444),
(49, '2023-12-12', 333),
(50, '2021-10-10', 999),
(51, '2023-10-15', 5),
(52, '2022-11-23', 7),
(53, '2020-05-10', 3),
(54, '2023-11-11', 10),
(55, '2021-09-09', 15),
(56, '2023-10-15', 5),
(57, '2022-11-23', 7),
(58, '2020-05-10', 3),
(59, '2023-11-11', 10),
(60, '2021-09-09', 15),
(61, '2023-10-15', 5),
(62, '2022-11-23', 7),
(63, '2020-05-10', 3),
(64, '2023-11-11', 10),
(65, '2021-09-09', 15),
(66, '2023-10-15', 5),
(67, '2022-11-23', 7),
(68, '2020-05-10', 3),
(69, '2023-11-11', 10),
(70, '2021-09-09', 15),
(71, '2023-10-15', 5),
(72, '2022-11-23', 7),
(73, '2020-05-10', 3),
(74, '2023-11-11', 10),
(75, '2021-09-09', 15),
(76, '2023-10-15', 5),
(77, '2022-11-23', 7),
(78, '2020-05-10', 3),
(79, '2023-11-11', 10),
(80, '2021-09-09', 15),
(81, '2021-12-12', -999);

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int NOT NULL,
  `title` text NOT NULL,
  `description` text,
  `file_path` text,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `title`, `description`, `file_path`, `date_created`, `date_updated`) VALUES
(1, 'Sample Service 101', '&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus arcu, ullamcorper viverra felis. Aenean in diam at ligula interdum laoreet. Mauris quis purus maximus, scelerisque lacus non, malesuada sapien. Sed at vulputate sapien. Sed vitae auctor odio. Nam ac massa luctus, scelerisque odio id, accumsan sem. Ut tincidunt bibendum diam, at tempor leo ornare ut. Donec nibh mi, mattis a dolor vitae, interdum rutrum nisi. Vestibulum eu nulla pharetra leo porta ornare quis ac magna. In blandit diam non tortor accumsan, id finibus odio sollicitudin.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/1628734760_2.jpg', '2021-08-12 10:12:40', '2021-08-12 10:19:20'),
(4, 'Sample 102fsdfsdf', '&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus arcu, ullamcorper viverra felis. Aenean in diam at ligula interdum laoreet. Mauris quis purus maximus, scelerisque lacus non, malesuada sapien. Sed at vulputate sapien. Sed vitae auctor odio. Nam ac massa luctus, scelerisque odio id, accumsan sem. Ut tincidunt bibendum diam, at tempor leo ornare ut. Donec nibh mi, mattis a dolor vitae, interdum rutrum nisi. Vestibulum eu nulla pharetra leo porta ornare quis ac magna. In blandit diam non tortor accumsan, id finibus odio sollicitudin.&lt;/span&gt;', 'uploads/1698500540_avatar.png', '2021-08-12 10:28:12', '2023-10-28 16:42:20');

-- --------------------------------------------------------

--
-- Структура таблицы `system_info`
--

CREATE TABLE `system_info` (
  `id` int NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Smart Analitic Design'),
(2, 'address', 'Philippines'),
(3, 'contact', '+1234567890'),
(4, 'email', 'info@sample.com'),
(6, 'short_name', 'S.A.D'),
(9, 'logo', 'uploads/1699173120_logo1.png'),
(11, 'welcome_message', 'Рассказываем о визуализации данных. Познакомим вас с подборкой аналитических отчетов из наших решений, в которых используются разные инструменты для визуализации данных: от базовых до продвинутых.'),
(12, 'banner', 'uploads/1698580440_section-1-bg.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int NOT NULL,
  `message_from` text NOT NULL,
  `message` text NOT NULL,
  `file_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `testimonials`
--

INSERT INTO `testimonials` (`id`, `message_from`, `message`, `file_path`, `date_created`, `date_updated`) VALUES
(1, 'John Smith, CEO of Sample Company 101', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;&quot;=&quot;&quot;&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;Actor&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;John&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;Smith&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;&amp;nbsp;was born Robert Errol Van Orden in Los Angeles. He began his career singing with The Robert Mitchell Boy Choir, a group which appeared in two Bing Crosby films, Going My Way (1944) and The Bells of St. Mary&#039;s (1945). His agent Henry Willson, who also gave Tab Hunter and Rock Hudson their names, changed Van Orden&#039;s name to &quot;&lt;/span&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;John&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;Smith&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;&quot;.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;&quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;&quot;=&quot;&quot;&gt;&lt;span style=&quot;font-size: 18px; background-color: rgb(255, 255, 0);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;У меня был очень положительный опыт работы с Вами!!!&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;&quot;=&quot;&quot;&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/1699178478_user8-128x128.jpg', '2021-08-12 12:09:25', '2023-11-05 14:53:53'),
(2, 'Claire Blake, VP in Accounting and Finance of Sample102', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;&quot;=&quot;&quot;&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;Claire&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;Blake&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;&amp;nbsp;is legally qualified and has spent the last 15 years working on large public sector infrastructure projects.&amp;nbsp;... Director.&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;Claire&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;&amp;nbsp;spent the first part of her career as a lawyer in private practice negotiating PPP/PFI contracts across a range of sectors including schools, health care, defence and transport for both the public and private sectors.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify;&quot; open=&quot;&quot; sans&quot;,=&quot;&quot; arial,=&quot;&quot; sans-serif;&quot;=&quot;&quot;&gt;&lt;span style=&quot;&quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;=&quot;&quot; text-align:=&quot;&quot; start;&quot;=&quot;&quot;&gt;&lt;span style=&quot;font-size: 18px; background-color: rgb(255, 255, 0);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Ваууу, я просто в восторге!!!!&lt;/font&gt;&lt;/span&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/1699178465_user7-128x128.jpg', '2021-08-12 13:11:14', '2023-11-05 14:54:11'),
(3, 'George Wilson,  CFO of SAMPLE103 INC.', '&lt;p&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;&quot;=&quot;&quot;&gt;George&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;&quot;=&quot;&quot;&gt;Wilson&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;&quot;=&quot;&quot;&gt;&amp;nbsp;(reformer) (1808&ndash;1870), English political activist, known as chairman of the Anti-Cornlaw League.&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;&quot;=&quot;&quot;&gt;George&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;&quot;=&quot;&quot;&gt;&amp;nbsp;A.&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;&quot;=&quot;&quot;&gt;Wilson&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;&quot;=&quot;&quot;&gt;&amp;nbsp;(1884&ndash;1953), United States Senator and Governor of Iowa.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 18px; background-color: rgb(255, 255, 0);&quot;&gt;&lt;font color=&quot;#000000&quot;&gt;Не перестаю удивляться Вашей работе! Все на высоте! Так держите дальше!!!&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/1699178350_user2-160x160.jpg', '2021-08-12 13:12:37', '2023-11-05 14:53:29'),
(5, 'Vasya Pupkin,  CFO of SAMPLE104 INC.', '&lt;p&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;&quot;=&quot;&quot;&gt;Ва́ся&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;&quot;=&quot;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;b style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;&quot;=&quot;&quot;&gt;Пу́пкин&lt;/b&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; ys=&quot;&quot; text&quot;,=&quot;&quot; arial,=&quot;&quot; helvetica,=&quot;&quot; &quot;arial=&quot;&quot; unicode=&quot;&quot; ms&quot;,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 13px;&quot;=&quot;&quot;&gt;&amp;nbsp;&mdash; нарицательное имя-экземплификант, используемое в качестве примера (экземплификации) для обозначения неизвестной, анонимной или произвольной личности.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 18px; background-color: rgb(255, 255, 0);&quot;&gt;&lt;font color=&quot;#000000&quot; style=&quot;&quot;&gt;Желаю успехов! Пухххх!)&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/1699178450_user1-128x128.jpg', '2023-10-29 14:56:50', '2023-11-05 14:53:41');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text,
  `last_login` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `date_added`, `date_updated`) VALUES
(1, 'Денис', 'Хен', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1699191000_1507398.jpg', NULL, '2021-01-20 14:02:37', '2023-11-05 16:30:14');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `chatbot_messages`
--
ALTER TABLE `chatbot_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `chatbot_messages`
--
ALTER TABLE `chatbot_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
